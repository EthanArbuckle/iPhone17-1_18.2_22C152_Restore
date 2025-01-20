@interface NSISEngine
+ (BOOL)_dbg_anyEngineContainsVariable:(id)a3;
+ (NSString)traceFileSuffix;
+ (void)setEnableEngineTrace:(BOOL)a3;
+ (void)setLogOnInvalidUseFromBGThread:(BOOL)a3;
- ($738B17BD11CC339B30296C0EA03CEC2B)engineVarIndexForVariable:(id)a3;
- ($918B3F39C841E394E687484E57A87E10)traceState;
- (BOOL)_dirtyListContainsObservable:(BOOL)result;
- (BOOL)_dirtyListContainsObservation:(BOOL)result;
- (BOOL)chooseHeadForRow:(uint64_t)a3 chosenCol:(_OWORD *)a4 outNewToEngine:(char *)a5;
- (BOOL)containsVariable:(id)a3;
- (BOOL)exerciseAmbiguityInVariable:(id)a3;
- (BOOL)hasObservableForVariable:(id)a3;
- (BOOL)hasValue:(double *)a3 forExpression:(id)a4;
- (BOOL)hasValue:(double *)a3 forVariable:(id)a4;
- (BOOL)hasValueForPossiblyDeallocatedVariable:(id)a3;
- (BOOL)incoming:(_OWORD *)a3 andOutgoing:(unsigned char *)a4 foundOutgoing:(uint64_t)a5 rowHeadsThatMakeValueAmbiguousForVariable:(uint64_t)a6;
- (BOOL)isObservingChangesForVariable:(id)a3;
- (BOOL)isOptimizationInProgress;
- (BOOL)negativeErrorVarForBrokenConstraintWithMarker:(uint64_t *)a3 errorVar:;
- (BOOL)nsis_valueOfVariableIsUserObservable:(id)a3;
- (BOOL)outgoingRowHeadForRemovingConstraintWithMarker:(uint64_t)a3 outgoingRowHead:(_OWORD *)a4;
- (BOOL)positiveErrorVarForBrokenConstraintWithMarker:(uint64_t *)a3 errorVar:;
- (BOOL)revertsAfterUnsatisfiabilityHandler;
- (BOOL)shouldIntegralize;
- (BOOL)tryAddingDirectly:(uint64_t)a3;
- (BOOL)tryToAddConstraintWithMarker:(id)a3 expression:(id)a4 mutuallyExclusiveConstraints:(id *)a5;
- (BOOL)tryToChangeConstraintSuchThatMarker:(id)a3 isReplacedByMarkerPlusDelta:(double)a4 undoHandler:(id)a5;
- (BOOL)valueOfVariableIsAmbiguous:(id)a3;
- (CGSize)engineScalingCoefficients;
- (NSISEngine)init;
- (NSISEngineDelegate)delegate;
- (NSISObjectiveLinearExpression)artificialObjectiveRowBody;
- (NSISVariable)artificialObjectiveRowHead;
- (NSISVariable)artificialRowHead;
- (NSISVariable)errorVariableIntroducedByBreakingConstraintWithMarker:(int)a3 errorIsPositive:;
- (NSMutableArray)variablesWithValueRestrictionViolations;
- (NSString)description;
- (double)enumerateCols:(void *)a1;
- (double)enumerateEngineVars:(void *)a1;
- (double)integralizationAdjustmentForMarker:(id)a3;
- (double)valueForEngineVar:(uint64_t)a3;
- (double)valueForExpression:(id)a3;
- (double)valueForVariable:(id)a3;
- (id)_brokenConstraintNegativeErrorsIfAvailable;
- (id)_brokenConstraintPositiveErrorsIfAvailable;
- (id)allVariableValues;
- (id)candidateRedundantConstraints;
- (id)constraints;
- (id)constraintsAffectingValueOfVariable:(id)a3;
- (id)nsis_descriptionOfVariable:(id)a3;
- (id)observableForVariable:(id)a3;
- (id)recordedCommandsData;
- (id)variableChangeTransactionSignal;
- (id)variableForEngineVarIndex:(id)a3;
- (int)nsis_orientationHintForVariable:(id)a3;
- (int)valueRestrictionForEngineVarIndex:(id)a3;
- (uint64_t)_brokenConstraintNegativeErrors;
- (uint64_t)_brokenConstraintPositiveErrors;
- (uint64_t)_coreReplaceMarker:(double)a3 withMarkerPlusDelta:;
- (uint64_t)_dirtyListPrependObservable:(uint64_t)result;
- (uint64_t)_dirtyListRemoveObservable:(uint64_t)result;
- (uint64_t)_optimizeIfNotDisabled;
- (uint64_t)_tryToAddConstraintWithMarkerEngineVar:(id *)a3 row:(uint64_t)a4 mutuallyExclusiveConstraints:(uint64_t)a5;
- (uint64_t)allRowHeads;
- (uint64_t)bodyVarIsAmbiguous:(uint64_t)a3 withPivotOfOutgoingRowHead:(uint64_t)a4 foundOutgoingRowHead:(unsigned char *)a5;
- (uint64_t)fixUpValueRestrictionViolationsWithInfeasibilityHandlingBehavior:(uint64_t)result;
- (uint64_t)handleUnsatisfiableRow:(uint64_t)a3 usingInfeasibilityHandlingBehavior:(uint64_t)a4 prospectiveRowHead:(uint64_t *)a5 mutuallyExclusiveConstraints:(void *)a6;
- (uint64_t)hasValue:(uint64_t)a3 forEngineVar:(uint64_t)a4;
- (uint64_t)markerForBrokenConstraintWithNegativeErrorVar:(void *)a1;
- (uint64_t)markerForBrokenConstraintWithPositiveErrorVar:(void *)a1;
- (uint64_t)nsis_shouldIntegralizeVariable:;
- (uint64_t)rebuildFromConstraints;
- (uint64_t)tryToOptimizeReturningMutuallyExclusiveConstraints;
- (uint64_t)tryUsingArtificialVariableToAddConstraintWithMarker:(id *)a3 row:(uint64_t)a4 usingInfeasibilityHandlingBehavior:(uint64_t)a5 mutuallyExclusiveConstraints:(uint64_t)a6;
- (unint64_t)_optimizeWithoutRebuilding;
- (unint64_t)colCount;
- (unint64_t)optimize;
- (unint64_t)pivotCount;
- (unint64_t)replayCommandsData:(id)a3 verifyingIntegrity:(BOOL)a4;
- (unint64_t)rowCount;
- (unint64_t)variableChangeCount;
- (unsigned)copyExpressionSubstitutingRowHeadVariables:(uint64_t)a3 intoRow:(uint64_t)a4;
- (void)_addObjectiveRow;
- (void)_dirtyListPrependObservation:(void *)result;
- (void)_dirtyListRemoveObservation:(uint64_t)a1;
- (void)_disambiguateFrame:(void *)a3 forAmbiguousItem:(double)a4 withOldFrame:(double)a5;
- (void)_flushPendingRemovals;
- (void)_removeAllVariables;
- (void)addVariableToBeOptimized:(id)a3 priority:(double)a4;
- (void)beginBookkeepingForVariableIfNeeded:(id)a3;
- (void)beginRecording;
- (void)changeVariableToBeOptimized:(id)a3 fromPriority:(double)a4 toPriority:(double)a5;
- (void)constraintDidChangeSuchThatMarker:(id)a3 shouldBeReplacedByMarkerPlusDelta:(double)a4;
- (void)dealloc;
- (void)endBookkeepingForVariableIfUnused:(id)a3;
- (void)enumerateOriginalConstraints:(void *)a1;
- (void)enumerateRows:(id)a3;
- (void)performModifications:(id)a3 withUnsatisfiableConstraintsHandler:(id)a4;
- (void)performPendingChangeNotifications;
- (void)performPendingChangeNotificationsForItem:(id)a3;
- (void)removeConstraintWithMarker:(id)a3;
- (void)removeObservableForVariable:(id)a3;
- (void)removeVariableToBeOptimized:(id)a3 priority:(double)a4;
- (void)replaceMarker:(uint64_t)a3 withMarkerPlusCoefficient:(uint64_t)a4 timesCol:(uint64_t)a5;
- (void)setArtificialObjectiveRowBody:(id)a3;
- (void)setArtificialObjectiveRowHead:(id)a3;
- (void)setArtificialRowHead:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEngineScalingCoefficients:(CGSize)a3;
- (void)setNegativeErrorVar:(uint64_t)a3 forBrokenConstraintWithMarker:;
- (void)setPositiveErrorVar:(uint64_t)a3 forBrokenConstraintWithMarker:;
- (void)setRevertsAfterUnsatisfiabilityHandler:(BOOL)a3;
- (void)setShouldIntegralize:(BOOL)a3;
- (void)setVariablesWithValueRestrictionViolations:(id)a3;
- (void)startObservingChangesForVariable:(id)a3;
- (void)stopObservingChangesForVariable:(id)a3;
- (void)verifyInternalIntegrity;
- (void)withAutomaticOptimizationDisabled:(id)a3;
- (void)withBehaviors:(unint64_t)a3 performModifications:(id)a4;
- (void)withDelegateCallsDisabled:(id)a3;
- (void)withoutOptimizingAtEndRunBlockWithAutomaticOptimizationDisabled:(id)a3;
@end

@implementation NSISEngine

- (NSISEngineDelegate)delegate
{
  return self->_delegate;
}

- (CGSize)engineScalingCoefficients
{
  double width = self->_engineScalingCoefficients.width;
  double height = self->_engineScalingCoefficients.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)variableChangeCount
{
  return self->_variableChangeCount;
}

- (void)beginBookkeepingForVariableIfNeeded:(id)a3
{
}

- (BOOL)tryToAddConstraintWithMarker:(id)a3 expression:(id)a4 mutuallyExclusiveConstraints:(id *)a5
{
  _AssertAutoLayoutOnAllowedThreadsOnly((uint64_t)self);
  ++self->_totalChangeCount;
  -[NSISEngine _flushPendingRemovals]();
  recordedOperations = self->_recordedOperations;
  if (recordedOperations)
  {
    [NSNumber numberWithBool:a5 != 0];
    _NSISRecordOperation(recordedOperations, a2, v11, v12, v13, v14, v15, v16, a3, (uint64_t)a4);
  }
  if (_NSConstraintBasedLayoutDebug()) {
    NSLog(&cfstr_EnginePAddingC.isa, self, [a3 markedConstraint]);
  }
  id v43 = a4;
  if (_NSConstraintBasedLayoutDebugEngineConsistency()
    && [(NSISEngine *)self hasValue:0 forVariable:a3])
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSISEngine.m", 2337, @"It's not legal to add a constraint twice.  %@ is already added.", objc_msgSend(a3, "markedConstraint"));
  }
  placeholderHeadForExpressionBeingAdded = self->_placeholderHeadForExpressionBeingAdded;
  v45 = a5;
  uint64_t v17 = _engineVar_addForVariableIfNeeded((uint64_t)self, placeholderHeadForExpressionBeingAdded);
  v19 = (void *)v18;
  if (*(unsigned char *)(v18 + 24))
  {
    v37 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *v19 file lineNumber description];
  }
  v20 = (id **)v19[1];
  rowTables = self->_rowTables;
  int v22 = [a3 orientationHint];
  p_freeIndexes = (unsigned int *)&self->_rowTables[v22].freeIndexes;
  if (!NSBitSetCount((uint64_t)p_freeIndexes)) {
    _table_addStorageBlock((void **)&rowTables[v22].blocks, &rowTables[v22].blocksCount, &rowTables[v22].blocksCapacity, 0x17uLL, 88, p_freeIndexes);
  }
  unint64_t Index = NSBitSetFirstIndex((uint64_t **)p_freeIndexes);
  int v25 = Index;
  NSBitSetRemoveIndex((uint64_t *)p_freeIndexes, Index);
  unsigned int v26 = v25 | (v22 << 30);
  uint64_t v27 = *((void *)rowTables[(v26 >> 30) & 1].blocks + (v26 & 0xBFFFFFFF) / 0x17uLL)
      + 88 * ((v26 & 0xBFFFFFFF) % 0x17);
  *(void *)uint64_t v27 = 0;
  *(_DWORD *)(v27 + 8) = v26;
  *(_DWORD *)(v27 + 12) = 0;
  *(_WORD *)(v27 + 16) = 4;
  *(_OWORD *)(v27 + 18) = 0u;
  *(_OWORD *)(v27 + 34) = 0u;
  *(_OWORD *)(v27 + 50) = 0u;
  *(_OWORD *)(v27 + 66) = 0u;
  *(void *)(v27 + 80) = 0;
  _row_rawSetHead((uint64_t)self, (_DWORD *)v27, v17, v20);
  [(NSISEngine *)(unsigned __int16 *)self copyExpressionSubstitutingRowHeadVariables:(uint64_t)self intoRow:v27];
  uint64_t v28 = 0;
  while (*((NSISEngine **)a3 + v28 + 3) != self)
  {
    if (++v28 == 3) {
      goto LABEL_17;
    }
  }
  unsigned int v29 = *((_DWORD *)a3 + v28 + 12);
  if (v29 != -1) {
    goto LABEL_20;
  }
LABEL_17:
  if (*((void *)a3 + 2)) {
    unsigned int v29 = [a3 overflowEngineVarIndexForEngine:self];
  }
  else {
    unsigned int v29 = -1;
  }
LABEL_20:
  v30 = (id *)(*(void *)((char *)self->_engineVarTable.blocks + (((unint64_t)v29 >> 3) & 0x1FFFFFF8))
             + 32 * (v29 & 0x3F));
  if (*((_DWORD *)v30 + 4) == -1)
  {
    v38 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", a3, self file lineNumber description];
  }
  if (*v30 != a3)
  {
    v39 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *v30, a3 file lineNumber description];
  }
  if ((v19[3] & 1) == 0)
  {
    v40 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISRow _engineVar_row(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 115, @"Tried accessing the row index for a variable that isn't a row head:%@", *v19 file lineNumber description];
  }
  char v31 = -[NSISEngine _tryToAddConstraintWithMarkerEngineVar:row:mutuallyExclusiveConstraints:]((uint64_t)self, (uint64_t)self, v30, v17, v19[1], v45);
  if (placeholderHeadForExpressionBeingAdded)
  {
    uint64_t v32 = 0;
    while (placeholderHeadForExpressionBeingAdded->_engines[v32] != self)
    {
      if (++v32 == 3) {
        goto LABEL_32;
      }
    }
    if (placeholderHeadForExpressionBeingAdded->_engineVarIndexes[v32].value != -1) {
      goto LABEL_34;
    }
LABEL_32:
    if (!placeholderHeadForExpressionBeingAdded->_overflowEngines
      || [(NSISVariable *)placeholderHeadForExpressionBeingAdded overflowEngineVarIndexForEngine:self] == -1)
    {
      return v31;
    }
LABEL_34:
    uint64_t v33 = 0;
    while (placeholderHeadForExpressionBeingAdded->_engines[v33] != self)
    {
      if (++v33 == 3) {
        goto LABEL_39;
      }
    }
    unsigned int value = placeholderHeadForExpressionBeingAdded->_engineVarIndexes[v33].value;
    if (value != -1) {
      goto LABEL_42;
    }
LABEL_39:
    if (placeholderHeadForExpressionBeingAdded->_overflowEngines) {
      unsigned int value = [(NSISVariable *)placeholderHeadForExpressionBeingAdded overflowEngineVarIndexForEngine:self];
    }
    else {
      unsigned int value = -1;
    }
LABEL_42:
    v35 = (uint64_t *)(*(void *)((char *)self->_engineVarTable.blocks + (((unint64_t)value >> 3) & 0x1FFFFFF8))
                    + 32 * (value & 0x3F));
    if (*((_DWORD *)v35 + 4) == -1)
    {
      v41 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v41 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", placeholderHeadForExpressionBeingAdded, self file lineNumber description];
    }
    if ((NSISVariable *)*v35 != placeholderHeadForExpressionBeingAdded)
    {
      v42 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v42 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *v35, placeholderHeadForExpressionBeingAdded file lineNumber description];
    }
    _engineVar_rawRemove((uint64_t)self, v35);
  }
  return v31;
}

- (void)_flushPendingRemovals
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (v0)
  {
    v1 = (unsigned __int8 *)v0;
    v2 = *(void **)(v0 + 16);
    if (v2)
    {
      v3 = *(void **)(v0 + 24);
      *(void *)(v0 + 16) = 0;
      *(void *)(v0 + 24) = 0;
      unint64_t v4 = [v2 count];
      size_t v5 = v4;
      int v6 = v1[157];
      if (v1[157]) {
        v1[157] = 0;
      }
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      uint64_t v16 = __35__NSISEngine__flushPendingRemovals__block_invoke;
      uint64_t v17 = &unk_1E5C56CB0;
      uint64_t v18 = v1;
      if (v4 > 0x1000)
      {
        v7 = malloc_type_malloc(8 * v4, 0x80040B8603338uLL);
        objc_msgSend(v2, "getObjects:range:", v7, 0, v5);
      }
      else
      {
        v7 = v19;
        objc_msgSend(v2, "getObjects:range:", v19, 0, v4);
        if (!v5)
        {
LABEL_21:

          if (v6) {
            v1[157] = 1;
          }
          return;
        }
      }
      uint64_t v12 = v3;
      uint64_t v13 = MEMORY[0x1E4F143A8];
      size_t v8 = v5;
      do
      {
        __compar[0] = v13;
        __compar[1] = 3221225472;
        __compar[2] = __35__NSISEngine__flushPendingRemovals__block_invoke_2;
        __compar[3] = &unk_1E5C56CD8;
        __compar[4] = v15;
        if (v8 == v5) {
          qsort_b(v7, v5, 8uLL, __compar);
        }
        else {
          mergesort_b(v7, v8, 8uLL, __compar);
        }
        unint64_t v9 = 0;
        uint64_t v10 = 8 * v8 - 8;
        while (1)
        {
          uint64_t v11 = *(void *)&v7[v10];
          if (v9 >= 0x19 && (unint64_t)v16((uint64_t)v15, *(void **)&v7[v10]) > 1) {
            break;
          }
          [v1 removeConstraintWithMarker:v11];
          ++v9;
          v10 -= 8;
          if (v8 == v9) {
            goto LABEL_19;
          }
        }
        v8 -= v9;
      }
      while (v8);
LABEL_19:
      v3 = v12;
      if (v7 != v19) {
        free(v7);
      }
      goto LABEL_21;
    }
  }
}

- (uint64_t)hasValue:(uint64_t)a3 forEngineVar:(uint64_t)a4
{
  if (!a1) {
    return 0;
  }
  if (!*(unsigned char *)(a1 + 161) && [MEMORY[0x1E4F29060] isMainThread]) {
    *(unsigned char *)(a1 + 161) = 1;
  }
  if (a2)
  {
    if (*(unsigned char *)(a1 + 158) && !*(unsigned char *)(a1 + 159)) {
      [(id)a1 optimize];
    }
    if (*(unsigned char *)(a4 + 24))
    {
      double v7 = NSISLinExpConstant(*(void *)(a4 + 8) + 16);
LABEL_25:
      *a2 = v7;
      goto LABEL_26;
    }
LABEL_12:
    uint64_t v8 = *(void *)(a4 + 8);
    unint64_t v9 = (uint64_t *)(v8 + 8);
    uint64_t v10 = NSBitSetCount(v8 + 8);
    uint64_t v11 = v8 + 24;
    uint64_t v12 = NSBitSetCount(v11);
    if ((unint64_t)(v12 + v10) <= 1)
    {
      if (v12 + v10 != 1)
      {
        uint64_t v18 = 0;
        goto LABEL_27;
      }
      unsigned int v13 = *(_DWORD *)(*(void *)(a1 + 408) + 8);
      if (HIWORD(v13)) {
        unint64_t v14 = v13 - 0x40000000;
      }
      else {
        unint64_t v14 = v13;
      }
      if (HIWORD(v13)) {
        uint64_t v15 = (uint64_t *)v11;
      }
      else {
        uint64_t v15 = v9;
      }
      int v16 = NSBitSetContainsIndex(v15, v14);
      uint64_t v18 = v16 ^ 1u;
      if (!a2) {
        goto LABEL_27;
      }
      double v7 = 0.0;
      if (v16) {
        goto LABEL_27;
      }
    }
    else
    {
      double v7 = 0.0;
      if (!a2) {
        goto LABEL_26;
      }
    }
    goto LABEL_25;
  }
  if ((*(unsigned char *)(a4 + 24) & 1) == 0) {
    goto LABEL_12;
  }
LABEL_26:
  uint64_t v18 = 1;
LABEL_27:
  if (_NSConstraintBasedLayoutDebugEngineConsistency()) {
    [(id)a1 verifyInternalIntegrity];
  }
  return v18;
}

- (unsigned)copyExpressionSubstitutingRowHeadVariables:(uint64_t)a3 intoRow:(uint64_t)a4
{
  if (result)
  {
    size_t v5 = result;
    int v6 = (uint64_t *)(a4 + 16);
    if (*(unsigned char *)(a4 + 80)) {
      uint64_t v7 = -[NSISObjectiveLinearExpression variableCount](*v6);
    }
    else {
      uint64_t v7 = NSISLinExpVarCount(a4 + 16);
    }
    if (v7 || NSISLinExpConstant((uint64_t)v6) != 0.0) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_copyExpressionSubstitutingRowHeadVariables_intoRow_, v5, @"NSISEngine.m", 1242, @"Should be copied into an empty row");
    }
    uint64_t v8 = (unsigned __int16 *)(a2 + 16);
    double v9 = NSISLinExpConstant((uint64_t)v8);
    NSISLinExpIncrementConstant((uint64_t)v6, v9);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__NSISEngine_copyExpressionSubstitutingRowHeadVariables_intoRow___block_invoke;
    v10[3] = &unk_1E5C56890;
    v10[4] = v5;
    v10[5] = v6;
    return NSISLinExpEnumerateVarsAndCoefficients(v8, (uint64_t)v10);
  }
  return result;
}

- (uint64_t)_tryToAddConstraintWithMarkerEngineVar:(id *)a3 row:(uint64_t)a4 mutuallyExclusiveConstraints:(uint64_t)a5
{
  if (!a1) {
    return 0;
  }
  uint64_t v24 = 0;
  if (a6) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = *(void *)(a1 + 80) != 0;
  }
  unsigned int v13 = (uint64_t *)(a5 + 16);
  if (NSISLinExpConstant(a5 + 16) < 0.0) {
    NSISLinExpScaleBy((double *)(a5 + 16), -1.0);
  }
  if ([(NSISEngine *)a1 tryAddingDirectly:a5])
  {
    if (_NSConstraintBasedLayoutDebug())
    {
      uint64_t v14 = [*a3 markedConstraint];
      uint64_t v21 = _row_description(a4, a5);
      NSLog(&cfstr_EnginePDirectl.isa, a1, v14, v21);
    }
  }
  else
  {
    if (_NSConstraintBasedLayoutVariableChangeTransactions())
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __86__NSISEngine__tryToAddConstraintWithMarkerEngineVar_row_mutuallyExclusiveConstraints___block_invoke;
      v23[3] = &unk_1E5C56DA0;
      v23[4] = a1;
      if (*(unsigned char *)(a5 + 80))
      {
        uint64_t v15 = *v13;
        uint64_t v25 = MEMORY[0x1E4F143A8];
        uint64_t v26 = 3221225472;
        uint64_t v27 = ___row_enumerateCols_block_invoke;
        uint64_t v28 = &unk_1E5C570C0;
        uint64_t v29 = a4;
        v30 = v23;
        -[NSISObjectiveLinearExpression enumerateVars:](v15, (uint64_t)&v25);
      }
      else
      {
        uint64_t v25 = MEMORY[0x1E4F143A8];
        uint64_t v26 = 3221225472;
        uint64_t v27 = ___row_enumerateCols_block_invoke_2;
        uint64_t v28 = &unk_1E5C570C0;
        uint64_t v29 = a4;
        v30 = v23;
        NSISLinExpEnumerateVars((unsigned __int16 *)(a5 + 16), (uint64_t)&v25);
      }
    }
    if (!-[NSISEngine tryUsingArtificialVariableToAddConstraintWithMarker:row:usingInfeasibilityHandlingBehavior:mutuallyExclusiveConstraints:](a1, a2, a3, a4, a5, v12, &v24))
    {
      if (a6)
      {
        uint64_t v17 = 0;
        *a6 = v24;
      }
      else
      {
        uint64_t v20 = *(void *)(a1 + 80);
        if (v20) {
          (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, v24);
        }
        else {
          NSLog(&cfstr_WarningFailedT.isa);
        }
        uint64_t v17 = 0;
      }
      goto LABEL_18;
    }
    if (_NSConstraintBasedLayoutDebug())
    {
      uint64_t v16 = [*a3 markedConstraint];
      uint64_t v22 = _row_description(a4, a5);
      NSLog(&cfstr_EnginePIndirec.isa, a1, v16, v22);
    }
  }
  uint64_t v17 = 1;
LABEL_18:
  if (_NSConstraintBasedLayoutDebugEngineConsistency()) {
    [(id)a1 verifyInternalIntegrity];
  }
  -[NSISEngine _optimizeIfNotDisabled](a1);
  uint64_t v18 = *(void **)(a1 + 56);
  if (v18 && !*(_DWORD *)(a1 + 140)) {
    [v18 constraintsDidChangeInEngine:a1];
  }
  return v17;
}

- (uint64_t)_optimizeIfNotDisabled
{
  if (result)
  {
    uint64_t v1 = result;
    _AssertAutoLayoutOnAllowedThreadsOnly(result);
    if (_NSConstraintBasedLayoutDeferOptimization())
    {
      if (!*(unsigned char *)(v1 + 158))
      {
        if (*(unsigned char *)(v1 + 160)) {
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__optimizeIfNotDisabled, v1, @"NSISEngine.m", 2039, @"Engine marked as needing optimization even though it's already in progress.");
        }
        *(unsigned char *)(v1 + 158) = 1;
        if (!*(_DWORD *)(v1 + 140)) {
          [*(id *)(v1 + 56) solutionDidChangeInEngine:v1];
        }
      }
      return 0;
    }
    if (*(_DWORD *)(v1 + 136))
    {
      if (*(unsigned char *)(v1 + 160)) {
        return 0;
      }
      CGSize result = 0;
      *(unsigned char *)(v1 + 158) = 1;
    }
    else
    {
      [(id)v1 optimize];
      return 1;
    }
  }
  return result;
}

