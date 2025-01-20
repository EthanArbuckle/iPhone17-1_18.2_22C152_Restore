@interface NSISObjectiveLinearExpression
- (BOOL)_restrictedVarWithCoefficientOfLargestNegativeMagnitudeOutVar:(id *)a3;
- (BOOL)constantTermIsZero;
- (NSISObjectiveLinearExpression)init;
- (id)_initWithEngine:(id)a3;
- (id)description;
- (uint64_t)addVar:(double)a3 priority:(double)a4 times:;
- (uint64_t)addVar:(uint64_t)a3 priority:(uint64_t)a4 times:(double)a5 processVarNewToReceiver:(double)a6 processVarDroppedFromReceiver:;
- (uint64_t)cleanupForReuse;
- (uint64_t)enumerateVars:(uint64_t)result;
- (uint64_t)incrementConstantWithPriority:(double)a3 value:;
- (uint64_t)incrementConstantWithPriorityVector:(double)a3 timesScalarCoefficient:;
- (uint64_t)restrictedVarWithCoefficientOfLargestNegativeMagnitudeOutVar:(uint64_t)result;
- (uint64_t)restrictedVariableWithCoefficientOfLargestNegativeMagnitude;
- (uint64_t)setPriorityVector:(uint64_t)a3 forKnownAbsentVar:;
- (uint64_t)valueRestrictionForVar:(uint64_t)result;
- (uint64_t)variableCount;
- (uint64_t)verifyInternalIntegrity;
- (unint64_t)_variableCount;
- (unsigned)addExpression:(uint64_t)a3 priority:(uint64_t)a4 times:(double)a5 processVarNewToReceiver:(double)a6 processVarDroppedFromReceiver:;
- (unsigned)replaceVar:(double)a3 withVarPlusDelta:;
- (void)_addVar:(id)a3 priority:(double)a4 times:(double)a5;
- (void)_removeVar:(id)a3;
- (void)_replaceVar:(id)a3 withExpression:(id *)a4 processVarNewToReceiver:(id)a5 processVarDroppedFromReceiver:(id)a6;
- (void)addVariable:(uint64_t)a1 priority:times:;
- (void)dealloc;
- (void)initWithEngine:(void *)a1;
- (void)initWithLinearExpression:(uint64_t)a3 priority:(double)a4 engine:;
- (void)leadingPriority:(void *)a3 andValue:(unsigned int)a4 forVar:;
- (void)priorityVectorForVar:(void *)result;
- (void)removeVar:(uint64_t)a1;
- (void)removeVariable:(uint64_t)a1;
- (void)replaceVar:(unsigned __int16 *)a3 withExpression:(uint64_t)a4 processVarNewToReceiver:(uint64_t)a5 processVarDroppedFromReceiver:;
- (void)replaceVar:(unsigned int)a3 withVarPlusDelta:(uint64_t)a4 timesVar:(uint64_t)a5 processVarNewToReceiver:(double)a6 processVarDroppedFromReceiver:;
- (void)replaceVariable:(uint64_t)a1 withExpression:processVariableNewToReceiver:processVariableDroppedFromReceiver:;
@end

@implementation NSISObjectiveLinearExpression

- (uint64_t)variableCount
{
  if (result) {
    return *(unsigned int *)(result + 40);
  }
  return result;
}

