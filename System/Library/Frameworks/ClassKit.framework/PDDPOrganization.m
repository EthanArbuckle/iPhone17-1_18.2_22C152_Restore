@interface PDDPOrganization
+ (Class)emailDomainsType;
+ (Class)locationsType;
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasOrganizationId;
- (BOOL)hasOrganizationName;
- (BOOL)hasOrganizationType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)emailDomains;
- (NSMutableArray)locations;
- (NSString)organizationId;
- (NSString)organizationName;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)emailDomainsAtIndex:(unint64_t)a3;
- (id)locationsAtIndex:(unint64_t)a3;
- (id)organizationTypeAsString:(int)a3;
- (int)StringAsOrganizationType:(id)a3;
- (int)organizationType;
- (unint64_t)emailDomainsCount;
- (unint64_t)hash;
- (unint64_t)locationsCount;
- (void)addEmailDomains:(id)a3;
- (void)addLocations:(id)a3;
- (void)clearEmailDomains;
- (void)clearLocations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setEmailDomains:(id)a3;
- (void)setHasOrganizationType:(BOOL)a3;
- (void)setLocations:(id)a3;
- (void)setOrganizationId:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setOrganizationType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPOrganization

- (BOOL)hasOrganizationId
{
  return self->_organizationId != 0;
}

- (BOOL)hasOrganizationName
{
  return self->_organizationName != 0;
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (BOOL)hasDateLastModified
{
  return self->_dateLastModified != 0;
}

- (int)organizationType
{
  if (*(unsigned char *)&self->_has) {
    return self->_organizationType;
  }
  else {
    return 0;
  }
}

- (void)setOrganizationType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_organizationType = a3;
}

- (void)setHasOrganizationType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOrganizationType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)organizationTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = off_1001F4158[a3];
  }

  return v3;
}

- (int)StringAsOrganizationType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ORGANIZATION_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EDUCATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BUSINESS"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearLocations
{
}

- (void)addLocations:(id)a3
{
  id v4 = a3;
  locations = self->_locations;
  id v8 = v4;
  if (!locations)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_locations;
    self->_locations = v6;

    id v4 = v8;
    locations = self->_locations;
  }
  [(NSMutableArray *)locations addObject:v4];
}

- (unint64_t)locationsCount
{
  return (unint64_t)[(NSMutableArray *)self->_locations count];
}

- (id)locationsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_locations objectAtIndex:a3];
}

+ (Class)locationsType
{
  return (Class)objc_opt_class();
}

- (void)clearEmailDomains
{
}

- (void)addEmailDomains:(id)a3
{
  id v4 = a3;
  emailDomains = self->_emailDomains;
  id v8 = v4;
  if (!emailDomains)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_emailDomains;
    self->_emailDomains = v6;

    id v4 = v8;
    emailDomains = self->_emailDomains;
  }
  [(NSMutableArray *)emailDomains addObject:v4];
}

- (unint64_t)emailDomainsCount
{
  return (unint64_t)[(NSMutableArray *)self->_emailDomains count];
}

- (id)emailDomainsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_emailDomains objectAtIndex:a3];
}

