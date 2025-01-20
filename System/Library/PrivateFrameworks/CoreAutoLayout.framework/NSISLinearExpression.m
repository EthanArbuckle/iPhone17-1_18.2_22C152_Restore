@interface NSISLinearExpression
+ (id)acquireFromPoolForUseCase:(int64_t)a3;
+ (id)acquireFromPoolForUseCase:(int64_t)a3 engine:(id)a4;
+ (id)newExpressionWithCapacity:(unint64_t)a3;
+ (id)newExpressionWithCapacity:(unint64_t)a3 engine:(id)a4;
+ (void)initialize;
- (BOOL)enumerateVariablesAndCoefficientsUntil:(id)a3;
- (BOOL)isConstant;
- (BOOL)isEqual:(id)a3;
- (NSISEngine)engine;
- (NSISLinearExpression)init;
- (NSISLinearExpression)initWithEngine:(id)a3;
- (_WORD)initWithInlineCapacity:(uint64_t)a3 engine:;
- (double)coefficientForVariable:(id)a3;
- (double)constant;
- (double)incrementConstant:(double)a3;
- (id)copyContentsAndReturnToPool;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)variablesArray;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (unint64_t)variableCount;
- (void)addExpression:(id)a3 times:(double)a4;
- (void)addExpression:(id)a3 times:(double)a4 processVariableNewToReceiver:(id)a5 processVariableDroppedFromReceiver:(id)a6;
- (void)addVariable:(id)a3 coefficient:(double)a4;
- (void)addVariable:(id)a3 coefficient:(double)a4 processVariableNewToReceiver:(id)a5 processVariableDroppedFromReceiver:(id)a6;
- (void)dealloc;
- (void)enumerateVariables:(id)a3;
- (void)enumerateVariablesAndCoefficients:(id)a3;
- (void)removeVariable:(id)a3;
- (void)replaceVariable:(id)a3 withExpression:(id)a4 processVariableNewToReceiver:(id)a5 processVariableDroppedFromReceiver:(id)a6;
- (void)replaceVariable:(id)a3 withVariable:(id)a4 coefficient:(double)a5;
- (void)replaceVariable:(id)a3 withVariablePlusDelta:(double)a4;
- (void)replaceVariable:(id)a3 withVariablePlusDelta:(double)a4 timesVariable:(id)a5 processVariableNewToReceiver:(id)a6 processVariableDroppedFromReceiver:(id)a7;
- (void)returnToPool;
- (void)scaleBy:(double)a3;
- (void)setCoefficient:(double)a3 forVariable:(id)a4;
- (void)setConstant:(double)a3;
- (void)verifyInternalIntegrity;
@end

@implementation NSISLinearExpression

- (BOOL)isConstant
{
  return self->linExp.var_count == 0;
}

- (void)setCoefficient:(double)a3 forVariable:(id)a4
{
  -[NSISEngine beginBookkeepingForVariableIfNeeded:](self->engine, "beginBookkeepingForVariableIfNeeded:");
  uint64_t v7 = 0;
  while ((NSISEngine *)*((void *)a4 + v7 + 3) != self->engine)
  {
    if (++v7 == 3) {
      goto LABEL_6;
    }
  }
  unsigned int v8 = *((_DWORD *)a4 + v7 + 12);
  if (v8 != -1) {
    goto LABEL_9;
  }
LABEL_6:
  if (!*((void *)a4 + 2) || (unsigned int v8 = objc_msgSend(a4, "overflowEngineVarIndexForEngine:"), v8 == -1))
  {
    v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISLinExpVar variable_to_linexpvar(NSISLinearExpression *, NSISVariable *)"), @"NSISLinearExpression.m", 610, @"Expression %@ unable to find variable %@ in engine %p", self, a4, self->engine file lineNumber description];
    unsigned int v8 = 0;
  }
LABEL_9:
  NSISLinExpSetCoefficientForVar(&self->linExp.inline_capacity, v8, a3);
}

- (void)addVariable:(id)a3 coefficient:(double)a4
{
  if (!a3)
  {
    v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "-[NSISLinearExpression addVariable:coefficient:]"), @"NSISLinearExpression.m", 791, @"Attempt to add a nil NSISVariable to an expression.  This is probably a bug in autolayout.");
  }
  [(NSISEngine *)self->engine beginBookkeepingForVariableIfNeeded:a3];
  uint64_t v7 = 0;
  while ((NSISEngine *)*((void *)a3 + v7 + 3) != self->engine)
  {
    if (++v7 == 3) {
      goto LABEL_8;
    }
  }
  unsigned int v8 = *((_DWORD *)a3 + v7 + 12);
  if (v8 != -1) {
    goto LABEL_11;
  }
