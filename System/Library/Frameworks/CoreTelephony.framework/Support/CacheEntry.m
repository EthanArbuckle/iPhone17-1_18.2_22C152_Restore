@interface CacheEntry
- (NSManagedObjectID)nsManagedObjectId;
- (double)lastAccess;
- (id)description;
- (id)init:(id)a3;
- (int64_t)compare:(id)a3;
- (void)setLastAccess:(double)a3;
- (void)setNsManagedObjectId:(id)a3;
@end

@implementation CacheEntry

- (id)init:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CacheEntry;
  v6 = [(CacheEntry *)&v9 init];
  v7 = (CFAbsoluteTime *)v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_nsManagedObjectId, a3);
    v7[2] = CFAbsoluteTimeGetCurrent();
  }

  return v7;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  [(CacheEntry *)self lastAccess];
  double v6 = v5;
  [v4 lastAccess];
  if (v6 >= v7)
  {
    [(CacheEntry *)self lastAccess];
    double v10 = v9;
    [v4 lastAccess];
    int64_t v8 = v10 > v11;
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  [(CacheEntry *)self lastAccess];
  id v5 = objc_msgSend(v3, "initWithFormat:", @"last access: %lf", v4);

  return v5;
}

- (NSManagedObjectID)nsManagedObjectId
{
  return (NSManagedObjectID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNsManagedObjectId:(id)a3
{
}

- (double)lastAccess
{
  return self->_lastAccess;
}

- (void)setLastAccess:(double)a3
{
  self->_lastAccess = a3;
}

- (void).cxx_destruct
{
}

@end