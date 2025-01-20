@interface NSLayoutConstraint
+ (NSArray)constraintsWithVisualFormat:(NSString *)format options:(NSLayoutFormatOptions)opts metrics:(NSDictionary *)metrics views:(NSDictionary *)views;
+ (NSLayoutConstraint)constraintWithAnchor:(id)a3 relatedBy:(int64_t)a4 constant:(double)a5;
+ (NSLayoutConstraint)constraintWithAnchor:(id)a3 relatedBy:(int64_t)a4 toAnchor:(id)a5 multiplier:(double)a6 constant:(double)a7;
+ (NSLayoutConstraint)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 constant:(double)a6;
+ (NSLayoutConstraint)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7;
+ (NSLayoutConstraint)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 constant:(double)a8;
+ (NSLayoutConstraint)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 multiplier:(double)a8;
+ (NSLayoutConstraint)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 multiplier:(double)a8 symbolicConstant:(id)a9;
+ (NSLayoutConstraint)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 multiplier:(double)a8 symbolicConstant:(id)a9 symbolicConstantMultiplier:(double)a10;
+ (NSLayoutConstraint)constraintWithItem:(id)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(id)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c;
+ (double)_constraintConstantLimit;
+ (id)_findCommonAncestorOfItem:(id)a3 andItem:(id)a4;
+ (uint64_t)_constraintWithAnchor:(void *)a3 relatedBy:(uint64_t)a4 toAnchor:(void *)a5 withSystemSpacingMultipliedBy:;
+ (void)_addOrRemoveConstraints:(uint64_t)a3 activate:;
+ (void)_setLegacyDecodingOnly:(BOOL)a3;
+ (void)activateConstraints:(NSArray *)constraints;
+ (void)deactivateConstraints:(NSArray *)constraints;
- (BOOL)_addToEngine:(id)a3 mutuallyExclusiveConstraints:(id *)a4;
- (BOOL)_containerDeclaredConstraint;
- (BOOL)_describesSameRestrictionAsConstraint:(id)a3;
- (BOOL)_effectiveConstant:(double *)a3 error:(id *)a4;
- (BOOL)_existsInEngine:(id)a3;
- (BOOL)_isEqualToConstraintValue:(id)a3 includingConstant:(BOOL)a4 includeOtherMutableProperties:(BOOL)a5;
- (BOOL)_isFudgeable;
- (BOOL)_isIBPrototypingLayoutConstraint;
- (BOOL)_lowerIntoExpression:(id)a3 reportingConstantIsRounded:(BOOL *)a4;
- (BOOL)_loweredConstantIsRounded;
- (BOOL)_loweredConstantNeedsUpdate;
- (BOOL)_nsib_isRedundant;
- (BOOL)_nsib_isRedundantInEngine:(id)a3;
- (BOOL)_referencesLayoutItem:(id)a3;
- (BOOL)hasBeenLowered;
- (BOOL)isActive;
- (BOOL)nsis_valueOfVariableIsUserObservable:(id)a3;
- (BOOL)shouldBeArchived;
- (CGFloat)constant;
- (CGFloat)multiplier;
- (CGSize)_engineToContainerScalingCoefficients;
- (NSISVariable)_makeExtraVars;
- (NSISVariable)_rebuildExtraVars;
- (NSLayoutAnchor)firstAnchor;
- (NSLayoutAnchor)secondAnchor;
- (NSLayoutAttribute)firstAttribute;
- (NSLayoutAttribute)secondAttribute;
- (NSLayoutConstraint)init;
- (NSLayoutConstraint)initWithCoder:(id)a3;
- (NSLayoutRelation)relation;
- (NSSet)_referencedLayoutItems;
- (NSString)description;
- (UILayoutPriority)priority;
- (_NSConstraintDescriptionLayoutRuleNode)_associatedRuleNode;
- (__CFString)_allocationDescription;
- (double)_allowedMagnitudeForIntegralizationAdjustment;
- (double)_fudgeIncrement;
- (double)_unsatisfaction:(id *)a1;
- (double)dissatisfaction;
- (double)priorityForVariable:(id)a3;
- (double)symbolicConstantMultiplier;
- (double)unsatisfaction;
- (id)_constantDescriptionForDTrace;
- (id)_constraintByReplacingItem:(id)a3 withItem:(id)a4;
- (id)_constraintValueCopy;
- (id)_descriptionforSymbolicConstant;
- (id)_explainUnsatisfaction;
- (id)_identifier;
- (id)_loweredExpression;
- (id)_markerAndPositiveExtraVar;
- (id)_priorityDescription;
- (id)_symbolicConstant;
- (id)animations;
- (id)container;
- (id)descriptionAccessory;
- (id)firstItem;
- (id)nsis_descriptionOfVariable:(id)a3;
- (id)secondItem;
- (int)_constraintType;
- (int)nsis_orientationHintForVariable:(id)a3;
- (uint64_t)_addLoweredExpression:(void *)a3 toEngine:(int)a4 lastLoweredConstantWasRounded:(uint64_t)a5 mutuallyExclusiveConstraints:;
- (uint64_t)_deallocSafeDescription;
- (uint64_t)_layoutEngine;
- (uint64_t)_negativeExtraVar;
- (uint64_t)_primitiveConstraintType;
- (uint64_t)_setDeferDTraceLogging:(uint64_t)result;
- (uint64_t)_setPrimitiveConstraintType:(uint64_t)result;
- (uint64_t)_setPriority:(float)a3 mutuallyExclusiveConstraints:;
- (uint64_t)_tryToChangeContainerGeometryWithUndoHandler:(uint64_t)result;
- (uint64_t)equationDescription;
- (uint64_t)setHasBeenLowered:(uint64_t)result;
- (unint64_t)_constraintValueHashIncludingConstant:(BOOL)a3 includeOtherMutableProperties:(BOOL)a4;
- (unint64_t)_deferDTraceLogging;
- (void)_addToEngine:(id)a3;
- (void)_ancestorRuleNodes;
- (void)_clearWeakContainerReference;
- (void)_containerGeometryDidChange;
- (void)_forceSatisfactionMeasuringUnsatisfactionChanges:(id *)a3 andMutuallyExclusiveConstraints:(id *)a4;
- (void)_removeFromEngine:(id)a3;
- (void)_setActive:(BOOL)a3 mutuallyExclusiveConstraints:(id *)a4;
- (void)_setAssociatedRuleNode:(id)a3;
- (void)_setContainerDeclaredConstraint:(BOOL)a3;
- (void)_setFirstAnchor:(id)a3;
- (void)_setFirstItem:(id)a3 attribute:(int64_t)a4;
- (void)_setIdentifier:(uint64_t)a1;
- (void)_setLoweredConstantNeedsUpdate:(BOOL)a3;
- (void)_setMarkerAndPositiveErrorVar:(void *)result;
- (void)_setMultiplier:(double)a3;
- (void)_setMutablePropertiesFromConstraint:(id)a3;
- (void)_setNegativeExtraVar:(void *)result;
- (void)_setRelation:(int64_t)a3;
- (void)_setSecondAnchor:(id)a3;
- (void)_setSecondItem:(id)a3 attribute:(int64_t)a4;
- (void)_setSymbolicConstant:(double)a3 constant:(double)a4 symbolicConstantMultiplier:;
- (void)_setSymbolicConstant:(id)a3;
- (void)_setSymbolicConstantMultiplier:(id)object;
- (void)_tryToActivateMeasuringUnsatisfactionChanges:(id *)a3 andMutuallyExclusiveConstraints:(id *)a4;
- (void)asciiArtDescription;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setActive:(BOOL)active;
- (void)setAnimations:(id)a3;
- (void)setConstant:(CGFloat)constant;
- (void)setContainer:(id)a3;
- (void)setIdentifier:(NSString *)identifier;
- (void)setPriority:(UILayoutPriority)priority;
- (void)setShouldBeArchived:(BOOL)shouldBeArchived;
- (void)setSymbolicConstant:(id)a3;
- (void)setSymbolicConstantMultiplier:(double)a3;
- (void)sourceRuleHierarchy;
@end

@implementation NSLayoutConstraint

- (void)_addToEngine:(id)a3
{
}

- (void)setIdentifier:(NSString *)identifier
{
}

- (BOOL)_addToEngine:(id)a3 mutuallyExclusiveConstraints:(id *)a4
{
  if (!a3) {
    return 1;
  }
  kdebug_trace();
  unsigned __int8 v11 = 0;
  id v7 = +[NSISLinearExpression acquireFromPoolForUseCase:0 engine:a3];
  if (![(NSLayoutConstraint *)self _lowerIntoExpression:v7 reportingConstantIsRounded:&v11])
  {
    [v7 returnToPool];
    uint64_t v10 = [NSString stringWithFormat:@"Unable to install constraint on view.  Does the constraint reference something from outside the subtree of the view?  That's illegal. constraint:%@ view:%@", self, -[NSLayoutConstraint container](self, "container")];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v10 userInfo:0]);
  }
  char v8 = -[NSLayoutConstraint _addLoweredExpression:toEngine:lastLoweredConstantWasRounded:mutuallyExclusiveConstraints:]((uint64_t)self, v7, a3, v11, (uint64_t)a4);
  [v7 returnToPool];
  kdebug_trace();
  return v8;
}

- (BOOL)_lowerIntoExpression:(id)a3 reportingConstantIsRounded:(BOOL *)a4
{
  if (!self->_markerAndPositiveExtraVar) {
    -[NSLayoutConstraint _makeExtraVars]((NSISVariable *)self);
  }
  id firstAnchor = self->_firstAnchor;
  if (!firstAnchor
    || (int v8 = objc_msgSend(firstAnchor, "nsli_lowerIntoExpression:withCoefficient:forConstraint:", a3, self, 1.0)) != 0)
  {
    id secondAnchor = self->_secondAnchor;
    if (!secondAnchor
      || (int v8 = objc_msgSend(secondAnchor, "nsli_lowerIntoExpression:withCoefficient:forConstraint:", a3, self, -self->_coefficient)) != 0)
    {
      [(NSLayoutConstraint *)self constant];
      [a3 incrementConstant:-v10];
      [a3 setCoefficient:self->_markerAndPositiveExtraVar forVariable:-1.0];
      if (self->_negativeExtraVar) {
        objc_msgSend(a3, "setCoefficient:forVariable:", 1.0);
      }
      *(_DWORD *)((char *)&self->_layoutConstraintFlags + 2) |= 0x10u;
      if (a4) {
        *a4 = 0;
      }
      LOBYTE(v8) = 1;
    }
  }
  return v8;
}

- (CGFloat)constant
{
  id v6 = 0;
  double v7 = 0.0;
  if (![(NSLayoutConstraint *)self _effectiveConstant:&v7 error:&v6])
  {
    v5 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"NSLayoutConstraint.m", 741, @"%@", objc_msgSend(v6, "localizedDescription") object file lineNumber description];
  }
  return v7;
}

- (BOOL)_effectiveConstant:(double *)a3 error:(id *)a4
{
  if ((*(_DWORD *)((unsigned char *)&self->_layoutConstraintFlags + 2) & 0x300) == 0)
  {
    p_constant = &self->_constant;
    goto LABEL_7;
  }
  uint64_t v9 = 0;
  id container = self->_container;
  if (!container)
  {
    p_constant = (double *)&v9;
    int v7 = objc_msgSend((id)objc_msgSend(-[NSLayoutAnchor _referencedLayoutItems](-[NSLayoutConstraint firstAnchor](self, "firstAnchor"), "_referencedLayoutItems"), "anyObject"), "nsli_defaultResolvedValue:forSymbolicConstant:inConstraint:error:", &v9, -[NSLayoutConstraint _symbolicConstant](self, "_symbolicConstant"), self, a4);
    if (!v7) {
      return v7;
    }
LABEL_7:
    *a3 = *p_constant;
    LOBYTE(v7) = 1;
    return v7;
  }
  p_constant = (double *)&v9;
  if (objc_msgSend(container, "nsli_resolvedValue:forSymbolicConstant:inConstraint:error:", &v9, -[NSLayoutConstraint _symbolicConstant](self, "_symbolicConstant"), self, a4))goto LABEL_7; {
  LOBYTE(v7) = 0;
  }
  return v7;
}

- (uint64_t)_addLoweredExpression:(void *)a3 toEngine:(int)a4 lastLoweredConstantWasRounded:(uint64_t)a5 mutuallyExclusiveConstraints:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!a3) {
    return 1;
  }
  uint64_t v10 = 0;
  long long v28 = *(_OWORD *)(a1 + 48);
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  char v11 = 1;
  do
  {
    char v12 = v11;
    v13 = (void *)*((void *)&v28 + v10);
    if (objc_msgSend(v13, "shouldBeMinimized", v26, v27, v28))
    {
      [(id)a1 priorityForVariable:v13];
      *(&v26 + v10) = v14;
    }
    char v11 = 0;
    uint64_t v10 = 1;
  }
  while ((v12 & 1) != 0);
  uint64_t v15 = 0;
  char v16 = 1;
  do
  {
    char v17 = v16;
    if (*((double *)&v26 + v15) != 0.0) {
      objc_msgSend(a3, "addVariableToBeOptimized:priority:", *((void *)&v28 + v15));
    }
    char v16 = 0;
    uint64_t v15 = 1;
  }
  while ((v17 & 1) != 0);
  uint64_t v18 = [a3 tryToAddConstraintWithMarker:*(void *)(a1 + 48) expression:a2 mutuallyExclusiveConstraints:a5];
  if (v18)
  {
    [a2 constant];
    int v19 = *(_DWORD *)(a1 + 66);
    *(void *)(a1 + 40) = v20;
    int v21 = 32;
    if (!a4) {
      int v21 = 0;
    }
    *(_DWORD *)(a1 + 66) = v19 & 0xFFFFFBDF | v21;
  }
  else
  {
    uint64_t v22 = 0;
    char v23 = 1;
    do
    {
      char v24 = v23;
      if (*((double *)&v26 + v22) != 0.0) {
        objc_msgSend(a3, "removeVariableToBeOptimized:priority:", *((void *)&v28 + v22));
      }
      char v23 = 0;
      uint64_t v22 = 1;
    }
    while ((v24 & 1) != 0);
  }
  return v18;
}

