@interface CEMDeviceListRestrictionsCommand_StatusValueDictionary
+ (NSSet)allowedStatusKeys;
+ (id)build;
+ (id)buildRequiredOnly;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSDictionary)statusANY;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (void)setStatusANY:(id)a3;
@end

@implementation CEMDeviceListRestrictionsCommand_StatusValueDictionary

+ (NSSet)allowedStatusKeys
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
}

+ (id)build
{
  v2 = objc_opt_new();

  return v2;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v13 = objc_opt_class();
        id v21 = 0;
        v14 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v7 withKey:v12 classType:v13 isRequired:1 defaultValue:0 error:&v21];
        id v15 = v21;
        [v6 setObject:v14 forKeyedSubscript:v12];

        if (v15)
        {

          if (a4)
          {
            id v15 = v15;
            BOOL v18 = 0;
            *a4 = v15;
          }
          else
          {
            BOOL v18 = 0;
          }
          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  v16 = (NSDictionary *)[v6 copy];
  statusANY = self->_statusANY;
  self->_statusANY = v16;

  id v15 = 0;
  BOOL v18 = 1;
LABEL_13:

  return v18;
}

- (id)serializePayload
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = self->_statusANY;
  uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = -[NSDictionary objectForKeyedSubscript:](self->_statusANY, "objectForKeyedSubscript:", v9, (void)v13);
        [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v3 withKey:v9 withValue:v10 dictSerializer:&__block_literal_global_211 isRequired:1 defaultValue:0];
      }
      uint64_t v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v11 = (void *)[v3 copy];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CEMDeviceListRestrictionsCommand_StatusValueDictionary;
  v4 = [(CEMPayloadBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSDictionary *)self->_statusANY copy];
  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (NSDictionary)statusANY
{
  return self->_statusANY;
}

- (void)setStatusANY:(id)a3
{
}

- (void).cxx_destruct
{
}

@end