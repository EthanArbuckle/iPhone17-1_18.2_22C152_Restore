@interface AKAttributeController
+ (id)defaultFont;
+ (id)defaultTextAttributes;
+ (void)initialize;
- (AKAttributeController)initWithController:(id)a3;
- (AKController)controller;
- (AKPageModelController)modelControllerToObserveForSelections;
- (BOOL)_isEnabledForSender:(id)a3 segment:(int64_t)a4 withSelectedAnnotations:(id)a5;
- (BOOL)_updateStateOnSender:(id)a3 segment:(int64_t)a4 fromSelectedAnnotations:(id)a5;
- (BOOL)hasShadow;
- (BOOL)isAttributeSenderEnabled:(id)a3 segment:(int64_t)a4;
- (BOOL)strokeColorIsEqualTo:(id)a3;
- (BOOL)strokeIsDashed;
- (NSDictionary)textAttributes;
- (PKInk)ink;
- (UIColor)fillColor;
- (UIColor)strokeColor;
- (UIFont)font;
- (double)strokeWidth;
- (int64_t)brushStyle;
- (int64_t)highlightStyle;
- (unint64_t)arrowHeadStyle;
- (void)_allAnnotations:(id)a3 all:(BOOL *)a4 atLeastOneShare:(BOOL *)a5 attributeFromTag:(int64_t)a6;
- (void)_persistCurrentAttributes;
- (void)_restorePersistedAttributes;
- (void)_syncAttributesFromSelectedAnnotationsToUI;
- (void)_syncAttributesFromSenderToSelfAndSelectedAnnotations:(id)a3 segment:(int64_t)a4;
- (void)_updateInk;
- (void)_updateStateOnSender:(id)a3 segment:(int64_t)a4;
- (void)_updateStateOnSenderFromSelf:(id)a3 segment:(int64_t)a4;
- (void)annotationEditingDidEndWithCompletion:(id)a3;
- (void)forceHideRuler;
- (void)forceShowRuler;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performAttributeActionForSender:(id)a3 segment:(int64_t)a4;
- (void)resetToLastDrawingInk;
- (void)restoreStrokeColorToSystemDefault;
- (void)setArrowHeadStyle:(unint64_t)a3;
- (void)setBrushStyle:(int64_t)a3;
- (void)setController:(id)a3;
- (void)setDefaultInk;
- (void)setFillColor:(id)a3;
- (void)setFont:(id)a3;
- (void)setHasShadow:(BOOL)a3;
- (void)setHighlightStyle:(int64_t)a3;
- (void)setInk:(id)a3;
- (void)setModelControllerToObserveForSelections:(id)a3;
- (void)setStrokeColor:(id)a3;
- (void)setStrokeIsDashed:(BOOL)a3;
- (void)setStrokeWidth:(double)a3;
- (void)setTextAttributes:(id)a3;
- (void)syncFillColorOnSelectionToUI;
- (void)syncStrokeColorOnSelectionToUI;
- (void)toggleRuler;
- (void)updateAttributeSenderState:(id)a3 segment:(int64_t)a4 enabled:(BOOL)a5;
- (void)updateInkIfNeeded:(id)a3;
@end

@implementation AKAttributeController

+ (id)defaultFont
{
  return (id)[MEMORY[0x263F1C658] fontWithName:@"Helvetica" size:24.0];
}

+ (id)defaultTextAttributes
{
  v13[3] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F1C358] defaultParagraphStyle];
  v4 = (void *)[v3 mutableCopy];

  [v4 setAlignment:1];
  [v4 setDefaultTabInterval:0.0];
  [v4 setAllowsDefaultTighteningForTruncation:1];
  v5 = (void *)[v4 copy];
  v12[0] = *MEMORY[0x263F1C238];
  v6 = [a1 defaultFont];
  uint64_t v7 = *MEMORY[0x263F1C268];
  v13[0] = v6;
  v13[1] = v5;
  uint64_t v8 = *MEMORY[0x263F1C240];
  v12[1] = v7;
  v12[2] = v8;
  v9 = [MEMORY[0x263F1C550] blackColor];
  v13[2] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

+ (void)initialize
{
  v18[11] = *MEMORY[0x263EF8340];
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v16 = [a1 defaultFont];
    v4 = [a1 defaultTextAttributes];
    v17[0] = @"com.apple.AnnotationKit.userDefaultsVersion";
    v5 = [NSNumber numberWithInteger:1];
    v18[0] = v5;
    v17[1] = @"com.apple.AnnotationKit.strokeColor";
    v6 = (void *)MEMORY[0x263EFFA40];
    uint64_t v7 = [MEMORY[0x263F1C550] blackColor];
    uint64_t v8 = [v6 akDataForColor:v7];
    v18[1] = v8;
    v17[2] = @"com.apple.AnnotationKit.fillColor";
    v9 = (void *)MEMORY[0x263EFFA40];
    v10 = [MEMORY[0x263F1C550] clearColor];
    v11 = [v9 akDataForColor:v10];
    v18[2] = v11;
    v18[3] = &unk_26EA76A90;
    v17[3] = @"com.apple.AnnotationKit.strokeWidth";
    v17[4] = @"com.apple.AnnotationKit.strokeIsDashed";
    v18[4] = MEMORY[0x263EFFA80];
    v18[5] = MEMORY[0x263EFFA80];
    v17[5] = @"com.apple.AnnotationKit.hasShadow";
    v17[6] = @"com.apple.AnnotationKit.brushStyle";
    v18[6] = &unk_26EA763E8;
    v18[7] = &unk_26EA76400;
    v17[7] = @"com.apple.AnnotationKit.arrowHeadStyle";
    v17[8] = @"com.apple.AnnotationKit.font";
    v12 = [MEMORY[0x263EFFA40] akDataForFont:v16];
    v18[8] = v12;
    v17[9] = @"com.apple.AnnotationKit.textAttributes";
    v13 = [MEMORY[0x263EFFA40] akDataForTextAttributes:v4];
    v17[10] = @"com.apple.AnnotationKit.highlightStyle";
    v18[9] = v13;
    v18[10] = &unk_26EA76418;
    v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:11];

    v15 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v15 registerDefaults:v14];
  }
}

- (AKAttributeController)initWithController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKAttributeController;
  v5 = [(AKAttributeController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(AKAttributeController *)v5 setController:v4];
    [(AKAttributeController *)v6 _restorePersistedAttributes];
  }

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"AKAttributeController.selectedAnnotationsObservationContext")
  {
    [(AKAttributeController *)self _syncAttributesFromSelectedAnnotationsToUI];
  }
  else
  {
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)AKAttributeController;
    -[AKAttributeController observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)setStrokeColor:(id)a3
{
  id v5 = a3;
  strokeColor = self->_strokeColor;
  p_strokeColor = &self->_strokeColor;
  id v8 = v5;
  if (!-[UIColor akIsEqualToColor:](strokeColor, "akIsEqualToColor:")) {
    objc_storeStrong((id *)p_strokeColor, a3);
  }
}

- (void)forceHideRuler
{
  id v6 = [(AKAttributeController *)self controller];
  v2 = [v6 currentPageController];
  id v3 = [v2 inkPageOverlayController];
  id v4 = [v3 inkOverlayView];
  id v5 = [v4 canvasView];
  [v5 setRulerActive:0];
}

- (void)forceShowRuler
{
  id v6 = [(AKAttributeController *)self controller];
  v2 = [v6 currentPageController];
  id v3 = [v2 inkPageOverlayController];
  id v4 = [v3 inkOverlayView];
  id v5 = [v4 canvasView];
  [v5 setRulerActive:1];
}

