@interface NetTopoDeviceConnectionLayer
- (CGPath)hitTestPath;
- (CGPath)newConnectionPathWithOffset:(double)a3;
- (CGPoint)downstreamConnectionPoint;
- (CGPoint)siblingMergePoint;
- (CGPoint)upstreamConnectionPoint;
- (CGRect)getUserInteractionBounds;
- (NSString)debugDescription;
- (NetTopoDeviceConnectionLayer)initWithUIStyle:(int)a3 andOwningView:(id)a4;
- (id)describeOne:(id)a3 uiLayer:(id)a4 indent:(unint64_t)a5;
- (unint64_t)connectionMedium;
- (unint64_t)connectionMediumFallback;
- (unint64_t)connectionStyle;
- (unint64_t)upstreamConnectionSide;
- (unint64_t)upstreamDeviceSpatialRelationship;
- (void)addBottomWindingConnectionToPath:(CGPath *)a3 withOffset:(double)a4;
- (void)addCurvedArrowConnectionToPath:(CGPath *)a3 withOffset:(double)a4;
- (void)addSideWindingConnectionToPath:(CGPath *)a3 withOffset:(double)a4;
- (void)dealloc;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)initNetTopoDeviceConnectionLayerCommonWithStyle:(int)a3 andOwningView:(id)a4;
- (void)layoutSublayers;
- (void)setConnectionMediumFallback:(unint64_t)a3;
- (void)setConnectionStyle:(unint64_t)a3;
- (void)setDownstreamConnectionPoint:(CGPoint)a3;
- (void)setNeedsDisplay;
- (void)setSelected:(BOOL)a3;
- (void)setSiblingMergePoint:(CGPoint)a3;
- (void)setUpstreamConnectionPoint:(CGPoint)a3;
- (void)setUpstreamConnectionSide:(unint64_t)a3;
- (void)setUpstreamDeviceSpatialRelationship:(unint64_t)a3;
@end

@implementation NetTopoDeviceConnectionLayer

- (void)initNetTopoDeviceConnectionLayerCommonWithStyle:(int)a3 andOwningView:(id)a4
{
  if (dword_268147FC8 <= 800 && (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer initNetTopoDeviceConnectionLayerCommonWithStyle:andOwningView:]", 800, (uint64_t)"%@\n", v4, v5, v6, v7, (uint64_t)self);
  }
  self->super._selectable = 0;
  objc_msgSend_setOwningView_(self, a2, (uint64_t)a4);
  v10 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
  self->_connectionLineLayer = v10;
  objc_msgSend_setDelegate_(v10, v11, (uint64_t)self);
  uint64_t v13 = objc_msgSend_setLineCap_(self->_connectionLineLayer, v12, *MEMORY[0x263F15E70]);
  if (self->super._topoStyle)
  {
    if (sub_2269050C4(v13, v14, v15))
    {
      self->_lineColorEthernet = sub_2268EF290(0.45, 0.45, 0.45, 1.0);
      CGFloat v16 = 1.0;
      CGFloat v17 = 0.45;
      CGFloat v18 = 0.45;
      CGFloat v19 = 0.45;
    }
    else
    {
      self->_lineColorEthernet = sub_2268EF290(0.584313725, 0.607843137, 0.662745098, 1.0);
      CGFloat v16 = 1.0;
      CGFloat v17 = 0.584313725;
      CGFloat v18 = 0.607843137;
      CGFloat v19 = 0.662745098;
    }
    v20 = sub_2268EF290(v17, v18, v19, v16);
    v21 = &OBJC_IVAR___NetTopoDeviceConnectionLayer__lineColorWiFi;
  }
  else
  {
    self->_lineColorActive = sub_2268EF290(1.0, 1.0, 1.0, 0.8);
    v20 = sub_2268EF290(1.0, 1.0, 1.0, 0.2);
    v21 = &OBJC_IVAR___NetTopoDeviceConnectionLayer__lineColorInactive;
  }
  *(Class *)((char *)&self->super.super.super.isa + *v21) = v20;
  self->_selectedLineColor = sub_2268EF290(0.117647059, 0.137254902, 0.823529412, 1.0);
  self->_whiteColor = sub_2268EF290(1.0, 1.0, 1.0, 0.75);
  self->_clearColor = sub_2268EF328();
  objc_msgSend_setZPosition_(self, v22, v23, 0.0);
  connectionLineLayer = self->_connectionLineLayer;

  objc_msgSend_addSublayer_(self, v24, (uint64_t)connectionLineLayer);
}

