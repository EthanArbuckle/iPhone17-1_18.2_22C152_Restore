@interface CHClassifiableDrawing
- (BOOL)expandCodePoints;
- (CGRect)normalizationContext;
- (CHClassifiableDrawing)initWithDrawing:(id)a3 characterSet:(id)a4 expandCodePoints:(BOOL)a5 normalizationContext:(CGRect)a6 maxCandidateCount:(unint64_t)a7;
- (CHDrawing)drawing;
- (NSCharacterSet)characterSet;
- (unint64_t)maxCandidateCount;
@end

@implementation CHClassifiableDrawing

- (CHClassifiableDrawing)initWithDrawing:(id)a3 characterSet:(id)a4 expandCodePoints:(BOOL)a5 normalizationContext:(CGRect)a6 maxCandidateCount:(unint64_t)a7
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v16 = a3;
  id v17 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CHClassifiableDrawing;
  v18 = [(CHClassifiableDrawing *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_drawing, a3);
    objc_storeStrong((id *)&v19->_characterSet, a4);
    v19->_expandCodePoints = a5;
    v19->_normalizationContext.origin.CGFloat x = x;
    v19->_normalizationContext.origin.CGFloat y = y;
    v19->_normalizationContext.size.CGFloat width = width;
    v19->_normalizationContext.size.CGFloat height = height;
    v19->_maxCandidateCount = a7;
  }

  return v19;
}

- (CHDrawing)drawing
{
  return self->_drawing;
}

- (NSCharacterSet)characterSet
{
  return self->_characterSet;
}

- (BOOL)expandCodePoints
{
  return self->_expandCodePoints;
}

- (CGRect)normalizationContext
{
  double x = self->_normalizationContext.origin.x;
  double y = self->_normalizationContext.origin.y;
  double width = self->_normalizationContext.size.width;
  double height = self->_normalizationContext.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)maxCandidateCount
{
  return self->_maxCandidateCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characterSet, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
}

@end