- (void)toggleRuler
{
  id v9 = [(AKAttributeController *)self controller];
  v2 = [v9 toolController];
  uint64_t v3 = [v2 toolMode];

  if (v3 == 4)
  {
    id v4 = [v9 modelController];
    [v4 deselectAllAnnotations];
  }
  id v5 = [v9 currentPageController];
  id v6 = [v5 inkPageOverlayController];
  [v6 didToggleRuler];

  uint64_t v7 = [v9 toolbarViewController];
  [v7 revalidateItems];

  id v8 = [v9 modernToolbarView];
  [v8 revalidateItems];
}

- (void)annotationEditingDidEndWithCompletion:(id)a3
{
  id v8 = (void (**)(void))a3;
  id v4 = [(AKAttributeController *)self controller];
  id v5 = [v4 currentPageController];

  id v6 = [v5 inkPageOverlayController];

  if (v6)
  {
    uint64_t v7 = [v5 inkPageOverlayController];
    [v7 annotationEditingDidEndWithCompletion:v8];
  }
  else if (v8)
  {
    v8[2]();
  }
}

- (void)setInk:(id)a3
{
  id v9 = a3;
  if ((-[PKInk isEqual:](self->_ink, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)&self->_ink, a3);
  }
  id v5 = [(AKAttributeController *)self controller];
  id v6 = [v5 toolController];
  uint64_t v7 = [v6 toolMode];

  if (v7 == 4)
  {
    id v8 = [v5 modelController];
    [v8 deselectAllAnnotations];
  }
  [(AKAttributeController *)self _updateInk];
}

- (void)setHighlightStyle:(int64_t)a3
{
  self->_highlightStyle = a3;
  [(AKAttributeController *)self _persistCurrentAttributes];
}

- (void)performAttributeActionForSender:(id)a3 segment:(int64_t)a4
{
}

- (BOOL)isAttributeSenderEnabled:(id)a3 segment:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(AKAttributeController *)self modelControllerToObserveForSelections];
  id v8 = [v7 selectedAnnotations];

  LOBYTE(a4) = [(AKAttributeController *)self _isEnabledForSender:v6 segment:a4 withSelectedAnnotations:v8];
  return a4;
}

- (void)updateAttributeSenderState:(id)a3 segment:(int64_t)a4 enabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (objc_opt_respondsToSelector()) {
    [v8 setEnabled:v5];
  }
  [(AKAttributeController *)self _updateStateOnSender:v8 segment:a4];
}

- (BOOL)strokeColorIsEqualTo:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AKAttributeController *)self strokeColor];
  char v6 = [v5 akIsEqualToColor:v4];

  return v6;
}

- (void)restoreStrokeColorToSystemDefault
{
  id v3 = [MEMORY[0x263F1C550] blackColor];
  [(AKAttributeController *)self setStrokeColor:v3];
}

- (void)setModelControllerToObserveForSelections:(id)a3
{
  BOOL v5 = (AKPageModelController *)a3;
  modelControllerToObserveForSelections = self->modelControllerToObserveForSelections;
  uint64_t v7 = v5;
  if (modelControllerToObserveForSelections != v5)
  {
    if (modelControllerToObserveForSelections) {
      [(AKPageModelController *)modelControllerToObserveForSelections removeObserver:self forKeyPath:@"selectedAnnotations"];
    }
    objc_storeStrong((id *)&self->modelControllerToObserveForSelections, a3);
    if (self->modelControllerToObserveForSelections)
    {
      [(AKAttributeController *)self _syncAttributesFromSelectedAnnotationsToUI];
      [(AKPageModelController *)self->modelControllerToObserveForSelections addObserver:self forKeyPath:@"selectedAnnotations" options:0 context:@"AKAttributeController.selectedAnnotationsObservationContext"];
    }
  }
}

- (void)setDefaultInk
{
  id v3 = (void *)MEMORY[0x263F14B48];
  id v4 = [(AKAttributeController *)self controller];
  objc_msgSend(v3, "akDefaultInkWithHighVisibility:", objc_msgSend(v4, "useHighVisibilityDefaultInks"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [(AKAttributeController *)self setInk:v5];
}

- (void)resetToLastDrawingInk
{
  id v3 = [(AKAttributeController *)self controller];
  id v9 = [v3 modernToolbarView];

  if (v9)
  {
    [v9 resetToLastDrawingTool];
  }
  else
  {
    id v4 = [(AKAttributeController *)self ink];

    if (v4)
    {
      id v5 = (void *)MEMORY[0x263F14B48];
      char v6 = [(AKAttributeController *)self ink];
      uint64_t v7 = [(AKAttributeController *)self strokeColor];
      [(AKAttributeController *)self strokeWidth];
      id v8 = objc_msgSend(v5, "akInkFromInk:color:strokeWidth:", v6, v7);

      [(AKAttributeController *)self setInk:v8];
    }
    else
    {
      [(AKAttributeController *)self setDefaultInk];
    }
  }
}

- (void)updateInkIfNeeded:(id)a3
{
  id v8 = a3;
  if ([v8 conformsToProtocol:&unk_26EA897C8]
    && [v8 wantsInkUpdate])
  {
    id v4 = (void *)MEMORY[0x263F14B48];
    id v5 = [(AKAttributeController *)self ink];
    char v6 = [(AKAttributeController *)self strokeColor];
    [(AKAttributeController *)self strokeWidth];
    uint64_t v7 = objc_msgSend(v4, "akInkFromInk:color:strokeWidth:", v5, v6);
    [(AKAttributeController *)self setInk:v7];
  }
}

- (void)_updateInk
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"AKAttributeController.inkDidChange" object:self];

  id v6 = [(AKAttributeController *)self controller];
  id v4 = [v6 toolbarViewController];
  [v4 revalidateItems];

  id v5 = [v6 modernToolbarView];
  [v5 revalidateItems];
}

- (void)_persistCurrentAttributes
{
  id v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v7 setInteger:1 forKey:@"com.apple.AnnotationKit.userDefaultsVersion"];
  id v3 = [(AKAttributeController *)self strokeColor];
  [v7 akSetColor:v3 forKey:@"com.apple.AnnotationKit.strokeColor"];

  id v4 = [(AKAttributeController *)self fillColor];
  [v7 akSetColor:v4 forKey:@"com.apple.AnnotationKit.fillColor"];

  [(AKAttributeController *)self strokeWidth];
  objc_msgSend(v7, "setDouble:forKey:", @"com.apple.AnnotationKit.strokeWidth");
  objc_msgSend(v7, "setBool:forKey:", -[AKAttributeController strokeIsDashed](self, "strokeIsDashed"), @"com.apple.AnnotationKit.strokeIsDashed");
  objc_msgSend(v7, "setBool:forKey:", -[AKAttributeController hasShadow](self, "hasShadow"), @"com.apple.AnnotationKit.hasShadow");
  objc_msgSend(v7, "setInteger:forKey:", -[AKAttributeController brushStyle](self, "brushStyle"), @"com.apple.AnnotationKit.brushStyle");
  objc_msgSend(v7, "setInteger:forKey:", -[AKAttributeController arrowHeadStyle](self, "arrowHeadStyle"), @"com.apple.AnnotationKit.arrowHeadStyle");
  id v5 = [(AKAttributeController *)self font];
  [v7 akSetFont:v5 forKey:@"com.apple.AnnotationKit.font"];

  id v6 = [(AKAttributeController *)self textAttributes];
  [v7 akSetTextAttributes:v6 forKey:@"com.apple.AnnotationKit.textAttributes"];

  objc_msgSend(v7, "setInteger:forKey:", -[AKAttributeController highlightStyle](self, "highlightStyle"), @"com.apple.AnnotationKit.highlightStyle");
}