- (NetTopoDeviceConnectionLayer)initWithUIStyle:(int)a3 andOwningView:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)NetTopoDeviceConnectionLayer;
  uint64_t v6 = -[NetTopoObjectLayer initWithUIStyle:andOwningView:](&v10, sel_initWithUIStyle_andOwningView_);
  v8 = v6;
  if (v6) {
    objc_msgSend_initNetTopoDeviceConnectionLayerCommonWithStyle_andOwningView_(v6, v7, v5, a4);
  }
  return v8;
}

- (void)dealloc
{
  if (dword_268147FC8 <= 800 && (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer dealloc]", 800, (uint64_t)"%@\n", v2, v3, v4, v5, (uint64_t)self);
  }

  self->_connectionLineLayer = 0;
  int topoStyle = self->super._topoStyle;
  BOOL v8 = topoStyle == 0;
  if (topoStyle) {
    v9 = &OBJC_IVAR___NetTopoDeviceConnectionLayer__lineColorWiFi;
  }
  else {
    v9 = &OBJC_IVAR___NetTopoDeviceConnectionLayer__lineColorActive;
  }
  if (v8) {
    objc_super v10 = &OBJC_IVAR___NetTopoDeviceConnectionLayer__lineColorInactive;
  }
  else {
    objc_super v10 = &OBJC_IVAR___NetTopoDeviceConnectionLayer__lineColorEthernet;
  }
  CGColorRelease(*(CGColorRef *)((char *)&self->super.super.super.isa + *v9));
  CGColorRelease(*(CGColorRef *)((char *)&self->super.super.super.isa + *v10));
  CGColorRelease(self->_selectedLineColor);
  self->_selectedLineColor = 0;
  CGColorRelease(self->_clearColor);
  self->_clearColor = 0;
  CGColorRelease(self->_whiteColor);
  self->_whiteColor = 0;
  v11.receiver = self;
  v11.super_class = (Class)NetTopoDeviceConnectionLayer;
  [(NetTopoObjectLayer *)&v11 dealloc];
}

- (CGRect)getUserInteractionBounds
{
  if (dword_268147FC8 <= 800)
  {
    if (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u))
    {
      objc_msgSend_bounds(self, a2, v2);
      uint64_t v5 = v4;
      objc_msgSend_bounds(self, v6, v7);
      objc_msgSend_bounds(self, v8, v9);
      objc_msgSend_bounds(self, v10, v11);
      sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer getUserInteractionBounds]", 800, (uint64_t)"bounds = (x = %.2f, y = %.2f, w = %.2f, h = %.2f)\n", v12, v13, v14, v15, v5);
    }
    if (dword_268147FC8 <= 800)
    {
      if (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u))
      {
        objc_msgSend_frame(self, a2, v2);
        uint64_t v17 = v16;
        objc_msgSend_frame(self, v18, v19);
        objc_msgSend_frame(self, v20, v21);
        objc_msgSend_frame(self, v22, v23);
        sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer getUserInteractionBounds]", 800, (uint64_t)"frame = (x = %.2f, y = %.2f, w = %.2f, h = %.2f)\n", v24, v25, v26, v27, v17);
      }
      if (dword_268147FC8 <= 800)
      {
        if (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u))
        {
          objc_msgSend_position(self, a2, v2);
          uint64_t v29 = v28;
          objc_msgSend_position(self, v30, v31);
          sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer getUserInteractionBounds]", 800, (uint64_t)"position = (x = %.2f, y = %.2f)\n", v32, v33, v34, v35, v29);
        }
        if (dword_268147FC8 <= 800 && (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u)))
        {
          objc_msgSend_anchorPoint(self, a2, v2);
          uint64_t v37 = v36;
          objc_msgSend_anchorPoint(self, v38, v39);
          sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer getUserInteractionBounds]", 800, (uint64_t)"anchor = (x = %.2f, y = %.2f)\n", v40, v41, v42, v43, v37);
        }
      }
    }
  }

  objc_msgSend_bounds(self, a2, v2);
  result.size.height = v47;
  result.size.width = v46;
  result.origin.y = v45;
  result.origin.x = v44;
  return result;
}

