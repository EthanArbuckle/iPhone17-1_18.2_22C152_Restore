@interface CLSParentChildRelation
- (CLSParentChildRelation)initWithParentEntity:(Class)a3 childEntity:(Class)a4 faultable:(BOOL)a5;
@end

@implementation CLSParentChildRelation

- (CLSParentChildRelation)initWithParentEntity:(Class)a3 childEntity:(Class)a4 faultable:(BOOL)a5
{
  v6.receiver = self;
  v6.super_class = (Class)CLSParentChildRelation;
  return [(CLSRelation *)&v6 initWithFromEntity:a3 toEntity:a4 onFromKey:@"objectID" toKey:@"parentObjectID" faultable:a5];
}

@end