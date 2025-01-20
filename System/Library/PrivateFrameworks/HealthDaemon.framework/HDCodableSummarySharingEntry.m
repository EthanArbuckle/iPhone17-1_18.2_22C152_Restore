@interface HDCodableSummarySharingEntry
+ (Class)allContactIdentifiersType;
+ (Class)authorizationCategoriesType;
+ (Class)sharingAuthorizationsType;
- (BOOL)hasCloudKitIdentifier;
- (BOOL)hasDateAccepted;
- (BOOL)hasDateInvited;
- (BOOL)hasDateModified;
- (BOOL)hasDirection;
- (BOOL)hasFirstName;
- (BOOL)hasInvitationUUID;
- (BOOL)hasLastName;
- (BOOL)hasNotificationStatus;
- (BOOL)hasOwnerParticipant;
- (BOOL)hasPrimaryContactIdentifier;
- (BOOL)hasSharingSetupMetadata;
- (BOOL)hasStatus;
- (BOOL)hasType;
- (BOOL)hasUserWheelchairMode;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualFirstName:(id)a3 lastName:(id)a4;
- (BOOL)isEquivalent:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSharingSetupMetadata)sharingSetupMetadata;
- (HDCodableSummarySharingEntry)initWithUUID:(id)a3 invitationUUID:(id)a4 cloudKitIdentifier:(id)a5 primaryContactIdentifier:(id)a6 allContactIdentifiers:(id)a7 firstName:(id)a8 lastName:(id)a9 sharingAuthorizations:(id)a10 userWheelchairMode:(int64_t)a11 type:(int64_t)a12 direction:(unint64_t)a13 status:(int64_t)a14 notificationStatus:(int64_t)a15 dateModified:(id)a16 dateInvited:(id)a17 dateAccepted:(id)a18 setupMetadata:(id)a19 ownerParticipant:(id)a20;
- (NSData)ownerParticipant;
- (NSMutableArray)allContactIdentifiers;
- (NSMutableArray)authorizationCategories;
- (NSMutableArray)sharingAuthorizations;
- (NSString)cloudKitIdentifier;
- (NSString)firstName;
- (NSString)invitationUUID;
- (NSString)lastName;
- (NSString)primaryContactIdentifier;
- (NSString)uuid;
- (double)dateAccepted;
- (double)dateInvited;
- (double)dateModified;
- (id)allContactIdentifiersAtIndex:(unint64_t)a3;
- (id)authorizationCategoriesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)directionAsString:(int)a3;
- (id)notificationStatusAsString:(int)a3;
- (id)shareOwnerParticipant;
- (id)sharingAuthorizationsAtIndex:(unint64_t)a3;
- (id)sharingEntry;
- (id)sharingRecipientIdentifier;
- (id)statusAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (id)userWheelchairModeAsString:(int)a3;
- (int)StringAsDirection:(id)a3;
- (int)StringAsNotificationStatus:(id)a3;
- (int)StringAsStatus:(id)a3;
- (int)StringAsType:(id)a3;
- (int)StringAsUserWheelchairMode:(id)a3;
- (int)direction;
- (int)notificationStatus;
- (int)status;
- (int)type;
- (int)userWheelchairMode;
- (unint64_t)allContactIdentifiersCount;
- (unint64_t)authorizationCategoriesCount;
- (unint64_t)hash;
- (unint64_t)sharingAuthorizationsCount;
- (void)addAllContactIdentifiers:(id)a3;
- (void)addAuthorizationCategories:(id)a3;
- (void)addSharingAuthorizations:(id)a3;
- (void)clearAllContactIdentifiers;
- (void)clearAuthorizationCategories;
- (void)clearSharingAuthorizations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllContactIdentifiers:(id)a3;
- (void)setAuthorizationCategories:(id)a3;
- (void)setCloudKitIdentifier:(id)a3;
- (void)setDateAccepted:(double)a3;
- (void)setDateInvited:(double)a3;
- (void)setDateModified:(double)a3;
- (void)setDirection:(int)a3;
- (void)setFirstName:(id)a3;
- (void)setHasDateAccepted:(BOOL)a3;
- (void)setHasDateInvited:(BOOL)a3;
- (void)setHasDateModified:(BOOL)a3;
- (void)setHasDirection:(BOOL)a3;
- (void)setHasNotificationStatus:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasUserWheelchairMode:(BOOL)a3;
- (void)setInvitationUUID:(id)a3;
- (void)setLastName:(id)a3;
- (void)setNotificationStatus:(int)a3;
- (void)setOwnerParticipant:(id)a3;
- (void)setPrimaryContactIdentifier:(id)a3;
- (void)setSharingAuthorizations:(id)a3;
- (void)setSharingSetupMetadata:(id)a3;
- (void)setStatus:(int)a3;
- (void)setType:(int)a3;
- (void)setUserWheelchairMode:(int)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableSummarySharingEntry

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasPrimaryContactIdentifier
{
  return self->_primaryContactIdentifier != 0;
}

- (void)clearAllContactIdentifiers
{
}

- (void)addAllContactIdentifiers:(id)a3
{
  id v4 = a3;
  allContactIdentifiers = self->_allContactIdentifiers;
  id v8 = v4;
  if (!allContactIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_allContactIdentifiers;
    self->_allContactIdentifiers = v6;

    id v4 = v8;
    allContactIdentifiers = self->_allContactIdentifiers;
  }
  [(NSMutableArray *)allContactIdentifiers addObject:v4];
}

- (unint64_t)allContactIdentifiersCount
{
  return [(NSMutableArray *)self->_allContactIdentifiers count];
}

