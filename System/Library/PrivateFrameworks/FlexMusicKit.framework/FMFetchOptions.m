@interface FMFetchOptions
- (FMFetchOptions)init;
- (NSArray)sortDescriptors;
- (NSPredicate)predicate;
- (void)setPredicate:(id)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation FMFetchOptions

- (FMFetchOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)FMFetchOptions;
  return [(FMFetchOptions *)&v3 init];
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end