- (int)nsis_orientationHintForVariable:(id)a3
{
  unsigned int v4 = [(NSLayoutConstraint *)self firstAttribute];
  int result = 0;
  if (v4 <= 0x25 && ((1 << v4) & 0x2A00119D19) != 0)
  {
    unsigned int v6 = [(NSLayoutConstraint *)self secondAttribute];
    return v6 <= 0x25 && ((1 << v6) & 0x2A00119D19) != 0;
  }
  return result;
}

- (NSLayoutAttribute)firstAttribute
{
  return [self->_firstAnchor _constraintAttribute];
}

- (NSLayoutAttribute)secondAttribute
{
  return [self->_secondAnchor _constraintAttribute];
}

- (void)setConstant:(CGFloat)constant
{
  if (_NSConstraintBasedLayoutAriadneTracepoints()) {
    kdebug_trace();
  }
  -[NSLayoutConstraint _setSymbolicConstant:constant:symbolicConstantMultiplier:](self, 0, constant, NAN);
  if (_NSConstraintBasedLayoutAriadneTracepoints())
  {
    kdebug_trace();
  }
}

- (void)_setSymbolicConstant:(double)a3 constant:(double)a4 symbolicConstantMultiplier:
{
  if (result)
  {
    double v5 = a3;
    uint64_t v7 = (uint64_t)result;
    double v8 = fabs(a3);
    if (v8 >= INFINITY && v8 <= INFINITY) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__setSymbolicConstant_constant_symbolicConstantMultiplier_, result, @"NSLayoutConstraint.m", 669, @"%@ constant is not finite!  That's illegal.  constant:%g firstAnchor:%@ secondAnchor:%@", objc_opt_class(), *(void *)&v5, objc_msgSend(result, "firstAnchor"), objc_msgSend(result, "secondAnchor"));
    }
    +[NSLayoutConstraint _constraintConstantLimit];
    double v10 = v9;
    if (v9 < v5 || (double v10 = -v9, -v9 > v5))
    {
      _NSLayoutConstraintNumberExceedsLimit();
      double v5 = v10;
    }
    id v11 = (id)[(id)v7 _symbolicConstant];
    double v12 = *(double *)(v7 + 32);
    [(id)v7 symbolicConstantMultiplier];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __79__NSLayoutConstraint__setSymbolicConstant_constant_symbolicConstantMultiplier___block_invoke;
    v19[3] = &unk_1E5C573F0;
    v19[4] = v7;
    v19[5] = v11;
    *(double *)&v19[6] = v13;
    *(double *)&v19[7] = v12;
    if (a2)
    {
      if (v11 == a2 && v13 == a4) {
        goto LABEL_20;
      }
      *(void *)(v7 + 32) = 0;
      [(id)v7 _setSymbolicConstant:a2];
      -[NSLayoutConstraint _setSymbolicConstantMultiplier:]((id)v7, a4);
    }
    else
    {
      if (v5 == v12 && !v11) {
        goto LABEL_20;
      }
      *(double *)(v7 + 32) = v5;
      [(id)v7 _setSymbolicConstant:0];
      __asm { FCMP            H0, #0 }
      if (_ZF) {
        objc_setAssociatedObject((id)v7, &SymbolicConstantMultiplierKey, 0, (void *)0x303);
      }
      *(_WORD *)(v7 + 64) = COERCE_UNSIGNED_INT(1.0);
    }
    -[NSLayoutConstraint _tryToChangeContainerGeometryWithUndoHandler:](v7, (uint64_t)v19);
LABEL_20:

    return 0;
  }
  return result;
}

- (id)_symbolicConstant
{
  unsigned int v3 = *(_DWORD *)((char *)&self->_layoutConstraintFlags + 2);
  id result = 0;
  switch((v3 >> 8) & 3)
  {
    case 1u:
      id result = @"NSSpace";
      break;
    case 2u:
      id result = @"NSLayoutAnchorConstraintSpace";
      break;
    case 3u:
      os_unfair_lock_lock((os_unfair_lock_t)&symbolicConstantTableLock);
      id v5 = (id)[(id)_NSFaultInObject() objectForKey:self];
      os_unfair_lock_unlock((os_unfair_lock_t)&symbolicConstantTableLock);
      id result = v5;
      break;
    default:
      return result;
  }
  return result;
}

- (double)symbolicConstantMultiplier
{
  __asm { FCMP            H0, #0 }
  if (_ZF)
  {
    id AssociatedObject = objc_getAssociatedObject(self, &SymbolicConstantMultiplierKey);
    [AssociatedObject doubleValue];
  }
  else
  {
    __asm { FCVT            D0, H0 }
  }
  return result;
}

- (void)_setSymbolicConstant:(id)a3
{
  if (!a3)
  {
    int v5 = 0;
    goto LABEL_7;
  }
  if ([a3 isEqualToString:@"NSSpace"])
  {
    int v5 = 256;
LABEL_7:
    uint64_t v6 = *(unsigned int *)((char *)&self->_layoutConstraintFlags + 2);
    if ((~(_WORD)v6 & 0x300) != 0)
    {
      unint64_t v7 = v6 | ((unint64_t)HIWORD(self->_layoutConstraintFlags) << 32);
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)&symbolicConstantTableLock);
      [(id)_NSFaultInObject() removeObjectForKey:self];
      os_unfair_lock_unlock((os_unfair_lock_t)&symbolicConstantTableLock);
      unint64_t v7 = *(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) | ((unint64_t)HIWORD(self->_layoutConstraintFlags) << 32);
    }
    unint64_t v8 = v7 & 0xFFFFFFFFFFFFFCFFLL;
    HIWORD(self->_layoutConstraintFlags) = WORD2(v8);
    *(_DWORD *)((char *)&self->_layoutConstraintFlags + 2) = v8 | v5;
    return;
  }
  if ([a3 isEqualToString:@"NSLayoutAnchorConstraintSpace"])
  {
    int v5 = 512;
    goto LABEL_7;
  }
  id v9 = (id)[a3 copy];
  os_unfair_lock_lock((os_unfair_lock_t)&symbolicConstantTableLock);
  [(id)_NSFaultInObject() setObject:v9 forKey:self];
  *(_DWORD *)((char *)&self->_layoutConstraintFlags + 2) |= 0x300u;
  os_unfair_lock_unlock((os_unfair_lock_t)&symbolicConstantTableLock);
}

- (NSISVariable)_makeExtraVars
{
  if (!result) {
    return result;
  }
  v1 = result;
  unint64_t v2 = ((unint64_t)*(unsigned int *)((char *)&result[1].super.isa + 2) << 46) & 0xC00000000000;
  if (v2)
  {
    if (v2 == 0xC00000000000)
    {
      [(NSISVariable *)result priority];
      if (v8 == 1000.0)
      {
        uint64_t v9 = 2;
        uint64_t v10 = 0;
      }
      else
      {
        uint64_t v9 = 1;
        uint64_t v10 = 1;
      }
      id v5 = +[NSISVariable variableMarkingConstraint:v1 valueRestriction:v9 shouldBeMinimized:v10];
      id v11 = v1;
      uint64_t v12 = 0;
      goto LABEL_16;
    }
    if (v2 != 0x400000000000)
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown constraint relation: %d", (uint64_t)((unint64_t)*(unsigned int *)((char *)&result[1].super.isa + 2) << 62) >> 62);
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0]);
    }
    [(NSISVariable *)result priority];
    float v4 = v3;
    id v5 = +[NSISVariable variableMarkingConstraint:v1 valueRestriction:1 shouldBeMinimized:0];
    if (v4 != 1000.0)
    {
LABEL_13:
      id v11 = v1;
      uint64_t v12 = 1;
LABEL_16:
      unint64_t v7 = +[NSISVariable variableWithDelegate:v11 valueRestriction:1 shouldBeMinimized:v12];
      goto LABEL_17;
    }
  }
  else
  {
    [(NSISVariable *)result priority];
    if (v6 != 1000.0)
    {
      id v5 = +[NSISVariable variableMarkingConstraint:v1 valueRestriction:1 shouldBeMinimized:1];
      goto LABEL_13;
    }
    id v5 = +[NSISVariable variableMarkingConstraint:v1 valueRestriction:2 shouldBeMinimized:0];
  }
  unint64_t v7 = 0;
LABEL_17:
  if (*(void *)&v1->_engineVarIndexes[0].value) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__makeExtraVars, v1, @"NSLayoutConstraint.m", 1754, @"We are leaking a layout variable");
  }
  *(void *)&v1->_engineVarIndexes[0].value = v5;
  if (*(void *)&v1->_engineVarIndexes[2].value) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__makeExtraVars, v1, @"NSLayoutConstraint.m", 1757, @"We are leaking a layout variable");
  }
  double result = v7;
  *(void *)&v1->_engineVarIndexes[2].value = result;
  return result;
}

- (UILayoutPriority)priority
{
  return self->_priority;
}

- (uint64_t)_tryToChangeContainerGeometryWithUndoHandler:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    float v4 = objc_msgSend(*(id *)(result + 8), "nsli_layoutEngine");
    int v5 = [(id)v3 hasBeenLowered];
    double result = 1;
    if (v5)
    {
      if (v4)
      {
        unsigned __int8 v19 = 0;
        id v6 = +[NSISLinearExpression acquireFromPoolForUseCase:0 engine:v4];
        char v7 = [(id)v3 _lowerIntoExpression:v6 reportingConstantIsRounded:&v19];
        double v8 = *(double *)(v3 + 40);
        [v6 constant];
        double v10 = v9;
        [v6 returnToPool];
        if ((v7 & 1) == 0)
        {
          (*(void (**)(uint64_t))(a2 + 16))(a2);
          return 0;
        }
        double v11 = v10 - v8;
        if (v10 - v8 != 0.0)
        {
          double v12 = -v11;
          if (v10 == 0.0 || COERCE_UNSIGNED_INT64(-v11) >> 63 != *(void *)&v8 >> 63) {
            goto LABEL_10;
          }
          if (vabdd_f64(v12, v8) <= *(double *)&NSISEpsilon) {
            goto LABEL_20;
          }
          uint64_t v16 = COERCE__INT64(-v11) - *(void *)&v8;
          if (v16 < 0) {
            uint64_t v16 = *(void *)&v8 - COERCE__INT64(-v11);
          }
          if (v16 <= NSISMaxUlps)
          {
LABEL_20:
            [(id)v3 _removeFromEngine:v4];
            id v17 = +[NSISLinearExpression acquireFromPoolForUseCase:0 engine:v4];
            if (([(id)v3 _lowerIntoExpression:v17 reportingConstantIsRounded:&v19] & 1) == 0)
            {
              [v17 returnToPool];
LABEL_24:
              (*(void (**)(uint64_t))(a2 + 16))(a2);
              [(id)v3 _addToEngine:v4];
              return 0;
            }
            char v18 = -[NSLayoutConstraint _addLoweredExpression:toEngine:lastLoweredConstantWasRounded:mutuallyExclusiveConstraints:](v3, v17, v4, v19, 0);
            [v17 returnToPool];
            if ((v18 & 1) == 0) {
              goto LABEL_24;
            }
          }
          else
          {
LABEL_10:
            double result = objc_msgSend(v4, "tryToChangeConstraintSuchThatMarker:isReplacedByMarkerPlusDelta:undoHandler:", objc_msgSend((id)v3, "_markerAndPositiveExtraVar"), a2, v12);
            if (!result) {
              return result;
            }
          }
          int v15 = *(_DWORD *)(v3 + 66);
          uint64_t v14 = (unsigned int *)(v3 + 66);
          *(double *)((char *)v14 - 26) = v10;
          *uint64_t v14 = v15 & 0xFFFFFBDF | (32 * (v19 & 7));
        }
        return 1;
      }
    }
  }
  return result;
}

- (double)priorityForVariable:(id)a3
{
  return self->_priority;
}

- (id)_markerAndPositiveExtraVar
{
  return self->_markerAndPositiveExtraVar;
}

- (void)_setSymbolicConstantMultiplier:(id)object
{
  if (object)
  {
    _D8 = a2;
    double v4 = fabs(a2);
    if (_D8 != 0.0 && v4 <= 1024.0)
    {
      __asm { FCMP            H0, #0 }
      if (_ZF) {
        objc_setAssociatedObject(object, &SymbolicConstantMultiplierKey, 0, (void *)0x303);
      }
      __asm { FCVT            H0, D8 }
    }
    else
    {
      objc_setAssociatedObject(object, &SymbolicConstantMultiplierKey, (id)[NSNumber numberWithDouble:_D8], (void *)0x303);
      _H0 = 0;
    }
    *((_WORD *)object + 32) = _H0;
  }
}

uint64_t __55__NSLayoutConstraint__addOrRemoveConstraints_activate___block_invoke(uint64_t a1)
{
  do
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setActive:*(unsigned __int8 *)(a1 + 72)];
    while (1)
    {
      unint64_t v2 = *(void *)(a1 + 64);
      uint64_t v3 = v2 <= (int)++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
         ? 0
         : objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v3;
      double v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (!v4) {
        break;
      }
      if (*(unsigned __int8 *)(a1 + 72) != [v4 isActive])
      {
        double v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        break;
      }
    }
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t result = -[NSLayoutConstraint _layoutEngine]((uint64_t)v4);
  }
  while (v5 == result);
  return result;
}

- (void)setContainer:(id)a3
{
  if (self->_container != a3)
  {
    self->_id container = a3;
    [(NSLayoutConstraint *)self _setContainerDeclaredConstraint:0];
  }
}

