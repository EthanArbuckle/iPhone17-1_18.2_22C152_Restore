@interface AAPasswordSecurityUIRequest
- (id)urlRequest;
- (id)urlString;
- (unint64_t)spyglassOptionMask;
- (void)setSpyglassOptionMask:(unint64_t)a3;
@end

@implementation AAPasswordSecurityUIRequest

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 passwordSecurityUIURL];

  return v3;
}

- (id)urlRequest
{
  v9.receiver = self;
  v9.super_class = (Class)AAPasswordSecurityUIRequest;
  id v3 = [(AAAppleIDSettingsRequest *)&v9 urlRequest];
  v8.receiver = self;
  v8.super_class = (Class)AAPasswordSecurityUIRequest;
  v4 = [(AAAppleIDSettingsRequest *)&v8 urlRequest];
  v5 = (void *)[v4 mutableCopy];

  if ([(AAPasswordSecurityUIRequest *)self spyglassOptionMask]) {
    objc_msgSend(v5, "aa_addSpyglassModeHeaderWithMask:", -[AAPasswordSecurityUIRequest spyglassOptionMask](self, "spyglassOptionMask"));
  }
  v6 = (void *)[v5 copy];

  return v6;
}

- (unint64_t)spyglassOptionMask
{
  return self->_spyglassOptionMask;
}

- (void)setSpyglassOptionMask:(unint64_t)a3
{
  self->_spyglassOptionMask = a3;
}

@end