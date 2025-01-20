@interface CPLDefaultValueNSINTEGER0
@end

@implementation CPLDefaultValueNSINTEGER0

BOOL _CPLDefaultValueNSINTEGER0_block_invoke_2(uint64_t a1, void *a2, const char *a3)
{
  id v4 = a2;
  v5 = (objc_class *)objc_opt_class();
  IMP MethodImplementation = class_getMethodImplementation(v5, a3);
  uint64_t v7 = ((uint64_t (*)(id, const char *))MethodImplementation)(v4, a3);

  return v7 == 0;
}

@end