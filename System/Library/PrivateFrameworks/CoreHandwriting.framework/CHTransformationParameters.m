@interface CHTransformationParameters
- (BOOL)mergeLines;
- (BOOL)wrapLines;
- (CGPoint)insertionPoint;
- (CHTransformationParameters)init;
- (CHTransformationParameters)initWithOrientationBehavior:(unint64_t)a3 orientationTarget:(double)a4 italicsModifier:(double)a5 boldModifier:(double)a6 resizeBehavior:(unint64_t)a7 textSizeTarget:(unint64_t)a8 textSizeModifier:(double)a9 alignmentBehavior:(unint64_t)a10 leftMargin:(unint64_t)a11 rightMargin:(unint64_t)a12 insertionPoint:(CGPoint)a13 lineSpaceBehavior:(unint64_t)a14 lineSpaceTarget:(unint64_t)a15 mergeLines:(BOOL)a16 wrapLines:(BOOL)a17;
- (double)boldModifier;
- (double)italicsModifier;
- (double)orientationTarget;
- (double)textSizeModifier;
- (unint64_t)alignmentBehavior;
- (unint64_t)leftMargin;
- (unint64_t)lineSpaceBehavior;
- (unint64_t)lineSpaceTarget;
- (unint64_t)orientationBehavior;
- (unint64_t)resizeBehavior;
- (unint64_t)rightMargin;
- (unint64_t)textSizeTarget;
- (void)setAlignmentBehavior:(unint64_t)a3;
- (void)setBoldModifier:(double)a3;
- (void)setInsertionPoint:(CGPoint)a3;
- (void)setItalicsModifier:(double)a3;
- (void)setLeftMargin:(unint64_t)a3;
- (void)setLineSpaceBehavior:(unint64_t)a3;
- (void)setLineSpaceTarget:(unint64_t)a3;
- (void)setMergeLines:(BOOL)a3;
- (void)setOrientationBehavior:(unint64_t)a3;
- (void)setOrientationTarget:(double)a3;
- (void)setResizeBehavior:(unint64_t)a3;
- (void)setRightMargin:(unint64_t)a3;
- (void)setTextSizeModifier:(double)a3;
- (void)setTextSizeTarget:(unint64_t)a3;
- (void)setWrapLines:(BOOL)a3;
@end

@implementation CHTransformationParameters

- (CHTransformationParameters)init
{
  v8.receiver = self;
  v8.super_class = (Class)CHTransformationParameters;
  result = [(CHTransformationParameters *)&v8 init];
  if (result)
  {
    *(_OWORD *)&result->_orientationBehavior = 0u;
    *(_OWORD *)&result->_italicsModifier = 0u;
    result->_resizeBehavior = 0;
    result->_textSizeTarget = 16;
    result->_textSizeModifier = 1.0;
    result->_alignmentBehavior = 0;
    result->_leftMargin = 0;
    result->_rightMargin = 760;
    __asm { FMOV            V0.2D, #-1.0 }
    result->_insertionPoint = _Q0;
    *(_WORD *)&result->_mergeLines = 0;
    result->_lineSpaceBehavior = 0;
    result->_lineSpaceTarget = 0;
  }
  return result;
}

- (CHTransformationParameters)initWithOrientationBehavior:(unint64_t)a3 orientationTarget:(double)a4 italicsModifier:(double)a5 boldModifier:(double)a6 resizeBehavior:(unint64_t)a7 textSizeTarget:(unint64_t)a8 textSizeModifier:(double)a9 alignmentBehavior:(unint64_t)a10 leftMargin:(unint64_t)a11 rightMargin:(unint64_t)a12 insertionPoint:(CGPoint)a13 lineSpaceBehavior:(unint64_t)a14 lineSpaceTarget:(unint64_t)a15 mergeLines:(BOOL)a16 wrapLines:(BOOL)a17
{
  CGFloat y = a13.y;
  CGFloat x = a13.x;
  v30.receiver = self;
  v30.super_class = (Class)CHTransformationParameters;
  result = [(CHTransformationParameters *)&v30 init];
  if (result)
  {
    result->_orientationBehavior = a3;
    result->_orientationTarget = a4;
    result->_italicsModifier = a5;
    result->_boldModifier = a6;
    result->_resizeBehavior = a7;
    result->_textSizeTarget = a8;
    result->_textSizeModifier = a9;
    result->_alignmentBehavior = a10;
    result->_leftMargin = a11;
    result->_insertionPoint.CGFloat x = x;
    result->_insertionPoint.CGFloat y = y;
    result->_rightMargin = a12;
    result->_lineSpaceBehavior = a14;
    result->_lineSpaceTarget = a15;
    result->_mergeLines = a16;
    result->_wrapLines = a17;
  }
  return result;
}

- (unint64_t)orientationBehavior
{
  return self->_orientationBehavior;
}

- (void)setOrientationBehavior:(unint64_t)a3
{
  self->_orientationBehavior = a3;
}

- (double)orientationTarget
{
  return self->_orientationTarget;
}

- (void)setOrientationTarget:(double)a3
{
  self->_orientationTarget = a3;
}

- (double)italicsModifier
{
  return self->_italicsModifier;
}

- (void)setItalicsModifier:(double)a3
{
  self->_italicsModifier = a3;
}

- (double)boldModifier
{
  return self->_boldModifier;
}

- (void)setBoldModifier:(double)a3
{
  self->_boldModifier = a3;
}

- (unint64_t)resizeBehavior
{
  return self->_resizeBehavior;
}

- (void)setResizeBehavior:(unint64_t)a3
{
  self->_resizeBehavior = a3;
}

- (unint64_t)textSizeTarget
{
  return self->_textSizeTarget;
}

- (void)setTextSizeTarget:(unint64_t)a3
{
  self->_textSizeTarget = a3;
}

- (double)textSizeModifier
{
  return self->_textSizeModifier;
}

- (void)setTextSizeModifier:(double)a3
{
  self->_textSizeModifier = a3;
}

- (unint64_t)alignmentBehavior
{
  return self->_alignmentBehavior;
}

- (void)setAlignmentBehavior:(unint64_t)a3
{
  self->_alignmentBehavior = a3;
}

- (unint64_t)leftMargin
{
  return self->_leftMargin;
}

- (void)setLeftMargin:(unint64_t)a3
{
  self->_leftMargin = a3;
}

- (unint64_t)rightMargin
{
  return self->_rightMargin;
}

- (void)setRightMargin:(unint64_t)a3
{
  self->_rightMargin = a3;
}

- (CGPoint)insertionPoint
{
  double x = self->_insertionPoint.x;
  double y = self->_insertionPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInsertionPoint:(CGPoint)a3
{
  self->_insertionPoint = a3;
}

- (unint64_t)lineSpaceBehavior
{
  return self->_lineSpaceBehavior;
}

- (void)setLineSpaceBehavior:(unint64_t)a3
{
  self->_lineSpaceBehavior = a3;
}

- (unint64_t)lineSpaceTarget
{
  return self->_lineSpaceTarget;
}

- (void)setLineSpaceTarget:(unint64_t)a3
{
  self->_lineSpaceTarget = a3;
}

- (BOOL)mergeLines
{
  return self->_mergeLines;
}

- (void)setMergeLines:(BOOL)a3
{
  self->_mergeLines = a3;
}

- (BOOL)wrapLines
{
  return self->_wrapLines;
}

- (void)setWrapLines:(BOOL)a3
{
  self->_wrapLines = a3;
}

@end