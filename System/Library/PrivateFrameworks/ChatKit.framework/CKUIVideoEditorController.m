@interface CKUIVideoEditorController
- (BOOL)preserveModalPresentationStyle;
- (BOOL)wantsWindowedPresentation;
- (void)setPreserveModalPresentationStyle:(BOOL)a3;
- (void)setWantsWindowedPresentation:(BOOL)a3;
@end

@implementation CKUIVideoEditorController

- (BOOL)wantsWindowedPresentation
{
  *((unsigned char *)&self->super._flags + 4) = 1;
  return 1;
}

- (BOOL)preserveModalPresentationStyle
{
  *((unsigned char *)&self->super._flags + 5) = 0;
  return 0;
}

- (void)setWantsWindowedPresentation:(BOOL)a3
{
  *((unsigned char *)&self->super._flags + 4) = a3;
}

- (void)setPreserveModalPresentationStyle:(BOOL)a3
{
  *((unsigned char *)&self->super._flags + 5) = a3;
}

@end