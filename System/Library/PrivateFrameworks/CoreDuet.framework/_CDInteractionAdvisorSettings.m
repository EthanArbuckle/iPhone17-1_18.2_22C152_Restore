@interface _CDInteractionAdvisorSettings
+ (BOOL)supportsSecureCoding;
+ (id)extractContactIdentifiers:(id)a3;
+ (id)interactionAdvisorSettingsDefault;
- (BOOL)aggregateByIdentifier;
- (BOOL)requireOutgoingInteraction;
- (BOOL)useFuture;
- (NSDate)interactionDate;
- (NSSet)constrainAccounts;
- (NSSet)constrainBundleIds;
- (NSSet)constrainDirections;
- (NSSet)constrainDomainIdentifiers;
- (NSSet)constrainIdentifiers;
- (NSSet)constrainKeywords;
- (NSSet)constrainLocationUUIDs;
- (NSSet)constrainMechanisms;
- (NSSet)constrainPersonIdType;
- (NSSet)constrainPersonIds;
- (NSSet)constrainRecipients;
- (NSSet)constrainSenders;
- (NSSet)ignoreContactIdentifiers;
- (NSSet)ignoreInteractionUUIDs;
- (NSSet)seedIdentifiers;
- (NSString)callerBundleId;
- (NSString)consumerIdentifier;
- (NSString)contactPrefix;
- (NSString)interactionLocationUUID;
- (NSString)interactionTitle;
- (_CDInteractionAdvisorSettings)init;
- (_CDInteractionAdvisorSettings)initWithCoder:(id)a3;
- (id)contactPredicate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)interactionPredicate;
- (int64_t)constrainMaxRecipientCount;
- (unint64_t)resultLimit;
- (void)encodeWithCoder:(id)a3;
- (void)setAggregateByIdentifier:(BOOL)a3;
- (void)setCallerBundleId:(id)a3;
- (void)setConstrainAccounts:(id)a3;
- (void)setConstrainBundleIds:(id)a3;
- (void)setConstrainDirections:(id)a3;
- (void)setConstrainDomainIdentifiers:(id)a3;
- (void)setConstrainIdentifiers:(id)a3;
- (void)setConstrainKeywords:(id)a3;
- (void)setConstrainLocationUUIDs:(id)a3;
- (void)setConstrainMaxRecipientCount:(int64_t)a3;
- (void)setConstrainMechanisms:(id)a3;
- (void)setConstrainPersonIdType:(id)a3;
- (void)setConstrainPersonIds:(id)a3;
- (void)setConstrainRecipients:(id)a3;
- (void)setConstrainSenders:(id)a3;
- (void)setConsumerIdentifier:(id)a3;
- (void)setContactPrefix:(id)a3;
- (void)setIgnoreContactIdentifiers:(id)a3;
- (void)setIgnoreInteractionUUIDs:(id)a3;
- (void)setInteractionDate:(id)a3;
- (void)setInteractionLocationUUID:(id)a3;
- (void)setInteractionTitle:(id)a3;
- (void)setRequireOutgoingInteraction:(BOOL)a3;
- (void)setResultLimit:(unint64_t)a3;
- (void)setSeedIdentifiers:(id)a3;
- (void)setUseFuture:(BOOL)a3;
@end

@implementation _CDInteractionAdvisorSettings

