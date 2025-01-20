unint64_t NSISLinExpSetCoefficientForVar(unsigned __int16 *a1, unsigned int a2, double a3)
{
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  unint64_t result;
  double *v14;

  v6 = fabs(a3);
  if (v6 >= INFINITY && v6 <= INFINITY)
  {
    v7 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "void NSISLinExpSetCoefficientForVar(NSISLinExp *, NSISFloat_t, NSISLinExpVar)"), @"NSISLinearExpression.m", 703, @"Invalid parameter not satisfying: %@", @"isfinite(coefficient)" file lineNumber description];
  }
  v8 = 0.0;
  if (a3 == 0.0)
  {
    if (*(double *)&NSISEpsilon > 0.0) {
      goto LABEL_18;
    }
  }
  else if (v6 < *(double *)&NSISEpsilon)
  {
    goto LABEL_18;
  }
  v8 = rint(a3);
  if (vabdd_f64(a3, v8) >= *(double *)&NSISEpsilon)
  {
    v9 = rint(a3 * 8.0);
    v10 = fabs(a3 * 8.0);
    if (vabdd_f64(v9, a3 * 8.0) >= *(double *)&NSISEpsilon * 8.0 || v10 == INFINITY) {
      v8 = a3;
    }
    else {
      v8 = v9 * 0.125;
    }
  }
LABEL_18:
  v14 = 0;
  result = vars_index_with_insert(a1, a2, 0, &v14);
  *v14 = v8;
  return result;
}

unint64_t _row_rawSetHead(uint64_t a1, _DWORD *a2, uint64_t a3, id **a4)
{
  uint64_t v8 = (uint64_t)(a4 + 1);
  uint64_t v9 = NSBitSetCount((uint64_t)(a4 + 1));
  if (NSBitSetCount((uint64_t)(a4 + 3)) + v9)
  {
    v26 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "void _row_rawSetHead(NSISRow, NSISCol)"), @"NSISEngine_Row.h", 133, @"Tried converting column variable %@ to a row head while it still appears as a body variable in some rows:%@", **a4, _col_description(a3, (uint64_t **)a4) file lineNumber description];
  }
  v10 = *a4;
  NSBitSetReset(v8);
  NSBitSetReset((uint64_t)(a4 + 3));
  unint64_t v11 = *((unsigned int *)*a4 + 5);
  uint64_t v12 = a3 + 40 * ((v11 >> 30) & 1);
  NSBitSetAddIndex((unsigned int *)(v12 + 336), v11 & 0xFFFFFFFFBFFFFFFFLL);
  unint64_t result = _table_removeStorageBlockIfPossible(*(void *)(v12 + 312), (uint64_t *)(v12 + 320), 0x19uLL, (uint64_t **)(v12 + 336));
  uint64_t v14 = *(void *)a2;
  if (*(void *)a2)
  {
    uint64_t v15 = a1 + 312;
    unint64_t v16 = ((unint64_t)*(unsigned int *)(v14 + 24) >> 3) & 3;
    v17 = (unsigned int *)(a1 + 312 + 40 * v16 + 24);
    if (!NSBitSetCount((uint64_t)v17)) {
      _table_addStorageBlock((void **)(v15 + 40 * v16), (unint64_t *)(v15 + 40 * v16 + 8), (unint64_t *)(v15 + 40 * v16 + 16), 0x19uLL, 40, v17);
    }
    unint64_t Index = NSBitSetFirstIndex((uint64_t **)v17);
    int v19 = Index;
    unint64_t result = (unint64_t)NSBitSetRemoveIndex((uint64_t *)v17, Index);
    unsigned int v20 = v19 | (v16 << 30);
    uint64_t v21 = 40 * ((v20 >> 30) & 1);
    unint64_t v22 = (v20 & 0xBFFFFFFF) / 0x19uLL;
    unsigned int v23 = (v20 & 0xBFFFFFFF) % 0x19;
    v24 = (void *)(*(void *)(*(void *)(v15 + v21) + 8 * v22) + 40 * v23);
    void *v24 = v14;
    v24[1] = 0;
    v24[2] = 1;
    v24[3] = 0;
    v24[4] = 1;
    uint64_t v25 = *(void *)(*(void *)(v15 + v21) + 8 * v22) + 40 * v23;
    LODWORD(v21) = *(_DWORD *)(v14 + 24) & 0xFFFFFFFE;
    *(_DWORD *)(v14 + 20) = v20;
    *(_DWORD *)(v14 + 24) = v21;
    *(void *)(v14 + 8) = v25;
  }
  *(void *)a2 = v10;
  *((_DWORD *)v10 + 6) |= 1u;
  *((_DWORD *)v10 + 5) = a2[2];
  v10[1] = a2;
  return result;
}

double NSBitSetReset(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 8) >= 2u) {
    free(*(void **)a1);
  }
  *(void *)a1 = 0;
  *(void *)&double result = 1;
  *(void *)(a1 + 8) = 1;
  return result;
}

uint64_t _engineVar_addForVariableIfNeeded(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v4 = 0;
    while (a2[v4 + 3] != a1)
    {
      if (++v4 == 3) {
        goto LABEL_7;
      }
    }
    if (*((_DWORD *)a2 + v4 + 12) != -1) {
      goto LABEL_9;
    }
LABEL_7:
    if (!a2[2] || [a2 overflowEngineVarIndexForEngine:a1] == -1) {
      goto LABEL_13;
    }
LABEL_9:
    uint64_t v5 = 0;
    while (a2[v5 + 3] != a1)
    {
      if (++v5 == 3) {
        goto LABEL_21;
      }
    }
    unsigned int v27 = *((_DWORD *)a2 + v5 + 12);
    if (v27 != -1) {
      goto LABEL_24;
    }
LABEL_21:
    if (a2[2]) {
      unsigned int v27 = [a2 overflowEngineVarIndexForEngine:a1];
    }
    else {
      unsigned int v27 = -1;
    }
LABEL_24:
    uint64_t v28 = *(void *)(*(void *)(a1 + 192) + (((unint64_t)v27 >> 3) & 0x1FFFFFF8)) + 32 * (v27 & 0x3F);
    if (*(_DWORD *)(v28 + 16) == -1)
    {
      v30 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 26, @"Unable to find index for variable:%@ in engine:%@", a2, a1 file lineNumber description];
    }
    if (*(void **)v28 != a2)
    {
      v31 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), @"NSISEngine_EngineVar.h", 27, @"Variable stored in table doesn't match passed in variable %@ != %@", *(void *)v28, a2 file lineNumber description];
    }
  }
  else
  {
LABEL_13:
    if (_NSConstraintBasedLayoutDebug()) {
      NSLog(&cfstr_EnginePAddVari.isa, a1, a2);
    }
    if (!NSBitSetCount(a1 + 216)) {
      _table_addStorageBlock((void **)(a1 + 192), (unint64_t *)(a1 + 200), (unint64_t *)(a1 + 208), 0x40uLL, 32, (unsigned int *)(a1 + 216));
    }
    unint64_t Index = NSBitSetFirstIndex((uint64_t **)(a1 + 216));
    NSBitSetRemoveIndex((uint64_t *)(a1 + 216), Index);
    unsigned int v7 = Index;
    uint64_t v8 = (Index >> 3) & 0x1FFFFFF8;
    unint64_t v9 = Index & 0x3F;
    uint64_t v10 = *(void *)(*(void *)(a1 + 192) + v8) + 32 * v9;
    unint64_t v11 = a2;
    int v12 = 2 * ([a2 valueRestriction] & 3);
    char v13 = [a2 orientationHint];
    *(void *)uint64_t v10 = v11;
    *(void *)(v10 + 8) = 0;
    *(_DWORD *)(v10 + 16) = Index;
    *(_DWORD *)(v10 + 20) = -1;
    *(_DWORD *)(v10 + 24) = v12 & 0xFFFFFFE7 | (8 * (v13 & 3));
    uint64_t v14 = *(void *)(*(void *)(a1 + 192) + v8);
    NSISVariableAddEngine((uint64_t)a2, a1, v7);
    uint64_t v15 = a1 + 312;
    uint64_t v16 = v14 + 32 * v9;
    unint64_t v17 = ((unint64_t)*(unsigned int *)(v16 + 24) >> 3) & 3;
    v18 = (unsigned int *)(a1 + 312 + 40 * v17 + 24);
    if (!NSBitSetCount((uint64_t)v18)) {
      _table_addStorageBlock((void **)(v15 + 40 * v17), (unint64_t *)(v15 + 40 * v17 + 8), (unint64_t *)(v15 + 40 * v17 + 16), 0x19uLL, 40, v18);
    }
    unint64_t v19 = NSBitSetFirstIndex((uint64_t **)v18);
    int v20 = v19;
    NSBitSetRemoveIndex((uint64_t *)v18, v19);
    unsigned int v21 = v20 | (v17 << 30);
    uint64_t v22 = 40 * ((v21 >> 30) & 1);
    unint64_t v23 = (v21 & 0xBFFFFFFF) / 0x19uLL;
    unsigned int v24 = (v21 & 0xBFFFFFFF) % 0x19;
    uint64_t v25 = (void *)(*(void *)(*(void *)(v15 + v22) + 8 * v23) + 40 * v24);
    *uint64_t v25 = v16;
    v25[1] = 0;
    v25[2] = 1;
    v25[3] = 0;
    v25[4] = 1;
    uint64_t v26 = *(void *)(*(void *)(v15 + v22) + 8 * v23) + 40 * v24;
    *(_DWORD *)(v16 + 24) &= ~1u;
    *(_DWORD *)(v16 + 20) = v21;
    *(void *)(v16 + 8) = v26;
  }
  return a1;
}

uint64_t NSBitSetCount(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

uint64_t NSBitSetFindNext(uint64_t **a1, unint64_t a2)
{
  uint64_t v2 = *((unsigned int *)a1 + 2);
  unint64_t v3 = v2 << 6;
  if (v2 << 6 >= a2) {
    unint64_t v3 = a2;
  }
  unint64_t v4 = v3 >> 6;
  if (v2 >= 2) {
    a1 = (uint64_t **)*a1;
  }
  if (v2 <= v4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  LOBYTE(v3) = v3 & 0x3F;
  uint64_t v5 = v2 - v4;
  uint64_t v6 = -64 * v4;
  unsigned int v7 = (uint64_t *)&a1[v4];
  while (1)
  {
    uint64_t v8 = *v7++;
    unint64_t v3 = v8 & (-1 << v3);
    if (v3) {
      break;
    }
    v6 -= 64;
    if (!--v5) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return __clz(__rbit64(v3)) - v6;
}

uint64_t *NSBitSetRemoveIndex(uint64_t *result, unint64_t a2)
{
  unsigned int v2 = *((_DWORD *)result + 2);
  if (v2 > (a2 >> 6))
  {
    unint64_t v3 = result;
    if (v2 >= 2) {
      unint64_t v3 = (uint64_t *)*result;
    }
    if ((v3[(a2 >> 6)] & (1 << a2)) != 0)
    {
      unint64_t v4 = result;
      if (v2 >= 2) {
        unint64_t v4 = (uint64_t *)*result;
      }
      v4[(a2 >> 6)] &= ~(1 << a2);
      --*((_DWORD *)result + 3);
    }
  }
  return result;
}

uint64_t NSBitSetFirstIndex(uint64_t **a1)
{
  return NSBitSetFindNext(a1, 0);
}

BOOL _NSConstraintBasedLayoutDebug()
{
  return _NSGetBoolAppConfig(@"NSConstraintBasedLayoutDebug", 0, (unsigned __int8 *)&sNSConstraintBasedLayoutDebugComputedValue, _NSFalseAppConfigPredicate);
}

unint64_t _table_removeStorageBlockIfPossible(unint64_t result, uint64_t *a2, NSUInteger a3, uint64_t **a4)
{
  if ((unint64_t)*a2 >= 2)
  {
    unint64_t v7 = result;
    double result = NSBitSetCount((uint64_t)a4);
    if (result >= a3)
    {
      uint64_t v8 = *a2;
      uint64_t v9 = *a2 - 1;
      double result = NSBitSetFindNextRange(a4, v9 * a3);
      if (result <= v9 * a3 && v8 * a3 <= result + v10)
      {
        free(*(void **)(v7 + 8 * v9));
        *(void *)(v7 + 8 * v9) = 0;
        *a2 = v9;
        return (unint64_t)NSBitSetRemoveIndexesInRange((uint64_t)a4, v9 * a3, a3);
      }
    }
  }
  return result;
}

uint64_t NSISVariableAddEngine(uint64_t result, uint64_t a2, unsigned int a3)
{
  uint64_t v5 = result;
  for (uint64_t i = 0; i != 3; ++i)
  {
    if (!*(void *)(result + 48 + 8 * i - 24))
    {
      *(void *)(result + 48 + 8 * i - 24) = a2;
      *(_DWORD *)(result + 48 + 4 * i) = a3;
      return result;
    }
  }
  unint64_t v7 = *(void **)(result + 16);
  if (!v7)
  {
    unint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:1282 capacity:5];
    *(void *)(v5 + 16) = v7;
  }
  return [v7 setObject:a3 forKey:a2];
}

BOOL _NSGetBoolAppConfig(void *a1, int a2, unsigned __int8 *a3, uint64_t (*a4)(void))
{
  if (*a3)
  {
    LOBYTE(v4) = *a3 - 2;
    return v4 != 0;
  }
  uint64_t v9 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  if (![v9 objectForKey:a1])
  {
    int v4 = a4();
    if (v4) {
      unsigned __int8 v13 = 3;
    }
    else {
      unsigned __int8 v13 = 2;
    }
    atomic_store(v13, a3);
LABEL_15:
    if (v4 == a2
      || ([a1 isEqual:@"NSLogUnusualAppConfig"] & 1) != 0
      || !_NSGetBoolAppConfig(@"NSLogUnusualAppConfig", 0, &sNSLogUnusualAppConfigComputedValue, _NSFalseAppConfigPredicate))
    {
      return v4 != 0;
    }
    goto LABEL_8;
  }
  int v4 = [v9 BOOLForKey:a1];
  uint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "volatileDomainForName:", *MEMORY[0x1E4F281D8]), "objectForKey:", a1);
  if (v4) {
    unsigned __int8 v11 = 3;
  }
  else {
    unsigned __int8 v11 = 2;
  }
  atomic_store(v11, a3);
  if (!v10) {
    goto LABEL_15;
  }
LABEL_8:
  int v12 = @"NO";
  if (v4) {
    int v12 = @"YES";
  }
  NSLog(&stru_1EFB3C8B8.isa, a1, v12);
  return v4 != 0;
}

BOOL _NSConstraintBasedLayoutAriadneTracepoints()
{
  return _NSGetBoolAppConfig(@"NSConstraintBasedLayoutAriadneTracepoints", 0, (unsigned __int8 *)&sNSConstraintBasedLayoutAriadneTracepointsComputedValue, _NSFalseAppConfigPredicate);
}

BOOL _NSConstraintBasedLayoutDebugEngineConsistency()
{
  return _NSGetBoolAppConfig(@"NSConstraintBasedLayoutDebugEngineConsistency", 0, (unsigned __int8 *)&sNSConstraintBasedLayoutDebugEngineConsistencyComputedValue, _NSFalseAppConfigPredicate);
}

unint64_t _engineVar_rawRemove(uint64_t a1, uint64_t *a2)
{
  if (_NSConstraintBasedLayoutDebug()) {
    NSLog(&cfstr_EnginePRemoveV.isa, a1, (id)*a2, *((unsigned int *)a2 + 4));
  }
  if ((a2[3] & 1) != 0 || (uint64_t v4 = a2[1], v5 = NSBitSetCount(v4 + 8), NSBitSetCount(v4 + 24) + v5))
  {
    unsigned __int8 v11 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "void _engineVar_rawRemove(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 181, @"Not possible to remove variable:%@ from engine %@.", _engineVar_description(a1, (uint64_t)a2), a1 file lineNumber description];
  }
  if (a2[3])
  {
    int v12 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *a2 file lineNumber description];
  }
  uint64_t v6 = a2[1];
  NSBitSetReset(v6 + 8);
  NSBitSetReset(v6 + 24);
  unint64_t v7 = *(unsigned int *)(*(void *)v6 + 20);
  uint64_t v8 = a1 + 40 * ((v7 >> 30) & 1);
  NSBitSetAddIndex((unsigned int *)(v8 + 336), v7 & 0xFFFFFFFFBFFFFFFFLL);
  _table_removeStorageBlockIfPossible(*(void *)(v8 + 312), (uint64_t *)(v8 + 320), 0x19uLL, (uint64_t **)(v8 + 336));
  NSISVariableRemoveEngine(*a2, a1);

  *a2 = 0;
  a2[1] = 0;
  NSBitSetAddIndex((unsigned int *)(a1 + 216), *((unsigned int *)a2 + 4));
  unint64_t v9 = *(void *)(a1 + 192);
  return _table_removeStorageBlockIfPossible(v9, (uint64_t *)(a1 + 200), 0x40uLL, (uint64_t **)(a1 + 216));
}

void NSISVariableRemoveEngine(uint64_t a1, uint64_t a2)
{
  for (uint64_t i = 24; i != 48; i += 8)
  {
    if (*(void *)(a1 + i) == a2)
    {
      *(void *)(a1 + i) = 0;
      return;
    }
  }
  unint64_t v5 = [*(id *)(a1 + 16) count];
  [*(id *)(a1 + 16) removeObjectForKey:a2];
  unint64_t v6 = [*(id *)(a1 + 16) count];
  if (!v6)
  {

    *(void *)(a1 + 16) = 0;
  }
  if (v6 >= v5)
  {
    unint64_t v7 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "void NSISVariableRemoveEngine(NSISVariable *, NSISEngine *)"), @"NSISVariable.m", 260, @"Unable to remove variable %@ from engine %p, it wasn't found.", a1, a2 file lineNumber description];
  }
}

uint64_t _AssertAutoLayoutOnAllowedThreadsOnly(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F29060] isMainThread];
  if (result)
  {
    *(unsigned char *)(a1 + 161) = 1;
    return result;
  }
  unint64_t v3 = @"This application is modifying the autolayout engine from a background thread after the engine was accessed from the main thread. This can lead to engine corruption and weird crashes.\n Stack:%@";
  if (*(unsigned char *)(a1 + 161)) {
    goto LABEL_10;
  }
  id v4 = *(id *)(a1 + 128);
  if (!v4)
  {
    id v5 = (id)[MEMORY[0x1E4F29060] currentThread];
    *(void *)(a1 + 128) = v5;
    if (*(unsigned char *)(a1 + 161)) {
      goto LABEL_10;
    }
    id v4 = v5;
  }
  uint64_t result = [MEMORY[0x1E4F29060] currentThread];
  if (v4 == (id)result) {
    return result;
  }
  if (!*(unsigned char *)(a1 + 161)) {
    unint64_t v3 = @"This application is modifying the autolayout engine from more than a single background thread, which can lead to engine corruption and weird crashes. \n Stack:%@";
  }
LABEL_10:
  NSLog(&v3->isa, [MEMORY[0x1E4F29060] callStackSymbols]);
  uint64_t result = _NSConstraintBasedLayoutAllowBGThreads();
  if ((result & 1) == 0)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "name"), "isEqualToString:", @"WebThread");
    if ((result & 1) == 0)
    {
      uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier"), "isEqualToString:", @"com.apple.mail");
      if ((result & 1) == 0)
      {
        if (*(unsigned char *)(a1 + 161)) {
          unint64_t v6 = @"Modifications to the layout engine must not be performed from a background thread after it has been accessed from the main thread.";
        }
        else {
          unint64_t v6 = @"Modifications to the layout engine must not be performed from more than a single background thread.";
        }
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v6 userInfo:0]);
      }
    }
  }
  return result;
}

BOOL _NSConstraintBasedLayoutDeferOptimization()
{
  return _NSGetBoolAppConfig(@"NSConstraintBasedLayoutDeferOptimization", 1, (unsigned __int8 *)&sNSConstraintBasedLayoutDeferOptimizationComputedValue, _NSTrueAppConfigPredicate);
}

uint64_t NSISLinExpVarCount(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4);
}

void sub_1A6486FDC(void *a1)
{
  objc_begin_catch(a1);
  *(unsigned char *)(v1 + 160) = 0;
  objc_exception_rethrow();
}

void sub_1A6486FEC(_Unwind_Exception *a1)
{
}

uint64_t _objectiveRow_addColWithPriorityTimes(uint64_t a1, uint64_t a2, double a3, double a4, uint64_t a5, uint64_t a6)
{
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = ___objectiveRow_addColWithPriorityTimes_block_invoke;
  v16[3] = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  v16[4] = a1;
  v16[5] = a2;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = ___objectiveRow_addColWithPriorityTimes_block_invoke_2;
  v15[3] = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  v15[4] = a1;
  v15[5] = a2;
  if ((*(unsigned char *)(a2 + 80) & 1) == 0)
  {
    uint64_t v14 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISObjectiveLinearExpression *_objectiveRow_rawBody(NSISRow)"), @"NSISEngine_Row.h", 418, @"Tried accessing the objective linear expression for regular row:%@", _row_description(a1, a2) file lineNumber description];
  }
  uint64_t v11 = *(void *)(a2 + 16);
  unsigned int v12 = *(_DWORD *)(*(void *)a6 + 16);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = ___objectiveRow_rawAddCol_block_invoke;
  v18[3] = &unk_1E5C570C0;
  v18[4] = a1;
  v18[5] = v16;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = ___objectiveRow_rawAddCol_block_invoke_2;
  v17[3] = &unk_1E5C570C0;
  v17[4] = a1;
  v17[5] = v15;
  return -[NSISObjectiveLinearExpression addVar:priority:times:processVarNewToReceiver:processVarDroppedFromReceiver:](v11, v12, (uint64_t)v18, (uint64_t)v17, a3, a4);
}

uint64_t NSISSparseVectorMinHeapInsert(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  unsigned int v5 = *(_DWORD *)(a1 + 12);
  if (v5 <= (int)v4 + 1)
  {
    if (v5) {
      int v6 = 2 * v5;
    }
    else {
      int v6 = 32;
    }
    unint64_t v7 = malloc_type_realloc(*(void **)a1, 8 * v6, 0x2004093837F09uLL);
    *(_DWORD *)(a1 + 12) = v6;
    *(void *)a1 = v7;
    uint64_t v4 = *(unsigned int *)(a1 + 8);
  }
  uint64_t result = _siftUp((uint64_t *)a1, a2, v4);
  *(void *)(*(void *)a1 + 8 * result) = a2;
  ++*(_DWORD *)(a1 + 8);
  *(_DWORD *)(a2 + 16) = result;
  return result;
}

uint64_t _siftUp(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  unsigned int v4 = (a3 | 0xFFFFFFFE) + a3;
  if (*((_DWORD *)a1 + 2) > v4 >> 1)
  {
    uint64_t v7 = v4 >> 1;
    uint64_t v8 = *a1;
    while (1)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)(v8 + 8 * v7);
      uint64_t v11 = NSISSparseVectorCompare((uint64_t *)v10, (uint64_t *)a2);
      if (!v11)
      {
        unsigned int v12 = *(_DWORD *)(v10 + 12);
        unsigned int v13 = *(_DWORD *)(a2 + 12);
        BOOL v14 = v12 >= v13;
        BOOL v15 = v12 > v13;
        uint64_t v16 = !v14;
        uint64_t v11 = v15 - v16;
      }
      if (v11 != 1) {
        break;
      }
      *(void *)(*a1 + 8 * v3) = *(void *)(*a1 + 8 * v9);
      uint64_t v8 = *a1;
      *(_DWORD *)(*(void *)(*a1 + 8 * v3) + 16) = v3;
      unsigned int v17 = (v9 | 0xFFFFFFFE) + v9;
      uint64_t v7 = v17 >> 1;
      uint64_t v3 = v9;
      if (*((_DWORD *)a1 + 2) <= v17 >> 1) {
        return v9;
      }
    }
  }
  return v3;
}

uint64_t NSISSparseVectorCompare(uint64_t *a1, uint64_t *a2)
{
  unsigned int v2 = *((unsigned __int16 *)a1 + 4);
  unsigned int v3 = *((unsigned __int16 *)a2 + 4);
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  if (v2 >= v3) {
    uint64_t v6 = *((unsigned __int16 *)a2 + 4);
  }
  else {
    uint64_t v6 = *((unsigned __int16 *)a1 + 4);
  }
  if (v6)
  {
    uint64_t v7 = (double *)(v5 + 8);
    uint64_t v8 = (double *)(v4 + 8);
    uint64_t result = 1;
    uint64_t v10 = v6;
    while (1)
    {
      double v11 = *(v8 - 1);
      double v12 = *(v7 - 1);
      if (v11 > v12) {
        break;
      }
      if (v11 != v12)
      {
        double v14 = *v7;
        goto LABEL_21;
      }
      if (*v8 > *v7) {
        return result;
      }
      if (*v8 != *v7) {
        return -1;
      }
      v7 += 2;
      v8 += 2;
      if (!--v10) {
        goto LABEL_13;
      }
    }
    double v13 = *v8;
    goto LABEL_18;
  }
LABEL_13:
  if (v2 > v3)
  {
    double v13 = *(double *)(v4 + 16 * v6 + 8);
LABEL_18:
    if (v13 > 0.0) {
      return 1;
    }
    else {
      return -1;
    }
  }
  if (v3 <= v2) {
    return 0;
  }
  double v14 = *(double *)(v5 + 16 * v6 + 8);
LABEL_21:
  if (v14 <= 0.0) {
    return 1;
  }
  else {
    return -1;
  }
}

uint64_t NSBitSetFindNextRange(uint64_t **a1, unint64_t a2)
{
  unsigned int v2 = a1;
  uint64_t result = NSBitSetFindNext(a1, a2);
  if (result == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  char v4 = result + 1;
  unint64_t v5 = (unint64_t)(result + 1) >> 6;
  unsigned int v6 = *((_DWORD *)v2 + 2);
  if (v6 >= 2) {
    unsigned int v2 = (uint64_t **)*v2;
  }
  if (v6 > v5)
  {
    uint64_t v7 = (uint64_t)(int)v5 << 6;
    uint64_t v8 = &v2[(int)v5];
    do
    {
      uint64_t v9 = (uint64_t)*v8++;
      int v10 = __clz(__rbit64((-1 << v4) & ~v9));
      if (((-1 << v4) & ~v9) == 0) {
        int v10 = -1;
      }
      if ((v10 & 0x80000000) == 0) {
        break;
      }
      char v4 = (v4 & 0xC0) + 64;
      v7 += 64;
      LODWORD(v5) = v5 + 1;
    }
    while (v6 > v5);
  }
  return result;
}

void sub_1A6488300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

BOOL _NSConstraintBasedLayoutTrackDirtyObservables()
{
  return _NSGetBoolAppConfig(@"NSConstraintBasedLayoutTrackDirtyObservables", 1, (unsigned __int8 *)&sNSConstraintBasedLayoutTrackDirtyObservablesComputedValue, _NSTrueAppConfigPredicate);
}

uint64_t ___objectiveRow_rawAddCol_block_invoke_2(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(v3 + 192) + 8 * (a2 >> 6));
  uint64_t v5 = v4 + 32 * (a2 & 0x3F);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t v9 = 32 * (a2 & 0x3F);
    int v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *(void *)(v4 + v9) file lineNumber description];
  }
  uint64_t v6 = *(void *)(v5 + 8);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v7(v2, v3, v6);
}

uint64_t *___objectiveRow_addColWithPriorityTimes_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 40) + 8);
  if (HIWORD(v3)) {
    unint64_t v4 = v3 - 0x40000000;
  }
  else {
    unint64_t v4 = v3;
  }
  if (HIWORD(v3)) {
    uint64_t v5 = (uint64_t *)(a3 + 24);
  }
  else {
    uint64_t v5 = (uint64_t *)(a3 + 8);
  }
  return NSBitSetRemoveIndex(v5, v4);
}

uint64_t _NSFalseAppConfigPredicate()
{
  return 0;
}

uint64_t _NSTrueAppConfigPredicate()
{
  return 1;
}

void NSISLinExpScaleByWithDroppedColProcessor(double *a1, uint64_t a2, double a3)
{
  if (a3 == 0.0) {
    NSISLinExpScaleByWithDroppedColProcessor_cold_1();
  }
  if (a3 == 1.0) {
    return;
  }
  double v6 = a1[1] * a3;
  if (v6 == 0.0) {
    BOOL v7 = *(double *)&NSISEpsilon > 0.0;
  }
  else {
    BOOL v7 = fabs(v6) < *(double *)&NSISEpsilon;
  }
  BOOL v8 = !v7;
  int v10 = (unsigned __int16 *)(a1 + 2);
  uint64_t v9 = *((void *)a1 + 2);
  if (!v8) {
    double v6 = 0.0;
  }
  a1[1] = v6;
  if (v9 == *MEMORY[0x1E4F1CFD0])
  {
    int v10 = (unsigned __int16 *)*((void *)a1 + 3);
    uint64_t v11 = *((void *)a1 + 4);
  }
  else
  {
    uint64_t v11 = *(unsigned __int16 *)a1;
  }
  unint64_t v12 = *((unsigned int *)a1 + 1);
  if (!v12) {
    return;
  }
  char v13 = 0;
  unint64_t v14 = 0;
  BOOL v15 = &v10[4 * v11];
  do
  {
    while (1)
    {
      double v16 = *(double *)&v10[4 * v14] * a3;
      if (v16 != 0.0) {
        break;
      }
      if (*(double *)&NSISEpsilon <= 0.0) {
        goto LABEL_16;
      }
LABEL_19:
      (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(unsigned int *)&v15[2 * v14]);
      vars_remove_idx((unsigned __int16 *)a1, v14);
      unint64_t v12 = *((unsigned int *)a1 + 1);
      char v13 = 1;
      if (v14 >= v12) {
        goto LABEL_22;
      }
    }
    if (fabs(v16) < *(double *)&NSISEpsilon) {
      goto LABEL_19;
    }
LABEL_16:
    *(double *)&v10[4 * v14++] = v16;
  }
  while (v14 < v12);
  if ((v13 & 1) == 0) {
    return;
  }
LABEL_22:
  expression_shrink_if_possible((char *)a1);
}

