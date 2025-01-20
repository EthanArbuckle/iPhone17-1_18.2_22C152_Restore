@interface NWURLSessionResponseConsumerResumeInfo
+ (BOOL)supportsSecureCoding;
- (NWURLSessionResponseConsumerResumeInfo)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NWURLSessionResponseConsumerResumeInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tempFileName, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (NWURLSessionResponseConsumerResumeInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NWURLSessionResponseConsumerResumeInfo;
  v5 = [(NWURLSessionResponseConsumerResumeInfo *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileURL"];
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tempFileName"];
    tempFileName = v5->_tempFileName;
    v5->_tempFileName = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  if (self)
  {
    [a3 encodeObject:self->_fileURL forKey:@"fileURL"];
    tempFileName = self->_tempFileName;
  }
  else
  {
    [a3 encodeObject:0 forKey:@"fileURL"];
    tempFileName = 0;
  }
  [a3 encodeObject:tempFileName forKey:@"tempFileName"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end