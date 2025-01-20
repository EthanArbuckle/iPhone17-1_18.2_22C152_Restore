@interface FPSetFlagsOperation
- (FPSetFlagsOperation)initWithItems:(id)a3 flags:(unint64_t)a4;
- (id)fp_prettyDescription;
- (id)replicateForItems:(id)a3;
- (unint64_t)transformItem:(id)a3 atIndex:(unint64_t)a4;
@end

@implementation FPSetFlagsOperation

- (id)replicateForItems:(id)a3
{
  v4 = [FPSetFlagsOperation alloc];
  v5 = [(FPTransformOperation *)self items];
  v6 = [(FPSetFlagsOperation *)v4 initWithItems:v5 flags:self->_flags];

  return v6;
}

- (FPSetFlagsOperation)initWithItems:(id)a3 flags:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)FPSetFlagsOperation;
  v5 = [(FPTransformOperation *)&v8 initWithItemsOfDifferentProviders:a3 action:0];
  v6 = v5;
  if (v5)
  {
    v5->_flags = a4;
    [(FPActionOperation *)v5 setSetupRemoteOperationService:1];
  }
  return v6;
}

- (unint64_t)transformItem:(id)a3 atIndex:(unint64_t)a4
{
  return 256;
}

- (id)fp_prettyDescription
{
  v3 = NSString;
  v4 = [(FPTransformOperation *)self items];
  v5 = objc_msgSend(v4, "fp_itemIdentifiers");
  uint64_t v6 = FPAbbreviatedArrayDescription(v5);
  v7 = (void *)v6;
  unint64_t flags = self->_flags;
  uint64_t v9 = 101;
  if ((flags & 0x10) == 0) {
    uint64_t v9 = 45;
  }
  uint64_t v10 = 104;
  if ((flags & 8) == 0) {
    uint64_t v10 = 45;
  }
  uint64_t v16 = v10;
  uint64_t v17 = v9;
  uint64_t v11 = 120;
  if ((flags & 1) == 0) {
    uint64_t v11 = 45;
  }
  uint64_t v12 = 119;
  if ((flags & 4) == 0) {
    uint64_t v12 = 45;
  }
  uint64_t v13 = 114;
  if ((self->_flags & 2) == 0) {
    uint64_t v13 = 45;
  }
  v14 = [v3 stringWithFormat:@"set flags %@ to %c%c%c%c%c", v6, v13, v12, v11, v16, v17];

  return v14;
}

@end