- (void)replaceVar:(unsigned __int16 *)a3 withExpression:(uint64_t)a4 processVarNewToReceiver:(uint64_t)a5 processVarDroppedFromReceiver:
{
  if (a1)
  {
    uint64_t v10 = a1 + 16;
    v11 = (__n128 *)_findWithHashFunction(a1 + 16, a2);
    __n128 v19 = 0uLL;
    uint64_t v20 = 0;
    NSISSparseVectorInitWithVector(&v19, v11);
    NSISSparseVectorMapDelete(v10, a2);
    if (_NSConstraintBasedLayoutDebug())
    {
      uint64_t v12 = NSISLinExpDescriptionInEngine((uint64_t)a3, *(void *)(a1 + 8));
      NSLog(&cfstr_ObjectivePRepl.isa, a1, a2, v12);
    }
    if (!v19.n128_u16[4])
    {
      uint64_t v14 = [NSString stringWithFormat:@"%@: internal error.  Substituting an expression for a variable (%d) that doesn't exist in this expression", a1, a2];
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v14 userInfo:0]);
    }
    double v13 = NSISLinExpConstant((uint64_t)a3);
    if (v13 == 0.0)
    {
      if (*(double *)&NSISEpsilon > 0.0)
      {
LABEL_8:
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __113__NSISObjectiveLinearExpression_replaceVar_withExpression_processVarNewToReceiver_processVarDroppedFromReceiver___block_invoke;
        v15[3] = &unk_1E5C56970;
        int v18 = a2;
        __n128 v16 = v19;
        uint64_t v17 = v20;
        v15[4] = a1;
        v15[5] = a5;
        v15[6] = a4;
        v15[7] = sel_replaceVar_withExpression_processVarNewToReceiver_processVarDroppedFromReceiver_;
        NSISLinExpEnumerateVarsAndCoefficients(a3, (uint64_t)v15);
        NSISSparseVectorMinHeapDestroy((void **)&v19);
        return;
      }
    }
    else if (fabs(v13) < *(double *)&NSISEpsilon)
    {
      goto LABEL_8;
    }
    NSISSparseVectorAddVectorTimesScalar(a1 + 56, (unsigned __int16 *)&v19, v13);
    goto LABEL_8;
  }
}

void __113__NSISObjectiveLinearExpression_replaceVar_withExpression_processVarNewToReceiver_processVarDroppedFromReceiver___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  unsigned int v4 = a2;
  if (*(_DWORD *)(a1 + 88) == a2) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 32), @"NSISObjectiveLinearExpression.m", 296, @"Unexpected variable %d in expression replacing that same variable", a2);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  unsigned int v7 = v4;
  if (v6 && (v8 = _findWithHashFunction(v6 + 16, v4)) != 0)
  {
    v9 = v8;
    NSISSparseVectorMapRemoveFromMinHeap(*(void *)(a1 + 32) + 16, v8);
    NSISSparseVectorAddVectorTimesScalar((uint64_t)v9, (unsigned __int16 *)(a1 + 64), a3);
    uint64_t v10 = *(void *)(a1 + 32);
    if (v9[4])
    {
      AddVarToSortedPriorityVectorList(v10, v7, v9);
    }
    else
    {
      -[NSISObjectiveLinearExpression removeVar:](v10, v7);
      v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      v11();
    }
  }
  else
  {
    __n128 v12 = 0uLL;
    uint64_t v13 = 0;
    NSISSparseVectorCreateCopy(a1 + 64, (uint64_t)&v12);
    NSISSparseVectorMultiplyByScalar((uint64_t *)&v12, a3);
    if (v12.n128_u16[4])
    {
      -[NSISObjectiveLinearExpression setPriorityVector:forKnownAbsentVar:](*(void *)(a1 + 32), &v12, v4);
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      NSISSparseVectorMinHeapDestroy((void **)&v12);
    }
  }
}