LABEL_8:
  if (!*((void *)a3 + 2) || (unsigned int v8 = objc_msgSend(a3, "overflowEngineVarIndexForEngine:"), v8 == -1))
  {
    v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISLinExpVar variable_to_linexpvar(NSISLinearExpression *, NSISVariable *)"), @"NSISLinearExpression.m", 610, @"Expression %@ unable to find variable %@ in engine %p", self, a3, self->engine file lineNumber description];
    unsigned int v8 = 0;
  }
LABEL_11:
  NSISLinExpAddVar(&self->linExp.inline_capacity, v8, a4);
}

- (double)incrementConstant:(double)a3
{
  NSISLinExpIncrementConstant((uint64_t)&self->linExp, a3);
  return result;
}

+ (id)acquireFromPoolForUseCase:(int64_t)a3 engine:(id)a4
{
  if (a3 >= 2) {
    NSLog(&cfstr_Nsislinearexpr_1.isa, a2, "+[NSISLinearExpression acquireFromPoolForUseCase:engine:]", 1183);
  }
  if (pthread_getspecific(kPooledLinearExpressionInUseKeys[a3]))
  {
    if (a3 == 1) {
      uint64_t v7 = 64;
    }
    else {
      uint64_t v7 = 6;
    }
    unsigned int v8 = (void *)[a1 newExpressionWithCapacity:v7 engine:a4];
    return v8;
  }
  else
  {
    pthread_setspecific(kPooledLinearExpressionInUseKeys[a3], (const void *)1);
    v10 = pthread_getspecific(kPooledLinearExpressionKeys[a3]);
    if (!v10)
    {
      uint64_t v11 = a3 == 1 ? 64 : 6;
      v10 = (void *)[a1 newExpressionWithCapacity:v11 engine:a4];
      v12 = pthread_getspecific(kPooledLinearExpressionKeys[a3]);
      id v13 = v10;
      pthread_setspecific(kPooledLinearExpressionKeys[a3], v10);
      if (v12) {
    }
      }
    *((void *)v10 + 1) = a4;
    if (*((_DWORD *)v10 + 5)) {
      NSLog(&cfstr_Nsislinearexpr_1.isa, "+[NSISLinearExpression acquireFromPoolForUseCase:engine:]", 1200);
    }
    if (*((double *)v10 + 3) != 0.0) {
      NSLog(&cfstr_Nsislinearexpr_1.isa, "+[NSISLinearExpression acquireFromPoolForUseCase:engine:]", 1201);
    }
    return v10;
  }
}

- (void)returnToPool
{
  uint64_t v3 = 0;
  self->linExp.var_count = 0;
  self->linExp.constant = 0.0;
  for (char i = 1; ; char i = 0)
  {
    char v5 = i;
    if (pthread_getspecific(kPooledLinearExpressionKeys[v3]) == self) {
      break;
    }
    uint64_t v3 = 1;
    if ((v5 & 1) == 0) {
      return;
    }
  }
  if (!pthread_getspecific(kPooledLinearExpressionInUseKeys[v3])) {
    NSLog(&cfstr_Nsislinearexpr_1.isa, "-[NSISLinearExpression returnToPool]", 1131);
  }
  pthread_key_t v6 = kPooledLinearExpressionInUseKeys[v3];
  pthread_setspecific(v6, 0);
}

- (double)constant
{
  return self->linExp.constant;
}

- (NSISEngine)engine
{
  return self->engine;
}

- (void)addExpression:(id)a3 times:(double)a4
{
}

- (void)dealloc
{
  uint64_t v3 = 0;
  char v4 = 1;
  do
  {
    char v5 = (NSISLinearExpression *)pthread_getspecific(kPooledLinearExpressionKeys[v3]);
    if (v5) {
      BOOL v6 = v5 == self;
    }
    else {
      BOOL v6 = 0;
    }
    char v7 = !v6;
    if ((v4 & 1) == 0) {
      break;
    }
    char v4 = 0;
    uint64_t v3 = 1;
  }
  while ((v7 & 1) != 0);
  if ((v7 & 1) == 0) {
    NSLog(&cfstr_Nsislinearexpr_1.isa, "-[NSISLinearExpression dealloc]", 755);
  }
  if (self->linExp.data.inline_slab.aligner == *MEMORY[0x1E4F1CFD0]) {
    free(self->linExp.data.extern_data.var0);
  }
  v8.receiver = self;
  v8.super_class = (Class)NSISLinearExpression;
  [(NSISLinearExpression *)&v8 dealloc];
}