- (void)_setContainerDeclaredConstraint:(BOOL)a3
{
  unsigned int v4 = *(_DWORD *)((char *)&self->_layoutConstraintFlags + 2);
  uint64_t v3 = (char *)&self->_layoutConstraintFlags + 2;
  unint64_t v5 = v4 | ((unint64_t)*((unsigned __int16 *)v3 + 2) << 32);
  int v6 = 2048;
  if (!a3) {
    int v6 = 0;
  }
  unint64_t v7 = v5 & 0xFFFFFFFFFFFFF7FFLL;
  *(_DWORD *)uint64_t v3 = v7 | v6;
  *((_WORD *)v3 + 2) = WORD2(v7);
}

- (BOOL)_isEqualToConstraintValue:(id)a3 includingConstant:(BOOL)a4 includeOtherMutableProperties:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  char isKindOfClass = objc_opt_isKindOfClass();
  id firstAnchor = self->_firstAnchor;
  id v11 = (id)[a3 firstAnchor];
  uint64_t v12 = [firstAnchor _anchorType];
  if (v12 == [v11 _anchorType])
  {
    unint64_t v13 = [firstAnchor _anchorType];
    if (v13 >= 2)
    {
      if (v13 != 2) {
        goto LABEL_8;
      }
      uint64_t v14 = [firstAnchor _proxiedItem];
      if (v14 == [v11 _proxiedItem])
      {
        uint64_t v15 = [firstAnchor _proxiedAttribute];
        if (v15 == [v11 _proxiedAttribute]) {
          goto LABEL_8;
        }
      }
    }
    else if (firstAnchor == v11)
    {
LABEL_8:
      id v16 = self->_firstAnchor;
      id v17 = (id)[a3 firstAnchor];
      uint64_t v18 = [v16 _anchorType];
      if (v18 != [v17 _anchorType]) {
        goto LABEL_66;
      }
      unint64_t v19 = [v16 _anchorType];
      if (v19 >= 2)
      {
        if (v19 == 2)
        {
          uint64_t v29 = [v16 _proxiedItem];
          if (v29 != [v17 _proxiedItem]) {
            goto LABEL_66;
          }
          uint64_t v30 = [v16 _proxiedAttribute];
          if (v30 != [v17 _proxiedAttribute]) {
            goto LABEL_66;
          }
        }
      }
      else if (v16 != v17)
      {
        goto LABEL_66;
      }
      int64_t v31 = (unint64_t)*(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) << 62;
      if ([a3 relation] != v31 >> 62) {
        goto LABEL_66;
      }
      double coefficient = self->_coefficient;
      [a3 multiplier];
      if (v33 != coefficient) {
        goto LABEL_66;
      }
      id secondAnchor = self->_secondAnchor;
      id v35 = (id)[a3 secondAnchor];
      uint64_t v36 = [secondAnchor _anchorType];
      if (v36 != [v35 _anchorType]) {
        goto LABEL_66;
      }
      unint64_t v37 = [secondAnchor _anchorType];
      if (v37 >= 2)
      {
        if (v37 == 2)
        {
          uint64_t v38 = [secondAnchor _proxiedItem];
          if (v38 != [v35 _proxiedItem]) {
            goto LABEL_66;
          }
          uint64_t v39 = [secondAnchor _proxiedAttribute];
          if (v39 != [v35 _proxiedAttribute]) {
            goto LABEL_66;
          }
        }
      }
      else if (secondAnchor != v35)
      {
        goto LABEL_66;
      }
      if (v6)
      {
        [(NSLayoutConstraint *)self constant];
        double v41 = v40;
        [a3 constant];
        if (v41 != v42) {
          goto LABEL_66;
        }
        id v43 = [(NSLayoutConstraint *)self _symbolicConstant];
        if (isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector()) {
          uint64_t v44 = [a3 _symbolicConstant];
        }
        else {
          uint64_t v44 = 0;
        }
        if (v43 != (id)v44)
        {
          int v27 = objc_msgSend(v43, "isEqual:");
          if (!v27) {
            return v27;
          }
        }
      }
      goto LABEL_52;
    }
  }
  id v20 = self->_firstAnchor;
  id v21 = (id)[a3 secondAnchor];
  uint64_t v22 = [v20 _anchorType];
  if (v22 != [v21 _anchorType]) {
    goto LABEL_66;
  }
  unint64_t v23 = [v20 _anchorType];
  if (v23 >= 2)
  {
    if (v23 == 2)
    {
      uint64_t v24 = [v20 _proxiedItem];
      if (v24 != [v21 _proxiedItem]) {
        goto LABEL_66;
      }
      uint64_t v25 = [v20 _proxiedAttribute];
      if (v25 != [v21 _proxiedAttribute]) {
        goto LABEL_66;
      }
    }
  }
  else if (v20 != v21)
  {
    goto LABEL_66;
  }
  if ((self->_layoutConstraintFlags & 0x30000) != 0) {
    goto LABEL_66;
  }
  if ([a3 relation]) {
    goto LABEL_66;
  }
  if (self->_coefficient != 1.0) {
    goto LABEL_66;
  }
  [a3 multiplier];
  if (v26 != 1.0) {
    goto LABEL_66;
  }
  int v27 = AnchorEqualOrNil(self->_secondAnchor, (void *)[a3 firstAnchor]);
  if (!v27) {
    return v27;
  }
  if (v6)
  {
    if (self->_constant != 0.0
      || ([a3 constant], v28 != 0.0)
      || [(NSLayoutConstraint *)self _symbolicConstant]
      || ((isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0) && [a3 _symbolicConstant])
    {
LABEL_66:
      LOBYTE(v27) = 0;
      return v27;
    }
  }
LABEL_52:
  float priority = self->_priority;
  [a3 priority];
  if (priority != v46) {
    goto LABEL_66;
  }
  if (!v5)
  {
LABEL_74:
    LOBYTE(v27) = 1;
    return v27;
  }
  id v47 = [(NSLayoutConstraint *)self _identifier];
  if (isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector()) {
    uint64_t v48 = [a3 _identifier];
  }
  else {
    uint64_t v48 = 0;
  }
  if (v47 == (id)v48 || (int v27 = objc_msgSend(v47, "isEqual:")) != 0)
  {
    int v49 = [(NSLayoutConstraint *)self shouldBeArchived];
    if (isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector())
    {
      if (v49 == [a3 shouldBeArchived])
      {
        id v50 = [(NSLayoutConstraint *)self animations];
        if (isKindOfClass) {
          goto LABEL_70;
        }
        goto LABEL_69;
      }
    }
    else if ((v49 & 1) == 0)
    {
      id v50 = [(NSLayoutConstraint *)self animations];
LABEL_69:
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        uint64_t v51 = 0;
        goto LABEL_72;
      }
LABEL_70:
      uint64_t v51 = [a3 animations];
LABEL_72:
      if (v50 == (id)v51) {
        goto LABEL_74;
      }
      int v27 = objc_msgSend(v50, "isEqual:");
      if (v27) {
        goto LABEL_74;
      }
      return v27;
    }
    goto LABEL_66;
  }
  return v27;
}

- (CGFloat)multiplier
{
  return self->_coefficient;
}

+ (void)_addOrRemoveConstraints:(uint64_t)a3 activate:
{
  self;
  uint64_t v5 = [a2 count];
  if (v5)
  {
    unint64_t v6 = v5;
    uint64_t v18 = 0;
    unint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    int v21 = 0;
    uint64_t v12 = 0;
    unint64_t v13 = &v12;
    uint64_t v14 = 0x3052000000;
    uint64_t v15 = __Block_byref_object_copy__1;
    id v16 = __Block_byref_object_dispose__1;
    uint64_t v17 = 0;
    uint64_t v17 = [a2 objectAtIndex:0];
    for (i = (void *)v13[5]; i; v13[5] = (uint64_t)i)
    {
      while ([i isActive] != a3)
      {
        double v8 = (void *)-[NSLayoutConstraint _layoutEngine](v13[5]);
        if (!v8) {
          break;
        }
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __55__NSLayoutConstraint__addOrRemoveConstraints_activate___block_invoke;
        v10[3] = &unk_1E5C57440;
        char v11 = a3;
        v10[6] = &v12;
        v10[7] = &v18;
        v10[8] = v6;
        v10[4] = a2;
        v10[5] = v8;
        [v8 withAutomaticOptimizationDisabled:v10];
        i = (void *)v13[5];
        if (!i) {
          goto LABEL_11;
        }
      }
      [(id)v13[5] setActive:a3];
      uint64_t v9 = *((int *)v19 + 6);
      *((_DWORD *)v19 + 6) = v9 + 1;
      if (v6 <= v9 + 1) {
        i = 0;
      }
      else {
        i = objc_msgSend(a2, "objectAtIndex:");
      }
    }
LABEL_11:
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v18, 8);
  }
}

- (void)setActive:(BOOL)active
{
}

- (void)_setActive:(BOOL)a3 mutuallyExclusiveConstraints:(id *)a4
{
  BOOL v5 = a3;
  if ([(NSLayoutConstraint *)self isActive] == a3) {
    return;
  }
  if (v5)
  {
    id v8 = (id)[self->_firstAnchor _nearestAncestorLayoutItem];
    id secondAnchor = self->_secondAnchor;
    if (secondAnchor)
    {
      uint64_t v10 = [secondAnchor _nearestAncestorLayoutItem];
      if (!v8) {
        goto LABEL_19;
      }
      uint64_t v7 = v10;
      if (!v10) {
        goto LABEL_19;
      }
      id v8 = +[NSLayoutConstraint _findCommonAncestorOfItem:v8 andItem:v10];
    }
    if (v8)
    {
      if (a4)
      {
        objc_msgSend(v8, "nsli_addConstraint:mutuallyExclusiveConstraints:", self, a4);
      }
      else
      {
        objc_msgSend(v8, "nsli_addConstraint:", self);
      }
      return;
    }
LABEL_19:
    uint64_t v12 = [NSString stringWithFormat:@"Unable to activate constraint with anchors %@ and %@ because they have no common ancestor.  Does the constraint or its anchors reference items in different view hierarchies?  That's illegal.", v7, self->_firstAnchor, self->_secondAnchor];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v12 userInfo:0]);
  }
  id container = self->_container;
  objc_msgSend(container, "nsli_removeConstraint:", self);
}

- (BOOL)isActive
{
  return self->_container != 0;
}

- (id)container
{
  return self->_container;
}

- (NSLayoutAnchor)firstAnchor
{
  return (NSLayoutAnchor *)objc_getProperty(self, a2, 16, 1);
}

- (NSLayoutAnchor)secondAnchor
{
  return (NSLayoutAnchor *)objc_getProperty(self, a2, 24, 1);
}

- (uint64_t)_layoutEngine
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(result + 16), "_nearestAncestorLayoutItem"), "nsli_layoutEngine");
    if (!result)
    {
      unint64_t v2 = (void *)[*(id *)(v1 + 24) _nearestAncestorLayoutItem];
      return objc_msgSend(v2, "nsli_layoutEngine");
    }
  }
  return result;
}

+ (id)_findCommonAncestorOfItem:(id)a3 andItem:(id)a4
{
  if (!a3) {
    return a4;
  }
  id v5 = a3;
  if (!a4) {
    return v5;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_8:
    id v7 = a4;
    while (v5 != v7)
    {
      id v7 = (id)objc_msgSend(v7, "nsli_superitem");
      if (!v7)
      {
        id v5 = (id)objc_msgSend(v5, "nsli_superitem");
        id result = 0;
        if (v5) {
          goto LABEL_8;
        }
        return result;
      }
    }
    return v5;
  }
  return (id)objc_msgSend(v5, "nsli_ancestorSharedWithItem:", a4);
}

- (NSLayoutRelation)relation
{
  return (uint64_t)((unint64_t)*(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) << 62) >> 62;
}

+ (void)activateConstraints:(NSArray *)constraints
{
}

+ (uint64_t)_constraintWithAnchor:(void *)a3 relatedBy:(uint64_t)a4 toAnchor:(void *)a5 withSystemSpacingMultipliedBy:
{
  self;
  if ([a3 _anchorType] == 2)
  {
    uint64_t v9 = a3;
    goto LABEL_5;
  }
  if ([a5 _anchorType] == 2)
  {
    uint64_t v9 = a5;
LABEL_5:
    uint64_t v10 = (void *)[v9 _proxiedItem];
    if (!v10) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "_referencedLayoutItems"), "anyObject");
  if (!v10)
  {
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a5, "_referencedLayoutItems"), "anyObject");
    if (!v10)
    {
LABEL_10:
      uint64_t v12 = [NSString stringWithFormat:@"Cannot create a standard spacing constraint between anchors '%@' and '%@': at least one anchor must be associated with a view or a guide", a3, a5];
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v12 userInfo:0]);
    }
  }
LABEL_6:
  uint64_t result = objc_msgSend(v10, "nsli_constraintWithAnchor:relatedBy:toAnchor:withSystemSpacingMultipliedBy:", a3, a4, a5, a1);
  if (!result) {
    goto LABEL_10;
  }
  return result;
}

+ (NSLayoutConstraint)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 multiplier:(double)a8 symbolicConstant:(id)a9 symbolicConstantMultiplier:(double)a10
{
  uint64_t v22 = a4;
  id v23 = a3;
  uint64_t v20 = a7;
  id v21 = a6;
  ResolveConstraintArguments(&v23, &v22, &v21, &v20, a8);
  uint64_t v18 = (char *)objc_alloc_init((Class)objc_opt_class());
  *(_DWORD *)(v18 + 66) |= 0x40u;
  [v18 _setFirstItem:a3 attribute:a4];
  [v18 _setRelation:a5];
  if (a6 && a8 != 0.0)
  {
    [v18 _setMultiplier:a8];
    [v18 _setSecondItem:a6 attribute:a7];
  }
  [v18 setSymbolicConstant:a9];
  [v18 setSymbolicConstantMultiplier:a10];
  ConstraintDidPerformInitialSetup((uint64_t)v18);
  return (NSLayoutConstraint *)v18;
}

