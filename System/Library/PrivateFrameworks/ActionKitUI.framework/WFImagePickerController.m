@interface WFImagePickerController
- (BOOL)accessibilityPerformMagicTap;
- (id)magicTapHandler;
- (void)setMagicTapHandler:(id)a3;
@end

@implementation WFImagePickerController

- (void).cxx_destruct
{
}

- (void)setMagicTapHandler:(id)a3
{
}

- (id)magicTapHandler
{
  return self->_magicTapHandler;
}

- (BOOL)accessibilityPerformMagicTap
{
  v3 = [(WFImagePickerController *)self magicTapHandler];

  if (v3)
  {
    v4 = [(WFImagePickerController *)self magicTapHandler];
    char v5 = v4[2]();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WFImagePickerController;
    return [(WFImagePickerController *)&v7 accessibilityPerformMagicTap];
  }
}

@end