- (void)setDownstreamConnectionPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_downstreamConnectionPoint = (uint64_t *)&self->_downstreamConnectionPoint;
  uint64_t v8 = objc_msgSend_superlayer(self, a2, v3);
  objc_msgSend_convertPoint_fromLayer_(self, v9, v8, x, y);
  uint64_t *p_downstreamConnectionPoint = v14;
  p_downstreamConnectionPoint[1] = v15;
  if (dword_268147FC8 <= 800)
  {
    if (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u)) {
      sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer setDownstreamConnectionPoint:]", 800, (uint64_t)"input point=(x = %.2f double y = %.2f)\n", v10, v11, v12, v13, *(uint64_t *)&x);
    }
    if (dword_268147FC8 <= 800 && (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer setDownstreamConnectionPoint:]", 800, (uint64_t)"converted point=(x = %.2f double y = %.2f)\n", v10, v11, v12, v13, *p_downstreamConnectionPoint);
    }
  }
}

- (CGPoint)downstreamConnectionPoint
{
  p_downstreamConnectionPoint = &self->_downstreamConnectionPoint;
  uint64_t v6 = objc_msgSend_superlayer(self, a2, v2);
  double x = p_downstreamConnectionPoint->x;
  double y = p_downstreamConnectionPoint->y;

  objc_msgSend_convertPoint_toLayer_(self, v5, v6, x, y);
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (void)setUpstreamConnectionPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_upstreamConnectionPoint = (uint64_t *)&self->_upstreamConnectionPoint;
  uint64_t v8 = objc_msgSend_superlayer(self, a2, v3);
  objc_msgSend_convertPoint_fromLayer_(self, v9, v8, x, y);
  uint64_t *p_upstreamConnectionPoint = v14;
  p_upstreamConnectionPoint[1] = v15;
  if (dword_268147FC8 <= 800)
  {
    if (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u)) {
      sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer setUpstreamConnectionPoint:]", 800, (uint64_t)"input point=(x = %.2f double y = %.2f)\n", v10, v11, v12, v13, *(uint64_t *)&x);
    }
    if (dword_268147FC8 <= 800 && (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer setUpstreamConnectionPoint:]", 800, (uint64_t)"converted point=(x = %.2f double y = %.2f)\n", v10, v11, v12, v13, *p_upstreamConnectionPoint);
    }
  }
}

- (CGPoint)upstreamConnectionPoint
{
  p_upstreamConnectionPoint = &self->_upstreamConnectionPoint;
  uint64_t v6 = objc_msgSend_superlayer(self, a2, v2);
  double x = p_upstreamConnectionPoint->x;
  double y = p_upstreamConnectionPoint->y;

  objc_msgSend_convertPoint_toLayer_(self, v5, v6, x, y);
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (CGPoint)siblingMergePoint
{
  p_siblingMergePoint = &self->_siblingMergePoint;
  uint64_t v6 = objc_msgSend_superlayer(self, a2, v2);
  double x = p_siblingMergePoint->x;
  double y = p_siblingMergePoint->y;

  objc_msgSend_convertPoint_toLayer_(self, v5, v6, x, y);
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (void)setSiblingMergePoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_siblingMergePoint = (uint64_t *)&self->_siblingMergePoint;
  uint64_t v8 = objc_msgSend_superlayer(self, a2, v3);
  objc_msgSend_convertPoint_fromLayer_(self, v9, v8, x, y);
  uint64_t *p_siblingMergePoint = v14;
  p_siblingMergePoint[1] = v15;
  if (dword_268147FC8 <= 800)
  {
    if (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u)) {
      sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer setSiblingMergePoint:]", 800, (uint64_t)"input point=(x = %.2f double y = %.2f)\n", v10, v11, v12, v13, *(uint64_t *)&x);
    }
    if (dword_268147FC8 <= 800 && (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer setSiblingMergePoint:]", 800, (uint64_t)"converted point=(x = %.2f double y = %.2f)\n", v10, v11, v12, v13, *p_siblingMergePoint);
    }
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->super._selectable)
  {
    BOOL v3 = a3;
    if (objc_msgSend_isSelected(self, a2, a3) != a3)
    {
      v10.receiver = self;
      v10.super_class = (Class)NetTopoDeviceConnectionLayer;
      [(NetTopoObjectLayer *)&v10 setSelected:v3];
      objc_msgSend_setNeedsDisplay(self->_connectionLineLayer, v5, v6);
      double v9 = 100.0;
      if (!v3) {
        double v9 = 0.0;
      }
      objc_msgSend_setZPosition_(self, v7, v8, v9);
    }
  }
}