void NSISLinExpScaleBy(double *a1, double a2)
{
}

double _substituteOutAllOccurencesOfBodyVar(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v10 = (uint64_t **)(a3 + 8);
  uint64_t v11 = NSBitSetCount(a3 + 8);
  if (NSBitSetCount(a3 + 24) + v11)
  {
    double v13 = NSISLinExpConstant(a5 + 16);
    unint64_t v19 = (uint64_t **)(a3 + 24);
    if (v13 == 0.0) {
      BOOL v14 = *(double *)&NSISEpsilon > 0.0;
    }
    else {
      BOOL v14 = fabs(v13) < *(double *)&NSISEpsilon;
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    unsigned int v21 = ___substituteOutAllOccurencesOfBodyVar_block_invoke;
    uint64_t v22 = &unk_1E5C57188;
    uint64_t v25 = a3;
    uint64_t v26 = a4;
    uint64_t v27 = a5;
    BOOL v28 = !v14;
    uint64_t v23 = a1;
    uint64_t v24 = a2;
    uint64_t Next = NSBitSetFindNext(v10, 0);
    if (Next != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (unint64_t i = Next; i != 0x7FFFFFFFFFFFFFFFLL; unint64_t i = NSBitSetFindNext(v10, i + 1))
        v21((uint64_t)v20, a2, (id **)(*(void *)(*(void *)(a2 + 232 + 40 * ((i >> 30) & 1)) + 8 * ((i & 0xBFFFFFFF) / 0x17))+ 88 * ((i & 0xBFFFFFFF) % 0x17)));
    }
    uint64_t v17 = NSBitSetFindNext(v19, 0);
    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (uint64_t j = v17; j != 0x7FFFFFFFFFFFFFFFLL; uint64_t j = NSBitSetFindNext(v19, j + 1))
        v21((uint64_t)v20, a2, (id **)(*(void *)(*(void *)(a2 + 232 + 40 * (((j + 0x40000000) >> 30) & 1))+ 8 * (((j + 0x40000000) & 0xBFFFFFFF) / 0x17uLL))+ 88 * (((j + 0x40000000) & 0xBFFFFFFF) % 0x17)));
    }
    NSBitSetReset((uint64_t)v10);
    return NSBitSetReset((uint64_t)v19);
  }
  return result;
}

void ___substituteOutAllOccurencesOfBodyVar_block_invoke(uint64_t a1, uint64_t a2, id **a3)
{
  int v6 = *((_DWORD *)a3 + 20);
  LOBYTE(v7) = v6;
  if ((v6 & 1) == 0)
  {
    NSISLinExpConstant((uint64_t)(a3 + 2));
    int v7 = *((_DWORD *)a3 + 20);
  }
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  uint64_t v25 = ___substituteOutAllOccurencesOfBodyVar_block_invoke_2;
  uint64_t v26 = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  uint64_t v27 = a2;
  BOOL v28 = a3;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  unint64_t v19 = ___substituteOutAllOccurencesOfBodyVar_block_invoke_3;
  int v20 = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  uint64_t v21 = a2;
  uint64_t v22 = a3;
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = (unsigned __int16 *)(*(void *)(a1 + 64) + 16);
  if (v7)
  {
    uint64_t v11 = (uint64_t)a3[2];
    uint64_t v12 = *(unsigned int *)(*(void *)v8 + 16);
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    v37 = ___row_rawReplaceColWithRowBody_block_invoke;
    v38 = &unk_1E5C570C0;
    uint64_t v39 = a2;
    v40 = &v23;
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = ___row_rawReplaceColWithRowBody_block_invoke_2;
    v32 = &unk_1E5C570C0;
    uint64_t v33 = a2;
    v34 = &v17;
    -[NSISObjectiveLinearExpression replaceVar:withExpression:processVarNewToReceiver:processVarDroppedFromReceiver:](v11, v12, v9, (uint64_t)&v35, (uint64_t)&v29);
  }
  else
  {
    unsigned int v10 = *(_DWORD *)(*(void *)v8 + 16);
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    v37 = ___row_rawReplaceColWithRowBody_block_invoke_3;
    v38 = &unk_1E5C570C0;
    uint64_t v39 = a2;
    v40 = &v23;
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = ___row_rawReplaceColWithRowBody_block_invoke_4;
    v32 = &unk_1E5C570C0;
    uint64_t v33 = a2;
    v34 = &v17;
    NSISLinExpReplaceVarWithExpression((unsigned __int16 *)a3 + 8, v10, (uint64_t)v9, (uint64_t)&v35, (uint64_t)&v29);
  }
  if (*(unsigned char *)(a1 + 72) && ((_BYTE)(*a3)[3] & 6) != 0)
  {
    double v13 = NSISLinExpConstant((uint64_t)(a3 + 2));
    int v14 = (*((_DWORD *)*a3 + 6) >> 1) & 3;
    if (v14 == 2)
    {
      if (v13 == 0.0)
      {
        if (*(double *)&NSISEpsilon > 0.0) {
          goto LABEL_12;
        }
      }
      else if (fabs(v13) < *(double *)&NSISEpsilon)
      {
        goto LABEL_12;
      }
LABEL_11:
      BOOL v15 = *(void **)(*(void *)(a1 + 32) + 8);
      id v16 = **a3;
      objc_msgSend(v15, "addObject:", v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28);
      goto LABEL_12;
    }
    if (v14 == 1 && v13 < 0.0) {
      goto LABEL_11;
    }
  }
LABEL_12:
  if ((v6 & 1) == 0)
  {
    if (*(unsigned char *)(a1 + 72)) {
      _noteValueOfVariableChanged(*(void *)(a1 + 32), a2, *a3);
    }
  }
}

double NSISLinExpConstant(uint64_t a1)
{
  return *(double *)(a1 + 8);
}

uint64_t _noteValueOfVariableChanged(uint64_t result, uint64_t a2, void *a3)
{
  if (*(int *)(result + 144) <= 0)
  {
    uint64_t v3 = result;
    unint64_t v4 = (void *)*a3;
    uint64_t v5 = *(void **)(result + 40);
    if (v5)
    {
      uint64_t v6 = [v5 objectForKey:*a3];
      if (v6)
      {
        int v7 = (void *)v6;
        if (!*(void *)(v6 + 40)
          && !*(void *)(v6 + 48)
          && *(void *)(v3 + 48) != v6
          && _NSConstraintBasedLayoutTrackDirtyObservables())
        {
          -[NSISEngine _dirtyListPrependObservable:](v3, (uint64_t)v7);
        }
        [v7 receiveObservedValue:*MEMORY[0x1E4F1CFD0]];
      }
    }
    if (NSISObjectTableCount(*(void *)(v3 + 168)) >= 1)
    {
      uint64_t v8 = NSISObjectTableFind(*(void *)(v3 + 168), (unint64_t)v4);
      if (v8)
      {
        uint64_t v9 = v8;
        if (!v8[1] && !v8[2] && *(void **)(v3 + 176) != v8) {
          -[NSISEngine _dirtyListPrependObservation:]((void *)v3, v8);
        }
        [v9 valueWasDirtied];
      }
    }
    double result = _NSConstraintBasedLayoutVariableChangeTransactions();
    if (result)
    {
      if (!*(unsigned char *)(v3 + 163))
      {
        *(unsigned char *)(v3 + 163) = 1;
        if (!*(_DWORD *)(v3 + 140)) {
          double result = [*(id *)(v3 + 56) solutionDidChangeInEngine:v3];
        }
      }
      ++*(void *)(v3 + 96);
    }
    else
    {
      char v10 = *(unsigned char *)(v3 + 159);
      *(unsigned char *)(v3 + 159) = 1;
      ++*(void *)(v3 + 96);
      objc_msgSend((id)objc_msgSend(v4, "delegate"), "nsis_valueOfVariable:didChangeInEngine:", v4, v3);
      uint64_t v11 = *(void **)(v3 + 40);
      if (v11) {
        objc_msgSend((id)objc_msgSend(v11, "objectForKey:", v4), "emitValueIfNeeded");
      }
      double result = NSISObjectTableCount(*(void *)(v3 + 168));
      if (result >= 1) {
        double result = objc_msgSend((id)NSISObjectTableFind(*(void *)(v3 + 168), (unint64_t)v4), "emitValueIfNeededWithEngine:", v3);
      }
      *(unsigned char *)(v3 + 159) = v10;
    }
  }
  return result;
}

BOOL _NSConstraintBasedLayoutVariableChangeTransactions()
{
  return _NSGetBoolAppConfig(@"NSConstraintBasedLayoutVariableChangeTransactions", 1, sNSConstraintBasedLayoutVariableChangeTransactionsComputedValue, _NSTrueAppConfigPredicate);
}

uint64_t NSISObjectTableCount(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t NSISObjectTableFind(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (*(_DWORD *)(result + 8))
    {
      unint64_t v2 = *(unsigned int *)(result + 16);
      if (v2)
      {
        unint64_t v3 = 73244475 * ((73244475 * (a2 ^ (a2 >> 16))) ^ ((73244475 * (a2 ^ (a2 >> 16))) >> 16));
        unsigned int v4 = (v3 ^ (v3 >> 16)) % v2;
        for (int i = *(_DWORD *)(result + 16); i; --i)
        {
          uint64_t v6 = (uint64_t *)(*(void *)result + 16 * v4);
          uint64_t v7 = v6[1];
          if (!v7) {
            break;
          }
          uint64_t v8 = *v6;
          if (v7 != -1 && v8 == a2)
          {
            if (v4 == -1) {
              return 0;
            }
            else {
              return v7;
            }
          }
          if (v4 + 1 < v2) {
            ++v4;
          }
          else {
            unsigned int v4 = 0;
          }
        }
      }
    }
    return 0;
  }
  return result;
}

void NSISLinExpReplaceVarWithExpression(unsigned __int16 *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  double v10 = NSISLinExpCoefficientForVar((uint64_t)a1, a2);
  NSISLinExpRemoveVar(a1, a2);
  NSISLinExpIncrementConstant((uint64_t)a1, v10 * *(double *)(a3 + 8));
  expression_merge(a1, (unsigned __int16 *)a3, a4, a5, v10);
}

uint64_t NSISLinExpIncrementConstant(uint64_t result, double a2)
{
  uint64_t v3 = result;
  double v4 = fabs(a2);
  if (v4 >= INFINITY && v4 <= INFINITY)
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    double result = [v5 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISFloat_t NSISLinExpIncrementConstant(NSISLinExp *, NSISFloat_t)"), @"NSISLinearExpression.m", 814, @"Invalid parameter not satisfying: %@", @"isfinite(c)" file lineNumber description];
  }
  double v6 = *(double *)(v3 + 8);
  if (COERCE_UNSIGNED_INT64(-v6) >> 63 == *(void *)&a2 >> 63)
  {
    double v7 = 0.0;
    if (vabdd_f64(-v6, a2) <= *(double *)&NSISEpsilon) {
      goto LABEL_10;
    }
    uint64_t v8 = COERCE__INT64(-v6) - *(void *)&a2;
    if (v8 < 0) {
      uint64_t v8 = *(void *)&a2 - COERCE__INT64(-v6);
    }
    if (v8 <= NSISMaxUlps) {
      goto LABEL_10;
    }
  }
  double v7 = v6 + a2;
  if (v6 + a2 == 0.0)
  {
LABEL_10:
    double v9 = 0.0;
    if (*(double *)&NSISEpsilon > 0.0) {
      goto LABEL_22;
    }
  }
  else
  {
    double v9 = 0.0;
    if (fabs(v7) < *(double *)&NSISEpsilon) {
      goto LABEL_22;
    }
  }
  double v9 = rint(v7);
  if (vabdd_f64(v7, v9) >= *(double *)&NSISEpsilon)
  {
    double v10 = rint(v7 * 8.0);
    double v11 = fabs(v7 * 8.0);
    BOOL v13 = vabdd_f64(v10, v7 * 8.0) >= *(double *)&NSISEpsilon * 8.0 || v11 == INFINITY;
    double v9 = v10 * 0.125;
    if (v13) {
      double v9 = v7;
    }
  }
LABEL_22:
  *(double *)(v3 + 8) = v9;
  return result;
}

void NSISLinExpRemoveVar(unsigned __int16 *a1, unsigned int a2)
{
  unint64_t v3 = vars_index(a1, a2);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    vars_remove_idx(a1, v3);
    expression_shrink_if_possible((char *)a1);
  }
}

double NSISLinExpCoefficientForVar(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = vars_index((unsigned __int16 *)a1, a2);
  double result = 0.0;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = a1 + 16;
    if (*(void *)(a1 + 16) == *MEMORY[0x1E4F1CFD0]) {
      uint64_t v5 = *(void *)(a1 + 24);
    }
    double v6 = *(double *)(v5 + 8 * v3);
    if (v6 == 0.0)
    {
      double v7 = *(double *)&NSISEpsilon;
      if (*(double *)&NSISEpsilon > 0.0) {
        return result;
      }
    }
    else
    {
      double v7 = *(double *)&NSISEpsilon;
      if (fabs(v6) < *(double *)&NSISEpsilon) {
        return result;
      }
    }
    double result = rint(v6);
    if (vabdd_f64(v6, result) >= v7)
    {
      double v8 = rint(v6 * 8.0);
      double v9 = fabs(v6 * 8.0);
      BOOL v11 = vabdd_f64(v8, v6 * 8.0) >= v7 * 8.0 || v9 == INFINITY;
      double result = v8 * 0.125;
      if (v11) {
        return *(double *)(v5 + 8 * v3);
      }
    }
  }
  return result;
}

uint64_t vars_index(unsigned __int16 *a1, unsigned int a2)
{
  unint64_t v2 = a1 + 8;
  if (*((void *)a1 + 2) == *MEMORY[0x1E4F1CFD0])
  {
    unint64_t v2 = (unsigned __int16 *)*((void *)a1 + 3);
    uint64_t v3 = *((void *)a1 + 4);
  }
  else
  {
    uint64_t v3 = *a1;
  }
  unint64_t v4 = *((unsigned int *)a1 + 1);
  if (!v4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v5 = 0;
  double v6 = &v2[4 * v3];
  while (1)
  {
    uint64_t result = v5 + ((v4 - v5) >> 1);
    unsigned int v8 = *(_DWORD *)&v6[2 * result];
    if (v8 == a2) {
      break;
    }
    if (v8 >= a2) {
      unint64_t v4 = v5 + ((v4 - v5) >> 1);
    }
    else {
      unint64_t v5 = result + 1;
    }
    if (v5 >= v4) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

unsigned __int16 *NSISLinExpEnumerateVarsAndCoefficients(unsigned __int16 *result, uint64_t a2)
{
  uint64_t v3 = (double *)(result + 8);
  if (*((void *)result + 2) == *MEMORY[0x1E4F1CFD0])
  {
    uint64_t v3 = (double *)*((void *)result + 3);
    uint64_t v4 = *((void *)result + 4);
  }
  else
  {
    uint64_t v4 = *result;
  }
  uint64_t v5 = *((unsigned int *)result + 1);
  if (v5)
  {
    double v6 = &v3[v4];
    do
    {
      double v7 = *v3++;
      double v8 = v7;
      LODWORD(v7) = *(_DWORD *)v6;
      double v6 = (double *)((char *)v6 + 4);
      uint64_t result = (unsigned __int16 *)(*(uint64_t (**)(uint64_t, void, double))(a2 + 16))(a2, LODWORD(v7), v8);
      --v5;
    }
    while (v5);
  }
  return result;
}

void NSISLinExpAddVar(unsigned __int16 *a1, unsigned int a2, double a3)
{
  double v6 = fabs(a3);
  if (v6 >= INFINITY && v6 <= INFINITY)
  {
    double v7 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "void NSISLinExpAddVar(NSISLinExp *, NSISLinExpVar, NSISFloat_t)"), @"NSISLinearExpression.m", 785, @"Invalid parameter not satisfying: %@", @"isfinite(coeff)" file lineNumber description];
  }
  if (a3 == 0.0)
  {
    if (*(double *)&NSISEpsilon > 0.0) {
      goto LABEL_20;
    }
  }
  else if (v6 < *(double *)&NSISEpsilon)
  {
    goto LABEL_20;
  }
  char v14 = 0;
  BOOL v13 = 0;
  unint64_t v8 = vars_index_with_insert(a1, a2, &v14, &v13);
  double v9 = *v13;
  if (COERCE_UNSIGNED_INT64(-a3) >> 63 == *(void *)v13 >> 63)
  {
    double v10 = 0.0;
    if (vabdd_f64(-a3, v9) <= *(double *)&NSISEpsilon) {
      goto LABEL_14;
    }
    uint64_t v11 = COERCE__INT64(-a3) - *(void *)v13;
    if (v11 < 0) {
      uint64_t v11 = *(void *)v13 - COERCE__INT64(-a3);
    }
    if (v11 <= NSISMaxUlps) {
      goto LABEL_14;
    }
  }
  double v10 = v9 + a3;
  if (v9 + a3 == 0.0) {
LABEL_14:
  }
    BOOL v12 = *(double *)&NSISEpsilon > 0.0;
  else {
    BOOL v12 = fabs(v10) < *(double *)&NSISEpsilon;
  }
  if (v12) {
    double v10 = 0.0;
  }
  *BOOL v13 = v10;
  if (v10 == 0.0) {
    vars_remove_idx(a1, v8);
  }
LABEL_20:
  expression_shrink_if_possible((char *)a1);
}

void expression_shrink_if_possible(char *a1)
{
  uint64_t v1 = a1 + 16;
  uint64_t v2 = *((void *)a1 + 2);
  if (v2 == *MEMORY[0x1E4F1CFD0] && *((_DWORD *)a1 + 1) <= *(unsigned __int16 *)a1)
  {
    uint64_t v4 = 0;
    char v5 = 1;
    do
    {
      double v6 = (char *)pthread_getspecific(kPooledLinearExpressionKeys[v4]);
      if (v6) {
        BOOL v7 = v6 + 16 == a1;
      }
      else {
        BOOL v7 = 0;
      }
      int v8 = !v7;
      if ((v5 & 1) == 0) {
        break;
      }
      char v5 = 0;
      uint64_t v4 = 1;
    }
    while ((v8 & 1) != 0);
    if (v8)
    {
      if (*(void *)v1 != v2) {
        NSLog(&cfstr_Nsislinearexpr_1.isa, "vars_convert_to_inline", 224);
      }
      unint64_t v9 = *((unsigned int *)a1 + 1);
      unint64_t v10 = *(unsigned __int16 *)a1;
      if (v9 > v10) {
        NSLog(&cfstr_Nsislinearexpr_1.isa, "vars_convert_to_inline", 229);
      }
      if (*(void *)v1 == v2)
      {
        BOOL v12 = (char *)*((void *)a1 + 3);
        uint64_t v11 = *((void *)a1 + 4);
        BOOL v13 = v12;
      }
      else
      {
        uint64_t v11 = *(unsigned __int16 *)a1;
        BOOL v12 = (char *)*((void *)a1 + 3);
        BOOL v13 = v1;
      }
      char v14 = &v13[8 * v11];
      bzero(v1, 12 * v10);
      if (*(void *)v1 == v2)
      {
        id v16 = (char *)*((void *)a1 + 3);
        uint64_t v15 = *((void *)a1 + 4);
      }
      else
      {
        uint64_t v15 = *(unsigned __int16 *)a1;
        id v16 = v1;
      }
      memmove(&v16[8 * v15], v14, 4 * v9);
      memmove(v16, v13, 8 * v9);
      if (*(void *)v1 == v2) {
        NSLog(&cfstr_Nsislinearexpr_1.isa, "vars_convert_to_inline", 241);
      }
      free(v12);
    }
  }
}

void *vars_remove_idx(unsigned __int16 *a1, unint64_t a2)
{
  unint64_t v4 = *((unsigned int *)a1 + 1);
  if (v4 <= a2) {
    NSLog(&cfstr_Nsislinearexpr_1.isa, "vars_remove_idx", 489);
  }
  char v5 = a1 + 8;
  if (*((void *)a1 + 2) == *MEMORY[0x1E4F1CFD0])
  {
    char v5 = (unsigned __int16 *)*((void *)a1 + 3);
    uint64_t v6 = *((void *)a1 + 4);
  }
  else
  {
    uint64_t v6 = *a1;
  }
  BOOL v7 = &v5[4 * v6];
  unint64_t v8 = v4 + ~a2;
  memmove(&v7[2 * a2], &v7[2 * a2 + 2], 4 * v8);
  unint64_t v9 = v4 - 1;
  *(_DWORD *)&v7[2 * v9] = 0;
  uint64_t result = memmove(&v5[4 * a2], &v5[4 * a2 + 4], 8 * v8);
  *(void *)&v5[4 * v9] = 0;
  *((_DWORD *)a1 + 1) = v9;
  return result;
}

unint64_t vars_index_with_insert(unsigned __int16 *a1, unsigned int a2, char *a3, void *a4)
{
  unint64_t v8 = a1 + 8;
  uint64_t v9 = *MEMORY[0x1E4F1CFD0];
  if (*((void *)a1 + 2) == *MEMORY[0x1E4F1CFD0])
  {
    uint64_t v11 = (unsigned __int16 *)*((void *)a1 + 3);
    uint64_t v10 = *((void *)a1 + 4);
  }
  else
  {
    uint64_t v10 = *a1;
    uint64_t v11 = a1 + 8;
  }
  unint64_t v12 = *((unsigned int *)a1 + 1);
  if (v12)
  {
    unint64_t v13 = 0;
    char v14 = &v11[4 * v10];
    unint64_t v15 = *((unsigned int *)a1 + 1);
    while (1)
    {
      unint64_t v16 = v13 + ((v15 - v13) >> 1);
      unsigned int v17 = *(_DWORD *)&v14[2 * v16];
      if (v17 == a2) {
        break;
      }
      if (v17 >= a2) {
        unint64_t v15 = v13 + ((v15 - v13) >> 1);
      }
      else {
        unint64_t v13 = v16 + 1;
      }
      if (v13 >= v15) {
        goto LABEL_14;
      }
    }
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_14:
      if (v13 > v12) {
        NSLog(&cfstr_Nsislinearexpr_1.isa, "vars_index_with_insert", 295);
      }
      goto LABEL_16;
    }
    char v25 = 0;
    v13 += (v15 - v13) >> 1;
    if (a3) {
      goto LABEL_22;
    }
  }
  else
  {
    unint64_t v13 = 0;
LABEL_16:
    int v18 = v12 + 1;
    expression_ensure_capacity(a1, v12 + 1);
    if (*((void *)a1 + 2) == v9)
    {
      int v20 = (void *)*((void *)a1 + 3);
      uint64_t v19 = *((void *)a1 + 4);
    }
    else
    {
      uint64_t v19 = *a1;
      int v20 = v8;
    }
    uint64_t v21 = (unsigned int *)&v20[v19] + v13;
    unint64_t v22 = v12 - v13;
    memmove(v21 + 1, v21, 4 * v22);
    *uint64_t v21 = a2;
    uint64_t v23 = v8;
    if (*v8 == v9) {
      uint64_t v23 = (void *)*((void *)a1 + 3);
    }
    uint64_t v24 = &v23[v13];
    memmove(v24 + 1, v24, 8 * v22);
    void *v24 = 0;
    *((_DWORD *)a1 + 1) = v18;
    char v25 = 1;
    if (a3) {
LABEL_22:
    }
      *a3 = v25;
  }
  if (a4)
  {
    if (*v8 == v9) {
      unint64_t v8 = (void *)*((void *)a1 + 3);
    }
    *a4 = &v8[v13];
  }
  return v13;
}

void expression_ensure_capacity(unsigned __int16 *a1, unint64_t a2)
{
  if (*a1 < a2)
  {
    uint64_t v3 = (char *)(a1 + 8);
    uint64_t v4 = *((void *)a1 + 2);
    uint64_t v5 = *MEMORY[0x1E4F1CFD0];
    if (v4 == *MEMORY[0x1E4F1CFD0])
    {
      unint64_t v10 = *((void *)a1 + 4);
      if (v10 < a2)
      {
        uint64_t v11 = (char *)*((void *)a1 + 3);
        char v12 = flsl(a2);
        if (1 << v12 < v10) {
          NSLog(&cfstr_Nsislinearexpr_1.isa, "slab_duplicate", 52);
        }
        unint64_t v13 = (char *)malloc_type_calloc(1uLL, 12 << v12, 0x1FF00ED2uLL);
        memmove(&v13[8 << v12], &v11[8 * v10], 4 * v10);
        memmove(v13, v11, 8 * v10);
        *((void *)a1 + 3) = v13;
        *((void *)a1 + 4) = 1 << v12;
        free(v11);
        if (*((void *)a1 + 2) != v4) {
          NSLog(&cfstr_Nsislinearexpr_1.isa, "expression_ensure_capacity", 196);
        }
      }
    }
    else
    {
      char v6 = flsl(a2);
      int v7 = *((_DWORD *)a1 + 1);
      unint64_t v8 = *a1;
      if (1 << v6 < v8) {
        NSLog(&cfstr_Nsislinearexpr_1.isa, "slab_duplicate", 52);
      }
      uint64_t v9 = (char *)malloc_type_calloc(1uLL, 12 << v6, 0x1FF00ED2uLL);
      memmove(&v9[8 << v6], &v3[8 * v8], 4 * v8);
      memmove(v9, v3, 8 * v8);
      *((void *)a1 + 2) = v5;
      *((void *)a1 + 3) = v9;
      *((_DWORD *)a1 + 1) = v7;
      *((void *)a1 + 4) = 1 << v6;
    }
  }
}

void *_findWithHashFunction(uint64_t a1, unsigned int a2)
{
  if (!*(_DWORD *)(a1 + 24)) {
    return 0;
  }
  unsigned int v4 = *(_DWORD *)(a1 + 32);
  unsigned int v5 = 73244475 * ((73244475 * (a2 ^ HIWORD(a2))) ^ ((73244475 * (a2 ^ HIWORD(a2))) >> 16));
  unsigned int v6 = (v5 ^ HIWORD(v5)) % v4;
  unint64_t v7 = 0x1E4F28000uLL;
  unsigned int v8 = v4;
  while (1)
  {
    uint64_t v9 = *(void *)(a1 + 16);
    uint64_t result = (void *)(v9 + 24 * v6);
    if (*result != -1)
    {
      if (!*result) {
        return 0;
      }
      if (*(_DWORD *)(v9 + 24 * v6 + 12) == a2) {
        break;
      }
    }
    if (v6 + 1 < v4) {
      ++v6;
    }
    else {
      unsigned int v6 = 0;
    }
    if (!--v8)
    {
      uint64_t v11 = (void *)[*(id *)(v7 + 2816) currentHandler];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "NSISSparseVector *_findWithHashFunction(NSISSparseVectorMap *, uint32_t, HASH_FUNCTION)"), @"NSISSparseVectorMap.m", 272, @"Corrupt hash table");
      unint64_t v7 = 0x1E4F28000;
    }
  }
  return result;
}

uint64_t NSISSparseVectorMinHeapDelete(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(a2 + 16);
  *(_DWORD *)(a2 + 16) = -1;
  if (v2 != -1)
  {
    uint64_t v3 = result;
    int v4 = *(_DWORD *)(result + 8);
    unsigned int v5 = v4 - 1;
    if (v4 == 1)
    {
      *(_DWORD *)(result + 8) = 0;
      return result;
    }
    unsigned int v6 = *(uint64_t **)result;
    uint64_t v7 = *(void *)(*(void *)result + 8 * (int)v5);
    *(_DWORD *)(result + 8) = v5;
    if (v7 != a2)
    {
      if (v5 == 1)
      {
        *unsigned int v6 = v7;
        *(_DWORD *)(v7 + 16) = 0;
        return result;
      }
      while (1)
      {
        uint64_t v8 = (2 * v2) | 1u;
        uint64_t v9 = (2 * v2 + 2);
        BOOL v10 = v8 >= v5 || v9 >= v5;
        if (v10) {
          break;
        }
        uint64_t v18 = v6[v8];
        uint64_t v19 = v6[v9];
        uint64_t v20 = NSISSparseVectorCompare((uint64_t *)v18, (uint64_t *)v19);
        if (!v20)
        {
          unsigned int v21 = *(_DWORD *)(v18 + 12);
          unsigned int v22 = *(_DWORD *)(v19 + 12);
          BOOL v10 = v21 >= v22;
          BOOL v23 = v21 > v22;
          uint64_t v24 = !v10;
          uint64_t v20 = v23 - v24;
        }
        unsigned int v25 = *(_DWORD *)(v3 + 8);
        if (v20 == -1 && v25 > v8)
        {
          uint64_t v27 = *(void *)(*(void *)v3 + 8 * v8);
          uint64_t v28 = NSISSparseVectorCompare((uint64_t *)v27, (uint64_t *)v7);
          if (!v28)
          {
            unsigned int v29 = *(_DWORD *)(v27 + 12);
            unsigned int v30 = *(_DWORD *)(v7 + 12);
            BOOL v10 = v29 >= v30;
            BOOL v31 = v29 > v30;
            uint64_t v32 = !v10;
            uint64_t v28 = v31 - v32;
          }
          if (v28 == -1) {
            goto LABEL_19;
          }
          unsigned int v25 = *(_DWORD *)(v3 + 8);
        }
        if (v25 <= v9) {
          goto LABEL_46;
        }
        uint64_t v33 = *(void *)(*(void *)v3 + 8 * v9);
        uint64_t v34 = NSISSparseVectorCompare((uint64_t *)v33, (uint64_t *)v7);
        if (!v34)
        {
          unsigned int v35 = *(_DWORD *)(v33 + 12);
          unsigned int v36 = *(_DWORD *)(v7 + 12);
          BOOL v10 = v35 >= v36;
          BOOL v37 = v35 > v36;
          uint64_t v38 = !v10;
          uint64_t v34 = v37 - v38;
        }
        if (v34 != -1) {
          goto LABEL_46;
        }
        uint64_t v17 = v2;
        *(void *)(*(void *)v3 + 8 * v2) = *(void *)(*(void *)v3 + 8 * v9);
        uint64_t v8 = (2 * v2 + 2);
LABEL_45:
        unsigned int v6 = *(uint64_t **)v3;
        *(_DWORD *)(*(void *)(*(void *)v3 + 8 * v17) + 16) = v2;
        unsigned int v5 = *(_DWORD *)(v3 + 8);
        uint64_t v2 = v8;
      }
      if (v8 >= v5) {
        goto LABEL_46;
      }
      uint64_t v11 = v6[v8];
      uint64_t v12 = NSISSparseVectorCompare((uint64_t *)v11, (uint64_t *)v7);
      if (!v12)
      {
        unsigned int v13 = *(_DWORD *)(v11 + 12);
        unsigned int v14 = *(_DWORD *)(v7 + 12);
        BOOL v10 = v13 >= v14;
        BOOL v15 = v13 > v14;
        uint64_t v16 = !v10;
        uint64_t v12 = v15 - v16;
      }
      if (v12 != -1)
      {
LABEL_46:
        uint64_t result = _siftUp((uint64_t *)v3, v7, v2);
        *(void *)(*(void *)v3 + 8 * result) = v7;
        *(_DWORD *)(v7 + 16) = result;
        return result;
      }
LABEL_19:
      uint64_t v17 = v2;
      *(void *)(*(void *)v3 + 8 * v2) = *(void *)(*(void *)v3 + 8 * v8);
      goto LABEL_45;
    }
  }
  return result;
}