- (void)setSymbolicConstantMultiplier:(double)a3
{
  id v5 = [(NSLayoutConstraint *)self _symbolicConstant];
  if (!v5) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot set symbolic constant multiplier when the constant is not symbolic" userInfo:0]);
  }
  double constant = self->_constant;
  -[NSLayoutConstraint _setSymbolicConstant:constant:symbolicConstantMultiplier:](self, v5, constant, a3);
}

+ (NSLayoutConstraint)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7
{
  return (NSLayoutConstraint *)[a1 constraintWithItem:a3 attribute:a4 relatedBy:a5 toItem:a6 attribute:a7 multiplier:1.0 constant:0.0];
}

- (void)setPriority:(UILayoutPriority)priority
{
}

- (uint64_t)_setPriority:(float)a3 mutuallyExclusiveConstraints:
{
  if (result)
  {
    uint64_t v5 = result;
    if (a3 <= 0.0 || a3 > 1000.0) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__setPriority_mutuallyExclusiveConstraints_, result, @"NSLayoutConstraint.m", 274, @"It's illegal to set priority:%g.  Priorities must be greater than 0 and less or equal to NSLayoutPriorityRequired, which is %f.", a3, 0x408F400000000000);
    }
    uint64_t result = kdebug_trace();
    if (a2) {
      *a2 = 0;
    }
    if (*(float *)(v5 + 76) != a3)
    {
      if ([(id)v5 hasBeenLowered])
      {
        uint64_t v7 = objc_msgSend((id)objc_msgSend((id)v5, "container"), "nsli_layoutEngine");
        id v8 = (void *)v7;
        if (a3 == 1000.0 || *(float *)(v5 + 76) == 1000.0)
        {
          if (v7)
          {
            [(id)v5 _removeFromEngine:v7];
            int v9 = *(_DWORD *)(v5 + 76);
            *(float *)(v5 + 76) = a3;
            -[NSLayoutConstraint _rebuildExtraVars]((NSISVariable *)v5);
            [(id)v5 _addToEngine:v8 mutuallyExclusiveConstraints:a2];
            if (a2 && [*a2 count])
            {
              *(_DWORD *)(v5 + 76) = v9;
              -[NSLayoutConstraint _rebuildExtraVars]((NSISVariable *)v5);
              [(id)v5 _addToEngine:v8 mutuallyExclusiveConstraints:a2];
            }
          }
          else
          {
            *(float *)(v5 + 76) = a3;
            -[NSLayoutConstraint _rebuildExtraVars]((NSISVariable *)v5);
          }
        }
        else
        {
          if ([*(id *)(v5 + 48) shouldBeMinimized]) {
            [v8 changeVariableToBeOptimized:*(void *)(v5 + 48) fromPriority:*(float *)(v5 + 76) toPriority:a3];
          }
          if ([*(id *)(v5 + 56) shouldBeMinimized]) {
            [v8 changeVariableToBeOptimized:*(void *)(v5 + 56) fromPriority:*(float *)(v5 + 76) toPriority:a3];
          }
          *(float *)(v5 + 76) = a3;
        }
      }
      else
      {
        *(float *)(v5 + 76) = a3;
      }
      return kdebug_trace();
    }
  }
  return result;
}

- (void)setSymbolicConstant:(id)a3
{
  [(NSLayoutConstraint *)self symbolicConstantMultiplier];
  -[NSLayoutConstraint _setSymbolicConstant:constant:symbolicConstantMultiplier:](self, a3, 0.0, v5);
}