- (unint64_t)connectionMedium
{
  uint64_t v4 = objc_msgSend_associatedNode(self, a2, v2);
  if (v4) {
    return objc_msgSend_medium(v4, v5, v6);
  }
  else {
    return self->_connectionMediumFallback;
  }
}

- (void)layoutSublayers
{
  objc_msgSend_bounds(self, a2, v2);
  objc_msgSend_setFrame_(self->_connectionLineLayer, v4, v5);
  connectionLineLayer = self->_connectionLineLayer;

  objc_msgSend_setNeedsDisplay(connectionLineLayer, v6, v7);
}

- (void)addSideWindingConnectionToPath:(CGPath *)a3 withOffset:(double)a4
{
  if (objc_msgSend_upstreamDeviceSpatialRelationship(self, a2, (uint64_t)a3) == 4)
  {
    BOOL v9 = objc_msgSend_connectionMedium(self, v7, v8) == 1;
    double v12 = 1.0;
    double v13 = -1.0;
  }
  else
  {
    BOOL v9 = objc_msgSend_upstreamDeviceSpatialRelationship(self, v7, v8) == 1;
    double v12 = -1.0;
    double v13 = 1.0;
  }
  if (v9) {
    double v14 = v13;
  }
  else {
    double v14 = v12;
  }
  if (objc_msgSend_upstreamConnectionSide(self, v10, v11, v12) == 1) {
    double v15 = -10.0;
  }
  else {
    double v15 = 10.0;
  }
  CGPathMoveToPoint(a3, 0, self->_upstreamConnectionPoint.x + v15, self->_upstreamConnectionPoint.y);
  if (a4 != 0.0) {
    CGPathAddLineToPoint(a3, 0, v15 + self->_upstreamConnectionPoint.x, self->_upstreamConnectionPoint.y + a4);
  }
  p_siblingMergePoint = &self->_siblingMergePoint;
  CGPathAddArcToPoint(a3, 0, self->_siblingMergePoint.x - a4, self->_upstreamConnectionPoint.y + a4, self->_siblingMergePoint.x - a4, self->_upstreamConnectionPoint.y + 12.0 + a4, 12.0);
  CGPathAddArcToPoint(a3, 0, p_siblingMergePoint->x - a4, self->_siblingMergePoint.y - a4, p_siblingMergePoint->x + v14 * 12.0 - a4, self->_siblingMergePoint.y - a4, 12.0);
  p_downstreamConnectionPoint = &self->_downstreamConnectionPoint;
  CGPathAddArcToPoint(a3, 0, p_downstreamConnectionPoint->x - a4, p_siblingMergePoint->y - a4, p_downstreamConnectionPoint->x - a4, p_siblingMergePoint->y + 12.0 - a4, 12.0);
  CGPathAddLineToPoint(a3, 0, p_downstreamConnectionPoint->x - a4, p_downstreamConnectionPoint->y + -10.0);
  if (a4 != 0.0)
  {
    CGFloat x = p_downstreamConnectionPoint->x;
    double v19 = p_downstreamConnectionPoint->y + -10.0;
    CGPathAddLineToPoint(a3, 0, x, v19);
  }
}

