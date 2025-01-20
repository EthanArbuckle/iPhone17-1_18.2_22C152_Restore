@interface PDDPClassMember
- (BOOL)hasClassId;
- (BOOL)hasClassMemberId;
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasPersonId;
- (BOOL)hasPersonIds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)classId;
- (NSString)classMemberId;
- (NSString)personId;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (PDDPTypedValue)personIds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)rolesAsString:(int)a3;
- (int)StringAsRoles:(id)a3;
- (int)roles;
- (int)rolesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)rolesCount;
- (void)addRoles:(int)a3;
- (void)clearRoles;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setClassId:(id)a3;
- (void)setClassMemberId:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setPersonId:(id)a3;
- (void)setPersonIds:(id)a3;
- (void)setRoles:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation PDDPClassMember

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)PDDPClassMember;
  [(PDDPClassMember *)&v3 dealloc];
}

- (BOOL)hasClassMemberId
{
  return self->_classMemberId != 0;
}

- (BOOL)hasClassId
{
  return self->_classId != 0;
}

- (BOOL)hasPersonId
{
  return self->_personId != 0;
}

- (unint64_t)rolesCount
{
  return self->_roles.count;
}

- (int)roles
{
  return self->_roles.list;
}

- (void)clearRoles
{
}

- (void)addRoles:(int)a3
{
}

- (int)rolesAtIndex:(unint64_t)a3
{
  p_roles = &self->_roles;
  unint64_t count = self->_roles.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_roles->list[a3];
}

- (void)setRoles:(int *)a3 count:(unint64_t)a4
{
}

- (id)rolesAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_super v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    objc_super v3 = *(&off_1001F2BF8 + a3);
  }

  return v3;
}

- (int)StringAsRoles:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ROLE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STUDENT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INSTRUCTOR"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (BOOL)hasDateLastModified
{
  return self->_dateLastModified != 0;
}