- (int)_constraintType
{
  uint64_t v2 = *(unsigned int *)((char *)&self->_layoutConstraintFlags + 2);
  if ((v2 & 4) == 0)
  {
    id firstAnchor = self->_firstAnchor;
    id secondAnchor = self->_secondAnchor;
    if (firstAnchor) {
      BOOL v6 = secondAnchor == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (firstAnchor) {
        BOOL v7 = secondAnchor == 0;
      }
      else {
        BOOL v7 = 0;
      }
      if (v7)
      {
        unsigned int v8 = [self->_firstAnchor _constraintAttribute];
        if (v8 > 0x25 || ((1 << v8) & 0x3F001FFE7FLL) == 0)
        {
          LODWORD(v1+[NSLayoutConstraint _addOrRemoveConstraints:activate:]((uint64_t)NSLayoutConstraint, constraints, 1) = 5;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            LODWORD(v1+[NSLayoutConstraint _addOrRemoveConstraints:activate:]((uint64_t)NSLayoutConstraint, constraints, 1) = 6;
          }
          else {
            LODWORD(v1+[NSLayoutConstraint _addOrRemoveConstraints:activate:]((uint64_t)NSLayoutConstraint, constraints, 1) = 0;
          }
        }
        goto LABEL_44;
      }
      goto LABEL_43;
    }
    float coefficient = self->_coefficient;
    LODWORD(v1+[NSLayoutConstraint _addOrRemoveConstraints:activate:]((uint64_t)NSLayoutConstraint, constraints, 1) = [self->_firstAnchor isCompatibleWithAnchor:secondAnchor];
    if (!v11) {
      goto LABEL_44;
    }
    uint64_t v12 = (void *)[firstAnchor _constraintItem];
    unint64_t v13 = (void *)[secondAnchor _constraintItem];
    uint64_t v14 = [firstAnchor _constraintAttribute];
    uint64_t v15 = [secondAnchor _constraintAttribute];
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass())
    {
      if (coefficient == 1.0)
      {
        LODWORD(v1+[NSLayoutConstraint _addOrRemoveConstraints:activate:]((uint64_t)NSLayoutConstraint, constraints, 1) = 1;
        if (!v14 || !v15) {
          goto LABEL_44;
        }
        if (v14 == v15)
        {
          if ((v14 > 0x25 || ((1 << v14) & 0x3C001D5FD5) == 0)
            && objc_msgSend(v12, "nsli_superitem") == v13)
          {
            LODWORD(v1+[NSLayoutConstraint _addOrRemoveConstraints:activate:]((uint64_t)NSLayoutConstraint, constraints, 1) = 3;
            goto LABEL_44;
          }
          if (v14 >= 0x24 || ((0xF001ABFABuLL >> v14) & 1) == 0)
          {
            if (objc_msgSend(v13, "nsli_superitem") == v12) {
              LODWORD(v1+[NSLayoutConstraint _addOrRemoveConstraints:activate:]((uint64_t)NSLayoutConstraint, constraints, 1) = 4;
            }
            else {
              LODWORD(v1+[NSLayoutConstraint _addOrRemoveConstraints:activate:]((uint64_t)NSLayoutConstraint, constraints, 1) = 1;
            }
            goto LABEL_44;
          }
        }
        else if (v14 >= 0x26 || ((0x3C001D5FD5uLL >> v14) & 1) == 0)
        {
          if (v15 >= 0x24) {
            LODWORD(v1+[NSLayoutConstraint _addOrRemoveConstraints:activate:]((uint64_t)NSLayoutConstraint, constraints, 1) = 2;
          }
          else {
            LODWORD(v1+[NSLayoutConstraint _addOrRemoveConstraints:activate:]((uint64_t)NSLayoutConstraint, constraints, 1) = dword_1A64B93C8[(int)v15];
          }
          goto LABEL_44;
        }
        LODWORD(v1+[NSLayoutConstraint _addOrRemoveConstraints:activate:]((uint64_t)NSLayoutConstraint, constraints, 1) = 1;
LABEL_44:
        int v17 = *(_DWORD *)((char *)&self->_layoutConstraintFlags + 2);
        id v16 = (char *)&self->_layoutConstraintFlags + 2;
        *((_WORD *)v16 + 2) = *((_WORD *)v16 + 2);
        *(_DWORD *)id v16 = v17 & 0xFF00FFFF | (v11 << 16) | 4;
        return v11;
      }
LABEL_43:
      LODWORD(v1+[NSLayoutConstraint _addOrRemoveConstraints:activate:]((uint64_t)NSLayoutConstraint, constraints, 1) = 0;
      goto LABEL_44;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_43;
    }
    LODWORD(v1+[NSLayoutConstraint _addOrRemoveConstraints:activate:]((uint64_t)NSLayoutConstraint, constraints, 1) = 6;
    if (!v14 || !v15) {
      goto LABEL_44;
    }
    if (v15 <= 0x25 && ((1 << v15) & 0x2A00119D19) != 0)
    {
      if ((v14 > 0x25) | (0x15FFEE62E6uLL >> v14) & 1) {
        goto LABEL_40;
      }
    }
    else if (!((v14 > 0x25) | (0x15FFEE62E6uLL >> v14) & 1))
    {
LABEL_40:
      if (v12 == v13) {
        LODWORD(v1+[NSLayoutConstraint _addOrRemoveConstraints:activate:]((uint64_t)NSLayoutConstraint, constraints, 1) = 7;
      }
      else {
        LODWORD(v1+[NSLayoutConstraint _addOrRemoveConstraints:activate:]((uint64_t)NSLayoutConstraint, constraints, 1) = 8;
      }
      goto LABEL_44;
    }
    LODWORD(v1+[NSLayoutConstraint _addOrRemoveConstraints:activate:]((uint64_t)NSLayoutConstraint, constraints, 1) = 6;
    goto LABEL_44;
  }
  return (uint64_t)((v2 | ((unint64_t)HIWORD(self->_layoutConstraintFlags) << 32)) << 40) >> 56;
}

- (BOOL)_referencesLayoutItem:(id)a3
{
  if (!a3) {
    return 0;
  }
  if ([(NSLayoutConstraint *)self firstItem] == a3
    || [(NSLayoutConstraint *)self secondItem] == a3
    || (objc_msgSend(-[NSLayoutAnchor _referencedLayoutItems](-[NSLayoutConstraint firstAnchor](self, "firstAnchor"), "_referencedLayoutItems"), "containsObject:", a3) & 1) != 0)
  {
    return 1;
  }
  id v6 = [(NSLayoutAnchor *)[(NSLayoutConstraint *)self secondAnchor] _referencedLayoutItems];
  return [v6 containsObject:a3];
}

- (id)firstItem
{
  return (id)[self->_firstAnchor _constraintItem];
}

- (id)secondItem
{
  return (id)[self->_secondAnchor _constraintItem];
}

+ (NSLayoutConstraint)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 constant:(double)a6
{
  return (NSLayoutConstraint *)[a1 constraintWithItem:a3 attribute:a4 relatedBy:a5 toItem:0 attribute:0 multiplier:0.0 constant:a6];
}

+ (NSLayoutConstraint)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 constant:(double)a8
{
  return (NSLayoutConstraint *)[a1 constraintWithItem:a3 attribute:a4 relatedBy:a5 toItem:a6 attribute:a7 multiplier:1.0 constant:a8];
}

- (NSLayoutConstraint)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v29 = NSString;
    uint64_t v30 = NSStringFromSelector(a2);
    uint64_t v31 = [v29 stringWithFormat:@"%@ - only keyed coders are supported by %@", v30, objc_opt_class()];

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v31 userInfo:0]);
  }
  v32.receiver = self;
  v32.super_class = (Class)NSLayoutConstraint;
  id v6 = [(NSLayoutConstraint *)&v32 init];
  uint64_t v7 = (uint64_t)v6;
  if (v6)
  {
    *(_DWORD *)(v6 + 66) |= 0x40u;
    if (gLegacyDecodingOnly || ![a3 containsValueForKey:@"NSFirstAnchor"])
    {
      uint64_t v9 = [a3 decodeObjectForKey:@"NSFirstItem"];
      if (!v9) {
        goto LABEL_12;
      }
      uint64_t v10 = v9;
      if (gLegacyDecodingOnly
        || (uint64_t v11 = @"NSFirstAttributeV2",
            ([a3 containsValueForKey:@"NSFirstAttributeV2"] & 1) == 0))
      {
        uint64_t v11 = @"NSFirstAttribute";
      }
      id v8 = +[NSLayoutAnchor _anchorForItem:attribute:](NSLayoutAnchor, "_anchorForItem:attribute:", v10, [a3 decodeIntegerForKey:v11]);
    }
    else
    {
      id v8 = (id)[a3 decodeObjectForKey:@"NSFirstAnchor"];
    }
    *(void *)(v7 + 16) = v8;
LABEL_12:
    if ([a3 containsValueForKey:@"NSRelation"]) {
      int v12 = [a3 decodeIntForKey:@"NSRelation"] & 3;
    }
    else {
      int v12 = 0;
    }
    *(_DWORD *)(v7 + 66) = *(_DWORD *)(v7 + 66) & 0xFFFFFFFC | v12;
    int v13 = [a3 containsValueForKey:@"NSMultiplier"];
    LODWORD(v14) = 1.0;
    if (v13)
    {
      objc_msgSend(a3, "decodeDoubleForKey:", @"NSMultiplier", v14);
      *(float *)&double v14 = v14;
    }
    *(_DWORD *)(v7 + 72) = LODWORD(v14);
    if (gLegacyDecodingOnly || ![a3 containsValueForKey:@"NSSecondAnchor"])
    {
      uint64_t v16 = [a3 decodeObjectForKey:@"NSSecondItem"];
      if (!v16) {
        goto LABEL_27;
      }
      uint64_t v17 = v16;
      if (gLegacyDecodingOnly || ([a3 containsValueForKey:@"NSFirstAttributeV2"] & 1) == 0) {
        uint64_t v18 = @"NSSecondAttribute";
      }
      else {
        uint64_t v18 = @"NSSecondAttributeV2";
      }
      id v15 = +[NSLayoutAnchor _anchorForItem:attribute:](NSLayoutAnchor, "_anchorForItem:attribute:", v17, [a3 decodeIntegerForKey:v18]);
    }
    else
    {
      id v15 = (id)[a3 decodeObjectForKey:@"NSSecondAnchor"];
    }
    *(void *)(v7 + 24) = v15;
LABEL_27:
    if (gLegacyDecodingOnly || ([a3 containsValueForKey:@"NSFirstAttributeV2"] & 1) == 0) {
      unint64_t v19 = @"NSConstant";
    }
    else {
      unint64_t v19 = @"NSConstantV2";
    }
    [a3 decodeDoubleForKey:v19];
    double v21 = v20;
    double v22 = 1.0;
    if ([a3 containsValueForKey:@"NSSymbolicConstantMultiplier"])
    {
      [a3 decodeDoubleForKey:@"NSSymbolicConstantMultiplier"];
      double v22 = v23;
    }
    -[NSLayoutConstraint _setSymbolicConstant:constant:symbolicConstantMultiplier:]((void *)v7, (id)[a3 decodeObjectForKey:@"NSSymbolicConstant"], v21, v22);
    int v24 = [a3 decodeBoolForKey:@"NSShouldBeArchived"];
    int v25 = 8;
    if (!v24) {
      int v25 = 0;
    }
    unint64_t v26 = *(_DWORD *)(v7 + 66) & 0xFFFFFFF7 | ((unint64_t)*(unsigned __int16 *)(v7 + 70) << 32);
    *(_DWORD *)(v7 + 66) = *(_DWORD *)(v7 + 66) & 0xFFFFFFF7 | v25;
    *(_WORD *)(v7 + 70) = WORD2(v26);
    -[NSLayoutConstraint _setIdentifier:](v7, (void *)[a3 decodeObjectForKey:@"NSLayoutIdentifier"]);
    if ([a3 containsValueForKey:@"NSPriority"]) {
      float v27 = (float)(int)[a3 decodeIntForKey:@"NSPriority"];
    }
    else {
      float v27 = 1000.0;
    }
    *(float *)(v7 + 76) = v27;
    ConstraintDidPerformInitialSetup(v7);
  }
  return (NSLayoutConstraint *)v7;
}

- (void)_containerGeometryDidChange
{
  if ([(NSLayoutConstraint *)self hasBeenLowered])
  {
    char v10 = 0;
    id v3 = +[NSISLinearExpression acquireFromPoolForUseCase:engine:](NSISLinearExpression, "acquireFromPoolForUseCase:engine:", 0, objc_msgSend(self->_container, "nsli_layoutEngine"));
    BOOL v4 = [(NSLayoutConstraint *)self _lowerIntoExpression:v3 reportingConstantIsRounded:&v10];
    [v3 constant];
    double v6 = v5;
    [v3 returnToPool];
    if (v4)
    {
      double loweredConstant = self->_loweredConstant;
      if (vabdd_f64(v6, loweredConstant) >= *(double *)&NSISEpsilon)
      {
        objc_msgSend((id)objc_msgSend(self->_container, "nsli_layoutEngine"), "constraintDidChangeSuchThatMarker:shouldBeReplacedByMarkerPlusDelta:", -[NSLayoutConstraint _markerAndPositiveExtraVar](self, "_markerAndPositiveExtraVar"), -(v6 - loweredConstant));
        int v9 = *(_DWORD *)((char *)&self->_layoutConstraintFlags + 2);
        id v8 = (unsigned int *)((char *)&self->_layoutConstraintFlags + 2);
        *(double *)((char *)v8 - 26) = v6;
        *id v8 = v9 & 0xFFFFFBDF | (32 * (v10 & 7));
      }
    }
  }
}

+ (NSLayoutConstraint)constraintWithItem:(id)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(id)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c
{
  NSLayoutAttribute v20 = attr1;
  id v21 = view1;
  NSLayoutAttribute v18 = attr2;
  id v19 = view2;
  ResolveConstraintArguments(&v21, (uint64_t *)&v20, &v19, (uint64_t *)&v18, multiplier);
  uint64_t v16 = (char *)objc_alloc_init((Class)objc_opt_class());
  *(_DWORD *)(v16 + 66) |= 0x40u;
  [v16 _setFirstItem:view1 attribute:attr1];
  [v16 _setRelation:relation];
  if (view2 && multiplier != 0.0)
  {
    [v16 _setMultiplier:multiplier];
    [v16 _setSecondItem:view2 attribute:attr2];
  }
  [v16 setConstant:c];
  ConstraintDidPerformInitialSetup((uint64_t)v16);
  return (NSLayoutConstraint *)v16;
}

+ (NSLayoutConstraint)constraintWithAnchor:(id)a3 relatedBy:(int64_t)a4 toAnchor:(id)a5 multiplier:(double)a6 constant:(double)a7
{
  if (!a3)
  {
    id v15 = NSString;
    uint64_t v17 = [NSString stringWithFormat:@"NSLayoutConstraint for %@", a4, a5, a6, a7, 0];
    uint64_t v16 = @"%@: Constraint must contain a first layout anchor";
    goto LABEL_12;
  }
  if (!a5)
  {
    if ([a3 validateOtherAttribute:7]) {
      goto LABEL_6;
    }
    id v15 = NSString;
    uint64_t v17 = [NSString stringWithFormat:@"NSLayoutConstraint for %@", a3];
    id v18 = a3;
    uint64_t v16 = @"%@: A constraint cannot be made from %@ to a constant. Location anchors require being paired.";
LABEL_12:
    uint64_t v12 = objc_msgSend(v15, "stringWithFormat:", v16, v17, v18, v19);
LABEL_13:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v12 userInfo:0]);
  }
  if (([a3 isCompatibleWithAnchor:a5] & 1) == 0)
  {
    uint64_t v12 = [NSString stringWithFormat:@"%@: A constraint cannot be made between %@ and %@ because their units are not compatible.", objc_msgSend(NSString, "stringWithFormat:", @"NSLayoutConstraint for %@", a3), a3, a5];
    goto LABEL_13;
  }
LABEL_6:
  int v13 = (char *)objc_alloc_init((Class)objc_opt_class());
  *(_DWORD *)(v13 + 66) |= 0x40u;
  [v13 _setFirstAnchor:a3];
  [v13 _setRelation:a4];
  if (a5 && a6 != 0.0)
  {
    [v13 _setMultiplier:a6];
    [v13 _setSecondAnchor:a5];
  }
  [v13 setConstant:a7];
  ConstraintDidPerformInitialSetup((uint64_t)v13);
  return (NSLayoutConstraint *)v13;
}

- (NSLayoutConstraint)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSLayoutConstraint;
  uint64_t result = [(NSLayoutConstraint *)&v3 init];
  if (result)
  {
    LOWORD(result->_layoutConstraintFlags) = COERCE_UNSIGNED_INT(1.0);
    *(void *)&result->_float coefficient = 0x447A00003F800000;
  }
  return result;
}

- (void)_setFirstAnchor:(id)a3
{
}

- (void)_setSecondAnchor:(id)a3
{
}

- (void)_setMultiplier:(double)a3
{
  if ([(NSLayoutConstraint *)self hasBeenLowered]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSLayoutConstraint.m", 239, @"Unable to change the multiplier after a constraint has been added to a view");
  }
  double v6 = fabs(a3);
  if (v6 >= INFINITY && v6 <= INFINITY) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSLayoutConstraint.m", 240, @"Multiplier is not finite!  That's illegal.  multiplier:%g", *(void *)&a3);
  }
  float v7 = a3;
  self->_float coefficient = v7;
}

- (void)_setRelation:(int64_t)a3
{
  char v3 = a3;
  if ([(NSLayoutConstraint *)self hasBeenLowered]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSLayoutConstraint.m", 233, @"Unable to change the relation after a constraint has been added to a view");
  }
  *(_DWORD *)((char *)&self->_layoutConstraintFlags + 2) = *(_DWORD *)((unsigned char *)&self->_layoutConstraintFlags + 2) & 0xFFFFFFFC | v3 & 3;
}

- (BOOL)hasBeenLowered
{
  return ((unint64_t)*(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) >> 4) & 1;
}

- (void)_setSecondItem:(id)a3 attribute:(int64_t)a4
{
  if (a3) {
    a3 = +[NSLayoutAnchor _anchorForItem:a3 attribute:a4];
  }
  -[NSLayoutConstraint _setSecondAnchor:](self, "_setSecondAnchor:", a3, a4);
}

- (void)_setFirstItem:(id)a3 attribute:(int64_t)a4
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSLayoutConstraint.m", 227, @"First item cannot be set to a nil value");
  }
  id v7 = +[NSLayoutAnchor _anchorForItem:a3 attribute:a4];
  [(NSLayoutConstraint *)self _setFirstAnchor:v7];
}

- (void)_setNegativeExtraVar:(void *)result
{
  if (result)
  {
    char v3 = result;
    BOOL v4 = (void *)result[7];
    if (v4 != a2)
    {

      uint64_t result = a2;
      v3[7] = result;
    }
  }
  return result;
}

- (void)_setMarkerAndPositiveErrorVar:(void *)result
{
  if (result)
  {
    char v3 = result;
    BOOL v4 = (void *)result[6];
    if (v4 != a2)
    {

      uint64_t result = a2;
      v3[6] = result;
    }
  }
  return result;
}

- (void)dealloc
{
  [self->_markerAndPositiveExtraVar setDelegate:0];

  [self->_negativeExtraVar setDelegate:0];
  [(NSLayoutConstraint *)self _setSymbolicConstant:0];
  -[NSLayoutConstraint _setIdentifier:]((uint64_t)self, 0);
  v3.receiver = self;
  v3.super_class = (Class)NSLayoutConstraint;
  [(NSLayoutConstraint *)&v3 dealloc];
}

- (void)_setIdentifier:(uint64_t)a1
{
  if (a1)
  {
    if (a2)
    {
      objc_super v3 = (void *)[a2 copy];
      os_unfair_lock_lock((os_unfair_lock_t)&identifierTableLock);
      [(id)_NSFaultInObject() setObject:v3 forKey:a1];
      *(_DWORD *)(a1 + 66) |= 0x80u;
      os_unfair_lock_unlock((os_unfair_lock_t)&identifierTableLock);
    }
    else if ((*(_DWORD *)(a1 + 66) & 0x80) != 0)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&identifierTableLock);
      [(id)_NSFaultInObject() removeObjectForKey:a1];
      int v5 = *(_DWORD *)(a1 + 66);
      uint64_t v4 = a1 + 66;
      __int16 v6 = *(_WORD *)(v4 + 4);
      *(_DWORD *)uint64_t v4 = v5 & 0xFFFFFF7F;
      *(_WORD *)(v4 + 4) = v6;
      os_unfair_lock_unlock((os_unfair_lock_t)&identifierTableLock);
    }
  }
}

- (BOOL)_loweredConstantIsRounded
{
  return ((unint64_t)*(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) >> 5) & 1;
}

+ (void)deactivateConstraints:(NSArray *)constraints
{
}

- (id)_identifier
{
  if ((*(_DWORD *)((unsigned char *)&self->_layoutConstraintFlags + 2) & 0x80) == 0) {
    return 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&identifierTableLock);
  id v4 = (id)[(id)_NSFaultInObject() objectForKey:self];
  os_unfair_lock_unlock((os_unfair_lock_t)&identifierTableLock);
  return v4;
}

- (void)_removeFromEngine:(id)a3
{
  if ((*(_DWORD *)((unsigned char *)&self->_layoutConstraintFlags + 2) & 0x10) != 0)
  {
    if ([self->_markerAndPositiveExtraVar shouldBeMinimized])
    {
      [(NSLayoutConstraint *)self priorityForVariable:self->_markerAndPositiveExtraVar];
      if (v5 != 0.0) {
        objc_msgSend(a3, "removeVariableToBeOptimized:priority:", self->_markerAndPositiveExtraVar);
      }
    }
    if ([self->_negativeExtraVar shouldBeMinimized])
    {
      [(NSLayoutConstraint *)self priorityForVariable:self->_negativeExtraVar];
      if (v6 != 0.0) {
        objc_msgSend(a3, "removeVariableToBeOptimized:priority:", self->_negativeExtraVar);
      }
    }
    objc_msgSend(a3, "removeConstraintWithMarker:", -[NSLayoutConstraint _markerAndPositiveExtraVar](self, "_markerAndPositiveExtraVar"));
  }
}

+ (NSArray)constraintsWithVisualFormat:(NSString *)format options:(NSLayoutFormatOptions)opts metrics:(NSDictionary *)metrics views:(NSDictionary *)views
{
  return (NSArray *)+[NSLayoutConstraintParser constraintsWithVisualFormat:format options:opts metrics:metrics views:views];
}

- (void)setShouldBeArchived:(BOOL)shouldBeArchived
{
  unsigned int v4 = *(_DWORD *)((char *)&self->_layoutConstraintFlags + 2);
  objc_super v3 = (char *)&self->_layoutConstraintFlags + 2;
  unint64_t v5 = v4 | ((unint64_t)*((unsigned __int16 *)v3 + 2) << 32);
  int v6 = 8;
  if (!shouldBeArchived) {
    int v6 = 0;
  }
  unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFF7;
  *(_DWORD *)objc_super v3 = v7 | v6;
  *((_WORD *)v3 + 2) = WORD2(v7);
}

- (_NSConstraintDescriptionLayoutRuleNode)_associatedRuleNode
{
  return (_NSConstraintDescriptionLayoutRuleNode *)objc_getAssociatedObject(self, sel__associatedRuleNode);
}

- (void)_setAssociatedRuleNode:(id)a3
{
}

- (void)_ancestorRuleNodes
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [a1 _associatedRuleNode];
  if (!v1) {
    return (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v2 = (void *)v1;
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
  do
  {
    [v3 addObject:v2];
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      break;
    }
    uint64_t v2 = (void *)[v2 parentNode];
  }
  while (v2);
  return v3;
}

- (void)sourceRuleHierarchy
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = -[NSLayoutConstraint _ancestorRuleNodes](a1);
  uint64_t v2 = (void *)[MEMORY[0x1E4F28E78] string];
  objc_super v3 = (void *)[v1 lastObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__NSLayoutConstraint_NSLayoutRuleDebug__sourceRuleHierarchy__block_invoke;
  v5[3] = &unk_1E5C571F8;
  v5[4] = v1;
  _NSRuleNodeAppendDebugDescription(v3, v2, 0, (uint64_t)v5);
  return v2;
}

uint64_t __60__NSLayoutConstraint_NSLayoutRuleDebug__sourceRuleHierarchy__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (double)dissatisfaction
{
  if (!a1) {
    return 0.0;
  }
  NSLog(&cfstr_WarningUseNsla.isa);
  [a1 unsatisfaction];
  return result;
}

- (double)unsatisfaction
{
  return -[NSLayoutConstraint _unsatisfaction:]((id *)&self->super.isa, 0);
}

- (double)_unsatisfaction:(id *)a1
{
  if (a1)
  {
    unsigned int v4 = objc_msgSend((id)objc_msgSend(a1, "container"), "nsli_layoutEngine");
    if (v4)
    {
      if (objc_msgSend((id)objc_msgSend(a1, "_markerAndPositiveExtraVar"), "shouldBeMinimized"))
      {
        objc_msgSend(v4, "valueForVariable:", objc_msgSend(a1, "_markerAndPositiveExtraVar"));
        double v6 = v5 + 0.0;
        if (v5 == 0.0) {
          uint64_t v7 = 0;
        }
        else {
          uint64_t v7 = [a1 _markerAndPositiveExtraVar];
        }
      }
      else
      {
        uint64_t v7 = 0;
        double v6 = 0.0;
      }
      if ([a1[7] shouldBeMinimized])
      {
        [v4 valueForVariable:a1[7]];
        double v6 = v6 - v8;
        if (v8 != 0.0) {
          uint64_t v7 = (uint64_t)a1[7];
        }
      }
    }
    else
    {
      uint64_t v7 = 0;
      double v6 = 0.0;
    }
    uint64_t v9 = objc_msgSend((id)objc_msgSend(v4, "_brokenConstraintPositiveErrorsIfAvailable"), "objectForKey:", objc_msgSend(a1, "_markerAndPositiveExtraVar"));
    if (v9)
    {
      [v4 valueForVariable:v9];
      double v6 = v6 + v10;
      uint64_t v7 = [a1 _markerAndPositiveExtraVar];
    }
    uint64_t v11 = objc_msgSend((id)objc_msgSend(v4, "_brokenConstraintNegativeErrorsIfAvailable"), "objectForKey:", objc_msgSend(a1, "_markerAndPositiveExtraVar"));
    if (v11)
    {
      [v4 valueForVariable:v11];
      double v6 = v6 - v12;
      uint64_t v7 = [a1 _markerAndPositiveExtraVar];
    }
    if (!a2) {
      return -v6;
    }
    if (v7)
    {
      int v13 = a1;
      uint64_t v14 = v7;
    }
    else
    {
      if (objc_msgSend((id)objc_msgSend(a1, "_markerAndPositiveExtraVar"), "shouldBeMinimized"))
      {
        uint64_t v14 = [a1 _markerAndPositiveExtraVar];
      }
      else
      {
        if (![a1[7] shouldBeMinimized])
        {
          objc_msgSend(a1, "priorityForVariable:", objc_msgSend(a1, "_markerAndPositiveExtraVar"));
          double v18 = v17;
          [a1 priorityForVariable:a1[7]];
          double v15 = fmax(v18, v19);
          goto LABEL_25;
        }
        uint64_t v14 = (uint64_t)a1[7];
      }
      int v13 = a1;
    }
    [v13 priorityForVariable:v14];
LABEL_25:
    *a2 = v15;
    return -v6;
  }
  return 0.0;
}

- (uint64_t)_negativeExtraVar
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (void)_setLoweredConstantNeedsUpdate:(BOOL)a3
{
  unsigned int v4 = *(_DWORD *)((char *)&self->_layoutConstraintFlags + 2);
  objc_super v3 = (char *)&self->_layoutConstraintFlags + 2;
  unint64_t v5 = v4 | ((unint64_t)*((unsigned __int16 *)v3 + 2) << 32);
  int v6 = 1024;
  if (!a3) {
    int v6 = 0;
  }
  unint64_t v7 = v5 & 0xFFFFFFFFFFFFFBFFLL;
  *(_DWORD *)objc_super v3 = v7 | v6;
  *((_WORD *)v3 + 2) = WORD2(v7);
}

- (BOOL)_loweredConstantNeedsUpdate
{
  return ((unint64_t)*(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) >> 10) & 1;
}

- (BOOL)shouldBeArchived
{
  return ((unint64_t)*(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) >> 3) & 1;
}

- (BOOL)_isIBPrototypingLayoutConstraint
{
  return 0;
}

- (NSISVariable)_rebuildExtraVars
{
  if (result)
  {
    uint64_t v1 = result;

    *(void *)&v1->_engineVarIndexes[0].value = 0;
    *(void *)&v1->_engineVarIndexes[2].value = 0;
    return -[NSLayoutConstraint _makeExtraVars](v1);
  }
  return result;
}

- (BOOL)_existsInEngine:(id)a3
{
  id markerAndPositiveExtraVar = self->_markerAndPositiveExtraVar;
  if (markerAndPositiveExtraVar) {
    return [a3 containsConstraintWithMarker:markerAndPositiveExtraVar];
  }
  else {
    return 0;
  }
}

- (uint64_t)setHasBeenLowered:(uint64_t)result
{
  if (result)
  {
    unsigned int v2 = *(_DWORD *)(result + 66);
    result += 66;
    unint64_t v3 = v2 | ((unint64_t)*(unsigned __int16 *)(result + 4) << 32);
    int v4 = 16;
    if (!a2) {
      int v4 = 0;
    }
    unint64_t v5 = v3 & 0xFFFFFFFFFFFFFFEFLL;
    *(_DWORD *)double result = v5 | v4;
    *(_WORD *)(result + 4) = WORD2(v5);
  }
  return result;
}

- (id)animations
{
  return objc_getAssociatedObject(self, @"NSLayoutConstraintToAnimationsKey");
}

- (void)setAnimations:(id)a3
{
}

- (BOOL)_isFudgeable
{
  return 0;
}

- (double)_fudgeIncrement
{
  return 0.0;
}

- (double)_allowedMagnitudeForIntegralizationAdjustment
{
  return 0.0;
}

- (BOOL)nsis_valueOfVariableIsUserObservable:(id)a3
{
  return 0;
}

- (unint64_t)_deferDTraceLogging
{
  if (result) {
    return ((unint64_t)*(unsigned int *)(result + 66) >> 6) & 1;
  }
  return result;
}

- (uint64_t)_setDeferDTraceLogging:(uint64_t)result
{
  if (result)
  {
    unsigned int v2 = *(_DWORD *)(result + 66);
    result += 66;
    unint64_t v3 = v2 | ((unint64_t)*(unsigned __int16 *)(result + 4) << 32);
    int v4 = 64;
    if (!a2) {
      int v4 = 0;
    }
    unint64_t v5 = v3 & 0xFFFFFFFFFFFFFFBFLL;
    *(_DWORD *)double result = v5 | v4;
    *(_WORD *)(result + 4) = WORD2(v5);
  }
  return result;
}

- (uint64_t)_primitiveConstraintType
{
  if (result)
  {
    if ((*(_DWORD *)(result + 66) & 4) != 0) {
      return ((int)(*(_DWORD *)(result + 66) << 8) >> 24);
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

- (uint64_t)_setPrimitiveConstraintType:(uint64_t)result
{
  if (result)
  {
    int v2 = *(_DWORD *)(result + 66);
    result += 66;
    *(_WORD *)(result + 4) = *(_WORD *)(result + 4);
    *(_DWORD *)double result = (a2 << 16) | v2 & 0xFF00FFFF | 4;
  }
  return result;
}

- (__CFString)_allocationDescription
{
  if (result)
  {
    uint64_t v1 = result;
    if (_NSConstraintBasedLayoutTrackAllocation())
    {
      id AssociatedObject = (__CFString *)objc_getAssociatedObject(v1, @"kSavedConstraintAllocationStackKey");
      unint64_t v3 = @"Allocation stack symbols are unexpectedly missing.";
      if (AssociatedObject) {
        unint64_t v3 = AssociatedObject;
      }
      return (__CFString *)[NSString stringWithFormat:@"%@", v3];
    }
    else
    {
      return @"Run this application with the argument '-NSConstraintBasedLayoutTrackAllocation YES' in order to enable tracking of constraint allocation.";
    }
  }
  return result;
}

- (void)_clearWeakContainerReference
{
  int v2 = self;
  self->_id container = 0;
  [(NSLayoutConstraint *)self _setContainerDeclaredConstraint:0];
  int v3 = *(_DWORD *)((char *)&v2->_layoutConstraintFlags + 2);
  int v2 = (NSLayoutConstraint *)((char *)v2 + 66);
  __int16 v4 = WORD2(v2->super.isa);
  LODWORD(v2->super.isa) = v3 & 0xFFFFFFEF;
  WORD2(v2->super.isa) = v4;
}

- (BOOL)_containerDeclaredConstraint
{
  return ((unint64_t)*(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) >> 11) & 1;
}

+ (double)_constraintConstantLimit
{
  return 1.0e10;
}

double __79__NSLayoutConstraint__setSymbolicConstant_constant_symbolicConstantMultiplier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setSymbolicConstant:*(void *)(a1 + 40)];
  -[NSLayoutConstraint _setSymbolicConstantMultiplier:](*(id *)(a1 + 32), *(double *)(a1 + 48));
  double result = *(double *)(a1 + 56);
  *(double *)(*(void *)(a1 + 32) + 32) = result;
  return result;
}

- (id)_descriptionforSymbolicConstant
{
  id result = [(NSLayoutConstraint *)self _symbolicConstant];
  if (result)
  {
    id v4 = result;
    uint64_t v6 = 0;
    if ([(NSLayoutConstraint *)self _effectiveConstant:&v6 error:0]) {
      return (id)objc_msgSend(v4, "stringByAppendingFormat:", @"(%g)", v6);
    }
    else {
      return (id)objc_msgSend(v4, "stringByAppendingFormat:", @"(unresolvable)", v5);
    }
  }
  return result;
}

- (id)_constantDescriptionForDTrace
{
  uint64_t v4 = 0;
  if ([(NSLayoutConstraint *)self _effectiveConstant:&v4 error:0])
  {
    uint64_t v2 = v4;
  }
  else
  {
    uint64_t v4 = 0x7FF8000000000000;
    uint64_t v2 = 0x7FF8000000000000;
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%g", v2, v4);
}

- (void)asciiArtDescription
{
  if (!a1) {
    return 0;
  }
  unsigned int v2 = [a1 _constraintType];
  int v3 = (void *)[a1[2] _constraintItem];
  uint64_t v4 = [a1[3] _constraintItem];
  uint64_t v5 = 0;
  if (v2 <= 0xA && ((1 << v2) & 0x63C) != 0)
  {
    uint64_t v5 = 0;
    if (v3)
    {
      uint64_t v6 = (void *)v4;
      if (v4)
      {
        uint64_t v7 = [a1[2] _constraintAttribute];
        unsigned int v8 = [a1[3] _constraintAttribute];
        uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @"(");
        uint64_t v10 = [a1 relation];
        switch(v10)
        {
          case 1:
            uint64_t v11 = @">=";
            break;
          case 0:
LABEL_13:
            if ([a1 _descriptionforSymbolicConstant])
            {
              objc_msgSend(v9, "appendString:", objc_msgSend(a1, "_descriptionforSymbolicConstant"));
            }
            else
            {
              [a1 constant];
              objc_msgSend(v9, "appendFormat:", @"%g", v12);
            }
            [a1 priority];
            if (v13 != 1000.0)
            {
              [a1 priority];
              objc_msgSend(v9, "appendFormat:", @"@%g", v14);
            }
            [v9 appendString:@""]);
            double v15 = (void *)[MEMORY[0x1E4F28E78] string];
            uint64_t v5 = v15;
            uint64_t v16 = @"H:";
            if (v7 <= 0x25 && ((1 << v7) & 0x2A00119D19) != 0) {
              uint64_t v16 = @"V:";
            }
            [v15 appendString:v16];
            switch(v2)
            {
              case 2u:
                [v5 appendFormat:@"[%@]-%@-[%@]", objc_msgSend(v6, "nsli_description"), v9, objc_msgSend(v3, "nsli_description")];
                goto LABEL_36;
              case 3u:
                goto LABEL_27;
              case 4u:
                goto LABEL_31;
              case 5u:
                [v5 appendFormat:@"[%@%@]", objc_msgSend(v3, "nsli_description"), v9, v20];
                goto LABEL_36;
              case 9u:
                if (v7 > 0x25
                  || ((1 << v7) & 0x2A00119D19) == 0
                  || (objc_msgSend((id)objc_msgSend(v3, "nsli_superitem"), "nsli_isFlipped") & 1) != 0)
                {
LABEL_27:
                  double v17 = v3;
                  goto LABEL_35;
                }
                double v18 = v3;
                goto LABEL_33;
              case 0xAu:
                if (v8 <= 0x25 && ((1 << v8) & 0x2A00119D19) != 0 && (objc_msgSend(v3, "nsli_isFlipped") & 1) == 0)
                {
                  double v17 = v6;
LABEL_35:
                  [v5 appendFormat:@"|-%@-[%@]", v9, objc_msgSend(v17, "nsli_description"), v20];
                }
                else
                {
LABEL_31:
                  double v18 = v6;
LABEL_33:
                  [v5 appendFormat:@"[%@]-%@-|", objc_msgSend(v18, "nsli_description"), v9, v20];
                }
LABEL_36:
                if ((unint64_t)(v7 - 1) <= 1) {
                  [v5 appendString:@"(LTR)"];
                }

                break;
              default:
                goto LABEL_36;
            }
            return v5;
          case -1:
            uint64_t v11 = @"<=";
            break;
          default:
            uint64_t v11 = @"?=";
            break;
        }
        [v9 appendString:v11];
        goto LABEL_13;
      }
    }
  }
  return v5;
}

- (id)_priorityDescription
{
  [(NSLayoutConstraint *)self priority];
  if (v3 == 1000.0) {
    return &stru_1EFB3B738;
  }
  uint64_t v4 = NSString;
  [(NSLayoutConstraint *)self priority];
  return (id)objc_msgSend(v4, "stringWithFormat:", @"priority:%g", v5);
}

- (id)descriptionAccessory
{
  return 0;
}

- (uint64_t)equationDescription
{
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  unsigned int v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [*(id *)(v1 + 16) _equationDescriptionInParent];
  uint64_t v4 = &stru_1EFB3B738;
  [v2 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@%@", &stru_1EFB3B738, v3)];
  unint64_t v5 = ((uint64_t)((unint64_t)*(unsigned int *)(v1 + 66) << 62) >> 62) + 1;
  if (v5 > 2) {
    uint64_t v6 = @"?=";
  }
  else {
    uint64_t v6 = off_1E5C574A0[v5];
  }
  [v2 addObject:v6];
  uint64_t v7 = *(void **)(v1 + 24);
  if (v7)
  {
    float v8 = *(float *)(v1 + 72);
    if (v8 < 0.0) {
      uint64_t v4 = @"-";
    }
    uint64_t v9 = [v7 _equationDescriptionInParent];
    float v10 = fabsf(v8);
    if (v10 == 1.0) {
      uint64_t v11 = [NSString stringWithFormat:@"%@%@", v4, v9, v18];
    }
    else {
      uint64_t v11 = [NSString stringWithFormat:@"%@%g*%@", v4, v10, v9];
    }
    [v2 addObject:v11];
  }
  if (objc_msgSend((id)objc_msgSend((id)v1, "_descriptionforSymbolicConstant"), "length"))
  {
    uint64_t v12 = [(id)v1 _descriptionforSymbolicConstant];
LABEL_22:
    [v2 addObject:v12];
    goto LABEL_23;
  }
  if (!*(void *)(v1 + 24) || ([(id)v1 constant], v13 != 0.0))
  {
    [(id)v1 constant];
    if (v14 >= 0.0)
    {
      if (!*(void *)(v1 + 24))
      {
LABEL_21:
        uint64_t v16 = NSString;
        [(id)v1 constant];
        uint64_t v12 = objc_msgSend(v16, "stringWithFormat:", @"%g", fabs(v17));
        goto LABEL_22;
      }
      double v15 = @"+";
    }
    else
    {
      double v15 = @"-";
    }
    [v2 addObject:v15];
    goto LABEL_21;
  }
LABEL_23:
  return [v2 componentsJoinedByString:@" "];
}

- (uint64_t)_deallocSafeDescription
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    unsigned int v2 = NSString;
    uint64_t v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    uint64_t v5 = [v1 identifier];
    uint64_t v6 = &stru_1EFB3B738;
    if (v5) {
      uint64_t v6 = (__CFString *)v5;
    }
    return [v2 stringWithFormat:@"<%s:%p %@>", Name, v1, v6];
  }
  return result;
}

- (NSString)description
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  [v3 addObject:objc_msgSend(v4, "stringWithFormat:", @"<%s:%p", class_getName(v5), self)];
  id v6 = [(NSLayoutConstraint *)self descriptionAccessory];
  if (v6) {
    [v3 addObject:v6];
  }
  if ([(NSLayoutConstraint *)self identifier]) {
    [v3 addObject:objc_msgSend(NSString, "stringWithFormat:", @"'%@'", -[NSLayoutConstraint identifier](self, "identifier"))];
  }
  uint64_t v7 = (uint64_t)-[NSLayoutConstraint asciiArtDescription]((id *)&self->super.isa);
  if (!v7) {
    uint64_t v7 = -[NSLayoutConstraint equationDescription]((uint64_t)self);
  }
  [v3 addObject:v7];
  id v8 = [(NSLayoutConstraint *)self _priorityDescription];
  if ([v8 length]) {
    [v3 addObject:v8];
  }
  int v9 = [(NSLayoutConstraint *)self _constraintType] - 3;
  if v9 <= 7 && ((0xC3u >> v9)) {
    float v10 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.isa + qword_1A64B9458[v9]), "_constraintItem"), "nsli_superitem");
  }
  else {
    float v10 = 0;
  }
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithOrderedSet:", objc_msgSend(self->_firstAnchor, "_equationDescriptionLegendEntries"));
  id secondAnchor = self->_secondAnchor;
  if (secondAnchor) {
    objc_msgSend(v11, "unionOrderedSet:", objc_msgSend(secondAnchor, "_equationDescriptionLegendEntries"));
  }
  if (v10)
  {
    double v13 = NSString;
    char v14 = objc_msgSend(v10, "nsli_descriptionIncludesPointer");
    double v15 = objc_msgSend(v10, "nsli_description");
    if ((v14 & 1) == 0) {
      double v15 = objc_msgSend(v15, "stringByAppendingFormat:", @":%p", v10);
    }
    [v11 addObject:objc_msgSend(v13, "stringWithFormat:", @"'|':%@", v15)];
  }
  uint64_t v16 = NSString;
  if ([(NSLayoutConstraint *)self isActive]) {
    double v17 = @"active";
  }
  else {
    double v17 = @"inactive";
  }
  uint64_t v18 = [v11 count];
  double v19 = @",";
  if (!v18) {
    double v19 = @"");
  }
  objc_msgSend(v3, "addObject:", objc_msgSend(v16, "stringWithFormat:", @"  (%@%@"), v17, v19);
  if ([v11 count])
  {
    [v3 addObject:@"names:"];
    [v3 addObject:objc_msgSend((id)objc_msgSend(v11, "array"), "componentsJoinedByString:", @", ")];
    [v3 addObject:@""]);
  }
  uint64_t v20 = (void *)[v3 componentsJoinedByString:@" "];
  return (NSString *)[v20 stringByAppendingString:@">"];
}

