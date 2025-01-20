@interface _PASSqliteDatabase(ATXExtras)
- (uint64_t)atx_countRowsOfTable:()ATXExtras;
- (uint64_t)atx_countRowsOfTable:()ATXExtras returnValueOnError:;
@end

@implementation _PASSqliteDatabase(ATXExtras)

- (uint64_t)atx_countRowsOfTable:()ATXExtras returnValueOnError:
{
  id v6 = a3;
  v7 = [NSString stringWithFormat:@"SELECT count(*) FROM %@", v6];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73___PASSqliteDatabase_ATXExtras__atx_countRowsOfTable_returnValueOnError___block_invoke;
  v11[3] = &unk_1E68AD228;
  v11[4] = &v12;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73___PASSqliteDatabase_ATXExtras__atx_countRowsOfTable_returnValueOnError___block_invoke_2;
  v10[3] = &unk_1E68AD2A0;
  v10[4] = &v12;
  v10[5] = a4;
  [a1 prepAndRunQuery:v7 onPrep:0 onRow:v11 onError:v10];
  uint64_t v8 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (uint64_t)atx_countRowsOfTable:()ATXExtras
{
  return objc_msgSend(a1, "atx_countRowsOfTable:returnValueOnError:", a3, 0);
}

@end