- (uint64_t)addVar:(uint64_t)a3 priority:(uint64_t)a4 times:(double)a5 processVarNewToReceiver:(double)a6 processVarDroppedFromReceiver:
{
  if (result)
  {
    uint64_t v11 = result;
    double v12 = fabs(a6);
    if (v12 >= INFINITY && v12 <= INFINITY) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_addVar_priority_times_processVarNewToReceiver_processVarDroppedFromReceiver_, result, @"NSISObjectiveLinearExpression.m", 189, @"Invalid parameter not satisfying: %@", @"isfinite(value)");
    }
    uint64_t v13 = a2;
    uint64_t v14 = _findWithHashFunction(v11 + 16, a2);
    if (v14)
    {
      v15 = v14;
      NSISSparseVectorMapRemoveFromMinHeap(v11 + 16, v14);
      NSISSparseVectorAddTermWithPlaceValueAndCoefficient((uint64_t)v15, a5, a6);
      if (v15[4])
      {
        return AddVarToSortedPriorityVectorList(v11, v13, v15);
      }
      else
      {
        -[NSISObjectiveLinearExpression removeVar:](v11, v13);
        __n128 v16 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 16);
        return v16(a4, v13);
      }
    }
    else
    {
      __n128 v17 = 0uLL;
      uint64_t v18 = 0;
      NSISSparseVectorInit(&v17);
      NSISSparseVectorAddTermWithPlaceValueAndCoefficient((uint64_t)&v17, a5, a6);
      -[NSISObjectiveLinearExpression setPriorityVector:forKnownAbsentVar:](v11, &v17, a2);
      return (*(uint64_t (**)(uint64_t, void))(a3 + 16))(a3, a2);
    }
  }
  return result;
}

- (uint64_t)valueRestrictionForVar:(uint64_t)result
{
  if (result)
  {
    v3 = *(void **)(result + 8);
    if (!v3) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_valueRestrictionForVar_, result, @"NSISObjectiveLinearExpression.m", 144, @"Requires an engine to look up value restriction");
    }
    return [v3 valueRestrictionForEngineVarIndex:a2];
  }
  return result;
}

- (uint64_t)setPriorityVector:(uint64_t)a3 forKnownAbsentVar:
{
  if (result)
  {
    unsigned int v3 = a3;
    uint64_t v4 = result;
    if (!a2->n128_u16[4])
    {
      uint64_t v6 = [NSString stringWithFormat:@"%@: internal error.  Setting empty vector for variable %d.", result, a3];
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v6 userInfo:0]);
    }
    NSISSparseVectorMapInsert(result + 16, a3, a2);
    return AddVarToSortedPriorityVectorList(v4, v3, v5);
  }
  return result;
}

- (void)removeVar:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = a1 + 16;
    uint64_t v4 = (void **)_findWithHashFunction(a1 + 16, a2);
    NSISSparseVectorMinHeapDestroy(v4);
    NSISSparseVectorMapDelete(v3, a2);
  }
}

uint64_t __116__NSISObjectiveLinearExpression_addExpression_priority_times_processVarNewToReceiver_processVarDroppedFromReceiver___block_invoke(uint64_t a1, unsigned int a2, double a3)
{
  return -[NSISObjectiveLinearExpression addVar:priority:times:processVarNewToReceiver:processVarDroppedFromReceiver:](*(void *)(a1 + 32), a2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64) * a3);
}

uint64_t __74__NSISObjectiveLinearExpression_initWithLinearExpression_priority_engine___block_invoke(uint64_t a1, unsigned int a2, double a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return -[NSISObjectiveLinearExpression addVar:priority:times:processVarNewToReceiver:processVarDroppedFromReceiver:](result, a2, (uint64_t)&__block_literal_global_32, (uint64_t)&__block_literal_global_34, *(double *)(a1 + 40), a3);
  }
  return result;
}

- (void)leadingPriority:(void *)a3 andValue:(unsigned int)a4 forVar:
{
  if (result)
  {
    uint64_t result = _findWithHashFunction((uint64_t)(result + 2), a4);
    if (result)
    {
      return (void *)NSISSparseVectorGetStrongestTerm((uint64_t)result, a2, a3);
    }
    else
    {
      *a2 = 0;
      *a3 = 0;
    }
  }
  return result;
}

- (uint64_t)restrictedVarWithCoefficientOfLargestNegativeMagnitudeOutVar:(uint64_t)result
{
  if (result)
  {
    uint64_t result = NSISSparseVectorMinHeapPeek((_DWORD *)(result + 16));
    if (result)
    {
      *a2 = *(_DWORD *)(result + 12);
      return 1;
    }
  }
  return result;
}