+ (Class)emailDomainsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPOrganization;
  id v3 = [(PDDPOrganization *)&v7 description];
  id v4 = [(PDDPOrganization *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  organizationId = self->_organizationId;
  if (organizationId) {
    [v3 setObject:organizationId forKey:@"organization_id"];
  }
  organizationName = self->_organizationName;
  if (organizationName) {
    [v4 setObject:organizationName forKey:@"organization_name"];
  }
  dateCreated = self->_dateCreated;
  if (dateCreated)
  {
    id v8 = [(PDDPDate *)dateCreated dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"date_created"];
  }
  dateLastModified = self->_dateLastModified;
  if (dateLastModified)
  {
    v10 = [(PDDPDate *)dateLastModified dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"date_last_modified"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t organizationType = self->_organizationType;
    if (organizationType >= 3)
    {
      v12 = +[NSString stringWithFormat:@"(unknown: %i)", self->_organizationType];
    }
    else
    {
      v12 = off_1001F4158[organizationType];
    }
    [v4 setObject:v12 forKey:@"organization_type"];
  }
  if ([(NSMutableArray *)self->_locations count])
  {
    id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_locations, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v14 = self->_locations;
    id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v22 + 1) + 8 * i) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v16);
    }

    [v4 setObject:v13 forKey:@"locations"];
  }
  emailDomains = self->_emailDomains;
  if (emailDomains) {
    [v4 setObject:emailDomains forKey:@"email_domains"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000C351C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_organizationId) {
    PBDataWriterWriteStringField();
  }
  if (self->_organizationName) {
    PBDataWriterWriteStringField();
  }
  if (self->_dateCreated) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dateLastModified) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_locations;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_emailDomains;
  v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (self->_organizationId)
  {
    objc_msgSend(v4, "setOrganizationId:");
    id v4 = v13;
  }
  if (self->_organizationName)
  {
    objc_msgSend(v13, "setOrganizationName:");
    id v4 = v13;
  }
  if (self->_dateCreated)
  {
    objc_msgSend(v13, "setDateCreated:");
    id v4 = v13;
  }
  if (self->_dateLastModified)
  {
    objc_msgSend(v13, "setDateLastModified:");
    id v4 = v13;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 14) = self->_organizationType;
    *((unsigned char *)v4 + 60) |= 1u;
  }
  if ([(PDDPOrganization *)self locationsCount])
  {
    [v13 clearLocations];
    unint64_t v5 = [(PDDPOrganization *)self locationsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PDDPOrganization *)self locationsAtIndex:i];
        [v13 addLocations:v8];
      }
    }
  }
  if ([(PDDPOrganization *)self emailDomainsCount])
  {
    [v13 clearEmailDomains];
    unint64_t v9 = [(PDDPOrganization *)self emailDomainsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        v12 = [(PDDPOrganization *)self emailDomainsAtIndex:j];
        [v13 addEmailDomains:v12];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_organizationId copyWithZone:a3];
  objc_super v7 = (void *)v5[5];
  v5[5] = v6;

  id v8 = [(NSString *)self->_organizationName copyWithZone:a3];
  unint64_t v9 = (void *)v5[6];
  v5[6] = v8;

  id v10 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  id v12 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  id v13 = (void *)v5[2];
  v5[2] = v12;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 14) = self->_organizationType;
    *((unsigned char *)v5 + 60) |= 1u;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v14 = self->_locations;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [*(id *)(*((void *)&v31 + 1) + 8 * i) copyWithZone:a3];
        [v5 addLocations:v19];
      }
      id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v16);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v20 = self->_emailDomains;
  id v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v22; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * (void)j), "copyWithZone:", a3, (void)v27);
        [v5 addEmailDomains:v25];
      }
      id v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v22);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  organizationId = self->_organizationId;
  if ((unint64_t)organizationId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](organizationId, "isEqual:")) {
      goto LABEL_19;
    }
  }
  organizationName = self->_organizationName;
  if ((unint64_t)organizationName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](organizationName, "isEqual:")) {
      goto LABEL_19;
    }
  }
  dateCreated = self->_dateCreated;
  if ((unint64_t)dateCreated | *((void *)v4 + 1))
  {
    if (!-[PDDPDate isEqual:](dateCreated, "isEqual:")) {
      goto LABEL_19;
    }
  }
  dateLastModified = self->_dateLastModified;
  if ((unint64_t)dateLastModified | *((void *)v4 + 2))
  {
    if (!-[PDDPDate isEqual:](dateLastModified, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_organizationType != *((_DWORD *)v4 + 14)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
LABEL_19:
    unsigned __int8 v11 = 0;
    goto LABEL_20;
  }
  locations = self->_locations;
  if ((unint64_t)locations | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](locations, "isEqual:"))
  {
    goto LABEL_19;
  }
  emailDomains = self->_emailDomains;
  if ((unint64_t)emailDomains | *((void *)v4 + 3)) {
    unsigned __int8 v11 = -[NSMutableArray isEqual:](emailDomains, "isEqual:");
  }
  else {
    unsigned __int8 v11 = 1;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_organizationId hash];
  NSUInteger v4 = [(NSString *)self->_organizationName hash];
  unint64_t v5 = [(PDDPDate *)self->_dateCreated hash];
  unint64_t v6 = [(PDDPDate *)self->_dateLastModified hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_organizationType;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v9 = v7 ^ (unint64_t)[(NSMutableArray *)self->_locations hash];
  return v8 ^ v9 ^ (unint64_t)[(NSMutableArray *)self->_emailDomains hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 5)) {
    -[PDDPOrganization setOrganizationId:](self, "setOrganizationId:");
  }
  if (*((void *)v4 + 6)) {
    -[PDDPOrganization setOrganizationName:](self, "setOrganizationName:");
  }
  dateCreated = self->_dateCreated;
  uint64_t v6 = *((void *)v4 + 1);
  if (dateCreated)
  {
    if (v6) {
      -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PDDPOrganization setDateCreated:](self, "setDateCreated:");
  }
  dateLastModified = self->_dateLastModified;
  uint64_t v8 = *((void *)v4 + 2);
  if (dateLastModified)
  {
    if (v8) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PDDPOrganization setDateLastModified:](self, "setDateLastModified:");
  }
  if (*((unsigned char *)v4 + 60))
  {
    self->_uint64_t organizationType = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = *((id *)v4 + 4);
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        [(PDDPOrganization *)self addLocations:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v11);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = *((id *)v4 + 3);
  id v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v16; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        -[PDDPOrganization addEmailDomains:](self, "addEmailDomains:", *(void *)(*((void *)&v19 + 1) + 8 * (void)j), (void)v19);
      }
      id v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }
}

- (NSString)organizationId
{
  return self->_organizationId;
}

- (void)setOrganizationId:(id)a3
{
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
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

- (NSMutableArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
}

- (NSMutableArray)emailDomains
{
  return self->_emailDomains;
}

- (void)setEmailDomains:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_organizationId, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_emailDomains, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);

  objc_storeStrong((id *)&self->_dateCreated, 0);
}

@end