- (BOOL)hasPersonIds
{
  return self->_personIds != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPClassMember;
  id v3 = [(PDDPClassMember *)&v7 description];
  int v4 = [(PDDPClassMember *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  classMemberId = self->_classMemberId;
  if (classMemberId) {
    [v3 setObject:classMemberId forKey:@"class_member_id"];
  }
  classId = self->_classId;
  if (classId) {
    [v4 setObject:classId forKey:@"class_id"];
  }
  personId = self->_personId;
  if (personId) {
    [v4 setObject:personId forKey:@"person_id"];
  }
  p_roles = &self->_roles;
  if (self->_roles.count)
  {
    v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:");
    if (self->_roles.count)
    {
      unint64_t v10 = 0;
      do
      {
        uint64_t v11 = p_roles->list[v10];
        if (v11 >= 3)
        {
          v12 = +[NSString stringWithFormat:@"(unknown: %i)", p_roles->list[v10]];
        }
        else
        {
          v12 = *(&off_1001F2BF8 + v11);
        }
        [v9 addObject:v12];

        ++v10;
      }
      while (v10 < self->_roles.count);
    }
    [v4 setObject:v9 forKey:@"roles"];
  }
  dateCreated = self->_dateCreated;
  if (dateCreated)
  {
    v14 = [(PDDPDate *)dateCreated dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"date_created"];
  }
  dateLastModified = self->_dateLastModified;
  if (dateLastModified)
  {
    v16 = [(PDDPDate *)dateLastModified dictionaryRepresentation];
    [v4 setObject:v16 forKey:@"date_last_modified"];
  }
  personIds = self->_personIds;
  if (personIds)
  {
    v18 = [(PDDPTypedValue *)personIds dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"person_ids"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100045958((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_classMemberId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_classId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_personId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_roles.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v6;
      ++v5;
    }
    while (v5 < self->_roles.count);
  }
  if (self->_dateCreated)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_dateLastModified)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_personIds)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_classMemberId) {
    objc_msgSend(v8, "setClassMemberId:");
  }
  if (self->_classId) {
    objc_msgSend(v8, "setClassId:");
  }
  if (self->_personId) {
    objc_msgSend(v8, "setPersonId:");
  }
  if ([(PDDPClassMember *)self rolesCount])
  {
    [v8 clearRoles];
    unint64_t v4 = [(PDDPClassMember *)self rolesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v8, "addRoles:", -[PDDPClassMember rolesAtIndex:](self, "rolesAtIndex:", i));
    }
  }
  if (self->_dateCreated) {
    objc_msgSend(v8, "setDateCreated:");
  }
  objc_super v7 = v8;
  if (self->_dateLastModified)
  {
    objc_msgSend(v8, "setDateLastModified:");
    objc_super v7 = v8;
  }
  if (self->_personIds)
  {
    objc_msgSend(v8, "setPersonIds:");
    objc_super v7 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_classMemberId copyWithZone:a3];
  objc_super v7 = (void *)v5[5];
  v5[5] = v6;

  id v8 = [(NSString *)self->_classId copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(NSString *)self->_personId copyWithZone:a3];
  uint64_t v11 = (void *)v5[8];
  v5[8] = v10;

  PBRepeatedInt32Copy();
  id v12 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  v13 = (void *)v5[6];
  v5[6] = v12;

  id v14 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  v15 = (void *)v5[7];
  v5[7] = v14;

  id v16 = [(PDDPTypedValue *)self->_personIds copyWithZone:a3];
  v17 = (void *)v5[9];
  v5[9] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((classMemberId = self->_classMemberId, !((unint64_t)classMemberId | v4[5]))
     || -[NSString isEqual:](classMemberId, "isEqual:"))
    && ((classId = self->_classId, !((unint64_t)classId | v4[4]))
     || -[NSString isEqual:](classId, "isEqual:"))
    && ((personId = self->_personId, !((unint64_t)personId | v4[8]))
     || -[NSString isEqual:](personId, "isEqual:"))
    && PBRepeatedInt32IsEqual()
    && ((dateCreated = self->_dateCreated, !((unint64_t)dateCreated | v4[6]))
     || -[PDDPDate isEqual:](dateCreated, "isEqual:"))
    && ((dateLastModified = self->_dateLastModified, !((unint64_t)dateLastModified | v4[7]))
     || -[PDDPDate isEqual:](dateLastModified, "isEqual:")))
  {
    personIds = self->_personIds;
    if ((unint64_t)personIds | v4[9]) {
      unsigned __int8 v11 = -[PDDPTypedValue isEqual:](personIds, "isEqual:");
    }
    else {
      unsigned __int8 v11 = 1;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_classMemberId hash];
  unint64_t v4 = [(NSString *)self->_classId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_personId hash];
  uint64_t v6 = v4 ^ v5 ^ PBRepeatedInt32Hash();
  unint64_t v7 = [(PDDPDate *)self->_dateCreated hash];
  unint64_t v8 = v7 ^ [(PDDPDate *)self->_dateLastModified hash];
  return v6 ^ v8 ^ [(PDDPTypedValue *)self->_personIds hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  v15 = v4;
  if (v4[5])
  {
    -[PDDPClassMember setClassMemberId:](self, "setClassMemberId:");
    unint64_t v4 = v15;
  }
  if (v4[4])
  {
    -[PDDPClassMember setClassId:](self, "setClassId:");
    unint64_t v4 = v15;
  }
  if (v4[8])
  {
    -[PDDPClassMember setPersonId:](self, "setPersonId:");
    unint64_t v4 = v15;
  }
  NSUInteger v5 = (char *)[v4 rolesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[PDDPClassMember addRoles:](self, "addRoles:", [v15 rolesAtIndex:i]);
  }
  dateCreated = self->_dateCreated;
  v9 = v15;
  uint64_t v10 = v15[6];
  if (dateCreated)
  {
    if (!v10) {
      goto LABEL_16;
    }
    -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_16;
    }
    -[PDDPClassMember setDateCreated:](self, "setDateCreated:");
  }
  v9 = v15;
LABEL_16:
  dateLastModified = self->_dateLastModified;
  uint64_t v12 = v9[7];
  if (dateLastModified)
  {
    if (!v12) {
      goto LABEL_22;
    }
    -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_22;
    }
    -[PDDPClassMember setDateLastModified:](self, "setDateLastModified:");
  }
  v9 = v15;
LABEL_22:
  personIds = self->_personIds;
  uint64_t v14 = v9[9];
  if (personIds)
  {
    if (v14) {
      -[PDDPTypedValue mergeFrom:](personIds, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[PDDPClassMember setPersonIds:](self, "setPersonIds:");
  }

  _objc_release_x1();
}

- (NSString)classMemberId
{
  return self->_classMemberId;
}

- (void)setClassMemberId:(id)a3
{
}

- (NSString)classId
{
  return self->_classId;
}

- (void)setClassId:(id)a3
{
}

- (NSString)personId
{
  return self->_personId;
}

- (void)setPersonId:(id)a3
{
}

- (PDDPDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
}

- (PDDPDate)dateLastModified
{
  return self->_dateLastModified;
}

- (void)setDateLastModified:(id)a3
{
}

- (PDDPTypedValue)personIds
{
  return self->_personIds;
}

- (void)setPersonIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personIds, 0);
  objc_storeStrong((id *)&self->_personId, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_classMemberId, 0);

  objc_storeStrong((id *)&self->_classId, 0);
}

@end