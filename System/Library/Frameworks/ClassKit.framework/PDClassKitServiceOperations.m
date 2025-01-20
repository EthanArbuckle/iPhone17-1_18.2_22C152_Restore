@interface PDClassKitServiceOperations
- (PDClassKitServiceOperations)init;
- (PDClassKitServiceOperationsObjC)objcClient;
- (void)setObjcClient:(id)a3;
@end

@implementation PDClassKitServiceOperations

- (PDClassKitServiceOperations)init
{
  v6.receiver = self;
  v6.super_class = (Class)PDClassKitServiceOperations;
  v2 = [(PDClassKitServiceOperations *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(PDClassKitServiceOperationsObjC);
    objcClient = v2->_objcClient;
    v2->_objcClient = v3;
  }
  return v2;
}

- (PDClassKitServiceOperationsObjC)objcClient
{
  return self->_objcClient;
}

- (void)setObjcClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end