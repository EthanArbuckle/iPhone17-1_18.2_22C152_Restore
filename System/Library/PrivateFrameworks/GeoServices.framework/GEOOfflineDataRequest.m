@interface GEOOfflineDataRequest
- (void)initWithKey:(uint64_t)a3 version:(void *)a4 url:(uint64_t)a5 expectedSizeInBytes:;
@end

@implementation GEOOfflineDataRequest

- (void)initWithKey:(uint64_t)a3 version:(void *)a4 url:(uint64_t)a5 expectedSizeInBytes:
{
  id v10 = a2;
  id v11 = a4;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)GEOOfflineDataRequest;
    id v12 = objc_msgSendSuper2(&v16, sel_init);
    a1 = v12;
    if (v12)
    {
      objc_storeStrong((id *)v12 + 1, a2);
      a1[3] = a5;
      a1[4] = a3;
      uint64_t v13 = [v11 copy];
      v14 = (void *)a1[2];
      a1[2] = v13;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end