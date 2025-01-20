@interface CUIKUserOperation
+ (id)operationForContext:(id)a3;
+ (id)operationWithObjects:(id)a3 span:(int64_t)a4;
- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4;
- (BOOL)createdAsInverseOfAnotherOperation;
- (BOOL)executeWithUndoDelegate:(id)a3;
- (BOOL)inverseOperationPrecomputed;
- (CUIKUserOperation)initWithObjects:(id)a3 span:(int64_t)a4 createdAsInverseOfAnotherOperation:(BOOL)a5;
- (CUIKUserOperation)precomputedInverseOperation;
- (Class)_inverseOperationClass;
- (EKEventStore)eventStore;
- (NSArray)objects;
- (NSArray)originalObjects;
- (NSArray)originalSliceDescriptions;
- (NSError)error;
- (NSString)actionName;
- (NSString)precomputedActionName;
- (id)_actionName;
- (id)_inverseOperation;
- (id)inverseOperation;
- (int64_t)_spanFromSpan:(int64_t)a3 objects:(id)a4;
- (int64_t)span;
- (void)_precomputeActionName;
- (void)_precomputeInverseOperation;
- (void)setCreatedAsInverseOfAnotherOperation:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setEventStore:(id)a3;
- (void)setInverseOperationPrecomputed:(BOOL)a3;
- (void)setOriginalObjects:(id)a3;
- (void)setOriginalSliceDescriptions:(id)a3;
- (void)setPrecomputedActionName:(id)a3;
- (void)setPrecomputedInverseOperation:(id)a3;
@end

@implementation CUIKUserOperation

+ (id)operationForContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [v4 objectsBeingEdited];
  uint64_t v7 = [v4 _currentSpan];

  v8 = (void *)[v5 initWithObjects:v6 span:v7 createdAsInverseOfAnotherOperation:0];

  return v8;
}

+ (id)operationWithObjects:(id)a3 span:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithObjects:v6 span:a4 createdAsInverseOfAnotherOperation:1];

  return v7;
}

- (CUIKUserOperation)initWithObjects:(id)a3 span:(int64_t)a4 createdAsInverseOfAnotherOperation:(BOOL)a5
{
  id v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CUIKUserOperation;
  v10 = [(CUIKUserOperation *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_objects, a3);
    v11->_span = [(CUIKUserOperation *)v11 _spanFromSpan:a4 objects:v9];
    uint64_t v12 = [v9 copy];
    originalObjects = v11->_originalObjects;
    v11->_originalObjects = (NSArray *)v12;

    v14 = [v9 firstObject];
    v15 = [v14 eventStore];
    objc_storeWeak((id *)&v11->_eventStore, v15);

    v11->_createdAsInverseOfAnotherOperation = a5;
  }

  return v11;
}

- (int64_t)_spanFromSpan:(int64_t)a3 objects:(id)a4
{
  int64_t v4 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [(CUIKUserOperation *)self objects];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      int64_t v4 = 1;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && ![v10 isFirstOccurrenceIncludingSlices]) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      int64_t v4 = 4;
    }
  }
  return v4;
}

- (NSString)actionName
{
  v3 = [(CUIKUserOperation *)self precomputedActionName];

  if (v3) {
    [(CUIKUserOperation *)self precomputedActionName];
  }
  else {
  int64_t v4 = [(CUIKUserOperation *)self _actionName];
  }

  return (NSString *)v4;
}

- (void)_precomputeActionName
{
  id v3 = [(CUIKUserOperation *)self _actionName];
  [(CUIKUserOperation *)self setPrecomputedActionName:v3];
}

- (BOOL)executeWithUndoDelegate:(id)a3
{
  id v7 = 0;
  BOOL v4 = [(CUIKUserOperation *)self _executeWithUndoDelegate:a3 error:&v7];
  id v5 = v7;
  [(CUIKUserOperation *)self setError:v5];

  return v4;
}

- (void)_precomputeInverseOperation
{
  id v3 = [(CUIKUserOperation *)self _inverseOperation];
  [(CUIKUserOperation *)self setPrecomputedInverseOperation:v3];

  [(CUIKUserOperation *)self setInverseOperationPrecomputed:1];
}

- (id)inverseOperation
{
  if ([(CUIKUserOperation *)self inverseOperationPrecomputed]) {
    [(CUIKUserOperation *)self precomputedInverseOperation];
  }
  else {
  id v3 = [(CUIKUserOperation *)self _inverseOperation];
  }

  return v3;
}

- (id)_inverseOperation
{
  id v3 = [(CUIKUserOperation *)self _inverseOperationClass];
  if (v3)
  {
    BOOL v4 = [(CUIKUserOperation *)self _objectsForInverse];
    if ([v4 count])
    {
      id v3 = [(objc_class *)v3 operationWithObjects:v4 span:[(CUIKUserOperation *)self _inverseOperationSpan]];
      id v5 = [(CUIKUserOperation *)self originalObjects];
      [(objc_class *)v3 setOriginalObjects:v5];
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setError:(id)a3
{
}

- (NSArray)objects
{
  return self->_objects;
}

- (EKEventStore)eventStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);

  return (EKEventStore *)WeakRetained;
}

- (void)setEventStore:(id)a3
{
}

- (int64_t)span
{
  return self->_span;
}

- (NSArray)originalObjects
{
  return self->_originalObjects;
}

- (void)setOriginalObjects:(id)a3
{
}

- (NSArray)originalSliceDescriptions
{
  return self->_originalSliceDescriptions;
}

- (void)setOriginalSliceDescriptions:(id)a3
{
}

- (NSString)precomputedActionName
{
  return self->_precomputedActionName;
}

- (void)setPrecomputedActionName:(id)a3
{
}

- (CUIKUserOperation)precomputedInverseOperation
{
  return self->_precomputedInverseOperation;
}

- (void)setPrecomputedInverseOperation:(id)a3
{
}

- (BOOL)inverseOperationPrecomputed
{
  return self->_inverseOperationPrecomputed;
}

- (void)setInverseOperationPrecomputed:(BOOL)a3
{
  self->_inverseOperationPrecomputed = a3;
}

- (BOOL)createdAsInverseOfAnotherOperation
{
  return self->_createdAsInverseOfAnotherOperation;
}

- (void)setCreatedAsInverseOfAnotherOperation:(BOOL)a3
{
  self->_createdAsInverseOfAnotherOperation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precomputedInverseOperation, 0);
  objc_storeStrong((id *)&self->_precomputedActionName, 0);
  objc_storeStrong((id *)&self->_originalSliceDescriptions, 0);
  objc_storeStrong((id *)&self->_originalObjects, 0);
  objc_destroyWeak((id *)&self->_eventStore);
  objc_storeStrong((id *)&self->_objects, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

- (id)_actionName
{
  return 0;
}

- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4
{
  return 0;
}

- (Class)_inverseOperationClass
{
  return 0;
}

@end