- (uint64_t)enumerateVars:(uint64_t)result
{
  if (result)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __47__NSISObjectiveLinearExpression_enumerateVars___block_invoke;
    v2[3] = &unk_1E5C56900;
    v2[4] = a2;
    return NSISSparseVectorMapForEach(result + 16, (uint64_t)v2);
  }
  return result;
}

uint64_t __47__NSISObjectiveLinearExpression_enumerateVars___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)constantTermIsZero
{
  if (result) {
    return *(_WORD *)(result + 64) == 0;
  }
  return result;
}

- (unsigned)addExpression:(uint64_t)a3 priority:(uint64_t)a4 times:(double)a5 processVarNewToReceiver:(double)a6 processVarDroppedFromReceiver:
{
  if (result)
  {
    uint64_t v11 = result;
    double v12 = NSISLinExpConstant((uint64_t)a2);
    NSISSparseVectorAddTermWithPlaceValueAndCoefficient((uint64_t)(v11 + 28), a5, v12 * a6);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __116__NSISObjectiveLinearExpression_addExpression_priority_times_processVarNewToReceiver_processVarDroppedFromReceiver___block_invoke;
    v13[3] = &unk_1E5C56948;
    *(double *)&v13[7] = a5;
    *(double *)&v13[8] = a6;
    v13[4] = v11;
    v13[5] = a3;
    v13[6] = a4;
    return NSISLinExpEnumerateVarsAndCoefficients(a2, (uint64_t)v13);
  }
  return result;
}

- (uint64_t)cleanupForReuse
{
  if (result)
  {
    uint64_t v1 = result;
    NSISSparseVectorClearContents(result + 56);
    return NSISSparseVectorMapClearContents(v1 + 16);
  }
  return result;
}

- (void)initWithLinearExpression:(uint64_t)a3 priority:(double)a4 engine:
{
  if (!a1) {
    return 0;
  }
  uint64_t v6 = -[NSISObjectiveLinearExpression initWithEngine:](a1, a3);
  unsigned int v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__NSISObjectiveLinearExpression_initWithLinearExpression_priority_engine___block_invoke;
    v10[3] = &unk_1E5C56890;
    v10[4] = v6;
    *(double *)&v10[5] = a4;
    NSISLinExpEnumerateVarsAndCoefficients(a2, (uint64_t)v10);
    double v8 = NSISLinExpConstant((uint64_t)a2);
    NSISSparseVectorAddTermWithPlaceValueAndCoefficient((uint64_t)(v7 + 7), a4, v8);
  }
  return v7;
}

- (void)dealloc
{
  NSISSparseVectorMinHeapDestroy((void **)&self->_constant.values);
  NSISSparseVectorMapDestroy((uint64_t)&self->_priorityMap);
  v3.receiver = self;
  v3.super_class = (Class)NSISObjectiveLinearExpression;
  [(NSISObjectiveLinearExpression *)&v3 dealloc];
}

- (void)initWithEngine:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)NSISObjectiveLinearExpression;
  objc_super v3 = objc_msgSendSuper2(&v6, sel_init);
  uint64_t v4 = v3;
  if (v3)
  {
    v3[1] = a2;
    NSISSparseVectorMapInit(v3 + 2);
    NSISSparseVectorInit(v4 + 7);
  }
  return v4;
}

