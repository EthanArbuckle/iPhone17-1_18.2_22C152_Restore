@interface BMTopicEntity
- (BMTopicEntity)initWithProto:(id)a3;
- (BMTopicEntity)initWithProtoData:(id)a3;
- (BMTopicEntity)initWithTopicId:(id)a3 displayName:(id)a4 attributes:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)attributes;
- (NSString)displayName;
- (NSString)topicId;
- (id)encodeAsProto;
- (id)proto;
@end

@implementation BMTopicEntity

- (BMTopicEntity)initWithTopicId:(id)a3 displayName:(id)a4 attributes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMTopicEntity;
  v12 = [(BMTopicEntity *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_topicId, a3);
    objc_storeStrong((id *)&v13->_displayName, a4);
    objc_storeStrong((id *)&v13->_attributes, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    topicId = self->_topicId;
    v7 = [v5 topicId];
    if ([(NSString *)topicId isEqualToString:v7])
    {
      displayName = self->_displayName;
      id v9 = [v5 displayName];
      if (+[BMEntityRelationshipEventUtilities checkNullableStringEqualityForSource:displayName target:v9])
      {
        attributes = self->_attributes;
        id v11 = [v5 attributes];
        BOOL v12 = +[BMEntityRelationshipEventUtilities checkNullableDictionaryEqualityForSource:attributes target:v11];
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)encodeAsProto
{
  v2 = [(BMTopicEntity *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMTopicEntity)initWithProto:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v6 = [v5 attributes];

    if (v6)
    {
      v6 = objc_opt_new();
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v7 = objc_msgSend(v5, "attributes", 0);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(v7);
            }
            BOOL v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            v13 = [v12 value];
            v14 = [v12 key];
            [v6 setValue:v13 forKey:v14];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v9);
      }
    }
    objc_super v15 = [v5 topicId];
    v16 = [v5 displayName];
    v17 = (void *)[v6 copy];
    self = [(BMTopicEntity *)self initWithTopicId:v15 displayName:v16 attributes:v17];

    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BMTopicEntity)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBTopicEntity alloc] initWithData:v4];

    self = [(BMTopicEntity *)self initWithProto:v5];
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
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = [(BMTopicEntity *)self topicId];
  [v3 setTopicId:v4];

  id v5 = [(BMTopicEntity *)self displayName];
  [v3 setDisplayName:v5];

  v6 = [(BMTopicEntity *)self attributes];

  if (v6)
  {
    v7 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = [(BMTopicEntity *)self attributes];
    uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x192FB0D60]();
          v14 = objc_opt_new();
          [v14 setKey:v12];
          objc_super v15 = [(BMTopicEntity *)self attributes];
          v16 = [v15 objectForKeyedSubscript:v12];
          [v14 setValue:v16];

          [v7 addObject:v14];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }

    v17 = (void *)[v7 copy];
    [v3 setAttributes:v17];
  }

  return v3;
}

- (NSString)topicId
{
  return self->_topicId;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_topicId, 0);
}

@end