- (void)_restorePersistedAttributes
{
  id v21 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v21 removeObjectForKey:@"com.apple.AnnotationKit.strokeColor"];
  [v21 removeObjectForKey:@"com.apple.AnnotationKit.fillColor"];
  [v21 removeObjectForKey:@"com.apple.AnnotationKit.strokeWidth"];
  [v21 removeObjectForKey:@"com.apple.AnnotationKit.strokeIsDashed"];
  [v21 removeObjectForKey:@"com.apple.AnnotationKit.hasShadow"];
  [v21 removeObjectForKey:@"com.apple.AnnotationKit.brushStyle"];
  [v21 removeObjectForKey:@"com.apple.AnnotationKit.arrowHeadStyle"];
  [v21 removeObjectForKey:@"com.apple.AnnotationKit.font"];
  [v21 removeObjectForKey:@"com.apple.AnnotationKit.textAttributes"];
  [v21 removeObjectForKey:@"com.apple.AnnotationKit.highlightStyle"];
  id v3 = [MEMORY[0x263F1C550] blackColor];
  [(AKAttributeController *)self setStrokeColor:v3];

  id v4 = [MEMORY[0x263F1C550] clearColor];
  [(AKAttributeController *)self setFillColor:v4];

  [v21 doubleForKey:@"com.apple.AnnotationKit.strokeWidth"];
  -[AKAttributeController setStrokeWidth:](self, "setStrokeWidth:");
  -[AKAttributeController setStrokeIsDashed:](self, "setStrokeIsDashed:", [v21 BOOLForKey:@"com.apple.AnnotationKit.strokeIsDashed"]);
  -[AKAttributeController setHasShadow:](self, "setHasShadow:", [v21 BOOLForKey:@"com.apple.AnnotationKit.hasShadow"]);
  -[AKAttributeController setBrushStyle:](self, "setBrushStyle:", [v21 integerForKey:@"com.apple.AnnotationKit.brushStyle"]);
  unint64_t v5 = [v21 integerForKey:@"com.apple.AnnotationKit.arrowHeadStyle"];
  if (v5 >= 3) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = v5;
  }
  [(AKAttributeController *)self setArrowHeadStyle:v6];
  id v7 = [v21 akFontForKey:@"com.apple.AnnotationKit.font"];
  [(AKAttributeController *)self setFont:v7];

  id v8 = [(AKAttributeController *)self font];

  id v9 = [(id)objc_opt_class() defaultFont];
  uint64_t v10 = v9;
  if (v8)
  {
    [v9 pointSize];
    double v12 = v11;

    uint64_t v10 = [(AKAttributeController *)self font];
    v13 = [v10 fontWithSize:v12];
    [(AKAttributeController *)self setFont:v13];
  }
  else
  {
    [(AKAttributeController *)self setFont:v9];
  }

  v14 = [v21 akTextAttributesForKey:@"com.apple.AnnotationKit.textAttributes"];
  [(AKAttributeController *)self setTextAttributes:v14];

  v15 = [(AKAttributeController *)self textAttributes];

  if (!v15)
  {
    v16 = [(id)objc_opt_class() defaultTextAttributes];
    [(AKAttributeController *)self setTextAttributes:v16];
  }
  v17 = [(AKAttributeController *)self textAttributes];
  v18 = (void *)[v17 mutableCopy];

  v19 = [(AKAttributeController *)self font];
  [v18 setObject:v19 forKeyedSubscript:*MEMORY[0x263F1C238]];

  v20 = (void *)[v18 copy];
  [(AKAttributeController *)self setTextAttributes:v20];

  -[AKAttributeController setHighlightStyle:](self, "setHighlightStyle:", [v21 integerForKey:@"com.apple.AnnotationKit.highlightStyle"]);
}

