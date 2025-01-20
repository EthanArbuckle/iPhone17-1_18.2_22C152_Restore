@interface ACAccount
+ (BOOL)supportsSecureCoding;
+ (id)keypathsRequiredForInitialization;
- (ACAccount)displayAccount;
- (ACAccount)init;
- (ACAccount)initWithAccountType:(ACAccountType *)type;
- (ACAccount)initWithCoder:(id)a3;
- (ACAccount)initWithManagedAccount:(id)a3;
- (ACAccount)initWithManagedAccount:(id)a3 accountStore:(id)a4;
- (ACAccount)parentAccount;
- (ACAccountCredential)credential;
- (ACAccountCredential)internalCredential;
- (ACAccountStore)accountStore;
- (ACAccountType)accountType;
- (ACTrackedSet)trackedEnabledDataclasses;
- (ACTrackedSet)trackedProvisionedDataclasses;
- (BOOL)_isDifferentFrom:(id)a3;
- (BOOL)_useParentForCredentials;
- (BOOL)addClientToken:(id)a3;
- (BOOL)correctPersonaScopedForAccount;
- (BOOL)isActive;
- (BOOL)isAuthenticated;
- (BOOL)isDataSeparatedAccount;
- (BOOL)isDirty;
- (BOOL)isEnabledForDataclass:(id)a3;
- (BOOL)isEnabledToSyncDataclass:(id)a3;
- (BOOL)isPropertyDirty:(id)a3;
- (BOOL)isProvisionedForDataclass:(id)a3;
- (BOOL)isVisible;
- (BOOL)isWarmingUp;
- (BOOL)supportsAuthentication;
- (BOOL)supportsPush;
- (BOOL)wasEnabledDataclassesReset;
- (BOOL)wasProvisionedDataclassesReset;
- (NSArray)childAccounts;
- (NSDate)creationDate;
- (NSDate)lastCredentialRenewalRejectionDate;
- (NSDictionary)accountProperties;
- (NSDictionary)dataclassProperties;
- (NSMutableSet)enabledDataclasses;
- (NSMutableSet)provisionedDataclasses;
- (NSSet)dirtyAccountProperties;
- (NSSet)dirtyDataclassProperties;
- (NSSet)dirtyProperties;
- (NSString)accountDescription;
- (NSString)authenticationType;
- (NSString)clientToken;
- (NSString)credentialType;
- (NSString)description;
- (NSString)identifier;
- (NSString)managingOwnerIdentifier;
- (NSString)managingSourceName;
- (NSString)modificationID;
- (NSString)parentAccountIdentifier;
- (NSString)shortDebugName;
- (NSString)userFullName;
- (NSString)username;
- (NSURL)objectID;
- (__SecIdentity)copySecIdentity;
- (id)_encodeProtobuf;
- (id)_encodeProtobufData;
- (id)_initWithProtobuf:(id)a3;
- (id)_initWithProtobufData:(id)a3;
- (id)accountByCleaningThirdPartyTransformations;
- (id)accountPropertiesTransformer;
- (id)accountPropertyForKey:(id)a3;
- (id)changeTypeForEnabledDataclass:(id)a3;
- (id)changeTypeForProvisionedDataclass:(id)a3;
- (id)childAccountsWithAccountTypeIdentifier:(id)a3;
- (id)childCardDAVAccountIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)credentialWithError:(id *)a3;
- (id)defaultAutodiscoverDomainForChildType:(id)a3;
- (id)fullDescription;
- (id)owningBundleID;
- (id)personaIdentifier;
- (id)portableCopy;
- (id)propertiesForDataclass:(id)a3;
- (id)qualifiedUsername;
- (id)secCertificates;
- (unint64_t)credentialLocation;
- (unint64_t)notifyGenerationID;
- (void)_applyDirtyStateFromAccount:(id)a3;
- (void)_clearCachedChildAccounts;
- (void)_clearCachedCredentials;
- (void)_clearCachedTrackedSets;
- (void)_clearDirtyProperties;
- (void)_installCredentialsChangedObserver;
- (void)_loadAllCachedProperties;
- (void)_markAccountPropertyDirty:(id)a3;
- (void)_markCredentialDirty;
- (void)_markDataclassPropertyDirty:(id)a3;
- (void)_markPropertyDirty:(id)a3;
- (void)_resetParentAccount:(id)a3;
- (void)_setAccountStore:(id)a3;
- (void)_setModID:(id)a3;
- (void)_setObjectID:(id)a3;
- (void)_unsafe_loadEnabledDataclasses;
- (void)_unsafe_loadProvisionedDataclasses;
- (void)_unsafe_markAccountPropertyDirty:(id)a3;
- (void)_unsafe_markDataclassPropertyDirty:(id)a3;
- (void)_unsafe_markPropertyDirty:(id)a3;
- (void)correctPersonaScopedForAccount;
- (void)credentialsChanged:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)isDataSeparatedAccount;
- (void)markAllPropertiesDirty;
- (void)qualifiedUsername;
- (void)refresh;
- (void)reload;
- (void)setAccountDescription:(NSString *)accountDescription;
- (void)setAccountProperties:(id)a3;
- (void)setAccountPropertiesTransformer:(id)a3;
- (void)setAccountProperty:(id)a3 forKey:(id)a4;
- (void)setAccountType:(ACAccountType *)accountType;
- (void)setActive:(BOOL)a3;
- (void)setAuthenticated:(BOOL)a3;
- (void)setAuthenticationType:(id)a3;
- (void)setChildCardDAVAccountIdentifier:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setCredential:(ACAccountCredential *)credential;
- (void)setCredentialLocation:(unint64_t)a3;
- (void)setCredentialType:(id)a3;
- (void)setDataclassProperties:(id)a3;
- (void)setDirty:(BOOL)a3 forProperty:(id)a4;
- (void)setEnabled:(BOOL)a3 forDataclass:(id)a4;
- (void)setEnabledDataclasses:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastCredentialRenewalRejectionDate:(id)a3;
- (void)setManagingOwnerIdentifier:(id)a3;
- (void)setManagingSourceName:(id)a3;
- (void)setOwningBundleID:(id)a3;
- (void)setParentAccount:(id)a3;
- (void)setProperties:(id)a3 forDataclass:(id)a4;
- (void)setProvisioned:(BOOL)a3 forDataclass:(id)a4;
- (void)setProvisionedDataclasses:(id)a3;
- (void)setSecCertificates:(id)a3;
- (void)setSecIdentity:(__SecIdentity *)a3;
- (void)setSupportsAuthentication:(BOOL)a3;
- (void)setTrackedEnabledDataclasses:(id)a3;
- (void)setTrackedProvisionedDataclasses:(id)a3;
- (void)setUsername:(NSString *)username;
- (void)setVisible:(BOOL)a3;
- (void)setWarmingUp:(BOOL)a3;
- (void)takeValuesFromModifiedAccount:(id)a3;
@end

@implementation ACAccount

- (id)accountPropertyForKey:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(NSMutableDictionary *)v5->_properties objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)(id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_sync_enter(v5);
  v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(ACAccountType *)v6->_accountType copyWithZone:a3];
  id v8 = v5[9];
  v5[9] = (id)v7;

  uint64_t v9 = [(ACAccountCredential *)v6->_credential copyWithZone:a3];
  id v10 = v5[10];
  v5[10] = (id)v9;

  uint64_t v11 = [(NSString *)v6->_identifier copyWithZone:a3];
  id v12 = v5[2];
  v5[2] = (id)v11;

  uint64_t v13 = [(NSString *)v6->_accountDescription copyWithZone:a3];
  id v14 = v5[3];
  v5[3] = (id)v13;

  uint64_t v15 = [(NSString *)v6->_username copyWithZone:a3];
  id v16 = v5[5];
  v5[5] = (id)v15;

  uint64_t v17 = [(NSMutableDictionary *)v6->_properties mutableCopyWithZone:a3];
  id v18 = v5[11];
  v5[11] = (id)v17;

  *((unsigned char *)v5 + 210) = v6->_authenticated;
  uint64_t v19 = [(NSDate *)v6->_lastCredentialRenewalRejectionDate copyWithZone:a3];
  id v20 = v5[15];
  v5[15] = (id)v19;

  *((unsigned char *)v5 + 211) = v6->_active;
  *((unsigned char *)v5 + 212) = v6->_warmingUp;
  *((unsigned char *)v5 + 214) = v6->_visible;
  *((unsigned char *)v5 + 213) = v6->_supportsAuthentication;
  uint64_t v21 = [(NSMutableDictionary *)v6->_dataclassProperties mutableCopyWithZone:a3];
  id v22 = v5[12];
  v5[12] = (id)v21;

  uint64_t v23 = [(NSURL *)v6->_objectID copyWithZone:a3];
  id v24 = v5[13];
  v5[13] = (id)v23;

  uint64_t v25 = [(ACAccount *)v6->_parentAccount copyWithZone:a3];
  id v26 = v5[17];
  v5[17] = (id)v25;

  uint64_t v27 = [(ACTrackedSet *)v6->_trackedProvisionedDataclasses mutableCopyWithZone:a3];
  id v28 = v5[19];
  v5[19] = (id)v27;

  *((unsigned char *)v5 + 216) = v6->_wasProvisionedDataclassesReset;
  uint64_t v29 = [(ACTrackedSet *)v6->_trackedEnabledDataclasses mutableCopyWithZone:a3];
  id v30 = v5[20];
  v5[20] = (id)v29;

  *((unsigned char *)v5 + 217) = v6->_wasEnabledDataclassesReset;
  uint64_t v31 = [(NSString *)v6->_authenticationType copyWithZone:a3];
  id v32 = v5[6];
  v5[6] = (id)v31;

  uint64_t v33 = [(NSString *)v6->_credentialType copyWithZone:a3];
  id v34 = v5[7];
  v5[7] = (id)v33;

  uint64_t v35 = [(NSString *)v6->_owningBundleID copyWithZone:a3];
  id v36 = v5[4];
  v5[4] = (id)v35;

  uint64_t v37 = [(NSMutableSet *)v6->_dirtyProperties mutableCopyWithZone:a3];
  id v38 = v5[21];
  v5[21] = (id)v37;

  uint64_t v39 = [(NSMutableSet *)v6->_dirtyAccountProperties mutableCopyWithZone:a3];
  id v40 = v5[22];
  v5[22] = (id)v39;

  uint64_t v41 = [(NSMutableSet *)v6->_dirtyDataclassProperties mutableCopyWithZone:a3];
  id v42 = v5[23];
  v5[23] = (id)v41;

  uint64_t v43 = [(NSDate *)v6->_date copyWithZone:a3];
  id v44 = v5[14];
  v5[14] = (id)v43;

  id WeakRetained = objc_loadWeakRetained((id *)&v6->_accountStore);
  objc_storeWeak(v5 + 1, WeakRetained);

  *((unsigned char *)v5 + 209) = v6->_accountAccessAvailable;
  uint64_t v46 = [(ACAccount *)v6->_parentAccount copyWithZone:a3];
  id v47 = v5[17];
  v5[17] = (id)v46;

  *((unsigned char *)v5 + 215) = v6->_haveCheckedForChildAccounts;
  uint64_t v48 = [(NSArray *)v6->_childAccounts copyWithZone:a3];
  id v49 = v5[18];
  v5[18] = (id)v48;

  uint64_t v50 = [v6->_accountPropertiesTransformer copyWithZone:a3];
  id v51 = v5[25];
  v5[25] = (id)v50;

  uint64_t v52 = [(NSString *)v6->_modificationID copyWithZone:a3];
  id v53 = v5[16];
  v5[16] = (id)v52;

  if (v5[10]) {
    [v5 _installCredentialsChangedObserver];
  }
  objc_sync_exit(v6);

  objc_sync_exit(v5);
  return v5;
}

- (ACAccount)initWithAccountType:(ACAccountType *)type
{
  v5 = type;
  v11.receiver = self;
  v11.super_class = (Class)ACAccount;
  v6 = [(ACAccount *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v8 = [v7 UUIDString];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    objc_storeStrong((id *)&v6->_accountType, type);
    *(_WORD *)&v6->_authenticated = 256;
    v6->_visible = 1;
    v6->_supportsAuthentication = [(ACAccountType *)v5 supportsAuthentication] != 0;
    v6->_warmingUp = 0;
    [(ACAccount *)v6 _unsafe_markPropertyDirty:@"identifier"];
    [(ACAccount *)v6 _unsafe_markPropertyDirty:@"accountType"];
    [(ACAccount *)v6 _unsafe_markPropertyDirty:@"active"];
    [(ACAccount *)v6 _unsafe_markPropertyDirty:@"supportsAuthentication"];
    [(ACAccount *)v6 _unsafe_markPropertyDirty:@"visible"];
    [(ACAccount *)v6 _unsafe_markPropertyDirty:@"authenticated"];
  }

  return v6;
}

- (void)_unsafe_markPropertyDirty:(id)a3
{
  id v4 = a3;
  dirtyProperties = self->_dirtyProperties;
  id v8 = v4;
  if (!dirtyProperties)
  {
    v6 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    uint64_t v7 = self->_dirtyProperties;
    self->_dirtyProperties = v6;

    id v4 = v8;
    dirtyProperties = self->_dirtyProperties;
  }
  [(NSMutableSet *)dirtyProperties addObject:v4];
}

- (ACAccount)init
{
  return [(ACAccount *)self initWithAccountType:0];
}

- (unint64_t)notifyGenerationID
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(NSString *)v2->_modificationID hash];
  uint64_t v4 = [(ACAccount *)v2->_parentAccount notifyGenerationID];
  if ((unint64_t)(v4 + v3) <= 1) {
    unint64_t v5 = 2;
  }
  else {
    unint64_t v5 = v4 + v3;
  }
  objc_sync_exit(v2);

  return v5;
}

- (void)_setAccountStore:(id)a3
{
  id obj = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  objc_storeWeak((id *)&v4->_accountStore, obj);
  [(ACAccountType *)v4->_accountType setAccountStore:obj];
  parentAccount = v4->_parentAccount;
  if (parentAccount) {
    [(ACAccount *)parentAccount _setAccountStore:obj];
  }
  objc_sync_exit(v4);
}

- (void)_clearCachedTrackedSets
{
  id obj = self;
  objc_sync_enter(obj);
  trackedProvisionedDataclasses = obj->_trackedProvisionedDataclasses;
  obj->_trackedProvisionedDataclasses = 0;

  trackedEnabledDataclasses = obj->_trackedEnabledDataclasses;
  obj->_trackedEnabledDataclasses = 0;

  objc_sync_exit(obj);
}

- (void)_clearCachedCredentials
{
  id obj = self;
  objc_sync_enter(obj);
  credential = obj->_credential;
  obj->_credential = 0;

  objc_sync_exit(obj);
}

- (void)_clearCachedChildAccounts
{
  id obj = self;
  objc_sync_enter(obj);
  childAccounts = obj->_childAccounts;
  obj->_childAccounts = 0;

  obj->_haveCheckedForChildAccounts = 0;
  objc_sync_exit(obj);
}

- (void)dealloc
{
  if (self->_credentialsDidChangeObserver)
  {
    uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_credentialsDidChangeObserver];
  }
  v4.receiver = self;
  v4.super_class = (Class)ACAccount;
  [(ACAccount *)&v4 dealloc];
}

- (void)reload
{
  uint64_t v3 = [(ACAccount *)self accountStore];
  objc_super v4 = [(ACAccount *)self identifier];
  id v49 = [v3 accountWithIdentifier:v4];

  unint64_t v5 = v49;
  if (v49)
  {
    v6 = self;
    objc_sync_enter(v6);
    uint64_t v7 = [v49 accountDescription];
    uint64_t v8 = [v7 copy];
    accountDescription = v6->_accountDescription;
    v6->_accountDescription = (NSString *)v8;

    id v10 = [v49 username];
    uint64_t v11 = [v10 copy];
    username = v6->_username;
    v6->_username = (NSString *)v11;

    [(ACAccount *)v6 willChangeValueForKey:@"accountProperties"];
    uint64_t v13 = [v49 accountProperties];
    uint64_t v14 = [v13 mutableCopy];
    properties = v6->_properties;
    v6->_properties = (NSMutableDictionary *)v14;

    [(ACAccount *)v6 didChangeValueForKey:@"accountProperties"];
    id v16 = [v49 owningBundleID];
    uint64_t v17 = [v16 copy];
    owningBundleID = v6->_owningBundleID;
    v6->_owningBundleID = (NSString *)v17;

    [(ACAccount *)v6 willChangeValueForKey:@"dataclassProperties"];
    uint64_t v19 = [v49 dataclassProperties];
    uint64_t v20 = [v19 mutableCopy];
    dataclassProperties = v6->_dataclassProperties;
    v6->_dataclassProperties = (NSMutableDictionary *)v20;

    [(ACAccount *)v6 didChangeValueForKey:@"dataclassProperties"];
    v6->_authenticated = [v49 isAuthenticated];
    uint64_t v22 = [v49 lastCredentialRenewalRejectionDate];
    lastCredentialRenewalRejectionDate = v6->_lastCredentialRenewalRejectionDate;
    v6->_lastCredentialRenewalRejectionDate = (NSDate *)v22;

    v6->_active = [v49 isActive];
    v6->_warmingUp = [v49 isWarmingUp];
    id v24 = [v49 objectID];
    uint64_t v25 = [v24 copy];
    objectID = v6->_objectID;
    v6->_objectID = (NSURL *)v25;

    uint64_t v27 = [v49 accountType];
    uint64_t v28 = [v27 copy];
    accountType = v6->_accountType;
    v6->_accountType = (ACAccountType *)v28;

    id v30 = [v49 credentialType];
    uint64_t v31 = [v30 copy];
    credentialType = v6->_credentialType;
    v6->_credentialType = (NSString *)v31;

    uint64_t v33 = [v49 authenticationType];
    uint64_t v34 = [v33 copy];
    authenticationType = v6->_authenticationType;
    v6->_authenticationType = (NSString *)v34;

    credential = v6->_credential;
    v6->_credential = 0;

    uint64_t v37 = [v49 parentAccount];
    uint64_t v38 = [v37 copy];
    parentAccount = v6->_parentAccount;
    v6->_parentAccount = (ACAccount *)v38;

    v6->_haveCheckedForChildAccounts = 0;
    childAccounts = v6->_childAccounts;
    v6->_childAccounts = 0;

    trackedProvisionedDataclasses = v6->_trackedProvisionedDataclasses;
    v6->_trackedProvisionedDataclasses = 0;

    v6->_wasProvisionedDataclassesReset = 0;
    trackedEnabledDataclasses = v6->_trackedEnabledDataclasses;
    v6->_trackedEnabledDataclasses = 0;

    v6->_wasEnabledDataclassesReset = 0;
    uint64_t v43 = [v49 modificationID];
    uint64_t v44 = [v43 copy];
    modificationID = v6->_modificationID;
    v6->_modificationID = (NSString *)v44;

    dirtyProperties = v6->_dirtyProperties;
    v6->_dirtyProperties = 0;

    dirtyAccountProperties = v6->_dirtyAccountProperties;
    v6->_dirtyAccountProperties = 0;

    dirtyDataclassProperties = v6->_dirtyDataclassProperties;
    v6->_dirtyDataclassProperties = 0;

    objc_sync_exit(v6);
    unint64_t v5 = v49;
  }
}

