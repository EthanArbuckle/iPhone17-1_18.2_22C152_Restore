@interface JESoftLinkedMTStandardIDService
- (JESoftLinkedMTStandardIDService)initWithAMSBag:(id)a3;
- (JESoftLinkedMTStandardIDService)initWithConfigDictionary:(id)a3;
- (MTStandardIDService)backing;
- (id)idFieldsForTopic:(id)a3;
- (id)idFieldsForTopic:(id)a3 options:(id)a4;
- (id)mtPromiseToAMSPromise:(id)a3;
- (id)resetIDForTopics:(id)a3;
- (id)secretValueForNamespace:(id)a3 options:(id)a4;
- (id)sync;
- (void)performMaintenanceWithCompletion:(id)a3;
- (void)queryIDForTopic:(id)a3 type:(int64_t)a4 completion:(id)a5;
- (void)queryIDForTopic:(id)a3 type:(int64_t)a4 options:(id)a5 completion:(id)a6;
- (void)setBacking:(id)a3;
@end

@implementation JESoftLinkedMTStandardIDService

uint64_t __57__JESoftLinkedMTStandardIDService_mtPromiseToAMSPromise___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

- (void).cxx_destruct
{
}

- (id)idFieldsForTopic:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(JESoftLinkedMTStandardIDService *)self backing];
  v9 = [v8 IDFieldsForTopic:v7 options:v6];

  v10 = [(JESoftLinkedMTStandardIDService *)self mtPromiseToAMSPromise:v9];

  return v10;
}

- (id)mtPromiseToAMSPromise:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F4DDB0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__JESoftLinkedMTStandardIDService_mtPromiseToAMSPromise___block_invoke;
  v13[3] = &unk_1E59B5498;
  id v6 = v5;
  id v14 = v6;
  [v4 addErrorBlock:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__JESoftLinkedMTStandardIDService_mtPromiseToAMSPromise___block_invoke_2;
  v11[3] = &unk_1E59B54C0;
  id v7 = v6;
  id v12 = v7;
  [v4 addSuccessBlock:v11];

  v8 = v12;
  id v9 = v7;

  return v9;
}

- (MTStandardIDService)backing
{
  return self->_backing;
}

- (JESoftLinkedMTStandardIDService)initWithAMSBag:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)JESoftLinkedMTStandardIDService;
  id v5 = [(JESoftLinkedMTStandardIDService *)&v8 init];
  if (v5)
  {
    id v6 = (void *)[objc_alloc((Class)getMTStandardIDServiceClass()) initWithAMSBag:v4];
    [(JESoftLinkedMTStandardIDService *)v5 setBacking:v6];
  }
  return v5;
}

- (void)setBacking:(id)a3
{
}

- (JESoftLinkedMTStandardIDService)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)JESoftLinkedMTStandardIDService;
  id v5 = [(JESoftLinkedMTStandardIDService *)&v8 init];
  if (v5)
  {
    id v6 = (void *)[objc_alloc((Class)getMTStandardIDServiceClass()) initWithConfigDictionary:v4];
    [(JESoftLinkedMTStandardIDService *)v5 setBacking:v6];
  }
  return v5;
}

- (id)sync
{
  v3 = [(JESoftLinkedMTStandardIDService *)self backing];
  id v4 = [v3 sync];

  id v5 = [(JESoftLinkedMTStandardIDService *)self mtPromiseToAMSPromise:v4];

  return v5;
}

- (id)resetIDForTopics:(id)a3
{
  id v4 = a3;
  id v5 = [(JESoftLinkedMTStandardIDService *)self backing];
  id v6 = [v5 resetIDForTopics:v4 options:0];

  id v7 = [(JESoftLinkedMTStandardIDService *)self mtPromiseToAMSPromise:v6];

  return v7;
}

- (id)idFieldsForTopic:(id)a3
{
  id v4 = a3;
  id v5 = [(JESoftLinkedMTStandardIDService *)self backing];
  id v6 = [v5 IDFieldsForTopic:v4 options:0];

  id v7 = [(JESoftLinkedMTStandardIDService *)self mtPromiseToAMSPromise:v6];

  return v7;
}

- (id)secretValueForNamespace:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(JESoftLinkedMTStandardIDService *)self backing];
  id v9 = [v8 secretValueForNamespace:v7 options:v6];

  v10 = [(JESoftLinkedMTStandardIDService *)self mtPromiseToAMSPromise:v9];

  return v10;
}

- (void)queryIDForTopic:(id)a3 type:(int64_t)a4 completion:(id)a5
{
}

- (void)queryIDForTopic:(id)a3 type:(int64_t)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = [(JESoftLinkedMTStandardIDService *)self backing];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__JESoftLinkedMTStandardIDService_queryIDForTopic_type_options_completion___block_invoke;
  v15[3] = &unk_1E59B5470;
  id v16 = v10;
  id v14 = v10;
  [v13 queryIDForTopic:v12 type:a4 options:v11 completion:v15];
}

void __75__JESoftLinkedMTStandardIDService_queryIDForTopic_type_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v15[5] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && ([v5 effectiveDate], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    v14[0] = @"idString";
    objc_super v8 = [v5 idString];
    v15[0] = v8;
    v14[1] = @"idType";
    id v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v5, "idType"));
    v15[1] = v9;
    v14[2] = @"effectiveDate";
    id v10 = [v5 effectiveDate];
    v15[2] = v10;
    v14[3] = @"expirationDate";
    id v11 = [v5 expirationDate];
    v15[3] = v11;
    v14[4] = @"isSynchronized";
    id v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v5, "isSynchronized"));
    void v15[4] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __57__JESoftLinkedMTStandardIDService_mtPromiseToAMSPromise___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (void)performMaintenanceWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(JESoftLinkedMTStandardIDService *)self backing];
  [v5 performMaintenanceWithCompletion:v4];
}

@end