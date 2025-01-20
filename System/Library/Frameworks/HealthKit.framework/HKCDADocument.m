@interface HKCDADocument
- (BOOL)_compressDocumentDataForTransfer:(id *)a3;
- (BOOL)_decompressDocumentDataForDelivery:(id *)a3;
- (HKCDADocument)initWithCoder:(id)a3 omittedContentFlags:(int64_t)a4;
- (HKCDADocument)initWithDocumentData:(id)a3 compressedDocumentData:(id)a4 title:(id)a5 patientName:(id)a6 authorName:(id)a7 custodianName:(id)a8;
- (NSData)documentData;
- (NSString)authorName;
- (NSString)custodianName;
- (NSString)patientName;
- (NSString)title;
- (id)_compressedDocumentData;
- (id)_descriptionFieldTitle:(id)a3 content:(id)a4 maxSize:(unint64_t)a5;
- (id)_validateConfiguration;
- (id)description;
- (void)encodeWithCoder:(id)a3 omittedContentFlags:(int64_t)a4;
@end

@implementation HKCDADocument

- (HKCDADocument)initWithDocumentData:(id)a3 compressedDocumentData:(id)a4 title:(id)a5 patientName:(id)a6 authorName:(id)a7 custodianName:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HKCDADocument;
  v18 = [(HKCDADocument *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_internalDocumentData, a3);
    objc_storeStrong((id *)&v19->_compressedDocumentData, a4);
    v19->_compressionLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v19->_title, a5);
    objc_storeStrong((id *)&v19->_patientName, a6);
    objc_storeStrong((id *)&v19->_authorName, a7);
    objc_storeStrong((id *)&v19->_custodianName, a8);
  }

  return v19;
}

- (HKCDADocument)initWithCoder:(id)a3 omittedContentFlags:(int64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HKCDADocument;
  v7 = [(HKCDADocument *)&v22 init];
  v8 = v7;
  if (v7)
  {
    internalDocumentData = v7->_internalDocumentData;
    v7->_internalDocumentData = 0;

    if ((v4 & 2) != 0)
    {
      compressedDocumentData = v8->_compressedDocumentData;
      v8->_compressedDocumentData = 0;
    }
    else
    {
      uint64_t v10 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"compressedDocumentData"];
      compressedDocumentData = v8->_compressedDocumentData;
      v8->_compressedDocumentData = (NSData *)v10;
    }

    v8->_compressionLock._os_unfair_lock_opaque = 0;
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [v6 decodeObjectOfClass:v12 forKey:@"title"];
    title = v8->_title;
    v8->_title = (NSString *)v13;

    uint64_t v15 = [v6 decodeObjectOfClass:v12 forKey:@"patient_name"];
    patientName = v8->_patientName;
    v8->_patientName = (NSString *)v15;

    uint64_t v17 = [v6 decodeObjectOfClass:v12 forKey:@"author_name"];
    authorName = v8->_authorName;
    v8->_authorName = (NSString *)v17;

    uint64_t v19 = [v6 decodeObjectOfClass:v12 forKey:@"custodian_name"];
    custodianName = v8->_custodianName;
    v8->_custodianName = (NSString *)v19;
  }
  return v8;
}

- (NSData)documentData
{
  return self->_internalDocumentData;
}

- (id)_compressedDocumentData
{
  return self->_compressedDocumentData;
}

- (id)_validateConfiguration
{
  p_compressionLock = &self->_compressionLock;
  os_unfair_lock_lock(&self->_compressionLock);
  if (self->_internalDocumentData)
  {
    os_unfair_lock_unlock(p_compressionLock);
LABEL_4:
    id v6 = 0;
    goto LABEL_5;
  }
  compressedDocumentData = self->_compressedDocumentData;
  os_unfair_lock_unlock(p_compressionLock);
  if (compressedDocumentData) {
    goto LABEL_4;
  }
  id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"CDA document data must not be nil"");
LABEL_5:

  return v6;
}

- (BOOL)_compressDocumentDataForTransfer:(id *)a3
{
  p_compressionLock = &self->_compressionLock;
  os_unfair_lock_lock(&self->_compressionLock);
  if (self->_compressedDocumentData) {
    goto LABEL_2;
  }
  internalDocumentData = self->_internalDocumentData;
  if (!internalDocumentData)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Incorrect state of compression data for HKCDADocumentSample");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10) {
      goto LABEL_11;
    }
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  v8 = +[_HKCompressionEngine processDataWithFunction:0 algorithm:3 content:internalDocumentData progressBlock:0];
  compressedDocumentData = self->_compressedDocumentData;
  self->_compressedDocumentData = v8;

  if (!self->_compressedDocumentData)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Failed to compress HKCDADocumentSample data");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
LABEL_11:

      BOOL v6 = 0;
      goto LABEL_12;
    }
    if (!a3)
    {
LABEL_7:
      _HKLogDroppedError(v10);
      goto LABEL_11;
    }
LABEL_10:
    id v10 = v10;
    *a3 = v10;
    goto LABEL_11;
  }
LABEL_2:
  BOOL v6 = 1;
