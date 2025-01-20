@interface CIDotScreen
- (id)_kernel;
@end

@implementation CIDotScreen

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_dotscreen];
}

@end