- (_WORD)initWithInlineCapacity:(uint64_t)a3 engine:
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)NSISLinearExpression;
  char v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
  {
    if (a2 >= 0xFFFF) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithInlineCapacity_engine_, v5, @"NSISLinearExpression.m", 1077, @"Invalid parameter not satisfying: %@", @"capacity < UINT16_MAX");
    }
    v5[8] = a2;
    *((void *)v5 + 1) = a3;
  }
  return v5;
}

+ (id)newExpressionWithCapacity:(unint64_t)a3 engine:(id)a4
{
  BOOL v6 = (objc_class *)objc_opt_class();
  size_t v7 = malloc_good_size(12 * a3 + 30);
  if ((v7 - 30) / 0xC > a3) {
    a3 = (v7 - 30) / 0xC;
  }
  if (12 * a3 >= 0x31) {
    NSUInteger v8 = 12 * a3 - 48;
  }
  else {
    NSUInteger v8 = 0;
  }
  id v9 = NSAllocateObject(v6, v8, 0);
  return -[NSISLinearExpression initWithInlineCapacity:engine:](v9, a3, (uint64_t)a4);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && initialize_onceToken != -1)
  {
    dispatch_once(&initialize_onceToken, &__block_literal_global_5);
  }
}

uint64_t __34__NSISLinearExpression_initialize__block_invoke()
{
  pthread_key_create(kPooledLinearExpressionKeys, pooled_expression_destructor);
  pthread_key_create(kPooledLinearExpressionInUseKeys, 0);
  pthread_key_create(&kPooledLinearExpressionKeys[1], pooled_expression_destructor);
  return pthread_key_create(&kPooledLinearExpressionInUseKeys[1], 0);
}

- (NSISLinearExpression)init
{
  return 0;
}

- (NSISLinearExpression)initWithEngine:(id)a3
{
  if (self)
  {
    v4.receiver = self;
    v4.super_class = (Class)NSISLinearExpression;
    self = [(NSISLinearExpression *)&v4 init];
    if (self)
    {
      self->linExp.inline_capacity = 4;
      self->engine = (NSISEngine *)a3;
    }
  }
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [NSString stringWithFormat:@"%@ is not copyable", self];
  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v3 userInfo:0]);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (self->engine != (NSISEngine *)*((void *)a3 + 1)) {
    return 0;
  }
  uint64_t var_count = self->linExp.var_count;
  if (var_count != *((_DWORD *)a3 + 5) || self->linExp.constant != *((double *)a3 + 3)) {
    return 0;
  }
  p_data = (double *)&self->linExp.data;
  stored_extern_marker = self->linExp.data.extern_data.stored_extern_marker;
  NSUInteger v8 = (slab *)*MEMORY[0x1E4F1CFD0];
  if (stored_extern_marker == (slab *)*MEMORY[0x1E4F1CFD0])
  {
    var0 = (char *)self->linExp.data.extern_data.var0;
    unint64_t capacity = self->linExp.data.extern_data.capacity;
  }
  else
  {
    unint64_t capacity = self->linExp.inline_capacity;
    var0 = (char *)&self->linExp.data;
  }
  v12 = (double *)((char *)a3 + 32);
  id v13 = (slab *)*((void *)a3 + 4);
  if (v13 == v8)
  {
    v15 = (char *)*((void *)a3 + 5);
    uint64_t v14 = *((void *)a3 + 6);
  }
  else
  {
    uint64_t v14 = *((unsigned __int16 *)a3 + 8);
    v15 = (char *)a3 + 32;
  }
  if (stored_extern_marker == v8) {
    p_data = (double *)self->linExp.data.extern_data.var0;
  }
  if (v13 == v8) {
    v12 = (double *)*((void *)a3 + 5);
  }
  if (var_count)
  {
    v16 = &var0[8 * capacity];
    v17 = &v15[8 * v14];
    BOOL result = 1;
    while (1)
    {
      int v19 = *(_DWORD *)v16;
      v16 += 4;
      int v18 = v19;
      int v20 = *(_DWORD *)v17;
      v17 += 4;
      if (v18 != v20 || *p_data != *v12) {
        break;
      }
      ++v12;
      ++p_data;
      if (!--var_count) {
        return result;
      }
    }
    return 0;
  }
  return 1;
}

