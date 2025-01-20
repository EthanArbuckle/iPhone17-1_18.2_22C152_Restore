@interface HUPosterFrameViewCache
+ (id)dequeuePosterFrameViewForWidth:(double)a3;
+ (id)sharedCache;
+ (void)enqueuePosterFrameView:(id)a3;
+ (void)purgeCache;
- (HUPosterFrameViewCache)init;
- (NSMutableArray)posterFrameViewQueue;
- (void)setPosterFrameViewQueue:(id)a3;
@end

@implementation HUPosterFrameViewCache

+ (id)sharedCache
{
  if (_MergedGlobals_613 != -1) {
    dispatch_once(&_MergedGlobals_613, &__block_literal_global_15);
  }
  v2 = (void *)qword_1EBA47798;

  return v2;
}

void __37__HUPosterFrameViewCache_sharedCache__block_invoke()
{
  v0 = objc_alloc_init(HUPosterFrameViewCache);
  v1 = (void *)qword_1EBA47798;
  qword_1EBA47798 = (uint64_t)v0;
}

- (HUPosterFrameViewCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)HUPosterFrameViewCache;
  v2 = [(HUPosterFrameViewCache *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    posterFrameViewQueue = v2->_posterFrameViewQueue;
    v2->_posterFrameViewQueue = v3;
  }
  return v2;
}

+ (id)dequeuePosterFrameViewForWidth:(double)a3
{
  v5 = [a1 sharedCache];
  objc_super v6 = [v5 posterFrameViewQueue];
  v7 = [v6 lastObject];

  if (v7)
  {
    v8 = [a1 sharedCache];
    v9 = [v8 posterFrameViewQueue];
    [v9 removeLastObject];

    id v10 = v7;
  }
  else
  {
    id v10 = +[HUPosterFrameView posterFrameViewForWidth:a3];
  }
  v11 = v10;

  return v11;
}

+ (void)enqueuePosterFrameView:(id)a3
{
  id v4 = a3;
  [v4 prepareForReuse];
  id v6 = [a1 sharedCache];
  v5 = [v6 posterFrameViewQueue];
  [v5 addObject:v4];
}

+ (void)purgeCache
{
  id v3 = [a1 sharedCache];
  v2 = [v3 posterFrameViewQueue];
  [v2 removeAllObjects];
}

- (NSMutableArray)posterFrameViewQueue
{
  return self->_posterFrameViewQueue;
}

- (void)setPosterFrameViewQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end