- (void)_syncAttributesFromSenderToSelfAndSelectedAnnotations:(id)a3 segment:(int64_t)a4
{
  uint64_t v190 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 tag];
  if (objc_opt_respondsToSelector()) {
    uint64_t v7 = [v6 tagForSegment:a4];
  }
  v163 = [(AKAttributeController *)self controller];
  id v8 = [(AKAttributeController *)self modelControllerToObserveForSelections];
  id v9 = [v8 selectedAnnotations];

  uint64_t v162 = v7;
  if (v7 <= 765099)
  {
    if ((unint64_t)(v7 - 765001) < 0xF)
    {
      if ([v6 conformsToProtocol:&unk_26EA89758]) {
        [v6 lineWidth];
      }
      else {
        double v10 = (double)([v6 tag] - 765000);
      }
      [(AKAttributeController *)self setStrokeWidth:v10];
LABEL_13:
      [(AKAttributeController *)self updateInkIfNeeded:v6];
    }
  }
  else
  {
    switch(v7)
    {
      case 765100:
        [(AKAttributeController *)self setHasShadow:[(AKAttributeController *)self hasShadow] ^ 1];
        break;
      case 765101:
        v130 = [v6 color];
        [(AKAttributeController *)self setStrokeColor:v130];

        goto LABEL_13;
      case 765102:
        v129 = [v6 color];
        [(AKAttributeController *)self setFillColor:v129];
        goto LABEL_150;
      case 765103:
        if ([(AKAttributeController *)self brushStyle]) {
          [(AKAttributeController *)self setBrushStyle:0];
        }
        [(AKAttributeController *)self setStrokeIsDashed:[(AKAttributeController *)self strokeIsDashed] ^ 1];
        break;
      case 765104:
        if ([(AKAttributeController *)self strokeIsDashed]) {
          [(AKAttributeController *)self setStrokeIsDashed:0];
        }
        [(AKAttributeController *)self setBrushStyle:[(AKAttributeController *)self brushStyle] == 0];
        break;
      case 765105:
        v131 = [(AKAttributeController *)self font];
        v132 = [v6 convertFont:v131];
        [(AKAttributeController *)self setFont:v132];

        v133 = [(AKAttributeController *)self font];

        if (!v133)
        {
          v134 = [(id)objc_opt_class() defaultFont];
          [(AKAttributeController *)self setFont:v134];
        }
        v135 = [(AKAttributeController *)self textAttributes];
        v136 = (void *)[v135 mutableCopy];

        uint64_t v137 = *MEMORY[0x263F1C238];
        [v136 objectForKeyedSubscript:*MEMORY[0x263F1C238]];
        v139 = v138 = self;

        if (v139)
        {
          v140 = [v136 objectForKeyedSubscript:v137];
          v141 = [v6 convertFont:v140];
        }
        else
        {
          v141 = [(AKAttributeController *)v138 font];
        }
        [v136 setObject:v141 forKeyedSubscript:v137];

        v147 = (void *)[v136 copy];
        [(AKAttributeController *)v138 setTextAttributes:v147];

        self = v138;
        break;
      case 765106:
        v142 = [(AKAttributeController *)self textAttributes];
        v143 = [v6 convertTextAttributes:v142];
        [(AKAttributeController *)self setTextAttributes:v143];

        v144 = [(AKAttributeController *)self textAttributes];

        if (v144) {
          break;
        }
        v129 = [(id)objc_opt_class() defaultTextAttributes];
        [(AKAttributeController *)self setTextAttributes:v129];
        goto LABEL_150;
      case 765107:
        v145 = self;
        uint64_t v146 = 0;
        goto LABEL_155;
      case 765108:
        v145 = self;
        uint64_t v146 = 1;
        goto LABEL_155;
      case 765109:
        v145 = self;
        uint64_t v146 = 2;
        goto LABEL_155;
      case 765110:
        v145 = self;
        uint64_t v146 = 3;
LABEL_155:
        [(AKAttributeController *)v145 setArrowHeadStyle:v146];
        break;
      default:
        if ((unint64_t)(v7 - 765200) >= 7)
        {
          if (v7 == 765300)
          {
            v129 = [v6 ink];
            [(AKAttributeController *)self setInk:v129];
LABEL_150:
          }
        }
        else
        {
          -[AKAttributeController setHighlightStyle:](self, "setHighlightStyle:", [v6 tag]);
        }
        break;
    }
  }
  long long v183 = 0u;
  long long v184 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  id obj = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v181 objects:v189 count:16];
  v159 = v6;
  v160 = self;
  double v12 = v163;
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v165 = *(void *)v182;
    uint64_t v154 = *MEMORY[0x263F1C240];
    uint64_t v14 = 1;
    if (v162 == 765206) {
      uint64_t v14 = 2;
    }
    uint64_t v152 = *MEMORY[0x263F1C238];
    uint64_t v153 = *MEMORY[0x263F1C260];
    if (v162 == 765205) {
      uint64_t v14 = 3;
    }
    uint64_t v161 = v14;
    unint64_t v15 = v162 - 765001;
    uint64_t v16 = v162 - 765100;
    while (1)
    {
      uint64_t v17 = 0;
      while (2)
      {
        if (*(void *)v182 != v165) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v181 + 1) + 8 * v17);
        v19 = [v12 currentPageController];
        if (objc_opt_respondsToSelector()) {
          char v20 = [v18 pathIsPrestroked];
        }
        else {
          char v20 = 0;
        }
        if (v15 <= 0x31 && ((1 << v15) & 0x2000000007FFFLL) != 0)
        {
          if (v20 & 1) == 0 && (objc_opt_respondsToSelector())
          {
            double v21 = 1.0;
            if (v162 == 765050)
            {
              double v22 = 1.0;
            }
            else
            {
              double v22 = (double)([v6 tag] - 765000);
              if (v162 != 765001)
              {
                [v19 modelBaseScaleFactor];
                double v21 = v34;
              }
            }
            [v18 setStrokeWidth:v22 * v21];
            v35 = [v18 strokeColor];

            if (!v35)
            {
              v36 = [(AKAttributeController *)self strokeColor];
              [v18 setStrokeColor:v36];
            }
            double v12 = v163;
            if ([v18 conformsToAKTextAnnotationProtocol]) {
              +[AKTextAnnotationAttributeHelper adjustBoundsOfAnnotation:v18 toFitOptionalText:0 onPageController:v19];
            }
          }
          goto LABEL_73;
        }
        switch(v16)
        {
          case 0:
            if (objc_opt_respondsToSelector()) {
              objc_msgSend(v18, "setHasShadow:", -[AKAttributeController hasShadow](self, "hasShadow"));
            }
            goto LABEL_73;
          case 1:
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              goto LABEL_73;
            }
            v37 = [v18 strokeColor];
            v157 = [v6 color];
            objc_msgSend(v18, "setStrokeColor:");
            if (objc_opt_respondsToSelector())
            {
              [v18 strokeWidth];
              if (v38 == 0.0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  [(AKAttributeController *)self strokeWidth];
                  objc_msgSend(v18, "setStrokeWidth:");
                }
              }
            }
            if ([v18 conformsToAKFilledAnnotationProtocol])
            {
              v39 = [v18 fillColor];
              v40 = v39;
              if (v39 && CGColorGetAlpha((CGColorRef)[v39 CGColor]) != 0.0) {
                [v18 setFillColor:v157];
              }

              double v12 = v163;
            }
            if (![v18 conformsToAKTextAnnotationProtocol]) {
              goto LABEL_113;
            }
            id v41 = v18;
            +[AKTextAnnotationAttributeHelper adjustBoundsOfAnnotation:v41 toFitOptionalText:0 onPageController:v19];
            if ([v41 conformsToAKFilledAnnotationProtocol])
            {
              v148 = v37;
              v42 = [v41 annotationText];
              id v43 = [v41 strokeColor];
              v44 = v43;
              v155 = v42;
              v150 = v43;
              if (objc_opt_respondsToSelector())
              {
                v45 = [v41 fillColor];
                v44 = v43;
                if (v45)
                {
                  v44 = v43;
                  if ([v43 akIsEqualToColor:v45])
                  {
                    v46 = [MEMORY[0x263F1C550] whiteColor];
                    int v47 = [v43 akIsEqualToColor:v46];

                    if (v47) {
                      [MEMORY[0x263F1C550] blackColor];
                    }
                    else {
                    v44 = [MEMORY[0x263F1C550] whiteColor];
                    }
                  }
                }

                v42 = v155;
              }
              if (v42 && [v42 length])
              {
                v88 = (void *)[v42 mutableCopy];
                uint64_t v187 = v154;
                v188 = v44;
                v89 = [NSDictionary dictionaryWithObjects:&v188 forKeys:&v187 count:1];
                objc_msgSend(v88, "addAttributes:range:", v89, 0, objc_msgSend(v155, "length"));

                id v90 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithAttributedString:v88];
                [v41 setAnnotationText:v90];
              }
              v91 = [v41 typingAttributes];
              v92 = (void *)[v91 mutableCopy];

              [v92 setObject:v44 forKeyedSubscript:v154];
              [v41 setTypingAttributes:v92];

              self = v160;
              v37 = v148;
            }
            else
            {
              if ([v41 isMemberOfClass:objc_opt_class()]) {
                goto LABEL_112;
              }
              v75 = [v41 annotationText];
              v155 = v75;
              if (v75)
              {
                v76 = v75;
                if ([v75 length])
                {
                  v149 = v37;
                  v77 = (void *)[v76 mutableCopy];
                  v78 = [v76 attributesAtIndex:0 effectiveRange:0];
                  v79 = [v78 objectForKeyedSubscript:v154];
                  v80 = v79;
                  if (!v79 || [v79 akIsEqualToColor:v149])
                  {
                    v81 = [v41 strokeColor];
                    uint64_t v185 = v154;
                    v186 = v81;
                    [NSDictionary dictionaryWithObjects:&v186 forKeys:&v185 count:1];
                    v82 = v151 = v78;
                    objc_msgSend(v77, "addAttributes:range:", v82, 0, objc_msgSend(v155, "length"));

                    id v83 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithAttributedString:v77];
                    [v41 setAnnotationText:v83];

                    v78 = v151;
                    self = v160;
                  }

                  v37 = v149;
                }
              }
              v84 = [v41 typingAttributes];
              v85 = (void *)[v84 mutableCopy];

              v86 = [v159 color];
              [v85 setObject:v86 forKeyedSubscript:v154];

              v150 = v85;
              v87 = v85;
              id v6 = v159;
              [v41 setTypingAttributes:v87];
            }

            double v12 = v163;
LABEL_112:

