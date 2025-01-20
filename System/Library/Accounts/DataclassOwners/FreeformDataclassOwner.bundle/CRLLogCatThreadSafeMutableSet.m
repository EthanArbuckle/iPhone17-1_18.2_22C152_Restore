@interface CRLLogCatThreadSafeMutableSet
- (BOOL)containsObject:(id)a3;
- (CRLLogCatThreadSafeMutableSet)init;
- (CRLLogCatThreadSafeMutableSet)initWithArray:(id)a3;
- (id)allObjects;
- (id)description;
- (id)immutableSet;
- (unint64_t)count;
- (void)addObject:(id)a3;
- (void)removeObject:(id)a3;
@end

@implementation CRLLogCatThreadSafeMutableSet

- (CRLLogCatThreadSafeMutableSet)initWithArray:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLLogCatThreadSafeMutableSet;
  v5 = [(CRLLogCatThreadSafeMutableSet *)&v12 init];
  if (v5)
  {
    v6 = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithArray:v4];
    objects = v5->_objects;
    v5->_objects = v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("CRLLogCatQueue", v8);
    logCatQueue = v5->_logCatQueue;
    v5->_logCatQueue = (OS_dispatch_queue *)v9;
  }
  return v5;
}

- (CRLLogCatThreadSafeMutableSet)init
{
  v3 = +[NSArray array];
  id v4 = [(CRLLogCatThreadSafeMutableSet *)self initWithArray:v3];

  return v4;
}

- (BOOL)containsObject:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  logCatQueue = self->_logCatQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__CRLLogCatThreadSafeMutableSet_containsObject___block_invoke;
  block[3] = &unk_28908;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)logCatQueue, block);
  LOBYTE(logCatQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)logCatQueue;
}

id __48__CRLLogCatThreadSafeMutableSet_containsObject___block_invoke(void *a1)
{
  id result = [*(id *)(a1[4] + 8) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)result;
  return result;
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  logCatQueue = self->_logCatQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __38__CRLLogCatThreadSafeMutableSet_count__block_invoke;
  v5[3] = &unk_28930;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)logCatQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __38__CRLLogCatThreadSafeMutableSet_count__block_invoke(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)allObjects
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  logCatQueue = self->_logCatQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __43__CRLLogCatThreadSafeMutableSet_allObjects__block_invoke;
  v5[3] = &unk_28930;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)logCatQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __43__CRLLogCatThreadSafeMutableSet_allObjects__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) allObjects];
  return _objc_release_x1();
}

- (id)immutableSet
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  logCatQueue = self->_logCatQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __45__CRLLogCatThreadSafeMutableSet_immutableSet__block_invoke;
  v5[3] = &unk_28930;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)logCatQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __45__CRLLogCatThreadSafeMutableSet_immutableSet__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[NSSet setWithSet:*(void *)(*(void *)(a1 + 32) + 8)];
  return _objc_release_x1();
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  logCatQueue = self->_logCatQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __43__CRLLogCatThreadSafeMutableSet_addObject___block_invoke;
  v7[3] = &unk_28958;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)logCatQueue, v7);
}

id __43__CRLLogCatThreadSafeMutableSet_addObject___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

- (void)removeObject:(id)a3
{
  id v4 = a3;
  logCatQueue = self->_logCatQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __46__CRLLogCatThreadSafeMutableSet_removeObject___block_invoke;
  v7[3] = &unk_28958;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)logCatQueue, v7);
}

id __46__CRLLogCatThreadSafeMutableSet_removeObject___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

- (id)description
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  logCatQueue = self->_logCatQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __44__CRLLogCatThreadSafeMutableSet_description__block_invoke;
  v5[3] = &unk_28930;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)logCatQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __44__CRLLogCatThreadSafeMutableSet_description__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) description];
  return _objc_release_x1();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logCatQueue, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

@end