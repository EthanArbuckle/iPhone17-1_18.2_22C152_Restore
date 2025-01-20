@interface KMMapper_INVocabularyItem
+ (Class)externalObjectClass;
+ (id)_fieldTypeNumberForIntentSlotName:(id)a3;
+ (int64_t)fieldTypeForIntentSlotName:(id)a3;
- (KMMapper_INVocabularyItem)init;
- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5;
- (int64_t)targetItemType;
@end

@implementation KMMapper_INVocabularyItem

+ (int64_t)fieldTypeForIntentSlotName:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() _fieldTypeNumberForIntentSlotName:v3];

  int64_t v5 = KVFieldTypeFromNumber();
  return v5;
}

+ (id)_fieldTypeNumberForIntentSlotName:(id)a3
{
  uint64_t v3 = _fieldTypeNumberForIntentSlotName__once;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_fieldTypeNumberForIntentSlotName__once, &__block_literal_global_306);
  }
  int64_t v5 = [(id)_fieldTypeNumberForIntentSlotName__intentSlotToFieldTypeMap objectForKey:v4];

  return v5;
}

- (KMMapper_INVocabularyItem)init
{
  v8.receiver = self;
  v8.super_class = (Class)KMMapper_INVocabularyItem;
  v2 = [(KMMapper_INVocabularyItem *)&v8 init];
  if (v2)
  {
    uint64_t v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x263F510C0]);
    builder = v2->_builder;
    v2->_builder = v3;

    uint64_t v5 = KVAdditionalFieldTypeToNumber();
    intentSlotNameKey = v2->_intentSlotNameKey;
    v2->_intentSlotNameKey = (NSNumber *)v5;
  }
  return v2;
}

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentSlotNameKey, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  v48[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = [a4 objectForKey:self->_intentSlotNameKey];
  if (!v9)
  {
    v32 = (void *)MEMORY[0x263F087E8];
    uint64_t v47 = *MEMORY[0x263F07F80];
    v10 = objc_msgSend(NSString, "stringWithFormat:", @"Expected additional field with type: %i", 4294967294);
    v48[0] = v10;
    v12 = [NSDictionary dictionaryWithObjects:v48 forKeys:&v47 count:1];
    v16 = [v32 errorWithDomain:@"com.apple.siri.koa.mapper" code:7 userInfo:v12];
    KVSetError();
    v31 = 0;
    goto LABEL_20;
  }
  v10 = [(id)objc_opt_class() _fieldTypeNumberForIntentSlotName:v9];
  if (v10)
  {
    uint64_t v11 = KVFieldTypeFromNumber();
    v12 = [v8 string];
    v13 = [v8 vocabularyIdentifier];

    v40 = v10;
    v38 = a5;
    if (v13)
    {
      v14 = [v8 vocabularyIdentifier];
      uint64_t v15 = [v12 stringByAppendingString:v14];

      v12 = (void *)v15;
    }
    v16 = KVHash64String();
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%u#%llx", (unsigned __int16)v11, objc_msgSend(v16, "longLongValue"));
    builder = self->_builder;
    v43[1] = 0;
    v39 = (void *)v17;
    v19 = -[KVItemBuilder setItemType:itemId:error:](builder, "setItemType:itemId:error:", 1);
    id v20 = 0;
    v21 = v20;
    if (v19)
    {
      v22 = self->_builder;
      v23 = [v8 string];
      v43[0] = v21;
      v24 = [(KVItemBuilder *)v22 addFieldWithType:v11 value:v23 error:v43];
      id v25 = v43[0];

      if (v24)
      {
        v26 = self->_builder;
        [v8 vocabularyIdentifier];
        v27 = v36 = v23;
        id v42 = v25;
        v28 = [(KVItemBuilder *)v26 addFieldWithType:20 value:v27 error:&v42];
        id v37 = v42;

        if (v28)
        {
          v29 = self->_builder;
          id v41 = v37;
          v30 = [(KVItemBuilder *)v29 buildItemWithError:&v41];
          id v25 = v41;

          if (v30)
          {
            v44 = v30;
            v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
          }
          else
          {
            KMMapperSetBuilderError((uint64_t)v38, v25);
            v31 = 0;
          }

          goto LABEL_18;
        }
        id v25 = v37;
      }
      else
      {
      }
    }
    else
    {
      id v25 = v20;
    }
    KMMapperSetBuilderError((uint64_t)v38, v25);
    v31 = 0;
LABEL_18:
    v10 = v40;

    v34 = v39;
    goto LABEL_19;
  }
  v33 = (void *)MEMORY[0x263F087E8];
  uint64_t v45 = *MEMORY[0x263F07F80];
  v12 = [NSString stringWithFormat:@"Unrecognized additional field with type: %i value: %@", 4294967294, v9];
  v46 = v12;
  v16 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  v34 = [v33 errorWithDomain:@"com.apple.siri.koa.mapper" code:8 userInfo:v16];
  KVSetError();
  v31 = 0;
LABEL_19:

LABEL_20:
  return v31;
}

- (int64_t)targetItemType
{
  return 1;
}

@end