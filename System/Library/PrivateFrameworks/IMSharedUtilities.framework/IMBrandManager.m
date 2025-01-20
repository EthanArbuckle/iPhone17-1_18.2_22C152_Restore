@interface IMBrandManager
+ (id)sharedInstance;
- (BSUIBrandManager)chatBotBrandManager;
- (BSUIBrandManager)mapKitBrandManager;
- (NSOperationQueue)brandFetchQueue;
- (id)_init;
- (id)brandManagerForType:(unint64_t)a3;
- (void)brandWithURI:(id)a3 completion:(id)a4;
- (void)brandWithURI:(id)a3 forType:(unint64_t)a4 completion:(id)a5;
- (void)setBrandFetchQueue:(id)a3;
- (void)setChatBotBrandManager:(id)a3;
- (void)setMapKitBrandManager:(id)a3;
@end

@implementation IMBrandManager

+ (id)sharedInstance
{
  if (qword_1EB4A6588 != -1) {
    dispatch_once(&qword_1EB4A6588, &unk_1EF2BFA40);
  }
  v2 = (void *)qword_1EB4A6018;

  return v2;
}

- (id)_init
{
  v18.receiver = self;
  v18.super_class = (Class)IMBrandManager;
  v2 = [(IMBrandManager *)&v18 init];
  if (v2)
  {
    int v3 = [(id)qword_1E94FFAB0 instancesRespondToSelector:sel_initWithCachingEnabled_cacheURL_];
    id v4 = objc_alloc((Class)qword_1E94FFAB0);
    uint64_t v5 = IMIsRunningInMessages();
    if (v3)
    {
      v6 = IMCachesDirectoryURL();
      uint64_t v7 = [v4 initWithCachingEnabled:v5 cacheURL:v6];
      mapKitBrandManager = v2->_mapKitBrandManager;
      v2->_mapKitBrandManager = (BSUIBrandManager *)v7;
    }
    else
    {
      uint64_t v9 = [v4 initWithCachingEnabled:v5];
      v6 = v2->_mapKitBrandManager;
      v2->_mapKitBrandManager = (BSUIBrandManager *)v9;
    }

    v10 = +[IMFeatureFlags sharedFeatureFlags];
    int v11 = [v10 isLazuliEnabled];

    if (v11)
    {
      uint64_t v12 = [objc_alloc((Class)qword_1E94FFAB0) initWithBrandType:0 cachingEnabled:IMIsRunningInMessages()];
      chatBotBrandManager = v2->_chatBotBrandManager;
      v2->_chatBotBrandManager = (BSUIBrandManager *)v12;
    }
    v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    brandFetchQueue = v2->_brandFetchQueue;
    v2->_brandFetchQueue = v14;

    v16 = dispatch_get_global_queue(33, 0);
    [(NSOperationQueue *)v2->_brandFetchQueue setUnderlyingQueue:v16];

    [(NSOperationQueue *)v2->_brandFetchQueue setMaxConcurrentOperationCount:1];
  }
  return v2;
}

- (id)brandManagerForType:(unint64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v4 = 8;
  }
  else
  {
    if (a3 != 2) {
      goto LABEL_6;
    }
    uint64_t v4 = 16;
  }
  a2 = (SEL)*(id *)((char *)&self->super.isa + v4);
LABEL_6:
  return (id)(id)a2;
}

- (void)brandWithURI:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  if (MEMORY[0x1A62278A0]()) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  [(IMBrandManager *)self brandWithURI:v8 forType:v7 completion:v6];
}

- (void)brandWithURI:(id)a3 forType:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  brandFetchQueue = self->_brandFetchQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1A084A73C;
  v13[3] = &unk_1E5A139C8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  [(NSOperationQueue *)brandFetchQueue addOperationWithBlock:v13];
}

- (BSUIBrandManager)mapKitBrandManager
{
  return self->_mapKitBrandManager;
}

- (void)setMapKitBrandManager:(id)a3
{
}

- (BSUIBrandManager)chatBotBrandManager
{
  return self->_chatBotBrandManager;
}

- (void)setChatBotBrandManager:(id)a3
{
}

- (NSOperationQueue)brandFetchQueue
{
  return self->_brandFetchQueue;
}

- (void)setBrandFetchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandFetchQueue, 0);
  objc_storeStrong((id *)&self->_chatBotBrandManager, 0);

  objc_storeStrong((id *)&self->_mapKitBrandManager, 0);
}

@end