- (void)performPendingChangeNotifications
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (_NSConstraintBasedLayoutAriadneTracepoints()) {
    kdebug_trace();
  }
  [(NSISEngine *)self optimize];
  if (self->_changeNotificationsDirty)
  {
    self->_changeNotificationsDirty = 0;
    BOOL allowUnoptimizedReads = self->_allowUnoptimizedReads;
    self->_BOOL allowUnoptimizedReads = 1;
    if (_NSConstraintBasedLayoutTrackDirtyObservables())
    {
      for (i = self->_dirtyObservables; i; i = self->_dirtyObservables)
      {
        nextDirtyObservable = i->_nextDirtyObservable;
        self->_dirtyObservables = nextDirtyObservable;
        if (nextDirtyObservable) {
          nextDirtyObservable->_prevDirtyObservable = 0;
        }
        i->_nextDirtyObservable = 0;
        i->_prevDirtyObservable = 0;
        [(_NSISVariableObservable *)i emitValueIfNeeded];
      }
      dirtyVariableObservations = self->_dirtyVariableObservations;
      self->_dirtyVariableObservations = 0;
      if (dirtyVariableObservations)
      {
        do
        {
          [(NSISVariableObservation *)dirtyVariableObservations emitValueIfNeededWithEngine:self];
          nextDirtyObservation = dirtyVariableObservations->_nextDirtyObservation;
          dirtyVariableObservations->_nextDirtyObservation = 0;
          dirtyVariableObservations->_prevDirtyObservation = 0;

          if (!nextDirtyObservation)
          {
            nextDirtyObservation = self->_dirtyVariableObservations;
            self->_dirtyVariableObservations = 0;
          }
          dirtyVariableObservations = nextDirtyObservation;
        }
        while (nextDirtyObservation);
      }
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v8 = [(NSMapTable *)self->_variableObservables objectEnumerator];
      uint64_t v9 = [(NSEnumerator *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
        do
        {
          for (uint64_t j = 0; j != v10; ++j)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v15 + 1) + 8 * j) emitValueIfNeeded];
          }
          uint64_t v10 = [(NSEnumerator *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v10);
      }
      variablesObservations = self->_variablesObservations;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __47__NSISEngine_performPendingChangeNotifications__block_invoke;
      v14[3] = &unk_1E5C56B08;
      v14[4] = self;
      NSISObjectTableForEach((uint64_t)variablesObservations, (uint64_t)v14);
    }
    [(NSObservable *)self->_variableChangeTransactionSignal receiveObservedValue:*MEMORY[0x1E4F1CFD0]];
    self->_BOOL allowUnoptimizedReads = allowUnoptimizedReads;
  }
  if (_NSConstraintBasedLayoutAriadneTracepoints()) {
    kdebug_trace();
  }
}

- (unint64_t)optimize
{
  -[NSISEngine _flushPendingRemovals]();
  if (_NSConstraintBasedLayoutAriadneTracepoints())
  {
    [(NSISEngine *)self delegate];
    kdebug_trace();
  }
  if (self->_engineNeedsRebuildFromConstraints
    || (unint64_t v3 = [(NSISEngine *)self _optimizeWithoutRebuilding],
        self->_engineNeedsRebuildFromConstraints))
  {
    -[NSISEngine rebuildFromConstraints]((uint64_t)self);
    unint64_t v4 = [(NSISEngine *)self _optimizeWithoutRebuilding];
    if (self->_engineNeedsRebuildFromConstraints)
    {
      NSLog(&cfstr_FailedToRebuil.isa);
    }
    else if (_NSConstraintBasedLayoutLogEngineRebuilds())
    {
      NSLog(&cfstr_SucessfullyReb.isa);
    }
  }
  else
  {
    unint64_t v4 = v3;
  }
  if (_NSConstraintBasedLayoutAriadneTracepoints())
  {
    [(NSISEngine *)self delegate];
    kdebug_trace();
  }
  return v4;
}

- (unint64_t)_optimizeWithoutRebuilding
{
  recordedOperations = self->_recordedOperations;
  if (recordedOperations) {
    _NSISRecordOperation(recordedOperations, a2, v2, v3, v4, v5, v6, v7, 0, 0);
  }
  _AssertAutoLayoutOnAllowedThreadsOnly((uint64_t)self);
  if (self->_optimizationInProgress) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSISEngine.m", 1717, @"Nested optimization should never be triggered.  This is probably due to autolayout work happening inside an NSISVariable delegate callback, which is not allowed.");
  }
  unint64_t v11 = 0;
  unint64_t v12 = 0;
  unsigned int totalChangeCount = self->_totalChangeCount;
  unsigned int changeCountAtLastOptimization = self->_changeCountAtLastOptimization;
  while (changeCountAtLastOptimization != totalChangeCount)
  {
    self->_BOOL engineNeedsOptimization = 0;
    self->_optimizationInProgress = 1;
    -[NSISEngine fixUpValueRestrictionViolationsWithInfeasibilityHandlingBehavior:]((uint64_t)self, 0);
    unint64_t v15 = _minimizeConstantInObjectiveRow((uint64_t)self, (uint64_t)self->_objectiveRow.engine, (uint64_t)self->_objectiveRow.storage);
    if (self->_engineNeedsOptimization)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSISEngine.m", 1740, @"Engine still needs optimization after optimizing.");
      BOOL engineNeedsOptimization = self->_engineNeedsOptimization;
    }
    else
    {
      BOOL engineNeedsOptimization = 0;
    }
    v12 += v15;
    unsigned int totalChangeCount = self->_totalChangeCount;
    self->_unsigned int changeCountAtLastOptimization = totalChangeCount;
    self->_optimizationInProgress = 0;
    if (engineNeedsOptimization)
    {
      unsigned int changeCountAtLastOptimization = totalChangeCount;
      if (v11++ < 0x1D) {
        continue;
      }
    }
    if (engineNeedsOptimization) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSISEngine.m", 1753, @"Engine still needs optimization after iterating many times.");
    }
    return v12;
  }
  return v12;
}

- (BOOL)hasValue:(double *)a3 forVariable:(id)a4
{
  if (!a4) {
    return 0;
  }
  uint64_t v7 = 0;
  while (*((NSISEngine **)a4 + v7 + 3) != self)
  {
    if (++v7 == 3) {
      goto LABEL_7;
    }
  }
  if (*((_DWORD *)a4 + v7 + 12) != -1) {
    goto LABEL_9;
  }
LABEL_7:
  if (!*((void *)a4 + 2) || [a4 overflowEngineVarIndexForEngine:self] == -1) {
    return 0;
  }
LABEL_9:
  uint64_t v8 = 0;
  while (*((NSISEngine **)a4 + v8 + 3) != self)
  {
    if (++v8 == 3) {
      goto LABEL_15;
    }
  }
  unsigned int v10 = *((_DWORD *)a4 + v8 + 12);
  if (v10 != -1) {
    goto LABEL_18;
  }
LABEL_15:
  if (*((void *)a4 + 2)) {
    unsigned int v10 = [a4 overflowEngineVarIndexForEngine:self];
  }
  else {
    unsigned int v10 = -1;
  }
LABEL_18:
  uint64_t v11 = *(void *)((char *)self->_engineVarTable.blocks + (((unint64_t)v10 >> 3) & 0x1FFFFFF8))
      + 32 * (v10 & 0x3F);
  if (*(_DWORD *)(v11 + 16) == -1)
  {
    unint64_t v12 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", a4, self file lineNumber description];
  }
  if (*(id *)v11 != a4)
  {
    unsigned int v13 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *(void *)v11, a4 file lineNumber description];
  }
  return [(NSISEngine *)(uint64_t)self hasValue:(uint64_t)self forEngineVar:v11];
}

- (uint64_t)fixUpValueRestrictionViolationsWithInfeasibilityHandlingBehavior:(uint64_t)result
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  uint64_t v36 = 0;
  if (![*(id *)(result + 8) count]) {
    return v36;
  }
  while (1)
  {
    uint64_t v4 = (void *)[*(id *)(v3 + 8) objectAtIndex:0];
    [*(id *)(v3 + 8) removeObjectAtIndex:0];
    uint64_t v5 = 0;
    while (v4[v5 + 3] != v3)
    {
      if (++v5 == 3) {
        goto LABEL_8;
      }
    }
    unsigned int v6 = *((_DWORD *)v4 + v5 + 12);
    if (v6 != -1) {
      goto LABEL_11;
    }
LABEL_8:
    if (v4[2]) {
      unsigned int v6 = [v4 overflowEngineVarIndexForEngine:v3];
    }
    else {
      unsigned int v6 = -1;
    }
LABEL_11:
    uint64_t v7 = *(void *)(*(void *)(v3 + 192) + (((unint64_t)v6 >> 3) & 0x1FFFFFF8));
    uint64_t v8 = v6 & 0x3F;
    uint64_t v9 = v7 + 32 * v8;
    if (*(_DWORD *)(v9 + 16) == -1)
    {
      v19 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", v4, v3 file lineNumber description];
    }
    if (*(void **)v9 != v4)
    {
      uint64_t v20 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *(void *)v9, v4 file lineNumber description];
    }
    uint64_t v10 = v7 + 32 * v8;
    uint64_t v11 = (_DWORD *)(v10 + 24);
    if ((*(unsigned char *)(v10 + 24) & 1) == 0) {
      goto LABEL_37;
    }
    unint64_t v12 = *(unsigned __int16 **)(v10 + 8);
    double v13 = NSISLinExpConstant((uint64_t)(v12 + 8));
    int v14 = (*(_DWORD *)(*(void *)v12 + 24) >> 1) & 3;
    if (v14 != 2) {
      break;
    }
    if (v13 == 0.0)
    {
      if (*(double *)&NSISEpsilon <= 0.0) {
        goto LABEL_24;
      }
    }
    else if (fabs(v13) >= *(double *)&NSISEpsilon)
    {
      goto LABEL_24;
    }
LABEL_37:
    if (![*(id *)(v3 + 8) count]) {
      return v36;
    }
  }
  if (v14 != 1 || v13 >= 0.0) {
    goto LABEL_37;
  }
LABEL_24:
  uint64_t v32 = 0;
  uint64_t v33 = (double *)&v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0x409F400000000000;
  uint64_t v28 = 0;
  uint64_t v29 = (double *)&v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3010000000;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  if ((*v11 & 6) != 4)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __79__NSISEngine_fixUpValueRestrictionViolationsWithInfeasibilityHandlingBehavior___block_invoke;
    v21[3] = &unk_1E5C56B98;
    v21[4] = v3;
    v21[5] = &v32;
    v21[6] = &v22;
    v21[7] = &v28;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = ___row_enumerateColsWithCoefficients_block_invoke;
    v37[3] = &unk_1E5C57110;
    v37[4] = v3;
    v37[5] = v21;
    NSISLinExpEnumerateVarsAndCoefficients(v12 + 8, (uint64_t)v37);
    if (v33[3] != 2000.0) {
      goto LABEL_32;
    }
  }
  if (v29[3] != 1.79769313e308) {
    goto LABEL_32;
  }
  char v15 = [(NSISEngine *)v3 handleUnsatisfiableRow:(uint64_t)v12 usingInfeasibilityHandlingBehavior:a2 prospectiveRowHead:v23 + 4 mutuallyExclusiveConstraints:&v36];
  if (a2 == 1) {
    char v16 = 1;
  }
  else {
    char v16 = v15;
  }
  if ((v16 & 1) == 0)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_fixUpValueRestrictionViolationsWithInfeasibilityHandlingBehavior_, v3, @"NSISEngine.m", 1211, @"Unable to find an incoming rowHead for row:%@", _row_description(v3, (uint64_t)v12));
    goto LABEL_32;
  }
  if (a2 != 1)
  {
LABEL_32:
    long long v17 = v23;
    uint64_t v18 = v23[4];
    if (!v18)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_fixUpValueRestrictionViolationsWithInfeasibilityHandlingBehavior_, v3, @"NSISEngine.m", 1214, @"Failed to find an incoming row head for pivot");
      long long v17 = v23;
      uint64_t v18 = v23[4];
    }
    _pivotToMakeColNewHeadOfRow(v3, v18, (uint64_t **)v17[5], v3, (uint64_t)v12, 0);
    if (_NSConstraintBasedLayoutDebugEngineConsistency()) {
      [(id)v3 verifyInternalIntegrity];
    }
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
    goto LABEL_37;
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  return v36;
}

- (int)nsis_orientationHintForVariable:(id)a3
{
  return 0;
}

- (uint64_t)rebuildFromConstraints
{
  if (result)
  {
    uint64_t v1 = (id *)result;
    *(unsigned char *)(result + 162) = 0;
    if ([*(id *)(result + 16) count] || objc_msgSend(v1[3], "count")) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_rebuildFromConstraints, v1, @"NSISEngine.m", 1799, @"Attempt to rebuild engine with a pending list of constraints to remove.");
    }
    uint64_t v2 = [v1 constraints];
    double v3 = -[NSISEngine enumerateCols:](v1, (uint64_t)&__block_literal_global_138);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __36__NSISEngine_rebuildFromConstraints__block_invoke_2;
    v5[3] = &unk_1E5C56C60;
    v5[4] = v1;
    objc_msgSend(v1, "enumerateRows:", v5, v3);
    [v1[1] removeAllObjects];
    [v1[8] removeAllObjects];
    [v1[9] removeAllObjects];
    -[NSISEngine _addObjectiveRow]((void **)v1);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __36__NSISEngine_rebuildFromConstraints__block_invoke_3;
    v4[3] = &unk_1E5C56C88;
    v4[4] = v2;
    v4[5] = v1;
    return [v1 withoutOptimizingAtEndRunBlockWithAutomaticOptimizationDisabled:v4];
  }
  return result;
}

- (BOOL)tryAddingDirectly:(uint64_t)a3
{
  if (!a1) {
    return 0;
  }
  char v12 = 0;
  long long v11 = 0uLL;
  BOOL v6 = [(NSISEngine *)a1 chooseHeadForRow:a3 chosenCol:&v11 outNewToEngine:&v12];
  if (v6)
  {
    long long v7 = v11;
    double v8 = -1.0 / NSISLinExpCoefficientForVar(a3 + 16, *(_DWORD *)(**((void **)&v11 + 1) + 16));
    if (*(unsigned char *)(a3 + 80)) {
      -[NSISObjectiveLinearExpression removeVar:](*(void *)(a3 + 16), *(_DWORD *)(**((void **)&v7 + 1) + 16));
    }
    else {
      NSISLinExpRemoveVar((unsigned __int16 *)(a3 + 16), *(_DWORD *)(**((void **)&v7 + 1) + 16));
    }
    NSISLinExpScaleBy((double *)(a3 + 16), v8);
    _substituteOutAllOccurencesOfBodyVar(a1, v7, *((uint64_t *)&v7 + 1), a2, a3);
    uint64_t v9 = (void *)**((void **)&v7 + 1);
    _row_setHead(a2, a3, v7, *((id ***)&v7 + 1));
    _noteValueOfVariableChanged(a1, v7, v9);
  }
  return v6;
}

void __65__NSISEngine_copyExpressionSubstitutingRowHeadVariables_intoRow___block_invoke(uint64_t a1, unint64_t a2, double a3)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 192) + ((a2 >> 3) & 0x1FFFFFF8)) + 32 * (a2 & 0x3F);
  if (*(unsigned char *)(v3 + 24)) {
    NSISLinExpAddExpression(*(unsigned __int16 **)(a1 + 40), *(void *)(v3 + 8) + 16, a3);
  }
  else {
    NSISLinExpAddVar(*(unsigned __int16 **)(a1 + 40), a2, a3);
  }
}

- (int)valueRestrictionForEngineVarIndex:(id)a3
{
  return (*(_DWORD *)(*((void *)self->_engineVarTable.blocks + (a3.var0 >> 6)) + 32 * (a3.var0 & 0x3F) + 24) >> 1) & 3;
}

- (BOOL)chooseHeadForRow:(uint64_t)a3 chosenCol:(_OWORD *)a4 outNewToEngine:(char *)a5
{
  if (!a1) {
    return 0;
  }
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3010000000;
  uint64_t v34 = a1;
  uint64_t v35 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  char v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  *a5 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __56__NSISEngine_chooseHeadForRow_chosenCol_outNewToEngine___block_invoke;
  v25[3] = &unk_1E5C56BC0;
  v25[4] = v28;
  v25[5] = &v30;
  v25[7] = v26;
  v25[8] = a5;
  v25[6] = &v36;
  double v8 = (unsigned __int16 *)(a3 + 16);
  uint64_t v40 = MEMORY[0x1E4F143A8];
  uint64_t v41 = 3221225472;
  v42 = ___row_enumerateColsWithCoefficientsUntil_block_invoke;
  id v43 = &unk_1E5C57138;
  uint64_t v44 = a2;
  v45 = v25;
  NSISLinExpEnumerateVarsAndCoefficientsUntil((unsigned __int16 *)(a3 + 16), (uint64_t)&v40);
  if (!*((unsigned char *)v37 + 24) && NSISLinExpConstant((uint64_t)v8) == 0.0)
  {
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v24[3] = 0;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    char v23 = 1;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __56__NSISEngine_chooseHeadForRow_chosenCol_outNewToEngine___block_invoke_2;
    v21[3] = &unk_1E5C56BE8;
    v21[4] = v22;
    v21[5] = &v36;
    v21[6] = v24;
    v21[7] = &v30;
    void v21[8] = a5;
    uint64_t v40 = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    v42 = ___row_enumerateColsUntil_block_invoke;
    id v43 = &unk_1E5C57160;
    uint64_t v44 = a2;
    v45 = v21;
    NSISLinExpEnumerateVarsUntil(v8, (uint64_t)&v40);
    if (!*a5)
    {
      if (*((unsigned char *)v37 + 24)
        && (v10 = v31[4], uint64_t v9 = v31[5],
                          uint64_t v11 = v9 + 8,
                          uint64_t v12 = NSBitSetCount(v9 + 8),
                          uint64_t v13 = v9 + 24,
                          NSBitSetCount(v13) + v12))
      {
        uint64_t v17 = NSBitSetCount(v11);
        if (NSBitSetCount(v13) + v17 == 1)
        {
          unsigned int v18 = *(_DWORD *)(*(void *)(v10 + 408) + 8);
          if (HIWORD(v18)) {
            unint64_t v19 = v18 - 0x40000000;
          }
          else {
            unint64_t v19 = v18;
          }
          if (HIWORD(v18)) {
            uint64_t v20 = (uint64_t *)v13;
          }
          else {
            uint64_t v20 = (uint64_t *)v11;
          }
          char v14 = NSBitSetContainsIndex(v20, v19);
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 1;
      }
      *a5 = v14;
    }
    _Block_object_dispose(v22, 8);
    _Block_object_dispose(v24, 8);
  }
  *a4 = *((_OWORD *)v31 + 2);
  BOOL v15 = *((unsigned char *)v37 + 24) != 0;
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);
  return v15;
}

uint64_t __56__NSISEngine_chooseHeadForRow_chosenCol_outNewToEngine___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  int v7 = *(_DWORD *)(*(void *)a3 + 24) & 6;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    if (!v7)
    {
      uint64_t v8 = NSBitSetCount(a3 + 8);
      if (!(NSBitSetCount(a3 + 24) + v8))
      {
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
        *(void *)(v9 + 32) = a2;
        *(void *)(v9 + 40) = a3;
        BOOL v10 = 1;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        uint64_t result = 1;
LABEL_9:
        **(unsigned char **)(a1 + 64) = v10;
        return result;
      }
    }
    return 0;
  }
  if (!v7)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v12 + 32) = a2;
    *(void *)(v12 + 40) = a3;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    uint64_t v13 = NSBitSetCount(a3 + 8);
    BOOL v10 = NSBitSetCount(a3 + 24) + v13 == 0;
    uint64_t result = v10;
    goto LABEL_9;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    return 0;
  }
  uint64_t result = 0;
  if (a4 < 0.0 && v7 != 4)
  {
    uint64_t v14 = NSBitSetCount(a3 + 8);
    if (!(NSBitSetCount(a3 + 24) + v14)) {
      goto LABEL_14;
    }
    uint64_t v16 = NSBitSetCount(a3 + 8);
    if (NSBitSetCount(a3 + 24) + v16 != 1) {
      return 0;
    }
    unsigned int v17 = *(_DWORD *)(*(void *)(a2 + 408) + 8);
    unint64_t v18 = HIWORD(v17) ? v17 - 0x40000000 : v17;
    unint64_t v19 = (uint64_t *)(HIWORD(v17) ? a3 + 24 : a3 + 8);
    uint64_t result = NSBitSetContainsIndex(v19, v18);
    if (result)
    {
LABEL_14:
      uint64_t result = 0;
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      *(void *)(v15 + 32) = a2;
      *(void *)(v15 + 40) = a3;
      BOOL v10 = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      goto LABEL_9;
    }
  }
  return result;
}

uint64_t __86__NSISEngine__tryToAddConstraintWithMarkerEngineVar_row_mutuallyExclusiveConstraints___block_invoke(uint64_t a1, uint64_t a2, void **a3)
{
  uint64_t v6 = NSBitSetCount((uint64_t)(a3 + 1));
  uint64_t result = NSBitSetCount((uint64_t)(a3 + 3));
  if (!(result + v6))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *a3;
    return _noteValueOfVariableChanged(v8, a2, v9);
  }
  return result;
}

- (void)_dirtyListPrependObservation:(void *)result
{
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    if (a2[2] || a2[1]) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__dirtyListPrependObservation_, result, @"NSISEngine.m", 534, @"Dirty observable list is corrupt.");
    }
    uint64_t result = a2;
    a2[1] = *(void *)(v3 + 176);
    a2[2] = 0;
    uint64_t v4 = *(void *)(v3 + 176);
    if (v4) {
      *(void *)(v4 + 16) = a2;
    }
    *(void *)(v3 + 176) = a2;
  }
  return result;
}