- (unint64_t)hash
{
  p_data = (double *)&self->linExp.data;
  unint64_t constant = (unint64_t)self->linExp.constant;
  uint64_t var_count = self->linExp.var_count;
  if (self->linExp.data.inline_slab.aligner == *MEMORY[0x1E4F1CFD0])
  {
    p_data = (double *)self->linExp.data.extern_data.var0;
    unint64_t capacity = self->linExp.data.extern_data.capacity;
    if (!var_count) {
      return constant;
    }
  }
  else
  {
    unint64_t capacity = self->linExp.inline_capacity;
    if (!var_count) {
      return constant;
    }
  }
  BOOL v6 = &p_data[capacity];
  do
  {
    double v7 = *p_data++;
    uint64_t v8 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithDouble:", v7), "hash");
    LODWORD(v7) = *(_DWORD *)v6;
    BOOL v6 = (double *)((char *)v6 + 4);
    unint64_t constant = v8 - constant + 32 * constant + (-1640531535 * LODWORD(v7));
    --var_count;
  }
  while (var_count);
  return constant;
}

- (void)removeVariable:(id)a3
{
  uint64_t v4 = 0;
  engine = self->engine;
  while (*((NSISEngine **)a3 + v4 + 3) != engine)
  {
    if (++v4 == 3) {
      goto LABEL_6;
    }
  }
  unsigned int v6 = *((_DWORD *)a3 + v4 + 12);
  if (v6 != -1) {
    goto LABEL_8;
  }
LABEL_6:
  if (!*((void *)a3 + 2)) {
    return;
  }
  unsigned int v6 = [a3 overflowEngineVarIndexForEngine:engine];
  if (v6 == -1) {
    return;
  }
LABEL_8:
  NSISLinExpRemoveVar(&self->linExp.inline_capacity, v6);
}

- (double)coefficientForVariable:(id)a3
{
  uint64_t v4 = 0;
  engine = self->engine;
  while (*((NSISEngine **)a3 + v4 + 3) != engine)
  {
    if (++v4 == 3) {
      goto LABEL_6;
    }
  }
  unsigned int v6 = *((_DWORD *)a3 + v4 + 12);
  if (v6 != -1) {
    goto LABEL_8;
  }
LABEL_6:
  if (!*((void *)a3 + 2)) {
    return 0.0;
  }
  unsigned int v6 = [a3 overflowEngineVarIndexForEngine:engine];
  if (v6 == -1) {
    return 0.0;
  }
LABEL_8:
  return NSISLinExpCoefficientForVar((uint64_t)&self->linExp, v6);
}

- (void)replaceVariable:(id)a3 withVariable:(id)a4 coefficient:(double)a5
{
  [(NSISEngine *)self->engine beginBookkeepingForVariableIfNeeded:a4];
  uint64_t v9 = 0;
  while ((NSISEngine *)*((void *)a3 + v9 + 3) != self->engine)
  {
    if (++v9 == 3) {
      goto LABEL_6;
    }
  }
  unsigned int v10 = *((_DWORD *)a3 + v9 + 12);
  if (v10 != -1) {
    goto LABEL_9;
  }
LABEL_6:
  if (!*((void *)a3 + 2) || (unsigned int v10 = objc_msgSend(a3, "overflowEngineVarIndexForEngine:"), v10 == -1))
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISLinExpVar variable_to_linexpvar(NSISLinearExpression *, NSISVariable *)"), @"NSISLinearExpression.m", 610, @"Expression %@ unable to find variable %@ in engine %p", self, a3, self->engine file lineNumber description];
    unsigned int v10 = 0;
  }
LABEL_9:
  uint64_t v12 = 0;
  while ((NSISEngine *)*((void *)a4 + v12 + 3) != self->engine)
  {
    if (++v12 == 3) {
      goto LABEL_14;
    }
  }
  unsigned int v13 = *((_DWORD *)a4 + v12 + 12);
  if (v13 != -1) {
    goto LABEL_17;
  }
LABEL_14:
  if (!*((void *)a4 + 2) || (unsigned int v13 = objc_msgSend(a4, "overflowEngineVarIndexForEngine:"), v13 == -1))
  {
    uint64_t v14 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISLinExpVar variable_to_linexpvar(NSISLinearExpression *, NSISVariable *)"), @"NSISLinearExpression.m", 610, @"Expression %@ unable to find variable %@ in engine %p", self, a4, self->engine file lineNumber description];
    unsigned int v13 = 0;
  }
