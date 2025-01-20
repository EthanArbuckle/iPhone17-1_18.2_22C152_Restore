@interface OCSharedLoggable
- (OCSharedLoggable)initWithName:(const char *)a3 qosClass:(unsigned int)a4 logContext:(OsLogContext)a5;
- (OCSharedLoggable)initWithQueue:(queue)a3 logContext:(OsLogContext)a4;
- (OsLogContext)getLogContext;
- (id).cxx_construct;
- (queue)getQueue;
- (void)executeBlock:(id)a3;
- (void)executeFunction:(function<void)(;
- (void)setLogContext:(OsLogContext)a3;
- (void)setQueue:(queue)a3;
@end

@implementation OCSharedLoggable

- (OsLogContext)getLogContext
{
  v3 = (char *)ctu::OsLogContext::OsLogContext(v2, (const ctu::OsLogContext *)&self->_logContext);
  result.handle.fRef = v4;
  result.domain = v3;
  return result;
}

- (queue)getQueue
{
  fObj = self->_queue.fObj.fObj;
  ctu::OsLogContext *v2 = fObj;
  if (fObj) {
    dispatch_retain(fObj);
  }
  return (queue)fObj;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (OCSharedLoggable)initWithQueue:(queue)a3 logContext:(OsLogContext)a4
{
  v10.receiver = self;
  v10.super_class = (Class)OCSharedLoggable;
  v5 = [(OCSharedLoggable *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v7 = *(dispatch_object_s **)a3.fObj.fObj;
    *(void *)a3.fObj.fObj = 0;
    fObj = v5->_queue.fObj.fObj;
    v6->_queue.fObj.fObj = v7;
    if (fObj) {
      dispatch_release(fObj);
    }
    ctu::OsLogContext::operator=();
  }
  return v6;
}

- (void)executeFunction:(function<void)(
{
}

- (void).cxx_destruct
{
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&self->_logContext);
  fObj = self->_queue.fObj.fObj;
  if (fObj)
  {
    dispatch_release(fObj);
  }
}

- (OCSharedLoggable)initWithName:(const char *)a3 qosClass:(unsigned int)a4 logContext:(OsLogContext)a5
{
  domain = a5.domain;
  v8 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a4, 0);
  dispatch_object_t object = dispatch_queue_create(a3, v8);
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v11, (const ctu::OsLogContext *)domain);
  v9 = [(OCSharedLoggable *)self initWithQueue:&object logContext:v11];
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v11);
  if (object) {
    dispatch_release(object);
  }
  return v9;
}

- (void)executeBlock:(id)a3
{
}

- (void)setQueue:(queue)a3
{
  v4 = *(dispatch_object_s **)a3.fObj.fObj;
  if (*(void *)a3.fObj.fObj) {
    dispatch_retain(*(dispatch_object_t *)a3.fObj.fObj);
  }
  fObj = self->_queue.fObj.fObj;
  self->_queue.fObj.fObj = v4;
  if (fObj)
  {
    dispatch_release(fObj);
  }
}

- (void)setLogContext:(OsLogContext)a3
{
}

@end