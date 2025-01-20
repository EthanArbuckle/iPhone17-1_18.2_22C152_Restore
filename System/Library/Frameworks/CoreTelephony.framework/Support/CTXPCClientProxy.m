@interface CTXPCClientProxy
- (CTXPCClientProxy)initWithRegistry:(const void *)a3 queue:(queue)a4 connection:(id)a5;
- (NSXPCInterface)exportedInterface;
- (NSXPCInterface)remoteInterface;
@end

@implementation CTXPCClientProxy

- (NSXPCInterface)remoteInterface
{
  if (qword_101B0C8D8 != -1) {
    dispatch_once(&qword_101B0C8D8, &stru_1019A3110);
  }
  v2 = (void *)qword_101B0C8D0;

  return (NSXPCInterface *)v2;
}

- (CTXPCClientProxy)initWithRegistry:(const void *)a3 queue:(queue)a4 connection:(id)a5
{
  v5 = *(NSObject **)a4.fObj.fObj;
  *(void *)a4.fObj.fObj = 0;
  v8.receiver = self;
  v8.super_class = (Class)CTXPCClientProxy;
  dispatch_object_t object = v5;
  v6 = [(CTXPCClientHandler *)&v8 initWithRegistry:a3 queue:&object connection:a5];
  if (object) {
    dispatch_release(object);
  }
  return v6;
}

- (NSXPCInterface)exportedInterface
{
  if (qword_101B0C8C8 != -1) {
    dispatch_once(&qword_101B0C8C8, &stru_1019A30F0);
  }
  v2 = (void *)qword_101B0C8C0;

  return (NSXPCInterface *)v2;
}

@end