@interface _MXSerialQueue
+ (id)taskCompletionQueue;
+ (id)taskInsertionQueue;
+ (id)taskQueue;
- (_MXSerialQueue)init;
- (void)addTask:(id)a3;
@end

@implementation _MXSerialQueue

- (_MXSerialQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)_MXSerialQueue;
  v2 = [(_MXSerialQueue *)&v6 init];
  if (v2)
  {
    dispatch_group_t v3 = dispatch_group_create();
    previousTaskGroup = v2->_previousTaskGroup;
    v2->_previousTaskGroup = (OS_dispatch_group *)v3;
  }
  return v2;
}

+ (id)taskInsertionQueue
{
  if (_MergedGlobals_169 != -1) {
    dispatch_once(&_MergedGlobals_169, &__block_literal_global_95);
  }
  v2 = (void *)qword_1EB316168;

  return v2;
}

+ (id)taskCompletionQueue
{
  if (qword_1EB316170 != -1) {
    dispatch_once(&qword_1EB316170, &__block_literal_global_3_0);
  }
  v2 = (void *)qword_1EB316178;

  return v2;
}

+ (id)taskQueue
{
  return dispatch_get_global_queue(21, 0);
}

- (void)addTask:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(id)objc_opt_class() taskInsertionQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __26___MXSerialQueue_addTask___block_invoke;
    v6[3] = &unk_1E54B8630;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

- (void).cxx_destruct
{
}

@end