LABEL_12:
  os_unfair_lock_unlock(p_compressionLock);
  return v6;
}

- (BOOL)_decompressDocumentDataForDelivery:(id *)a3
{
  p_compressionLock = &self->_compressionLock;
  os_unfair_lock_lock(&self->_compressionLock);
  if (!self->_internalDocumentData)
  {
    compressedDocumentData = self->_compressedDocumentData;
    if (compressedDocumentData)
    {
      v8 = +[_HKCompressionEngine processDataWithFunction:1 algorithm:3 content:compressedDocumentData progressBlock:0];
      internalDocumentData = self->_internalDocumentData;
      self->_internalDocumentData = v8;

      if (self->_internalDocumentData)
      {
        id v10 = self->_compressedDocumentData;
        self->_compressedDocumentData = 0;
        BOOL v6 = 1;
LABEL_13:

        goto LABEL_14;
      }
      v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = @"Failed to decompress HKCDADocumentSample data";
    }
    else
    {
      v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = @"Incorrect state of decompression data for HKCDADocumentSample";
    }
    objc_msgSend(v11, "hk_error:format:", 100, v12);
    uint64_t v13 = (NSData *)(id)objc_claimAutoreleasedReturnValue();
    id v10 = v13;
    if (v13)
    {
      if (a3) {
        *a3 = v13;
      }
      else {
        _HKLogDroppedError(v13);
      }
    }

    BOOL v6 = 0;
    goto LABEL_13;
  }
  BOOL v6 = 1;
LABEL_14:
  os_unfair_lock_unlock(p_compressionLock);
  return v6;
}

- (void)encodeWithCoder:(id)a3 omittedContentFlags:(int64_t)a4
{
  char v4 = a4;
  id v7 = a3;
  id v9 = v7;
  if ((v4 & 2) == 0)
  {
    os_unfair_lock_lock(&self->_compressionLock);
    if (!self->_compressedDocumentData)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"HKCDADocumentSample.m" lineNumber:564 description:@"HKCDADocumentSample object does not have compressed data for transfer."];
    }
    objc_msgSend(v9, "encodeObject:forKey:");
    os_unfair_lock_unlock(&self->_compressionLock);
    id v7 = v9;
  }
  [v7 encodeObject:self->_title forKey:@"title"];
  [v9 encodeObject:self->_patientName forKey:@"patient_name"];
  [v9 encodeObject:self->_authorName forKey:@"author_name"];
  [v9 encodeObject:self->_custodianName forKey:@"custodian_name"];
}

- (id)_descriptionFieldTitle:(id)a3 content:(id)a4 maxSize:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = [v8 length];
  unint64_t v10 = v9 - a5;
  if (v9 <= a5)
  {
    uint64_t v12 = [NSString stringWithFormat:@"%@=\"%@\"", v7, v8];
  }
  else
  {
    uint64_t v11 = [v8 substringToIndex:a5];

    uint64_t v12 = [NSString stringWithFormat:@"%@=\"%@...(%ld more)\"", v7, v11, v10];
    id v8 = (id)v11;
  }

  return v12;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  os_unfair_lock_lock(&self->_compressionLock);
  if (self->_internalDocumentData)
  {
    char v4 = (void *)[[NSString alloc] initWithData:self->_internalDocumentData encoding:4];
    v5 = @"documentData";
    BOOL v6 = self;
    id v7 = v4;
    uint64_t v8 = 40;
  }
  else
  {
    compressedDocumentData = self->_compressedDocumentData;
    if (!compressedDocumentData) {
      goto LABEL_6;
    }
    char v4 = objc_msgSend(NSString, "stringWithFormat:", @"(%ld bytes)", -[NSData length](compressedDocumentData, "length"));
    v5 = @"compressedDocumentData";
    BOOL v6 = self;
    id v7 = v4;
    uint64_t v8 = 50;
  }
  unint64_t v10 = [(HKCDADocument *)v6 _descriptionFieldTitle:v5 content:v7 maxSize:v8];
  [v3 addObject:v10];

LABEL_6:
  os_unfair_lock_unlock(&self->_compressionLock);
  uint64_t v11 = [(HKCDADocument *)self _descriptionFieldTitle:@"title" content:self->_title maxSize:25];
  [v3 addObject:v11];

  uint64_t v12 = [(HKCDADocument *)self _descriptionFieldTitle:@"patientName" content:self->_patientName maxSize:25];
  [v3 addObject:v12];

  uint64_t v13 = [(HKCDADocument *)self _descriptionFieldTitle:@"authorName" content:self->_authorName maxSize:25];
  [v3 addObject:v13];

  v14 = [(HKCDADocument *)self _descriptionFieldTitle:@"custodianName" content:self->_custodianName maxSize:25];
  [v3 addObject:v14];

  uint64_t v15 = [v3 componentsJoinedByString:@" "];

  return v15;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)patientName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)authorName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)custodianName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_custodianName, 0);
  objc_storeStrong((id *)&self->_authorName, 0);
  objc_storeStrong((id *)&self->_patientName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_compressedDocumentData, 0);

  objc_storeStrong((id *)&self->_internalDocumentData, 0);
}

@end