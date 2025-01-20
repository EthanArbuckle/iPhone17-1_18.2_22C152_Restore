@interface _SSSScreenshotPaperKitPDFView
- (BOOL)editable;
- (BOOL)isCropping;
- (BOOL)screenshotEditsSnapshotted;
- (CGRect)currentPageBounds;
- (CGRect)currentPageUnitCropRect;
- (CGSize)intrinsicContentSize;
- (CRContext)context;
- (NSData)pdfData;
- (PDFDocument)cachedRenderedPDFDocument;
- (PDFView)pdfView;
- (PKToolPicker)toolPicker;
- (SSSScreenshot)screenshot;
- (UIView)rulerHostView;
- (_SSSScreenshotContentOverlayController)overlayController;
- (_SSSScreenshotPaperKitPDFView)initWithCoder:(id)a3;
- (_SSSScreenshotPaperKitPDFView)initWithFrame:(CGRect)a3;
- (_SSSScreenshotPaperKitPDFView)viewWithScreenshotImage;
- (_SSSScreenshotPaperKitPDFViewDelegate)delegate;
- (_TtC8PaperKit17PaperDocumentView)paperDocumentView;
- (double)leftRightMargin;
- (double)vellumOpacity;
- (id)documentFromPDFData:(id)a3;
- (unint64_t)changeCounter;
- (void)_toolPicker:(id)a3 startEditingOpacityWithAccessoryView:(id)a4;
- (void)deselectAllAnnotations;
- (void)layoutSubviews;
- (void)setCachedRenderedPDFDocument:(id)a3;
- (void)setChangeCounter:(unint64_t)a3;
- (void)setCurrentPageUnitCropRect:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)setIsCropping:(BOOL)a3;
- (void)setPaperDocumentView:(id)a3;
- (void)setPdfData:(id)a3;
- (void)setRulerHostView:(id)a3;
- (void)setScreenshot:(id)a3;
- (void)setScreenshotEditsSnapshotted:(BOOL)a3;
- (void)setVellumOpacity:(double)a3;
- (void)setupDocumentViewController;
- (void)updateCurrentPageCropRect:(CGRect)a3;
- (void)updatePDFViewZoomParameters;
- (void)updatePaletteVisibilityIfNecessary:(BOOL)a3;
@end

@implementation _SSSScreenshotPaperKitPDFView

- (_SSSScreenshotPaperKitPDFViewDelegate)delegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_SSSScreenshotPaperKitPDFViewDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (double)leftRightMargin
{
  return 100.0;
}

- (CRContext)context
{
  return (CRContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                              + OBJC_IVAR____SSSScreenshotPaperKitPDFView_context));
}

- (BOOL)screenshotEditsSnapshotted
{
  v2 = (BOOL *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_screenshotEditsSnapshotted;
  swift_beginAccess();
  return *v2;
}

- (void)setScreenshotEditsSnapshotted:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_screenshotEditsSnapshotted;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (_TtC8PaperKit17PaperDocumentView)paperDocumentView
{
  return (_TtC8PaperKit17PaperDocumentView *)sub_100050ABC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView);
}

- (void)setPaperDocumentView:(id)a3
{
}

- (PDFDocument)cachedRenderedPDFDocument
{
  return (PDFDocument *)sub_100050ABC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SSSScreenshotPaperKitPDFView_cachedRenderedPDFDocument);
}

- (void)setCachedRenderedPDFDocument:(id)a3
{
}

- (PKToolPicker)toolPicker
{
  return (PKToolPicker *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_toolPicker));
}

- (NSData)pdfData
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData);
  swift_beginAccess();
  Class isa = 0;
  unint64_t v4 = v2[1];
  if (v4 >> 60 != 15)
  {
    uint64_t v5 = *v2;
    sub_10004FA78(v5, v4);
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10004FB64(v5, v4);
  }

  return (NSData *)isa;
}

- (void)setPdfData:(id)a3
{
  v3 = a3;
  if (a3)
  {
    uint64_t v5 = self;
    id v6 = v3;
    v3 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v8 = v7;
  }
  else
  {
    v9 = self;
    unint64_t v8 = 0xF000000000000000;
  }
  v10 = (uint64_t *)((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData);
  swift_beginAccess();
  uint64_t v11 = *v10;
  unint64_t v12 = v10[1];
  uint64_t *v10 = (uint64_t)v3;
  v10[1] = v8;
  sub_10004FB64(v11, v12);
}

- (PDFView)pdfView
{
  v3 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView);
  swift_beginAccess();
  unint64_t v4 = *v3;
  if (v4)
  {
    uint64_t v5 = self;
    id v6 = v4;
    unint64_t v7 = (void *)dispatch thunk of PaperDocumentView.pdfView.getter();
  }
  else
  {
    unint64_t v7 = 0;
  }

  return (PDFView *)v7;
}

