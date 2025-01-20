@interface AKToolController
+ (void)cascadeAnnotations:(id)a3 onPageController:(id)a4 forPaste:(BOOL)a5;
- (AKController)controller;
- (AKToolController)initWithController:(id)a3;
- (BOOL)allInkEnabled;
- (BOOL)isInDefaultMode;
- (BOOL)isToolSenderEnabled:(id)a3;
- (BOOL)pencilInkEnabled;
- (CGPoint)_defaultCenterForNewAnnotation;
- (CGRect)_centerBounds:(CGRect)result atPoint:(CGPoint)a4;
- (CGRect)_defaultRectangleForNewAnnotation:(id)a3 centeredAtPoint:(CGPoint)a4;
- (CGRect)_validatedRect:(CGRect)a3 fitsInVisibleRegionOfOverlayView:(id)a4 ownedByPageController:(id)a5 centeredAtPoint:(CGPoint)a6;
- (double)_modelBaseScaleFactorForNewAnnotation;
- (double)_strokeWidthForNewAnnotation;
- (id)_defaultFillColorForAnnotationOfClass:(Class)a3;
- (id)_defaultHeartTypingAttributesWithFillColor:(id)a3;
- (id)_defaultTextBoxTypingAttributes;
- (id)_defaultTypingAttributes;
- (id)_strokeColorForNewAnnotation;
- (id)createAnnotationOfType:(int64_t)a3 centeredAtPoint:(CGPoint)a4;
- (unint64_t)_arrowStyleForToolTag:(int64_t)a3;
- (unint64_t)defaultToolMode;
- (unint64_t)toolMode;
- (void)_peripheralAvailabilityDidUpdate:(id)a3;
- (void)_setRectangleToFitTextOnTextAnnotation:(id)a3;
- (void)addNewAnnotation:(id)a3 onPageController:(id)a4 shouldSelect:(BOOL)a5 shouldCascade:(BOOL)a6;
- (void)dealloc;
- (void)performToolActionForSender:(id)a3;
- (void)resetToDefaultMode;
- (void)setAllInkEnabled:(BOOL)a3;
- (void)setController:(id)a3;
- (void)setPencilInkEnabled:(BOOL)a3;
- (void)setToolMode:(unint64_t)a3;
- (void)updateToolSenderState:(id)a3 enabled:(BOOL)a4;
@end

@implementation AKToolController

- (AKToolController)initWithController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKToolController;
  v5 = [(AKToolController *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(AKToolController *)v5 setController:v4];
    v6->_toolMode = -1;
    [(AKToolController *)v6 setToolMode:0];
    if (+[AKController canConnectToStylus])
    {
      v7 = [MEMORY[0x263F08A00] defaultCenter];
      [v7 addObserver:v6 selector:sel__peripheralAvailabilityDidUpdate_ name:@"AKPeripheralAvailabilityManagerAvailabilityNotification" object:0];
    }
  }

  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AKToolController;
  [(AKToolController *)&v4 dealloc];
}

- (void)performToolActionForSender:(id)a3
{
  id v17 = a3;
  uint64_t v4 = [v17 tag];
  v5 = [(AKToolController *)self controller];
  v6 = [v5 delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || [v6 requestPermissionForController:v5 toPerformActionFromSender:v4])
  {
    switch(v4)
    {
      case 764015:
        if ([(AKToolController *)self toolMode] == 1) {
          goto LABEL_14;
        }
        v7 = self;
        uint64_t v8 = 1;
        goto LABEL_16;
      case 764016:
        if ([(AKToolController *)self toolMode] == 2) {
          goto LABEL_14;
        }
        v7 = self;
        uint64_t v8 = 2;
        goto LABEL_16;
      case 764017:
        if ([(AKToolController *)self toolMode] == 4)
        {
LABEL_14:
          v7 = self;
          uint64_t v8 = 0;
        }
        else
        {
          v7 = self;
          uint64_t v8 = 4;
        }
LABEL_16:
        [(AKToolController *)v7 setToolMode:v8];
        break;
      case 764018:
      case 764019:
      case 764020:
      case 764021:
        goto LABEL_7;
      case 764022:
        break;
      default:
        if (v4 != 764064)
        {
LABEL_7:
          if ([v17 tag] != 764066)
          {
            if ((unint64_t)(v4 - 764050) > 7)
            {
              switch(v4)
              {
                case 764058:
                  goto LABEL_17;
                case 764061:
                  if (objc_opt_respondsToSelector())
                  {
                    v12 = [v6 undoManagerForAnnotationController:v5];
                    v13 = v12;
                    goto LABEL_40;
                  }
                  break;
                case 764062:
                  if (objc_opt_respondsToSelector())
                  {
                    v13 = [v6 undoManagerForAnnotationController:v5];
                    [v13 registerUndoWithTarget:v6 selector:sel_rotateLeft_ object:self];
                    [v6 rotateRight:v5];
                    goto LABEL_45;
                  }
                  break;
                case 764063:
                  v13 = [v6 undoManagerForAnnotationController:v5];
                  if (objc_opt_respondsToSelector())
                  {
                    v12 = v13;
LABEL_40:
                    [v12 registerUndoWithTarget:v6 selector:sel_rotateRight_ object:self];
                    [v6 rotateLeft:v5];
                  }
                  goto LABEL_45;
                default:
                  [v5 setCreationCascadingMultiplier:0];
                  if (v4 == 764060)
                  {
                    if (objc_opt_respondsToSelector()) {
                      objc_msgSend(v6, "controller:performActionForMode:fromSender:withAttribute:onPageAtIndex:", v5, -[AKToolController toolMode](self, "toolMode"), 764060, 763000, objc_msgSend(v5, "currentPageIndex"));
                    }
                  }
                  else
                  {
                    [(AKToolController *)self _defaultCenterForNewAnnotation];
                    v13 = -[AKToolController createAnnotationOfType:centeredAtPoint:](self, "createAnnotationOfType:centeredAtPoint:", v4);
                    [(AKToolController *)self addNewAnnotation:v13 onPageController:0 shouldSelect:1 shouldCascade:1];
LABEL_45:
                  }
                  break;
              }
            }
            else
            {
              objc_super v9 = [v5 attributeController];
              v10 = v9;
              if (v4 == 764050) {
                uint64_t v11 = [v9 highlightStyle];
              }
              else {
                uint64_t v11 = +[AKUserInterfaceItemHelper highlightAttributeTagFromHighlightToolTag:v4];
              }
              uint64_t v14 = v11;
              if ((objc_opt_respondsToSelector() & 1) == 0
                || ([v6 hasHighlightableSelectionForAnnotationController:v5] & 1) == 0)
              {
                unint64_t v15 = [(AKToolController *)self toolMode];
                if (v15 != 3 || v4 == 764050)
                {
                  if (v15 == 3) {
                    uint64_t v16 = 0;
                  }
                  else {
                    uint64_t v16 = 3;
                  }
                  [(AKToolController *)self setToolMode:v16];
                }
                [v10 setHighlightStyle:v14];
              }
              if (objc_opt_respondsToSelector()) {
                objc_msgSend(v6, "controller:performActionForMode:fromSender:withAttribute:onPageAtIndex:", v5, -[AKToolController toolMode](self, "toolMode"), v4, v14, objc_msgSend(v5, "currentPageIndex"));
              }
            }
          }
        }
        break;
    }
  }
LABEL_17:
}

