@interface _BlastDoorLPAudio
+ (BOOL)supportsSecureCoding;
- (BOOL)_shouldEncodeData;
- (BOOL)isEqual:(id)a3;
- (NSData)data;
- (NSString)MIMEType;
- (NSURL)streamingURL;
- (_BlastDoorLPAudio)init;
- (_BlastDoorLPAudio)initWithCoder:(id)a3;
- (_BlastDoorLPAudioProperties)properties;
- (id)_initWithAudio:(id)a3;
- (unint64_t)_encodedSize;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setMIMEType:(id)a3;
- (void)setProperties:(id)a3;
- (void)setStreamingURL:(id)a3;
@end

@implementation _BlastDoorLPAudio

- (_BlastDoorLPAudio)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)_BlastDoorLPAudio;
  return [(_BlastDoorLPAudio *)&v3 init];
}

- (id)_initWithAudio:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  v15.receiver = self;
  v15.super_class = (Class)_BlastDoorLPAudio;
  v5 = [(_BlastDoorLPAudio *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_streamingURL, v4[3]);
    uint64_t v7 = [v4[1] copy];
    data = v6->_data;
    v6->_data = (NSData *)v7;

    uint64_t v9 = [v4[2] copy];
    MIMEType = v6->_MIMEType;
    v6->_MIMEType = (NSString *)v9;

    uint64_t v11 = [v4[4] copy];
    properties = v6->_properties;
    v6->_properties = (_BlastDoorLPAudioProperties *)v11;

    v13 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPAudio)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_BlastDoorLPAudio;
  v5 = [(_BlastDoorLPAudio *)&v17 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"streamingURL");
    streamingURL = v5->_streamingURL;
    v5->_streamingURL = (NSURL *)v6;

    uint64_t v8 = objc_msgSend(v4, "_bd_lp_strictlyDecodeNSDataForKey:", @"data");
    data = v5->_data;
    v5->_data = (NSData *)v8;

    uint64_t v10 = objc_msgSend(v4, "_bd_lp_strictlyDecodeNSStringForKey:", @"MIMEType");
    MIMEType = v5->_MIMEType;
    v5->_MIMEType = (NSString *)v10;

    v12 = objc_alloc_init(_BlastDoorLPAudioProperties);
    properties = v5->_properties;
    v5->_properties = v12;

    v14 = objc_msgSend(v4, "_bd_lp_strictlyDecodeNSStringForKey:", @"accessibilityText");
    [(_BlastDoorLPAudioProperties *)v5->_properties setAccessibilityText:v14];

    objc_super v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "_bd_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_streamingURL, @"streamingURL");
  if ([(_BlastDoorLPAudio *)self _shouldEncodeData])
  {
    id v4 = [(_BlastDoorLPAudio *)self data];
    objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, @"data");
  }
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_MIMEType, @"MIMEType");
  v5 = [(_BlastDoorLPAudioProperties *)self->_properties accessibilityText];
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v5, @"accessibilityText");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_BlastDoorLPAudio;
  if ([(_BlastDoorLPAudio *)&v12 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      unint64_t v7 = v6[3];
      if (v7 | (unint64_t)self->_streamingURL && !objc_msgSend((id)v7, "isEqual:")
        || (unint64_t v8 = v6[1], v8 | (unint64_t)self->_data) && !objc_msgSend((id)v8, "isEqual:")
        || (unint64_t v9 = v6[2], v9 | (unint64_t)self->_MIMEType) && !objc_msgSend((id)v9, "isEqual:"))
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

- (unint64_t)_encodedSize
{
  return [(NSData *)self->_data length];
}

- (_BlastDoorLPAudioProperties)properties
{
  v2 = (void *)[(_BlastDoorLPAudioProperties *)self->_properties copy];
  return (_BlastDoorLPAudioProperties *)v2;
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

- (NSURL)streamingURL
{
  return self->_streamingURL;
}

- (void)setStreamingURL:(id)a3
{
}

- (void)setProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_streamingURL, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end