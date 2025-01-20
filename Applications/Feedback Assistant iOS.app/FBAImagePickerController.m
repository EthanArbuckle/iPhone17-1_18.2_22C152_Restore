@interface FBAImagePickerController
- (BOOL)shouldAutorotate;
- (unint64_t)supportedInterfaceOrientations;
@end

@implementation FBAImagePickerController

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

@end