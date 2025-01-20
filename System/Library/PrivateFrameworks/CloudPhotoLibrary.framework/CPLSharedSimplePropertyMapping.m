@interface CPLSharedSimplePropertyMapping
- (BOOL)shouldUpdatePropertyOnPrivateRecord:(id)a3 recordClass:(Class)a4;
- (BOOL)shouldUpdatePropertyOnSharedRecord:(id)a3 recordClass:(Class)a4;
@end

@implementation CPLSharedSimplePropertyMapping

- (BOOL)shouldUpdatePropertyOnSharedRecord:(id)a3 recordClass:(Class)a4
{
  return 1;
}

- (BOOL)shouldUpdatePropertyOnPrivateRecord:(id)a3 recordClass:(Class)a4
{
  return 0;
}

@end