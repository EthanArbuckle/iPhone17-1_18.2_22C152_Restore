@interface PDDPPerson
+ (Class)personLinksType;
+ (Class)roleLocationsType;
- (BOOL)hasAccountStatus;
- (BOOL)hasAppleId;
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasEmailAddress;
- (BOOL)hasEntityMeta;
- (BOOL)hasFamilyName;
- (BOOL)hasGivenName;
- (BOOL)hasGrade;
- (BOOL)hasICloudUserId;
- (BOOL)hasIsFederatedAccount;
- (BOOL)hasIsProgressTrackingAllowed;
- (BOOL)hasIsRosterSearchAllowed;
- (BOOL)hasMiddleName;
- (BOOL)hasOrgId;
- (BOOL)hasPasscodeType;
- (BOOL)hasPersonId;
- (BOOL)hasPersonNumber;
- (BOOL)hasPhoneticFamilyName;
- (BOOL)hasPhoneticGivenName;
- (BOOL)hasPhoneticMiddleName;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFederatedAccount;
- (BOOL)isProgressTrackingAllowed;
- (BOOL)isRosterSearchAllowed;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)personLinks;
- (NSMutableArray)roleLocations;
- (NSString)appleId;
- (NSString)emailAddress;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)grade;
- (NSString)iCloudUserId;
- (NSString)middleName;
- (NSString)orgId;
- (NSString)personId;
- (NSString)personNumber;
- (NSString)phoneticFamilyName;
- (NSString)phoneticGivenName;
- (NSString)phoneticMiddleName;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (PDDPEntityMeta)entityMeta;
- (id)accountStatusAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)personLinksAtIndex:(unint64_t)a3;
- (id)roleLocationsAtIndex:(unint64_t)a3;
- (int)StringAsAccountStatus:(id)a3;
- (int)accountStatus;
- (int)passcodeType;
- (unint64_t)hash;
- (unint64_t)personLinksCount;
- (unint64_t)roleLocationsCount;
- (void)addPersonLinks:(id)a3;
- (void)addRoleLocations:(id)a3;
- (void)clearPersonLinks;
- (void)clearRoleLocations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountStatus:(int)a3;
- (void)setAppleId:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setEmailAddress:(id)a3;
- (void)setEntityMeta:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setGrade:(id)a3;
- (void)setHasAccountStatus:(BOOL)a3;
- (void)setHasIsFederatedAccount:(BOOL)a3;
- (void)setHasIsProgressTrackingAllowed:(BOOL)a3;
- (void)setHasIsRosterSearchAllowed:(BOOL)a3;
- (void)setHasPasscodeType:(BOOL)a3;
- (void)setICloudUserId:(id)a3;
- (void)setIsFederatedAccount:(BOOL)a3;
- (void)setIsProgressTrackingAllowed:(BOOL)a3;
- (void)setIsRosterSearchAllowed:(BOOL)a3;
- (void)setMiddleName:(id)a3;
- (void)setOrgId:(id)a3;
- (void)setPasscodeType:(int)a3;
- (void)setPersonId:(id)a3;
- (void)setPersonLinks:(id)a3;
- (void)setPersonNumber:(id)a3;
- (void)setPhoneticFamilyName:(id)a3;
- (void)setPhoneticGivenName:(id)a3;
- (void)setPhoneticMiddleName:(id)a3;
- (void)setRoleLocations:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPPerson

- (BOOL)hasPersonId
{
  return self->_personId != 0;
}

- (BOOL)hasAppleId
{
  return self->_appleId != 0;
}

- (BOOL)hasICloudUserId
{
  return self->_iCloudUserId != 0;
}

- (BOOL)hasOrgId
{
  return self->_orgId != 0;
}

- (BOOL)hasGivenName
{
  return self->_givenName != 0;
}

- (BOOL)hasMiddleName
{
  return self->_middleName != 0;
}

- (BOOL)hasFamilyName
{
  return self->_familyName != 0;
}

- (BOOL)hasPhoneticGivenName
{
  return self->_phoneticGivenName != 0;
}

- (BOOL)hasPhoneticMiddleName
{
  return self->_phoneticMiddleName != 0;
}