+ (void)_setLegacyDecodingOnly:(BOOL)a3
{
  gLegacyDecodingOnly = a3;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    unint64_t v26 = NSString;
    float v27 = NSStringFromSelector(a2);
    double v28 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(v26, "stringWithFormat:", @"%@ - only keyed coders are supported by %@", v27, objc_opt_class()), 0 reason userInfo];
    objc_exception_throw(v28);
  }
  double constant = self->_constant;
  uint64_t v7 = (void *)[self->_firstAnchor _constraintItem];
  uint64_t v8 = [self->_firstAnchor _constraintAttribute];
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    [a3 encodeObject:self->_firstAnchor forKey:@"NSFirstAnchor"];
  }
  else
  {
    uint64_t v10 = v8;
    [a3 encodeObject:v7 forKey:@"NSFirstItem"];
    [a3 encodeInteger:v10 forKey:@"NSFirstAttributeV2"];
    uint64_t v11 = v10;
    if ((v10 - 13) <= 7)
    {
      uint64_t v11 = v10;
      if ((unint64_t)(v10 - 13) <= 7) {
        uint64_t v11 = qword_1A64B9498[v10 - 13];
      }
    }
    [a3 encodeInteger:v11 forKey:@"NSFirstAttribute"];
    char v12 = objc_opt_respondsToSelector();
    if (v10 - 13) <= 7 && (v12)
    {
      objc_msgSend(v7, "nsli_marginOffsetForAttribute:", v10);
      double constant = constant - v13;
    }
  }
  if ((((unint64_t)*(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) << 46) & 0xC00000000000) != 0) {
    [a3 encodeInt:(uint64_t)((unint64_t)*(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) << 62) >> 62 forKey:@"NSRelation"];
  }
  float coefficient = self->_coefficient;
  if (coefficient != 1.0) {
    [a3 encodeDouble:@"NSMultiplier" forKey:coefficient];
  }
  id secondAnchor = self->_secondAnchor;
  if (secondAnchor)
  {
    uint64_t v16 = (void *)[secondAnchor _constraintItem];
    uint64_t v17 = [self->_secondAnchor _constraintAttribute];
    if (v16 && (uint64_t v18 = v17) != 0)
    {
      [a3 encodeObject:v16 forKey:@"NSSecondItem"];
      [a3 encodeInteger:v18 forKey:@"NSSecondAttributeV2"];
      uint64_t v19 = v18;
      if ((v18 - 13) <= 7)
      {
        uint64_t v19 = v18;
        if ((unint64_t)(v18 - 13) <= 7) {
          uint64_t v19 = qword_1A64B9498[v18 - 13];
        }
      }
      [a3 encodeInteger:v19 forKey:@"NSSecondAttribute"];
      char v20 = objc_opt_respondsToSelector();
      if (v18 - 13) <= 7 && (v20)
      {
        objc_msgSend(v16, "nsli_marginOffsetForAttribute:", v18);
        double constant = constant + v21;
      }
    }
    else
    {
      [a3 encodeObject:self->_secondAnchor forKey:@"NSSecondAnchor"];
    }
  }
  if (self->_constant != 0.0) {
    objc_msgSend(a3, "encodeDouble:forKey:", @"NSConstantV2");
  }
  id v22 = [(NSLayoutConstraint *)self _symbolicConstant];
  if (v22)
  {
    [a3 encodeObject:v22 forKey:@"NSSymbolicConstant"];
    [(NSLayoutConstraint *)self symbolicConstantMultiplier];
    if (v23 != 1.0) {
      objc_msgSend(a3, "encodeDouble:forKey:", @"NSSymbolicConstantMultiplier");
    }
  }
  [a3 encodeBool:((unint64_t)*(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) >> 3) & 1 forKey:@"NSShouldBeArchived"];
  float priority = self->_priority;
  if (priority != 1000.0) {
    [a3 encodeInt:(int)priority forKey:@"NSPriority"];
  }
  id v25 = [(NSLayoutConstraint *)self _identifier];
  if (v25) {
    [a3 encodeObject:v25 forKey:@"NSLayoutIdentifier"];
  }
  if (constant != 0.0)
  {
    [a3 encodeDouble:@"NSConstant" forKey:constant];
  }
}

