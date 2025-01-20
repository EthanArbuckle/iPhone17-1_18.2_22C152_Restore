@interface KMMapper_PortraitEntity
+ (Class)externalObjectClass;
- (KMMapper_PortraitEntity)init;
- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5;
- (int64_t)targetItemType;
@end

@implementation KMMapper_PortraitEntity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeItemIdKey, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  v26[1] = *MEMORY[0x263EF8340];
  alternativeItemIdKey = self->_alternativeItemIdKey;
  id v9 = a3;
  v10 = [a4 objectForKey:alternativeItemIdKey];
  builder = self->_builder;
  id v25 = 0;
  id v12 = (id)[(KVItemBuilder *)builder setItemType:13 itemId:v10 error:&v25];
  id v13 = v25;
  v14 = [v9 item];

  v15 = [v14 name];

  if (![v15 length])
  {
LABEL_4:
    v19 = self->_builder;
    id v23 = v13;
    v20 = [(KVItemBuilder *)v19 buildItemWithError:&v23];
    id v18 = v23;

    if (v20)
    {
      v26[0] = v20;
      v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
    }
    else
    {
      KMMapperSetBuilderError((uint64_t)a5, v18);
      v21 = 0;
    }

    goto LABEL_9;
  }
  v16 = self->_builder;
  id v24 = v13;
  v17 = [(KVItemBuilder *)v16 addFieldWithType:553 value:v15 error:&v24];
  id v18 = v24;

  if (v17)
  {
    id v13 = v18;
    goto LABEL_4;
  }
  KMMapperSetBuilderError((uint64_t)a5, v18);
  v21 = 0;
LABEL_9:

  return v21;
}

- (int64_t)targetItemType
{
  return 13;
}

- (KMMapper_PortraitEntity)init
{
  v8.receiver = self;
  v8.super_class = (Class)KMMapper_PortraitEntity;
  v2 = [(KMMapper_PortraitEntity *)&v8 init];
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x263F510C0]);
    builder = v2->_builder;
    v2->_builder = v3;

    uint64_t v5 = KVAdditionalFieldTypeToNumber();
    alternativeItemIdKey = v2->_alternativeItemIdKey;
    v2->_alternativeItemIdKey = (NSNumber *)v5;
  }
  return v2;
}

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

@end