- (NSString)identifier
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_identifier;
  objc_sync_exit(v2);

  return v3;
}

- (ACAccountType)accountType
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_accountType;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isActive
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL active = v2->_active;
  objc_sync_exit(v2);

  return active;
}

- (ACAccount)initWithManagedAccount:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v60 = a3;
  v65.receiver = self;
  v65.super_class = (Class)ACAccount;
  objc_super v4 = [(ACAccount *)&v65 init];
  if (!v4)
  {
LABEL_20:
    objc_super v4 = v4;
    id v53 = v4;
    goto LABEL_24;
  }
  unint64_t v5 = [v60 accountType];
  if (v5)
  {
    v6 = [v60 identifier];
    BOOL v7 = v6 == 0;

    if (!v7)
    {
      uint64_t v8 = [ACAccountType alloc];
      uint64_t v9 = [v60 accountType];
      uint64_t v10 = [(ACAccountType *)v8 initWithManagedAccountType:v9];
      accountType = v4->_accountType;
      v4->_accountType = (ACAccountType *)v10;

      uint64_t v12 = [v60 identifier];
      identifier = v4->_identifier;
      v4->_identifier = (NSString *)v12;

      uint64_t v14 = [v60 accountDescription];
      accountDescription = v4->_accountDescription;
      v4->_accountDescription = (NSString *)v14;

      uint64_t v16 = [v60 username];
      username = v4->_username;
      v4->_username = (NSString *)v16;

      id v18 = [v60 authenticated];
      v4->_authenticated = [v18 BOOLValue];

      uint64_t v19 = [v60 lastCredentialRenewalRejectionDate];
      lastCredentialRenewalRejectionDate = v4->_lastCredentialRenewalRejectionDate;
      v4->_lastCredentialRenewalRejectionDate = (NSDate *)v19;

      uint64_t v21 = [v60 active];
      v4->_BOOL active = [v21 BOOLValue];

      uint64_t v22 = [v60 warmingUp];
      v4->_warmingUp = [v22 BOOLValue];

      uint64_t v23 = [v60 visible];
      v4->_visible = [v23 BOOLValue];

      id v24 = [v60 supportsAuthentication];
      v4->_supportsAuthentication = [v24 BOOLValue];

      uint64_t v25 = [v60 objectID];
      uint64_t v26 = [v25 URIRepresentation];
      objectID = v4->_objectID;
      v4->_objectID = (NSURL *)v26;

      uint64_t v28 = [v60 authenticationType];
      authenticationType = v4->_authenticationType;
      v4->_authenticationType = (NSString *)v28;

      uint64_t v30 = [v60 credentialType];
      credentialType = v4->_credentialType;
      v4->_credentialType = (NSString *)v30;

      uint64_t v32 = [v60 date];
      date = v4->_date;
      v4->_date = (NSDate *)v32;

      uint64_t v34 = [v60 owningBundleID];
      owningBundleID = v4->_owningBundleID;
      v4->_owningBundleID = (NSString *)v34;

      uint64_t v36 = [v60 modificationID];
      modificationID = v4->_modificationID;
      v4->_modificationID = (NSString *)v36;

      uint64_t v38 = v60;
      uint64_t v58 = [v60 parentAccount];
      if (v58)
      {
        uint64_t v39 = [[ACAccount alloc] initWithManagedAccount:v58];
        parentAccount = v4->_parentAccount;
        v4->_parentAccount = v39;

        uint64_t v38 = v60;
      }
      uint64_t v41 = objc_msgSend(v38, "dataclassProperties", v58);
      uint64_t v42 = [v41 mutableCopy];
      dataclassProperties = v4->_dataclassProperties;
      v4->_dataclassProperties = (NSMutableDictionary *)v42;

      id v44 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      v45 = [v60 customProperties];
      uint64_t v46 = [v45 countByEnumeratingWithState:&v61 objects:v66 count:16];
      if (v46)
      {
        uint64_t v47 = *(void *)v62;
        do
        {
          for (uint64_t i = 0; i != v46; ++i)
          {
            if (*(void *)v62 != v47) {
              objc_enumerationMutation(v45);
            }
            id v49 = *(void **)(*((void *)&v61 + 1) + 8 * i);
            uint64_t v50 = [v49 value];
            if (v50)
            {
              id v51 = [v49 key];
              [v44 setObject:v50 forKey:v51];
            }
            else
            {
              id v51 = _ACLogSystem();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              {
                uint64_t v52 = [v49 key];
                -[ACAccount initWithManagedAccount:](v52, buf, &v68, v51);
              }
            }
          }
          uint64_t v46 = [v45 countByEnumeratingWithState:&v61 objects:v66 count:16];
        }
        while (v46);
      }

      if ([v44 count]) {
        objc_storeStrong((id *)&v4->_properties, v44);
      }

      goto LABEL_20;
    }
  }
  v54 = _ACLogSystem();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
  {
    v56 = [v60 accountType];
    v57 = [v60 identifier];
    *(_DWORD *)buf = 138412802;
    id v68 = v60;
    __int16 v69 = 1024;
    BOOL v70 = v56 != 0;
    __int16 v71 = 1024;
    BOOL v72 = v57 != 0;
    _os_log_error_impl(&dword_1A57C5000, v54, OS_LOG_TYPE_ERROR, "\"ACAccount initializer just ran into an account (%@) missing required properties: accountType:%d identifier:%d\"", buf, 0x18u);
  }
  id v53 = 0;
LABEL_24:

  return v53;
}

- (NSString)username
{
  if ([(ACAccount *)self _useParentForCredentials])
  {
    uint64_t v3 = [(ACAccount *)self parentAccount];
    objc_super v4 = [(ACAccount *)v3 username];
  }
  else
  {
    uint64_t v3 = self;
    objc_sync_enter(v3);
    objc_super v4 = v3->_username;
    objc_sync_exit(v3);
  }

  return v4;
}

- (BOOL)_useParentForCredentials
{
  v2 = [(ACAccount *)self authenticationType];
  char v3 = [v2 isEqualToString:@"parent"];

  return v3;
}

- (NSString)authenticationType
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = v2->_authenticationType;
  objc_sync_exit(v2);

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = self;
  objc_sync_enter(v5);
  [v4 encodeObject:v5->_accountType forKey:@"accountType"];
  credential = v5->_credential;
  if (credential) {
    [v4 encodeObject:credential forKey:@"credential"];
  }
  [v4 encodeObject:v5->_identifier forKey:@"identifier"];
  [v4 encodeObject:v5->_accountDescription forKey:@"accountDescription"];
  [v4 encodeObject:v5->_username forKey:@"username"];
  id v7 = [(ACAccount *)v5 accountProperties];
  uint64_t v8 = [(ACAccount *)v5 accountPropertiesTransformer];

  if (v8)
  {
    uint64_t v9 = [(ACAccount *)v5 accountPropertiesTransformer];
    uint64_t v10 = ((void (**)(void, id))v9)[2](v9, v7);

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v10;
    uint64_t v11 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v22;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v7);
          }
          -[ACAccount _markAccountPropertyDirty:](v5, "_markAccountPropertyDirty:", *(void *)(*((void *)&v21 + 1) + 8 * v13++), (void)v21);
        }
        while (v11 != v13);
        uint64_t v11 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }
  }
  objc_msgSend(v4, "encodeObject:forKey:", v7, @"accountProperties", (void)v21);
  uint64_t v14 = [NSNumber numberWithBool:v5->_authenticated];
  [v4 encodeObject:v14 forKey:@"authenticated"];

  [v4 encodeObject:v5->_lastCredentialRenewalRejectionDate forKey:@"lastCredentialRenewalRejectionDate"];
  uint64_t v15 = [NSNumber numberWithBool:v5->_active];
  [v4 encodeObject:v15 forKey:@"active"];

  uint64_t v16 = [NSNumber numberWithBool:v5->_warmingUp];
  [v4 encodeObject:v16 forKey:@"warmingUp"];

  uint64_t v17 = [NSNumber numberWithBool:v5->_visible];
  [v4 encodeObject:v17 forKey:@"visible"];

  id v18 = [NSNumber numberWithBool:v5->_supportsAuthentication];
  [v4 encodeObject:v18 forKey:@"supportsAuthentication"];

  [v4 encodeObject:v5->_dataclassProperties forKey:@"dataclassProperties"];
  [v4 encodeObject:v5->_objectID forKey:@"objectID"];
  [v4 encodeObject:v5->_parentAccount forKey:@"parent"];
  [v4 encodeObject:v5->_trackedProvisionedDataclasses forKey:@"trackedProvisionedDataclasses"];
  [v4 encodeBool:v5->_wasProvisionedDataclassesReset forKey:@"wasProvisionedDataclassesReset"];
  [v4 encodeObject:v5->_trackedEnabledDataclasses forKey:@"trackedEnabledDataclasses"];
  [v4 encodeBool:v5->_wasEnabledDataclassesReset forKey:@"wasEnabledDataclassesReset"];
  [v4 encodeObject:v5->_authenticationType forKey:@"authenticationType"];
  [v4 encodeObject:v5->_credentialType forKey:@"credentialType"];
  [v4 encodeObject:v5->_date forKey:@"date"];
  [v4 encodeObject:v5->_owningBundleID forKey:@"owningBundleID"];
  [v4 encodeObject:v5->_dirtyProperties forKey:@"dirtyProperties"];
  [v4 encodeObject:v5->_dirtyAccountProperties forKey:@"dirtyAccountProperties"];
  [v4 encodeObject:v5->_dirtyDataclassProperties forKey:@"dirtyDataclassProperties"];
  [v4 encodeObject:v5->_modificationID forKey:@"modificationID"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v5->_trackedProvisionedDataclasses)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v19 = [MEMORY[0x1E4F1CAD0] setWithTrackedSet:v5->_trackedProvisionedDataclasses];
        [v4 encodeObject:v19 forKey:@"provisionedDataclasses"];
      }
    }
    if (v5->_trackedEnabledDataclasses)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v20 = [MEMORY[0x1E4F1CAD0] setWithTrackedSet:v5->_trackedEnabledDataclasses];
        [v4 encodeObject:v20 forKey:@"enabledDataclasses"];
      }
    }
  }

  objc_sync_exit(v5);
}

- (NSDictionary)accountProperties
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = v2->_properties;
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (id)accountPropertiesTransformer
{
  return objc_getProperty(self, a2, 200, 1);
}

- (NSString)accountDescription
{
  char v3 = [(ACAccount *)self parentAccount];

  if (v3)
  {
    id v4 = NSString;
    unint64_t v5 = [(ACAccount *)self parentAccount];
    v6 = [(ACAccount *)v5 accountDescription];
    id v7 = [(ACAccount *)self accountType];
    uint64_t v8 = [v7 accountTypeDescription];
    uint64_t v9 = [v4 stringWithFormat:@"%@ - %@", v6, v8];
  }
  else
  {
    unint64_t v5 = self;
    objc_sync_enter(v5);
    uint64_t v9 = v5->_accountDescription;
    objc_sync_exit(v5);
  }

  return v9;
}

- (BOOL)isEnabledForDataclass:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"com.apple.Dataclass.DeviceLocator"])
  {
    unint64_t v5 = _ACLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ACAccount isEnabledForDataclass:]();
    }
  }
  v6 = [(ACAccount *)self enabledDataclasses];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (NSMutableSet)enabledDataclasses
{
  char v3 = [(ACAccount *)self parentAccount];

  if (v3)
  {
    id v4 = [(ACAccount *)self parentAccount];
    unint64_t v5 = [v4 enabledDataclasses];

    v6 = [(ACAccount *)self accountType];
    char v7 = [v6 syncableDataclasses];

    id v8 = (id)[v5 mutableCopy];
    [v8 intersectSet:v7];
  }
  else
  {
    uint64_t v9 = self;
    objc_sync_enter(v9);
    if (v9->_trackedEnabledDataclasses)
    {
      objc_msgSend(MEMORY[0x1E4F1CA80], "setWithTrackedSet:");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = 0;
    }
    objc_sync_exit(v9);

    if (!v8)
    {
      uint64_t v10 = v9;
      objc_sync_enter(v10);
      [(ACAccount *)v10 _unsafe_loadEnabledDataclasses];
      if (v9->_trackedEnabledDataclasses)
      {
        objc_msgSend(MEMORY[0x1E4F1CA80], "setWithTrackedSet:");
        id v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v8 = 0;
      }
      objc_sync_exit(v10);

      if (!v8) {
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      }
    }
  }

  return (NSMutableSet *)v8;
}

- (ACAccount)parentAccount
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = v2->_parentAccount;
  objc_sync_exit(v2);

  return v3;
}

- (ACAccountStore)accountStore
{
  v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_accountStore);

  if (WeakRetained)
  {
    uint64_t v4 = (uint64_t)objc_loadWeakRetained((id *)&v2->_accountStore);
  }
  else
  {
    uint64_t v4 = +[ACAccountStore defaultStore];
  }
  unint64_t v5 = (void *)v4;
  objc_sync_exit(v2);

  return (ACAccountStore *)v5;
}

