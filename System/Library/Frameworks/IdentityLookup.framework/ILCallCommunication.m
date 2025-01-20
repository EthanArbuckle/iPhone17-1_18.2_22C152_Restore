@interface ILCallCommunication
- (BOOL)isEqual:(id)a3;
- (ILCallCommunication)init;
- (id)description;
@end

@implementation ILCallCommunication

- (ILCallCommunication)init
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)ILCallCommunication;
  v4 = [(ILCommunication *)&v9 description];
  v8.receiver = self;
  v8.super_class = (Class)ILCallCommunication;
  v5 = [(ILCommunication *)&v8 description];
  v6 = [v3 stringWithFormat:@"<%@ communications=%@>", v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(ILCallCommunication *)self isEqualToCallCommunication:v4];

  return v5;
}

@end