LABEL_113:
LABEL_73:

            ++v17;
            uint64_t v16 = v162 - 765100;
            if (v13 != v17) {
              continue;
            }
            uint64_t v93 = [obj countByEnumeratingWithState:&v181 objects:v189 count:16];
            uint64_t v13 = v93;
            if (!v93) {
              goto LABEL_115;
            }
            break;
          case 2:
            if (objc_opt_respondsToSelector())
            {
              id v25 = [v6 color];
              [v18 setFillColor:v25];
              goto LABEL_71;
            }
            goto LABEL_73;
          case 3:
            if (v20 & 1) == 0 && (objc_opt_respondsToSelector())
            {
              if (objc_opt_respondsToSelector()) {
                [v18 setBrushStyle:0];
              }
              objc_msgSend(v18, "setDashed:", -[AKAttributeController strokeIsDashed](self, "strokeIsDashed"));
            }
            goto LABEL_73;
          case 4:
            if (v20 & 1) == 0 && (objc_opt_respondsToSelector())
            {
              if (objc_opt_respondsToSelector()) {
                [v18 setDashed:0];
              }
              objc_msgSend(v18, "setBrushStyle:", -[AKAttributeController brushStyle](self, "brushStyle"));
            }
            goto LABEL_73;
          case 5:
            if ([v18 conformsToAKTextAnnotationProtocol])
            {
              id v48 = v18;
              id v49 = v6;
              v50 = [v48 annotationText];
              v51 = (void *)[v50 mutableCopy];

              objc_msgSend(v51, "removeAttribute:range:", v153, 0, objc_msgSend(v51, "length"));
              v52 = [v48 annotationText];
              v178[0] = MEMORY[0x263EF8330];
              v178[1] = 3221225472;
              v178[2] = sub_237640D94;
              v178[3] = &unk_264CDAF58;
              id v158 = v49;
              id v179 = v158;
              id v53 = v51;
              id v180 = v53;
              +[AKTextAnnotationAttributeHelper enumerateFontAttributesOfAttributedString:v52 usingBlock:v178];

              v156 = v53;
              id v54 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithAttributedString:v53];
              [v48 setAnnotationText:v54];

              v55 = [v48 typingAttributes];
              v56 = (void *)[v55 mutableCopy];

              v57 = [v48 typingAttributes];
              v58 = [v57 objectForKeyedSubscript:v152];

              if (v58)
              {
                v59 = [v56 objectForKeyedSubscript:v152];
                v60 = [v158 convertFont:v59];
              }
              else
              {
                v60 = [(AKAttributeController *)v160 font];
              }
              [v56 setObject:v60 forKeyedSubscript:v152];

              [v48 setTypingAttributes:v56];
              +[AKTextAnnotationAttributeHelper adjustBoundsOfAnnotation:v48 toFitOptionalText:0 onPageController:v19];

              v74 = v179;
              goto LABEL_95;
            }
            goto LABEL_73;
          case 6:
            if ([v18 conformsToAKTextAnnotationProtocol])
            {
              id v48 = v18;
              id v61 = v6;
              v62 = [v48 annotationText];
              v63 = (void *)[v62 mutableCopy];

              uint64_t v64 = [v63 length];
              v175[0] = MEMORY[0x263EF8330];
              v175[1] = 3221225472;
              v175[2] = sub_237640E14;
              v175[3] = &unk_264CDB258;
              id v65 = v61;
              id v176 = v65;
              id v66 = v63;
              id v177 = v66;
              objc_msgSend(v66, "enumerateAttributesInRange:options:usingBlock:", 0, v64, 0, v175);
              v156 = v66;
              id v67 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithAttributedString:v66];
              [v48 setAnnotationText:v67];

              v68 = [v48 typingAttributes];
              id v158 = v65;
              v69 = [v65 convertTextAttributes:v68];

              [v48 setTypingAttributes:v69];
              uint64_t v70 = [v69 objectForKeyedSubscript:v154];
              if (v70)
              {
                v71 = (void *)v70;
                char v72 = objc_opt_respondsToSelector();

                if (v72)
                {
                  v73 = [v69 objectForKeyedSubscript:v154];
                  [v48 setStrokeColor:v73];
                }
              }
              +[AKTextAnnotationAttributeHelper adjustBoundsOfAnnotation:v48 toFitOptionalText:0 onPageController:v19];

              v74 = v176;
LABEL_95:

              id v6 = v159;
              self = v160;
              goto LABEL_72;
            }
            goto LABEL_73;
          case 7:
          case 8:
          case 9:
          case 10:
            if (objc_opt_respondsToSelector()) {
              objc_msgSend(v18, "setArrowHeadStyle:", -[AKAttributeController arrowHeadStyle](self, "arrowHeadStyle"));
            }
            goto LABEL_73;
          default:
            if ((unint64_t)(v162 - 765200) >= 7) {
              goto LABEL_73;
            }
            v23 = self;
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              id v25 = v18;
              [v25 setStyle:v161];
              v26 = +[AKHighlightAppearanceHelper colorForHighlightAttributeWithTag:v162];
              [v25 setColor:v26];

              if ([v25 conformsToAKParentAnnotationProtocol])
              {
                v27 = [v25 childAnnotation];
                v28 = self;
                char v29 = objc_opt_isKindOfClass();

                if (v29)
                {
                  v30 = +[AKHighlightAppearanceHelper colorForNoteOfHighlightAttributeTag:v162];
                  [v27 setFillColor:v30];
                }
                id v6 = v159;
                self = v160;
              }
            }
            else
            {
              v31 = self;
              char v32 = objc_opt_isKindOfClass();

              double v12 = v163;
              if ((v32 & 1) == 0 || (unint64_t)(v162 - 765200) > 4) {
                goto LABEL_73;
              }
              id v33 = v18;
              id v25 = +[AKHighlightAppearanceHelper colorForNoteOfHighlightAttributeTag:v162];
              [v33 setFillColor:v25];
            }
LABEL_71:

LABEL_72:
            double v12 = v163;
            goto LABEL_73;
        }
        break;
      }
    }
  }
LABEL_115:

  v94 = [v12 textEditorController];
  int v95 = [v94 isEditing];

  uint64_t v96 = v162;
  if (v95)
  {
    v97 = [v163 textEditorController];
    v98 = [v97 annotation];
    v99 = [v97 textView];
    v100 = [v99 textStorage];
    if (v162 == 765106)
    {
      id v115 = v6;
      uint64_t v116 = [v100 length];
      v167[0] = MEMORY[0x263EF8330];
      v167[1] = 3221225472;
      v167[2] = sub_237640F4C;
      v167[3] = &unk_264CDB258;
      id v168 = v115;
      id v169 = v100;
      id v117 = v115;
      objc_msgSend(v169, "enumerateAttributesInRange:options:usingBlock:", 0, v116, 0, v167);
      v118 = [v99 typingAttributes];
      v119 = [v117 convertTextAttributes:v118];
      [v99 setTypingAttributes:v119];

      [v97 updateForTextAttributeChange];
      id v106 = v168;
    }
    else
    {
      if (v162 != 765105)
      {
LABEL_124:

        goto LABEL_125;
      }
      id v101 = v6;
      [v98 originalModelBaseScaleFactor];
      double v103 = v102;
      v104 = (void *)[v100 mutableCopy];
      unint64_t v105 = 0x264CDA000uLL;
      v170[0] = MEMORY[0x263EF8330];
      v170[1] = 3221225472;
      v170[2] = sub_237640E88;
      v170[3] = &unk_264CDB280;
      double v173 = 1.0 / v103;
      id v166 = v101;
      id v171 = v166;
      double v174 = v103;
      id v106 = v104;
      id v172 = v106;
      +[AKTextAnnotationAttributeHelper enumerateFontAttributesOfAttributedString:v100 usingBlock:v170];
      [v100 setAttributedString:v106];
      v107 = [v99 typingAttributes];
      v108 = +[AKTextAnnotationAttributeHelper typingAttributes:v107 byApplyingScaleFactor:1.0 / v103];

      v109 = (void *)[v108 mutableCopy];
      uint64_t v110 = *MEMORY[0x263F1C238];
      v111 = [v109 objectForKeyedSubscript:*MEMORY[0x263F1C238]];

      if (v111)
      {
        [v109 objectForKeyedSubscript:v110];
        v113 = v112 = v98;
        v114 = [v166 convertFont:v113];

        v98 = v112;
        unint64_t v105 = 0x264CDA000;
      }
      else
      {
        v114 = [(AKAttributeController *)v160 font];
      }
      [v109 setObject:v114 forKeyedSubscript:v110];

      v120 = [*(id *)(v105 + 1568) typingAttributes:v109 byApplyingScaleFactor:v103];

      [v99 setTypingAttributes:v120];
      [v97 updateForTextAttributeChange];

      id v6 = v159;
    }

    self = v160;
    uint64_t v96 = v162;
    goto LABEL_124;
  }
