@interface ASDDispatchQueue
+ (ASDDispatchQueue)defaultQueue;
- (ASDDispatchQueue)init;
- (ASDDispatchQueue)initWithName:(id)a3;
- (ASDDispatchQueue)initWithQueue:(id)a3;
- (void)assertQueue;
- (void)asyncUsingBlock:(id)a3;
- (void)syncUsingBlock:(id)a3;
@end

@implementation ASDDispatchQueue

- (void)syncUsingBlock:(id)a3
{
}

- (void)asyncUsingBlock:(id)a3
{
}

+ (ASDDispatchQueue)defaultQueue
{
  if (_MergedGlobals_41 != -1) {
    dispatch_once(&_MergedGlobals_41, &__block_literal_global_16);
  }
  v2 = (void *)qword_1EB4D6558;
  return (ASDDispatchQueue *)v2;
}

uint64_t __32__ASDDispatchQueue_defaultQueue__block_invoke()
{
  qword_1EB4D6558 = objc_alloc_init(ASDDispatchQueue);
  return MEMORY[0x1F41817F8]();
}

- (ASDDispatchQueue)init
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = dispatch_get_global_queue(21, 0);
  dispatch_queue_t v5 = dispatch_queue_create_with_target_V2("com.apple.appstored.DispatchQueue.default", v3, v4);
  v6 = [(ASDDispatchQueue *)self initWithQueue:v5];

  return v6;
}

- (ASDDispatchQueue)initWithName:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v13];

  id v7 = v6;
  v8 = (const char *)[v7 UTF8String];
  v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
  v11 = [(ASDDispatchQueue *)self initWithQueue:v10];

  return v11;
}

- (ASDDispatchQueue)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDDispatchQueue;
  v6 = [(ASDDispatchQueue *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)assertQueue
{
}

- (void).cxx_destruct
{
}

@end