- (void)replaceVar:(unsigned int)a3 withVarPlusDelta:(uint64_t)a4 timesVar:(uint64_t)a5 processVarNewToReceiver:(double)a6 processVarDroppedFromReceiver:
{
  if (a1)
  {
    if (a2 == a3) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_replaceVar_withVarPlusDelta_timesVar_processVarNewToReceiver_processVarDroppedFromReceiver_, a1, @"NSISObjectiveLinearExpression.m", 239, @"Invalid parameter not satisfying: %@", @"origVar.value != newVar.value");
    }
    double v12 = (unsigned __int16 *)_findWithHashFunction(a1 + 16, a2);
    uint64_t v13 = a3;
    uint64_t v14 = _findWithHashFunction(a1 + 16, a3);
    if (v14)
    {
      v15 = v14;
      NSISSparseVectorMapRemoveFromMinHeap(a1 + 16, v14);
      NSISSparseVectorAddVectorTimesScalar((uint64_t)v15, v12, a6);
      if (v15[4])
      {
        AddVarToSortedPriorityVectorList(a1, v13, v15);
      }
      else
      {
        -[NSISObjectiveLinearExpression removeVar:](a1, v13);
        __n128 v16 = *(void (**)(uint64_t, uint64_t))(a5 + 16);
        v16(a5, v13);
      }
    }
    else
    {
      __n128 v17 = 0uLL;
      uint64_t v18 = 0;
      NSISSparseVectorCreateCopy((uint64_t)v12, (uint64_t)&v17);
      NSISSparseVectorMultiplyByScalar((uint64_t *)&v17, a6);
      if (v17.n128_u16[4])
      {
        -[NSISObjectiveLinearExpression setPriorityVector:forKnownAbsentVar:](a1, &v17, a3);
        (*(void (**)(uint64_t, void))(a4 + 16))(a4, a3);
      }
      else
      {
        NSISSparseVectorMinHeapDestroy((void **)&v17);
      }
    }
  }
}

- (unsigned)replaceVar:(double)a3 withVarPlusDelta:
{
  if (result)
  {
    uint64_t v4 = result;
    uint64_t result = (unsigned __int16 *)_findWithHashFunction((uint64_t)(result + 8), a2);
    if (a3 == 0.0)
    {
      if (*(double *)&NSISEpsilon > 0.0) {
        return result;
      }
    }
    else if (fabs(a3) < *(double *)&NSISEpsilon)
    {
      return result;
    }
    return (unsigned __int16 *)NSISSparseVectorAddVectorTimesScalar((uint64_t)(v4 + 28), result, a3);
  }
  return result;
}

- (NSISObjectiveLinearExpression)init
{
  v5.receiver = self;
  v5.super_class = (Class)NSISObjectiveLinearExpression;
  objc_super v3 = [(NSISObjectiveLinearExpression *)&v5 init];
  if (v3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, @"NSISObjectiveLinearExpression.m", 37, @"NSISObjectiveLinearExpression init is no longer supported.");
  }
  return v3;
}

- (uint64_t)addVar:(double)a3 priority:(double)a4 times:
{
  if (result) {
    return -[NSISObjectiveLinearExpression addVar:priority:times:processVarNewToReceiver:processVarDroppedFromReceiver:](result, a2, (uint64_t)&__block_literal_global_32, (uint64_t)&__block_literal_global_34, a3, a4);
  }
  return result;
}

- (uint64_t)incrementConstantWithPriority:(double)a3 value:
{
  if (result) {
    return NSISSparseVectorAddTermWithPlaceValueAndCoefficient(result + 56, a2, a3);
  }
  return result;
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"{objective %p: %@", self, NSISSparseVectorDescription((unsigned __int16 *)&self->_constant)];
  uint64_t count = self->_priorityMap.count;
  if (count)
  {
    objc_super v5 = (unsigned int *)malloc_type_malloc(4 * count, 0x100004052888210uLL);
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    int v16 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __44__NSISObjectiveLinearExpression_description__block_invoke;
    v14[3] = &unk_1E5C568B8;
    v14[4] = v15;
    v14[5] = v5;
    NSISSparseVectorMapForEach((uint64_t)&self->_priorityMap, (uint64_t)v14);
    qsort_b(v5, self->_priorityMap.count, 4uLL, &__block_literal_global_0);
    if (self->_priorityMap.count)
    {
      unint64_t v6 = 0;
      engine = self->_engine;
      do
      {
        uint64_t v8 = v5[v6];
        id v9 = [(NSISEngine *)engine variableForEngineVarIndex:v8];
        if (v9) {
          uint64_t v10 = [v9 descriptionInEngine:engine];
        }
        else {
          uint64_t v10 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedInt:", v8), "description");
        }
        uint64_t v11 = v10;
        double v12 = (unsigned __int16 *)_findWithHashFunction((uint64_t)&self->_priorityMap, v8);
        [v3 appendFormat:@" + %@*%@", NSISSparseVectorDescription(v12), v11];
        ++v6;
      }
      while (v6 < self->_priorityMap.count);
    }
    free(v5);
    _Block_object_dispose(v15, 8);
  }
  [v3 appendString:@"}"];
  return v3;
}

