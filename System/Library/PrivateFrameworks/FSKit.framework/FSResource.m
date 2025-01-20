@interface FSResource
+ (BOOL)supportsSecureCoding;
+ (id)dynamicCast:(id)a3;
- (BOOL)isRevoked;
- (FSResource)initWithCoder:(id)a3;
- (NSString)getResourceID;
- (id)makeProxy;
- (int)state;
- (int64_t)kind;
- (void)encodeWithCoder:(id)a3;
- (void)revoke;
- (void)setState:(int)a3;
@end

@implementation FSResource

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be encoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v4);
  }
  [v5 encodeInt:self->_state forKey:@"FSResource.State"];
}

- (FSResource)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be decoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v6);
  }
  if (self) {
    self->_state = [v4 decodeIntForKey:@"FSResource.State"];
  }

  return self;
}

- (void)revoke
{
  self->_isRevoked = 1;
}

- (int64_t)kind
{
  return 0;
}

- (id)makeProxy
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF488];
  id v4 = [NSString stringWithFormat:@"Can't create a proxy object of a base FSResource"];
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (BOOL)isRevoked
{
  return self->_isRevoked;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

+ (id)dynamicCast:(id)a3
{
  id v3 = a3;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (NSString)getResourceID
{
  return (NSString *)@"FSResource:GenericResourceID";
}

@end