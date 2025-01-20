@interface CPLDefaultValueObjectNil
@end

@implementation CPLDefaultValueObjectNil

BOOL _CPLDefaultValueObjectNil_block_invoke_3(uint64_t a1, void *a2, const char *a3)
{
  id v4 = a2;
  v5 = (objc_class *)objc_opt_class();
  IMP MethodImplementation = class_getMethodImplementation(v5, a3);
  v7 = ((void (*)(id, const char *))MethodImplementation)(v4, a3);

  return v7 == 0;
}

@end