- (id)createAnnotationOfType:(int64_t)a3 centeredAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v8 = [(AKToolController *)self controller];
  objc_super v9 = [v8 attributeController];
  [(AKToolController *)self _modelBaseScaleFactorForNewAnnotation];
  id v10 = 0;
  double v12 = v11;
  switch(a3)
  {
    case 764000:
    case 764001:
      id v10 = (id)objc_opt_new();
      objc_msgSend(v10, "setHasShadow:", objc_msgSend(v9, "hasShadow"));
      v22 = self;
      v23 = [(AKToolController *)self _defaultFillColorForAnnotationOfClass:v22];
      [v10 setFillColor:v23];

      [(AKToolController *)self _strokeWidthForNewAnnotation];
      objc_msgSend(v10, "setStrokeWidth:");
      v24 = [(AKToolController *)self _strokeColorForNewAnnotation];
      [v10 setStrokeColor:v24];

      objc_msgSend(v10, "setDashed:", objc_msgSend(v9, "strokeIsDashed"));
      objc_msgSend(v10, "setBrushStyle:", objc_msgSend(v9, "brushStyle"));
      if (a3 == 764001) {
        [v10 setCornerRadius:v12 * 20.0];
      }
      -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
      objc_msgSend(v10, "setRectangle:");
      v25 = [(AKToolController *)self _defaultTypingAttributes];
      [v10 setTypingAttributes:v25];

      goto LABEL_27;
    case 764002:
    case 764013:
      id v10 = (id)objc_opt_new();
      objc_msgSend(v10, "setHasShadow:", objc_msgSend(v9, "hasShadow"));
      v55 = self;
      v56 = [(AKToolController *)self _defaultFillColorForAnnotationOfClass:v55];
      [v10 setFillColor:v56];

      [(AKToolController *)self _strokeWidthForNewAnnotation];
      objc_msgSend(v10, "setStrokeWidth:");
      v57 = [(AKToolController *)self _strokeColorForNewAnnotation];
      [v10 setStrokeColor:v57];

      objc_msgSend(v10, "setDashed:", objc_msgSend(v9, "strokeIsDashed"));
      objc_msgSend(v10, "setBrushStyle:", objc_msgSend(v9, "brushStyle"));
      goto LABEL_16;
    case 764003:
    case 764004:
    case 764005:
      id v10 = (id)objc_opt_new();
      objc_msgSend(v10, "setArrowHeadStyle:", -[AKToolController _arrowStyleForToolTag:](self, "_arrowStyleForToolTag:", a3));
      objc_msgSend(v10, "setHasShadow:", objc_msgSend(v9, "hasShadow"));
      [(AKToolController *)self _strokeWidthForNewAnnotation];
      objc_msgSend(v10, "setStrokeWidth:");
      v13 = [(AKToolController *)self _strokeColorForNewAnnotation];
      [v10 setStrokeColor:v13];

      objc_msgSend(v10, "setDashed:", objc_msgSend(v9, "strokeIsDashed"));
      objc_msgSend(v10, "setBrushStyle:", objc_msgSend(v9, "brushStyle"));
      -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
      CGFloat v14 = v80.origin.x;
      CGFloat v15 = v80.origin.y;
      CGFloat width = v80.size.width;
      CGFloat height = v80.size.height;
      double MinX = CGRectGetMinX(v80);
      v81.origin.double x = v14;
      v81.origin.double y = v15;
      v81.size.CGFloat width = width;
      v81.size.CGFloat height = height;
      objc_msgSend(v10, "setStartPoint:", MinX, CGRectGetMidY(v81));
      v82.origin.double x = v14;
      v82.origin.double y = v15;
      v82.size.CGFloat width = width;
      v82.size.CGFloat height = height;
      double MaxX = CGRectGetMaxX(v82);
      v83.origin.double x = v14;
      v83.origin.double y = v15;
      v83.size.CGFloat width = width;
      v83.size.CGFloat height = height;
      objc_msgSend(v10, "setEndPoint:", MaxX, CGRectGetMidY(v83));
      v84.origin.double x = v14;
      v84.origin.double y = v15;
      v84.size.CGFloat width = width;
      v84.size.CGFloat height = height;
      double MidX = CGRectGetMidX(v84);
      v85.origin.double x = v14;
      v85.origin.double y = v15;
      v85.size.CGFloat width = width;
      v85.size.CGFloat height = height;
      objc_msgSend(v10, "setMidPoint:", MidX, CGRectGetMidY(v85));
      goto LABEL_17;
    case 764006:
      id v10 = (id)objc_opt_new();
      objc_msgSend(v10, "setArrowHeadStyle:", -[AKToolController _arrowStyleForToolTag:](self, "_arrowStyleForToolTag:", 764006));
      -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
      CGFloat v26 = v86.origin.x;
      CGFloat v27 = v86.origin.y;
      CGFloat v28 = v86.size.width;
      CGFloat v29 = v86.size.height;
      double v30 = CGRectGetMinX(v86);
      v87.origin.double x = v26;
      v87.origin.double y = v27;
      v87.size.CGFloat width = v28;
      v87.size.CGFloat height = v29;
      objc_msgSend(v10, "setStartPoint:", v30, CGRectGetMidY(v87));
      v88.origin.double x = v26;
      v88.origin.double y = v27;
      v88.size.CGFloat width = v28;
      v88.size.CGFloat height = v29;
      double v31 = CGRectGetMaxX(v88);
      v89.origin.double x = v26;
      v89.origin.double y = v27;
      v89.size.CGFloat width = v28;
      v89.size.CGFloat height = v29;
      objc_msgSend(v10, "setEndPoint:", v31, CGRectGetMidY(v89));
      objc_msgSend(v10, "setHasShadow:", objc_msgSend(v9, "hasShadow"));
      [(AKToolController *)self _strokeWidthForNewAnnotation];
      objc_msgSend(v10, "setStrokeWidth:");
      v32 = [(AKToolController *)self _strokeColorForNewAnnotation];
      [v10 setStrokeColor:v32];

      v33 = self;
      v34 = [(AKToolController *)self _defaultFillColorForAnnotationOfClass:v33];
      [v10 setFillColor:v34];

      objc_msgSend(v10, "setDashed:", objc_msgSend(v9, "strokeIsDashed"));
      objc_msgSend(v10, "setBrushStyle:", objc_msgSend(v9, "brushStyle"));
      [v10 setArrowHeadWidth:v12 * 80.0];
      [v10 setArrowLineWidth:v12 * 40.0];
      [v10 setArrowHeadLength:v12 * 40.0];
      goto LABEL_17;
    case 764007:
      id v10 = (id)objc_opt_new();
      -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
      objc_msgSend(v10, "setRectangle:");
      [v10 rectangle];
      CGFloat v35 = CGRectGetMinX(v90) + v12 * -10.0;
      [v10 rectangle];
      objc_msgSend(v10, "setPointyBitPoint:", v35, CGRectGetMinY(v91) + v12 * -10.0);
      v36 = self;
      v37 = [(AKToolController *)self _defaultFillColorForAnnotationOfClass:v36];
      [v10 setFillColor:v37];

      v38 = [(AKToolController *)self _strokeColorForNewAnnotation];
      [v10 setStrokeColor:v38];

      [(AKToolController *)self _strokeWidthForNewAnnotation];
      objc_msgSend(v10, "setStrokeWidth:");
      v39 = [v8 attributeController];
      objc_msgSend(v10, "setDashed:", objc_msgSend(v39, "strokeIsDashed"));

      v40 = [v8 attributeController];
      objc_msgSend(v10, "setBrushStyle:", objc_msgSend(v40, "brushStyle"));

      objc_msgSend(v10, "setHasShadow:", objc_msgSend(v9, "hasShadow"));
      [v10 setPointyBitBaseWidthAngle:25.0];
      goto LABEL_17;
    case 764008:
      id v10 = (id)objc_opt_new();
      -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
      objc_msgSend(v10, "setRectangle:");
      objc_msgSend(v10, "setHasShadow:", objc_msgSend(v9, "hasShadow"));
      v41 = self;
      v42 = [(AKToolController *)self _defaultFillColorForAnnotationOfClass:v41];
      [v10 setFillColor:v42];

      [(AKToolController *)self _strokeWidthForNewAnnotation];
      objc_msgSend(v10, "setStrokeWidth:");
      v43 = [(AKToolController *)self _strokeColorForNewAnnotation];
      [v10 setStrokeColor:v43];

      objc_msgSend(v10, "setDashed:", objc_msgSend(v9, "strokeIsDashed"));
      objc_msgSend(v10, "setBrushStyle:", objc_msgSend(v9, "brushStyle"));
      [v10 setPointCount:5];
      +[AKStarAnnotationRenderer defaultInnerRadiusForStar:v10];
      objc_msgSend(v10, "setInnerRadiusFactor:");
      goto LABEL_17;
    case 764009:
      id v10 = (id)objc_opt_new();
      -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
      objc_msgSend(v10, "setRectangle:");
      objc_msgSend(v10, "setHasShadow:", objc_msgSend(v9, "hasShadow"));
      v44 = self;
      v45 = [(AKToolController *)self _defaultFillColorForAnnotationOfClass:v44];
      [v10 setFillColor:v45];

      [(AKToolController *)self _strokeWidthForNewAnnotation];
      objc_msgSend(v10, "setStrokeWidth:");
      v46 = [(AKToolController *)self _strokeColorForNewAnnotation];
      [v10 setStrokeColor:v46];

      objc_msgSend(v10, "setDashed:", objc_msgSend(v9, "strokeIsDashed"));
      objc_msgSend(v10, "setBrushStyle:", objc_msgSend(v9, "brushStyle"));
      [v10 setPointCount:6];
      goto LABEL_17;
    case 764010:
      id v10 = (id)objc_opt_new();
      objc_msgSend(v10, "setHasShadow:", objc_msgSend(v9, "hasShadow"));
      [(AKToolController *)self _strokeWidthForNewAnnotation];
      objc_msgSend(v10, "setStrokeWidth:");
      v47 = [(AKToolController *)self _strokeColorForNewAnnotation];
      [v10 setStrokeColor:v47];

      objc_msgSend(v10, "setDashed:", objc_msgSend(v9, "strokeIsDashed"));
      objc_msgSend(v10, "setBrushStyle:", objc_msgSend(v9, "brushStyle"));
      v48 = self;
      v49 = [(AKToolController *)self _defaultFillColorForAnnotationOfClass:v48];
      [v10 setFillColor:v49];

LABEL_16:
      -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
      objc_msgSend(v10, "setRectangle:");
LABEL_17:
      v21 = [(AKToolController *)self _defaultTypingAttributes];
      [v10 setTypingAttributes:v21];
      goto LABEL_18;
    case 764011:
      id v10 = (id)objc_opt_new();
      objc_msgSend(v10, "setHasShadow:", objc_msgSend(v9, "hasShadow"));
      [(AKToolController *)self _strokeWidthForNewAnnotation];
      objc_msgSend(v10, "setStrokeWidth:");
      v50 = [(AKToolController *)self _strokeColorForNewAnnotation];
      [v10 setStrokeColor:v50];

      objc_msgSend(v10, "setDashed:", objc_msgSend(v9, "strokeIsDashed"));
      objc_msgSend(v10, "setBrushStyle:", objc_msgSend(v9, "brushStyle"));
      v51 = self;
      v52 = [(AKToolController *)self _defaultFillColorForAnnotationOfClass:v51];
      [v10 setFillColor:v52];

      -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
      objc_msgSend(v10, "setRectangle:");
      v53 = [v10 fillColor];
      v54 = [(AKToolController *)self _defaultHeartTypingAttributesWithFillColor:v53];
      [v10 setTypingAttributes:v54];
      goto LABEL_24;
    case 764012:
    case 764015:
    case 764016:
    case 764017:
      goto LABEL_28;
    case 764014:
      id v10 = (id)objc_opt_new();
      [v10 setFillColor:0];
      [v10 setStrokeWidth:0.0];
      v58 = [v8 attributeController];
      objc_msgSend(v10, "setBrushStyle:", objc_msgSend(v58, "brushStyle"));

      [v10 setDashed:0];
      v59 = [(AKToolController *)self _defaultTextBoxTypingAttributes];
      [v10 setTypingAttributes:v59];

      v60 = [v10 typingAttributes];
      v61 = [v60 objectForKeyedSubscript:*MEMORY[0x263F1C240]];
      [v10 setStrokeColor:v61];

      double v62 = 100.0;
      double v63 = 0.0;
      double v64 = 0.0;
      v65 = v10;
      double v66 = 100.0;
      goto LABEL_22;
    case 764018:
      id v10 = (id)objc_opt_new();
      objc_msgSend(v10, "setHasShadow:", objc_msgSend(v9, "hasShadow"));
      [(AKToolController *)self _strokeWidthForNewAnnotation];
      objc_msgSend(v10, "setStrokeWidth:");
      objc_msgSend(v10, "setDashed:", objc_msgSend(v9, "strokeIsDashed"));
      objc_msgSend(v10, "setBrushStyle:", objc_msgSend(v9, "brushStyle"));
      v67 = [(AKToolController *)self _strokeColorForNewAnnotation];
      [v10 setStrokeColor:v67];

      -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
      v65 = v10;
LABEL_22:
      objc_msgSend(v65, "setRectangle:", v63, v64, v62, v66);
      goto LABEL_27;
    case 764019:
      v68 = [v8 signatureModelController];
      v53 = [v68 selectedSignature];

      id v10 = (id)objc_opt_new();
      [v10 setSignature:v53];
      -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
      objc_msgSend(v10, "setRectangle:");
      v54 = [MEMORY[0x263F1C550] blackColor];
      [v10 setStrokeColor:v54];
LABEL_24:

      goto LABEL_28;
    case 764020:
      id v10 = (id)objc_opt_new();
      -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
      objc_msgSend(v10, "setRectangle:");
      v69 = [MEMORY[0x263F1C550] akColorWithWhite:0.0 alpha:0.5];
      [v10 setStrokeColor:v69];

      [v10 setMagnification:2.0];
      [v10 setStrokeWidth:v12 * 2.5];
      [v10 setBrushStyle:0];
      [v10 setDashed:0];
      [v10 setHasShadow:0];
      goto LABEL_27;
    case 764021:
      v70 = objc_opt_new();
      double v71 = *MEMORY[0x263F00190];
      double v72 = *(double *)(MEMORY[0x263F00190] + 8);
      double v73 = *(double *)(MEMORY[0x263F00190] + 16);
      double v74 = *(double *)(MEMORY[0x263F00190] + 24);
      id v10 = v70;
      objc_msgSend(v10, "setRectangle:", v71, v72, v73, v74);
      [v10 setFillColor:0];
LABEL_27:

      goto LABEL_28;
    default:
      if (a3 == 764050)
      {
        v76 = os_log_create("com.apple.annotationkit", "Tool Controller");
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG)) {
          sub_2376DA740(v76);
        }

        id v10 = (id)objc_opt_new();
        uint64_t v77 = [v9 highlightStyle];
        if ((unint64_t)(v77 - 765200) > 6)
        {
          v21 = 0;
          uint64_t v78 = 0;
        }
        else
        {
          uint64_t v78 = qword_2376F4578[v77 - 765200];
          v21 = +[AKHighlightAppearanceHelper colorForHighlightAttributeWithTag:v77];
        }
        [v10 setColor:v21];
        [v10 setStyle:v78];
