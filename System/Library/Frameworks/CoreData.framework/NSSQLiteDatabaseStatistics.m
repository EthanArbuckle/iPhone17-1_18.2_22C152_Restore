@interface NSSQLiteDatabaseStatistics
- (NSSQLiteDatabaseStatistics)initWithPageSize:(int64_t)a3;
- (id)copy;
- (id)databaseStatisticsBySubtracting:(id)a3;
- (id)description;
- (int64_t)cacheHitPages;
- (int64_t)cacheMissPages;
- (int64_t)cacheSpillPages;
- (int64_t)pageSize;
- (int64_t)totalCachePages;
@end

@implementation NSSQLiteDatabaseStatistics

- (int64_t)pageSize
{
  return self->_pageSize;
}

- (int64_t)totalCachePages
{
  return self->_cacheMissPages + self->_cacheHitPages + self->_cacheSpillPages;
}

- (id)copy
{
  id result = [[NSSQLiteDatabaseStatistics alloc] initWithPageSize:self->_pageSize];
  *((void *)result + 1) = self->_cacheHitPages;
  *((void *)result + 2) = self->_cacheMissPages;
  *((void *)result + 3) = self->_cacheSpillPages;
  return result;
}

- (NSSQLiteDatabaseStatistics)initWithPageSize:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSSQLiteDatabaseStatistics;
  id result = [(NSSQLiteDatabaseStatistics *)&v5 init];
  if (result) {
    result->_pageSize = a3;
  }
  return result;
}

- (id)databaseStatisticsBySubtracting:(id)a3
{
  if (a3)
  {
    objc_super v5 = [[NSSQLiteDatabaseStatistics alloc] initWithPageSize:self->_pageSize];
    v5->_cacheHitPages = self->_cacheHitPages - *((void *)a3 + 1);
    v5->_cacheMissPages = self->_cacheMissPages - *((void *)a3 + 2);
    v5->_cacheSpillPages = self->_cacheSpillPages - *((void *)a3 + 3);
  }
  else
  {
    objc_super v5 = [(NSSQLiteDatabaseStatistics *)self copy];
  }

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p> cacheHitPages=%lld, cacheMissPages=%lld, cacheSpillPages=%lld, pageSize=%lld", objc_opt_class(), self, self->_cacheHitPages, self->_cacheMissPages, self->_cacheSpillPages, self->_pageSize];
}

- (int64_t)cacheHitPages
{
  return self->_cacheHitPages;
}

- (int64_t)cacheMissPages
{
  return self->_cacheMissPages;
}

- (int64_t)cacheSpillPages
{
  return self->_cacheSpillPages;
}

@end