- (ACAccount)initWithCoder:(id)a3
{
  id v4 = a3;
  v117.receiver = self;
  v117.super_class = (Class)ACAccount;
  unint64_t v5 = [(ACAccount *)&v117 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountType"];
    accountType = v5->_accountType;
    v5->_accountType = (ACAccountType *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credential"];
    credential = v5->_credential;
    v5->_credential = (ACAccountCredential *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    uint64_t v11 = [v10 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountDescription"];
    uint64_t v14 = [v13 copy];
    accountDescription = v5->_accountDescription;
    v5->_accountDescription = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"username"];
    uint64_t v17 = [v16 copy];
    username = v5->_username;
    v5->_username = (NSString *)v17;

    v115 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_msgSend(v115, "setWithObjects:", v19, v20, v21, v22, v23, v24, v25, v26, objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"accountProperties"];
    uint64_t v29 = [v28 mutableCopy];
    properties = v5->_properties;
    v5->_properties = (NSMutableDictionary *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticated"];
    v5->_authenticated = [v31 BOOLValue];

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastCredentialRenewalRejectionDate"];
    lastCredentialRenewalRejectionDate = v5->_lastCredentialRenewalRejectionDate;
    v5->_lastCredentialRenewalRejectionDate = (NSDate *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"active"];
    v5->_BOOL active = [v34 BOOLValue];

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"warmingUp"];
    v5->_warmingUp = [v35 BOOLValue];

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"visible"];
    v5->_visible = [v36 BOOLValue];

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportsAuthentication"];
    v5->_supportsAuthentication = [v37 BOOLValue];

    v116 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v38 = objc_opt_class();
    uint64_t v39 = objc_opt_class();
    uint64_t v40 = objc_opt_class();
    uint64_t v41 = objc_opt_class();
    uint64_t v42 = objc_opt_class();
    uint64_t v43 = objc_opt_class();
    uint64_t v44 = objc_opt_class();
    uint64_t v45 = objc_opt_class();
    uint64_t v46 = objc_msgSend(v116, "setWithObjects:", v38, v39, v40, v41, v42, v43, v44, v45, objc_opt_class(), 0);
    uint64_t v47 = [v4 decodeObjectOfClasses:v46 forKey:@"dataclassProperties"];
    uint64_t v48 = [v47 mutableCopy];
    dataclassProperties = v5->_dataclassProperties;
    v5->_dataclassProperties = (NSMutableDictionary *)v48;

    uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectID"];
    uint64_t v51 = [v50 copy];
    objectID = v5->_objectID;
    v5->_objectID = (NSURL *)v51;

    id v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parent"];
    uint64_t v54 = [v53 copy];
    parentAccount = v5->_parentAccount;
    v5->_parentAccount = (ACAccount *)v54;

    v56 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v57 = objc_opt_class();
    uint64_t v58 = objc_msgSend(v56, "setWithObjects:", v57, objc_opt_class(), 0);
    v59 = [v4 decodeObjectOfClasses:v58 forKey:@"trackedProvisionedDataclasses"];
    uint64_t v60 = [v59 mutableCopy];
    trackedProvisionedDataclasses = v5->_trackedProvisionedDataclasses;
    v5->_trackedProvisionedDataclasses = (ACMutableTrackedSet *)v60;

    v5->_wasProvisionedDataclassesReset = [v4 decodeBoolForKey:@"wasProvisionedDataclassesReset"];
    long long v62 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v63 = objc_opt_class();
    long long v64 = objc_msgSend(v62, "setWithObjects:", v63, objc_opt_class(), 0);
    objc_super v65 = [v4 decodeObjectOfClasses:v64 forKey:@"trackedEnabledDataclasses"];
    uint64_t v66 = [v65 mutableCopy];
    trackedEnabledDataclasses = v5->_trackedEnabledDataclasses;
    v5->_trackedEnabledDataclasses = (ACMutableTrackedSet *)v66;

    v5->_wasEnabledDataclassesReset = [v4 decodeBoolForKey:@"wasEnabledDataclassesReset"];
    id v68 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticationType"];
    uint64_t v69 = [v68 copy];
    authenticationType = v5->_authenticationType;
    v5->_authenticationType = (NSString *)v69;

    __int16 v71 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialType"];
    uint64_t v72 = [v71 copy];
    credentialType = v5->_credentialType;
    v5->_credentialType = (NSString *)v72;

    uint64_t v74 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v74;

    v76 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"owningBundleID"];
    uint64_t v77 = [v76 copy];
    owningBundleID = v5->_owningBundleID;
    v5->_owningBundleID = (NSString *)v77;

    v79 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v80 = objc_opt_class();
    v81 = objc_msgSend(v79, "setWithObjects:", v80, objc_opt_class(), 0);
    uint64_t v82 = [v4 decodeObjectOfClasses:v81 forKey:@"dirtyProperties"];
    dirtyProperties = v5->_dirtyProperties;
    v5->_dirtyProperties = (NSMutableSet *)v82;

    v84 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v85 = objc_opt_class();
    v86 = objc_msgSend(v84, "setWithObjects:", v85, objc_opt_class(), 0);
    uint64_t v87 = [v4 decodeObjectOfClasses:v86 forKey:@"dirtyAccountProperties"];
    dirtyAccountProperties = v5->_dirtyAccountProperties;
    v5->_dirtyAccountProperties = (NSMutableSet *)v87;

    v89 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v90 = objc_opt_class();
    v91 = objc_msgSend(v89, "setWithObjects:", v90, objc_opt_class(), 0);
    uint64_t v92 = [v4 decodeObjectOfClasses:v91 forKey:@"dirtyDataclassProperties"];
    dirtyDataclassProperties = v5->_dirtyDataclassProperties;
    v5->_dirtyDataclassProperties = (NSMutableSet *)v92;

    v94 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modificationID"];
    uint64_t v95 = [v94 copy];
    modificationID = v5->_modificationID;
    v5->_modificationID = (NSString *)v95;

    if (!v5->_trackedProvisionedDataclasses)
    {
      v97 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v98 = objc_opt_class();
      v99 = objc_msgSend(v97, "setWithObjects:", v98, objc_opt_class(), 0);
      v100 = [v4 decodeObjectOfClasses:v99 forKey:@"provisionedDataclasses"];

      if (v100)
      {
        v101 = objc_alloc_init(ACMutableTrackedSet);
        v102 = v5->_trackedProvisionedDataclasses;
        v5->_trackedProvisionedDataclasses = v101;

        v103 = v5->_trackedProvisionedDataclasses;
        v104 = [v100 allObjects];
        [(ACMutableTrackedSet *)v103 addObjectsFromArray:v104];

        v5->_wasProvisionedDataclassesReset = 1;
      }
    }
    if (!v5->_trackedEnabledDataclasses)
    {
      v105 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v106 = objc_opt_class();
      v107 = objc_msgSend(v105, "setWithObjects:", v106, objc_opt_class(), 0);
      v108 = [v4 decodeObjectOfClasses:v107 forKey:@"enabledDataclasses"];

      if (v108)
      {
        v109 = objc_alloc_init(ACMutableTrackedSet);
        v110 = v5->_trackedEnabledDataclasses;
        v5->_trackedEnabledDataclasses = v109;

        v111 = v5->_trackedEnabledDataclasses;
        v112 = [v108 allObjects];
        [(ACMutableTrackedSet *)v111 addObjectsFromArray:v112];

        v5->_wasEnabledDataclassesReset = 1;
      }
    }
    v113 = v5->_credential;
    if (v113)
    {
      [(ACAccountCredential *)v113 _setOwningAccount:v5];
      [(ACAccount *)v5 _installCredentialsChangedObserver];
    }
  }

  return v5;
}

- (BOOL)isAuthenticated
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(ACAccount *)v2 _useParentForCredentials])
  {
    char v3 = [(ACAccount *)v2 parentAccount];
    char authenticated = [v3 isAuthenticated];
  }
  else
  {
    char authenticated = v2->_authenticated;
  }
  objc_sync_exit(v2);

  return authenticated;
}

- (id)owningBundleID
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = v2->_owningBundleID;
  objc_sync_exit(v2);

  return v3;
}

- (NSURL)objectID
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = v2->_objectID;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)modificationID
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = v2->_modificationID;
  objc_sync_exit(v2);

  return v3;
}

- (NSDate)lastCredentialRenewalRejectionDate
{
  if ([(ACAccount *)self _useParentForCredentials])
  {
    char v3 = [(ACAccount *)self parentAccount];
    id v4 = [(ACAccount *)v3 lastCredentialRenewalRejectionDate];
  }
  else
  {
    char v3 = self;
    objc_sync_enter(v3);
    id v4 = v3->_lastCredentialRenewalRejectionDate;
    objc_sync_exit(v3);
  }

  return v4;
}

- (BOOL)isWarmingUp
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL warmingUp = v2->_warmingUp;
  objc_sync_exit(v2);

  return warmingUp;
}

- (NSDictionary)dataclassProperties
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = (void *)[(NSMutableDictionary *)v2->_dataclassProperties copy];
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (NSString)credentialType
{
  if ([(ACAccount *)self _useParentForCredentials])
  {
    char v3 = [(ACAccount *)self parentAccount];
    id v4 = [(ACAccount *)v3 credentialType];
  }
  else
  {
    char v3 = self;
    objc_sync_enter(v3);
    id v4 = v3->_credentialType;
    objc_sync_exit(v3);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accountPropertiesTransformer, 0);
  objc_storeStrong((id *)&self->_credentialsDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_dirtyDataclassProperties, 0);
  objc_storeStrong((id *)&self->_dirtyAccountProperties, 0);
  objc_storeStrong((id *)&self->_dirtyProperties, 0);
  objc_storeStrong((id *)&self->_trackedEnabledDataclasses, 0);
  objc_storeStrong((id *)&self->_trackedProvisionedDataclasses, 0);
  objc_storeStrong((id *)&self->_childAccounts, 0);
  objc_storeStrong((id *)&self->_parentAccount, 0);
  objc_storeStrong((id *)&self->_modificationID, 0);
  objc_storeStrong((id *)&self->_lastCredentialRenewalRejectionDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_dataclassProperties, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_clientToken, 0);
  objc_storeStrong((id *)&self->_credentialType, 0);
  objc_storeStrong((id *)&self->_authenticationType, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_owningBundleID, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_accountStore);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACAccount)initWithManagedAccount:(id)a3 accountStore:(id)a4
{
  id v6 = a4;
  char v7 = [(ACAccount *)self initWithManagedAccount:a3];
  uint64_t v8 = v7;
  if (v7) {
    [(ACAccount *)v7 _setAccountStore:v6];
  }

  return v8;
}

+ (id)keypathsRequiredForInitialization
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"accountType";
  v4[1] = @"customProperties";
  v4[2] = @"parent";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

- (void)_unsafe_loadEnabledDataclasses
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A57C5000, v0, v1, "\"Failed to fetch enabled dataclasses, error: %@\"", v2, v3, v4, v5, v6);
}

- (NSString)parentAccountIdentifier
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(ACAccount *)v2->_parentAccount identifier];
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(ACAccount *)self username];
  uint64_t v5 = [(ACAccount *)self identifier];
  uint8_t v6 = [v3 stringWithFormat:@"%@ (%@)", v4, v5];

  return (NSString *)v6;
}

- (void)_installCredentialsChangedObserver
{
  objc_initWeak(&location, self);
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__ACAccount__installCredentialsChangedObserver__block_invoke;
  v6[3] = &unk_1E5BCCD08;
  objc_copyWeak(&v7, &location);
  uint64_t v4 = [v3 addObserverForName:@"ACAccountCredentialsDidChangeNotification" object:0 queue:0 usingBlock:v6];
  credentialsDidChangeObserver = self->_credentialsDidChangeObserver;
  self->_credentialsDidChangeObserver = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __47__ACAccount__installCredentialsChangedObserver__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained credentialsChanged:v3];
}

- (id)_initWithProtobuf:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [ACAccountType alloc];
  uint8_t v6 = [v4 accountType];
  id v7 = [(ACAccountType *)v5 _initWithProtobuf:v6];

  uint64_t v8 = [(ACAccount *)self initWithAccountType:v7];
  if (v8)
  {
    if ([v4 hasCredential])
    {
      uint64_t v9 = [ACAccountCredential alloc];
      uint64_t v10 = [v4 credential];
      uint64_t v11 = [(ACAccountCredential *)v9 _initWithProtobuf:v10];
      credential = v8->_credential;
      v8->_credential = (ACAccountCredential *)v11;
    }
    uint64_t v13 = [v4 identifier];
    uint64_t v14 = [v13 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v14;

    uint64_t v16 = [v4 accountDescription];
    uint64_t v17 = [v16 copy];
    accountDescription = v8->_accountDescription;
    v8->_accountDescription = (NSString *)v17;

    uint64_t v19 = [v4 username];
    uint64_t v20 = [v19 copy];
    username = v8->_username;
    v8->_username = (NSString *)v20;

    uint64_t v22 = [v4 propertiesDictionary];
    uint64_t v23 = [v22 mutableCopy];
    properties = v8->_properties;
    v8->_properties = (NSMutableDictionary *)v23;

    v8->_char authenticated = [v4 authenticated];
    if ([v4 hasLastCredentialRenewalRejectionDate])
    {
      uint64_t v25 = [v4 lastCredentialRenewalRejectionDate];
      uint64_t v26 = [v25 date];
      lastCredentialRenewalRejectionDate = v8->_lastCredentialRenewalRejectionDate;
      v8->_lastCredentialRenewalRejectionDate = (NSDate *)v26;
    }
    v8->_BOOL active = [v4 active];
    v8->_BOOL warmingUp = [v4 warmingUp];
    v8->_visible = [v4 visible];
    v8->_supportsAuthentication = [v4 supportsAuthentication];
    uint64_t v28 = [v4 dataclassPropertiesDictionary];
    uint64_t v29 = [v28 mutableCopy];
    dataclassProperties = v8->_dataclassProperties;
    v8->_dataclassProperties = (NSMutableDictionary *)v29;

    if ([v4 hasObjectID])
    {
      uint64_t v31 = [v4 objectID];
      uint64_t v32 = [v31 url];
      objectID = v8->_objectID;
      v8->_objectID = (NSURL *)v32;
    }
    if ([v4 hasParentAccount])
    {
      uint64_t v34 = [ACAccount alloc];
      uint64_t v35 = [v4 parentAccount];
      uint64_t v36 = [(ACAccount *)v34 _initWithProtobuf:v35];
      parentAccount = v8->_parentAccount;
      v8->_parentAccount = (ACAccount *)v36;
    }
    uint64_t v38 = objc_alloc_init(ACMutableTrackedSet);
    trackedProvisionedDataclasses = v8->_trackedProvisionedDataclasses;
    v8->_trackedProvisionedDataclasses = v38;

    uint64_t v40 = v8->_trackedProvisionedDataclasses;
    uint64_t v41 = [v4 provisionedDataclasses];
    [(ACMutableTrackedSet *)v40 addObjectsFromArray:v41];

    uint64_t v42 = objc_alloc_init(ACMutableTrackedSet);
    trackedEnabledDataclasses = v8->_trackedEnabledDataclasses;
    v8->_trackedEnabledDataclasses = v42;

    uint64_t v44 = v8->_trackedEnabledDataclasses;
    uint64_t v45 = [v4 enabledDataclasses];
    [(ACMutableTrackedSet *)v44 addObjectsFromArray:v45];

    uint64_t v46 = [v4 authenticationType];
    uint64_t v47 = [v46 copy];
    authenticationType = v8->_authenticationType;
    v8->_authenticationType = (NSString *)v47;

    id v49 = [v4 credentialType];
    uint64_t v50 = [v49 copy];
    credentialType = v8->_credentialType;
    v8->_credentialType = (NSString *)v50;

    uint64_t v52 = [v4 date];
    uint64_t v53 = [v52 date];
    date = v8->_date;
    v8->_date = (NSDate *)v53;

    uint64_t v55 = [v4 owningBundleID];
    owningBundleID = v8->_owningBundleID;
    v8->_owningBundleID = (NSString *)v55;

    uint64_t v57 = [v4 dirtyProperties];

    if (v57)
    {
      id v58 = objc_alloc(MEMORY[0x1E4F1CA80]);
      v59 = [v4 dirtyProperties];
      uint64_t v60 = [v58 initWithArray:v59];
      dirtyProperties = v8->_dirtyProperties;
      v8->_dirtyProperties = (NSMutableSet *)v60;
    }
    long long v62 = [v4 dirtyAccountProperties];

    if (v62)
    {
      id v63 = objc_alloc(MEMORY[0x1E4F1CA80]);
      long long v64 = [v4 dirtyAccountProperties];
      uint64_t v65 = [v63 initWithArray:v64];
      dirtyAccountProperties = v8->_dirtyAccountProperties;
      v8->_dirtyAccountProperties = (NSMutableSet *)v65;
    }
    v67 = [v4 dirtyDataclassProperties];

    if (v67)
    {
      id v68 = objc_alloc(MEMORY[0x1E4F1CA80]);
      uint64_t v69 = [v4 dirtyDataclassProperties];
      uint64_t v70 = [v68 initWithArray:v69];
      dirtyDataclassProperties = v8->_dirtyDataclassProperties;
      v8->_dirtyDataclassProperties = (NSMutableSet *)v70;
    }
    uint64_t v72 = [v4 modificationID];
    modificationID = v8->_modificationID;
    v8->_modificationID = (NSString *)v72;

    uint64_t v74 = v8->_credential;
    if (v74)
    {
      [(ACAccountCredential *)v74 _setOwningAccount:v8];
      [(ACAccount *)v8 _installCredentialsChangedObserver];
    }
    v75 = v8;
  }

  return v8;
}

