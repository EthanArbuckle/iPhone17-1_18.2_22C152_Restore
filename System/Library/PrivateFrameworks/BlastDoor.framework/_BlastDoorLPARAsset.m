@interface _BlastDoorLPARAsset
+ (BOOL)supportsSecureCoding;
- (BOOL)_shouldEncodeData;
- (BOOL)isEqual:(id)a3;
- (NSData)data;
- (NSString)MIMEType;
- (NSURL)fileURL;
- (_BlastDoorLPARAsset)init;
- (_BlastDoorLPARAsset)initWithCoder:(id)a3;
- (_BlastDoorLPARAssetProperties)properties;
- (id)_initWithARAsset:(id)a3;
- (unint64_t)_encodedSize;
- (void)encodeWithCoder:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setMIMEType:(id)a3;
- (void)setProperties:(id)a3;
@end

@implementation _BlastDoorLPARAsset

- (_BlastDoorLPARAsset)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)_BlastDoorLPARAsset;
  return [(_BlastDoorLPARAsset *)&v3 init];
}

- (id)_initWithARAsset:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  v9.receiver = self;
  v9.super_class = (Class)_BlastDoorLPARAsset;
  v5 = [(_BlastDoorLPARAsset *)&v9 init];
  p_isa = (id *)&v5->super.isa;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_data, v4[1]);
    objc_storeStrong(p_isa + 2, v4[2]);
    objc_storeStrong(p_isa + 5, v4[5]);
    objc_storeStrong(p_isa + 4, v4[4]);
    v7 = p_isa;
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)_encodedSize
{
  return [(NSData *)self->_data length];
}

- (_BlastDoorLPARAssetProperties)properties
{
  v2 = (void *)[(_BlastDoorLPARAssetProperties *)self->_properties copy];
  return (_BlastDoorLPARAssetProperties *)v2;
}

- (BOOL)_shouldEncodeData
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if ([(_BlastDoorLPARAsset *)self _shouldEncodeData])
  {
    uint64_t v4 = [(_BlastDoorLPARAsset *)self data];
    objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, @"data");
  }
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_MIMEType, @"MIMEType");
  v5 = [(_BlastDoorLPARAssetProperties *)self->_properties accessibilityText];
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v5, @"accessibilityText");
}

- (_BlastDoorLPARAsset)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_BlastDoorLPARAsset;
  v5 = [(_BlastDoorLPARAsset *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "_bd_lp_strictlyDecodeNSDataForKey:", @"data");
    data = v5->_data;
    v5->_data = (NSData *)v6;

    uint64_t v8 = objc_msgSend(v4, "_bd_lp_strictlyDecodeNSStringForKey:", @"MIMEType");
    MIMEType = v5->_MIMEType;
    v5->_MIMEType = (NSString *)v8;

    uint64_t v10 = objc_alloc_init(_BlastDoorLPARAssetProperties);
    properties = v5->_properties;
    v5->_properties = v10;

    v12 = objc_msgSend(v4, "_bd_lp_strictlyDecodeNSStringForKey:", @"accessibilityText");
    [(_BlastDoorLPARAssetProperties *)v5->_properties setAccessibilityText:v12];

    v13 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_BlastDoorLPARAsset;
  if ([(_BlastDoorLPARAsset *)&v12 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v4;
      unint64_t v7 = v6[1];
      if (v7 | (unint64_t)self->_data && !objc_msgSend((id)v7, "isEqual:")
        || (unint64_t v8 = v6[2], v8 | (unint64_t)self->_MIMEType) && !objc_msgSend((id)v8, "isEqual:")
        || (unint64_t v9 = v6[5], v9 | (unint64_t)self->_fileURL) && !objc_msgSend((id)v9, "isEqual:"))
      {
        char v5 = 0;
      }
      else
      {
        unint64_t v10 = v6[4];
        if (v10 | (unint64_t)self->_properties) {
          char v5 = objc_msgSend((id)v10, "isEqual:");
        }
        else {
          char v5 = 1;
        }
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (NSData)data
{
  return self->_data;
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (void)setMIMEType:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (void)setProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_temporaryFileURL, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end