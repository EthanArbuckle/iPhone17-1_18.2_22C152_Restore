@interface ACProtobufAccount
+ (Class)dataclassPropertiesType;
+ (Class)dirtyAccountPropertiesType;
+ (Class)dirtyDataclassPropertiesType;
+ (Class)dirtyPropertiesType;
+ (Class)enabledDataclassesType;
+ (Class)propertiesType;
+ (Class)provisionedDataclassesType;
- (ACProtobufAccount)parentAccount;
- (ACProtobufAccountCredential)credential;
- (ACProtobufAccountType)accountType;
- (ACProtobufDate)date;
- (ACProtobufDate)lastCredentialRenewalRejectionDate;
- (ACProtobufURL)objectID;
- (BOOL)active;
- (BOOL)authenticated;
- (BOOL)hasAccountDescription;
- (BOOL)hasAuthenticationType;
- (BOOL)hasCredential;
- (BOOL)hasCredentialType;
- (BOOL)hasDate;
- (BOOL)hasLastCredentialRenewalRejectionDate;
- (BOOL)hasModificationID;
- (BOOL)hasObjectID;
- (BOOL)hasOwningBundleID;
- (BOOL)hasParentAccount;
- (BOOL)hasUsername;
- (BOOL)hasWarmingUp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsAuthentication;
- (BOOL)visible;
- (BOOL)warmingUp;
- (NSDictionary)dataclassPropertiesDictionary;
- (NSDictionary)propertiesDictionary;
- (NSMutableArray)dataclassProperties;
- (NSMutableArray)dirtyAccountProperties;
- (NSMutableArray)dirtyDataclassProperties;
- (NSMutableArray)dirtyProperties;
- (NSMutableArray)enabledDataclasses;
- (NSMutableArray)properties;
- (NSMutableArray)provisionedDataclasses;
- (NSString)accountDescription;
- (NSString)authenticationType;
- (NSString)credentialType;
- (NSString)identifier;
- (NSString)modificationID;
- (NSString)owningBundleID;
- (NSString)username;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataclassPropertiesAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)dirtyAccountPropertiesAtIndex:(unint64_t)a3;
- (id)dirtyDataclassPropertiesAtIndex:(unint64_t)a3;
- (id)dirtyPropertiesAtIndex:(unint64_t)a3;
- (id)enabledDataclassesAtIndex:(unint64_t)a3;
- (id)propertiesAtIndex:(unint64_t)a3;
- (id)provisionedDataclassesAtIndex:(unint64_t)a3;
- (unint64_t)dataclassPropertiesCount;
- (unint64_t)dirtyAccountPropertiesCount;
- (unint64_t)dirtyDataclassPropertiesCount;
- (unint64_t)dirtyPropertiesCount;
- (unint64_t)enabledDataclassesCount;
- (unint64_t)hash;
- (unint64_t)propertiesCount;
- (unint64_t)provisionedDataclassesCount;
- (void)addDataclassProperties:(id)a3;
- (void)addDirtyAccountProperties:(id)a3;
- (void)addDirtyDataclassProperties:(id)a3;
- (void)addDirtyProperties:(id)a3;
- (void)addEnabledDataclasses:(id)a3;
- (void)addProperties:(id)a3;
- (void)addProvisionedDataclasses:(id)a3;
- (void)clearDataclassProperties;
- (void)clearDirtyAccountProperties;
- (void)clearDirtyDataclassProperties;
- (void)clearDirtyProperties;
- (void)clearEnabledDataclasses;
- (void)clearProperties;
- (void)clearProvisionedDataclasses;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountDescription:(id)a3;
- (void)setAccountType:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setAuthenticated:(BOOL)a3;
- (void)setAuthenticationType:(id)a3;
- (void)setCredential:(id)a3;
- (void)setCredentialType:(id)a3;
- (void)setDataclassProperties:(id)a3;
- (void)setDataclassPropertiesDictionary:(id)a3;
- (void)setDate:(id)a3;
- (void)setDirtyAccountProperties:(id)a3;
- (void)setDirtyDataclassProperties:(id)a3;
- (void)setDirtyProperties:(id)a3;
- (void)setEnabledDataclasses:(id)a3;
- (void)setHasWarmingUp:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastCredentialRenewalRejectionDate:(id)a3;
- (void)setModificationID:(id)a3;
- (void)setObjectID:(id)a3;
- (void)setOwningBundleID:(id)a3;
- (void)setParentAccount:(id)a3;
- (void)setProperties:(id)a3;
- (void)setPropertiesDictionary:(id)a3;
- (void)setProvisionedDataclasses:(id)a3;
- (void)setSupportsAuthentication:(BOOL)a3;
- (void)setUsername:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)setWarmingUp:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ACProtobufAccount

- (BOOL)hasCredential
{
  return self->_credential != 0;
}

- (BOOL)hasAccountDescription
{
  return self->_accountDescription != 0;
}

- (BOOL)hasUsername
{
  return self->_username != 0;
}

- (void)clearProperties
{
}

- (void)addProperties:(id)a3
{
  id v4 = a3;
  properties = self->_properties;
  id v8 = v4;
  if (!properties)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_properties;
    self->_properties = v6;

    id v4 = v8;
    properties = self->_properties;
  }
  [(NSMutableArray *)properties addObject:v4];
}

- (unint64_t)propertiesCount
{
  return [(NSMutableArray *)self->_properties count];
}

- (id)propertiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_properties objectAtIndex:a3];
}

+ (Class)propertiesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLastCredentialRenewalRejectionDate
{
  return self->_lastCredentialRenewalRejectionDate != 0;
}

- (void)clearDataclassProperties
{
}

