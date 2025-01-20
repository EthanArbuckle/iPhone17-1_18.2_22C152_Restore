@interface HIDTransaction
- (BOOL)commitElements:(id)a3 error:(id *)a4;
- (BOOL)commitElements:(id)a3 error:(id *)a4 timeout:(int64_t)a5 callback:(id)a6;
- (HIDTransaction)initWithDevice:(id)a3;
- (id)description;
- (int64_t)direction;
- (void)dealloc;
- (void)setDirection:(int64_t)a3;
@end

@implementation HIDTransaction

- (HIDTransaction)initWithDevice:(id)a3
{
  v4 = (__IOHIDDevice *)a3;
  v9.receiver = self;
  v9.super_class = (Class)HIDTransaction;
  v5 = [(HIDTransaction *)&v9 init];
  if (v5
    && (IOHIDTransactionRef v6 = IOHIDTransactionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4, kIOHIDTransactionDirectionTypeInput, 1u),
        (v5->_transaction = v6) != 0))
  {
    v7 = v5;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  transaction = self->_transaction;
  if (transaction) {
    CFRelease(transaction);
  }
  v4.receiver = self;
  v4.super_class = (Class)HIDTransaction;
  [(HIDTransaction *)&v4 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@", self->_transaction];
}

- (int64_t)direction
{
  return IOHIDTransactionGetDirection(self->_transaction);
}

- (void)setDirection:(int64_t)a3
{
}

- (BOOL)commitElements:(id)a3 error:(id *)a4
{
  return [(HIDTransaction *)self commitElements:a3 error:a4 timeout:0 callback:0];
}

- (BOOL)commitElements:(id)a3 error:(id *)a4 timeout:(int64_t)a5 callback:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v10);
        }
        IOHIDTransactionAddElement(self->_transaction, *(IOHIDElementRef *)(*((void *)&v21 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      uint64_t v13 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }
  transaction = self->_transaction;
  if (v11)
  {
    v17 = _Block_copy(v11);
    uint64_t v18 = IOHIDTransactionCommitWithCallback(transaction, (double)a5, (IOHIDCallback)asyncCommitCallback, v17);
  }
  else
  {
    uint64_t v18 = IOHIDTransactionCommit(self->_transaction);
  }
  uint64_t v19 = v18;
  IOHIDTransactionClear(self->_transaction);
  if (v19)
  {
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithIOReturn:v19];
    }
    if (v11) {
      _Block_release(v11);
    }
  }

  return v19 == 0;
}

@end