LABEL_18:
      }
      else
      {
        if (a3 != 764060) {
          goto LABEL_28;
        }
        id v10 = (id)objc_opt_new();
        -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
        objc_msgSend(v10, "setRectangle:");
        v21 = +[AKHighlightAppearanceHelper colorForNoteOfHighlightAttributeTag:](AKHighlightAppearanceHelper, "colorForNoteOfHighlightAttributeTag:", [v9 highlightStyle]);
        [v10 setFillColor:v21];
      }

LABEL_28:
      return v10;
  }
}

- (void)addNewAnnotation:(id)a3 onPageController:(id)a4 shouldSelect:(BOOL)a5 shouldCascade:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v32 = a5;
  v34[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  double v11 = [(AKToolController *)self controller];
  double v12 = v11;
  if (v10)
  {
    id v13 = v10;
  }
  else
  {
    id v13 = [v11 currentPageController];
  }
  CGFloat v14 = v13;
  CGFloat v15 = [v13 pageModelController];
  uint64_t v16 = [v12 delegate];
  uint64_t v17 = [v12 author];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [v9 author];

    if (!v19)
    {
      v20 = [v12 author];
      [v9 setAuthor:v20];
    }
  }
  v21 = [v9 modificationDate];

  if (!v21)
  {
    v22 = [MEMORY[0x263EFF910] date];
    [v9 setModificationDate:v22];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![v16 controller:v12 shouldPlaceSingleShotAnnotation:v9 onProposedPageModelController:v15])
  {
    id v23 = v15;
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      id v33 = v15;
      [v16 controller:v12 willPlaceSingleShotAnnotation:v9 onProposedPageModelController:&v33];
      id v23 = v33;

      id v24 = [v14 pageModelController];

      if (v24 != v23)
      {
        uint64_t v25 = [v12 pageControllerForPageModelController:v23];

        CGFloat v14 = (void *)v25;
      }
    }
    else
    {
      id v23 = v15;
    }
    [v9 originalModelBaseScaleFactor];
    if (v26 == 0.0)
    {
      [(AKToolController *)self _modelBaseScaleFactorForNewAnnotation];
      objc_msgSend(v9, "setOriginalModelBaseScaleFactor:");
      BOOL v27 = v6;
    }
    else
    {
      BOOL v27 = 0;
    }
    if (![v9 originalExifOrientation])
    {
      objc_msgSend(v9, "setOriginalExifOrientation:", objc_msgSend(v14, "currentModelToScreenExifOrientation"));
      [v9 adjustModelToCompensateForOriginalExif];
      if (v27)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(AKToolController *)self _setRectangleToFitTextOnTextAnnotation:v9];
        }
      }
    }
    if (v6)
    {
      CGFloat v28 = objc_opt_class();
      v34[0] = v9;
      CGFloat v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
      [v28 cascadeAnnotations:v29 onPageController:v14 forPaste:0];
    }
    double v30 = [v23 mutableArrayValueForKey:@"annotations"];
    [v30 addObject:v9];
    double v31 = [v12 modelController];
    [v31 deselectAllAnnotations];

    if (v32)
    {
      objc_msgSend(v12, "setCurrentPageIndex:", objc_msgSend(v14, "pageIndex"));
      [v23 selectAnnotation:v9 byExtendingSelection:0];
    }
    if (objc_opt_respondsToSelector()) {
      [v16 controller:v12 didPlaceSingleShotAnnotation:v9 onPageModelController:v23];
    }
  }
}

