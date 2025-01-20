@interface DESRecordSet
+ (BOOL)supportsSecureCoding;
+ (id)recordSetWithRecipeType:(id)a3 nativeRecords:(id)a4 coreDuetEventsUUIDs:(id)a5 error:(id *)a6;
- (DESRecordSet)initWithCoder:(id)a3;
- (DESRecordSet)initWithNativeRecords:(id)a3 nativeRecordInfo:(id)a4 coreDuetEvents:(id)a5;
- (DESRecordSet)initWithNativeRecords:(id)a3 nativeRecordInfo:(id)a4 coreDuetEvents:(id)a5 predicate:(id)a6 dataFetcher:(id)a7;
- (NSArray)coreDuetEvents;
- (NSDictionary)nativeRecordInfo;
- (NSDictionary)nativeRecords;
- (NSDictionary)predicate;
- (id)_anyNativeRecordUUID;
- (id)description;
- (id)filteredRecordSetWithJSONPredicate:(id)a3;
- (id)nativeRecordDataForRecordUUID:(id)a3 error:(id *)a4;
- (id)nativeRecordInfoForRecordUUID:(id)a3;
- (unint64_t)count;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DESRecordSet

+ (id)recordSetWithRecipeType:(id)a3 nativeRecords:(id)a4 coreDuetEventsUUIDs:(id)a5 error:(id *)a6
{
  return 0;
}

- (DESRecordSet)initWithNativeRecords:(id)a3 nativeRecordInfo:(id)a4 coreDuetEvents:(id)a5
{
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__DESRecordSet_initWithNativeRecords_nativeRecordInfo_coreDuetEvents___block_invoke;
  v12[3] = &unk_1E63C1910;
  id v13 = v8;
  id v9 = v8;
  v10 = [(DESRecordSet *)self initWithNativeRecords:v9 nativeRecordInfo:a4 coreDuetEvents:a5 predicate:0 dataFetcher:v12];

  return v10;
}

id __70__DESRecordSet_initWithNativeRecords_nativeRecordInfo_coreDuetEvents___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  v6 = FindRecordTypeForRecordUUID(v4, v5);
  v7 = RecordDataForUUID(v6, v5, a3);

  return v7;
}

- (DESRecordSet)initWithNativeRecords:(id)a3 nativeRecordInfo:(id)a4 coreDuetEvents:(id)a5 predicate:(id)a6 dataFetcher:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)DESRecordSet;
  v17 = [(DESRecordSet *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v15 copy];
    predicate = v17->_predicate;
    v17->_predicate = (NSDictionary *)v18;

    uint64_t v20 = [v12 copy];
    nativeRecords = v17->_nativeRecords;
    v17->_nativeRecords = (NSDictionary *)v20;

    uint64_t v22 = [v13 copy];
    nativeRecordInfo = v17->_nativeRecordInfo;
    v17->_nativeRecordInfo = (NSDictionary *)v22;

    uint64_t v24 = [v14 copy];
    coreDuetEvents = v17->_coreDuetEvents;
    v17->_coreDuetEvents = (NSArray *)v24;

    uint64_t v26 = [v16 copy];
    id dataFetcher = v17->_dataFetcher;
    v17->_id dataFetcher = (id)v26;
  }
  return v17;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@(NumOfDESRecord=%lu, NumOfCoreDuetEvent=%ld)", v5, -[NSDictionary count](self->_nativeRecordInfo, "count"), -[NSArray count](self->_coreDuetEvents, "count")];

  return v6;
}

- (id)nativeRecordInfoForRecordUUID:(id)a3
{
  return [(NSDictionary *)self->_nativeRecordInfo objectForKey:a3];
}

- (id)nativeRecordDataForRecordUUID:(id)a3 error:(id *)a4
{
  return 0;
}

- (unint64_t)count
{
  NSUInteger v3 = [(NSDictionary *)self->_nativeRecordInfo count];
  return [(NSArray *)self->_coreDuetEvents count] + v3;
}

- (id)_anyNativeRecordUUID
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  memset(v5, 0, sizeof(v5));
  v2 = self->_nativeRecordInfo;
  if ([(NSDictionary *)v2 countByEnumeratingWithState:v5 objects:v6 count:16])
  {
    id v3 = **((id **)&v5[0] + 1);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)filteredRecordSetWithJSONPredicate:(id)a3
{
  id v3 = DESLogAndReturnSunsetError();
  v4 = [DESRecordSet alloc];
  id v5 = [(DESRecordSet *)v4 initWithNativeRecords:MEMORY[0x1E4F1CC08] nativeRecordInfo:MEMORY[0x1E4F1CC08] coreDuetEvents:MEMORY[0x1E4F1CBF0]];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_nativeRecords forKey:@"nativeRecords"];
  [v5 encodeObject:self->_nativeRecordInfo forKey:@"nativeRecordInfo"];
  coreDuetEvents = self->_coreDuetEvents;
  if (coreDuetEvents) {
    [v5 encodeObject:coreDuetEvents forKey:@"coreDuetEvents"];
  }
}

- (DESRecordSet)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  id v9 = [v3 decodeObjectOfClasses:v8 forKey:@"nativeRecords"];
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  id v16 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, objc_opt_class(), 0);
  v17 = [v3 decodeObjectOfClasses:v16 forKey:@"nativeRecordInfo"];
  if ([v3 containsValueForKey:@"coreDuetEvents"])
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
    uint64_t v22 = [v3 decodeObjectOfClasses:v21 forKey:@"coreDuetEvents"];
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v23 = [(DESRecordSet *)self initWithNativeRecords:v9 nativeRecordInfo:v17 coreDuetEvents:v22];

  return v23;
}

- (NSDictionary)nativeRecords
{
  return self->_nativeRecords;
}

- (NSDictionary)nativeRecordInfo
{
  return self->_nativeRecordInfo;
}

- (NSArray)coreDuetEvents
{
  return self->_coreDuetEvents;
}

- (NSDictionary)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_coreDuetEvents, 0);
  objc_storeStrong((id *)&self->_nativeRecordInfo, 0);
  objc_storeStrong((id *)&self->_nativeRecords, 0);

  objc_storeStrong(&self->_dataFetcher, 0);
}

@end