- (void)addBottomWindingConnectionToPath:(CGPath *)a3 withOffset:(double)a4
{
  double v13 = 1.0;
  if (objc_msgSend_upstreamDeviceSpatialRelationship(self, a2, (uint64_t)a3) == 3
    || (double v13 = -1.0, objc_msgSend_upstreamDeviceSpatialRelationship(self, v7, v8) == 5))
  {
    if (dword_268147FC8 <= 800)
    {
      if (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u)) {
        sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer addBottomWindingConnectionToPath:withOffset:]", 800, (uint64_t)"_upstreamConnectionPoint = (x = %.2f CGFloat y = %.2f)\n", v9, v10, v11, v12, *(void *)&self->_upstreamConnectionPoint.x);
      }
      if (dword_268147FC8 <= 800)
      {
        if (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u)) {
          sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer addBottomWindingConnectionToPath:withOffset:]", 800, (uint64_t)"_downstreamConnectionPoint = (x = %.2f CGFloat y = %.2f)\n", v9, v10, v11, v12, *(void *)&self->_downstreamConnectionPoint.x);
        }
        if (dword_268147FC8 <= 800 && (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer addBottomWindingConnectionToPath:withOffset:]", 800, (uint64_t)"_siblingMergePoint = (x = %.2f CGFloat y = %.2f)\n", v9, v10, v11, v12, *(void *)&self->_siblingMergePoint.x);
        }
      }
    }
    CGPathMoveToPoint(a3, 0, self->_upstreamConnectionPoint.x - a4, self->_upstreamConnectionPoint.y + 4.0);
    if (a4 != 0.0) {
      CGPathAddLineToPoint(a3, 0, self->_upstreamConnectionPoint.x - a4, self->_upstreamConnectionPoint.y);
    }
    p_siblingMergePoint = &self->_siblingMergePoint;
    CGPathAddArcToPoint(a3, 0, self->_siblingMergePoint.x - a4, self->_siblingMergePoint.y - a4, self->_siblingMergePoint.x + v13 * 12.0 - a4, self->_siblingMergePoint.y - a4, 12.0);
    p_downstreamConnectionPoint = &self->_downstreamConnectionPoint;
    CGPathAddArcToPoint(a3, 0, p_downstreamConnectionPoint->x - a4, p_siblingMergePoint->y - a4, p_downstreamConnectionPoint->x - a4, p_siblingMergePoint->y + 12.0 - a4, 12.0);
    CGPathAddLineToPoint(a3, 0, p_downstreamConnectionPoint->x - a4, p_downstreamConnectionPoint->y);
    if (a4 != 0.0)
    {
      CGFloat x = p_downstreamConnectionPoint->x;
      CGFloat y = p_downstreamConnectionPoint->y;
      CGPathAddLineToPoint(a3, 0, x, y);
    }
  }
  else if (dword_268147FC8 <= 800 && (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u)))
  {
    sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer addBottomWindingConnectionToPath:withOffset:]", 800, (uint64_t)"unsupported spatial relationship for this position\n", v9, v10, v11, v12, v19);
  }
}

- (void)addCurvedArrowConnectionToPath:(CGPath *)a3 withOffset:(double)a4
{
  if (objc_msgSend_upstreamDeviceSpatialRelationship(self, a2, (uint64_t)a3) == 1)
  {
    if (dword_268147FC8 <= 800)
    {
      if (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u)) {
        sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer addCurvedArrowConnectionToPath:withOffset:]", 800, (uint64_t)"_upstreamConnectionPoint = (x = %.2f double y = %.2f)\n", v7, v8, v9, v10, *(void *)&self->_upstreamConnectionPoint.x);
      }
      if (dword_268147FC8 <= 800)
      {
        if (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u)) {
          sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer addCurvedArrowConnectionToPath:withOffset:]", 800, (uint64_t)"_downstreamConnectionPoint = (x = %.2f double y = %.2f)\n", v7, v8, v9, v10, *(void *)&self->_downstreamConnectionPoint.x);
        }
        if (dword_268147FC8 <= 800 && (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer addCurvedArrowConnectionToPath:withOffset:]", 800, (uint64_t)"offset = %.2f\n", v7, v8, v9, v10, *(uint64_t *)&a4);
        }
      }
    }
    double y = self->_downstreamConnectionPoint.y;
    CGFloat v12 = self->_downstreamConnectionPoint.x - a4;
    CGFloat v13 = self->_upstreamConnectionPoint.x + a4 + 3.0;
    CGFloat v14 = self->_upstreamConnectionPoint.y + 1.0;
    CGPathMoveToPoint(a3, 0, v12, y);
    CGPathAddCurveToPoint(a3, 0, v12 + -25.0, y + -26.0, v13 + 25.0, v14 + -26.0, v13 + 3.0, v14 + -1.0);
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, v13, v14 + -1.0);
    CGPathAddLineToPoint(Mutable, 0, v13 + 15.0, v14 + -1.0);
    CGPathAddLineToPoint(Mutable, 0, v13 + 8.0, v14 + -13.6999998);
    CGPathCloseSubpath(Mutable);
    self->_arrowhead = Mutable;
    CGPathAddPath(a3, 0, Mutable);
  }
  else if (dword_268147FC8 <= 800 && (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u)))
  {
    sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer addCurvedArrowConnectionToPath:withOffset:]", 800, (uint64_t)"unsupported spatial relationship for this position\n", v7, v8, v9, v10, v17);
  }
}