- (void)addDataclassProperties:(id)a3
{
  id v4 = a3;
  dataclassProperties = self->_dataclassProperties;
  id v8 = v4;
  if (!dataclassProperties)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_dataclassProperties;
    self->_dataclassProperties = v6;

    id v4 = v8;
    dataclassProperties = self->_dataclassProperties;
  }
  [(NSMutableArray *)dataclassProperties addObject:v4];
}

- (unint64_t)dataclassPropertiesCount
{
  return [(NSMutableArray *)self->_dataclassProperties count];
}

- (id)dataclassPropertiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_dataclassProperties objectAtIndex:a3];
}

+ (Class)dataclassPropertiesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasObjectID
{
  return self->_objectID != 0;
}

- (BOOL)hasParentAccount
{
  return self->_parentAccount != 0;
}

- (void)clearEnabledDataclasses
{
}

- (void)addEnabledDataclasses:(id)a3
{
  id v4 = a3;
  enabledDataclasses = self->_enabledDataclasses;
  id v8 = v4;
  if (!enabledDataclasses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_enabledDataclasses;
    self->_enabledDataclasses = v6;

    id v4 = v8;
    enabledDataclasses = self->_enabledDataclasses;
  }
  [(NSMutableArray *)enabledDataclasses addObject:v4];
}

- (unint64_t)enabledDataclassesCount
{
  return [(NSMutableArray *)self->_enabledDataclasses count];
}

- (id)enabledDataclassesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_enabledDataclasses objectAtIndex:a3];
}

+ (Class)enabledDataclassesType
{
  return (Class)objc_opt_class();
}

- (void)clearProvisionedDataclasses
{
}

- (void)addProvisionedDataclasses:(id)a3
{
  id v4 = a3;
  provisionedDataclasses = self->_provisionedDataclasses;
  id v8 = v4;
  if (!provisionedDataclasses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_provisionedDataclasses;
    self->_provisionedDataclasses = v6;

    id v4 = v8;
    provisionedDataclasses = self->_provisionedDataclasses;
  }
  [(NSMutableArray *)provisionedDataclasses addObject:v4];
}

- (unint64_t)provisionedDataclassesCount
{
  return [(NSMutableArray *)self->_provisionedDataclasses count];
}

- (id)provisionedDataclassesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_provisionedDataclasses objectAtIndex:a3];
}

+ (Class)provisionedDataclassesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAuthenticationType
{
  return self->_authenticationType != 0;
}

- (BOOL)hasCredentialType
{
  return self->_credentialType != 0;
}

- (BOOL)hasDate
{
  return self->_date != 0;
}

- (BOOL)hasOwningBundleID
{
  return self->_owningBundleID != 0;
}

- (void)clearDirtyProperties
{
}

- (void)addDirtyProperties:(id)a3
{
  id v4 = a3;
  dirtyProperties = self->_dirtyProperties;
  id v8 = v4;
  if (!dirtyProperties)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_dirtyProperties;
    self->_dirtyProperties = v6;

    id v4 = v8;
    dirtyProperties = self->_dirtyProperties;
  }
  [(NSMutableArray *)dirtyProperties addObject:v4];
}

- (unint64_t)dirtyPropertiesCount
{
  return [(NSMutableArray *)self->_dirtyProperties count];
}

- (id)dirtyPropertiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_dirtyProperties objectAtIndex:a3];
}

+ (Class)dirtyPropertiesType
{
  return (Class)objc_opt_class();
}

- (void)clearDirtyAccountProperties
{
}

- (void)addDirtyAccountProperties:(id)a3
{
  id v4 = a3;
  dirtyAccountProperties = self->_dirtyAccountProperties;
  id v8 = v4;
  if (!dirtyAccountProperties)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_dirtyAccountProperties;
    self->_dirtyAccountProperties = v6;

    id v4 = v8;
    dirtyAccountProperties = self->_dirtyAccountProperties;
  }
  [(NSMutableArray *)dirtyAccountProperties addObject:v4];
}

- (unint64_t)dirtyAccountPropertiesCount
{
  return [(NSMutableArray *)self->_dirtyAccountProperties count];
}

- (id)dirtyAccountPropertiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_dirtyAccountProperties objectAtIndex:a3];
}

+ (Class)dirtyAccountPropertiesType
{
  return (Class)objc_opt_class();
}

- (void)clearDirtyDataclassProperties
{
}

- (void)addDirtyDataclassProperties:(id)a3
{
  id v4 = a3;
  dirtyDataclassProperties = self->_dirtyDataclassProperties;
  id v8 = v4;
  if (!dirtyDataclassProperties)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_dirtyDataclassProperties;
    self->_dirtyDataclassProperties = v6;

    id v4 = v8;
    dirtyDataclassProperties = self->_dirtyDataclassProperties;
  }
  [(NSMutableArray *)dirtyDataclassProperties addObject:v4];
}

- (unint64_t)dirtyDataclassPropertiesCount
{
  return [(NSMutableArray *)self->_dirtyDataclassProperties count];
}

- (id)dirtyDataclassPropertiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_dirtyDataclassProperties objectAtIndex:a3];
}

+ (Class)dirtyDataclassPropertiesType
{
  return (Class)objc_opt_class();
}

- (void)setWarmingUp:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_warmingUp = a3;
}

