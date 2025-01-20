@interface IMDMessageRecordBatchFetcher
- (BOOL)parentedOnly;
- (BOOL)sortAscending;
- (IMDMessageRecordBatchFetcher)init;
- (IMDMessageRecordBatchFetcher)initWithAssociatedChatGUID:(id)a3;
- (IMDMessageRecordBatchFetcher)initWithAssociatedChatGUID:(id)a3 sortAscending:(BOOL)a4;
- (NSString)associatedChatGUID;
- (id)_rowIDPredicate;
- (id)nextBatchWithSize:(unint64_t)a3;
- (void)setParentedOnly:(BOOL)a3;
@end

@implementation IMDMessageRecordBatchFetcher

- (IMDMessageRecordBatchFetcher)initWithAssociatedChatGUID:(id)a3 sortAscending:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IMDMessageRecordBatchFetcher;
  v8 = [(IMDRecordBatchFetcher *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_associatedChatGUID, a3);
    v9->_sortAscending = a4;
  }

  return v9;
}

- (IMDMessageRecordBatchFetcher)initWithAssociatedChatGUID:(id)a3
{
  return [(IMDMessageRecordBatchFetcher *)self initWithAssociatedChatGUID:a3 sortAscending:1];
}

- (IMDMessageRecordBatchFetcher)init
{
  return (IMDMessageRecordBatchFetcher *)MEMORY[0x1F4181798](self, sel_initWithAssociatedChatGUID_);
}

- (id)_rowIDPredicate
{
  BOOL v3 = [(IMDMessageRecordBatchFetcher *)self sortAscending];
  v4 = (void *)MEMORY[0x1E4F28F60];
  int64_t v5 = [(IMDRecordBatchFetcher *)self lastRowID];
  if (v3) {
    v6 = @"%K > %lld";
  }
  else {
    v6 = @"%K < %lld";
  }
  id v7 = objc_msgSend(v4, "predicateWithFormat:", v6, @"rowID", v5);
  return v7;
}

- (id)nextBatchWithSize:(unint64_t)a3
{
  v32[2] = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_1AFB6540C;
  v28 = sub_1AFB6541C;
  id v29 = 0;
  int64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29008]), "initWithKey:ascending:", @"rowID", -[IMDMessageRecordBatchFetcher sortAscending](self, "sortAscending"));
  v6 = [(IMDMessageRecordBatchFetcher *)self _rowIDPredicate];
  id v7 = [(IMDRecordBatchFetcher *)self predicate];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    id v12 = v6;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F28BA0];
    v32[0] = v6;
    v10 = [(IMDRecordBatchFetcher *)self predicate];
    v32[1] = v10;
    objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    id v12 = [v9 andPredicateWithSubpredicates:v11];
  }
  v13 = [(IMDMessageRecordBatchFetcher *)self associatedChatGUID];

  +[IMDDatabase synchronousDatabase];
  if (v13) {
    v14 = {;
  }
    v15 = [(IMDMessageRecordBatchFetcher *)self associatedChatGUID];
    v31 = v5;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1AFB65424;
    v23[3] = &unk_1E5F8E3B8;
    v23[4] = &v24;
    [v14 fetchMessageRecordsForChatRecordWithGUID:v15 filteredUsingPredicate:v12 sortedUsingDescriptors:v16 limit:a3 completionHandler:v23];
  }
  else {
    v14 = {;
  }
    v30 = v5;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
    BOOL v17 = [(IMDMessageRecordBatchFetcher *)self parentedOnly];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1AFB65434;
    v22[3] = &unk_1E5F8E3B8;
    v22[4] = &v24;
    [v14 fetchMessageRecordsFilteredUsingPredicate:v12 sortedUsingDescriptors:v15 parentedOnly:v17 limit:a3 completionHandler:v22];
  }

  if ([(id)v25[5] count])
  {
    v18 = [(id)v25[5] lastObject];
    -[IMDRecordBatchFetcher setLastRowID:](self, "setLastRowID:", [v18 rowID]);
  }
  v19 = (void *)v25[5];
  if (!v19) {
    v19 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v20 = v19;

  _Block_object_dispose(&v24, 8);
  return v20;
}

- (NSString)associatedChatGUID
{
  return self->_associatedChatGUID;
}

- (BOOL)sortAscending
{
  return self->_sortAscending;
}

- (BOOL)parentedOnly
{
  return self->_parentedOnly;
}

- (void)setParentedOnly:(BOOL)a3
{
  self->_parentedOnly = a3;
}

- (void).cxx_destruct
{
}

@end