LABEL_125:
  uint64_t v121 = v96 - 765000;
  if ((unint64_t)(v96 - 765105) <= 1)
  {
    v122 = [v163 toolbarViewController];
    [v122 revalidateItems];
  }
  BOOL v123 = (v96 & 0xFFFFFFFFFFFFFFFELL) == 765100;
  v124 = v163;
  if (v123 || (unint64_t)(v121 - 1) <= 0xE)
  {
    v125 = [v163 toolController];
    if ([v125 toolMode] == 1)
    {

LABEL_132:
      v128 = [v163 legacyDoodleController];
      [v128 updateStrokeAttributes];

      v124 = v163;
      goto LABEL_133;
    }
    v126 = [v163 toolController];
    uint64_t v127 = [v126 toolMode];

    if (v127 == 2) {
      goto LABEL_132;
    }
  }
LABEL_133:
  [(AKAttributeController *)self _persistCurrentAttributes];
}

- (void)_syncAttributesFromSelectedAnnotationsToUI
{
  id v4 = [(AKAttributeController *)self controller];
  id v3 = [v4 toolbarViewController];
  [v3 revalidateItems];

  [(AKAttributeController *)self syncFillColorOnSelectionToUI];
  [(AKAttributeController *)self syncStrokeColorOnSelectionToUI];
}

- (void)syncFillColorOnSelectionToUI
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = [(AKAttributeController *)self controller];
  id v4 = [(AKAttributeController *)self modelControllerToObserveForSelections];
  unint64_t v5 = [v4 selectedAnnotations];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v7)
  {

LABEL_21:
    if (objc_msgSend(v6, "count", (void)v18)) {
      [MEMORY[0x263F1C550] clearColor];
    }
    else {
    id v9 = [(AKAttributeController *)self fillColor];
    }
    goto LABEL_25;
  }
  uint64_t v8 = v7;
  id v9 = 0;
  uint64_t v10 = *(void *)v19;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v6);
      }
      double v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v13 = objc_msgSend(v12, "performSelector:", sel_fillColor, (void)v18);
        id v14 = v13;
        if (v9 || !v13)
        {
          if (v9 && v13 && ([v9 akIsEqualToColor:v13] & 1) == 0)
          {
            uint64_t v16 = [MEMORY[0x263F1C550] whiteColor];

            id v9 = (void *)v16;
            goto LABEL_18;
          }
        }
        else
        {
          id v14 = v13;
          id v9 = v14;
        }
      }
      else
      {
        id v14 = 0;
      }

      ++v11;
    }
    while (v8 != v11);
    uint64_t v15 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    uint64_t v8 = v15;
  }
  while (v15);
LABEL_18:

  if (!v9) {
    goto LABEL_21;
  }
LABEL_25:
  uint64_t v17 = objc_msgSend(v3, "toolbarViewController", (void)v18);
  [v17 setFillColorUIDisplayToColor:v9];
}

- (void)syncStrokeColorOnSelectionToUI
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = [(AKAttributeController *)self controller];
  id v4 = [(AKAttributeController *)self modelControllerToObserveForSelections];
  unint64_t v5 = [v4 selectedAnnotations];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v7)
  {

LABEL_21:
    if (objc_msgSend(v6, "count", (void)v18)) {
      [MEMORY[0x263F1C550] clearColor];
    }
    else {
    id v9 = [(AKAttributeController *)self strokeColor];
    }
    goto LABEL_25;
  }
  uint64_t v8 = v7;
  id v9 = 0;
  uint64_t v10 = *(void *)v19;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v6);
      }
      double v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
      if (objc_msgSend(v12, "conformsToAKStrokedAnnotationProtocol", (void)v18))
      {
        uint64_t v13 = [v12 strokeColor];
        id v14 = v13;
        if (v9 || !v13)
        {
          if (v9 && v13 && ([v9 akIsEqualToColor:v13] & 1) == 0)
          {
            uint64_t v16 = [MEMORY[0x263F1C550] whiteColor];

            id v9 = (void *)v16;
            goto LABEL_18;
          }
        }
        else
        {
          id v14 = v13;
          id v9 = v14;
        }
      }
      else
      {
        id v14 = 0;
      }

      ++v11;
    }
    while (v8 != v11);
    uint64_t v15 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    uint64_t v8 = v15;
  }
  while (v15);
LABEL_18:

  if (!v9) {
    goto LABEL_21;
  }
LABEL_25:
  uint64_t v17 = [v3 toolbarViewController];
  [v17 setStrokeColorUIDisplayToColor:v9];
}

