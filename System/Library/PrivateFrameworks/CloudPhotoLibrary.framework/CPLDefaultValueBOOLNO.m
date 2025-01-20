@interface CPLDefaultValueBOOLNO
@end

@implementation CPLDefaultValueBOOLNO

uint64_t _CPLDefaultValueBOOLNO_block_invoke(uint64_t a1, void *a2, const char *a3)
{
  id v4 = a2;
  v5 = (objc_class *)objc_opt_class();
  IMP MethodImplementation = class_getMethodImplementation(v5, a3);
  LODWORD(a3) = ((uint64_t (*)(id, const char *))MethodImplementation)(v4, a3);

  return a3 ^ 1;
}

@end