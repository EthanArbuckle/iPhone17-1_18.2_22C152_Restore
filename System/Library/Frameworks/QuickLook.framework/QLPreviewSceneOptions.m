@interface QLPreviewSceneOptions
- (NSInteger)initialPreviewIndex;
- (void)setInitialPreviewIndex:(NSInteger)initialPreviewIndex;
@end

@implementation QLPreviewSceneOptions

- (NSInteger)initialPreviewIndex
{
  return self->_initialPreviewIndex;
}

- (void)setInitialPreviewIndex:(NSInteger)initialPreviewIndex
{
  self->_initialPreviewIndex = initialPreviewIndex;
}

@end