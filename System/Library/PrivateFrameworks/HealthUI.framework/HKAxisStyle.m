@interface HKAxisStyle
+ (id)defaultStyle;
- (BOOL)showGridLines;
- (HKAxisLabelStyle)labelStyle;
- (HKFillStyle)fillStyle;
- (HKStrokeStyle)axisLineStyle;
- (HKStrokeStyle)borderStyleForFill;
- (HKStrokeStyle)gridLineStyle;
- (HKStrokeStyle)minorGridLineStyle;
- (HKStrokeStyle)referenceGridLineStyle;
- (HKTickStyle)tickStyle;
- (double)fillInnerPadding;
- (double)fillOuterPadding;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)location;
- (unint64_t)axisLabelPosition;
- (unint64_t)tickPositions;
- (void)setAxisLabelPosition:(unint64_t)a3;
- (void)setAxisLineStyle:(id)a3;
- (void)setBorderStyleForFill:(id)a3;
- (void)setFillInnerPadding:(double)a3;
- (void)setFillOuterPadding:(double)a3;
- (void)setFillStyle:(id)a3;
- (void)setGridLineStyle:(id)a3;
- (void)setLabelStyle:(id)a3;
- (void)setLocation:(int64_t)a3;
- (void)setMinorGridLineStyle:(id)a3;
- (void)setReferenceGridLineStyle:(id)a3;
- (void)setShowGridLines:(BOOL)a3;
- (void)setTickPositions:(unint64_t)a3;
- (void)setTickStyle:(id)a3;
@end

@implementation HKAxisStyle

- (void)setTickPositions:(unint64_t)a3
{
  self->_tickPositions = a3;
}

- (void)setShowGridLines:(BOOL)a3
{
  self->_showGridLines = a3;
}

- (void)setLocation:(int64_t)a3
{
  self->_location = a3;
}

- (void)setLabelStyle:(id)a3
{
}

- (void)setGridLineStyle:(id)a3
{
}

- (void)setFillStyle:(id)a3
{
}

- (void)setFillOuterPadding:(double)a3
{
  self->_fillOuterPadding = a3;
}

- (void)setFillInnerPadding:(double)a3
{
  self->_fillInnerPadding = a3;
}

- (void)setBorderStyleForFill:(id)a3
{
}

- (void)setAxisLineStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderStyleForFill, 0);
  objc_storeStrong((id *)&self->_fillStyle, 0);
  objc_storeStrong((id *)&self->_labelStyle, 0);
  objc_storeStrong((id *)&self->_tickStyle, 0);
  objc_storeStrong((id *)&self->_axisLineStyle, 0);
  objc_storeStrong((id *)&self->_referenceGridLineStyle, 0);
  objc_storeStrong((id *)&self->_minorGridLineStyle, 0);
  objc_storeStrong((id *)&self->_gridLineStyle, 0);
}

+ (id)defaultStyle
{
  v2 = (id *)objc_opt_new();
  v3 = objc_opt_new();
  [v2 setLabelStyle:v3];

  v4 = [MEMORY[0x1E4FB1618] blackColor];
  [v2[7] setTextColor:v4];

  v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  [v2[7] setFont:v5];

  [v2[7] setHorizontalAlignment:1];
  [v2[7] setVerticalAlignment:1];
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(HKStrokeStyle *)self->_gridLineStyle copy];
  v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  uint64_t v7 = [(HKStrokeStyle *)self->_minorGridLineStyle copy];
  v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  uint64_t v9 = [(HKStrokeStyle *)self->_referenceGridLineStyle copy];
  v10 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v9;

  uint64_t v11 = [(HKStrokeStyle *)self->_axisLineStyle copy];
  v12 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v11;

  uint64_t v13 = [(HKTickStyle *)self->_tickStyle copy];
  v14 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v13;

  uint64_t v15 = [(HKAxisLabelStyle *)self->_labelStyle copy];
  v16 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v15;

  *(void *)(v4 + 64) = self->_tickPositions;
  *(void *)(v4 + 72) = self->_axisLabelPosition;
  *(unsigned char *)(v4 + 8) = self->_showGridLines;
  objc_storeStrong((id *)(v4 + 80), self->_fillStyle);
  *(double *)(v4 + 88) = self->_fillInnerPadding;
  *(double *)(v4 + 96) = self->_fillOuterPadding;
  uint64_t v17 = [(HKStrokeStyle *)self->_borderStyleForFill copy];
  v18 = *(void **)(v4 + 104);
  *(void *)(v4 + 104) = v17;

  *(void *)(v4 + 112) = self->_location;
  return (id)v4;
}

- (HKStrokeStyle)gridLineStyle
{
  return self->_gridLineStyle;
}

- (HKStrokeStyle)minorGridLineStyle
{
  return self->_minorGridLineStyle;
}

- (void)setMinorGridLineStyle:(id)a3
{
}

- (HKStrokeStyle)referenceGridLineStyle
{
  return self->_referenceGridLineStyle;
}

- (void)setReferenceGridLineStyle:(id)a3
{
}

- (HKStrokeStyle)axisLineStyle
{
  return self->_axisLineStyle;
}

- (HKTickStyle)tickStyle
{
  return self->_tickStyle;
}

- (void)setTickStyle:(id)a3
{
}

- (HKAxisLabelStyle)labelStyle
{
  return self->_labelStyle;
}

- (unint64_t)tickPositions
{
  return self->_tickPositions;
}

- (unint64_t)axisLabelPosition
{
  return self->_axisLabelPosition;
}

- (void)setAxisLabelPosition:(unint64_t)a3
{
  self->_axisLabelPosition = a3;
}

- (BOOL)showGridLines
{
  return self->_showGridLines;
}

- (HKFillStyle)fillStyle
{
  return self->_fillStyle;
}

- (double)fillInnerPadding
{
  return self->_fillInnerPadding;
}

- (double)fillOuterPadding
{
  return self->_fillOuterPadding;
}

- (HKStrokeStyle)borderStyleForFill
{
  return self->_borderStyleForFill;
}

- (int64_t)location
{
  return self->_location;
}

@end