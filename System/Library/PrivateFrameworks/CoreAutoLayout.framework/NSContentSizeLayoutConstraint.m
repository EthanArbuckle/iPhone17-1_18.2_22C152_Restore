@interface NSContentSizeLayoutConstraint
- (NSContentSizeLayoutConstraint)initWithLayoutItem:(id)a3 value:(double)a4 huggingPriority:(double)a5 compressionResistancePriority:(double)a6 orientation:(int64_t)a7;
- (double)compressionResistancePriority;
- (double)huggingPriority;
- (double)priorityForVariable:(id)a3;
- (id)_priorityDescription;
@end

@implementation NSContentSizeLayoutConstraint

- (double)priorityForVariable:(id)a3
{
  id v5 = [(NSLayoutConstraint *)self _markerAndPositiveExtraVar];
  v6 = &OBJC_IVAR___NSContentSizeLayoutConstraint__compressionResistancePriority;
  if (v5 == a3) {
    v6 = &OBJC_IVAR___NSContentSizeLayoutConstraint__huggingPriority;
  }
  return *(double *)((char *)&self->super.super.isa + *v6);
}

- (double)huggingPriority
{
  return self->_huggingPriority;
}

- (double)compressionResistancePriority
{
  return self->_compressionResistancePriority;
}

- (NSContentSizeLayoutConstraint)initWithLayoutItem:(id)a3 value:(double)a4 huggingPriority:(double)a5 compressionResistancePriority:(double)a6 orientation:(int64_t)a7
{
  v16.receiver = self;
  v16.super_class = (Class)NSContentSizeLayoutConstraint;
  v12 = [(NSLayoutConstraint *)&v16 init];
  v13 = (NSContentSizeLayoutConstraint *)v12;
  if (v12)
  {
    *(_DWORD *)(v12 + 66) |= 0x40u;
    *((double *)v12 + 10) = a5;
    *((double *)v12 + 11) = a6;
    [v12 setConstant:a4];
    if (a7) {
      uint64_t v14 = 8;
    }
    else {
      uint64_t v14 = 7;
    }
    [(NSLayoutConstraint *)v13 _setFirstItem:a3 attribute:v14];
    -[NSLayoutConstraint _setMarkerAndPositiveErrorVar:](v13, +[NSISVariable variableMarkingConstraint:valueRestriction:shouldBeMinimized:](NSISVariable, "variableMarkingConstraint:valueRestriction:shouldBeMinimized:", v13, 1, 1));
    -[NSLayoutConstraint _setNegativeExtraVar:](v13, +[NSISVariable variableWithDelegate:valueRestriction:shouldBeMinimized:](NSISVariable, "variableWithDelegate:valueRestriction:shouldBeMinimized:", v13, 1, 1));
    ConstraintDidPerformInitialSetup((uint64_t)v13);
  }
  return v13;
}

- (id)_priorityDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Hug:%g CompressionResistance:%g", *(void *)&self->_huggingPriority, *(void *)&self->_compressionResistancePriority);
}

@end