void *__79__NSISEngine_fixUpValueRestrictionViolationsWithInfeasibilityHandlingBehavior___block_invoke(void *result, uint64_t a2, uint64_t *a3, double a4)
{
  if (a4 > 0.0)
  {
    v23[1] = v7;
    v23[2] = v6;
    v23[11] = v4;
    v23[12] = v5;
    uint64_t v9 = *a3;
    if ((*(_DWORD *)(*a3 + 24) & 6) != 4)
    {
      uint64_t v12 = result;
      double v22 = 0.0;
      v23[0] = 0.0;
      uint64_t v13 = result[4];
      uint64_t v14 = *(void *)(v13 + 408);
      if ((*(unsigned char *)(v14 + 80) & 1) == 0)
      {
        uint64_t v20 = *(void *)(v13 + 400);
        uint64_t v21 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
        [v21 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISObjectiveLinearExpression *_objectiveRow_rawBody(NSISRow)"), @"NSISEngine_Row.h", 418, @"Tried accessing the objective linear expression for regular row:%@", _row_description(v20, v14) file lineNumber description];
        uint64_t v9 = *a3;
      }
      uint64_t result = -[NSISObjectiveLinearExpression leadingPriority:andValue:forVar:](*(void **)(v14 + 16), v23, &v22, *(_DWORD *)(v9 + 16));
      double v15 = *(double *)(*(void *)(v12[5] + 8) + 24);
      if (v23[0] < v15)
      {
        uint64_t v16 = *(void *)(v12[6] + 8);
        *(void *)(v16 + 32) = a2;
        *(void *)(v16 + 40) = a3;
        double v17 = v22 / a4;
        unint64_t v18 = v12 + 7;
LABEL_10:
        *(double *)(*(void *)(*v18 + 8) + 24) = v17;
        return result;
      }
      if (v23[0] == v15)
      {
        double v17 = v22 / a4;
        unint64_t v18 = v12 + 7;
        if (v22 / a4 < *(double *)(*(void *)(v12[7] + 8) + 24))
        {
          uint64_t v19 = *(void *)(v12[6] + 8);
          *(void *)(v19 + 32) = a2;
          *(void *)(v19 + 40) = a3;
          goto LABEL_10;
        }
      }
    }
  }
  return result;
}

- (void)withBehaviors:(unint64_t)a3 performModifications:(id)a4
{
  char v5 = a3;
  _AssertAutoLayoutOnAllowedThreadsOnly((uint64_t)self);
  if ((v5 & 1) == 0)
  {
    if ((v5 & 2) == 0) {
      goto LABEL_3;
    }
LABEL_15:
    ++self->_engineDelegateCallsDisabledCount;
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  ++self->_automaticOptimizationDisabledCount;
  if ((v5 & 2) != 0) {
    goto LABEL_15;
  }
LABEL_3:
  if ((v5 & 4) != 0) {
LABEL_4:
  }
    ++self->_variableDelegateCallsDisabledCount;
LABEL_5:
  BOOL accumulatingRemovals = self->_accumulatingRemovals;
  uint64_t v8 = self;
  (*((void (**)(id))a4 + 2))(a4);
  if (!accumulatingRemovals && self->_accumulatingRemovals)
  {
    self->_BOOL accumulatingRemovals = 0;
    -[NSISEngine _flushPendingRemovals]();
  }
  if (v5)
  {
    int v9 = self->_automaticOptimizationDisabledCount - 1;
    self->_automaticOptimizationDisabledCount = v9;
    if ((v5 & 8) == 0 && !v9 && self->_engineNeedsOptimization)
    {
      if (_NSConstraintBasedLayoutDeferOptimization()) {
        -[NSISEngine _optimizeIfNotDisabled]((uint64_t)self);
      }
      else {
        [(NSISEngine *)self optimize];
      }
      if (_NSConstraintBasedLayoutDebugEngineConsistency()) {
        [(NSISEngine *)self verifyInternalIntegrity];
      }
    }
  }
  if ((v5 & 2) != 0) {
    --self->_engineDelegateCallsDisabledCount;
  }
  if ((v5 & 4) != 0) {
    --self->_variableDelegateCallsDisabledCount;
  }
}

- (void)withAutomaticOptimizationDisabled:(id)a3
{
}

- (uint64_t)tryUsingArtificialVariableToAddConstraintWithMarker:(id *)a3 row:(uint64_t)a4 usingInfeasibilityHandlingBehavior:(uint64_t)a5 mutuallyExclusiveConstraints:(uint64_t)a6
{
  if (!result) {
    return result;
  }
  uint64_t v12 = result;
  if (!*(void *)(result + 424)) {
    *(void *)(result + 424) = +[NSISVariable variableWithName:@"tempToBeOptimizedToZero" valueRestriction:1 shouldBeMinimized:1];
  }
  v46 = a3;
  if (!*(void *)(v12 + 432)) {
    *(void *)(v12 + 432) = +[NSISVariable variableWithName:@"tempToBeOptimizedToZeroObjective" valueRestriction:0 shouldBeMinimized:0];
  }
  uint64_t v13 = *(void *)(v12 + 440);
  uint64_t v48 = a6;
  if (v13)
  {
    -[NSISObjectiveLinearExpression cleanupForReuse](v13);
    -[NSISObjectiveLinearExpression addExpression:priority:times:processVarNewToReceiver:processVarDroppedFromReceiver:](*(unsigned __int16 **)(v12 + 440), (unsigned __int16 *)(a5 + 16), (uint64_t)&__block_literal_global_98, (uint64_t)&__block_literal_global_100, 1.0, 1.0);
  }
  else
  {
    *(void *)(v12 + 440) = -[NSISObjectiveLinearExpression initWithLinearExpression:priority:engine:]([NSISObjectiveLinearExpression alloc], (unsigned __int16 *)(a5 + 16), v12, 1.0);
  }
  uint64_t v14 = _engineVar_addForVariableIfNeeded(v12, *(void **)(v12 + 424));
  uint64_t v16 = v15;
  uint64_t v17 = _engineVar_addForVariableIfNeeded(v12, *(void **)(v12 + 432));
  uint64_t v19 = v18;
  if (v16[3])
  {
    uint64_t v40 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *v16 file lineNumber description];
  }
  uint64_t v49 = v14;
  _row_setHead(a4, a5, v14, (id **)v16[1]);
  if (*(unsigned char *)(v19 + 24))
  {
    uint64_t v41 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *(void *)v19 file lineNumber description];
  }
  uint64_t v47 = v19;
  uint64_t v20 = *(id ***)(v19 + 8);
  uint64_t v21 = *(void **)(v12 + 440);
  double v22 = *v20;
  if (!NSBitSetCount(v12 + 256)) {
    _table_addStorageBlock((void **)(v12 + 232), (unint64_t *)(v12 + 240), (unint64_t *)(v12 + 248), 0x17uLL, 88, (unsigned int *)(v12 + 256));
  }
  unint64_t Index = NSBitSetFirstIndex((uint64_t **)(v12 + 256));
  NSBitSetRemoveIndex((uint64_t *)(v12 + 256), Index);
  uint64_t v24 = *(void *)(*(void *)(v12 + 232 + 40 * ((Index >> 30) & 1)) + 8 * ((Index & 0xBFFFFFFF) / 0x17))
      + 88 * ((Index & 0xBFFFFFFF) % 0x17);
  *(void *)uint64_t v24 = 0;
  *(void *)(v24 + 8) = Index;
  *(_WORD *)(v24 + 16) = 4;
  *(_OWORD *)(v24 + 18) = 0u;
  *(_OWORD *)(v24 + 34) = 0u;
  *(_OWORD *)(v24 + 50) = 0u;
  *(_OWORD *)(v24 + 66) = 0u;
  *(void *)(v24 + 80) = 0;
  _row_rawSetHead(v12, (_DWORD *)v24, v17, v20);
  *(_DWORD *)(v24 + 80) |= 1u;
  *(void *)(v24 + 16) = v21;
  if (((_BYTE)v22[3] & 1) == 0)
  {
    v42 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISRow _engineVar_row(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 115, @"Tried accessing the row index for a variable that isn't a row head:%@", *v22 file lineNumber description];
  }
  uint64_t v25 = (char *)v22[1];
  uint64_t v51 = MEMORY[0x1E4F143A8];
  uint64_t v52 = 3221225472;
  uint64_t v53 = (uint64_t)___objectiveRow_addWithHeadAndBody_block_invoke;
  v54 = (const char *)&__block_descriptor_48_e16_v24__0_________8ls32l8;
  uint64_t v55 = v17;
  v56 = v25;
  uint64_t v26 = (unsigned __int16 *)(v25 + 16);
  uint64_t v27 = v49;
  if (v25[80])
  {
    uint64_t v28 = *(void *)v26;
    v57 = (void *)MEMORY[0x1E4F143A8];
    uint64_t v58 = 3221225472;
    v59 = ___row_enumerateCols_block_invoke;
    v60 = &unk_1E5C570C0;
    uint64_t v61 = v17;
    v62 = &v51;
    -[NSISObjectiveLinearExpression enumerateVars:](v28, (uint64_t)&v57);
  }
  else
  {
    v57 = (void *)MEMORY[0x1E4F143A8];
    uint64_t v58 = 3221225472;
    v59 = ___row_enumerateCols_block_invoke_2;
    v60 = &unk_1E5C570C0;
    uint64_t v61 = v17;
    v62 = &v51;
    NSISLinExpEnumerateVars(v26, (uint64_t)&v57);
  }
  if ((*(unsigned char *)(v47 + 24) & 1) == 0)
  {
    id v43 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISRow _engineVar_row(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 115, @"Tried accessing the row index for a variable that isn't a row head:%@", *(void *)v47 file lineNumber description];
  }
  uint64_t v29 = *(void *)(v47 + 8);
  _minimizeConstantInObjectiveRow(v12, v17, v29);
  uint64_t v30 = v48;
  while (1)
  {
    if ((*(unsigned char *)(v29 + 80) & 1) == 0)
    {
      uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v34 = [NSString stringWithUTF8String:"NSISObjectiveLinearExpression *_objectiveRow_rawBody(NSISRow)"];
      uint64_t v45 = _row_description(v17, v29);
      uint64_t v35 = (void *)v33;
      uint64_t v36 = v34;
      uint64_t v30 = v48;
      uint64_t v27 = v49;
      [v35 handleFailureInFunction:v36, @"NSISEngine_Row.h", 418, @"Tried accessing the objective linear expression for regular row:%@", v45 file lineNumber description];
    }
    if (-[NSISObjectiveLinearExpression constantTermIsZero](*(void *)(v29 + 16))) {
      break;
    }
    uint64_t v31 = 0;
    v57 = 0;
    if (v16[3])
    {
      if ([(NSISEngine *)v12 handleUnsatisfiableRow:v16[1] usingInfeasibilityHandlingBehavior:v30 prospectiveRowHead:0 mutuallyExclusiveConstraints:&v57])
      {
        int v32 = 1;
        if (a7) {
          goto LABEL_33;
        }
        goto LABEL_34;
      }
      uint64_t v31 = v57;
    }
    if (![v31 count]) {
      break;
    }
    int v32 = 0;
    if (a7) {
LABEL_33:
    }
      *a7 = v57;
LABEL_34:
    if (!v32)
    {
      _row_remove(v12, v17, v29);
      [(id)v12 removeConstraintWithMarker:*v46];
      return 0;
    }
    _minimizeConstantInObjectiveRow(v12, v17, v29);
  }
  if (v16[3])
  {
    uint64_t v37 = v16[1];
    if (NSISLinExpIsConstant(v37 + 16))
    {
      _row_remove(v12, v27, v37);
    }
    else
    {
      uint64_t v51 = 0;
      uint64_t v52 = (uint64_t)&v51;
      uint64_t v53 = 0x3010000000;
      uint64_t v55 = v12;
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __134__NSISEngine_tryUsingArtificialVariableToAddConstraintWithMarker_row_usingInfeasibilityHandlingBehavior_mutuallyExclusiveConstraints___block_invoke_3;
      v50[3] = &unk_1E5C56C10;
      v50[4] = &v51;
      v56 = 0;
      v57 = (void *)MEMORY[0x1E4F143A8];
      uint64_t v58 = 3221225472;
      v59 = ___row_enumerateColsUntil_block_invoke;
      v60 = &unk_1E5C57160;
      uint64_t v61 = v27;
      v62 = v50;
      NSISLinExpEnumerateVarsUntil((unsigned __int16 *)(v37 + 16), (uint64_t)&v57);
      uint64_t v38 = v52;
      char v39 = *(uint64_t ***)(v52 + 40);
      if (!v39)
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_tryUsingArtificialVariableToAddConstraintWithMarker_row_usingInfeasibilityHandlingBehavior_mutuallyExclusiveConstraints_, v12, @"NSISEngine.m", 1466, @"Unable to find a new row head");
        uint64_t v38 = v52;
        char v39 = *(uint64_t ***)(v52 + 40);
      }
      _pivotToMakeColNewHeadOfRow(v12, *(void *)(v38 + 32), v39, v27, v37, 0);
      _Block_object_dispose(&v51, 8);
    }
  }
  if (v16[3])
  {
    uint64_t v44 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *v16 file lineNumber description];
  }
  _col_removeFromAllRows(v27, v16[1]);
  _row_remove(v12, v17, v29);
  return 1;
}

uint64_t __56__NSISEngine_chooseHeadForRow_chosenCol_outNewToEngine___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)a3 + 24) & 6;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = v3 == 4;
  }
  if (v4) {
    return 0;
  }
  uint64_t v8 = NSBitSetCount(a3 + 8);
  unint64_t v9 = NSBitSetCount(a3 + 24) + v8;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if ((v3 == 4 || !*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
      && v9 >= *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      return 0;
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  *(void *)(v10 + 32) = a2;
  *(void *)(v10 + 40) = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3 == 4;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
    || *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    return 0;
  }
  uint64_t result = 1;
  **(unsigned char **)(a1 + 64) = 1;
  return result;
}

- (void)enumerateRows:(id)a3
{
  rowTables = self->_rowTables;
  p_freeIndexes = &self->_rowTables[0].freeIndexes;
  uint64_t v7 = 23 * self->_rowTables[0].blocksCount;
  long long v15 = xmmword_1A64B9380;
  NSBitSetAddIndexesInRange((unsigned int *)&v15, 0, v7);
  NSBitSetRemoveIndexes((uint64_t)&v15, (uint64_t *)p_freeIndexes);
  uint64_t v8 = 23 * self->_rowTables[1].blocksCount;
  long long v14 = v15;
  long long v15 = xmmword_1A64B9380;
  NSBitSetAddIndexesInRange((unsigned int *)&v15, 0, v8);
  NSBitSetRemoveIndexes((uint64_t)&v15, (uint64_t *)&self->_rowTables[1].freeIndexes);
  uint64_t Next = NSBitSetFindNext((uint64_t **)&v14, 0);
  if (Next == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    uint64_t v11 = NSBitSetFindNext((uint64_t **)&v15, 0);
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (uint64_t i = v11; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = NSBitSetFindNext((uint64_t **)&v15, i + 1))
      {
        char v13 = 0;
        (*((void (**)(id, NSISEngine *, uint64_t, char *))a3 + 2))(a3, self, *((void *)rowTables[((i + 0x40000000) >> 30) & 1].blocks+ ((i + 0x40000000) & 0xBFFFFFFF) / 0x17uLL)+ 88 * (((i + 0x40000000) & 0xBFFFFFFF) % 0x17), &v13);
        if (v13) {
          break;
        }
      }
    }
  }
  else
  {
    unint64_t v10 = Next;
    while (1)
    {
      char v13 = 0;
      (*((void (**)(id, NSISEngine *, unint64_t, char *))a3 + 2))(a3, self, *((void *)rowTables[(v10 >> 30) & 1].blocks + (v10 & 0xBFFFFFFF) / 0x17) + 88 * ((v10 & 0xBFFFFFFF) % 0x17), &v13);
      if (v13) {
        break;
      }
      unint64_t v10 = NSBitSetFindNext((uint64_t **)&v14, v10 + 1);
      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_5;
      }
    }
  }
  NSBitSetReset((uint64_t)&v14);
  NSBitSetReset((uint64_t)&v15);
}

void __33__NSISEngine__removeAllVariables__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = (id *)(a3 + 16);
  if (*(unsigned char *)(a3 + 80))
  {

    id *v3 = 0;
  }
  else
  {
    NSISLinExpFree(a3 + 16);
  }
}

- (double)enumerateCols:(void *)a1
{
  if (a1)
  {
    BOOL v4 = a1 + 39;
    char v5 = a1 + 42;
    uint64_t v6 = 25 * a1[40];
    long long v14 = xmmword_1A64B9380;
    NSBitSetAddIndexesInRange((unsigned int *)&v14, 0, v6);
    NSBitSetRemoveIndexes((uint64_t)&v14, v5);
    uint64_t v7 = 25 * a1[45];
    long long v13 = v14;
    long long v14 = xmmword_1A64B9380;
    NSBitSetAddIndexesInRange((unsigned int *)&v14, 0, v7);
    NSBitSetRemoveIndexes((uint64_t)&v14, a1 + 47);
    uint64_t Next = NSBitSetFindNext((uint64_t **)&v13, 0);
    if (Next != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (unint64_t i = Next; i != 0x7FFFFFFFFFFFFFFFLL; unint64_t i = NSBitSetFindNext((uint64_t **)&v13, i + 1))
        (*(void (**)(uint64_t, void *, unint64_t))(a2 + 16))(a2, a1, *(void *)(v4[5 * ((i >> 30) & 1)] + 8 * ((i & 0xBFFFFFFF) / 0x19)) + 40 * ((i & 0xBFFFFFFF) % 0x19));
    }
    uint64_t v10 = NSBitSetFindNext((uint64_t **)&v14, 0);
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (uint64_t j = v10; j != 0x7FFFFFFFFFFFFFFFLL; uint64_t j = NSBitSetFindNext((uint64_t **)&v14, j + 1))
        (*(void (**)(uint64_t, void *, uint64_t))(a2 + 16))(a2, a1, *(void *)(v4[5 * (((j + 0x40000000) >> 30) & 1)]+ 8 * (((j + 0x40000000) & 0xBFFFFFFF) / 0x19uLL))+ 40 * (((j + 0x40000000) & 0xBFFFFFFF) % 0x19));
    }
    NSBitSetReset((uint64_t)&v13);
    return NSBitSetReset((uint64_t)&v14);
  }
  return result;
}

double __33__NSISEngine__removeAllVariables__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSBitSetReset(a3 + 8);
  return NSBitSetReset(a3 + 24);
}

BOOL __134__NSISEngine_tryUsingArtificialVariableToAddConstraintWithMarker_row_usingInfeasibilityHandlingBehavior_mutuallyExclusiveConstraints___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v3 + 32) = a2;
  *(void *)(v3 + 40) = a3;
  return (*(_DWORD *)(*(void *)a3 + 24) & 6) != 4;
}

- (double)valueForEngineVar:(uint64_t)a3
{
  if (!a1) {
    return 0.0;
  }
  if (!a1[161] && [MEMORY[0x1E4F29060] isMainThread]) {
    a1[161] = 1;
  }
  if (a1[158] && !a1[159]) {
    [a1 optimize];
  }
  if ((*(unsigned char *)(a3 + 24) & 1) == 0) {
    return 0.0;
  }
  uint64_t v6 = *(void *)(a3 + 8) + 16;
  return NSISLinExpConstant(v6);
}

- (unint64_t)pivotCount
{
  return self->_pivotCount;
}

- (void)dealloc
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  dirtyObservables = self->_dirtyObservables;
  self->_dirtyObservables = 0;
  if (dirtyObservables)
  {
    do
    {
      nextDirtyObservable = dirtyObservables->_nextDirtyObservable;
      dirtyObservables->_nextDirtyObservable = 0;
      dirtyObservables->_prevDirtyObservable = 0;
      dirtyObservables = nextDirtyObservable;
    }
    while (nextDirtyObservable);
  }
  dirtyVariableObservations = self->_dirtyVariableObservations;
  self->_dirtyVariableObservations = 0;
  if (dirtyVariableObservations)
  {
    do
    {
      nextDirtyObservation = dirtyVariableObservations->_nextDirtyObservation;
      dirtyVariableObservations->_nextDirtyObservation = 0;
      dirtyVariableObservations->_prevDirtyObservation = 0;

      dirtyVariableObservations = nextDirtyObservation;
    }
    while (nextDirtyObservation);
  }
  NSISObjectTableDestroy((void **)self->_variablesObservations);
  self->_variableObservables = 0;
  -[NSISEngine _removeAllVariables]((uint64_t)self);
  if (self->_engineVarTable.blocksCount)
  {
    unint64_t v7 = 0;
    do
      free(*((void **)self->_engineVarTable.blocks + v7++));
    while (v7 < self->_engineVarTable.blocksCount);
  }
  free(self->_engineVarTable.blocks);
  NSBitSetReset((uint64_t)&self->_engineVarTable.freeIndexes);
  uint64_t v8 = 0;
  colTables = self->_colTables;
  rowTables = self->_rowTables;
  char v11 = 1;
  do
  {
    char v12 = v11;
    long long v13 = &colTables[v8];
    if (v13->blocksCount)
    {
      unint64_t v14 = 0;
      do
        free(*((void **)v13->blocks + v14++));
      while (v14 < v13->blocksCount);
    }
    long long v15 = &rowTables[v8];
    if (v15->blocksCount)
    {
      unint64_t v16 = 0;
      do
        free(*((void **)v15->blocks + v16++));
      while (v16 < v15->blocksCount);
    }
    free(v13->blocks);
    free(v15->blocks);
    uint64_t v17 = v8;
    NSBitSetReset((uint64_t)&colTables[v17].freeIndexes);
    NSBitSetReset((uint64_t)&rowTables[v17].freeIndexes);
    char v11 = 0;
    uint64_t v8 = 1;
  }
  while ((v12 & 1) != 0);

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  brokenConstraintPositiveErrors = self->_brokenConstraintPositiveErrors;
  uint64_t v19 = [(NSMapTable *)brokenConstraintPositiveErrors countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(brokenConstraintPositiveErrors);
        }
        objc_msgSend(-[NSMapTable objectForKey:](self->_brokenConstraintPositiveErrors, "objectForKey:", *(void *)(*((void *)&v33 + 1) + 8 * i)), "setDelegate:", 0);
      }
      uint64_t v20 = [(NSMapTable *)brokenConstraintPositiveErrors countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v20);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  brokenConstraintNegativeErrors = self->_brokenConstraintNegativeErrors;
  uint64_t v24 = [(NSMapTable *)brokenConstraintNegativeErrors countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(brokenConstraintNegativeErrors);
        }
        objc_msgSend(-[NSMapTable objectForKey:](self->_brokenConstraintNegativeErrors, "objectForKey:", *(void *)(*((void *)&v29 + 1) + 8 * j)), "setDelegate:", 0);
      }
      uint64_t v25 = [(NSMapTable *)brokenConstraintNegativeErrors countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v25);
  }

  v28.receiver = self;
  v28.super_class = (Class)NSISEngine;
  [(NSISEngine *)&v28 dealloc];
}

- (void)_removeAllVariables
{
  if (a1)
  {
    [(id)a1 enumerateRows:&__block_literal_global_46];
    -[NSISEngine enumerateCols:]((void *)a1, (uint64_t)&__block_literal_global_48);
    -[NSISEngine enumerateEngineVars:]((void *)a1, (uint64_t)&__block_literal_global_50);
    NSBitSetAddIndexesInRange((unsigned int *)(a1 + 216), 0, *(void *)(a1 + 200) << 6);
    uint64_t v2 = 0;
    uint64_t v3 = a1 + 232;
    uint64_t v4 = a1 + 312;
    char v5 = 1;
    do
    {
      char v6 = v5;
      uint64_t v7 = 5 * v2;
      NSBitSetAddIndexesInRange((unsigned int *)(v3 + 40 * v2 + 24), 0, 23 * *(void *)(v3 + 40 * v2 + 8));
      NSBitSetAddIndexesInRange((unsigned int *)(v4 + 8 * v7 + 24), 0, 25 * *(void *)(v4 + 8 * v7 + 8));
      char v5 = 0;
      uint64_t v2 = 1;
    }
    while ((v6 & 1) != 0);
  }
}

- (NSISEngine)init
{
  v6.receiver = self;
  v6.super_class = (Class)NSISEngine;
  id v2 = [(NSISEngine *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    *((void *)v2 + 27) = 0;
    *((void *)v2 + 28) = 1;
    _table_addStorageBlock((void **)v2 + 24, (unint64_t *)v2 + 25, (unint64_t *)v2 + 26, 0x40uLL, 32, (unsigned int *)v2 + 54);
    *((void *)v3 + 32) = 0;
    *((void *)v3 + 33) = 1;
    _table_addStorageBlock((void **)v3 + 29, (unint64_t *)v3 + 30, (unint64_t *)v3 + 31, 0x17uLL, 88, (unsigned int *)v3 + 64);
    *((void *)v3 + 37) = 0;
    *((void *)v3 + 38) = 1;
    _table_addStorageBlock((void **)v3 + 34, (unint64_t *)v3 + 35, (unint64_t *)v3 + 36, 0x17uLL, 88, (unsigned int *)v3 + 74);
    *((void *)v3 + 42) = 0;
    *((void *)v3 + 43) = 1;
    _table_addStorageBlock((void **)v3 + 39, (unint64_t *)v3 + 40, (unint64_t *)v3 + 41, 0x19uLL, 40, (unsigned int *)v3 + 84);
    *((void *)v3 + 47) = 0;
    *((void *)v3 + 48) = 1;
    _table_addStorageBlock((void **)v3 + 44, (unint64_t *)v3 + 45, (unint64_t *)v3 + 46, 0x19uLL, 40, (unsigned int *)v3 + 94);
    *((void *)v3 + 49) = +[NSISVariable variableWithName:@"objective" valueRestriction:0 shouldBeMinimized:0];
    *((void *)v3 + 52) = +[NSISVariable variableWithName:@"placeholderForExpressionBeingAdded" valueRestriction:1 shouldBeMinimized:0];
    objc_msgSend(v3, "setVariablesWithValueRestrictionViolations:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"));
    -[NSISEngine _addObjectiveRow]((void **)v3);
    *((unsigned char *)v3 + 159) = _NSConstraintBasedLayoutAllowUnoptimizedReads();
    *((unsigned char *)v3 + 161) = 1;
    NSISObjectTableCreate();
    *((void *)v3 + 21) = v4;
  }
  return (NSISEngine *)v3;
}

- (void)setVariablesWithValueRestrictionViolations:(id)a3
{
}

- (void)_addObjectiveRow
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    uint64_t v2 = _engineVar_addForVariableIfNeeded((uint64_t)result, result[49]);
    uint64_t v4 = (void *)v3;
    if (*(unsigned char *)(v3 + 24))
    {
      unint64_t v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *v4 file lineNumber description];
    }
    char v5 = (id **)v4[1];
    objc_super v6 = -[NSISObjectiveLinearExpression initWithEngine:]([NSISObjectiveLinearExpression alloc], v1);
    if (!NSBitSetCount(v1 + 256)) {
      _table_addStorageBlock((void **)(v1 + 232), (unint64_t *)(v1 + 240), (unint64_t *)(v1 + 248), 0x17uLL, 88, (unsigned int *)(v1 + 256));
    }
    unint64_t Index = NSBitSetFirstIndex((uint64_t **)(v1 + 256));
    NSBitSetRemoveIndex((uint64_t *)(v1 + 256), Index);
    uint64_t v8 = *(void *)(*(void *)(v1 + 232 + 40 * ((Index >> 30) & 1)) + 8 * ((Index & 0xBFFFFFFF) / 0x17))
       + 88 * ((Index & 0xBFFFFFFF) % 0x17);
    *(void *)uint64_t v8 = 0;
    *(void *)(v8 + 8) = Index;
    *(_WORD *)(v8 + 16) = 4;
    *(_OWORD *)(v8 + 18) = 0u;
    *(_OWORD *)(v8 + 34) = 0u;
    *(_OWORD *)(v8 + 50) = 0u;
    *(_OWORD *)(v8 + 66) = 0u;
    *(void *)(v8 + 80) = 0;
    _row_rawSetHead(v1, (_DWORD *)v8, v2, v5);
    *(_DWORD *)(v8 + 80) |= 1u;
    double result = v6;
    *(void *)(v8 + 16) = result;
    *(void *)(v1 + 400) = v1;
    *(void *)(v1 + 408) = v8;
  }
  return result;
}

- (double)enumerateEngineVars:(void *)a1
{
  if (a1)
  {
    uint64_t v4 = a1 + 27;
    uint64_t v5 = a1[25] << 6;
    long long v10 = xmmword_1A64B9380;
    NSBitSetAddIndexesInRange((unsigned int *)&v10, 0, v5);
    NSBitSetRemoveIndexes((uint64_t)&v10, v4);
    uint64_t Next = NSBitSetFindNext((uint64_t **)&v10, 0);
    if (Next != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (uint64_t i = Next; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = NSBitSetFindNext((uint64_t **)&v10, i + 1))
      {
        char v9 = 0;
        (*(void (**)(uint64_t, void *, uint64_t, char *))(a2 + 16))(a2, a1, *(void *)(a1[24] + 8 * (i >> 6)) + 32 * (i & 0x3F), &v9);
        if (v9) {
          break;
        }
      }
    }
    return NSBitSetReset((uint64_t)&v10);
  }
  return result;
}

void __33__NSISEngine__removeAllVariables__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  *a3 = 0;
  a3[1] = 0;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (NSISEngineDelegate *)a3;
}

- (void)setEngineScalingCoefficients:(CGSize)a3
{
  self->_engineScalingCoefficients = a3;
}

- (void)stopObservingChangesForVariable:(id)a3
{
  uint64_t v4 = (NSISVariableObservation *)NSISObjectTableDelete((int32x2_t *)self->_variablesObservations, (unint64_t)a3);
  if (v4)
  {
    uint64_t v5 = v4;
    if (v4->_nextDirtyObservation || v4->_prevDirtyObservation || self->_dirtyVariableObservations == v4) {
      -[NSISEngine _dirtyListRemoveObservation:]((uint64_t)self, v4);
    }
  }
}

- (void)_dirtyListRemoveObservation:(uint64_t)a1
{
  if (a1 && a2)
  {
    uint64_t v2 = a2[1];
    uint64_t v3 = a2[2];
    if (v2) {
      *(void *)(v2 + 16) = v3;
    }
    if (v3)
    {
      uint64_t v4 = (void *)(v3 + 8);
    }
    else
    {
      uint64_t v5 = *(void **)(a1 + 176);
      uint64_t v4 = (void *)(a1 + 176);
      if (v5 != a2) {
        goto LABEL_9;
      }
    }
    *uint64_t v4 = v2;
LABEL_9:
    a2[1] = 0;
    a2[2] = 0;
  }
}

