@interface BMEntity
- (BMEntity)initWithIsPersonType:(BOOL)a3 isTopicType:(BOOL)a4 topicEntity:(id)a5 personEntity:(id)a6;
- (BMEntity)initWithPersonEntity:(id)a3;
- (BMEntity)initWithProto:(id)a3;
- (BMEntity)initWithProtoData:(id)a3;
- (BMEntity)initWithTopicEntity:(id)a3;
- (BMPersonEntity)personEntity;
- (BMTopicEntity)topicEntity;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPersonType;
- (BOOL)isTopicType;
- (id)encodeAsProto;
- (id)proto;
@end

@implementation BMEntity

- (BMEntity)initWithTopicEntity:(id)a3
{
  return [(BMEntity *)self initWithIsPersonType:0 isTopicType:1 topicEntity:a3 personEntity:0];
}

- (BMEntity)initWithPersonEntity:(id)a3
{
  return [(BMEntity *)self initWithIsPersonType:1 isTopicType:0 topicEntity:0 personEntity:a3];
}

- (BMEntity)initWithIsPersonType:(BOOL)a3 isTopicType:(BOOL)a4 topicEntity:(id)a5 personEntity:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)BMEntity;
  v13 = [(BMEntity *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_isPersonType = a3;
    v13->_isTopicType = a4;
    objc_storeStrong((id *)&v13->_topicEntity, a5);
    objc_storeStrong((id *)&v14->_personEntity, a6);
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int isTopicType = self->_isTopicType;
    if (isTopicType == [v5 isTopicType]
      && (int isPersonType = self->_isPersonType, isPersonType == [v5 isPersonType]))
    {
      personEntity = self->_personEntity;
      v9 = [v5 personEntity];
      if (+[BMEntityRelationshipEventUtilities checkNullablePersonEntityEqualityForSource:personEntity target:v9])
      {
        topicEntity = self->_topicEntity;
        id v11 = [v5 topicEntity];
        BOOL v12 = +[BMEntityRelationshipEventUtilities checkNullableTopicEntityEqualityForSource:topicEntity target:v11];
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
  v2 = [(BMEntity *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMEntity)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    if ([v5 hasPersonEntity])
    {
      v6 = [BMPersonEntity alloc];
      v7 = [v5 personEntity];
      v8 = [(BMPersonEntity *)v6 initWithProto:v7];
    }
    else
    {
      v8 = 0;
    }
    if ([v5 hasTopicEntity])
    {
      v10 = [BMTopicEntity alloc];
      id v11 = [v5 topicEntity];
      BOOL v12 = [(BMTopicEntity *)v10 initWithProto:v11];
    }
    else
    {
      BOOL v12 = 0;
    }
    self = -[BMEntity initWithIsPersonType:isTopicType:topicEntity:personEntity:](self, "initWithIsPersonType:isTopicType:topicEntity:personEntity:", [v5 hasPersonEntity], objc_msgSend(v5, "hasTopicEntity"), v12, v8);

    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BMEntity)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBEntity alloc] initWithData:v4];

    self = [(BMEntity *)self initWithProto:v5];
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
  v3 = objc_opt_new();
  if ([(BMEntity *)self isTopicType]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  [v3 setEntityType:v4];
  if ([(BMEntity *)self isTopicType])
  {
    id v5 = [(BMEntity *)self topicEntity];
    v6 = [v5 proto];
    [v3 setTopicEntity:v6];
  }
  if ([(BMEntity *)self isPersonType])
  {
    v7 = [(BMEntity *)self personEntity];
    v8 = [v7 proto];
    [v3 setPersonEntity:v8];
  }

  return v3;
}

- (BOOL)isPersonType
{
  return self->_isPersonType;
}

- (BOOL)isTopicType
{
  return self->_isTopicType;
}

- (BMTopicEntity)topicEntity
{
  return self->_topicEntity;
}

- (BMPersonEntity)personEntity
{
  return self->_personEntity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personEntity, 0);

  objc_storeStrong((id *)&self->_topicEntity, 0);
}

@end