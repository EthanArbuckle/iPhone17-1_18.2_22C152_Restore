@interface BMPruningPolicy
- (BOOL)filterByAgeOnRead;
- (BOOL)isEqual:(id)a3;
- (BOOL)pruneOnAccess;
- (double)maxAge;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initPruneOnAccess:(BOOL)a3 filterByAgeOnRead:(BOOL)a4 maxAge:(double)a5 maxStreamSize:(unint64_t)a6;
- (id)initPruneOnAccess:(BOOL)a3 filterByAgeOnRead:(BOOL)a4 maxAge:(double)a5 maxStreamSize:(unint64_t)a6 maxEventCount:(unint64_t)a7;
- (unint64_t)hash;
- (unint64_t)maxEventCount;
- (unint64_t)maxStreamSize;
- (void)setFilterByAgeOnRead:(BOOL)a3;
- (void)setMaxAge:(double)a3;
- (void)setMaxEventCount:(unint64_t)a3;
- (void)setMaxStreamSize:(unint64_t)a3;
- (void)setPruneOnAccess:(BOOL)a3;
@end

@implementation BMPruningPolicy

- (BOOL)pruneOnAccess
{
  return self->_pruneOnAccess;
}

- (double)maxAge
{
  return self->_maxAge;
}

- (BOOL)filterByAgeOnRead
{
  return self->_filterByAgeOnRead;
}

- (id)initPruneOnAccess:(BOOL)a3 filterByAgeOnRead:(BOOL)a4 maxAge:(double)a5 maxStreamSize:(unint64_t)a6 maxEventCount:(unint64_t)a7
{
  v13.receiver = self;
  v13.super_class = (Class)BMPruningPolicy;
  id result = [(BMPruningPolicy *)&v13 init];
  if (result)
  {
    *((unsigned char *)result + 8) = a3;
    *((unsigned char *)result + 9) = a4;
    *((double *)result + 2) = a5;
    *((void *)result + 3) = a6;
    *((void *)result + 4) = a7;
  }
  return result;
}

- (unint64_t)maxStreamSize
{
  return self->_maxStreamSize;
}

- (id)initPruneOnAccess:(BOOL)a3 filterByAgeOnRead:(BOOL)a4 maxAge:(double)a5 maxStreamSize:(unint64_t)a6
{
  return [(BMPruningPolicy *)self initPruneOnAccess:a3 filterByAgeOnRead:a4 maxAge:a6 maxStreamSize:-1 maxEventCount:a5];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BMPruningPolicy *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = self->_pruneOnAccess == v5->_pruneOnAccess
        && self->_maxAge == v5->_maxAge
        && self->_maxStreamSize == v5->_maxStreamSize
        && self->_filterByAgeOnRead == v5->_filterByAgeOnRead
        && self->_maxEventCount == v5->_maxEventCount;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2 = 3;
  if (self->_filterByAgeOnRead) {
    uint64_t v2 = 1;
  }
  return self->_maxStreamSize ^ (v2 << !self->_pruneOnAccess) ^ self->_maxEventCount ^ (unint64_t)(self->_maxAge * 1000.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [BMPruningPolicy alloc];
  BOOL pruneOnAccess = self->_pruneOnAccess;
  BOOL filterByAgeOnRead = self->_filterByAgeOnRead;
  double maxAge = self->_maxAge;
  unint64_t maxStreamSize = self->_maxStreamSize;
  unint64_t maxEventCount = self->_maxEventCount;
  return [(BMPruningPolicy *)v4 initPruneOnAccess:pruneOnAccess filterByAgeOnRead:filterByAgeOnRead maxAge:maxStreamSize maxStreamSize:maxEventCount maxEventCount:maxAge];
}

- (void)setPruneOnAccess:(BOOL)a3
{
  self->_BOOL pruneOnAccess = a3;
}

- (void)setFilterByAgeOnRead:(BOOL)a3
{
  self->_BOOL filterByAgeOnRead = a3;
}

- (void)setMaxAge:(double)a3
{
  self->_double maxAge = a3;
}

- (void)setMaxStreamSize:(unint64_t)a3
{
  self->_unint64_t maxStreamSize = a3;
}

- (unint64_t)maxEventCount
{
  return self->_maxEventCount;
}

- (void)setMaxEventCount:(unint64_t)a3
{
  self->_unint64_t maxEventCount = a3;
}

@end