- (void)setHasWarmingUp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWarmingUp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasModificationID
{
  return self->_modificationID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ACProtobufAccount;
  id v4 = [(ACProtobufAccount *)&v8 description];
  v5 = [(ACProtobufAccount *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  accountType = self->_accountType;
  if (accountType)
  {
    v5 = [(ACProtobufAccountType *)accountType dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"accountType"];
  }
  credential = self->_credential;
  if (credential)
  {
    v7 = [(ACProtobufAccountCredential *)credential dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"credential"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  accountDescription = self->_accountDescription;
  if (accountDescription) {
    [v3 setObject:accountDescription forKey:@"accountDescription"];
  }
  username = self->_username;
  if (username) {
    [v3 setObject:username forKey:@"username"];
  }
  if ([(NSMutableArray *)self->_properties count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_properties, "count"));
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v12 = self->_properties;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v53 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v52 + 1) + 8 * i) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"properties"];
  }
  v18 = [NSNumber numberWithBool:self->_authenticated];
  [v3 setObject:v18 forKey:@"authenticated"];

  lastCredentialRenewalRejectionDate = self->_lastCredentialRenewalRejectionDate;
  if (lastCredentialRenewalRejectionDate)
  {
    v20 = [(ACProtobufDate *)lastCredentialRenewalRejectionDate dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"lastCredentialRenewalRejectionDate"];
  }
  v21 = [NSNumber numberWithBool:self->_active];
  [v3 setObject:v21 forKey:@"active"];

  v22 = [NSNumber numberWithBool:self->_visible];
  [v3 setObject:v22 forKey:@"visible"];

  v23 = [NSNumber numberWithBool:self->_supportsAuthentication];
  [v3 setObject:v23 forKey:@"supportsAuthentication"];

  if ([(NSMutableArray *)self->_dataclassProperties count])
  {
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_dataclassProperties, "count"));
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v25 = self->_dataclassProperties;
    uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v49 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * j), "dictionaryRepresentation", (void)v48);
          [v24 addObject:v30];
        }
        uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v27);
    }

    [v3 setObject:v24 forKey:@"dataclassProperties"];
  }
  objectID = self->_objectID;
  if (objectID)
  {
    v32 = [(ACProtobufURL *)objectID dictionaryRepresentation];
    [v3 setObject:v32 forKey:@"objectID"];
  }
  parentAccount = self->_parentAccount;
  if (parentAccount)
  {
    v34 = [(ACProtobufAccount *)parentAccount dictionaryRepresentation];
    [v3 setObject:v34 forKey:@"parentAccount"];
  }
  enabledDataclasses = self->_enabledDataclasses;
  if (enabledDataclasses) {
    [v3 setObject:enabledDataclasses forKey:@"enabledDataclasses"];
  }
  provisionedDataclasses = self->_provisionedDataclasses;
  if (provisionedDataclasses) {
    [v3 setObject:provisionedDataclasses forKey:@"provisionedDataclasses"];
  }
  authenticationType = self->_authenticationType;
  if (authenticationType) {
    [v3 setObject:authenticationType forKey:@"authenticationType"];
  }
  credentialType = self->_credentialType;
  if (credentialType) {
    [v3 setObject:credentialType forKey:@"credentialType"];
  }
  date = self->_date;
  if (date)
  {
    v40 = [(ACProtobufDate *)date dictionaryRepresentation];
    [v3 setObject:v40 forKey:@"date"];
  }
  owningBundleID = self->_owningBundleID;
  if (owningBundleID) {
    [v3 setObject:owningBundleID forKey:@"owningBundleID"];
  }
  dirtyProperties = self->_dirtyProperties;
  if (dirtyProperties) {
    [v3 setObject:dirtyProperties forKey:@"dirtyProperties"];
  }
  dirtyAccountProperties = self->_dirtyAccountProperties;
  if (dirtyAccountProperties) {
    [v3 setObject:dirtyAccountProperties forKey:@"dirtyAccountProperties"];
  }
  dirtyDataclassProperties = self->_dirtyDataclassProperties;
  if (dirtyDataclassProperties) {
    [v3 setObject:dirtyDataclassProperties forKey:@"dirtyDataclassProperties"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v45 = [NSNumber numberWithBool:self->_warmingUp];
    [v3 setObject:v45 forKey:@"warmingUp"];
  }
  modificationID = self->_modificationID;
  if (modificationID) {
    [v3 setObject:modificationID forKey:@"modificationID"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ACProtobufAccountReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteSubmessage();
  if (self->_credential) {
    PBDataWriterWriteSubmessage();
  }
  PBDataWriterWriteStringField();
  if (self->_accountDescription) {
    PBDataWriterWriteStringField();
  }
  if (self->_username) {
    PBDataWriterWriteStringField();
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v5 = self->_properties;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v64 objects:v74 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v65;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v65 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v64 objects:v74 count:16];
    }
    while (v7);
  }

  PBDataWriterWriteBOOLField();
  if (self->_lastCredentialRenewalRejectionDate) {
    PBDataWriterWriteSubmessage();
  }
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v10 = self->_dataclassProperties;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v60 objects:v73 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v61;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v61 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v60 objects:v73 count:16];
    }
    while (v12);
  }

  if (self->_objectID) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_parentAccount) {
    PBDataWriterWriteSubmessage();
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v15 = self->_enabledDataclasses;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v56 objects:v72 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v57;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v57 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v56 objects:v72 count:16];
    }
    while (v17);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v20 = self->_provisionedDataclasses;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v52 objects:v71 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v53;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v53 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v52 objects:v71 count:16];
    }
    while (v22);
  }

  if (self->_authenticationType) {
    PBDataWriterWriteStringField();
  }
  if (self->_credentialType) {
    PBDataWriterWriteStringField();
  }
  if (self->_date) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_owningBundleID) {
    PBDataWriterWriteStringField();
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v25 = self->_dirtyProperties;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v48 objects:v70 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v49;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v49 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteStringField();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v48 objects:v70 count:16];
    }
    while (v27);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v30 = self->_dirtyAccountProperties;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v44 objects:v69 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v45;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v45 != v33) {
          objc_enumerationMutation(v30);
        }
        PBDataWriterWriteStringField();
        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v44 objects:v69 count:16];
    }
    while (v32);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v35 = self->_dirtyDataclassProperties;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v40 objects:v68 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v41;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v41 != v38) {
          objc_enumerationMutation(v35);
        }
        PBDataWriterWriteStringField();
        ++v39;
      }
      while (v37 != v39);
      uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v40 objects:v68 count:16];
    }
    while (v37);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_modificationID) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v34 = a3;
  [v34 setAccountType:self->_accountType];
  if (self->_credential) {
    objc_msgSend(v34, "setCredential:");
  }
  [v34 setIdentifier:self->_identifier];
  if (self->_accountDescription) {
    objc_msgSend(v34, "setAccountDescription:");
  }
  if (self->_username) {
    objc_msgSend(v34, "setUsername:");
  }
  if ([(ACProtobufAccount *)self propertiesCount])
  {
    [v34 clearProperties];
    unint64_t v4 = [(ACProtobufAccount *)self propertiesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ACProtobufAccount *)self propertiesAtIndex:i];
        [v34 addProperties:v7];
      }
    }
  }
  uint64_t v8 = v34;
  v34[169] = self->_authenticated;
  if (self->_lastCredentialRenewalRejectionDate)
  {
    objc_msgSend(v34, "setLastCredentialRenewalRejectionDate:");
    uint64_t v8 = v34;
  }
  v8[168] = self->_active;
  v8[171] = self->_visible;
  v8[170] = self->_supportsAuthentication;
  if ([(ACProtobufAccount *)self dataclassPropertiesCount])
  {
    [v34 clearDataclassProperties];
    unint64_t v9 = [(ACProtobufAccount *)self dataclassPropertiesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(ACProtobufAccount *)self dataclassPropertiesAtIndex:j];
        [v34 addDataclassProperties:v12];
      }
    }
  }
  if (self->_objectID) {
    objc_msgSend(v34, "setObjectID:");
  }
  if (self->_parentAccount) {
    objc_msgSend(v34, "setParentAccount:");
  }
  if ([(ACProtobufAccount *)self enabledDataclassesCount])
  {
    [v34 clearEnabledDataclasses];
    unint64_t v13 = [(ACProtobufAccount *)self enabledDataclassesCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(ACProtobufAccount *)self enabledDataclassesAtIndex:k];
        [v34 addEnabledDataclasses:v16];
      }
    }
  }
  if ([(ACProtobufAccount *)self provisionedDataclassesCount])
  {
    [v34 clearProvisionedDataclasses];
    unint64_t v17 = [(ACProtobufAccount *)self provisionedDataclassesCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        v20 = [(ACProtobufAccount *)self provisionedDataclassesAtIndex:m];
        [v34 addProvisionedDataclasses:v20];
      }
    }
  }
  if (self->_authenticationType) {
    objc_msgSend(v34, "setAuthenticationType:");
  }
  if (self->_credentialType) {
    objc_msgSend(v34, "setCredentialType:");
  }
  if (self->_date) {
    objc_msgSend(v34, "setDate:");
  }
  if (self->_owningBundleID) {
    objc_msgSend(v34, "setOwningBundleID:");
  }
  if ([(ACProtobufAccount *)self dirtyPropertiesCount])
  {
    [v34 clearDirtyProperties];
    unint64_t v21 = [(ACProtobufAccount *)self dirtyPropertiesCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0; n != v22; ++n)
      {
        uint64_t v24 = [(ACProtobufAccount *)self dirtyPropertiesAtIndex:n];
        [v34 addDirtyProperties:v24];
      }
    }
  }
  if ([(ACProtobufAccount *)self dirtyAccountPropertiesCount])
  {
    [v34 clearDirtyAccountProperties];
    unint64_t v25 = [(ACProtobufAccount *)self dirtyAccountPropertiesCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (iuint64_t i = 0; ii != v26; ++ii)
      {
        uint64_t v28 = [(ACProtobufAccount *)self dirtyAccountPropertiesAtIndex:ii];
        [v34 addDirtyAccountProperties:v28];
      }
    }
  }
  if ([(ACProtobufAccount *)self dirtyDataclassPropertiesCount])
  {
    [v34 clearDirtyDataclassProperties];
    unint64_t v29 = [(ACProtobufAccount *)self dirtyDataclassPropertiesCount];
    if (v29)
    {
      unint64_t v30 = v29;
      for (juint64_t j = 0; jj != v30; ++jj)
      {
        uint64_t v32 = [(ACProtobufAccount *)self dirtyDataclassPropertiesAtIndex:jj];
        [v34 addDirtyDataclassProperties:v32];
      }
    }
  }
  uint64_t v33 = v34;
  if (*(unsigned char *)&self->_has)
  {
    v34[172] = self->_warmingUp;
    v34[176] |= 1u;
  }
  if (self->_modificationID)
  {
    objc_msgSend(v34, "setModificationID:");
    uint64_t v33 = v34;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ACProtobufAccountType *)self->_accountType copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  id v8 = [(ACProtobufAccountCredential *)self->_credential copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v10;

  uint64_t v12 = [(NSString *)self->_accountDescription copyWithZone:a3];
  unint64_t v13 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v12;

  uint64_t v14 = [(NSString *)self->_username copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v14;

  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  uint64_t v16 = self->_properties;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v99 objects:v109 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v100;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v100 != v19) {
          objc_enumerationMutation(v16);
        }
        unint64_t v21 = (void *)[*(id *)(*((void *)&v99 + 1) + 8 * v20) copyWithZone:a3];
        [(id)v5 addProperties:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v99 objects:v109 count:16];
    }
    while (v18);
  }

  *(unsigned char *)(v5 + 169) = self->_authenticated;
  id v22 = [(ACProtobufDate *)self->_lastCredentialRenewalRejectionDate copyWithZone:a3];
  uint64_t v23 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v22;

  *(unsigned char *)(v5 + 168) = self->_active;
  *(unsigned char *)(v5 + 171) = self->_visible;
  *(unsigned char *)(v5 + 170) = self->_supportsAuthentication;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  uint64_t v24 = self->_dataclassProperties;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v95 objects:v108 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v96;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v96 != v27) {
          objc_enumerationMutation(v24);
        }
        unint64_t v29 = (void *)[*(id *)(*((void *)&v95 + 1) + 8 * v28) copyWithZone:a3];
        [(id)v5 addDataclassProperties:v29];

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v95 objects:v108 count:16];
    }
    while (v26);
  }

  id v30 = [(ACProtobufURL *)self->_objectID copyWithZone:a3];
  uint64_t v31 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v30;

  id v32 = [(ACProtobufAccount *)self->_parentAccount copyWithZone:a3];
  uint64_t v33 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v32;

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  uint64_t v34 = self->_enabledDataclasses;
  uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v91 objects:v107 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v92;
    do
    {
      uint64_t v38 = 0;
      do
      {
        if (*(void *)v92 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = (void *)[*(id *)(*((void *)&v91 + 1) + 8 * v38) copyWithZone:a3];
        [(id)v5 addEnabledDataclasses:v39];

        ++v38;
      }
      while (v36 != v38);
      uint64_t v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v91 objects:v107 count:16];
    }
    while (v36);
  }

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v40 = self->_provisionedDataclasses;
  uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v87 objects:v106 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v88;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v88 != v43) {
          objc_enumerationMutation(v40);
        }
        long long v45 = (void *)[*(id *)(*((void *)&v87 + 1) + 8 * v44) copyWithZone:a3];
        [(id)v5 addProvisionedDataclasses:v45];

        ++v44;
      }
      while (v42 != v44);
      uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v87 objects:v106 count:16];
    }
    while (v42);
  }

  uint64_t v46 = [(NSString *)self->_authenticationType copyWithZone:a3];
  long long v47 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v46;

  uint64_t v48 = [(NSString *)self->_credentialType copyWithZone:a3];
  long long v49 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v48;

  id v50 = [(ACProtobufDate *)self->_date copyWithZone:a3];
  long long v51 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v50;

  uint64_t v52 = [(NSString *)self->_owningBundleID copyWithZone:a3];
  long long v53 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v52;

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v54 = self->_dirtyProperties;
  uint64_t v55 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v83 objects:v105 count:16];
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = *(void *)v84;
    do
    {
      uint64_t v58 = 0;
      do
      {
        if (*(void *)v84 != v57) {
          objc_enumerationMutation(v54);
        }
        long long v59 = (void *)[*(id *)(*((void *)&v83 + 1) + 8 * v58) copyWithZone:a3];
        [(id)v5 addDirtyProperties:v59];

        ++v58;
      }
      while (v56 != v58);
      uint64_t v56 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v83 objects:v105 count:16];
    }
    while (v56);
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v60 = self->_dirtyAccountProperties;
  uint64_t v61 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v79 objects:v104 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v80;
    do
    {
      uint64_t v64 = 0;
      do
      {
        if (*(void *)v80 != v63) {
          objc_enumerationMutation(v60);
        }
        long long v65 = (void *)[*(id *)(*((void *)&v79 + 1) + 8 * v64) copyWithZone:a3];
        [(id)v5 addDirtyAccountProperties:v65];

        ++v64;
      }
      while (v62 != v64);
      uint64_t v62 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v79 objects:v104 count:16];
    }
    while (v62);
  }

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v66 = self->_dirtyDataclassProperties;
  uint64_t v67 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v75 objects:v103 count:16];
  if (v67)
  {
    uint64_t v68 = v67;
    uint64_t v69 = *(void *)v76;
    do
    {
      uint64_t v70 = 0;
      do
      {
        if (*(void *)v76 != v69) {
          objc_enumerationMutation(v66);
        }
        v71 = objc_msgSend(*(id *)(*((void *)&v75 + 1) + 8 * v70), "copyWithZone:", a3, (void)v75);
        [(id)v5 addDirtyDataclassProperties:v71];

        ++v70;
      }
      while (v68 != v70);
      uint64_t v68 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v75 objects:v103 count:16];
    }
    while (v68);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 172) = self->_warmingUp;
    *(unsigned char *)(v5 + 176) |= 1u;
  }
  uint64_t v72 = -[NSString copyWithZone:](self->_modificationID, "copyWithZone:", a3, (void)v75);
  v73 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v72;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_60;
  }
  accountType = self->_accountType;
  if ((unint64_t)accountType | *((void *)v4 + 2))
  {
    if (!-[ACProtobufAccountType isEqual:](accountType, "isEqual:")) {
      goto LABEL_60;
    }
  }
  credential = self->_credential;
  if ((unint64_t)credential | *((void *)v4 + 4))
  {
    if (!-[ACProtobufAccountCredential isEqual:](credential, "isEqual:")) {
      goto LABEL_60;
    }
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_60;
    }
  }
  accountDescriptiouint64_t n = self->_accountDescription;
  if ((unint64_t)accountDescription | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](accountDescription, "isEqual:")) {
      goto LABEL_60;
    }
  }
  username = self->_username;
  if ((unint64_t)username | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](username, "isEqual:")) {
      goto LABEL_60;
    }
  }
  properties = self->_properties;
  if ((unint64_t)properties | *((void *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](properties, "isEqual:")) {
      goto LABEL_60;
    }
  }
  if (self->_authenticated)
  {
    if (!*((unsigned char *)v4 + 169)) {
      goto LABEL_60;
    }
  }
  else if (*((unsigned char *)v4 + 169))
  {
    goto LABEL_60;
  }
  lastCredentialRenewalRejectionDate = self->_lastCredentialRenewalRejectionDate;
  if ((unint64_t)lastCredentialRenewalRejectionDate | *((void *)v4 + 13)
    && !-[ACProtobufDate isEqual:](lastCredentialRenewalRejectionDate, "isEqual:"))
  {
    goto LABEL_60;
  }
  if (self->_active)
  {
    if (!*((unsigned char *)v4 + 168)) {
      goto LABEL_60;
    }
  }
  else if (*((unsigned char *)v4 + 168))
  {
    goto LABEL_60;
  }
  if (self->_visible)
  {
    if (!*((unsigned char *)v4 + 171)) {
      goto LABEL_60;
    }
  }
  else if (*((unsigned char *)v4 + 171))
  {
    goto LABEL_60;
  }
  if (self->_supportsAuthentication)
  {
    if (!*((unsigned char *)v4 + 170)) {
      goto LABEL_60;
    }
  }
  else if (*((unsigned char *)v4 + 170))
  {
    goto LABEL_60;
  }
  dataclassProperties = self->_dataclassProperties;
  if ((unint64_t)dataclassProperties | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](dataclassProperties, "isEqual:"))
  {
    goto LABEL_60;
  }
  objectID = self->_objectID;
  if ((unint64_t)objectID | *((void *)v4 + 15))
  {
    if (!-[ACProtobufURL isEqual:](objectID, "isEqual:")) {
      goto LABEL_60;
    }
  }
  parentAccount = self->_parentAccount;
  if ((unint64_t)parentAccount | *((void *)v4 + 17))
  {
    if (!-[ACProtobufAccount isEqual:](parentAccount, "isEqual:")) {
      goto LABEL_60;
    }
  }
  enabledDataclasses = self->_enabledDataclasses;
  if ((unint64_t)enabledDataclasses | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](enabledDataclasses, "isEqual:")) {
      goto LABEL_60;
    }
  }
  provisionedDataclasses = self->_provisionedDataclasses;
  if ((unint64_t)provisionedDataclasses | *((void *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](provisionedDataclasses, "isEqual:")) {
      goto LABEL_60;
    }
  }
  authenticationType = self->_authenticationType;
  if ((unint64_t)authenticationType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](authenticationType, "isEqual:")) {
      goto LABEL_60;
    }
  }
  credentialType = self->_credentialType;
  if ((unint64_t)credentialType | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](credentialType, "isEqual:")) {
      goto LABEL_60;
    }
  }
  date = self->_date;
  if ((unint64_t)date | *((void *)v4 + 7))
  {
    if (!-[ACProtobufDate isEqual:](date, "isEqual:")) {
      goto LABEL_60;
    }
  }
  owningBundleID = self->_owningBundleID;
  if ((unint64_t)owningBundleID | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](owningBundleID, "isEqual:")) {
      goto LABEL_60;
    }
  }
  dirtyProperties = self->_dirtyProperties;
  if ((unint64_t)dirtyProperties | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](dirtyProperties, "isEqual:")) {
      goto LABEL_60;
    }
  }
  dirtyAccountProperties = self->_dirtyAccountProperties;
  if ((unint64_t)dirtyAccountProperties | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](dirtyAccountProperties, "isEqual:")) {
      goto LABEL_60;
    }
  }
  dirtyDataclassProperties = self->_dirtyDataclassProperties;
  if ((unint64_t)dirtyDataclassProperties | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](dirtyDataclassProperties, "isEqual:")) {
      goto LABEL_60;
    }
  }
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    if ((*((unsigned char *)v4 + 176) & 1) == 0) {
      goto LABEL_66;
    }
