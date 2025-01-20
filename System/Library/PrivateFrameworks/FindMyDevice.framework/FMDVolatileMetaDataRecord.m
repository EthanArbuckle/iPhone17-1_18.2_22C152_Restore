@interface FMDVolatileMetaDataRecord
+ (BOOL)supportsSecureCoding;
- (FMDVolatileMetaDataRecord)init;
- (FMDVolatileMetaDataRecord)initWithCoder:(id)a3;
- (FMDVolatileMetaDataRecord)initWithDictionary:(id)a3;
- (NSDictionary)dictionary;
- (NSDictionary)dictionaryValue;
- (OS_dispatch_queue)serialQueue;
- (void)appendMetaData:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDictionary:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation FMDVolatileMetaDataRecord

- (FMDVolatileMetaDataRecord)init
{
  v6.receiver = self;
  v6.super_class = (Class)FMDVolatileMetaDataRecord;
  v2 = [(FMDVolatileMetaDataRecord *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("FMDVolatileMetaDataRecordQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    [(FMDVolatileMetaDataRecord *)v2 setDictionary:MEMORY[0x1E4F1CC08]];
  }
  return v2;
}

- (void)appendMetaData:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__FMDVolatileMetaDataRecord_appendMetaData___block_invoke;
  v7[3] = &unk_1E689C510;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __44__FMDVolatileMetaDataRecord_appendMetaData___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) dictionary];
  v2 = objc_msgSend(v3, "fm_dictionaryByDeeplySettingValuesForKeysWithDictionary:", *(void *)(a1 + 40));
  [*(id *)(a1 + 32) setDictionary:v2];
}

- (FMDVolatileMetaDataRecord)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDVolatileMetaDataRecord;
  v5 = [(FMDVolatileMetaDataRecord *)&v10 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("FMDVolatileMetaDataRecordQueue", 0);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v6;

    if (v4) {
      id v8 = v4;
    }
    else {
      id v8 = (id)MEMORY[0x1E4F1CC08];
    }
    [(FMDVolatileMetaDataRecord *)v5 setDictionary:v8];
  }

  return v5;
}

- (NSDictionary)dictionaryValue
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  objc_super v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__FMDVolatileMetaDataRecord_dictionaryValue__block_invoke;
  v5[3] = &unk_1E689C538;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

uint64_t __44__FMDVolatileMetaDataRecord_dictionaryValue__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) dictionary];

  return MEMORY[0x1F41817F8]();
}

- (FMDVolatileMetaDataRecord)initWithCoder:(id)a3
{
  v15[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FMDVolatileMetaDataRecord;
  v5 = [(FMDVolatileMetaDataRecord *)&v14 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("FMDVolatileMetaDataRecordQueue", 0);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
    objc_super v10 = [v8 setWithArray:v9];
    id v11 = NSStringFromSelector(sel_dictionary);
    v12 = [v4 decodeObjectOfClasses:v10 forKey:v11];
    [(FMDVolatileMetaDataRecord *)v5 setDictionary:v12];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  objc_super v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  id v14 = 0;
  serialQueue = self->_serialQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__FMDVolatileMetaDataRecord_encodeWithCoder___block_invoke;
  v8[3] = &unk_1E689C538;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(serialQueue, v8);
  uint64_t v6 = v10[5];
  v7 = NSStringFromSelector(sel_dictionary);
  [v4 encodeObject:v6 forKey:v7];

  _Block_object_dispose(&v9, 8);
}

uint64_t __45__FMDVolatileMetaDataRecord_encodeWithCoder___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) dictionary];

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end