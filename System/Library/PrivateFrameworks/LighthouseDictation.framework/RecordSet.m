@interface RecordSet
- (NSDictionary)nativeRecordInfo;
- (NSDictionary)nativeRecords;
- (RecordSet)initWithNativeRecords:(id)a3 nativeRecordInfo:(id)a4;
- (RecordSet)initWithNativeRecords:(id)a3 nativeRecordInfo:(id)a4 dataFetcher:(id)a5;
- (id)_anyNativeRecordUUID;
- (id)nativeRecordDataForRecordUUID:(id)a3 error:(id *)a4;
- (id)nativeRecordInfoForRecordUUID:(id)a3;
- (unint64_t)count;
@end

@implementation RecordSet

- (RecordSet)initWithNativeRecords:(id)a3 nativeRecordInfo:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__RecordSet_initWithNativeRecords_nativeRecordInfo___block_invoke;
  v10[3] = &unk_2653B38D8;
  id v11 = v6;
  id v7 = v6;
  v8 = [(RecordSet *)self initWithNativeRecords:v7 nativeRecordInfo:a4 dataFetcher:v10];

  return v8;
}

id __52__RecordSet_initWithNativeRecords_nativeRecordInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = FindRecordTypeForRecordUUID(v4, v5);
  id v7 = RecordDataForUUID(v6, v5, a3);

  return v7;
}

- (RecordSet)initWithNativeRecords:(id)a3 nativeRecordInfo:(id)a4 dataFetcher:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RecordSet;
  id v11 = [(RecordSet *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    nativeRecords = v11->_nativeRecords;
    v11->_nativeRecords = (NSDictionary *)v12;

    uint64_t v14 = [v9 copy];
    nativeRecordInfo = v11->_nativeRecordInfo;
    v11->_nativeRecordInfo = (NSDictionary *)v14;

    uint64_t v16 = [v10 copy];
    id dataFetcher = v11->_dataFetcher;
    v11->_id dataFetcher = (id)v16;
  }
  return v11;
}

- (id)nativeRecordInfoForRecordUUID:(id)a3
{
  return [(NSDictionary *)self->_nativeRecordInfo objectForKey:a3];
}

- (id)nativeRecordDataForRecordUUID:(id)a3 error:(id *)a4
{
  return (id)(*((uint64_t (**)(void))self->_dataFetcher + 2))();
}

- (unint64_t)count
{
  return [(NSDictionary *)self->_nativeRecordInfo count];
}

- (id)_anyNativeRecordUUID
{
  uint64_t v7 = *MEMORY[0x263EF8340];
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

- (NSDictionary)nativeRecords
{
  return self->_nativeRecords;
}

- (NSDictionary)nativeRecordInfo
{
  return self->_nativeRecordInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nativeRecordInfo, 0);
  objc_storeStrong((id *)&self->_nativeRecords, 0);
  objc_storeStrong(&self->_dataFetcher, 0);
}

@end