- (BOOL)hasPhoneticFamilyName
{
  return self->_phoneticFamilyName != 0;
}

- (void)setPasscodeType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_passcodeType = a3;
}

- (void)setHasPasscodeType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPasscodeType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsProgressTrackingAllowed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isProgressTrackingAllowed = a3;
}

- (void)setHasIsProgressTrackingAllowed:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsProgressTrackingAllowed
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsFederatedAccount:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isFederatedAccount = a3;
}

- (void)setHasIsFederatedAccount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsFederatedAccount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (BOOL)hasDateLastModified
{
  return self->_dateLastModified != 0;
}

- (void)clearPersonLinks
{
}

- (void)addPersonLinks:(id)a3
{
  id v4 = a3;
  personLinks = self->_personLinks;
  id v8 = v4;
  if (!personLinks)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_personLinks;
    self->_personLinks = v6;

    id v4 = v8;
    personLinks = self->_personLinks;
  }
  [(NSMutableArray *)personLinks addObject:v4];
}

- (unint64_t)personLinksCount
{
  return (unint64_t)[(NSMutableArray *)self->_personLinks count];
}

- (id)personLinksAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_personLinks objectAtIndex:a3];
}

+ (Class)personLinksType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasEmailAddress
{
  return self->_emailAddress != 0;
}

- (BOOL)hasGrade
{
  return self->_grade != 0;
}

- (void)clearRoleLocations
{
}

- (void)addRoleLocations:(id)a3
{
  id v4 = a3;
  roleLocations = self->_roleLocations;
  id v8 = v4;
  if (!roleLocations)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_roleLocations;
    self->_roleLocations = v6;

    id v4 = v8;
    roleLocations = self->_roleLocations;
  }
  [(NSMutableArray *)roleLocations addObject:v4];
}

- (unint64_t)roleLocationsCount
{
  return (unint64_t)[(NSMutableArray *)self->_roleLocations count];
}

- (id)roleLocationsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_roleLocations objectAtIndex:a3];
}

+ (Class)roleLocationsType
{
  return (Class)objc_opt_class();
}

- (void)setIsRosterSearchAllowed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isRosterSearchAllowed = a3;
}

- (void)setHasIsRosterSearchAllowed:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsRosterSearchAllowed
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasEntityMeta
{
  return self->_entityMeta != 0;
}

- (int)accountStatus
{
  if (*(unsigned char *)&self->_has) {
    return self->_accountStatus;
  }
  else {
    return 0;
  }
}

- (void)setAccountStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_accountStatus = a3;
}

- (void)setHasAccountStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAccountStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)accountStatusAsString:(int)a3
{
  if (a3 >= 7)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_1001F45A0[a3];
  }

  return v3;
}

