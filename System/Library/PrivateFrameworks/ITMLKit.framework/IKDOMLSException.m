@interface IKDOMLSException
+ (id)exceptionWithAppContext:(id)a3 code:(int64_t)a4;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation IKDOMLSException

+ (id)exceptionWithAppContext:(id)a3 code:(int64_t)a4
{
  id v5 = a3;
  v6 = [(IKJSObject *)[IKDOMLSException alloc] initWithAppContext:v5];

  [(IKDOMLSException *)v6 setCode:a4];
  return v6;
}

- (int64_t)code
{
  return self->code;
}

- (void)setCode:(int64_t)a3
{
  self->code = a3;
}

@end