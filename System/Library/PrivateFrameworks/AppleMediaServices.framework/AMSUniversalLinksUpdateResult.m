@interface AMSUniversalLinksUpdateResult
+ (BOOL)supportsSecureCoding;
+ (id)archiveClasses;
- (AMSUniversalLinksUpdateResult)initWithCoder:(id)a3;
- (BOOL)success;
- (void)encodeWithCoder:(id)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation AMSUniversalLinksUpdateResult

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSUniversalLinksUpdateResult success](self, "success"), @"kCodingKeySuccess");
}

- (AMSUniversalLinksUpdateResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AMSUniversalLinksUpdateResult;
  v5 = [(AMSUniversalLinksUpdateResult *)&v7 init];
  if (v5) {
    v5->_success = [v4 decodeBoolForKey:@"kCodingKeySuccess"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)archiveClasses
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

@end