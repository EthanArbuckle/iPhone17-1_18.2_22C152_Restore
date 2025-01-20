@interface _AKExpiringCacheValue
- (BOOL)isExpired;
- (NSDate)expiryDate;
- (_AKExpiringCacheValue)initWithObject:(id)a3 expiryDate:(id)a4;
- (id)cacheObject;
- (id)description;
@end

@implementation _AKExpiringCacheValue

- (_AKExpiringCacheValue)initWithObject:(id)a3 expiryDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_AKExpiringCacheValue;
  v9 = [(_AKExpiringCacheValue *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_cacheObject, a3);
    objc_storeStrong((id *)&v10->_expiryDate, a4);
  }

  return v10;
}

- (id)cacheObject
{
  return self->_cacheObject;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (BOOL)isExpired
{
  v3 = +[NSDate now];
  v4 = [(_AKExpiringCacheValue *)self expiryDate];
  BOOL v5 = [v3 compare:v4] == (id)1;

  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: %p> Value: %@, Expiry (%@)", objc_opt_class(), self, self->_cacheObject, self->_expiryDate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);

  objc_storeStrong(&self->_cacheObject, 0);
}

@end