+ (void)cascadeAnnotations:(id)a3 onPageController:(id)a4 forPaste:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 controller];
  id v10 = v9;
  if (!v5)
  {
    id v11 = [v9 lastCreationCascadingPageController];

    if (v11 != v8)
    {
      [v10 setLastCreationCascadingPageController:v8];
      [v10 setCreationCascadingMultiplier:0];
    }
  }
  double v12 = [v8 overlayView];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  objc_msgSend(v8, "convertRectFromOverlayToModel:", v14, v16, v18, v20);
  rect[0] = v21;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  memset(&rect[1], 0, 32);
  long long v54 = 0u;
  long long v55 = 0u;
  id v28 = v7;
  uint64_t v29 = [v28 countByEnumeratingWithState:&rect[1] objects:v56 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)rect[3];
    double v51 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v52 = *MEMORY[0x263F001A8];
    double v49 = *(double *)(MEMORY[0x263F001A8] + 24);
    double v50 = *(double *)(MEMORY[0x263F001A8] + 16);
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)rect[3] != v31) {
          objc_enumerationMutation(v28);
        }
        id v33 = *(void **)(rect[2] + 8 * i);
        if (!v5)
        {
          unint64_t v34 = [v10 creationCascadingMultiplier];
          if (!v34) {
            goto LABEL_14;
          }
LABEL_13:
          double v35 = (double)v34;
          [v8 modelBaseScaleFactor];
          +[AKGeometryHelper convertScreenToModelOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertScreenToModelOrientationForPoint:relativeToRect:withPageController:", v8, v36 * v35 * 10.0, v36 * v35 * -10.0, v52, v51, v50, v49);
          objc_msgSend(v33, "translateBy:");
          goto LABEL_14;
        }
        unint64_t v34 = [v10 pasteCascadingMultiplier];
        if (v34) {
          goto LABEL_13;
        }
LABEL_14:
        [v33 drawingBounds];
        CGFloat x = v59.origin.x;
        CGFloat y = v59.origin.y;
        CGFloat width = v59.size.width;
        CGFloat height = v59.size.height;
        double MidX = CGRectGetMidX(v59);
        v60.origin.CGFloat x = x;
        v60.origin.CGFloat y = y;
        v60.size.CGFloat width = width;
        v60.size.CGFloat height = height;
        double MidY = CGRectGetMidY(v60);
        *(void *)&v61.origin.CGFloat x = rect[0];
        v61.origin.CGFloat y = v23;
        v61.size.CGFloat width = v25;
        v61.size.CGFloat height = v27;
        v58.CGFloat x = MidX;
        v58.CGFloat y = MidY;
        if (!CGRectContainsPoint(v61, v58))
        {
          *(void *)&v62.origin.CGFloat x = rect[0];
          v62.origin.CGFloat y = v23;
          v62.size.CGFloat width = v25;
          v62.size.CGFloat height = v27;
          double MinX = CGRectGetMinX(v62);
          *(void *)&v63.origin.CGFloat x = rect[0];
          v63.origin.CGFloat y = v23;
          v63.size.CGFloat width = v25;
          v63.size.CGFloat height = v27;
          double MaxX = CGRectGetMaxX(v63);
          if (MidX <= MaxX) {
            double MaxX = MidX;
          }
          if (MidX >= MinX) {
            double v45 = MaxX;
          }
          else {
            double v45 = MinX;
          }
          *(void *)&v64.origin.CGFloat x = rect[0];
          v64.origin.CGFloat y = v23;
          v64.size.CGFloat width = v25;
          v64.size.CGFloat height = v27;
          double MinY = CGRectGetMinY(v64);
          *(void *)&v65.origin.CGFloat x = rect[0];
          v65.origin.CGFloat y = v23;
          v65.size.CGFloat width = v25;
          v65.size.CGFloat height = v27;
          double MaxY = CGRectGetMaxY(v65);
          if (MidY <= MaxY) {
            double MaxY = MidY;
          }
          if (MidY >= MinY) {
            double v48 = MaxY;
          }
          else {
            double v48 = MinY;
          }
          objc_msgSend(v33, "translateBy:", v45 - MidX, v48 - MidY);
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&rect[1] objects:v56 count:16];
    }
    while (v30);
  }

  if (v5) {
    objc_msgSend(v10, "setPasteCascadingMultiplier:", objc_msgSend(v10, "pasteCascadingMultiplier") + 1);
  }
  else {
    objc_msgSend(v10, "setCreationCascadingMultiplier:", objc_msgSend(v10, "creationCascadingMultiplier") + 1);
  }
}

