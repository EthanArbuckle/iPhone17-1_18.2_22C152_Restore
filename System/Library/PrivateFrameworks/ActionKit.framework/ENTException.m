@interface ENTException
+ (id)exceptionWithName:(id)a3;
+ (id)exceptionWithName:(id)a3 reason:(id)a4;
+ (id)exceptionWithName:(id)a3 reason:(id)a4 error:(id)a5;
- (id)description;
@end

@implementation ENTException

+ (id)exceptionWithName:(id)a3 reason:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    a5 = [NSDictionary dictionaryWithObject:a5 forKey:@"error"];
  }
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___ENTException;
  v10 = objc_msgSendSuper2(&v12, sel_exceptionWithName_reason_userInfo_, v8, v9, a5);

  return v10;
}

+ (id)exceptionWithName:(id)a3 reason:(id)a4
{
  return (id)[a1 exceptionWithName:a3 reason:a4 error:0];
}

+ (id)exceptionWithName:(id)a3
{
  return (id)[a1 exceptionWithName:a3 reason:@"unknown" error:0];
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  v4 = [(ENTException *)self name];
  v5 = [v3 stringWithString:v4];

  v6 = [(ENTException *)self reason];
  [v5 appendFormat:@": %@", v6];

  v7 = [(ENTException *)self userInfo];

  if (v7)
  {
    id v8 = [(ENTException *)self userInfo];
    [v5 appendFormat:@"\n  userInfo = %@", v8];
  }
  return v5;
}

@end