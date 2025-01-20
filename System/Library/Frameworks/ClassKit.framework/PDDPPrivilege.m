@interface PDDPPrivilege
+ (Class)locationIdsType;
- (BOOL)hasPrivilegeName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)locationIds;
- (NSString)privilegeName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)locationIdsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)locationIdsCount;
- (void)addLocationIds:(id)a3;
- (void)clearLocationIds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLocationIds:(id)a3;
- (void)setPrivilegeName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPPrivilege

- (BOOL)hasPrivilegeName
{
  return self->_privilegeName != 0;
}

- (void)clearLocationIds
{
}

- (void)addLocationIds:(id)a3
{
  id v4 = a3;
  locationIds = self->_locationIds;
  id v8 = v4;
  if (!locationIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_locationIds;
    self->_locationIds = v6;

    id v4 = v8;
    locationIds = self->_locationIds;
  }
  [(NSMutableArray *)locationIds addObject:v4];
}

- (unint64_t)locationIdsCount
{
  return (unint64_t)[(NSMutableArray *)self->_locationIds count];
}

- (id)locationIdsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_locationIds objectAtIndex:a3];
}

+ (Class)locationIdsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPPrivilege;
  v3 = [(PDDPPrivilege *)&v7 description];
  id v4 = [(PDDPPrivilege *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  privilegeName = self->_privilegeName;
  if (privilegeName) {
    [v3 setObject:privilegeName forKey:@"privilege_name"];
  }
  locationIds = self->_locationIds;
  if (locationIds) {
    [v4 setObject:locationIds forKey:@"location_ids"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000C0778(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_privilegeName) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_locationIds;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_privilegeName) {
    objc_msgSend(v8, "setPrivilegeName:");
  }
  if ([(PDDPPrivilege *)self locationIdsCount])
  {
    [v8 clearLocationIds];
    unint64_t v4 = [(PDDPPrivilege *)self locationIdsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(PDDPPrivilege *)self locationIdsAtIndex:i];
        [v8 addLocationIds:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_privilegeName copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_locationIds;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v12), "copyWithZone:", a3, (void)v15);
        [v5 addLocationIds:v13];

        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((privilegeName = self->_privilegeName, !((unint64_t)privilegeName | v4[2]))
     || -[NSString isEqual:](privilegeName, "isEqual:")))
  {
    locationIds = self->_locationIds;
    if ((unint64_t)locationIds | v4[1]) {
      unsigned __int8 v7 = -[NSMutableArray isEqual:](locationIds, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_privilegeName hash];
  return (unint64_t)[(NSMutableArray *)self->_locationIds hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[PDDPPrivilege setPrivilegeName:](self, "setPrivilegeName:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[PDDPPrivilege addLocationIds:](self, "addLocationIds:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)privilegeName
{
  return self->_privilegeName;
}

- (void)setPrivilegeName:(id)a3
{
}

- (NSMutableArray)locationIds
{
  return self->_locationIds;
}

- (void)setLocationIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privilegeName, 0);

  objc_storeStrong((id *)&self->_locationIds, 0);
}

@end