- (void)startObservingChangesForVariable:(id)a3
{
  if (a3)
  {
    uint64_t v5 = [[NSISVariableObservation alloc] initWithVariable:a3];
    NSISObjectTableInsert(self->_variablesObservations, a3, v5);
  }
}

- (uint64_t)handleUnsatisfiableRow:(uint64_t)a3 usingInfeasibilityHandlingBehavior:(uint64_t)a4 prospectiveRowHead:(uint64_t *)a5 mutuallyExclusiveConstraints:(void *)a6
{
  if (!result) {
    return result;
  }
  uint64_t v11 = result;
  char v12 = _mutuallyExclusiveConstraintsForUnsatisfiableRow(a2, a3);
  if (![v12 count])
  {
    if (!a6) {
      return 0;
    }
LABEL_50:
    double result = 0;
    *a6 = v12;
    return result;
  }
  if (a4 == 1) {
    goto LABEL_50;
  }
  uint64_t v41 = a5;
  if (a4) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Unknown infeasibility behavior" userInfo:0]);
  }
  while (1)
  {
    long long v13 = *(void **)(v11 + 56);
    if (v13)
    {
      unint64_t v14 = (void *)[v13 engine:v11 markerForConstraintToBreakAmongConstraints:v12];
    }
    else
    {
      uint64_t v44 = 0;
      uint64_t v45 = &v44;
      uint64_t v46 = 0x3052000000;
      uint64_t v47 = __Block_byref_object_copy__0;
      uint64_t v48 = __Block_byref_object_dispose__0;
      uint64_t v49 = 0;
      long long v15 = *(id **)a3;
      if ([**(id **)a3 markedConstraint])
      {
        unint64_t v14 = *v15;
        v45[5] = (uint64_t)v14;
      }
      else
      {
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = ___fallbackMarkerForConstraintToBreakInRow_block_invoke;
        v43[3] = &unk_1E5C570E8;
        v43[4] = &v44;
        if (*(unsigned char *)(a3 + 80))
        {
          uint64_t v16 = *(void *)(a3 + 16);
          uint64_t v51 = MEMORY[0x1E4F143A8];
          uint64_t v52 = 3221225472;
          uint64_t v53 = (uint64_t)___row_enumerateCols_block_invoke;
          v54 = (const char *)&unk_1E5C570C0;
          uint64_t v55 = a2;
          v56 = v43;
          -[NSISObjectiveLinearExpression enumerateVars:](v16, (uint64_t)&v51);
        }
        else
        {
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = ___row_enumerateCols_block_invoke_2;
          v50[3] = &unk_1E5C570C0;
          v50[4] = a2;
          void v50[5] = v43;
          NSISLinExpEnumerateVars((unsigned __int16 *)(a3 + 16), (uint64_t)v50);
        }
        unint64_t v14 = (void *)v45[5];
      }
      _Block_object_dispose(&v44, 8);
    }
    double v17 = NSISLinExpConstant(a3 + 16);
    int v18 = v17 > 0.0;
    if (v14 != **(id **)a3)
    {
      if (v14)
      {
        uint64_t v19 = 0;
        while (v14[v19 + 3] != v11)
        {
          if (++v19 == 3) {
            goto LABEL_22;
          }
        }
        unsigned int v21 = *((_DWORD *)v14 + v19 + 12);
        if (v21 != -1) {
          goto LABEL_25;
        }
LABEL_22:
        if (v14[2]) {
          unsigned int v21 = [v14 overflowEngineVarIndexForEngine:v11];
        }
        else {
          unsigned int v21 = -1;
        }
LABEL_25:
        uint64_t v22 = *(void *)(*(void *)(v11 + 192) + (((unint64_t)v21 >> 3) & 0x1FFFFFF8));
        uint64_t v23 = v21 & 0x3F;
        uint64_t v24 = (void *)(v22 + 32 * v23);
        if (*((_DWORD *)v24 + 4) == -1)
        {
          uint64_t v39 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          [v39 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", v14, v11 file lineNumber description];
        }
        if ((void *)*v24 != v14)
        {
          uint64_t v40 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          [v40 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *v24, v14 file lineNumber description];
        }
        uint64_t v25 = v22 + 32 * v23;
        if (*(unsigned char *)(v25 + 24))
        {
          uint64_t v38 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          [v38 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *v24 file lineNumber description];
        }
        BOOL v20 = NSISLinExpCoefficientForVar(a3 + 16, *(_DWORD *)(**(void **)(v25 + 8) + 16)) > 0.0;
      }
      else
      {
        BOOL v20 = 0;
      }
      int v18 = (v17 > 0.0) ^ v20;
    }
    objc_msgSend(*(id *)(v11 + 56), "engine:willBreakConstraint:dueToMutuallyExclusiveConstraints:", v11, objc_msgSend(v14, "markedConstraint"), v12);
    uint64_t v26 = -[NSISEngine errorVariableIntroducedByBreakingConstraintWithMarker:errorIsPositive:]((void *)v11, v14, v18);
    uint64_t v27 = v26;
    uint64_t v28 = 0;
    uint64_t v51 = 0;
    uint64_t v52 = (uint64_t)&v51;
    uint64_t v53 = 0x3010000000;
    uint64_t v55 = 0;
    v56 = 0;
    while (v26->_engines[v28] != (NSISEngine *)v11)
    {
      if (++v28 == 3) {
        goto LABEL_38;
      }
    }
    unsigned int value = v26->_engineVarIndexes[v28].value;
    if (value != -1) {
      goto LABEL_41;
    }
LABEL_38:
    unsigned int value = v27->_overflowEngines
          ? [(NSISVariable *)v27 overflowEngineVarIndexForEngine:v11]
          : -1;
LABEL_41:
    uint64_t v30 = *(void *)(*(void *)(v11 + 192) + (((unint64_t)value >> 3) & 0x1FFFFFF8));
    uint64_t v31 = value & 0x3F;
    long long v32 = (void *)(v30 + 32 * v31);
    if (*((_DWORD *)v32 + 4) == -1)
    {
      long long v35 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v35 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", v27, v11 file lineNumber description];
    }
    if ((NSISVariable *)*v32 != v27)
    {
      long long v36 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v36 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *v32, v27 file lineNumber description];
    }
    uint64_t v33 = v30 + 32 * v31;
    if (*(unsigned char *)(v33 + 24))
    {
      uint64_t v37 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v37 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *v32 file lineNumber description];
    }
    long long v34 = *(uint64_t ***)(v33 + 8);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __120__NSISEngine_handleUnsatisfiableRow_usingInfeasibilityHandlingBehavior_prospectiveRowHead_mutuallyExclusiveConstraints___block_invoke;
    v42[3] = &unk_1E5C56B70;
    v42[5] = a2;
    v42[6] = a3;
    v42[4] = &v51;
    if (!_col_enumerateRowsUntil(v11, (uint64_t)v34, (uint64_t)v42)) {
      break;
    }
    _pivotToMakeColNewHeadOfRow(v11, v11, v34, *(void *)(v52 + 32), *(void *)(v52 + 40), 0);
    char v12 = _mutuallyExclusiveConstraintsForUnsatisfiableRow(a2, a3);
    _Block_object_dispose(&v51, 8);
  }
  if (v41)
  {
    uint64_t *v41 = v11;
    v41[1] = (uint64_t)v34;
  }
  _Block_object_dispose(&v51, 8);
  return 1;
}

- (NSISVariable)errorVariableIntroducedByBreakingConstraintWithMarker:(int)a3 errorIsPositive:
{
  if (!a1) {
    return 0;
  }
  uint64_t v6 = 0;
  if (a3) {
    double v7 = 1.0;
  }
  else {
    double v7 = -1.0;
  }
  while ((void *)a2[v6 + 3] != a1)
  {
    if (++v6 == 3) {
      goto LABEL_9;
    }
  }
  unsigned int v8 = *((_DWORD *)a2 + v6 + 12);
  if (v8 != -1) {
    goto LABEL_12;
  }
LABEL_9:
  if (a2[2]) {
    unsigned int v8 = [a2 overflowEngineVarIndexForEngine:a1];
  }
  else {
    unsigned int v8 = -1;
  }
LABEL_12:
  uint64_t v9 = *(void *)(a1[24] + (((unint64_t)v8 >> 3) & 0x1FFFFFF8)) + 32 * (v8 & 0x3F);
  if (*(_DWORD *)(v9 + 16) == -1)
  {
    uint64_t v16 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", a2, a1 file lineNumber description];
  }
  if (*(void **)v9 != a2)
  {
    double v17 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *(void *)v9, a2 file lineNumber description];
  }
  long long v10 = +[NSISVariable variableWithDelegate:a1 valueRestriction:1 shouldBeMinimized:1];
  uint64_t v11 = _engineVar_addForVariableIfNeeded((uint64_t)a1, v10);
  long long v13 = (void *)v12;
  if (*(unsigned char *)(v12 + 24))
  {
    int v18 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *v13 file lineNumber description];
  }
  uint64_t v14 = v13[1];
  _objectiveRow_addColWithPriorityTimes(a1[50], a1[51], 1100.0, 1.0, v11, v14);
  -[NSISEngine replaceMarker:withMarkerPlusCoefficient:timesCol:]((uint64_t)a1, (uint64_t)a1, v9, v11, v14, v7);
  if (a3) {
    -[NSISEngine setPositiveErrorVar:forBrokenConstraintWithMarker:](a1, (uint64_t)v10, (uint64_t)a2);
  }
  else {
    -[NSISEngine setNegativeErrorVar:forBrokenConstraintWithMarker:](a1, (uint64_t)v10, (uint64_t)a2);
  }
  return v10;
}

- (void)replaceMarker:(uint64_t)a3 withMarkerPlusCoefficient:(uint64_t)a4 timesCol:(uint64_t)a5
{
  if (a1)
  {
    uint64_t v7 = *(void *)(a3 + 8);
    if (*(unsigned char *)(a3 + 24))
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = ___row_addColWithCoefficient_block_invoke;
      v24[3] = &__block_descriptor_48_e16_v24__0_________8ls32l8;
      void v24[4] = a2;
      v24[5] = v7;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = ___row_addColWithCoefficient_block_invoke_2;
      v23[3] = &__block_descriptor_48_e16_v24__0_________8ls32l8;
      v23[4] = a2;
      void v23[5] = v7;
      unsigned int v13 = *(_DWORD *)(*(void *)a5 + 16);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = ___row_rawAddCol_block_invoke;
      void v26[3] = &unk_1E5C570C0;
      v26[4] = a2;
      v26[5] = v24;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = ___row_rawAddCol_block_invoke_2;
      v25[3] = &unk_1E5C570C0;
      v25[4] = a2;
      v25[5] = v23;
      NSISLinExpAddVarWithProcessors((unsigned __int16 *)(v7 + 16), v13, (uint64_t)v26, (uint64_t)v25, -a6);
    }
    else
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      uint64_t v16 = __63__NSISEngine_replaceMarker_withMarkerPlusCoefficient_timesCol___block_invoke;
      double v17 = &__block_descriptor_72_e16_v24__0_________8ls32l8s56l8;
      uint64_t v18 = a2;
      uint64_t v19 = v7;
      double v20 = a6;
      uint64_t v21 = a4;
      uint64_t v22 = a5;
      uint64_t v14 = v7;
      unsigned int v8 = (uint64_t **)(v7 + 8);
      uint64_t Next = NSBitSetFindNext((uint64_t **)(v7 + 8), 0);
      if (Next != 0x7FFFFFFFFFFFFFFFLL)
      {
        for (unint64_t i = Next; i != 0x7FFFFFFFFFFFFFFFLL; unint64_t i = NSBitSetFindNext(v8, i + 1))
          v16((double *)v15, a2, *(void *)(*(void *)(a2 + 232 + 40 * ((i >> 30) & 1)) + 8 * ((i & 0xBFFFFFFF) / 0x17))+ 88 * ((i & 0xBFFFFFFF) % 0x17));
      }
      uint64_t v11 = NSBitSetFindNext((uint64_t **)(v14 + 24), 0);
      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        for (uint64_t j = v11; j != 0x7FFFFFFFFFFFFFFFLL; uint64_t j = NSBitSetFindNext((uint64_t **)(v14 + 24), j + 1))
          v16((double *)v15, a2, *(void *)(*(void *)(a2 + 232 + 40 * (((j + 0x40000000) >> 30) & 1))+ 8 * (((j + 0x40000000) & 0xBFFFFFFF) / 0x17uLL))+ 88 * (((j + 0x40000000) & 0xBFFFFFFF) % 0x17));
      }
    }
  }
}

void __63__NSISEngine_replaceMarker_withMarkerPlusCoefficient_timesCol___block_invoke(double *a1, uint64_t a2, uint64_t a3)
{
  double v3 = a1[6];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__NSISEngine_replaceMarker_withMarkerPlusCoefficient_timesCol___block_invoke_2;
  v13[3] = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  v13[4] = a2;
  v13[5] = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__NSISEngine_replaceMarker_withMarkerPlusCoefficient_timesCol___block_invoke_3;
  v12[3] = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  v12[4] = a2;
  v12[5] = a3;
  uint64_t v4 = *((void *)a1 + 5);
  uint64_t v5 = *((void *)a1 + 8);
  uint64_t v6 = (unsigned __int16 *)(a3 + 16);
  if (*(unsigned char *)(a3 + 80))
  {
    uint64_t v9 = *(void *)v6;
    unsigned int v10 = *(_DWORD *)(*(void *)v4 + 16);
    unsigned int v11 = *(_DWORD *)(*(void *)v5 + 16);
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = ___row_rawReplaceColWithColPlusDeltaTimesNewCol_block_invoke;
    uint64_t v23 = &unk_1E5C570C0;
    uint64_t v24 = a2;
    uint64_t v25 = v13;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = ___row_rawReplaceColWithColPlusDeltaTimesNewCol_block_invoke_2;
    double v17 = &unk_1E5C570C0;
    uint64_t v18 = a2;
    uint64_t v19 = v12;
    -[NSISObjectiveLinearExpression replaceVar:withVarPlusDelta:timesVar:processVarNewToReceiver:processVarDroppedFromReceiver:](v9, v10, v11, (uint64_t)&v20, (uint64_t)&v14, v3);
  }
  else
  {
    unsigned int v7 = *(_DWORD *)(*(void *)v4 + 16);
    unsigned int v8 = *(_DWORD *)(*(void *)v5 + 16);
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = ___row_rawReplaceColWithColPlusDeltaTimesNewCol_block_invoke_3;
    uint64_t v23 = &unk_1E5C570C0;
    uint64_t v24 = a2;
    uint64_t v25 = v13;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = ___row_rawReplaceColWithColPlusDeltaTimesNewCol_block_invoke_4;
    double v17 = &unk_1E5C570C0;
    uint64_t v18 = a2;
    uint64_t v19 = v12;
    NSISLinExpReplaceVarWithVarPlusDeltaTimesNewVar(v6, v7, v8, (uint64_t)&v20, (uint64_t)&v14, v3);
  }
}

void __63__NSISEngine_replaceMarker_withMarkerPlusCoefficient_timesCol___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 40) + 8);
  if (HIWORD(v3)) {
    unint64_t v4 = v3 - 0x40000000;
  }
  else {
    unint64_t v4 = v3;
  }
  if (HIWORD(v3)) {
    uint64_t v5 = (unsigned int *)(a3 + 24);
  }
  else {
    uint64_t v5 = (unsigned int *)(a3 + 8);
  }
  NSBitSetAddIndex(v5, v4);
}

- (void)setNegativeErrorVar:(uint64_t)a3 forBrokenConstraintWithMarker:
{
  if (result)
  {
    if (a2)
    {
      uint64_t v5 = (void *)_NSFaultInObject();
      return (void *)[v5 setObject:a2 forKey:a3];
    }
    else
    {
      uint64_t v6 = (void *)[result _brokenConstraintNegativeErrorsIfAvailable];
      return (void *)[v6 removeObjectForKey:a3];
    }
  }
  return result;
}

- (void)setPositiveErrorVar:(uint64_t)a3 forBrokenConstraintWithMarker:
{
  if (result)
  {
    if (a2)
    {
      uint64_t v5 = (void *)_NSFaultInObject();
      return (void *)[v5 setObject:a2 forKey:a3];
    }
    else
    {
      uint64_t v6 = (void *)[result _brokenConstraintPositiveErrorsIfAvailable];
      return (void *)[v6 removeObjectForKey:a3];
    }
  }
  return result;
}

- (BOOL)tryToChangeConstraintSuchThatMarker:(id)a3 isReplacedByMarkerPlusDelta:(double)a4 undoHandler:(id)a5
{
  _AssertAutoLayoutOnAllowedThreadsOnly((uint64_t)self);
  double v10 = fabs(a4);
  if (v10 >= INFINITY && v10 <= INFINITY) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSISEngine.m", 2798, @"Invalid parameter not satisfying: %@", @"isfinite(delta)");
  }
  if (!self->_unsatisfiabilityHandler)
  {
    [(NSISEngine *)self constraintDidChangeSuchThatMarker:a3 shouldBeReplacedByMarkerPlusDelta:a4];
    return 1;
  }
  recordedOperations = self->_recordedOperations;
  if (recordedOperations)
  {
    uint64_t v12 = NSISWrapExactFloat(a4);
    _NSISRecordOperation(recordedOperations, a2, v13, v14, v15, v16, v17, v18, a3, v12);
  }
  -[NSISEngine _coreReplaceMarker:withMarkerPlusDelta:]((uint64_t)self, a3, a4);
  if (_NSConstraintBasedLayoutDebugEngineConsistency()) {
    [(NSISEngine *)self verifyInternalIntegrity];
  }
  uint64_t v19 = -[NSISEngine tryToOptimizeReturningMutuallyExclusiveConstraints]((uint64_t)self);
  if (!v19)
  {
    delegate = self->_delegate;
    if (delegate && !self->_engineDelegateCallsDisabledCount) {
      [(NSISEngineDelegate *)delegate constraintsDidChangeInEngine:self];
    }
    return 1;
  }
  uint64_t v20 = v19;
  -[NSISEngine _coreReplaceMarker:withMarkerPlusDelta:]((uint64_t)self, a3, -a4);
  if (!self->_revertsAfterUnsatisfiabilityHandler) {
    (*((void (**)(id))a5 + 2))(a5);
  }
  unsatisfiabilityHandler = (void (**)(id, void))self->_unsatisfiabilityHandler;
  if (unsatisfiabilityHandler) {
    unsatisfiabilityHandler[2](unsatisfiabilityHandler, v20);
  }
  if (self->_revertsAfterUnsatisfiabilityHandler) {
    (*((void (**)(id))a5 + 2))(a5);
  }
  return 0;
}

- (void)constraintDidChangeSuchThatMarker:(id)a3 shouldBeReplacedByMarkerPlusDelta:(double)a4
{
  _AssertAutoLayoutOnAllowedThreadsOnly((uint64_t)self);
  double v8 = fabs(a4);
  if (v8 >= INFINITY && v8 <= INFINITY) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSISEngine.m", 2774, @"Invalid parameter not satisfying: %@", @"isfinite(delta)");
  }
  recordedOperations = self->_recordedOperations;
  if (recordedOperations)
  {
    uint64_t v10 = NSISWrapExactFloat(a4);
    _NSISRecordOperation(recordedOperations, a2, v11, v12, v13, v14, v15, v16, a3, v10);
  }
  -[NSISEngine _coreReplaceMarker:withMarkerPlusDelta:]((uint64_t)self, a3, a4);
  if (_NSConstraintBasedLayoutDebugEngineConsistency()) {
    [(NSISEngine *)self verifyInternalIntegrity];
  }
  -[NSISEngine _optimizeIfNotDisabled]((uint64_t)self);
  delegate = self->_delegate;
  if (delegate && !self->_engineDelegateCallsDisabledCount)
  {
    [(NSISEngineDelegate *)delegate constraintsDidChangeInEngine:self];
  }
}

- (uint64_t)_coreReplaceMarker:(double)a3 withMarkerPlusDelta:
{
  if (result && a2)
  {
    uint64_t v5 = result;
    uint64_t v6 = 0;
    while (a2[v6 + 3] != result)
    {
      if (++v6 == 3) {
        goto LABEL_8;
      }
    }
    if (*((_DWORD *)a2 + v6 + 12) != -1) {
      goto LABEL_10;
    }
LABEL_8:
    if (!a2[2]) {
      return result;
    }
    double result = [a2 overflowEngineVarIndexForEngine:result];
    if (result == -1) {
      return result;
    }
LABEL_10:
    ++*(_DWORD *)(v5 + 148);
    -[NSISEngine _flushPendingRemovals]();
    uint64_t v7 = 0;
    while (a2[v7 + 3] != v5)
    {
      if (++v7 == 3) {
        goto LABEL_15;
      }
    }
    unsigned int v8 = *((_DWORD *)a2 + v7 + 12);
    if (v8 != -1) {
      goto LABEL_18;
    }
LABEL_15:
    if (a2[2]) {
      unsigned int v8 = [a2 overflowEngineVarIndexForEngine:v5];
    }
    else {
      unsigned int v8 = -1;
    }
LABEL_18:
    uint64_t v9 = *(void *)(*(void *)(v5 + 192) + (((unint64_t)v8 >> 3) & 0x1FFFFFF8));
    uint64_t v10 = v8 & 0x3F;
    uint64_t v11 = v9 + 32 * v10;
    if (*(_DWORD *)(v11 + 16) == -1)
    {
      uint64_t v22 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", a2, v5 file lineNumber description];
    }
    if (*(void **)v11 != a2)
    {
      uint64_t v23 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *(void *)v11, a2 file lineNumber description];
    }
    uint64_t v12 = v9 + 32 * v10;
    if (*(unsigned char *)(v12 + 24))
    {
      uint64_t v18 = *(void *)(v12 + 8);
      double result = NSISLinExpIncrementConstant(v18 + 16, -a3);
      int v20 = (*(_DWORD *)(*(void *)v18 + 24) >> 1) & 3;
      if (v20 == 2)
      {
        if (v19 == 0.0)
        {
          if (*(double *)&NSISEpsilon > 0.0) {
            return result;
          }
        }
        else if (fabs(v19) < *(double *)&NSISEpsilon)
        {
          return result;
        }
      }
      else if (v20 != 1 || v19 >= 0.0)
      {
        return result;
      }
      uint64_t v21 = *(void **)(v5 + 8);
      return [v21 addObject:a2];
    }
    else
    {
      uint64_t v13 = *(void *)(v12 + 8);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      uint64_t v26 = __53__NSISEngine__coreReplaceMarker_withMarkerPlusDelta___block_invoke;
      uint64_t v27 = &unk_1E5C56E40;
      uint64_t v29 = v5;
      uint64_t v30 = v13;
      double v31 = a3;
      uint64_t v28 = v5;
      uint64_t v24 = v13;
      uint64_t v14 = (uint64_t **)(v13 + 8);
      uint64_t Next = NSBitSetFindNext((uint64_t **)(v13 + 8), 0);
      if (Next != 0x7FFFFFFFFFFFFFFFLL)
      {
        for (unint64_t i = Next; i != 0x7FFFFFFFFFFFFFFFLL; unint64_t i = NSBitSetFindNext(v14, i + 1))
          v26(v25, v5, (id **)(*(void *)(*(void *)(v5 + 232 + 40 * ((i >> 30) & 1)) + 8 * ((i & 0xBFFFFFFF) / 0x17))+ 88 * ((i & 0xBFFFFFFF) % 0x17)));
      }
      double result = NSBitSetFindNext((uint64_t **)(v24 + 24), 0);
      if (result != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v17 = result;
        do
        {
          v26(v25, v5, (id **)(*(void *)(*(void *)(v5 + 232 + 40 * (((v17 + 0x40000000) >> 30) & 1))+ 8 * (((v17 + 0x40000000) & 0xBFFFFFFF) / 0x17uLL))+ 88 * (((v17 + 0x40000000) & 0xBFFFFFFF) % 0x17)));
          double result = NSBitSetFindNext((uint64_t **)(v24 + 24), v17 + 1);
          uint64_t v17 = result;
        }
        while (result != 0x7FFFFFFFFFFFFFFFLL);
      }
    }
  }
  return result;
}

double __53__NSISEngine__coreReplaceMarker_withMarkerPlusDelta___block_invoke(uint64_t *a1, uint64_t a2, id **a3)
{
  int v6 = *((_DWORD *)a3 + 20);
  LOBYTE(v7) = v6;
  if ((v6 & 1) == 0)
  {
    NSISLinExpConstant((uint64_t)(a3 + 2));
    int v7 = *((_DWORD *)a3 + 20);
  }
  double v8 = *((double *)a1 + 7);
  uint64_t v9 = a1[6];
  if (v7)
  {
    -[NSISObjectiveLinearExpression replaceVar:withVarPlusDelta:]((unsigned __int16 *)a3[2], *(_DWORD *)(*(void *)v9 + 16), v8);
    if (v6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  NSISLinExpReplaceVarWithVarPlusDelta((uint64_t)(a3 + 2), *(_DWORD *)(*(void *)v9 + 16), v8);
  if ((v6 & 1) == 0) {
LABEL_7:
  }
    _noteValueOfVariableChanged(a1[4], a2, *a3);
LABEL_8:
  if (((_BYTE)(*a3)[3] & 6) == 0) {
    return result;
  }
  double result = NSISLinExpConstant((uint64_t)(a3 + 2));
  int v11 = (*((_DWORD *)*a3 + 6) >> 1) & 3;
  if (v11 == 2)
  {
    if (result == 0.0)
    {
      double result = *(double *)&NSISEpsilon;
      if (*(double *)&NSISEpsilon > 0.0) {
        return result;
      }
    }
    else
    {
      double result = fabs(result);
      if (result < *(double *)&NSISEpsilon) {
        return result;
      }
    }
  }
  else if (v11 != 1 || result >= 0.0)
  {
    return result;
  }
  uint64_t v12 = *(void **)(a1[4] + 8);
  id v13 = **a3;
  [v12 addObject:v13];
  return result;
}

- (double)valueForVariable:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  uint64_t v5 = 0;
  while (*((NSISEngine **)a3 + v5 + 3) != self)
  {
    if (++v5 == 3) {
      goto LABEL_7;
    }
  }
  if (*((_DWORD *)a3 + v5 + 12) != -1) {
    goto LABEL_9;
  }
LABEL_7:
  if (!*((void *)a3 + 2) || [a3 overflowEngineVarIndexForEngine:self] == -1) {
    return 0.0;
  }
LABEL_9:
  uint64_t v6 = 0;
  while (*((NSISEngine **)a3 + v6 + 3) != self)
  {
    if (++v6 == 3) {
      goto LABEL_15;
    }
  }
  unsigned int v8 = *((_DWORD *)a3 + v6 + 12);
  if (v8 != -1) {
    goto LABEL_18;
  }
LABEL_15:
  if (*((void *)a3 + 2)) {
    unsigned int v8 = [a3 overflowEngineVarIndexForEngine:self];
  }
  else {
    unsigned int v8 = -1;
  }
LABEL_18:
  uint64_t v9 = *(void *)((char *)self->_engineVarTable.blocks + (((unint64_t)v8 >> 3) & 0x1FFFFFF8))
     + 32 * (v8 & 0x3F);
  if (*(_DWORD *)(v9 + 16) == -1)
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", a3, self file lineNumber description];
  }
  if (*(id *)v9 != a3)
  {
    int v11 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *(void *)v9, a3 file lineNumber description];
  }
  return [(NSISEngine *)self valueForEngineVar:v9];
}