uint64_t NSISSparseVectorAddVectorTimesScalar(uint64_t result, unsigned __int16 *a2, double a3)
{
  uint64_t v3 = a2[4];
  if (a2[4])
  {
    uint64_t v5 = result;
    uint64_t v6 = 0;
    uint64_t v7 = (double *)(*(void *)a2 + 8);
    do
    {
      uint64_t result = NSISSparseVectorAddTermWithPlaceValueCoefficientStartingIndex(v5, v6, *(v7 - 1), *v7, a3);
      uint64_t v6 = result;
      v7 += 2;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t NSISSparseVectorAddTermWithPlaceValueCoefficientStartingIndex(uint64_t a1, uint64_t a2, double a3, double a4, double a5)
{
  if (a3 <= 0.0)
  {
    v41 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "CFIndex NSISSparseVectorAddTermWithPlaceValueCoefficientStartingIndex(NSISSparseVector *, NSISPlaceValue_t, NSISFloat_t, NSISFloat_t, CFIndex)"), @"NSISSparseVector.m", 58, @"Invalid parameter not satisfying: %@", @"placeValue > 0" file lineNumber description];
  }
  if (a4 == 0.0)
  {
    double v10 = *(double *)&NSISEpsilon;
    if (*(double *)&NSISEpsilon > 0.0) {
      return a2;
    }
  }
  else
  {
    double v10 = *(double *)&NSISEpsilon;
    if (fabs(a4) < *(double *)&NSISEpsilon) {
      return a2;
    }
  }
  uint64_t v11 = *(unsigned __int16 *)(a1 + 8);
  uint64_t v12 = *(double **)a1;
  if (v11 <= a2)
  {
    BOOL v16 = 0;
LABEL_14:
    double v13 = 0.0;
    goto LABEL_16;
  }
  double v13 = v12[2 * a2];
  if (v13 > a3)
  {
    uint64_t v14 = a2 + 1;
    BOOL v15 = &v12[2 * a2 + 2];
    while (1)
    {
      a2 = v14;
      BOOL v16 = v14 < v11;
      if (v14 >= v11) {
        goto LABEL_14;
      }
      double v17 = *v15;
      v15 += 2;
      double v13 = v17;
      ++v14;
      if (v17 <= a3) {
        goto LABEL_16;
      }
    }
  }
  BOOL v16 = 1;
LABEL_16:
  if (v13 != a3)
  {
    double v26 = a4 * a5;
    if (a4 * a5 == 0.0)
    {
      double v27 = 0.0;
      if (v10 > 0.0) {
        goto LABEL_54;
      }
    }
    else
    {
      double v27 = 0.0;
      if (fabs(v26) < v10) {
        goto LABEL_54;
      }
    }
    double v27 = rint(v26);
    if (vabdd_f64(v26, v27) >= v10)
    {
      double v33 = rint(v26 * 8.0);
      double v34 = fabs(v26 * 8.0);
      if (vabdd_f64(v33, v26 * 8.0) >= v10 * 8.0 || v34 == INFINITY) {
        double v27 = v26;
      }
      else {
        double v27 = v33 * 0.125;
      }
    }
LABEL_54:
    uint64_t v37 = *(unsigned __int16 *)(a1 + 10);
    if (*(_WORD *)(a1 + 10))
    {
      if (v11 < v37) {
        goto LABEL_61;
      }
      uint64_t v12 = (double *)malloc_type_realloc(*(void **)a1, 32 * v37, 0x1000040451B5BE8uLL);
      if (!v12)
      {
        uint64_t v38 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFIndex NSISSparseVectorAddTermWithPlaceValueCoefficientStartingIndex(NSISSparseVector *, NSISPlaceValue_t, NSISFloat_t, NSISFloat_t, CFIndex)"), @"NSISSparseVector.m", 111, @"Memory exhaustion.");
      }
      *(_WORD *)(a1 + 10) *= 2;
    }
    else
    {
      *(_WORD *)(a1 + 10) = 8;
      uint64_t v12 = (double *)malloc_type_malloc(0x80uLL, 0x1000040451B5BE8uLL);
    }
    *(void *)a1 = v12;
LABEL_61:
    if (v12)
    {
      if (v16) {
        memmove(&v12[2 * a2 + 2], &v12[2 * a2], 16 * (v11 - a2));
      }
      uint64_t v39 = &v12[2 * a2];
      *uint64_t v39 = a3;
      v39[1] = v27;
      ++*(_WORD *)(a1 + 8);
    }
    return ++a2;
  }
  uint64_t v18 = &v12[2 * a2];
  double v20 = v18[1];
  uint64_t v19 = v18 + 1;
  double v21 = v20;
  double v22 = -(a5 * a4);
  double v23 = v20;
  if (*(void *)&v22 >> 63 == *(void *)&v20 >> 63)
  {
    double v24 = 0.0;
    if (vabdd_f64(-(a5 * a4), v21) <= v10) {
      goto LABEL_23;
    }
    uint64_t v25 = *(void *)&v22 - *(void *)&v23;
    if (v25 < 0) {
      uint64_t v25 = -v25;
    }
    if (v25 <= NSISMaxUlps) {
      goto LABEL_23;
    }
  }
  double v24 = v21 + a5 * a4;
  if (v24 == 0.0)
  {
LABEL_23:
    if (v10 > 0.0) {
      goto LABEL_40;
    }
    goto LABEL_29;
  }
  if (fabs(v24) >= v10)
  {
LABEL_29:
    double v28 = rint(v24);
    if (vabdd_f64(v24, v28) >= v10)
    {
      double v29 = rint(v24 * 8.0);
      double v30 = fabs(v24 * 8.0);
      if (vabdd_f64(v29, v24 * 8.0) >= v10 * 8.0 || v30 == INFINITY) {
        double v28 = v24;
      }
      else {
        double v28 = v29 * 0.125;
      }
    }
    if (v28 == 0.0) {
      goto LABEL_40;
    }
    *uint64_t v19 = v28;
    return ++a2;
  }
LABEL_40:
  if (v11 >= 2)
  {
    memmove(&v12[2 * a2], &v12[2 * a2 + 2], 16 * (~a2 + v11));
    LOWORD(v11) = *(_WORD *)(a1 + 8);
  }
  *(_WORD *)(a1 + 8) = v11 - 1;
  return a2;
}

unsigned __int16 *expression_add_variable(unsigned __int16 *result, unsigned int a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  double v10 = result;
  if (a5 == 0.0)
  {
    if (*(double *)&NSISEpsilon > 0.0) {
      return result;
    }
  }
  else if (fabs(a5) < *(double *)&NSISEpsilon)
  {
    return result;
  }
  char v21 = 0;
  double v20 = 0;
  uint64_t v11 = a2;
  uint64_t result = (unsigned __int16 *)vars_index_with_insert(result, a2, &v21, &v20);
  unint64_t v12 = (unint64_t)result;
  double v13 = *v20;
  double v14 = -(a6 * a5);
  if (*(void *)&v14 >> 63 == *(void *)v20 >> 63)
  {
    double v15 = *(double *)&NSISEpsilon;
    double v16 = 0.0;
    if (vabdd_f64(-(a6 * a5), v13) <= *(double *)&NSISEpsilon) {
      goto LABEL_11;
    }
    uint64_t v17 = *(void *)&v14 - *(void *)v20;
    if (v17 < 0) {
      uint64_t v17 = -v17;
    }
    if (v17 <= NSISMaxUlps) {
      goto LABEL_11;
    }
  }
  double v16 = v13 + a6 * a5;
  double v15 = *(double *)&NSISEpsilon;
  if (v16 == 0.0) {
LABEL_11:
  }
    BOOL v18 = v15 > 0.0;
  else {
    BOOL v18 = fabs(v16) < *(double *)&NSISEpsilon;
  }
  if (v18) {
    double v19 = 0.0;
  }
  else {
    double v19 = v16;
  }
  *double v20 = v19;
  if (v21) {
    uint64_t result = (unsigned __int16 *)(*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a3, v11);
  }
  if (v19 == 0.0)
  {
    vars_remove_idx(v10, v12);
    return (unsigned __int16 *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a4, v11);
  }
  return result;
}

void expression_merge(unsigned __int16 *a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (double *)(a2 + 8);
  if (*((void *)a2 + 2) == *MEMORY[0x1E4F1CFD0])
  {
    uint64_t v9 = (double *)*((void *)a2 + 3);
    uint64_t v10 = *((void *)a2 + 4);
  }
  else
  {
    uint64_t v10 = *a2;
  }
  uint64_t v11 = &v9[v10];
  unint64_t v12 = *((unsigned int *)a2 + 1);
  if (v12 <= 3)
  {
    if (v12)
    {
      do
      {
        double v13 = *v9++;
        double v14 = v13;
        LODWORD(v13) = *(_DWORD *)v11;
        uint64_t v11 = (double *)((char *)v11 + 4);
        expression_add_variable(a1, LODWORD(v13), a3, a4, v14, a5);
        --v12;
      }
      while (v12);
    }
    expression_shrink_if_possible((char *)a1);
    return;
  }
  double v15 = a1 + 8;
  uint64_t v56 = v10;
  v57 = a1 + 8;
  if (*((void *)a1 + 2) == *MEMORY[0x1E4F1CFD0])
  {
    double v15 = (unsigned __int16 *)*((void *)a1 + 3);
    uint64_t v16 = *((void *)a1 + 4);
  }
  else
  {
    uint64_t v16 = *a1;
  }
  unint64_t v17 = *((unsigned int *)a1 + 1);
  unint64_t v18 = v17 + v12;
  unint64_t v60 = v17;
  uint64_t v59 = *MEMORY[0x1E4F1CFD0];
  if (v17 + v12 >= 0x101)
  {
    double v19 = malloc_type_malloc(4 * v18, 0x100004052888210uLL);
    double v20 = (char *)malloc_type_malloc(8 * v18, 0x100004000313F17uLL);
    unint64_t v17 = v60;
    __src = v20;
  }
  else
  {
    __src = &v63;
    double v19 = v64;
  }
  v61 = v19;
  *(void *)v58 = a1;
  uint64_t v55 = v16;
  if (v17)
  {
    unint64_t v21 = 0;
    unint64_t v22 = 0;
    unint64_t v23 = 0;
    double v24 = -a5;
    uint64_t v25 = &v15[4 * v16];
    while (1)
    {
      unsigned int v26 = *(_DWORD *)&v25[2 * v22];
      uint64_t v27 = *((unsigned int *)v11 + v23);
      if (v26 == v27)
      {
        double v28 = v9[v23];
        double v29 = *(double *)&v15[4 * v22];
        if (COERCE_UNSIGNED_INT64(v28 * v24) >> 63 == *(void *)&v29 >> 63)
        {
          double v30 = *(double *)&NSISEpsilon;
          double v31 = 0.0;
          if (vabdd_f64(v28 * v24, v29) <= *(double *)&NSISEpsilon) {
            goto LABEL_25;
          }
          uint64_t v32 = COERCE__INT64(v28 * v24) - *(void *)&v29;
          if (v32 < 0) {
            uint64_t v32 = *(void *)&v29 - COERCE__INT64(v28 * v24);
          }
          if (v32 <= NSISMaxUlps) {
            goto LABEL_25;
          }
        }
        double v31 = v29 + a5 * v28;
        double v30 = *(double *)&NSISEpsilon;
        if (v31 == 0.0) {
LABEL_25:
        }
          BOOL v33 = v30 > 0.0;
        else {
          BOOL v33 = fabs(v31) < *(double *)&NSISEpsilon;
        }
        if (v33) {
          double v31 = 0.0;
        }
        if (v31 == 0.0)
        {
          (*(void (**)(uint64_t))(a4 + 16))(a4);
          unint64_t v17 = v60;
        }
        else
        {
          *(_DWORD *)&v61[4 * v21] = v26;
          *(double *)&__src[8 * v21++] = v31;
        }
        ++v22;
      }
      else
      {
        if (v26 < v27)
        {
          *(_DWORD *)&v61[4 * v21] = v26;
          *(void *)&__src[8 * v21++] = *(void *)&v15[4 * v22++];
          goto LABEL_43;
        }
        double v34 = v9[v23] * a5;
        if (v34 == 0.0) {
          BOOL v35 = *(double *)&NSISEpsilon > 0.0;
        }
        else {
          BOOL v35 = fabs(v34) < *(double *)&NSISEpsilon;
        }
        if (v35) {
          double v34 = 0.0;
        }
        if (v34 != 0.0)
        {
          *(_DWORD *)&v61[4 * v21] = v27;
          *(double *)&__src[8 * v21++] = v34;
          (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, v27);
          unint64_t v17 = v60;
        }
      }
      ++v23;
LABEL_43:
      if (v22 >= v17 || v23 >= v12) {
        goto LABEL_47;
      }
    }
  }
  unint64_t v23 = 0;
  unint64_t v22 = 0;
  unint64_t v21 = 0;
LABEL_47:
  unint64_t v36 = v17 - v22;
  if (v17 <= v22)
  {
    v43 = *(unsigned __int16 **)v58;
    uint64_t v38 = v61;
  }
  else
  {
    unint64_t v37 = v21 + v17 - v22;
    uint64_t v38 = v61;
    uint64_t v39 = &v61[4 * v21];
    v40 = &__src[8 * v21];
    v41 = &v15[4 * v55 + 2 * v22];
    v42 = &v15[4 * v22];
    v43 = *(unsigned __int16 **)v58;
    do
    {
      int v44 = *(_DWORD *)v41;
      v41 += 2;
      *v39++ = v44;
      uint64_t v45 = *(void *)v42;
      v42 += 4;
      *(void *)v40 = v45;
      v40 += 8;
      --v36;
    }
    while (v36);
    unint64_t v21 = v37;
  }
  unint64_t v46 = v12 - v23;
  if (v12 > v23)
  {
    v47 = (_DWORD *)&v9[v56] + v23;
    v48 = &v9[v23];
    do
    {
      double v49 = *v48 * a5;
      if (v49 == 0.0) {
        BOOL v50 = *(double *)&NSISEpsilon > 0.0;
      }
      else {
        BOOL v50 = fabs(v49) < *(double *)&NSISEpsilon;
      }
      if (v50) {
        double v49 = 0.0;
      }
      if (v49 != 0.0)
      {
        v38[v21] = *v47;
        *(double *)&__src[8 * v21++] = v49;
        (*(void (**)(uint64_t))(a3 + 16))(a3);
      }
      ++v47;
      ++v48;
      --v46;
    }
    while (v46);
  }
  expression_ensure_capacity(v43, v21);
  if (*((void *)v43 + 2) == v59)
  {
    v52 = (unsigned __int16 *)*((void *)v43 + 3);
    uint64_t v51 = *((void *)v43 + 4);
  }
  else
  {
    uint64_t v51 = *v43;
    v52 = v57;
  }
  v53 = (char *)&v52[4 * v51];
  memmove(v53, v38, 4 * v21);
  memcpy(v52, __src, 8 * v21);
  uint64_t v54 = v60 - v21;
  if (v60 > v21)
  {
    bzero(&v53[4 * v60 + -4 * v54], 4 * v54);
    bzero(&v52[4 * v60 + -4 * v54], 8 * v54);
  }
  *((_DWORD *)v43 + 1) = v21;
  expression_shrink_if_possible((char *)v43);
  if (v38 != (_DWORD *)v64)
  {
    free(v38);
    free(__src);
  }
}

void NSBitSetAddIndex(unsigned int *a1, unint64_t a2)
{
  char v2 = a2;
  unint64_t v4 = a2 >> 6;
  unsigned int v5 = a1[2];
  if (v5 <= (a2 >> 6))
  {
    _NSBitSetResize(a1, a2 >> 6);
    unsigned int v5 = a1[2];
    uint64_t v8 = 1 << v2;
LABEL_7:
    uint64_t v9 = a1;
    if (v5 >= 2) {
      uint64_t v9 = *(unsigned int **)a1;
    }
    *(void *)&v9[2 * v4] |= v8;
    ++a1[3];
    return;
  }
  uint64_t v6 = a1;
  if (v5 >= 2) {
    uint64_t v6 = *(unsigned int **)a1;
  }
  uint64_t v7 = *(void *)&v6[2 * v4];
  uint64_t v8 = 1 << a2;
  if ((v7 & (1 << a2)) == 0) {
    goto LABEL_7;
  }
}

void ___substituteOutAllOccurencesOfBodyVar_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 40) + 8);
  if (HIWORD(v3)) {
    unint64_t v4 = v3 - 0x40000000;
  }
  else {
    unint64_t v4 = v3;
  }
  if (HIWORD(v3)) {
    unsigned int v5 = (unsigned int *)(a3 + 24);
  }
  else {
    unsigned int v5 = (unsigned int *)(a3 + 8);
  }
  NSBitSetAddIndex(v5, v4);
}

uint64_t ___row_rawReplaceColWithRowBody_block_invoke_3(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(v3 + 192) + 8 * (a2 >> 6));
  uint64_t v5 = v4 + 32 * (a2 & 0x3F);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t v9 = 32 * (a2 & 0x3F);
    uint64_t v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *(void *)(v4 + v9) file lineNumber description];
  }
  uint64_t v6 = *(void *)(v5 + 8);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v7(v2, v3, v6);
}

uint64_t *___substituteOutAllOccurencesOfBodyVar_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 40) + 8);
  if (HIWORD(v3)) {
    unint64_t v4 = v3 - 0x40000000;
  }
  else {
    unint64_t v4 = v3;
  }
  if (HIWORD(v3)) {
    uint64_t v5 = (uint64_t *)(a3 + 24);
  }
  else {
    uint64_t v5 = (uint64_t *)(a3 + 8);
  }
  return NSBitSetRemoveIndex(v5, v4);
}

uint64_t ___row_rawReplaceColWithRowBody_block_invoke_4(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(v3 + 192) + 8 * (a2 >> 6));
  uint64_t v5 = v4 + 32 * (a2 & 0x3F);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t v9 = 32 * (a2 & 0x3F);
    uint64_t v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *(void *)(v4 + v9) file lineNumber description];
  }
  uint64_t v6 = *(void *)(v5 + 8);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v7(v2, v3, v6);
}

void NSISSparseVectorMapDelete(uint64_t a1, unsigned int a2)
{
  unint64_t v4 = 0x1E4F28000uLL;
  if (!*(_DWORD *)(a1 + 24))
  {
    unint64_t v18 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void _deleteWithHashFunction(NSISSparseVectorMap *, uint32_t, HASH_FUNCTION)"), @"NSISSparseVectorMap.m", 218, @"Tried to remove a sparse vector value from an empty map which shouldn't happen.");
    unint64_t v4 = 0x1E4F28000uLL;
  }
  unsigned int v5 = *(_DWORD *)(a1 + 32);
  unsigned int v6 = 73244475 * ((73244475 * (a2 ^ HIWORD(a2))) ^ ((73244475 * (a2 ^ HIWORD(a2))) >> 16));
  unsigned int v7 = (v6 ^ HIWORD(v6)) % v5;
  unsigned int v8 = v5;
  while (1)
  {
    uint64_t v9 = *(void *)(a1 + 16);
    uint64_t v10 = *(void *)(v9 + 24 * v7);
    if (v10 != -1)
    {
      if (!v10)
      {
        double v20 = (void *)[*(id *)(v4 + 2816) currentHandler];
        objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void _deleteWithHashFunction(NSISSparseVectorMap *, uint32_t, HASH_FUNCTION)"), @"NSISSparseVectorMap.m", 227, @"Tried to remove a sparse vector value that wasn't in the map.");
        unint64_t v4 = 0x1E4F28000;
        uint64_t v9 = *(void *)(a1 + 16);
      }
      if (*(_DWORD *)(v9 + 24 * v7 + 12) == a2) {
        break;
      }
    }
    if (v7 + 1 < v5) {
      ++v7;
    }
    else {
      unsigned int v7 = 0;
    }
    if (!--v8)
    {
      double v19 = (void *)[*(id *)(v4 + 2816) currentHandler];
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void _deleteWithHashFunction(NSISSparseVectorMap *, uint32_t, HASH_FUNCTION)"), @"NSISSparseVectorMap.m", 224, @"Corrupt hash table");
      unint64_t v4 = 0x1E4F28000;
    }
  }
  NSISSparseVectorMinHeapDelete(a1, v9 + 24 * v7);
  uint64_t v11 = *(void *)(a1 + 16);
  *(void *)(v11 + 24 * v7) = -1;
  int v12 = *(_DWORD *)(a1 + 28) + 1;
  unsigned int v13 = *(_DWORD *)(a1 + 24) - 1;
  *(_DWORD *)(a1 + 24) = v13;
  *(_DWORD *)(a1 + 28) = v12;
  if (v7 + 1 < v5) {
    unsigned int v14 = v7 + 1;
  }
  else {
    unsigned int v14 = 0;
  }
  if (!*(void *)(v11 + 24 * v14))
  {
    do
    {
      --v12;
      *(void *)(v11 + 24 * v7) = 0;
      if (v7) {
        unsigned int v15 = v7;
      }
      else {
        unsigned int v15 = v5;
      }
      unsigned int v7 = v15 - 1;
    }
    while (*(void *)(v11 + 24 * (v15 - 1)) == -1);
    *(_DWORD *)(a1 + 28) = v12;
  }
  unsigned int v16 = *(_DWORD *)(a1 + 32);
  if (v16 >= 0x40 && v13 < v16 >> 3)
  {
    _hashMapRehash(a1, -1);
  }
}

uint64_t AddVarToSortedPriorityVectorList(uint64_t a1, unsigned int a2, _WORD *a3)
{
  uint64_t result = -[NSISObjectiveLinearExpression valueRestrictionForVar:](a1, a2);
  if (result == 1)
  {
    uint64_t result = NSISSparseVectorStrongestTermIsNegative(a3);
    if (result)
    {
      return NSISSparseVectorMapAddToMinHeap(a1 + 16, a3);
    }
  }
  return result;
}

__n128 NSISSparseVectorMapInsert(uint64_t a1, unsigned int a2, __n128 *a3)
{
  unsigned int v6 = *(_DWORD *)(a1 + 24);
  int v7 = *(_DWORD *)(a1 + 28);
  unsigned int v8 = *(_DWORD *)(a1 + 32);
  if (v7 + v6 >= (3 * v8) >> 2)
  {
    _hashMapRehash(a1, v6 >= 4 * v7);
    unsigned int v8 = *(_DWORD *)(a1 + 32);
  }
  unsigned int v9 = 73244475 * ((73244475 * (a2 ^ HIWORD(a2))) ^ ((73244475 * (a2 ^ HIWORD(a2))) >> 16));
  unsigned int v10 = (v9 ^ HIWORD(v9)) % v8;
  uint64_t v11 = *(void *)(a1 + 16);
  while (1)
  {
    int v12 = (__n128 *)(v11 + 24 * v10);
    if (!v12->n128_u64[0]) {
      break;
    }
    if (v12->n128_u64[0] == -1)
    {
      --*(_DWORD *)(a1 + 28);
      break;
    }
    if (v10 + 1 < v8) {
      ++v10;
    }
    else {
      unsigned int v10 = 0;
    }
  }
  __n128 result = *a3;
  v12[1].n128_u64[0] = a3[1].n128_u64[0];
  *int v12 = result;
  *(_DWORD *)(v11 + 24 * v10 + 12) = a2;
  ++*(_DWORD *)(a1 + 24);
  return result;
}

BOOL NSISSparseVectorStrongestTermIsNegative(_WORD *a1)
{
  return a1[4] && *(double *)(*(void *)a1 + 8) < 0.0;
}

uint64_t NSISSparseVectorAddTermWithPlaceValueAndCoefficient(uint64_t a1, double a2, double a3)
{
  return NSISSparseVectorAddTermWithPlaceValueCoefficientStartingIndex(a1, 0, a2, a3, 1.0);
}

void *NSISSparseVectorInit(void *result)
{
  result[1] = 0;
  result[2] = 0;
  *__n128 result = 0;
  *((_DWORD *)result + 4) = -1;
  return result;
}

void NSISSparseVectorMinHeapDestroy(void **a1)
{
  if (a1) {
    free(*a1);
  }
}

void *NSISSparseVectorCreateCopy@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 16) = *(void *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_DWORD *)(a2 + 16) = -1;
  unint64_t v4 = malloc_type_malloc(16 * *(unsigned __int16 *)(a1 + 10), 0x1000040451B5BE8uLL);
  *(void *)a2 = v4;
  unsigned int v5 = *(const void **)a1;
  size_t v6 = 16 * *(unsigned __int16 *)(a1 + 8);
  return memcpy(v4, v5, v6);
}

uint64_t *NSISSparseVectorMultiplyByScalar(uint64_t *result, double a2)
{
  if (a2 != 1.0)
  {
    uint64_t v2 = *((unsigned __int16 *)result + 4);
    if (*((_WORD *)result + 4))
    {
      uint64_t v3 = 0;
      uint64_t v4 = *result;
      uint64_t v5 = *result + 16;
      int v6 = *((unsigned __int16 *)result + 4);
      do
      {
        uint64_t v7 = v4 + 16 * v3;
        double v9 = *(double *)(v7 + 8);
        unsigned int v8 = (double *)(v7 + 8);
        double v10 = v9 * a2;
        if (v9 * a2 == 0.0)
        {
          double v11 = *(double *)&NSISEpsilon;
          if (*(double *)&NSISEpsilon > 0.0) {
            goto LABEL_20;
          }
        }
        else
        {
          double v11 = *(double *)&NSISEpsilon;
          if (fabs(v10) < *(double *)&NSISEpsilon) {
            goto LABEL_20;
          }
        }
        double v12 = rint(v10);
        if (vabdd_f64(v10, v12) >= v11)
        {
          double v13 = rint(v10 * 8.0);
          double v14 = fabs(v10 * 8.0);
          if (vabdd_f64(v13, v10 * 8.0) >= v11 * 8.0 || v14 == INFINITY) {
            double v12 = v10;
          }
          else {
            double v12 = v13 * 0.125;
          }
        }
        if (v12 == 0.0)
        {
LABEL_20:
          uint64_t v17 = v2 - 1;
          if (v3 < v2 - 1)
          {
            uint64_t v18 = ~v3 + v2;
            double v19 = (_OWORD *)(v5 + 16 * v3);
            do
            {
              *(v19 - 1) = *v19;
              ++v19;
              --v18;
            }
            while (v18);
            int v6 = *((unsigned __int16 *)result + 4);
          }
          *((_WORD *)result + 4) = --v6;
          uint64_t v2 = v17;
          continue;
        }
        *unsigned int v8 = v12;
        ++v3;
      }
      while (v3 < v2);
    }
  }
  return result;
}

void sub_1A648BD94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 208), 8);
  _Block_object_dispose((const void *)(v39 - 160), 8);
  _Unwind_Resume(a1);
}

BOOL NSISLinExpEnumerateVarsAndCoefficientsUntil(unsigned __int16 *a1, uint64_t a2)
{
  uint64_t v3 = (double *)(a1 + 8);
  if (*((void *)a1 + 2) == *MEMORY[0x1E4F1CFD0])
  {
    uint64_t v3 = (double *)*((void *)a1 + 3);
    uint64_t v4 = *((void *)a1 + 4);
  }
  else
  {
    uint64_t v4 = *a1;
  }
  unint64_t v5 = *((unsigned int *)a1 + 1);
  if (!v5) {
    return 0;
  }
  int v6 = &v3[v4];
  if ((*(uint64_t (**)(uint64_t, void, double))(a2 + 16))(a2, *(unsigned int *)v6, *v3)) {
    return 1;
  }
  uint64_t v8 = 1;
  do
  {
    unint64_t v9 = v8;
    if (v5 == v8) {
      break;
    }
    int v10 = (*(uint64_t (**)(uint64_t, void, double))(a2 + 16))(a2, *((unsigned int *)v6 + v8), v3[v8]);
    uint64_t v8 = v9 + 1;
  }
  while (!v10);
  return v9 < v5;
}

uint64_t ___row_enumerateColsWithCoefficientsUntil_block_invoke(uint64_t a1, unsigned int a2, __n128 a3)
{
  unint64_t v3 = a3.n128_u64[0];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 192) + 8 * (a2 >> 6));
  if (*(unsigned char *)(v5 + 32 * (a2 & 0x3F) + 24))
  {
    uint64_t v8 = 32 * (a2 & 0x3F);
    unint64_t v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *(void *)(v5 + v8) file lineNumber description];
  }
  int v6 = *(uint64_t (**)(__n128))(*(void *)(a1 + 40) + 16);
  a3.n128_u64[0] = v3;
  return v6(a3);
}