LABEL_60:
    char v24 = 0;
    goto LABEL_61;
  }
  if ((*((unsigned char *)v4 + 176) & 1) == 0) {
    goto LABEL_60;
  }
  if (!self->_warmingUp)
  {
    if (!*((unsigned char *)v4 + 172)) {
      goto LABEL_66;
    }
    goto LABEL_60;
  }
  if (!*((unsigned char *)v4 + 172)) {
    goto LABEL_60;
  }
LABEL_66:
  modificationID = self->_modificationID;
  if ((unint64_t)modificationID | *((void *)v4 + 14)) {
    char v24 = -[NSString isEqual:](modificationID, "isEqual:");
  }
  else {
    char v24 = 1;
  }
LABEL_61:

  return v24;
}

- (unint64_t)hash
{
  unint64_t v29 = [(ACProtobufAccountType *)self->_accountType hash];
  unint64_t v28 = [(ACProtobufAccountCredential *)self->_credential hash];
  NSUInteger v27 = [(NSString *)self->_identifier hash];
  NSUInteger v26 = [(NSString *)self->_accountDescription hash];
  NSUInteger v25 = [(NSString *)self->_username hash];
  uint64_t v3 = [(NSMutableArray *)self->_properties hash];
  BOOL authenticated = self->_authenticated;
  uint64_t v24 = v3;
  unint64_t v4 = [(ACProtobufDate *)self->_lastCredentialRenewalRejectionDate hash];
  BOOL active = self->_active;
  unint64_t v22 = v4;
  BOOL visible = self->_visible;
  supportsAuthenticatiouint64_t n = self->_supportsAuthentication;
  uint64_t v20 = [(NSMutableArray *)self->_dataclassProperties hash];
  unint64_t v18 = [(ACProtobufURL *)self->_objectID hash];
  unint64_t v5 = [(ACProtobufAccount *)self->_parentAccount hash];
  uint64_t v6 = [(NSMutableArray *)self->_enabledDataclasses hash];
  uint64_t v7 = [(NSMutableArray *)self->_provisionedDataclasses hash];
  NSUInteger v8 = [(NSString *)self->_authenticationType hash];
  NSUInteger v9 = [(NSString *)self->_credentialType hash];
  unint64_t v10 = [(ACProtobufDate *)self->_date hash];
  NSUInteger v11 = [(NSString *)self->_owningBundleID hash];
  uint64_t v12 = [(NSMutableArray *)self->_dirtyProperties hash];
  uint64_t v13 = [(NSMutableArray *)self->_dirtyAccountProperties hash];
  uint64_t v14 = [(NSMutableArray *)self->_dirtyDataclassProperties hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v15 = 2654435761 * self->_warmingUp;
  }
  else {
    uint64_t v15 = 0;
  }
  return v28 ^ v29 ^ v27 ^ v26 ^ v25 ^ v24 ^ (2654435761 * authenticated) ^ v22 ^ (2654435761 * active) ^ (2654435761 * visible) ^ (2654435761 * supportsAuthentication) ^ v20 ^ v18 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ [(NSString *)self->_modificationID hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  accountType = self->_accountType;
  uint64_t v6 = *((void *)v4 + 2);
  if (accountType)
  {
    if (v6) {
      -[ACProtobufAccountType mergeFrom:](accountType, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[ACProtobufAccount setAccountType:](self, "setAccountType:");
  }
  credential = self->_credential;
  uint64_t v8 = *((void *)v4 + 4);
  if (credential)
  {
    if (v8) {
      -[ACProtobufAccountCredential mergeFrom:](credential, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[ACProtobufAccount setCredential:](self, "setCredential:");
  }
  if (*((void *)v4 + 12)) {
    -[ACProtobufAccount setIdentifier:](self, "setIdentifier:");
  }
  if (*((void *)v4 + 1)) {
    -[ACProtobufAccount setAccountDescription:](self, "setAccountDescription:");
  }
  if (*((void *)v4 + 20)) {
    -[ACProtobufAccount setUsername:](self, "setUsername:");
  }
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v9 = *((id *)v4 + 18);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v76 objects:v86 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v77 != v12) {
          objc_enumerationMutation(v9);
        }
        [(ACProtobufAccount *)self addProperties:*(void *)(*((void *)&v76 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v76 objects:v86 count:16];
    }
    while (v11);
  }

  self->_BOOL authenticated = *((unsigned char *)v4 + 169);
  lastCredentialRenewalRejectionDate = self->_lastCredentialRenewalRejectionDate;
  uint64_t v15 = *((void *)v4 + 13);
  if (lastCredentialRenewalRejectionDate)
  {
    if (v15) {
      -[ACProtobufDate mergeFrom:](lastCredentialRenewalRejectionDate, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[ACProtobufAccount setLastCredentialRenewalRejectionDate:](self, "setLastCredentialRenewalRejectionDate:");
  }
  self->_BOOL active = *((unsigned char *)v4 + 168);
  self->_BOOL visible = *((unsigned char *)v4 + 171);
  self->_supportsAuthenticatiouint64_t n = *((unsigned char *)v4 + 170);
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v16 = *((id *)v4 + 6);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v72 objects:v85 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v73;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v73 != v19) {
          objc_enumerationMutation(v16);
        }
        [(ACProtobufAccount *)self addDataclassProperties:*(void *)(*((void *)&v72 + 1) + 8 * j)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v72 objects:v85 count:16];
    }
    while (v18);
  }

  objectID = self->_objectID;
  uint64_t v22 = *((void *)v4 + 15);
  if (objectID)
  {
    if (v22) {
      -[ACProtobufURL mergeFrom:](objectID, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[ACProtobufAccount setObjectID:](self, "setObjectID:");
  }
  parentAccount = self->_parentAccount;
  uint64_t v24 = *((void *)v4 + 17);
  if (parentAccount)
  {
    if (v24) {
      -[ACProtobufAccount mergeFrom:](parentAccount, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[ACProtobufAccount setParentAccount:](self, "setParentAccount:");
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v25 = *((id *)v4 + 11);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v68 objects:v84 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v69;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v69 != v28) {
          objc_enumerationMutation(v25);
        }
        [(ACProtobufAccount *)self addEnabledDataclasses:*(void *)(*((void *)&v68 + 1) + 8 * k)];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v68 objects:v84 count:16];
    }
    while (v27);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v30 = *((id *)v4 + 19);
  uint64_t v31 = [v30 countByEnumeratingWithState:&v64 objects:v83 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v65;
    do
    {
      for (uint64_t m = 0; m != v32; ++m)
      {
        if (*(void *)v65 != v33) {
          objc_enumerationMutation(v30);
        }
        [(ACProtobufAccount *)self addProvisionedDataclasses:*(void *)(*((void *)&v64 + 1) + 8 * m)];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v64 objects:v83 count:16];
    }
    while (v32);
  }

  if (*((void *)v4 + 3)) {
    -[ACProtobufAccount setAuthenticationType:](self, "setAuthenticationType:");
  }
  if (*((void *)v4 + 5)) {
    -[ACProtobufAccount setCredentialType:](self, "setCredentialType:");
  }
  date = self->_date;
  uint64_t v36 = *((void *)v4 + 7);
  if (date)
  {
    if (v36) {
      -[ACProtobufDate mergeFrom:](date, "mergeFrom:");
    }
  }
  else if (v36)
  {
    -[ACProtobufAccount setDate:](self, "setDate:");
  }
  if (*((void *)v4 + 16)) {
    -[ACProtobufAccount setOwningBundleID:](self, "setOwningBundleID:");
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v37 = *((id *)v4 + 10);
  uint64_t v38 = [v37 countByEnumeratingWithState:&v60 objects:v82 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v61;
    do
    {
      for (uint64_t n = 0; n != v39; ++n)
      {
        if (*(void *)v61 != v40) {
          objc_enumerationMutation(v37);
        }
        [(ACProtobufAccount *)self addDirtyProperties:*(void *)(*((void *)&v60 + 1) + 8 * n)];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v60 objects:v82 count:16];
    }
    while (v39);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v42 = *((id *)v4 + 8);
  uint64_t v43 = [v42 countByEnumeratingWithState:&v56 objects:v81 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v57;
    do
    {
      for (iuint64_t i = 0; ii != v44; ++ii)
      {
        if (*(void *)v57 != v45) {
          objc_enumerationMutation(v42);
        }
        [(ACProtobufAccount *)self addDirtyAccountProperties:*(void *)(*((void *)&v56 + 1) + 8 * ii)];
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v56 objects:v81 count:16];
    }
    while (v44);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v47 = *((id *)v4 + 9);
  uint64_t v48 = [v47 countByEnumeratingWithState:&v52 objects:v80 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v53;
    do
    {
      for (juint64_t j = 0; jj != v49; ++jj)
      {
        if (*(void *)v53 != v50) {
          objc_enumerationMutation(v47);
        }
        -[ACProtobufAccount addDirtyDataclassProperties:](self, "addDirtyDataclassProperties:", *(void *)(*((void *)&v52 + 1) + 8 * jj), (void)v52);
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v52 objects:v80 count:16];
    }
    while (v49);
  }

  if (*((unsigned char *)v4 + 176))
  {
    self->_warmingUp = *((unsigned char *)v4 + 172);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 14)) {
    -[ACProtobufAccount setModificationID:](self, "setModificationID:");
  }
}

- (ACProtobufAccountType)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(id)a3
{
}

- (ACProtobufAccountCredential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)accountDescription
{
  return self->_accountDescription;
}

- (void)setAccountDescription:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSMutableArray)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_BOOL authenticated = a3;
}

- (ACProtobufDate)lastCredentialRenewalRejectionDate
{
  return self->_lastCredentialRenewalRejectionDate;
}

- (void)setLastCredentialRenewalRejectionDate:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_BOOL active = a3;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_BOOL visible = a3;
}

- (BOOL)supportsAuthentication
{
  return self->_supportsAuthentication;
}

- (void)setSupportsAuthentication:(BOOL)a3
{
  self->_supportsAuthenticatiouint64_t n = a3;
}

- (NSMutableArray)dataclassProperties
{
  return self->_dataclassProperties;
}

- (void)setDataclassProperties:(id)a3
{
}

- (ACProtobufURL)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
}

- (ACProtobufAccount)parentAccount
{
  return self->_parentAccount;
}

- (void)setParentAccount:(id)a3
{
}

- (NSMutableArray)enabledDataclasses
{
  return self->_enabledDataclasses;
}

- (void)setEnabledDataclasses:(id)a3
{
}

- (NSMutableArray)provisionedDataclasses
{
  return self->_provisionedDataclasses;
}

- (void)setProvisionedDataclasses:(id)a3
{
}

- (NSString)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(id)a3
{
}

- (NSString)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(id)a3
{
}

- (ACProtobufDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSString)owningBundleID
{
  return self->_owningBundleID;
}

- (void)setOwningBundleID:(id)a3
{
}

- (NSMutableArray)dirtyProperties
{
  return self->_dirtyProperties;
}

- (void)setDirtyProperties:(id)a3
{
}

- (NSMutableArray)dirtyAccountProperties
{
  return self->_dirtyAccountProperties;
}

- (void)setDirtyAccountProperties:(id)a3
{
}

- (NSMutableArray)dirtyDataclassProperties
{
  return self->_dirtyDataclassProperties;
}

- (void)setDirtyDataclassProperties:(id)a3
{
}

- (BOOL)warmingUp
{
  return self->_warmingUp;
}

- (NSString)modificationID
{
  return self->_modificationID;
}

- (void)setModificationID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_provisionedDataclasses, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_parentAccount, 0);
  objc_storeStrong((id *)&self->_owningBundleID, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_modificationID, 0);
  objc_storeStrong((id *)&self->_lastCredentialRenewalRejectionDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_enabledDataclasses, 0);
  objc_storeStrong((id *)&self->_dirtyProperties, 0);
  objc_storeStrong((id *)&self->_dirtyDataclassProperties, 0);
  objc_storeStrong((id *)&self->_dirtyAccountProperties, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_dataclassProperties, 0);
  objc_storeStrong((id *)&self->_credentialType, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_authenticationType, 0);
  objc_storeStrong((id *)&self->_accountType, 0);

  objc_storeStrong((id *)&self->_accountDescription, 0);
}

- (void)setPropertiesDictionary:(id)a3
{
  id v4 = a3;
  [(ACProtobufAccount *)self clearProperties];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__ACProtobufAccount_Helpers__setPropertiesDictionary___block_invoke;
  v5[3] = &unk_1E5BCEC88;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __54__ACProtobufAccount_Helpers__setPropertiesDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [[ACProtobufVariableKeyValuePair alloc] initWithObjectValue:v5 forKey:v6];

  [*(id *)(a1 + 32) addProperties:v7];
}

- (NSDictionary)propertiesDictionary
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[ACProtobufAccount propertiesCount](self, "propertiesCount"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(ACProtobufAccount *)self properties];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [v9 value];
        uint64_t v11 = [v10 object];
        uint64_t v12 = [v9 key];
        [v3 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (void)setDataclassPropertiesDictionary:(id)a3
{
  id v4 = a3;
  [(ACProtobufAccount *)self clearDataclassProperties];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__ACProtobufAccount_Helpers__setDataclassPropertiesDictionary___block_invoke;
  v5[3] = &unk_1E5BCEC88;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __63__ACProtobufAccount_Helpers__setDataclassPropertiesDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [[ACProtobufVariableKeyValuePair alloc] initWithObjectValue:v5 forKey:v6];

  [*(id *)(a1 + 32) addDataclassProperties:v7];
}

- (NSDictionary)dataclassPropertiesDictionary
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[ACProtobufAccount dataclassPropertiesCount](self, "dataclassPropertiesCount"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(ACProtobufAccount *)self dataclassProperties];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [v9 value];
        uint64_t v11 = [v10 object];
        uint64_t v12 = [v9 key];
        [v3 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

@end