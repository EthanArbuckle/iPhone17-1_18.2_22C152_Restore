@interface BLSSharedWorkloop
+ (id)serialQueueWithQOSClass:(unsigned int)a3 label:(const char *)a4;
+ (id)workloop;
+ (void)dispatchWithQOSClass:(unsigned int)a3 block:(id)a4;
@end

@implementation BLSSharedWorkloop

+ (id)workloop
{
  if (workloop_onceToken != -1) {
    dispatch_once(&workloop_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)_workloop;

  return v2;
}

uint64_t __29__BLSSharedWorkloop_workloop__block_invoke()
{
  _workloop = (uint64_t)dispatch_workloop_create("BLSSharedWorkloop");

  return MEMORY[0x1F41817F8]();
}

+ (void)dispatchWithQOSClass:(unsigned int)a3 block:(id)a4
{
  dispatch_block_t block = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, a4);
  v4 = +[BLSSharedWorkloop workloop];
  dispatch_async(v4, block);
}

+ (id)serialQueueWithQOSClass:(unsigned int)a3 label:(const char *)a4
{
  v5 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a3, 0);
  v6 = +[BLSSharedWorkloop workloop];
  dispatch_queue_t v7 = dispatch_queue_create_with_target_V2(a4, v5, v6);

  return v7;
}

@end