uint64_t ___row_rawReplaceColWithRowBody_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(v3 + 192) + 8 * (a2 >> 6));
  uint64_t v5 = v4 + 32 * (a2 & 0x3F);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t v9 = 32 * (a2 & 0x3F);
    int v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *(void *)(v4 + v9) file lineNumber description];
  }
  uint64_t v6 = *(void *)(v5 + 8);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v7(v2, v3, v6);
}

unsigned __int16 *_row_setHead(uint64_t a1, uint64_t a2, uint64_t a3, id **a4)
{
  _row_rawSetHead(a1, (_DWORD *)a2, a3, a4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___row_setHead_block_invoke;
  v9[3] = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  v9[4] = a1;
  v9[5] = a2;
  uint64_t v6 = (unsigned __int16 *)(a2 + 16);
  if (*(unsigned char *)(a2 + 80))
  {
    uint64_t v8 = *(void *)v6;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    double v12 = ___row_enumerateCols_block_invoke;
    double v13 = &unk_1E5C570C0;
    uint64_t v14 = a1;
    unsigned int v15 = v9;
    return (unsigned __int16 *)-[NSISObjectiveLinearExpression enumerateVars:](v8, (uint64_t)&v10);
  }
  else
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    double v12 = ___row_enumerateCols_block_invoke_2;
    double v13 = &unk_1E5C570C0;
    uint64_t v14 = a1;
    unsigned int v15 = v9;
    return NSISLinExpEnumerateVars(v6, (uint64_t)&v10);
  }
}

unsigned __int16 *NSISLinExpEnumerateVars(unsigned __int16 *result, uint64_t a2)
{
  uint64_t v3 = result + 8;
  if (*((void *)result + 2) == *MEMORY[0x1E4F1CFD0])
  {
    uint64_t v3 = (unsigned __int16 *)*((void *)result + 3);
    uint64_t v4 = *((void *)result + 4);
  }
  else
  {
    uint64_t v4 = *result;
  }
  uint64_t v5 = *((unsigned int *)result + 1);
  if (v5)
  {
    uint64_t v6 = &v3[4 * v4];
    do
    {
      unsigned int v7 = *(_DWORD *)v6;
      v6 += 2;
      __n128 result = (unsigned __int16 *)(*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, v7);
      --v5;
    }
    while (v5);
  }
  return result;
}

uint64_t ___row_enumerateCols_block_invoke_2(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(v3 + 192) + 8 * (a2 >> 6));
  uint64_t v5 = v4 + 32 * (a2 & 0x3F);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t v9 = 32 * (a2 & 0x3F);
    uint64_t v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *(void *)(v4 + v9) file lineNumber description];
  }
  uint64_t v6 = *(void *)(v5 + 8);
  unsigned int v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v7(v2, v3, v6);
}

void ___row_setHead_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t ___row_rawReplaceColWithRowBody_block_invoke_2(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(v3 + 192) + 8 * (a2 >> 6));
  uint64_t v5 = v4 + 32 * (a2 & 0x3F);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t v9 = 32 * (a2 & 0x3F);
    uint64_t v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *(void *)(v4 + v9) file lineNumber description];
  }
  uint64_t v6 = *(void *)(v5 + 8);
  unsigned int v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v7(v2, v3, v6);
}

void NSISLinExpAddExpression(unsigned __int16 *a1, uint64_t a2, double a3)
{
  double v6 = fabs(a3);
  if (v6 >= INFINITY && v6 <= INFINITY)
  {
    unsigned int v7 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "void NSISLinExpAddExpression(NSISLinExp *, NSISLinExp *, NSISFloat_t)"), @"NSISLinearExpression.m", 761, @"Invalid parameter not satisfying: %@", @"isfinite(multiplyBy)" file lineNumber description];
  }
  NSISLinExpIncrementConstant((uint64_t)a1, *(double *)(a2 + 8) * a3);
  expression_merge(a1, (unsigned __int16 *)a2, (uint64_t)&__block_literal_global_25, (uint64_t)&__block_literal_global_25, a3);
}

__n128 NSISSparseVectorInitWithVector(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  a1[1].n128_u32[0] = -1;
  return result;
}

void ___pivotToMakeColNewHeadOfRow_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t **a3)
{
  uint64_t v3 = *a3;
  if (((*a3)[3] & 1) == 0)
  {
    uint64_t v5 = v3[1];
    uint64_t v6 = NSBitSetCount(v5 + 8);
    if (!(NSBitSetCount(v5 + 24) + v6))
    {
      _engineVar_rawRemove(a2, v3);
    }
  }
}

uint64_t *___pivotToMakeColNewHeadOfRow_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 40) + 8);
  if (HIWORD(v3)) {
    unint64_t v4 = v3 - 0x40000000;
  }
  else {
    unint64_t v4 = v3;
  }
  if (HIWORD(v3)) {
    uint64_t v5 = (uint64_t *)(a3 + 24);
  }
  else {
    uint64_t v5 = (uint64_t *)(a3 + 8);
  }
  return NSBitSetRemoveIndex(v5, v4);
}

uint64_t ___objectiveRow_rawAddCol_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(v3 + 192) + 8 * (a2 >> 6));
  uint64_t v5 = v4 + 32 * (a2 & 0x3F);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t v9 = 32 * (a2 & 0x3F);
    uint64_t v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *(void *)(v4 + v9) file lineNumber description];
  }
  uint64_t v6 = *(void *)(v5 + 8);
  unsigned int v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v7(v2, v3, v6);
}

void ___objectiveRow_addColWithPriorityTimes_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t ___row_enumerateColsWithCoefficients_block_invoke(uint64_t a1, unsigned int a2, __n128 a3)
{
  unint64_t v3 = a3.n128_u64[0];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 192) + 8 * (a2 >> 6));
  if (*(unsigned char *)(v5 + 32 * (a2 & 0x3F) + 24))
  {
    uint64_t v8 = 32 * (a2 & 0x3F);
    uint64_t v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *(void *)(v5 + v8) file lineNumber description];
  }
  uint64_t v6 = *(uint64_t (**)(__n128))(*(void *)(a1 + 40) + 16);
  a3.n128_u64[0] = v3;
  return v6(a3);
}

unint64_t ___row_remove_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unsigned int v5 = *(_DWORD *)(*(void *)(a1 + 40) + 8);
  if (HIWORD(v5)) {
    unint64_t v6 = v5 - 0x40000000;
  }
  else {
    unint64_t v6 = v5;
  }
  if (HIWORD(v5)) {
    unsigned int v7 = a3 + 3;
  }
  else {
    unsigned int v7 = a3 + 1;
  }
  unint64_t result = (unint64_t)NSBitSetRemoveIndex(v7, v6);
  uint64_t v9 = *a3;
  if ((*(unsigned char *)(v9 + 24) & 1) == 0)
  {
    uint64_t v10 = *(void *)(v9 + 8);
    uint64_t v11 = NSBitSetCount(v10 + 8);
    unint64_t result = NSBitSetCount(v10 + 24);
    if (!(result + v11))
    {
      return _engineVar_rawRemove(a2, (uint64_t *)v9);
    }
  }
  return result;
}

void _hashMapRehash(uint64_t a1, int a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 32);
  if (a2 == -1)
  {
    unsigned int v6 = *(unsigned __int16 *)(a1 + 36);
    if (v6 >= 6)
    {
      LOWORD(v6) = v6 - 1;
      *(_WORD *)(a1 + 36) = v6;
    }
    int v7 = 1 << v6;
    int v8 = v7 - 1;
    unsigned int v9 = v7 - ((v7 - 1) & (v3 >> 1));
    if ((v8 & (v3 >> 1)) == 0) {
      unsigned int v9 = 0;
    }
    unsigned int v4 = v9 + (v3 >> 1);
    *(_DWORD *)(a1 + 32) = v4;
  }
  else
  {
    unsigned int v4 = *(_DWORD *)(a1 + 32);
    if (a2 == 1)
    {
      __int16 v5 = *(_WORD *)(a1 + 36);
      unsigned int v4 = (1 << v5) + v3;
      *(_DWORD *)(a1 + 32) = v4;
      if (v4 == 8 << v5) {
        *(_WORD *)(a1 + 36) = v5 + 1;
      }
    }
  }
  uint64_t v10 = *(void **)(a1 + 16);
  *(void *)(a1 + 24) = 0;
  uint64_t v11 = malloc_type_calloc(v4, 0x18uLL, 0x10200405AF6BDC9uLL);
  *(void *)(a1 + 16) = v11;
  if (v11)
  {
    if (!v3) {
      goto LABEL_17;
    }
  }
  else
  {
    unsigned int v15 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void _hashMapRehash(NSISSparseVectorMap *, NSISSparseVectorMapDirection)"), @"NSISSparseVectorMap.m", 85, @"Unable to grow sparse vector hash table");
    if (!v3) {
      goto LABEL_17;
    }
  }
  double v12 = v10;
  do
  {
    if ((unint64_t)(*v12 + 1) >= 2)
    {
      uint64_t v13 = NSISSparseVectorMapInsert(a1, *((unsigned int *)v12 + 3), v12);
      uint64_t v14 = *(unsigned int *)(v13 + 16);
      if (v14 != -1) {
        *(void *)(*(void *)a1 + 8 * v14) = v13;
      }
    }
    v12 += 3;
    --v3;
  }
  while (v3);
LABEL_17:
  free(v10);
}

uint64_t ___objectiveRow_rawAddRowBody_block_invoke_2(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(v3 + 192) + 8 * (a2 >> 6));
  uint64_t v5 = v4 + 32 * (a2 & 0x3F);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t v9 = 32 * (a2 & 0x3F);
    uint64_t v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *(void *)(v4 + v9) file lineNumber description];
  }
  uint64_t v6 = *(void *)(v5 + 8);
  int v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v7(v2, v3, v6);
}

uint64_t *___objectiveRow_addRowBodyWithPriorityTimes_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 40) + 8);
  if (HIWORD(v3)) {
    unint64_t v4 = v3 - 0x40000000;
  }
  else {
    unint64_t v4 = v3;
  }
  if (HIWORD(v3)) {
    uint64_t v5 = (uint64_t *)(a3 + 24);
  }
  else {
    uint64_t v5 = (uint64_t *)(a3 + 8);
  }
  return NSBitSetRemoveIndex(v5, v4);
}

uint64_t NSISSparseVectorGetStrongestTerm(uint64_t result, void *a2, void *a3)
{
  if (*(_WORD *)(result + 8))
  {
    unsigned int v3 = *(void **)result;
    *a2 = **(void **)result;
    uint64_t v4 = v3[1];
  }
  else
  {
    *a2 = 0;
    uint64_t v4 = 0;
  }
  *a3 = v4;
  return result;
}

uint64_t ___objectiveRow_rawAddRowBody_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(v3 + 192) + 8 * (a2 >> 6));
  uint64_t v5 = v4 + 32 * (a2 & 0x3F);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t v9 = 32 * (a2 & 0x3F);
    uint64_t v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *(void *)(v4 + v9) file lineNumber description];
  }
  uint64_t v6 = *(void *)(v5 + 8);
  int v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v7(v2, v3, v6);
}

void ___objectiveRow_addRowBodyWithPriorityTimes_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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

BOOL NSLayoutConstraintIsDanglyInContainer(void *a1, void *a2)
{
  unint64_t v4 = (void *)[a2 firstAnchor];
  uint64_t v5 = (void *)[a2 secondAnchor];
  uint64_t v6 = [v4 _nearestAncestorLayoutItem];
  uint64_t v7 = [v5 _nearestAncestorLayoutItem];
  if (v4
    && (!v6
     || +[NSLayoutConstraint _findCommonAncestorOfItem:a1 andItem:v6] != a1))
  {
    return 1;
  }
  if (v5)
  {
    if (v7) {
      return +[NSLayoutConstraint _findCommonAncestorOfItem:a1 andItem:v7] != a1;
    }
    return 1;
  }
  return 0;
}

void sub_1A648D9E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL NSLayoutConstraintIsPotentiallyDanglyInContainer(void *a1, void *a2)
{
  unint64_t v4 = (void *)[a2 firstAnchor];
  uint64_t v5 = (void *)[a2 secondAnchor];
  uint64_t v6 = (void *)[v4 _nearestAncestorLayoutItem];
  if (v4 && (!v6 || v6 != a1 && objc_msgSend(v6, "nsli_superitem") != a1)) {
    return 1;
  }
  uint64_t v7 = (void *)[v5 _nearestAncestorLayoutItem];
  if (v5)
  {
    if (v7)
    {
      if (v7 != a1) {
        return objc_msgSend(v7, "nsli_superitem") != (void)a1;
      }
      return 0;
    }
    return 1;
  }
  return 0;
}

void sub_1A648E0BC()
{
}

void sub_1A648E61C(_Unwind_Exception *a1)
{
}

unint64_t _minimizeConstantInObjectiveRow(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v6 = _NSConstraintBasedLayoutLogPivotCounts();
  for (unint64_t i = 0; ; ++i)
  {
    if ((*(unsigned char *)(a3 + 80) & 1) == 0)
    {
      double v12 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISObjectiveLinearExpression *_objectiveRow_rawBody(NSISRow)"), @"NSISEngine_Row.h", 418, @"Tried accessing the objective linear expression for regular row:%@", _row_description(a2, a3) file lineNumber description];
    }
    LODWORD(v23) = 0;
    if (!-[NSISObjectiveLinearExpression restrictedVarWithCoefficientOfLargestNegativeMagnitudeOutVar:](*(void *)(a3 + 16), &v23))break; {
    uint64_t v8 = *(void *)(*(void *)(a2 + 192) + (((unint64_t)v23 >> 3) & 0x1FFFFFF8));
    }
    uint64_t v9 = v23 & 0x3F;
    uint64_t v10 = v8 + 32 * v9;
    if (*(unsigned char *)(v10 + 24))
    {
      uint64_t v20 = 32 * v9;
      double v19 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *(void *)(v8 + v20) file lineNumber description];
    }
    uint64_t v11 = *(id ***)(v10 + 8);
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    if ((_chooseOutgoingRowHeadForIncomingRowHead(a2, (uint64_t)v11, (uint64_t)&v23, i > 0x3E8) & 1) == 0)
    {
      if (_NSConstraintBasedLayoutLogEngineRebuilds())
      {
        uint64_t v21 = 0;
        uint64_t v22 = 0;
        if ((*(unsigned char *)(a3 + 80) & 1) == 0)
        {
          uint64_t v18 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          [v18 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISObjectiveLinearExpression *_objectiveRow_rawBody(NSISRow)"), @"NSISEngine_Row.h", 418, @"Tried accessing the objective linear expression for regular row:%@", _row_description(a2, a3) file lineNumber description];
        }
        -[NSISObjectiveLinearExpression leadingPriority:andValue:forVar:](*(void **)(a3 + 16), &v22, &v21, *((_DWORD *)*v11 + 4));
        uint64_t v14 = _row_description(a2, a3);
        NSLog(&cfstr_Objective_0.isa, v14);
        unsigned int v15 = NSString;
        id v16 = **v11;
        NSLog(&stru_1EFB3BC98.isa, [v15 stringWithFormat:@"Auto layout internal error.  Cannot find an outgoing row head for incoming head %@, which should never happen. Priority: %g, Coefficient: %.10f", v16, v22, v21]);
      }
      *(unsigned char *)(a1 + 162) = 1;
      if (i >= 0x3E9 && (_minimizeConstantInObjectiveRow_warnedAboutCyclingAvoidance & 1) == 0)
      {
        NSLog(&cfstr_WarningThisSys.isa, i);
        _minimizeConstantInObjectiveRow_warnedAboutCyclingAvoidance = 1;
      }
      return i;
    }
    _pivotToMakeColNewHeadOfRow(a1, a2, (uint64_t **)v11, v23, v24, 0);
    if (_NSConstraintBasedLayoutDebugEngineConsistency()) {
      [(id)a1 verifyInternalIntegrity];
    }
  }
  if (i) {
    BOOL v13 = v6;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13) {
    printf("%p: Optimized in %lu moves (cumulative pivots: %lu)\n", (const void *)a1, i, *(void *)(a1 + 88));
  }
  return i;
}

uint64_t NSISSparseVectorMinHeapPeek(_DWORD *a1)
{
  if (a1[2]) {
    return **(void **)a1;
  }
  else {
    return 0;
  }
}

void _pivotToMakeColNewHeadOfRow(uint64_t a1, uint64_t a2, uint64_t **a3, uint64_t a4, uint64_t a5, int a6)
{
  ++*(void *)(a1 + 88);
  uint64_t v9 = (unsigned __int16 *)(a5 + 16);
  uint64_t v10 = *(void *)a5;
  v53 = *a3;
  double v11 = NSISLinExpConstant(a5 + 16);
  double v12 = *(void **)(a1 + 8);
  if (objc_msgSend(v12, "count", v11)) {
    [v12 removeObjectIdenticalTo:*(id *)v10];
  }
  uint64_t v13 = a1 + 312;
  unint64_t v14 = ((unint64_t)*(unsigned int *)(v10 + 24) >> 3) & 3;
  unsigned int v15 = (unsigned int *)(a1 + 312 + 40 * v14 + 24);
  if (!NSBitSetCount((uint64_t)v15)) {
    _table_addStorageBlock((void **)(v13 + 40 * v14), (unint64_t *)(v13 + 40 * v14 + 8), (unint64_t *)(v13 + 40 * v14 + 16), 0x19uLL, 40, v15);
  }
  unint64_t Index = NSBitSetFirstIndex((uint64_t **)v15);
  int v17 = Index;
  NSBitSetRemoveIndex((uint64_t *)v15, Index);
  unsigned int v18 = v17 | (v14 << 30);
  uint64_t v19 = 40 * ((v18 >> 30) & 1);
  unint64_t v20 = (v18 & 0xBFFFFFFF) / 0x19uLL;
  unsigned int v21 = (v18 & 0xBFFFFFFF) % 0x19;
  uint64_t v22 = (void *)(*(void *)(*(void *)(v13 + v19) + 8 * v20) + 40 * v21);
  *uint64_t v22 = v10;
  v22[1] = 0;
  v22[2] = 1;
  v22[3] = 0;
  v22[4] = 1;
  uint64_t v23 = *(void *)(*(void *)(v13 + v19) + 8 * v20);
  unsigned int v24 = *(_DWORD *)(v10 + 24) & 0xFFFFFFFE;
  *(_DWORD *)(v10 + 20) = v18;
  *(_DWORD *)(v10 + 24) = v24;
  uint64_t v52 = v23 + 40 * v21;
  *(void *)(v10 + 8) = v52;
  *(void *)a5 = 0;
  if (a6)
  {
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = ___pivotToMakeColNewHeadOfRow_block_invoke;
    v59[3] = &__block_descriptor_48_e16_v24__0_________8ls32l8;
    uint64_t v25 = a4;
    v59[4] = a4;
    v59[5] = a5;
    if (*(unsigned char *)(a5 + 80))
    {
      uint64_t v36 = *(void *)v9;
      uint64_t v60 = MEMORY[0x1E4F143A8];
      uint64_t v61 = 3221225472;
      v62 = ___row_enumerateCols_block_invoke;
      char v63 = &unk_1E5C570C0;
      uint64_t v64 = a4;
      uint64_t v65 = v59;
      -[NSISObjectiveLinearExpression enumerateVars:](v36, (uint64_t)&v60);
    }
    else
    {
      uint64_t v60 = MEMORY[0x1E4F143A8];
      uint64_t v61 = 3221225472;
      v62 = ___row_enumerateCols_block_invoke_2;
      char v63 = &unk_1E5C570C0;
      uint64_t v64 = a4;
      uint64_t v65 = v59;
      NSISLinExpEnumerateVars(v9, (uint64_t)&v60);
    }
    uint64_t v35 = a2;
    uint64_t v37 = NSBitSetCount((uint64_t)(a3 + 1));
    if (!(NSBitSetCount((uint64_t)(a3 + 3)) + v37))
    {
      double v38 = NSISLinExpConstant((uint64_t)v9);
      int v39 = 0;
LABEL_29:
      uint64_t v45 = (id *)v53;
      goto LABEL_35;
    }
  }
  else
  {
    unsigned int v26 = *(_DWORD *)(a5 + 8);
    if (HIWORD(v26)) {
      unint64_t v27 = v26 - 0x40000000;
    }
    else {
      unint64_t v27 = v26;
    }
    if (HIWORD(v26)) {
      double v28 = (uint64_t *)(a3 + 3);
    }
    else {
      double v28 = (uint64_t *)(a3 + 1);
    }
    NSBitSetRemoveIndex(v28, v27);
    unsigned int v29 = *(_DWORD *)(a5 + 8);
    uint64_t v30 = v23 + 40 * v21;
    double v31 = (unsigned int *)(v30 + 8);
    uint64_t v32 = (unsigned int *)(v30 + 24);
    if (HIWORD(v29)) {
      unint64_t v33 = v29 - 0x40000000;
    }
    else {
      unint64_t v33 = v29;
    }
    if (HIWORD(v29)) {
      double v34 = v32;
    }
    else {
      double v34 = v31;
    }
    NSBitSetAddIndex(v34, v33);
    uint64_t v35 = a2;
    uint64_t v25 = a4;
  }
  double v40 = NSISLinExpCoefficientForVar((uint64_t)v9, *((_DWORD *)*a3 + 4));
  double v41 = 1.0 / v40;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  int v58[2] = ___pivotToMakeColNewHeadOfRow_block_invoke_2;
  v58[3] = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  v58[4] = v25;
  v58[5] = a5;
  uint64_t v60 = MEMORY[0x1E4F143A8];
  uint64_t v61 = 3221225472;
  v62 = ___row_rawScaleByWithDroppedColProcessor_block_invoke;
  char v63 = &unk_1E5C570C0;
  uint64_t v64 = v25;
  uint64_t v65 = v58;
  NSISLinExpScaleByWithDroppedColProcessor((double *)v9, (uint64_t)&v60, -(1.0 / v40));
  double v42 = fabs(1.0 / v40);
  if (v42 >= INFINITY && v42 <= INFINITY)
  {
    v43 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v56 = objc_msgSend(NSString, "stringWithUTF8String:", "void _pivotToMakeColNewHeadOfRow(NSISEngine *, NSISCol, NSISRow, BOOL)");
    uint64_t v44 = _row_description(v25, a5);
    [v43 handleFailureInFunction:v56, @"NSISEngine.m", 470, @"The reciprocal (%f) for a row coefficient (%f) in engine (%p) is not finite. Pivot row: %@, incoming row head: %@.", *(void *)&v41, *(void *)&v40, a1, v44, _col_description(v35, a3) file lineNumber description];
  }
  NSISLinExpReplaceVarWithVar(v9, *((_DWORD *)*a3 + 4), *(_DWORD *)(*(void *)v52 + 16), v41);
  _substituteOutAllOccurencesOfBodyVar(a1, v35, (uint64_t)a3, v25, a5);
  double v38 = NSISLinExpConstant((uint64_t)v9);
  if (a6)
  {
    int v39 = 1;
    goto LABEL_29;
  }
  _row_rawSetHead(v25, (_DWORD *)a5, v35, (id **)a3);
  int v46 = (*(_DWORD *)(*(void *)a5 + 24) >> 1) & 3;
  if (v46 == 2)
  {
    uint64_t v45 = (id *)v53;
    if (v38 == 0.0)
    {
      if (*(double *)&NSISEpsilon > 0.0) {
        goto LABEL_34;
      }
    }
    else if (fabs(v38) < *(double *)&NSISEpsilon)
    {
      goto LABEL_34;
    }
  }
  else
  {
    uint64_t v45 = (id *)v53;
    if (v46 != 1 || v38 >= 0.0) {
      goto LABEL_34;
    }
  }
  [*(id *)(a1 + 8) addObject:*v45];
LABEL_34:
  int v39 = 1;
LABEL_35:
  if (v38 != 0.0)
  {
    _noteValueOfVariableChanged(a1, v25, (void *)v10);
    _noteValueOfVariableChanged(a1, v35, v45);
  }
  if (a6)
  {
    if (v39) {
      uint64_t v47 = v35;
    }
    else {
      uint64_t v47 = v25;
    }
    if (v39) {
      v48 = (uint64_t *)v45;
    }
    else {
      v48 = (uint64_t *)v10;
    }
    _engineVar_rawRemove(v47, v48);
    if (*(unsigned char *)(a5 + 80))
    {
      uint64_t v49 = *(void *)v9;
      uint64_t v60 = MEMORY[0x1E4F143A8];
      uint64_t v61 = 3221225472;
      v62 = ___row_enumerateCols_block_invoke;
      char v63 = &unk_1E5C570C0;
      uint64_t v64 = v25;
      uint64_t v65 = &__block_literal_global_551;
      -[NSISObjectiveLinearExpression enumerateVars:](v49, (uint64_t)&v60);
    }
    else
    {
      uint64_t v60 = MEMORY[0x1E4F143A8];
      uint64_t v61 = 3221225472;
      v62 = ___row_enumerateCols_block_invoke_2;
      char v63 = &unk_1E5C570C0;
      uint64_t v64 = v25;
      uint64_t v65 = &__block_literal_global_551;
      NSISLinExpEnumerateVars(v9, (uint64_t)&v60);
    }
    if (*(unsigned char *)(a5 + 80))
    {

      *(void *)uint64_t v9 = 0;
    }
    else
    {
      NSISLinExpFree((uint64_t)v9);
    }
    unint64_t v50 = *(unsigned int *)(a5 + 8);
    uint64_t v51 = a1 + 40 * ((v50 >> 30) & 1);
    NSBitSetAddIndex((unsigned int *)(v51 + 256), v50 & 0xFFFFFFFFBFFFFFFFLL);
    _table_removeStorageBlockIfPossible(*(void *)(v51 + 232), (uint64_t *)(v51 + 240), 0x17uLL, (uint64_t **)(v51 + 256));
  }
}

void NSISLinExpReplaceVarWithVar(unsigned __int16 *a1, unsigned int a2, unsigned int a3, double a4)
{
  double v8 = fabs(a4);
  if (v8 >= INFINITY && v8 <= INFINITY)
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "void NSISLinExpReplaceVarWithVar(NSISLinExp *, NSISLinExpVar, NSISLinExpVar, NSISFloat_t)"), @"NSISLinearExpression.m", 717, @"Invalid parameter not satisfying: %@", @"isfinite(coefficient)" file lineNumber description];
  }
  double v10 = 0.0;
  if (a4 == 0.0)
  {
    if (*(double *)&NSISEpsilon > 0.0) {
      goto LABEL_18;
    }
  }
  else if (v8 < *(double *)&NSISEpsilon)
  {
    goto LABEL_18;
  }
  double v10 = rint(a4);
  if (vabdd_f64(a4, v10) >= *(double *)&NSISEpsilon)
  {
    double v11 = rint(a4 * 8.0);
    double v12 = fabs(a4 * 8.0);
    if (vabdd_f64(v11, a4 * 8.0) >= *(double *)&NSISEpsilon * 8.0 || v12 == INFINITY) {
      double v10 = a4;
    }
    else {
      double v10 = v11 * 0.125;
    }
  }
LABEL_18:
  unint64_t v15 = vars_index(a1, a2);
  if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
    vars_remove_idx(a1, v15);
  }
  if (v10 == 0.0)
  {
    expression_shrink_if_possible((char *)a1);
  }
  else
  {
    int v17 = 0;
    vars_index_with_insert(a1, a3, 0, &v17);
    id v16 = v17;
    if (*v17 != 0.0)
    {
      NSLog(&cfstr_Nsislinearexpr_1.isa, *v17, "NSISLinExpReplaceVarWithVar", 735);
      id v16 = v17;
    }
    *id v16 = v10;
  }
}

uint64_t _chooseOutgoingRowHeadForIncomingRowHead(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v20[0] = 0;
  v20[1] = v20;
  void v20[2] = 0x2020000000;
  v20[3] = 0xFFEFFFFFFFFFFFFFLL;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  double v12 = ___chooseOutgoingRowHeadForIncomingRowHead_block_invoke;
  uint64_t v13 = &unk_1E5C571B0;
  uint64_t v16 = a1;
  uint64_t v17 = a2;
  char v19 = a4;
  unint64_t v14 = v20;
  unint64_t v15 = &v21;
  uint64_t v18 = a3;
  uint64_t v5 = (uint64_t **)(a2 + 8);
  for (unint64_t i = NSBitSetFindNext((uint64_t **)(a2 + 8), 0); i != 0x7FFFFFFFFFFFFFFFLL; unint64_t i = NSBitSetFindNext(v5, i + 1))
    v12((uint64_t)v11, a1, *(void *)(*(void *)(a1 + 232 + 40 * ((i >> 30) & 1)) + 8 * ((i & 0xBFFFFFFF) / 0x17))+ 88 * ((i & 0xBFFFFFFF) % 0x17));
  for (uint64_t j = NSBitSetFindNext((uint64_t **)(a2 + 24), 0);
        j != 0x7FFFFFFFFFFFFFFFLL;
        uint64_t j = NSBitSetFindNext((uint64_t **)(a2 + 24), j + 1))
  {
    v12((uint64_t)v11, a1, *(void *)(*(void *)(a1 + 232 + 40 * (((j + 0x40000000) >> 30) & 1))+ 8 * (((j + 0x40000000) & 0xBFFFFFFF) / 0x17uLL))+ 88 * (((j + 0x40000000) & 0xBFFFFFFF) % 0x17));
  }
  _Block_object_dispose(v20, 8);
  uint64_t v8 = *((unsigned __int8 *)v22 + 24);
  _Block_object_dispose(&v21, 8);
  return v8;
}

