@interface PKRecognitionOverlayView
- (CGAffineTransform)drawingTransform;
- (CHVisualizationManager)visualizationManager;
- (PKRecognitionOverlayView)initWithFrame:(CGRect)a3 visualizationManager:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setDrawingTransform:(CGAffineTransform *)a3;
@end

@implementation PKRecognitionOverlayView

- (PKRecognitionOverlayView)initWithFrame:(CGRect)a3 visualizationManager:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9 = (CHVisualizationManager *)a4;
  v15.receiver = self;
  v15.super_class = (Class)PKRecognitionOverlayView;
  v10 = -[PKRecognitionOverlayView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  visualizationManager = v10->_visualizationManager;
  v10->_visualizationManager = v9;
  v12 = v9;

  [(CHVisualizationManager *)v12 setDelegate:v10];
  v13 = [MEMORY[0x1E4FB1618] clearColor];

  [(PKRecognitionOverlayView *)v10 setBackgroundColor:v13];
  return v10;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  [(PKRecognitionOverlayView *)self drawingTransform];
  CGContextConcatCTM(CurrentContext, &v14);
  v9 = [(PKRecognitionOverlayView *)self visualizationManager];
  [(PKRecognitionOverlayView *)self bounds];
  objc_msgSend(v9, "drawVisualizationInRect:context:viewBounds:", CurrentContext, x, y, width, height, v10, v11, v12, v13);

  CGContextRestoreGState(CurrentContext);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)dealloc
{
  v3 = [(PKRecognitionOverlayView *)self visualizationManager];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)PKRecognitionOverlayView;
  [(PKRecognitionOverlayView *)&v4 dealloc];
}

- (CGAffineTransform)drawingTransform
{
  long long v3 = *(_OWORD *)&self[9].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[8].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[9].c;
  return self;
}

- (void)setDrawingTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_drawingTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_drawingTransform.c = v4;
  *(_OWORD *)&self->_drawingTransform.tdouble x = v3;
}

- (CHVisualizationManager)visualizationManager
{
  return self->_visualizationManager;
}

- (void).cxx_destruct
{
}

@end