- (id)interactionPredicate
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  constrainMechanisms = self->_constrainMechanisms;
  if (constrainMechanisms && [(NSSet *)constrainMechanisms count])
  {
    v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism IN %@)", self->_constrainMechanisms];
    [v3 addObject:v5];
  }
  constrainDirections = self->_constrainDirections;
  if (constrainDirections && [(NSSet *)constrainDirections count])
  {
    v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(direction IN %@)", self->_constrainDirections];
    [v3 addObject:v7];
  }
  constrainBundleIds = self->_constrainBundleIds;
  if (constrainBundleIds && [(NSSet *)constrainBundleIds count])
  {
    v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(bundleId IN %@)", self->_constrainBundleIds];
    [v3 addObject:v9];
  }
  constrainAccounts = self->_constrainAccounts;
  if (constrainAccounts && [(NSSet *)constrainAccounts count])
  {
    v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(account IN %@)", self->_constrainAccounts];
    [v3 addObject:v11];
  }
  constrainDomainIdentifiers = self->_constrainDomainIdentifiers;
  unint64_t v13 = 0x1E4F28000;
  if (constrainDomainIdentifiers && [(NSSet *)constrainDomainIdentifiers count])
  {
    v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSSet count](self->_constrainDomainIdentifiers, "count"));
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v15 = self->_constrainDomainIdentifiers;
    uint64_t v16 = [(NSSet *)v15 countByEnumeratingWithState:&v61 objects:v68 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v62 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(domainIdentifier BEGINSWITH %@)", *(void *)(*((void *)&v61 + 1) + 8 * i)];
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSSet *)v15 countByEnumeratingWithState:&v61 objects:v68 count:16];
      }
      while (v17);
    }

    unint64_t v13 = 0x1E4F28000uLL;
    v21 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v14];
    [v3 addObject:v21];
  }
  constrainLocationUUIDs = self->_constrainLocationUUIDs;
  if (constrainLocationUUIDs && [(NSSet *)constrainLocationUUIDs count])
  {
    v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(locationUUID IN %@)", self->_constrainLocationUUIDs];
    [v3 addObject:v23];
  }
  constrainSenders = self->_constrainSenders;
  if (constrainSenders && [(NSSet *)constrainSenders count])
  {
    v25 = (void *)MEMORY[0x1E4F28F60];
    v26 = +[_CDInteractionAdvisorSettings extractContactIdentifiers:self->_constrainSenders];
    v27 = [v25 predicateWithFormat:@"(sender.identifier IN %@)", v26];
    [v3 addObject:v27];
  }
  constrainRecipients = self->_constrainRecipients;
  if (constrainRecipients && [(NSSet *)constrainRecipients count])
  {
    v29 = (void *)MEMORY[0x1E4F28F60];
    v30 = +[_CDInteractionAdvisorSettings extractContactIdentifiers:self->_constrainRecipients];
    v31 = [v29 predicateWithFormat:@"(ANY recipients.identifier IN %@)", v30];
    [v3 addObject:v31];
  }
  if ([(NSSet *)self->_constrainPersonIds count])
  {
    v32 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(sender.personId IN %@)", self->_constrainPersonIds];
    v33 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(ANY recipients.personId IN %@)", self->_constrainPersonIds];
    v34 = *(void **)(v13 + 2976);
    v67[0] = v32;
    v67[1] = v33;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
    v36 = [v34 orPredicateWithSubpredicates:v35];
    [v3 addObject:v36];
  }
  if ([(NSSet *)self->_constrainPersonIdType count])
  {
    v37 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(sender.personIdType IN %@)", self->_constrainPersonIdType];
    v38 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(ANY recipients.personIdType IN %@)", self->_constrainPersonIdType];
    v39 = *(void **)(v13 + 2976);
    v66[0] = v37;
    v66[1] = v38;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
    v41 = [v39 orPredicateWithSubpredicates:v40];
    [v3 addObject:v41];
  }
  constrainKeywords = self->_constrainKeywords;
  if (constrainKeywords && [(NSSet *)constrainKeywords count])
  {
    v43 = (void *)MEMORY[0x1E4F28F60];
    v44 = [(NSSet *)self->_constrainKeywords allObjects];
    v45 = [v43 predicateWithFormat:@"(ANY keywords.keyword IN %@)", v44];
    [v3 addObject:v45];
  }
  ignoreInteractionUUIDs = self->_ignoreInteractionUUIDs;
  if (ignoreInteractionUUIDs && [(NSSet *)ignoreInteractionUUIDs count])
  {
    v47 = (void *)MEMORY[0x1E4F28F60];
    v48 = [(NSSet *)self->_ignoreInteractionUUIDs allObjects];
    v49 = [v47 predicateWithFormat:@"(NOT (uuid IN %@))", v48];
    [v3 addObject:v49];
  }
  if (self->_constrainMaxRecipientCount >= 1)
  {
    v50 = (void *)MEMORY[0x1E4F28F60];
    v51 = objc_msgSend(NSNumber, "numberWithInteger:");
    v52 = [v50 predicateWithFormat:@"(recipientCount != nil AND recipientCount <= %@)", v51];

    v53 = (void *)MEMORY[0x1E4F28F60];
    v54 = [NSNumber numberWithInteger:self->_constrainMaxRecipientCount];
    v55 = [v53 predicateWithFormat:@"(recipientCount == nil AND recipients.@count <= %@)", v54];

    v56 = *(void **)(v13 + 2976);
    v65[0] = v52;
    v65[1] = v55;
    v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];
    v58 = [v56 orPredicateWithSubpredicates:v57];
    [v3 addObject:v58];
  }
  if ([v3 count]) {
    [*(id *)(v13 + 2976) andPredicateWithSubpredicates:v3];
  }
  else {
  v59 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }

  return v59;
}