- (id)allContactIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_allContactIdentifiers objectAtIndex:a3];
}

+ (Class)allContactIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasFirstName
{
  return self->_firstName != 0;
}

- (BOOL)hasLastName
{
  return self->_lastName != 0;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"Request";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = @"Invite";
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Invite"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Request"];
  }

  return v4;
}

- (int)direction
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_direction;
  }
  else {
    return 0;
  }
}

- (void)setDirection:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_direction = a3;
}

- (void)setHasDirection:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDirection
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)directionAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"Incoming";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"Outgoing";
  }
  return v4;
}

- (int)StringAsDirection:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Outgoing"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Incoming"];
  }

  return v4;
}

- (int)status
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E62FDC88[a3];
  }

  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Pending"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Accepted"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Declined"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Rescinded"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Revoked"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasSharingSetupMetadata
{
  return self->_sharingSetupMetadata != 0;
}

- (void)setDateModified:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_dateModified = a3;
}

- (void)setHasDateModified:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDateModified
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)clearAuthorizationCategories
{
}

- (void)addAuthorizationCategories:(id)a3
{
  id v4 = a3;
  authorizationCategories = self->_authorizationCategories;
  id v8 = v4;
  if (!authorizationCategories)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_authorizationCategories;
    self->_authorizationCategories = v6;

    id v4 = v8;
    authorizationCategories = self->_authorizationCategories;
  }
  [(NSMutableArray *)authorizationCategories addObject:v4];
}

- (unint64_t)authorizationCategoriesCount
{
  return [(NSMutableArray *)self->_authorizationCategories count];
}

- (id)authorizationCategoriesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_authorizationCategories objectAtIndex:a3];
}

+ (Class)authorizationCategoriesType
{
  return (Class)objc_opt_class();
}

- (void)setDateAccepted:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dateAccepted = a3;
}

- (void)setHasDateAccepted:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDateAccepted
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDateInvited:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_dateInvited = a3;
}

- (void)setHasDateInvited:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDateInvited
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasInvitationUUID
{
  return self->_invitationUUID != 0;
}

- (BOOL)hasCloudKitIdentifier
{
  return self->_cloudKitIdentifier != 0;
}

- (BOOL)hasOwnerParticipant
{
  return self->_ownerParticipant != 0;
}

- (int)notificationStatus
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_notificationStatus;
  }
  else {
    return 0;
  }
}

- (void)setNotificationStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_notificationStatus = a3;
}

- (void)setHasNotificationStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNotificationStatus
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)notificationStatusAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E62FDCB0[a3];
  }

  return v3;
}

- (int)StringAsNotificationStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Pending"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Accepted"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearSharingAuthorizations
{
}

- (void)addSharingAuthorizations:(id)a3
{
  id v4 = a3;
  sharingAuthorizations = self->_sharingAuthorizations;
  id v8 = v4;
  if (!sharingAuthorizations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_sharingAuthorizations;
    self->_sharingAuthorizations = v6;

    id v4 = v8;
    sharingAuthorizations = self->_sharingAuthorizations;
  }
  [(NSMutableArray *)sharingAuthorizations addObject:v4];
}

- (unint64_t)sharingAuthorizationsCount
{
  return [(NSMutableArray *)self->_sharingAuthorizations count];
}

- (id)sharingAuthorizationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sharingAuthorizations objectAtIndex:a3];
}

+ (Class)sharingAuthorizationsType
{
  return (Class)objc_opt_class();
}

- (int)userWheelchairMode
{
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    return self->_userWheelchairMode;
  }
  else {
    return 0;
  }
}

- (void)setUserWheelchairMode:(int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_userWheelchairMode = a3;
}

- (void)setHasUserWheelchairMode:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasUserWheelchairMode
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)userWheelchairModeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E62FDCC8[a3];
  }

  return v3;
}

