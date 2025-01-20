@interface AXCaptionSubtitlePreviewView
- (NSString)text;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)setText:(id)a3;
- (void)update;
@end

@implementation AXCaptionSubtitlePreviewView

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)AXCaptionSubtitlePreviewView;
  [(AXCaptionSubtitlePreviewView *)&v4 didMoveToWindow];
  v3 = [(AXCaptionSubtitlePreviewView *)self image];

  if (!v3) {
    [(AXCaptionSubtitlePreviewView *)self update];
  }
}

- (void)dealloc
{
  renderer = self->_renderer;
  if (renderer)
  {
    CFRelease(renderer);
    self->_renderer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AXCaptionSubtitlePreviewView;
  [(AXCaptionSubtitlePreviewView *)&v4 dealloc];
}

- (void)update
{
  v3 = [(AXCaptionSubtitlePreviewView *)self window];

  if (v3)
  {
    objc_super v4 = +[UIScreen mainScreen];
    [v4 scale];
    float v6 = v5;

    if (!self->_renderer) {
      FigCoreTextSubtitleRendererCreate();
    }
    v7 = +[UIGraphicsImageRendererFormat preferredFormat];
    id v8 = [v7 copy];

    [v8 setScale:v6];
    id v9 = objc_alloc((Class)UIGraphicsImageRenderer);
    [(AXCaptionSubtitlePreviewView *)self frame];
    id v12 = objc_msgSend(v9, "initWithSize:format:", v8, v10, v11);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __38__AXCaptionSubtitlePreviewView_update__block_invoke;
    v14[3] = &unk_20C068;
    v14[4] = self;
    v13 = [v12 imageWithActions:v14];
    [(AXCaptionSubtitlePreviewView *)self setImage:v13];
  }
}

void __38__AXCaptionSubtitlePreviewView_update__block_invoke(uint64_t a1)
{
  UIGraphicsGetCurrentContext();
  [*(id *)(a1 + 32) bounds];
  id v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:&off_22A890 forKey:kCMTextMarkupAttribute_TextPositionPercentageRelativeToWritingDirection];
  v2 = [*(id *)(a1 + 32) text];
  FigSubtitleRendererDrawSubtitleTextDirect();
}

- (NSString)text
{
  return self->text;
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end