- (id)_initWithProtobufData:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"ACAccount.m", 471, @"Invalid parameter not satisfying: %@", @"data.length != 0" object file lineNumber description];
  }
  if ([v5 length])
  {
    uint8_t v6 = [[ACProtobufAccount alloc] initWithData:v5];
    if (v6)
    {
      self = (ACAccount *)[(ACAccount *)self _initWithProtobuf:v6];
      id v7 = self;
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_encodeProtobuf
{
  id v3 = objc_opt_new();
  id v4 = [(ACAccountType *)self->_accountType _encodeProtobuf];
  [v3 setAccountType:v4];

  id v5 = [(ACAccountCredential *)self->_credential _encodeProtobuf];
  [v3 setCredential:v5];

  [v3 setIdentifier:self->_identifier];
  [v3 setAccountDescription:self->_accountDescription];
  [v3 setUsername:self->_username];
  if ([(NSMutableDictionary *)self->_properties count]) {
    [v3 setPropertiesDictionary:self->_properties];
  }
  [v3 setAuthenticated:self->_authenticated];
  if (self->_lastCredentialRenewalRejectionDate)
  {
    uint8_t v6 = [[ACProtobufDate alloc] initWithDate:self->_lastCredentialRenewalRejectionDate];
    [v3 setLastCredentialRenewalRejectionDate:v6];
  }
  [v3 setActive:self->_active];
  [v3 setWarmingUp:self->_warmingUp];
  [v3 setVisible:self->_visible];
  [v3 setSupportsAuthentication:self->_supportsAuthentication];
  if ([(NSMutableDictionary *)self->_dataclassProperties count]) {
    [v3 setDataclassPropertiesDictionary:self->_dataclassProperties];
  }
  if (self->_objectID)
  {
    id v7 = [[ACProtobufURL alloc] initWithURL:self->_objectID];
    [v3 setObjectID:v7];
  }
  uint64_t v8 = [(ACAccount *)self->_parentAccount _encodeProtobuf];
  [v3 setParentAccount:v8];

  uint64_t v9 = [(ACTrackedSet *)self->_trackedProvisionedDataclasses allObjects];
  uint64_t v10 = (void *)[v9 mutableCopy];
  [v3 setProvisionedDataclasses:v10];

  uint64_t v11 = [(ACTrackedSet *)self->_trackedEnabledDataclasses allObjects];
  uint64_t v12 = (void *)[v11 mutableCopy];
  [v3 setEnabledDataclasses:v12];

  [v3 setAuthenticationType:self->_authenticationType];
  [v3 setCredentialType:self->_credentialType];
  if (self->_date)
  {
    uint64_t v13 = [[ACProtobufDate alloc] initWithDate:self->_date];
    [v3 setDate:v13];
  }
  [v3 setOwningBundleID:self->_owningBundleID];
  if ([(NSMutableSet *)self->_dirtyProperties count])
  {
    uint64_t v14 = [(NSMutableSet *)self->_dirtyProperties allObjects];
    uint64_t v15 = (void *)[v14 mutableCopy];
    [v3 setDirtyProperties:v15];
  }
  if ([(NSMutableSet *)self->_dirtyAccountProperties count])
  {
    uint64_t v16 = [(NSMutableSet *)self->_dirtyAccountProperties allObjects];
    uint64_t v17 = (void *)[v16 mutableCopy];
    [v3 setDirtyAccountProperties:v17];
  }
  if ([(NSMutableSet *)self->_dirtyDataclassProperties count])
  {
    id v18 = [(NSMutableSet *)self->_dirtyDataclassProperties allObjects];
    uint64_t v19 = (void *)[v18 mutableCopy];
    [v3 setDirtyDataclassProperties:v19];
  }
  [v3 setModificationID:self->_modificationID];

  return v3;
}

- (id)_encodeProtobufData
{
  uint64_t v2 = [(ACAccount *)self _encodeProtobuf];
  id v3 = [v2 data];

  return v3;
}

- (id)portableCopy
{
  uint64_t v2 = (void *)[(ACAccount *)self copy];
  [v2 _loadAllCachedProperties];
  [v2 _setObjectID:0];

  return v2;
}

- (id)fullDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setTimeStyle:4];
  [v3 setDateStyle:4];
  id v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
  [v3 setLocale:v4];

  id v5 = [(ACAccount *)self creationDate];
  uint64_t v32 = [v3 stringFromDate:v5];

  uint64_t v25 = NSString;
  uint64_t v27 = [(ACAccount *)self accountType];
  uint64_t v31 = [v27 identifier];
  uint64_t v30 = [(ACAccount *)self identifier];
  uint64_t v29 = [(ACAccount *)self accountDescription];
  uint64_t v24 = [(ACAccount *)self username];
  uint64_t v23 = [(ACAccount *)self objectID];
  uint64_t v22 = [(ACAccount *)self provisionedDataclasses];
  uint64_t v21 = [(ACAccount *)self enabledDataclasses];
  uint64_t v28 = [(ACAccount *)self dataclassProperties];
  uint64_t v20 = [(ACAccount *)self accountProperties];
  uint8_t v6 = [(ACAccount *)self parentAccountIdentifier];
  uint64_t v19 = [(ACAccount *)self owningBundleID];
  if ([(ACAccount *)self isAuthenticated]) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  id v18 = v7;
  uint64_t v17 = [(ACAccount *)self lastCredentialRenewalRejectionDate];
  if ([(ACAccount *)self supportsAuthentication]) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  uint64_t v16 = v8;
  uint64_t v9 = [(ACAccount *)self authenticationType];
  uint64_t v10 = [(ACAccount *)self credentialType];
  uint64_t v11 = [(ACAccount *)self credential];
  if ([(ACAccount *)self isActive]) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  if ([(ACAccount *)self isVisible]) {
    uint64_t v13 = @"YES";
  }
  else {
    uint64_t v13 = @"NO";
  }
  if ([(ACAccount *)self isWarmingUp]) {
    uint64_t v14 = @"YES";
  }
  else {
    uint64_t v14 = @"NO";
  }
  objc_msgSend(v25, "stringWithFormat:", @"type:%@\nidentifier: %@\naccountDescription: %@\nusername: %@\nobjectID: %@\nprovisionedDataclasses: %@\nenabledDataclasses: %@\ndataclassProperties: %@\nproperties: %@\nparentAccount: %@\nowningBundleID:%@\nauthenticated: %@\nlastCredentialRenewalRejectedDate: %@\nsupportsAuthentication: %@\nauthenticationType: %@\ncredentialType: %@\ncredential: %@\ncreated: %@\nactive: %@\nvisible: %@\nwarmingUp: %@", v31, v30, v29, v24, v23, v22, v21, v28, v20, v6, v19, v18, v17, v16, v9, v10,
    v11,
    v32,
    v12,
    v13,
  uint64_t v26 = v14);

  return v26;
}

- (void)credentialsChanged:(id)a3
{
  id v4 = [a3 userInfo];
  id v7 = [v4 objectForKey:@"ACAccountIdentifierKey"];

  id v5 = [(ACAccount *)self identifier];
  if ([v7 isEqualToString:v5])
  {
    BOOL v6 = [(ACAccount *)self isPropertyDirty:@"credential"];

    if (!v6) {
      [(ACAccount *)self _clearCachedCredentials];
    }
  }
  else
  {
  }
}

- (BOOL)isDirty
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NSMutableSet *)v2->_dirtyProperties count] != 0;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isPropertyDirty:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  char v6 = [(NSMutableSet *)v5->_dirtyProperties containsObject:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)markAllPropertiesDirty
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  dirtyProperties = v2->_dirtyProperties;
  if (!dirtyProperties)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:17];
    id v5 = v2->_dirtyProperties;
    v2->_dirtyProperties = (NSMutableSet *)v4;

    dirtyProperties = v2->_dirtyProperties;
  }
  [(NSMutableSet *)dirtyProperties addObject:@"accountDescription"];
  [(NSMutableSet *)v2->_dirtyProperties addObject:@"accountProperties"];
  [(NSMutableSet *)v2->_dirtyProperties addObject:@"accountType"];
  [(NSMutableSet *)v2->_dirtyProperties addObject:@"active"];
  [(NSMutableSet *)v2->_dirtyProperties addObject:@"warmingUp"];
  [(NSMutableSet *)v2->_dirtyProperties addObject:@"authenticated"];
  [(NSMutableSet *)v2->_dirtyProperties addObject:@"lastCredentialRenewalRejectionDate"];
  [(NSMutableSet *)v2->_dirtyProperties addObject:@"credential"];
  [(NSMutableSet *)v2->_dirtyProperties addObject:@"dataclassProperties"];
  [(NSMutableSet *)v2->_dirtyProperties addObject:@"date"];
  [(NSMutableSet *)v2->_dirtyProperties addObject:@"enabledDataclasses"];
  [(NSMutableSet *)v2->_dirtyProperties addObject:@"provisionedDataclasses"];
  [(NSMutableSet *)v2->_dirtyProperties addObject:@"identifier"];
  [(NSMutableSet *)v2->_dirtyProperties addObject:@"owningBundleID"];
  [(NSMutableSet *)v2->_dirtyProperties addObject:@"parent"];
  [(NSMutableSet *)v2->_dirtyProperties addObject:@"supportsAuthentication"];
  [(NSMutableSet *)v2->_dirtyProperties addObject:@"username"];
  [(NSMutableSet *)v2->_dirtyProperties addObject:@"visible"];
  [(NSMutableSet *)v2->_dirtyProperties addObject:@"modificationID"];
  if (!v2->_dirtyAccountProperties)
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSMutableDictionary count](v2->_properties, "count"));
    dirtyAccountProperties = v2->_dirtyAccountProperties;
    v2->_dirtyAccountProperties = (NSMutableSet *)v6;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v8 = v2->_properties;
  uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        -[NSMutableSet addObject:](v2->_dirtyAccountProperties, "addObject:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  objc_sync_exit(v2);
}

- (void)setDirty:(BOOL)a3 forProperty:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  if (v4) {
    [(ACAccount *)v6 _unsafe_markPropertyDirty:v7];
  }
  else {
    [(NSMutableSet *)v6->_dirtyProperties removeObject:v7];
  }
  objc_sync_exit(v6);
}

- (void)_markPropertyDirty:(id)a3
{
  id v5 = a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  [(ACAccount *)v4 _unsafe_markPropertyDirty:v5];
  objc_sync_exit(v4);
}

- (void)_markAccountPropertyDirty:(id)a3
{
  id v5 = a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  [(ACAccount *)v4 _unsafe_markAccountPropertyDirty:v5];
  objc_sync_exit(v4);
}

- (void)_unsafe_markAccountPropertyDirty:(id)a3
{
  id v4 = a3;
  dirtyAccountProperties = self->_dirtyAccountProperties;
  id v8 = v4;
  if (!dirtyAccountProperties)
  {
    uint64_t v6 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    id v7 = self->_dirtyAccountProperties;
    self->_dirtyAccountProperties = v6;

    id v4 = v8;
    dirtyAccountProperties = self->_dirtyAccountProperties;
  }
  [(NSMutableSet *)dirtyAccountProperties addObject:v4];
}

- (void)_markDataclassPropertyDirty:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(ACAccount *)v4 _unsafe_markDataclassPropertyDirty:v5];
  objc_sync_exit(v4);
}

- (void)_unsafe_markDataclassPropertyDirty:(id)a3
{
  id v4 = a3;
  dirtyDataclassProperties = self->_dirtyDataclassProperties;
  id v8 = v4;
  if (!dirtyDataclassProperties)
  {
    uint64_t v6 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    id v7 = self->_dirtyDataclassProperties;
    self->_dirtyDataclassProperties = v6;

    id v4 = v8;
    dirtyDataclassProperties = self->_dirtyDataclassProperties;
  }
  [(NSMutableSet *)dirtyDataclassProperties addObject:v4];
}

- (void)_markCredentialDirty
{
}

- (void)_clearDirtyProperties
{
  id obj = self;
  objc_sync_enter(obj);
  dirtyProperties = obj->_dirtyProperties;
  obj->_dirtyProperties = 0;

  dirtyAccountProperties = obj->_dirtyAccountProperties;
  obj->_dirtyAccountProperties = 0;

  dirtyDataclassProperties = obj->_dirtyDataclassProperties;
  obj->_dirtyDataclassProperties = 0;

  id v5 = obj;
  if (obj->_trackedProvisionedDataclasses)
  {
    uint64_t v6 = [ACMutableTrackedSet alloc];
    id v7 = [(ACTrackedSet *)obj->_trackedProvisionedDataclasses allObjects];
    uint64_t v8 = [(ACTrackedSet *)v6 initWithArray:v7];
    trackedProvisionedDataclasses = obj->_trackedProvisionedDataclasses;
    obj->_trackedProvisionedDataclasses = (ACMutableTrackedSet *)v8;

    id v5 = obj;
  }
  v5->_wasProvisionedDataclassesReset = 0;
  if (v5->_trackedEnabledDataclasses)
  {
    uint64_t v10 = [ACMutableTrackedSet alloc];
    uint64_t v11 = [(ACTrackedSet *)obj->_trackedEnabledDataclasses allObjects];
    uint64_t v12 = [(ACTrackedSet *)v10 initWithArray:v11];
    trackedEnabledDataclasses = obj->_trackedEnabledDataclasses;
    obj->_trackedEnabledDataclasses = (ACMutableTrackedSet *)v12;

    id v5 = obj;
  }
  v5->_wasEnabledDataclassesReset = 0;
  credential = v5->_credential;
  if (credential) {
    [(ACAccountCredential *)credential _clearDirtyProperties];
  }
  objc_sync_exit(obj);
}

- (void)setIdentifier:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  [(ACAccount *)v4 _unsafe_markPropertyDirty:@"identifier"];
  objc_sync_exit(v4);
}

- (void)setAuthenticationType:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  authenticationType = v4->_authenticationType;
  v4->_authenticationType = (NSString *)v5;

  [(ACAccount *)v4 _unsafe_markPropertyDirty:@"authenticationType"];
  objc_sync_exit(v4);
}

- (void)setCredentialType:(id)a3
{
  id v7 = a3;
  if ([(ACAccount *)self _useParentForCredentials])
  {
    id v4 = [(ACAccount *)self parentAccount];
    [(ACAccount *)v4 setCredentialType:v7];
  }
  else
  {
    id v4 = self;
    objc_sync_enter(v4);
    uint64_t v5 = [v7 copy];
    credentialType = v4->_credentialType;
    v4->_credentialType = (NSString *)v5;

    [(ACAccount *)v4 _unsafe_markPropertyDirty:@"credentialType"];
    objc_sync_exit(v4);
  }
}

- (void)setUsername:(NSString *)username
{
  id v7 = username;
  if ([(ACAccount *)self _useParentForCredentials])
  {
    id v4 = [(ACAccount *)self parentAccount];
    [(ACAccount *)v4 setUsername:v7];
  }
  else
  {
    id v4 = self;
    objc_sync_enter(v4);
    uint64_t v5 = [(NSString *)v7 copy];
    uint64_t v6 = v4->_username;
    v4->_username = (NSString *)v5;

    [(ACAccount *)v4 _unsafe_markPropertyDirty:@"username"];
    objc_sync_exit(v4);
  }
}

- (NSString)userFullName
{
  uint64_t v3 = [(ACAccount *)self objectForKeyedSubscript:@"firstName"];
  if (v3
    && (id v4 = (void *)v3,
        [(ACAccount *)self objectForKeyedSubscript:@"lastName"],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    id v7 = [(ACAccount *)self objectForKeyedSubscript:@"firstName"];
    [v6 setGivenName:v7];

    uint64_t v8 = [(ACAccount *)self objectForKeyedSubscript:@"middleName"];
    [v6 setMiddleName:v8];

    uint64_t v9 = [(ACAccount *)self objectForKeyedSubscript:@"lastName"];
    [v6 setFamilyName:v9];

    uint64_t v10 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v6 style:2 options:0];
  }
  else
  {
    id v6 = [(ACAccount *)self accountProperties];
    uint64_t v10 = [v6 objectForKey:@"ACPropertyFullName"];
  }
  uint64_t v11 = (void *)v10;

  return (NSString *)v11;
}

- (id)credentialWithError:(id *)a3
{
  if ([(ACAccount *)self _useParentForCredentials])
  {
    uint64_t v5 = [(ACAccount *)self parentAccount];
    id v6 = [(ACAccount *)v5 credentialWithError:a3];
  }
  else
  {
    id v7 = self;
    objc_sync_enter(v7);
    p_credential = (id *)&v7->_credential;
    id v6 = v7->_credential;
    objc_sync_exit(v7);

    if (v6) {
      goto LABEL_8;
    }
    uint64_t v9 = [(ACAccount *)v7 accountStore];
    id v6 = [v9 credentialForAccount:v7 error:a3];

    uint64_t v5 = v7;
    objc_sync_enter(v5);
    objc_storeStrong(p_credential, v6);
    if (!v5->_credentialsDidChangeObserver) {
      [(ACAccount *)v5 _installCredentialsChangedObserver];
    }
    objc_sync_exit(v5);
  }

LABEL_8:

  return v6;
}

- (ACAccountCredential)credential
{
  return (ACAccountCredential *)[(ACAccount *)self credentialWithError:0];
}

- (void)setCredential:(ACAccountCredential *)credential
{
  id v6 = credential;
  if ([(ACAccount *)self _useParentForCredentials])
  {
    uint64_t v5 = [(ACAccount *)self parentAccount];
    [(ACAccount *)v5 setCredential:v6];
  }
  else
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    [(ACAccountCredential *)v5->_credential _setOwningAccount:0];
    objc_storeStrong((id *)&v5->_credential, credential);
    if (!v5->_credentialsDidChangeObserver) {
      [(ACAccount *)v5 _installCredentialsChangedObserver];
    }
    [(ACAccountCredential *)v5->_credential _setOwningAccount:v5];
    [(ACAccount *)v5 _unsafe_markPropertyDirty:@"credential"];
    [(ACAccount *)v5 setLastCredentialRenewalRejectionDate:0];
    objc_sync_exit(v5);
  }
}

- (ACAccountCredential)internalCredential
{
  if ([(ACAccount *)self _useParentForCredentials])
  {
    uint64_t v3 = [(ACAccount *)self parentAccount];
    id v4 = [(ACAccount *)v3 internalCredential];
  }
  else
  {
    uint64_t v3 = self;
    objc_sync_enter(v3);
    id v4 = v3->_credential;
    objc_sync_exit(v3);
  }

  return v4;
}

- (void)setAccountDescription:(NSString *)accountDescription
{
  uint64_t v8 = accountDescription;
  id v4 = [(ACAccount *)self parentAccount];

  if (!v4)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = [(NSString *)v8 copy];
    id v7 = v5->_accountDescription;
    v5->_accountDescription = (NSString *)v6;

    [(ACAccount *)v5 _unsafe_markPropertyDirty:@"accountDescription"];
    objc_sync_exit(v5);
  }
}

- (void)setOwningBundleID:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  owningBundleID = v4->_owningBundleID;
  v4->_owningBundleID = (NSString *)v5;

  [(ACAccount *)v4 _unsafe_markPropertyDirty:@"owningBundleID"];
  objc_sync_exit(v4);
}

- (NSDate)creationDate
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_date;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCreationDate:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_date, a3);
  [(ACAccount *)v5 _unsafe_markPropertyDirty:@"date"];
  objc_sync_exit(v5);
}

