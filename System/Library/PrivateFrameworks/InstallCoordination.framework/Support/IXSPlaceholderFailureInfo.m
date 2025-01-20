@interface IXSPlaceholderFailureInfo
+ (BOOL)supportsSecureCoding;
- (IXSPlaceholderFailureInfo)initWithCoder:(id)a3;
- (NSError)underlyingError;
- (int64_t)reason;
- (unint64_t)client;
- (unint64_t)installType;
- (void)encodeWithCoder:(id)a3;
- (void)setClient:(unint64_t)a3;
- (void)setInstallType:(unint64_t)a3;
- (void)setReason:(int64_t)a3;
- (void)setUnderlyingError:(id)a3;
@end

@implementation IXSPlaceholderFailureInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXSPlaceholderFailureInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IXSPlaceholderFailureInfo;
  v5 = [(IXSPlaceholderFailureInfo *)&v12 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installType"];
    v5->_installType = (unint64_t)[v6 unsignedLongLongValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
    v5->_reason = (int64_t)[v7 unsignedLongLongValue];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"underlyingError"];
    underlyingError = v5->_underlyingError;
    v5->_underlyingError = (NSError *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"client"];
    v5->_client = (unint64_t)[v10 unsignedLongLongValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = +[NSNumber numberWithUnsignedInteger:[(IXSPlaceholderFailureInfo *)self installType]];
  [v4 encodeObject:v5 forKey:@"installType"];

  v6 = +[NSNumber numberWithInteger:[(IXSPlaceholderFailureInfo *)self reason]];
  [v4 encodeObject:v6 forKey:@"reason"];

  v7 = [(IXSPlaceholderFailureInfo *)self underlyingError];
  [v4 encodeObject:v7 forKey:@"underlyingError"];

  id v8 = +[NSNumber numberWithUnsignedInteger:[(IXSPlaceholderFailureInfo *)self client]];
  [v4 encodeObject:v8 forKey:@"client"];
}

- (unint64_t)installType
{
  return self->_installType;
}

- (void)setInstallType:(unint64_t)a3
{
  self->_installType = a3;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (NSError)underlyingError
{
  return self->_underlyingError;
}

- (void)setUnderlyingError:(id)a3
{
}

- (unint64_t)client
{
  return self->_client;
}

- (void)setClient:(unint64_t)a3
{
  self->_client = a3;
}

- (void).cxx_destruct
{
}

@end