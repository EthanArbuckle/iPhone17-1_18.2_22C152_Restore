@interface ENAuthCacheEntry
+ (ENAuthCacheEntry)entryWithResult:(id)a3;
- (BOOL)isValid;
- (EDAMAuthenticationResult)authResult;
- (NSDate)cachedDate;
- (void)setAuthResult:(id)a3;
- (void)setCachedDate:(id)a3;
@end

@implementation ENAuthCacheEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDate, 0);
  objc_storeStrong((id *)&self->_authResult, 0);
}

- (void)setCachedDate:(id)a3
{
}

- (NSDate)cachedDate
{
  return self->_cachedDate;
}

- (void)setAuthResult:(id)a3
{
}

- (EDAMAuthenticationResult)authResult
{
  return self->_authResult;
}

- (BOOL)isValid
{
  v3 = [(ENAuthCacheEntry *)self cachedDate];
  [v3 timeIntervalSinceNow];
  double v5 = fabs(v4);

  v6 = [(ENAuthCacheEntry *)self authResult];
  v7 = [v6 expiration];
  uint64_t v8 = [v7 longLongValue];
  v9 = [(ENAuthCacheEntry *)self authResult];
  v10 = [v9 currentTime];
  uint64_t v11 = (v8 - [v10 longLongValue]) / 1000;

  return v5 <= (double)v11 * 0.9;
}

+ (ENAuthCacheEntry)entryWithResult:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    double v4 = objc_alloc_init(ENAuthCacheEntry);
    [(ENAuthCacheEntry *)v4 setAuthResult:v3];

    double v5 = [MEMORY[0x263EFF910] date];
    [(ENAuthCacheEntry *)v4 setCachedDate:v5];
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

@end