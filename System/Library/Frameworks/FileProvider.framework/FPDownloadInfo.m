@interface FPDownloadInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)recursively;
- (FPDownloadInfo)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setRecursively:(BOOL)a3;
@end

@implementation FPDownloadInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FPDownloadInfo;
  id v4 = a3;
  [(FPActionOperationInfo *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_recursively, @"_recursively", v5.receiver, v5.super_class);
}

- (FPDownloadInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FPDownloadInfo;
  objc_super v5 = [(FPActionOperationInfo *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_recursively = [v4 decodeBoolForKey:@"_recursively"];
  }

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithString:@"{ "];
  [v3 appendString:@"download "];
  id v4 = [(FPActionOperationInfo *)self roots];
  [v3 appendFormat:@"roots:%@ ", v4];

  objc_msgSend(v3, "appendFormat:", @"qos:%2.0x ", -[FPActionOperationInfo qos](self, "qos"));
  [v3 appendString:@"}"];

  return v3;
}

- (BOOL)recursively
{
  return self->_recursively;
}

- (void)setRecursively:(BOOL)a3
{
  self->_recursively = a3;
}

@end