- (int)StringAsAccountStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_STATUS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NEW"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ACTIVE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ATO_LOCKED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FAILED_PASSWORD_LOCKED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"INACTIVE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TO_BE_DELETED"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasPersonNumber
{
  return self->_personNumber != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPPerson;
  id v3 = [(PDDPPerson *)&v7 description];
  int v4 = [(PDDPPerson *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  personId = self->_personId;
  if (personId) {
    [v3 setObject:personId forKey:@"person_id"];
  }
  appleId = self->_appleId;
  if (appleId) {
    [v4 setObject:appleId forKey:@"apple_id"];
  }
  iCloudUserId = self->_iCloudUserId;
  if (iCloudUserId) {
    [v4 setObject:iCloudUserId forKey:@"i_cloud_user_id"];
  }
  orgId = self->_orgId;
  if (orgId) {
    [v4 setObject:orgId forKey:@"org_id"];
  }
  givenName = self->_givenName;
  if (givenName) {
    [v4 setObject:givenName forKey:@"given_name"];
  }
  middleName = self->_middleName;
  if (middleName) {
    [v4 setObject:middleName forKey:@"middle_name"];
  }
  familyName = self->_familyName;
  if (familyName) {
    [v4 setObject:familyName forKey:@"family_name"];
  }
  phoneticGivenName = self->_phoneticGivenName;
  if (phoneticGivenName) {
    [v4 setObject:phoneticGivenName forKey:@"phonetic_given_name"];
  }
  phoneticMiddleName = self->_phoneticMiddleName;
  if (phoneticMiddleName) {
    [v4 setObject:phoneticMiddleName forKey:@"phonetic_middle_name"];
  }
  phoneticFamilyName = self->_phoneticFamilyName;
  if (phoneticFamilyName) {
    [v4 setObject:phoneticFamilyName forKey:@"phonetic_family_name"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v42 = +[NSNumber numberWithInt:self->_passcodeType];
    [v4 setObject:v42 forKey:@"passcode_type"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_23:
      if ((has & 4) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_23;
  }
  v43 = +[NSNumber numberWithBool:self->_isProgressTrackingAllowed];
  [v4 setObject:v43 forKey:@"is_progress_tracking_allowed"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_24:
    v16 = +[NSNumber numberWithBool:self->_isFederatedAccount];
    [v4 setObject:v16 forKey:@"is_federated_account"];
  }
LABEL_25:
  dateCreated = self->_dateCreated;
  if (dateCreated)
  {
    v18 = [(PDDPDate *)dateCreated dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"date_created"];
  }
  dateLastModified = self->_dateLastModified;
  if (dateLastModified)
  {
    v20 = [(PDDPDate *)dateLastModified dictionaryRepresentation];
    [v4 setObject:v20 forKey:@"date_last_modified"];
  }
  if ([(NSMutableArray *)self->_personLinks count])
  {
    id v21 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_personLinks, "count"));
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v22 = self->_personLinks;
    id v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v51;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v51 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [*(id *)(*((void *)&v50 + 1) + 8 * i) dictionaryRepresentation];
          [v21 addObject:v27];
        }
        id v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v24);
    }

    [v4 setObject:v21 forKey:@"person_links"];
  }
  emailAddress = self->_emailAddress;
  if (emailAddress) {
    [v4 setObject:emailAddress forKey:@"email_address"];
  }
  grade = self->_grade;
  if (grade) {
    [v4 setObject:grade forKey:@"grade"];
  }
  if ([(NSMutableArray *)self->_roleLocations count])
  {
    id v30 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_roleLocations, "count"));
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v31 = self->_roleLocations;
    id v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v47;
      do
      {
        for (j = 0; j != v33; j = (char *)j + 1)
        {
          if (*(void *)v47 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = [*(id *)(*((void *)&v46 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v30 addObject:v36];
        }
        id v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v33);
    }

    [v4 setObject:v30 forKey:@"role_locations"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v37 = +[NSNumber numberWithBool:self->_isRosterSearchAllowed];
    [v4 setObject:v37 forKey:@"is_roster_search_allowed"];
  }
  entityMeta = self->_entityMeta;
  if (entityMeta)
  {
    v39 = [(PDDPEntityMeta *)entityMeta dictionaryRepresentation];
    [v4 setObject:v39 forKey:@"entity_meta"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t accountStatus = self->_accountStatus;
    if (accountStatus >= 7)
    {
      v41 = +[NSString stringWithFormat:@"(unknown: %i)", self->_accountStatus];
    }
    else
    {
      v41 = off_1001F45A0[accountStatus];
    }
    [v4 setObject:v41 forKey:@"account_status"];
  }
  personNumber = self->_personNumber;
  if (personNumber) {
    [v4 setObject:personNumber forKey:@"person_number"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000DDFFC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_personId) {
    PBDataWriterWriteStringField();
  }
  if (self->_appleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_iCloudUserId) {
    PBDataWriterWriteStringField();
  }
  if (self->_orgId) {
    PBDataWriterWriteStringField();
  }
  if (self->_givenName) {
    PBDataWriterWriteStringField();
  }
  if (self->_middleName) {
    PBDataWriterWriteStringField();
  }
  if (self->_familyName) {
    PBDataWriterWriteStringField();
  }
  if (self->_phoneticGivenName) {
    PBDataWriterWriteStringField();
  }
  if (self->_phoneticMiddleName) {
    PBDataWriterWriteStringField();
  }
  if (self->_phoneticFamilyName) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_23:
      if ((has & 4) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_24:
  }
    PBDataWriterWriteBOOLField();
LABEL_25:
  if (self->_dateCreated) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dateLastModified) {
    PBDataWriterWriteSubmessage();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = self->_personLinks;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  if (self->_emailAddress) {
    PBDataWriterWriteStringField();
  }
  if (self->_grade) {
    PBDataWriterWriteStringField();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v11 = self->_roleLocations;
  v12 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      v13 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }

  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_entityMeta) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_personNumber) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v15 = v4;
  if (self->_personId)
  {
    objc_msgSend(v4, "setPersonId:");
    id v4 = v15;
  }
  if (self->_appleId)
  {
    objc_msgSend(v15, "setAppleId:");
    id v4 = v15;
  }
  if (self->_iCloudUserId)
  {
    objc_msgSend(v15, "setICloudUserId:");
    id v4 = v15;
  }
  if (self->_orgId)
  {
    objc_msgSend(v15, "setOrgId:");
    id v4 = v15;
  }
  if (self->_givenName)
  {
    objc_msgSend(v15, "setGivenName:");
    id v4 = v15;
  }
  if (self->_middleName)
  {
    objc_msgSend(v15, "setMiddleName:");
    id v4 = v15;
  }
  if (self->_familyName)
  {
    objc_msgSend(v15, "setFamilyName:");
    id v4 = v15;
  }
  if (self->_phoneticGivenName)
  {
    objc_msgSend(v15, "setPhoneticGivenName:");
    id v4 = v15;
  }
  if (self->_phoneticMiddleName)
  {
    objc_msgSend(v15, "setPhoneticMiddleName:");
    id v4 = v15;
  }
  if (self->_phoneticFamilyName)
  {
    objc_msgSend(v15, "setPhoneticFamilyName:");
    id v4 = v15;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 26) = self->_passcodeType;
    v4[172] |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_23:
      if ((has & 4) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_23;
  }
  v4[169] = self->_isProgressTrackingAllowed;
  v4[172] |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_24:
    v4[168] = self->_isFederatedAccount;
    v4[172] |= 4u;
  }
LABEL_25:
  if (self->_dateCreated) {
    objc_msgSend(v15, "setDateCreated:");
  }
  if (self->_dateLastModified) {
    objc_msgSend(v15, "setDateLastModified:");
  }
  if ([(PDDPPerson *)self personLinksCount])
  {
    [v15 clearPersonLinks];
    unint64_t v6 = [(PDDPPerson *)self personLinksCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(PDDPPerson *)self personLinksAtIndex:i];
        [v15 addPersonLinks:v9];
      }
    }
  }
  if (self->_emailAddress) {
    objc_msgSend(v15, "setEmailAddress:");
  }
  if (self->_grade) {
    objc_msgSend(v15, "setGrade:");
  }
  if ([(PDDPPerson *)self roleLocationsCount])
  {
    [v15 clearRoleLocations];
    unint64_t v10 = [(PDDPPerson *)self roleLocationsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        v13 = [(PDDPPerson *)self roleLocationsAtIndex:j];
        [v15 addRoleLocations:v13];
      }
    }
  }
  uint64_t v14 = v15;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v15[170] = self->_isRosterSearchAllowed;
    v15[172] |= 0x10u;
  }
  if (self->_entityMeta)
  {
    objc_msgSend(v15, "setEntityMeta:");
    uint64_t v14 = v15;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v14 + 2) = self->_accountStatus;
    v14[172] |= 1u;
  }
  if (self->_personNumber)
  {
    objc_msgSend(v15, "setPersonNumber:");
    uint64_t v14 = v15;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_personId copyWithZone:a3];
  unint64_t v7 = (void *)v5[14];
  v5[14] = v6;

  id v8 = [(NSString *)self->_appleId copyWithZone:a3];
  uint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(NSString *)self->_iCloudUserId copyWithZone:a3];
  unint64_t v11 = (void *)v5[10];
  v5[10] = v10;

  id v12 = [(NSString *)self->_orgId copyWithZone:a3];
  v13 = (void *)v5[12];
  v5[12] = v12;

  id v14 = [(NSString *)self->_givenName copyWithZone:a3];
  v15 = (void *)v5[8];
  v5[8] = v14;

  id v16 = [(NSString *)self->_middleName copyWithZone:a3];
  long long v17 = (void *)v5[11];
  v5[11] = v16;

  id v18 = [(NSString *)self->_familyName copyWithZone:a3];
  long long v19 = (void *)v5[7];
  v5[7] = v18;

  id v20 = [(NSString *)self->_phoneticGivenName copyWithZone:a3];
  long long v21 = (void *)v5[18];
  v5[18] = v20;

  id v22 = [(NSString *)self->_phoneticMiddleName copyWithZone:a3];
  long long v23 = (void *)v5[19];
  v5[19] = v22;

  id v24 = [(NSString *)self->_phoneticFamilyName copyWithZone:a3];
  uint64_t v25 = (void *)v5[17];
  v5[17] = v24;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 26) = self->_passcodeType;
    *((unsigned char *)v5 + 172) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v5 + 169) = self->_isProgressTrackingAllowed;
  *((unsigned char *)v5 + 172) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((unsigned char *)v5 + 168) = self->_isFederatedAccount;
    *((unsigned char *)v5 + 172) |= 4u;
  }