- (NSString)interactionLocationUUID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (id)contactPredicate
{
  v11[3] = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_contactPrefix length])
  {
    v3 = [NSString stringWithFormat:@" %@", self->_contactPrefix];
    v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(identifier BEGINSWITH[cd] %@)", self->_contactPrefix];
    v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(displayName BEGINSWITH[cd] %@)", self->_contactPrefix];
    v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(displayName CONTAINS[cd] %@)", v3];
    v7 = (void *)MEMORY[0x1E4F28BA0];
    v11[0] = v4;
    v11[1] = v5;
    v11[2] = v6;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
    v9 = [v7 orPredicateWithSubpredicates:v8];
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CDInteractionAdvisorSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)_CDInteractionAdvisorSettings;
  v5 = [(_CDInteractionAdvisorSettings *)&v60 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interactionDate"];
    interactionDate = v5->_interactionDate;
    v5->_interactionDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interactionTitle"];
    interactionTitle = v5->_interactionTitle;
    v5->_interactionTitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interactionLocationUUID"];
    interactionLocationUUID = v5->_interactionLocationUUID;
    v5->_interactionLocationUUID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactPrefix"];
    contactPrefix = v5->_contactPrefix;
    v5->_contactPrefix = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"consumerIdentifier"];
    consumerIdentifier = v5->_consumerIdentifier;
    v5->_consumerIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callerBundleId"];
    callerBundleId = v5->_callerBundleId;
    v5->_callerBundleId = (NSString *)v16;

    uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"constrainDirections"];
    constrainDirections = v5->_constrainDirections;
    v5->_constrainDirections = (NSSet *)v21;

    uint64_t v23 = [v4 decodeObjectOfClasses:v20 forKey:@"constrainMechanisms"];
    constrainMechanisms = v5->_constrainMechanisms;
    v5->_constrainMechanisms = (NSSet *)v23;

    uint64_t v25 = [v4 decodeObjectOfClasses:v20 forKey:@"constrainPersonIdType"];
    constrainPersonIdType = v5->_constrainPersonIdType;
    v5->_constrainPersonIdType = (NSSet *)v25;

    v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    v30 = objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"constrainSenders"];
    constrainSenders = v5->_constrainSenders;
    v5->_constrainSenders = (NSSet *)v31;

    uint64_t v33 = [v4 decodeObjectOfClasses:v30 forKey:@"constrainRecipients"];
    constrainRecipients = v5->_constrainRecipients;
    v5->_constrainRecipients = (NSSet *)v33;

    v35 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v36 = objc_opt_class();
    v37 = objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:@"constrainPersonIds"];
    constrainPersonIds = v5->_constrainPersonIds;
    v5->_constrainPersonIds = (NSSet *)v38;

    uint64_t v40 = [v4 decodeObjectOfClasses:v37 forKey:@"constrainKeywords"];
    constrainKeywords = v5->_constrainKeywords;
    v5->_constrainKeywords = (NSSet *)v40;

    uint64_t v42 = [v4 decodeObjectOfClasses:v37 forKey:@"seedIdentifiers"];
    seedIdentifiers = v5->_seedIdentifiers;
    v5->_seedIdentifiers = (NSSet *)v42;

    uint64_t v44 = [v4 decodeObjectOfClasses:v37 forKey:@"constrainBundleIds"];
    constrainBundleIds = v5->_constrainBundleIds;
    v5->_constrainBundleIds = (NSSet *)v44;

    uint64_t v46 = [v4 decodeObjectOfClasses:v37 forKey:@"constrainAccounts"];
    constrainAccounts = v5->_constrainAccounts;
    v5->_constrainAccounts = (NSSet *)v46;

    uint64_t v48 = [v4 decodeObjectOfClasses:v37 forKey:@"constrainLocationUUIDs"];
    constrainLocationUUIDs = v5->_constrainLocationUUIDs;
    v5->_constrainLocationUUIDs = (NSSet *)v48;

    uint64_t v50 = [v4 decodeObjectOfClasses:v37 forKey:@"constrainDomainIdentifiers"];
    constrainDomainIdentifiers = v5->_constrainDomainIdentifiers;
    v5->_constrainDomainIdentifiers = (NSSet *)v50;

    uint64_t v52 = [v4 decodeObjectOfClasses:v37 forKey:@"ignoreInteractionUUIDs"];
    ignoreInteractionUUIDs = v5->_ignoreInteractionUUIDs;
    v5->_ignoreInteractionUUIDs = (NSSet *)v52;

    uint64_t v54 = [v4 decodeObjectOfClasses:v37 forKey:@"ignoreContactIdentifiers"];
    ignoreContactIdentifiers = v5->_ignoreContactIdentifiers;
    v5->_ignoreContactIdentifiers = (NSSet *)v54;

    uint64_t v56 = [v4 decodeObjectOfClasses:v37 forKey:@"constrainIdentifiers"];
    constrainIdentifiers = v5->_constrainIdentifiers;
    v5->_constrainIdentifiers = (NSSet *)v56;

    v5->_resultLimit = [v4 decodeInt64ForKey:@"resultLimit"];
    v5->_useFuture = [v4 decodeBoolForKey:@"useFutureInteractions"];
    v5->_aggregateByIdentifier = [v4 decodeBoolForKey:@"aggregateByIdentifier"];
    v5->_requireOutgoingInteraction = [v4 decodeBoolForKey:@"requireOutgoingInteraction"];
    v5->_constrainMaxRecipientCount = [v4 decodeInt64ForKey:@"constrainMaxRecipientCount"];
    v58 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  interactionDate = self->_interactionDate;
  id v5 = a3;
  [v5 encodeObject:interactionDate forKey:@"interactionDate"];
  [v5 encodeObject:self->_interactionTitle forKey:@"interactionTitle"];
  [v5 encodeObject:self->_interactionLocationUUID forKey:@"interactionLocationUUID"];
  [v5 encodeObject:self->_contactPrefix forKey:@"contactPrefix"];
  [v5 encodeObject:self->_seedIdentifiers forKey:@"seedIdentifiers"];
  [v5 encodeObject:self->_constrainDirections forKey:@"constrainDirections"];
  [v5 encodeObject:self->_constrainMechanisms forKey:@"constrainMechanisms"];
  [v5 encodeObject:self->_constrainBundleIds forKey:@"constrainBundleIds"];
  [v5 encodeObject:self->_constrainAccounts forKey:@"constrainAccounts"];
  [v5 encodeObject:self->_constrainDomainIdentifiers forKey:@"constrainDomainIdentifiers"];
  [v5 encodeObject:self->_constrainSenders forKey:@"constrainSenders"];
  [v5 encodeObject:self->_constrainRecipients forKey:@"constrainRecipients"];
  [v5 encodeObject:self->_constrainKeywords forKey:@"constrainKeywords"];
  [v5 encodeObject:self->_constrainLocationUUIDs forKey:@"constrainLocationUUIDs"];
  [v5 encodeObject:self->_constrainIdentifiers forKey:@"constrainIdentifiers"];
  [v5 encodeObject:self->_constrainPersonIds forKey:@"constrainPersonIds"];
  [v5 encodeObject:self->_constrainPersonIdType forKey:@"constrainPersonIdType"];
  [v5 encodeInt64:self->_resultLimit forKey:@"resultLimit"];
  [v5 encodeObject:self->_ignoreContactIdentifiers forKey:@"ignoreContactIdentifiers"];
  [v5 encodeObject:self->_ignoreInteractionUUIDs forKey:@"ignoreInteractionUUIDs"];
  [v5 encodeBool:self->_useFuture forKey:@"useFutureInteractions"];
  [v5 encodeBool:self->_aggregateByIdentifier forKey:@"aggregateByIdentifier"];
  [v5 encodeBool:self->_requireOutgoingInteraction forKey:@"requireOutgoingInteraction"];
  [v5 encodeInt64:self->_constrainMaxRecipientCount forKey:@"constrainMaxRecipientCount"];
  [v5 encodeObject:self->_consumerIdentifier forKey:@"consumerIdentifier"];
  [v5 encodeObject:self->_callerBundleId forKey:@"callerBundleId"];
}