- (void)addVariableToBeOptimized:(id)a3 priority:(double)a4
{
  recordedOperations = self->_recordedOperations;
  if (recordedOperations)
  {
    uint64_t v9 = NSISWrapExactFloat(a4);
    _NSISRecordOperation(recordedOperations, a2, v10, v11, v12, v13, v14, v15, a3, v9);
  }
  ++self->_totalChangeCount;
  uint64_t v16 = _engineVar_addForVariableIfNeeded((uint64_t)self, a3);
  uint64_t v18 = (void *)v17;
  if (*(unsigned char *)(v17 + 24))
  {
    uint64_t v24 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *v18 file lineNumber description];
  }
  uint64_t v19 = v18[1];
  if (_NSConstraintBasedLayoutVariableChangeTransactions())
  {
    if (v18[3])
    {
      uint64_t v25 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *v18 file lineNumber description];
    }
    uint64_t v20 = v18[1];
    uint64_t v21 = NSBitSetCount(v20 + 8);
    if (!(NSBitSetCount(v20 + 24) + v21)) {
      _noteValueOfVariableChanged((uint64_t)self, v16, v18);
    }
  }
  engine = self->_objectiveRow.engine;
  storage = self->_objectiveRow.storage;
  _objectiveRow_addColWithPriorityTimes((uint64_t)engine, (uint64_t)storage, a4, 1.0, v16, v19);
}

- (void)setShouldIntegralize:(BOOL)a3
{
  if (a3 && setShouldIntegralize__onceToken != -1) {
    dispatch_once(&setShouldIntegralize__onceToken, &__block_literal_global_40);
  }
}

uint64_t __50__NSISEngine_constraintsAffectingValueOfVariable___block_invoke(uint64_t a1, uint64_t a2, id **a3)
{
  uint64_t result = [**a3 markedConstraint];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void **)(a1 + 32);
    return [v6 addObject:v5];
  }
  return result;
}

- (void)removeConstraintWithMarker:(id)a3
{
  _AssertAutoLayoutOnAllowedThreadsOnly((uint64_t)self);
  if (_NSConstraintBasedLayoutDebugEngineConsistency()
    && ![(NSISEngine *)self hasValue:0 forVariable:a3])
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSISEngine.m", 2624, @"Trying to remove a constraint which is not present, %@", objc_msgSend(a3, "markedConstraint"));
    if (!a3) {
      return;
    }
  }
  else if (!a3)
  {
    return;
  }
  uint64_t v6 = 0;
  while (*((NSISEngine **)a3 + v6 + 3) != self)
  {
    if (++v6 == 3) {
      goto LABEL_9;
    }
  }
  if (*((_DWORD *)a3 + v6 + 12) != -1) {
    goto LABEL_11;
  }
LABEL_9:
  if (!*((void *)a3 + 2) || [a3 overflowEngineVarIndexForEngine:self] == -1) {
    return;
  }
LABEL_11:
  uint64_t v7 = [a3 markedConstraint];
  kdebug_trace();
  uint64_t v14 = 0;
  ++self->_totalChangeCount;
  while (*((NSISEngine **)a3 + v14 + 3) != self)
  {
    if (++v14 == 3) {
      goto LABEL_16;
    }
  }
  unsigned int v15 = *((_DWORD *)a3 + v14 + 12);
  if (v15 != -1) {
    goto LABEL_19;
  }
LABEL_16:
  if (*((void *)a3 + 2)) {
    unsigned int v15 = [a3 overflowEngineVarIndexForEngine:self];
  }
  else {
    unsigned int v15 = -1;
  }
LABEL_19:
  uint64_t v16 = *(void *)((char *)self->_engineVarTable.blocks + (((unint64_t)v15 >> 3) & 0x1FFFFFF8));
  uint64_t v17 = v15 & 0x3F;
  uint64_t v18 = (uint64_t *)(v16 + 32 * v17);
  if (*((_DWORD *)v18 + 4) == -1)
  {
    uint64_t v47 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", a3, self file lineNumber description];
  }
  if ((id)*v18 != a3)
  {
    uint64_t v48 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *v18, a3 file lineNumber description];
  }
  uint64_t v19 = v16 + 32 * v17;
  int v22 = *(_DWORD *)(v19 + 24);
  uint64_t v21 = (int *)(v19 + 24);
  char v20 = v22;
  if ((v22 & 1) == 0)
  {
    uint64_t v23 = (void *)v7;
    uint64_t v24 = *(void *)(v16 + 32 * v17 + 8);
    uint64_t v25 = NSBitSetCount(v24 + 8);
    uint64_t v26 = v24 + 24;
    uint64_t v27 = v23;
    uint64_t v18 = (uint64_t *)(v16 + 32 * v17);
    uint64_t v28 = NSBitSetCount(v26);
    if (self->_accumulatingRemovals && (unint64_t)(v28 + v25) >= 2)
    {
      pendingRemovals = self->_pendingRemovals;
      if (!pendingRemovals)
      {
        self->_pendingRemovals = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        self->_pendingMarkerDelegates = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:0 capacity:0];
        pendingRemovals = self->_pendingRemovals;
      }
      [(NSMutableArray *)pendingRemovals addObject:a3];
      [(NSHashTable *)self->_pendingMarkerDelegates addObject:v27];
      objc_msgSend((id)objc_msgSend(v27, "firstAnchor"), "_accumulateReferenceLayoutItemsIntoTable:", self->_pendingMarkerDelegates);
      uint64_t v30 = (void *)[v27 secondAnchor];
      pendingMarkerDelegates = self->_pendingMarkerDelegates;
      [v30 _accumulateReferenceLayoutItemsIntoTable:pendingMarkerDelegates];
      return;
    }
  }
  recordedOperations = self->_recordedOperations;
  if (recordedOperations) {
    _NSISRecordOperation(recordedOperations, a2, v8, v9, v10, v11, v12, v13, a3, 0);
  }
  if (_NSConstraintBasedLayoutDebug()) {
    NSLog(&cfstr_EnginePRemovin.isa, self, [a3 markedConstraint]);
  }
  int v33 = *v21;
  if (v20)
  {
    if ((v33 & 1) == 0)
    {
      v50 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v50 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISRow _engineVar_row(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 115, @"Tried accessing the row index for a variable that isn't a row head:%@", *v18 file lineNumber description];
    }
    _row_remove((uint64_t)self, (uint64_t)self, *(void *)(v16 + 32 * v17 + 8));
    goto LABEL_68;
  }
  if (v33)
  {
    uint64_t v49 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *v18 file lineNumber description];
  }
  long long v34 = *(uint64_t ***)(v16 + 32 * v17 + 8);
  long long v53 = 0uLL;
  if (![(NSISEngine *)(uint64_t)self outgoingRowHeadForRemovingConstraintWithMarker:(uint64_t)v34 outgoingRowHead:&v53])
  {
    unsigned int v35 = *((_DWORD *)self->_objectiveRow.storage + 2);
    if (HIWORD(v35)) {
      unint64_t v36 = v35 - 0x40000000;
    }
    else {
      unint64_t v36 = v35;
    }
    if (HIWORD(v35)) {
      uint64_t v37 = (uint64_t *)(v34 + 3);
    }
    else {
      uint64_t v37 = (uint64_t *)(v34 + 1);
    }
    if (NSBitSetContainsIndex(v37, v36))
    {
      uint64_t v38 = NSBitSetCount((uint64_t)(v34 + 1));
      if (NSBitSetCount((uint64_t)(v34 + 3)) + v38)
      {
        uint64_t v39 = NSBitSetCount((uint64_t)(v34 + 1));
        if (NSBitSetCount((uint64_t)(v34 + 3)) + v39 != 1
          || ((unsigned int v40 = *((_DWORD *)self->_objectiveRow.storage + 2), !HIWORD(v40))
            ? (unint64_t v41 = v40)
            : (unint64_t v41 = v40 - 0x40000000),
              !HIWORD(v40) ? (v42 = (uint64_t *)(v34 + 1)) : (v42 = (uint64_t *)(v34 + 3)),
              (NSBitSetContainsIndex(v42, v41) & 1) == 0))
        {
          uint64_t v52 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "-[NSISEngine removeConstraintWithMarker:]"), @"NSISEngine.m", 2688, @"Marker should not be in a body row.");
        }
      }
      _col_removeFromAllRows((uint64_t)self, (uint64_t)v34);
    }
    unsigned int v43 = *((_DWORD *)self->_objectiveRow.storage + 2);
    if (HIWORD(v43)) {
      unint64_t v44 = v43 - 0x40000000;
    }
    else {
      unint64_t v44 = v43;
    }
    if (HIWORD(v43)) {
      uint64_t v45 = (uint64_t *)(v34 + 3);
    }
    else {
      uint64_t v45 = (uint64_t *)(v34 + 1);
    }
    if (NSBitSetContainsIndex(v45, v44))
    {
      uint64_t v51 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "-[NSISEngine removeConstraintWithMarker:]"), @"NSISEngine.m", 2691, @"The marker should no longer be in the objective row.");
    }
LABEL_68:
    _engineVar_rawRemove((uint64_t)self, v18);
    goto LABEL_69;
  }
  _pivotToMakeColNewHeadOfRow((uint64_t)self, (uint64_t)self, v34, v53, *((uint64_t *)&v53 + 1), 1);
LABEL_69:
  long long v53 = 0uLL;
  if (-[NSISEngine positiveErrorVarForBrokenConstraintWithMarker:errorVar:]((BOOL)self, (uint64_t)a3, (uint64_t *)&v53))
  {
    _objectiveRow_addColWithPriorityTimes((uint64_t)self->_objectiveRow.engine, (uint64_t)self->_objectiveRow.storage, 1100.0, -1.0, v53, *((uint64_t *)&v53 + 1));
    objc_msgSend(-[NSISEngine _brokenConstraintPositiveErrorsIfAvailable](self, "_brokenConstraintPositiveErrorsIfAvailable"), "removeObjectForKey:", a3);
    _engineVar_rawRemove(v53, **((uint64_t ***)&v53 + 1));
  }
  if (-[NSISEngine negativeErrorVarForBrokenConstraintWithMarker:errorVar:]((BOOL)self, (uint64_t)a3, (uint64_t *)&v53))
  {
    _objectiveRow_addColWithPriorityTimes((uint64_t)self->_objectiveRow.engine, (uint64_t)self->_objectiveRow.storage, 1100.0, -1.0, v53, *((uint64_t *)&v53 + 1));
    objc_msgSend(-[NSISEngine _brokenConstraintNegativeErrorsIfAvailable](self, "_brokenConstraintNegativeErrorsIfAvailable"), "removeObjectForKey:", a3);
    _engineVar_rawRemove(v53, **((uint64_t ***)&v53 + 1));
  }
  if (_NSConstraintBasedLayoutDebugEngineConsistency()) {
    [(NSISEngine *)self verifyInternalIntegrity];
  }
  -[NSISEngine _optimizeIfNotDisabled]((uint64_t)self);
  delegate = self->_delegate;
  if (delegate && !self->_engineDelegateCallsDisabledCount) {
    [(NSISEngineDelegate *)delegate constraintsDidChangeInEngine:self];
  }
  kdebug_trace();
}

- (BOOL)positiveErrorVarForBrokenConstraintWithMarker:(uint64_t *)a3 errorVar:
{
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = objc_msgSend((id)objc_msgSend((id)result, "_brokenConstraintPositiveErrorsIfAvailable"), "objectForKey:", a2);
    uint64_t result = v5 != 0;
    if (a3)
    {
      if (v5)
      {
        uint64_t v6 = 0;
        while (v5[v6 + 3] != v4)
        {
          if (++v6 == 3) {
            goto LABEL_9;
          }
        }
        unsigned int v7 = *((_DWORD *)v5 + v6 + 12);
        if (v7 != -1) {
          goto LABEL_12;
        }
LABEL_9:
        if (v5[2]) {
          unsigned int v7 = [v5 overflowEngineVarIndexForEngine:v4];
        }
        else {
          unsigned int v7 = -1;
        }
LABEL_12:
        uint64_t v8 = *(void *)(*(void *)(v4 + 192) + (((unint64_t)v7 >> 3) & 0x1FFFFFF8));
        uint64_t v9 = v7 & 0x3F;
        uint64_t v10 = (void *)(v8 + 32 * v9);
        if (*((_DWORD *)v10 + 4) == -1)
        {
          uint64_t v13 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          [v13 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", v5, v4 file lineNumber description];
        }
        if ((void *)*v10 != v5)
        {
          uint64_t v14 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          [v14 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *v10, v5 file lineNumber description];
        }
        uint64_t v11 = v8 + 32 * v9;
        if (*(unsigned char *)(v11 + 24))
        {
          unsigned int v15 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          [v15 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *v10 file lineNumber description];
        }
        uint64_t v12 = *(void *)(v11 + 8);
        *a3 = v4;
        a3[1] = v12;
        return 1;
      }
    }
  }
  return result;
}

- (id)_brokenConstraintPositiveErrorsIfAvailable
{
  if (self->_brokenConstraintPositiveErrors) {
    return (id)_NSFaultInObject();
  }
  else {
    return 0;
  }
}

- (BOOL)negativeErrorVarForBrokenConstraintWithMarker:(uint64_t *)a3 errorVar:
{
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = objc_msgSend((id)objc_msgSend((id)result, "_brokenConstraintNegativeErrorsIfAvailable"), "objectForKey:", a2);
    uint64_t result = v5 != 0;
    if (a3)
    {
      if (v5)
      {
        uint64_t v6 = 0;
        while (v5[v6 + 3] != v4)
        {
          if (++v6 == 3) {
            goto LABEL_9;
          }
        }
        unsigned int v7 = *((_DWORD *)v5 + v6 + 12);
        if (v7 != -1) {
          goto LABEL_12;
        }
LABEL_9:
        if (v5[2]) {
          unsigned int v7 = [v5 overflowEngineVarIndexForEngine:v4];
        }
        else {
          unsigned int v7 = -1;
        }
LABEL_12:
        uint64_t v8 = *(void *)(*(void *)(v4 + 192) + (((unint64_t)v7 >> 3) & 0x1FFFFFF8));
        uint64_t v9 = v7 & 0x3F;
        uint64_t v10 = (void *)(v8 + 32 * v9);
        if (*((_DWORD *)v10 + 4) == -1)
        {
          uint64_t v13 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          [v13 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", v5, v4 file lineNumber description];
        }
        if ((void *)*v10 != v5)
        {
          uint64_t v14 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          [v14 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *v10, v5 file lineNumber description];
        }
        uint64_t v11 = v8 + 32 * v9;
        if (*(unsigned char *)(v11 + 24))
        {
          unsigned int v15 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          [v15 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *v10 file lineNumber description];
        }
        uint64_t v12 = *(void *)(v11 + 8);
        *a3 = v4;
        a3[1] = v12;
        return 1;
      }
    }
  }
  return result;
}

- (id)_brokenConstraintNegativeErrorsIfAvailable
{
  if (self->_brokenConstraintNegativeErrors) {
    return (id)_NSFaultInObject();
  }
  else {
    return 0;
  }
}

- (BOOL)outgoingRowHeadForRemovingConstraintWithMarker:(uint64_t)a3 outgoingRowHead:(_OWORD *)a4
{
  if (!a1) {
    return 0;
  }
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3010000000;
  uint64_t v45 = a1;
  uint64_t v46 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0x7FEFFFFFFFFFFFFFLL;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  unint64_t v36 = __77__NSISEngine_outgoingRowHeadForRemovingConstraintWithMarker_outgoingRowHead___block_invoke;
  uint64_t v37 = &unk_1E5C56DC8;
  uint64_t v5 = (uint64_t **)(a3 + 8);
  uint64_t v38 = &v47;
  uint64_t v39 = &v41;
  for (unint64_t i = NSBitSetFindNext((uint64_t **)(a3 + 8), 0); i != 0x7FFFFFFFFFFFFFFFLL; unint64_t i = NSBitSetFindNext(v5, i + 1))
    v36((uint64_t)v35, a2, *(void *)(*(void *)(a2 + 232 + 40 * ((i >> 30) & 1)) + 8 * ((i & 0xBFFFFFFF) / 0x17))+ 88 * ((i & 0xBFFFFFFF) % 0x17));
  uint64_t v17 = (uint64_t **)(a3 + 24);
  for (uint64_t j = NSBitSetFindNext((uint64_t **)(a3 + 24), 0); j != 0x7FFFFFFFFFFFFFFFLL; uint64_t j = NSBitSetFindNext(v17, j + 1))
    v36((uint64_t)v35, a2, *(void *)(*(void *)(a2 + 232 + 40 * (((j + 0x40000000) >> 30) & 1))+ 8 * (((j + 0x40000000) & 0xBFFFFFFF) / 0x17uLL))+ 88 * (((j + 0x40000000) & 0xBFFFFFFF) % 0x17));
  if (!*((unsigned char *)v48 + 24))
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    uint64_t v28 = __77__NSISEngine_outgoingRowHeadForRemovingConstraintWithMarker_outgoingRowHead___block_invoke_2;
    uint64_t v29 = &unk_1E5C56DF0;
    uint64_t v33 = a2;
    uint64_t v34 = a3;
    uint64_t v30 = &v47;
    double v31 = v40;
    long long v32 = &v41;
    for (unint64_t k = NSBitSetFindNext(v5, 0); k != 0x7FFFFFFFFFFFFFFFLL; unint64_t k = NSBitSetFindNext(v5, k + 1))
      v28((uint64_t)v27, a2, *(void *)(*(void *)(a2 + 232 + 40 * ((k >> 30) & 1)) + 8 * ((k & 0xBFFFFFFF) / 0x17))+ 88 * ((k & 0xBFFFFFFF) % 0x17));
    for (uint64_t m = NSBitSetFindNext(v17, 0); m != 0x7FFFFFFFFFFFFFFFLL; uint64_t m = NSBitSetFindNext(v17, m + 1))
      v28((uint64_t)v27, a2, *(void *)(*(void *)(a2 + 232 + 40 * (((m + 0x40000000) >> 30) & 1))+ 8 * (((m + 0x40000000) & 0xBFFFFFFF) / 0x17uLL))+ 88 * (((m + 0x40000000) & 0xBFFFFFFF) % 0x17));
  }
  if (!*((unsigned char *)v48 + 24))
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    char v20 = __77__NSISEngine_outgoingRowHeadForRemovingConstraintWithMarker_outgoingRowHead___block_invoke_3;
    uint64_t v21 = &unk_1E5C56DF0;
    uint64_t v25 = a2;
    uint64_t v26 = a3;
    int v22 = &v47;
    uint64_t v23 = v40;
    uint64_t v24 = &v41;
    for (unint64_t n = NSBitSetFindNext(v5, 0); n != 0x7FFFFFFFFFFFFFFFLL; unint64_t n = NSBitSetFindNext(v5, n + 1))
      v20((uint64_t)v19, a2, *(void *)(*(void *)(a2 + 232 + 40 * ((n >> 30) & 1)) + 8 * ((n & 0xBFFFFFFF) / 0x17))+ 88 * ((n & 0xBFFFFFFF) % 0x17));
    for (iunint64_t i = NSBitSetFindNext(v17, 0); ii != 0x7FFFFFFFFFFFFFFFLL; iunint64_t i = NSBitSetFindNext(v17, ii + 1))
      v20((uint64_t)v19, a2, *(void *)(*(void *)(a2 + 232 + 40 * (((ii + 0x40000000) >> 30) & 1))+ 8 * (((ii + 0x40000000) & 0xBFFFFFFF) / 0x17uLL))+ 88 * (((ii + 0x40000000) & 0xBFFFFFFF) % 0x17));
  }
  if (!*((unsigned char *)v48 + 24))
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __77__NSISEngine_outgoingRowHeadForRemovingConstraintWithMarker_outgoingRowHead___block_invoke_4;
    v18[3] = &unk_1E5C56E18;
    v18[4] = a1;
    v18[5] = &v47;
    v18[6] = &v41;
    _col_enumerateRowsUntil(a2, a3, (uint64_t)v18);
  }
  if (a4) {
    *a4 = *((_OWORD *)v42 + 2);
  }
  BOOL v12 = *((unsigned char *)v48 + 24) != 0;
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);
  return v12;
}

uint64_t __77__NSISEngine_outgoingRowHeadForRemovingConstraintWithMarker_outgoingRowHead___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if ((*(_DWORD *)(*(void *)a3 + 24) & 6) == 4)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    uint64_t v3 = *(void *)(*(void *)(result + 40) + 8);
    *(void *)(v3 + 32) = a2;
    *(void *)(v3 + 40) = a3;
  }
  return result;
}

void __77__NSISEngine_outgoingRowHeadForRemovingConstraintWithMarker_outgoingRowHead___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((*(unsigned char *)(*(void *)a3 + 24) & 6) != 0)
  {
    uint64_t v6 = a3 + 16;
    double v7 = NSISLinExpCoefficientForVar(a3 + 16, *(_DWORD *)(**(void **)(a1 + 64) + 16));
    if (v7 < 0.0)
    {
      double v8 = -NSISLinExpConstant(v6) / v7;
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      if (!*(unsigned char *)(v9 + 24) || v8 < *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        *(unsigned char *)(v9 + 24) = 1;
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
        uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
        *(void *)(v10 + 32) = a2;
        *(void *)(v10 + 40) = a3;
      }
    }
  }
}

void __77__NSISEngine_outgoingRowHeadForRemovingConstraintWithMarker_outgoingRowHead___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((*(unsigned char *)(*(void *)a3 + 24) & 6) != 0)
  {
    uint64_t v6 = a3 + 16;
    double v7 = NSISLinExpCoefficientForVar(a3 + 16, *(_DWORD *)(**(void **)(a1 + 64) + 16));
    double v8 = NSISLinExpConstant(v6) / v7;
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    if (!*(unsigned char *)(v9 + 24) || v8 < *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      *(unsigned char *)(v9 + 24) = 1;
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      *(void *)(v10 + 32) = a2;
      *(void *)(v10 + 40) = a3;
    }
  }
}

- (void)removeVariableToBeOptimized:(id)a3 priority:(double)a4
{
  recordedOperations = self->_recordedOperations;
  if (recordedOperations)
  {
    uint64_t v9 = NSISWrapExactFloat(a4);
    _NSISRecordOperation(recordedOperations, a2, v10, v11, v12, v13, v14, v15, a3, v9);
  }
  ++self->_totalChangeCount;
  if (a3)
  {
    uint64_t v16 = 0;
    while (*((NSISEngine **)a3 + v16 + 3) != self)
    {
      if (++v16 == 3) {
        goto LABEL_9;
      }
    }
    if (*((_DWORD *)a3 + v16 + 12) != -1) {
      goto LABEL_11;
    }
LABEL_9:
    if (!*((void *)a3 + 2) || [a3 overflowEngineVarIndexForEngine:self] == -1) {
      return;
    }
LABEL_11:
    uint64_t v17 = 0;
    while (*((NSISEngine **)a3 + v17 + 3) != self)
    {
      if (++v17 == 3) {
        goto LABEL_16;
      }
    }
    unsigned int v18 = *((_DWORD *)a3 + v17 + 12);
    if (v18 != -1) {
      goto LABEL_19;
    }
LABEL_16:
    if (*((void *)a3 + 2)) {
      unsigned int v18 = [a3 overflowEngineVarIndexForEngine:self];
    }
    else {
      unsigned int v18 = -1;
    }
LABEL_19:
    uint64_t v19 = *(void *)((char *)self->_engineVarTable.blocks + (((unint64_t)v18 >> 3) & 0x1FFFFFF8));
    uint64_t v20 = v18 & 0x3F;
    uint64_t v21 = v19 + 32 * v20;
    if (*(_DWORD *)(v21 + 16) == -1)
    {
      double v31 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", a3, self file lineNumber description];
    }
    if (*(id *)v21 != a3)
    {
      long long v32 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *(void *)v21, a3 file lineNumber description];
    }
    uint64_t v22 = v19 + 32 * v20;
    uint64_t v23 = (unsigned char *)(v22 + 24);
    if (*(unsigned char *)(v22 + 24))
    {
      _objectiveRow_addRowBodyWithPriorityTimes((uint64_t)self->_objectiveRow.engine, (uint64_t)self->_objectiveRow.storage, a4, -1.0, (uint64_t)self, *(void *)(v22 + 8));
    }
    else
    {
      uint64_t v24 = *(void *)(v22 + 8);
      uint64_t v25 = NSBitSetCount(v24 + 8);
      if (NSBitSetCount(v24 + 24) + v25)
      {
        if (isMaps_once != -1) {
          dispatch_once(&isMaps_once, &__block_literal_global_594);
        }
        if (!isMaps_isMaps
          || ((unsigned int v26 = *((_DWORD *)self->_objectiveRow.storage + 2), !HIWORD(v26))
            ? (unint64_t v27 = v26)
            : (unint64_t v27 = v26 - 0x40000000),
              !HIWORD(v26) ? (uint64_t v28 = (uint64_t *)(v24 + 8)) : (uint64_t v28 = (uint64_t *)(v24 + 24)),
              NSBitSetContainsIndex(v28, v27)))
        {
          _objectiveRow_addColWithPriorityTimes((uint64_t)self->_objectiveRow.engine, (uint64_t)self->_objectiveRow.storage, a4, -1.0, (uint64_t)self, v24);
        }
      }
    }
    if ((*v23 & 1) == 0)
    {
      uint64_t v29 = *(void *)(v19 + 32 * v20 + 8);
      uint64_t v30 = NSBitSetCount(v29 + 8);
      if (!(NSBitSetCount(v29 + 24) + v30))
      {
        _engineVar_rawRemove((uint64_t)self, (uint64_t *)(v19 + 32 * v20));
      }
    }
  }
}

