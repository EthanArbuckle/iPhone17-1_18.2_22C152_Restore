@interface ENCypher
+ (id)_queue;
+ (id)registeredCypherClasses;
+ (void)registerCypherClass:(Class)a3;
@end

@implementation ENCypher

+ (void)registerCypherClass:(Class)a3
{
  v4 = [a1 _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DD45DA04;
  block[3] = &unk_1E6CC4F80;
  block[4] = a3;
  dispatch_barrier_async(v4, block);
}

+ (id)registeredCypherClasses
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1DD45DB28;
  v10 = sub_1DD45DB38;
  id v11 = 0;
  v2 = [a1 _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DD45DB40;
  block[3] = &unk_1E6CC4FA8;
  block[4] = &v6;
  dispatch_sync(v2, block);

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (id)_queue
{
  if (qword_1EAB21C98 != -1) {
    dispatch_once(&qword_1EAB21C98, &unk_1F38A4320);
  }
  v2 = (void *)qword_1EAB21CA0;
  return v2;
}

@end