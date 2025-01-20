@interface CNObjCRuntimeAPI
+ (void)enumerateMethodsOfClass:(Class)a3 withBlock:(id)a4;
@end

@implementation CNObjCRuntimeAPI

+ (void)enumerateMethodsOfClass:(Class)a3 withBlock:(id)a4
{
  v5 = (void (**)(id, void))a4;
  if (a3)
  {
    unsigned int outCount = 0;
    v6 = class_copyMethodList(a3, &outCount);
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; ((void (**)(id, Method))v5)[2](v5, v6[i++]))
        ;
    }
    free(v6);
  }
}

@end