- (double)vellumOpacity
{
  v2 = (double *)((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_vellumOpacity);
  swift_beginAccess();
  return *v2;
}

- (void)setVellumOpacity:(double)a3
{
  unint64_t v4 = self;
  sub_10004FD04(a3);
}

- (SSSScreenshot)screenshot
{
  return (SSSScreenshot *)sub_100050ABC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SSSScreenshotPaperKitPDFView_screenshot);
}

- (void)setScreenshot:(id)a3
{
  uint64_t v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____SSSScreenshotPaperKitPDFView_screenshot);
  swift_beginAccess();
  id v6 = *v5;
  *uint64_t v5 = a3;
  id v7 = a3;
  unint64_t v8 = self;

  sub_10004FE4C();
}

- (_SSSScreenshotPaperKitPDFView)viewWithScreenshotImage
{
  return (_SSSScreenshotPaperKitPDFView *)sub_100050ABC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView);
}

- (_SSSScreenshotContentOverlayController)overlayController
{
  return (_SSSScreenshotContentOverlayController *)0;
}

- (BOOL)isCropping
{
  v2 = (BOOL *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_isCropping;
  swift_beginAccess();
  return *v2;
}

- (void)setIsCropping:(BOOL)a3
{
  uint64_t v5 = (BOOL *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_isCropping;
  swift_beginAccess();
  *uint64_t v5 = a3;
  id v6 = self;
  sub_100050904();
}

- (UIView)rulerHostView
{
  return (UIView *)sub_100050ABC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SSSScreenshotPaperKitPDFView_rulerHostView);
}

- (void)setRulerHostView:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_100057F2C(a3);
}

- (void)updateCurrentPageCropRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = self;
  sub_100050B60(x, y, width, height);
}

- (CGRect)currentPageUnitCropRect
{
  double v2 = sub_100052AE8(self, (uint64_t)a2, sub_100051530);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setCurrentPageUnitCropRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = self;
  sub_100050B60(x, y, width, height);
}

- (CGRect)currentPageBounds
{
  double v2 = sub_100052AE8(self, (uint64_t)a2, sub_100051E60);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2 = self;
  double v3 = sub_100052B90();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void)updatePDFViewZoomParameters
{
  double v2 = self;
  sub_100050904();
}

- (unint64_t)changeCounter
{
  double v2 = (unint64_t *)((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_changeCounter);
  swift_beginAccess();
  return *v2;
}

- (void)setChangeCounter:(unint64_t)a3
{
  double v4 = (unint64_t *)((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_changeCounter);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (void)updatePaletteVisibilityIfNecessary:(BOOL)a3
{
  double v4 = self;
  sub_100052E40(a3);
}

- (BOOL)editable
{
  double v2 = (BOOL *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_editable;
  swift_beginAccess();
  return *v2;
}

- (void)setEditable:(BOOL)a3
{
  double v4 = self;
  sub_100053054(a3);
}

- (_SSSScreenshotPaperKitPDFView)initWithFrame:(CGRect)a3
{
  return (_SSSScreenshotPaperKitPDFView *)sub_1000531DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_SSSScreenshotPaperKitPDFView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000580FC();
}

- (void)deselectAllAnnotations
{
  id v3 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView);
  swift_beginAccess();
  double v4 = *v3;
  if (v4)
  {
    double v5 = self;
    id v6 = v4;
    dispatch thunk of PaperDocumentView.deselectAll()();
  }
}

- (void)setupDocumentViewController
{
  double v2 = self;
  sub_10004FE4C();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  double v2 = (char *)v5.receiver;
  [(_SSSScreenshotPaperKitPDFView *)&v5 layoutSubviews];
  id v3 = (id *)&v2[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView];
  swift_beginAccess();
  if (*v3)
  {
    double v4 = (char *)*v3;
    [v2 bounds];
    [v4 setFrame:];

    double v2 = v4;
  }
}

- (id)documentFromPDFData:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;

  id v9 = sub_10005486C(v6, v8);
  sub_10004FB78(v6, v8);

  return v9;
}

- (void).cxx_destruct
{
  sub_100059C30((uint64_t)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_delegate);

  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____SSSScreenshotPaperKitPDFView_cachedRenderedPDFDocument));

  sub_10004FB64(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData), *(void *)&self->delegate[OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData]);
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SSSScreenshotPaperKitPDFView_rulerHostView);
}

- (void)_toolPicker:(id)a3 startEditingOpacityWithAccessoryView:(id)a4
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    unint64_t v8 = (void *)Strong;
    id v9 = a3;
    id v10 = a4;
    uint64_t v11 = self;
    [v8 _paperKitPDFView:v11 startEditingOpacityInAccessoryView:v10];

    swift_unknownObjectRelease();
  }
}

@end