- (int)StringAsUserWheelchairMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NotSet"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"No"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Yes"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableSummarySharingEntry;
  int v4 = [(HDCodableSummarySharingEntry *)&v8 description];
  v5 = [(HDCodableSummarySharingEntry *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  primaryContactIdentifier = self->_primaryContactIdentifier;
  if (primaryContactIdentifier) {
    [v4 setObject:primaryContactIdentifier forKey:@"primaryContactIdentifier"];
  }
  allContactIdentifiers = self->_allContactIdentifiers;
  if (allContactIdentifiers) {
    [v4 setObject:allContactIdentifiers forKey:@"allContactIdentifiers"];
  }
  firstName = self->_firstName;
  if (firstName) {
    [v4 setObject:firstName forKey:@"firstName"];
  }
  lastName = self->_lastName;
  if (lastName) {
    [v4 setObject:lastName forKey:@"lastName"];
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    int type = self->_type;
    if (type)
    {
      if (type == 1)
      {
        v12 = @"Request";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v12 = @"Invite";
    }
    [v4 setObject:v12 forKey:@"type"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_13:
      if ((has & 0x20) == 0) {
        goto LABEL_31;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_13;
  }
  int direction = self->_direction;
  if (direction)
  {
    if (direction == 1)
    {
      v14 = @"Incoming";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_direction);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v14 = @"Outgoing";
  }
  [v4 setObject:v14 forKey:@"direction"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_27:
    uint64_t status = self->_status;
    if (status >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_status);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E62FDC88[status];
    }
    [v4 setObject:v16 forKey:@"status"];
  }
LABEL_31:
  sharingSetupMetadata = self->_sharingSetupMetadata;
  if (sharingSetupMetadata)
  {
    v18 = [(HDCodableSharingSetupMetadata *)sharingSetupMetadata dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"sharingSetupMetadata"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v19 = [NSNumber numberWithDouble:self->_dateModified];
    [v4 setObject:v19 forKey:@"dateModified"];
  }
  authorizationCategories = self->_authorizationCategories;
  if (authorizationCategories) {
    [v4 setObject:authorizationCategories forKey:@"authorizationCategories"];
  }
  char v21 = (char)self->_has;
  if (v21)
  {
    v22 = [NSNumber numberWithDouble:self->_dateAccepted];
    [v4 setObject:v22 forKey:@"dateAccepted"];

    char v21 = (char)self->_has;
  }
  if ((v21 & 2) != 0)
  {
    v23 = [NSNumber numberWithDouble:self->_dateInvited];
    [v4 setObject:v23 forKey:@"dateInvited"];
  }
  invitationUUID = self->_invitationUUID;
  if (invitationUUID) {
    [v4 setObject:invitationUUID forKey:@"invitationUUID"];
  }
  cloudKitIdentifier = self->_cloudKitIdentifier;
  if (cloudKitIdentifier) {
    [v4 setObject:cloudKitIdentifier forKey:@"cloudKitIdentifier"];
  }
  ownerParticipant = self->_ownerParticipant;
  if (ownerParticipant) {
    [v4 setObject:ownerParticipant forKey:@"ownerParticipant"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t notificationStatus = self->_notificationStatus;
    if (notificationStatus >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_notificationStatus);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = off_1E62FDCB0[notificationStatus];
    }
    [v4 setObject:v28 forKey:@"notificationStatus"];
  }
  if ([(NSMutableArray *)self->_sharingAuthorizations count])
  {
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_sharingAuthorizations, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v30 = self->_sharingAuthorizations;
    uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v40 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = [*(id *)(*((void *)&v39 + 1) + 8 * i) dictionaryRepresentation];
          [v29 addObject:v35];
        }
        uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v32);
    }

    [v4 setObject:v29 forKey:@"sharingAuthorizations"];
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    uint64_t userWheelchairMode = self->_userWheelchairMode;
    if (userWheelchairMode >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_userWheelchairMode);
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = off_1E62FDCC8[userWheelchairMode];
    }
    [v4 setObject:v37 forKey:@"userWheelchairMode"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSummarySharingEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uuid) {
    PBDataWriterWriteStringField();
  }
  if (self->_primaryContactIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v5 = self->_allContactIdentifiers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v7);
  }

  if (self->_firstName) {
    PBDataWriterWriteStringField();
  }
  if (self->_lastName) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_18:
      if ((has & 0x20) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_19:
  }
    PBDataWriterWriteInt32Field();
LABEL_20:
  if (self->_sharingSetupMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteDoubleField();
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v11 = self->_authorizationCategories;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v13);
  }

  char v16 = (char)self->_has;
  if (v16)
  {
    PBDataWriterWriteDoubleField();
    char v16 = (char)self->_has;
  }
  if ((v16 & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_invitationUUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_cloudKitIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_ownerParticipant) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v17 = self->_sharingAuthorizations;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v19);
  }

  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v19 = a3;
  if (self->_uuid) {
    objc_msgSend(v19, "setUuid:");
  }
  if (self->_primaryContactIdentifier) {
    objc_msgSend(v19, "setPrimaryContactIdentifier:");
  }
  if ([(HDCodableSummarySharingEntry *)self allContactIdentifiersCount])
  {
    [v19 clearAllContactIdentifiers];
    unint64_t v4 = [(HDCodableSummarySharingEntry *)self allContactIdentifiersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HDCodableSummarySharingEntry *)self allContactIdentifiersAtIndex:i];
        [v19 addAllContactIdentifiers:v7];
      }
    }
  }
  if (self->_firstName) {
    objc_msgSend(v19, "setFirstName:");
  }
  uint64_t v8 = v19;
  if (self->_lastName)
  {
    objc_msgSend(v19, "setLastName:");
    uint64_t v8 = v19;
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    v8[33] = self->_type;
    *((unsigned char *)v8 + 152) |= 0x40u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_15:
      if ((has & 0x20) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_15;
  }
  v8[14] = self->_direction;
  *((unsigned char *)v8 + 152) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_16:
    v8[32] = self->_status;
    *((unsigned char *)v8 + 152) |= 0x20u;
  }
