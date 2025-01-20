@interface MSAttachmentInfo
+ (BOOL)supportsSecureCoding;
- (MSAttachmentInfo)initWithCoder:(id)a3;
- (MSAttachmentInfo)initWithURL:(id)a3 filename:(id)a4;
- (NSString)filename;
- (NSURL)url;
- (void)encodeWithCoder:(id)a3;
- (void)setFilename:(id)a3;
@end

@implementation MSAttachmentInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSAttachmentInfo)initWithURL:(id)a3 filename:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSAttachmentInfo;
  v9 = [(MSAttachmentInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_filename, a4);
  }

  return v10;
}

- (MSAttachmentInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSAttachmentInfo;
  v5 = [(MSAttachmentInfo *)&v12 init];
  if (v5)
  {
    if (([v4 allowsKeyedCoding] & 1) == 0)
    {
      v10 = 0;
      goto LABEL_6;
    }
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_url"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_filename"];
    filename = v5->_filename;
    v5->_filename = (NSString *)v8;
  }
  v10 = v5;
LABEL_6:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if (self->_url)
  {
    id v4 = [(MSAttachmentInfo *)self url];
    [v6 encodeObject:v4 forKey:@"EFPropertyKey_url"];
  }
  if (self->_filename)
  {
    v5 = [(MSAttachmentInfo *)self filename];
    [v6 encodeObject:v5 forKey:@"EFPropertyKey_filename"];
  }
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end