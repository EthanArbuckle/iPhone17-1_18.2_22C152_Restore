@interface FPVendorDefinedActionOperation
- (FPVendorDefinedActionOperation)initWithActionIdentifier:(id)a3 providerDomainID:(id)a4 itemIdentifiers:(id)a5;
- (void)actionMain;
- (void)cancel;
@end

@implementation FPVendorDefinedActionOperation

- (FPVendorDefinedActionOperation)initWithActionIdentifier:(id)a3 providerDomainID:(id)a4 itemIdentifiers:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v12 count])
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"FPActionOperation.m", 1563, @"Invalid parameter not satisfying: %@", @"itemIdentifiers.count > 0" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"FPActionOperation.m", 1564, @"Invalid parameter not satisfying: %@", @"providerDomainID != nil" object file lineNumber description];

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)FPVendorDefinedActionOperation;
  v13 = [(FPActionOperation *)&v20 initWithProvider:v11 action:0];
  v14 = v13;
  if (v13)
  {
    [(FPActionOperation *)v13 setSetupRemoteOperationService:1];
    objc_storeStrong((id *)&v14->_actionIdentifier, a3);
    objc_storeStrong((id *)&v14->_itemIdentifiers, a5);
    uint64_t v15 = objc_msgSend(v11, "fp_toDomainIdentifier");
    domainIdentifier = v14->_domainIdentifier;
    v14->_domainIdentifier = (NSString *)v15;
  }
  return v14;
}

- (void)actionMain
{
  v3 = [(FPActionOperation *)self remoteServiceProxy];
  actionIdentifier = self->_actionIdentifier;
  itemIdentifiers = self->_itemIdentifiers;
  domainIdentifier = self->_domainIdentifier;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__FPVendorDefinedActionOperation_actionMain__block_invoke;
  v9[3] = &unk_1E5AF1240;
  v9[4] = self;
  v7 = [v3 performActionWithIdentifier:actionIdentifier onItemsWithIdentifiers:itemIdentifiers domainIdentifier:domainIdentifier completionHandler:v9];
  remoteProgress = self->_remoteProgress;
  self->_remoteProgress = v7;
}

uint64_t __44__FPVendorDefinedActionOperation_actionMain__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:a2];
}

- (void)cancel
{
  [(NSProgress *)self->_remoteProgress cancel];
  remoteProgress = self->_remoteProgress;
  self->_remoteProgress = 0;

  v4.receiver = self;
  v4.super_class = (Class)FPVendorDefinedActionOperation;
  [(FPOperation *)&v4 cancel];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);

  objc_storeStrong((id *)&self->_remoteProgress, 0);
}

@end