@interface BMEntityRelationshipEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMEntity)sourceEntity;
- (BMEntity)targetEntity;
- (BMEntityRelationshipEvent)initWithClientId:(id)a3 relationship:(id)a4 sourceEntity:(id)a5 targetEntity:(id)a6 attributes:(id)a7;
- (BMEntityRelationshipEvent)initWithProto:(id)a3;
- (BMEntityRelationshipEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)attributes;
- (NSString)clientId;
- (NSString)relationship;
- (id)encodeAsProto;
- (id)entityFromPBEntity:(id)a3;
- (id)proto;
- (unsigned)dataVersion;
@end

@implementation BMEntityRelationshipEvent

- (BMEntityRelationshipEvent)initWithClientId:(id)a3 relationship:(id)a4 sourceEntity:(id)a5 targetEntity:(id)a6 attributes:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMEntityRelationshipEvent;
  v17 = [(BMEntityRelationshipEvent *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_clientId, a3);
    objc_storeStrong((id *)&v18->_relationship, a4);
    objc_storeStrong((id *)&v18->_sourceEntity, a5);
    objc_storeStrong((id *)&v18->_targetEntity, a6);
    objc_storeStrong((id *)&v18->_attributes, a7);
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    clientId = self->_clientId;
    v7 = [v5 clientId];
    if ([(NSString *)clientId isEqualToString:v7])
    {
      relationship = self->_relationship;
      v9 = [v5 relationship];
      if ([(NSString *)relationship isEqualToString:v9])
      {
        sourceEntity = self->_sourceEntity;
        v11 = [v5 sourceEntity];
        if ([(BMEntity *)sourceEntity isEqual:v11])
        {
          targetEntity = self->_targetEntity;
          id v13 = [v5 targetEntity];
          if ([(BMEntity *)targetEntity isEqual:v13])
          {
            attributes = self->_attributes;
            id v15 = [v5 attributes];
            BOOL v16 = +[BMEntityRelationshipEventUtilities checkNullableDictionaryEqualityForSource:attributes target:v15];
          }
          else
          {
            BOOL v16 = 0;
          }
        }
        else
        {
          BOOL v16 = 0;
        }
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v5 = a3;
    v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(BMEntityRelationshipEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMEntityRelationshipEvent)initWithProto:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v6 = [v5 sourceEntity];
    v7 = [(BMEntityRelationshipEvent *)self entityFromPBEntity:v6];

    v8 = [v5 targetEntity];
    v9 = [(BMEntityRelationshipEvent *)self entityFromPBEntity:v8];

    v10 = [v5 attributes];

    if (v10)
    {
      v24 = v9;
      v25 = v7;
      v10 = objc_opt_new();
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v11 = [v5 attributes];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v27 != v14) {
              objc_enumerationMutation(v11);
            }
            BOOL v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            v17 = objc_msgSend(v16, "value", v24, v25);
            v18 = [v16 key];
            [v10 setValue:v17 forKey:v18];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v13);
      }

      v9 = v24;
      v7 = v25;
    }
    v19 = objc_msgSend(v5, "clientId", v24, v25);
    id v20 = [v5 relationship];
    objc_super v21 = (void *)[v10 copy];
    self = [(BMEntityRelationshipEvent *)self initWithClientId:v19 relationship:v20 sourceEntity:v7 targetEntity:v9 attributes:v21];

    v22 = self;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BMEntityRelationshipEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBEntityRelationshipEvent alloc] initWithData:v4];

    self = [(BMEntityRelationshipEvent *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = [(BMEntityRelationshipEvent *)self clientId];
  [v3 setClientId:v4];

  id v5 = [(BMEntityRelationshipEvent *)self relationship];
  [v3 setRelationship:v5];

  v6 = [(BMEntityRelationshipEvent *)self sourceEntity];
  v7 = [v6 proto];
  [v3 setSourceEntity:v7];

  v8 = [(BMEntityRelationshipEvent *)self targetEntity];
  v9 = [v8 proto];
  [v3 setTargetEntity:v9];

  v10 = [(BMEntityRelationshipEvent *)self attributes];

  if (v10)
  {
    v11 = objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = [(BMEntityRelationshipEvent *)self attributes];
    uint64_t v12 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x192FB0D60]();
          v18 = objc_opt_new();
          [v18 setKey:v16];
          v19 = [(BMEntityRelationshipEvent *)self attributes];
          id v20 = [v19 objectForKeyedSubscript:v16];
          [v18 setValue:v20];

          [v11 addObject:v18];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }

    objc_super v21 = (void *)[v11 copy];
    [v3 setAttributes:v21];
  }

  return v3;
}

- (id)entityFromPBEntity:(id)a3
{
  id v3 = a3;
  id v4 = [BMEntity alloc];
  uint64_t v5 = [v3 hasPersonEntity];
  uint64_t v6 = [v3 hasTopicEntity];
  v7 = [BMTopicEntity alloc];
  v8 = [v3 topicEntity];
  v9 = [(BMTopicEntity *)v7 initWithProto:v8];
  v10 = [BMPersonEntity alloc];
  v11 = [v3 personEntity];

  uint64_t v12 = [(BMPersonEntity *)v10 initWithProto:v11];
  uint64_t v13 = [(BMEntity *)v4 initWithIsPersonType:v5 isTopicType:v6 topicEntity:v9 personEntity:v12];

  return v13;
}

- (NSString)clientId
{
  return self->_clientId;
}

- (NSString)relationship
{
  return self->_relationship;
}

- (BMEntity)sourceEntity
{
  return self->_sourceEntity;
}

- (BMEntity)targetEntity
{
  return self->_targetEntity;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_targetEntity, 0);
  objc_storeStrong((id *)&self->_sourceEntity, 0);
  objc_storeStrong((id *)&self->_relationship, 0);

  objc_storeStrong((id *)&self->_clientId, 0);
}

@end