@interface NetTopoObjectLayer
+ (BOOL)needsDisplayForKey:(id)a3;
- ($E32549A47AE6FE03C4AA404FAEB37148)getConnectionAttachmentLocations;
- (BOOL)isExpanded;
- (BOOL)isGhosted;
- (BOOL)isSelectable;
- (BOOL)isSelected;
- (BOOL)smallSize;
- (CGImage)objectImage;
- (CGPoint)layoutOrigin;
- (CGRect)getFrameContainingAllSublayers;
- (CGRect)getUserInteractionBounds;
- (CGSize)boundsSizeConstraint;
- (NSMutableArray)children;
- (NSString)label;
- (NSString)saveLabel;
- (NSString)secondaryLabel;
- (NetTopoObjectLayer)ancestor;
- (NetTopoObjectLayer)contourThread;
- (NetTopoObjectLayer)init;
- (NetTopoObjectLayer)initWithUIStyle:(int)a3 andOwningView:(id)a4;
- (NetTopoObjectLayer)parent;
- (NetTopoObjectLayer)parentDevice;
- (UIImage)statusBadgeImage;
- (double)change;
- (double)labelPinnedHeight;
- (double)layoutScale;
- (double)mod;
- (double)prelim;
- (double)shift;
- (float)topoProgressValue;
- (id)associatedNode;
- (id)childAtIndex:(unint64_t)a3;
- (id)debugDescription;
- (id)describeOne:(id)a3 uiLayer:(id)a4 indent:(unint64_t)a5;
- (id)firstChild;
- (id)lastChild;
- (id)owningView;
- (id)userObject;
- (unint64_t)column;
- (unint64_t)number;
- (unint64_t)numberOfChildren;
- (unint64_t)row;
- (unint64_t)topoBadgeNumber;
- (unsigned)statusLightMode;
- (void)addChild:(id)a3;
- (void)dealloc;
- (void)deallocStatusImages;
- (void)drawInContext:(CGContext *)a3;
- (void)initNetTopoObjectLayerCommonWithStyle:(int)a3 andOwningView:(id)a4;
- (void)insertChild:(id)a3 atIndex:(unint64_t)a4;
- (void)layoutSublayers;
- (void)loadStatusImagesForScale:(double)a3;
- (void)pickCorrectImagesForContentsScale:(double)a3;
- (void)removeChild:(id)a3;
- (void)setAncestor:(id)a3;
- (void)setAssociatedNode:(id)a3;
- (void)setBoundsSizeConstraint:(CGSize)a3;
- (void)setChange:(double)a3;
- (void)setChildren:(id)a3;
- (void)setColumn:(unint64_t)a3;
- (void)setContourThread:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setGhosted:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLabelPinnedHeight:(double)a3;
- (void)setLayoutOrigin:(CGPoint)a3;
- (void)setLayoutScale:(double)a3;
- (void)setMod:(double)a3;
- (void)setNumber:(unint64_t)a3;
- (void)setObjectImage:(CGImage *)a3;
- (void)setOwningView:(id)a3;
- (void)setParent:(id)a3;
- (void)setPrelim:(double)a3;
- (void)setRow:(unint64_t)a3;
- (void)setSaveLabel:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setSelectable:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShift:(double)a3;
- (void)setSmallSize:(BOOL)a3;
- (void)setStatusBadgeImage:(id)a3;
- (void)setStatusBadgeImagePriv:(id)a3;
- (void)setStatusLightMode:(unsigned int)a3;
- (void)setStatusLightStateFromMode;
- (void)setTopoBadgeNumber:(unint64_t)a3;
- (void)setTopoProgressValue:(float)a3;
- (void)setUserObject:(id)a3;
- (void)statusLightUpdateTimer:(id)a3;
@end

@implementation NetTopoObjectLayer

