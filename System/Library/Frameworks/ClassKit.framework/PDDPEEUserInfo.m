@interface PDDPEEUserInfo
+ (Class)locationsType;
+ (Class)privilegesType;
+ (Class)rolesType;
- (BOOL)analyticsOptedIn;
- (BOOL)hasAnalyticsOptedIn;
- (BOOL)hasIsEduUser;
- (BOOL)hasOrganizationFacetimeMessagesEnabled;
- (BOOL)hasOrganizationId;
- (BOOL)hasOrganizationName;
- (BOOL)hasOrganizationProgressTrackingAllowed;
- (BOOL)hasUserInfo;
- (BOOL)isEduUser;
- (BOOL)isEqual:(id)a3;
- (BOOL)organizationFacetimeMessagesEnabled;
- (BOOL)organizationProgressTrackingAllowed;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)locations;
- (NSMutableArray)privileges;
- (NSMutableArray)roles;
- (NSString)organizationId;
- (NSString)organizationName;
- (PDDPUserInfo)userInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)locationsAtIndex:(unint64_t)a3;
- (id)privilegesAtIndex:(unint64_t)a3;
- (id)rolesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)locationsCount;
- (unint64_t)privilegesCount;
- (unint64_t)rolesCount;
- (void)addLocations:(id)a3;
- (void)addPrivileges:(id)a3;
- (void)addRoles:(id)a3;
- (void)clearLocations;
- (void)clearPrivileges;
- (void)clearRoles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnalyticsOptedIn:(BOOL)a3;
- (void)setHasAnalyticsOptedIn:(BOOL)a3;
- (void)setHasIsEduUser:(BOOL)a3;
- (void)setHasOrganizationFacetimeMessagesEnabled:(BOOL)a3;
- (void)setHasOrganizationProgressTrackingAllowed:(BOOL)a3;
- (void)setIsEduUser:(BOOL)a3;
- (void)setLocations:(id)a3;
- (void)setOrganizationFacetimeMessagesEnabled:(BOOL)a3;
- (void)setOrganizationId:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setOrganizationProgressTrackingAllowed:(BOOL)a3;
- (void)setPrivileges:(id)a3;
- (void)setRoles:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPEEUserInfo

- (BOOL)hasUserInfo
{
  return self->_userInfo != 0;
}

- (void)clearPrivileges
{
}

- (void)addPrivileges:(id)a3
{
  id v4 = a3;
  privileges = self->_privileges;
  id v8 = v4;
  if (!privileges)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_privileges;
    self->_privileges = v6;

    id v4 = v8;
    privileges = self->_privileges;
  }
  [(NSMutableArray *)privileges addObject:v4];
}

- (unint64_t)privilegesCount
{
  return (unint64_t)[(NSMutableArray *)self->_privileges count];
}

- (id)privilegesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_privileges objectAtIndex:a3];
}

+ (Class)privilegesType
{
  return (Class)objc_opt_class();
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

- (void)setIsEduUser:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isEduUser = a3;
}

- (void)setHasIsEduUser:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsEduUser
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasOrganizationId
{
  return self->_organizationId != 0;
}

- (BOOL)hasOrganizationName
{
  return self->_organizationName != 0;
}

- (void)setOrganizationProgressTrackingAllowed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_organizationProgressTrackingAllowed = a3;
}

- (void)setHasOrganizationProgressTrackingAllowed:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasOrganizationProgressTrackingAllowed
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setOrganizationFacetimeMessagesEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_organizationFacetimeMessagesEnabled = a3;
}

- (void)setHasOrganizationFacetimeMessagesEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOrganizationFacetimeMessagesEnabled
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAnalyticsOptedIn:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_analyticsOptedIn = a3;
}

