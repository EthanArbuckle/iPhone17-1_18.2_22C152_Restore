@interface KMItemMapper
+ (id)_mapperForObjectClass:(Class)a3 error:(id *)a4;
- (KMItemMapper)init;
- (KMItemMapper)initWithObjectClass:(Class)a3 error:(id *)a4;
- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5;
- (int64_t)targetItemType;
@end

@implementation KMItemMapper

+ (id)_mapperForObjectClass:(Class)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  if (+[KMMapper_SAPerson externalObjectClass] == a3)
  {
    v12 = KMMapper_SAPerson;
  }
  else if (+[KMMapper_SAAppInfo externalObjectClass] == a3)
  {
    v12 = KMMapper_SAAppInfo;
  }
  else if (+[KMMapper_INVocabularyItem externalObjectClass] == a3)
  {
    v12 = KMMapper_INVocabularyItem;
  }
  else if (+[KMMapper_CNContact externalObjectClass] == a3)
  {
    v12 = KMMapper_CNContact;
  }
  else if (+[KMMapper_LSApplicationRecord externalObjectClass] == a3)
  {
    v12 = KMMapper_LSApplicationRecord;
  }
  else if (+[KMMapper_HMHome externalObjectClass] == a3)
  {
    v12 = KMMapper_HMHome;
  }
  else if (+[KMMapper_MPMediaEntity externalObjectClass] == a3)
  {
    v12 = KMMapper_MPMediaEntity;
  }
  else if (+[KMMapper_SASyncSiriKitAppVocabulary externalObjectClass] == a3)
  {
    v12 = KMMapper_SASyncSiriKitAppVocabulary;
  }
  else if (+[KMMapper_RTLocationOfInterest externalObjectClass] == a3)
  {
    v12 = KMMapper_RTLocationOfInterest;
  }
  else if (+[KMMapper_PortraitEntity externalObjectClass] == a3)
  {
    v12 = KMMapper_PortraitEntity;
  }
  else if (+[KMMapper_AppGlobalVocabulary externalObjectClass] == a3)
  {
    v12 = KMMapper_AppGlobalVocabulary;
  }
  else if (+[KMMapper_EKEvent externalObjectClass] == a3)
  {
    v12 = KMMapper_EKEvent;
  }
  else
  {
    if (+[KMMapper_PBSUserProfile externalObjectClass] != a3)
    {
      v5 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = *MEMORY[0x263F07F80];
      v6 = NSString;
      v7 = NSStringFromClass(a3);
      v8 = [v6 stringWithFormat:@"Object class (%@) not supported", v7, v14];
      v15[0] = v8;
      v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
      v10 = [v5 errorWithDomain:@"com.apple.siri.koa.mapper" code:2 userInfo:v9];
      KVSetError();

      id v11 = 0;
      goto LABEL_29;
    }
    v12 = KMMapper_PBSUserProfile;
  }
  id v11 = objc_alloc_init(v12);
LABEL_29:
  return v11;
}

- (KMItemMapper)initWithObjectClass:(Class)a3 error:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)KMItemMapper;
  v6 = [(KMItemMapper *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [(id)objc_opt_class() _mapperForObjectClass:a3 error:a4];
    mapper = v6->_mapper;
    v6->_mapper = (KMMapper *)v7;

    if (!v6->_mapper)
    {
      v9 = 0;
      goto LABEL_6;
    }
    v6->_externalObjectClass = (Class)[(id)objc_opt_class() externalObjectClass];
  }
  v9 = v6;
LABEL_6:

  return v9;
}

- (void).cxx_destruct
{
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  v34[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    if (objc_opt_isKindOfClass())
    {
      if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v10 = [(KMMapper *)self->_mapper itemsFromExternalObject:v8 additionalFields:v9 error:a5];
        goto LABEL_11;
      }
      v22 = (void *)MEMORY[0x263F087E8];
      uint64_t v29 = *MEMORY[0x263F07F80];
      v23 = NSString;
      v24 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v24);
      v25 = [v23 stringWithFormat:@"Invalid additional fields: %@ must be %@", v9, v17];
      v30 = v25;
      v26 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      v27 = [v22 errorWithDomain:@"com.apple.siri.koa.mapper" code:5 userInfo:v26];
      KVSetError();
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = *MEMORY[0x263F07F80];
      v15 = NSString;
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      v18 = NSStringFromClass(self->_externalObjectClass);
      v19 = [v15 stringWithFormat:@"Object class (%@) inconsistent with expected class (%@) provided at initialization", v17, v18];
      v32 = v19;
      v20 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      v21 = [v14 errorWithDomain:@"com.apple.siri.koa.mapper" code:3 userInfo:v20];
      KVSetError();
    }
  }
  else
  {
    objc_super v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F07F80];
    v34[0] = @"Object to be mapped is nil";
    v12 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
    v13 = [v11 errorWithDomain:@"com.apple.siri.koa.mapper" code:1 userInfo:v12];
    KVSetError();
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (int64_t)targetItemType
{
  return [(KMMapper *)self->_mapper targetItemType];
}

- (KMItemMapper)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

@end