- (CGPath)newConnectionPathWithOffset:(double)a3
{
  if (dword_268147FC8 <= 800 && (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer newConnectionPathWithOffset:]", 800, (uint64_t)"entered with offset %f\n", v3, v4, v5, v6, *(uint64_t *)&a3);
  }
  Mutable = CGPathCreateMutable();
  switch(objc_msgSend_upstreamDeviceSpatialRelationship(self, v10, v11))
  {
    case 1:
    case 2:
      switch(objc_msgSend_connectionStyle(self, v12, v13))
      {
        case 1:
          if (dword_268147FC8 <= 800 && (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer newConnectionPathWithOffset:]", 800, (uint64_t)"kConnectionStyleDirect\n", v14, v15, v16, v17, v29);
          }
          CGPathMoveToPoint(Mutable, 0, self->_upstreamConnectionPoint.x + 10.0, self->_upstreamConnectionPoint.y);
          if (a3 != 0.0) {
            CGPathAddLineToPoint(Mutable, 0, self->_upstreamConnectionPoint.x + 10.0, self->_upstreamConnectionPoint.y - a3);
          }
          p_downstreamConnectionPoint = &self->_downstreamConnectionPoint;
          CGPathAddLineToPoint(Mutable, 0, p_downstreamConnectionPoint->x + -10.0, p_downstreamConnectionPoint->y - a3);
          if (a3 == 0.0) {
            goto LABEL_53;
          }
          double y = p_downstreamConnectionPoint->y;
          double x = p_downstreamConnectionPoint->x + -10.0;
          break;
        case 2:
          if (dword_268147FC8 <= 800 && (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer newConnectionPathWithOffset:]", 800, (uint64_t)"kConnectionStyleSingleBend\n", v14, v15, v16, v17, v29);
          }
          if (objc_msgSend_upstreamDeviceSpatialRelationship(self, v18, v19) == 1) {
            double v25 = 1.0;
          }
          else {
            double v25 = -1.0;
          }
          p_upstreamConnectionPoint = &self->_upstreamConnectionPoint;
          CGPathMoveToPoint(Mutable, 0, self->_upstreamConnectionPoint.x + v25 * 10.0, self->_upstreamConnectionPoint.y);
          if (a3 != 0.0) {
            CGPathAddLineToPoint(Mutable, 0, p_upstreamConnectionPoint->x + v25 * 10.0, self->_upstreamConnectionPoint.y - a3);
          }
          uint64_t v27 = &self->_downstreamConnectionPoint;
          CGPathAddArcToPoint(Mutable, 0, v27->x + a3 * v25, p_upstreamConnectionPoint->y - a3, v27->x + a3 * v25, v27->y + -10.0, 12.0);
          CGPathAddLineToPoint(Mutable, 0, v27->x + a3 * v25, v27->y + -10.0);
          if (a3 == 0.0) {
            goto LABEL_53;
          }
          double x = v27->x;
          double y = v27->y + -10.0;
          break;
        case 3:
          goto LABEL_36;
        case 4:
          goto LABEL_31;
        case 5:
          objc_msgSend_addCurvedArrowConnectionToPath_withOffset_(self, v18, (uint64_t)Mutable, a3 + 6.0);
          goto LABEL_53;
        default:
          goto LABEL_53;
      }
      goto LABEL_51;
    case 3:
    case 5:
      objc_msgSend_addBottomWindingConnectionToPath_withOffset_(self, v12, (uint64_t)Mutable, a3);
      goto LABEL_53;
    case 4:
      if (dword_268147FC8 <= 800 && (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer newConnectionPathWithOffset:]", 800, (uint64_t)"kUpstreamDeviceAboveCenter\n", v14, v15, v16, v17, v29);
      }
      uint64_t v23 = objc_msgSend_connectionStyle(self, v12, v13);
      switch(v23)
      {
        case 4:
LABEL_31:
          if (dword_268147FC8 <= 800 && (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer newConnectionPathWithOffset:]", 800, (uint64_t)"kConnectionStyleSideWinding\n", v14, v15, v16, v17, v29);
          }
          objc_msgSend_addSideWindingConnectionToPath_withOffset_(self, v18, (uint64_t)Mutable, a3);
          break;
        case 3:
LABEL_36:
          if (dword_268147FC8 > 800) {
            return Mutable;
          }
          if (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u)) {
            sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer newConnectionPathWithOffset:]", 800, (uint64_t)"kConnectionStyleBottomWinding - unsupported for this spatial relationship\n", v14, v15, v16, v17, v29);
          }
          break;
        case 1:
          if (dword_268147FC8 <= 800 && (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer newConnectionPathWithOffset:]", 800, (uint64_t)"kConnectionStyleDirect\n", v14, v15, v16, v17, v29);
          }
          CGPathMoveToPoint(Mutable, 0, self->_upstreamConnectionPoint.x, self->_upstreamConnectionPoint.y + 4.0);
          if (a3 != 0.0) {
            CGPathAddLineToPoint(Mutable, 0, self->_upstreamConnectionPoint.x - a3, self->_upstreamConnectionPoint.y + 4.0);
          }
          uint64_t v24 = &self->_downstreamConnectionPoint;
          CGPathAddLineToPoint(Mutable, 0, v24->x - a3, v24->y);
          if (a3 != 0.0)
          {
            double x = v24->x;
            double y = v24->y;
LABEL_51:
            CGPathAddLineToPoint(Mutable, 0, x, y);
          }
          break;
      }