LABEL_5:
  id v27 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  v28 = (void *)v5[3];
  v5[3] = v27;

  id v29 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  id v30 = (void *)v5[4];
  v5[4] = v29;

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v31 = self->_personLinks;
  id v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v33; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v57 != v34) {
          objc_enumerationMutation(v31);
        }
        id v36 = [*(id *)(*((void *)&v56 + 1) + 8 * i) copyWithZone:a3];
        [v5 addPersonLinks:v36];
      }
      id v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v33);
  }

  id v37 = [(NSString *)self->_emailAddress copyWithZone:a3];
  v38 = (void *)v5[5];
  v5[5] = v37;

  id v39 = [(NSString *)self->_grade copyWithZone:a3];
  v40 = (void *)v5[9];
  v5[9] = v39;

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v41 = self->_roleLocations;
  id v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v42)
  {
    id v43 = v42;
    uint64_t v44 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v43; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v53 != v44) {
          objc_enumerationMutation(v41);
        }
        id v46 = objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * (void)j), "copyWithZone:", a3, (void)v52);
        [v5 addRoleLocations:v46];
      }
      id v43 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v43);
  }

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((unsigned char *)v5 + 170) = self->_isRosterSearchAllowed;
    *((unsigned char *)v5 + 172) |= 0x10u;
  }
  id v47 = -[PDDPEntityMeta copyWithZone:](self->_entityMeta, "copyWithZone:", a3, (void)v52);
  long long v48 = (void *)v5[6];
  v5[6] = v47;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 2) = self->_accountStatus;
    *((unsigned char *)v5 + 172) |= 1u;
  }
  id v49 = [(NSString *)self->_personNumber copyWithZone:a3];
  long long v50 = (void *)v5[16];
  v5[16] = v49;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_73;
  }
  personId = self->_personId;
  if ((unint64_t)personId | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](personId, "isEqual:")) {
      goto LABEL_73;
    }
  }
  appleId = self->_appleId;
  if ((unint64_t)appleId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](appleId, "isEqual:")) {
      goto LABEL_73;
    }
  }
  iCloudUserId = self->_iCloudUserId;
  if ((unint64_t)iCloudUserId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](iCloudUserId, "isEqual:")) {
      goto LABEL_73;
    }
  }
  orgId = self->_orgId;
  if ((unint64_t)orgId | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](orgId, "isEqual:")) {
      goto LABEL_73;
    }
  }
  givenName = self->_givenName;
  if ((unint64_t)givenName | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](givenName, "isEqual:")) {
      goto LABEL_73;
    }
  }
  middleName = self->_middleName;
  if ((unint64_t)middleName | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](middleName, "isEqual:")) {
      goto LABEL_73;
    }
  }
  familyName = self->_familyName;
  if ((unint64_t)familyName | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](familyName, "isEqual:")) {
      goto LABEL_73;
    }
  }
  phoneticGivenName = self->_phoneticGivenName;
  if ((unint64_t)phoneticGivenName | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](phoneticGivenName, "isEqual:")) {
      goto LABEL_73;
    }
  }
  phoneticMiddleName = self->_phoneticMiddleName;
  if ((unint64_t)phoneticMiddleName | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](phoneticMiddleName, "isEqual:")) {
      goto LABEL_73;
    }
  }
  phoneticFamilyName = self->_phoneticFamilyName;
  if ((unint64_t)phoneticFamilyName | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](phoneticFamilyName, "isEqual:")) {
      goto LABEL_73;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 172) & 2) == 0 || self->_passcodeType != *((_DWORD *)v4 + 26)) {
      goto LABEL_73;
    }
  }
  else if ((*((unsigned char *)v4 + 172) & 2) != 0)
  {
    goto LABEL_73;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 172) & 8) == 0) {
      goto LABEL_73;
    }
    if (self->_isProgressTrackingAllowed)
    {
      if (!*((unsigned char *)v4 + 169)) {
        goto LABEL_73;
      }
    }
    else if (*((unsigned char *)v4 + 169))
    {
      goto LABEL_73;
    }
  }
  else if ((*((unsigned char *)v4 + 172) & 8) != 0)
  {
    goto LABEL_73;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 172) & 4) == 0) {
      goto LABEL_73;
    }
    if (self->_isFederatedAccount)
    {
      if (!*((unsigned char *)v4 + 168)) {
        goto LABEL_73;
      }
    }
    else if (*((unsigned char *)v4 + 168))
    {
      goto LABEL_73;
    }
  }
  else if ((*((unsigned char *)v4 + 172) & 4) != 0)
  {
    goto LABEL_73;
  }
  dateCreated = self->_dateCreated;
  if ((unint64_t)dateCreated | *((void *)v4 + 3) && !-[PDDPDate isEqual:](dateCreated, "isEqual:")) {
    goto LABEL_73;
  }
  dateLastModified = self->_dateLastModified;
  if ((unint64_t)dateLastModified | *((void *)v4 + 4))
  {
    if (!-[PDDPDate isEqual:](dateLastModified, "isEqual:")) {
      goto LABEL_73;
    }
  }
  personLinks = self->_personLinks;
  if ((unint64_t)personLinks | *((void *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](personLinks, "isEqual:")) {
      goto LABEL_73;
    }
  }
  emailAddress = self->_emailAddress;
  if ((unint64_t)emailAddress | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](emailAddress, "isEqual:")) {
      goto LABEL_73;
    }
  }
  grade = self->_grade;
  if ((unint64_t)grade | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](grade, "isEqual:")) {
      goto LABEL_73;
    }
  }
  roleLocations = self->_roleLocations;
  if ((unint64_t)roleLocations | *((void *)v4 + 20))
  {
    if (!-[NSMutableArray isEqual:](roleLocations, "isEqual:")) {
      goto LABEL_73;
    }
  }
  char has = (char)self->_has;
  char v22 = *((unsigned char *)v4 + 172);
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 172) & 0x10) == 0) {
      goto LABEL_73;
    }
    if (self->_isRosterSearchAllowed)
    {
      if (!*((unsigned char *)v4 + 170)) {
        goto LABEL_73;
      }
    }
    else if (*((unsigned char *)v4 + 170))
    {
      goto LABEL_73;
    }
  }
  else if ((*((unsigned char *)v4 + 172) & 0x10) != 0)
  {
    goto LABEL_73;
  }
  entityMeta = self->_entityMeta;
  if (!((unint64_t)entityMeta | *((void *)v4 + 6))) {
    goto LABEL_66;
  }
  if (!-[PDDPEntityMeta isEqual:](entityMeta, "isEqual:"))
  {
LABEL_73:
    unsigned __int8 v25 = 0;
    goto LABEL_74;
  }
  char has = (char)self->_has;
  char v22 = *((unsigned char *)v4 + 172);
