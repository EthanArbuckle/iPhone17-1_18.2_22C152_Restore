@interface _BlastDoorLPVideo
+ (BOOL)supportsSecureCoding;
- (BOOL)_shouldEncodeData;
- (BOOL)hasAudio;
- (BOOL)isEqual:(id)a3;
- (NSData)data;
- (NSString)MIMEType;
- (NSURL)fileURL;
- (NSURL)streamingURL;
- (NSURL)youTubeURL;
- (_BlastDoorLPVideo)init;
- (_BlastDoorLPVideo)initWithCoder:(id)a3;
- (_BlastDoorLPVideoProperties)properties;
- (id)_initWithVideo:(id)a3;
- (unint64_t)_encodedSize;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setHasAudio:(BOOL)a3;
- (void)setMIMEType:(id)a3;
- (void)setProperties:(id)a3;
- (void)setStreamingURL:(id)a3;
- (void)setYouTubeURL:(id)a3;
@end

@implementation _BlastDoorLPVideo

- (_BlastDoorLPVideo)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)_BlastDoorLPVideo;
  return [(_BlastDoorLPVideo *)&v3 init];
}

- (id)_initWithVideo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  v15.receiver = self;
  v15.super_class = (Class)_BlastDoorLPVideo;
  v5 = [(_BlastDoorLPVideo *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_streamingURL, v4[2]);
    objc_storeStrong((id *)&v6->_youTubeURL, v4[3]);
    uint64_t v7 = [v4[4] copy];
    data = v6->_data;
    v6->_data = (NSData *)v7;

    uint64_t v9 = [v4[5] copy];
    MIMEType = v6->_MIMEType;
    v6->_MIMEType = (NSString *)v9;

    objc_storeStrong((id *)&v6->_fileURL, v4[6]);
    uint64_t v11 = [v4[7] copy];
    properties = v6->_properties;
    v6->_properties = (_BlastDoorLPVideoProperties *)v11;

    v13 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPVideo)initWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_BlastDoorLPVideo;
  v5 = [(_BlastDoorLPVideo *)&v19 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"streamingURL");
    streamingURL = v5->_streamingURL;
    v5->_streamingURL = (NSURL *)v6;

    uint64_t v8 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"youTubeURL");
    youTubeURL = v5->_youTubeURL;
    v5->_youTubeURL = (NSURL *)v8;

    uint64_t v10 = objc_msgSend(v4, "_bd_lp_strictlyDecodeNSDataForKey:", @"data");
    data = v5->_data;
    v5->_data = (NSData *)v10;

    uint64_t v12 = objc_msgSend(v4, "_bd_lp_strictlyDecodeNSStringForKey:", @"MIMEType");
    MIMEType = v5->_MIMEType;
    v5->_MIMEType = (NSString *)v12;

    v14 = objc_alloc_init(_BlastDoorLPVideoProperties);
    properties = v5->_properties;
    v5->_properties = v14;

    -[_BlastDoorLPVideoProperties setHasAudio:](v5->_properties, "setHasAudio:", [v4 decodeBoolForKey:@"hasAudio"]);
    uint64_t v16 = objc_msgSend(v4, "_bd_lp_strictlyDecodeNSStringForKey:", @"accessibilityText");
    [(_BlastDoorLPVideoProperties *)v5->_properties setAccessibilityText:v16];

    v17 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "_bd_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_streamingURL, @"streamingURL");
  objc_msgSend(v6, "_bd_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_youTubeURL, @"youTubeURL");
  if ([(_BlastDoorLPVideo *)self _shouldEncodeData])
  {
    id v4 = [(_BlastDoorLPVideo *)self data];
    objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, @"data");
  }
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_MIMEType, @"MIMEType");
  objc_msgSend(v6, "encodeBool:forKey:", -[_BlastDoorLPVideoProperties hasAudio](self->_properties, "hasAudio"), @"hasAudio");
  v5 = [(_BlastDoorLPVideoProperties *)self->_properties accessibilityText];
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v5, @"accessibilityText");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_BlastDoorLPVideo;
  if ([(_BlastDoorLPVideo *)&v14 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      unint64_t v7 = v6[2];
      if (v7 | (unint64_t)self->_streamingURL && !objc_msgSend((id)v7, "isEqual:")
        || (unint64_t v8 = v6[3], v8 | (unint64_t)self->_youTubeURL) && !objc_msgSend((id)v8, "isEqual:")
        || (unint64_t v9 = v6[4], v9 | (unint64_t)self->_data) && !objc_msgSend((id)v9, "isEqual:")
        || (unint64_t v10 = v6[5], v10 | (unint64_t)self->_MIMEType) && !objc_msgSend((id)v10, "isEqual:")
        || (unint64_t v11 = v6[6], v11 | (unint64_t)self->_fileURL) && !objc_msgSend((id)v11, "isEqual:"))
      {
        char v5 = 0;
      }
      else
      {
        unint64_t v12 = v6[7];
        if (v12 | (unint64_t)self->_properties) {
          char v5 = objc_msgSend((id)v12, "isEqual:");
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

- (void)setFileURL:(id)a3
{
  id v4 = a3;
  if (self->_data) {
    -[_BlastDoorLPVideo setFileURL:]();
  }
  id v7 = v4;
  if ([v4 isFileURL]) {
    char v5 = (NSURL *)v7;
  }
  else {
    char v5 = 0;
  }
  fileURL = self->_fileURL;
  self->_fileURL = v5;
}

- (BOOL)hasAudio
{
  return [(_BlastDoorLPVideoProperties *)self->_properties hasAudio];
}

- (BOOL)_shouldEncodeData
{
  return 1;
}

- (NSURL)streamingURL
{
  return self->_streamingURL;
}

- (void)setStreamingURL:(id)a3
{
}

- (NSURL)youTubeURL
{
  return self->_youTubeURL;
}

- (void)setYouTubeURL:(id)a3
{
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

- (void)setHasAudio:(BOOL)a3
{
  self->_hasAudio = a3;
}

- (_BlastDoorLPVideoProperties)properties
{
  return self->_properties;
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
  objc_storeStrong((id *)&self->_youTubeURL, 0);
  objc_storeStrong((id *)&self->_streamingURL, 0);
}

- (void)setFileURL:.cold.1()
{
}

@end