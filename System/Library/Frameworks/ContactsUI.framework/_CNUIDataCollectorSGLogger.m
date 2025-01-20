@interface _CNUIDataCollectorSGLogger
- (CNScheduler)workQueue;
- (_CNUIDataCollectorSGLogger)initWithSuggestionsServiceProvider:(id)a3 schedulerProvider:(id)a4;
- (id)serviceProvider;
- (void)logContactCreated:(id)a3 contactIdentifier:(id)a4 bundleID:(id)a5;
- (void)logContactSearchResultSelected:(id)a3 contactIdentifier:(id)a4 bundleID:(id)a5;
- (void)logSearchResultsIncludedPureSuggestionsWithBundleID:(id)a3;
- (void)logSuggestedContactDetailShown:(id)a3 contactIdentifier:(id)a4 bundleID:(id)a5;
- (void)logSuggestedContactDetailUsed:(id)a3 contactIdentifier:(id)a4 bundleID:(id)a5;
- (void)performBlockWithService:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation _CNUIDataCollectorSGLogger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong(&self->_serviceProvider, 0);
}

- (void)setWorkQueue:(id)a3
{
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (id)serviceProvider
{
  return self->_serviceProvider;
}

- (void)logSearchResultsIncludedPureSuggestionsWithBundleID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82___CNUIDataCollectorSGLogger_logSearchResultsIncludedPureSuggestionsWithBundleID___block_invoke;
  v6[3] = &unk_1E5497230;
  id v7 = v4;
  id v5 = v4;
  [(_CNUIDataCollectorSGLogger *)self performBlockWithService:v6];
}

- (void)logContactCreated:(id)a3 contactIdentifier:(id)a4 bundleID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75___CNUIDataCollectorSGLogger_logContactCreated_contactIdentifier_bundleID___block_invoke;
  v14[3] = &unk_1E5497208;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(_CNUIDataCollectorSGLogger *)self performBlockWithService:v14];
}

- (void)logSuggestedContactDetailUsed:(id)a3 contactIdentifier:(id)a4 bundleID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87___CNUIDataCollectorSGLogger_logSuggestedContactDetailUsed_contactIdentifier_bundleID___block_invoke;
  v14[3] = &unk_1E5497208;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(_CNUIDataCollectorSGLogger *)self performBlockWithService:v14];
}

- (void)logSuggestedContactDetailShown:(id)a3 contactIdentifier:(id)a4 bundleID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88___CNUIDataCollectorSGLogger_logSuggestedContactDetailShown_contactIdentifier_bundleID___block_invoke;
  v14[3] = &unk_1E5497208;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(_CNUIDataCollectorSGLogger *)self performBlockWithService:v14];
}

- (void)logContactSearchResultSelected:(id)a3 contactIdentifier:(id)a4 bundleID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88___CNUIDataCollectorSGLogger_logContactSearchResultSelected_contactIdentifier_bundleID___block_invoke;
  v14[3] = &unk_1E5497208;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(_CNUIDataCollectorSGLogger *)self performBlockWithService:v14];
}

- (void)performBlockWithService:(id)a3
{
  id v4 = a3;
  id v5 = [(_CNUIDataCollectorSGLogger *)self serviceProvider];
  v6 = [(_CNUIDataCollectorSGLogger *)self workQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54___CNUIDataCollectorSGLogger_performBlockWithService___block_invoke;
  v9[3] = &unk_1E54971E0;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 performBlock:v9 qualityOfService:2];
}

- (_CNUIDataCollectorSGLogger)initWithSuggestionsServiceProvider:(id)a3 schedulerProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_CNUIDataCollectorSGLogger;
  id v8 = [(_CNUIDataCollectorSGLogger *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v7 newSerialSchedulerWithName:@"com.apple.contacts.ContactsUI.CNUIDataCollectorSGLogger"];
    workQueue = v8->_workQueue;
    v8->_workQueue = (CNScheduler *)v9;

    uint64_t v11 = [v6 copy];
    id serviceProvider = v8->_serviceProvider;
    v8->_id serviceProvider = (id)v11;

    id v13 = v8;
  }

  return v8;
}

@end