void sub_1A648F4C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void ___chooseOutgoingRowHeadForIncomingRowHead_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((*(unsigned char *)(*(void *)a3 + 24) & 6) != 0)
  {
    uint64_t v6 = a3 + 16;
    double v7 = NSISLinExpCoefficientForVar(a3 + 16, *(_DWORD *)(**(void **)(a1 + 56) + 16));
    if (v7 < 0.0)
    {
      double v8 = NSISLinExpConstant(v6) / v7;
      double v9 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      if (v8 > v9 || (v8 == v9 ? (BOOL v10 = *(unsigned char *)(a1 + 72) == 0) : (BOOL v10 = 1), !v10 && (rand() & 1) == 0))
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
        double v11 = *(void **)(a1 + 64);
        *double v11 = a2;
        v11[1] = a3;
      }
    }
  }
}

BOOL _NSConstraintBasedLayoutLogPivotCounts()
{
  return _NSGetBoolAppConfig(@"NSConstraintBasedLayoutLogPivotCounts", 0, (unsigned __int8 *)&sNSConstraintBasedLayoutLogPivotCountsComputedValue, _NSFalseAppConfigPredicate);
}

void sub_1A648FD70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double _row_remove(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = **(id **)a3;
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  unsigned int v26 = ___row_remove_block_invoke;
  unint64_t v27 = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  uint64_t v28 = a2;
  uint64_t v29 = a3;
  double v7 = (id *)(a3 + 16);
  if (*(unsigned char *)(a3 + 80))
  {
    id v8 = *v7;
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    uint64_t v32 = ___row_enumerateCols_block_invoke;
    unint64_t v33 = &unk_1E5C570C0;
    uint64_t v34 = a2;
    uint64_t v35 = &v24;
    -[NSISObjectiveLinearExpression enumerateVars:]((uint64_t)v8, (uint64_t)&v30);
  }
  else
  {
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    uint64_t v32 = ___row_enumerateCols_block_invoke_2;
    unint64_t v33 = &unk_1E5C570C0;
    uint64_t v34 = a2;
    uint64_t v35 = &v24;
    NSISLinExpEnumerateVars((unsigned __int16 *)(a3 + 16), (uint64_t)&v30);
  }
  objc_msgSend(*(id *)(a1 + 8), "removeObjectIdenticalTo:", v6, v24, v25, v26, v27, v28, v29);
  double v9 = *(id **)a3;
  if (*(unsigned char *)(a3 + 80))
  {

    *double v7 = 0;
  }
  else
  {
    NSISLinExpFree(a3 + 16);
  }
  unint64_t v10 = *(unsigned int *)(a3 + 8);
  uint64_t v11 = a1 + 40 * ((v10 >> 30) & 1);
  NSBitSetAddIndex((unsigned int *)(v11 + 256), v10 & 0xFFFFFFFFBFFFFFFFLL);
  _table_removeStorageBlockIfPossible(*(void *)(v11 + 232), (uint64_t *)(v11 + 240), 0x17uLL, (uint64_t **)(v11 + 256));
  uint64_t v12 = a1 + 312;
  unint64_t v13 = ((unint64_t)*((unsigned int *)v9 + 6) >> 3) & 3;
  unint64_t v14 = (unsigned int *)(a1 + 312 + 40 * v13 + 24);
  if (!NSBitSetCount((uint64_t)v14)) {
    _table_addStorageBlock((void **)(v12 + 40 * v13), (unint64_t *)(v12 + 40 * v13 + 8), (unint64_t *)(v12 + 40 * v13 + 16), 0x19uLL, 40, v14);
  }
  unint64_t Index = NSBitSetFirstIndex((uint64_t **)v14);
  int v16 = Index;
  NSBitSetRemoveIndex((uint64_t *)v14, Index);
  unsigned int v17 = v16 | (v13 << 30);
  uint64_t v18 = 40 * ((v17 >> 30) & 1);
  unint64_t v19 = (v17 & 0xBFFFFFFF) / 0x19uLL;
  unsigned int v20 = (v17 & 0xBFFFFFFF) % 0x19;
  uint64_t v21 = (id **)(*(void *)(*(void *)(v12 + v18) + 8 * v19) + 40 * v20);
  *uint64_t v21 = v9;
  v21[1] = 0;
  *(void *)&double result = 1;
  v21[2] = (id *)1;
  v21[3] = 0;
  v21[4] = (id *)1;
  uint64_t v23 = *(void *)(*(void *)(v12 + v18) + 8 * v19) + 40 * v20;
  LODWORD(v18) = v9[3] & 0xFFFFFFFE;
  *((_DWORD *)v9 + 5) = v17;
  *((_DWORD *)v9 + 6) = v18;
  v9[1] = (id)v23;
  return result;
}

uint64_t NSISSparseVectorMapForEach(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(unsigned int *)(result + 32);
  if (v2)
  {
    uint64_t v4 = result;
    uint64_t v5 = 0;
    for (unint64_t i = 0; i < v2; ++i)
    {
      if ((unint64_t)(*(void *)(*(void *)(v4 + 16) + v5) + 1) >= 2)
      {
        double result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
        unint64_t v2 = *(unsigned int *)(v4 + 32);
      }
      v5 += 24;
    }
  }
  return result;
}

uint64_t ___row_enumerateCols_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(v3 + 192) + 8 * (a2 >> 6));
  uint64_t v5 = v4 + 32 * (a2 & 0x3F);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t v9 = 32 * (a2 & 0x3F);
    unint64_t v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *(void *)(v4 + v9) file lineNumber description];
  }
  uint64_t v6 = *(void *)(v5 + 8);
  double v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v7(v2, v3, v6);
}

void ___objectiveRow_addWithHeadAndBody_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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

double _col_removeFromAllRows(uint64_t a1, uint64_t a2)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  uint64_t v12 = ___col_removeFromAllRows_block_invoke;
  unint64_t v13 = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  unsigned int v3 = (uint64_t **)(a2 + 8);
  uint64_t Next = NSBitSetFindNext((uint64_t **)(a2 + 8), 0);
  if (Next != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (unint64_t i = Next; i != 0x7FFFFFFFFFFFFFFFLL; unint64_t i = NSBitSetFindNext(v3, i + 1))
      v12((uint64_t)v11, a1, *(void *)(*(void *)(a1 + 232 + 40 * ((i >> 30) & 1)) + 8 * ((i & 0xBFFFFFFF) / 0x17))+ 88 * ((i & 0xBFFFFFFF) % 0x17));
  }
  uint64_t v6 = (uint64_t **)(a2 + 24);
  uint64_t v7 = NSBitSetFindNext((uint64_t **)(a2 + 24), 0);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t j = v7; j != 0x7FFFFFFFFFFFFFFFLL; uint64_t j = NSBitSetFindNext(v6, j + 1))
      v12((uint64_t)v11, a1, *(void *)(*(void *)(a1 + 232 + 40 * (((j + 0x40000000) >> 30) & 1))+ 8 * (((j + 0x40000000) & 0xBFFFFFFF) / 0x17uLL))+ 88 * (((j + 0x40000000) & 0xBFFFFFFF) % 0x17));
  }
  NSBitSetReset((uint64_t)v3);
  return NSBitSetReset((uint64_t)v6);
}

void ___col_removeFromAllRows_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  unint64_t v4 = (uint64_t *)(a3 + 16);
  if (*(unsigned char *)(a3 + 80)) {
    -[NSISObjectiveLinearExpression removeVar:](*v4, *(_DWORD *)(*(void *)v3 + 16));
  }
  else {
    NSISLinExpRemoveVar((unsigned __int16 *)v4, *(_DWORD *)(*(void *)v3 + 16));
  }
}

uint64_t NSISSparseVectorMapClearContents(uint64_t result)
{
  uint64_t v1 = *(unsigned int *)(result + 32);
  if (v1)
  {
    uint64_t v2 = *(void **)(result + 16);
    do
    {
      *uint64_t v2 = 0;
      v2 += 3;
      --v1;
    }
    while (v1);
  }
  *(void *)(result + 24) = 0;
  *(_DWORD *)(result + 8) = 0;
  return result;
}

double NSISSparseVectorClearContents(uint64_t a1)
{
  double result = NAN;
  *(void *)(a1 + 12) = 0xFFFFFFFF00000000;
  *(_WORD *)(a1 + 8) = 0;
  return result;
}

BOOL NSISLinExpEnumerateVarsUntil(unsigned __int16 *a1, uint64_t a2)
{
  uint64_t v3 = a1 + 8;
  if (*((void *)a1 + 2) == *MEMORY[0x1E4F1CFD0])
  {
    uint64_t v3 = (unsigned __int16 *)*((void *)a1 + 3);
    uint64_t v4 = *((void *)a1 + 4);
  }
  else
  {
    uint64_t v4 = *a1;
  }
  unint64_t v5 = *((unsigned int *)a1 + 1);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = &v3[4 * v4];
  if ((*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(unsigned int *)v6)) {
    return 1;
  }
  uint64_t v8 = 1;
  do
  {
    unint64_t v9 = v8;
    if (v5 == v8) {
      break;
    }
    int v10 = (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(unsigned int *)&v6[2 * v8]);
    uint64_t v8 = v9 + 1;
  }
  while (!v10);
  return v9 < v5;
}

uint64_t ___row_enumerateColsUntil_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 192) + 8 * (a2 >> 6));
  if (*(unsigned char *)(v3 + 32 * (a2 & 0x3F) + 24))
  {
    uint64_t v6 = 32 * (a2 & 0x3F);
    uint64_t v7 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *(void *)(v3 + v6) file lineNumber description];
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

uint64_t *NSBitSetRemoveIndexesInRange(uint64_t a1, NSUInteger a2, NSUInteger a3)
{
  double result = (uint64_t *)NSBitSetFindPrev((uint64_t **)a1, 0x7FFFFFFFFFFFFFFFuLL);
  if (result != (uint64_t *)0x7FFFFFFFFFFFFFFFLL)
  {
    v26.length = (NSUInteger)result + 1;
    v25.location = a2;
    v25.length = a3;
    v26.location = 0;
    NSRange v7 = NSIntersectionRange(v25, v26);
    double result = (uint64_t *)v7.location;
    if (v7.length)
    {
      if (v7.length == 1)
      {
        return NSBitSetRemoveIndex((uint64_t *)a1, v7.location);
      }
      else
      {
        NSUInteger v8 = v7.location >> 6;
        NSUInteger v9 = (v7.location + v7.length - 1) >> 6;
        uint64_t v10 = -1 << (LOBYTE(v7.location) + LOBYTE(v7.length));
        if (((v7.location + v7.length) & 0x3F) == 0) {
          uint64_t v10 = 0;
        }
        uint64_t v11 = (uint64_t *)a1;
        if (*(_DWORD *)(a1 + 8) >= 2u) {
          uint64_t v11 = *(uint64_t **)a1;
        }
        uint64_t v12 = ~(-1 << SLOBYTE(v7.location));
        if (v8 == v9)
        {
          int8x8_t v13 = (int8x8_t)(v11[v8] & (v10 | v12));
          uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v11[v8]);
          v14.i16[0] = vaddlv_u8(v14);
          v11[v8] = (uint64_t)v13;
          __int32 v15 = v14.i32[0];
          uint8x8_t v16 = (uint8x8_t)vcnt_s8(v13);
          v16.i16[0] = vaddlv_u8(v16);
          LODWORD(v17) = v16.i32[0] - v15;
        }
        else if (v8 > v9)
        {
          LODWORD(v17) = 0;
        }
        else
        {
          int v18 = 0;
          uint64_t v17 = 0;
          do
          {
            int8x8_t v19 = (int8x8_t)v11[(v8 + v18)];
            double result = (uint64_t *)(*(void *)&v19 & v12);
            uint8x8_t v20 = (uint8x8_t)vcnt_s8(v19);
            v20.i16[0] = vaddlv_u8(v20);
            uint64_t v21 = v17 - v20.u32[0];
            if (v8 - v9 + v18) {
              int8x8_t v22 = 0;
            }
            else {
              int8x8_t v22 = (int8x8_t)(*(void *)&v19 & v10);
            }
            if (!v18) {
              int8x8_t v22 = (int8x8_t)result;
            }
            v11[(v8 + v18)] = (uint64_t)v22;
            uint8x8_t v23 = (uint8x8_t)vcnt_s8(v22);
            v23.i16[0] = vaddlv_u8(v23);
            uint64_t v17 = v21 + v23.u32[0];
            ++v18;
          }
          while ((int)v8 + v18 <= v9);
        }
        *(_DWORD *)(a1 + 12) += v17;
      }
    }
  }
  return result;
}

unint64_t NSBitSetFindPrev(uint64_t **a1, unint64_t a2)
{
  if ((a2 & 0x8000000000000000) != 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v2 = *((unsigned int *)a1 + 2);
  unint64_t v3 = (v2 << 6) - 1 >= a2 ? a2 : (v2 << 6) - 1;
  unint64_t v4 = v3 >> 6;
  if (v2 >= 2) {
    a1 = (uint64_t **)*a1;
  }
  if ((v4 & 0x80000000) != 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  LOBYTE(v5) = ~(_BYTE)v3 & 0x3F;
  LODWORD(v4) = v4 + 1;
  while (1)
  {
    unint64_t v4 = (v4 - 1);
    unint64_t v5 = (unint64_t)a1[v4] & (0xFFFFFFFFFFFFFFFFLL >> v5);
    if (v5) {
      break;
    }
    if ((int)v4 <= 0) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return (__clz(v5) | (v4 << 6)) ^ 0x3F;
}

void NSISLinExpFree(uint64_t a1)
{
  if (*(void *)(a1 + 16) == *MEMORY[0x1E4F1CFD0]) {
    free(*(void **)(a1 + 24));
  }
}

uint64_t NSBitSetRemoveIndexes(uint64_t result, uint64_t *a2)
{
  unsigned int v2 = *(_DWORD *)(result + 8);
  unsigned int v3 = *((_DWORD *)a2 + 2);
  if (v2 >= v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = v2;
  }
  if ((int)v4 < 1)
  {
    __int32 v6 = 0;
  }
  else
  {
    uint64_t v5 = 0;
    __int32 v6 = 0;
    do
    {
      NSRange v7 = a2;
      if (v3 >= 2) {
        NSRange v7 = (uint64_t *)*a2;
      }
      uint64_t v8 = ~v7[v5];
      if (v2 <= 1)
      {
        int8x8_t v11 = (int8x8_t)(*(void *)(result + 8 * v5) & v8);
        uint8x8_t v12 = (uint8x8_t)vcnt_s8(*(int8x8_t *)(result + 8 * v5));
        v12.i16[0] = vaddlv_u8(v12);
        __int32 v10 = v12.i32[0];
        *(int8x8_t *)(result + 8 * v5) = v11;
      }
      else
      {
        uint8x8_t v9 = (uint8x8_t)vcnt_s8(*(int8x8_t *)(*(void *)result + 8 * v5));
        v9.i16[0] = vaddlv_u8(v9);
        __int32 v10 = v9.i32[0];
        *(void *)(*(void *)result + 8 * v5) &= v8;
        int8x8_t v11 = *(int8x8_t *)(*(void *)result + 8 * v5);
      }
      uint8x8_t v13 = (uint8x8_t)vcnt_s8(v11);
      v13.i16[0] = vaddlv_u8(v13);
      __int32 v6 = v6 - v10 + v13.i32[0];
      ++v5;
    }
    while (v4 != v5);
  }
  *(_DWORD *)(result + 12) += v6;
  return result;
}

BOOL NSISLinExpIsConstant(uint64_t a1)
{
  return *(_DWORD *)(a1 + 4) == 0;
}

void *__isMaps_block_invoke()
{
  double result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
  if (result) {
    double result = (void *)[result isEqualToString:@"com.apple.Maps"];
  }
  isMaps_isMaps = (char)result;
  return result;
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  va_start(va, firstValue);
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:commaSeparatedKeysString];
  uint64_t v6 = _NSFaultInObject();
  uint64_t v7 = _NSFaultInObject();
  while (1)
  {
    v23[0] = 0;
    [v5 scanUpToCharactersFromSet:v7 intoString:0];
    [v5 scanUpToCharactersFromSet:v6 intoString:v23];
    if (!v23[0]) {
      break;
    }
    objc_msgSend(v4, "addObject:");
  }

  uint64_t v8 = [v4 count];
  unint64_t v9 = MEMORY[0x1F4188790]();
  int8x8_t v11 = (uint64_t *)((char *)&v21 - v10);
  if (v9 >= 0x101) {
    int8x8_t v11 = malloc_type_malloc(8 * v8, 0x400A2AC0F1uLL);
  }
  if (v8 >= 1)
  {
    va_copy(v22, va);
    *int8x8_t v11 = firstValue;
    if (firstValue) {
      uint64_t v12 = -1;
    }
    else {
      uint64_t v12 = 0;
    }
    if (v8 != 1)
    {
      for (uint64_t i = 1; i != v8; ++i)
      {
        uint8x8_t v14 = v22;
        v22 += 8;
        uint64_t v15 = *v14;
        v11[i] = v15;
        if (v12 == -1 && v15 == 0) {
          uint64_t v12 = i;
        }
      }
    }
    if (v12 != -1)
    {
      uint64_t v20 = [NSString stringWithFormat:@"NSDictionaryOfVariableBindings failed because either one of the values is nil, or there's something wrong with the way the macro is being invoked.  Cannot assign value nil for key \"%@\". Keys:%@", objc_msgSend(v4, "objectAtIndex:"), v4];
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v20 userInfo:0]);
    }
  }
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v11 count:v8];
  int v18 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionaryWithObjects:v17 forKeys:v4];

  if ((unint64_t)v8 >= 0x101) {
    free(v11);
  }
  return v18;
}

void sub_1A6491784(_Unwind_Exception *a1)
{
}

void sub_1A64917A4(void *a1)
{
}

void _CALSDKVersionInit()
{
  if (_CALSDKVersionInit_init_once != -1) {
    dispatch_once(&_CALSDKVersionInit_init_once, &__block_literal_global);
  }
}

void NSISSparseVectorMapDestroy(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 24))
  {
    unint64_t v2 = *(unsigned int *)(a1 + 32);
    if (v2)
    {
      uint64_t v3 = 0;
      for (unint64_t i = 0; i < v2; ++i)
      {
        uint64_t v5 = (void **)(*(void *)(a1 + 16) + v3);
        if ((unint64_t)*v5 + 1 >= 2)
        {
          NSISSparseVectorMinHeapDestroy(v5);
          unint64_t v2 = *(unsigned int *)(a1 + 32);
        }
        v3 += 24;
      }
    }
  }
  free(*(void **)(a1 + 16));
  NSISSparseVectorMinHeapDestroy((void **)a1);
}

void NSISObjectTableDestroy(void **a1)
{
  if (a1)
  {
    NSISObjectTableForEach((uint64_t)a1, (uint64_t)&__block_literal_global_1);
    free(*a1);
    free(a1);
  }
}

uint64_t NSISObjectTableForEach(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v2 = result;
    unint64_t v3 = *(unsigned int *)(result + 16);
    if (v3)
    {
      uint64_t v5 = 0;
      for (unint64_t i = 0; i < v3; ++i)
      {
        if ((unint64_t)(*(void *)(*(void *)v2 + v5 + 8) + 1) >= 2)
        {
          double result = (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(*(void *)v2 + v5));
          unint64_t v3 = *(unsigned int *)(v2 + 16);
        }
        v5 += 16;
      }
    }
  }
  return result;
}

void __NSISObjectTableDestroy_block_invoke(int a1, id a2, void *a3)
{
}

void NSBitSetAddIndexesInRange(unsigned int *a1, unint64_t a2, uint64_t a3)
{
  if (a3)
  {
    char v3 = a2;
    if (a3 == 1)
    {
      NSBitSetAddIndex(a1, a2);
    }
    else
    {
      unint64_t v5 = a2 >> 6;
      char v6 = a2 + a3;
      unint64_t v7 = a2 + a3 - 1;
      unint64_t v8 = v7 >> 6;
      unsigned int v9 = a1[2];
      if (v9 <= (v7 >> 6))
      {
        _NSBitSetResize(a1, v7 >> 6);
        unsigned int v9 = a1[2];
      }
      if ((v6 & 0x3F) != 0) {
        uint64_t v10 = ~(-1 << v6);
      }
      else {
        uint64_t v10 = -1;
      }
      int8x8_t v11 = a1;
      if (v9 >= 2) {
        int8x8_t v11 = *(unsigned int **)a1;
      }
      uint64_t v12 = -1 << v3;
      if (v5 == v8)
      {
        int8x8_t v13 = (int8x8_t)(*(void *)&v11[2 * v5] | v10 & v12);
        uint8x8_t v14 = (uint8x8_t)vcnt_s8(*(int8x8_t *)&v11[2 * v5]);
        v14.i16[0] = vaddlv_u8(v14);
        *(int8x8_t *)&v11[2 * v5] = v13;
        __int32 v15 = v14.i32[0];
        uint8x8_t v16 = (uint8x8_t)vcnt_s8(v13);
        v16.i16[0] = vaddlv_u8(v16);
        LODWORD(v17) = v16.i32[0] - v15;
      }
      else if (v5 > v8)
      {
        LODWORD(v17) = 0;
      }
      else
      {
        int v18 = 0;
        uint64_t v17 = 0;
        do
        {
          int8x8_t v19 = *(int8x8_t *)&v11[2 * (v5 + v18)];
          uint64_t v20 = *(void *)&v19 | v12;
          uint8x8_t v21 = (uint8x8_t)vcnt_s8(v19);
          v21.i16[0] = vaddlv_u8(v21);
          uint64_t v22 = v17 - v21.u32[0];
          if (v5 - v8 + v18) {
            int8x8_t v23 = (int8x8_t)-1;
          }
          else {
            int8x8_t v23 = (int8x8_t)(*(void *)&v19 | v10);
          }
          if (!v18) {
            int8x8_t v23 = (int8x8_t)v20;
          }
          *(int8x8_t *)&v11[2 * (v5 + v18)] = v23;
          uint8x8_t v24 = (uint8x8_t)vcnt_s8(v23);
          v24.i16[0] = vaddlv_u8(v24);
          uint64_t v17 = v22 + v24.u32[0];
          ++v18;
        }
        while ((int)v5 + v18 <= v8);
      }
      a1[3] += v17;
    }
  }
}

void _table_addStorageBlock(void **a1, unint64_t *a2, unint64_t *a3, unint64_t a4, uint64_t a5, unsigned int *a6)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v10 = *a2;
  unint64_t v11 = *a2 + 1;
  *a2 = v11;
  unint64_t v12 = *a3;
  if (v11 <= *a3) {
    goto LABEL_5;
  }
  unint64_t v13 = 0x100 / a4;
  if (0x100 / a4 <= 2 * v12) {
    unint64_t v13 = 2 * v12;
  }
  *a3 = v13;
  uint8x8_t v14 = malloc_type_realloc(*a1, 8 * v13, 0xA2040E1869066uLL);
  *a1 = v14;
  if (v14)
  {
LABEL_5:
    *((void *)*a1 + v10) = malloc_type_malloc(a5 * a4, 0x8FD56ACuLL);
    if (!*((void *)*a1 + v10)) {
      _table_addStorageBlock_cold_1(&v15, &v16);
    }
    NSBitSetAddIndexesInRange(a6, v10 * a4, a4);
  }
  else
  {
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
}

void _NSBitSetResize(unsigned int *a1, unsigned int a2)
{
  uint64_t v3 = a1[2];
  unsigned int v4 = a1[2];
  do
  {
    unsigned int v5 = v4;
    v4 *= 4;
  }
  while (v5 <= a2);
  if (v5 != v3)
  {
    if (v3 < 2)
    {
      unint64_t v8 = (char *)malloc_type_calloc(v5, 8uLL, 0x100004000313F17uLL);
      if (!v8)
      {
        uint8x8_t v14 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void _NSBitSetResize(NSBitSet *, uint32_t)"), @"NSBitSet.m", 96, @"Memory exhaustion. Attempted to allocate storage for %zu bits.", (unint64_t)v5 << 6);
      }
      unsigned int v9 = (int8x8_t *)a1;
      if (a1[2] >= 2) {
        unsigned int v9 = *(int8x8_t **)a1;
      }
      memcpy(v8, v9, 8 * v3);
    }
    else
    {
      char v6 = *(int8x8_t **)a1;
      uint64_t v7 = v5;
      unint64_t v8 = (char *)malloc_type_realloc(*(void **)a1, 8 * v5, 0x100004000313F17uLL);
      if (!v8)
      {
        unint64_t v13 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void _NSBitSetResize(NSBitSet *, uint32_t)"), @"NSBitSet.m", 84, @"Memory exhaustion. Attempted to grow storage from %zu to %zu bits.", v3 << 6, (unint64_t)v5 << 6);
      }
      if (v5 <= v3)
      {
        unsigned int v10 = 0;
        do
        {
          int8x8_t v11 = *v6++;
          uint8x8_t v12 = (uint8x8_t)vcnt_s8(v11);
          v12.i16[0] = vaddlv_u8(v12);
          v10 += v12.i32[0];
          --v7;
        }
        while (v7);
        a1[3] = v10;
      }
      else
      {
        bzero(&v8[8 * v3], 8 * (int)(v5 - v3));
      }
    }
    *(void *)a1 = v8;
    a1[2] = v5;
  }
}

BOOL _NSConstraintBasedLayoutAllowUnoptimizedReads()
{
  return _NSGetBoolAppConfig(@"NSConstraintBasedLayoutAllowUnoptimizedReads", 0, (unsigned __int8 *)&sNSConstraintBasedLayoutAllowUnoptimizedReadsComputedValue, _NSFalseAppConfigPredicate);
}

double NSISObjectTableCreate()
{
  v0 = malloc_type_malloc(0x18uLL, 0x102004024DAA5DEuLL);
  double result = *(double *)&cleared_object_table;
  *(_OWORD *)v0 = cleared_object_table;
  v0[2] = 0x500000000;
  return result;
}

void *NSISSparseVectorMinHeapInit(void *result)
{
  *double result = 0;
  result[1] = 0;
  return result;
}

void *NSISSparseVectorMapInit(void *result)
{
  *(_OWORD *)double result = 0u;
  *((_OWORD *)result + 1) = 0u;
  result[4] = 0x500000000;
  return NSISSparseVectorMinHeapInit(result);
}

uint64_t NSISObjectTableDelete(int32x2_t *a1, unint64_t a2)
{
  unint64_t v2 = a1[2].u32[0];
  if (a1[1].i32[0]) {
    BOOL v3 = v2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    unint64_t v7 = 73244475 * ((73244475 * (a2 ^ (a2 >> 16))) ^ ((73244475 * (a2 ^ (a2 >> 16))) >> 16));
    unsigned int v8 = (v7 ^ (v7 >> 16)) % v2;
    __int32 v9 = a1[2].i32[0];
    while (1)
    {
      unsigned int v10 = (void *)(*(void *)a1 + 16 * v8);
      uint64_t v4 = v10[1];
      if (!v4) {
        return v4;
      }
      if (v4 != -1 && *v10 == a2) {
        break;
      }
      if (v8 + 1 < v2) {
        ++v8;
      }
      else {
        unsigned int v8 = 0;
      }
      if (!--v9) {
        return 0;
      }
    }
    if (v8 == -1) {
      return 0;
    }
    void *v10 = 0;
    v10[1] = -1;
    int32x2_t v12 = vadd_s32(a1[1], (int32x2_t)0x1FFFFFFFFLL);
    a1[1] = v12;
    unint64_t v13 = (void *)*a1;
    if (v8 + 1 < v2) {
      unsigned int v14 = v8 + 1;
    }
    else {
      unsigned int v14 = 0;
    }
    if (v13[2 * v14 + 1])
    {
      unsigned int v15 = v12.i32[0];
      if (v12.i32[0])
      {
LABEL_23:
        unsigned int v16 = a1[2].u32[0];
        if (v16 >= 0x40 && v15 < v16 >> 3) {
          object_table_rehash((uint64_t)a1, -1);
        }
        goto LABEL_31;
      }
    }
    else
    {
      do
      {
        --a1[1].i32[1];
        uint64_t v17 = &v13[2 * v8];
        if (!v8) {
          unsigned int v8 = v2;
        }
        --v8;
        void *v17 = 0;
        v17[1] = 0;
        unint64_t v13 = (void *)*a1;
      }
      while (*(void *)(*(void *)a1 + 16 * v8 + 8) == -1);
      unsigned int v15 = a1[1].u32[0];
      if (v15) {
        goto LABEL_23;
      }
    }
    free(v13);
    *(_OWORD *)a1->i8 = cleared_object_table;
    a1[2] = (int32x2_t)0x500000000;
LABEL_31:

    return v4;
  }
  return 0;
}

void NSISObjectTableInsert(_DWORD *a1, void *a2, void *a3)
{
  if (a1)
  {
    unsigned int v6 = a1[2];
    int v7 = a1[3];
    if (v7 + v6 >= (3 * a1[4]) >> 2) {
      object_table_rehash((uint64_t)a1, v6 >= 4 * v7);
    }
    unsigned int v8 = (void *)object_table_insert_and_return_old_value_if_replaced((uint64_t)a1, (unint64_t)a2, (unint64_t)a3);
    id v9 = a3;
    if (v8)
    {
    }
    else
    {
      id v10 = a2;
    }
  }
}

void object_table_rehash(uint64_t a1, int a2)
{
  if (a1)
  {
    BOOL v3 = *(unint64_t **)a1;
    uint64_t v4 = *(unsigned int *)(a1 + 16);
    if (a2 == -1)
    {
      unsigned int v7 = *(_DWORD *)(a1 + 20);
      if (v7 >= 6) {
        *(_DWORD *)(a1 + 20) = --v7;
      }
      int v8 = 1 << v7;
      int v9 = v8 - 1;
      unsigned int v10 = v8 - ((v8 - 1) & (v4 >> 1));
      if ((v9 & (v4 >> 1)) == 0) {
        unsigned int v10 = 0;
      }
      unsigned int v5 = v10 + (v4 >> 1);
      *(_DWORD *)(a1 + 16) = v5;
    }
    else
    {
      unsigned int v5 = *(_DWORD *)(a1 + 16);
      if (a2 == 1)
      {
        int v6 = *(_DWORD *)(a1 + 20);
        unsigned int v5 = v4 + (1 << v6);
        *(_DWORD *)(a1 + 16) = v5;
        if (v5 == 8 << v6) {
          *(_DWORD *)(a1 + 20) = v6 + 1;
        }
      }
    }
    *(void *)(a1 + 8) = 0;
    *(void *)a1 = malloc_type_calloc(v5, 0x10uLL, 0x80040803F642BuLL);
    if (v4)
    {
      int8x8_t v11 = v3 + 1;
      do
      {
        if (*v11 + 1 >= 2) {
          object_table_insert_and_return_old_value_if_replaced(a1, *(v11 - 1), *v11);
        }
        v11 += 2;
        --v4;
      }
      while (v4);
    }
    free(v3);
  }
}

