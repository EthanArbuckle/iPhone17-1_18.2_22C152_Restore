@interface CIColorKernel
+ (id)PFKernelWithString:(id)a3;
@end

@implementation CIColorKernel

+ (id)PFKernelWithString:(id)a3
{
  if (qword_8CB70 != -1) {
    dispatch_once(&qword_8CB70, &stru_74F60);
  }
  uint64_t v4 = qword_8CB68;

  return +[CIColorKernel kernelWithString:a3 fromMetalLibraryData:v4];
}

@end