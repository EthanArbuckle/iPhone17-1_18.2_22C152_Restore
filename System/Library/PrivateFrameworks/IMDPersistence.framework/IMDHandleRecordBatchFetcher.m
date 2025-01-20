@interface IMDHandleRecordBatchFetcher
- (id)nextBatchWithSize:(unint64_t)a3;
@end

@implementation IMDHandleRecordBatchFetcher

- (id)nextBatchWithSize:(unint64_t)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_1AFBFA438;
  v24 = sub_1AFBFA448;
  id v25 = 0;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"rowID" ascending:1];
  v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > %lld", @"rowID", -[IMDRecordBatchFetcher lastRowID](self, "lastRowID"));
  v7 = [(IMDRecordBatchFetcher *)self predicate];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    id v12 = v6;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F28BA0];
    v27[0] = v6;
    v10 = [(IMDRecordBatchFetcher *)self predicate];
    v27[1] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    id v12 = [v9 andPredicateWithSubpredicates:v11];
  }
  v13 = +[IMDDatabase synchronousDatabase];
  v26 = v5;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1AFBFA450;
  v19[3] = &unk_1E5F8E3B8;
  v19[4] = &v20;
  [v13 fetchHandleRecordsFilteredUsingPredicate:v12 sortedUsingDescriptors:v14 limit:a3 completionHandler:v19];

  if ([(id)v21[5] count])
  {
    v15 = [(id)v21[5] lastObject];
    -[IMDRecordBatchFetcher setLastRowID:](self, "setLastRowID:", [v15 rowID]);
  }
  v16 = (void *)v21[5];
  if (!v16) {
    v16 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v17 = v16;

  _Block_object_dispose(&v20, 8);
  return v17;
}

@end