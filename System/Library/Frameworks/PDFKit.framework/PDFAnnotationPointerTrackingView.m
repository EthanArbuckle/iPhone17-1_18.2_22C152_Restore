@interface PDFAnnotationPointerTrackingView
- (PDFAnnotation)annotation;
- (PDFAnnotationPointerTrackingView)initWithFrame:(CGRect)a3 annotation:(id)a4;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
@end

@implementation PDFAnnotationPointerTrackingView

- (PDFAnnotationPointerTrackingView)initWithFrame:(CGRect)a3 annotation:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PDFAnnotationPointerTrackingView;
  v11 = -[PDFAnnotationPointerTrackingView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_annotation, a4);
    v13 = (void *)[objc_alloc(MEMORY[0x263F82A70]) initWithDelegate:v12];
    [(PDFAnnotationPointerTrackingView *)v12 addInteraction:v13];
  }
  return v12;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  v5 = [(PDFAnnotationPointerTrackingView *)self annotation];
  int v6 = [v5 isTextWidget];

  if (v6)
  {
    v7 = [(PDFAnnotationPointerTrackingView *)self annotation];
    v8 = [v7 font];

    if (v8) {
      [v8 pointSize];
    }
    else {
      [MEMORY[0x263F82760] smallSystemFontSize];
    }
    id v10 = objc_msgSend(MEMORY[0x263F82A88], "beamWithPreferredLength:axis:", 0);
    v9 = [MEMORY[0x263F82A90] styleWithShape:v10 constrainedAxes:0];
  }
  else
  {
    v9 = [MEMORY[0x263F82A90] systemPointerStyle];
  }

  return v9;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v5 = [(PDFAnnotationPointerTrackingView *)self annotation];
  [v5 setPointerIsOverAnnotation:1];
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v5 = [(PDFAnnotationPointerTrackingView *)self annotation];
  [v5 setPointerIsOverAnnotation:0];
}

- (PDFAnnotation)annotation
{
  return self->_annotation;
}

- (void).cxx_destruct
{
}

@end