LABEL_17:
  if (self->_sharingSetupMetadata) {
    objc_msgSend(v19, "setSharingSetupMetadata:");
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)v19 + 3) = *(void *)&self->_dateModified;
    *((unsigned char *)v19 + 152) |= 4u;
  }
  if ([(HDCodableSummarySharingEntry *)self authorizationCategoriesCount])
  {
    [v19 clearAuthorizationCategories];
    unint64_t v10 = [(HDCodableSummarySharingEntry *)self authorizationCategoriesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(HDCodableSummarySharingEntry *)self authorizationCategoriesAtIndex:j];
        [v19 addAuthorizationCategories:v13];
      }
    }
  }
  char v14 = (char)self->_has;
  if (v14)
  {
    *((void *)v19 + 1) = *(void *)&self->_dateAccepted;
    *((unsigned char *)v19 + 152) |= 1u;
    char v14 = (char)self->_has;
  }
  if ((v14 & 2) != 0)
  {
    *((void *)v19 + 2) = *(void *)&self->_dateInvited;
    *((unsigned char *)v19 + 152) |= 2u;
  }
  if (self->_invitationUUID) {
    objc_msgSend(v19, "setInvitationUUID:");
  }
  if (self->_cloudKitIdentifier) {
    objc_msgSend(v19, "setCloudKitIdentifier:");
  }
  if (self->_ownerParticipant) {
    objc_msgSend(v19, "setOwnerParticipant:");
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v19 + 22) = self->_notificationStatus;
    *((unsigned char *)v19 + 152) |= 0x10u;
  }
  if ([(HDCodableSummarySharingEntry *)self sharingAuthorizationsCount])
  {
    [v19 clearSharingAuthorizations];
    unint64_t v15 = [(HDCodableSummarySharingEntry *)self sharingAuthorizationsCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t k = 0; k != v16; ++k)
      {
        uint64_t v18 = [(HDCodableSummarySharingEntry *)self sharingAuthorizationsAtIndex:k];
        [v19 addSharingAuthorizations:v18];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *((_DWORD *)v19 + 34) = self->_userWheelchairMode;
    *((unsigned char *)v19 + 152) |= 0x80u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uuid copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v6;

  uint64_t v8 = [(NSString *)self->_primaryContactIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v8;

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  unint64_t v10 = self->_allContactIdentifiers;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v52 != v13) {
          objc_enumerationMutation(v10);
        }
        unint64_t v15 = (void *)[*(id *)(*((void *)&v51 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addAllContactIdentifiers:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [(NSString *)self->_firstName copyWithZone:a3];
  v17 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v16;

  uint64_t v18 = [(NSString *)self->_lastName copyWithZone:a3];
  id v19 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v18;

  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_type;
    *(unsigned char *)(v5 + 152) |= 0x40u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_10:
      if ((has & 0x20) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 56) = self->_direction;
  *(unsigned char *)(v5 + 152) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 128) = self->_status;
    *(unsigned char *)(v5 + 152) |= 0x20u;
  }
LABEL_12:
  id v21 = [(HDCodableSharingSetupMetadata *)self->_sharingSetupMetadata copyWithZone:a3];
  long long v22 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v21;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_dateModified;
    *(unsigned char *)(v5 + 152) |= 4u;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v23 = self->_authorizationCategories;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v48 != v26) {
          objc_enumerationMutation(v23);
        }
        long long v28 = (void *)[*(id *)(*((void *)&v47 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addAuthorizationCategories:v28];
      }
      uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v25);
  }

  char v29 = (char)self->_has;
  if (v29)
  {
    *(double *)(v5 + 8) = self->_dateAccepted;
    *(unsigned char *)(v5 + 152) |= 1u;
    char v29 = (char)self->_has;
  }
  if ((v29 & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_dateInvited;
    *(unsigned char *)(v5 + 152) |= 2u;
  }
  uint64_t v30 = [(NSString *)self->_invitationUUID copyWithZone:a3];
  long long v31 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v30;

  uint64_t v32 = [(NSString *)self->_cloudKitIdentifier copyWithZone:a3];
  long long v33 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v32;

  uint64_t v34 = [(NSData *)self->_ownerParticipant copyWithZone:a3];
  v35 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v34;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_notificationStatus;
    *(unsigned char *)(v5 + 152) |= 0x10u;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v36 = self->_sharingAuthorizations;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v44;
    do
    {
      for (uint64_t k = 0; k != v38; ++k)
      {
        if (*(void *)v44 != v39) {
          objc_enumerationMutation(v36);
        }
        long long v41 = objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * k), "copyWithZone:", a3, (void)v43);
        [(id)v5 addSharingAuthorizations:v41];
      }
      uint64_t v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v38);
  }

  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_userWheelchairMode;
    *(unsigned char *)(v5 + 152) |= 0x80u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_67;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:")) {
      goto LABEL_67;
    }
  }
  primaryContactIdentifier = self->_primaryContactIdentifier;
  if ((unint64_t)primaryContactIdentifier | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](primaryContactIdentifier, "isEqual:")) {
      goto LABEL_67;
    }
  }
  allContactIdentifiers = self->_allContactIdentifiers;
  if ((unint64_t)allContactIdentifiers | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](allContactIdentifiers, "isEqual:")) {
      goto LABEL_67;
    }
  }
  firstName = self->_firstName;
  if ((unint64_t)firstName | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](firstName, "isEqual:")) {
      goto LABEL_67;
    }
  }
  lastName = self->_lastName;
  if ((unint64_t)lastName | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](lastName, "isEqual:")) {
      goto LABEL_67;
    }
  }
  char has = (char)self->_has;
  char v11 = *((unsigned char *)v4 + 152);
  if ((has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 152) & 0x40) == 0 || self->_type != *((_DWORD *)v4 + 33)) {
      goto LABEL_67;
    }
  }
  else if ((*((unsigned char *)v4 + 152) & 0x40) != 0)
  {
    goto LABEL_67;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 152) & 8) == 0 || self->_direction != *((_DWORD *)v4 + 14)) {
      goto LABEL_67;
    }
  }
  else if ((*((unsigned char *)v4 + 152) & 8) != 0)
  {
    goto LABEL_67;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 152) & 0x20) == 0 || self->_status != *((_DWORD *)v4 + 32)) {
      goto LABEL_67;
    }
  }
  else if ((*((unsigned char *)v4 + 152) & 0x20) != 0)
  {
    goto LABEL_67;
  }
  sharingSetupMetadata = self->_sharingSetupMetadata;
  if ((unint64_t)sharingSetupMetadata | *((void *)v4 + 15))
  {
    if (!-[HDCodableSharingSetupMetadata isEqual:](sharingSetupMetadata, "isEqual:")) {
      goto LABEL_67;
    }
    char has = (char)self->_has;
    char v11 = *((unsigned char *)v4 + 152);
  }
  if ((has & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_dateModified != *((double *)v4 + 3)) {
      goto LABEL_67;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_67;
  }
  authorizationCategories = self->_authorizationCategories;
  if ((unint64_t)authorizationCategories | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](authorizationCategories, "isEqual:")) {
      goto LABEL_67;
    }
    char has = (char)self->_has;
    char v11 = *((unsigned char *)v4 + 152);
  }
  if (has)
  {
    if ((v11 & 1) == 0 || self->_dateAccepted != *((double *)v4 + 1)) {
      goto LABEL_67;
    }
  }
  else if (v11)
  {
    goto LABEL_67;
  }
  if ((has & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_dateInvited != *((double *)v4 + 2)) {
      goto LABEL_67;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_67;
  }
  invitationUUID = self->_invitationUUID;
  if ((unint64_t)invitationUUID | *((void *)v4 + 9)
    && !-[NSString isEqual:](invitationUUID, "isEqual:"))
  {
    goto LABEL_67;
  }
  cloudKitIdentifier = self->_cloudKitIdentifier;
  if ((unint64_t)cloudKitIdentifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](cloudKitIdentifier, "isEqual:")) {
      goto LABEL_67;
    }
  }
  ownerParticipant = self->_ownerParticipant;
  if ((unint64_t)ownerParticipant | *((void *)v4 + 12))
  {
    if (!-[NSData isEqual:](ownerParticipant, "isEqual:")) {
      goto LABEL_67;
    }
  }
  char v17 = (char)self->_has;
  char v18 = *((unsigned char *)v4 + 152);
  if ((v17 & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 152) & 0x10) == 0 || self->_notificationStatus != *((_DWORD *)v4 + 22)) {
      goto LABEL_67;
    }
  }
  else if ((*((unsigned char *)v4 + 152) & 0x10) != 0)
  {
    goto LABEL_67;
  }
  sharingAuthorizations = self->_sharingAuthorizations;
  if ((unint64_t)sharingAuthorizations | *((void *)v4 + 14))
  {
    if (-[NSMutableArray isEqual:](sharingAuthorizations, "isEqual:"))
    {
      char v17 = (char)self->_has;
      char v18 = *((unsigned char *)v4 + 152);
      goto LABEL_62;
    }
LABEL_67:
    BOOL v20 = 0;
    goto LABEL_68;
  }