unint64_t object_table_insert_and_return_old_value_if_replaced(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v6 = *(unsigned int *)(a1 + 16);
  unint64_t v7 = 73244475 * ((73244475 * (a2 ^ (a2 >> 16))) ^ ((73244475 * (a2 ^ (a2 >> 16))) >> 16));
  unsigned int v8 = (v7 ^ (v7 >> 16)) % v6;
  while (1)
  {
    int v9 = (unint64_t *)(*(void *)a1 + 16 * v8);
    unint64_t v10 = v9[1];
    if (!v10) {
      break;
    }
    if (v10 == -1)
    {
      --*(_DWORD *)(a1 + 12);
      break;
    }
    uint64_t v11 = v8;
    if ([(id)a2 isEqual:*v9])
    {
      int32x2_t v12 = (unint64_t *)(*(void *)a1 + 16 * v11);
      *int32x2_t v12 = a2;
      v12[1] = a3;
      return v10;
    }
    if ((int)v11 + 1 < v6) {
      unsigned int v8 = v11 + 1;
    }
    else {
      unsigned int v8 = 0;
    }
  }
  *int v9 = a2;
  v9[1] = a3;
  unint64_t v10 = 0;
  ++*(_DWORD *)(a1 + 8);
  return v10;
}

void sub_1A64961E8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Unwind_Resume(a1);
}

void *_mutuallyExclusiveConstraintsForUnsatisfiableRow(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___mutuallyExclusiveConstraintsForUnsatisfiableRow_block_invoke;
  v9[3] = &unk_1E5C56DA0;
  v9[4] = v4;
  unsigned int v5 = (unsigned __int16 *)(a2 + 16);
  if (*(unsigned char *)(a2 + 80))
  {
    uint64_t v6 = *(void *)v5;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    int32x2_t v12 = ___row_enumerateCols_block_invoke;
    unint64_t v13 = &unk_1E5C570C0;
    uint64_t v14 = a1;
    unsigned int v15 = v9;
    -[NSISObjectiveLinearExpression enumerateVars:](v6, (uint64_t)&v10);
  }
  else
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    int32x2_t v12 = ___row_enumerateCols_block_invoke_2;
    unint64_t v13 = &unk_1E5C570C0;
    uint64_t v14 = a1;
    unsigned int v15 = v9;
    NSISLinExpEnumerateVars(v5, (uint64_t)&v10);
  }
  uint64_t v7 = [**(id **)a2 markedConstraint];
  if (v7) {
    [v4 addObject:v7];
  }
  return v4;
}

void NSISLinExpAddVarWithProcessors(unsigned __int16 *a1, unsigned int a2, uint64_t a3, uint64_t a4, double a5)
{
  double v10 = fabs(a5);
  if (v10 >= INFINITY && v10 <= INFINITY)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "void NSISLinExpAddVarWithProcessors(NSISLinExp *, NSISLinExpVar, NSISFloat_t, void (^)(NSISLinExpVar), void (^)(NSISLinExpVar))"), @"NSISLinearExpression.m", 797, @"Invalid parameter not satisfying: %@", @"isfinite(coeff)" file lineNumber description];
  }
  if (a5 == 0.0)
  {
    if (*(double *)&NSISEpsilon > 0.0) {
      goto LABEL_23;
    }
  }
  else if (v10 < *(double *)&NSISEpsilon)
  {
    goto LABEL_23;
  }
  char v19 = 0;
  int v18 = 0;
  unint64_t v12 = vars_index_with_insert(a1, a2, &v19, &v18);
  double v13 = *v18;
  if (COERCE_UNSIGNED_INT64(-a5) >> 63 == *(void *)v18 >> 63)
  {
    double v14 = 0.0;
    if (vabdd_f64(-a5, v13) <= *(double *)&NSISEpsilon) {
      goto LABEL_14;
    }
    uint64_t v15 = COERCE__INT64(-a5) - *(void *)v18;
    if (v15 < 0) {
      uint64_t v15 = *(void *)v18 - COERCE__INT64(-a5);
    }
    if (v15 <= NSISMaxUlps) {
      goto LABEL_14;
    }
  }
  double v14 = v13 + a5;
  if (v13 + a5 == 0.0) {
LABEL_14:
  }
    BOOL v16 = *(double *)&NSISEpsilon > 0.0;
  else {
    BOOL v16 = fabs(v14) < *(double *)&NSISEpsilon;
  }
  if (v16) {
    double v17 = 0.0;
  }
  else {
    double v17 = v14;
  }
  double *v18 = v17;
  if (v19) {
    (*(void (**)(uint64_t, void))(a3 + 16))(a3, a2);
  }
  if (v17 == 0.0)
  {
    vars_remove_idx(a1, v12);
    (*(void (**)(uint64_t, void))(a4 + 16))(a4, a2);
  }
LABEL_23:
  expression_shrink_if_possible((char *)a1);
}

uint64_t ___row_rawReplaceColWithColPlusDeltaTimesNewCol_block_invoke_3(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(v3 + 192) + 8 * (a2 >> 6));
  uint64_t v5 = v4 + 32 * (a2 & 0x3F);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t v9 = 32 * (a2 & 0x3F);
    double v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *(void *)(v4 + v9) file lineNumber description];
  }
  uint64_t v6 = *(void *)(v5 + 8);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v7(v2, v3, v6);
}

void NSISLinExpReplaceVarWithVarPlusDeltaTimesNewVar(unsigned __int16 *a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, double a6)
{
  double v10 = NSISLinExpCoefficientForVar((uint64_t)a1, a2) * a6;
  NSISLinExpAddVarWithProcessors(a1, a3, a4, a5, v10);
}

uint64_t ___row_rawReplaceColWithColPlusDeltaTimesNewCol_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(v3 + 192) + 8 * (a2 >> 6));
  uint64_t v5 = v4 + 32 * (a2 & 0x3F);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t v9 = 32 * (a2 & 0x3F);
    double v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *(void *)(v4 + v9) file lineNumber description];
  }
  uint64_t v6 = *(void *)(v5 + 8);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v7(v2, v3, v6);
}

uint64_t ___row_rawAddCol_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(v3 + 192) + 8 * (a2 >> 6));
  uint64_t v5 = v4 + 32 * (a2 & 0x3F);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t v9 = 32 * (a2 & 0x3F);
    double v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *(void *)(v4 + v9) file lineNumber description];
  }
  uint64_t v6 = *(void *)(v5 + 8);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v7(v2, v3, v6);
}

void ___row_addColWithCoefficient_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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

void ConstraintDidPerformInitialSetup(uint64_t a1)
{
  unint64_t v2 = *(_DWORD *)(a1 + 66) & 0xFFFFFFBF | ((unint64_t)*(unsigned __int16 *)(a1 + 70) << 32);
  *(_DWORD *)(a1 + 66) &= ~0x40u;
  *(_WORD *)(a1 + 70) = WORD2(v2);
  if (_NSConstraintBasedLayoutTrackAllocation())
  {
    unsigned int v3 = (void *)[MEMORY[0x1E4F29060] callStackSymbols];
    objc_setAssociatedObject((id)a1, @"kSavedConstraintAllocationStackKey", v3, (void *)0x303);
  }
}

BOOL _NSConstraintBasedLayoutTrackAllocation()
{
  return _NSGetBoolAppConfig(@"NSConstraintBasedLayoutTrackAllocation", 0, (unsigned __int8 *)&sNSConstraintBasedLayoutTrackAllocationComputedValue, _NSFalseAppConfigPredicate);
}

uint64_t ResolveConstraintArguments(void **a1, uint64_t *a2, void **a3, uint64_t *a4, double a5)
{
  if (ResolveConstraintArguments_once != -1) {
    dispatch_once(&ResolveConstraintArguments_once, &__block_literal_global_786);
  }
  double v10 = *a1;
  uint64_t v11 = *a2;
  unint64_t v12 = *a3;
  uint64_t v13 = *a4;
  if (objc_opt_respondsToSelector())
  {
    int v14 = 1;
  }
  else if (objc_opt_respondsToSelector())
  {
    int v14 = objc_msgSend(v10, "nsli_isLegalConstraintItem");
  }
  else
  {
    int v14 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t result = 1;
  }
  else if (objc_opt_respondsToSelector())
  {
    uint64_t result = objc_msgSend(v12, "nsli_isLegalConstraintItem");
  }
  else
  {
    uint64_t result = 0;
  }
  BOOL v17 = a5 != 0.0 && v12 != 0;
  if (v10 && v11 <= 0x25 && ((1 << v11) & 0x3F00000001) != 0
    || v12 && v13 <= 0x25 && ((1 << v13) & 0x3F00000001) != 0)
  {
    unint64_t v27 = NSString;
    uint64_t v30 = [NSString stringWithFormat:@"NSLayoutConstraint for %@", v10];
    NSRange v26 = @"%@: Unknown layout attribute";
    goto LABEL_63;
  }
  if (!v10)
  {
    uint64_t v28 = [NSString stringWithFormat:@"%@: Constraint must contain a first layout item", objc_msgSend(NSString, "stringWithFormat:", @"NSLayoutConstraint for %@", 0)];
    goto LABEL_65;
  }
  if (v12) {
    int v18 = result;
  }
  else {
    int v18 = 1;
  }
  if ((v14 & v18 & 1) == 0)
  {
    unint64_t v27 = NSString;
    uint64_t v30 = [NSString stringWithFormat:@"NSLayoutConstraint for %@", v10];
    NSRange v26 = @"%@: Constraint items must each be a view or layout guide.";
    goto LABEL_63;
  }
  if (v11 > 0x25 || ((1 << v11) & 0x3F00000181) == 0)
  {
    int v20 = ResolveConstraintArguments_newExceptionBehaviorLocationToConstant;
    if (!ResolveConstraintArguments_newExceptionBehaviorLocationToConstant) {
      BOOL v17 = 1;
    }
    if (v17)
    {
      char v21 = 0;
      char v19 = 1;
      goto LABEL_33;
    }
    unint64_t v27 = NSString;
    uint64_t v30 = [NSString stringWithFormat:@"NSLayoutConstraint for %@", v10];
    NSRange v26 = @"%@: A multiplier of 0 or a nil second item together with a location for the first attribute creates an illegal constraint of a location equal to a constant. Location attributes must be specified in pairs.";
LABEL_63:
    uint64_t v29 = v27;
LABEL_64:
    uint64_t v28 = objc_msgSend(v29, "stringWithFormat:", v26, v30);
LABEL_65:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v28 userInfo:0]);
  }
  char v19 = 0;
  int v20 = ResolveConstraintArguments_newExceptionBehaviorLocationToConstant;
  char v21 = 1;
LABEL_33:
  if (v13 <= 0x25 && ((1 << v13) & 0x3F00000181) != 0)
  {
    if ((v19 & 1) == 0) {
      goto LABEL_36;
    }
LABEL_53:
    if (v20) {
      char v23 = 1;
    }
    else {
      char v23 = v21;
    }
    uint8x8_t v24 = NSString;
    uint64_t v25 = [NSString stringWithFormat:@"NSLayoutConstraint for %@", v10];
    if ((v23 & 1) != 0 || v12)
    {
      uint64_t v30 = v25;
      NSRange v26 = @"%@: Invalid pairing of layout attributes.";
    }
    else
    {
      uint64_t v30 = v25;
      NSRange v26 = @"%@: A constraint cannot be made that sets a location equal to a constant. Location attributes must be specified in pairs.";
    }
    uint64_t v29 = v24;
    goto LABEL_64;
  }
  if ((v19 & 1) == 0) {
    goto LABEL_53;
  }
LABEL_36:
  if (!ResolveConstraintArguments_newExceptionBehaviorLanguageDirectionDependentToAbsolute) {
    return result;
  }
  if (v11 <= 0x12 && ((1 << v11) & 0x60060) != 0)
  {
    if (v13 > 0x12) {
      return result;
    }
    int v22 = 1 << v13;
    if (((1 << v13) & 0x60060) == 0)
    {
LABEL_46:
      if ((v22 & 0x6006) == 0) {
        return result;
      }
      unint64_t v27 = NSString;
      uint64_t v30 = [NSString stringWithFormat:@"NSLayoutConstraint for %@", v10];
      NSRange v26 = @"%@: A constraint cannot be made between a leading/trailing attribute and a right/left attribute. Use leading/trailing for both or neither.";
      goto LABEL_63;
    }
LABEL_44:
    if (v11 > 0xE) {
      return result;
    }
    int v22 = 1 << v11;
    goto LABEL_46;
  }
  if (v13 <= 0x12 && ((1 << v13) & 0x60060) != 0) {
    goto LABEL_44;
  }
  return result;
}

uint64_t _AnchorClassForAttribute(uint64_t a1)
{
  switch((int)a1)
  {
    case 0:
      unint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class _AnchorClassForAttribute(NSLayoutAttribute)"), @"NSLayoutAnchor.m", 527, @"ERROR: NSLayoutAnchors cannot be created with proxy attribute %ld", a1);
      uint64_t result = 0;
      break;
    default:
      uint64_t result = objc_opt_class();
      break;
  }
  return result;
}

uint64_t NSISLinExpReplaceVarWithVarPlusDelta(uint64_t a1, unsigned int a2, double a3)
{
  double v4 = NSISLinExpCoefficientForVar(a1, a2) * a3;
  return NSISLinExpIncrementConstant(a1, v4);
}

uint64_t ___mutuallyExclusiveConstraintsForUnsatisfiableRow_block_invoke(uint64_t a1, uint64_t a2, id **a3)
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

void sub_1A649ACE0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 216), 8);
  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t NSBitSetContainsIndex(uint64_t *a1, unint64_t a2)
{
  unsigned int v2 = *((_DWORD *)a1 + 2);
  if (v2 <= (a2 >> 6)) {
    return 0;
  }
  if (v2 >= 2) {
    a1 = (uint64_t *)*a1;
  }
  return ((unint64_t)a1[(a2 >> 6)] >> a2) & 1;
}

uint64_t _col_enumerateRowsUntil(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (uint64_t **)(a2 + 8);
  uint64_t Next = NSBitSetFindNext((uint64_t **)(a2 + 8), 0);
  if (Next == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    uint64_t v8 = NSBitSetFindNext((uint64_t **)(a2 + 24), 0);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      for (uint64_t i = v8; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = NSBitSetFindNext((uint64_t **)(a2 + 24), i + 1))
      {
        uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, *(void *)(*(void *)(a1 + 232 + 40 * (((i + 0x40000000) >> 30) & 1))+ 8 * (((i + 0x40000000) & 0xBFFFFFFF) / 0x17uLL))+ 88 * (((i + 0x40000000) & 0xBFFFFFFF) % 0x17));
        if (v9) {
          break;
        }
      }
    }
  }
  else
  {
    unint64_t v7 = Next;
    while (((*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(a3 + 16))(a3, a1, *(void *)(*(void *)(a1 + 232 + 40 * ((v7 >> 30) & 1)) + 8 * ((v7 & 0xBFFFFFFF) / 0x17))+ 88 * ((v7 & 0xBFFFFFFF) % 0x17)) & 1) == 0)
    {
      unint64_t v7 = NSBitSetFindNext(v5, v7 + 1);
      if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_5;
      }
    }
    return 1;
  }
  return v9;
}

unsigned __int16 *_objectiveRow_addRowBodyWithPriorityTimes(uint64_t a1, uint64_t a2, double a3, double a4, uint64_t a5, uint64_t a6)
{
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = ___objectiveRow_addRowBodyWithPriorityTimes_block_invoke;
  v15[3] = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  v15[4] = a1;
  v15[5] = a2;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = ___objectiveRow_addRowBodyWithPriorityTimes_block_invoke_2;
  v14[3] = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  v14[4] = a1;
  v14[5] = a2;
  if ((*(unsigned char *)(a2 + 80) & 1) == 0)
  {
    uint64_t v13 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISObjectiveLinearExpression *_objectiveRow_rawBody(NSISRow)"), @"NSISEngine_Row.h", 418, @"Tried accessing the objective linear expression for regular row:%@", _row_description(a1, a2) file lineNumber description];
  }
  uint64_t v11 = *(unsigned __int16 **)(a2 + 16);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = ___objectiveRow_rawAddRowBody_block_invoke;
  v17[3] = &unk_1E5C570C0;
  v17[4] = a1;
  v17[5] = v15;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = ___objectiveRow_rawAddRowBody_block_invoke_2;
  v16[3] = &unk_1E5C570C0;
  v16[4] = a1;
  v16[5] = v14;
  return -[NSISObjectiveLinearExpression addExpression:priority:times:processVarNewToReceiver:processVarDroppedFromReceiver:](v11, (unsigned __int16 *)(a6 + 16), (uint64_t)v17, (uint64_t)v16, a3, a4);
}

uint64_t _ResolvedDirectionForAnchorAbstractionsForAnchorsInLayoutDirectionContext(void *a1, void *a2, unsigned int a3, void *a4, double *a5)
{
  if (objc_opt_respondsToSelector())
  {
    int v10 = objc_msgSend(a4, "nsli_isRTL");
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v10)
      {
        double v11 = 1.0;
        uint64_t result = 1;
        goto LABEL_32;
      }
      goto LABEL_31;
    }
  }
  else
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_31;
    }
    int v10 = 0;
  }
  uint64_t v13 = [a1 _directionAbstraction];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a2) {
      goto LABEL_21;
    }
    if (a3 > 0x24) {
      goto LABEL_35;
    }
    if (((1 << a3) & 0x1500006006) != 0)
    {
      uint64_t v14 = 1;
      if (v10) {
        goto LABEL_22;
      }
      goto LABEL_31;
    }
    if (((1 << a3) & 0x60060) != 0)
    {
      uint64_t v14 = 0;
      if (v10) {
        goto LABEL_22;
      }
      goto LABEL_31;
    }
    if (((1 << a3) & 0x80200) == 0)
    {
LABEL_35:
      uint64_t v14 = -1;
      if (v10) {
        goto LABEL_22;
      }
    }
    else
    {
LABEL_21:
      uint64_t v14 = 2;
      if (v10) {
        goto LABEL_22;
      }
    }
LABEL_31:
    uint64_t result = 0;
    double v11 = 1.0;
    goto LABEL_32;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v17 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSLayoutXAxisAnchorResolvedDirection _ResolvedDirectionForAnchorAbstractionsForAnchorsInLayoutDirectionContext(NSLayoutAnchor * _Nonnull, id _Nullable, NSLayoutAttribute, id<NSLayoutItem> _Nullable, CGFloat * _Nullable)"), @"NSLayoutAnchor.m", 1279, @"Incompatible anchor comparison for resolving anchor abstractions: %@ with %@", a1, a2 file lineNumber description];
  }
  uint64_t v14 = [a2 _directionAbstraction];
  if (!v10) {
    goto LABEL_31;
  }
LABEL_22:
  BOOL v16 = v13 != 1 && v14 != 1;
  double v11 = -1.0;
  uint64_t result = 1;
  if (v13 && v14 && !v16) {
    goto LABEL_31;
  }
LABEL_32:
  if (a5) {
    *a5 = v11;
  }
  return result;
}

id __NSIdentifierTable_block_invoke()
{
  v0 = (void *)[MEMORY[0x1E4F28E10] mapTableWithWeakToStrongObjects];
  return v0;
}

id __CommaAndWhitespaceCharacterSet_block_invoke()
{
  v0 = (void *)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@", \t\n\r\v"];
  return v0;
}

id __CommaAndWhitespaceInvertedCharacterSet_block_invoke()
{
  v0 = (void *)[(id)_NSFaultInObject() invertedSet];
  return v0;
}

uint64_t __ResolveConstraintArguments_block_invoke()
{
  uint64_t result = dyld_get_program_sdk_version();
  if (result != 657152 && result != 657408 && result != 657664)
  {
    ResolveConstraintArguments_newExceptionBehaviorLocationToConstant = result > 0x80200;
    ResolveConstraintArguments_newExceptionBehaviorLanguageDirectionDependentToAbsolute = WORD1(result) > 8u;
  }
  return result;
}

uint64_t __UseMarginAttributesForDefaultSpacingToSuperview_block_invoke()
{
  objc_opt_class();
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [(id)objc_opt_class() _UIWantsMarginAttributeSupport];
    UseMarginAttributesForDefaultSpacingToSuperview_wantsMarginAttributeSupport = result;
  }
  return result;
}

BOOL _NSConstraintBasedLayoutAnchorEquivalence()
{
  return _NSGetBoolAppConfig(@"NSConstraintBasedLayoutAnchorEquivalence", 0, (unsigned __int8 *)&sNSConstraintBasedLayoutAnchorEquivalenceComputedValue, _NSFalseAppConfigPredicate);
}

uint64_t ___row_rawReplaceColWithColPlusDeltaTimesNewCol_block_invoke_2(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(v3 + 192) + 8 * (a2 >> 6));
  uint64_t v5 = v4 + 32 * (a2 & 0x3F);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t v9 = 32 * (a2 & 0x3F);
    int v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *(void *)(v4 + v9) file lineNumber description];
  }
  uint64_t v6 = *(void *)(v5 + 8);
  unint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v7(v2, v3, v6);
}

unint64_t NSBitSetLastIndex(uint64_t **a1)
{
  return NSBitSetFindPrev(a1, 0x7FFFFFFFFFFFFFFFuLL);
}

uint64_t NSBitSetFindPrevRange(uint64_t **a1, unint64_t a2)
{
  uint64_t v2 = a1;
  unint64_t Prev = NSBitSetFindPrev(a1, a2);
  uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (Prev != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = Prev - 1;
    if (*((_DWORD *)v2 + 2) >= 2u) {
      uint64_t v2 = (uint64_t **)*v2;
    }
    if ((v5 & 0x2000000000) == 0)
    {
      uint64_t v6 = (v5 >> 6);
      for (uint64_t i = v6 << 6; ; i -= 64)
      {
        unint64_t v8 = 0xFFFFFFFFFFFFFFFFLL >> ~(_BYTE)v5;
        unsigned int v9 = __clz(v8 & ~(unint64_t)v2[v6]) ^ 0x3F;
        if ((v8 & ~(unint64_t)v2[v6]) == 0) {
          unsigned int v9 = -1;
        }
        if ((v9 & 0x80000000) == 0) {
          break;
        }
        unint64_t v5 = (v5 | 0x3F) - 64;
        if (v6-- <= 0) {
          return v5 + 1;
        }
      }
      unint64_t v5 = i + v9;
    }
    return v5 + 1;
  }
  return v4;
}

void sub_1A649FEBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1A64A0624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A64A09B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _engineVar_description(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 24)) {
    uint64_t v2 = @"rowIndex";
  }
  else {
    uint64_t v2 = @"colIndex";
  }
  return [NSString stringWithFormat:@"\t%3u: %@ %@:%u", *(unsigned int *)(a2 + 16), *(void *)a2, v2, *(unsigned int *)(a2 + 20)];
}

uint64_t _row_headDescription(uint64_t a1, id **a2)
{
  uint64_t v2 = NSString;
  if (*a2) {
    uint64_t v3 = [**a2 description];
  }
  else {
    uint64_t v3 = 0;
  }
  return [v2 stringWithFormat:@"%@", v3];
}

uint64_t _row_description(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 80)) {
    uint64_t v4 = [*(id *)(a2 + 16) description];
  }
  else {
    uint64_t v4 = NSISLinExpDescriptionInEngine(a2 + 16, a1);
  }
  return [NSString stringWithFormat:@"\t%3u: %@ == %@", *(unsigned int *)(a2 + 8), _row_headDescription(a1, (id **)a2), v4];
}

uint64_t _col_description(uint64_t a1, uint64_t **a2)
{
  if (!a2 || !*a2) {
    return [NSString stringWithFormat:@"\tstorage:%@", a2, v11, v12, v13];
  }
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  BOOL v16 = ___col_description_block_invoke;
  BOOL v17 = &unk_1E5C56A60;
  uint64_t v14 = (void *)v5;
  int v18 = v4;
  uint64_t v19 = v5;
  uint64_t Next = NSBitSetFindNext(a2 + 1, 0);
  if (Next != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (unint64_t i = Next; i != 0x7FFFFFFFFFFFFFFFLL; unint64_t i = NSBitSetFindNext(a2 + 1, i + 1))
      v16((uint64_t)v15, a1, *(void *)(*(void *)(a1 + 232 + 40 * ((i >> 30) & 1)) + 8 * ((i & 0xBFFFFFFF) / 0x17))+ 88 * ((i & 0xBFFFFFFF) % 0x17));
  }
  uint64_t v8 = NSBitSetFindNext(a2 + 3, 0);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t j = v8; j != 0x7FFFFFFFFFFFFFFFLL; uint64_t j = NSBitSetFindNext(a2 + 3, j + 1))
      v16((uint64_t)v15, a1, *(void *)(*(void *)(a1 + 232 + 40 * (((j + 0x40000000) >> 30) & 1))+ 8 * (((j + 0x40000000) & 0xBFFFFFFF) / 0x17uLL))+ 88 * (((j + 0x40000000) & 0xBFFFFFFF) % 0x17));
  }
  return [NSString stringWithFormat:@"\t%3u: %@ == rowIndexes:(%@) rowHeads:(%@)", *((unsigned int *)*a2 + 5), objc_msgSend((id)**a2, "description"), objc_msgSend(v4, "componentsJoinedByString:", @", "), objc_msgSend(v14, "componentsJoinedByString:", @", ")];
}

uint64_t ___col_description_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a3 + 8)));
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = _row_headDescription(a2, (id **)a3);
  return [v6 addObject:v7];
}

void sub_1A64A2B78(_Unwind_Exception *a1)
{
}

void sub_1A64A2B98(void *a1)
{
}

void sub_1A64A2E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A64A3410(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A64A35C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A64A3720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A64A49C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A64A5E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A64A684C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1A64A6B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A64A6F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t *___row_addColWithCoefficient_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 40) + 8);
  if (HIWORD(v3)) {
    unint64_t v4 = v3 - 0x40000000;
  }
  else {
    unint64_t v4 = v3;
  }
  if (HIWORD(v3)) {
    uint64_t v5 = (uint64_t *)(a3 + 24);
  }
  else {
    uint64_t v5 = (uint64_t *)(a3 + 8);
  }
  return NSBitSetRemoveIndex(v5, v4);
}

uint64_t ___row_rawAddCol_block_invoke_2(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(v3 + 192) + 8 * (a2 >> 6));
  uint64_t v5 = v4 + 32 * (a2 & 0x3F);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t v9 = 32 * (a2 & 0x3F);
    int v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *(void *)(v4 + v9) file lineNumber description];
  }
  uint64_t v6 = *(void *)(v5 + 8);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v7(v2, v3, v6);
}

uint64_t ___row_rawReplaceColWithColPlusDeltaTimesNewCol_block_invoke_4(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(v3 + 192) + 8 * (a2 >> 6));
  uint64_t v5 = v4 + 32 * (a2 & 0x3F);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t v9 = 32 * (a2 & 0x3F);
    int v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *(void *)(v4 + v9) file lineNumber description];
  }
  uint64_t v6 = *(void *)(v5 + 8);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v7(v2, v3, v6);
}

void *___fallbackMarkerForConstraintToBreakInRow_block_invoke(void *result, uint64_t a2, id **a3)
{
  if (!*(void *)(*(void *)(result[4] + 8) + 40))
  {
    uint64_t v3 = result;
    uint64_t v4 = *a3;
    uint64_t result = (void *)[**a3 markedConstraint];
    if (result)
    {
      uint64_t result = *v4;
      *(void *)(*(void *)(v3[4] + 8) + 40) = result;
    }
  }
  return result;
}

uint64_t *___pivotToMakeColNewHeadOfRow_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 40) + 8);
  if (HIWORD(v3)) {
    unint64_t v4 = v3 - 0x40000000;
  }
  else {
    unint64_t v4 = v3;
  }
  if (HIWORD(v3)) {
    uint64_t v5 = (uint64_t *)(a3 + 24);
  }
  else {
    uint64_t v5 = (uint64_t *)(a3 + 8);
  }
  return NSBitSetRemoveIndex(v5, v4);
}

uint64_t ___row_rawScaleByWithDroppedColProcessor_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(v3 + 192) + 8 * (a2 >> 6));
  uint64_t v5 = v4 + 32 * (a2 & 0x3F);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t v9 = 32 * (a2 & 0x3F);
    int v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), @"NSISEngine_EngineVar.h", 121, @"Tried accessing the col index for a variable that is a row head:%@", *(void *)(v4 + v9) file lineNumber description];
  }
  uint64_t v6 = *(void *)(v5 + 8);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v7(v2, v3, v6);
}