- (void)initNetTopoObjectLayerCommonWithStyle:(int)a3 andOwningView:(id)a4
{
  if (dword_268147E38 <= 800 && (dword_268147E38 != -1 || sub_226865630((uint64_t)&dword_268147E38, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147E38, (uint64_t)"-[NetTopoObjectLayer initNetTopoObjectLayerCommonWithStyle:andOwningView:]", 800, (uint64_t)"%@\n", v4, v5, v6, v7, (uint64_t)self);
  }
  self->_topoStyle = a3;
  objc_msgSend_setOwningView_(self, a2, (uint64_t)a4);
  objc_msgSend_setEdgeAntialiasingMask_(self, v11, 0);
  self->_layoutScale = 1.0;
  self->_isExpanded = 1;
  self->_smallSize = 0;
  self->_selectable = 1;
  self->_boundsSizeConstraint = (CGSize)*MEMORY[0x263F001B0];
  self->_parent = 0;
  self->_children = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  CGPoint v12 = (CGPoint)*MEMORY[0x263F001A8];
  CGSize v13 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  self->_imageFrame.origin = (CGPoint)*MEMORY[0x263F001A8];
  self->_imageFrame.size = v13;
  self->_imageSelectionFrame.origin = v12;
  self->_imageSelectionFrame.size = v13;
  self->_selectionColor = sub_2268EF290(0.0, 0.0, 0.0, 0.3);
  uint64_t v16 = sub_226905310(a4, v14, v15);
  double v17 = 20.0;
  double v18 = 14.0;
  if (v16 == 1)
  {
    double v17 = 14.0;
    double v18 = 10.0;
  }
  self->_selectionCornerRadius = v17;
  self->_selectionRectOutset = v18;
  self->_labelUnselectedFillColor = sub_2268EF290(1.0, 1.0, 1.0, 0.0);
  self->_labelSelectedFillColor = sub_2268EF290(1.0, 1.0, 1.0, 0.0);
  v19 = sub_2268EF290(1.0, 1.0, 1.0, 0.0);
  self->_labelSelectedFillColor2 = v19;
  if (sub_2269050C4((uint64_t)v19, v20, v21))
  {
    v24 = objc_msgSend__secondaryLabelColor(MEMORY[0x263F1C550], v22, v23);
    v27 = (CGColor *)objc_msgSend_CGColor(v24, v25, v26);
    v28 = CGColorRetain(v27);
  }
  else
  {
    v28 = sub_2268EF290(0.305882353, 0.337254902, 0.423529412, 1.0);
  }
  self->_labelUnselectedTextColor = v28;
  v31 = objc_msgSend__tertiaryLabelColor(MEMORY[0x263F1C550], v29, v30);
  v34 = (CGColor *)objc_msgSend_CGColor(v31, v32, v33);
  self->_secondaryLabelUnselectedTextColor = CGColorRetain(v34);
  self->_secondaryLabelSelectedTextColor = sub_2268EF290(0.4, 0.4, 0.4, 1.0);
  self->_labelSelectedTextColor = sub_2268EF290(1.0, 1.0, 1.0, 1.0);
  objc_msgSend_contentsScale(self, v35, v36);
  objc_msgSend_loadStatusImagesForScale_(self, v37, v38);
  objc_msgSend_setZPosition_(self, v39, v40, 1000.0);
  uint64_t v43 = sub_226905310(a4, v41, v42);
  if (v43 == 2) {
    double v46 = 292.0;
  }
  else {
    double v46 = 144.0;
  }
  if (v43 == 2) {
    double v47 = 292.0;
  }
  else {
    double v47 = 124.0;
  }

  objc_msgSend_setFrame_(self, v44, v45, 0.0, 0.0, v47, v46);
}

- (NetTopoObjectLayer)initWithUIStyle:(int)a3 andOwningView:(id)a4
{
  uint64_t v9 = *(void *)&a3;
  if (dword_268147E38 <= 800 && (dword_268147E38 != -1 || sub_226865630((uint64_t)&dword_268147E38, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147E38, (uint64_t)"-[NetTopoObjectLayer initWithUIStyle:andOwningView:]", 800, (uint64_t)"\n", v4, v5, v6, v7, (uint64_t)v15.receiver);
  }
  v15.receiver = self;
  v15.super_class = (Class)NetTopoObjectLayer;
  v11 = [(NetTopoObjectLayer *)&v15 init];
  CGSize v13 = v11;
  if (v11) {
    objc_msgSend_initNetTopoObjectLayerCommonWithStyle_andOwningView_(v11, v12, v9, a4);
  }
  return v13;
}

- (NetTopoObjectLayer)init
{
  if (dword_268147E38 <= 800 && (dword_268147E38 != -1 || sub_226865630((uint64_t)&dword_268147E38, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147E38, (uint64_t)"-[NetTopoObjectLayer init]", 800, (uint64_t)"\n", v2, v3, v4, v5, (uint64_t)v11.receiver);
  }
  v11.receiver = self;
  v11.super_class = (Class)NetTopoObjectLayer;
  uint64_t v7 = [(NetTopoObjectLayer *)&v11 init];
  uint64_t v9 = v7;
  if (v7) {
    objc_msgSend_initNetTopoObjectLayerCommonWithStyle_andOwningView_(v7, v8, 0, 0);
  }
  return v9;
}

- (void)dealloc
{
  if (dword_268147E38 <= 800 && (dword_268147E38 != -1 || sub_226865630((uint64_t)&dword_268147E38, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147E38, (uint64_t)"-[NetTopoObjectLayer dealloc]", 800, (uint64_t)"%@\n", v2, v3, v4, v5, (uint64_t)self);
  }

  objc_msgSend_setObjectImage_(self, v7, 0);
  objc_msgSend_deallocStatusImages(self, v8, v9);

  CGColorRelease(self->_selectionColor);
  CGColorRelease(self->_labelUnselectedFillColor);
  CGColorRelease(self->_labelSelectedFillColor);
  CGColorRelease(self->_labelUnselectedTextColor);
  CGColorRelease(self->_labelSelectedTextColor);
  CGColorRelease(self->_labelSelectedFillColor2);
  CGColorRelease(self->_secondaryLabelUnselectedTextColor);
  CGColorRelease(self->_secondaryLabelSelectedTextColor);
  v10.receiver = self;
  v10.super_class = (Class)NetTopoObjectLayer;
  [(NetTopoObjectLayer *)&v10 dealloc];
}

- (void)pickCorrectImagesForContentsScale:(double)a3
{
  if (dword_268147E38 <= 800 && (dword_268147E38 != -1 || sub_226865630((uint64_t)&dword_268147E38, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147E38, (uint64_t)"-[NetTopoObjectLayer pickCorrectImagesForContentsScale:]", 800, (uint64_t)"scale = %.1f\n", v4, v5, v6, v7, *(uint64_t *)&a3);
  }
  objc_msgSend_loadStatusImagesForScale_(self, a2, v3, a3);
  uint64_t v13 = objc_msgSend_statusLightMode(self, v10, v11);

  objc_msgSend_setStatusLightMode_(self, v12, v13);
}

- (NetTopoObjectLayer)parentDevice
{
  if (!objc_msgSend_parent(self, a2, v2)) {
    return 0;
  }
  objc_msgSend_parent(self, v4, v5);
  uint64_t v6 = objc_opt_class();
  if (v6 != objc_opt_class()) {
    return 0;
  }
  objc_super v10 = objc_msgSend_parent(self, v7, v8);

  return (NetTopoObjectLayer *)objc_msgSend_parent(v10, v11, v12);
}

- (unint64_t)numberOfChildren
{
  return objc_msgSend_count(self->_children, a2, v2);
}

- (id)childAtIndex:(unint64_t)a3
{
  if (dword_268147E78 <= 800 && (dword_268147E78 != -1 || sub_226865630((uint64_t)&dword_268147E78, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147E78, (uint64_t)"-[NetTopoObjectLayer childAtIndex:]", 800, (uint64_t)"index %d  _children %@\n", v3, v4, v5, v6, a3);
  }
  if (objc_msgSend_count(self->_children, a2, a3) <= a3) {
    v14 = 0;
  }
  else {
    v14 = objc_msgSend_objectAtIndex_(self->_children, v9, a3);
  }
  if (dword_268147E78 <= 800 && (dword_268147E78 != -1 || sub_226865630((uint64_t)&dword_268147E78, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147E78, (uint64_t)"-[NetTopoObjectLayer childAtIndex:]", 800, (uint64_t)"returning foundChild %@\n", v10, v11, v12, v13, (uint64_t)v14);
  }
  return v14;
}

- (id)firstChild
{
  if (dword_268147E78 <= 800 && (dword_268147E78 != -1 || sub_226865630((uint64_t)&dword_268147E78, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147E78, (uint64_t)"-[NetTopoObjectLayer firstChild]", 800, (uint64_t)"getting first child for %@\n", v2, v3, v4, v5, (uint64_t)self);
  }
  uint64_t v11 = objc_msgSend_childAtIndex_(self, a2, 0);
  if (dword_268147E78 <= 800 && (dword_268147E78 != -1 || sub_226865630((uint64_t)&dword_268147E78, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147E78, (uint64_t)"-[NetTopoObjectLayer firstChild]", 800, (uint64_t)"returning firstChild %@\n", v7, v8, v9, v10, (uint64_t)v11);
  }
  return v11;
}

- (id)lastChild
{
  if (dword_268147E78 <= 800 && (dword_268147E78 != -1 || sub_226865630((uint64_t)&dword_268147E78, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147E78, (uint64_t)"-[NetTopoObjectLayer lastChild]", 800, (uint64_t)"getting last child for %@\n", v3, v4, v5, v6, (uint64_t)self);
  }
  uint64_t v8 = objc_msgSend_count(self->_children, a2, v2);
  if (v8) {
    v14 = objc_msgSend_childAtIndex_(self, v9, v8 - 1);
  }
  else {
    v14 = 0;
  }
  if (dword_268147E78 <= 800 && (dword_268147E78 != -1 || sub_226865630((uint64_t)&dword_268147E78, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147E78, (uint64_t)"-[NetTopoObjectLayer lastChild]", 800, (uint64_t)"returning lastChild %@\n", v10, v11, v12, v13, (uint64_t)v14);
  }
  return v14;
}

- (void)insertChild:(id)a3 atIndex:(unint64_t)a4
{
  if (dword_268147E78 <= 800 && (dword_268147E78 != -1 || sub_226865630((uint64_t)&dword_268147E78, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147E78, (uint64_t)"-[NetTopoObjectLayer insertChild:atIndex:]", 800, (uint64_t)"inserting child %@ at index %d\n", v4, v5, v6, v7, (uint64_t)a3);
  }
  if (objc_msgSend_count(self->_children, a2, (uint64_t)a3) <= a4)
  {
    if (dword_268147E78 <= 800 && (dword_268147E78 != -1 || sub_226865630((uint64_t)&dword_268147E78, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147E78, (uint64_t)"-[NetTopoObjectLayer insertChild:atIndex:]", 800, (uint64_t)"growing child array\n", v12, v13, v14, v15, v22);
    }
    objc_msgSend_addChild_(self, v11, (uint64_t)a3);
  }
  else
  {
    if (dword_268147E78 <= 800 && (dword_268147E78 != -1 || sub_226865630((uint64_t)&dword_268147E78, 0x320u)))
    {
      uint64_t v16 = objc_msgSend_objectAtIndex_(self->_children, v11, a4);
      sub_226865EB4((uint64_t)&dword_268147E78, (uint64_t)"-[NetTopoObjectLayer insertChild:atIndex:]", 800, (uint64_t)"replacing existing object %@\n", v17, v18, v19, v20, v16);
    }
    objc_msgSend_replaceObjectAtIndex_withObject_(self->_children, v11, a4, a3);
    objc_msgSend_setParent_(a3, v21, (uint64_t)self);
  }
}

- (void)addChild:(id)a3
{
  if (objc_msgSend_indexOfObjectIdenticalTo_(self->_children, a2, (uint64_t)a3) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend_addObject_(self->_children, v5, (uint64_t)a3);
    objc_msgSend_setParent_(a3, v10, (uint64_t)self);
  }
  else if (dword_268147E78 <= 800 && (dword_268147E78 != -1 || sub_226865630((uint64_t)&dword_268147E78, 0x320u)))
  {
    sub_226865EB4((uint64_t)&dword_268147E78, (uint64_t)"-[NetTopoObjectLayer addChild:]", 800, (uint64_t)"new child %@ is already in the child array\n", v6, v7, v8, v9, (uint64_t)a3);
  }
}

- (void)removeChild:(id)a3
{
  if (a3 && objc_msgSend_containsObject_(self->_children, a2, (uint64_t)a3))
  {
    objc_msgSend_setParent_(a3, v9, 0);
    children = self->_children;
    objc_msgSend_removeObject_(children, v10, (uint64_t)a3);
  }
  else if (dword_268147E78 <= 800 && (dword_268147E78 != -1 || sub_226865630((uint64_t)&dword_268147E78, 0x320u)))
  {
    sub_226865EB4((uint64_t)&dword_268147E78, (uint64_t)"-[NetTopoObjectLayer removeChild:]", 800, (uint64_t)"attempting to remove child %@ that's not in the child array\n", v3, v4, v5, v6, (uint64_t)a3);
  }
}

- (void)setBoundsSizeConstraint:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (dword_268147E38 <= 800 && (dword_268147E38 != -1 || sub_226865630((uint64_t)&dword_268147E38, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147E38, (uint64_t)"-[NetTopoObjectLayer setBoundsSizeConstraint:]", 800, (uint64_t)"constraint = (w = %.2f h = %.2f)\n", v4, v5, v6, v7, *(uint64_t *)&width);
  }
  self->_boundsSizeConstraint.double width = width;
  self->_boundsSizeConstraint.double height = height;
  objc_msgSend_setBoundsSizeConstraint_(self->_labelLayer, a2, v3, width, height);
  objc_msgSend_setBoundsSizeConstraint_(self->_secondaryLabelLayer, v11, v12, width, height);

  objc_msgSend_setNeedsLayout(self, v13, v14);
}

- (CGSize)boundsSizeConstraint
{
  double width = self->_boundsSizeConstraint.width;
  double height = self->_boundsSizeConstraint.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setOwningView:(id)a3
{
  self->_owningView = a3;
  uint64_t v4 = objc_msgSend_mainScreen(MEMORY[0x263F1C920], a2, (uint64_t)a3);
  objc_msgSend_scale(v4, v5, v6);

  MEMORY[0x270F9A6D0](self, sel_setContentsScale_, v7);
}

- (id)owningView
{
  return self->_owningView;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  objc_msgSend_setNeedsDisplay(self, a2, a3);
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setGhosted:(BOOL)a3
{
  self->_ghosted = a3;
  objc_msgSend_setNeedsDisplay(self, a2, a3);
}

- (BOOL)isGhosted
{
  return self->_ghosted;
}

- (NSString)label
{
  return self->_labelString;
}

- (void)setLabel:(id)a3
{
  if (!self->_labelLayer)
  {
    uint64_t v5 = [BubbleTextLayer alloc];
    uint64_t v8 = objc_msgSend_owningView(self, v6, v7);
    self->_labelLayer = (BubbleTextLayer *)objc_msgSend_initWithOwningView_(v5, v9, v8);
    if (objc_msgSend_smallSize(self, v10, v11))
    {
      uint64_t v14 = objc_msgSend_setFontSize_(self->_labelLayer, v12, v13, 13.0);
    }
    else
    {
      int topoStyle = self->_topoStyle;
      if (topoStyle != 1)
      {
        if (topoStyle)
        {
LABEL_14:
          objc_msgSend_setForegroundColor_(self->_labelLayer, v12, (uint64_t)self->_labelUnselectedTextColor);
          objc_msgSend_addSublayer_(self, v35, (uint64_t)self->_labelLayer);
          goto LABEL_15;
        }
        objc_msgSend_setStatusLightMode_(self, v12, 0);
        uint64_t v20 = objc_msgSend_setFontSize_(self->_labelLayer, v18, v19, 17.0);
        if (!sub_2269050C4(v20, v21, v22))
        {
          objc_msgSend_setFont_(self->_labelLayer, v23, @"Helvetica-Bold");
          goto LABEL_14;
        }
        v25 = (void *)MEMORY[0x263F1C658];
        objc_msgSend_fontSize(self->_labelLayer, v23, v24);
        uint64_t v28 = objc_msgSend_boldSystemFontOfSize_(v25, v26, v27);
LABEL_11:
        objc_msgSend_setFont_(self->_labelLayer, v29, v28);
        goto LABEL_14;
      }
      uint64_t v14 = objc_msgSend_setFontSize_(self->_labelLayer, v12, v13, 15.0);
    }
    if (!sub_2269050C4(v14, v15, v16))
    {
      objc_msgSend_setFont_(self->_labelLayer, v30, @"Helvetica");
      goto LABEL_14;
    }
    v32 = (void *)MEMORY[0x263F1C658];
    objc_msgSend_fontSize(self->_labelLayer, v30, v31);
    uint64_t v28 = objc_msgSend_systemFontOfSize_(v32, v33, v34);
    goto LABEL_11;
  }
LABEL_15:
  id v36 = a3;

  self->_labelString = (NSString *)a3;
  objc_msgSend_setString_(self->_labelLayer, v37, (uint64_t)a3);
  objc_msgSend_setNeedsLayout(self->_labelLayer, v38, v39);

  objc_msgSend_layoutSublayers(self, v40, v41);
}

- (void)setLabelPinnedHeight:(double)a3
{
  self->_labelPinnedHeight = a3;
  objc_msgSend_setNeedsLayout(self, a2, v3);
}

- (double)labelPinnedHeight
{
  return self->_labelPinnedHeight;
}

- (NSString)secondaryLabel
{
  return self->_secondaryLabelString;
}

- (void)setSecondaryLabel:(id)a3
{
  if (!self->_secondaryLabelLayer)
  {
    uint64_t v5 = [BubbleTextLayer alloc];
    uint64_t v8 = objc_msgSend_owningView(self, v6, v7);
    self->_secondaryLabelLayer = (BubbleTextLayer *)objc_msgSend_initWithOwningView_(v5, v9, v8);
    if (objc_msgSend_smallSize(self, v10, v11)) {
      uint64_t v14 = objc_msgSend_setFontSize_(self->_secondaryLabelLayer, v12, v13, 11.0);
    }
    else {
      uint64_t v14 = objc_msgSend_setFontSize_(self->_secondaryLabelLayer, v12, v13, 14.0);
    }
    if (sub_2269050C4(v14, v15, v16))
    {
      uint64_t v19 = (void *)MEMORY[0x263F1C658];
      objc_msgSend_fontSize(self->_secondaryLabelLayer, v17, v18);
      uint64_t v22 = objc_msgSend_systemFontOfSize_(v19, v20, v21);
      objc_msgSend_setFont_(self->_secondaryLabelLayer, v23, v22);
    }
    else
    {
      objc_msgSend_setFont_(self->_secondaryLabelLayer, v17, @"Helvetica");
    }
    objc_msgSend_setForegroundColor_(self->_secondaryLabelLayer, v24, (uint64_t)self->_secondaryLabelUnselectedTextColor);
    objc_msgSend_addSublayer_(self, v25, (uint64_t)self->_secondaryLabelLayer);
  }
  id v26 = a3;

  self->_secondaryLabelString = (NSString *)a3;
  objc_msgSend_setString_(self->_secondaryLabelLayer, v27, (uint64_t)a3);
  objc_msgSend_setNeedsLayout(self->_secondaryLabelLayer, v28, v29);

  objc_msgSend_layoutSublayers(self, v30, v31);
}

- (float)topoProgressValue
{
  ((void (*)(TopoProgressBar *, char *))MEMORY[0x270F9A6D0])(self->_topoProgressBar, sel_progressValue);
  return result;
}

- (void)setTopoProgressValue:(float)a3
{
  topoProgressBar = self->_topoProgressBar;
  if (!topoProgressBar)
  {
    uint64_t v7 = [TopoProgressBar alloc];
    uint64_t v10 = objc_msgSend_owningView(self, v8, v9);
    uint64_t v12 = (TopoProgressBar *)objc_msgSend_initWithOwningView_(v7, v11, v10);
    self->_topoProgressBar = v12;
    objc_msgSend_addSublayer_(self, v13, (uint64_t)v12);
    topoProgressBar = self->_topoProgressBar;
  }
  *(float *)&double v14 = a3;
  objc_msgSend_setProgressValue_(topoProgressBar, a2, v3, v14);

  objc_msgSend_layoutSublayers(self, v15, v16);
}

- (void)setTopoBadgeNumber:(unint64_t)a3
{
  topoNumberBadge = self->_topoNumberBadge;
  if (!topoNumberBadge)
  {
    uint64_t v6 = [TopoNumberBadge alloc];
    uint64_t v9 = objc_msgSend_owningView(self, v7, v8);
    topoNumberBadge = (TopoNumberBadge *)objc_msgSend_initWithOwningView_(v6, v10, v9);
    self->_topoNumberBadge = topoNumberBadge;
  }
  objc_msgSend_setCount_(topoNumberBadge, a2, a3);
  self->_topoBadgeNumber = a3;
  uint64_t v11 = self->_topoNumberBadge;
  labelLayer = self->_labelLayer;

  MEMORY[0x270F9A6D0](labelLayer, sel_setRightAccessoryLayer_, v11);
}

- (void)loadStatusImagesForScale:(double)a3
{
  if (dword_268147E38 <= 800 && (dword_268147E38 != -1 || sub_226865630((uint64_t)&dword_268147E38, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147E38, (uint64_t)"-[NetTopoObjectLayer loadStatusImagesForScale:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v28);
  }
  if (!self->_statusLights[0])
  {
    uint64_t v8 = (void *)MEMORY[0x263F086E0];
    uint64_t v9 = objc_opt_class();
    uint64_t v11 = objc_msgSend_bundleForClass_(v8, v10, v9);
    self->_statusLights[0] = (UIImage *)(id)objc_msgSend_imageNamed_inBundle_(ImageStore, v12, @"StatusLightGrayOff.png", v11);
  }
  if (!self->_statusLights[1])
  {
    uint64_t v13 = (void *)MEMORY[0x263F086E0];
    uint64_t v14 = objc_opt_class();
    uint64_t v16 = objc_msgSend_bundleForClass_(v13, v15, v14);
    self->_statusLights[1] = (UIImage *)(id)objc_msgSend_imageNamed_inBundle_(ImageStore, v17, @"StatusLightAmberOn.png", v16);
  }
  if (!self->_statusLights[2])
  {
    uint64_t v18 = (void *)MEMORY[0x263F086E0];
    uint64_t v19 = objc_opt_class();
    uint64_t v21 = objc_msgSend_bundleForClass_(v18, v20, v19);
    self->_statusLights[2] = (UIImage *)(id)objc_msgSend_imageNamed_inBundle_(ImageStore, v22, @"StatusLightBlueOn.png", v21);
  }
  if (!self->_statusLights[3])
  {
    uint64_t v23 = (void *)MEMORY[0x263F086E0];
    uint64_t v24 = objc_opt_class();
    uint64_t v26 = objc_msgSend_bundleForClass_(v23, v25, v24);
    self->_statusLights[3] = (UIImage *)(id)objc_msgSend_imageNamed_inBundle_(ImageStore, v27, @"StatusLightGreenOn.png", v26);
  }
}

- (void)deallocStatusImages
{
  if (dword_268147E38 <= 800 && (dword_268147E38 != -1 || sub_226865630((uint64_t)&dword_268147E38, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147E38, (uint64_t)"-[NetTopoObjectLayer deallocStatusImages]", 800, (uint64_t)"\n", v3, v4, v5, v6, v10);
  }
  statusLightTimer = self->_statusLightTimer;
  if (statusLightTimer)
  {
    objc_msgSend_invalidate(statusLightTimer, a2, v2);
    self->_statusLightTimer = 0;
  }
  statusLights = (id *)self->_statusLights;

  id *statusLights = 0;
  statusLights[1] = 0;

  statusLights[2] = 0;
  statusLights[3] = 0;
}

- (void)setStatusBadgeImagePriv:(id)a3
{
  if (dword_268147E38 <= 800 && (dword_268147E38 != -1 || sub_226865630((uint64_t)&dword_268147E38, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147E38, (uint64_t)"-[NetTopoObjectLayer setStatusBadgeImagePriv:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v27);
  }
  if (!a3)
  {
    if (!objc_msgSend_image(self->_labelLayer, a2, (uint64_t)a3)) {
      return;
    }
    objc_msgSend_setImage_(self->_labelLayer, v21, 0);
    goto LABEL_15;
  }
  objc_msgSend_contentsScale(self, a2, (uint64_t)a3);
  uint64_t v10 = (CGImage *)objc_msgSend_cgImageFromImage_forContentsScale_(ImageStore, v9, (uint64_t)a3);
  if (objc_msgSend_image(self->_labelLayer, v11, v12))
  {
    uint64_t v15 = (CGImage *)objc_msgSend_image(self->_labelLayer, v13, v14);
    double Width = (double)CGImageGetWidth(v15);
    uint64_t v19 = (CGImage *)objc_msgSend_image(self->_labelLayer, v17, v18);
    double Height = (double)CGImageGetHeight(v19);
  }
  else
  {
    double Width = *MEMORY[0x263F001B0];
    double Height = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  objc_msgSend_setImage_(self->_labelLayer, v13, (uint64_t)v10);
  double v24 = (double)CGImageGetWidth(v10);
  double v25 = (double)CGImageGetHeight(v10);
  if (Width != v24 || Height != v25)
  {
LABEL_15:
    objc_msgSend_setNeedsLayout(self, v22, v23);
  }
}

- (UIImage)statusBadgeImage
{
  return self->_statusBadgeImage;
}

- (void)setStatusBadgeImage:(id)a3
{
  if (dword_268147E38 <= 800 && (dword_268147E38 != -1 || sub_226865630((uint64_t)&dword_268147E38, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147E38, (uint64_t)"-[NetTopoObjectLayer setStatusBadgeImage:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v11);
  }
  id v9 = a3;

  self->_statusBadgeImage = (UIImage *)a3;

  objc_msgSend_setStatusLightMode_(self, v10, 1);
}

- (void)setStatusLightStateFromMode
{
  if (dword_268147E38 <= 800 && (dword_268147E38 != -1 || sub_226865630((uint64_t)&dword_268147E38, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147E38, (uint64_t)"-[NetTopoObjectLayer setStatusLightStateFromMode]", 800, (uint64_t)"entered with _statusLightMode = %d\n", v2, v3, v4, v5, self->_statusLightMode);
  }
  switch(self->_statusLightMode)
  {
    case 2u:
      unsigned int v7 = 1;
      goto LABEL_17;
    case 3u:
      unsigned int v7 = self->_statusLightState == 0;
      goto LABEL_17;
    case 4u:
      unsigned int v7 = 3;
      goto LABEL_17;
    case 5u:
      if (self->_statusLightState) {
        unsigned int v7 = 0;
      }
      else {
        unsigned int v7 = 3;
      }
      goto LABEL_17;
    case 6u:
      unsigned int v7 = 2;
      goto LABEL_17;
    case 7u:
      if (self->_statusLightState == 1) {
        unsigned int v7 = 3;
      }
      else {
        unsigned int v7 = 1;
      }
LABEL_17:
      self->_statusLightState = v7;
      break;
    default:
      unsigned int v7 = 0;
      self->_statusLightState = 0;
      break;
  }
  if (self->_statusLightMode == 1) {
    p_statusBadgeImage = &self->_statusBadgeImage;
  }
  else {
    p_statusBadgeImage = &self->_statusLights[v7];
  }
  id v9 = *p_statusBadgeImage;

  MEMORY[0x270F9A6D0](self, sel_setStatusBadgeImagePriv_, v9);
}

- (void)statusLightUpdateTimer:(id)a3
{
  if (dword_268147E38 <= 800 && (dword_268147E38 != -1 || sub_226865630((uint64_t)&dword_268147E38, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147E38, (uint64_t)"-[NetTopoObjectLayer statusLightUpdateTimer:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v8);
  }

  MEMORY[0x270F9A6D0](self, sel_setStatusLightStateFromMode, a3);
}

- (unsigned)statusLightMode
{
  return self->_statusLightMode;
}

- (void)setStatusLightMode:(unsigned int)a3
{
  uint64_t v7 = *(void *)&a3;
  if (dword_268147E38 <= 800 && (dword_268147E38 != -1 || sub_226865630((uint64_t)&dword_268147E38, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147E38, (uint64_t)"-[NetTopoObjectLayer setStatusLightMode:]", 800, (uint64_t)"entered with mode = %d\n", v3, v4, v5, v6, v7);
  }
  statusLightTimer = self->_statusLightTimer;
  if (statusLightTimer)
  {
    objc_msgSend_invalidate(statusLightTimer, a2, *(uint64_t *)&a3);
    self->_statusLightTimer = 0;
  }
  self->_statusLightMode = v7;
  if (v7 <= 7)
  {
    if (((1 << v7) & 0x57) == 0)
    {
      float v10 = *(float *)"333?";
      if (v7 != 7) {
        float v10 = 1.0;
      }
      self->_statusLightInterval = v10;
      self->_statusLightTimer = (NSTimer *)objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x263EFFA20], a2, (uint64_t)self, sel_statusLightUpdateTimer_, 0, 1, v10);
    }
    MEMORY[0x270F9A6D0](self, sel_setStatusLightStateFromMode, *(void *)&a3);
  }
}

- (void)setLayoutScale:(double)a3
{
  self->_layoutScale = a3;
  objc_msgSend_setNeedsLayout(self, a2, v3);
}

- (double)layoutScale
{
  return self->_layoutScale;
}

- (void)layoutSublayers
{
  if (dword_268147EB8 <= 800 && (dword_268147EB8 != -1 || sub_226865630((uint64_t)&dword_268147EB8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147EB8, (uint64_t)"-[NetTopoObjectLayer layoutSublayers]", 800, (uint64_t)"entered %@\n", v3, v4, v5, v6, (uint64_t)self);
  }
  p_labelLayer = (void **)&self->_labelLayer;
  if (self->_labelLayer || self->_secondaryLabelLayer)
  {
    objc_msgSend_bounds(self, a2, v2);
    if (!CGRectIsEmpty(v121))
    {
      secondaryLabelLayer = self->_secondaryLabelLayer;
      if (secondaryLabelLayer)
      {
        objc_msgSend_preferredFrameSize(secondaryLabelLayer, a2, v2);
        double v11 = v10;
        double v13 = v12;
        objc_msgSend_textBaselineOffset(self->_secondaryLabelLayer, v14, v15);
        double v17 = v16;
        objc_msgSend_bounds(self, v18, v19);
        float v20 = (CGRectGetWidth(v122) - v11) * 0.5;
        double v21 = ceilf(v20);
        objc_msgSend_bounds(self, v22, v23);
        float v24 = CGRectGetMaxY(v123) - v13;
        objc_msgSend_setFrame_(self->_secondaryLabelLayer, v25, v26, v21, ceilf(v24), v11, v13);
        topoProgressBar = self->_topoProgressBar;
        if (topoProgressBar)
        {
          objc_msgSend_preferredFrameSize(topoProgressBar, a2, v2);
          double v29 = v28;
          double v31 = v30;
          objc_msgSend_bounds(self, v32, v33);
          float v34 = (CGRectGetWidth(v124) - v29) * 0.5;
          double v35 = ceilf(v34);
          objc_msgSend_bounds(self, v36, v37);
          float MaxY = CGRectGetMaxY(v125);
          objc_msgSend_setFrame_(self->_topoProgressBar, v39, v40, v35, ceilf(MaxY), v29, v31);
        }
      }
      else
      {
        double v13 = *(double *)(MEMORY[0x263F001B0] + 8);
        double v17 = 0.0;
      }
      if (*p_labelLayer)
      {
        objc_msgSend_preferredFrameSize(*p_labelLayer, a2, v2);
        double v42 = v41;
        double v44 = v43;
        objc_msgSend_labelPinnedHeight(self, v45, v46);
        if (v49 != 0.0)
        {
          objc_msgSend_labelPinnedHeight(self, v47, v48);
          double v44 = v50;
        }
        objc_msgSend_textBaselineOffset(*p_labelLayer, v47, v48);
        double v52 = v51;
        objc_msgSend_bounds(self, v53, v54);
        float v57 = (CGRectGetWidth(v126) - v42) * 0.5;
        double v58 = ceilf(v57);
        double v59 = 0.0;
        if (v17 > 0.0)
        {
          int v60 = objc_msgSend_smallSize(self, v55, v56);
          double v61 = v17 + v44 - v52;
          double v62 = 23.0 - v61;
          double v63 = 13.0 - v61;
          if (v60) {
            double v59 = v63;
          }
          else {
            double v59 = v62;
          }
        }
        objc_msgSend_bounds(self, v55, v56);
        float v64 = CGRectGetMaxY(v127) - v44 - v13 - v59;
        objc_msgSend_setFrame_(*p_labelLayer, v65, v66, v58, ceilf(v64), v42, v44);
      }
    }
  }
  uint64_t v67 = objc_msgSend_objectImage(self, a2, v2);
  if (v67)
  {
    v74 = (CGImage *)v67;
    if (*p_labelLayer || (p_labelLayer = (void **)&self->_secondaryLabelLayer, self->_secondaryLabelLayer))
    {
      objc_msgSend_bounds(self, v68, v69);
      double v76 = v75;
      objc_msgSend_frame(*p_labelLayer, v77, v78);
      self->_imageFrame.origin.y = v76 - v79;
    }
    double Width = (double)CGImageGetWidth(v74);
    objc_msgSend_contentsScale(self, v81, v82);
    double v84 = Width / v83;
    double Height = (double)CGImageGetHeight(v74);
    objc_msgSend_contentsScale(self, v86, v87);
    int topoStyle = self->_topoStyle;
    double v92 = Height / v91;
    if (topoStyle)
    {
      if (topoStyle == 1)
      {
        objc_msgSend_bounds(self, v88, v89);
        float v93 = (CGRectGetWidth(v128) - v84) * 0.5;
        self->_imageFrame.origin.CGFloat x = ceilf(v93);
        self->_imageFrame.size.double width = v84;
        self->_imageFrame.size.double height = v92;
        CGSize size = self->_imageFrame.size;
        self->_imageCoreFrame.origin = self->_imageFrame.origin;
        self->_imageCoreFrame.CGSize size = size;
        CGSize v95 = self->_imageFrame.size;
        self->_imageSelectionFrame.origin = self->_imageFrame.origin;
        self->_imageSelectionFrame.CGSize size = v95;
      }
    }
    else
    {
      double v96 = v84 + -60.0;
      double v97 = v92 + -60.0;
      objc_msgSend_bounds(self, v88, v89);
      float v99 = v98 + (self->_selectionRectOutset + 2.0) * -2.0;
      uint64_t v102 = sub_226905310(self->_owningView, v100, v101);
      float v109 = 100.0;
      if (v102 == 2) {
        float v109 = 260.0;
      }
      float v110 = v99 / v109;
      if (dword_268147EB8 <= 800 && (dword_268147EB8 != -1 || sub_226865630((uint64_t)&dword_268147EB8, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147EB8, (uint64_t)"-[NetTopoObjectLayer layoutSublayers]", 800, (uint64_t)"image scale set to %.4f)\n", v105, v106, v107, v108, COERCE__INT64(v110));
      }
      float v111 = v96 * v110;
      CGFloat v112 = floorf(v111);
      float v113 = v97 * v110;
      CGFloat v114 = floorf(v113);
      objc_msgSend_bounds(self, v103, v104);
      float v115 = (CGRectGetWidth(v129) - v112) * 0.5;
      self->_imageFrame.origin.CGFloat x = ceilf(v115);
      self->_imageFrame.origin.y = self->_selectionRectOutset + self->_imageFrame.origin.y;
      self->_imageFrame.size.double width = v112;
      self->_imageFrame.size.double height = v114;
      CGSize v116 = self->_imageFrame.size;
      self->_imageCoreFrame.origin = self->_imageFrame.origin;
      self->_imageCoreFrame.CGSize size = v116;
      CGFloat x = self->_imageFrame.origin.x;
      v116.double width = self->_imageFrame.origin.y;
      CGFloat v118 = self->_imageFrame.size.width;
      CGFloat v119 = self->_imageFrame.size.height;
      self->_imageSelectionFrame = CGRectInset(*(CGRect *)((char *)&v116 - 8), -self->_selectionRectOutset, -self->_selectionRectOutset);
      CGFloat v120 = ceilf(v110 * -30.0);
      self->_imageFrame = CGRectInset(self->_imageFrame, v120, v120);
    }
  }
  if (dword_268147EB8 <= 800 && (dword_268147EB8 != -1 || sub_226865630((uint64_t)&dword_268147EB8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147EB8, (uint64_t)"-[NetTopoObjectLayer layoutSublayers]", 800, (uint64_t)"done %@\n", v70, v71, v72, v73, (uint64_t)self);
  }
}

- (void)drawInContext:(CGContext *)a3
{
  v27.receiver = self;
  v27.super_class = (Class)NetTopoObjectLayer;
  -[NetTopoObjectLayer drawInContext:](&v27, sel_drawInContext_);
  CGContextSaveGState(a3);
  if (!objc_msgSend_objectImage(self, v5, v6)) {
    goto LABEL_16;
  }
  CGContextScaleCTM(a3, 1.0, -1.0);
  objc_msgSend_bounds(self, v7, v8);
  CGContextTranslateCTM(a3, 0.0, -v9);
  if (objc_msgSend_isSelectable(self, v10, v11) && objc_msgSend_isSelected(self, v12, v13))
  {
    sub_2268EF690(a3, self->_imageSelectionFrame.origin.x, self->_imageSelectionFrame.origin.y, self->_imageSelectionFrame.size.width, self->_imageSelectionFrame.size.height, self->_selectionCornerRadius);
    CGContextClosePath(a3);
    CGContextSetFillColorWithColor(a3, self->_selectionColor);
    CGContextDrawPath(a3, kCGPathFill);
    CGContextSetStrokeColorWithColor(a3, self->_secondaryLabelUnselectedTextColor);
    sub_2268EF690(a3, self->_imageSelectionFrame.origin.x, self->_imageSelectionFrame.origin.y, self->_imageSelectionFrame.size.width, self->_imageSelectionFrame.size.height, self->_selectionCornerRadius);
    CGContextSetLineWidth(a3, 2.0);
    CGContextClosePath(a3);
    CGContextStrokePath(a3);
    labelLayer = self->_labelLayer;
    if (labelLayer)
    {
      objc_msgSend_setForegroundColor_(labelLayer, v12, (uint64_t)self->_labelSelectedTextColor);
      objc_msgSend_setFillColor_(self->_labelLayer, v15, (uint64_t)self->_labelSelectedFillColor);
      objc_msgSend_setFillColor2_(self->_labelLayer, v16, (uint64_t)self->_labelSelectedFillColor2);
    }
    secondaryLabelLayer = self->_secondaryLabelLayer;
    if (!secondaryLabelLayer) {
      goto LABEL_13;
    }
    uint64_t v18 = &OBJC_IVAR___NetTopoObjectLayer__secondaryLabelSelectedTextColor;
  }
  else
  {
    uint64_t v19 = self->_labelLayer;
    if (v19)
    {
      objc_msgSend_setForegroundColor_(v19, v12, (uint64_t)self->_labelUnselectedTextColor);
      objc_msgSend_setFillColor_(self->_labelLayer, v20, (uint64_t)self->_labelUnselectedFillColor);
      objc_msgSend_setFillColor2_(self->_labelLayer, v21, 0);
    }
    secondaryLabelLayer = self->_secondaryLabelLayer;
    if (!secondaryLabelLayer) {
      goto LABEL_13;
    }
    uint64_t v18 = &OBJC_IVAR___NetTopoObjectLayer__secondaryLabelUnselectedTextColor;
  }
  objc_msgSend_setForegroundColor_(secondaryLabelLayer, v12, *(uint64_t *)((char *)&self->super.super.isa + *v18));
LABEL_13:
  int isGhosted = objc_msgSend_isGhosted(self, v12, v13);
  double v23 = 0.3;
  if (!isGhosted) {
    double v23 = 1.0;
  }
  CGContextSetAlpha(a3, v23);
  uint64_t v26 = (CGImage *)objc_msgSend_objectImage(self, v24, v25);
  CGContextDrawImage(a3, self->_imageFrame, v26);
LABEL_16:
  CGContextRestoreGState(a3);
}

- ($E32549A47AE6FE03C4AA404FAEB37148)getConnectionAttachmentLocations
{
  retstr->var2 = 0u;
  retstr->var3 = 0u;
  retstr->var0 = 0u;
  retstr->var1 = 0u;
  p_imageSelectionFrame = &self->_imageSelectionFrame;
  CGFloat x = self->_imageSelectionFrame.origin.x;
  CGFloat y = self->_imageSelectionFrame.origin.y;
  CGFloat width = self->_imageSelectionFrame.size.width;
  CGFloat height = self->_imageSelectionFrame.size.height;
  v54.origin.CGFloat x = x;
  v54.origin.CGFloat y = y;
  v54.size.CGFloat width = width;
  v54.size.CGFloat height = height;
  float result = ($E32549A47AE6FE03C4AA404FAEB37148 *)CGRectIsNull(v54);
  if (result)
  {
    CGPoint v11 = (CGPoint)*MEMORY[0x263F00148];
    retstr->var0 = (CGPoint)*MEMORY[0x263F00148];
    retstr->var1 = v11;
    retstr->var2 = v11;
    retstr->var3 = v11;
  }
  else
  {
    double MinX = CGRectGetMinX(*p_imageSelectionFrame);
    retstr->var0.CGFloat x = MinX;
    objc_msgSend_bounds(self, v13, v14);
    double MaxY = CGRectGetMaxY(v55);
    float MidY = CGRectGetMidY(*p_imageSelectionFrame);
    double v17 = MaxY - floorf(MidY);
    retstr->var0.CGFloat y = v17;
    double v53 = MinX + CGRectGetWidth(*p_imageSelectionFrame);
    retstr->var1.CGFloat x = v53;
    retstr->var1.CGFloat y = v17;
    v56.origin.CGFloat x = x;
    v56.origin.CGFloat y = y;
    v56.size.CGFloat width = width;
    v56.size.CGFloat height = height;
    float MidX = CGRectGetMidX(v56);
    double v19 = floorf(MidX);
    retstr->var2.CGFloat x = v19;
    objc_msgSend_bounds(self, v20, v21);
    double v22 = CGRectGetMaxY(v57);
    v58.origin.CGFloat x = x;
    v58.origin.CGFloat y = y;
    v58.size.CGFloat width = width;
    v58.size.CGFloat height = height;
    double v25 = v22 - CGRectGetMaxY(v58) + -6.0;
    retstr->var2.CGFloat y = v25;
    retstr->var3.CGFloat x = v19;
    if (self->_labelLayer || self->_secondaryLabelLayer)
    {
      objc_msgSend_bounds(self, v23, v24);
      double v28 = CGRectGetMaxY(v59);
    }
    else
    {
      objc_msgSend_bounds(self, v23, v24);
      double v52 = CGRectGetMaxY(v60);
      double v28 = v52 - CGRectGetMinY(*p_imageSelectionFrame);
    }
    double v29 = v28 + 4.0;
    retstr->var3.CGFloat y = v28 + 4.0;
    uint64_t v30 = objc_msgSend_superlayer(self, v26, v27);
    objc_msgSend_convertPoint_toLayer_(self, v31, v30, MinX, v17);
    retstr->var0.CGFloat x = v32;
    retstr->var0.CGFloat y = v33;
    uint64_t v36 = objc_msgSend_superlayer(self, v34, v35);
    objc_msgSend_convertPoint_toLayer_(self, v37, v36, v53, v17);
    retstr->var1.CGFloat x = v38;
    retstr->var1.CGFloat y = v39;
    uint64_t v42 = objc_msgSend_superlayer(self, v40, v41);
    objc_msgSend_convertPoint_toLayer_(self, v43, v42, v19, v25);
    retstr->var2.CGFloat x = v44;
    retstr->var2.CGFloat y = v45;
    uint64_t v48 = objc_msgSend_superlayer(self, v46, v47);
    float result = ($E32549A47AE6FE03C4AA404FAEB37148 *)objc_msgSend_convertPoint_toLayer_(self, v49, v48, v19, v29);
    retstr->var3.CGFloat x = v50;
    retstr->var3.CGFloat y = v51;
  }
  return result;
}

- (CGRect)getUserInteractionBounds
{
  CGFloat x = self->_imageCoreFrame.origin.x;
  double y = self->_imageCoreFrame.origin.y;
  CGFloat width = self->_imageCoreFrame.size.width;
  double height = self->_imageCoreFrame.size.height;
  objc_msgSend_bounds(self, a2, v2);
  double v8 = v7 - height - y;
  double v9 = x;
  double v10 = width;
  double v11 = height;
  result.size.double height = v11;
  result.size.CGFloat width = v10;
  result.origin.double y = v8;
  result.origin.CGFloat x = v9;
  return result;
}

- (CGRect)getFrameContainingAllSublayers
{
  objc_msgSend_frame(self, a2, v2);
  double v11 = v10;
  double v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  if (dword_268147E38 <= 800 && (dword_268147E38 != -1 || sub_226865630((uint64_t)&dword_268147E38, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147E38, (uint64_t)"-[NetTopoObjectLayer getFrameContainingAllSublayers]", 800, (uint64_t)"topo frame =(double x = %.2f y = %.2f w = %.2f h = %.2f)\n", v6, v7, v8, v9, *(uint64_t *)&v11);
  }
  labelLayer = self->_labelLayer;
  if (labelLayer)
  {
    objc_msgSend_frame(labelLayer, v4, v5);
    double x = v19;
    double y = v21;
    CGFloat width = v23;
    CGFloat height = v25;
    if (dword_268147E38 <= 800 && (dword_268147E38 != -1 || sub_226865630((uint64_t)&dword_268147E38, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147E38, (uint64_t)"-[NetTopoObjectLayer getFrameContainingAllSublayers]", 800, (uint64_t)"label frame =(double x = %.2f y = %.2f w = %.2f h = %.2f)\n", v6, v7, v8, v9, *(uint64_t *)&x);
    }
  }
  else
  {
    double x = *MEMORY[0x263F001A8];
    double y = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat width = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  secondaryLabelLayer = self->_secondaryLabelLayer;
  if (secondaryLabelLayer)
  {
    objc_msgSend_frame(secondaryLabelLayer, v4, v5);
    v43.origin.double x = v28;
    v43.origin.double y = v29;
    v43.size.CGFloat width = v30;
    v43.size.CGFloat height = v31;
    v38.origin.double x = x;
    v38.origin.double y = y;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    CGRect v39 = CGRectUnion(v38, v43);
    double x = v39.origin.x;
    double y = v39.origin.y;
    CGFloat width = v39.size.width;
    CGFloat height = v39.size.height;
    int v32 = dword_268147E38;
    if (dword_268147E38 > 800) {
      goto LABEL_17;
    }
    if (dword_268147E38 != -1 || sub_226865630((uint64_t)&dword_268147E38, 0x320u)) {
      sub_226865EB4((uint64_t)&dword_268147E38, (uint64_t)"-[NetTopoObjectLayer getFrameContainingAllSublayers]", 800, (uint64_t)"label frame unioned with secondary frame =(double x = %.2f y = %.2f w = %.2f h = %.2f)\n", v6, v7, v8, v9, *(uint64_t *)&x);
    }
  }
  int v32 = dword_268147E38;
LABEL_17:
  if (x < 0.0)
  {
    if (v32 <= 800 && (v32 != -1 || sub_226865630((uint64_t)&dword_268147E38, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147E38, (uint64_t)"-[NetTopoObjectLayer getFrameContainingAllSublayers]", 800, (uint64_t)"label origin outside parent frame\n", v6, v7, v8, v9, v37);
    }
    v40.origin.double x = v11 + x;
    v40.origin.double y = v13 + y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = height;
    v44.origin.double x = v11;
    v44.origin.double y = v13;
    v44.size.CGFloat width = v15;
    v44.size.CGFloat height = v17;
    CGRect v41 = CGRectUnion(v40, v44);
    double v11 = v41.origin.x;
    double v13 = v41.origin.y;
    CGFloat v15 = v41.size.width;
    CGFloat v17 = v41.size.height;
    int v32 = dword_268147E38;
  }
  if (v32 <= 800 && (v32 != -1 || sub_226865630((uint64_t)&dword_268147E38, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147E38, (uint64_t)"-[NetTopoObjectLayer getFrameContainingAllSublayers]", 800, (uint64_t)"final basic frame =(double x = %.2f y = %.2f w = %.2f h = %.2f)\n", v6, v7, v8, v9, *(uint64_t *)&v11);
  }
  double v33 = v11;
  double v34 = v13;
  double v35 = v15;
  double v36 = v17;
  result.size.CGFloat height = v36;
  result.size.CGFloat width = v35;
  result.origin.double y = v34;
  result.origin.double x = v33;
  return result;
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  if ((objc_msgSend_isEqualToString_(a3, a2, @"objectImage") & 1) != 0
    || (objc_msgSend_isEqualToString_(a3, v5, @"selected") & 1) != 0
    || (objc_msgSend_isEqualToString_(a3, v6, @"ghosted") & 1) != 0)
  {
    return 1;
  }
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___NetTopoObjectLayer;
  return objc_msgSendSuper2(&v8, sel_needsDisplayForKey_, a3);
}

- (id)describeOne:(id)a3 uiLayer:(id)a4 indent:(unint64_t)a5
{
  uint64_t v7 = (objc_class *)objc_opt_class();
  Name = class_getName(v7);
  uint64_t v11 = objc_msgSend_retainCount(a4, v9, v10);
  uint64_t v14 = objc_msgSend_row(a4, v12, v13);
  uint64_t v17 = objc_msgSend_column(a4, v15, v16);
  objc_msgSend_appendFormat_(a3, v18, @"<%s: %p retains %d> (row=%d col=%d)", Name, a4, v11, v14, v17);
  return a3;
}

- (id)debugDescription
{
  uint64_t v3 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], a2, (uint64_t)&stru_26DA6BE88);
  objc_msgSend_describeOne_uiLayer_indent_(self, v4, (uint64_t)v3, self, 0);
  return v3;
}

- (BOOL)smallSize
{
  return self->_smallSize;
}

- (void)setSmallSize:(BOOL)a3
{
  self->_smallSize = a3;
}

- (unint64_t)row
{
  return self->_row;
}

- (void)setRow:(unint64_t)a3
{
  self->_row = a3;
}

- (unint64_t)column
{
  return self->_column;
}

- (void)setColumn:(unint64_t)a3
{
  self->_column = a3;
}

- (CGPoint)layoutOrigin
{
  double x = self->_layoutOrigin.x;
  double y = self->_layoutOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLayoutOrigin:(CGPoint)a3
{
  self->_layoutOrigin = a3;
}

- (double)prelim
{
  return self->_prelim;
}

- (void)setPrelim:(double)a3
{
  self->_prelim = a3;
}

- (double)mod
{
  return self->_mod;
}

- (void)setMod:(double)a3
{
  self->_mod = a3;
}

- (double)change
{
  return self->_change;
}

- (void)setChange:(double)a3
{
  self->_change = a3;
}

- (double)shift
{
  return self->_shift;
}

- (void)setShift:(double)a3
{
  self->_shift = a3;
}

- (unint64_t)number
{
  return self->_number;
}

- (void)setNumber:(unint64_t)a3
{
  self->_number = a3;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

- (NetTopoObjectLayer)contourThread
{
  return self->_contourThread;
}

- (void)setContourThread:(id)a3
{
  self->_contourThread = (NetTopoObjectLayer *)a3;
}

- (NetTopoObjectLayer)ancestor
{
  return self->_ancestor;
}

- (void)setAncestor:(id)a3
{
  self->_ancestor = (NetTopoObjectLayer *)a3;
}

- (id)associatedNode
{
  return self->_associatedNode;
}

- (void)setAssociatedNode:(id)a3
{
}

- (NetTopoObjectLayer)parent
{
  return self->_parent;
}

- (void)setParent:(id)a3
{
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (BOOL)isSelectable
{
  return self->_selectable;
}

- (void)setSelectable:(BOOL)a3
{
  self->_selectable = a3;
}

- (unint64_t)topoBadgeNumber
{
  return self->_topoBadgeNumber;
}

- (id)userObject
{
  return self->_userObject;
}

- (void)setUserObject:(id)a3
{
}

- (NSString)saveLabel
{
  return self->_saveLabel;
}

- (void)setSaveLabel:(id)a3
{
}

- (CGImage)objectImage
{
  return self->_objectImage;
}

- (void)setObjectImage:(CGImage *)a3
{
}

@end