LABEL_17:
  NSISLinExpReplaceVarWithVar(&self->linExp.inline_capacity, v10, v13, a5);
}

- (void)addExpression:(id)a3 times:(double)a4 processVariableNewToReceiver:(id)a5 processVariableDroppedFromReceiver:(id)a6
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __var_handlers_for_variable_handlers_block_invoke;
  v7[3] = &unk_1E5C570C0;
  v7[4] = self;
  v7[5] = a5;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __var_handlers_for_variable_handlers_block_invoke_2;
  v6[3] = &unk_1E5C570C0;
  v6[4] = self;
  v6[5] = a6;
  NSISLinExpAddExpressionWithProcessors(&self->linExp.inline_capacity, (uint64_t)a3 + 16, (uint64_t)v7, (uint64_t)v6, a4);
}

void __108__NSISLinearExpression_addExpression_times_processVariableNewToReceiver_processVariableDroppedFromReceiver___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

- (void)addVariable:(id)a3 coefficient:(double)a4 processVariableNewToReceiver:(id)a5 processVariableDroppedFromReceiver:(id)a6
{
  if (!a3)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "-[NSISLinearExpression addVariable:coefficient:processVariableNewToReceiver:processVariableDroppedFromReceiver:]"), @"NSISLinearExpression.m", 803, @"Attempt to add a nil NSISVariable to an expression.  This is probably a bug in autolayout.");
  }
  [(NSISEngine *)self->engine beginBookkeepingForVariableIfNeeded:a3];
  *(void *)&v12[0] = MEMORY[0x1E4F143A8];
  *(void *)&v12[1] = 3221225472;
  *(void *)&v12[2] = __112__NSISLinearExpression_addVariable_coefficient_processVariableNewToReceiver_processVariableDroppedFromReceiver___block_invoke;
  *(void *)&v12[3] = &unk_1E5C57298;
  *(void *)&v12[4] = self;
  *(void *)&v12[5] = a3;
  v12[6] = a4;
  v13[5] = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __var_handlers_for_variable_handlers_block_invoke;
  v14[3] = &unk_1E5C570C0;
  v14[4] = self;
  v14[5] = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __var_handlers_for_variable_handlers_block_invoke_2;
  v13[3] = &unk_1E5C570C0;
  v13[4] = self;
  __112__NSISLinearExpression_addVariable_coefficient_processVariableNewToReceiver_processVariableDroppedFromReceiver___block_invoke(v12, (uint64_t)v14, (uint64_t)v13);
}

void __112__NSISLinearExpression_addVariable_coefficient_processVariableNewToReceiver_processVariableDroppedFromReceiver___block_invoke(double *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v8 = *((void *)a1 + 4);
  double v7 = (void *)*((void *)a1 + 5);
  while (v7[v6 + 3] != *(void *)(v8 + 8))
  {
    if (++v6 == 3) {
      goto LABEL_6;
    }
  }
  unsigned int v9 = *((_DWORD *)v7 + v6 + 12);
  if (v9 != -1) {
    goto LABEL_9;
  }
LABEL_6:
  if (!v7[2] || (unsigned int v9 = objc_msgSend(v7, "overflowEngineVarIndexForEngine:"), v9 == -1))
  {
    unsigned int v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISLinExpVar variable_to_linexpvar(NSISLinearExpression *, NSISVariable *)"), @"NSISLinearExpression.m", 610, @"Expression %@ unable to find variable %@ in engine %p", v8, v7, *(void *)(v8 + 8) file lineNumber description];
    unsigned int v9 = 0;
  }
LABEL_9:
  double v11 = a1[6];
  NSISLinExpAddVarWithProcessors((unsigned __int16 *)(v8 + 16), v9, a2, a3, v11);
}

- (void)setConstant:(double)a3
{
  self->linExp.unint64_t constant = a3;
}

