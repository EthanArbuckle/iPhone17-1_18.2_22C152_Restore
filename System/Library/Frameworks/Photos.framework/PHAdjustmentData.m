@interface PHAdjustmentData
+ (BOOL)supportsSecureCoding;
+ (id)opaqueAdjustmentData;
+ (int64_t)adjustmentBaseVersionFromImageRequestVersion:(int64_t)a3;
+ (int64_t)adjustmentBaseVersionFromVideoRequestVersion:(int64_t)a3;
+ (int64_t)imageRequestVersionFromAdjustmentBaseVersion:(int64_t)a3;
+ (int64_t)videoRequestVersionFromAdjustmentBaseVersion:(int64_t)a3;
- (BOOL)_contentEditing_containsValidAdjustment;
- (BOOL)_contentEditing_readableByClientWithVerificationBlock:(id)a3;
- (BOOL)_hasAdjustments;
- (BOOL)isOpaque;
- (NSData)data;
- (NSDate)adjustmentTimestamp;
- (NSString)editorBundleID;
- (NSString)formatIdentifier;
- (NSString)formatVersion;
- (PHAdjustmentData)initWithCoder:(id)a3;
- (PHAdjustmentData)initWithDataUsingAssetResourceEncoding:(id)a3 error:(id *)a4;
- (PHAdjustmentData)initWithFormatIdentifier:(NSString *)formatIdentifier formatVersion:(NSString *)formatVersion data:(NSData *)data;
- (PHAdjustmentData)initWithFormatIdentifier:(id)a3 formatVersion:(id)a4 adjustmentRenderType:(id)a5 data:(id)a6;
- (id)dataUsingAssetResourceEncoding:(id *)a3;
- (id)description;
- (int64_t)_contentEditing_requiredBaseVersionReadableByClient:(BOOL *)a3 verificationBlock:(id)a4;
- (int64_t)baseVersion;
- (unsigned)adjustmentRenderTypes;
- (void)encodeWithCoder:(id)a3;
- (void)setAdjustmentRenderTypes:(unsigned int)a3;
- (void)setAdjustmentTimestamp:(id)a3;
- (void)setBaseVersion:(int64_t)a3;
- (void)setEditorBundleID:(id)a3;
- (void)setFormatIdentifier:(id)a3;
- (void)setFormatVersion:(id)a3;
@end

@implementation PHAdjustmentData

- (BOOL)_hasAdjustments
{
  v3 = [(PHAdjustmentData *)self formatIdentifier];

  if (!v3) {
    return 0;
  }
  v4 = [(PHAdjustmentData *)self data];
  BOOL v5 = [v4 length] != 0;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorBundleID, 0);
  objc_storeStrong((id *)&self->_adjustmentTimestamp, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_formatVersion, 0);

  objc_storeStrong((id *)&self->_formatIdentifier, 0);
}

- (void)setAdjustmentRenderTypes:(unsigned int)a3
{
  self->_adjustmentRenderTypes = a3;
}

- (unsigned)adjustmentRenderTypes
{
  return self->_adjustmentRenderTypes;
}

- (void)setBaseVersion:(int64_t)a3
{
  self->_baseVersion = a3;
}

- (int64_t)baseVersion
{
  return self->_baseVersion;
}

- (void)setEditorBundleID:(id)a3
{
}

- (NSString)editorBundleID
{
  return self->_editorBundleID;
}

- (void)setAdjustmentTimestamp:(id)a3
{
}

- (NSDate)adjustmentTimestamp
{
  return self->_adjustmentTimestamp;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFormatVersion:(id)a3
{
}

- (NSString)formatVersion
{
  return self->_formatVersion;
}

- (void)setFormatIdentifier:(id)a3
{
}

- (NSString)formatIdentifier
{
  return self->_formatIdentifier;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)PHAdjustmentData;
  v3 = [(PHAdjustmentData *)&v11 description];
  v4 = [(PHAdjustmentData *)self formatIdentifier];
  BOOL v5 = [(PHAdjustmentData *)self formatVersion];
  uint64_t v6 = [(PHAdjustmentData *)self adjustmentRenderTypes];
  v7 = [(PHAdjustmentData *)self data];
  v8 = [(PHAdjustmentData *)self data];
  v9 = [v3 stringByAppendingFormat:@" identifier=%@ version=%@ renderType=%u data=%p (%lu)", v4, v5, v6, v7, objc_msgSend(v8, "length")];

  return v9;
}

