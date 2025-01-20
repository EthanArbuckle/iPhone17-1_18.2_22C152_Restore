@interface AVCSessionABTestConfiguration
+ (id)createWithDictionary:(id)a3;
- (BOOL)isGftTLEEnabled;
- (BOOL)isOneToOneAuthenticationTagEnabled;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionary;
- (void)setGftTLEEnabled:(BOOL)a3;
- (void)setOneToOneAuthenticationTagEnabled:(BOOL)a3;
@end

@implementation AVCSessionABTestConfiguration

- (id)description
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AVCSessionABTestConfiguration;
  id v4 = [(AVCSessionABTestConfiguration *)&v8 description];
  v5 = "YES";
  if (self->_oneToOneAuthenticationTagEnabled) {
    v6 = "YES";
  }
  else {
    v6 = "NO";
  }
  if (!self->_gftTLEEnabled) {
    v5 = "NO";
  }
  return (id)[v3 stringWithFormat:@"{ %@ oneToOneAuthenticationTagEnabled=%s, gftTLEEnabled=%s }", v4, v6, v5];
}

+ (id)createWithDictionary:(id)a3
{
  id v4 = objc_alloc_init(AVCSessionABTestConfiguration);
  if (a3)
  {
    -[AVCSessionABTestConfiguration setOneToOneAuthenticationTagEnabled:](v4, "setOneToOneAuthenticationTagEnabled:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcSessionABTestOneOnOneAuthtagEnabled"), "BOOLValue"));
    -[AVCSessionABTestConfiguration setGftTLEEnabled:](v4, "setGftTLEEnabled:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcSessionABTestGftTLEEnabled"), "BOOLValue"));
  }
  return v4;
}

- (id)dictionary
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"vcSessionABTestOneOnOneAuthtagEnabled";
  uint64_t v3 = [NSNumber numberWithBool:self->_oneToOneAuthenticationTagEnabled];
  v5[1] = @"vcSessionABTestGftTLEEnabled";
  v6[0] = v3;
  v6[1] = [NSNumber numberWithBool:self->_gftTLEEnabled];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setOneToOneAuthenticationTagEnabled:", -[AVCSessionABTestConfiguration isOneToOneAuthenticationTagEnabled](self, "isOneToOneAuthenticationTagEnabled"));
  objc_msgSend(v4, "setGftTLEEnabled:", -[AVCSessionABTestConfiguration isGftTLEEnabled](self, "isGftTLEEnabled"));
  return v4;
}

- (BOOL)isOneToOneAuthenticationTagEnabled
{
  return self->_oneToOneAuthenticationTagEnabled;
}

- (void)setOneToOneAuthenticationTagEnabled:(BOOL)a3
{
  self->_oneToOneAuthenticationTagEnabled = a3;
}

- (BOOL)isGftTLEEnabled
{
  return self->_gftTLEEnabled;
}

- (void)setGftTLEEnabled:(BOOL)a3
{
  self->_gftTLEEnabled = a3;
}

@end