- (void)setAccountProperties:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v5->_properties;
  uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v6);
        }
        [(ACAccount *)v5 _markAccountPropertyDirty:*(void *)(*((void *)&v20 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  [(ACAccount *)v5 willChangeValueForKey:@"accountProperties"];
  uint64_t v10 = [v4 mutableCopy];
  properties = v5->_properties;
  v5->_properties = (NSMutableDictionary *)v10;

  [(ACAccount *)v5 didChangeValueForKey:@"accountProperties"];
  [(ACAccount *)v5 _unsafe_markPropertyDirty:@"accountProperties"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v12 = v5->_properties;
  uint64_t v13 = [(NSMutableDictionary *)v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        -[ACAccount _markAccountPropertyDirty:](v5, "_markAccountPropertyDirty:", *(void *)(*((void *)&v16 + 1) + 8 * v15++), (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableDictionary *)v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }

  objc_sync_exit(v5);
}

- (void)setAccountProperty:(id)a3 forKey:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  properties = v7->_properties;
  if (!properties)
  {
    [(ACAccount *)v7 willChangeValueForKey:@"accountProperties"];
    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v10 = v7->_properties;
    v7->_properties = v9;

    [(ACAccount *)v7 didChangeValueForKey:@"accountProperties"];
    properties = v7->_properties;
  }
  id v11 = [(NSMutableDictionary *)properties objectForKeyedSubscript:v6];
  if (v11 != v12 && (!v12 || ([v11 isEqual:v12] & 1) == 0))
  {
    [(NSMutableDictionary *)v7->_properties setValue:v12 forKey:v6];
    [(ACAccount *)v7 _unsafe_markPropertyDirty:@"accountProperties"];
    [(ACAccount *)v7 _markAccountPropertyDirty:v6];
  }

  objc_sync_exit(v7);
}

- (void)setAuthenticated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ACAccount *)self _useParentForCredentials])
  {
    id obj = [(ACAccount *)self parentAccount];
    [(ACAccount *)obj setAuthenticated:v3];
  }
  else
  {
    id obj = self;
    objc_sync_enter(obj);
    obj->_char authenticated = v3;
    [(ACAccount *)obj _unsafe_markPropertyDirty:@"authenticated"];
    if (v3) {
      [(ACAccount *)obj setLastCredentialRenewalRejectionDate:0];
    }
    objc_sync_exit(obj);
  }
}

- (void)setLastCredentialRenewalRejectionDate:(id)a3
{
  id v6 = a3;
  if ([(ACAccount *)self _useParentForCredentials])
  {
    uint64_t v5 = [(ACAccount *)self parentAccount];
    [(ACAccount *)v5 setLastCredentialRenewalRejectionDate:v6];
  }
  else
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    objc_storeStrong((id *)&v5->_lastCredentialRenewalRejectionDate, a3);
    [(ACAccount *)v5 _unsafe_markPropertyDirty:@"lastCredentialRenewalRejectionDate"];
    objc_sync_exit(v5);
  }
}

- (void)setActive:(BOOL)a3
{
  id obj = self;
  objc_sync_enter(obj);
  obj->_BOOL active = a3;
  [(ACAccount *)obj _unsafe_markPropertyDirty:@"active"];
  objc_sync_exit(obj);
}

- (void)setWarmingUp:(BOOL)a3
{
  id obj = self;
  objc_sync_enter(obj);
  obj->_BOOL warmingUp = a3;
  [(ACAccount *)obj _unsafe_markPropertyDirty:@"warmingUp"];
  objc_sync_exit(obj);
}

- (unint64_t)credentialLocation
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(ACAccount *)v2 propertyForKey:@"CredentialStorageLocation"];
  if (v3
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (unint64_t)[v3 unsignedIntegerValue] <= 1)
  {
    id v4 = (void *)[v3 unsignedIntegerValue];
  }
  else
  {
    id v4 = [(ACAccount *)v2 parentAccount];

    if (v4)
    {
      uint64_t v5 = [(ACAccount *)v2 parentAccount];
      id v4 = (void *)[v5 credentialLocation];
    }
  }

  objc_sync_exit(v2);
  return (unint64_t)v4;
}

- (void)setCredentialLocation:(unint64_t)a3
{
  if (a3 > 1)
  {
    id v4 = _ACLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[ACAccount setCredentialLocation:]();
    }

    [(ACAccount *)self setAccountProperty:&unk_1EFA156D0 forKey:@"CredentialStorageLocation"];
  }
  else
  {
    id v5 = [NSNumber numberWithUnsignedInteger:a3];
    [(ACAccount *)self setAccountProperty:v5 forKey:@"CredentialStorageLocation"];
  }
}

- (BOOL)isVisible
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL visible = v2->_visible;
  objc_sync_exit(v2);

  return visible;
}

- (void)setVisible:(BOOL)a3
{
  id obj = self;
  objc_sync_enter(obj);
  obj->_BOOL visible = a3;
  [(ACAccount *)obj _unsafe_markPropertyDirty:@"visible"];
  objc_sync_exit(obj);
}

- (BOOL)supportsAuthentication
{
  if ([(ACAccount *)self _useParentForCredentials])
  {
    BOOL v3 = [(ACAccount *)self parentAccount];
    BOOL supportsAuthentication = [(ACAccount *)v3 supportsAuthentication];
  }
  else
  {
    BOOL v3 = self;
    objc_sync_enter(v3);
    BOOL supportsAuthentication = v3->_supportsAuthentication;
    objc_sync_exit(v3);
  }

  return supportsAuthentication;
}

- (void)setSupportsAuthentication:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ACAccount *)self _useParentForCredentials])
  {
    id obj = [(ACAccount *)self parentAccount];
    [(ACAccount *)obj setSupportsAuthentication:v3];
  }
  else
  {
    id obj = self;
    objc_sync_enter(obj);
    obj->_BOOL supportsAuthentication = v3;
    [(ACAccount *)obj _unsafe_markPropertyDirty:@"supportsAuthentication"];
    objc_sync_exit(obj);
  }
}

- (BOOL)supportsPush
{
  uint64_t v2 = self;
  BOOL v3 = [(ACAccount *)self accountStore];
  LOBYTE(v2) = [v3 isPushSupportedForAccount:v2];

  return (char)v2;
}

- (void)setAccountType:(ACAccountType *)accountType
{
  id v6 = accountType;
  id v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_accountType, accountType);
  [(ACAccount *)v5 _unsafe_markPropertyDirty:@"accountType"];
  objc_sync_exit(v5);
}

- (void)setParentAccount:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v5 = [v12 identifier];
  id v6 = [(ACAccount *)self identifier];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = @"account";
    v14[0] = v12;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v11 = [v9 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"ACAccount can't be its own parent" userInfo:v10];

    objc_exception_throw(v11);
  }
  uint64_t v8 = self;
  objc_sync_enter(v8);
  objc_storeStrong((id *)&v8->_parentAccount, a3);
  [(ACAccount *)v8 _unsafe_markPropertyDirty:@"parent"];
  objc_sync_exit(v8);
}

- (void)_resetParentAccount:(id)a3
{
  id v4 = (ACAccount *)a3;
  id obj = self;
  objc_sync_enter(obj);
  parentAccount = obj->_parentAccount;
  obj->_parentAccount = v4;

  objc_sync_exit(obj);
}

- (ACAccount)displayAccount
{
  BOOL v3 = [(ACAccount *)self parentAccount];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 displayAccount];
  }
  else
  {
    id v5 = self;
  }
  id v6 = v5;

  return v6;
}

- (NSArray)childAccounts
{
  if (self->_haveCheckedForChildAccounts)
  {
    BOOL v3 = 0;
  }
  else
  {
    self->_haveCheckedForChildAccounts = 1;
    id v4 = [(ACAccount *)self accountStore];
    BOOL v3 = [v4 childAccountsForAccount:self];

    id v5 = self;
    objc_sync_enter(v5);
    objc_storeStrong((id *)&v5->_childAccounts, v3);
    objc_sync_exit(v5);
  }
  id v6 = self;
  objc_sync_enter(v6);
  int v7 = v6->_childAccounts;
  objc_sync_exit(v6);

  return v7;
}

- (id)childAccountsWithAccountTypeIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_childAccounts)
  {
    id obj = v5;
    id v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    int v7 = v5->_childAccounts;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v12 = [v11 accountType];
          uint64_t v13 = [v12 identifier];
          int v14 = [v13 isEqualToString:v4];

          if (v14) {
            [v6 addObject:v11];
          }
        }
        uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    uint64_t v15 = obj;
    objc_sync_exit(obj);
  }
  else
  {
    objc_sync_exit(v5);

    uint64_t v15 = [(ACAccount *)v5 accountStore];
    id v6 = [v15 childAccountsForAccount:v5 withTypeIdentifier:v4];
  }

  return v6;
}

- (void)_setModID:(id)a3
{
  id v4 = (NSString *)a3;
  id obj = self;
  objc_sync_enter(obj);
  modificationID = obj->_modificationID;
  obj->_modificationID = v4;

  objc_sync_exit(obj);
}

- (ACTrackedSet)trackedProvisionedDataclasses
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (void *)[(ACMutableTrackedSet *)v2->_trackedProvisionedDataclasses copy];
  objc_sync_exit(v2);

  return (ACTrackedSet *)v3;
}

- (id)changeTypeForProvisionedDataclass:(id)a3
{
  id v4 = a3;
  id v5 = [(ACAccount *)self parentAccount];

  if (v5)
  {
    id v6 = [(ACAccount *)self parentAccount];
    int v7 = [(ACAccount *)v6 changeTypeForProvisionedDataclass:v4];
  }
  else
  {
    id v6 = self;
    objc_sync_enter(v6);
    if (v6->_trackedEnabledDataclasses)
    {
      uint64_t v8 = [(ACTrackedSet *)v6->_trackedProvisionedDataclasses allModifications];
      uint64_t v9 = [v8 objectForKeyedSubscript:v4];
      uint64_t v10 = (void *)v9;
      id v11 = @"ACChangeTypeNone";
      if (v9) {
        id v11 = (__CFString *)v9;
      }
      int v7 = v11;
    }
    else
    {
      int v7 = @"ACChangeTypeNone";
    }
    objc_sync_exit(v6);
  }

  return v7;
}

- (NSMutableSet)provisionedDataclasses
{
  BOOL v3 = [(ACAccount *)self parentAccount];

  if (v3)
  {
    id v4 = [(ACAccount *)self parentAccount];
    id v5 = [v4 provisionedDataclasses];

    id v6 = (id)[v5 mutableCopy];
    int v7 = [(ACAccount *)self accountType];
    uint64_t v8 = [v7 supportedDataclasses];
    [v6 intersectSet:v8];
  }
  else
  {
    uint64_t v9 = self;
    objc_sync_enter(v9);
    if (v9->_trackedProvisionedDataclasses)
    {
      objc_msgSend(MEMORY[0x1E4F1CA80], "setWithTrackedSet:");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = 0;
    }
    objc_sync_exit(v9);

    if (!v6)
    {
      uint64_t v10 = v9;
      objc_sync_enter(v10);
      [(ACAccount *)v10 _unsafe_loadProvisionedDataclasses];
      if (v9->_trackedProvisionedDataclasses)
      {
        objc_msgSend(MEMORY[0x1E4F1CA80], "setWithTrackedSet:");
        id v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v6 = 0;
      }
      objc_sync_exit(v10);

      if (!v6) {
        id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      }
    }
  }

  return (NSMutableSet *)v6;
}

- (void)_unsafe_loadProvisionedDataclasses
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A57C5000, v0, v1, "\"Failed to fetch provisioned dataclasses, error: %@\"", v2, v3, v4, v5, v6);
}

- (void)setProvisionedDataclasses:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _ACLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ACAccount setProvisionedDataclasses:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  uint64_t v13 = self;
  objc_sync_enter(v13);
  int v14 = objc_alloc_init(ACMutableTrackedSet);
  trackedProvisionedDataclasses = v13->_trackedProvisionedDataclasses;
  v13->_trackedProvisionedDataclasses = v14;

  long long v16 = v13->_trackedProvisionedDataclasses;
  long long v17 = [v4 allObjects];
  [(ACMutableTrackedSet *)v16 addObjectsFromArray:v17];

  v13->_wasProvisionedDataclassesReset = 1;
  [(ACAccount *)v13 _unsafe_markPropertyDirty:@"provisionedDataclasses"];
  objc_sync_exit(v13);
}

- (BOOL)isProvisionedForDataclass:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACAccount *)self provisionedDataclasses];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (void)setProvisioned:(BOOL)a3 forDataclass:(id)a4
{
  id v6 = a4;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __41__ACAccount_setProvisioned_forDataclass___block_invoke;
  v18[3] = &unk_1E5BCE330;
  BOOL v21 = a3;
  id v7 = v6;
  id v19 = v7;
  long long v20 = self;
  uint64_t v8 = (void (**)(void))MEMORY[0x1A626DA80](v18);
  uint64_t v9 = self;
  objc_sync_enter(v9);
  if (v9->_trackedProvisionedDataclasses)
  {
    v8[2](v8);
    objc_sync_exit(v9);
  }
  else
  {
    objc_sync_exit(v9);

    uint64_t v10 = [(ACAccount *)v9 accountStore];
    id v17 = 0;
    uint64_t v11 = [v10 provisionedDataclassesForAccount:v9 error:&v17];
    uint64_t v12 = (ACAccount *)v17;

    if (v12)
    {
      uint64_t v13 = _ACLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ACAccount _unsafe_loadProvisionedDataclasses]();
      }
    }
    int v14 = v9;
    objc_sync_enter(v14);
    if (!v9->_trackedProvisionedDataclasses)
    {
      if (v11) {
        uint64_t v15 = [(ACTrackedSet *)[ACMutableTrackedSet alloc] initWithSet:v11];
      }
      else {
        uint64_t v15 = objc_alloc_init(ACMutableTrackedSet);
      }
      trackedProvisionedDataclasses = v9->_trackedProvisionedDataclasses;
      v9->_trackedProvisionedDataclasses = v15;
    }
    ((void (*)(void (**)(void), ACMutableTrackedSet *))v8[2])(v8, v9->_trackedProvisionedDataclasses);
    objc_sync_exit(v14);

    uint64_t v9 = v12;
  }
}

uint64_t __41__ACAccount_setProvisioned_forDataclass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 48)) {
    [a2 addObject:v3];
  }
  else {
    [a2 removeObject:v3];
  }
  id v4 = *(void **)(a1 + 40);

  return objc_msgSend(v4, "_unsafe_markPropertyDirty:", @"provisionedDataclasses");
}

- (ACTrackedSet)trackedEnabledDataclasses
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(ACMutableTrackedSet *)v2->_trackedEnabledDataclasses copy];
  objc_sync_exit(v2);

  return (ACTrackedSet *)v3;
}

- (id)changeTypeForEnabledDataclass:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACAccount *)self parentAccount];

  if (v5)
  {
    id v6 = [(ACAccount *)self parentAccount];
    id v7 = [(ACAccount *)v6 changeTypeForEnabledDataclass:v4];
  }
  else
  {
    id v6 = self;
    objc_sync_enter(v6);
    trackedEnabledDataclasses = v6->_trackedEnabledDataclasses;
    if (trackedEnabledDataclasses)
    {
      uint64_t v9 = [(ACTrackedSet *)trackedEnabledDataclasses allModifications];
      uint64_t v10 = [v9 objectForKeyedSubscript:v4];
      uint64_t v11 = (void *)v10;
      uint64_t v12 = @"ACChangeTypeNone";
      if (v10) {
        uint64_t v12 = (__CFString *)v10;
      }
      id v7 = v12;
    }
    else
    {
      id v7 = @"ACChangeTypeNone";
    }
    objc_sync_exit(v6);
  }

  return v7;
}

- (void)setEnabledDataclasses:(id)a3
{
  id v5 = a3;
  id v6 = [(ACAccount *)self parentAccount];

  if (v6)
  {
    long long v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"ACAccount.m" lineNumber:1509 description:@"You can't enable dataclasses on child accounts"];
  }
  id v7 = _ACLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACAccount setEnabledDataclasses:](v7, v8, v9, v10, v11, v12, v13, v14);
  }

  uint64_t v15 = self;
  objc_sync_enter(v15);
  long long v16 = objc_alloc_init(ACMutableTrackedSet);
  trackedEnabledDataclasses = v15->_trackedEnabledDataclasses;
  v15->_trackedEnabledDataclasses = v16;

  long long v18 = v15->_trackedEnabledDataclasses;
  id v19 = [v5 allObjects];
  [(ACMutableTrackedSet *)v18 addObjectsFromArray:v19];

  v15->_wasEnabledDataclassesReset = 1;
  [(ACAccount *)v15 _unsafe_markPropertyDirty:@"enabledDataclasses"];
  objc_sync_exit(v15);
}

- (void)setEnabled:(BOOL)a3 forDataclass:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [(ACAccount *)self parentAccount];

  if (v8)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"ACAccount.m" lineNumber:1532 description:@"You can't enable dataclasses on child accounts"];
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __37__ACAccount_setEnabled_forDataclass___block_invoke;
  v21[3] = &unk_1E5BCE330;
  BOOL v24 = a3;
  id v9 = v7;
  id v22 = v9;
  uint64_t v23 = self;
  uint64_t v10 = (void (**)(void))MEMORY[0x1A626DA80](v21);
  uint64_t v11 = self;
  objc_sync_enter(v11);
  if (v11->_trackedEnabledDataclasses)
  {
    v10[2](v10);
    objc_sync_exit(v11);
  }
  else
  {
    objc_sync_exit(v11);

    uint64_t v12 = [(ACAccount *)v11 accountStore];
    id v20 = 0;
    uint64_t v13 = [v12 enabledDataclassesForAccount:v11 error:&v20];
    uint64_t v14 = (ACAccount *)v20;

    if (v14)
    {
      uint64_t v15 = _ACLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ACAccount _unsafe_loadEnabledDataclasses]();
      }
    }
    long long v16 = v11;
    objc_sync_enter(v16);
    if (!v11->_trackedEnabledDataclasses)
    {
      if (v13) {
        id v17 = [(ACTrackedSet *)[ACMutableTrackedSet alloc] initWithSet:v13];
      }
      else {
        id v17 = objc_alloc_init(ACMutableTrackedSet);
      }
      trackedEnabledDataclasses = v11->_trackedEnabledDataclasses;
      v11->_trackedEnabledDataclasses = v17;
    }
    ((void (*)(void (**)(void), ACMutableTrackedSet *))v10[2])(v10, v11->_trackedEnabledDataclasses);
    objc_sync_exit(v16);

    uint64_t v11 = v14;
  }
}

