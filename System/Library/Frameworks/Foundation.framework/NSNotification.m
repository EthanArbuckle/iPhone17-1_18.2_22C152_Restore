@interface NSNotification
+ (NSNotification)allocWithZone:(_NSZone *)a3;
+ (NSNotification)notificationWithName:(NSNotificationName)aName object:(id)anObject;
+ (NSNotification)notificationWithName:(NSNotificationName)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (NSDictionary)userInfo;
- (NSNotification)init;
- (NSNotification)initWithCoder:(NSCoder *)coder;
- (NSNotification)initWithName:(NSNotificationName)name object:(id)object userInfo:(NSDictionary *)userInfo;
- (NSNotificationName)name;
- (id)description;
- (id)object;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSNotification

- (id)description
{
  unint64_t v3 = [(NSNotification *)self object];
  v4 = [(NSNotification *)self userInfo];
  v5 = [[NSMutableString alloc] initWithCapacity:256];
  uint64_t v6 = objc_opt_class();
  v7 = [(NSNotification *)self name];
  if (v3 | (unint64_t)v4)
  {
    if (v3)
    {
      if (v4) {
        -[NSMutableString appendFormat:](v5, "appendFormat:", @"%@ %p {name = %@; object = %@; userInfo = %@}",
      }
          v6,
          self,
          v7,
          v3,
          v4);
      else {
        -[NSMutableString appendFormat:](v5, "appendFormat:", @"%@ %p {name = %@; object = %@}",
      }
          v6,
          self,
          v7,
          v3,
          v10);
    }
    else
    {
      -[NSMutableString appendFormat:](v5, "appendFormat:", @"%@ %p {name = %@; userInfo = %@}",
        v6,
        self,
        v7,
        v4,
        v10);
    }
  }
  else
  {
    [(NSMutableString *)v5 appendFormat:@"%@ %p {name = %@}", v6, self, v7, v9, v10];
  }
  return v5;
}

+ (NSNotification)notificationWithName:(NSNotificationName)aName object:(id)anObject
{
  v4 = (void *)[objc_alloc((Class)a1) initWithName:aName object:anObject userInfo:0];

  return (NSNotification *)v4;
}

+ (NSNotification)notificationWithName:(NSNotificationName)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
  v5 = (void *)[objc_alloc((Class)a1) initWithName:aName object:anObject userInfo:aUserInfo];

  return (NSNotification *)v5;
}

+ (NSNotification)allocWithZone:(_NSZone *)a3
{
  if (NSNotification == a1) {
    a1 = self;
  }

  return (NSNotification *)NSAllocateObject((Class)a1, 0, a3);
}

- (NSNotificationName)name
{
  v4 = NSClassFromString((NSString *)@"NSNotification");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (id)object
{
  v4 = NSClassFromString((NSString *)@"NSNotification");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSDictionary)userInfo
{
  v4 = NSClassFromString((NSString *)@"NSNotification");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (unint64_t)hash
{
  v2 = [(NSNotification *)self name];

  return [(NSString *)v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  BOOL v5 = -[NSString isEqual:](-[NSNotification name](self, "name"), "isEqual:", [a3 name]);
  if (!v5) {
    return v5;
  }
  id v6 = [(NSNotification *)self object];
  if (v6 == (id)[a3 object])
  {
    v7 = [(NSNotification *)self userInfo];
    uint64_t v8 = [a3 userInfo];
    LOBYTE(v5) = [(NSDictionary *)v7 isEqualToDictionary:v8];
  }
  else
  {
LABEL_6:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  char v5 = [a3 allowsKeyedCoding];
  id v6 = [(NSNotification *)self name];
  if (v5)
  {
    [a3 encodeObject:v6 forKey:@"NS.name"];
    objc_msgSend(a3, "encodeObject:forKey:", -[NSNotification object](self, "object"), @"NS.object");
    v7 = [(NSNotification *)self userInfo];
    [a3 encodeObject:v7 forKey:@"NS.userinfo"];
  }
  else
  {
    [a3 encodeObject:v6];
    objc_msgSend(a3, "encodeObject:", -[NSNotification object](self, "object"));
    uint64_t v8 = [(NSNotification *)self userInfo];
    [a3 encodeObject:v8];
  }
}

- (NSNotification)initWithCoder:(NSCoder *)coder
{
  if ([(NSCoder *)coder allowsKeyedCoding])
  {
    id v5 = [(NSCoder *)coder decodeObjectForKey:@"NS.name"];
    id v6 = [(NSCoder *)coder decodeObjectForKey:@"NS.object"];
    id v7 = [(NSCoder *)coder decodeObjectForKey:@"NS.userinfo"];
  }
  else
  {
    id v5 = [(NSCoder *)coder decodeObject];
    id v6 = [(NSCoder *)coder decodeObject];
    id v7 = [(NSCoder *)coder decodeObject];
  }

  return [(NSNotification *)self initWithName:v5 object:v6 userInfo:v7];
}

- (Class)classForCoder
{
  return (Class)self;
}

- (NSNotification)init
{
  unint64_t v3 = +[NSString stringWithFormat:@"%@: should never be used", _NSMethodExceptionProem((objc_class *)self, a2)];

  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v3 userInfo:0]);
}

- (NSNotification)initWithName:(NSNotificationName)name object:(id)object userInfo:(NSDictionary *)userInfo
{
}

@end