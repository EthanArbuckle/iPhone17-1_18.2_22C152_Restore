@interface CLSChildParentRelation
- (CLSChildParentRelation)initWithChildEntity:(Class)a3 parentEntity:(Class)a4 faultable:(BOOL)a5;
@end

@implementation CLSChildParentRelation

- (CLSChildParentRelation)initWithChildEntity:(Class)a3 parentEntity:(Class)a4 faultable:(BOOL)a5
{
  v6.receiver = self;
  v6.super_class = (Class)CLSChildParentRelation;
  return [(CLSRelation *)&v6 initWithFromEntity:a3 toEntity:a4 onFromKey:@"parentObjectID" toKey:@"objectID" faultable:a5];
}

@end