LABEL_62:
  if (v17 < 0)
  {
    if ((v18 & 0x80) == 0 || self->_userWheelchairMode != *((_DWORD *)v4 + 34)) {
      goto LABEL_67;
    }
    BOOL v20 = 1;
  }
  else
  {
    BOOL v20 = v18 >= 0;
  }
LABEL_68:

  return v20;
}

- (unint64_t)hash
{
  NSUInteger v36 = [(NSString *)self->_uuid hash];
  NSUInteger v35 = [(NSString *)self->_primaryContactIdentifier hash];
  uint64_t v34 = [(NSMutableArray *)self->_allContactIdentifiers hash];
  NSUInteger v33 = [(NSString *)self->_firstName hash];
  NSUInteger v32 = [(NSString *)self->_lastName hash];
  if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    uint64_t v31 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v30 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v31 = 2654435761 * self->_type;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v30 = 2654435761 * self->_direction;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v29 = 2654435761 * self->_status;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v29 = 0;
LABEL_8:
  unint64_t v28 = [(HDCodableSharingSetupMetadata *)self->_sharingSetupMetadata hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    double dateModified = self->_dateModified;
    double v5 = -dateModified;
    if (dateModified >= 0.0) {
      double v5 = self->_dateModified;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  uint64_t v26 = [(NSMutableArray *)self->_authorizationCategories hash];
  char has = (char)self->_has;
  if (has)
  {
    double dateAccepted = self->_dateAccepted;
    double v11 = -dateAccepted;
    if (dateAccepted >= 0.0) {
      double v11 = self->_dateAccepted;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 2) != 0)
  {
    double dateInvited = self->_dateInvited;
    double v16 = -dateInvited;
    if (dateInvited >= 0.0) {
      double v16 = self->_dateInvited;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  NSUInteger v19 = [(NSString *)self->_invitationUUID hash];
  NSUInteger v20 = [(NSString *)self->_cloudKitIdentifier hash];
  uint64_t v21 = [(NSData *)self->_ownerParticipant hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v22 = 2654435761 * self->_notificationStatus;
  }
  else {
    uint64_t v22 = 0;
  }
  uint64_t v23 = [(NSMutableArray *)self->_sharingAuthorizations hash];
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    uint64_t v24 = 2654435761 * self->_userWheelchairMode;
  }
  else {
    uint64_t v24 = 0;
  }
  return v35 ^ v36 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v3 ^ v27 ^ v9 ^ v14 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = (char *)a3;
  if (*((void *)v4 + 18)) {
    -[HDCodableSummarySharingEntry setUuid:](self, "setUuid:");
  }
  if (*((void *)v4 + 13)) {
    -[HDCodableSummarySharingEntry setPrimaryContactIdentifier:](self, "setPrimaryContactIdentifier:");
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        [(HDCodableSummarySharingEntry *)self addAllContactIdentifiers:*(void *)(*((void *)&v32 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 8)) {
    -[HDCodableSummarySharingEntry setFirstName:](self, "setFirstName:");
  }
  if (*((void *)v4 + 10)) {
    -[HDCodableSummarySharingEntry setLastName:](self, "setLastName:");
  }
  char v10 = v4[152];
  if ((v10 & 0x40) != 0)
  {
    self->_int type = *((_DWORD *)v4 + 33);
    *(unsigned char *)&self->_has |= 0x40u;
    char v10 = v4[152];
    if ((v10 & 8) == 0)
    {
LABEL_18:
      if ((v10 & 0x20) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((v4[152] & 8) == 0)
  {
    goto LABEL_18;
  }
  self->_int direction = *((_DWORD *)v4 + 14);
  *(unsigned char *)&self->_has |= 8u;
  if ((v4[152] & 0x20) != 0)
  {
LABEL_19:
    self->_uint64_t status = *((_DWORD *)v4 + 32);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_20:
  sharingSetupMetadata = self->_sharingSetupMetadata;
  uint64_t v12 = *((void *)v4 + 15);
  if (sharingSetupMetadata)
  {
    if (v12) {
      -[HDCodableSharingSetupMetadata mergeFrom:](sharingSetupMetadata, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[HDCodableSummarySharingEntry setSharingSetupMetadata:](self, "setSharingSetupMetadata:");
  }
  if ((v4[152] & 4) != 0)
  {
    self->_double dateModified = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v13 = *((id *)v4 + 5);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        [(HDCodableSummarySharingEntry *)self addAuthorizationCategories:*(void *)(*((void *)&v28 + 1) + 8 * j)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v15);
  }

  char v18 = v4[152];
  if (v18)
  {
    self->_double dateAccepted = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v18 = v4[152];
  }
  if ((v18 & 2) != 0)
  {
    self->_double dateInvited = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 9)) {
    -[HDCodableSummarySharingEntry setInvitationUUID:](self, "setInvitationUUID:");
  }
  if (*((void *)v4 + 6)) {
    -[HDCodableSummarySharingEntry setCloudKitIdentifier:](self, "setCloudKitIdentifier:");
  }
  if (*((void *)v4 + 12)) {
    -[HDCodableSummarySharingEntry setOwnerParticipant:](self, "setOwnerParticipant:");
  }
  if ((v4[152] & 0x10) != 0)
  {
    self->_uint64_t notificationStatus = *((_DWORD *)v4 + 22);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v19 = *((id *)v4 + 14);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        -[HDCodableSummarySharingEntry addSharingAuthorizations:](self, "addSharingAuthorizations:", *(void *)(*((void *)&v24 + 1) + 8 * k), (void)v24);
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v21);
  }

  if (v4[152] < 0)
  {
    self->_uint64_t userWheelchairMode = *((_DWORD *)v4 + 34);
    *(unsigned char *)&self->_has |= 0x80u;
  }
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)primaryContactIdentifier
{
  return self->_primaryContactIdentifier;
}

- (void)setPrimaryContactIdentifier:(id)a3
{
}

- (NSMutableArray)allContactIdentifiers
{
  return self->_allContactIdentifiers;
}

- (void)setAllContactIdentifiers:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (HDCodableSharingSetupMetadata)sharingSetupMetadata
{
  return self->_sharingSetupMetadata;
}

- (void)setSharingSetupMetadata:(id)a3
{
}

- (double)dateModified
{
  return self->_dateModified;
}

- (NSMutableArray)authorizationCategories
{
  return self->_authorizationCategories;
}

- (void)setAuthorizationCategories:(id)a3
{
}

- (double)dateAccepted
{
  return self->_dateAccepted;
}

- (double)dateInvited
{
  return self->_dateInvited;
}

- (NSString)invitationUUID
{
  return self->_invitationUUID;
}

- (void)setInvitationUUID:(id)a3
{
}

- (NSString)cloudKitIdentifier
{
  return self->_cloudKitIdentifier;
}

- (void)setCloudKitIdentifier:(id)a3
{
}

- (NSData)ownerParticipant
{
  return self->_ownerParticipant;
}

- (void)setOwnerParticipant:(id)a3
{
}

- (NSMutableArray)sharingAuthorizations
{
  return self->_sharingAuthorizations;
}

- (void)setSharingAuthorizations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_sharingSetupMetadata, 0);
  objc_storeStrong((id *)&self->_sharingAuthorizations, 0);
  objc_storeStrong((id *)&self->_primaryContactIdentifier, 0);
  objc_storeStrong((id *)&self->_ownerParticipant, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_invitationUUID, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_cloudKitIdentifier, 0);
  objc_storeStrong((id *)&self->_authorizationCategories, 0);

  objc_storeStrong((id *)&self->_allContactIdentifiers, 0);
}

- (HDCodableSummarySharingEntry)initWithUUID:(id)a3 invitationUUID:(id)a4 cloudKitIdentifier:(id)a5 primaryContactIdentifier:(id)a6 allContactIdentifiers:(id)a7 firstName:(id)a8 lastName:(id)a9 sharingAuthorizations:(id)a10 userWheelchairMode:(int64_t)a11 type:(int64_t)a12 direction:(unint64_t)a13 status:(int64_t)a14 notificationStatus:(int64_t)a15 dateModified:(id)a16 dateInvited:(id)a17 dateAccepted:(id)a18 setupMetadata:(id)a19 ownerParticipant:(id)a20
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v26 = a4;
  id v27 = a5;
  id v28 = a6;
  id v29 = a7;
  id v30 = a8;
  id v31 = a9;
  id v32 = a10;
  id v33 = a16;
  id v57 = a17;
  id v56 = a18;
  id v55 = a19;
  id v58 = a20;
  v60.receiver = self;
  v60.super_class = (Class)HDCodableSummarySharingEntry;
  long long v34 = [(HDCodableSummarySharingEntry *)&v60 init];
  if (v34)
  {
    id v54 = v33;
    id v52 = v25;
    long long v35 = [v25 UUIDString];
    [(HDCodableSummarySharingEntry *)v34 setUuid:v35];

    NSUInteger v36 = [v26 UUIDString];
    [(HDCodableSummarySharingEntry *)v34 setInvitationUUID:v36];

    id v51 = v27;
    uint64_t v37 = (void *)[v27 copy];
    [(HDCodableSummarySharingEntry *)v34 setCloudKitIdentifier:v37];

    uint64_t v38 = (void *)[v28 copy];
    [(HDCodableSummarySharingEntry *)v34 setPrimaryContactIdentifier:v38];

    uint64_t v39 = (void *)[v29 copy];
    [(HDCodableSummarySharingEntry *)v34 setAllContactIdentifiers:v39];

    long long v40 = (void *)[v30 copy];
    [(HDCodableSummarySharingEntry *)v34 setFirstName:v40];

    long long v41 = (void *)[v31 copy];
    [(HDCodableSummarySharingEntry *)v34 setLastName:v41];

    [(HDCodableSummarySharingEntry *)v34 setUserWheelchairMode:a11];
    [(HDCodableSummarySharingEntry *)v34 setType:a12];
    [(HDCodableSummarySharingEntry *)v34 setDirection:a13];
    [(HDCodableSummarySharingEntry *)v34 setStatus:a14];
    [(HDCodableSummarySharingEntry *)v34 setNotificationStatus:a15];
    if (v33)
    {
      [v33 timeIntervalSinceReferenceDate];
      -[HDCodableSummarySharingEntry setDateModified:](v34, "setDateModified:");
    }
    else
    {
      long long v42 = [MEMORY[0x1E4F1C9C8] date];
      [v42 timeIntervalSinceReferenceDate];
      -[HDCodableSummarySharingEntry setDateModified:](v34, "setDateModified:");
    }
    id v25 = v52;
    if (v57)
    {
      [v57 timeIntervalSinceReferenceDate];
      -[HDCodableSummarySharingEntry setDateInvited:](v34, "setDateInvited:");
    }
    if (v56)
    {
      [v56 timeIntervalSinceReferenceDate];
      -[HDCodableSummarySharingEntry setDateAccepted:](v34, "setDateAccepted:");
    }
    [(HDCodableSummarySharingEntry *)v34 setSharingSetupMetadata:v55];
    if (v58)
    {
      id v59 = 0;
      long long v43 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v58 requiringSecureCoding:1 error:&v59];
      id v44 = v59;
      [(HDCodableSummarySharingEntry *)v34 setOwnerParticipant:v43];

      long long v45 = [(HDCodableSummarySharingEntry *)v34 ownerParticipant];

      if (!v45)
      {
        _HKInitializeLogging();
        long long v46 = HKLogSharing();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v62 = v34;
          __int16 v63 = 2114;
          id v64 = v58;
          __int16 v65 = 2114;
          id v66 = v44;
          _os_log_error_impl(&dword_1BCB7D000, v46, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to archive owner participant %{public}@: %{public}@", buf, 0x20u);
        }
      }
    }
    else
    {
      -[HDCodableSummarySharingEntry setOwnerParticipant:](v34, "setOwnerParticipant:");
    }
    long long v47 = HDCodableSharingAuthorizationsFromSharingAuthorizations(v32);
    [(HDCodableSummarySharingEntry *)v34 setSharingAuthorizations:v47];

    long long v48 = [(HDCodableSummarySharingEntry *)v34 sharingAuthorizations];
    long long v49 = HDAuthorizationIdentifiersFromCodableSharingAuthorizations(v48);
    [(HDCodableSummarySharingEntry *)v34 setAuthorizationCategories:v49];

    id v27 = v51;
    id v33 = v54;
  }

  return v34;
}

- (id)sharingEntry
{
  id v23 = objc_alloc(MEMORY[0x1E4F2B5D8]);
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  long long v24 = [(HDCodableSummarySharingEntry *)self uuid];
  uint64_t v21 = (void *)[v3 initWithUUIDString:v24];
  uint64_t v20 = [(HDCodableSummarySharingEntry *)self primaryContactIdentifier];
  uint64_t v22 = [(HDCodableSummarySharingEntry *)self allContactIdentifiers];
  id v4 = (void *)[v22 copy];
  id v5 = [(HDCodableSummarySharingEntry *)self firstName];
  uint64_t v6 = [(HDCodableSummarySharingEntry *)self lastName];
  uint64_t v19 = [(HDCodableSummarySharingEntry *)self userWheelchairMode];
  uint64_t v7 = [(HDCodableSummarySharingEntry *)self type];
  uint64_t v8 = [(HDCodableSummarySharingEntry *)self status];
  uint64_t v9 = [(HDCodableSummarySharingEntry *)self notificationStatus];
  uint64_t v10 = [(HDCodableSummarySharingEntry *)self direction];
  double v11 = (void *)MEMORY[0x1E4F1C9C8];
  [(HDCodableSummarySharingEntry *)self dateModified];
  uint64_t v12 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
  id v13 = (void *)[v23 initWithUUID:v21 primaryContactIdentifier:v20 allContactIdentifiers:v4 firstName:v5 lastName:v6 userWheelchairMode:v19 type:v7 status:v8 notificationStatus:v9 direction:v10 modificationDate:v12];

  if ([(HDCodableSummarySharingEntry *)self hasDateAccepted])
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1C9C8];
    [(HDCodableSummarySharingEntry *)self dateAccepted];
    uint64_t v15 = objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
    [v13 _setDateAccepted:v15];
  }
  if ([(HDCodableSummarySharingEntry *)self hasDateInvited])
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F1C9C8];
    [(HDCodableSummarySharingEntry *)self dateInvited];
    long double v17 = objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
    [v13 _setDateInvited:v17];
  }

  return v13;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  cloudKitIdentifier = self->_cloudKitIdentifier;
  uint64_t v6 = (NSString *)*((void *)v4 + 6);
  if (cloudKitIdentifier != v6 && (!v6 || !-[NSString isEqualToString:](cloudKitIdentifier, "isEqualToString:"))) {
    goto LABEL_44;
  }
  primaryContactIdentifier = self->_primaryContactIdentifier;
  uint64_t v8 = (NSString *)*((void *)v4 + 13);
  if (primaryContactIdentifier != v8
    && (!v8 || !-[NSString isEqualToString:](primaryContactIdentifier, "isEqualToString:")))
  {
    goto LABEL_44;
  }
  allContactIdentifiers = self->_allContactIdentifiers;
  uint64_t v10 = (NSMutableArray *)*((void *)v4 + 4);
  if (allContactIdentifiers != v10
    && (!v10 || !-[NSMutableArray isEqualToArray:](allContactIdentifiers, "isEqualToArray:")))
  {
    goto LABEL_44;
  }
  firstName = self->_firstName;
  uint64_t v12 = (NSString *)*((void *)v4 + 8);
  if (firstName != v12 && (!v12 || !-[NSString isEqualToString:](firstName, "isEqualToString:"))) {
    goto LABEL_44;
  }
  lastName = self->_lastName;
  uint64_t v14 = (NSString *)*((void *)v4 + 10);
  if (lastName != v14 && (!v14 || !-[NSString isEqualToString:](lastName, "isEqualToString:"))) {
    goto LABEL_44;
  }
  $8065ADDBD76E777BD4A8EE61604E0159 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v4[152] & 0x80000000) == 0 || self->_userWheelchairMode != *((_DWORD *)v4 + 34)) {
      goto LABEL_44;
    }
  }
  else if (*((_DWORD *)v4 + 34))
  {
LABEL_44:
    char v20 = 0;
    goto LABEL_45;
  }
  sharingAuthorizations = self->_sharingAuthorizations;
  long double v17 = (NSMutableArray *)*((void *)v4 + 14);
  if (sharingAuthorizations != v17)
  {
    if (!v17 || !-[NSMutableArray isEqualToArray:](sharingAuthorizations, "isEqualToArray:")) {
      goto LABEL_44;
    }
    *(unsigned char *)&$8065ADDBD76E777BD4A8EE61604E0159 has = self->_has;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v4[152] & 0x40) == 0 || self->_type != *((_DWORD *)v4 + 33)) {
      goto LABEL_44;
    }
  }
  else if ((v4[152] & 0x40) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v4[152] & 8) == 0 || self->_direction != *((_DWORD *)v4 + 14)) {
      goto LABEL_44;
    }
  }
  else if ((v4[152] & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v4[152] & 0x20) == 0 || self->_status != *((_DWORD *)v4 + 32)) {
      goto LABEL_44;
    }
  }
  else if ((v4[152] & 0x20) != 0)
  {
    goto LABEL_44;
  }
  sharingSetupMetadata = self->_sharingSetupMetadata;
  uint64_t v19 = (HDCodableSharingSetupMetadata *)*((void *)v4 + 15);
  if (sharingSetupMetadata == v19)
  {
    char v20 = 1;
    goto LABEL_45;
  }
  if (!v19) {
    goto LABEL_44;
  }
  char v20 = -[HDCodableSharingSetupMetadata isEqual:](sharingSetupMetadata, "isEqual:");