+ (id)interactionAdvisorSettingsDefault
{
  v2 = objc_alloc_init(_CDInteractionAdvisorSettings);
  return v2;
}

- (_CDInteractionAdvisorSettings)init
{
  v10.receiver = self;
  v10.super_class = (Class)_CDInteractionAdvisorSettings;
  v2 = [(_CDInteractionAdvisorSettings *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_resultLimit = 30;
    v2->_useFuture = 0;
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    interactionDate = v3->_interactionDate;
    v3->_interactionDate = (NSDate *)v4;

    v3->_constrainMaxRecipientCount = -1;
    uint64_t v6 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v7 = [v6 bundleIdentifier];
    callerBundleId = v3->_callerBundleId;
    v3->_callerBundleId = (NSString *)v7;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[_CDInteractionAdvisorSettings interactionAdvisorSettingsDefault];
  id v5 = [(_CDInteractionAdvisorSettings *)self interactionDate];
  [v4 setInteractionDate:v5];

  uint64_t v6 = [(_CDInteractionAdvisorSettings *)self interactionTitle];
  [v4 setInteractionTitle:v6];

  uint64_t v7 = [(_CDInteractionAdvisorSettings *)self interactionLocationUUID];
  [v4 setInteractionLocationUUID:v7];

  uint64_t v8 = [(_CDInteractionAdvisorSettings *)self contactPrefix];
  [v4 setContactPrefix:v8];

  v9 = [(_CDInteractionAdvisorSettings *)self seedIdentifiers];
  [v4 setSeedIdentifiers:v9];

  objc_super v10 = [(_CDInteractionAdvisorSettings *)self constrainDirections];
  [v4 setConstrainDirections:v10];

  v11 = [(_CDInteractionAdvisorSettings *)self constrainMechanisms];
  [v4 setConstrainMechanisms:v11];

  uint64_t v12 = [(_CDInteractionAdvisorSettings *)self constrainBundleIds];
  [v4 setConstrainBundleIds:v12];

  unint64_t v13 = [(_CDInteractionAdvisorSettings *)self constrainAccounts];
  [v4 setConstrainAccounts:v13];

  uint64_t v14 = [(_CDInteractionAdvisorSettings *)self constrainDomainIdentifiers];
  [v4 setConstrainDomainIdentifiers:v14];

  v15 = [(_CDInteractionAdvisorSettings *)self constrainSenders];
  [v4 setConstrainSenders:v15];

  uint64_t v16 = [(_CDInteractionAdvisorSettings *)self constrainRecipients];
  [v4 setConstrainRecipients:v16];

  uint64_t v17 = [(_CDInteractionAdvisorSettings *)self constrainKeywords];
  [v4 setConstrainKeywords:v17];

  uint64_t v18 = [(_CDInteractionAdvisorSettings *)self constrainLocationUUIDs];
  [v4 setConstrainLocationUUIDs:v18];

  objc_msgSend(v4, "setResultLimit:", -[_CDInteractionAdvisorSettings resultLimit](self, "resultLimit"));
  uint64_t v19 = [(_CDInteractionAdvisorSettings *)self constrainIdentifiers];
  [v4 setConstrainIdentifiers:v19];

  v20 = [(_CDInteractionAdvisorSettings *)self constrainPersonIds];
  [v4 setConstrainPersonIds:v20];

  uint64_t v21 = [(_CDInteractionAdvisorSettings *)self constrainPersonIdType];
  [v4 setConstrainPersonIdType:v21];

  v22 = [(_CDInteractionAdvisorSettings *)self ignoreContactIdentifiers];
  [v4 setIgnoreContactIdentifiers:v22];

  uint64_t v23 = [(_CDInteractionAdvisorSettings *)self ignoreInteractionUUIDs];
  [v4 setIgnoreInteractionUUIDs:v23];

  objc_msgSend(v4, "setUseFuture:", -[_CDInteractionAdvisorSettings useFuture](self, "useFuture"));
  objc_msgSend(v4, "setAggregateByIdentifier:", -[_CDInteractionAdvisorSettings aggregateByIdentifier](self, "aggregateByIdentifier"));
  objc_msgSend(v4, "setRequireOutgoingInteraction:", -[_CDInteractionAdvisorSettings requireOutgoingInteraction](self, "requireOutgoingInteraction"));
  objc_msgSend(v4, "setConstrainMaxRecipientCount:", -[_CDInteractionAdvisorSettings constrainMaxRecipientCount](self, "constrainMaxRecipientCount"));
  v24 = [(_CDInteractionAdvisorSettings *)self consumerIdentifier];
  [v4 setConsumerIdentifier:v24];

  uint64_t v25 = [(_CDInteractionAdvisorSettings *)self callerBundleId];
  [v4 setCallerBundleId:v25];

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendString:@"Settings { \n"];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_CDInteractionAdvisorSettings resultLimit](self, "resultLimit"));
  [v3 appendFormat:@"            resultLimit: %@\n", v4];

  id v5 = [(_CDInteractionAdvisorSettings *)self interactionPredicate];
  [v3 appendFormat:@"              predicate: %@\n", v5];

  uint64_t v6 = [NSNumber numberWithBool:self->_useFuture];
  [v3 appendFormat:@"              useFuture: %@\n", v6];

  uint64_t v7 = [NSNumber numberWithBool:self->_aggregateByIdentifier];
  [v3 appendFormat:@"  aggregateByIdentifier: %@\n", v7];

  uint64_t v8 = [NSNumber numberWithBool:self->_requireOutgoingInteraction];
  [v3 appendFormat:@"  requireOutInteraction: %@\n", v8];

  if (self->_interactionDate) {
    [v3 appendFormat:@"                   date: %@\n", self->_interactionDate];
  }
  if (self->_interactionTitle) {
    [v3 appendFormat:@"                  title: %@\n", self->_interactionTitle];
  }
  if (self->_seedIdentifiers) {
    [v3 appendFormat:@"        seedIdentifiers: %@\n", self->_seedIdentifiers];
  }
  if (self->_interactionLocationUUID) {
    [v3 appendFormat:@"           locationUUID: %@\n", self->_interactionLocationUUID];
  }
  if (self->_constrainBundleIds) {
    [v3 appendFormat:@"              bundleIds: %@\n", self->_constrainBundleIds];
  }
  if (self->_contactPrefix) {
    [v3 appendFormat:@"          contactPrefix: %@\n", self->_contactPrefix];
  }
  if (self->_constrainSenders) {
    [v3 appendFormat:@"       constrainSenders: %@\n", self->_constrainSenders];
  }
  if (self->_constrainRecipients) {
    [v3 appendFormat:@"    constrainRecipients: %@\n", self->_constrainRecipients];
  }
  if (self->_constrainIdentifiers) {
    [v3 appendFormat:@"   constrainIdentifiers: %@\n", self->_constrainIdentifiers];
  }
  if (self->_constrainPersonIds) {
    [v3 appendFormat:@"     constrainPersonIds: %@\n", self->_constrainPersonIds];
  }
  if (self->_constrainPersonIdType) {
    [v3 appendFormat:@"  constrainPersonIdType: %@\n", self->_constrainPersonIdType];
  }
  if (self->_ignoreContactIdentifiers) {
    [v3 appendFormat:@"     ignoreIdentifiers: %@\n", self->_ignoreContactIdentifiers];
  }
  if (self->_constrainMaxRecipientCount != -1)
  {
    v9 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v3 appendFormat:@"     maxRecipientCount: %@\n", v9];
  }
  if (self->_consumerIdentifier) {
    [v3 appendFormat:@"    consumerIdentifier: %@\n", self->_consumerIdentifier];
  }
  if (self->_callerBundleId) {
    [v3 appendFormat:@"        callerBundleId: %@\n", self->_callerBundleId];
  }
  [v3 appendFormat:@" }\n"];
  return v3;
}