- (void)setHasAnalyticsOptedIn:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAnalyticsOptedIn
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPEEUserInfo;
  char v3 = [(PDDPEEUserInfo *)&v7 description];
  id v4 = [(PDDPEEUserInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  userInfo = self->_userInfo;
  if (userInfo)
  {
    v5 = [(PDDPUserInfo *)userInfo dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"user_info"];
  }
  if ([(NSMutableArray *)self->_privileges count])
  {
    id v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_privileges, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    objc_super v7 = self->_privileges;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v44;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v44 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v43 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"privileges"];
  }
  if ([(NSMutableArray *)self->_roles count])
  {
    id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_roles, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v14 = self->_roles;
    id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v40;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v39 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"roles"];
  }
  if ([(NSMutableArray *)self->_locations count])
  {
    id v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_locations, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v21 = self->_locations;
    id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v36;
      do
      {
        for (k = 0; k != v23; k = (char *)k + 1)
        {
          if (*(void *)v36 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * (void)k), "dictionaryRepresentation", (void)v35);
          [v20 addObject:v26];
        }
        id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v35 objects:v47 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKey:@"locations"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v27 = +[NSNumber numberWithBool:self->_isEduUser];
    [v3 setObject:v27 forKey:@"is_edu_user"];
  }
  organizationId = self->_organizationId;
  if (organizationId) {
    [v3 setObject:organizationId forKey:@"organization_id"];
  }
  organizationName = self->_organizationName;
  if (organizationName) {
    [v3 setObject:organizationName forKey:@"organization_name"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v33 = +[NSNumber numberWithBool:self->_organizationProgressTrackingAllowed];
    [v3 setObject:v33 forKey:@"organization_progress_tracking_allowed"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_38:
      if ((has & 1) == 0) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_38;
  }
  v34 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_organizationFacetimeMessagesEnabled, (void)v35);
  [v3 setObject:v34 forKey:@"organization_facetime_messages_enabled"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_39:
    v31 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_analyticsOptedIn, (void)v35);
    [v3 setObject:v31 forKey:@"analytics_opted_in"];
  }
LABEL_40:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001069C4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_userInfo) {
    PBDataWriterWriteSubmessage();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v5 = self->_privileges;
  id v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = self->_roles;
  v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v12);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = self->_locations;
  id v16 = (char *)[(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v17 = (char *)[(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v17);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_organizationId) {
    PBDataWriterWriteStringField();
  }
  if (self->_organizationName) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_32;
    }
LABEL_36:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_36;
  }
LABEL_32:
  if (has) {
LABEL_33:
  }
    PBDataWriterWriteBOOLField();
LABEL_34:
}

- (void)copyTo:(id)a3
{
  uint64_t v18 = a3;
  if (self->_userInfo) {
    objc_msgSend(v18, "setUserInfo:");
  }
  if ([(PDDPEEUserInfo *)self privilegesCount])
  {
    [v18 clearPrivileges];
    unint64_t v4 = [(PDDPEEUserInfo *)self privilegesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(PDDPEEUserInfo *)self privilegesAtIndex:i];
        [v18 addPrivileges:v7];
      }
    }
  }
  if ([(PDDPEEUserInfo *)self rolesCount])
  {
    [v18 clearRoles];
    unint64_t v8 = [(PDDPEEUserInfo *)self rolesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        v11 = [(PDDPEEUserInfo *)self rolesAtIndex:j];
        [v18 addRoles:v11];
      }
    }
  }
  if ([(PDDPEEUserInfo *)self locationsCount])
  {
    [v18 clearLocations];
    unint64_t v12 = [(PDDPEEUserInfo *)self locationsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        id v15 = [(PDDPEEUserInfo *)self locationsAtIndex:k];
        [v18 addLocations:v15];
      }
    }
  }
  id v16 = v18;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v18[57] = self->_isEduUser;
    v18[60] |= 2u;
  }
  if (self->_organizationId)
  {
    objc_msgSend(v18, "setOrganizationId:");
    id v16 = v18;
  }
  if (self->_organizationName)
  {
    objc_msgSend(v18, "setOrganizationName:");
    id v16 = v18;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v16[59] = self->_organizationProgressTrackingAllowed;
    v16[60] |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_23:
      if ((has & 1) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_23;
  }
  v16[58] = self->_organizationFacetimeMessagesEnabled;
  v16[60] |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_24:
    v16[56] = self->_analyticsOptedIn;
    v16[60] |= 1u;
  }