BOOL __77__NSISEngine_outgoingRowHeadForRemovingConstraintWithMarker_outgoingRowHead___block_invoke_4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1[4] + 408);
  if (a3 != v3)
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    uint64_t v4 = *(void *)(a1[6] + 8);
    *(void *)(v4 + 32) = a2;
    *(void *)(v4 + 40) = a3;
  }
  return a3 != v3;
}

uint64_t __120__NSISEngine_handleUnsatisfiableRow_usingInfeasibilityHandlingBehavior_prospectiveRowHead_mutuallyExclusiveConstraints___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 48) == a3 || (*(_DWORD *)(*(void *)a3 + 24) & 6) != 4) {
    return 0;
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v3 + 32) = a2;
  *(void *)(v3 + 40) = a3;
  return 1;
}

- (unint64_t)rowCount
{
  uint64_t v2 = 0;
  unint64_t v3 = 0;
  rowTables = self->_rowTables;
  char v5 = 1;
  do
  {
    char v6 = v5;
    double v7 = &rowTables[v2];
    unint64_t blocksCount = v7->blocksCount;
    uint64_t v9 = NSBitSetCount((uint64_t)&v7->freeIndexes);
    char v5 = 0;
    unint64_t v3 = v3 - v9 + 23 * blocksCount;
    uint64_t v2 = 1;
  }
  while ((v6 & 1) != 0);
  return v3;
}

id __45__NSISEngine__brokenConstraintPositiveErrors__block_invoke()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  return v0;
}

id __45__NSISEngine__brokenConstraintNegativeErrors__block_invoke()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  return v0;
}

- (id)constraintsAffectingValueOfVariable:(id)a3
{
  char v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (a3)
  {
    uint64_t v6 = 0;
    while (*((NSISEngine **)a3 + v6 + 3) != self)
    {
      if (++v6 == 3) {
        goto LABEL_7;
      }
    }
    if (*((_DWORD *)a3 + v6 + 12) != -1) {
      goto LABEL_9;
    }
LABEL_7:
    if (!*((void *)a3 + 2) || [a3 overflowEngineVarIndexForEngine:self] == -1) {
      return v5;
    }
LABEL_9:
    uint64_t v7 = 0;
    while (*((NSISEngine **)a3 + v7 + 3) != self)
    {
      if (++v7 == 3) {
        goto LABEL_14;
      }
    }
    unsigned int v8 = *((_DWORD *)a3 + v7 + 12);
    if (v8 != -1) {
      goto LABEL_17;
    }
LABEL_14:
    if (*((void *)a3 + 2)) {
      unsigned int v8 = [a3 overflowEngineVarIndexForEngine:self];
    }
    else {
      unsigned int v8 = -1;
    }
LABEL_17:
    uint64_t v9 = *(void *)((char *)self->_engineVarTable.blocks + (((unint64_t)v8 >> 3) & 0x1FFFFFF8));
    uint64_t v10 = v8 & 0x3F;
    uint64_t v11 = v9 + 32 * v10;
    if (*(_DWORD *)(v11 + 16) == -1)
    {
      uint64_t v17 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", a3, self file lineNumber description];
    }
    if (*(id *)v11 != a3)
    {
      unsigned int v18 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *(void *)v11, a3 file lineNumber description];
    }
    uint64_t v12 = v9 + 32 * v10;
    if (*(unsigned char *)(v12 + 24))
    {
      uint64_t v13 = *(void *)(v12 + 8);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      void v19[2] = __50__NSISEngine_constraintsAffectingValueOfVariable___block_invoke;
      v19[3] = &unk_1E5C56DA0;
      v19[4] = v5;
      uint64_t v14 = (unsigned __int16 *)(v13 + 16);
      if (*(unsigned char *)(v13 + 80))
      {
        uint64_t v15 = *(void *)v14;
        uint64_t v20 = MEMORY[0x1E4F143A8];
        uint64_t v21 = 3221225472;
        uint64_t v22 = ___row_enumerateCols_block_invoke;
        uint64_t v23 = &unk_1E5C570C0;
        uint64_t v24 = self;
        uint64_t v25 = v19;
        -[NSISObjectiveLinearExpression enumerateVars:](v15, (uint64_t)&v20);
      }
      else
      {
        uint64_t v20 = MEMORY[0x1E4F143A8];
        uint64_t v21 = 3221225472;
        uint64_t v22 = ___row_enumerateCols_block_invoke_2;
        uint64_t v23 = &unk_1E5C570C0;
        uint64_t v24 = self;
        uint64_t v25 = v19;
        NSISLinExpEnumerateVars(v14, (uint64_t)&v20);
      }
    }
  }
  return v5;
}

uint64_t *__63__NSISEngine_replaceMarker_withMarkerPlusCoefficient_timesCol___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 40) + 8);
  if (HIWORD(v3)) {
    unint64_t v4 = v3 - 0x40000000;
  }
  else {
    unint64_t v4 = v3;
  }
  if (HIWORD(v3)) {
    char v5 = (uint64_t *)(a3 + 24);
  }
  else {
    char v5 = (uint64_t *)(a3 + 8);
  }
  return NSBitSetRemoveIndex(v5, v4);
}

- (uint64_t)_brokenConstraintPositiveErrors
{
  if (result) {
    return _NSFaultInObject();
  }
  return result;
}

- (uint64_t)_brokenConstraintNegativeErrors
{
  if (result) {
    return _NSFaultInObject();
  }
  return result;
}

- (uint64_t)markerForBrokenConstraintWithPositiveErrorVar:(void *)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  unsigned int v3 = (void *)[a1 _brokenConstraintPositiveErrorsIfAvailable];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v11;
LABEL_4:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v11 != v6) {
      objc_enumerationMutation(v3);
    }
    uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
    if ([v3 objectForKey:v8] == a2) {
      return v8;
    }
    if (v5 == ++v7)
    {
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        goto LABEL_4;
      }
      return 0;
    }
  }
}

- (uint64_t)markerForBrokenConstraintWithNegativeErrorVar:(void *)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  unsigned int v3 = (void *)[a1 _brokenConstraintNegativeErrorsIfAvailable];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v11;
LABEL_4:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v11 != v6) {
      objc_enumerationMutation(v3);
    }
    uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
    if ([v3 objectForKey:v8] == a2) {
      return v8;
    }
    if (v5 == ++v7)
    {
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        goto LABEL_4;
      }
      return 0;
    }
  }
}

- (uint64_t)nsis_shouldIntegralizeVariable:
{
  return 0;
}

- (BOOL)nsis_valueOfVariableIsUserObservable:(id)a3
{
  return 0;
}

- (id)nsis_descriptionOfVariable:(id)a3
{
  uint64_t v5 = (void *)-[NSISEngine markerForBrokenConstraintWithPositiveErrorVar:](self, (uint64_t)a3);
  if (v5)
  {
    uint64_t v6 = @".brokenPosError";
  }
  else
  {
    uint64_t v5 = (void *)-[NSISEngine markerForBrokenConstraintWithNegativeErrorVar:](self, (uint64_t)a3);
    if (!v5) {
      return (id)objc_msgSend(NSString, "stringWithFormat:", @"<unknown var (bug!) with engine as delegate:%p>", a3);
    }
    uint64_t v6 = @".brokenNegError";
  }
  uint64_t v7 = (void *)[v5 description];
  return (id)[v7 stringByAppendingString:v6];
}

- (double)integralizationAdjustmentForMarker:(id)a3
{
  return 0.0;
}

- (BOOL)shouldIntegralize
{
  return 0;
}

void __35__NSISEngine_setShouldIntegralize___block_invoke()
{
}

- (BOOL)_dirtyListContainsObservation:(BOOL)result
{
  if (result) {
    return *(void *)(a2 + 8) || *(void *)(a2 + 16) || *(void *)(result + 176) == a2;
  }
  return result;
}

- (BOOL)_dirtyListContainsObservable:(BOOL)result
{
  if (result) {
    return *(void *)(a2 + 40) || *(void *)(a2 + 48) || *(void *)(result + 48) == a2;
  }
  return result;
}

- (uint64_t)_dirtyListPrependObservable:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (*(void *)(a2 + 48) || *(void *)(a2 + 40)) {
      uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__dirtyListPrependObservable_, result, @"NSISEngine.m", 577, @"Dirty observable list is corrupt.");
    }
    *(void *)(a2 + 40) = *(void *)(v3 + 48);
    *(void *)(a2 + 48) = 0;
    uint64_t v4 = *(void *)(v3 + 48);
    if (v4) {
      *(void *)(v4 + 48) = a2;
    }
    *(void *)(v3 + 48) = a2;
  }
  return result;
}

- (uint64_t)_dirtyListRemoveObservable:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = *(void *)(a2 + 40);
    if (v2) {
      *(void *)(v2 + 48) = *(void *)(a2 + 48);
    }
    uint64_t v3 = *(void *)(a2 + 48);
    if (v3)
    {
      *(void *)(v3 + 40) = *(void *)(a2 + 40);
    }
    else if (*(void *)(result + 48) == a2)
    {
      *(void *)(result + 48) = v2;
    }
    *(void *)(a2 + 40) = 0;
    *(void *)(a2 + 48) = 0;
  }
  return result;
}

uint64_t __47__NSISEngine_performPendingChangeNotifications__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 emitValueIfNeededWithEngine:*(void *)(a1 + 32)];
}

- (void)performPendingChangeNotificationsForItem:(id)a3
{
  [(NSISEngine *)self optimize];
  BOOL allowUnoptimizedReads = self->_allowUnoptimizedReads;
  self->_BOOL allowUnoptimizedReads = 1;
  variableObservables = self->_variableObservables;
  if (variableObservables)
  {
    objc_msgSend(-[NSMapTable objectForKey:](variableObservables, "objectForKey:", objc_msgSend(a3, "nsli_minXVariable")), "emitValueIfNeeded");
    objc_msgSend(-[NSMapTable objectForKey:](self->_variableObservables, "objectForKey:", objc_msgSend(a3, "nsli_minYVariable")), "emitValueIfNeeded");
    objc_msgSend(-[NSMapTable objectForKey:](self->_variableObservables, "objectForKey:", objc_msgSend(a3, "nsli_boundsWidthVariable")), "emitValueIfNeeded");
    objc_msgSend(-[NSMapTable objectForKey:](self->_variableObservables, "objectForKey:", objc_msgSend(a3, "nsli_boundsHeightVariable")), "emitValueIfNeeded");
  }
  if (NSISObjectTableCount((uint64_t)self->_variablesObservations) >= 1)
  {
    objc_msgSend((id)NSISObjectTableFind((uint64_t)self->_variablesObservations, objc_msgSend(a3, "nsli_minXVariable")), "emitValueIfNeededWithEngine:", self);
    objc_msgSend((id)NSISObjectTableFind((uint64_t)self->_variablesObservations, objc_msgSend(a3, "nsli_minYVariable")), "emitValueIfNeededWithEngine:", self);
    objc_msgSend((id)NSISObjectTableFind((uint64_t)self->_variablesObservations, objc_msgSend(a3, "nsli_boundsWidthVariable")), "emitValueIfNeededWithEngine:", self);
    objc_msgSend((id)NSISObjectTableFind((uint64_t)self->_variablesObservations, objc_msgSend(a3, "nsli_boundsHeightVariable")), "emitValueIfNeededWithEngine:", self);
  }
  [(NSObservable *)self->_variableChangeTransactionSignal receiveObservedValue:*MEMORY[0x1E4F1CFD0]];
  self->_BOOL allowUnoptimizedReads = allowUnoptimizedReads;
}

- (void)performModifications:(id)a3 withUnsatisfiableConstraintsHandler:(id)a4
{
  id unsatisfiabilityHandler = self->_unsatisfiabilityHandler;
  self->_id unsatisfiabilityHandler = (id)[a4 copy];
  (*((void (**)(id))a3 + 2))(a3);

  self->_id unsatisfiabilityHandler = unsatisfiabilityHandler;
}

- ($738B17BD11CC339B30296C0EA03CEC2B)engineVarIndexForVariable:(id)a3
{
  uint64_t v5 = 0;
  while (*((NSISEngine **)a3 + v5 + 3) != self)
  {
    if (++v5 == 3) {
      goto LABEL_6;
    }
  }
  unsigned int v6 = *((_DWORD *)a3 + v5 + 12);
  if (v6 != -1) {
    goto LABEL_9;
  }
LABEL_6:
  if (*((void *)a3 + 2)) {
    unsigned int v6 = [a3 overflowEngineVarIndexForEngine:self];
  }
  else {
    unsigned int v6 = -1;
  }
LABEL_9:
  uint64_t v7 = *(void *)((char *)self->_engineVarTable.blocks + (((unint64_t)v6 >> 3) & 0x1FFFFFF8))
     + 32 * (v6 & 0x3F);
  if (*(_DWORD *)(v7 + 16) == -1)
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", a3, self file lineNumber description];
  }
  if (*(id *)v7 != a3)
  {
    long long v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *(void *)v7, a3 file lineNumber description];
  }
  return *($738B17BD11CC339B30296C0EA03CEC2B *)(v7 + 16);
}

- (id)variableForEngineVarIndex:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)(*((void *)self->_engineVarTable.blocks + (a3.var0 >> 6))
                                                 + 32 * (a3.var0 & 0x3F)));
}

- (void)beginRecording
{
  if (!self->_recordedOperations) {
    self->_recordedOperations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
}

- (id)recordedCommandsData
{
  recordedOperations = self->_recordedOperations;
  if (recordedOperations) {
    return (id)[MEMORY[0x1E4F28F98] dataWithPropertyList:recordedOperations format:100 options:0 error:0];
  }
  else {
    return 0;
  }
}

- (unint64_t)replayCommandsData:(id)a3 verifyingIntegrity:(BOOL)a4
{
  uint64_t v6 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:0];
  if (!v6) {
    return -1;
  }
  uint64_t v7 = v6;
  if (!_NSIsNSDictionary()) {
    return -1;
  }
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__NSISEngine_replayCommandsData_verifyingIntegrity___block_invoke;
  v10[3] = &unk_1E5C56C38;
  v10[5] = v7;
  void v10[6] = &v12;
  v10[4] = self;
  BOOL v11 = a4;
  [(NSISEngine *)self withoutOptimizingAtEndRunBlockWithAutomaticOptimizationDisabled:v10];
  unint64_t v8 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __52__NSISEngine_replayCommandsData_verifyingIntegrity___block_invoke(uint64_t a1)
{
  uint64_t result = _NSISPlaybackOperationsOnEngine(*(void **)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (uint64_t)tryToOptimizeReturningMutuallyExclusiveConstraints
{
  if (result)
  {
    uint64_t v1 = result;
    _AssertAutoLayoutOnAllowedThreadsOnly(result);
    uint64_t result = -[NSISEngine fixUpValueRestrictionViolationsWithInfeasibilityHandlingBehavior:](v1, 1);
    if (!result)
    {
      _minimizeConstantInObjectiveRow(v1, *(void *)(v1 + 400), *(void *)(v1 + 408));
      return 0;
    }
  }
  return result;
}

double __36__NSISEngine_rebuildFromConstraints__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _col_removeFromAllRows(a2, a3);
}

double __36__NSISEngine_rebuildFromConstraints__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _row_remove(*(void *)(a1 + 32), a2, a3);
}

uint64_t __36__NSISEngine_rebuildFromConstraints__block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _addToEngine:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __35__NSISEngine__flushPendingRemovals__block_invoke(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)(a1 + 32);
  while (a2[v4 + 3] != v5)
  {
    if (++v4 == 3) {
      goto LABEL_8;
    }
  }
  if (*((_DWORD *)a2 + v4 + 12) != -1) {
    goto LABEL_11;
  }
LABEL_8:
  if (!a2[2] || [a2 overflowEngineVarIndexForEngine:v5] == -1) {
    return 0;
  }
  uint64_t v5 = *(void *)(a1 + 32);
LABEL_11:
  uint64_t v7 = 0;
  while (a2[v7 + 3] != v5)
  {
    if (++v7 == 3) {
      goto LABEL_16;
    }
  }
  unsigned int v8 = *((_DWORD *)a2 + v7 + 12);
  if (v8 != -1) {
    goto LABEL_19;
  }
LABEL_16:
  if (a2[2]) {
    unsigned int v8 = [a2 overflowEngineVarIndexForEngine:v5];
  }
  else {
    unsigned int v8 = -1;
  }
LABEL_19:
  uint64_t v9 = *(void *)(*(void *)(v5 + 192) + (((unint64_t)v8 >> 3) & 0x1FFFFFF8));
  uint64_t v10 = v8 & 0x3F;
  uint64_t v11 = v9 + 32 * v10;
  if (*(_DWORD *)(v11 + 16) == -1)
  {
    uint64_t v15 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", a2, v5 file lineNumber description];
  }
  if (*(void **)v11 != a2)
  {
    uint64_t v16 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *(void *)v11, a2 file lineNumber description];
  }
  uint64_t v12 = v9 + 32 * v10;
  if ((*(unsigned char *)(v12 + 24) & 1) == 0)
  {
    uint64_t v13 = *(void *)(v12 + 8);
    uint64_t v14 = NSBitSetCount(v13 + 8);
    return NSBitSetCount(v13 + 24) + v14;
  }
  return 0;
}

uint64_t __35__NSISEngine__flushPendingRemovals__block_invoke_2(uint64_t a1)
{
  unint64_t v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  unint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  return (v2 < v3) - (v2 > v3);
}

- (void)withoutOptimizingAtEndRunBlockWithAutomaticOptimizationDisabled:(id)a3
{
}

- (void)withDelegateCallsDisabled:(id)a3
{
}

- (BOOL)hasValueForPossiblyDeallocatedVariable:(id)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__NSISEngine_hasValueForPossiblyDeallocatedVariable___block_invoke;
  v8[3] = &unk_1E5C56D00;
  v8[4] = a3;
  v8[5] = &v9;
  [(NSISEngine *)self enumerateRows:v8];
  if (*((unsigned char *)v10 + 24))
  {
    BOOL v5 = 1;
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__NSISEngine_hasValueForPossiblyDeallocatedVariable___block_invoke_2;
    v7[3] = &unk_1E5C56D28;
    v7[4] = a3;
    v7[5] = &v9;
    -[NSISEngine enumerateCols:](self, (uint64_t)v7);
    BOOL v5 = *((unsigned char *)v10 + 24) != 0;
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

id __53__NSISEngine_hasValueForPossiblyDeallocatedVariable___block_invoke(uint64_t a1, uint64_t a2, id **a3, unsigned char *a4)
{
  id result = **a3;
  if (result == *(id *)(a1 + 32))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

char *__53__NSISEngine_hasValueForPossiblyDeallocatedVariable___block_invoke_2(uint64_t a1, uint64_t a2, id **a3)
{
  uint64_t v5 = NSBitSetCount((uint64_t)(a3 + 1));
  id result = (char *)NSBitSetCount((uint64_t)(a3 + 3));
  if (&result[v5])
  {
    id result = (char *)**a3;
    if (result == *(char **)(a1 + 32)) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

- (double)valueForExpression:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)((char *)a3 + 16);
  uint64_t v8 = 0;
  uint64_t v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  double v11 = 0.0;
  double v11 = NSISLinExpConstant((uint64_t)a3 + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__NSISEngine_valueForExpression___block_invoke;
  v7[3] = &unk_1E5C56D50;
  v7[4] = self;
  v7[5] = &v8;
  NSISLinExpEnumerateVarsAndCoefficients(v4, (uint64_t)v7);
  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

double __33__NSISEngine_valueForExpression___block_invoke(uint64_t a1, unsigned int a2, double a3)
{
  double v5 = [(NSISEngine *)*(unsigned char **)(a1 + 32) valueForEngineVar:*(void *)(*(void *)(*(void *)(a1 + 32) + 192) + 8 * (a2 >> 6)) + 32 * (a2 & 0x3F)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)(v6 + 24) + a3 * v5;
  *(double *)(v6 + 24) = result;
  return result;
}

- (BOOL)hasValue:(double *)a3 forExpression:(id)a4
{
  uint64_t v6 = (unsigned __int16 *)((char *)a4 + 16);
  uint64_t v12 = 0;
  uint64_t v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  double v15 = 0.0;
  double v15 = NSISLinExpConstant((uint64_t)a4 + 16);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__NSISEngine_hasValue_forExpression___block_invoke;
  v11[3] = &unk_1E5C56D78;
  v11[4] = self;
  v11[5] = &v12;
  BOOL v7 = NSISLinExpEnumerateVarsAndCoefficientsUntil(v6, (uint64_t)v11);
  if (a3) {
    char v8 = v7;
  }
  else {
    char v8 = 1;
  }
  if ((v8 & 1) == 0) {
    *a3 = v13[3];
  }
  BOOL v9 = !v7;
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __37__NSISEngine_hasValue_forExpression___block_invoke(uint64_t a1, unsigned int a2, double a3)
{
  double v7 = 0.0;
  int v5 = [(NSISEngine *)*(void *)(a1 + 32) hasValue:*(void *)(a1 + 32) forEngineVar:*(void *)(*(void *)(*(void *)(a1 + 32) + 192) + 8 * (a2 >> 6)) + 32 * (a2 & 0x3F)];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + a3 * v7;
  return v5 ^ 1u;
}

- (BOOL)containsVariable:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v5 = 0;
  while (*((NSISEngine **)a3 + v5 + 3) != self)
  {
    if (++v5 == 3) {
      goto LABEL_8;
    }
  }
  if (*((_DWORD *)a3 + v5 + 12) != -1) {
    goto LABEL_10;
  }
LABEL_8:
  if (!*((void *)a3 + 2) || [a3 overflowEngineVarIndexForEngine:self] == -1) {
    return 0;
  }
LABEL_10:
  uint64_t v7 = 0;
  while (*((NSISEngine **)a3 + v7 + 3) != self)
  {
    if (++v7 == 3) {
      goto LABEL_16;
    }
  }
  unsigned int v8 = *((_DWORD *)a3 + v7 + 12);
  if (v8 != -1) {
    goto LABEL_19;
  }
LABEL_16:
  if (*((void *)a3 + 2)) {
    unsigned int v8 = [a3 overflowEngineVarIndexForEngine:self];
  }
  else {
    unsigned int v8 = -1;
  }
LABEL_19:
  uint64_t v9 = *(void *)((char *)self->_engineVarTable.blocks + (((unint64_t)v8 >> 3) & 0x1FFFFFF8));
  uint64_t v10 = v8 & 0x3F;
  uint64_t v11 = v9 + 32 * v10;
  if (*(_DWORD *)(v11 + 16) == -1)
  {
    double v15 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", a3, self file lineNumber description];
  }
  if (*(id *)v11 != a3)
  {
    uint64_t v16 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *(void *)v11, a3 file lineNumber description];
  }
  uint64_t v12 = v9 + 32 * v10;
  if (*(unsigned char *)(v12 + 24)) {
    return 1;
  }
  uint64_t v13 = *(void *)(v12 + 8);
  uint64_t v14 = NSBitSetCount(v13 + 8);
  return NSBitSetCount(v13 + 24) + v14 != 0;
}

- (void)endBookkeepingForVariableIfUnused:(id)a3
{
  if (a3)
  {
    uint64_t v5 = 0;
    while (*((NSISEngine **)a3 + v5 + 3) != self)
    {
      if (++v5 == 3) {
        goto LABEL_7;
      }
    }
    if (*((_DWORD *)a3 + v5 + 12) != -1) {
      goto LABEL_9;
    }
LABEL_7:
    if (!*((void *)a3 + 2) || [a3 overflowEngineVarIndexForEngine:self] == -1) {
      return;
    }
LABEL_9:
    uint64_t v6 = 0;
    while (*((NSISEngine **)a3 + v6 + 3) != self)
    {
      if (++v6 == 3) {
        goto LABEL_14;
      }
    }
    unsigned int v7 = *((_DWORD *)a3 + v6 + 12);
    if (v7 != -1) {
      goto LABEL_17;
    }
LABEL_14:
    if (*((void *)a3 + 2)) {
      unsigned int v7 = [a3 overflowEngineVarIndexForEngine:self];
    }
    else {
      unsigned int v7 = -1;
    }
LABEL_17:
    uint64_t v8 = *(void *)((char *)self->_engineVarTable.blocks + (((unint64_t)v7 >> 3) & 0x1FFFFFF8));
    uint64_t v9 = v7 & 0x3F;
    uint64_t v10 = v8 + 32 * v9;
    if (*(_DWORD *)(v10 + 16) == -1)
    {
      uint64_t v14 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", a3, self file lineNumber description];
    }
    if (*(id *)v10 != a3)
    {
      double v15 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *(void *)v10, a3 file lineNumber description];
    }
    uint64_t v11 = v8 + 32 * v9;
    if ((*(unsigned char *)(v11 + 24) & 1) == 0)
    {
      uint64_t v12 = *(void *)(v11 + 8);
      uint64_t v13 = NSBitSetCount(v12 + 8);
      if (!(NSBitSetCount(v12 + 24) + v13))
      {
        _engineVar_rawRemove((uint64_t)self, (uint64_t *)(v8 + 32 * v9));
      }
    }
  }
}

+ (BOOL)_dbg_anyEngineContainsVariable:(id)a3
{
  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], @"_dbg_anyEngineContainsVariable is unsupported, rebuild with TRACK_ENGINES=1", 0 reason userInfo]);
}