- (id)dataUsingAssetResourceEncoding:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = [(PHAdjustmentData *)self formatIdentifier];
  [v5 setObject:v6 forKey:*MEMORY[0x1E4F8BA68]];

  v7 = [(PHAdjustmentData *)self formatVersion];
  [v5 setObject:v7 forKey:*MEMORY[0x1E4F8BA70]];

  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHAdjustmentData baseVersion](self, "baseVersion"));
  [v5 setObject:v8 forKey:*MEMORY[0x1E4F8BA50]];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PHAdjustmentData adjustmentRenderTypes](self, "adjustmentRenderTypes"));
  [v5 setObject:v9 forKey:*MEMORY[0x1E4F8BA78]];

  v10 = [(PHAdjustmentData *)self editorBundleID];

  if (v10)
  {
    objc_super v11 = [(PHAdjustmentData *)self editorBundleID];
    [v5 setObject:v11 forKey:*MEMORY[0x1E4F8BA60]];
  }
  v12 = [(PHAdjustmentData *)self adjustmentTimestamp];

  if (v12)
  {
    v13 = [(PHAdjustmentData *)self adjustmentTimestamp];
    [v5 setObject:v13 forKey:*MEMORY[0x1E4F8BA80]];
  }
  v14 = [(PHAdjustmentData *)self data];

  if (v14)
  {
    v15 = [(PHAdjustmentData *)self data];
    [v5 setObject:v15 forKey:*MEMORY[0x1E4F8BA58]];
  }
  id v20 = 0;
  v16 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:100 options:0 error:&v20];
  id v17 = v20;
  v18 = v17;
  if (!v16 && a3) {
    *a3 = v17;
  }

  return v16;
}

- (PHAdjustmentData)initWithDataUsingAssetResourceEncoding:(id)a3 error:(id *)a4
{
  id v19 = 0;
  uint64_t v6 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:&v19];
  id v7 = v19;
  v8 = v7;
  if (v6)
  {
    v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8BA68]];
    v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8BA70]];
    objc_super v11 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8BA78]];
    v12 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8BA58]];
    v13 = [(PHAdjustmentData *)self initWithFormatIdentifier:v9 formatVersion:v10 adjustmentRenderType:v11 data:v12];

    if (v13)
    {
      v14 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8BA60]];
      [(PHAdjustmentData *)v13 setEditorBundleID:v14];

      v15 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8BA50]];
      -[PHAdjustmentData setBaseVersion:](v13, "setBaseVersion:", [v15 integerValue]);

      id v16 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8BA80]];
      [(PHAdjustmentData *)v13 setAdjustmentTimestamp:v16];
    }
    else
    {
      id v17 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, 0);
      id v16 = v17;
      if (a4)
      {
        id v16 = v17;
        *a4 = v16;
      }
    }

    self = v9;
  }
  else
  {
    v13 = 0;
    if (a4) {
      *a4 = v7;
    }
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  formatIdentifier = self->_formatIdentifier;
  id v5 = a3;
  [v5 encodeObject:formatIdentifier forKey:@"formatIdentifier"];
  [v5 encodeObject:self->_formatVersion forKey:@"formatVersion"];
  [v5 encodeObject:self->_data forKey:@"data"];
  [v5 encodeInteger:self->_baseVersion forKey:@"baseVersion"];
  [v5 encodeInteger:self->_adjustmentRenderTypes forKey:@"adjustmentRenderTypes"];
  [v5 encodeObject:self->_editorBundleID forKey:@"editorBundleID"];
  [v5 encodeObject:self->_adjustmentTimestamp forKey:@"adjustmentTimestamp"];
}

- (PHAdjustmentData)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PHAdjustmentData;
  id v5 = [(PHAdjustmentData *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"formatIdentifier"];
    formatIdentifier = v5->_formatIdentifier;
    v5->_formatIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"formatVersion"];
    formatVersion = v5->_formatVersion;
    v5->_formatVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSData *)v10;

    v5->_baseVersion = [v4 decodeIntegerForKey:@"baseVersion"];
    v5->_adjustmentRenderTypes = [v4 decodeIntegerForKey:@"adjustmentRenderTypes"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"editorBundleID"];
    editorBundleID = v5->_editorBundleID;
    v5->_editorBundleID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"adjustmentTimestamp"];
    adjustmentTimestamp = v5->_adjustmentTimestamp;
    v5->_adjustmentTimestamp = (NSDate *)v14;
  }
  return v5;
}

- (BOOL)isOpaque
{
  v2 = [(PHAdjustmentData *)self formatIdentifier];
  char v3 = [v2 isEqualToString:PHAdjustmentDataOpaqueFormatIdentifier];

  return v3;
}

- (PHAdjustmentData)initWithFormatIdentifier:(id)a3 formatVersion:(id)a4 adjustmentRenderType:(id)a5 data:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PHAdjustmentData;
  uint64_t v14 = [(PHAdjustmentData *)&v23 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    formatIdentifier = v14->_formatIdentifier;
    v14->_formatIdentifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    formatVersion = v14->_formatVersion;
    v14->_formatVersion = (NSString *)v17;

    objc_storeStrong((id *)&v14->_data, a6);
    v14->_baseVersion = 0;
    if (v12) {
      unsigned int v19 = [v12 unsignedIntegerValue];
    }
    else {
      unsigned int v19 = 0;
    }
    v14->_adjustmentRenderTypes = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
    adjustmentTimestamp = v14->_adjustmentTimestamp;
    v14->_adjustmentTimestamp = (NSDate *)v20;
  }
  return v14;
}

