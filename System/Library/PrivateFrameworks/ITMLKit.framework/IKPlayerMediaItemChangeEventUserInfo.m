@interface IKPlayerMediaItemChangeEventUserInfo
- (IKPlayerMediaItemChangeEventUserInfo)initWithReason:(int64_t)a3;
- (NSDictionary)properties;
- (int64_t)reason;
@end

@implementation IKPlayerMediaItemChangeEventUserInfo

- (IKPlayerMediaItemChangeEventUserInfo)initWithReason:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IKPlayerMediaItemChangeEventUserInfo;
  result = [(IKPlayerMediaItemChangeEventUserInfo *)&v5 init];
  if (result) {
    result->_reason = a3;
  }
  return result;
}

- (NSDictionary)properties
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  v4 = [NSNumber numberWithInteger:self->_reason];
  [v3 setObject:v4 forKeyedSubscript:@"reason"];

  objc_super v5 = (void *)[v3 copy];
  return (NSDictionary *)v5;
}

- (int64_t)reason
{
  return self->_reason;
}

@end