LABEL_25:
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PDDPUserInfo *)self->_userInfo copyWithZone:a3];
  objc_super v7 = (void *)v5[6];
  v5[6] = v6;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  unint64_t v8 = self->_privileges;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v40 + 1) + 8 * i) copyWithZone:a3];
        [v5 addPrivileges:v13];
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v10);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v14 = self->_roles;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v16; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v37 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [*(id *)(*((void *)&v36 + 1) + 8 * (void)j) copyWithZone:a3];
        [v5 addRoles:v19];
      }
      id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v16);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v20 = self->_locations;
  id v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v22; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * (void)k), "copyWithZone:", a3, (void)v32);
        [v5 addLocations:v25];
      }
      id v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v22);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v5 + 57) = self->_isEduUser;
    *((unsigned char *)v5 + 60) |= 2u;
  }
  id v26 = -[NSString copyWithZone:](self->_organizationId, "copyWithZone:", a3, (void)v32);
  long long v27 = (void *)v5[2];
  v5[2] = v26;

  id v28 = [(NSString *)self->_organizationName copyWithZone:a3];
  long long v29 = (void *)v5[3];
  v5[3] = v28;

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_26;
    }
LABEL_30:
    *((unsigned char *)v5 + 58) = self->_organizationFacetimeMessagesEnabled;
    *((unsigned char *)v5 + 60) |= 4u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return v5;
    }
    goto LABEL_27;
  }
  *((unsigned char *)v5 + 59) = self->_organizationProgressTrackingAllowed;
  *((unsigned char *)v5 + 60) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_30;
  }
LABEL_26:
  if (has)
  {
LABEL_27:
    *((unsigned char *)v5 + 56) = self->_analyticsOptedIn;
    *((unsigned char *)v5 + 60) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  userInfo = self->_userInfo;
  if ((unint64_t)userInfo | *((void *)v4 + 6))
  {
    if (!-[PDDPUserInfo isEqual:](userInfo, "isEqual:")) {
      goto LABEL_40;
    }
  }
  privileges = self->_privileges;
  if ((unint64_t)privileges | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](privileges, "isEqual:")) {
      goto LABEL_40;
    }
  }
  roles = self->_roles;
  if ((unint64_t)roles | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](roles, "isEqual:")) {
      goto LABEL_40;
    }
  }
  locations = self->_locations;
  if ((unint64_t)locations | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](locations, "isEqual:")) {
      goto LABEL_40;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0) {
      goto LABEL_40;
    }
    if (self->_isEduUser)
    {
      if (!*((unsigned char *)v4 + 57)) {
        goto LABEL_40;
      }
    }
    else if (*((unsigned char *)v4 + 57))
    {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_40;
  }
  organizationId = self->_organizationId;
  if ((unint64_t)organizationId | *((void *)v4 + 2)
    && !-[NSString isEqual:](organizationId, "isEqual:"))
  {
    goto LABEL_40;
  }
  organizationName = self->_organizationName;
  if ((unint64_t)organizationName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](organizationName, "isEqual:")) {
      goto LABEL_40;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0) {
      goto LABEL_40;
    }
    if (self->_organizationProgressTrackingAllowed)
    {
      if (!*((unsigned char *)v4 + 59)) {
        goto LABEL_40;
      }
    }
    else if (*((unsigned char *)v4 + 59))
    {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0) {
      goto LABEL_40;
    }
    if (self->_organizationFacetimeMessagesEnabled)
    {
      if (!*((unsigned char *)v4 + 58)) {
        goto LABEL_40;
      }
    }
    else if (*((unsigned char *)v4 + 58))
    {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_40;
  }
  BOOL v11 = (*((unsigned char *)v4 + 60) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 60))
    {
      if (self->_analyticsOptedIn)
      {
        if (!*((unsigned char *)v4 + 56)) {
          goto LABEL_40;
        }
      }
      else if (*((unsigned char *)v4 + 56))
      {
        goto LABEL_40;
      }
      BOOL v11 = 1;
      goto LABEL_41;
    }
