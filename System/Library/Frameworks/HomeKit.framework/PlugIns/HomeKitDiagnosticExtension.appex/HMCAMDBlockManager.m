@interface HMCAMDBlockManager
- (HMCAMDBlockManager)initWithService:(id)a3;
- (id)blockForKey:(id)a3;
- (id)forwardingBlockWithArgumentCount:(unint64_t)a3 forKey:(id)a4;
- (id)keyForBlock:(id)a3;
- (unint64_t)count;
- (void)addBlock:(id)a3 forKey:(id)a4;
- (void)addBlockNoCopy:(id)a3 forKey:(id)a4;
- (void)invokeForwardedBlockWithArguments:(id)a3 forKey:(id)a4;
- (void)removeBlock:(id)a3;
- (void)removeBlockForKey:(id)a3;
@end

@implementation HMCAMDBlockManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_blockHandlerMap, 0);
}

- (id)forwardingBlockWithArgumentCount:(unint64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  v7 = +[NSNull null];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100016668;
  v33[3] = &unk_10002CB20;
  v33[4] = self;
  id v8 = v6;
  id v34 = v8;
  v9 = objc_retainBlock(v33);
  v10 = v9;
  switch(a3)
  {
    case 0uLL:
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100016724;
      v31[3] = &unk_10002CB48;
      v11 = (id *)&v32;
      v32 = v9;
      v12 = objc_retainBlock(v31);
      goto LABEL_10;
    case 1uLL:
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100016738;
      v28[3] = &unk_10002CB70;
      v11 = (id *)&v30;
      v30 = v9;
      id v29 = v7;
      v12 = objc_retainBlock(v28);
      v13 = v29;
      goto LABEL_9;
    case 2uLL:
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000167E8;
      v25[3] = &unk_10002CB98;
      v11 = (id *)&v27;
      v27 = v9;
      id v26 = v7;
      v12 = objc_retainBlock(v25);
      v13 = v26;
      goto LABEL_9;
    case 3uLL:
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000168B8;
      v22[3] = &unk_10002CBC0;
      v11 = (id *)&v24;
      v24 = v9;
      id v23 = v7;
      v12 = objc_retainBlock(v22);
      v13 = v23;
      goto LABEL_9;
    case 4uLL:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000169B0;
      v19[3] = &unk_10002CBE8;
      v11 = (id *)&v21;
      v21 = v9;
      id v20 = v7;
      v12 = objc_retainBlock(v19);
      v13 = v20;
      goto LABEL_9;
    case 5uLL:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100016AC8;
      v16[3] = &unk_10002CC10;
      v11 = (id *)&v18;
      v18 = v9;
      id v17 = v7;
      v12 = objc_retainBlock(v16);
      v13 = v17;
LABEL_9:

LABEL_10:
      break;
    default:
      v12 = 0;
      break;
  }
  id v14 = [v12 copy];

  return v14;
}

- (void)invokeForwardedBlockWithArguments:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  v7 = [(NSMutableDictionary *)self->_blockHandlerMap objectForKey:a4];
  id v8 = v7;
  if (v7)
  {
    v9 = +[NSMethodSignature signatureWithObjCTypes:_Block_signature(v7)];
    id v10 = [v9 numberOfArguments];
    v11 = +[NSInvocation invocationWithMethodSignature:v9];
    if ((unint64_t)v10 >= 2)
    {
      for (uint64_t i = 1; (id)i != v10; ++i)
      {
        v13 = [v6 objectAtIndex:i - 1];
        id v16 = v13;
        id v14 = +[NSNull null];

        if (v13 == v14)
        {
          id v15 = v16;
          id v16 = 0;
        }
        [v11 setArgument:&v16 atIndex:i];
      }
    }
    [v11 setTarget:v8];
    [v11 invoke];
  }
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableDictionary *)self->_blockHandlerMap count];
}

- (id)keyForBlock:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10001701C;
  id v16 = sub_10001702C;
  id v17 = 0;
  blockHandlerMap = self->_blockHandlerMap;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100017034;
  v9[3] = &unk_10002CAD0;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [(NSMutableDictionary *)blockHandlerMap enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)blockForKey:(id)a3
{
  return [(NSMutableDictionary *)self->_blockHandlerMap objectForKey:a3];
}

- (void)removeBlockForKey:(id)a3
{
}

- (void)removeBlock:(id)a3
{
  id v4 = [(HMCAMDBlockManager *)self keyForBlock:a3];
  if (v4)
  {
    [(HMCAMDBlockManager *)self removeBlockForKey:v4];
    blockQueue = self->_blockQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001717C;
    v6[3] = &unk_10002CDC0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(blockQueue, v6);
  }
}

- (void)addBlock:(id)a3 forKey:(id)a4
{
  blockHandlerMap = self->_blockHandlerMap;
  id v6 = a4;
  id v7 = [a3 copy];
  [(NSMutableDictionary *)blockHandlerMap setObject:v7 forKey:v6];
}

- (void)addBlockNoCopy:(id)a3 forKey:(id)a4
{
  if (a3) {
    [(NSMutableDictionary *)self->_blockHandlerMap setObject:a3 forKey:a4];
  }
}

- (HMCAMDBlockManager)initWithService:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMCAMDBlockManager;
  id v6 = [(HMCAMDBlockManager *)&v14 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_service, a3);
    uint64_t v8 = objc_opt_new();
    blockHandlerMap = v7->_blockHandlerMap;
    v7->_blockHandlerMap = (NSMutableDictionary *)v8;

    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.homed.xpc.HMDCAMDBlockManager.blockQueue", v10);
    blockQueue = v7->_blockQueue;
    v7->_blockQueue = (OS_dispatch_queue *)v11;
  }
  return v7;
}

@end