uint64_t __44__NSISObjectiveLinearExpression_description__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(result + 40)
            + 4 * (*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24))++) = *(_DWORD *)(a2 + 12);
  return result;
}

unint64_t __44__NSISObjectiveLinearExpression_description__block_invoke_2(uint64_t a1, unsigned int a2, unsigned int a3)
{
  return (__PAIR64__(a2 > a3, a2) - a3) >> 32;
}

- (void)priorityVectorForVar:(void *)result
{
  if (result) {
    return _findWithHashFunction((uint64_t)(result + 2), a2);
  }
  return result;
}

- (uint64_t)incrementConstantWithPriorityVector:(double)a3 timesScalarCoefficient:
{
  if (result)
  {
    if (a3 == 0.0)
    {
      if (*(double *)&NSISEpsilon > 0.0) {
        return result;
      }
      return NSISSparseVectorAddVectorTimesScalar(result + 56, a2, a3);
    }
    if (fabs(a3) >= *(double *)&NSISEpsilon) {
      return NSISSparseVectorAddVectorTimesScalar(result + 56, a2, a3);
    }
  }
  return result;
}

- (uint64_t)verifyInternalIntegrity
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = result + 16;
    NSISSparseVectorMapForEach(result + 16, (uint64_t)&__block_literal_global_62);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __56__NSISObjectiveLinearExpression_verifyInternalIntegrity__block_invoke_2;
    v3[3] = &unk_1E5C569B8;
    v3[4] = v1;
    v3[5] = sel_verifyInternalIntegrity;
    NSISSparseVectorMinHeapForEach(v2, (uint64_t)v3);
    return VerifyHeapIntegrity(v2);
  }
  return result;
}

void __56__NSISObjectiveLinearExpression_verifyInternalIntegrity__block_invoke(uint64_t a1, uint64_t a2)
{
  if (!*(_WORD *)(a2 + 8))
  {
    uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"Variable %d is in the objective row with an empty priority vector", *(unsigned int *)(a2 + 12));
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v2 userInfo:0]);
  }
}

uint64_t __56__NSISObjectiveLinearExpression_verifyInternalIntegrity__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a2 + 12);
  if (-[NSISObjectiveLinearExpression valueRestrictionForVar:](*(void *)(a1 + 32), *(_DWORD *)(a2 + 12)) != 1)return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)(a1 + 32), @"NSISObjectiveLinearExpression.m", 377, @"The var %d is in the heap when it shouldn't be.", v4); {
  uint64_t result = NSISSparseVectorStrongestTermIsNegative((_WORD *)a2);
  }
  if ((result & 1) == 0) {
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)(a1 + 32), @"NSISObjectiveLinearExpression.m", 377, @"The var %d is in the heap when it shouldn't be.", v4);
  }
  return result;
}

- (void)addVariable:(uint64_t)a1 priority:times:
{
  if (a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__NSISObjectiveLinearExpression_addVariable_priority_times___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = sel_addVariable_priority_times_;
    if (addVariable_priority_times__onceToken != -1) {
      dispatch_once(&addVariable_priority_times__onceToken, block);
    }
  }
}

void __60__NSISObjectiveLinearExpression_addVariable_priority_times___block_invoke(uint64_t a1)
{
  uint64_t v1 = NSStringFromSelector(*(SEL *)(a1 + 32));
  NSLog(&cfstr_IsDeprecatedAn.isa, v1);
}