id _NSLayoutRuleDiffAndUpdateInParent(void *a1, id *a2, uint64_t a3)
{
  uint64_t v4 = a2;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (a2) {
    unint64_t v6 = [*a2 count];
  }
  else {
    unint64_t v6 = 0;
  }
  uint64_t v7 = [a1 count];
  if (v6 <= 3 * v7) {
    unint64_t v6 = 3 * v7;
  }
  int v39 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v6];
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v6];
  uint64_t v37 = v4;
  if (v4) {
    uint64_t v4 = (id *)*v4;
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", v6, v37);
  int v10 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v6];
  [v9 addObjectsFromArray:a1];
  uint64_t v11 = [a1 count];
  if (v11)
  {
    uint64_t v12 = v11;
    do
    {
      [v10 addObject:a3];
      --v12;
    }
    while (v12);
  }
  if ([v9 count])
  {
    unint64_t v13 = 0;
    double v40 = v9;
    do
    {
      uint64_t v14 = (void *)[v9 objectAtIndex:v13];
      uint64_t v15 = (void *)[v10 objectAtIndex:v13];
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      uint64_t v16 = [v4 countByEnumeratingWithState:&v49 objects:v56 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v50;
LABEL_15:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v50 != v18) {
            objc_enumerationMutation(v4);
          }
          int v20 = *(void **)(*((void *)&v49 + 1) + 8 * v19);
          if (objc_msgSend((id)objc_msgSend(v20, "representedRule"), "isEqual:", v14)) {
            break;
          }
          if (v17 == ++v19)
          {
            uint64_t v17 = [v4 countByEnumeratingWithState:&v49 objects:v56 count:16];
            if (v17) {
              goto LABEL_15;
            }
            goto LABEL_25;
          }
        }
        if (!v20) {
          goto LABEL_25;
        }
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = ___NSLayoutRuleRecursiveMoveNodes_block_invoke;
        v53[3] = &unk_1E5C57220;
        v53[4] = v4;
        v53[5] = v39;
        _NSLayoutRuleRecursiveApply(v20, (uint64_t)v53);
        uint64_t v9 = v40;
        if ((void *)[v20 parentNode] != v15)
        {
          [v20 setParentNode:v15];
          [v15 _addChildRuleNode:v20];
        }
      }
      else
      {
LABEL_25:
        if (objc_opt_isKindOfClass())
        {
          char v21 = [(_NSLayoutRuleNode *)[_NSConstraintDescriptionLayoutRuleNode alloc] initWithRule:v14];
          uint64_t v9 = v40;
        }
        else
        {
          char v21 = [(_NSLayoutRuleNode *)[_NSCompositeLayoutRuleNode alloc] initWithRule:v14];
          int v22 = (void *)[v14 makeChildRules];
          uint64_t v9 = v40;
          [v40 addObjectsFromArray:v22];
          uint64_t v23 = [v22 count];
          if (v23)
          {
            uint64_t v24 = v23;
            do
            {
              [v10 addObject:v21];
              --v24;
            }
            while (v24);
          }
        }
        if (v21)
        {
          [v8 addObject:v21];
          [v39 addObject:v21];
          if (v15)
          {
            [(_NSLayoutRuleNode *)v21 setParentNode:v15];
            [v15 _addChildRuleNode:v21];
          }
        }
      }
      ++v13;
    }
    while (v13 < [v9 count]);
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v25 = [v4 countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v46 != v27) {
          objc_enumerationMutation(v4);
        }
        uint64_t v29 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          uint64_t v30 = (void *)[v29 ownedConstraint];
          [v30 _setContainerDeclaredConstraint:0];
          [v30 _setAssociatedRuleNode:0];
          [v30 setActive:0];
        }
      }
      uint64_t v26 = [v4 countByEnumeratingWithState:&v45 objects:v55 count:16];
    }
    while (v26);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id result = (id)[v8 countByEnumeratingWithState:&v41 objects:v54 count:16];
  if (result)
  {
    id v32 = result;
    uint64_t v33 = *(void *)v42;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v42 != v33) {
          objc_enumerationMutation(v8);
        }
        uint64_t v35 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v34);
        if (objc_opt_isKindOfClass())
        {
          uint64_t v36 = objc_msgSend((id)objc_msgSend(v35, "representedRule"), "makeLayoutConstraint");
          [v36 setActive:1];
          [v36 _setContainerDeclaredConstraint:1];
          [v36 _setAssociatedRuleNode:v35];
          [v35 setOwnedConstraint:v36];
        }
        uint64_t v34 = (char *)v34 + 1;
      }
      while (v32 != v34);
      id result = (id)[v8 countByEnumeratingWithState:&v41 objects:v54 count:16];
      id v32 = result;
    }
    while (result);
  }
  if (v38)
  {

    id result = v39;
    id *v38 = result;
  }
  return result;
}

uint64_t _NSLayoutRuleRemoveNodeHierarchyFromParent(void *a1, void *a2, uint64_t a3)
{
  if (a1)
  {
    unint64_t v6 = a1;
    while ((void *)[v6 parentNode] != a2)
    {
      unint64_t v6 = (void *)[v6 parentNode];
      if (!v6) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    uint64_t v7 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "void _NSLayoutRuleRemoveNodeHierarchyFromParent(_NSLayoutRuleNode *, id<_NSLayoutRuleNodeParent>, NSMutableArray<_NSLayoutRuleNode *> **)"), @"NSLayoutRuleNode.m", 207, @"%@ is not in %@'s rule subtree", a1, a2 file lineNumber description];
    unint64_t v6 = 0;
  }
  [a2 _removeChildRuleNode:v6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___NSLayoutRuleRemoveNodeHierarchyFromParent_block_invoke;
  v9[3] = &__block_descriptor_40_e27_v16__0___NSLayoutRuleNode_8l;
  v9[4] = a3;
  return _NSLayoutRuleRecursiveApply(v6, (uint64_t)v9);
}

uint64_t _NSLayoutRuleRecursiveApply(void *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  (*(void (**)(uint64_t, void *))(a2 + 16))(a2, a1);
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v5 = objc_msgSend(a1, "_childRuleNodes", 0);
    uint64_t result = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (result)
    {
      uint64_t v6 = result;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v5);
          }
          _NSLayoutRuleRecursiveApply(*(void *)(*((void *)&v9 + 1) + 8 * v8++), a2);
        }
        while (v6 != v8);
        uint64_t result = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
        uint64_t v6 = result;
      }
      while (result);
    }
  }
  return result;
}

uint64_t _NSRuleNodeAppendDebugDescription(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a3 >= 1)
  {
    uint64_t v8 = a3;
    do
    {
      [a2 appendString:@" "];
      --v8;
    }
    while (v8);
  }
  if (objc_opt_isKindOfClass())
  {
    long long v9 = (void *)[a1 representedRule];
    long long v10 = (objc_class *)objc_opt_class();
    long long v11 = NSStringFromClass(v10);
    [a2 appendFormat:@"<%@: '%@'", v11, objc_msgSend(v9, "ruleDescription")];
  }
  else
  {
    long long v12 = (objc_class *)objc_opt_class();
    long long v11 = NSStringFromClass(v12);
    [a2 appendFormat:@"<%@: '%p'", v11, a1];
  }
  if (objc_opt_respondsToSelector())
  {
    int v20 = v11;
    [a2 appendFormat:@">\n"];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    unint64_t v13 = (void *)[a1 _childRuleNodes];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          if (!a4
            || (*(unsigned int (**)(uint64_t, void))(a4 + 16))(a4, *(void *)(*((void *)&v21 + 1) + 8 * i)))
          {
            _NSRuleNodeAppendDebugDescription(v18, a2, v5 + 4, a4);
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v15);
    }
    if (v5 >= 1)
    {
      do
      {
        [a2 appendString:@" "];
        --v5;
      }
      while (v5);
    }
    return [a2 appendFormat:@"</%@>\n", v20];
  }
  else
  {
    return [a2 appendFormat:@" />\n"];
  }
}

void _NSSetBoolAppConfig(uint64_t a1, unsigned __int8 *a2, int a3)
{
  if (a3) {
    unsigned __int8 v3 = 3;
  }
  else {
    unsigned __int8 v3 = 2;
  }
  atomic_store(v3, a2);
}

BOOL _NSConstraintBasedLayoutShouldIntegralize()
{
  return _NSGetBoolAppConfig(@"NSConstraintBasedLayoutShouldIntegralize", 0, (unsigned __int8 *)&sNSConstraintBasedLayoutShouldIntegralizeComputedValue, _NSFalseAppConfigPredicate);
}

BOOL _NSConstraintBasedLayoutDebugIntegralization()
{
  return _NSGetBoolAppConfig(@"NSConstraintBasedLayoutDebugIntegralization", 0, (unsigned __int8 *)&sNSConstraintBasedLayoutDebugIntegralizationComputedValue, (uint64_t (*)(void))NSConstraintBasedLayoutDebugIntegralizationDefaultValueFunction);
}

BOOL _NSConstraintBasedLayoutOutputEngineTrace()
{
  return _NSGetBoolAppConfig(@"NSConstraintBasedLayoutOutputEngineTrace", 0, (unsigned __int8 *)&sNSConstraintBasedLayoutOutputEngineTraceComputedValue, _NSFalseAppConfigPredicate);
}

uint64_t _NSConstraintBasedLayoutSetOutputEngineTrace(uint64_t result)
{
  if (result) {
    unsigned __int8 v1 = 3;
  }
  else {
    unsigned __int8 v1 = 2;
  }
  atomic_store(v1, (unsigned __int8 *)&sNSConstraintBasedLayoutOutputEngineTraceComputedValue);
  return result;
}

BOOL _NSConstraintBasedLayoutLogEngineRebuilds()
{
  return _NSGetBoolAppConfig(@"NSConstraintBasedLayoutLogEngineRebuilds", 0, sNSConstraintBasedLayoutLogEngineRebuildsComputedValue, _NSFalseAppConfigPredicate);
}

BOOL _NSConstraintBasedLayoutAllowBGThreads()
{
  return _NSGetBoolAppConfig(@"NSConstraintBasedLayoutAllowBGThreads", 0, (unsigned __int8 *)&sNSConstraintBasedLayoutAllowBGThreadsComputedValue, NSConstraintBasedLayoutAllowBGThreadsDefaultValueFunction);
}

uint64_t _NSConstraintBasedLayoutSetAllowBGThreads(uint64_t result)
{
  if (result) {
    unsigned __int8 v1 = 3;
  }
  else {
    unsigned __int8 v1 = 2;
  }
  atomic_store(v1, (unsigned __int8 *)&sNSConstraintBasedLayoutAllowBGThreadsComputedValue);
  return result;
}

BOOL _NSConstraintBasedLayoutExplicitVariableObservation()
{
  return _NSGetBoolAppConfig(@"NSConstraintBasedLayoutExplicitVariableObservation", 1, sNSConstraintBasedLayoutExplicitVariableObservationComputedValue, _NSTrueAppConfigPredicate);
}

CFMutableDictionaryRef NSISObjectToFloatDictCreate()
{
  return CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], &objectToFloatValueCallBacks);
}

double NSISObjectToFloatDictGetValue(const __CFDictionary *a1, const void *a2)
{
  return COERCE_DOUBLE(CFDictionaryGetValue(a1, a2));
}

void NSISObjectToFloatDictSetValue(CFMutableDictionaryRef theDict, const void *key, double a3)
{
  if (a3 == 0.0) {
    CFDictionaryRemoveValue(theDict, key);
  }
  else {
    CFDictionarySetValue(theDict, key, *(const void **)&a3);
  }
}

void NSISObjectToFloatDictEnumerateUsingBlock(const __CFDictionary *a1, void *context)
{
}

uint64_t NSISObjectToFloatDictBlockApplierFunction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, double))(a3 + 16))(a3, a1, *(double *)&a2);
}

CFMutableDictionaryRef NSISObjectToFloatDictCreateCopy(CFDictionaryRef theDict)
{
  return CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, theDict);
}

double NSISUnwrapExactFloat(void *a1)
{
  unsigned __int8 v1 = (void *)[a1 objectForKey:@"data"];
  uint64_t v2 = [v1 length];
  if (v2 == 8)
  {
    double v4 = 0.0;
    [v1 getBytes:&v4 length:8];
    return v4;
  }
  else if (v2 == 4)
  {
    float v5 = 0.0;
    [v1 getBytes:&v5 length:4];
    return v5;
  }
  else
  {
    return 3.40282347e38;
  }
}

__CFString *NSISWrapObject(void *a1)
{
  if (!a1) {
    return @"(null)";
  }
  unsigned __int8 v1 = a1;
  if (_NSIsNSString() & 1) != 0 || (_NSIsNSDictionary() & 1) != 0 || (_NSIsNSNumber()) {
    return (__CFString *)v1;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v7 = [NSString stringWithFormat:@"Cannot wrap object %@", v1];
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v7 userInfo:0]);
    }
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    [v1 constant];
    uint64_t v6 = NSISWrapExactFloat(v5);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __NSISWrapLinearExpression_block_invoke;
    v8[3] = &unk_1E5C57248;
    v8[4] = v3;
    v8[5] = v4;
    [v1 enumerateVariablesAndCoefficients:v8];
    return (__CFString *)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"linear_expression", @"type", v3, @"variables", v4, @"coefficients", v6, @"constant", 0);
  }
  return (__CFString *)NSISWrapVariable((unsigned int *)v1);
}

uint64_t NSISWrapVariable(unsigned int *a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(a1, "delegate"), "nsis_valueOfVariableIsUserObservable:", a1);
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  uint64_t v6 = [NSNumber numberWithBool:v2];
  uint64_t v7 = [NSNumber numberWithInt:a1[15]];
  uint64_t v8 = [a1 description];
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a1, "markedConstraint"), "description");
  if (v9) {
    long long v10 = (__CFString *)v9;
  }
  else {
    long long v10 = &stru_1EFB3B738;
  }
  return objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", @"variable", @"type", v5, @"class", v6, @"userObservable", v7, @"ident", v8, @"description", v10, @"markedConstraintDescription", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a1, "orientationHint")), @"orientationHint", 0);
}

uint64_t NSISWrapExactFloat(double a1)
{
  double v4 = a1;
  uint64_t v1 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v4 length:8];
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"%f", *(void *)&v4);
  return objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"float", @"type", v1, @"data", v2, @"approx", 0);
}

void _NSISRecordOperation(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10)
{
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v17 = (void **)&a10;
  unint64_t v13 = a9;
  if (a9)
  {
    do
    {
      [v12 addObject:NSISWrapObject(v13)];
      uint64_t v14 = v17++;
      unint64_t v13 = *v14;
    }
    while (*v14);
  }
  uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", NSStringFromSelector(a2), @"command", v12, @"args", 0);
  id v16 = (id)[a1 objectForKey:@"Actions"];
  if (!v16)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [a1 setObject:v16 forKey:@"Actions"];
  }
  [v16 addObject:v15];
}

uint64_t _NSISPlaybackOperationsOnEngine(void *a1, void *a2, int a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_alloc_init(NSISPlaybackOperation);
  uint64_t v7 = (void *)[a2 objectForKey:@"Actions"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        [(NSISPlaybackOperation *)v6 playbackOneAction:*(void *)(*((void *)&v15 + 1) + 8 * i) onEngine:a1];
        if (a3) {
          [a1 verifyInternalIntegrity];
        }
      }
      v10 += v9;
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
  }
  unint64_t v13 = v6;
  return v10;
}

BOOL NSConstraintBasedLayoutDebugIntegralizationDefaultValueFunction()
{
  return _NSGetBoolAppConfig(@"NSConstraintBasedLayoutDebug", 0, (unsigned __int8 *)&sNSConstraintBasedLayoutDebugComputedValue, _NSFalseAppConfigPredicate);
}

uint64_t NSConstraintBasedLayoutAllowBGThreadsDefaultValueFunction()
{
  return dyld_program_sdk_at_least() ^ 1;
}

CFStringRef ObjectToFloatValueCopyDescriptionCallBack(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%g", a1);
}

uint64_t __NSISWrapLinearExpression_block_invoke(uint64_t a1, unsigned int *a2, double a3)
{
  [*(id *)(a1 + 32) addObject:NSISWrapVariable(a2)];
  double v5 = *(void **)(a1 + 40);
  uint64_t v6 = NSISWrapExactFloat(a3);
  return [v5 addObject:v6];
}

uint64_t NSISSparseVectorMinHeapForEach(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(result + 8))
  {
    uint64_t v3 = result;
    unint64_t v4 = 0;
    do
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(*(void *)v3 + 8 * v4++));
    while (v4 < *(unsigned int *)(v3 + 8));
  }
  return result;
}

uint64_t VerifyHeapIntegrity(uint64_t result)
{
  LODWORD(v1) = *(_DWORD *)(result + 8);
  if ((int)v1 >= 1)
  {
    uint64_t v2 = result;
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = *(void *)(*(void *)v2 + 8 * v4);
      if (v3 + 1 < (int)v1)
      {
        uint64_t v6 = *(void *)(*(void *)v2 + 8 * v3 + 8);
        uint64_t result = NSISSparseVectorCompare(*(uint64_t **)(*(void *)v2 + 8 * v4), (uint64_t *)v6);
        if (!result)
        {
          unsigned int v7 = *(_DWORD *)(v5 + 12);
          unsigned int v8 = *(_DWORD *)(v6 + 12);
          BOOL v9 = v7 >= v8;
          BOOL v10 = v7 > v8;
          uint64_t v11 = !v9;
          uint64_t result = v10 - v11;
        }
        if (result != -1)
        {
          long long v17 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          uint64_t result = objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void VerifyHeapIntegrity(NSISSparseVectorMinHeap *)"), @"NSISSparseVectorMinHeap.m", 197, @"The value at position %d was bigger than its left child.", v4);
        }
      }
      if (v3 + 2 < *(int *)(v2 + 8))
      {
        uint64_t v12 = *(void *)(*(void *)v2 + 8 * v3 + 16);
        uint64_t result = NSISSparseVectorCompare((uint64_t *)v5, (uint64_t *)v12);
        if (!result)
        {
          unsigned int v13 = *(_DWORD *)(v5 + 12);
          unsigned int v14 = *(_DWORD *)(v12 + 12);
          BOOL v9 = v13 >= v14;
          BOOL v15 = v13 > v14;
          uint64_t v16 = !v9;
          uint64_t result = v15 - v16;
        }
        if (result != -1)
        {
          long long v18 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          uint64_t result = objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void VerifyHeapIntegrity(NSISSparseVectorMinHeap *)"), @"NSISSparseVectorMinHeap.m", 201, @"The value at position %d was bigger than its right child.", v4);
        }
      }
      ++v4;
      uint64_t v1 = *(int *)(v2 + 8);
      v3 += 2;
    }
    while (v4 < v1);
  }
  return result;
}

uint64_t NSISSparseVectorDescription(unsigned __int16 *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  BOOL v10 = __NSISSparseVectorDescription_block_invoke;
  uint64_t v11 = &unk_1E5C57270;
  uint64_t v12 = v2;
  uint64_t v3 = a1[4];
  if (a1[4])
  {
    uint64_t v4 = (double *)(*(void *)a1 + 8);
    do
    {
      v10((uint64_t)&v8, *(v4 - 1), *v4);
      v4 += 2;
      --v3;
    }
    while (v3);
  }
  uint64_t v5 = NSString;
  uint64_t v6 = [v2 componentsJoinedByString:@", "];
  return [v5 stringWithFormat:@"<%@>", v6, v8, v9];
}

uint64_t __NSISSparseVectorDescription_block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%g:%g", *(void *)&a2, *(void *)&a3);
  return [v3 addObject:v4];
}

void NSISLinExpAddExpressionWithProcessors(unsigned __int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  double v10 = fabs(a5);
  if (v10 >= INFINITY && v10 <= INFINITY)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "void NSISLinExpAddExpressionWithProcessors(NSISLinExp *, NSISLinExp *, NSISFloat_t, void (^)(NSISLinExpVar), void (^)(NSISLinExpVar))"), @"NSISLinearExpression.m", 772, @"Invalid parameter not satisfying: %@", @"isfinite(multiplyBy)" file lineNumber description];
  }
  NSISLinExpIncrementConstant((uint64_t)a1, *(double *)(a2 + 8) * a5);
  expression_merge(a1, (unsigned __int16 *)a2, a3, a4, a5);
}

uint64_t NSISLinExpSetConstant(uint64_t result, double a2)
{
  *(double *)(result + 8) = a2;
  return result;
}

uint64_t NSISLinExpDescription(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"%g", *(void *)(a1 + 8));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __NSISLinExpDescription_block_invoke;
  v4[3] = &unk_1E5C57310;
  v4[4] = v2;
  v4[5] = a1;
  NSISLinExpEnumerateVars((unsigned __int16 *)a1, (uint64_t)v4);
  return v2;
}

uint64_t __NSISLinExpDescription_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @" + %g*%u", NSISLinExpCoefficientForVar(*(void *)(a1 + 40), a2), a2);
}

uint64_t NSISLinExpDescriptionInEngine(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"%g", *(void *)(a1 + 8));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __NSISLinExpDescriptionInEngine_block_invoke;
  v6[3] = &unk_1E5C57338;
  v6[4] = a2;
  v6[5] = v4;
  v6[6] = a1;
  NSISLinExpEnumerateVars((unsigned __int16 *)a1, (uint64_t)v6);
  return v4;
}

uint64_t __NSISLinExpDescriptionInEngine_block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = a2;
  uint64_t v5 = (void *)[*(id *)(a1 + 32) variableForEngineVarIndex:a2];
  if (v5) {
    uint64_t v6 = [v5 descriptionInEngine:*(void *)(a1 + 32)];
  }
  else {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedInt:", a2), "description");
  }
  return [*(id *)(a1 + 40) appendFormat:@" + %g*%@", NSISLinExpCoefficientForVar(*(void *)(a1 + 48), v4), v6];
}

id NSISLinExpVarsArray(unsigned __int16 *a1)
{
  uint64_t v1 = a1 + 8;
  if (*((void *)a1 + 2) == *MEMORY[0x1E4F1CFD0])
  {
    uint64_t v1 = (unsigned __int16 *)*((void *)a1 + 3);
    uint64_t v2 = *((void *)a1 + 4);
  }
  else
  {
    uint64_t v2 = *a1;
  }
  uint64_t v3 = *((unsigned int *)a1 + 1);
  unsigned int v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v3];
  if (v3)
  {
    uint64_t v5 = &v1[4 * v2];
    do
    {
      unsigned int v6 = *(_DWORD *)v5;
      v5 += 2;
      objc_msgSend(v4, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v6));
      --v3;
    }
    while (v3);
  }
  return v4;
}

uint64_t __var_handlers_for_variable_handlers_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) variableForEngineVarIndex:a2];
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __var_handlers_for_variable_handlers_block_invoke_2(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) variableForEngineVarIndex:a2];
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

__n128 _insertWithHashFunction(uint64_t a1, uint64_t a2, __n128 *a3, unsigned int (*a4)(uint64_t))
{
  unsigned int v8 = *(_DWORD *)(a1 + 24);
  int v9 = *(_DWORD *)(a1 + 28);
  if (v9 + v8 >= (3 * *(_DWORD *)(a1 + 32)) >> 2) {
    _hashMapRehash(a1, v8 >= 4 * v9);
  }
  unsigned int v10 = *(_DWORD *)(a1 + 32);
  unsigned int v11 = a4(a2) % v10;
  uint64_t v12 = *(void *)(a1 + 16);
  while (1)
  {
    unsigned int v13 = (__n128 *)(v12 + 24 * v11);
    if (!v13->n128_u64[0]) {
      break;
    }
    if (v13->n128_u64[0] == -1)
    {
      --*(_DWORD *)(a1 + 28);
      break;
    }
    if (v11 + 1 < v10) {
      ++v11;
    }
    else {
      unsigned int v11 = 0;
    }
  }
  __n128 result = *a3;
  v13[1].n128_u64[0] = a3[1].n128_u64[0];
  *unsigned int v13 = result;
  *(_DWORD *)(v12 + 24 * v11 + 12) = a2;
  ++*(_DWORD *)(a1 + 24);
  return result;
}

void _deleteWithHashFunction(uint64_t a1, uint64_t a2, unsigned int (*a3)(uint64_t))
{
  if (!*(_DWORD *)(a1 + 24))
  {
    long long v18 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void _deleteWithHashFunction(NSISSparseVectorMap *, uint32_t, HASH_FUNCTION)"), @"NSISSparseVectorMap.m", 218, @"Tried to remove a sparse vector value from an empty map which shouldn't happen.");
  }
  unsigned int v6 = *(_DWORD *)(a1 + 32);
  unsigned int v7 = a3(a2) % v6;
  unsigned int v8 = v6;
  while (1)
  {
    uint64_t v9 = *(void *)(a1 + 16);
    uint64_t v10 = *(void *)(v9 + 24 * v7);
    if (v10 != -1)
    {
      if (!v10)
      {
        uint64_t v20 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void _deleteWithHashFunction(NSISSparseVectorMap *, uint32_t, HASH_FUNCTION)"), @"NSISSparseVectorMap.m", 227, @"Tried to remove a sparse vector value that wasn't in the map.");
        uint64_t v9 = *(void *)(a1 + 16);
      }
      if (*(_DWORD *)(v9 + 24 * v7 + 12) == a2) {
        break;
      }
    }
    if (v7 + 1 < v6) {
      ++v7;
    }
    else {
      unsigned int v7 = 0;
    }
    if (!--v8)
    {
      uint64_t v19 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void _deleteWithHashFunction(NSISSparseVectorMap *, uint32_t, HASH_FUNCTION)"), @"NSISSparseVectorMap.m", 224, @"Corrupt hash table");
    }
  }
  NSISSparseVectorMinHeapDelete(a1, v9 + 24 * v7);
  uint64_t v11 = *(void *)(a1 + 16);
  *(void *)(v11 + 24 * v7) = -1;
  int v12 = *(_DWORD *)(a1 + 28) + 1;
  unsigned int v13 = *(_DWORD *)(a1 + 24) - 1;
  *(_DWORD *)(a1 + 24) = v13;
  *(_DWORD *)(a1 + 28) = v12;
  if (v7 + 1 < v6) {
    unsigned int v14 = v7 + 1;
  }
  else {
    unsigned int v14 = 0;
  }
  if (!*(void *)(v11 + 24 * v14))
  {
    do
    {
      --v12;
      *(void *)(v11 + 24 * v7) = 0;
      if (v7) {
        unsigned int v15 = v7;
      }
      else {
        unsigned int v15 = v6;
      }
      unsigned int v7 = v15 - 1;
    }
    while (*(void *)(v11 + 24 * (v15 - 1)) == -1);
    *(_DWORD *)(a1 + 28) = v12;
  }
  unsigned int v16 = *(_DWORD *)(a1 + 32);
  if (v16 >= 0x40 && v13 < v16 >> 3)
  {
    _hashMapRehash(a1, -1);
  }
}

uint64_t NSISSparseVectorMinNegativeRestrictedVariable(_DWORD *a1)
{
  if (!a1[2])
  {
    uint64_t v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "uint32_t NSISSparseVectorMinNegativeRestrictedVariable(NSISSparseVectorMap *)"), @"NSISSparseVectorMap.m", 305, @"Peeking when the tree has no elements is undefined");
  }
  return *(unsigned int *)(NSISSparseVectorMinHeapPeek(a1) + 12);
}

uint64_t NSISSparseVectorMapMinHeapForEach(uint64_t result, uint64_t a2)
{
  if (*(int *)(result + 8) >= 1)
  {
    uint64_t v3 = result;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    do
    {
      __n128 result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, *(void *)(v3 + 16) + v4);
      ++v5;
      v4 += 24;
    }
    while (v5 < *(int *)(v3 + 8));
  }
  return result;
}

void sub_1A64ACAD4(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    id v4 = v2;
    objc_exception_throw(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A64AD23C(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    id v4 = v2;
    objc_exception_throw(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _NSLayoutConstraintNumberExceedsLimit()
{
  int v0 = _NSLayoutConstraintNumberExceedsLimit_alreadyWarned;
  if ((_NSLayoutConstraintNumberExceedsLimit_alreadyWarned & 1) == 0)
  {
    NSLog(&cfstr_BreakOnSToDebu.isa, @"This NSLayoutConstraint is being configured with a constant that exceeds internal limits.  A smaller value will be substituted, but this problem should be fixed.", "BOOL _NSLayoutConstraintNumberExceedsLimit(void)");
    _NSLayoutConstraintNumberExceedsLimit_alreadyWarned = 1;
  }
  return v0 ^ 1u;
}

uint64_t AnchorEqualOrNil(void *a1, void *a2)
{
  uint64_t v4 = [a1 _anchorType];
  if (v4 != [a2 _anchorType]) {
    goto LABEL_9;
  }
  unint64_t v5 = [a1 _anchorType];
  if (v5 < 2)
  {
    BOOL v7 = a1 == a2;
    goto LABEL_4;
  }
  if (v5 != 2) {
    return v6 & 1;
  }
  uint64_t v8 = [a1 _proxiedItem];
  if (v8 != [a2 _proxiedItem])
  {
LABEL_9:
    char v6 = 0;
    return v6 & 1;
  }
  uint64_t v10 = [a1 _proxiedAttribute];
  BOOL v7 = v10 == [a2 _proxiedAttribute];
LABEL_4:
  char v6 = v7;
  return v6 & 1;
}

uint64_t _NSLayoutConstraintDelegateCallFromUnknownVariable()
{
  int v0 = _NSLayoutConstraintDelegateCallFromUnknownVariable_alreadyWarned;
  if ((_NSLayoutConstraintDelegateCallFromUnknownVariable_alreadyWarned & 1) == 0)
  {
    NSLog(&cfstr_BreakOnSToDebu.isa, @"This NSLayoutConstraint seems to be the delegate of an NSISVariable it doesn't know anything about. This is an internal Cocoa bug.", "BOOL _NSLayoutConstraintDelegateCallFromUnknownVariable(void)");
    _NSLayoutConstraintDelegateCallFromUnknownVariable_alreadyWarned = 1;
  }
  return v0 ^ 1u;
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

uint64_t NSLayoutConstraintEnumeratePiercedItems(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t add = atomic_fetch_add(&NSLayoutConstraintEnumeratePiercedItems_sNextPiercingToken, 1uLL);
  BOOL v7 = (void *)[a2 firstAnchor];
  uint64_t v8 = (void *)[a2 secondAnchor];
  if ([v7 _anchorType] == 2 && objc_msgSend(v8, "_anchorType") == 2)
  {
    _identifyPiercedItems(a1, (void *)[v7 _proxiedItem], add, a3);
    uint64_t v9 = (void *)[v8 _proxiedItem];
    return _identifyPiercedItems(a1, v9, add, a3);
  }
  else
  {
    uint64_t v11 = (void *)[a2 _referencedLayoutItems];
    if ([v11 count] != 1 || (uint64_t result = objc_msgSend(v11, "anyObject"), result != a1))
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t result = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (result)
      {
        uint64_t v12 = result;
        uint64_t v13 = *(void *)v16;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v11);
            }
            _identifyPiercedItems(a1, *(void **)(*((void *)&v15 + 1) + 8 * v14++), add, a3);
          }
          while (v12 != v14);
          uint64_t result = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
          uint64_t v12 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

uint64_t _identifyPiercedItems(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2 != (void *)result)
  {
    uint64_t v7 = result;
    uint64_t result = objc_msgSend(a2, "nsli_piercingToken");
    if (result != a3)
    {
      uint64_t result = objc_msgSend(a2, "nsli_superitem");
      if (result)
      {
        for (uint64_t i = (void *)result; result != v7; uint64_t i = (void *)result)
        {
          uint64_t result = objc_msgSend(i, "nsli_piercingToken");
          if (result == a3) {
            break;
          }
          objc_msgSend(i, "nsli_setPiercingToken:", a3);
          (*(void (**)(uint64_t, void *))(a4 + 16))(a4, i);
          uint64_t result = objc_msgSend(i, "nsli_superitem");
          if (!result) {
            break;
          }
        }
      }
    }
  }
  return result;
}

uint64_t NSLayoutConstraintPiercedItemsInContainer(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[a2 _referencedLayoutItems];
  if ([v3 count] == 1 && objc_msgSend(v3, "anyObject") == a1)
  {
    long long v16 = (void *)MEMORY[0x1E4F1CAD0];
    return [v16 set];
  }
  else
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CA80] set];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
          if (v9 != a1 && ([v4 containsObject:*(void *)(*((void *)&v17 + 1) + 8 * v8)] & 1) == 0)
          {
            uint64_t v10 = objc_msgSend(v9, "nsli_superitem");
            if (v10 && v10 != (void)a1)
            {
              uint64_t v12 = (void *)v10;
              do
              {
                if ([v4 containsObject:v12]) {
                  break;
                }
                [v4 addObject:v12];
                uint64_t v13 = objc_msgSend(v12, "nsli_superitem");
                if (!v13) {
                  break;
                }
                uint64_t v12 = (void *)v13;
              }
              while ((void *)v13 != a1);
            }
          }
          ++v8;
        }
        while (v8 != v6);
        uint64_t v14 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
        uint64_t v6 = v14;
      }
      while (v14);
    }
    return (uint64_t)v4;
  }
}

