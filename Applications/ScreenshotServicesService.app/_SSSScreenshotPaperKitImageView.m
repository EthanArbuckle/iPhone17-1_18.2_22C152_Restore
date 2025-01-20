@interface _SSSScreenshotPaperKitImageView
- (BOOL)annotationsEnabled;
- (BOOL)editable;
- (BOOL)useTrilinearMinificationFilter;
- (CGSize)sizeMultiplier;
- (CRContext)context;
- (NSString)imageDescription;
- (SSSCropInfo)cropInfo;
- (UIGestureRecognizer)drawingGestureRecognizer;
- (UIImage)image;
- (UIView)rulerHostView;
- (_SSSScreenshotPaperKitImageView)initWithCoder:(id)a3;
- (_SSSScreenshotPaperKitImageView)initWithFrame:(CGRect)a3;
- (_SSSScreenshotPaperKitImageViewDelegate)delegate;
- (double)vellumOpacity;
- (id)generateImageForScreenshot:(id)a3;
- (unint64_t)changeCounter;
- (void)_toolPicker:(id)a3 startEditingOpacityWithAccessoryView:(id)a4;
- (void)cropControllerDidUpdateScrollView:(id)a3;
- (void)cropControllerDidZoomInScrollView:(id)a3;
- (void)deselectAllAnnotations;
- (void)layoutSubviews;
- (void)setAnnotationsEnabled:(BOOL)a3;
- (void)setChangeCounter:(unint64_t)a3;
- (void)setCropInfo:(SSSCropInfo *)a3;
- (void)setDelegate:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setRulerHostView:(id)a3;
- (void)setSizeMultiplier:(CGSize)a3;
- (void)setUseTrilinearMinificationFilter:(BOOL)a3;
- (void)setVellumOpacity:(double)a3;
- (void)toolPickerVisibilityDidChange:(id)a3;
- (void)updateCanvasViewAfterLoadingImage;
- (void)updatePaletteVisibilityIfNecessary:(BOOL)a3;
@end

@implementation _SSSScreenshotPaperKitImageView

- (_SSSScreenshotPaperKitImageViewDelegate)delegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_SSSScreenshotPaperKitImageViewDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (CRContext)context
{
  return (CRContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                              + OBJC_IVAR____SSSScreenshotPaperKitImageView_context));
}

- (double)vellumOpacity
{
  v2 = (double *)((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_vellumOpacity);
  swift_beginAccess();
  return *v2;
}

- (void)setVellumOpacity:(double)a3
{
  v4 = self;
  sub_10005A354(a3);
}

- (UIGestureRecognizer)drawingGestureRecognizer
{
  v3 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController);
  swift_beginAccess();
  v4 = *v3;
  if (v4)
  {
    v5 = self;
    id v6 = v4;
    v7 = (void *)dispatch thunk of CanvasElementViewController.drawingGestureRecognizer.getter();
  }
  else
  {
    v7 = 0;
  }

  return (UIGestureRecognizer *)v7;
}

- (unint64_t)changeCounter
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_changeCounter);
  swift_beginAccess();
  return *v2;
}

- (void)setChangeCounter:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_changeCounter);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (UIImage)image
{
  return (UIImage *)sub_100050ABC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SSSScreenshotPaperKitImageView_image);
}

- (void)setImage:(id)a3
{
  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____SSSScreenshotPaperKitImageView_image);
  swift_beginAccess();
  id v6 = *v5;
  _SSSScreenshotPaperKitImageView *v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_10005A688();
  [(_SSSScreenshotPaperKitImageView *)v8 setNeedsLayout];
  [(_SSSScreenshotPaperKitImageView *)v8 invalidateIntrinsicContentSize];
}