uint64_t __37__ACAccount_setEnabled_forDataclass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 48)) {
    [a2 addObject:v3];
  }
  else {
    [a2 removeObject:v3];
  }
  id v4 = *(void **)(a1 + 40);

  return objc_msgSend(v4, "_unsafe_markPropertyDirty:", @"enabledDataclasses");
}

- (BOOL)isEnabledToSyncDataclass:(id)a3
{
  id v4 = a3;
  if ([(ACAccount *)self isEnabledForDataclass:v4])
  {
    id v5 = [(ACAccount *)self accountType];
    id v6 = [v5 syncableDataclasses];
    char v7 = [v6 containsObject:v4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)setDataclassProperties:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)[v4 mutableCopy];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v7 = v5->_dataclassProperties;
  uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        [(ACAccount *)v5 _markDataclassPropertyDirty:*(void *)(*((void *)&v19 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v8);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        -[ACAccount _markDataclassPropertyDirty:](v5, "_markDataclassPropertyDirty:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  [(ACAccount *)v5 willChangeValueForKey:@"dataclassProperties"];
  objc_storeStrong((id *)&v5->_dataclassProperties, v6);
  [(ACAccount *)v5 didChangeValueForKey:@"dataclassProperties"];
  [(ACAccount *)v5 _unsafe_markPropertyDirty:@"dataclassProperties"];

  objc_sync_exit(v5);
}

- (id)propertiesForDataclass:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_dataclassProperties objectForKey:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)setProperties:(id)a3 forDataclass:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  char v7 = self;
  objc_sync_enter(v7);
  id v8 = [(ACAccount *)v7 propertiesForDataclass:v6];
  if (v8 != v12 && (!v8 || ([v8 isEqual:v12] & 1) == 0))
  {
    dataclassProperties = v7->_dataclassProperties;
    if (!dataclassProperties)
    {
      [(ACAccount *)v7 willChangeValueForKey:@"dataclassProperties"];
      uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v11 = v7->_dataclassProperties;
      v7->_dataclassProperties = v10;

      [(ACAccount *)v7 didChangeValueForKey:@"dataclassProperties"];
      dataclassProperties = v7->_dataclassProperties;
    }
    [(NSMutableDictionary *)dataclassProperties setObject:v12 forKey:v6];
    [(ACAccount *)v7 _markDataclassPropertyDirty:v6];
    [(ACAccount *)v7 _unsafe_markPropertyDirty:@"dataclassProperties"];
  }

  objc_sync_exit(v7);
}

- (void)_setObjectID:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  objectID = v4->_objectID;
  v4->_objectID = (NSURL *)v5;

  objc_sync_exit(v4);
}

- (void)takeValuesFromModifiedAccount:(id)a3
{
  v97 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v97 dirtyProperties];
  int v6 = [v5 containsObject:@"accountDescription"];

  if (v6)
  {
    id v7 = [v97 accountDescription];
    uint64_t v8 = [v7 copy];
    accountDescription = v4->_accountDescription;
    v4->_accountDescription = (NSString *)v8;
  }
  uint64_t v10 = [v97 dirtyProperties];
  int v11 = [v10 containsObject:@"username"];

  if (v11)
  {
    id v12 = [v97 username];
    uint64_t v13 = [v12 copy];
    username = v4->_username;
    v4->_username = (NSString *)v13;
  }
  long long v15 = [v97 dirtyProperties];
  int v16 = [v15 containsObject:@"accountProperties"];

  if (v16)
  {
    [(ACAccount *)v4 willChangeValueForKey:@"accountProperties"];
    long long v17 = [v97 accountProperties];
    uint64_t v18 = [v17 mutableCopy];
    properties = v4->_properties;
    v4->_properties = (NSMutableDictionary *)v18;

    [(ACAccount *)v4 didChangeValueForKey:@"accountProperties"];
  }
  long long v20 = [v97 dirtyProperties];
  int v21 = [v20 containsObject:@"owningBundleID"];

  if (v21)
  {
    long long v22 = [v97 owningBundleID];
    uint64_t v23 = [v22 copy];
    owningBundleID = v4->_owningBundleID;
    v4->_owningBundleID = (NSString *)v23;
  }
  uint64_t v25 = [v97 dirtyProperties];
  int v26 = [v25 containsObject:@"dataclassProperties"];

  if (v26)
  {
    [(ACAccount *)v4 willChangeValueForKey:@"dataclassProperties"];
    uint64_t v27 = [v97 dataclassProperties];
    uint64_t v28 = [v27 mutableCopy];
    dataclassProperties = v4->_dataclassProperties;
    v4->_dataclassProperties = (NSMutableDictionary *)v28;

    [(ACAccount *)v4 didChangeValueForKey:@"dataclassProperties"];
  }
  uint64_t v30 = [v97 dirtyProperties];
  int v31 = [v30 containsObject:@"authenticated"];

  if (v31) {
    v4->_char authenticated = [v97 isAuthenticated];
  }
  uint64_t v32 = [v97 dirtyProperties];
  int v33 = [v32 containsObject:@"lastCredentialRenewalRejectionDate"];

  if (v33)
  {
    uint64_t v34 = [v97 lastCredentialRenewalRejectionDate];
    lastCredentialRenewalRejectionDate = v4->_lastCredentialRenewalRejectionDate;
    v4->_lastCredentialRenewalRejectionDate = (NSDate *)v34;
  }
  uint64_t v36 = [v97 dirtyProperties];
  int v37 = [v36 containsObject:@"active"];

  if (v37) {
    v4->_BOOL active = [v97 isActive];
  }
  uint64_t v38 = [v97 dirtyProperties];
  int v39 = [v38 containsObject:@"warmingUp"];

  if (v39) {
    v4->_BOOL warmingUp = [v97 isWarmingUp];
  }
  uint64_t v40 = [v97 dirtyProperties];
  if ([v40 containsObject:@"accountType"])
  {
    uint64_t v41 = [v97 accountType];
    uint64_t v42 = [(ACAccount *)v4 identifier];
    char v43 = [v41 isEqual:v42];

    if ((v43 & 1) == 0)
    {
      [(ACAccount *)v4 willChangeValueForKey:@"accountType"];
      uint64_t v44 = [v97 accountType];
      accountType = v4->_accountType;
      v4->_accountType = (ACAccountType *)v44;

      [(ACAccount *)v4 didChangeValueForKey:@"accountType"];
    }
  }
  else
  {
  }
  uint64_t v46 = [v97 dirtyProperties];
  int v47 = [v46 containsObject:@"credential"];

  if (v47)
  {
    uint64_t v48 = [v97 internalCredential];
    credential = v4->_credential;
    v4->_credential = (ACAccountCredential *)v48;

    if (!v4->_credentialsDidChangeObserver) {
      [(ACAccount *)v4 _installCredentialsChangedObserver];
    }
  }
  uint64_t v50 = [v97 dirtyProperties];
  int v51 = [v50 containsObject:@"parent"];

  if (v51)
  {
    uint64_t v52 = [v97 parentAccount];
    parentAccount = v4->_parentAccount;
    v4->_parentAccount = (ACAccount *)v52;
  }
  uint64_t v54 = [v97 dirtyProperties];
  int v55 = [v54 containsObject:@"provisionedDataclasses"];

  if (v55)
  {
    v56 = [v97 trackedProvisionedDataclasses];
    uint64_t v57 = [v56 mutableCopy];
    trackedProvisionedDataclasses = v4->_trackedProvisionedDataclasses;
    v4->_trackedProvisionedDataclasses = (ACMutableTrackedSet *)v57;

    v4->_wasProvisionedDataclassesReset = v97[216];
  }
  v59 = [v97 dirtyProperties];
  int v60 = [v59 containsObject:@"enabledDataclasses"];

  if (v60)
  {
    long long v61 = [v97 trackedEnabledDataclasses];
    uint64_t v62 = [v61 mutableCopy];
    trackedEnabledDataclasses = v4->_trackedEnabledDataclasses;
    v4->_trackedEnabledDataclasses = (ACMutableTrackedSet *)v62;

    v4->_wasEnabledDataclassesReset = v97[217];
  }
  long long v64 = [v97 dirtyProperties];
  int v65 = [v64 containsObject:@"credentialType"];

  if (v65)
  {
    uint64_t v66 = [v97 credentialType];
    credentialType = v4->_credentialType;
    v4->_credentialType = (NSString *)v66;
  }
  id v68 = [v97 dirtyProperties];
  int v69 = [v68 containsObject:@"authenticationType"];

  if (v69)
  {
    uint64_t v70 = [v97 authenticationType];
    authenticationType = v4->_authenticationType;
    v4->_authenticationType = (NSString *)v70;
  }
  uint64_t v72 = [v97 dirtyProperties];
  int v73 = [v72 containsObject:@"modificationID"];

  if (v73)
  {
    uint64_t v74 = [v97 modificationID];
    modificationID = v4->_modificationID;
    v4->_modificationID = (NSString *)v74;
  }
  dirtyProperties = v4->_dirtyProperties;
  if (!dirtyProperties)
  {
    uint64_t v77 = objc_opt_new();
    v78 = v4->_dirtyProperties;
    v4->_dirtyProperties = (NSMutableSet *)v77;

    dirtyProperties = v4->_dirtyProperties;
  }
  v79 = [v97 dirtyProperties];
  uint64_t v80 = [(NSMutableSet *)dirtyProperties setByAddingObjectsFromSet:v79];
  uint64_t v81 = [v80 mutableCopy];
  uint64_t v82 = v4->_dirtyProperties;
  v4->_dirtyProperties = (NSMutableSet *)v81;

  dirtyAccountProperties = v4->_dirtyAccountProperties;
  if (!dirtyAccountProperties)
  {
    uint64_t v84 = objc_opt_new();
    uint64_t v85 = v4->_dirtyAccountProperties;
    v4->_dirtyAccountProperties = (NSMutableSet *)v84;

    dirtyAccountProperties = v4->_dirtyAccountProperties;
  }
  v86 = [v97 dirtyAccountProperties];
  uint64_t v87 = [(NSMutableSet *)dirtyAccountProperties setByAddingObjectsFromSet:v86];
  uint64_t v88 = [v87 mutableCopy];
  v89 = v4->_dirtyAccountProperties;
  v4->_dirtyAccountProperties = (NSMutableSet *)v88;

  dirtyDataclassProperties = v4->_dirtyDataclassProperties;
  if (!dirtyDataclassProperties)
  {
    uint64_t v91 = objc_opt_new();
    uint64_t v92 = v4->_dirtyDataclassProperties;
    v4->_dirtyDataclassProperties = (NSMutableSet *)v91;

    dirtyDataclassProperties = v4->_dirtyDataclassProperties;
  }
  v93 = [v97 dirtyDataclassProperties];
  v94 = [(NSMutableSet *)dirtyDataclassProperties setByAddingObjectsFromSet:v93];
  uint64_t v95 = [v94 mutableCopy];
  v96 = v4->_dirtyDataclassProperties;
  v4->_dirtyDataclassProperties = (NSMutableSet *)v95;

  objc_sync_exit(v4);
}

- (void)refresh
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ACAccount *)self dirtyProperties];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(ACAccount *)self accountStore];
    int v6 = [(ACAccount *)self identifier];
    uint64_t v77 = [v5 accountWithIdentifier:v6];

    if (v77)
    {
      id v7 = self;
      objc_sync_enter(v7);
      if (([(NSMutableSet *)v7->_dirtyProperties containsObject:@"accountDescription"] & 1) == 0)
      {
        uint64_t v8 = [v77 accountDescription];
        uint64_t v9 = [v8 copy];
        accountDescription = v7->_accountDescription;
        v7->_accountDescription = (NSString *)v9;
      }
      if (([(NSMutableSet *)v7->_dirtyProperties containsObject:@"username"] & 1) == 0)
      {
        int v11 = [v77 username];
        uint64_t v12 = [v11 copy];
        username = v7->_username;
        v7->_username = (NSString *)v12;
      }
      [(ACAccount *)v7 willChangeValueForKey:@"accountProperties"];
      uint64_t v14 = [v77 accountProperties];
      long long v15 = [v14 allKeys];

      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v90 objects:v97 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v91;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v91 != v18) {
              objc_enumerationMutation(v16);
            }
            uint64_t v20 = *(void *)(*((void *)&v90 + 1) + 8 * i);
            int v21 = [(ACAccount *)v7 dirtyAccountProperties];
            char v22 = [v21 containsObject:v20];

            if ((v22 & 1) == 0)
            {
              uint64_t v23 = [v77 objectForKeyedSubscript:v20];
              [(NSMutableDictionary *)v7->_properties setObject:v23 forKeyedSubscript:v20];
            }
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v90 objects:v97 count:16];
        }
        while (v17);
      }

      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      BOOL v24 = [(ACAccount *)v7 accountProperties];
      uint64_t v25 = [v24 allKeys];

      uint64_t v26 = [v25 countByEnumeratingWithState:&v86 objects:v96 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v87;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v87 != v27) {
              objc_enumerationMutation(v25);
            }
            uint64_t v29 = *(void *)(*((void *)&v86 + 1) + 8 * j);
            uint64_t v30 = [(ACAccount *)v7 dirtyAccountProperties];
            char v31 = [v30 containsObject:v29];

            if ((v31 & 1) == 0 && ([v16 containsObject:v29] & 1) == 0) {
              [(NSMutableDictionary *)v7->_properties removeObjectForKey:v29];
            }
          }
          uint64_t v26 = [v25 countByEnumeratingWithState:&v86 objects:v96 count:16];
        }
        while (v26);
      }

      [(ACAccount *)v7 didChangeValueForKey:@"accountProperties"];
      if (([(NSMutableSet *)v7->_dirtyProperties containsObject:@"owningBundleID"] & 1) == 0)
      {
        uint64_t v32 = [v77 owningBundleID];
        uint64_t v33 = [v32 copy];
        owningBundleID = v7->_owningBundleID;
        v7->_owningBundleID = (NSString *)v33;
      }
      [(ACAccount *)v7 willChangeValueForKey:@"dataclassProperties"];
      uint64_t v35 = [v77 dataclassProperties];
      uint64_t v36 = [v35 allKeys];

      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id v37 = v36;
      uint64_t v38 = [v37 countByEnumeratingWithState:&v82 objects:v95 count:16];
      if (v38)
      {
        uint64_t v39 = *(void *)v83;
        do
        {
          for (uint64_t k = 0; k != v38; ++k)
          {
            if (*(void *)v83 != v39) {
              objc_enumerationMutation(v37);
            }
            uint64_t v41 = *(void *)(*((void *)&v82 + 1) + 8 * k);
            uint64_t v42 = [(ACAccount *)v7 dirtyDataclassProperties];
            char v43 = [v42 containsObject:v41];

            if ((v43 & 1) == 0)
            {
              uint64_t v44 = [v77 dataclassProperties];
              uint64_t v45 = [v44 objectForKeyedSubscript:v41];
              [(NSMutableDictionary *)v7->_dataclassProperties setObject:v45 forKeyedSubscript:v41];
            }
          }
          uint64_t v38 = [v37 countByEnumeratingWithState:&v82 objects:v95 count:16];
        }
        while (v38);
      }

      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      uint64_t v46 = [(ACAccount *)v7 accountProperties];
      int v47 = [v46 allKeys];

      uint64_t v48 = [v47 countByEnumeratingWithState:&v78 objects:v94 count:16];
      if (v48)
      {
        uint64_t v49 = *(void *)v79;
        do
        {
          for (uint64_t m = 0; m != v48; ++m)
          {
            if (*(void *)v79 != v49) {
              objc_enumerationMutation(v47);
            }
            uint64_t v51 = *(void *)(*((void *)&v78 + 1) + 8 * m);
            uint64_t v52 = [(ACAccount *)v7 dirtyDataclassProperties];
            char v53 = [v52 containsObject:v51];

            if ((v53 & 1) == 0 && ([v37 containsObject:v51] & 1) == 0) {
              [(NSMutableDictionary *)v7->_dataclassProperties removeObjectForKey:v51];
            }
          }
          uint64_t v48 = [v47 countByEnumeratingWithState:&v78 objects:v94 count:16];
        }
        while (v48);
      }

      [(ACAccount *)v7 didChangeValueForKey:@"dataclassProperties"];
      if (([(NSMutableSet *)v7->_dirtyProperties containsObject:@"dataclassProperties"] & 1) == 0)
      {
        uint64_t v54 = [v77 dataclassProperties];
        uint64_t v55 = [v54 mutableCopy];
        dataclassProperties = v7->_dataclassProperties;
        v7->_dataclassProperties = (NSMutableDictionary *)v55;
      }
      if (([(NSMutableSet *)v7->_dirtyProperties containsObject:@"authenticated"] & 1) == 0) {
        v7->_char authenticated = [v77 isAuthenticated];
      }
      if (([(NSMutableSet *)v7->_dirtyProperties containsObject:@"lastCredentialRenewalRejectionDate"] & 1) == 0)
      {
        uint64_t v57 = [v77 lastCredentialRenewalRejectionDate];
        lastCredentialRenewalRejectionDate = v7->_lastCredentialRenewalRejectionDate;
        v7->_lastCredentialRenewalRejectionDate = (NSDate *)v57;
      }
      if (([(NSMutableSet *)v7->_dirtyProperties containsObject:@"active"] & 1) == 0) {
        v7->_BOOL active = [v77 isActive];
      }
      if (([(NSMutableSet *)v7->_dirtyProperties containsObject:@"warmingUp"] & 1) == 0) {
        v7->_BOOL warmingUp = [v77 isWarmingUp];
      }
      v59 = [v77 objectID];
      uint64_t v60 = [v59 copy];
      objectID = v7->_objectID;
      v7->_objectID = (NSURL *)v60;

      if (([(NSMutableSet *)v7->_dirtyProperties containsObject:@"accountType"] & 1) == 0)
      {
        uint64_t v62 = [v77 accountType];
        accountType = v7->_accountType;
        v7->_accountType = (ACAccountType *)v62;
      }
      if (([(NSMutableSet *)v7->_dirtyProperties containsObject:@"credential"] & 1) == 0)
      {
        credential = v7->_credential;
        v7->_credential = 0;
      }
      if (([(NSMutableSet *)v7->_dirtyProperties containsObject:@"authenticationType"] & 1) == 0)
      {
        uint64_t v65 = [v77 authenticationType];
        authenticationType = v7->_authenticationType;
        v7->_authenticationType = (NSString *)v65;
      }
      if (([(NSMutableSet *)v7->_dirtyProperties containsObject:@"credentialType"] & 1) == 0)
      {
        uint64_t v67 = [v77 credentialType];
        credentialType = v7->_credentialType;
        v7->_credentialType = (NSString *)v67;
      }
      if (([(NSMutableSet *)v7->_dirtyProperties containsObject:@"parent"] & 1) == 0)
      {
        uint64_t v69 = [v77 parentAccount];
        parentAccount = v7->_parentAccount;
        v7->_parentAccount = (ACAccount *)v69;
      }
      if (([(NSMutableSet *)v7->_dirtyProperties containsObject:@"modificationID"] & 1) == 0)
      {
        __int16 v71 = [v77 modificationID];
        uint64_t v72 = [v71 copy];
        modificationID = v7->_modificationID;
        v7->_modificationID = (NSString *)v72;
      }
      if (([(NSMutableSet *)v7->_dirtyProperties containsObject:@"provisionedDataclasses"] & 1) == 0)
      {
        trackedProvisionedDataclasses = v7->_trackedProvisionedDataclasses;
        v7->_trackedProvisionedDataclasses = 0;

        v7->_wasProvisionedDataclassesReset = 0;
      }
      if (([(NSMutableSet *)v7->_dirtyProperties containsObject:@"enabledDataclasses"] & 1) == 0)
      {
        trackedEnabledDataclasses = v7->_trackedEnabledDataclasses;
        v7->_trackedEnabledDataclasses = 0;

        v7->_wasEnabledDataclassesReset = 0;
      }
      childAccounts = v7->_childAccounts;
      v7->_childAccounts = 0;

      v7->_haveCheckedForChildAccounts = 0;
      objc_sync_exit(v7);
    }
  }
  else
  {
    [(ACAccount *)self reload];
  }
}

