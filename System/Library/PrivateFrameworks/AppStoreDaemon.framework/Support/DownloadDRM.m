@interface DownloadDRM
- (DownloadDRM)init;
@end

@implementation DownloadDRM

- (DownloadDRM)init
{
  v2 = self;
  if (self)
  {
    v15.receiver = self;
    v15.super_class = (Class)DownloadDRM;
    v2 = [(DownloadDRM *)&v15 init];
    if (v2)
    {
      v3 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v4 = [0 countByEnumeratingWithState:&v11 objects:v16 count:16];
      if (v4)
      {
        id v5 = v4;
        uint64_t v6 = *(void *)v12;
        do
        {
          v7 = 0;
          do
          {
            if (*(void *)v12 != v6) {
              objc_enumerationMutation(0);
            }
            v8 = sub_1004234FC([DownloadSinf alloc], *(void **)(*((void *)&v11 + 1) + 8 * (void)v7));
            if (v8) {
              [(NSArray *)v3 addObject:v8];
            }

            v7 = (char *)v7 + 1;
          }
          while (v5 != v7);
          id v5 = [0 countByEnumeratingWithState:&v11 objects:v16 count:16];
        }
        while (v5);
      }
      sinfs = v2->_sinfs;
      v2->_sinfs = v3;
    }
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end