LABEL_45:

  return v20;
}

- (id)sharingRecipientIdentifier
{
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  id v4 = [(HDCodableSummarySharingEntry *)self uuid];
  id v5 = (void *)[v3 initWithUUIDString:v4];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F2B500]) initForInvitationUUID:v5];

  return v6;
}

- (id)shareOwnerParticipant
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(HDCodableSummarySharingEntry *)self ownerParticipant];
  if (v3)
  {
    id v8 = 0;
    id v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v8];
    id v5 = v8;
    if (!v4)
    {
      _HKInitializeLogging();
      uint64_t v6 = HKLogSharing();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v10 = self;
        __int16 v11 = 2114;
        uint64_t v12 = v3;
        __int16 v13 = 2114;
        id v14 = v5;
        _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to unarchive owner participant %{public}@: %{public}@", buf, 0x20u);
      }

      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
    id v5 = 0;
  }

  return v4;
}

- (BOOL)isEqualFirstName:(id)a3 lastName:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HDCodableSummarySharingEntry *)self firstName];
  if (v10 != v8)
  {
    uint64_t v11 = [(HDCodableSummarySharingEntry *)self firstName];
    if (!v11)
    {
      char v12 = 0;
      goto LABEL_13;
    }
    id v4 = (void *)v11;
    id v5 = [(HDCodableSummarySharingEntry *)self firstName];
    if (![v8 isEqualToString:v5])
    {
      char v12 = 0;
LABEL_12:

      goto LABEL_13;
    }
  }
  uint64_t v13 = [(HDCodableSummarySharingEntry *)self lastName];
  if ((id)v13 == v9)
  {

    char v12 = 1;
  }
  else
  {
    id v14 = (void *)v13;
    uint64_t v15 = [(HDCodableSummarySharingEntry *)self lastName];
    if (v15)
    {
      uint64_t v16 = (void *)v15;
      long double v17 = [(HDCodableSummarySharingEntry *)self lastName];
      char v12 = [v9 isEqualToString:v17];
    }
    else
    {

      char v12 = 0;
    }
  }
  if (v10 != v8) {
    goto LABEL_12;
  }
LABEL_13:

  return v12;
}

@end