- (void)_loadAllCachedProperties
{
  id v3 = [(ACAccount *)self enabledDataclasses];
  id v4 = [(ACAccount *)self provisionedDataclasses];
  id v5 = [(ACAccount *)self credential];
  id v6 = [(ACAccount *)self parentAccount];
  [v6 _loadAllCachedProperties];
}

- (id)accountByCleaningThirdPartyTransformations
{
  id v3 = [(ACAccount *)self accountPropertiesTransformer];

  if (v3)
  {
    id v4 = (ACAccount *)[(ACAccount *)self copy];
    id v5 = (*((void (**)(void))v4->_accountPropertiesTransformer + 2))();
    uint64_t v6 = [v5 mutableCopy];
    properties = v4->_properties;
    v4->_properties = (NSMutableDictionary *)v6;
  }
  else
  {
    id v4 = self;
  }

  return v4;
}

- (NSString)clientToken
{
  id v3 = [(ACAccount *)self parentAccount];

  if (v3)
  {
    id v4 = [(ACAccount *)self parentAccount];
    id v5 = [(NSString *)v4 clientToken];
  }
  else
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    id v7 = v6->_clientToken;
    objc_sync_exit(v6);

    if (!v7)
    {
      if (v6->_haveCheckedForClientToken)
      {
        id v7 = 0;
      }
      else
      {
        v6->_haveCheckedForClientToken = 1;
        uint64_t v8 = [(ACAccount *)v6 accountStore];
        id v7 = [v8 clientTokenForAccount:v6];
      }
    }
    uint64_t v9 = v6;
    objc_sync_enter(v9);
    clientToken = v6->_clientToken;
    v6->_clientToken = v7;
    id v4 = v7;

    id v5 = v6->_clientToken;
    objc_sync_exit(v9);
  }

  return v5;
}

- (BOOL)addClientToken:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(ACAccount *)self parentAccount];

  BOOL v7 = v6 == 0;
  if (v6)
  {
    uint64_t v8 = [(ACAccount *)self parentAccount];
    [(ACAccount *)v8 addClientToken:v5];
  }
  else
  {
    if (!v5
      || ([(ACAccount *)self accountStore],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 addClientToken:v5 forAccount:self],
          v9,
          !v10))
    {
      BOOL v7 = 0;
      goto LABEL_8;
    }
    uint64_t v8 = self;
    objc_sync_enter(v8);
    objc_storeStrong((id *)&v8->_clientToken, a3);
    objc_sync_exit(v8);
  }

LABEL_8:
  return v7;
}

- (id)qualifiedUsername
{
  id v3 = [(ACAccount *)self objectForKeyedSubscript:@"Hostname"];
  if (!v3)
  {
    id v4 = [(ACAccount *)self objectForKeyedSubscript:@"DAAccountHost"];
    uint64_t v5 = [v4 length];

    if (v5)
    {
      id v3 = [(ACAccount *)self objectForKeyedSubscript:@"DAAccountHost"];
    }
    else
    {
      id v3 = 0;
    }
  }
  uint64_t v6 = [(ACAccount *)self accountType];
  BOOL v7 = [v6 identifier];
  int v8 = [v7 isEqualToString:@"com.apple.account.Exchange"];

  if (v8)
  {
    uint64_t v9 = [(ACAccount *)self objectForKeyedSubscript:@"EWSRootFolderID"];
    int v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      uint64_t v12 = [(ACAccount *)self objectForKeyedSubscript:@"EWSInternalURL"];
      id v11 = [v12 host];
    }
    if ([v11 length])
    {
      uint64_t v13 = _ACLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[ACAccount qualifiedUsername]();
      }

      id v14 = v11;
      id v3 = v14;
    }
  }
  if ([v3 length])
  {
    long long v15 = NSString;
    id v16 = [(ACAccount *)self username];
    uint64_t v17 = [v15 stringWithFormat:@"%@@%@", v16, v3];

    goto LABEL_25;
  }
  uint64_t v18 = [(ACAccount *)self objectForKeyedSubscript:@"IdentityEmailAddress"];
  if ([v18 length])
  {
    long long v19 = [(ACAccount *)self username];
    char v20 = [v19 containsString:@"@"];

    if ((v20 & 1) == 0)
    {
      int v21 = @"IdentityEmailAddress";
      goto LABEL_22;
    }
  }
  else
  {
  }
  char v22 = [(ACAccount *)self objectForKeyedSubscript:@"DAAccountEmailAddress"];
  uint64_t v23 = [v22 length];

  if (!v23)
  {
    uint64_t v24 = [(ACAccount *)self username];
    goto LABEL_24;
  }
  int v21 = @"DAAccountEmailAddress";
LABEL_22:
  uint64_t v24 = [(ACAccount *)self objectForKeyedSubscript:v21];
LABEL_24:
  uint64_t v17 = (void *)v24;
LABEL_25:

  return v17;
}

- (id)defaultAutodiscoverDomainForChildType:(id)a3
{
  id v4 = (__CFString *)a3;
  uint64_t v5 = [(ACAccount *)self accountType];
  uint64_t v6 = [v5 identifier];

  BOOL v7 = @"com.apple.account.IMAP";
  int v8 = @"com.apple.account.CalDAV";
  uint64_t v9 = @"com.apple.account.CardDAV";
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __51__ACAccount_defaultAutodiscoverDomainForChildType___block_invoke;
  uint64_t v25 = &unk_1E5BCE358;
  int v10 = v7;
  uint64_t v26 = v10;
  id v11 = v8;
  uint64_t v27 = v11;
  uint64_t v12 = v9;
  uint64_t v28 = v12;
  uint64_t v29 = @"fallback";
  if (defaultAutodiscoverDomainForChildType__onceToken != -1) {
    dispatch_once(&defaultAutodiscoverDomainForChildType__onceToken, &v22);
  }
  uint64_t v13 = [(ACAccount *)self username];
  int v14 = [v13 containsString:@"@yahoo.co.jp"];

  if (!v14) {
    goto LABEL_20;
  }
  if ([(__CFString *)v4 isEqualToString:v11])
  {
    long long v15 = @"caldav.calendar.yahoo.co.jp";
    goto LABEL_15;
  }
  if ([(__CFString *)v4 isEqualToString:v12])
  {
    long long v15 = @"carddav.address.yahoo.co.jp";
  }
  else
  {
LABEL_20:
    if (([(__CFString *)v4 isEqualToString:@"com.apple.account.POP"] & 1) != 0
      || [(__CFString *)v4 isEqualToString:@"com.apple.account.SMTP"])
    {
      id v16 = v10;

      id v4 = v16;
    }
    uint64_t v17 = [(id)defaultAutodiscoverDomainForChildType__domainMap objectForKeyedSubscript:v6];
    uint64_t v18 = [v17 objectForKeyedSubscript:v4];
    long long v19 = v18;
    if (v18)
    {
      long long v15 = v18;
    }
    else
    {
      char v20 = [(id)defaultAutodiscoverDomainForChildType__domainMap objectForKeyedSubscript:v6];
      long long v15 = [v20 objectForKeyedSubscript:@"fallback"];
    }
  }
LABEL_15:

  return v15;
}

void __51__ACAccount_defaultAutodiscoverDomainForChildType___block_invoke(uint64_t a1)
{
  v34[7] = *MEMORY[0x1E4F143B8];
  uint64_t v29 = *(void *)(a1 + 32);
  long long v30 = *(_OWORD *)(a1 + 40);
  v32[0] = @"gmail.com";
  v32[1] = @"apidata.googleusercontent.com";
  uint64_t v31 = *(void *)(a1 + 56);
  v32[2] = @"www.googleapis.com";
  v32[3] = @"google.com";
  v33[0] = @"com.apple.account.Google";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v29 count:4];
  v34[0] = v2;
  v33[1] = @"com.apple.account.aol";
  long long v26 = *(_OWORD *)(a1 + 40);
  v28[0] = @"caldav.aol.com";
  v28[1] = @"carddav.aol.com";
  uint64_t v27 = *(void *)(a1 + 56);
  v28[2] = @"aol.com";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v26 count:3];
  v34[1] = v3;
  v33[2] = @"com.apple.account.Yahoo";
  long long v23 = *(_OWORD *)(a1 + 40);
  v25[0] = @"caldav.calendar.yahoo.com";
  v25[1] = @"carddav.address.yahoo.com";
  uint64_t v24 = *(void *)(a1 + 56);
  v25[2] = @"yahoo.com";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v23 count:3];
  v34[2] = v4;
  v33[3] = @"com.apple.facebook";
  long long v20 = *(_OWORD *)(a1 + 40);
  v22[0] = @"webdav.facebook.com";
  v22[1] = @"webdav.facebook.com";
  uint64_t v21 = *(void *)(a1 + 56);
  v22[2] = @"facebook.com";
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v20 count:3];
  v34[3] = v5;
  v33[4] = @"com.apple.account.qq";
  long long v17 = *(_OWORD *)(a1 + 40);
  v19[0] = @"dav.qq.com";
  v19[1] = @"dav.qq.com";
  uint64_t v18 = *(void *)(a1 + 56);
  v19[2] = @"qq.com";
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v17 count:3];
  v34[4] = v6;
  v33[5] = @"com.apple.account.126";
  long long v14 = *(_OWORD *)(a1 + 40);
  v16[0] = @"caldav.126.com";
  v16[1] = @"contacts.126.com";
  uint64_t v15 = *(void *)(a1 + 56);
  v16[2] = @"126.com";
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v14 count:3];
  v34[5] = v7;
  v33[6] = @"com.apple.account.163";
  long long v11 = *(_OWORD *)(a1 + 40);
  v13[0] = @"caldav.163.com";
  v13[1] = @"contacts.163.com";
  uint64_t v12 = *(void *)(a1 + 56);
  v13[2] = @"163.com";
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v11 count:3];
  v34[6] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:7];
  int v10 = (void *)defaultAutodiscoverDomainForChildType__domainMap;
  defaultAutodiscoverDomainForChildType__domainMap = v9;
}

- (NSSet)dirtyProperties
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[(NSMutableSet *)v2->_dirtyProperties copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (NSSet)dirtyAccountProperties
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[(NSMutableSet *)v2->_dirtyAccountProperties copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (NSSet)dirtyDataclassProperties
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[(NSMutableSet *)v2->_dirtyDataclassProperties copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (NSString)shortDebugName
{
  id v3 = NSString;
  id v4 = [(ACAccount *)self username];
  uint64_t v5 = [(ACAccount *)self identifier];
  uint64_t v6 = [v3 stringWithFormat:@"\"%@\" (%@)", v4, v5];

  return (NSString *)v6;
}

- (void)_applyDirtyStateFromAccount:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v6 = [v4 dirtyProperties];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v39;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v6);
        }
        [(ACAccount *)v5 _unsafe_markPropertyDirty:*(void *)(*((void *)&v38 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v7);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  int v10 = [v4 dirtyAccountProperties];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v35;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v10);
        }
        [(ACAccount *)v5 _unsafe_markAccountPropertyDirty:*(void *)(*((void *)&v34 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v11);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v14 = [v4 dirtyDataclassProperties];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v31;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v14);
        }
        [(ACAccount *)v5 _unsafe_markDataclassPropertyDirty:*(void *)(*((void *)&v30 + 1) + 8 * v17++)];
      }
      while (v15 != v17);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v15);
  }

  uint64_t v18 = [v4 trackedEnabledDataclasses];
  if (v18)
  {
    long long v19 = [(ACAccount *)v5 trackedEnabledDataclasses];
    BOOL v20 = v19 == 0;

    if (v20) {
      [(ACAccount *)v5 _unsafe_loadEnabledDataclasses];
    }
  }
  uint64_t v21 = [v4 trackedEnabledDataclasses];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __41__ACAccount__applyDirtyStateFromAccount___block_invoke;
  v29[3] = &unk_1E5BCE380;
  v29[4] = v5;
  [v21 enumerateModificationsUsingBlock:v29];

  uint64_t v22 = [v4 trackedProvisionedDataclasses];
  if (v22)
  {
    long long v23 = [(ACAccount *)v5 trackedProvisionedDataclasses];
    BOOL v24 = v23 == 0;

    if (v24) {
      [(ACAccount *)v5 _unsafe_loadProvisionedDataclasses];
    }
  }
  uint64_t v25 = [v4 trackedProvisionedDataclasses];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __41__ACAccount__applyDirtyStateFromAccount___block_invoke_2;
  void v28[3] = &unk_1E5BCE380;
  v28[4] = v5;
  [v25 enumerateModificationsUsingBlock:v28];

  uint64_t v26 = [v4 internalCredential];
  credential = v5->_credential;
  v5->_credential = (ACAccountCredential *)v26;

  objc_sync_exit(v5);
}

void __41__ACAccount__applyDirtyStateFromAccount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 isEqualToString:@"ACChangeTypeAdded"])
  {
    [*(id *)(*(void *)(a1 + 32) + 160) addObject:v6];
  }
  else if ([v5 isEqualToString:@"ACChangeTypeRemoved"])
  {
    [*(id *)(*(void *)(a1 + 32) + 160) removeObject:v6];
  }
}

void __41__ACAccount__applyDirtyStateFromAccount___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 isEqualToString:@"ACChangeTypeAdded"])
  {
    [*(id *)(*(void *)(a1 + 32) + 152) addObject:v6];
  }
  else if ([v5 isEqualToString:@"ACChangeTypeRemoved"])
  {
    [*(id *)(*(void *)(a1 + 32) + 152) removeObject:v6];
  }
}