- (BOOL)_isEnabledForSender:(id)a3 segment:(int64_t)a4 withSelectedAnnotations:(id)a5
{
  uint64_t v135 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v9) {
    BOOL v11 = [v9 count] != 0;
  }
  else {
    BOOL v11 = 0;
  }
  uint64_t v12 = [v8 tag];
  if (objc_opt_respondsToSelector()) {
    uint64_t v12 = [v8 tagForSegment:a4];
  }
  if (v12 <= 765099)
  {
    if ((unint64_t)(v12 - 765001) > 0x31 || ((1 << (v12 - 73)) & 0x2000000007FFFLL) == 0) {
      goto LABEL_137;
    }
    long long v115 = 0u;
    long long v116 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    id v13 = v10;
    uint64_t v18 = [v13 countByEnumeratingWithState:&v113 objects:v132 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v114;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v114 != v20) {
            objc_enumerationMutation(v13);
          }
          double v22 = *(void **)(*((void *)&v113 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            if (objc_opt_respondsToSelector()) {
              int v23 = [v22 pathIsPrestroked] ^ 1;
            }
            else {
              LOBYTE(v23) = 1;
            }

            goto LABEL_142;
          }
        }
        uint64_t v19 = [v13 countByEnumeratingWithState:&v113 objects:v132 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
    goto LABEL_136;
  }
  if (v12 > 765199)
  {
    if ((unint64_t)(v12 - 765200) >= 5)
    {
      if ((unint64_t)(v12 - 765205) >= 2)
      {
        if (v12 == 765300)
        {
          v44 = [(AKAttributeController *)self controller];
          v45 = [v44 toolController];
          uint64_t v46 = [v45 toolMode];

          if (v46 == 4)
          {
LABEL_104:
            LOBYTE(v23) = 1;
            goto LABEL_142;
          }
        }
LABEL_137:
        LOBYTE(v23) = !v11;
        goto LABEL_142;
      }
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v13 = v10;
      uint64_t v31 = [v13 countByEnumeratingWithState:&v85 objects:v125 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v86;
        while (2)
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            if (*(void *)v86 != v33) {
              objc_enumerationMutation(v13);
            }
            v35 = self;
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
LABEL_103:

              goto LABEL_104;
            }
          }
          uint64_t v32 = [v13 countByEnumeratingWithState:&v85 objects:v125 count:16];
          if (v32) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v13 = v10;
      uint64_t v24 = [v13 countByEnumeratingWithState:&v89 objects:v126 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        id v84 = v8;
        uint64_t v26 = *(void *)v90;
        while (2)
        {
          for (uint64_t k = 0; k != v25; ++k)
          {
            if (*(void *)v90 != v26) {
              objc_enumerationMutation(v13);
            }
            v28 = self;
            if (objc_opt_isKindOfClass())
            {

LABEL_141:
              LOBYTE(v23) = 1;
              id v8 = v84;
              goto LABEL_142;
            }
            char v29 = self;
            char v30 = objc_opt_isKindOfClass();

            if (v30) {
              goto LABEL_141;
            }
          }
          uint64_t v25 = [v13 countByEnumeratingWithState:&v89 objects:v126 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }
    }
LABEL_136:

    goto LABEL_137;
  }
  switch(v12)
  {
    case 765100:
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id v13 = v10;
      uint64_t v47 = [v13 countByEnumeratingWithState:&v101 objects:v129 count:16];
      if (!v47) {
        goto LABEL_136;
      }
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v102;
LABEL_71:
      uint64_t v50 = 0;
      while (1)
      {
        if (*(void *)v102 != v49) {
          objc_enumerationMutation(v13);
        }
        if (objc_opt_respondsToSelector()) {
          goto LABEL_103;
        }
        if (v48 == ++v50)
        {
          uint64_t v48 = [v13 countByEnumeratingWithState:&v101 objects:v129 count:16];
          if (v48) {
            goto LABEL_71;
          }
          goto LABEL_136;
        }
      }
    case 765101:
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      id v13 = v10;
      uint64_t v51 = [v13 countByEnumeratingWithState:&v117 objects:v133 count:16];
      if (!v51) {
        goto LABEL_136;
      }
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v118;
LABEL_80:
      uint64_t v54 = 0;
      while (1)
      {
        if (*(void *)v118 != v53) {
          objc_enumerationMutation(v13);
        }
        if (objc_opt_respondsToSelector()) {
          goto LABEL_103;
        }
        if (v52 == ++v54)
        {
          uint64_t v52 = [v13 countByEnumeratingWithState:&v117 objects:v133 count:16];
          if (v52) {
            goto LABEL_80;
          }
          goto LABEL_136;
        }
      }
    case 765102:
      long long v123 = 0u;
      long long v124 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      id v13 = v10;
      uint64_t v55 = [v13 countByEnumeratingWithState:&v121 objects:v134 count:16];
      if (!v55) {
        goto LABEL_136;
      }
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v122;
LABEL_89:
      uint64_t v58 = 0;
      while (1)
      {
        if (*(void *)v122 != v57) {
          objc_enumerationMutation(v13);
        }
        if (objc_opt_respondsToSelector()) {
          goto LABEL_103;
        }
        if (v56 == ++v58)
        {
          uint64_t v56 = [v13 countByEnumeratingWithState:&v121 objects:v134 count:16];
          if (v56) {
            goto LABEL_89;
          }
          goto LABEL_136;
        }
      }
    case 765103:
      id v13 = [(AKAttributeController *)self controller];
      v59 = [v13 toolController];
      if ([v59 toolMode] == 2)
      {

        if (!v11) {
          goto LABEL_138;
        }
      }
      else
      {
        id v61 = [v13 toolController];
        uint64_t v62 = [v61 toolMode];

        char v63 = v62 != 4 || v11;
        if ((v63 & 1) == 0) {
          goto LABEL_138;
        }
      }
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      id v64 = v10;
      uint64_t v65 = [v64 countByEnumeratingWithState:&v109 objects:v131 count:16];
      if (!v65) {
        goto LABEL_135;
      }
      uint64_t v66 = v65;
      BOOL v83 = v11;
      id v84 = v8;
      uint64_t v67 = *(void *)v110;
      v68 = &selRef_initWithController_;
LABEL_111:
      uint64_t v69 = 0;
      uint64_t v70 = v68;
      while (1)
      {
        if (*(void *)v110 != v67) {
          objc_enumerationMutation(v64);
        }
        v71 = *(void **)(*((void *)&v109 + 1) + 8 * v69);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && ((objc_opt_respondsToSelector() & 1) == 0 || ![v71 pathIsPrestroked]))
        {
          goto LABEL_140;
        }
        if (v66 == ++v69)
        {
          uint64_t v66 = [v64 countByEnumeratingWithState:&v109 objects:v131 count:16];
          v68 = v70;
          if (!v66) {
            goto LABEL_134;
          }
          goto LABEL_111;
        }
      }
    case 765104:
      id v13 = [(AKAttributeController *)self controller];
      v60 = [v13 toolController];
      if ([v60 toolMode] == 2)
      {

        if (!v11) {
          goto LABEL_138;
        }
LABEL_124:
        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        id v64 = v10;
        uint64_t v75 = [v64 countByEnumeratingWithState:&v105 objects:v130 count:16];
        if (!v75) {
          goto LABEL_135;
        }
        uint64_t v76 = v75;
        BOOL v83 = v11;
        id v84 = v8;
        uint64_t v77 = *(void *)v106;
        v78 = &selRef_initWithController_;
        while (1)
        {
          uint64_t v79 = 0;
          v80 = v78;
          do
          {
            if (*(void *)v106 != v77) {
              objc_enumerationMutation(v64);
            }
            v81 = *(void **)(*((void *)&v105 + 1) + 8 * v79);
            if ((objc_opt_respondsToSelector() & 1) != 0
              && ((objc_opt_respondsToSelector() & 1) == 0 || ![v81 pathIsPrestroked]))
            {
LABEL_140:

              goto LABEL_141;
            }
            ++v79;
          }
          while (v76 != v79);
          uint64_t v76 = [v64 countByEnumeratingWithState:&v105 objects:v130 count:16];
          v78 = v80;
          if (!v76)
          {
LABEL_134:
            id v8 = v84;
            LOBYTE(v11) = v83;
            goto LABEL_135;
          }
        }
      }
      char v72 = [v13 toolController];
      uint64_t v73 = [v72 toolMode];

      char v74 = v73 != 4 || v11;
      if (v74) {
        goto LABEL_124;
      }
LABEL_138:

LABEL_139:
      LOBYTE(v23) = 0;
LABEL_142:

      return v23;
    case 765105:
    case 765106:
      id v13 = [(AKAttributeController *)self controller];
      v37 = [v13 textEditorController];
      int v38 = [v37 isEditing];

      if (v38) {
        goto LABEL_103;
      }
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      id v39 = v10;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v97 objects:v128 count:16];
      if (!v40) {
        goto LABEL_135;
      }
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v98;
      while (2)
      {
        for (uint64_t m = 0; m != v41; ++m)
        {
          if (*(void *)v98 != v42) {
            objc_enumerationMutation(v39);
          }
          if ([*(id *)(*((void *)&v97 + 1) + 8 * m) conformsToAKTextAnnotationProtocol])
          {

            goto LABEL_103;
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v97 objects:v128 count:16];
        if (v41) {
          continue;
        }
        break;
      }
LABEL_135:

      goto LABEL_136;
    case 765107:
    case 765108:
    case 765109:
    case 765110:
      if (!v11) {
        goto LABEL_139;
      }
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      id v13 = v10;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v93 objects:v127 count:16];
      if (!v14) {
        goto LABEL_136;
      }
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v94;
LABEL_12:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v94 != v16) {
          objc_enumerationMutation(v13);
        }
        if (objc_opt_respondsToSelector()) {
          goto LABEL_103;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v93 objects:v127 count:16];
          if (v15) {
            goto LABEL_12;
          }
          goto LABEL_136;
        }
      }
    default:
      goto LABEL_137;
  }
}

- (void)_updateStateOnSender:(id)a3 segment:(int64_t)a4
{
  id v8 = a3;
  id v6 = [(AKAttributeController *)self modelControllerToObserveForSelections];
  uint64_t v7 = [v6 selectedAnnotations];

  if (![(AKAttributeController *)self _updateStateOnSender:v8 segment:a4 fromSelectedAnnotations:v7])[(AKAttributeController *)self _updateStateOnSenderFromSelf:v8 segment:a4]; {
}
  }

