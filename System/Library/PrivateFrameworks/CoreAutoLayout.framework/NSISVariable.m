@interface NSISVariable
+ (id)variableMarkingConstraint:(id)a3 valueRestriction:(int)a4 shouldBeMinimized:(BOOL)a5;
+ (id)variableWithDelegate:(id)a3 valueRestriction:(int)a4 shouldBeMinimized:(BOOL)a5;
+ (id)variableWithName:(id)a3 valueRestriction:(int)a4 shouldBeMinimized:(BOOL)a5;
+ (id)variableWithName:(id)a3 valueRestriction:(int)a4 shouldBeMinimized:(BOOL)a5 valueIsUserObservable:(BOOL)a6;
- ($738B17BD11CC339B30296C0EA03CEC2B)overflowEngineVarIndexForEngine:(id)a3;
- (BOOL)markedConstraintIsEligibleForIntegralizationAdjustment;
- (BOOL)shouldBeIntegral;
- (BOOL)shouldBeMinimized;
- (BOOL)valueIsUserVisible;
- (NSArray)engines;
- (NSISVariable)init;
- (NSISVariable)initWithCoder:(id)a3;
- (NSISVariableDelegate)delegate;
- (double)allowedMagnitudeForIntegralizationAdjustmentOfMarkedConstraint;
- (id)description;
- (id)descriptionInEngine:(id)a3;
- (id)markedConstraint;
- (int)orientationHint;
- (int)valueRestriction;
- (uint64_t)_delegateDescription;
- (uint64_t)_enumerateEngines:(uint64_t)result;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NSISVariable

- (int)orientationHint
{
  return [(NSISVariableDelegate *)self->_delegate nsis_orientationHintForVariable:self];
}

- (NSISVariableDelegate)delegate
{
  return self->_delegate;
}

+ (id)variableWithName:(id)a3 valueRestriction:(int)a4 shouldBeMinimized:(BOOL)a5
{
  return (id)[a1 variableWithName:a3 valueRestriction:*(void *)&a4 shouldBeMinimized:a5 valueIsUserObservable:0];
}

+ (id)variableWithName:(id)a3 valueRestriction:(int)a4 shouldBeMinimized:(BOOL)a5 valueIsUserObservable:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  v10 = objc_alloc_init(NSISInlineStorageVariable);
  [(NSISVariable *)v10 setDelegate:v10];
  [(NSISInlineStorageVariable *)v10 setName:a3];
  [(NSISInlineStorageVariable *)v10 setValueRestriction:v8];
  [(NSISInlineStorageVariable *)v10 setShouldBeMinimized:v7];
  [(NSISInlineStorageVariable *)v10 setValueIsUserObservable:v6];
  return v10;
}

+ (id)variableMarkingConstraint:(id)a3 valueRestriction:(int)a4 shouldBeMinimized:(BOOL)a5
{
  if (a4 == 2)
  {
    if (a5)
    {
      BOOL v6 = @"It doesn't make sense to minimize a variable that is restricted to zero";
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (a4 == 1)
  {
LABEL_9:
    BOOL v6 = (__CFString *)objc_opt_class();
    goto LABEL_10;
  }
  if (a4) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = @"An unrestricted variable cannot be a marker";
  }
LABEL_10:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v6 userInfo:0]);
  }
  id v7 = objc_alloc_init((Class)v6);
  [v7 setDelegate:a3];
  return v7;
}

+ (id)variableWithDelegate:(id)a3 valueRestriction:(int)a4 shouldBeMinimized:(BOOL)a5
{
  if (a4 == 2)
  {
    BOOL v6 = @"A variable that is restricted to take value zero should always be a marker";
    goto LABEL_10;
  }
  if (a4 != 1)
  {
    if (a4)
    {
      BOOL v6 = 0;
      goto LABEL_10;
    }
    if (a5)
    {
      BOOL v6 = @"An unrestricted variable cannot be minimized";
      goto LABEL_10;
    }
  }
  BOOL v6 = (__CFString *)objc_opt_class();
LABEL_10:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v6 userInfo:0]);
  }
  id v7 = objc_alloc_init((Class)v6);
  [v7 setDelegate:a3];
  return v7;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (NSISVariableDelegate *)a3;
}

- (NSISVariable)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSISVariable;
  result = [(NSISVariable *)&v3 init];
  result->_ident = atomic_fetch_add(&init_sNextIdent, 1u);
  return result;
}

- (void)dealloc
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __23__NSISVariable_dealloc__block_invoke;
  v4[3] = &unk_1E5C567E0;
  v4[4] = self;
  -[NSISVariable _enumerateEngines:]((uint64_t)self, (uint64_t)v4);

  v3.receiver = self;
  v3.super_class = (Class)NSISVariable;
  [(NSISVariable *)&v3 dealloc];
}

- (uint64_t)_enumerateEngines:(uint64_t)result
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = 0;
    uint64_t v5 = result + 24;
    do
    {
      if (*(void *)(v5 + v4)) {
        (*(void (**)(uint64_t))(a2 + 16))(a2);
      }
      v4 += 8;
    }
    while (v4 != 24);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    BOOL v6 = objc_msgSend(*(id *)(v3 + 16), "keyEnumerator", 0);
    result = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (result)
    {
      uint64_t v7 = result;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v6);
          }
          if (*(void *)(*((void *)&v10 + 1) + 8 * v9)) {
            (*(void (**)(uint64_t))(a2 + 16))(a2);
          }
          ++v9;
        }
        while (v7 != v9);
        result = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
        uint64_t v7 = result;
      }
      while (result);
    }
  }
  return result;
}

