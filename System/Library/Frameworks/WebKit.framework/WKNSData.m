@interface WKNSData
- (Object)_apiObject;
- (const)bytes;
- (unint64_t)length;
- (void)dealloc;
@end

@implementation WKNSData

- (Object)_apiObject
{
  return (Object *)&self->_data;
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(void))self->_data.data.__lx)();
    v4.receiver = self;
    v4.super_class = (Class)WKNSData;
    [(WKNSData *)&v4 dealloc];
  }
}

- (unint64_t)length
{
  return *(void *)&self->_data.data.__lx[24];
}

- (const)bytes
{
  return *(const void **)&self->_data.data.__lx[16];
}

@end