LABEL_40:
    BOOL v11 = 0;
  }
LABEL_41:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDDPUserInfo *)self->_userInfo hash];
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_privileges hash];
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_roles hash];
  unint64_t v6 = (unint64_t)[(NSMutableArray *)self->_locations hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_isEduUser;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_organizationId hash];
  NSUInteger v9 = [(NSString *)self->_organizationName hash];
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v11 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  uint64_t v10 = 2654435761 * self->_organizationProgressTrackingAllowed;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v11 = 2654435761 * self->_organizationFacetimeMessagesEnabled;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v12 = 2654435761 * self->_analyticsOptedIn;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  userInfo = self->_userInfo;
  uint64_t v6 = *((void *)v4 + 6);
  if (userInfo)
  {
    if (v6) {
      -[PDDPUserInfo mergeFrom:](userInfo, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PDDPEEUserInfo setUserInfo:](self, "setUserInfo:");
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = *((id *)v4 + 4);
  id v8 = [v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        [(PDDPEEUserInfo *)self addPrivileges:*(void *)(*((void *)&v31 + 1) + 8 * i)];
      }
      id v9 = [v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v9);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = *((id *)v4 + 5);
  id v13 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        [(PDDPEEUserInfo *)self addRoles:*(void *)(*((void *)&v27 + 1) + 8 * (void)j)];
      }
      id v14 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v14);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v17 = *((id *)v4 + 1);
  id v18 = [v17 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t k = 0; k != v19; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        -[PDDPEEUserInfo addLocations:](self, "addLocations:", *(void *)(*((void *)&v23 + 1) + 8 * (void)k), (void)v23);
      }
      id v19 = [v17 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v19);
  }

  if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    self->_isEduUser = *((unsigned char *)v4 + 57);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 2)) {
    -[PDDPEEUserInfo setOrganizationId:](self, "setOrganizationId:");
  }
  if (*((void *)v4 + 3)) {
    -[PDDPEEUserInfo setOrganizationName:](self, "setOrganizationName:");
  }
  char v22 = *((unsigned char *)v4 + 60);
  if ((v22 & 8) == 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0) {
      goto LABEL_35;
    }
LABEL_39:
    self->_organizationFacetimeMessagesEnabled = *((unsigned char *)v4 + 58);
    *(unsigned char *)&self->_has |= 4u;
    if ((*((unsigned char *)v4 + 60) & 1) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  self->_organizationProgressTrackingAllowed = *((unsigned char *)v4 + 59);
  *(unsigned char *)&self->_has |= 8u;
  char v22 = *((unsigned char *)v4 + 60);
  if ((v22 & 4) != 0) {
    goto LABEL_39;
  }
LABEL_35:
  if (v22)
  {
LABEL_36:
    self->_analyticsOptedIn = *((unsigned char *)v4 + 56);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_37:
}

- (PDDPUserInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSMutableArray)privileges
{
  return self->_privileges;
}

- (void)setPrivileges:(id)a3
{
}

- (NSMutableArray)roles
{
  return self->_roles;
}

- (void)setRoles:(id)a3
{
}

- (NSMutableArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
}

- (BOOL)isEduUser
{
  return self->_isEduUser;
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

- (BOOL)organizationProgressTrackingAllowed
{
  return self->_organizationProgressTrackingAllowed;
}

- (BOOL)organizationFacetimeMessagesEnabled
{
  return self->_organizationFacetimeMessagesEnabled;
}

- (BOOL)analyticsOptedIn
{
  return self->_analyticsOptedIn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_roles, 0);
  objc_storeStrong((id *)&self->_privileges, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_organizationId, 0);

  objc_storeStrong((id *)&self->_locations, 0);
}

@end