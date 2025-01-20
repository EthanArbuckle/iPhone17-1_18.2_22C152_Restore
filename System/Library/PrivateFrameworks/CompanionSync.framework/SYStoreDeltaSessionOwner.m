@interface SYStoreDeltaSessionOwner
- (SYStoreDeltaSessionOwner)initWithChanges:(id)a3;
- (unint64_t)changeCount;
- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5;
@end

@implementation SYStoreDeltaSessionOwner

- (SYStoreDeltaSessionOwner)initWithChanges:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SYStoreDeltaSessionOwner;
  v5 = [(SYStoreDeltaSessionOwner *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    changes = v5->_changes;
    v5->_changes = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (unint64_t)changeCount
{
  return [(NSArray *)self->_changes count];
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (uint64_t (**)(id, void *))a4;
  unint64_t currentIdx = self->_currentIdx;
  if (currentIdx >= [(NSArray *)self->_changes count])
  {
    unsigned int v15 = 2;
  }
  else
  {
    NSUInteger v10 = [(NSArray *)self->_changes count];
    unint64_t v11 = self->_currentIdx;
    if (v11 < v10)
    {
      NSUInteger v12 = v10;
      while (1)
      {
        v13 = [(NSArray *)self->_changes objectAtIndexedSubscript:v11];
        char v14 = v8[2](v8, v13);

        if ((v14 & 1) == 0) {
          break;
        }
        unint64_t v11 = self->_currentIdx + 1;
        self->_unint64_t currentIdx = v11;
        if (v11 >= v12) {
          goto LABEL_11;
        }
      }
      if ([v7 state] == 5)
      {
        unsigned int v15 = 5;
        goto LABEL_14;
      }
      unint64_t v11 = self->_currentIdx;
    }
LABEL_11:
    if (v11 < [(NSArray *)self->_changes count]) {
      unsigned int v15 = 1;
    }
    else {
      unsigned int v15 = 2;
    }
  }
LABEL_14:

  return v15;
}

- (void).cxx_destruct
{
}

@end