- (id)_constraintByReplacingItem:(id)a3 withItem:(id)a4
{
  id v6 = self;
  if ([(NSLayoutConstraint *)self firstItem] == a3
    || [(NSLayoutConstraint *)v6 secondItem] == a3)
  {
    id v7 = a4;
    if ([(NSLayoutConstraint *)v6 firstItem] != a3) {
      id v7 = [(NSLayoutConstraint *)v6 firstItem];
    }
    if ([(NSLayoutConstraint *)v6 secondItem] != a3) {
      a4 = [(NSLayoutConstraint *)v6 secondItem];
    }
    uint64_t v8 = [(NSLayoutConstraint *)v6 _symbolicConstant];
    BOOL v9 = objc_opt_class();
    uint64_t v10 = [(NSLayoutConstraint *)v6 firstAttribute];
    uint64_t v11 = [(NSLayoutConstraint *)v6 relation];
    uint64_t v12 = [(NSLayoutConstraint *)v6 secondAttribute];
    [(NSLayoutConstraint *)v6 multiplier];
    double v14 = v13;
    if (v8)
    {
      uint64_t v15 = [(NSLayoutConstraint *)v6 _symbolicConstant];
      [(NSLayoutConstraint *)v6 symbolicConstantMultiplier];
      uint64_t v17 = [v9 constraintWithItem:v7 attribute:v10 relatedBy:v11 toItem:a4 attribute:v12 multiplier:v15 symbolicConstant:v14 symbolicConstantMultiplier:v16];
    }
    else
    {
      [(NSLayoutConstraint *)v6 constant];
      uint64_t v17 = [v9 constraintWithItem:v7 attribute:v10 relatedBy:v11 toItem:a4 attribute:v12 multiplier:v14 constant:v18];
    }
    uint64_t v19 = (void *)v17;
    [(NSLayoutConstraint *)v6 priority];
    objc_msgSend(v19, "setPriority:");
    objc_msgSend(v19, "setShouldBeArchived:", -[NSLayoutConstraint shouldBeArchived](v6, "shouldBeArchived"));
    objc_msgSend(v19, "setIdentifier:", -[NSLayoutConstraint identifier](v6, "identifier"));
    objc_msgSend(v19, "setAnimations:", -[NSLayoutConstraint animations](v6, "animations"));
    return v19;
  }
  return v6;
}

- (NSSet)_referencedLayoutItems
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:2 capacity:0];
  [(NSLayoutAnchor *)[(NSLayoutConstraint *)self firstAnchor] _accumulateReferenceLayoutItemsIntoTable:v3];
  [(NSLayoutAnchor *)[(NSLayoutConstraint *)self secondAnchor] _accumulateReferenceLayoutItemsIntoTable:v3];
  return (NSSet *)[v3 setRepresentation];
}

- (BOOL)_describesSameRestrictionAsConstraint:(id)a3
{
  return [(NSLayoutConstraint *)self _isEqualToConstraintValue:a3 includingConstant:1 includeOtherMutableProperties:1];
}

- (unint64_t)_constraintValueHashIncludingConstant:(BOOL)a3 includeOtherMutableProperties:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double constant = self->_constant;
  if (a3) {
    uint64_t v8 = objc_msgSend(-[NSLayoutConstraint _symbolicConstant](self, "_symbolicConstant"), "hash");
  }
  else {
    uint64_t v8 = 0;
  }
  float coefficient = self->_coefficient;
  float priority = self->_priority;
  unint64_t v11 = *(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) | ((unint64_t)HIWORD(self->_layoutConstraintFlags) << 32);
  uint64_t v12 = [self->_firstAnchor hash];
  uint64_t v13 = [self->_secondAnchor hash];
  if (v4)
  {
    uint64_t v14 = objc_msgSend(-[NSLayoutConstraint _identifier](self, "_identifier"), "hash");
    unint64_t v15 = *(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) | ((unint64_t)HIWORD(self->_layoutConstraintFlags) << 32);
    uint64_t v16 = objc_msgSend(-[NSLayoutConstraint animations](self, "animations"), "hash");
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    unint64_t v15 = *(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) | ((unint64_t)HIWORD(self->_layoutConstraintFlags) << 32);
  }
  return _NSLayoutConstraintComparableHash(v5, v4, v8, (uint64_t)(v11 << 62) >> 62, v12, v13, v14, (v15 >> 3) & 1, constant, coefficient, priority, v16);
}