- (void)replaceVariable:(id)a3 withVariablePlusDelta:(double)a4
{
  uint64_t v7 = 0;
  while ((NSISEngine *)*((void *)a3 + v7 + 3) != self->engine)
  {
    if (++v7 == 3) {
      goto LABEL_6;
    }
  }
  unsigned int v8 = *((_DWORD *)a3 + v7 + 12);
  if (v8 != -1) {
    goto LABEL_9;
  }
LABEL_6:
  if (!*((void *)a3 + 2) || (unsigned int v8 = objc_msgSend(a3, "overflowEngineVarIndexForEngine:"), v8 == -1))
  {
    unsigned int v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISLinExpVar variable_to_linexpvar(NSISLinearExpression *, NSISVariable *)"), @"NSISLinearExpression.m", 610, @"Expression %@ unable to find variable %@ in engine %p", self, a3, self->engine file lineNumber description];
    unsigned int v8 = 0;
  }
LABEL_9:
  p_linExp = &self->linExp;
  double v11 = NSISLinExpCoefficientForVar((uint64_t)p_linExp, v8) * a4;
  NSISLinExpIncrementConstant((uint64_t)p_linExp, v11);
}

- (void)replaceVariable:(id)a3 withVariablePlusDelta:(double)a4 timesVariable:(id)a5 processVariableNewToReceiver:(id)a6 processVariableDroppedFromReceiver:(id)a7
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __140__NSISLinearExpression_replaceVariable_withVariablePlusDelta_timesVariable_processVariableNewToReceiver_processVariableDroppedFromReceiver___block_invoke;
  v7[3] = &unk_1E5C572C0;
  v7[4] = self;
  v7[5] = a3;
  *(double *)&v7[7] = a4;
  void v7[6] = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __var_handlers_for_variable_handlers_block_invoke;
  v9[3] = &unk_1E5C570C0;
  v9[4] = self;
  v9[5] = a6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __var_handlers_for_variable_handlers_block_invoke_2;
  v8[3] = &unk_1E5C570C0;
  v8[4] = self;
  v8[5] = a7;
  __140__NSISLinearExpression_replaceVariable_withVariablePlusDelta_timesVariable_processVariableNewToReceiver_processVariableDroppedFromReceiver___block_invoke((uint64_t)v7, (uint64_t)v9, (uint64_t)v8);
}

void __140__NSISLinearExpression_replaceVariable_withVariablePlusDelta_timesVariable_processVariableNewToReceiver_processVariableDroppedFromReceiver___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  while (*(void *)(v7 + 24 + 8 * v6) != *(void *)(v8 + 8))
  {
    if (++v6 == 3) {
      goto LABEL_6;
    }
  }
  unsigned int v9 = *(_DWORD *)(v7 + 48 + 4 * v6);
  if (v9 != -1) {
    goto LABEL_9;
  }
LABEL_6:
  if (!*(void *)(v7 + 16) || (unsigned int v9 = objc_msgSend(*(id *)(a1 + 40), "overflowEngineVarIndexForEngine:"), v9 == -1))
  {
    unsigned int v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISLinExpVar variable_to_linexpvar(NSISLinearExpression *, NSISVariable *)"), @"NSISLinearExpression.m", 610, @"Expression %@ unable to find variable %@ in engine %p", v8, v7, *(void *)(v8 + 8) file lineNumber description];
    unsigned int v9 = 0;
  }
LABEL_9:
  uint64_t v11 = 0;
  double v12 = *(double *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void **)(a1 + 48);
  while (v14[v11 + 3] != *(void *)(v13 + 8))
  {
    if (++v11 == 3) {
      goto LABEL_14;
    }
  }
  unsigned int v15 = *((_DWORD *)v14 + v11 + 12);
  if (v15 != -1) {
    goto LABEL_17;
  }
LABEL_14:
  if (!v14[2] || (unsigned int v15 = objc_msgSend(v14, "overflowEngineVarIndexForEngine:"), v15 == -1))
  {
    v16 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISLinExpVar variable_to_linexpvar(NSISLinearExpression *, NSISVariable *)"), @"NSISLinearExpression.m", 610, @"Expression %@ unable to find variable %@ in engine %p", v13, v14, *(void *)(v13 + 8) file lineNumber description];
    unsigned int v15 = 0;
  }
LABEL_17:
  unsigned int v17 = v9;
  unsigned int v18 = v15;
  double v19 = v12 * NSISLinExpCoefficientForVar(v8 + 16, v17);
  NSISLinExpAddVarWithProcessors((unsigned __int16 *)(v8 + 16), v18, a2, a3, v19);
}