- (void)setToolMode:(unint64_t)a3
{
  if (self->_toolMode == a3) {
    return;
  }
  double v22 = [(AKToolController *)self controller];
  if (([v22 isTornDown] & 1) == 0)
  {
    BOOL v5 = [v22 delegate];
    if (a3)
    {
      if (objc_opt_respondsToSelector()) {
        [v5 controllerWillEnterToolMode:v22];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      [v5 controllerWillExitToolMode:v22];
    }
    unint64_t toolMode = self->_toolMode;
    if (toolMode - 1 < 2)
    {
      id v7 = [v22 legacyDoodleController];
      [v7 removeOverlay];
    }
    else if (toolMode - 4 >= 2)
    {
      id v8 = v22;
      if (toolMode)
      {
LABEL_15:
        self->_unint64_t toolMode = a3;
        switch(a3)
        {
          case 0uLL:
            int v10 = [v8 supportForPencilAlwaysDrawsSatisfied];
            [(AKToolController *)self setAllInkEnabled:0];
            if (v10)
            {
              [(AKToolController *)self setPencilInkEnabled:1];
              id v11 = [v22 attributeController];
              [v11 resetToLastDrawingInk];
            }
            else
            {
              [(AKToolController *)self setPencilInkEnabled:0];
            }
            double v15 = [MEMORY[0x263F08A00] defaultCenter];
            [v15 postNotificationName:@"AKToolController.inkToolStatusUpdated" object:self];
            goto LABEL_26;
          case 1uLL:
            uint64_t v12 = [v8 shouldDrawVariableStrokeDoodles];
            double v13 = [v22 legacyDoodleController];
            [v13 setPressureSensitiveDoodleMode:v12];

            goto LABEL_20;
          case 2uLL:
            double v14 = [v8 legacyDoodleController];
            [v14 setPressureSensitiveDoodleMode:1];

LABEL_20:
            double v15 = [v22 legacyDoodleController];
            [v15 showOverlay];
            goto LABEL_26;
          case 4uLL:
            [(AKToolController *)self setAllInkEnabled:1];
            [(AKToolController *)self setPencilInkEnabled:1];
            double v16 = [v22 attributeController];
            double v17 = [v16 ink];

            if (!v17)
            {
              double v18 = [v22 attributeController];
              [v18 setDefaultInk];
            }
            double v19 = [MEMORY[0x263F08A00] defaultCenter];
            [v19 postNotificationName:@"AKToolController.inkToolStatusUpdated" object:self];

            double v15 = [v22 modelController];
            [v15 deselectAllAnnotations];
LABEL_26:

            id v8 = v22;
            break;
          default:
            break;
        }
        double v20 = [v8 toolbarViewController];
        [v20 revalidateItems];
        uint64_t v21 = [v22 modernToolbarView];
        [v21 revalidateItems];
        if (a3)
        {
          if (objc_opt_respondsToSelector()) {
            [v5 controllerDidEnterToolMode:v22];
          }
        }
        else if (objc_opt_respondsToSelector())
        {
          [v5 controllerDidExitToolMode:v22];
        }

        goto LABEL_33;
      }
      id v9 = [v22 textEditorController];
      [v9 endEditing];

      id v7 = [v22 modelController];
      [v7 deselectAllAnnotations];
    }
    else
    {
      [(AKToolController *)self setAllInkEnabled:0];
      [(AKToolController *)self setPencilInkEnabled:0];
      id v7 = [MEMORY[0x263F08A00] defaultCenter];
      [v7 postNotificationName:@"AKToolController.inkToolStatusUpdated" object:self];
    }

    id v8 = v22;
    goto LABEL_15;
  }
LABEL_33:

  MEMORY[0x270F9A758]();
}

- (BOOL)isToolSenderEnabled:(id)a3
{
  return 1;
}

- (void)updateToolSenderState:(id)a3 enabled:(BOOL)a4
{
  id v8 = a3;
  if ([v8 tag] == 764015)
  {
    id v5 = v8;
    BOOL v6 = [(AKToolController *)self toolMode] == 1;
LABEL_7:
    uint64_t v7 = v6;
    [v5 setSelected:v7];

    goto LABEL_11;
  }
  if ([v8 tag] == 764016)
  {
    id v5 = v8;
    BOOL v6 = [(AKToolController *)self toolMode] == 2;
    goto LABEL_7;
  }
  if ([v8 tag] == 764017)
  {
    id v5 = v8;
    BOOL v6 = [(AKToolController *)self toolMode] == 4;
    goto LABEL_7;
  }
  [v8 tag];
LABEL_11:
}

- (BOOL)isInDefaultMode
{
  unint64_t v3 = [(AKToolController *)self toolMode];
  return v3 == [(AKToolController *)self defaultToolMode];
}

- (void)resetToDefaultMode
{
  if ([(AKToolController *)self isInDefaultMode])
  {
    int v3 = [(AKToolController *)self pencilInkEnabled];
    uint64_t v4 = [(AKToolController *)self controller];
    int v5 = [v4 supportForPencilAlwaysDrawsSatisfied];

    if (v3 == v5) {
      return;
    }
    self->_unint64_t toolMode = -1;
  }
  unint64_t v6 = [(AKToolController *)self defaultToolMode];

  [(AKToolController *)self setToolMode:v6];
}

- (unint64_t)defaultToolMode
{
  return 0;
}

- (double)_modelBaseScaleFactorForNewAnnotation
{
  v2 = [(AKToolController *)self controller];
  int v3 = [v2 currentPageController];
  [v3 modelBaseScaleFactor];
  double v5 = v4;

  return v5;
}

- (double)_strokeWidthForNewAnnotation
{
  int v3 = [(AKToolController *)self controller];
  double v4 = [v3 attributeController];
  [v4 strokeWidth];
  double v6 = v5;

  if (v6 > 1.0001)
  {
    [(AKToolController *)self _modelBaseScaleFactorForNewAnnotation];
    double v6 = v6 * v7;
  }

  return v6;
}

- (id)_strokeColorForNewAnnotation
{
  v2 = [(AKToolController *)self controller];
  int v3 = [v2 currentPageController];
  double v4 = [v3 pageModelController];
  double v5 = [v2 attributeController];
  double v6 = [v4 selectedAnnotations];
  if ([v6 count])
  {
    double v7 = [v6 anyObject];
    if ([v7 conformsToAKStrokedAnnotationProtocol])
    {
      id v8 = [v7 strokeColor];
LABEL_7:

      goto LABEL_9;
    }
  }
  id v9 = [v5 ink];

  if (v9)
  {
    double v7 = [v5 ink];
    int v10 = [v7 color];
    id v8 = [v10 colorWithAlphaComponent:1.0];

    goto LABEL_7;
  }
  id v8 = [v5 strokeColor];
LABEL_9:

  return v8;
}

- (CGRect)_centerBounds:(CGRect)result atPoint:(CGPoint)a4
{
  double v4 = a4.x - result.size.width * 0.5;
  double v5 = a4.y - result.size.height * 0.5;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGPoint)_defaultCenterForNewAnnotation
{
  v2 = [(AKToolController *)self controller];
  int v3 = [v2 currentPageController];
  [v3 visibleRectOfOverlay];
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  CGFloat MidX = CGRectGetMidX(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v14);

  double v10 = MidX;
  double v11 = MidY;
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (CGRect)_defaultRectangleForNewAnnotation:(id)a3 centeredAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  [(AKToolController *)self _modelBaseScaleFactorForNewAnnotation];
  double v9 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v10 = [(AKToolController *)self controller];
    double v11 = [v10 currentPageController];
    [v11 maxPageRect];
    double v14 = sqrt(v12 * v13 / 40.0 / 28800.0);
    double v15 = v9 * 400.0 * v14;
    double v16 = v9 * 72.0 * v14;
    id v17 = v7;
    double v18 = [v17 signature];
    double v19 = [v18 drawing];

    double v20 = [v17 signature];
    uint64_t v21 = v20;
    if (v19)
    {
      double v22 = [v20 drawing];
      [v22 bounds];
      double v24 = v23;
      double v26 = v25;
    }
    else
    {
      uint64_t v31 = [v20 path];

      if (!v31)
      {
        double v24 = *MEMORY[0x263F001B0];
        double v26 = *(double *)(MEMORY[0x263F001B0] + 8);
        goto LABEL_11;
      }
      uint64_t v21 = [v17 signature];
      [v21 pathBounds];
      double v24 = v32;
      double v26 = v33;
    }

LABEL_11:
    +[AKGeometryHelper rectForSize:inRect:](AKGeometryHelper, "rectForSize:inRect:", v24, v26, 0.0, 0.0, v15, v16);
    CGFloat v34 = v55.origin.x;
    CGFloat v35 = v55.origin.y;
    CGFloat width = v55.size.width;
    CGFloat height = v55.size.height;
    double v27 = CGRectGetWidth(v55);
    v56.origin.double x = v34;
    v56.origin.double y = v35;
    v56.size.CGFloat width = width;
    v56.size.CGFloat height = height;
    double v28 = CGRectGetHeight(v56);

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v27 = v9 * 175.0;
    double v28 = v9 * 131.0;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v10 = [v7 image];
    [v10 size];
    double v27 = v29;
    double v28 = v30;
LABEL_12:

    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v28 = v9 * 120.0;
LABEL_18:
    double v27 = v28;
    goto LABEL_13;
  }
  double v28 = v9 * 200.0;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_18;
  }
  double v53 = v9 * 150.0;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    double v27 = 24.0;
  }
  else {
    double v27 = v28;
  }
  if (isKindOfClass) {
    double v28 = 24.0;
  }
  else {
    double v28 = v53;
  }