- (void)_allAnnotations:(id)a3 all:(BOOL *)a4 atLeastOneShare:(BOOL *)a5 attributeFromTag:(int64_t)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v9 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    int64_t v13 = a6 - 765100;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        switch(v13)
        {
          case 0:
            if (objc_opt_respondsToSelector() & 1) != 0 && ([v15 hasShadow]) {
              goto LABEL_27;
            }
            goto LABEL_28;
          case 3:
            if ((objc_opt_respondsToSelector() & 1) == 0 || ([v15 isDashed] & 1) == 0) {
              goto LABEL_28;
            }
            goto LABEL_27;
          case 4:
            if ((objc_opt_respondsToSelector() & 1) == 0 || ![v15 brushStyle]) {
              goto LABEL_28;
            }
            goto LABEL_27;
          case 7:
            if ((objc_opt_respondsToSelector() & 1) != 0 && ![v15 arrowHeadStyle]) {
              goto LABEL_27;
            }
            goto LABEL_28;
          case 8:
            if ((objc_opt_respondsToSelector() & 1) == 0 || [v15 arrowHeadStyle] != 1) {
              goto LABEL_28;
            }
            goto LABEL_27;
          case 9:
            if ((objc_opt_respondsToSelector() & 1) == 0 || [v15 arrowHeadStyle] != 2) {
              goto LABEL_28;
            }
            goto LABEL_27;
          case 10:
            if ((objc_opt_respondsToSelector() & 1) == 0 || [v15 arrowHeadStyle] != 3) {
              goto LABEL_28;
            }
LABEL_27:
            *a5 = 1;
            break;
          default:
LABEL_28:
            *a4 = 0;
            break;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (BOOL)_updateStateOnSender:(id)a3 segment:(int64_t)a4 fromSelectedAnnotations:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v9 = v8;
  if (!v8 || ![v8 count]) {
    goto LABEL_35;
  }
  if ([v7 conformsToProtocol:&unk_26EAA2AF0])
  {
    id v10 = v7;
    uint64_t v11 = [v10 tag];
    BOOL v12 = v11 == 765105;
    if (v11 == 765105)
    {
      int64_t v13 = +[AKTextAnnotationAttributeHelper fontsOfAnnotations:v9];
      uint64_t v14 = [(AKAttributeController *)self controller];
      uint64_t v15 = [v14 textEditorController];
      long long v16 = +[AKTextAnnotationAttributeHelper fontsOfEditor:v15];
      if ([v16 count])
      {
        uint64_t v17 = [v13 setByAddingObjectsFromSet:v16];

        int64_t v13 = (void *)v17;
      }
      [v10 syncFontsToUI:v13];
LABEL_13:

      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (![v7 conformsToProtocol:&unk_26EA8CAC0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v7 tag] > 765000 && objc_msgSend(v7, "tag") < 765016
       || [v7 tag] > 765106 && objc_msgSend(v7, "tag") < 765111))
    {
      id v10 = v7;
      uint64_t v20 = [v10 tag];
      if ((unint64_t)(v20 - 765001) >= 0xF)
      {
        if ((unint64_t)(v20 - 765107) >= 4)
        {
          BOOL v12 = 0;
        }
        else
        {
          __int16 v41 = 0;
          -[AKAttributeController _allAnnotations:all:atLeastOneShare:attributeFromTag:](self, "_allAnnotations:all:atLeastOneShare:attributeFromTag:", v9, (char *)&v41 + 1, &v41, [v10 tag]);
          [v10 setSelected:v41];
          BOOL v12 = 1;
        }
      }
      else
      {
        id v40 = v7;
        int v38 = [(AKAttributeController *)self controller];
        uint64_t v21 = [v38 currentPageController];
        [v21 modelBaseScaleFactor];
        double v23 = v22;

        uint64_t v24 = [v10 tag];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v39 = v9;
        id v25 = v9;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          unsigned __int8 v28 = 0;
          uint64_t v29 = *(void *)v43;
          char v30 = 1;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v43 != v29) {
                objc_enumerationMutation(v25);
              }
              uint64_t v32 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              if (objc_opt_respondsToSelector())
              {
                [v32 strokeWidth];
                double v34 = v33;
                if ([v10 tag] == 765001) {
                  double v35 = 1.0;
                }
                else {
                  double v35 = v23;
                }
                BOOL v36 = vabdd_f64(v34 / v35, (double)(v24 - 765000)) < 0.0005;
                v28 |= v36;
                v30 &= v36;
              }
              else
              {
                char v30 = 0;
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v42 objects:v46 count:16];
          }
          while (v27);
        }
        else
        {
          unsigned __int8 v28 = 0;
          char v30 = 1;
        }

        [v10 setSelected:(v30 | v28) & 1];
        BOOL v12 = 1;
        id v9 = v39;
        id v7 = v40;
      }
      goto LABEL_14;
    }
LABEL_35:
    BOOL v12 = 0;
    goto LABEL_36;
  }
  id v10 = v7;
  uint64_t v18 = [v10 tag];
  BOOL v12 = v18 == 765106;
  if (v18 == 765106)
  {
    int64_t v13 = +[AKTextAnnotationAttributeHelper textAttributesOfAnnotations:v9];
    uint64_t v14 = [(AKAttributeController *)self controller];
    uint64_t v15 = [v14 textEditorController];
    long long v16 = +[AKTextAnnotationAttributeHelper textAttributesOfEditor:v15];
    if ([v16 count])
    {
      uint64_t v19 = [v13 setByAddingObjectsFromSet:v16];

      int64_t v13 = (void *)v19;
    }
    [v10 syncTextAttributesToUI:v13];
    goto LABEL_13;
  }
LABEL_14:

LABEL_36:
  return v12;
}

- (void)_updateStateOnSenderFromSelf:(id)a3 segment:(int64_t)a4
{
  id v17 = a3;
  if ([v17 conformsToProtocol:&unk_26EAA2AF0])
  {
    id v5 = v17;
    if ([v5 tag] == 765105)
    {
      id v6 = (void *)MEMORY[0x263EFFA08];
      id v7 = [(AKAttributeController *)self font];
      id v8 = [v6 setWithObject:v7];

      id v9 = [(AKAttributeController *)self controller];
      id v10 = [v9 textEditorController];
      uint64_t v11 = +[AKTextAnnotationAttributeHelper fontsOfEditor:v10];
      if ([v11 count])
      {
        uint64_t v12 = [v8 setByAddingObjectsFromSet:v11];

        id v8 = (void *)v12;
      }
      [v5 syncFontsToUI:v8];
LABEL_11:
    }
  }
  else
  {
    if (![v17 conformsToProtocol:&unk_26EA8CAC0]) {
      goto LABEL_13;
    }
    id v13 = v17;
    if ([v13 tag] == 765106)
    {
      uint64_t v14 = (void *)MEMORY[0x263EFFA08];
      uint64_t v15 = [(AKAttributeController *)self textAttributes];
      id v8 = [v14 setWithObject:v15];

      id v9 = [(AKAttributeController *)self controller];
      id v10 = [v9 textEditorController];
      uint64_t v11 = +[AKTextAnnotationAttributeHelper textAttributesOfEditor:v10];
      if ([v11 count])
      {
        uint64_t v16 = [v8 setByAddingObjectsFromSet:v11];

        id v8 = (void *)v16;
      }
      [v13 syncTextAttributesToUI:v8];
      goto LABEL_11;
    }
  }

LABEL_13:
}

- (AKPageModelController)modelControllerToObserveForSelections
{
  return self->modelControllerToObserveForSelections;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (UIColor)fillColor
{
  return (UIColor *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFillColor:(id)a3
{
}

- (PKInk)ink
{
  return self->_ink;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (BOOL)strokeIsDashed
{
  return self->_strokeIsDashed;
}

- (void)setStrokeIsDashed:(BOOL)a3
{
  self->_strokeIsDashed = a3;
}

- (BOOL)hasShadow
{
  return self->_hasShadow;
}

- (void)setHasShadow:(BOOL)a3
{
  self->_hasShadow = a3;
}

- (int64_t)brushStyle
{
  return self->_brushStyle;
}

- (void)setBrushStyle:(int64_t)a3
{
  self->_brushStyle = a3;
}

- (unint64_t)arrowHeadStyle
{
  return self->_arrowHeadStyle;
}

- (void)setArrowHeadStyle:(unint64_t)a3
{
  self->_arrowHeadStyle = a3;
}

- (UIFont)font
{
  return (UIFont *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFont:(id)a3
{
}

- (NSDictionary)textAttributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTextAttributes:(id)a3
{
}

- (int64_t)highlightStyle
{
  return self->_highlightStyle;
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
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_textAttributes, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_ink, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);

  objc_storeStrong((id *)&self->modelControllerToObserveForSelections, 0);
}

@end