- (void)replaceVariable:(id)a3 withExpression:(id)a4 processVariableNewToReceiver:(id)a5 processVariableDroppedFromReceiver:(id)a6
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __119__NSISLinearExpression_replaceVariable_withExpression_processVariableNewToReceiver_processVariableDroppedFromReceiver___block_invoke;
  v6[3] = &unk_1E5C572E8;
  v6[4] = self;
  v6[5] = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __var_handlers_for_variable_handlers_block_invoke;
  v8[3] = &unk_1E5C570C0;
  v8[4] = self;
  v8[5] = a5;
  void v6[6] = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __var_handlers_for_variable_handlers_block_invoke_2;
  v7[3] = &unk_1E5C570C0;
  v7[4] = self;
  v7[5] = a6;
  __119__NSISLinearExpression_replaceVariable_withExpression_processVariableNewToReceiver_processVariableDroppedFromReceiver___block_invoke(v6, (uint64_t)v8, (uint64_t)v7);
}

void __119__NSISLinearExpression_replaceVariable_withExpression_processVariableNewToReceiver_processVariableDroppedFromReceiver___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v8 = a1[4];
  uint64_t v7 = (void *)a1[5];
  while (v7[v6 + 3] != *(void *)(v8 + 8))
  {
    if (++v6 == 3) {
      goto LABEL_6;
    }
  }
  unsigned int v9 = *((_DWORD *)v7 + v6 + 12);
  if (v9 != -1) {
    goto LABEL_9;
  }
LABEL_6:
  if (!v7[2] || (unsigned int v9 = objc_msgSend(v7, "overflowEngineVarIndexForEngine:"), v9 == -1))
  {
    unsigned int v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSISLinExpVar variable_to_linexpvar(NSISLinearExpression *, NSISVariable *)"), @"NSISLinearExpression.m", 610, @"Expression %@ unable to find variable %@ in engine %p", v8, v7, *(void *)(v8 + 8) file lineNumber description];
    unsigned int v9 = 0;
  }
LABEL_9:
  uint64_t v11 = a1[6] + 16;
  NSISLinExpReplaceVarWithExpression((unsigned __int16 *)(v8 + 16), v9, v11, a2, a3);
}

- (id)description
{
  return (id)NSISLinExpDescriptionInEngine((uint64_t)&self->linExp, (uint64_t)self->engine);
}

- (void)enumerateVariablesAndCoefficients:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__NSISLinearExpression_enumerateVariablesAndCoefficients___block_invoke;
  v3[3] = &unk_1E5C57360;
  v3[4] = self;
  v3[5] = a3;
  NSISLinExpEnumerateVarsAndCoefficients(&self->linExp.inline_capacity, (uint64_t)v3);
}

uint64_t __58__NSISLinearExpression_enumerateVariablesAndCoefficients___block_invoke(uint64_t a1, unsigned int a2, double a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) variableForEngineVarIndex:a2];
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, __n128))(v4 + 16);
  v7.n128_f64[0] = a3;
  return v6(v4, v5, v7);
}

- (void)enumerateVariables:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__NSISLinearExpression_enumerateVariables___block_invoke;
  v3[3] = &unk_1E5C570C0;
  v3[4] = self;
  v3[5] = a3;
  NSISLinExpEnumerateVars(&self->linExp.inline_capacity, (uint64_t)v3);
}

uint64_t __43__NSISLinearExpression_enumerateVariables___block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) variableForEngineVarIndex:a2];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

- (BOOL)enumerateVariablesAndCoefficientsUntil:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__NSISLinearExpression_enumerateVariablesAndCoefficientsUntil___block_invoke;
  v4[3] = &unk_1E5C57388;
  v4[4] = self;
  v4[5] = a3;
  return NSISLinExpEnumerateVarsAndCoefficientsUntil(&self->linExp.inline_capacity, (uint64_t)v4);
}

uint64_t __63__NSISLinearExpression_enumerateVariablesAndCoefficientsUntil___block_invoke(uint64_t a1, unsigned int a2, double a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) variableForEngineVarIndex:a2];
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, __n128))(v4 + 16);
  v7.n128_f64[0] = a3;
  return v6(v4, v5, v7);
}

- (unint64_t)variableCount
{
  return self->linExp.var_count;
}

- (id)variablesArray
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__NSISLinearExpression_variablesArray__block_invoke;
  v5[3] = &unk_1E5C573B0;
  v5[4] = v3;
  v5[5] = self;
  NSISLinExpEnumerateVars(&self->linExp.inline_capacity, (uint64_t)v5);
  return v3;
}

uint64_t __38__NSISLinearExpression_variablesArray__block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 8) variableForEngineVarIndex:a2];
  return [v2 addObject:v3];
}

- (void)scaleBy:(double)a3
{
}

