@interface CNHandle
+ (id)geminiHandleForHandle:(id)a3;
+ (id)geminiHandleTypeMap;
+ (id)inPersonHandleForHandle:(id)a3;
+ (id)inPersonHandleTypeMap;
+ (id)keyTypeMapping;
+ (id)tuHandleForHandle:(id)a3;
+ (id)tuHandleTypeMap;
+ (int64_t)geminiHandleTypeForType:(unint64_t)a3;
+ (int64_t)inPersonHandleTypeForType:(unint64_t)a3;
+ (int64_t)tuHandleTypeFromType:(unint64_t)a3;
+ (unint64_t)handleTypeForPropertyKey:(id)a3;
- (CNHandle)initWithStringValue:(id)a3 customIdentifier:(id)a4 type:(unint64_t)a5;
- (CNHandle)initWithStringValue:(id)a3 type:(unint64_t)a4;
- (NSString)customIdentifier;
- (NSString)stringValue;
- (unint64_t)type;
@end

@implementation CNHandle

- (CNHandle)initWithStringValue:(id)a3 customIdentifier:(id)a4 type:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNHandle;
  v10 = [(CNHandle *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    stringValue = v10->_stringValue;
    v10->_stringValue = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    customIdentifier = v10->_customIdentifier;
    v10->_customIdentifier = (NSString *)v13;

    v10->_type = a5;
    v15 = v10;
  }

  return v10;
}

- (CNHandle)initWithStringValue:(id)a3 type:(unint64_t)a4
{
  return [(CNHandle *)self initWithStringValue:a3 customIdentifier:0 type:a4];
}

+ (unint64_t)handleTypeForPropertyKey:(id)a3
{
  id v4 = a3;
  v5 = [a1 keyTypeMapping];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    unint64_t v7 = [v6 integerValue];
  }
  else {
    unint64_t v7 = 1;
  }

  return v7;
}

+ (id)keyTypeMapping
{
  if (keyTypeMapping_cn_once_token_2 != -1) {
    dispatch_once(&keyTypeMapping_cn_once_token_2, &__block_literal_global_72);
  }
  v2 = (void *)keyTypeMapping_cn_once_object_2;
  return v2;
}

void __26__CNHandle_keyTypeMapping__block_invoke()
{
  v4[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263EFDF80];
  v3[0] = *MEMORY[0x263EFE070];
  v3[1] = v0;
  v4[0] = &unk_26BFD9B50;
  v4[1] = &unk_26BFD9B68;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  v2 = (void *)keyTypeMapping_cn_once_object_2;
  keyTypeMapping_cn_once_object_2 = v1;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)customIdentifier
{
  return self->_customIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customIdentifier, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
}

+ (id)tuHandleForHandle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  TUHandleClass = getTUHandleClass();
  unint64_t v7 = TUHandleClass;
  if (v5 == 1)
  {
    id v8 = [v4 stringValue];

    uint64_t v9 = [(objc_class *)v7 handleWithDestinationID:v8];
  }
  else
  {
    id v10 = [TUHandleClass alloc];
    uint64_t v11 = objc_msgSend(a1, "tuHandleTypeFromType:", objc_msgSend(v4, "type"));
    id v8 = [v4 stringValue];

    uint64_t v9 = [v10 initWithType:v11 value:v8];
  }
  v12 = (void *)v9;

  return v12;
}

+ (int64_t)tuHandleTypeFromType:(unint64_t)a3
{
  id v4 = [a1 tuHandleTypeMap];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a3];
  v6 = [v4 objectForKeyedSubscript:v5];
  int64_t v7 = [v6 integerValue];

  return v7;
}

+ (id)tuHandleTypeMap
{
  if (tuHandleTypeMap_cn_once_token_3 != -1) {
    dispatch_once(&tuHandleTypeMap_cn_once_token_3, &__block_literal_global_79_0);
  }
  v2 = (void *)tuHandleTypeMap_cn_once_object_3;
  return v2;
}

void __37__CNHandle_TUHandle__tuHandleTypeMap__block_invoke()
{
  void v3[2] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26BFD9B50;
  v2[1] = &unk_26BFD9B68;
  v3[0] = &unk_26BFD9B80;
  v3[1] = &unk_26BFD9B98;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:2];
  uint64_t v1 = (void *)tuHandleTypeMap_cn_once_object_3;
  tuHandleTypeMap_cn_once_object_3 = v0;
}

+ (id)inPersonHandleForHandle:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F0FD20];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 stringValue];
  int64_t v7 = objc_opt_class();
  uint64_t v8 = [v4 type];

  uint64_t v9 = objc_msgSend(v5, "initWithValue:type:", v6, objc_msgSend(v7, "inPersonHandleTypeForType:", v8));
  return v9;
}

+ (int64_t)inPersonHandleTypeForType:(unint64_t)a3
{
  id v4 = [a1 inPersonHandleTypeMap];
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  v6 = [v4 objectForKeyedSubscript:v5];
  int64_t v7 = [v6 integerValue];

  return v7;
}

+ (id)inPersonHandleTypeMap
{
  if (inPersonHandleTypeMap_cn_once_token_4 != -1) {
    dispatch_once(&inPersonHandleTypeMap_cn_once_token_4, &__block_literal_global_93);
  }
  v2 = (void *)inPersonHandleTypeMap_cn_once_object_4;
  return v2;
}

void __49__CNHandle_INPersonHandle__inPersonHandleTypeMap__block_invoke()
{
  void v3[3] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26BFD9BB0;
  v2[1] = &unk_26BFD9B50;
  v3[0] = &unk_26BFD9BC8;
  v3[1] = &unk_26BFD9B80;
  void v2[2] = &unk_26BFD9B68;
  void v3[2] = &unk_26BFD9BE0;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:3];
  uint64_t v1 = (void *)inPersonHandleTypeMap_cn_once_object_4;
  inPersonHandleTypeMap_cn_once_object_4 = v0;
}

+ (id)geminiHandleForHandle:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263EFEAA8];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 stringValue];
  int64_t v7 = objc_opt_class();
  uint64_t v8 = [v4 type];

  uint64_t v9 = objc_msgSend(v5, "initWithString:type:", v6, objc_msgSend(v7, "geminiHandleTypeForType:", v8));
  return v9;
}

+ (int64_t)geminiHandleTypeForType:(unint64_t)a3
{
  id v4 = [a1 geminiHandleTypeMap];
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  v6 = [v4 objectForKeyedSubscript:v5];
  int64_t v7 = [v6 integerValue];

  return v7;
}

+ (id)geminiHandleTypeMap
{
  if (geminiHandleTypeMap_cn_once_token_5 != -1) {
    dispatch_once(&geminiHandleTypeMap_cn_once_token_5, &__block_literal_global_106_0);
  }
  v2 = (void *)geminiHandleTypeMap_cn_once_object_5;
  return v2;
}

void __47__CNHandle_CNGeminiHandle__geminiHandleTypeMap__block_invoke()
{
  void v3[3] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26BFD9BB0;
  v2[1] = &unk_26BFD9B50;
  v3[0] = &unk_26BFD9BF8;
  v3[1] = &unk_26BFD9BC8;
  void v2[2] = &unk_26BFD9B68;
  void v3[2] = &unk_26BFD9BE0;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:3];
  uint64_t v1 = (void *)geminiHandleTypeMap_cn_once_object_5;
  geminiHandleTypeMap_cn_once_object_5 = v0;
}

@end