@interface CKTransientReplicaButtonContainer
- (CALayer)cancelButtonGlyphLayer;
- (CALayer)sendButtonGlyphLayer;
- (CKTransientReplicaButtonContainer)initWithFrame:(CGRect)a3 hasDarkVibrancy:(BOOL)a4 isInDarkMode:(BOOL)a5 color:(id)a6 sendColor:(char)a7;
- (UIView)cancelButtonCircle;
- (UIView)sendButtonCircle;
- (id)_glyphLayerForButtonAnimationWithImage:(id)a3;
- (id)_invertedCircularFillGlyph:(id)a3;
@end

@implementation CKTransientReplicaButtonContainer

- (CKTransientReplicaButtonContainer)initWithFrame:(CGRect)a3 hasDarkVibrancy:(BOOL)a4 isInDarkMode:(BOOL)a5 color:(id)a6 sendColor:(char)a7
{
  uint64_t v7 = a7;
  BOOL v8 = a5;
  BOOL v9 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a6;
  v63.receiver = self;
  v63.super_class = (Class)CKTransientReplicaButtonContainer;
  v16 = -[CKTransientReplicaButtonContainer initWithFrame:](&v63, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    int v55 = v9;
    int v56 = v8;
    v17 = +[CKUIBehavior sharedBehaviors];
    v18 = [v17 theme];
    uint64_t v19 = [v18 sendButtonColorForColorType:v7];

    id v62 = v15;
    id v20 = v15;
    v21 = [(CKTransientReplicaButtonContainer *)v16 layer];
    [v21 setAllowsGroupBlending:1];

    v22 = [MEMORY[0x1E4F42A98] configurationWithPointSize:5 weight:3 scale:19.0];
    v23 = [MEMORY[0x1E4F42A80] systemImageNamed:@"circle.fill" withConfiguration:v22];
    uint64_t v24 = [MEMORY[0x1E4F42A80] systemImageNamed:@"arrow.up.circle.fill" withConfiguration:v22];
    uint64_t v25 = [MEMORY[0x1E4F42A80] systemImageNamed:@"xmark.circle.fill" withConfiguration:v22];
    v59 = (void *)v24;
    uint64_t v26 = [(CKTransientReplicaButtonContainer *)v16 _invertedCircularFillGlyph:v24];
    v58 = (void *)v25;
    v27 = [(CKTransientReplicaButtonContainer *)v16 _invertedCircularFillGlyph:v25];
    v57 = (void *)v26;
    v28 = [(CKTransientReplicaButtonContainer *)v16 _glyphLayerForButtonAnimationWithImage:v26];
    v29 = [(CKTransientReplicaButtonContainer *)v16 _glyphLayerForButtonAnimationWithImage:v27];
    v30 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    v31 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    [(CKTransientReplicaButtonContainer *)v16 bounds];
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    -[UIView setFrame:](v30, "setFrame:");
    objc_msgSend(v31, "setFrame:", v33, v35, v37, v39);
    [(UIView *)v30 setImage:v23 forState:0];
    v61 = (void *)v19;
    [(UIView *)v30 setTintColor:v19];
    [v31 setImage:v23 forState:0];
    v60 = v20;
    [v31 setTintColor:v20];
    v40 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v33, v35, v37, v39);
    if (!UIAccessibilityIsReduceTransparencyEnabled() && !UIAccessibilityDarkerSystemColorsEnabled())
    {
      v41 = [(UIView *)v40 layer];
      setUpVibrancyForLayer(v41, v55, v56 ^ 1, v56);
    }
    [(UIView *)v40 addSubview:v31];
    [(CKTransientReplicaButtonContainer *)v16 addSubview:v30];
    [(CKTransientReplicaButtonContainer *)v16 addSubview:v40];
    v64.origin.double x = v33;
    v64.origin.double y = v35;
    v64.size.double width = v37;
    v64.size.double height = v39;
    double MidX = CGRectGetMidX(v64);
    v65.origin.double x = v33;
    v65.origin.double y = v35;
    v65.size.double width = v37;
    v65.size.double height = v39;
    double MidY = CGRectGetMidY(v65);
    -[CALayer setPosition:](v28, "setPosition:", MidX, MidY);
    -[CALayer setPosition:](v29, "setPosition:", MidX, MidY);
    v44 = [(UIView *)v30 layer];
    [v44 addSublayer:v28];

    v45 = [v31 layer];
    [v45 addSublayer:v29];

    cancelButtonCircle = v16->_cancelButtonCircle;
    v16->_cancelButtonCircle = v40;
    v47 = v40;

    sendButtonCircle = v16->_sendButtonCircle;
    v16->_sendButtonCircle = v30;
    v49 = v30;

    sendButtonGlyphLayer = v16->_sendButtonGlyphLayer;
    v16->_sendButtonGlyphLayer = v28;
    v51 = v28;

    cancelButtonGlyphLayer = v16->_cancelButtonGlyphLayer;
    v16->_cancelButtonGlyphLayer = v29;

    v53 = v16;
    id v15 = v62;
  }

  return v16;
}

- (id)_invertedCircularFillGlyph:(id)a3
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 configuration];
  v6 = (void *)MEMORY[0x1E4F42A98];
  uint64_t v7 = [MEMORY[0x1E4F428B8] blackColor];
  v23[0] = v7;
  BOOL v8 = [MEMORY[0x1E4F428B8] clearColor];
  v23[1] = v8;
  BOOL v9 = [MEMORY[0x1E4F428B8] clearColor];
  v23[2] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  v11 = [v6 _configurationWithHierarchicalColors:v10];
  v12 = [v5 configurationByApplyingConfiguration:v11];

  id v13 = objc_alloc_init(MEMORY[0x1E4F42A60]);
  v14 = [(CKTransientReplicaButtonContainer *)self traitCollection];
  [v14 displayScale];
  objc_msgSend(v13, "setScale:");

  id v15 = [v4 imageWithConfiguration:v12];

  id v16 = objc_alloc(MEMORY[0x1E4F42A58]);
  [v15 size];
  v17 = objc_msgSend(v16, "initWithSize:format:", v13);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__CKTransientReplicaButtonContainer__invertedCircularFillGlyph___block_invoke;
  v21[3] = &unk_1E5620DE8;
  id v22 = v15;
  v18 = [v17 imageWithActions:v21];
  uint64_t v19 = [v18 imageWithRenderingMode:2];

  return v19;
}

uint64_t __64__CKTransientReplicaButtonContainer__invertedCircularFillGlyph___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (id)_glyphLayerForButtonAnimationWithImage:(id)a3
{
  id v3 = a3;
  [v3 size];
  double v5 = v4;
  double v7 = v6;
  BOOL v8 = [MEMORY[0x1E4F39BE8] layer];
  id v9 = v3;
  uint64_t v10 = [v9 CGImage];

  [v8 setContents:v10];
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, v5, v7);
  v11 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A098]];
  [v8 setCompositingFilter:v11];

  return v8;
}

- (UIView)sendButtonCircle
{
  return self->_sendButtonCircle;
}

- (UIView)cancelButtonCircle
{
  return self->_cancelButtonCircle;
}

- (CALayer)sendButtonGlyphLayer
{
  return self->_sendButtonGlyphLayer;
}

- (CALayer)cancelButtonGlyphLayer
{
  return self->_cancelButtonGlyphLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButtonGlyphLayer, 0);
  objc_storeStrong((id *)&self->_sendButtonGlyphLayer, 0);
  objc_storeStrong((id *)&self->_cancelButtonCircle, 0);

  objc_storeStrong((id *)&self->_sendButtonCircle, 0);
}

@end