+ (id)extractContactIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = [v10 identifier];
          [v4 addObject:v11];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v4, "addObject:", v10, (void)v13);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSDate)interactionDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInteractionDate:(id)a3
{
}

- (NSString)interactionTitle
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInteractionTitle:(id)a3
{
}

- (NSSet)seedIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSeedIdentifiers:(id)a3
{
}

- (void)setInteractionLocationUUID:(id)a3
{
}

- (NSString)contactPrefix
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setContactPrefix:(id)a3
{
}

- (NSSet)constrainDirections
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConstrainDirections:(id)a3
{
}

- (NSSet)constrainMechanisms
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConstrainMechanisms:(id)a3
{
}

- (NSSet)constrainBundleIds
{
  return (NSSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConstrainBundleIds:(id)a3
{
}

- (NSSet)constrainAccounts
{
  return (NSSet *)objc_getProperty(self, a2, 80, 1);
}

- (void)setConstrainAccounts:(id)a3
{
}

- (NSSet)constrainDomainIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConstrainDomainIdentifiers:(id)a3
{
}

- (NSSet)constrainLocationUUIDs
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setConstrainLocationUUIDs:(id)a3
{
}

- (NSSet)constrainSenders
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setConstrainSenders:(id)a3
{
}

- (NSSet)constrainRecipients
{
  return (NSSet *)objc_getProperty(self, a2, 112, 1);
}

- (void)setConstrainRecipients:(id)a3
{
}

- (NSSet)constrainKeywords
{
  return (NSSet *)objc_getProperty(self, a2, 120, 1);
}

- (void)setConstrainKeywords:(id)a3
{
}

- (NSSet)constrainIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 128, 1);
}

