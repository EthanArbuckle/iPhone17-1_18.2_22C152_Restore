@interface ASDAccountLookupRequestOptions
+ (BOOL)supportsSecureCoding;
- (ASDAccountLookupRequestOptions)initWithCoder:(id)a3;
- (BOOL)authIfNeeded;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthIfNeeded:(BOOL)a3;
@end

@implementation ASDAccountLookupRequestOptions

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  objc_msgSend(v4, "setAuthIfNeeded:", -[ASDAccountLookupRequestOptions authIfNeeded](self, "authIfNeeded"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[ASDAccountLookupRequestOptions authIfNeeded](self, "authIfNeeded"), @"authIfNeeded");
}

- (ASDAccountLookupRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ASDAccountLookupRequestOptions;
  v5 = [(ASDAccountLookupRequestOptions *)&v7 init];
  if (v5) {
    -[ASDAccountLookupRequestOptions setAuthIfNeeded:](v5, "setAuthIfNeeded:", [v4 decodeBoolForKey:@"authIfNeeded"]);
  }

  return v5;
}

- (BOOL)authIfNeeded
{
  return self->_authIfNeeded;
}

- (void)setAuthIfNeeded:(BOOL)a3
{
  self->_authIfNeeded = a3;
}

@end