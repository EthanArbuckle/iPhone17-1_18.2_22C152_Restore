@interface FPTrashOperation
- (FPTrashOperation)initWithItems:(id)a3;
- (id)fp_prettyDescription;
- (id)replicateForItems:(id)a3;
- (unint64_t)transformItem:(id)a3 atIndex:(unint64_t)a4;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)presendNotifications;
- (void)subclassPreflightWithCompletion:(id)a3;
@end

@implementation FPTrashOperation

- (id)replicateForItems:(id)a3
{
  id v3 = a3;
  v4 = [[FPTrashOperation alloc] initWithItems:v3];

  return v4;
}

- (FPTrashOperation)initWithItems:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FPTrashOperation;
  id v3 = [(FPTransformOperation *)&v6 initWithItemsOfDifferentProviders:a3 action:@"Trash"];
  v4 = v3;
  if (v3) {
    [(FPActionOperation *)v3 setSetupRemoteOperationService:1];
  }
  return v4;
}

- (void)subclassPreflightWithCompletion:(id)a3
{
  id v5 = a3;
  objc_super v6 = [(FPActionOperation *)self remoteServiceProxy];
  v7 = [(FPTransformOperation *)self items];
  v8 = objc_msgSend(v7, "fp_itemIDs");
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__FPTrashOperation_subclassPreflightWithCompletion___block_invoke;
  v10[3] = &unk_1E5AF5478;
  id v11 = v5;
  SEL v12 = a2;
  v10[4] = self;
  id v9 = v5;
  [v6 preflightTrashItemIDs:v8 completionHandler:v10];
}

uint64_t __52__FPTrashOperation_subclassPreflightWithCompletion___block_invoke(void *a1, uint64_t a2)
{
  id v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__FPTrashOperation_subclassPreflightWithCompletion___block_invoke_2;
  v6[3] = &unk_1E5AF4148;
  uint64_t v4 = a1[6];
  v6[4] = v3;
  v6[5] = v4;
  return [v3 tryRecoveringFromPreflightErrors:a2 recoveryHandler:v6 completion:v2];
}

uint64_t __52__FPTrashOperation_subclassPreflightWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!a3) {
    goto LABEL_5;
  }
  if (a3 != 1)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"FPActionOperation.m", 1219, @"UNREACHABLE: invalid index for error: %@", v5 object file lineNumber description];

LABEL_5:
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  uint64_t v6 = 1;
LABEL_6:

  return v6;
}

- (unint64_t)transformItem:(id)a3 atIndex:(unint64_t)a4
{
  id v4 = a3;
  [v4 setTrashed:1];
  [v4 setParentItemIdentifier:@"NSFileProviderTrashContainerItemIdentifier"];

  return 1073741828;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(FPTransformOperation *)self items];
  id v9 = objc_msgSend(v6, "fp_annotatedErrorWithItems:variant:", v8, @"Remove");

  v10.receiver = self;
  v10.super_class = (Class)FPTrashOperation;
  [(FPTransformOperation *)&v10 finishWithResult:v7 error:v9];
}

- (id)fp_prettyDescription
{
  uint64_t v2 = NSString;
  id v3 = [(FPTransformOperation *)self items];
  id v4 = objc_msgSend(v3, "fp_itemIdentifiers");
  id v5 = FPAbbreviatedArrayDescription(v4);
  id v6 = [v2 stringWithFormat:@"trash items %@", v5];

  return v6;
}

- (void)presendNotifications
{
  id v3 = [(FPActionOperation *)self stitcher];
  [v3 start];

  id v4 = [(FPActionOperation *)self stitcher];
  id v5 = [(FPTransformOperation *)self items];
  [v4 trashItems:v5];

  id v6 = [(FPActionOperation *)self stitcher];
  [v6 flush];
}

@end