uint64_t _NSRuntimeResolvedAmbiguityDetected()
{
  int v0 = _NSRuntimeResolvedAmbiguityDetected_alreadyWarned;
  if ((_NSRuntimeResolvedAmbiguityDetected_alreadyWarned & 1) == 0)
  {
    NSLog(&cfstr_BreakOnSToDebu.isa, @"A view or layout guide was marked as having ambiguous layout at design-time.  The ambiguity was resolved before layout, but the item should still be marked 'Suppress ambiguity warnings' in interface builder in order to save the time spent checking for this.  This warning will only appear once.", "BOOL _NSRuntimeResolvedAmbiguityDetected(void)");
    _NSRuntimeResolvedAmbiguityDetected_alreadyWarned = 1;
  }
  return v0 ^ 1u;
}

uint64_t _NSRuntimeAmbiguityDetected()
{
  int v0 = _NSRuntimeAmbiguityDetected_alreadyWarned;
  if ((_NSRuntimeAmbiguityDetected_alreadyWarned & 1) == 0)
  {
    NSLog(&cfstr_BreakOnSToDebu.isa, @"A view or layout guide was marked as having ambiguous layout at design-time.  Please resolve the ambiguity by adding constraints before layout.  This can be done programmatically or in interface builder.  In the mean time, the layout for this item and anything that depends on it may not be correct.  This warning will only appear once.", "BOOL _NSRuntimeAmbiguityDetected(void)");
    _NSRuntimeAmbiguityDetected_alreadyWarned = 1;
  }
  return v0 ^ 1u;
}

id __NSSymbolicConstantTable_block_invoke()
{
  int v0 = (void *)[MEMORY[0x1E4F28E10] mapTableWithWeakToStrongObjects];
  return v0;
}

uint64_t _NSLayoutConstraintToNilAnchor()
{
  int v0 = _NSLayoutConstraintToNilAnchor_alreadyWarned;
  if ((_NSLayoutConstraintToNilAnchor_alreadyWarned & 1) == 0)
  {
    NSLog(&cfstr_BreakOnSToDebu.isa, @"A constraint factory method was passed a nil layout anchor.  This is not allowed, and may cause confusing exceptions.", "BOOL _NSLayoutConstraintToNilAnchor(void)");
    _NSLayoutConstraintToNilAnchor_alreadyWarned = 1;
  }
  return v0 ^ 1u;
}

uint64_t ResolvedDirectionForAnchorAbstractionsForAnchorsInLayoutDirectionContext(void *a1, void *a2, void *a3)
{
  return _ResolvedDirectionForAnchorAbstractionsForAnchorsInLayoutDirectionContext(a1, a2, 0, a3, 0);
}

uint64_t _NSLayoutConstraintComparableHash(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, double a9, double a10, double a11, uint64_t a12)
{
  if (a1) {
    uint64_t v20 = 31 * (objc_msgSend((id)objc_msgSend(NSNumber, "numberWithDouble:"), "hash") + a3);
  }
  else {
    uint64_t v20 = 0;
  }
  uint64_t v21 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithDouble:", a10), "hash") + v20;
  uint64_t v22 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithDouble:", a11), "hash");
  uint64_t v23 = a4 - (v22 - v21 + 32 * v21) + 32 * (v22 - v21 + 32 * v21);
  uint64_t result = a6 - (a5 - v23 + 32 * v23) + 32 * (a5 - v23 + 32 * v23);
  if (a2) {
    return a12 - (31 * (a7 - result + 32 * result) + a8) + 32 * (31 * (a7 - result + 32 * result) + a8);
  }
  return result;
}

void _NSLayoutConstraintDiffConstraints(void *a1, int a2, void *a3, int a4, void *a5, size_t *a6, void *a7, size_t *a8, void *a9, void *a10, size_t *a11, void *a12, size_t *a13, char a14)
{
  v81 = a8;
  v79 = a6;
  int v75 = a2;
  int v76 = a4;
  v90[1] = *MEMORY[0x1E4F143B8];
  size_t v18 = [a1 count];
  unint64_t v19 = [a3 count];
  size_t v20 = v19;
  if (v18 >= v19) {
    unint64_t v21 = v19;
  }
  else {
    unint64_t v21 = v18;
  }
  unint64_t v78 = v21;
  unint64_t v22 = 8 * v18;
  BOOL v77 = 8 * v18 > 0x1000;
  if (8 * v18 <= 0x1000)
  {
    if (v18)
    {
      MEMORY[0x1F4188790]();
      uint64_t v23 = &v74[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
      bzero(v23, 8 * v18);
    }
    else
    {
      uint64_t v23 = 0;
    }
  }
  else
  {
    uint64_t v23 = malloc_type_malloc(8 * v18, 0x80040B8603338uLL);
  }
  unint64_t v24 = 8 * v20;
  BOOL v86 = 8 * v20 > 0x1000;
  if (8 * v20 > 0x1000)
  {
    uint64_t v25 = malloc_type_malloc(8 * v20, 0x80040B8603338uLL);
    if (!v18) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (v20)
  {
    MEMORY[0x1F4188790]();
    uint64_t v25 = &v74[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
    bzero(v25, 8 * v20);
    if (!v18) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  uint64_t v25 = 0;
  if (v18) {
LABEL_14:
  }
    objc_msgSend(a1, "getObjects:range:", v23, 0, v18);
LABEL_15:
  if (v20) {
    objc_msgSend(a3, "getObjects:range:", v25, 0, v20);
  }
  size_t v89 = 0;
  v90[0] = 0;
  unint64_t v88 = 0;
  uint64_t v82 = 8 * v20;
  unint64_t v83 = 8 * v18;
  if (a14)
  {
    v90[0] = v18;
    if (v22 <= 0x1000)
    {
      if (v18)
      {
        MEMORY[0x1F4188790]();
        uint64_t v26 = &v74[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
        bzero(v26, 8 * v18);
      }
      else
      {
        uint64_t v26 = 0;
      }
    }
    else
    {
      uint64_t v26 = malloc_type_malloc(8 * v18, 0x100004000313F17uLL);
    }
    size_t v89 = v20;
    if (v24 <= 0x1000)
    {
      if (v20)
      {
        MEMORY[0x1F4188790]();
        v87 = &v74[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
        bzero(v87, 8 * v20);
        if (!v18) {
          goto LABEL_46;
        }
      }
      else
      {
        v87 = 0;
        if (!v18) {
          goto LABEL_46;
        }
      }
    }
    else
    {
      v87 = malloc_type_malloc(8 * v20, 0x100004000313F17uLL);
      if (!v18) {
        goto LABEL_46;
      }
    }
    for (uint64_t i = 0; i != v18; ++i)
      *(void *)&v26[8 * i] = i;
LABEL_46:
    v85 = (uint64_t *)v26;
    if (v20)
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        *(void *)&v87[8 * j] = j;
        double v38 = *(void **)&v25[8 * j];
        if (objc_opt_respondsToSelector()) {
          double v38 = (void *)[v38 _constraintValueCopy];
        }
        *(void *)&v25[8 * j] = v38;
      }
      size_t v39 = 0;
      v84 = 0;
      uint64_t v34 = 0;
      BOOL v80 = 0;
      size_t v40 = v18;
      size_t v41 = v20;
    }
    else
    {
      size_t v39 = 0;
      size_t v41 = 0;
      v84 = 0;
      uint64_t v34 = 0;
      BOOL v80 = 0;
      size_t v40 = v18;
    }
LABEL_77:
    BOOL v45 = v77;
    goto LABEL_78;
  }
  if (v18 != v20)
  {
LABEL_28:
    if (v22 <= 0x1000)
    {
      if (v18)
      {
        MEMORY[0x1F4188790]();
        uint64_t v35 = &v74[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
        bzero(v35, 8 * v18);
      }
      else
      {
        uint64_t v35 = 0;
      }
    }
    else
    {
      uint64_t v35 = malloc_type_malloc(8 * v18, 0x100004000313F17uLL);
    }
    if (v24 <= 0x1000)
    {
      if (v20)
      {
        MEMORY[0x1F4188790]();
        v87 = &v74[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
        bzero(v87, 8 * v20);
      }
      else
      {
        v87 = 0;
      }
    }
    else
    {
      v87 = malloc_type_malloc(8 * v20, 0x100004000313F17uLL);
    }
    size_t v46 = 8 * v78;
    BOOL v80 = 8 * v78 > 0x1000;
    v85 = (uint64_t *)v35;
    if (8 * v78 <= 0x1000)
    {
      if (v78)
      {
        MEMORY[0x1F4188790]();
        long long v47 = &v74[-((v46 + 15) & 0xFFFFFFFFFFFFFFF0)];
        bzero(v47, v46);
        MEMORY[0x1F4188790]();
        uint64_t v34 = (uint64_t *)v47;
        bzero(v47, v46);
      }
      else
      {
        long long v47 = 0;
        uint64_t v34 = 0;
      }
    }
    else
    {
      long long v47 = malloc_type_malloc(8 * v78, 0x100004000313F17uLL);
      uint64_t v34 = (uint64_t *)malloc_type_malloc(v46, 0x100004000313F17uLL);
    }
    v84 = v47;
    _NSLayoutConstraintSortDiff((uint64_t)v23, v18, v75, (uint64_t)v25, v20, v76, (uint64_t)v85, v90, (uint64_t)v87, &v89, (uint64_t)v47, (uint64_t)v34, &v88);
    size_t v41 = v89;
    if (v89 > v20)
    {
      v70 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v70, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void _NSLayoutConstraintDiffConstraints(NSArray<id<_NSLayoutConstraintComparable>> * _Nonnull, BOOL, NSArray<id<_NSLayoutConstraintComparable>> * _Nonnull, BOOL, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, BOOL)"), @"NSLayoutConstraintDiff.m", 195, @"_NSLayoutConstraintSortDiff post-condition");
    }
    size_t v40 = v90[0];
    if (v90[0] > v18)
    {
      v71 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v71, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void _NSLayoutConstraintDiffConstraints(NSArray<id<_NSLayoutConstraintComparable>> * _Nonnull, BOOL, NSArray<id<_NSLayoutConstraintComparable>> * _Nonnull, BOOL, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, BOOL)"), @"NSLayoutConstraintDiff.m", 196, @"_NSLayoutConstraintSortDiff post-condition");
    }
    size_t v39 = v88;
    if (v88 > v78)
    {
      unint64_t v78 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v72 = objc_msgSend(NSString, "stringWithUTF8String:", "void _NSLayoutConstraintDiffConstraints(NSArray<id<_NSLayoutConstraintComparable>> * _Nonnull, BOOL, NSArray<id<_NSLayoutConstraintComparable>> * _Nonnull, BOOL, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, BOOL)");
      [(id)v78 handleFailureInFunction:v72 file:@"NSLayoutConstraintDiff.m" lineNumber:197 description:@"_NSLayoutConstraintSortDiff post-condition"];
    }
    if (v39 > v18)
    {
      v73 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v73, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void _NSLayoutConstraintDiffConstraints(NSArray<id<_NSLayoutConstraintComparable>> * _Nonnull, BOOL, NSArray<id<_NSLayoutConstraintComparable>> * _Nonnull, BOOL, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, BOOL)"), @"NSLayoutConstraintDiff.m", 198, @"_NSLayoutConstraintSortDiff post-condition");
    }
    goto LABEL_77;
  }
  if (v18)
  {
    uint64_t v27 = v23;
    uint64_t v28 = v25;
    size_t v29 = v18;
    while (*v27 == *v28)
    {
      ++v28;
      ++v27;
      if (!--v29) {
        goto LABEL_25;
      }
    }
    goto LABEL_28;
  }
LABEL_25:
  unint64_t v88 = v78;
  size_t v30 = 8 * v78;
  BOOL v31 = 8 * v78 > 0x1000;
  if (8 * v78 <= 0x1000)
  {
    if (!v78)
    {
      size_t v39 = 0;
      size_t v40 = 0;
      size_t v41 = 0;
      v84 = 0;
      v85 = 0;
      BOOL v45 = 0;
      v87 = 0;
      BOOL v86 = 0;
      uint64_t v34 = 0;
      BOOL v80 = 0;
      goto LABEL_78;
    }
    BOOL v80 = 8 * v78 > 0x1000;
    MEMORY[0x1F4188790]();
    unint64_t v42 = (v30 + 15) & 0xFFFFFFFFFFFFFFF0;
    v84 = &v74[-v42];
    bzero(&v74[-v42], v30);
    MEMORY[0x1F4188790]();
    uint64_t v34 = (uint64_t *)&v74[-v42];
    bzero(&v74[-v42], v30);
    unint64_t v33 = v78;
  }
  else
  {
    v84 = malloc_type_malloc(8 * v78, 0x100004000313F17uLL);
    id v32 = (uint64_t *)malloc_type_malloc(v30, 0x100004000313F17uLL);
    unint64_t v33 = v78;
    uint64_t v34 = v32;
    if (!v78)
    {
      size_t v39 = 0;
      size_t v40 = 0;
      size_t v41 = 0;
      v85 = 0;
      BOOL v45 = 0;
      v87 = 0;
      BOOL v86 = 0;
      BOOL v80 = 1;
      goto LABEL_78;
    }
    BOOL v80 = v31;
  }
  uint64_t v43 = 0;
  long long v44 = v84;
  do
  {
    *(void *)&v44[8 * v43] = v43;
    v34[v43] = v43;
    ++v43;
  }
  while (v33 != v43);
  size_t v40 = 0;
  size_t v41 = 0;
  v85 = 0;
  BOOL v45 = 0;
  v87 = 0;
  BOOL v86 = 0;
  size_t v39 = v33;
LABEL_78:
  if (v79)
  {
    size_t *v79 = v41;
    if (a5)
    {
      if (v41)
      {
        long long v48 = (uint64_t *)v87;
        size_t v49 = v41;
        do
        {
          uint64_t v50 = *v48++;
          *a5++ = *(void *)&v25[8 * v50];
          --v49;
        }
        while (v49);
      }
    }
  }
  if (v81)
  {
    size_t *v81 = v40;
    if (a7)
    {
      if (v40)
      {
        long long v51 = v85;
        do
        {
          uint64_t v52 = *v51++;
          *a7++ = *(void *)&v23[8 * v52];
          --v40;
        }
        while (v40);
      }
    }
  }
  v53 = (uint64_t *)v84;
  if (a11)
  {
    uint64_t v54 = a9;
    *a11 = v39;
    if (a9)
    {
      uint64_t v55 = a10;
      if (a10)
      {
        if (v39)
        {
          uint64_t v56 = v53;
          uint64_t v57 = v34;
          size_t v58 = v39;
          do
          {
            uint64_t v59 = *v56++;
            *v54++ = *(void *)&v23[8 * v59];
            uint64_t v60 = *v57++;
            *v55++ = *(void *)&v25[8 * v60];
            --v58;
          }
          while (v58);
        }
      }
    }
  }
  unint64_t v61 = v82;
  if (a13)
  {
    *a13 = v20;
    if (a12)
    {
      if (v39)
      {
        v62 = v53;
        char v63 = a12;
        size_t v64 = v39;
        do
        {
          uint64_t v65 = *v62++;
          *v63++ = *(void *)&v23[8 * v65];
          --v64;
        }
        while (v64);
      }
      if (v41)
      {
        v66 = &a12[v39];
        v67 = (uint64_t *)v87;
        do
        {
          uint64_t v68 = *v67++;
          *v66++ = *(void *)&v25[8 * v68];
          --v41;
        }
        while (v41);
      }
    }
  }
  if (v83 > 0x1000) {
    free(v23);
  }
  BOOL v69 = v80;
  if (v61 > 0x1000) {
    free(v25);
  }
  if (v45) {
    free(v85);
  }
  if (v86) {
    free(v87);
  }
  if (v69)
  {
    free(v53);
    free(v34);
  }
}

void _NSLayoutConstraintSortDiff(uint64_t a1, size_t a2, char a3, uint64_t a4, size_t a5, char a6, uint64_t a7, size_t *a8, uint64_t a9, size_t *a10, uint64_t a11, uint64_t a12, void *a13)
{
  long long v44 = a8;
  uint64_t v46 = a7;
  uint64_t v50 = a1;
  uint64_t v51 = a4;
  __compar[6] = *MEMORY[0x1E4F143B8];
  size_t v17 = 8 * a2;
  if (8 * a2 <= 0x1000)
  {
    if (a2)
    {
      MEMORY[0x1F4188790]();
      size_t v18 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v18, v17);
    }
    else
    {
      size_t v18 = 0;
    }
  }
  else
  {
    a1 = (uint64_t)malloc_type_malloc(8 * a2, 0x100004000313F17uLL);
    size_t v18 = (char *)a1;
  }
  unint64_t v43 = v17;
  if (8 * a5 <= 0x1000)
  {
    if (a5)
    {
      MEMORY[0x1F4188790]();
      unint64_t v19 = (char *)&v42 - ((8 * a5 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v19, 8 * a5);
      if (!a2) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v19 = 0;
      if (!a2) {
        goto LABEL_15;
      }
    }
  }
  else
  {
    a1 = (uint64_t)malloc_type_malloc(8 * a5, 0x100004000313F17uLL);
    unint64_t v19 = (char *)a1;
    if (!a2) {
      goto LABEL_15;
    }
  }
  uint64_t v20 = 0;
  do
  {
    *(void *)&v18[8 * v20] = v20;
    ++v20;
  }
  while (a2 != v20);
LABEL_15:
  uint64_t v42 = 8 * a5;
  if (a5)
  {
    uint64_t v21 = 0;
    do
    {
      *(void *)&v19[8 * v21] = v21;
      ++v21;
    }
    while (a5 != v21);
  }
  if ((a3 & 1) == 0)
  {
    __compar[0] = MEMORY[0x1E4F143A8];
    __compar[1] = 3221225472;
    __compar[2] = ___NSLayoutConstraintSortDiff_block_invoke;
    __compar[3] = &unk_1E5C576D0;
    __compar[4] = &__block_literal_global_8;
    __compar[5] = v50;
    qsort_b(v18, a2, 8uLL, __compar);
  }
  if ((a6 & 1) == 0)
  {
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = ___NSLayoutConstraintSortDiff_block_invoke_2;
    v52[3] = &unk_1E5C576D0;
    v52[4] = &__block_literal_global_8;
    v52[5] = v51;
    qsort_b(v19, a5, 8uLL, v52);
  }
  size_t v22 = 0;
  uint64_t v45 = a9;
  size_t v23 = 0;
  if (a2)
  {
    size_t v47 = 0;
    size_t v48 = 0;
    uint64_t v24 = 0;
    if (a5)
    {
      uint64_t v24 = 0;
      size_t v47 = 0;
      size_t v48 = 0;
      size_t v23 = 0;
      size_t v22 = 0;
      uint64_t v49 = a12;
      do
      {
        uint64_t v25 = *(void *)&v18[8 * v22];
        uint64_t v26 = *(void *)&v19[8 * v23];
        a1 = ___NSLayoutConstraintDiffConstraints_block_invoke(a1, *(void **)(v50 + 8 * v25), *(void **)(v51 + 8 * v26));
        if ((unint64_t)(a1 + 1) >= 3)
        {
          if (a1 == 2)
          {
            size_t v28 = v47;
            *(void *)(v45 + 8 * v47) = v26;
            ++v23;
            size_t v47 = v28 + 1;
          }
          else if (a1 == -2)
          {
            size_t v27 = v48;
            *(void *)(v46 + 8 * v48) = v25;
            size_t v48 = v27 + 1;
            ++v22;
          }
        }
        else
        {
          *(void *)(a11 + 8 * v24) = v25;
          *(void *)(v49 + 8 * v24++) = v26;
          ++v22;
          ++v23;
        }
      }
      while (v22 < a2 && v23 < a5);
    }
  }
  else
  {
    size_t v47 = 0;
    size_t v48 = 0;
    uint64_t v24 = 0;
  }
  size_t v29 = a2 - v22;
  if (a2 <= v22)
  {
    unint64_t v35 = v42;
    size_t v34 = v48;
  }
  else
  {
    size_t v30 = v48 + a2 - v22;
    BOOL v31 = (void *)(v46 + 8 * v48);
    id v32 = &v18[8 * v22];
    do
    {
      uint64_t v33 = *(void *)v32;
      v32 += 8;
      *v31++ = v33;
      --v29;
    }
    while (v29);
    size_t v34 = v30;
    unint64_t v35 = v42;
  }
  size_t v36 = v47;
  size_t v37 = a5 - v23;
  if (a5 > v23)
  {
    double v38 = (void *)(v45 + 8 * v47);
    size_t v39 = &v19[8 * v23];
    do
    {
      uint64_t v40 = *(void *)v39;
      v39 += 8;
      *v38++ = v40;
      --v37;
    }
    while (v37);
    size_t v36 = v36 + a5 - v23;
  }
  if (v43 > 0x1000) {
    free(v18);
  }
  if (v35 > 0x1000) {
    free(v19);
  }
  if (v36 + v24 != a5)
  {
    size_t v41 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  }
  *long long v44 = v34;
  *a10 = v36;
  *a13 = v24;
}

void _NSLayoutConstraintDiffConstraintsReturnNSArrays(void *a1, int a2, void *a3, int a4, void *a5, void *a6, void *a7, void *a8, void *a9, char a10)
{
  size_t v34 = a8;
  int v31 = a4;
  int v29 = a2;
  v39[1] = *MEMORY[0x1E4F143B8];
  unint64_t v15 = [a1 count];
  size_t v30 = a3;
  unint64_t v16 = [a3 count];
  unint64_t v17 = v16;
  if (v15 >= v16) {
    unint64_t v18 = v16;
  }
  else {
    unint64_t v18 = v15;
  }
  v39[0] = 0;
  unint64_t v19 = 8 * v15;
  if (8 * v15 <= 0x1000)
  {
    if (v15)
    {
      MEMORY[0x1F4188790]();
      unint64_t v35 = &v28[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
      bzero(v35, 8 * v15);
    }
    else
    {
      unint64_t v35 = 0;
    }
  }
  else
  {
    unint64_t v35 = malloc_type_malloc(8 * v15, 0x80040B8603338uLL);
  }
  size_t v38 = 0;
  size_t v20 = 8 * v17;
  if (8 * v17 <= 0x1000)
  {
    if (v17)
    {
      MEMORY[0x1F4188790]();
      uint64_t v21 = &v28[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
      bzero(v21, 8 * v17);
    }
    else
    {
      uint64_t v21 = 0;
    }
  }
  else
  {
    uint64_t v21 = malloc_type_malloc(8 * v17, 0x80040B8603338uLL);
  }
  size_t v37 = 0;
  size_t v22 = 8 * v18;
  id v32 = a5;
  uint64_t v33 = a7;
  if (8 * v18 <= 0x1000)
  {
    size_t v23 = a6;
    if (v18)
    {
      MEMORY[0x1F4188790]();
      unint64_t v18 = (unint64_t)&v28[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
      bzero((void *)v18, v22);
      MEMORY[0x1F4188790]();
      uint64_t v24 = (void *)v18;
      bzero((void *)v18, v22);
    }
    else
    {
      uint64_t v24 = 0;
    }
  }
  else
  {
    size_t v23 = a6;
    unint64_t v18 = (unint64_t)malloc_type_malloc(8 * v18, 0x80040B8603338uLL);
    uint64_t v24 = malloc_type_malloc(v22, 0x80040B8603338uLL);
  }
  size_t v36 = 0;
  if (v20 <= 0x1000)
  {
    if (v17)
    {
      MEMORY[0x1F4188790]();
      unint64_t v17 = (unint64_t)&v28[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
      bzero((void *)v17, v20);
    }
  }
  else
  {
    unint64_t v17 = (unint64_t)malloc_type_malloc(8 * v17, 0x80040B8603338uLL);
  }
  _NSLayoutConstraintDiffConstraints(a1, v29, v30, v31, v21, &v38, v35, v39, (void *)v18, v24, &v37, (void *)v17, &v36, a10);
  uint64_t v25 = v32;
  if (v32) {
    *uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:v38];
  }
  if (v23) {
    *size_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:v39[0]];
  }
  uint64_t v26 = v33;
  if (v33) {
    void *v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:v37];
  }
  size_t v27 = v34;
  if (v34) {
    *size_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:v37];
  }
  if (a9) {
    *a9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:v36];
  }
  if (v19 > 0x1000) {
    free(v35);
  }
  if (v20 > 0x1000) {
    free(v21);
  }
  if (v22 > 0x1000)
  {
    free((void *)v18);
    free(v24);
  }
  if (v20 > 0x1000) {
    free((void *)v17);
  }
}

void **_NSLayoutConstraintApplyDiffWithCounterparts(void **result, void **a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    uint64_t v5 = result;
    do
    {
      uint64_t result = (void **)*v5;
      if (*v5 != *a2) {
        uint64_t result = (void **)objc_msgSend(result, "_setMutablePropertiesFromConstraint:");
      }
      ++a2;
      ++v5;
      --v3;
    }
    while (v3);
  }
  return result;
}

unint64_t _NSLayoutConstraintApplyDiffWithCounterpartsNSArrays(void *a1, void *a2)
{
  uint64_t v4 = [a1 count];
  if (v4 != [a2 count])
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void _NSLayoutConstraintApplyDiffWithCounterpartsNSArrays(NSArray<NSLayoutConstraint *> * _Nonnull, NSArray<id<_NSLayoutConstraintComparable>> * _Nonnull)"), @"NSLayoutConstraintDiff.m", 336, @"Unexpected difference in length");
  }
  unint64_t result = [a1 count];
  if (result)
  {
    for (unint64_t i = 0; i < result; ++i)
    {
      uint64_t v7 = (void *)[a1 objectAtIndexedSubscript:i];
      uint64_t v8 = [a2 objectAtIndexedSubscript:i];
      if (v7 != (void *)v8) {
        [v7 _setMutablePropertiesFromConstraint:v8];
      }
      unint64_t result = [a1 count];
    }
  }
  return result;
}

void _table_addStorageBlock_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void NSISLinExpScaleByWithDroppedColProcessor_cold_1()
{
  __assert_rtn("NSISLinExpScaleByWithDroppedColProcessor", "NSISLinearExpression.m", 1012, "scalar != 0");
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

id NSAllocateObject(Class aClass, NSUInteger extraBytes, NSZone *zone)
{
  return (id)MEMORY[0x1F40E6FF0](aClass, extraBytes, zone);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

BOOL NSMapMember(NSMapTable *table, const void *key, void **originalKey, void **value)
{
  return MEMORY[0x1F40E7198](table, key, originalKey, value);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

BOOL NSShouldRetainWithZone(id anObject, NSZone *requestedZone)
{
  return MEMORY[0x1F40E7268](anObject, requestedZone);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NSFaultInObject()
{
  return MEMORY[0x1F40E7350]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1F40D94B8]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1F40D94C0]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1F40D94E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1F40C9FA8]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1F40C9FF8]();
}

void bzero(void *a1, size_t a2)
{
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1F4181548](cls);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t dyld_get_program_sdk_version()
{
  return MEMORY[0x1F40CBE28]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

int flsl(uint64_t a1)
{
  return MEMORY[0x1F40CC180](a1);
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

size_t malloc_good_size(size_t size)
{
  return MEMORY[0x1F40CCB58](size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

int mergesort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  return MEMORY[0x1F40CCD50](__base, __nel, __width, __compar);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_terminate(void)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40CDA40](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

int rand(void)
{
  return MEMORY[0x1F40CDC08]();
}

double strtod_l(const char *a1, char **a2, locale_t a3)
{
  MEMORY[0x1F40CE268](a1, a2, a3);
  return result;
}