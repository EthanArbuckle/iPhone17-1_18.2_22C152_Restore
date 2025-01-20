@interface HKSignedClinicalDataFile
+ (BOOL)supportsSecureCoding;
+ (id)signedClinicalDataFileWithURL:(id)a3 sourceURL:(id)a4 receivedDate:(id)a5 countryOfOrigin:(id)a6 error:(id *)a7;
- (BOOL)isEqual:(id)a3;
- (HKSignedClinicalDataFile)init;
- (HKSignedClinicalDataFile)initWithCoder:(id)a3;
- (HKSignedClinicalDataFile)initWithFileURL:(id)a3 fileHandle:(id)a4 sourceURL:(id)a5 receivedDate:(id)a6 metadata:(id)a7;
- (NSDate)receivedDate;
- (NSDictionary)metadata;
- (NSFileHandle)fileHandle;
- (NSURL)fileURL;
- (NSURL)sourceURL;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSignedClinicalDataFile

- (HKSignedClinicalDataFile)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKSignedClinicalDataFile)initWithFileURL:(id)a3 fileHandle:(id)a4 sourceURL:(id)a5 receivedDate:(id)a6 metadata:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HKSignedClinicalDataFile;
  v17 = [(HKSignedClinicalDataFile *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    fileURL = v17->_fileURL;
    v17->_fileURL = (NSURL *)v18;

    uint64_t v20 = [v13 copy];
    fileHandle = v17->_fileHandle;
    v17->_fileHandle = (NSFileHandle *)v20;

    uint64_t v22 = [v14 copy];
    sourceURL = v17->_sourceURL;
    v17->_sourceURL = (NSURL *)v22;

    uint64_t v24 = [v15 copy];
    receivedDate = v17->_receivedDate;
    v17->_receivedDate = (NSDate *)v24;

    uint64_t v26 = [v16 copy];
    metadata = v17->_metadata;
    v17->_metadata = (NSDictionary *)v26;
  }
  return v17;
}

+ (id)signedClinicalDataFileWithURL:(id)a3 sourceURL:(id)a4 receivedDate:(id)a5 countryOfOrigin:(id)a6 error:(id *)a7
{
  v24[2] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:v12 error:a7];
  if (v16)
  {
    v23[0] = @"Filename";
    uint64_t v17 = [v12 lastPathComponent];
    uint64_t v18 = (void *)v17;
    v23[1] = @"CountryOfOrigin";
    id v19 = (id)*MEMORY[0x263F094D0];
    if (v15) {
      id v19 = v15;
    }
    v24[0] = v17;
    v24[1] = v19;
    uint64_t v20 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];

    v21 = (void *)[objc_alloc((Class)a1) initWithFileURL:v12 fileHandle:v16 sourceURL:v13 receivedDate:v14 metadata:v20];
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  fileURL = self->_fileURL;
  id v5 = a3;
  [v5 encodeObject:fileURL forKey:@"FileURL"];
  [v5 encodeObject:self->_fileHandle forKey:@"FileHandle"];
  [v5 encodeObject:self->_sourceURL forKey:@"SourceURL"];
  [v5 encodeObject:self->_receivedDate forKey:@"ReceivedDate"];
  [v5 encodeObject:self->_metadata forKey:@"Metadata"];
}