- (void)setConstrainIdentifiers:(id)a3
{
}

- (NSSet)constrainPersonIds
{
  return (NSSet *)objc_getProperty(self, a2, 136, 1);
}

- (void)setConstrainPersonIds:(id)a3
{
}

- (NSSet)constrainPersonIdType
{
  return (NSSet *)objc_getProperty(self, a2, 144, 1);
}

- (void)setConstrainPersonIdType:(id)a3
{
}

- (int64_t)constrainMaxRecipientCount
{
  return self->_constrainMaxRecipientCount;
}

- (void)setConstrainMaxRecipientCount:(int64_t)a3
{
  self->_constrainMaxRecipientCount = a3;
}

- (unint64_t)resultLimit
{
  return self->_resultLimit;
}

- (void)setResultLimit:(unint64_t)a3
{
  self->_resultLimit = a3;
}

- (BOOL)useFuture
{
  return self->_useFuture;
}

- (void)setUseFuture:(BOOL)a3
{
  self->_useFuture = a3;
}

- (BOOL)aggregateByIdentifier
{
  return self->_aggregateByIdentifier;
}

- (void)setAggregateByIdentifier:(BOOL)a3
{
  self->_aggregateByIdentifier = a3;
}

- (BOOL)requireOutgoingInteraction
{
  return self->_requireOutgoingInteraction;
}