- (void)removeVariable:(uint64_t)a1
{
  if (a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__NSISObjectiveLinearExpression_removeVariable___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = sel_removeVariable_;
    if (removeVariable__onceToken != -1) {
      dispatch_once(&removeVariable__onceToken, block);
    }
  }
}

void __48__NSISObjectiveLinearExpression_removeVariable___block_invoke(uint64_t a1)
{
  uint64_t v1 = NSStringFromSelector(*(SEL *)(a1 + 32));
  NSLog(&cfstr_IsDeprecatedAn.isa, v1);
}

- (uint64_t)restrictedVariableWithCoefficientOfLargestNegativeMagnitude
{
  if (a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__NSISObjectiveLinearExpression_restrictedVariableWithCoefficientOfLargestNegativeMagnitude__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = sel_restrictedVariableWithCoefficientOfLargestNegativeMagnitude;
    if (restrictedVariableWithCoefficientOfLargestNegativeMagnitude_onceToken != -1) {
      dispatch_once(&restrictedVariableWithCoefficientOfLargestNegativeMagnitude_onceToken, block);
    }
  }
  return 0;
}

void __92__NSISObjectiveLinearExpression_restrictedVariableWithCoefficientOfLargestNegativeMagnitude__block_invoke(uint64_t a1)
{
  uint64_t v1 = NSStringFromSelector(*(SEL *)(a1 + 32));
  NSLog(&cfstr_IsDeprecatedAn.isa, v1);
}

- (void)replaceVariable:(uint64_t)a1 withExpression:processVariableNewToReceiver:processVariableDroppedFromReceiver:
{
  if (a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __128__NSISObjectiveLinearExpression_replaceVariable_withExpression_processVariableNewToReceiver_processVariableDroppedFromReceiver___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = sel_replaceVariable_withExpression_processVariableNewToReceiver_processVariableDroppedFromReceiver_;
    if (replaceVariable_withExpression_processVariableNewToReceiver_processVariableDroppedFromReceiver__onceToken != -1) {
      dispatch_once(&replaceVariable_withExpression_processVariableNewToReceiver_processVariableDroppedFromReceiver__onceToken, block);
    }
  }
}

void __128__NSISObjectiveLinearExpression_replaceVariable_withExpression_processVariableNewToReceiver_processVariableDroppedFromReceiver___block_invoke(uint64_t a1)
{
  uint64_t v1 = NSStringFromSelector(*(SEL *)(a1 + 32));
  NSLog(&cfstr_IsDeprecatedAn.isa, v1);
}

- (id)_initWithEngine:(id)a3
{
  return -[NSISObjectiveLinearExpression initWithEngine:](self, (uint64_t)a3);
}

- (void)_addVar:(id)a3 priority:(double)a4 times:(double)a5
{
  if (self) {
    -[NSISObjectiveLinearExpression addVar:priority:times:processVarNewToReceiver:processVarDroppedFromReceiver:]((uint64_t)self, a3.var0, (uint64_t)&__block_literal_global_32, (uint64_t)&__block_literal_global_34, a4, a5);
  }
}

- (void)_removeVar:(id)a3
{
}

- (void)_replaceVar:(id)a3 withExpression:(id *)a4 processVarNewToReceiver:(id)a5 processVarDroppedFromReceiver:(id)a6
{
}

- (BOOL)_restrictedVarWithCoefficientOfLargestNegativeMagnitudeOutVar:(id *)a3
{
  if (self)
  {
    self = (NSISObjectiveLinearExpression *)NSISSparseVectorMinHeapPeek(&self->_priorityMap);
    if (self)
    {
      a3->var0 = *(_DWORD *)(&self->_engine + 4);
      LOBYTE(self) = 1;
    }
  }
  return (char)self;
}

- (unint64_t)_variableCount
{
  if (self) {
    return *(unsigned int *)(self + 40);
  }
  return self;
}

@end