@interface HMDBackingStoreLogUpdateOperation
- (HMDBackingStoreLogUpdateOperation)initWithRowIDs:(id)a3 failedPushedTo:(unint64_t)a4;
- (HMDBackingStoreLogUpdateOperation)initWithRowIDs:(id)a3 mask:(int64_t)a4 set:(int64_t)a5;
- (HMDBackingStoreLogUpdateOperation)initWithRowIDs:(id)a3 successfullyPushedTo:(unint64_t)a4;
- (NSArray)values;
- (id)mainReturningError;
- (int64_t)maskValue;
- (int64_t)setValue;
- (void)setMaskValue:(int64_t)a3;
- (void)setSetValue:(int64_t)a3;
- (void)setValues:(id)a3;
@end

@implementation HMDBackingStoreLogUpdateOperation

- (void).cxx_destruct
{
}

- (void)setSetValue:(int64_t)a3
{
  self->_setValue = a3;
}

- (int64_t)setValue
{
  return self->_setValue;
}

- (void)setMaskValue:(int64_t)a3
{
  self->_maskValue = a3;
}

- (int64_t)maskValue
{
  return self->_maskValue;
}

- (void)setValues:(id)a3
{
}

- (NSArray)values
{
  return self->_values;
}

- (id)mainReturningError
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [(HMDBackingStoreOperation *)self store];
  v4 = [v3 local];
  v5 = [v4 _begin];

  if (!v5)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v6 = [(HMDBackingStoreLogUpdateOperation *)self values];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      v5 = 0;
      uint64_t v9 = *(void *)v19;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        if (v5) {
          break;
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
        v12 = [(HMDBackingStoreOperation *)self store];
        v13 = [v12 local];
        v5 = objc_msgSend(v13, "_updateLog:mask:set:", objc_msgSend(v11, "unsignedIntegerValue"), -[HMDBackingStoreLogUpdateOperation maskValue](self, "maskValue"), -[HMDBackingStoreLogUpdateOperation setValue](self, "setValue"));

        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v8) {
            goto LABEL_4;
          }

          if (!v5) {
            goto LABEL_15;
          }
LABEL_13:
          v14 = [(HMDBackingStoreOperation *)self store];
          v15 = [v14 local];
          [v15 _rollback];
          goto LABEL_16;
        }
      }

      goto LABEL_13;
    }

LABEL_15:
    v14 = [(HMDBackingStoreOperation *)self store];
    v15 = [v14 local];
    v5 = [v15 _commit];
LABEL_16:
  }
  id v16 = v5;

  return v16;
}

- (HMDBackingStoreLogUpdateOperation)initWithRowIDs:(id)a3 failedPushedTo:(unint64_t)a4
{
  return [(HMDBackingStoreLogUpdateOperation *)self initWithRowIDs:a3 mask:a4 << 16 set:0];
}

- (HMDBackingStoreLogUpdateOperation)initWithRowIDs:(id)a3 successfullyPushedTo:(unint64_t)a4
{
  return [(HMDBackingStoreLogUpdateOperation *)self initWithRowIDs:a3 mask:a4 << 16 set:a4 << 16];
}

- (HMDBackingStoreLogUpdateOperation)initWithRowIDs:(id)a3 mask:(int64_t)a4 set:(int64_t)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDBackingStoreLogUpdateOperation;
  uint64_t v10 = [(HMDBackingStoreOperation *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_values, a3);
    v11->_maskValue = a4;
    v11->_setValue = a5;
    v12 = v11;
  }

  return v11;
}

@end