- (void)changeVariableToBeOptimized:(id)a3 fromPriority:(double)a4 toPriority:(double)a5
{
  _AssertAutoLayoutOnAllowedThreadsOnly((uint64_t)self);
  recordedOperations = self->_recordedOperations;
  if (recordedOperations)
  {
    uint64_t v11 = NSISWrapExactFloat(a4);
    NSISWrapExactFloat(a5);
    _NSISRecordOperation(recordedOperations, a2, v12, v13, v14, v15, v16, v17, a3, v11);
  }
  uint64_t v18 = 0;
  ++self->_totalChangeCount;
  while (*((NSISEngine **)a3 + v18 + 3) != self)
  {
    if (++v18 == 3) {
      goto LABEL_8;
    }
  }
  unsigned int v19 = *((_DWORD *)a3 + v18 + 12);
  if (v19 != -1) {
    goto LABEL_11;
  }
LABEL_8:
  if (*((void *)a3 + 2)) {
    unsigned int v19 = [a3 overflowEngineVarIndexForEngine:self];
  }
  else {
    unsigned int v19 = -1;
  }
LABEL_11:
  uint64_t v20 = *(void *)((char *)self->_engineVarTable.blocks + (((unint64_t)v19 >> 3) & 0x1FFFFFF8));
  uint64_t v21 = v19 & 0x3F;
  uint64_t v22 = v20 + 32 * v21;
  if (*(_DWORD *)(v22 + 16) == -1)
  {
    uint64_t v28 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", a3, self file lineNumber description];
  }
  if (*(id *)v22 != a3)
  {
    uint64_t v29 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *(void *)v22, a3 file lineNumber description];
  }
  uint64_t v23 = v20 + 32 * v21;
  uint64_t v24 = *(void *)(v23 + 8);
  engine = self->_objectiveRow.engine;
  storage = self->_objectiveRow.storage;
  if (*(unsigned char *)(v23 + 24))
  {
    _objectiveRow_addRowBodyWithPriorityTimes((uint64_t)engine, (uint64_t)storage, a4, -1.0, (uint64_t)self, v24);
    _objectiveRow_addRowBodyWithPriorityTimes((uint64_t)self->_objectiveRow.engine, (uint64_t)self->_objectiveRow.storage, a5, 1.0, (uint64_t)self, v24);
  }
  else
  {
    _objectiveRow_addColWithPriorityTimes((uint64_t)engine, (uint64_t)storage, a4, -1.0, (uint64_t)self, v24);
    _objectiveRow_addColWithPriorityTimes((uint64_t)self->_objectiveRow.engine, (uint64_t)self->_objectiveRow.storage, a5, 1.0, (uint64_t)self, v24);
  }
  if (_NSConstraintBasedLayoutDebugEngineConsistency()) {
    [(NSISEngine *)self verifyInternalIntegrity];
  }
  -[NSISEngine _optimizeIfNotDisabled]((uint64_t)self);
  delegate = self->_delegate;
  if (delegate && !self->_engineDelegateCallsDisabledCount)
  {
    [(NSISEngineDelegate *)delegate constraintsDidChangeInEngine:self];
  }
}

- (id)observableForVariable:(id)a3
{
  variableObservables = self->_variableObservables;
  if (!variableObservables)
  {
    variableObservables = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:10];
    self->_variableObservables = variableObservables;
  }
  id v6 = [(NSMapTable *)variableObservables objectForKey:a3];
  if (!v6)
  {
    id v6 = +[_NSISVariableObservable observableForVariable:a3 inEngine:self];
    [(NSMapTable *)self->_variableObservables setObject:v6 forKey:a3];
  }
  return v6;
}

- (void)removeObservableForVariable:(id)a3
{
  id v5 = -[NSMapTable objectForKey:](self->_variableObservables, "objectForKey:");
  if (v5)
  {
    -[NSISEngine _dirtyListRemoveObservable:]((uint64_t)self, (uint64_t)v5);
    variableObservables = self->_variableObservables;
    [(NSMapTable *)variableObservables removeObjectForKey:a3];
  }
}

- (BOOL)hasObservableForVariable:(id)a3
{
  return [(NSMapTable *)self->_variableObservables objectForKey:a3] != 0;
}

- (id)variableChangeTransactionSignal
{
  id result = self->_variableChangeTransactionSignal;
  if (!result)
  {
    id result = (id)objc_opt_new();
    self->_variableChangeTransactionSignal = (NSObservable *)result;
  }
  return result;
}

- (BOOL)isObservingChangesForVariable:(id)a3
{
  return NSISObjectTableFind((uint64_t)self->_variablesObservations, (unint64_t)a3) != 0;
}

+ (void)setEnableEngineTrace:(BOOL)a3
{
}

+ (NSString)traceFileSuffix
{
  return 0;
}

- ($918B3F39C841E394E687484E57A87E10)traceState
{
  return 0;
}

+ (void)setLogOnInvalidUseFromBGThread:(BOOL)a3
{
}

- (void)enumerateOriginalConstraints:(void *)a1
{
  if (a1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__NSISEngine_enumerateOriginalConstraints___block_invoke;
    v5[3] = &unk_1E5C56E68;
    v5[4] = a2;
    [a1 enumerateRows:v5];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __43__NSISEngine_enumerateOriginalConstraints___block_invoke_2;
    v4[3] = &unk_1E5C56E90;
    v4[4] = a2;
    -[NSISEngine enumerateCols:](a1, (uint64_t)v4);
  }
}

uint64_t __43__NSISEngine_enumerateOriginalConstraints___block_invoke(uint64_t a1, uint64_t a2, id **a3)
{
  if (*a3) {
    id v4 = **a3;
  }
  else {
    id v4 = 0;
  }
  uint64_t result = [v4 markedConstraint];
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v6();
  }
  return result;
}

uint64_t __43__NSISEngine_enumerateOriginalConstraints___block_invoke_2(uint64_t a1, uint64_t a2, id **a3)
{
  uint64_t v5 = NSBitSetCount((uint64_t)(a3 + 1));
  uint64_t result = NSBitSetCount((uint64_t)(a3 + 3));
  if (result + v5)
  {
    uint64_t result = [**a3 markedConstraint];
    if (result)
    {
      unsigned int v7 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
      return v7();
    }
  }
  return result;
}

- (id)constraints
{
  unint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__NSISEngine_constraints__block_invoke;
  v5[3] = &unk_1E5C56EB8;
  v5[4] = v3;
  -[NSISEngine enumerateOriginalConstraints:](self, (uint64_t)v5);
  return v3;
}

uint64_t __25__NSISEngine_constraints__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (unint64_t)colCount
{
  uint64_t v2 = 0;
  unint64_t v3 = 0;
  colTables = self->_colTables;
  char v5 = 1;
  do
  {
    char v6 = v5;
    unsigned int v7 = &colTables[v2];
    unint64_t blocksCount = v7->blocksCount;
    uint64_t v9 = NSBitSetCount((uint64_t)&v7->freeIndexes);
    char v5 = 0;
    unint64_t v3 = v3 - v9 + 25 * blocksCount;
    uint64_t v2 = 1;
  }
  while ((v6 & 1) != 0);
  return v3;
}

- (BOOL)isOptimizationInProgress
{
  return self->_optimizationInProgress;
}

- (uint64_t)allRowHeads
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __25__NSISEngine_allRowHeads__block_invoke;
  v4[3] = &unk_1E5C56C60;
  v4[4] = v2;
  [a1 enumerateRows:v4];
  return v2;
}

uint64_t __25__NSISEngine_allRowHeads__block_invoke(uint64_t a1, uint64_t a2, id **a3)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = **a3;
  return [v3 addObject:v4];
}

- (NSString)description
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __25__NSISEngine_description__block_invoke;
  v24[3] = &unk_1E5C56C60;
  void v24[4] = v3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", -[NSISEngine enumerateEngineVars:](self, (uint64_t)v24));
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __25__NSISEngine_description__block_invoke_2;
  v23[3] = &unk_1E5C56C60;
  v23[4] = v4;
  [(NSISEngine *)self enumerateRows:v23];
  char v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __25__NSISEngine_description__block_invoke_3;
  void v22[3] = &unk_1E5C56DA0;
  v22[4] = v5;
  char v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", -[NSISEngine enumerateCols:](self, (uint64_t)v22));
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __25__NSISEngine_description__block_invoke_4;
  v21[3] = &unk_1E5C56EB8;
  v21[4] = v6;
  -[NSISEngine enumerateOriginalConstraints:](self, (uint64_t)v21);
  unsigned int v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  bzero(v25, 0x408uLL);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __25__NSISEngine_description__block_invoke_5;
  v16[3] = &unk_1E5C56EE0;
  v16[4] = &v17;
  v16[5] = v25;
  [(NSISEngine *)self enumerateRows:v16];
  [v7 addObject:objc_msgSend(NSString, "stringWithFormat:", @"\t%lu rows. Variable counts:", v18[3])];
  for (uint64_t i = 0; i != 128; ++i)
  {
    uint64_t v9 = v25[i];
    if (v9) {
      [v7 addObject:objc_msgSend(NSString, "stringWithFormat:", @"\t\t%3lu -> %3lu", i, v9)];
    }
  }
  if (v26) {
    [v7 addObject:objc_msgSend(NSString, "stringWithFormat:", @"\t\t>= %3lu -> %3lu", 128, v26)];
  }
  _Block_object_dispose(&v17, 8);
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  bzero(v25, 0x408uLL);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __25__NSISEngine_description__block_invoke_6;
  v15[3] = &unk_1E5C56F08;
  v15[4] = &v17;
  v15[5] = v25;
  double v10 = -[NSISEngine enumerateCols:](self, (uint64_t)v15);
  [v7 addObject:objc_msgSend(NSString, "stringWithFormat:", @"\t%lu cols. Variable counts:", v10, v18[3])];
  for (uint64_t j = 0; j != 128; ++j)
  {
    uint64_t v12 = v25[j];
    if (v12) {
      [v7 addObject:objc_msgSend(NSString, "stringWithFormat:", @"\t\t%3lu -> %3lu", j, v12)];
    }
  }
  if (v26) {
    [v7 addObject:objc_msgSend(NSString, "stringWithFormat:", @"\t\t>= %3lu -> %3lu", 128, v26)];
  }
  _Block_object_dispose(&v17, 8);
  uint64_t v13 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p>{ delegate:%p\n", objc_opt_class(), self, -[NSISEngine delegate](self, "delegate")];
  [v13 appendString:@"EngineVars:\n"];
  objc_msgSend(v13, "appendString:", objc_msgSend(v3, "componentsJoinedByString:", @"\n"));
  [v13 appendString:@"\n\n  Rows:\n"];
  objc_msgSend(v13, "appendString:", objc_msgSend(v4, "componentsJoinedByString:", @"\n"));
  [v13 appendString:@"\n\n  Columns:\n"];
  objc_msgSend(v13, "appendString:", objc_msgSend(v5, "componentsJoinedByString:", @"\n"));
  [v13 appendString:@"\n\n  Constraints:\n"];
  objc_msgSend(v13, "appendString:", objc_msgSend((id)objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_), "componentsJoinedByString:", @"\n"));
  [v13 appendString:@"\n\n  Statistics:\n"];
  objc_msgSend(v13, "appendString:", objc_msgSend(v7, "componentsJoinedByString:", @"\n"));
  [v13 appendString:@"\n}"];
  return (NSString *)v13;
}

uint64_t __25__NSISEngine_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = _engineVar_description(a2, a3);
  return [v3 addObject:v4];
}

uint64_t __25__NSISEngine_description__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = _row_description(a2, a3);
  return [v3 addObject:v4];
}

uint64_t __25__NSISEngine_description__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t **a3)
{
  unint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = _col_description(a2, a3);
  return [v3 addObject:v4];
}

uint64_t __25__NSISEngine_description__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  char v6 = (void *)[MEMORY[0x1E4F28E78] stringWithString:@"\t"];
  objc_msgSend(v6, "appendString:", objc_msgSend(a2, "description"));
  [v6 appendString:@"\t\tMarker:"];
  objc_msgSend(v6, "appendString:", objc_msgSend(a3, "description"));
  unsigned int v7 = *(void **)(a1 + 32);
  return [v7 addObject:v6];
}

unint64_t __25__NSISEngine_description__block_invoke_5(unint64_t result, uint64_t a2, uint64_t a3)
{
  if ((*(unsigned char *)(a3 + 80) & 1) == 0)
  {
    unint64_t v3 = result;
    ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
    uint64_t v4 = (uint64_t *)(a3 + 16);
    if (*(unsigned char *)(a3 + 80)) {
      uint64_t result = -[NSISObjectiveLinearExpression variableCount](*v4);
    }
    else {
      uint64_t result = NSISLinExpVarCount((uint64_t)v4);
    }
    uint64_t v5 = 128;
    if (result < 0x80) {
      uint64_t v5 = result;
    }
    ++*(void *)(*(void *)(v3 + 40) + 8 * v5);
  }
  return result;
}

uint64_t __25__NSISEngine_description__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v5 = NSBitSetCount(a3 + 8);
  uint64_t result = NSBitSetCount(a3 + 24);
  uint64_t v7 = result + v5;
  if ((unint64_t)(result + v5) >= 0x80) {
    uint64_t v7 = 128;
  }
  ++*(void *)(*(void *)(a1 + 40) + 8 * v7);
  return result;
}

- (void)verifyInternalIntegrity
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1AD0BC080]();
  BOOL allowUnoptimizedReads = self->_allowUnoptimizedReads;
  self->_BOOL allowUnoptimizedReads = 1;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke;
  v61[3] = &unk_1E5C56F30;
  v61[5] = a2;
  v61[4] = self;
  double v4 = -[NSISEngine enumerateEngineVars:](self, (uint64_t)v61);
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_2;
  v60[3] = &unk_1E5C56F30;
  v60[5] = a2;
  v60[4] = self;
  -[NSISEngine enumerateRows:](self, "enumerateRows:", v60, v4);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_4;
  v59[3] = &unk_1E5C56F80;
  SEL v34 = a2;
  v59[4] = self;
  v59[5] = a2;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28E10], "mapTableWithKeyOptions:valueOptions:", 512, 0, -[NSISEngine enumerateCols:](self, (uint64_t)v59));
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_7;
  v58[3] = &unk_1E5C56C60;
  v58[4] = v5;
  [(NSISEngine *)self enumerateRows:v58];
  char v6 = (void *)[MEMORY[0x1E4F1CA80] set];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_9;
  v57[3] = &unk_1E5C56DA0;
  v57[4] = v6;
  uint64_t v38 = v5;
  objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v5, "keyEnumerator", -[NSISEngine enumerateCols:](self, (uint64_t)v57)), "allObjects"));
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = v6;
  uint64_t v39 = [v6 countByEnumeratingWithState:&v53 objects:v62 count:16];
  if (v39)
  {
    rowTables = self->_rowTables;
    uint64_t v37 = *(void *)v54;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v54 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v53 + 1) + 8 * v8);
        uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
        uint64_t v11 = 0;
        uint64_t v45 = (void *)v10;
        while ((NSISEngine *)v9[v11 + 3] != self)
        {
          if (++v11 == 3) {
            goto LABEL_11;
          }
        }
        unsigned int v12 = *((_DWORD *)v9 + v11 + 12);
        if (v12 != -1) {
          goto LABEL_14;
        }
LABEL_11:
        if (v9[2])
        {
          unsigned int v12 = [v9 overflowEngineVarIndexForEngine:self];
          uint64_t v10 = (uint64_t)v45;
        }
        else
        {
          unsigned int v12 = -1;
        }
LABEL_14:
        uint64_t v43 = v8;
        unint64_t v44 = v9;
        uint64_t v13 = *(void *)((char *)self->_engineVarTable.blocks + (((unint64_t)v12 >> 3) & 0x1FFFFFF8));
        uint64_t v14 = v12 & 0x3F;
        uint64_t v15 = (void *)(v13 + 32 * v14);
        if (*((_DWORD *)v15 + 4) == -1)
        {
          double v31 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          [v31 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", v44, self file lineNumber description];
          uint64_t v15 = (void *)(v13 + 32 * v14);
          uint64_t v10 = (uint64_t)v45;
        }
        if ((void *)*v15 != v44)
        {
          uint64_t v41 = v15;
          long long v32 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          [v32 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *v41, v44 file lineNumber description];
          uint64_t v15 = v41;
          uint64_t v10 = (uint64_t)v45;
        }
        uint64_t v16 = v13 + 32 * v14;
        if (*(unsigned char *)(v16 + 24))
        {
          uint64_t v26 = v15;
          v42 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          [v42 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *v26 file lineNumber description];
          uint64_t v10 = (uint64_t)v45;
        }
        uint64_t v17 = *(void *)(v16 + 8);
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        char v50 = __37__NSISEngine_verifyInternalIntegrity__block_invoke_10;
        uint64_t v51 = &unk_1E5C56DA0;
        uint64_t v52 = v10;
        uint64_t v40 = v17;
        uint64_t v18 = (uint64_t **)(v17 + 8);
        uint64_t Next = NSBitSetFindNext((uint64_t **)(v17 + 8), 0);
        if (Next != 0x7FFFFFFFFFFFFFFFLL)
        {
          for (unint64_t i = Next; i != 0x7FFFFFFFFFFFFFFFLL; unint64_t i = NSBitSetFindNext(v18, i + 1))
            v50((uint64_t)v49, (uint64_t)self, (id **)(*((void *)rowTables[(i >> 30) & 1].blocks + (i & 0xBFFFFFFF) / 0x17)+ 88 * ((i & 0xBFFFFFFF) % 0x17)));
        }
        uint64_t v21 = NSBitSetFindNext((uint64_t **)(v40 + 24), 0);
        if (v21 != 0x7FFFFFFFFFFFFFFFLL)
        {
          for (uint64_t j = v21; j != 0x7FFFFFFFFFFFFFFFLL; uint64_t j = NSBitSetFindNext((uint64_t **)(v40 + 24), j + 1))
            v50((uint64_t)v49, (uint64_t)self, (id **)(*((void *)rowTables[((j + 0x40000000) >> 30) & 1].blocks+ ((j + 0x40000000) & 0xBFFFFFFF) / 0x17uLL)+ 88 * (((j + 0x40000000) & 0xBFFFFFFF) % 0x17)));
        }
        uint64_t v23 = (void *)[v38 objectForKey:v44];
        if (([v45 isEqual:v23] & 1) == 0)
        {
          id v24 = (id)[v45 mutableCopy];
          [v24 minusSet:v23];
          if ([v24 count]) {
            NSLog(&cfstr_TheVariableIsI.isa, v44, v45);
          }
          id v25 = (id)[v23 mutableCopy];
          [v25 minusSet:v45];
          if ([v25 count]) {
            NSLog(&cfstr_TheVariableIsN.isa, v44, v45);
          }
        }
        uint64_t v8 = v43 + 1;
      }
      while (v43 + 1 != v39);
      uint64_t v39 = [obj countByEnumeratingWithState:&v53 objects:v62 count:16];
    }
    while (v39);
  }
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_11;
  v48[3] = &unk_1E5C56F30;
  v48[4] = self;
  v48[5] = v34;
  [(NSISEngine *)self enumerateRows:v48];
  uint64_t v27 = (void *)[MEMORY[0x1E4F1CA80] set];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_13;
  v47[3] = &unk_1E5C56C60;
  v47[4] = v27;
  [(NSISEngine *)self enumerateRows:v47];
  objc_msgSend(v27, "minusSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", self->_variablesWithValueRestrictionViolations));
  if ([v27 count]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v34, self, @"NSISEngine.m", 3257, @"The tracked set of variables with value restriction violations is missing these variables: %@", v27);
  }
  storage = self->_objectiveRow.storage;
  if ((*((unsigned char *)storage + 80) & 1) == 0)
  {
    engine = self->_objectiveRow.engine;
    uint64_t v30 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISObjectiveLinearExpression *_objectiveRow_rawBody(NSISRow)"), @"NSISEngine_Row.h", 418, @"Tried accessing the objective linear expression for regular row:%@", _row_description((uint64_t)engine, (uint64_t)storage) file lineNumber description];
  }
  -[NSISObjectiveLinearExpression verifyInternalIntegrity](*((void *)storage + 2));
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_14;
  v46[3] = &unk_1E5C56F30;
  v46[4] = self;
  v46[5] = v34;
  [(NSISEngine *)self enumerateRows:v46];
  self->_BOOL allowUnoptimizedReads = allowUnoptimizedReads;
}

void *__37__NSISEngine_verifyInternalIntegrity__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)a3;
  if (!*(void *)a3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(unsigned int *)(a3 + 16), *(void *)(a1 + 32));
    uint64_t result = *(void **)a3;
  }
  uint64_t v6 = 0;
  while (result[v6 + 3] != *(void *)(a1 + 32))
  {
    if (++v6 == 3) {
      goto LABEL_8;
    }
  }
  uint64_t v7 = *((unsigned int *)result + v6 + 12);
  if (v7 != -1) {
    goto LABEL_11;
  }
LABEL_8:
  if (result[2])
  {
    uint64_t result = objc_msgSend(result, "overflowEngineVarIndexForEngine:");
    uint64_t v7 = (uint64_t)result;
  }
  else
  {
    uint64_t v7 = 0xFFFFFFFFLL;
  }
LABEL_11:
  if (v7 != *(_DWORD *)(a3 + 16)) {
    uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)a3, *(void *)(a1 + 32), v7, *(unsigned int *)(a3 + 16));
  }
  uint64_t v8 = *(unsigned int **)(a3 + 8);
  uint64_t v9 = *(void *)v8;
  int v10 = *(_DWORD *)(*(void *)v8 + 16);
  int v11 = *(_DWORD *)(a3 + 16);
  if (*(unsigned char *)(a3 + 24))
  {
    if (v10 != v11) {
      return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)(a1 + 32), @"NSISEngine.m", 3153, @"Engine var backpointer in row %u doesn't match engineVarIndex %u != %u", v8[2], *(unsigned int *)(v9 + 16), *(unsigned int *)(a3 + 16));
    }
  }
  else if (v10 != v11)
  {
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)(a1 + 32), @"NSISEngine.m", 3157, @"Engine var backpointer in col %u doesn't match engineVarIndex %u != %u", *(unsigned int *)(*(void *)v8 + 20), *(unsigned int *)(v9 + 16), *(unsigned int *)(a3 + 16));
  }
  return result;
}

unsigned __int16 *__37__NSISEngine_verifyInternalIntegrity__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = *a3;
  if ((*(unsigned char *)(*a3 + 24) & 1) == 0)
  {
    uint64_t v15 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISRow _engineVar_row(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 115, @"Tried accessing the row index for a variable that isn't a row head:%@", *(void *)v6 file lineNumber description];
  }
  uint64_t v7 = *(void *)(v6 + 8);
  if (*(_DWORD *)(v7 + 8) != *((_DWORD *)a3 + 2)) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)(a1 + 32), @"NSISEngine.m", 3165, @"Engine var backpointer in row %u doesn't match engineVarIndex %u != %u", *((unsigned int *)a3 + 2), *(unsigned int *)(v7 + 8), *(unsigned int *)(v6 + 16));
  }
  if (a3 != *(uint64_t **)(*(void *)(a1 + 32) + 408))
  {
    uint64_t v8 = a3 + 2;
    if (!((a3[10] & 1) != 0 ? -[NSISObjectiveLinearExpression variableCount](*v8) : NSISLinExpVarCount((uint64_t)v8))) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)(a1 + 32), @"NSISEngine.m", 3166, @"An empty row is not allowed, it should always contain body variables.");
    }
  }
  uint64_t result = (unsigned __int16 *)*(id *)*a3;
  if (result != *(unsigned __int16 **)(a2 + 416))
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_3;
    v16[3] = &unk_1E5C56E40;
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    void v16[6] = a3;
    v16[7] = v11;
    v16[4] = v12;
    v16[5] = a2;
    uint64_t v13 = (unsigned __int16 *)(a3 + 2);
    if (a3[10])
    {
      uint64_t v14 = *(void *)v13;
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      uint64_t v19 = ___row_enumerateCols_block_invoke;
      uint64_t v20 = &unk_1E5C570C0;
      uint64_t v21 = a2;
      uint64_t v22 = v16;
      return (unsigned __int16 *)-[NSISObjectiveLinearExpression enumerateVars:](v14, (uint64_t)&v17);
    }
    else
    {
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      uint64_t v19 = ___row_enumerateCols_block_invoke_2;
      uint64_t v20 = &unk_1E5C570C0;
      uint64_t v21 = a2;
      uint64_t v22 = v16;
      return NSISLinExpEnumerateVars(v13, (uint64_t)&v17);
    }
  }
  return result;
}

uint64_t __37__NSISEngine_verifyInternalIntegrity__block_invoke_3(void *a1, uint64_t a2, uint64_t **a3)
{
  uint64_t v6 = *a3;
  unsigned int v7 = *(_DWORD *)(a1[6] + 8);
  if (HIWORD(v7)) {
    unint64_t v8 = v7 - 0x40000000;
  }
  else {
    unint64_t v8 = v7;
  }
  if (HIWORD(v7)) {
    uint64_t v9 = (uint64_t *)(a3 + 3);
  }
  else {
    uint64_t v9 = (uint64_t *)(a3 + 1);
  }
  uint64_t result = NSBitSetContainsIndex(v9, v8);
  if ((result & 1) == 0) {
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[4], @"NSISEngine.m", 3172, @"Body variable %@ with engineVarIndex %u appear in row %u, but that row doesn't appear in its cross index %@", (id)*v6, *((unsigned int *)v6 + 4), *(unsigned int *)(a1[6] + 8), _col_description(a2, a3));
  }
  return result;
}

uint64_t __37__NSISEngine_verifyInternalIntegrity__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t **a3)
{
  uint64_t v6 = *a3;
  unsigned int v7 = *a3;
  if ((*a3)[3])
  {
    uint64_t v15 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *v6 file lineNumber description];
    unsigned int v7 = *a3;
  }
  uint64_t v8 = v6[1];
  if (*(_DWORD *)(*(void *)v8 + 20) != *((_DWORD *)v7 + 5)) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)(a1 + 32), @"NSISEngine.m", 3181, @"Engine var backpointer in col %u doesn't match engineVarIndex %u != %u", *((unsigned int *)*a3 + 5), *(unsigned int *)(*(void *)v8 + 20), *((unsigned int *)v6 + 4));
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  uint64_t v17 = __37__NSISEngine_verifyInternalIntegrity__block_invoke_5;
  uint64_t v18 = &unk_1E5C56E40;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v21 = a3;
  uint64_t v22 = v9;
  uint64_t v19 = v10;
  uint64_t v20 = a2;
  uint64_t Next = NSBitSetFindNext(a3 + 1, 0);
  if (Next != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (unint64_t i = Next; i != 0x7FFFFFFFFFFFFFFFLL; unint64_t i = NSBitSetFindNext(a3 + 1, i + 1))
      v17((uint64_t)v16, a2, *(void *)(*(void *)(a2 + 232 + 40 * ((i >> 30) & 1)) + 8 * ((i & 0xBFFFFFFF) / 0x17))+ 88 * ((i & 0xBFFFFFFF) % 0x17));
  }
  uint64_t result = NSBitSetFindNext(a3 + 3, 0);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = result;
    do
    {
      v17((uint64_t)v16, a2, *(void *)(*(void *)(a2 + 232 + 40 * (((v14 + 0x40000000) >> 30) & 1))+ 8 * (((v14 + 0x40000000) & 0xBFFFFFFF) / 0x17uLL))+ 88 * (((v14 + 0x40000000) & 0xBFFFFFFF) % 0x17));
      uint64_t result = NSBitSetFindNext(a3 + 3, v14 + 1);
      uint64_t v14 = result;
    }
    while (result != 0x7FFFFFFFFFFFFFFFLL);
  }
  return result;
}

