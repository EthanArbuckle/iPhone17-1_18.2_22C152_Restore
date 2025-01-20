@interface GKUIContentUnavailableView
- (id)_titleFont;
@end

@implementation GKUIContentUnavailableView

- (id)_titleFont
{
  v8.receiver = self;
  v8.super_class = (Class)GKUIContentUnavailableView;
  v2 = [(_UIContentUnavailableView *)&v8 _titleFont];
  v3 = (void *)MEMORY[0x1E4FB08E0];
  v4 = [v2 fontDescriptor];
  v5 = [v4 fontDescriptorWithSymbolicTraits:2];
  [v2 pointSize];
  v6 = objc_msgSend(v3, "fontWithDescriptor:size:", v5);

  return v6;
}

@end