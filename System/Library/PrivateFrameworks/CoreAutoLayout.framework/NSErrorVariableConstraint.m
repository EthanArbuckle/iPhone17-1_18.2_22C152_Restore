@interface NSErrorVariableConstraint
- (BOOL)_lowerIntoExpression:(id)a3 reportingConstantIsRounded:(BOOL *)a4;
- (NSErrorVariableConstraint)initWithVariable:(id)a3 value:(double)a4;
- (id)constrainedConstraint;
- (int)nsis_orientationHintForVariable:(id)a3;
- (void)dealloc;
@end

@implementation NSErrorVariableConstraint

- (NSErrorVariableConstraint)initWithVariable:(id)a3 value:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)NSErrorVariableConstraint;
  v7 = [(NSLayoutConstraint *)&v9 init];
  if (v7)
  {
    *((void *)v7 + 10) = a3;
    *((double *)v7 + 11) = a4;
    *(_DWORD *)(v7 + 66) |= 0x40u;
    [v7 _setRelation:0];
    [v7 setSymbolicConstant:0];
    -[NSLayoutConstraint _makeExtraVars]((NSISVariable *)v7);
    if (objc_msgSend((id)objc_msgSend(v7, "_markerAndPositiveExtraVar"), "valueRestriction") != 2) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, @"NSLayoutConstraint.m", 2840, @"Expected marker restricted to 0.");
    }
    ConstraintDidPerformInitialSetup((uint64_t)v7);
  }
  return (NSErrorVariableConstraint *)v7;
}

- (void)dealloc
{
  self->_errorVariable = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSErrorVariableConstraint;
  [(NSLayoutConstraint *)&v3 dealloc];
}

- (BOOL)_lowerIntoExpression:(id)a3 reportingConstantIsRounded:(BOOL *)a4
{
  if (![(NSLayoutConstraint *)self _markerAndPositiveExtraVar]) {
    -[NSLayoutConstraint _makeExtraVars]((NSISVariable *)self);
  }
  [a3 setCoefficient:self->_errorVariable forVariable:1.0];
  [a3 incrementConstant:-self->_errorValue];
  objc_msgSend(a3, "setCoefficient:forVariable:", -[NSLayoutConstraint _markerAndPositiveExtraVar](self, "_markerAndPositiveExtraVar"), -1.0);
  *(_DWORD *)((char *)&self->super._layoutConstraintFlags + 2) |= 0x10u;
  if (a4) {
    *a4 = 0;
  }
  return 1;
}

- (id)constrainedConstraint
{
  v4 = [(NSISVariable *)self->_errorVariable delegate];
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSLayoutConstraint.m", 2880, @"This should be a constraint if we're constraining an error variable.");
  }
  return v4;
}

- (int)nsis_orientationHintForVariable:(id)a3
{
  return 0;
}

@end