- (unint64_t)hash
{
  return self->_ident;
}

uint64_t __23__NSISVariable_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return [a2 endBookkeepingForVariableIfUnused:*(void *)(a1 + 32)];
}

- (NSISVariable)initWithCoder:(id)a3
{
  uint64_t v5 = [(NSISVariable *)self init];
  if (v5)
  {
    uint64_t v6 = [a3 decodeObjectForKey:@"NSISVariable_delegate"];
    v5->_delegate = (NSISVariableDelegate *)v6;
    if (!v6)
    {
      uint64_t v7 = v5;
      if (!v5->_delegate) {
      return 0;
      }
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSISVariable.m", 186, @"NSISVariable (%@) cannot be encoded with delegate (%@) that does not conform to NSCoding", self, self->_delegate);
  }
  delegate = self->_delegate;
  [a3 encodeConditionalObject:delegate forKey:@"NSISVariable_delegate"];
}

- (NSArray)engines
{
  uint64_t v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __23__NSISVariable_engines__block_invoke;
  v5[3] = &unk_1E5C567E0;
  v5[4] = v3;
  -[NSISVariable _enumerateEngines:]((uint64_t)self, (uint64_t)v5);
  return v3;
}

uint64_t __23__NSISVariable_engines__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- ($738B17BD11CC339B30296C0EA03CEC2B)overflowEngineVarIndexForEngine:(id)a3
{
  value = 0;
  if (NSMapMember(self->_overflowEngines, a3, 0, &value)) {
    return ($738B17BD11CC339B30296C0EA03CEC2B)value;
  }
  else {
    return ($738B17BD11CC339B30296C0EA03CEC2B)-1;
  }
}

- (uint64_t)_delegateDescription
{
  if (result)
  {
    uint64_t v1 = result;
    result = objc_msgSend(*(id *)(result + 8), "nsis_descriptionOfVariable:", result);
    if (!result) {
      return objc_msgSend(NSString, "stringWithFormat:", @"<orphaned without delegate (bug!):%p>", v1);
    }
  }
  return result;
}

- (id)descriptionInEngine:(id)a3
{
  if (self)
  {
    uint64_t v5 = (void *)[(NSISVariableDelegate *)self->_delegate nsis_descriptionOfVariable:self];
    if (!v5) {
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"<orphaned without delegate (bug!):%p>", self);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = 0;
  uint64_t v7 = NSString;
  uint64_t ident = self->_ident;
  while (self->_engines[v6] != a3)
  {
    if (++v6 == 3) {
      goto LABEL_9;
    }
  }
  uint64_t value = self->_engineVarIndexes[v6].value;
  if (value != -1) {
    goto LABEL_12;
  }
LABEL_9:
  if (self->_overflowEngines) {
    uint64_t value = (uint64_t)[(NSISVariable *)self overflowEngineVarIndexForEngine:a3];
  }
  else {
    uint64_t value = 0xFFFFFFFFLL;
  }
LABEL_12:
  uint64_t v10 = [v7 stringWithFormat:@"{id: %u, var: %u}", ident, value];
  return (id)[v5 stringByAppendingString:v10];
}

- (id)description
{
  if (self)
  {
    uint64_t v3 = (void *)[(NSISVariableDelegate *)self->_delegate nsis_descriptionOfVariable:self];
    if (!v3) {
      uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"<orphaned without delegate (bug!):%p>", self);
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"{id: %u}", self->_ident);
  return (id)[v3 stringByAppendingString:v4];
}

- (BOOL)shouldBeIntegral
{
  return 0;
}

- (double)allowedMagnitudeForIntegralizationAdjustmentOfMarkedConstraint
{
  return 0.0;
}

- (BOOL)markedConstraintIsEligibleForIntegralizationAdjustment
{
  return 0;
}

- (BOOL)valueIsUserVisible
{
  uint64_t v3 = [(NSISVariable *)self delegate];
  return [(NSISVariableDelegate *)v3 nsis_valueOfVariableIsUserObservable:self];
}

- (int)valueRestriction
{
  v2 = NSString;
  uint64_t v3 = NSStringFromSelector(a2);
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(v2, "stringWithFormat:", @"Method %@ must be implemented by subclasser %@", v3, objc_opt_class()), 0 reason userInfo];
  objc_exception_throw(v4);
}

- (BOOL)shouldBeMinimized
{
  v2 = NSString;
  uint64_t v3 = NSStringFromSelector(a2);
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(v2, "stringWithFormat:", @"Method %@ must be implemented by subclasser %@", v3, objc_opt_class()), 0 reason userInfo];
  objc_exception_throw(v4);
}

- (id)markedConstraint
{
  v2 = NSString;
  uint64_t v3 = NSStringFromSelector(a2);
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(v2, "stringWithFormat:", @"Method %@ must be implemented by subclasser %@", v3, objc_opt_class()), 0 reason userInfo];
  objc_exception_throw(v4);
}

@end