- (PHAdjustmentData)initWithFormatIdentifier:(NSString *)formatIdentifier formatVersion:(NSString *)formatVersion data:(NSData *)data
{
  return [(PHAdjustmentData *)self initWithFormatIdentifier:formatIdentifier formatVersion:formatVersion adjustmentRenderType:&unk_1EEB25A10 data:data];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)adjustmentBaseVersionFromVideoRequestVersion:(int64_t)a3
{
  if (a3) {
    return a3 == 8;
  }
  else {
    return 2;
  }
}

+ (int64_t)videoRequestVersionFromAdjustmentBaseVersion:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 1;
  }
  else {
    return qword_19B2CCB70[a3];
  }
}

+ (int64_t)adjustmentBaseVersionFromImageRequestVersion:(int64_t)a3
{
  if (a3) {
    return a3 == 8;
  }
  else {
    return 2;
  }
}

+ (int64_t)imageRequestVersionFromAdjustmentBaseVersion:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 1;
  }
  else {
    return qword_19B2CCB70[a3];
  }
}

+ (id)opaqueAdjustmentData
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28DB0];
  char v3 = [MEMORY[0x1E4F1C9C8] date];
  id v10 = 0;
  id v4 = [v2 archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v10];
  id v5 = v10;

  if (v4)
  {
    uint64_t v6 = [PHAdjustmentData alloc];
    id v7 = [(PHAdjustmentData *)v6 initWithFormatIdentifier:PHAdjustmentDataOpaqueFormatIdentifier formatVersion:@"1.0" data:v4];
  }
  else
  {
    uint64_t v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEFAULT, "Failed to archive date (now), error: %@", buf, 0xCu);
    }

    id v7 = 0;
  }

  return v7;
}

- (int64_t)_contentEditing_requiredBaseVersionReadableByClient:(BOOL *)a3 verificationBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(PHAdjustmentData *)self _contentEditing_containsValidAdjustment])
  {
    BOOL v7 = [(PHAdjustmentData *)self _contentEditing_readableByClientWithVerificationBlock:v6];
    uint64_t v8 = (void *)MEMORY[0x1E4F8CE18];
    v9 = [(PHAdjustmentData *)self formatIdentifier];
    id v10 = [(PHAdjustmentData *)self formatVersion];
    int v11 = [v8 isRecognizedSlowMotionFormatWithIdentifier:v9 version:v10];

    if (v11) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = 2;
    }
    if ((v11 & 1) == 0 && v7) {
      int64_t v12 = [(PHAdjustmentData *)self baseVersion] != 0;
    }
    if (a3) {
      *a3 = v7;
    }
  }
  else
  {
    uint64_t v13 = PLImageManagerGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [(PHAdjustmentData *)self formatIdentifier];
      uint64_t v15 = [(PHAdjustmentData *)self data];
      int v17 = 138412546;
      v18 = v14;
      __int16 v19 = 2048;
      uint64_t v20 = [v15 length];
      _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_ERROR, "[RM] Inavlid adjustment data, format ID: %@, data length :%lu", (uint8_t *)&v17, 0x16u);
    }
    int64_t v12 = 0;
  }

  return v12;
}

- (BOOL)_contentEditing_readableByClientWithVerificationBlock:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (uint64_t (**)(id, PHAdjustmentData *))a3;
  if ([(PHAdjustmentData *)self isOpaque])
  {
    id v5 = PLImageManagerGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10) = 0;
      id v6 = "[RM] Checking adjustment data - is opaque";
LABEL_11:
      _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v10, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (!v4)
  {
    id v5 = PLImageManagerGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10) = 0;
      id v6 = "[RM] Checking adjustment data - client did not provide verification block";
      goto LABEL_11;
    }
LABEL_12:
    LOBYTE(v7) = 0;
    goto LABEL_13;
  }
  int v7 = v4[2](v4, self);
  id v5 = PLImageManagerGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = @"N";
    if (v7) {
      uint64_t v8 = @"Y";
    }
    int v10 = 138412290;
    int v11 = v8;
    _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, "[RM] Checking adjustment data - client can handle current adjustments: %@", (uint8_t *)&v10, 0xCu);
  }
LABEL_13:

  return v7;
}

- (BOOL)_contentEditing_containsValidAdjustment
{
  char v3 = [(PHAdjustmentData *)self formatIdentifier];
  if (v3)
  {
    id v4 = [(PHAdjustmentData *)self data];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

@end