- (void)setRequireOutgoingInteraction:(BOOL)a3
{
  self->_requireOutgoingInteraction = a3;
}

- (NSSet)ignoreContactIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 168, 1);
}

- (void)setIgnoreContactIdentifiers:(id)a3
{
}

- (NSSet)ignoreInteractionUUIDs
{
  return (NSSet *)objc_getProperty(self, a2, 176, 1);
}

- (void)setIgnoreInteractionUUIDs:(id)a3
{
}

- (NSString)consumerIdentifier
{
  return self->_consumerIdentifier;
}

- (void)setConsumerIdentifier:(id)a3
{
}

- (NSString)callerBundleId
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setCallerBundleId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callerBundleId, 0);
  objc_storeStrong((id *)&self->_consumerIdentifier, 0);
  objc_storeStrong((id *)&self->_ignoreInteractionUUIDs, 0);
  objc_storeStrong((id *)&self->_ignoreContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_constrainPersonIdType, 0);
  objc_storeStrong((id *)&self->_constrainPersonIds, 0);
  objc_storeStrong((id *)&self->_constrainIdentifiers, 0);
  objc_storeStrong((id *)&self->_constrainKeywords, 0);
  objc_storeStrong((id *)&self->_constrainRecipients, 0);
  objc_storeStrong((id *)&self->_constrainSenders, 0);
  objc_storeStrong((id *)&self->_constrainLocationUUIDs, 0);
  objc_storeStrong((id *)&self->_constrainDomainIdentifiers, 0);
  objc_storeStrong((id *)&self->_constrainAccounts, 0);
  objc_storeStrong((id *)&self->_constrainBundleIds, 0);
  objc_storeStrong((id *)&self->_constrainMechanisms, 0);
  objc_storeStrong((id *)&self->_constrainDirections, 0);
  objc_storeStrong((id *)&self->_contactPrefix, 0);
  objc_storeStrong((id *)&self->_interactionLocationUUID, 0);
  objc_storeStrong((id *)&self->_seedIdentifiers, 0);
  objc_storeStrong((id *)&self->_interactionTitle, 0);
  objc_storeStrong((id *)&self->_interactionDate, 0);
}

@end