- (BOOL)_isDifferentFrom:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    id v6 = [v4 dirtyProperties];
    uint64_t v7 = (void *)[v6 copy];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (!v9) {
      goto LABEL_62;
    }
    uint64_t v10 = *(void *)v46;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v45 + 1) + 8 * v11);
        if ([v12 isEqualToString:@"lastCredentialRenewalRejectionDate"])
        {
          lastCredentialRenewalRejectionDate = v5->_lastCredentialRenewalRejectionDate;
          long long v14 = [v4 lastCredentialRenewalRejectionDate];
          unint64_t v15 = lastCredentialRenewalRejectionDate;
          id v16 = v14;
          unint64_t v17 = (unint64_t)v16;
          if (v15 && v16)
          {
LABEL_10:
            if (([(id)v15 isEqual:v17] & 1) == 0) {
              goto LABEL_60;
            }
LABEL_37:

            goto LABEL_38;
          }
LABEL_36:
          if (v15 | v17)
          {
LABEL_60:

LABEL_61:
            LOBYTE(v9) = 1;
            goto LABEL_62;
          }
          goto LABEL_37;
        }
        if ([v12 isEqualToString:@"dataclassProperties"]) {
          goto LABEL_61;
        }
        if ([v12 isEqualToString:@"active"])
        {
          int active = v5->_active;
          int v19 = [v4 isActive];
          goto LABEL_19;
        }
        if ([v12 isEqualToString:@"warmingUp"])
        {
          int active = v5->_warmingUp;
          int v19 = [v4 isWarmingUp];
          goto LABEL_19;
        }
        if ([v12 isEqualToString:@"authenticated"])
        {
          int active = v5->_authenticated;
          int v19 = [v4 isAuthenticated];
          goto LABEL_19;
        }
        if ([v12 isEqualToString:@"identifier"])
        {
          identifier = v5->_identifier;
          uint64_t v21 = [v4 identifier];
          unint64_t v15 = identifier;
          id v22 = v21;
          unint64_t v17 = (unint64_t)v22;
          if (v15 && v22) {
            goto LABEL_10;
          }
          goto LABEL_36;
        }
        if ([v12 isEqualToString:@"date"])
        {
          date = v5->_date;
          BOOL v24 = [v4 creationDate];
          unint64_t v15 = date;
          id v25 = v24;
          unint64_t v17 = (unint64_t)v25;
          if (v15 && v25) {
            goto LABEL_10;
          }
          goto LABEL_36;
        }
        if ([v12 isEqualToString:@"authenticationType"])
        {
          authenticationType = v5->_authenticationType;
          uint64_t v27 = [v4 authenticationType];
          unint64_t v15 = authenticationType;
          id v28 = v27;
          unint64_t v17 = (unint64_t)v28;
          if (v15 && v28) {
            goto LABEL_10;
          }
          goto LABEL_36;
        }
        if ([v12 isEqualToString:@"accountDescription"])
        {
          accountDescription = v5->_accountDescription;
          long long v30 = [v4 accountDescription];
          unint64_t v15 = accountDescription;
          id v31 = v30;
          unint64_t v17 = (unint64_t)v31;
          if (v15 && v31) {
            goto LABEL_10;
          }
          goto LABEL_36;
        }
        if ([v12 isEqualToString:@"supportsAuthentication"])
        {
          int active = v5->_supportsAuthentication;
          int v19 = [v4 supportsAuthentication];
LABEL_19:
          if (active != v19) {
            goto LABEL_61;
          }
          goto LABEL_38;
        }
        if ([v12 isEqualToString:@"owningBundleID"])
        {
          owningBundleID = v5->_owningBundleID;
          long long v33 = [v4 owningBundleID];
          char v34 = ACIsEqualOrNil(owningBundleID, v33);

          goto LABEL_48;
        }
        if ([v12 isEqualToString:@"username"])
        {
          username = v5->_username;
          long long v36 = [v4 username];
          char v34 = ACIsEqualOrNil(username, v36);

          goto LABEL_48;
        }
        if ([v12 isEqualToString:@"credentialType"])
        {
          credentialType = v5->_credentialType;
          long long v38 = [v4 credentialType];
          char v34 = ACIsEqualOrNil(credentialType, v38);

LABEL_48:
          if ((v34 & 1) == 0) {
            goto LABEL_61;
          }
          goto LABEL_38;
        }
        if ([v12 isEqualToString:@"provisionedDataclasses"]) {
          goto LABEL_61;
        }
        if (![v12 isEqualToString:@"accountType"])
        {
          if (([v12 isEqualToString:@"enabledDataclasses"] & 1) != 0
            || ![v12 isEqualToString:@"visible"])
          {
            goto LABEL_61;
          }
          int active = v5->_visible;
          int v19 = [v4 isVisible];
          goto LABEL_19;
        }
        uint64_t v44 = [(ACAccountType *)v5->_accountType identifier];
        long long v39 = [v4 accountType];
        long long v40 = [v39 identifier];
        char v43 = ACIsEqualOrNil(v44, v40);

        if ((v43 & 1) == 0) {
          goto LABEL_61;
        }
LABEL_38:
        ++v11;
      }
      while (v9 != v11);
      uint64_t v41 = [v8 countByEnumeratingWithState:&v45 objects:v49 count:16];
      uint64_t v9 = v41;
      if (!v41)
      {
LABEL_62:

        goto LABEL_63;
      }
    }
  }
  LOBYTE(v9) = 0;
LABEL_63:
  objc_sync_exit(v5);

  return v9;
}

- (void)setSecIdentity:(__SecIdentity *)a3
{
  if (a3)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD48], a3);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC78], (const void *)*MEMORY[0x1E4F1CFD0]);
    CFTypeRef result = 0;
    uint64_t v6 = SecItemAdd(Mutable, &result);
    if (v6 == -25299) {
      uint64_t v6 = SecItemCopyMatching(Mutable, &result);
    }
    uint64_t v7 = result;
    if (!result || v6)
    {
      uint64_t v7 = _ACLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ACAccount setSecIdentity:](v6);
      }
    }
    else
    {
      [(ACAccount *)self setObject:result forKeyedSubscript:@"SecIdentityPersistentRef"];
    }

    CFRelease(Mutable);
  }
  else
  {
    -[ACAccount setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:");
  }
}

- (__SecIdentity)copySecIdentity
{
  CFTypeRef result = 0;
  uint64_t v2 = [(ACAccount *)self objectForKeyedSubscript:@"SecIdentityPersistentRef"];

  if (!v2) {
    return 0;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B990]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC80], (const void *)*MEMORY[0x1E4F1CFD0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD40], v2);
  uint64_t v4 = SecItemCopyMatching(Mutable, &result);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = _ACLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ACAccount setSecIdentity:](v5);
    }
  }
  CFRelease(Mutable);
  return (__SecIdentity *)result;
}

- (void)setSecCertificates:(id)a3
{
  *(void *)&v20[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    unint64_t v15 = self;
    id v16 = objc_opt_new();
    if ([v4 count])
    {
      unint64_t v5 = 0;
      CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      uint64_t v6 = (const void *)*MEMORY[0x1E4F3B978];
      uint64_t v7 = (const void *)*MEMORY[0x1E4F3B980];
      id v8 = (const void *)*MEMORY[0x1E4F3BD48];
      uint64_t v9 = (const void *)*MEMORY[0x1E4F3BC78];
      uint64_t v10 = (const void *)*MEMORY[0x1E4F1CFD0];
      do
      {
        uint64_t v11 = [v4 objectAtIndexedSubscript:v5];

        CFTypeRef result = 0;
        Mutable = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
        CFDictionaryAddValue(Mutable, v6, v7);
        CFDictionaryAddValue(Mutable, v8, v11);
        CFDictionaryAddValue(Mutable, v9, v10);
        uint64_t v13 = SecItemAdd(Mutable, &result);
        if (v13 == -25299) {
          uint64_t v13 = SecItemCopyMatching(Mutable, &result);
        }
        if (v13)
        {
          long long v14 = _ACLogSystem();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            [(ACAccount *)&v19 setSecCertificates:v20];
          }
        }
        else
        {
          long long v14 = result;
          [v16 addObject:result];
        }

        CFRelease(Mutable);
        ++v5;
      }
      while ([v4 count] > v5);
    }
    if ([v16 count]) {
      [(ACAccount *)v15 setObject:v16 forKeyedSubscript:@"SecCertificatePersistentRefs"];
    }
  }
  else
  {
    [(ACAccount *)self setObject:0 forKeyedSubscript:@"SecCertificatePersistentRefs"];
  }
}

- (id)secCertificates
{
  *(void *)&v26[5] = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  theArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  id v4 = [(ACAccount *)self objectForKeyedSubscript:@"SecCertificatePersistentRefs"];

  if (v4)
  {
    unint64_t v5 = [(ACAccount *)self objectForKeyedSubscript:@"SecCertificatePersistentRefs"];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      unint64_t v7 = 0;
      id v8 = (const void *)*MEMORY[0x1E4F3B978];
      value = (void *)*MEMORY[0x1E4F3B980];
      uint64_t v9 = (const void *)*MEMORY[0x1E4F3BC80];
      uint64_t v10 = (const void *)*MEMORY[0x1E4F1CFD0];
      uint64_t v11 = (const void *)*MEMORY[0x1E4F3BD40];
      uint64_t v21 = self;
      do
      {
        uint64_t v12 = [(ACAccount *)self objectForKeyedSubscript:@"SecCertificatePersistentRefs"];
        uint64_t v13 = [v12 objectAtIndexedSubscript:v7];

        CFTypeRef result = 0;
        Mutable = CFDictionaryCreateMutable(v3, 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
        CFDictionaryAddValue(Mutable, v8, value);
        CFDictionaryAddValue(Mutable, v9, v10);
        CFDictionaryAddValue(Mutable, v11, v13);
        uint64_t v15 = SecItemCopyMatching(Mutable, &result);
        uint64_t v16 = v15;
        if (!result || v15)
        {
          unint64_t v17 = _ACLogSystem();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            [(ACAccount *)&v25 setSecCertificates:v26];
          }

          self = v21;
          if (!Mutable) {
            goto LABEL_12;
          }
        }
        else
        {
          CFArrayAppendValue(theArray, result);
          if (!Mutable) {
            goto LABEL_12;
          }
        }
        CFRelease(Mutable);
LABEL_12:
        if (result) {
          CFRelease(result);
        }
        ++v7;
        uint64_t v18 = [(ACAccount *)self objectForKeyedSubscript:@"SecCertificatePersistentRefs"];
        unint64_t v19 = [v18 count];
      }
      while (v19 > v7);
    }
  }
  else
  {
    theArray = 0;
  }

  return theArray;
}

- (BOOL)isDataSeparatedAccount
{
  CFAllocatorRef v3 = [(ACAccount *)self personaIdentifier];
  if (v3) {
    goto LABEL_2;
  }
  id v8 = [(ACAccount *)self dirtyProperties];
  int v9 = [v8 containsObject:@"PersonaIdentifier"];

  if (!v9) {
    return 0;
  }
  uint64_t v10 = _ACPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ACAccount isDataSeparatedAccount]();
  }

  uint64_t v11 = [(ACAccount *)self dirtyProperties];
  CFAllocatorRef v3 = [v11 valueForKey:@"PersonaIdentifier"];

  if (!v3) {
    return 0;
  }
LABEL_2:
  id v4 = +[ACPersonaManager sharedInstance];
  unint64_t v5 = [v4 enterprisePersonaUID];
  if ((v5
     || ([v4 updatePersonasUIDs],
         [v4 enterprisePersonaUID],
         (unint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
    && ([v5 isEqualToString:v3] & 1) != 0)
  {
    char v6 = 1;
  }
  else
  {
    unint64_t v7 = [v4 guestPersonasUIDs];
    char v6 = [v7 containsObject:v3];
  }
  return v6;
}

- (id)personaIdentifier
{
  CFAllocatorRef v3 = [(ACAccount *)self parentAccount];

  if (v3)
  {
    id v4 = [(ACAccount *)self parentAccount];
    unint64_t v5 = [v4 objectForKeyedSubscript:@"PersonaIdentifier"];

    if (v5) {
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v5 = [(ACAccount *)self objectForKeyedSubscript:@"PersonaIdentifier"];
    if (v5) {
      goto LABEL_10;
    }
  }
  char v6 = [(ACAccount *)self dirtyProperties];
  int v7 = [v6 containsObject:@"PersonaIdentifier"];

  if (v7)
  {
    id v8 = _ACPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[ACAccount isDataSeparatedAccount]();
    }

    int v9 = [(ACAccount *)self dirtyProperties];
    unint64_t v5 = [v9 valueForKey:@"PersonaIdentifier"];
  }
  else
  {
    unint64_t v5 = 0;
  }
LABEL_10:

  return v5;
}

- (BOOL)correctPersonaScopedForAccount
{
  CFAllocatorRef v3 = [MEMORY[0x1E4FB36F0] sharedManager];
  id v4 = [v3 currentPersona];

  if ([v4 isEnterprisePersona])
  {
    if ([(ACAccount *)self isDataSeparatedAccount]) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  int v5 = [v4 isGuestPersona];
  if ([(ACAccount *)self isDataSeparatedAccount])
  {
    if ((v5 & 1) == 0)
    {
      char v6 = _ACPLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        [(ACAccount *)(uint64_t)self correctPersonaScopedForAccount];
      }
      goto LABEL_11;
    }
LABEL_12:
    BOOL v7 = 1;
    goto LABEL_13;
  }
  if (!v5) {
    goto LABEL_12;
  }
LABEL_9:
  char v6 = _ACPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(ACAccount *)(uint64_t)self correctPersonaScopedForAccount];
  }
LABEL_11:

  BOOL v7 = 0;
LABEL_13:

  return v7;
}

- (id)childCardDAVAccountIdentifier
{
  CFAllocatorRef v3 = [(ACAccount *)self childAccountsWithAccountTypeIdentifier:@"com.apple.account.CardDAV"];
  id v4 = [v3 firstObject];
  if (!v4)
  {
    uint64_t v5 = [(ACAccount *)self objectForKeyedSubscript:@"childCardDAVAccountIdentifier"];
    goto LABEL_5;
  }
  if ([(ACAccount *)self isEnabledForDataclass:@"com.apple.Dataclass.Contacts"])
  {
    uint64_t v5 = [v4 identifier];
LABEL_5:
    char v6 = (void *)v5;
    goto LABEL_7;
  }
  char v6 = 0;
LABEL_7:

  return v6;
}

- (void)setChildCardDAVAccountIdentifier:(id)a3
{
}

- (NSString)managingOwnerIdentifier
{
  CFAllocatorRef v3 = [(ACAccount *)self parentAccount];

  if (v3)
  {
    id v4 = [(ACAccount *)self parentAccount];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"ManagingOwnerIdentifier"];
  }
  else
  {
    uint64_t v5 = [(ACAccount *)self objectForKeyedSubscript:@"ManagingOwnerIdentifier"];
  }

  return (NSString *)v5;
}

- (void)setManagingOwnerIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACAccount *)self parentAccount];

  if (v5)
  {
    char v6 = _ACLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ACAccount setManagingOwnerIdentifier:]();
    }
  }
  else
  {
    [(ACAccount *)self setObject:v4 forKeyedSubscript:@"ManagingOwnerIdentifier"];
  }
}

- (NSString)managingSourceName
{
  CFAllocatorRef v3 = [(ACAccount *)self parentAccount];

  if (v3)
  {
    id v4 = [(ACAccount *)self parentAccount];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"ManagingSourceName"];
  }
  else
  {
    uint64_t v5 = [(ACAccount *)self objectForKeyedSubscript:@"ManagingSourceName"];
  }

  return (NSString *)v5;
}

- (void)setManagingSourceName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACAccount *)self parentAccount];

  if (v5)
  {
    char v6 = _ACLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ACAccount setManagingSourceName:]();
    }
  }
  else
  {
    [(ACAccount *)self setObject:v4 forKeyedSubscript:@"ManagingSourceName"];
  }
}

- (void)setTrackedProvisionedDataclasses:(id)a3
{
}

- (BOOL)wasProvisionedDataclassesReset
{
  return self->_wasProvisionedDataclassesReset;
}

- (void)setTrackedEnabledDataclasses:(id)a3
{
}

- (BOOL)wasEnabledDataclassesReset
{
  return self->_wasEnabledDataclassesReset;
}

- (void)setAccountPropertiesTransformer:(id)a3
{
}

- (void)initWithManagedAccount:(void *)a3 .cold.1(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_error_impl(&dword_1A57C5000, log, OS_LOG_TYPE_ERROR, "\"Unexpecteed nil value for %@\"", buf, 0xCu);
}

- (void)setCredentialLocation:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A57C5000, v0, v1, "\"Invalid ACAccountCredentialStorageOption %lu, falling back to qualified username\"", v2, v3, v4, v5, v6);
}

- (void)setProvisionedDataclasses:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setEnabledDataclasses:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)isEnabledForDataclass:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_13(&dword_1A57C5000, v0, v1, "\"-[ACAccount isEnabledForDataclass:] should not be relied on to get the status of FMiP. It may return inaccurate results. Use AAUIDeviceLocatorService instead.\"", v2, v3, v4, v5, v6);
}

- (void)qualifiedUsername
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1A57C5000, v0, v1, "\"Exchange qualified: %@\"", v2, v3, v4, v5, v6);
}

- (void)setSecIdentity:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_0(&dword_1A57C5000, v2, v3, "\"Failed with status %@\"", v4, v5, v6, v7, v8);
}

- (void)setSecCertificates:(void *)a3 .cold.1(_DWORD *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = [NSNumber numberWithInt:a2];
  *a1 = 138412290;
  *a3 = v5;
  OUTLINED_FUNCTION_8_0(&dword_1A57C5000, v6, v7, "\"Failed with status %@\"");
}

- (void)isDataSeparatedAccount
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_13(&dword_1A57C5000, v0, v1, "\"Dirty properties contain Persona identifier. Gotta use it or we will find nothing\"", v2, v3, v4, v5, v6);
}

- (void)correctPersonaScopedForAccount
{
  [a2 userPersonaType];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1A57C5000, v2, v3, "\"Operation not scoped in enterprise or guest persona for data separated account %@, persona type %ld\"", v4, v5, v6, v7, v8);
}

- (void)setManagingOwnerIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_1A57C5000, v0, OS_LOG_TYPE_ERROR, "\"no-op: setManagingOwnerIdentifier called on child account\"", v1, 2u);
}

- (void)setManagingSourceName:.cold.1()
{
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_1A57C5000, v0, OS_LOG_TYPE_ERROR, "\"no-op: setManagingSourceName called on child account\"", v1, 2u);
}

@end