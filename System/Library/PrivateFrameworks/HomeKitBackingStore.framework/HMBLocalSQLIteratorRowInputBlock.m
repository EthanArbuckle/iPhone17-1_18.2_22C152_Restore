@interface HMBLocalSQLIteratorRowInputBlock
- (HMBLocalSQLIteratorRowInputBlock)initWithSQLContext:(id)a3 zoneRow:(unint64_t)a4;
@end

@implementation HMBLocalSQLIteratorRowInputBlock

- (HMBLocalSQLIteratorRowInputBlock)initWithSQLContext:(id)a3 zoneRow:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__555;
  v17 = __Block_byref_object_dispose__556;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__HMBLocalSQLIteratorRowInputBlock_initWithSQLContext_zoneRow___block_invoke;
  v12[3] = &unk_1E69EACB8;
  v12[4] = &v13;
  id v7 = (id)[v6 sqlBlockWithActivity:0 block:v12];
  uint64_t v8 = v14[5];
  v11.receiver = self;
  v11.super_class = (Class)HMBLocalSQLIteratorRowInputBlock;
  v9 = [(HMBLocalSQLIteratorRowBlock *)&v11 initWithSQLContext:v6 zoneRow:a4 statement:v8 isAscending:1];
  _Block_object_dispose(&v13, 8);

  return v9;
}

uint64_t __63__HMBLocalSQLIteratorRowInputBlock_initWithSQLContext_zoneRow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 selectReadyInputBlocks];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

@end