LABEL_53:
      if (dword_268147FC8 <= 800 && (dword_268147FC8 != -1 || sub_226865630((uint64_t)&dword_268147FC8, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147FC8, (uint64_t)"-[NetTopoDeviceConnectionLayer newConnectionPathWithOffset:]", 800, (uint64_t)"done\n", v14, v15, v16, v17, v29);
      }
      return Mutable;
    default:
      goto LABEL_53;
  }
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  uint64_t v6 = (const CGPath *)objc_msgSend_newConnectionPathWithOffset_(self, a2, (uint64_t)a3, 0.0);
  char isGhosted = objc_msgSend_isGhosted(self, v7, v8);
  int topoStyle = self->super._topoStyle;
  connectionLineLayer = self->_connectionLineLayer;
  if ((isGhosted & 1) == 0)
  {
    if (topoStyle)
    {
      objc_msgSend_setLineDashPattern_(self->_connectionLineLayer, v10, 0);
      goto LABEL_9;
    }
    uint64_t v22 = 568;
LABEL_8:
    objc_msgSend_setStrokeColor_(self->_connectionLineLayer, v10, *(uint64_t *)((char *)&self->super.super.super.isa + v22));
    goto LABEL_9;
  }
  if (!topoStyle)
  {
    uint64_t v22 = 576;
    goto LABEL_8;
  }
  uint64_t v13 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v14 = objc_msgSend_numberWithInteger_(NSNumber, v10, 6);
  uint64_t v16 = objc_msgSend_numberWithInteger_(NSNumber, v15, 6);
  uint64_t v18 = objc_msgSend_arrayWithObjects_(v13, v17, v14, v16, 0);
  objc_msgSend_setLineDashPattern_(connectionLineLayer, v19, v18);
LABEL_9:
  if (self->super._selectable && objc_msgSend_isSelected(self, v20, v21))
  {
    objc_msgSend_setStrokeColor_(self->_connectionLineLayer, v20, (uint64_t)self->_selectedLineColor);
    double v24 = 6.0;
    goto LABEL_23;
  }
  if (objc_msgSend_connectionMedium(self, v20, v21) == 1 || objc_msgSend_connectionMedium(self, v25, v26) == 3)
  {
    uint64_t v28 = self->_connectionLineLayer;
    if (self->super._topoStyle)
    {
      objc_msgSend_setStrokeColor_(self->_connectionLineLayer, v25, (uint64_t)self->_lineColorWiFi);
    }
    else
    {
      uint64_t v29 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v30 = objc_msgSend_numberWithInteger_(NSNumber, v25, 0);
      uint64_t v32 = objc_msgSend_numberWithInteger_(NSNumber, v31, 10);
      uint64_t v34 = objc_msgSend_arrayWithObjects_(v29, v33, v30, v32, 0);
      objc_msgSend_setLineDashPattern_(v28, v35, v34);
    }
LABEL_22:
    double v24 = 4.0;
    goto LABEL_23;
  }
  if (objc_msgSend_connectionMedium(self, v25, v27) == 2 || (double v24 = 4.0, !objc_msgSend_connectionMedium(self, v23, v36)))
  {
    uint64_t v37 = self->_connectionLineLayer;
    if (self->super._topoStyle) {
      objc_msgSend_setStrokeColor_(v37, v23, (uint64_t)self->_lineColorEthernet);
    }
    else {
      objc_msgSend_setLineDashPattern_(v37, v23, 0);
    }
    goto LABEL_22;
  }
