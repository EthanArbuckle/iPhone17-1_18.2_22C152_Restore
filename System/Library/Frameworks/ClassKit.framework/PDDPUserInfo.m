@interface PDDPUserInfo
+ (Class)rolesType;
- (BOOL)hasPerson;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)roles;
- (PDDPPerson)person;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)rolesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)rolesCount;
- (void)addRoles:(id)a3;
- (void)clearRoles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPerson:(id)a3;
- (void)setRoles:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPUserInfo

- (BOOL)hasPerson
{
  return self->_person != 0;
}

- (void)clearRoles
{
}

- (void)addRoles:(id)a3
{
  id v4 = a3;
  roles = self->_roles;
  id v8 = v4;
  if (!roles)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_roles;
    self->_roles = v6;

    id v4 = v8;
    roles = self->_roles;
  }
  [(NSMutableArray *)roles addObject:v4];
}

- (unint64_t)rolesCount
{
  return (unint64_t)[(NSMutableArray *)self->_roles count];
}

- (id)rolesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_roles objectAtIndex:a3];
}

+ (Class)rolesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPUserInfo;
  v3 = [(PDDPUserInfo *)&v7 description];
  id v4 = [(PDDPUserInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  person = self->_person;
  if (person)
  {
    v5 = [(PDDPPerson *)person dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"person"];
  }
  roles = self->_roles;
  if (roles) {
    [v3 setObject:roles forKey:@"roles"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10009A660((id *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_person) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_roles;
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
  if (self->_person) {
    objc_msgSend(v8, "setPerson:");
  }
  if ([(PDDPUserInfo *)self rolesCount])
  {
    [v8 clearRoles];
    unint64_t v4 = [(PDDPUserInfo *)self rolesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(PDDPUserInfo *)self rolesAtIndex:i];
        [v8 addRoles:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PDDPPerson *)self->_person copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_roles;
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
        [v5 addRoles:v13];

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
    && ((person = self->_person, !((unint64_t)person | v4[1])) || -[PDDPPerson isEqual:](person, "isEqual:")))
  {
    roles = self->_roles;
    if ((unint64_t)roles | v4[2]) {
      unsigned __int8 v7 = -[NSMutableArray isEqual:](roles, "isEqual:");
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
  unint64_t v3 = [(PDDPPerson *)self->_person hash];
  return (unint64_t)[(NSMutableArray *)self->_roles hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  person = self->_person;
  uint64_t v6 = *((void *)v4 + 1);
  if (person)
  {
    if (v6) {
      -[PDDPPerson mergeFrom:](person, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PDDPUserInfo setPerson:](self, "setPerson:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 2);
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[PDDPUserInfo addRoles:](self, "addRoles:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (PDDPPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
}

- (NSMutableArray)roles
{
  return self->_roles;
}

- (void)setRoles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roles, 0);

  objc_storeStrong((id *)&self->_person, 0);
}

@end