- (SSSCropInfo)cropInfo
{
  v4 = (char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_cropInfo;
  result = (SSSCropInfo *)swift_beginAccess();
  CGPoint v6 = (CGPoint)*((_OWORD *)v4 + 1);
  retstr->totalSize = *(CGSize *)v4;
  retstr->currentRect.origin = v6;
  retstr->currentRect.size = (CGSize)*((_OWORD *)v4 + 2);
  return result;
}

- (void)setCropInfo:(SSSCropInfo *)a3
{
  CGPoint origin = a3->currentRect.origin;
  CGSize totalSize = a3->totalSize;
  CGFloat width = a3->currentRect.size.width;
  CGFloat height = a3->currentRect.size.height;
  CGPoint v6 = (CGPoint *)((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_cropInfo);
  swift_beginAccess();
  *(CGSize *)CGPoint v6 = totalSize;
  v6[1] = origin;
  v6[2].x = width;
  v6[2].y = height;
  [(_SSSScreenshotPaperKitImageView *)self setNeedsLayout];
}

- (CGSize)sizeMultiplier
{
  v2 = (double *)((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_sizeMultiplier);
  swift_beginAccess();
  double v3 = *v2;
  double v4 = v2[1];
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (void)setSizeMultiplier:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  CGPoint v6 = (CGFloat *)((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_sizeMultiplier);
  swift_beginAccess();
  *CGPoint v6 = width;
  v6[1] = height;
  [(_SSSScreenshotPaperKitImageView *)self setNeedsLayout];
}

- (BOOL)useTrilinearMinificationFilter
{
  v2 = (BOOL *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_useTrilinearMinificationFilter;
  swift_beginAccess();
  return *v2;
}

- (void)setUseTrilinearMinificationFilter:(BOOL)a3
{
  v5 = (BOOL *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_useTrilinearMinificationFilter;
  swift_beginAccess();
  BOOL *v5 = a3;
  [(_SSSScreenshotPaperKitImageView *)self setNeedsLayout];
}

- (BOOL)editable
{
  v2 = (BOOL *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_editable;
  swift_beginAccess();
  return *v2;
}

- (void)setEditable:(BOOL)a3
{
  v5 = (BOOL *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_editable;
  swift_beginAccess();
  BOOL *v5 = a3;
  CGPoint v6 = self;
  sub_10005B380();
}

- (_SSSScreenshotPaperKitImageView)initWithFrame:(CGRect)a3
{
  return (_SSSScreenshotPaperKitImageView *)sub_10005B4D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_SSSScreenshotPaperKitImageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10005DFA0();
}

- (void)updatePaletteVisibilityIfNecessary:(BOOL)a3
{
  double v4 = self;
  sub_10005B6CC(a3);
}

- (UIView)rulerHostView
{
  return (UIView *)sub_100050ABC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SSSScreenshotPaperKitImageView_rulerHostView);
}

- (void)setRulerHostView:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_10005E0F8(a3);
}

- (BOOL)annotationsEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_annotationsEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setAnnotationsEnabled:(BOOL)a3
{
  double v4 = self;
  sub_10005BA18(a3);
}

- (void)cropControllerDidZoomInScrollView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10005BAC8(v4);
}

- (void)cropControllerDidUpdateScrollView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10005BD00(v4);
}

- (NSString)imageDescription
{
  id v3 = (NSString *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController);
  swift_beginAccess();
  NSString v4 = *v3;
  if (v4)
  {
    v5 = self;
    id v6 = v4;
    CanvasElementViewController<>.imageDescription.getter();
    uint64_t v8 = v7;

    if (v8)
    {
      NSString v4 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v4 = 0;
    }
  }

  return (NSString *)v4;
}

- (void)deselectAllAnnotations
{
  id v3 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController);
  swift_beginAccess();
  NSString v4 = *v3;
  if (v4)
  {
    v5 = self;
    id v6 = v4;
    uint64_t v7 = dispatch thunk of CanvasElementViewController.canvasView.getter();

    if (v7)
    {
      dispatch thunk of CanvasView.deselectAll()();

      v5 = (_SSSScreenshotPaperKitImageView *)v7;
    }
  }
}

- (void)updateCanvasViewAfterLoadingImage
{
  v2 = self;
  sub_10005C330();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10005D0EC();
}

- (id)generateImageForScreenshot:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = (void *)sub_10005D258(v4);

  return v6;
}

- (void)toolPickerVisibilityDidChange:(id)a3
{
  id v4 = a3;
  id v6 = self;
  if ([v4 isVisible])
  {
    v5 = (char *)v6 + OBJC_IVAR____SSSScreenshotPaperKitImageView_editable;
    swift_beginAccess();
    unsigned char *v5 = 1;
    sub_10005B380();
  }
  else
  {
  }
}

- (void).cxx_destruct
{
  sub_100059C30((uint64_t)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_delegate);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController));
  swift_release();

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SSSScreenshotPaperKitImageView_rulerHostView);
}

- (void)_toolPicker:(id)a3 startEditingOpacityWithAccessoryView:(id)a4
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = (void *)Strong;
    id v9 = a3;
    id v10 = a4;
    v11 = self;
    [v8 _paperKitImageView:v11 startEditingOpacityInAccessoryView:v10];

    swift_unknownObjectRelease();
  }
}

@end