LABEL_13:
  v38 = [(AKToolController *)self controller];
  v39 = [v38 currentPageController];
  v40 = [v39 overlayView];
  -[AKToolController _validatedRect:fitsInVisibleRegionOfOverlayView:ownedByPageController:centeredAtPoint:](self, "_validatedRect:fitsInVisibleRegionOfOverlayView:ownedByPageController:centeredAtPoint:", v40, v39, x - v27 * 0.5, y - v28 * 0.5, v27, v28, x, y);
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;

  double v49 = v42;
  double v50 = v44;
  double v51 = v46;
  double v52 = v48;
  result.size.CGFloat height = v52;
  result.size.CGFloat width = v51;
  result.origin.double y = v50;
  result.origin.double x = v49;
  return result;
}

- (CGRect)_validatedRect:(CGRect)a3 fitsInVisibleRegionOfOverlayView:(id)a4 ownedByPageController:(id)a5 centeredAtPoint:(CGPoint)a6
{
  CGFloat rect = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a5;
  [v9 visibleRectOfOverlay];
  objc_msgSend(v9, "convertRectFromModelToOverlay:");
  objc_msgSend(v9, "convertRectFromOverlayToModel:");
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v44.origin.CGFloat x = v11;
  v44.origin.CGFloat y = v13;
  v44.size.CGFloat width = v15;
  v44.size.CGFloat height = v17;
  double v18 = CGRectGetWidth(v44);
  v45.origin.CGFloat x = v11;
  v45.origin.CGFloat y = v13;
  v45.size.CGFloat width = v15;
  v45.size.CGFloat height = v17;
  double Height = CGRectGetHeight(v45);
  if (v18 < Height) {
    double Height = v18;
  }
  if (Height >= 20.0) {
    double v20 = 5.0;
  }
  else {
    double v20 = 0.0;
  }
  v46.origin.CGFloat x = v11;
  v46.origin.CGFloat y = v13;
  v46.size.CGFloat width = v15;
  v46.size.CGFloat height = v17;
  CGRect v47 = CGRectInset(v46, v20, v20);
  CGFloat v21 = v47.origin.x;
  CGFloat v22 = v47.origin.y;
  CGFloat v23 = v47.size.width;
  CGFloat v24 = v47.size.height;
  double v42 = CGRectGetWidth(v47);
  v48.origin.CGFloat x = v21;
  v48.origin.CGFloat y = v22;
  v48.size.CGFloat width = v23;
  v48.size.CGFloat height = v24;
  double v25 = CGRectGetHeight(v48);
  CGFloat v43 = x;
  v49.origin.CGFloat x = x;
  CGFloat v26 = y;
  v49.origin.CGFloat y = y;
  double v27 = width;
  v49.size.CGFloat width = width;
  v49.size.CGFloat height = rect;
  if (CGRectGetWidth(v49) <= v25
    && (v50.origin.CGFloat x = v43,
        v50.origin.CGFloat y = v26,
        v50.size.CGFloat width = width,
        v50.size.CGFloat height = rect,
        CGRectGetHeight(v50) <= v42))
  {
    double v33 = rect;
    double v35 = v26;
    double v34 = v43;
  }
  else
  {
    v51.origin.CGFloat x = v43;
    v51.origin.CGFloat y = v26;
    v51.size.CGFloat width = width;
    v51.size.CGFloat height = rect;
    double v28 = NSStringFromCGRect(v51);
    v52.origin.CGFloat x = v21;
    v52.origin.CGFloat y = v22;
    v52.size.CGFloat width = v23;
    v52.size.CGFloat height = v24;
    v39 = NSStringFromCGRect(v52);
    AKLog(@"Proposed rect %@ does not fit in visible region %@");

    if (v42 >= v25) {
      double v29 = v25;
    }
    else {
      double v29 = v42;
    }
    v53.origin.CGFloat x = v43;
    v53.origin.CGFloat y = v26;
    v53.size.CGFloat width = width;
    v53.size.CGFloat height = rect;
    double v30 = CGRectGetWidth(v53);
    v54.origin.CGFloat x = v43;
    v54.origin.CGFloat y = v26;
    v54.size.CGFloat width = width;
    v54.size.CGFloat height = rect;
    double v31 = CGRectGetWidth(v54);
    if (v30 >= v31) {
      double v31 = v30;
    }
    double v32 = v29 / v31;
    v55.origin.CGFloat x = v43;
    v55.origin.CGFloat y = v26;
    v55.size.CGFloat width = width;
    v55.size.CGFloat height = rect;
    double v27 = CGRectGetWidth(v55) * v32;
    v56.origin.CGFloat x = v43;
    v56.origin.CGFloat y = v26;
    v56.size.CGFloat width = v27;
    v56.size.CGFloat height = rect;
    double v33 = CGRectGetHeight(v56) * v32;
    v57.origin.CGFloat x = v43;
    v57.origin.CGFloat y = v26;
    v57.size.CGFloat width = v27;
    v57.size.CGFloat height = v33;
    double v34 = a6.x - CGRectGetWidth(v57) * 0.5;
    v58.origin.CGFloat x = v34;
    v58.origin.CGFloat y = v26;
    v58.size.CGFloat width = v27;
    v58.size.CGFloat height = v33;
    double v35 = a6.y - CGRectGetHeight(v58) * 0.5;
  }
  double v36 = v34;
  double v37 = v27;
  double v38 = v33;
  result.size.CGFloat height = v38;
  result.size.CGFloat width = v37;
  result.origin.CGFloat y = v35;
  result.origin.CGFloat x = v36;
  return result;
}

