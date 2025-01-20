@interface KMMapper_EKEvent
+ (Class)externalObjectClass;
- (KMMapper_EKEvent)init;
- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5;
- (int64_t)targetItemType;
@end

@implementation KMMapper_EKEvent

- (void).cxx_destruct
{
}

- (int64_t)targetItemType
{
  return 15;
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  v33[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  builder = self->_builder;
  v9 = [v7 eventIdentifier];
  id v32 = 0;
  v10 = [(KVItemBuilder *)builder setItemType:15 itemId:v9 error:&v32];
  id v11 = v32;
  if (v10)
  {
    v12 = self->_builder;
    v13 = [v7 title];
    id v31 = v11;
    v14 = [(KVItemBuilder *)v12 addFieldWithType:650 value:v13 error:&v31];
    id v15 = v31;

    if (v14)
    {
      v27 = v13;
      v28 = a5;
      v16 = self->_builder;
      v26 = [v7 structuredLocation];
      v17 = [v26 title];
      v18 = v17;
      if (!v17)
      {
        v18 = [v7 location];
      }
      id v30 = v15;
      v19 = [(KVItemBuilder *)v16 addFieldWithType:651 value:v18 error:&v30];
      id v25 = v30;

      BOOL v20 = v19 == 0;
      if (!v17) {

      }
      id v15 = v25;
      v13 = v27;
      a5 = v28;
    }
    else
    {
      BOOL v20 = 1;
    }

    if (!v20)
    {
      v22 = self->_builder;
      id v29 = v15;
      v23 = [(KVItemBuilder *)v22 buildItemWithError:&v29];
      id v11 = v29;

      if (v23)
      {
        v33[0] = v23;
        v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
      }
      else
      {
        KMMapperSetBuilderError((uint64_t)a5, v11);
        v21 = 0;
      }

      goto LABEL_17;
    }
    id v11 = v15;
  }
  else
  {
  }
  KMMapperSetBuilderError((uint64_t)a5, v11);
  v21 = 0;
LABEL_17:

  return v21;
}

- (KMMapper_EKEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)KMMapper_EKEvent;
  v2 = [(KMMapper_EKEvent *)&v6 init];
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x263F510C0]);
    builder = v2->_builder;
    v2->_builder = v3;
  }
  return v2;
}

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

@end