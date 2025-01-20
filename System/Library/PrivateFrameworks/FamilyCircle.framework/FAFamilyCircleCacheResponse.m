@interface FAFamilyCircleCacheResponse
- (BOOL)_isFamilyCircleFresh:(id)a3;
- (BOOL)isFamilyCircleFresh;
- (FAFamilyCircle)familyCircle;
- (FAFamilyCircleCacheResponse)initWithFamilyCircle:(id)a3 serverTag:(id)a4 cacheDate:(id)a5 maxAge:(double)a6;
- (NSDate)cacheDate;
- (NSDate)expiration;
- (NSString)serverTag;
- (double)maxAge;
- (id)familyCircleIfFresh;
- (id)familyCircleValidatingAgeWithDate:(id)a3;
- (void)setCacheDate:(id)a3;
- (void)setFamilyCircle:(id)a3;
- (void)setMaxAge:(double)a3;
- (void)setServerTag:(id)a3;
@end

@implementation FAFamilyCircleCacheResponse

- (NSDate)expiration
{
  v3 = [(FAFamilyCircleCacheResponse *)self cacheDate];
  [(FAFamilyCircleCacheResponse *)self maxAge];
  v4 = objc_msgSend(v3, "dateByAddingTimeInterval:");

  return (NSDate *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverTag, 0);
  objc_storeStrong((id *)&self->_cacheDate, 0);
  objc_storeStrong((id *)&self->_familyCircle, 0);
}

- (BOOL)_isFamilyCircleFresh:(id)a3
{
  id v4 = a3;
  v5 = [(FAFamilyCircleCacheResponse *)self expiration];
  id v6 = [v4 compare:v5];

  return v6 != (id)1;
}

- (id)familyCircleIfFresh
{
  v3 = +[NSDate date];
  id v4 = [(FAFamilyCircleCacheResponse *)self familyCircleValidatingAgeWithDate:v3];

  return v4;
}

- (FAFamilyCircle)familyCircle
{
  return self->_familyCircle;
}

- (FAFamilyCircleCacheResponse)initWithFamilyCircle:(id)a3 serverTag:(id)a4 cacheDate:(id)a5 maxAge:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FAFamilyCircleCacheResponse;
  v14 = [(FAFamilyCircleCacheResponse *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_familyCircle, a3);
    objc_storeStrong((id *)&v15->_cacheDate, a5);
    v15->_maxAge = a6;
    objc_storeStrong((id *)&v15->_serverTag, a4);
  }

  return v15;
}

- (double)maxAge
{
  return self->_maxAge;
}

- (id)familyCircleValidatingAgeWithDate:(id)a3
{
  if ([(FAFamilyCircleCacheResponse *)self _isFamilyCircleFresh:a3])
  {
    id v4 = [(FAFamilyCircleCacheResponse *)self familyCircle];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (NSDate)cacheDate
{
  return self->_cacheDate;
}

- (BOOL)isFamilyCircleFresh
{
  v3 = +[NSDate date];
  LOBYTE(self) = [(FAFamilyCircleCacheResponse *)self _isFamilyCircleFresh:v3];

  return (char)self;
}

- (void)setFamilyCircle:(id)a3
{
}

- (void)setCacheDate:(id)a3
{
}

- (void)setMaxAge:(double)a3
{
  self->_maxAge = a3;
}

- (NSString)serverTag
{
  return self->_serverTag;
}

- (void)setServerTag:(id)a3
{
}

@end