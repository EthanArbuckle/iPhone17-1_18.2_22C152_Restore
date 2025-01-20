@interface HPSHomeProxy
+ (BOOL)supportsSecureCoding;
- (BOOL)hasValidHomeLoaded;
- (BOOL)isAutoSUEnabled;
- (BOOL)isMediaPeerToPeerEnabled;
- (HPSHomeProxy)initWithAccessoryName:(id)a3 validHome:(BOOL)a4;
- (HPSHomeProxy)initWithCoder:(id)a3;
- (NSString)accesoryName;
- (id)description;
- (int64_t)minimumMediaUserPrivilege;
- (void)encodeWithCoder:(id)a3;
- (void)setIsAutoSUEnabled:(BOOL)a3;
- (void)setIsMediaPeerToPeerEnabled:(BOOL)a3;
- (void)setMinimumMediaUserPrivilege:(int64_t)a3;
@end

@implementation HPSHomeProxy

- (HPSHomeProxy)initWithAccessoryName:(id)a3 validHome:(BOOL)a4
{
  id v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HPSHomeProxy;
  v8 = [(HPSHomeProxy *)&v10 self];

  if (v8)
  {
    objc_storeStrong((id *)&v8->_accesoryName, a3);
    v8->_hasValidHomeLoaded = a4;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HPSHomeProxy *)self accesoryName];
  [v4 encodeObject:v5 forKey:@"HPSHomeProxyEncodedNameKey"];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HPSHomeProxy hasValidHomeLoaded](self, "hasValidHomeLoaded"));
  [v4 encodeObject:v6 forKey:@"HPSHomeProxyEncodedValidHomeKey"];

  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[HPSHomeProxy minimumMediaUserPrivilege](self, "minimumMediaUserPrivilege"));
  [v4 encodeObject:v7 forKey:@"HPSHomeProxyEncodedMinimumMediaUserPrivilegeKey"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HPSHomeProxy isMediaPeerToPeerEnabled](self, "isMediaPeerToPeerEnabled"));
  [v4 encodeObject:v8 forKey:@"HPSHomeProxyEncodedMediaPeerToPeerEnabledKey"];

  objc_msgSend(NSNumber, "numberWithBool:", -[HPSHomeProxy isAutoSUEnabled](self, "isAutoSUEnabled"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"HPSHomeProxyEncodedAutoSUEnabledKey"];
}

- (HPSHomeProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HPSHomeProxy;
  v5 = [(HPSHomeProxy *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HPSHomeProxyEncodedNameKey"];
    accesoryName = v5->_accesoryName;
    v5->_accesoryName = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HPSHomeProxyEncodedValidHomeKey"];
    v5->_hasValidHomeLoaded = [v8 BOOLValue];

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HPSHomeProxyEncodedMinimumMediaUserPrivilegeKey"];
    v5->_minimumMediaUserPrivilege = [v9 integerValue];

    objc_super v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HPSHomeProxyEncodedMediaPeerToPeerEnabledKey"];
    v5->_isMediaPeerToPeerEnabled = [v10 BOOLValue];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HPSHomeProxyEncodedAutoSUEnabledKey"];
    v5->_isAutoSUEnabled = [v11 BOOLValue];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(HPSHomeProxy *)self accesoryName];
  v5 = [v3 stringWithFormat:@"AccessoryName:%@, HasValidHome:%d, minimumMediaUserPrivilege:%lu, isMediaPeerToPeerEnabled:%d isAutoSUEnabled: %d", v4, -[HPSHomeProxy hasValidHomeLoaded](self, "hasValidHomeLoaded"), -[HPSHomeProxy minimumMediaUserPrivilege](self, "minimumMediaUserPrivilege"), -[HPSHomeProxy isMediaPeerToPeerEnabled](self, "isMediaPeerToPeerEnabled"), -[HPSHomeProxy isAutoSUEnabled](self, "isAutoSUEnabled")];

  return v5;
}

- (BOOL)hasValidHomeLoaded
{
  return self->_hasValidHomeLoaded;
}

- (NSString)accesoryName
{
  return self->_accesoryName;
}

- (int64_t)minimumMediaUserPrivilege
{
  return self->_minimumMediaUserPrivilege;
}

- (void)setMinimumMediaUserPrivilege:(int64_t)a3
{
  self->_minimumMediaUserPrivilege = a3;
}

- (BOOL)isMediaPeerToPeerEnabled
{
  return self->_isMediaPeerToPeerEnabled;
}

- (void)setIsMediaPeerToPeerEnabled:(BOOL)a3
{
  self->_isMediaPeerToPeerEnabled = a3;
}

- (BOOL)isAutoSUEnabled
{
  return self->_isAutoSUEnabled;
}

- (void)setIsAutoSUEnabled:(BOOL)a3
{
  self->_isAutoSUEnabled = a3;
}

- (void).cxx_destruct
{
}

@end