@interface MUAMSResultCache
- (MUAMSResultCache)initWithAppAdamIdCacheCount:(unint64_t)a3 appAdamIdTimeToLive:(unint64_t)a4 bundleIdCacheCount:(unint64_t)a5 bundleIdTimeToLive:(unint64_t)a6;
- (id)amsResultForAdamId:(id)a3;
- (id)amsResultForBundleId:(id)a3;
- (void)setAMSResult:(id)a3 forAdamId:(id)a4;
- (void)setAMSResult:(id)a3 forBundleId:(id)a4;
@end

@implementation MUAMSResultCache

- (MUAMSResultCache)initWithAppAdamIdCacheCount:(unint64_t)a3 appAdamIdTimeToLive:(unint64_t)a4 bundleIdCacheCount:(unint64_t)a5 bundleIdTimeToLive:(unint64_t)a6
{
  v16.receiver = self;
  v16.super_class = (Class)MUAMSResultCache;
  v10 = [(MUAMSResultCache *)&v16 init];
  if (v10)
  {
    v11 = [[MUTimeExpirableLRUCache alloc] initWithMaxSize:a3 timeToLive:(double)a4];
    amsResultsByAdamIds = v10->_amsResultsByAdamIds;
    v10->_amsResultsByAdamIds = v11;

    v13 = [[MUTimeExpirableLRUCache alloc] initWithMaxSize:a5 timeToLive:(double)a6];
    amsResultsByBundleIds = v10->_amsResultsByBundleIds;
    v10->_amsResultsByBundleIds = v13;
  }
  return v10;
}

- (id)amsResultForAdamId:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(MUTimeExpirableLRUCache *)self->_amsResultsByAdamIds objectForKeyedSubscript:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setAMSResult:(id)a3 forAdamId:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v6 length]) {
    [(MUTimeExpirableLRUCache *)self->_amsResultsByAdamIds setObject:v7 forKey:v6];
  }
}

- (id)amsResultForBundleId:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(MUTimeExpirableLRUCache *)self->_amsResultsByBundleIds objectForKeyedSubscript:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setAMSResult:(id)a3 forBundleId:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v6 length]) {
    [(MUTimeExpirableLRUCache *)self->_amsResultsByBundleIds setObject:v7 forKey:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amsResultsByBundleIds, 0);
  objc_storeStrong((id *)&self->_amsResultsByAdamIds, 0);
}

@end