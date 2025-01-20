@interface PKToolPreviewView
- (PKToolPreviewView)initWithFrame:(CGRect)a3;
- (id)prepareWithFrame:(double)a3 mode:(double)a4;
- (void)layoutSubviews;
@end

@implementation PKToolPreviewView

- (PKToolPreviewView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKToolPreviewView;
  v3 = -[PKToolPreviewView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PKToolPreviewView *)v3 setUserInteractionEnabled:0];
  }
  return v4;
}

- (id)prepareWithFrame:(double)a3 mode:(double)a4
{
  if (!result) {
    return result;
  }
  v11 = result;
  v12 = [result layer];
  [v12 setAllowsGroupOpacity:0];

  v13 = [v11 layer];
  [v13 setAllowsGroupBlending:0];

  if (v11[51])
  {
    if (a2) {
      goto LABEL_4;
    }
LABEL_8:
    id v14 = v11[52];
    if (!v14)
    {
      id v33 = objc_alloc_init(MEMORY[0x1E4F39C88]);
      v16 = &OBJC_IVAR___PKToolPreviewView__shapeLayer;
      id v34 = v11[52];
      v11[52] = v33;

      id v35 = [MEMORY[0x1E4FB1618] clearColor];
      objc_msgSend(v11[52], "setFillColor:", objc_msgSend(v35, "CGColor"));

      [v11[52] setLineWidth:1.0];
      id v20 = [MEMORY[0x1E4FB1618] whiteColor];
      objc_msgSend(v11[52], "setStrokeColor:", objc_msgSend(v20, "CGColor"));
      goto LABEL_10;
    }
LABEL_11:
    [v11[51] setMask:v14];
    goto LABEL_12;
  }
  id v30 = objc_alloc_init(MEMORY[0x1E4F39B40]);
  id v31 = v11[51];
  v11[51] = v30;

  +[PKMetalView installLuminanceColorFilterOnLayer:lightLuma:darkLuma:](0.2, 0.8, (uint64_t)PKMetalView, v11[51]);
  [v11[51] setReducesCaptureBitDepth:1];
  [v11[51] setIgnoresScreenClip:1];
  [v11[51] setScale:0.25];
  v32 = [v11 layer];
  [v32 addSublayer:v11[51]];

  if (!a2) {
    goto LABEL_8;
  }
LABEL_4:
  if (a2 <= 3)
  {
    id v14 = v11[53];
    if (!v14)
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
      v16 = &OBJC_IVAR___PKToolPreviewView__symbolLayer;
      id v17 = v11[53];
      v11[53] = v15;

      uint64_t v18 = 8 * a2 - 8;
      uint64_t v19 = *(uint64_t *)((char *)off_1E64C7EB8 + v18);
      id v20 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:-1 scale:*(double *)((char *)&unk_1C4829F00 + v18)];
      v21 = [MEMORY[0x1E4FB1818] _systemImageNamed:v19 withConfiguration:v20];
      [v21 size];
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      [v21 scale];
      CGFloat v27 = v26;
      v37.width = v23;
      v37.height = v25;
      UIGraphicsBeginImageContextWithOptions(v37, 0, v27);
      objc_msgSend(v21, "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 1.0);
      v28 = UIGraphicsGetImageFromCurrentImageContext();

      UIGraphicsEndImageContext();
      id v29 = v28;
      objc_msgSend(v11[53], "setContents:", objc_msgSend(v29, "CGImage"));

LABEL_10:
      id v14 = *(id *)((char *)v11 + *v16);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v11, "setFrame:", a3, a4, a5, a6);

  return (id *)[v11 setNeedsLayout];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PKToolPreviewView;
  [(PKToolPreviewView *)&v11 layoutSubviews];
  [(PKToolPreviewView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[CABackdropLayer setFrame:](self->_backdropLayer, "setFrame:");
  -[CAShapeLayer setFrame:](self->_shapeLayer, "setFrame:", v4, v6, v8, v10);
  -[CALayer setFrame:](self->_symbolLayer, "setFrame:", v4, v6, v8, v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolLayer, 0);
  objc_storeStrong((id *)&self->_shapeLayer, 0);

  objc_storeStrong((id *)&self->_backdropLayer, 0);
}

@end