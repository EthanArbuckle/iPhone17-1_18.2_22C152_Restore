@interface EDQueryCreator
- (EDQueryCreator)initWithQueryType:(id)a3;
- (NSString)queryType;
- (id)queryWithStartDate:(id)a3 endDate:(id)a4;
@end

@implementation EDQueryCreator

- (EDQueryCreator)initWithQueryType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDQueryCreator;
  v6 = [(EDQueryCreator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queryType, a3);
  }

  return v7;
}

- (id)queryWithStartDate:(id)a3 endDate:(id)a4
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(EDQueryCreator *)self queryType];
  v10 = (void *)v9;
  if (v9 == *MEMORY[0x1E4F5FF18])
  {
    id v13 = [MEMORY[0x1E4F60390] predicateForSendLaterMessagesWithStartDate:v7 endDate:v8];
    v14 = [MEMORY[0x1E4F60390] predicateForExcludingMessagesInMailboxesWithTypes:&unk_1F35BB4F8];
    v15 = (void *)MEMORY[0x1E4F28BA0];
    v28[0] = v13;
    v28[1] = v14;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    v12 = [v15 andPredicateWithSubpredicates:v16];
  }
  else
  {
    if (v9 != *MEMORY[0x1E4F5FEF8])
    {
LABEL_3:
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"EDQueryCreator.m" lineNumber:44 description:@"The query type isn't allowed."];

      v12 = 0;
      goto LABEL_9;
    }
    id v13 = [MEMORY[0x1E4F60390] predicateForReadLaterMessagesWithStartDate:v7 endDate:v8];
    if (_os_feature_enabled_impl())
    {
      id v13 = v13;
      v12 = v13;
    }
    else
    {
      v17 = [MEMORY[0x1E4F60390] predicateForMessagesInMailboxWithType:7];
      v18 = (void *)MEMORY[0x1E4F28BA0];
      v27[0] = v13;
      v27[1] = v17;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
      v12 = [v18 andPredicateWithSubpredicates:v19];
    }
  }

  if (!v12) {
    goto LABEL_3;
  }
LABEL_9:
  v20 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v10 ascending:1];
  id v21 = objc_alloc(MEMORY[0x1E4F60418]);
  uint64_t v22 = objc_opt_class();
  v26 = v20;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v24 = (void *)[v21 initWithTargetClass:v22 predicate:v12 sortDescriptors:v23];

  return v24;
}

- (NSString)queryType
{
  return self->_queryType;
}

- (void).cxx_destruct
{
}

@end