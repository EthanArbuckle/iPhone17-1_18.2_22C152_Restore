@interface _BlastDoorLPImage
+ (BOOL)supportsSecureCoding;
- (BOOL)_shouldEncodeData;
- (BOOL)isEqual:(id)a3;
- (NSData)data;
- (NSString)MIMEType;
- (NSURL)fileURL;
- (_BlastDoorLPImage)init;
- (_BlastDoorLPImage)initWithCoder:(id)a3;
- (_BlastDoorLPImageProperties)properties;
- (id)_initWithImage:(id)a3;
- (id)_initWithImage:(id)a3 properties:(id)a4;
- (unint64_t)_encodedSize;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setMIMEType:(id)a3;
- (void)setProperties:(id)a3;
@end

@implementation _BlastDoorLPImage

- (_BlastDoorLPImage)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)_BlastDoorLPImage;
  return [(_BlastDoorLPImage *)&v3 init];
}

- (id)_initWithImage:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  if (v4
    && (v13.receiver = self,
        v13.super_class = (Class)_BlastDoorLPImage,
        (self = [(_BlastDoorLPImage *)&v13 init]) != 0))
  {
    v5 = (NSData *)[v4[1] copy];
    data = self->_data;
    self->_data = v5;

    v7 = (NSString *)[v4[2] copy];
    MIMEType = self->_MIMEType;
    self->_MIMEType = v7;

    objc_storeStrong((id *)&self->_fileURL, v4[3]);
    v9 = (_BlastDoorLPImageProperties *)[v4[4] copy];
    properties = self->_properties;
    self->_properties = v9;

    self = self;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_initWithImage:(id)a3 properties:(id)a4
{
  id v7 = a4;
  v8 = [(_BlastDoorLPImage *)self _initWithImage:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 4, a4);
    v10 = v9;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_BlastDoorLPImage;
  if ([(_BlastDoorLPImage *)&v12 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v4;
      unint64_t v7 = v6[1];
      if (v7 | (unint64_t)self->_data && !objc_msgSend((id)v7, "isEqual:")
        || (unint64_t v8 = v6[2], v8 | (unint64_t)self->_MIMEType) && !objc_msgSend((id)v8, "isEqual:")
        || (unint64_t v9 = v6[3], v9 | (unint64_t)self->_fileURL) && !objc_msgSend((id)v9, "isEqual:"))
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

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_data hash];
  return [(NSString *)self->_MIMEType hash] ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPImage)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_BlastDoorLPImage;
  char v5 = [(_BlastDoorLPImage *)&v17 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "_bd_lp_strictlyDecodeNSDataForKey:", @"data");
    data = v5->_data;
    v5->_data = (NSData *)v6;

    uint64_t v8 = objc_msgSend(v4, "_bd_lp_strictlyDecodeNSStringForKey:", @"MIMEType");
    MIMEType = v5->_MIMEType;
    v5->_MIMEType = (NSString *)v8;

    unint64_t v10 = objc_alloc_init(_BlastDoorLPImageProperties);
    properties = v5->_properties;
    v5->_properties = v10;

    objc_super v12 = objc_msgSend(v4, "_bd_lp_strictlyDecodeNSStringForKey:", @"accessibilityText");
    [(_BlastDoorLPImageProperties *)v5->_properties setAccessibilityText:v12];

    uint64_t v13 = objc_msgSend(v4, "_bd_lp_strictlyDecodeColorForKey:", @"overlaidTextColor");
    [(_BlastDoorLPImageProperties *)v5->_properties setOverlaidTextColor:v13];

    uint64_t v14 = objc_msgSend(v4, "_bd_lp_strictlyDecodeColorForKey:", @"dominantColor");
    [(_BlastDoorLPImageProperties *)v5->_properties setDominantColor:v14];

    -[_BlastDoorLPImageProperties setType:](v5->_properties, "setType:", [v4 decodeIntegerForKey:@"imageType"]);
    if ([(_BlastDoorLPImageProperties *)v5->_properties type] >= 7) {
      [(_BlastDoorLPImageProperties *)v5->_properties setType:0];
    }
    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  if ([(_BlastDoorLPImage *)self _shouldEncodeData]) {
    objc_msgSend(v7, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_data, @"data");
  }
  objc_msgSend(v7, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_MIMEType, @"MIMEType");
  id v4 = [(_BlastDoorLPImageProperties *)self->_properties accessibilityText];
  objc_msgSend(v7, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, @"accessibilityText");

  char v5 = [(_BlastDoorLPImageProperties *)self->_properties overlaidTextColor];
  objc_msgSend(v7, "_bd_lp_encodeColorIfNotNil:forKey:", v5, @"overlaidTextColor");

  uint64_t v6 = [(_BlastDoorLPImageProperties *)self->_properties dominantColor];
  objc_msgSend(v7, "_bd_lp_encodeColorIfNotNil:forKey:", v6, @"dominantColor");

  objc_msgSend(v7, "encodeInteger:forKey:", -[_BlastDoorLPImageProperties type](self->_properties, "type"), @"imageType");
}

- (_BlastDoorLPImageProperties)properties
{
  v2 = (void *)[(_BlastDoorLPImageProperties *)self->_properties copy];
  return (_BlastDoorLPImageProperties *)v2;
}

- (unint64_t)_encodedSize
{
  v2 = [(_BlastDoorLPImage *)self data];
  unint64_t v3 = [v2 length];

  return v3;
}

- (BOOL)_shouldEncodeData
{
  return 1;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
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
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end