LABEL_23:
  objc_msgSend_setFillColor_(self->_connectionLineLayer, v23, (uint64_t)self->_clearColor);
  objc_msgSend_setLineWidth_(self->_connectionLineLayer, v38, v39, v24);
  objc_msgSend_setLineJoin_(self->_connectionLineLayer, v40, *MEMORY[0x263F15E98]);
  objc_msgSend_setPath_(self->_connectionLineLayer, v41, (uint64_t)v6);
  if (self->_arrowhead)
  {
    CGContextSaveGState(a4);
    if (self->super._topoStyle) {
      uint64_t v42 = &OBJC_IVAR___NetTopoDeviceConnectionLayer__lineColorWiFi;
    }
    else {
      uint64_t v42 = &OBJC_IVAR___NetTopoDeviceConnectionLayer__lineColorActive;
    }
    CGContextSetFillColorWithColor(a4, *(CGColorRef *)((char *)&self->super.super.super.isa + *v42));
    CGContextAddPath(a4, self->_arrowhead);
    CGContextFillPath(a4);
    CGContextRestoreGState(a4);
    objc_msgSend_setLineJoin_(self->_connectionLineLayer, v43, *MEMORY[0x263F15E88]);
    self->_arrowhead = 0;
  }
  CGPathRelease(v6);
  if (self->super._topoStyle == 1 && !sub_2269050C4(v44, v45, v46))
  {
    LODWORD(v49) = 1.0;
    objc_msgSend_setShadowOpacity_(self->_connectionLineLayer, v47, v48, v49);
    objc_msgSend_setShadowOffset_(self->_connectionLineLayer, v50, v51, 0.0, 1.0);
    objc_msgSend_setShadowRadius_(self->_connectionLineLayer, v52, v53, 0.0);
    whiteColor = self->_whiteColor;
    v55 = self->_connectionLineLayer;
    MEMORY[0x270F9A6D0](v55, sel_setShadowColor_, whiteColor);
  }
}

- (void)setNeedsDisplay
{
  v5.receiver = self;
  v5.super_class = (Class)NetTopoDeviceConnectionLayer;
  [(NetTopoDeviceConnectionLayer *)&v5 setNeedsDisplay];
  objc_msgSend_setNeedsDisplay(self->_connectionLineLayer, v3, v4);
}

- (id)describeOne:(id)a3 uiLayer:(id)a4 indent:(unint64_t)a5
{
  uint64_t v8 = (objc_class *)objc_opt_class();
  Name = class_getName(v8);
  uint64_t v12 = objc_msgSend_retainCount(a4, v10, v11);
  objc_msgSend_appendFormat_(a3, v13, @"<%s: %p retains %d> ("), Name, a4, v12;
  uint64_t v16 = objc_msgSend_connectionMedium(self, v14, v15);
  uint64_t v18 = @"unknown medium";
  if (v16 == 2) {
    uint64_t v18 = @"Ethernet";
  }
  if (v16 == 1) {
    objc_msgSend_appendString_(a3, v17, @"WiFi");
  }
  else {
    objc_msgSend_appendString_(a3, v17, (uint64_t)v18);
  }
  objc_msgSend_appendString_(a3, v19, @""));
  return a3;
}

- (NSString)debugDescription
{
  uint64_t v3 = (NSString *)objc_msgSend_stringWithString_(MEMORY[0x263F089D8], a2, (uint64_t)&stru_26DA6BE88);
  objc_msgSend_describeOne_uiLayer_indent_(self, v4, (uint64_t)v3, self, 0);
  return v3;
}

- (unint64_t)upstreamDeviceSpatialRelationship
{
  return self->_upstreamDeviceSpatialRelationship;
}

- (void)setUpstreamDeviceSpatialRelationship:(unint64_t)a3
{
  self->_upstreamDeviceSpatialRelationship = a3;
}

- (unint64_t)connectionStyle
{
  return self->_connectionStyle;
}

- (void)setConnectionStyle:(unint64_t)a3
{
  self->_connectionStyle = a3;
}

- (unint64_t)upstreamConnectionSide
{
  return self->_upstreamConnectionSide;
}

- (void)setUpstreamConnectionSide:(unint64_t)a3
{
  self->_upstreamConnectionSide = a3;
}

- (unint64_t)connectionMediumFallback
{
  return self->_connectionMediumFallback;
}

- (void)setConnectionMediumFallback:(unint64_t)a3
{
  self->_connectionMediumFallback = a3;
}

- (CGPath)hitTestPath
{
  return self->_hitTestPath;
}

@end