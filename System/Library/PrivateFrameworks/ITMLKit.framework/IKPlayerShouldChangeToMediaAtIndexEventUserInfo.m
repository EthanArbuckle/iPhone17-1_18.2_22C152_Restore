@interface IKPlayerShouldChangeToMediaAtIndexEventUserInfo
- (BOOL)expectsReturnValue;
- (BOOL)shouldChange;
- (IKPlayerShouldChangeToMediaAtIndexEventUserInfo)initWithIndex:(int64_t)a3;
- (NSDictionary)properties;
- (int64_t)index;
- (void)processReturnJSValue:(id)a3 inContext:(id)a4;
@end

@implementation IKPlayerShouldChangeToMediaAtIndexEventUserInfo

- (IKPlayerShouldChangeToMediaAtIndexEventUserInfo)initWithIndex:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IKPlayerShouldChangeToMediaAtIndexEventUserInfo;
  result = [(IKPlayerShouldChangeToMediaAtIndexEventUserInfo *)&v5 init];
  if (result)
  {
    result->_index = a3;
    result->_shouldChange = 1;
  }
  return result;
}

- (NSDictionary)properties
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  v4 = [NSNumber numberWithInteger:self->_index];
  [v3 setObject:v4 forKeyedSubscript:@"requestedIndex"];

  objc_super v5 = (void *)[v3 copy];
  return (NSDictionary *)v5;
}

- (BOOL)expectsReturnValue
{
  return 1;
}

- (void)processReturnJSValue:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  if ([v5 isNull])
  {
    self->_shouldChange = 0;
  }
  else if ([v5 isBoolean])
  {
    self->_shouldChange = [v5 toBool];
  }
}

- (int64_t)index
{
  return self->_index;
}

- (BOOL)shouldChange
{
  return self->_shouldChange;
}

@end