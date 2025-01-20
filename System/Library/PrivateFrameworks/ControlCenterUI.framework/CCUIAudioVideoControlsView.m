@interface CCUIAudioVideoControlsView
- (CCUIAudioVideoControlsView)initWithFrame:(CGRect)a3;
- (CGRect)cachedExpandedRect;
- (void)setBlurRadius:(double)a3;
- (void)setCachedExpandedRect:(CGRect)a3;
@end

@implementation CCUIAudioVideoControlsView

- (CCUIAudioVideoControlsView)initWithFrame:(CGRect)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)CCUIAudioVideoControlsView;
  v3 = -[CCUIAudioVideoControlsView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    v5 = [(CCUIAudioVideoControlsView *)v3 layer];
    v9[0] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v5 setFilters:v6];

    [(SBFView *)v3 setAnimatedLayerProperties:&unk_1F2F4B728];
    [(CCUIAudioVideoControlsView *)v3 setClipsToBounds:0];
  }
  return v3;
}

- (void)setBlurRadius:(double)a3
{
  id v5 = [(CCUIAudioVideoControlsView *)self layer];
  v4 = [NSNumber numberWithDouble:a3];
  [v5 setValue:v4 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

- (CGRect)cachedExpandedRect
{
  double x = self->cachedExpandedRect.origin.x;
  double y = self->cachedExpandedRect.origin.y;
  double width = self->cachedExpandedRect.size.width;
  double height = self->cachedExpandedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCachedExpandedRect:(CGRect)a3
{
  self->cachedExpandedRect = a3;
}

@end