LABEL_66:
  if (has)
  {
    if ((v22 & 1) == 0 || self->_accountStatus != *((_DWORD *)v4 + 2)) {
      goto LABEL_73;
    }
  }
  else if (v22)
  {
    goto LABEL_73;
  }
  personNumber = self->_personNumber;
  if ((unint64_t)personNumber | *((void *)v4 + 16)) {
    unsigned __int8 v25 = -[NSString isEqual:](personNumber, "isEqual:");
  }
  else {
    unsigned __int8 v25 = 1;
  }
LABEL_74:

  return v25;
}

- (unint64_t)hash
{
  NSUInteger v25 = [(NSString *)self->_personId hash];
  NSUInteger v24 = [(NSString *)self->_appleId hash];
  NSUInteger v23 = [(NSString *)self->_iCloudUserId hash];
  NSUInteger v22 = [(NSString *)self->_orgId hash];
  NSUInteger v21 = [(NSString *)self->_givenName hash];
  NSUInteger v20 = [(NSString *)self->_middleName hash];
  NSUInteger v19 = [(NSString *)self->_familyName hash];
  NSUInteger v18 = [(NSString *)self->_phoneticGivenName hash];
  NSUInteger v17 = [(NSString *)self->_phoneticMiddleName hash];
  NSUInteger v16 = [(NSString *)self->_phoneticFamilyName hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v15 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v14 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v15 = 2654435761 * self->_passcodeType;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v14 = 2654435761 * self->_isProgressTrackingAllowed;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v13 = 2654435761 * self->_isFederatedAccount;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v13 = 0;
LABEL_8:
  unint64_t v3 = [(PDDPDate *)self->_dateCreated hash];
  unint64_t v4 = [(PDDPDate *)self->_dateLastModified hash];
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_personLinks hash];
  NSUInteger v6 = [(NSString *)self->_emailAddress hash];
  NSUInteger v7 = [(NSString *)self->_grade hash];
  unint64_t v8 = (unint64_t)[(NSMutableArray *)self->_roleLocations hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v9 = 2654435761 * self->_isRosterSearchAllowed;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = [(PDDPEntityMeta *)self->_entityMeta hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = 2654435761 * self->_accountStatus;
  }
  else {
    uint64_t v11 = 0;
  }
  return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSString *)self->_personNumber hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 14)) {
    -[PDDPPerson setPersonId:](self, "setPersonId:");
  }
  if (*((void *)v4 + 2)) {
    -[PDDPPerson setAppleId:](self, "setAppleId:");
  }
  if (*((void *)v4 + 10)) {
    -[PDDPPerson setICloudUserId:](self, "setICloudUserId:");
  }
  if (*((void *)v4 + 12)) {
    -[PDDPPerson setOrgId:](self, "setOrgId:");
  }
  if (*((void *)v4 + 8)) {
    -[PDDPPerson setGivenName:](self, "setGivenName:");
  }
  if (*((void *)v4 + 11)) {
    -[PDDPPerson setMiddleName:](self, "setMiddleName:");
  }
  if (*((void *)v4 + 7)) {
    -[PDDPPerson setFamilyName:](self, "setFamilyName:");
  }
  if (*((void *)v4 + 18)) {
    -[PDDPPerson setPhoneticGivenName:](self, "setPhoneticGivenName:");
  }
  if (*((void *)v4 + 19)) {
    -[PDDPPerson setPhoneticMiddleName:](self, "setPhoneticMiddleName:");
  }
  if (*((void *)v4 + 17)) {
    -[PDDPPerson setPhoneticFamilyName:](self, "setPhoneticFamilyName:");
  }
  char v5 = *((unsigned char *)v4 + 172);
  if ((v5 & 2) != 0)
  {
    self->_passcodeType = *((_DWORD *)v4 + 26);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 172);
    if ((v5 & 8) == 0)
    {
LABEL_23:
      if ((v5 & 4) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 172) & 8) == 0)
  {
    goto LABEL_23;
  }
  self->_isProgressTrackingAllowed = *((unsigned char *)v4 + 169);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 172) & 4) != 0)
  {
LABEL_24:
    self->_isFederatedAccount = *((unsigned char *)v4 + 168);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_25:
  dateCreated = self->_dateCreated;
  uint64_t v7 = *((void *)v4 + 3);
  if (dateCreated)
  {
    if (v7) {
      -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[PDDPPerson setDateCreated:](self, "setDateCreated:");
  }
  dateLastModified = self->_dateLastModified;
  uint64_t v9 = *((void *)v4 + 4);
  if (dateLastModified)
  {
    if (v9) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[PDDPPerson setDateLastModified:](self, "setDateLastModified:");
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = *((id *)v4 + 15);
  id v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        [(PDDPPerson *)self addPersonLinks:*(void *)(*((void *)&v26 + 1) + 8 * i)];
      }
      id v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 5)) {
    -[PDDPPerson setEmailAddress:](self, "setEmailAddress:");
  }
  if (*((void *)v4 + 9)) {
    -[PDDPPerson setGrade:](self, "setGrade:");
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v15 = *((id *)v4 + 20);
  id v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v17; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        -[PDDPPerson addRoleLocations:](self, "addRoleLocations:", *(void *)(*((void *)&v22 + 1) + 8 * (void)j), (void)v22);
      }
      id v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }

  if ((*((unsigned char *)v4 + 172) & 0x10) != 0)
  {
    self->_isRosterSearchAllowed = *((unsigned char *)v4 + 170);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  entityMeta = self->_entityMeta;
  uint64_t v21 = *((void *)v4 + 6);
  if (entityMeta)
  {
    if (v21) {
      -[PDDPEntityMeta mergeFrom:](entityMeta, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[PDDPPerson setEntityMeta:](self, "setEntityMeta:");
  }
  if (*((unsigned char *)v4 + 172))
  {
    self->_uint64_t accountStatus = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 16)) {
    -[PDDPPerson setPersonNumber:](self, "setPersonNumber:");
  }
}

- (NSString)personId
{
  return self->_personId;
}

- (void)setPersonId:(id)a3
{
}

- (NSString)appleId
{
  return self->_appleId;
}

- (void)setAppleId:(id)a3
{
}

- (NSString)iCloudUserId
{
  return self->_iCloudUserId;
}

- (void)setICloudUserId:(id)a3
{
}

- (NSString)orgId
{
  return self->_orgId;
}

- (void)setOrgId:(id)a3
{
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setMiddleName:(id)a3
{
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
}

- (NSString)phoneticGivenName
{
  return self->_phoneticGivenName;
}

- (void)setPhoneticGivenName:(id)a3
{
}

- (NSString)phoneticMiddleName
{
  return self->_phoneticMiddleName;
}

- (void)setPhoneticMiddleName:(id)a3
{
}

- (NSString)phoneticFamilyName
{
  return self->_phoneticFamilyName;
}

- (void)setPhoneticFamilyName:(id)a3
{
}

- (int)passcodeType
{
  return self->_passcodeType;
}

- (BOOL)isProgressTrackingAllowed
{
  return self->_isProgressTrackingAllowed;
}

- (BOOL)isFederatedAccount
{
  return self->_isFederatedAccount;
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

- (NSMutableArray)personLinks
{
  return self->_personLinks;
}

- (void)setPersonLinks:(id)a3
{
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
}

- (NSString)grade
{
  return self->_grade;
}

- (void)setGrade:(id)a3
{
}

- (NSMutableArray)roleLocations
{
  return self->_roleLocations;
}

- (void)setRoleLocations:(id)a3
{
}

- (BOOL)isRosterSearchAllowed
{
  return self->_isRosterSearchAllowed;
}

- (PDDPEntityMeta)entityMeta
{
  return self->_entityMeta;
}

- (void)setEntityMeta:(id)a3
{
}

- (NSString)personNumber
{
  return self->_personNumber;
}

- (void)setPersonNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roleLocations, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleName, 0);
  objc_storeStrong((id *)&self->_phoneticGivenName, 0);
  objc_storeStrong((id *)&self->_phoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_personNumber, 0);
  objc_storeStrong((id *)&self->_personLinks, 0);
  objc_storeStrong((id *)&self->_personId, 0);
  objc_storeStrong((id *)&self->_orgId, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_iCloudUserId, 0);
  objc_storeStrong((id *)&self->_grade, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_entityMeta, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);

  objc_storeStrong((id *)&self->_appleId, 0);
}

@end