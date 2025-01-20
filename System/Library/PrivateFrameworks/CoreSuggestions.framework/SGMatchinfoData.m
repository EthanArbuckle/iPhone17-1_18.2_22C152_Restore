@interface SGMatchinfoData
+ (id)matchinfoDataWithEntityId:(id)a3 detailEntityId:(id)a4;
+ (id)matchinfoDataWithEntityId:(id)a3 detailEntityId:(id)a4 matchinfoData:(id)a5;
- (BOOL)isEqualToMatchinfoData:(id)a3;
- (NSData)matchinfoData;
- (NSNumber)detailEntityId;
- (NSNumber)entityId;
- (SGMatchinfoData)initWithCoder:(id)a3;
- (SGMatchinfoData)initWithMatchinfoDataWithEntityId:(id)a3 detailEntityId:(id)a4 matchinfoData:(id)a5;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGMatchinfoData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchinfoData, 0);
  objc_storeStrong((id *)&self->_detailEntityId, 0);

  objc_storeStrong((id *)&self->_entityId, 0);
}

- (NSData)matchinfoData
{
  return self->_matchinfoData;
}

- (NSNumber)detailEntityId
{
  return self->_detailEntityId;
}

- (NSNumber)entityId
{
  return self->_entityId;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGMatchinfoData: entityId=%@ detailEntityId=%@ matchinfoData=%@", self->_entityId, self->_detailEntityId, self->_matchinfoData];

  return v2;
}

- (BOOL)isEqualToMatchinfoData:(id)a3
{
  id v4 = a3;
  entityId = self->_entityId;
  v6 = [v4 entityId];
  if ([(NSNumber *)entityId isEqualToNumber:v6])
  {
    detailEntityId = self->_detailEntityId;
    v8 = [v4 detailEntityId];
    if ([(NSNumber *)detailEntityId isEqualToNumber:v8])
    {
      matchinfoData = self->_matchinfoData;
      v10 = [v4 matchinfoData];
      BOOL v11 = [(NSData *)matchinfoData isEqualToData:v10];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  entityId = self->_entityId;
  id v5 = a3;
  [v5 encodeObject:entityId forKey:@"entityId"];
  [v5 encodeObject:self->_detailEntityId forKey:@"detailEntityId"];
  [v5 encodeObject:self->_matchinfoData forKey:@"matchinfoData"];
}

- (SGMatchinfoData)initWithCoder:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SGMatchinfoData;
  v6 = [(SGMatchinfoData *)&v20 init];
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v8 = [v5 decodeObjectOfClasses:v7 forKey:@"entityId"];

    if (v8)
    {
      v9 = v8;
      entityId = v6->_entityId;
      v6->_entityId = v9;
    }
    else
    {
      entityId = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(entityId, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGMatchinfoData.m", 48, @"nonnull property %s *%s was null when decoded", "NSNumber", "entityId");
    }

    BOOL v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v12 = [v5 decodeObjectOfClasses:v11 forKey:@"detailEntityId"];

    if (v12)
    {
      v13 = v12;
      detailEntityId = v6->_detailEntityId;
      v6->_detailEntityId = v13;
    }
    else
    {
      detailEntityId = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(detailEntityId, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGMatchinfoData.m", 49, @"nonnull property %s *%s was null when decoded", "NSNumber", "detailEntityId");
    }

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v16 = [v5 decodeObjectOfClasses:v15 forKey:@"matchinfoData"];

    if (v16)
    {
      v17 = v16;
      matchinfoData = v6->_matchinfoData;
      v6->_matchinfoData = v17;
    }
    else
    {
      matchinfoData = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(matchinfoData, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGMatchinfoData.m", 50, @"nonnull property %s *%s was null when decoded", "NSData", "matchinfoData");
    }
  }
  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_entityId hash];
  uint64_t v4 = [(NSNumber *)self->_detailEntityId hash] - v3 + 32 * v3;
  return [(NSData *)self->_matchinfoData hash] - v4 + 32 * v4;
}

- (SGMatchinfoData)initWithMatchinfoDataWithEntityId:(id)a3 detailEntityId:(id)a4 matchinfoData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SGMatchinfoData;
  v12 = [(SGMatchinfoData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_entityId, a3);
    objc_storeStrong((id *)&v13->_detailEntityId, a4);
    objc_storeStrong((id *)&v13->_matchinfoData, a5);
  }

  return v13;
}

+ (id)matchinfoDataWithEntityId:(id)a3 detailEntityId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  id v9 = objc_opt_new();
  id v10 = (void *)[v8 initWithMatchinfoDataWithEntityId:v7 detailEntityId:v6 matchinfoData:v9];

  return v10;
}

+ (id)matchinfoDataWithEntityId:(id)a3 detailEntityId:(id)a4 matchinfoData:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithMatchinfoDataWithEntityId:v10 detailEntityId:v9 matchinfoData:v8];

  return v11;
}

@end