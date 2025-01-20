@interface IKPlayerTransportBarVisibilityDidChangeEventUserInfo
- (BOOL)hidden;
- (IKPlayerTransportBarVisibilityDidChangeEventUserInfo)initWithHidden:(BOOL)a3;
- (NSDictionary)properties;
@end

@implementation IKPlayerTransportBarVisibilityDidChangeEventUserInfo

- (IKPlayerTransportBarVisibilityDidChangeEventUserInfo)initWithHidden:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IKPlayerTransportBarVisibilityDidChangeEventUserInfo;
  result = [(IKPlayerTransportBarVisibilityDidChangeEventUserInfo *)&v5 init];
  if (result) {
    result->_hidden = a3;
  }
  return result;
}

- (NSDictionary)properties
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  v4 = [NSNumber numberWithBool:self->_hidden];
  [v3 setObject:v4 forKeyedSubscript:@"hidden"];

  objc_super v5 = (void *)[v3 copy];
  return (NSDictionary *)v5;
}

- (BOOL)hidden
{
  return self->_hidden;
}

@end