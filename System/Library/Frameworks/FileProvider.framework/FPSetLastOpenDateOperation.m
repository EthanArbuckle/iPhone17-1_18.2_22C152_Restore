@interface FPSetLastOpenDateOperation
- (FPSetLastOpenDateOperation)initWithItems:(id)a3 date:(id)a4;
- (id)fp_prettyDescription;
- (id)replicateForItems:(id)a3;
- (unint64_t)transformItem:(id)a3 atIndex:(unint64_t)a4;
@end

@implementation FPSetLastOpenDateOperation

- (id)replicateForItems:(id)a3
{
  id v4 = a3;
  v5 = [[FPSetLastOpenDateOperation alloc] initWithItems:v4 date:self->_date];

  return v5;
}

- (FPSetLastOpenDateOperation)initWithItems:(id)a3 date:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FPSetLastOpenDateOperation;
  v9 = [(FPTransformOperation *)&v13 initWithItemsOfDifferentProviders:v7 action:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_items, a3);
    v11 = v8;
    if (!v8)
    {
      v11 = [MEMORY[0x1E4F1C9C8] date];
    }
    objc_storeStrong((id *)&v10->_date, v11);
    if (!v8) {

    }
    [(FPActionOperation *)v10 setSetupRemoteOperationService:1];
  }

  return v10;
}

- (unint64_t)transformItem:(id)a3 atIndex:(unint64_t)a4
{
  return 8;
}

- (id)fp_prettyDescription
{
  v3 = NSString;
  id v4 = [(FPTransformOperation *)self items];
  v5 = objc_msgSend(v4, "fp_itemIdentifiers");
  v6 = FPAbbreviatedArrayDescription(v5);
  id v7 = [v3 stringWithFormat:@"set last used date %@ to %@", v6, self->_date];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end