- (HKSignedClinicalDataFile)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FileURL"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FileHandle"];
    if (v6)
    {
      v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SourceURL"];
      v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReceivedDate"];
      if (v8)
      {
        v9 = objc_msgSend(NSDictionary, "hk_secureCodingClasses");
        v10 = [v4 decodeObjectOfClasses:v9 forKey:@"Metadata"];

        if (v10)
        {
          self = [(HKSignedClinicalDataFile *)self initWithFileURL:v5 fileHandle:v6 sourceURL:v7 receivedDate:v8 metadata:v10];
          v11 = self;
        }
        else
        {
          objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
          v11 = 0;
        }
      }
      else
      {
        objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
        v11 = 0;
      }
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      v11 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HKSignedClinicalDataFile *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v14 = 0;
LABEL_40:

      goto LABEL_41;
    }
    fileURL = self->_fileURL;
    v10 = [(HKSignedClinicalDataFile *)v8 fileURL];
    if (fileURL != v10)
    {
      uint64_t v11 = [(HKSignedClinicalDataFile *)v8 fileURL];
      if (!v11)
      {
        char v14 = 0;
        goto LABEL_39;
      }
      v3 = (void *)v11;
      id v12 = self->_fileURL;
      id v13 = [(HKSignedClinicalDataFile *)v8 fileURL];
      if (![(NSURL *)v12 isEqual:v13])
      {
        char v14 = 0;
LABEL_38:

        goto LABEL_39;
      }
      v43 = v13;
    }
    sourceURL = self->_sourceURL;
    id v16 = [(HKSignedClinicalDataFile *)v8 sourceURL];
    if (sourceURL == v16)
    {
      v42 = sourceURL;
    }
    else
    {
      uint64_t v17 = [(HKSignedClinicalDataFile *)v8 sourceURL];
      if (!v17)
      {
        char v14 = 0;
        goto LABEL_36;
      }
      uint64_t v18 = (void *)v17;
      v42 = sourceURL;
      id v19 = self->_sourceURL;
      id v4 = [(HKSignedClinicalDataFile *)v8 sourceURL];
      if (([(NSURL *)v19 isEqual:v4] & 1) == 0)
      {

        char v14 = 0;
        goto LABEL_37;
      }
      v38 = v18;
    }
    receivedDate = self->_receivedDate;
    v21 = [(HKSignedClinicalDataFile *)v8 receivedDate];
    v41 = v4;
    if (receivedDate == v21)
    {
      v39 = v3;
      v40 = receivedDate;
    }
    else
    {
      uint64_t v22 = [(HKSignedClinicalDataFile *)v8 receivedDate];
      if (!v22)
      {
        char v14 = 0;
LABEL_33:

LABEL_34:
        if (v42 != v16)
        {
LABEL_35:
        }
LABEL_36:

LABEL_37:
        id v13 = v43;
        if (fileURL != v10) {
          goto LABEL_38;
        }
LABEL_39:

        goto LABEL_40;
      }
      v40 = receivedDate;
      v37 = (void *)v22;
      v23 = self->_receivedDate;
      uint64_t v24 = [(HKSignedClinicalDataFile *)v8 receivedDate];
      v25 = v23;
      uint64_t v26 = (void *)v24;
      if (([(NSDate *)v25 isEqual:v24] & 1) == 0)
      {

        char v14 = 0;
        goto LABEL_34;
      }
      v35 = v26;
      v39 = v3;
    }
    metadata = self->_metadata;
    uint64_t v28 = [(HKSignedClinicalDataFile *)v8 metadata];
    char v14 = metadata == (NSDictionary *)v28;
    if (metadata == (NSDictionary *)v28)
    {
    }
    else
    {
      objc_super v29 = (void *)v28;
      uint64_t v30 = [(HKSignedClinicalDataFile *)v8 metadata];
      if (v30)
      {
        v31 = (void *)v30;
        v32 = self->_metadata;
        v33 = [(HKSignedClinicalDataFile *)v8 metadata];
        char v14 = [(NSDictionary *)v32 isEqual:v33];

        if (v40 == v21)
        {

LABEL_44:
          v3 = v39;
          if (v42 == v16) {
            goto LABEL_36;
          }
          goto LABEL_35;
        }

LABEL_42:
        goto LABEL_44;
      }
    }
    if (v40 == v21) {
      goto LABEL_42;
    }

    v3 = v39;
    goto LABEL_33;
  }
  char v14 = 1;
LABEL_41:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_fileURL hash];
  uint64_t v4 = [(NSURL *)self->_sourceURL hash] ^ v3;
  uint64_t v5 = [(NSDate *)self->_receivedDate hash];
  return v4 ^ v5 ^ [(NSDictionary *)self->_metadata hash];
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (NSDate)receivedDate
{
  return self->_receivedDate;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_receivedDate, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end