- (id)_defaultTypingAttributes
{
  v2 = [(AKToolController *)self controller];
  int v3 = [v2 attributeController];
  double v4 = [v3 textAttributes];
  double v5 = (void *)[v4 mutableCopy];

  double v6 = [v3 strokeColor];

  if (v6)
  {
    id v7 = [v3 strokeColor];
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x263F1C240]];
  }
  double v8 = [v3 font];
  [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x263F1C238]];

  return v5;
}

- (id)_defaultTextBoxTypingAttributes
{
  v2 = [(AKToolController *)self controller];
  int v3 = [v2 attributeController];
  double v4 = [v3 textAttributes];
  double v5 = (void *)[v4 mutableCopy];

  double v6 = [v3 font];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F1C238]];

  return v5;
}

- (id)_defaultHeartTypingAttributesWithFillColor:(id)a3
{
  id v4 = a3;
  double v5 = [(AKToolController *)self controller];
  double v6 = [v5 attributeController];
  id v7 = [v6 textAttributes];
  double v8 = (void *)[v7 mutableCopy];

  id v9 = [MEMORY[0x263F1C550] whiteColor];
  int v10 = [v4 akIsEqualToColor:v9];

  if (v10) {
    [MEMORY[0x263F1C550] blackColor];
  }
  else {
  CGFloat v11 = [MEMORY[0x263F1C550] whiteColor];
  }
  [v8 setObject:v11 forKeyedSubscript:*MEMORY[0x263F1C240]];
  double v12 = [v6 font];
  [v8 setObject:v12 forKeyedSubscript:*MEMORY[0x263F1C238]];

  return v8;
}

