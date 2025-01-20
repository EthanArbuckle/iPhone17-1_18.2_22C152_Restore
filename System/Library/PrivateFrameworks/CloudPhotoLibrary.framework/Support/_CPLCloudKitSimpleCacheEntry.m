@interface _CPLCloudKitSimpleCacheEntry
- (BOOL)isExpiredForNow:(id)a3 withLeeway:(double)a4;
- (NSDate)expirationDate;
- (_CPLCloudKitSimpleCacheEntry)initWithKey:(id)a3 object:(id)a4 expirationDate:(id)a5;
- (id)key;
- (id)object;
- (int64_t)compare:(id)a3;
@end

@implementation _CPLCloudKitSimpleCacheEntry

- (_CPLCloudKitSimpleCacheEntry)initWithKey:(id)a3 object:(id)a4 expirationDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_CPLCloudKitSimpleCacheEntry;
  v12 = [(_CPLCloudKitSimpleCacheEntry *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->_key, a3);
    objc_storeStrong(&v13->_object, a4);
    v14 = (NSDate *)[v11 copy];
    expirationDate = v13->_expirationDate;
    v13->_expirationDate = v14;
  }
  return v13;
}

- (BOOL)isExpiredForNow:(id)a3 withLeeway:(double)a4
{
  [(NSDate *)self->_expirationDate timeIntervalSinceDate:a3];
  return v5 < a4;
}

- (int64_t)compare:(id)a3
{
  return [(NSDate *)self->_expirationDate compare:*((void *)a3 + 3)];
}

- (id)key
{
  return self->_key;
}

- (id)object
{
  return self->_object;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong(&self->_key, 0);
}

@end