@interface CDMExceptionUtils
+ (void)runWrappingCppExceptions:(id)a3;
@end

@implementation CDMExceptionUtils

+ (void)runWrappingCppExceptions:(id)a3
{
  v3 = (void (**)(void))a3;
  v3[2]();
}

@end