- (void)_setMutablePropertiesFromConstraint:(id)a3
{
  char isKindOfClass = objc_opt_isKindOfClass();
  double constant = self->_constant;
  [a3 constant];
  if (constant != v7
    || ((id v8 = [(NSLayoutConstraint *)self _symbolicConstant], (isKindOfClass & 1) == 0)
     && (objc_opt_respondsToSelector() & 1) == 0
      ? (uint64_t v9 = 0)
      : (uint64_t v9 = [a3 _symbolicConstant]),
        v8 != (id)v9 && (objc_msgSend(v8, "isEqual:") & 1) == 0))
  {
    if (isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector())
    {
      uint64_t v10 = (void *)[a3 _symbolicConstant];
      [a3 constant];
      double v12 = v11;
      if (isKindOfClass) {
        goto LABEL_14;
      }
    }
    else
    {
      [a3 constant];
      double v12 = v13;
      uint64_t v10 = 0;
    }
    char v14 = objc_opt_respondsToSelector();
    double v15 = 1.0;
    if ((v14 & 1) == 0)
    {
LABEL_15:
      -[NSLayoutConstraint _setSymbolicConstant:constant:symbolicConstantMultiplier:](self, v10, v12, v15);
      goto LABEL_16;
    }
LABEL_14:
    [a3 symbolicConstantMultiplier];
    double v15 = v16;
    goto LABEL_15;
  }
LABEL_16:
  uint64_t v17 = [(NSLayoutConstraint *)self identifier];
  if (isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector()) {
    uint64_t v18 = [a3 _identifier];
  }
  else {
    uint64_t v18 = 0;
  }
  if (v17 != (NSString *)v18 && (-[NSString isEqual:](v17, "isEqual:") & 1) == 0)
  {
    if (isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector()) {
      uint64_t v19 = [a3 _identifier];
    }
    else {
      uint64_t v19 = 0;
    }
    [(NSLayoutConstraint *)self setIdentifier:v19];
  }
  if (isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector()) {
    uint64_t v20 = [a3 shouldBeArchived];
  }
  else {
    uint64_t v20 = 0;
  }
  [(NSLayoutConstraint *)self setShouldBeArchived:v20];
  id v21 = [(NSLayoutConstraint *)self animations];
  if (isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector()) {
    uint64_t v22 = [a3 animations];
  }
  else {
    uint64_t v22 = 0;
  }
  if (v21 != (id)v22 && (objc_msgSend(v21, "isEqual:") & 1) == 0)
  {
    if (isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector()) {
      uint64_t v23 = [a3 animations];
    }
    else {
      uint64_t v23 = 0;
    }
    [(NSLayoutConstraint *)self setAnimations:v23];
  }
}

- (id)_constraintValueCopy
{
  id v3 = (char *)objc_alloc_init((Class)objc_opt_class());
  *(_DWORD *)(v3 + 66) |= 0x40u;
  [v3 _setFirstAnchor:self->_firstAnchor];
  [v3 _setRelation:(uint64_t)((unint64_t)*(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) << 62) >> 62];
  [v3 _setMultiplier:self->_coefficient];
  [v3 _setSecondAnchor:self->_secondAnchor];
  id v4 = [(NSLayoutConstraint *)self _symbolicConstant];
  double constant = self->_constant;
  [(NSLayoutConstraint *)self symbolicConstantMultiplier];
  -[NSLayoutConstraint _setSymbolicConstant:constant:symbolicConstantMultiplier:](v3, v4, constant, v6);
  *(float *)&double v7 = self->_priority;
  [v3 setPriority:v7];
  objc_msgSend(v3, "setIdentifier:", -[NSLayoutConstraint _identifier](self, "_identifier"));
  objc_msgSend(v3, "setShouldBeArchived:", -[NSLayoutConstraint shouldBeArchived](self, "shouldBeArchived"));
  objc_msgSend(v3, "setAnimations:", -[NSLayoutConstraint animations](self, "animations"));
  ConstraintDidPerformInitialSetup((uint64_t)v3);
  return v3;
}

- (CGSize)_engineToContainerScalingCoefficients
{
  id container = self->_container;
  if (container)
  {
    objc_msgSend(container, "nsli_convertSizeFromEngineSpace:", 1.0, 1.0);
  }
  else
  {
    double v3 = 1.0;
    double v4 = 1.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_loweredExpression
{
  double v3 = (NSISEngine *)objc_msgSend(self->_container, "nsli_layoutEngine");
  if (!v3) {
    double v3 = objc_alloc_init(NSISEngine);
  }
  double v4 = [[NSISLinearExpression alloc] initWithEngine:v3];
  if ([(NSLayoutConstraint *)self _lowerIntoExpression:v4 reportingConstantIsRounded:0])
  {
    return v4;
  }
  else
  {
    return 0;
  }
}

- (void)_tryToActivateMeasuringUnsatisfactionChanges:(id *)a3 andMutuallyExclusiveConstraints:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ([(NSLayoutConstraint *)self isActive])
  {
    uint64_t v26 = [NSString stringWithFormat:@"Cannot _tryToActivateMeasuringErrors:andMutuallyExclusiveConstraints:, constraint %@ is already active.", self];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v26 userInfo:0]);
  }
  double v7 = (void *)[(id)-[NSLayoutConstraint _layoutEngine]((uint64_t)self) constraints];
  id v8 = (void *)[MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v7);
        }
        double v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        [v13 unsatisfaction];
        if (v14 != 0.0)
        {
          *(float *)&double v14 = v14;
          objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v14), v13);
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v10);
  }
  id v31 = 0;
  [(NSLayoutConstraint *)self _setActive:1 mutuallyExclusiveConstraints:&v31];
  if ([v31 count])
  {
    if (a4) {
      *a4 = v31;
    }
    if (a3) {
LABEL_15:
    }
      *a3 = 0;
  }
  else
  {
    double v15 = (void *)[(id)-[NSLayoutConstraint _layoutEngine]((uint64_t)self) constraints];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v27 + 1) + 8 * j);
          [v20 unsatisfaction];
          double v22 = v21;
          objc_msgSend((id)objc_msgSend(v8, "objectForKey:", v20), "floatValue");
          double v24 = v22 - v23;
          [v8 removeObjectForKey:v20];
          if (v24 != 0.0)
          {
            *(float *)&double v25 = v24;
            objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v25), v20);
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v17);
    }
    [(NSLayoutConstraint *)self setActive:0];
    if (a3) {
      *a3 = v8;
    }
    a3 = a4;
    if (a4) {
      goto LABEL_15;
    }
  }
}

- (void)_forceSatisfactionMeasuringUnsatisfactionChanges:(id *)a3 andMutuallyExclusiveConstraints:(id *)a4
{
  id firstAnchor = self->_firstAnchor;
  NSLayoutRelation v8 = [(NSLayoutConstraint *)self relation];
  id secondAnchor = self->_secondAnchor;
  [(NSLayoutConstraint *)self multiplier];
  double v11 = v10;
  [(NSLayoutConstraint *)self constant];
  double v13 = +[NSLayoutConstraint constraintWithAnchor:firstAnchor relatedBy:v8 toAnchor:secondAnchor multiplier:v11 constant:v12];
  LODWORD(v14) = 1148846080;
  [(NSLayoutConstraint *)v13 setPriority:v14];
  [(NSLayoutConstraint *)v13 _tryToActivateMeasuringUnsatisfactionChanges:a3 andMutuallyExclusiveConstraints:a4];
  if (*a4)
  {
    id v15 = (id)[*a4 mutableCopy];
    [v15 removeObject:v13];
    *a4 = v15;
  }
}

- (id)_explainUnsatisfaction
{
  unsigned int v2 = [[NSLayoutConstraintExplainer alloc] initWithConstraint:self];
  return v2;
}

- (id)nsis_descriptionOfVariable:(id)a3
{
  if (self->_markerAndPositiveExtraVar == a3)
  {
    if ([a3 valueRestriction] == 2)
    {
      BOOL v5 = @"marker";
    }
    else
    {
      if ([a3 shouldBeMinimized])
      {
        int v6 = [self->_negativeExtraVar shouldBeMinimized];
        double v7 = @"errorMarker";
        NSLayoutRelation v8 = @"posErrorMarker";
LABEL_10:
        if (v6) {
          BOOL v5 = v8;
        }
        else {
          BOOL v5 = v7;
        }
        goto LABEL_15;
      }
      BOOL v5 = @"slackMarker";
    }
  }
  else
  {
    if (self->_negativeExtraVar != a3)
    {
      _NSLayoutConstraintDelegateCallFromUnknownVariable();
      BOOL v5 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"<unknown var (bug!):%p>", a3);
      goto LABEL_15;
    }
    if ([a3 shouldBeMinimized])
    {
      int v6 = [self->_markerAndPositiveExtraVar shouldBeMinimized];
      double v7 = @"error";
      NSLayoutRelation v8 = @"negError";
      goto LABEL_10;
    }
    BOOL v5 = @"slack";
  }
LABEL_15:
  uint64_t v9 = [(NSLayoutConstraint *)self identifier];
  if (v9) {
    return (id)[NSString stringWithFormat:@"%p:%@.%@", self, v9, v5];
  }
  else {
    return (id)[NSString stringWithFormat:@"%p.%@", self, v5, v11];
  }
}

- (BOOL)_nsib_isRedundantInEngine:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v38 = 0;
  [a3 optimize];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = +[NSISLinearExpression acquireFromPoolForUseCase:0 engine:a3];
  [(NSLayoutConstraint *)self _lowerIntoExpression:v7 reportingConstantIsRounded:&v38];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __48__NSLayoutConstraint__nsib_isRedundantInEngine___block_invoke;
  v37[3] = &unk_1E5C57418;
  v37[4] = v5;
  v37[5] = v6;
  v37[6] = a3;
  [v7 enumerateVariables:v37];
  [v7 returnToPool];
  [(NSLayoutConstraint *)self _removeFromEngine:a3];
  [a3 optimize];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v8 = [v5 countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v34;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8 * v12);
        objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", v10 + v12), "doubleValue");
        double v15 = v14;
        [a3 valueForVariable:v13];
        if (v16 == 0.0)
        {
          double v17 = fabs(v15);
          double v18 = *(double *)&NSISEpsilon;
          goto LABEL_8;
        }
        double v19 = fabs(v16);
        if (v15 != 0.0)
        {
          double v17 = vabdd_f64(v16, v15);
          double v18 = v19 * *(double *)&NSISEpsilon;
LABEL_8:
          if (v17 >= v18) {
            goto LABEL_25;
          }
          goto LABEL_12;
        }
        if (v19 >= *(double *)&NSISEpsilon)
        {
LABEL_25:
          BOOL v26 = 0;
          goto LABEL_26;
        }
LABEL_12:
        ++v12;
      }
      while (v9 != v12);
      uint64_t v20 = [v5 countByEnumeratingWithState:&v33 objects:v40 count:16];
      uint64_t v9 = v20;
      v10 += v12;
    }
    while (v20);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v21 = [v5 countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v30;
    unint64_t v24 = 0x1E5C56000uLL;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v5);
        }
        if ([a3 valueOfVariableIsAmbiguous:*(void *)(*((void *)&v29 + 1) + 8 * i)])
        {
          BOOL v26 = 0;
          goto LABEL_28;
        }
      }
      uint64_t v22 = [v5 countByEnumeratingWithState:&v29 objects:v39 count:16];
      BOOL v26 = 1;
      if (v22) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v26 = 1;
LABEL_26:
    unint64_t v24 = 0x1E5C56000;
  }
LABEL_28:
  long long v27 = (void *)[*(id *)(v24 + 1728) acquireFromPoolForUseCase:0 engine:a3];
  [(NSLayoutConstraint *)self _lowerIntoExpression:v27 reportingConstantIsRounded:&v38];
  -[NSLayoutConstraint _addLoweredExpression:toEngine:lastLoweredConstantWasRounded:mutuallyExclusiveConstraints:]((uint64_t)self, v27, a3, v38, 0);
  [v27 returnToPool];

  return v26;
}

uint64_t __48__NSLayoutConstraint__nsib_isRedundantInEngine___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 valueIsUserVisible];
  if (result)
  {
    [*(id *)(a1 + 32) addObject:a2];
    id v5 = NSNumber;
    id v6 = *(void **)(a1 + 40);
    [*(id *)(a1 + 48) valueForVariable:a2];
    uint64_t v7 = objc_msgSend(v5, "numberWithDouble:");
    return [v6 addObject:v7];
  }
  return result;
}

- (BOOL)_nsib_isRedundant
{
  uint64_t v3 = objc_msgSend(-[NSLayoutConstraint container](self, "container"), "nsli_layoutEngine");
  return [(NSLayoutConstraint *)self _nsib_isRedundantInEngine:v3];
}

+ (NSLayoutConstraint)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 multiplier:(double)a8 symbolicConstant:(id)a9
{
  return (NSLayoutConstraint *)[a1 constraintWithItem:a3 attribute:a4 relatedBy:a5 toItem:a6 attribute:a7 multiplier:a9 symbolicConstant:a8 symbolicConstantMultiplier:1.0];
}

+ (NSLayoutConstraint)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 multiplier:(double)a8
{
  return (NSLayoutConstraint *)[a1 constraintWithItem:a3 attribute:a4 relatedBy:a5 toItem:a6 attribute:a7 multiplier:a8 constant:0.0];
}

+ (NSLayoutConstraint)constraintWithAnchor:(id)a3 relatedBy:(int64_t)a4 constant:(double)a5
{
  return (NSLayoutConstraint *)[a1 constraintWithAnchor:a3 relatedBy:a4 toAnchor:0 multiplier:0.0 constant:a5];
}

@end