- (id)_defaultFillColorForAnnotationOfClass:(Class)a3
{
  return (id)objc_msgSend(MEMORY[0x263F1C550], "clearColor", a3);
}

- (void)_setRectangleToFitTextOnTextAnnotation:(id)a3
{
  id v4 = a3;
  double v5 = [(AKToolController *)self controller];
  double v6 = [v5 currentPageController];
  [(AKToolController *)self _defaultCenterForNewAnnotation];
  long long v8 = 0u;
  long long v9 = 0u;
  LOBYTE(v7) = 0;
  +[AKTextAnnotationRenderHelper getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:](AKTextAnnotationRenderHelper, "getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:", &v8, 0, 0, 0, 0, v4, v6, 0, v7, 0);
  objc_msgSend(v4, "setRectangle:", v8, v9);
}

- (unint64_t)_arrowStyleForToolTag:(int64_t)a3
{
  if ((unint64_t)(a3 - 764003) > 3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return qword_2376F45B0[a3 - 764003];
  }
}

- (void)_peripheralAvailabilityDidUpdate:(id)a3
{
  id v7 = [(AKToolController *)self controller];
  int v3 = [v7 peripheralAvailabilityManager];
  BOOL v4 = [v3 currentAvailability] == 1;

  double v5 = [v7 legacyDoodleController];
  [v5 setPressureSensitiveDoodleMode:v4];

  double v6 = [v7 legacyDoodleController];
  [v6 updateStrokeAttributes];
}

- (unint64_t)toolMode
{
  return self->_toolMode;
}

- (BOOL)allInkEnabled
{
  return self->_allInkEnabled;
}

- (void)setAllInkEnabled:(BOOL)a3
{
  self->_allInkEnabled = a3;
}

- (BOOL)pencilInkEnabled
{
  return self->_pencilInkEnabled;
}

- (void)setPencilInkEnabled:(BOOL)a3
{
  self->_pencilInkEnabled = a3;
}

- (AKController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (AKController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end