- (void)verifyInternalIntegrity
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  p_data = &self->linExp.data;
  unint64_t var_count = self->linExp.var_count;
  uint64_t v19 = *MEMORY[0x1E4F1CFD0];
  unsigned int v17 = self;
  if (self->linExp.data.inline_slab.aligner == *MEMORY[0x1E4F1CFD0])
  {
    var0 = (double *)self->linExp.data.extern_data.var0;
    unint64_t capacity = self->linExp.data.extern_data.capacity;
    if (!var_count) {
      goto LABEL_14;
    }
  }
  else
  {
    unint64_t capacity = self->linExp.inline_capacity;
    var0 = (double *)&self->linExp.data;
    if (!var_count) {
      goto LABEL_14;
    }
  }
  uint64_t v8 = 0;
  unsigned int v9 = &var0[capacity];
  unsigned int v10 = -1;
  do
  {
    if (var0[v8] == 0.0) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, @"NSISLinearExpression.m", 1055, @"Nonzero coefficient expected");
    }
    if (objc_msgSend(v3, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *((unsigned int *)v9 + v8))))objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, @"NSISLinearExpression.m", 1056, @"Variable is in the array twice"); {
    uint64_t v11 = *((unsigned int *)v9 + v8);
    }
    if (v8 && v10 >= v11)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, @"NSISLinearExpression.m", 1058, @"Variables should be in ascending order");
      uint64_t v11 = *((unsigned int *)v9 + v8);
    }
    objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v11));
    ++v8;
    unsigned int v10 = v11;
  }
  while (var_count != v8);
LABEL_14:

  if (p_data->inline_slab.aligner != v19 && capacity > var_count)
  {
    uint64_t v13 = capacity - var_count;
    uint64_t v14 = &var0[var_count];
    unsigned int v15 = (_DWORD *)&var0[capacity] + var_count;
    do
    {
      if (*v15++) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, @"NSISLinearExpression.m", 1068, @"Nonzero variable in excess capacity");
      }
      if (*v14 != 0.0) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", *v14), "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, @"NSISLinearExpression.m", 1069, @"Nonzero coefficient in excess capacity");
      }
      ++v14;
      --v13;
    }
    while (v13);
  }
}

+ (id)newExpressionWithCapacity:(unint64_t)a3
{
  return 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id v8 = [(NSISLinearExpression *)self variablesArray];
  return [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (id)copyContentsAndReturnToPool
{
  uint64_t v2 = 0;
  for (char i = 1; ; char i = 0)
  {
    char v4 = i;
    if (pthread_getspecific(kPooledLinearExpressionKeys[v2]) == self) {
      break;
    }
    uint64_t v2 = 1;
    if ((v4 & 1) == 0)
    {
      return self;
    }
  }
  if (!pthread_getspecific(kPooledLinearExpressionInUseKeys[v2])) {
    NSLog(&cfstr_Nsislinearexpr_1.isa, "-[NSISLinearExpression copyContentsAndReturnToPool]", 1143);
  }
  pthread_setspecific(kPooledLinearExpressionInUseKeys[v2], 0);
  unint64_t var_count = self->linExp.var_count;
  __n128 v7 = +[NSISLinearExpression newExpressionWithCapacity:var_count engine:self->engine];
  expression_ensure_capacity(v7 + 8, var_count);
  p_data = (char *)&self->linExp.data;
  if (self->linExp.data.inline_slab.aligner == *MEMORY[0x1E4F1CFD0])
  {
    p_data = (char *)self->linExp.data.extern_data.var0;
    unint64_t capacity = self->linExp.data.extern_data.capacity;
  }
  else
  {
    unint64_t capacity = self->linExp.inline_capacity;
  }
  unsigned int v10 = (char *)(v7 + 16);
  if (*((void *)v7 + 4) == *MEMORY[0x1E4F1CFD0])
  {
    unsigned int v10 = (char *)*((void *)v7 + 5);
    uint64_t v11 = *((void *)v7 + 6);
  }
  else
  {
    uint64_t v11 = v7[8];
  }
  double v12 = &p_data[8 * capacity];
  memmove(&v10[8 * v11], v12, 4 * var_count);
  bzero(v12, 4 * var_count);
  memmove(v10, p_data, 8 * var_count);
  self->linExp.unint64_t var_count = 0;
  *((_DWORD *)v7 + 5) = var_count;
  *((void *)v7 + 3) = *(void *)&self->linExp.constant;
  self->linExp.unint64_t constant = 0.0;
  self->engine = 0;
  return v7;
}

+ (id)acquireFromPoolForUseCase:(int64_t)a3
{
  return 0;
}

@end