void __37__NSISEngine_verifyInternalIntegrity__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_6;
  v8[3] = &unk_1E5C56F58;
  v8[4] = &v10;
  long long v9 = *(_OWORD *)(a1 + 40);
  uint64_t v6 = (unsigned __int16 *)(a3 + 16);
  if (*(unsigned char *)(a3 + 80))
  {
    uint64_t v7 = *(void *)v6;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = ___row_enumerateCols_block_invoke;
    uint64_t v17 = &unk_1E5C570C0;
    uint64_t v18 = a2;
    uint64_t v19 = v8;
    -[NSISObjectiveLinearExpression enumerateVars:](v7, (uint64_t)&v14);
  }
  else
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = ___row_enumerateCols_block_invoke_2;
    uint64_t v17 = &unk_1E5C570C0;
    uint64_t v18 = a2;
    uint64_t v19 = v8;
    NSISLinExpEnumerateVars(v6, (uint64_t)&v14);
  }
  if (!*((unsigned char *)v11 + 24)) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 32), @"NSISEngine.m", 3188, @"Cross index says variable %@ at colIndex %u appears in row %u, but that row only contains:%@", ***(id ***)(a1 + 48), *(unsigned int *)(**(void **)(a1 + 48) + 20), *(unsigned int *)(a3 + 8), _row_description(a2, a3));
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __37__NSISEngine_verifyInternalIntegrity__block_invoke_6(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  if (*(unsigned char *)(v3 + 24)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a3 == *(void *)(result + 48);
  }
  *(unsigned char *)(v3 + 24) = v4;
  return result;
}

unsigned __int16 *__37__NSISEngine_verifyInternalIntegrity__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (unsigned __int16 *)**(id **)a3;
  if (result != *(unsigned __int16 **)(a2 + 416))
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_8;
    v9[3] = &unk_1E5C56FA8;
    v9[4] = *(void *)(a1 + 32);
    v9[5] = a2;
    v9[6] = a3;
    uint64_t v7 = (unsigned __int16 *)(a3 + 16);
    if (*(unsigned char *)(a3 + 80))
    {
      uint64_t v8 = *(void *)v7;
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      uint64_t v12 = ___row_enumerateCols_block_invoke;
      char v13 = &unk_1E5C570C0;
      uint64_t v14 = a2;
      uint64_t v15 = v9;
      return (unsigned __int16 *)-[NSISObjectiveLinearExpression enumerateVars:](v8, (uint64_t)&v10);
    }
    else
    {
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      uint64_t v12 = ___row_enumerateCols_block_invoke_2;
      char v13 = &unk_1E5C570C0;
      uint64_t v14 = a2;
      uint64_t v15 = v9;
      return NSISLinExpEnumerateVars(v7, (uint64_t)&v10);
    }
  }
  return result;
}

uint64_t __37__NSISEngine_verifyInternalIntegrity__block_invoke_8(uint64_t a1, uint64_t a2, id **a3)
{
  id v4 = **a3;
  uint64_t v5 = (void *)[*(id *)(a1 + 32) objectForKey:v4];
  if (!v5)
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA80] set];
    [*(id *)(a1 + 32) setObject:v5 forKey:v4];
  }
  id v6 = ***(id ***)(a1 + 48);
  return [v5 addObject:v6];
}

uint64_t __37__NSISEngine_verifyInternalIntegrity__block_invoke_9(uint64_t a1, uint64_t a2, id **a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = **a3;
  return [v3 addObject:v4];
}

uint64_t __37__NSISEngine_verifyInternalIntegrity__block_invoke_10(uint64_t a1, uint64_t a2, id **a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = **a3;
  return [v3 addObject:v4];
}

unsigned __int16 *__37__NSISEngine_verifyInternalIntegrity__block_invoke_11(unsigned __int16 *result, uint64_t a2, uint64_t a3)
{
  if ((*(_DWORD *)(*(void *)a3 + 24) & 6) == 4)
  {
    uint64_t v5 = result;
    uint64_t result = (unsigned __int16 *)**(id **)a3;
    if (result != *(unsigned __int16 **)(a2 + 416))
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_12;
      v8[3] = &unk_1E5C56FD0;
      long long v9 = *((_OWORD *)v5 + 2);
      uint64_t v10 = a2;
      uint64_t v11 = a3;
      id v6 = (unsigned __int16 *)(a3 + 16);
      if (*(unsigned char *)(a3 + 80))
      {
        uint64_t v7 = *(void *)v6;
        uint64_t v12 = MEMORY[0x1E4F143A8];
        uint64_t v13 = 3221225472;
        uint64_t v14 = ___row_enumerateCols_block_invoke;
        uint64_t v15 = &unk_1E5C570C0;
        uint64_t v16 = a2;
        uint64_t v17 = v8;
        return (unsigned __int16 *)-[NSISObjectiveLinearExpression enumerateVars:](v7, (uint64_t)&v12);
      }
      else
      {
        uint64_t v12 = MEMORY[0x1E4F143A8];
        uint64_t v13 = 3221225472;
        uint64_t v14 = ___row_enumerateCols_block_invoke_2;
        uint64_t v15 = &unk_1E5C570C0;
        uint64_t v16 = a2;
        uint64_t v17 = v8;
        return NSISLinExpEnumerateVars(v6, (uint64_t)&v12);
      }
    }
  }
  return result;
}

void *__37__NSISEngine_verifyInternalIntegrity__block_invoke_12(void *result, uint64_t a2, id **a3)
{
  if (((*a3)[3] & 6) != 4) {
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", result[5], result[4], @"NSISEngine.m", 3241, @"every variable in a row headed by an NSISRestrictedToZero variable must be NSISRestrictedToZero as well.  The row %@ contains %@ which is not restricted to zero.", _row_description(result[6], result[7]), **a3);
  }
  return result;
}

double __37__NSISEngine_verifyInternalIntegrity__block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3, double result)
{
  if ((*(unsigned char *)(a3 + 80) & 1) == 0 && **(id **)a3 != *(id *)(a2 + 416))
  {
    uint64_t result = NSISLinExpConstant(a3 + 16);
    int v6 = (*(_DWORD *)(*(void *)a3 + 24) >> 1) & 3;
    if (v6 == 2)
    {
      if (result == 0.0)
      {
        uint64_t result = *(double *)&NSISEpsilon;
        if (*(double *)&NSISEpsilon > 0.0) {
          return result;
        }
      }
      else
      {
        uint64_t result = fabs(result);
        if (result < *(double *)&NSISEpsilon) {
          return result;
        }
      }
    }
    else if (v6 != 1 || result >= 0.0)
    {
      return result;
    }
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = **(id **)a3;
    [v7 addObject:v8];
  }
  return result;
}

unsigned __int16 *__37__NSISEngine_verifyInternalIntegrity__block_invoke_14(unsigned __int16 *result, uint64_t a2, uint64_t a3)
{
  if ((*(unsigned char *)(a3 + 80) & 1) == 0)
  {
    uint64_t v5 = result;
    uint64_t result = (unsigned __int16 *)**(id **)a3;
    if (result != *(unsigned __int16 **)(a2 + 416))
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_15;
      v6[3] = &unk_1E5C56FF8;
      long long v7 = *((_OWORD *)v5 + 2);
      uint64_t v8 = a2;
      uint64_t v9 = a3;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = ___row_enumerateColsWithCoefficients_block_invoke;
      v10[3] = &unk_1E5C57110;
      v10[4] = a2;
      v10[5] = v6;
      return NSISLinExpEnumerateVarsAndCoefficients((unsigned __int16 *)(a3 + 16), (uint64_t)v10);
    }
  }
  return result;
}

void *__37__NSISEngine_verifyInternalIntegrity__block_invoke_15(void *result, double a2)
{
  uint64_t v3 = result;
  double v4 = fabs(a2);
  if (v4 >= INFINITY && v4 <= INFINITY) {
    uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", result[5], result[4], @"NSISEngine.m", 3268, @"A row in the engine has an infinite coefficient.  %@", _row_description(result[6], result[7]));
  }
  if (a2 == 0.0)
  {
    if (*(double *)&NSISEpsilon <= 0.0) {
      return result;
    }
    return (void *)[(id)objc_msgSend(MEMORY[0x1E4F28B00] currentHandler:*(double *)&NSISEpsilon), "handleFailureInMethod:object:file:lineNumber:description:", v3[5], v3[4], @"NSISEngine.m", 3269, @"A row in the engine has a near-zero coefficient.  %@", _row_description(v3[6], v3[7])];
  }
  if (v4 < *(double *)&NSISEpsilon) {
    return (void *)[(id)objc_msgSend(MEMORY[0x1E4F28B00] currentHandler:*(double *)&NSISEpsilon), "handleFailureInMethod:object:file:lineNumber:description:", v3[5], v3[4], @"NSISEngine.m", 3269, @"A row in the engine has a near-zero coefficient.  %@", _row_description(v3[6], v3[7])];
  }
  return result;
}

- (id)candidateRedundantConstraints
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA80] set];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__NSISEngine_candidateRedundantConstraints__block_invoke;
  v5[3] = &unk_1E5C57048;
  v5[4] = self;
  void v5[5] = v3;
  [(NSISEngine *)self enumerateRows:v5];
  return (id)[v3 allObjects];
}

void __43__NSISEngine_candidateRedundantConstraints__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = **(id **)a3;
  if (([v6 valueIsUserVisible] & 1) == 0 && v6 != *(id *)(*(void *)(a1 + 32) + 392))
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3052000000;
    uint64_t v14 = __Block_byref_object_copy__0;
    uint64_t v15 = __Block_byref_object_dispose__0;
    uint64_t v16 = 0;
    uint64_t v7 = [v6 markedConstraint];
    v12[5] = v7;
    if (v7) {
      [*(id *)(a1 + 40) addObject:v7];
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__NSISEngine_candidateRedundantConstraints__block_invoke_282;
    v10[3] = &unk_1E5C57020;
    v10[4] = *(void *)(a1 + 40);
    v10[5] = &v11;
    uint64_t v8 = (unsigned __int16 *)(a3 + 16);
    if (*(unsigned char *)(a3 + 80))
    {
      uint64_t v9 = *(void *)v8;
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      uint64_t v19 = ___row_enumerateCols_block_invoke;
      uint64_t v20 = &unk_1E5C570C0;
      uint64_t v21 = a2;
      uint64_t v22 = v10;
      -[NSISObjectiveLinearExpression enumerateVars:](v9, (uint64_t)&v17);
    }
    else
    {
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      uint64_t v19 = ___row_enumerateCols_block_invoke_2;
      uint64_t v20 = &unk_1E5C570C0;
      uint64_t v21 = a2;
      uint64_t v22 = v10;
      NSISLinExpEnumerateVars(v8, (uint64_t)&v17);
    }
    _Block_object_dispose(&v11, 8);
  }
}

uint64_t __43__NSISEngine_candidateRedundantConstraints__block_invoke_282(uint64_t a1, uint64_t a2, id **a3)
{
  uint64_t result = [**a3 markedConstraint];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  if (result)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    return [v5 addObject:v6];
  }
  return result;
}

- (uint64_t)bodyVarIsAmbiguous:(uint64_t)a3 withPivotOfOutgoingRowHead:(uint64_t)a4 foundOutgoingRowHead:(unsigned char *)a5
{
  if (result)
  {
    double v28 = 0.0;
    if ((*(_DWORD *)(*(void *)a3 + 24) & 6) == 4)
    {
LABEL_3:
      uint64_t result = 0;
      *a5 = 0;
      return result;
    }
    uint64_t v9 = result;
    uint64_t v10 = NSBitSetCount(a3 + 8);
    if (!(NSBitSetCount(a3 + 24) + v10))
    {
      *a5 = 0;
      return 1;
    }
    uint64_t v27 = 0;
    uint64_t v11 = *(void *)(v9 + 408);
    if ((*(unsigned char *)(v11 + 80) & 1) == 0)
    {
      uint64_t v16 = *(void *)(v9 + 400);
      uint64_t v17 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISObjectiveLinearExpression *_objectiveRow_rawBody(NSISRow)"), @"NSISEngine_Row.h", 418, @"Tried accessing the objective linear expression for regular row:%@", _row_description(v16, v11) file lineNumber description];
    }
    -[NSISObjectiveLinearExpression leadingPriority:andValue:forVar:](*(void **)(v11 + 16), &v27, &v28, *(_DWORD *)(*(void *)a3 + 16));
    if (v28 != 0.0) {
      goto LABEL_3;
    }
    int v12 = _chooseOutgoingRowHeadForIncomingRowHead(a2, a3, a4, 0);
    *a5 = v12;
    if (v12)
    {
      double v13 = NSISLinExpConstant(*(void *)(a4 + 8) + 16);
      if (v13 == 0.0)
      {
        if (*(double *)&NSISEpsilon <= 0.0) {
          return 1;
        }
      }
      else if (fabs(v13) >= *(double *)&NSISEpsilon)
      {
        return 1;
      }
    }
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 1;
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 1;
    int v14 = (*(_DWORD *)(*(void *)a3 + 24) >> 1) & 3;
    if (v14 == 1)
    {
      uint64_t v15 = &v26;
    }
    else
    {
      if (v14 != 2) {
        goto LABEL_19;
      }
      uint64_t v15 = &v22;
      char v26 = 0;
    }
    *uint64_t v15 = 0;
LABEL_19:
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __81__NSISEngine_bodyVarIsAmbiguous_withPivotOfOutgoingRowHead_foundOutgoingRowHead___block_invoke;
    v18[3] = &unk_1E5C57070;
    v18[4] = v9;
    v18[5] = &v23;
    v18[6] = &v19;
    void v18[7] = a2;
    v18[8] = a3;
    _col_enumerateRowsUntil(a2, a3, (uint64_t)v18);
    if (!*((unsigned char *)v20 + 24) && !*((unsigned char *)v24 + 24))
    {
      _Block_object_dispose(&v19, 8);
      _Block_object_dispose(&v23, 8);
      goto LABEL_3;
    }
    *a5 = 0;
    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);
    return 1;
  }
  return result;
}

uint64_t __81__NSISEngine_bodyVarIsAmbiguous_withPivotOfOutgoingRowHead_foundOutgoingRowHead___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    && !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    return 1;
  }
  if (a3 == *(void *)(*(void *)(a1 + 32) + 408)) {
    return 0;
  }
  double v5 = NSISLinExpCoefficientForVar(a3 + 16, *(_DWORD *)(**(void **)(a1 + 64) + 16));
  if (NSISLinExpConstant(a3 + 16) != 0.0) {
    return 0;
  }
  int v6 = (*(_DWORD *)(*(void *)a3 + 24) >> 1) & 3;
  if (v6 != 2)
  {
    if (v6 == 1)
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t result = 0;
      if (v5 > 0.0)
      {
        *(unsigned char *)(v7 + 24) = 1;
        return result;
      }
      goto LABEL_12;
    }
    return 0;
  }
  uint64_t result = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
LABEL_12:
  *(unsigned char *)(v7 + 24) = 0;
  return result;
}

- (BOOL)incoming:(_OWORD *)a3 andOutgoing:(unsigned char *)a4 foundOutgoing:(uint64_t)a5 rowHeadsThatMakeValueAmbiguousForVariable:(uint64_t)a6
{
  if (!a1) {
    return 0;
  }
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3010000000;
  uint64_t v30 = a1;
  uint64_t v31 = 0;
  uint64_t v21 = 0;
  char v22 = &v21;
  uint64_t v23 = 0x3010000000;
  v25[0] = a1;
  v25[1] = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v20[0] = 0;
  uint64_t v10 = *(void *)(a6 + 8);
  if (*(unsigned char *)(a6 + 24))
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __91__NSISEngine_incoming_andOutgoing_foundOutgoing_rowHeadsThatMakeValueAmbiguousForVariable___block_invoke;
    v16[3] = &unk_1E5C57098;
    v16[4] = a1;
    v16[5] = &v17;
    void v16[6] = &v21;
    v16[7] = &v32;
    void v16[8] = &v26;
    int v12 = (unsigned __int16 *)(v10 + 16);
    if (*(unsigned char *)(v10 + 80))
    {
      uint64_t v13 = *(void *)v12;
      uint64_t v36 = MEMORY[0x1E4F143A8];
      uint64_t v37 = 3221225472;
      uint64_t v38 = ___row_enumerateCols_block_invoke;
      uint64_t v39 = &unk_1E5C570C0;
      uint64_t v40 = a5;
      uint64_t v41 = v16;
      -[NSISObjectiveLinearExpression enumerateVars:](v13, (uint64_t)&v36);
    }
    else
    {
      uint64_t v36 = MEMORY[0x1E4F143A8];
      uint64_t v37 = 3221225472;
      uint64_t v38 = ___row_enumerateCols_block_invoke_2;
      uint64_t v39 = &unk_1E5C570C0;
      uint64_t v40 = a5;
      uint64_t v41 = v16;
      NSISLinExpEnumerateVars(v12, (uint64_t)&v36);
    }
  }
  else if ([(NSISEngine *)a1 bodyVarIsAmbiguous:*(void *)(a6 + 8) withPivotOfOutgoingRowHead:(uint64_t)v25 foundOutgoingRowHead:v20])
  {
    *((unsigned char *)v33 + 24) = 1;
    uint64_t v11 = v27;
    v27[4] = a5;
    v11[5] = v10;
  }
  if (a2) {
    *a2 = *((_OWORD *)v27 + 2);
  }
  if (a3) {
    *a3 = *((_OWORD *)v22 + 2);
  }
  if (a4) {
    *a4 = *((unsigned char *)v18 + 24);
  }
  BOOL v14 = *((unsigned char *)v33 + 24) != 0;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  return v14;
}

uint64_t *__91__NSISEngine_incoming_andOutgoing_foundOutgoing_rowHeadsThatMakeValueAmbiguousForVariable___block_invoke(uint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(result[5] + 8);
  int v5 = *(unsigned __int8 *)(v3 + 24);
  double v4 = (unsigned char *)(v3 + 24);
  if (!v5)
  {
    uint64_t v8 = result;
    uint64_t result = (uint64_t *)[(NSISEngine *)result[4] bodyVarIsAmbiguous:a3 withPivotOfOutgoingRowHead:*(void *)(result[6] + 8) + 32 foundOutgoingRowHead:v4];
    if (result)
    {
      *(unsigned char *)(*(void *)(v8[7] + 8) + 24) = 1;
      uint64_t v9 = *(void *)(v8[8] + 8);
      *(void *)(v9 + 32) = a2;
      *(void *)(v9 + 40) = a3;
    }
  }
  return result;
}

- (BOOL)valueOfVariableIsAmbiguous:(id)a3
{
  if (!self->_engineNeedsOptimization || self->_allowUnoptimizedReads)
  {
    if (a3) {
      goto LABEL_4;
    }
    return 1;
  }
  [(NSISEngine *)self optimize];
  if (!a3) {
    return 1;
  }
LABEL_4:
  uint64_t v5 = 0;
  while (*((NSISEngine **)a3 + v5 + 3) != self)
  {
    if (++v5 == 3) {
      goto LABEL_9;
    }
  }
  if (*((_DWORD *)a3 + v5 + 12) != -1) {
    goto LABEL_11;
  }
LABEL_9:
  if (!*((void *)a3 + 2) || [a3 overflowEngineVarIndexForEngine:self] == -1) {
    return 1;
  }
LABEL_11:
  uint64_t v6 = 0;
  while (*((NSISEngine **)a3 + v6 + 3) != self)
  {
    if (++v6 == 3) {
      goto LABEL_18;
    }
  }
  unsigned int v8 = *((_DWORD *)a3 + v6 + 12);
  if (v8 != -1) {
    goto LABEL_21;
  }
LABEL_18:
  if (*((void *)a3 + 2)) {
    unsigned int v8 = [a3 overflowEngineVarIndexForEngine:self];
  }
  else {
    unsigned int v8 = -1;
  }
LABEL_21:
  uint64_t v9 = *(void *)((char *)self->_engineVarTable.blocks + (((unint64_t)v8 >> 3) & 0x1FFFFFF8))
     + 32 * (v8 & 0x3F);
  if (*(_DWORD *)(v9 + 16) == -1)
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", a3, self file lineNumber description];
  }
  if (*(id *)v9 != a3)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *(void *)v9, a3 file lineNumber description];
  }
  return [(NSISEngine *)(uint64_t)self incoming:0 andOutgoing:0 foundOutgoing:(uint64_t)self rowHeadsThatMakeValueAmbiguousForVariable:v9];
}

- (BOOL)exerciseAmbiguityInVariable:(id)a3
{
  uint64_t v3 = a3;
  if (a3)
  {
    uint64_t v5 = 0;
    while (*((NSISEngine **)a3 + v5 + 3) != self)
    {
      if (++v5 == 3) {
        goto LABEL_7;
      }
    }
    if (*((_DWORD *)a3 + v5 + 12) != -1) {
      goto LABEL_9;
    }
LABEL_7:
    if (!*((void *)a3 + 2) || [a3 overflowEngineVarIndexForEngine:self] == -1)
    {
      LOBYTE(v3) = 0;
      return (char)v3;
    }
LABEL_9:
    uint64_t v6 = 0;
    while ((NSISEngine *)v3[v6 + 3] != self)
    {
      if (++v6 == 3) {
        goto LABEL_15;
      }
    }
    unsigned int v7 = *((_DWORD *)v3 + v6 + 12);
    if (v7 != -1) {
      goto LABEL_18;
    }
LABEL_15:
    if (v3[2]) {
      unsigned int v7 = [v3 overflowEngineVarIndexForEngine:self];
    }
    else {
      unsigned int v7 = -1;
    }
LABEL_18:
    uint64_t v8 = *(void *)((char *)self->_engineVarTable.blocks + (((unint64_t)v7 >> 3) & 0x1FFFFFF8))
       + 32 * (v7 & 0x3F);
    if (*(_DWORD *)(v8 + 16) == -1)
    {
      uint64_t v11 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", v3, self file lineNumber description];
    }
    if (*(void **)v8 != v3)
    {
      int v12 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *(void *)v8, v3 file lineNumber description];
    }
    long long v15 = 0uLL;
    long long v14 = 0uLL;
    char v13 = 0;
    BOOL v9 = [(NSISEngine *)(uint64_t)self incoming:&v14 andOutgoing:&v13 foundOutgoing:(uint64_t)self rowHeadsThatMakeValueAmbiguousForVariable:v8];
    if (v13) {
      LODWORD(v3) = v9;
    }
    else {
      LODWORD(v3) = 0;
    }
    if (v3 == 1) {
      _pivotToMakeColNewHeadOfRow((uint64_t)self, v15, *((uint64_t ***)&v15 + 1), v14, *((uint64_t *)&v14 + 1), 0);
    }
  }
  return (char)v3;
}

- (id)allVariableValues
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E10]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__NSISEngine_allVariableValues__block_invoke;
  v5[3] = &unk_1E5C57048;
  v5[4] = self;
  void v5[5] = v3;
  -[NSISEngine enumerateEngineVars:](self, (uint64_t)v5);
  return v3;
}

uint64_t __31__NSISEngine_allVariableValues__block_invoke(uint64_t a1, uint64_t a2, id *a3)
{
  id v4 = *a3;
  [*(id *)(a1 + 32) valueForVariable:v4];
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithDouble:");
  return [v5 setObject:v6 forKey:v4];
}

- (NSMutableArray)variablesWithValueRestrictionViolations
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)revertsAfterUnsatisfiabilityHandler
{
  return self->_revertsAfterUnsatisfiabilityHandler;
}

- (void)setRevertsAfterUnsatisfiabilityHandler:(BOOL)a3
{
  self->_revertsAfterUnsatisfiabilityHandler = a3;
}

- (NSISVariable)artificialRowHead
{
  return (NSISVariable *)objc_getProperty(self, a2, 424, 1);
}

- (void)setArtificialRowHead:(id)a3
{
}

- (NSISVariable)artificialObjectiveRowHead
{
  return (NSISVariable *)objc_getProperty(self, a2, 432, 1);
}

- (void)setArtificialObjectiveRowHead:(id)a3
{
}

- (NSISObjectiveLinearExpression)artificialObjectiveRowBody
{
  return (NSISObjectiveLinearExpression *)objc_getProperty(self, a2, 440, 1);
}

- (void)setArtificialObjectiveRowBody:(id)a3
{
}

- (void)_disambiguateFrame:(void *)a3 forAmbiguousItem:(double)a4 withOldFrame:(double)a5
{
  if (result)
  {
    char v13 = result;
    if (objc_msgSend(result, "valueOfVariableIsAmbiguous:", objc_msgSend(a3, "nsli_minXVariable")))
    {
      *a2 = a4;
      uint64_t v14 = 1;
    }
    else
    {
      uint64_t v14 = 0;
    }
    if (objc_msgSend(v13, "valueOfVariableIsAmbiguous:", objc_msgSend(a3, "nsli_minYVariable")))
    {
      a2[1] = a5;
      ++v14;
    }
    int v15 = objc_msgSend(v13, "valueOfVariableIsAmbiguous:", objc_msgSend(a3, "nsli_boundsWidthVariable"));
    int v16 = objc_msgSend(v13, "valueOfVariableIsAmbiguous:", objc_msgSend(a3, "nsli_boundsHeightVariable"));
    if (v15)
    {
      double v18 = 10.0;
      if (a6 >= 10.0) {
        double v18 = a6;
      }
      a2[2] = v18;
      ++v14;
      if (v16) {
        goto LABEL_9;
      }
    }
    else if (v16)
    {
LABEL_9:
      double v17 = 10.0;
      if (a7 >= 10.0) {
        double v17 = a7;
      }
      a2[3] = v17;
      ++v14;
      goto LABEL_16;
    }
    if (!v14)
    {
      if ((_NSRuntimeResolvedAmbiguityDetected() & 1) == 0) {
        return (void *)(v14 != 0);
      }
      goto LABEL_17;
    }
LABEL_16:
    if (!_NSRuntimeAmbiguityDetected()) {
      return (void *)(v14 != 0);
    }
LABEL_17:
    NSLog(&cfstr_TheItemMarkedA.isa, a3);
    return (void *)(v14 != 0);
  }
  return result;
}

@end