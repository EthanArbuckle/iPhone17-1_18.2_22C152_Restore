@interface IDSDuplicatedMessageMetric
- (IDSDuplicatedMessageMetric)init;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
@end

@implementation IDSDuplicatedMessageMetric

- (NSString)name
{
  return (NSString *)@"IDSDuplicatedMessage";
}

- (NSDictionary)dictionaryRepresentation
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return (NSDictionary *)v2;
}

- (IDSDuplicatedMessageMetric)init
{
  v3.receiver = self;
  v3.super_class = (Class)IDSDuplicatedMessageMetric;
  return [(IDSDuplicatedMessageMetric *)&v3 init];
}

@end