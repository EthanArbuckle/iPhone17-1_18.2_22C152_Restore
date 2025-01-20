@interface _CDPeopleSuggesterSettings
+ (id)defaultSettings;
- (BOOL)aggregateByIdentifier;
- (BOOL)inferActiveInteractions;
- (BOOL)requireOutgoingInteraction;
- (BOOL)useFuture;
- (BOOL)useTitleToContrainKeywords;
- (NSSet)constrainAccounts;
- (NSSet)constrainBundleIds;
- (NSSet)constrainDomainIdentifiers;
- (NSSet)constrainIdentifiers;
- (NSSet)constrainMechanisms;
- (NSSet)constrainPersonIdType;
- (NSSet)constrainPersonIds;
- (NSSet)ignoreContactIdentifiers;
- (_CDPeopleSuggesterSettings)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)constrainMaxRecipientCount;
- (unint64_t)maxNumberOfPeopleSuggested;
- (void)setAggregateByIdentifier:(BOOL)a3;
- (void)setConstrainAccounts:(id)a3;
- (void)setConstrainBundleIds:(id)a3;
- (void)setConstrainDomainIdentifiers:(id)a3;
- (void)setConstrainIdentifiers:(id)a3;
- (void)setConstrainMaxRecipientCount:(unint64_t)a3;
- (void)setConstrainMechanisms:(id)a3;
- (void)setConstrainPersonIdType:(id)a3;
- (void)setConstrainPersonIds:(id)a3;
- (void)setIgnoreContactIdentifiers:(id)a3;
- (void)setInferActiveInteractions:(BOOL)a3;
- (void)setMaxNumberOfPeopleSuggested:(unint64_t)a3;
- (void)setRequireOutgoingInteraction:(BOOL)a3;
- (void)setUseFuture:(BOOL)a3;
- (void)setUseTitleToContrainKeywords:(BOOL)a3;
@end

@implementation _CDPeopleSuggesterSettings

+ (id)defaultSettings
{
  v2 = objc_alloc_init(_CDPeopleSuggesterSettings);
  return v2;
}

- (_CDPeopleSuggesterSettings)init
{
  v10.receiver = self;
  v10.super_class = (Class)_CDPeopleSuggesterSettings;
  v2 = [(_CDPeopleSuggesterSettings *)&v10 init];
  if (v2)
  {
    v3 = +[_CDInteractionAdvisorSettings interactionAdvisorSettingsDefault];
    uint64_t v4 = [v3 resultLimit];
    constrainMechanisms = v2->_constrainMechanisms;
    v2->_maxNumberOfPeopleSuggested = v4;
    v2->_constrainMechanisms = 0;

    constrainBundleIds = v2->_constrainBundleIds;
    v2->_constrainBundleIds = 0;

    constrainAccounts = v2->_constrainAccounts;
    v2->_constrainAccounts = 0;

    constrainDomainIdentifiers = v2->_constrainDomainIdentifiers;
    v2->_constrainDomainIdentifiers = 0;

    *(_DWORD *)&v2->_useFuture = 65793;
    v2->_constrainMaxRecipientCount = [v3 constrainMaxRecipientCount];
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    objc_msgSend(v4, "setMaxNumberOfPeopleSuggested:", -[_CDPeopleSuggesterSettings maxNumberOfPeopleSuggested](self, "maxNumberOfPeopleSuggested"));
    v5 = [(_CDPeopleSuggesterSettings *)self constrainMechanisms];
    [v4 setConstrainMechanisms:v5];

    v6 = [(_CDPeopleSuggesterSettings *)self constrainBundleIds];
    [v4 setConstrainBundleIds:v6];

    v7 = [(_CDPeopleSuggesterSettings *)self constrainAccounts];
    [v4 setConstrainAccounts:v7];

    v8 = [(_CDPeopleSuggesterSettings *)self constrainDomainIdentifiers];
    [v4 setConstrainDomainIdentifiers:v8];

    v9 = [(_CDPeopleSuggesterSettings *)self constrainIdentifiers];
    [v4 setConstrainIdentifiers:v9];

    objc_super v10 = [(_CDPeopleSuggesterSettings *)self constrainPersonIds];
    [v4 setConstrainPersonIds:v10];

    v11 = [(_CDPeopleSuggesterSettings *)self constrainPersonIdType];
    [v4 setConstrainPersonIdType:v11];

    objc_msgSend(v4, "setConstrainMaxRecipientCount:", -[_CDPeopleSuggesterSettings constrainMaxRecipientCount](self, "constrainMaxRecipientCount"));
    objc_msgSend(v4, "setUseFuture:", -[_CDPeopleSuggesterSettings useFuture](self, "useFuture"));
    objc_msgSend(v4, "setAggregateByIdentifier:", -[_CDPeopleSuggesterSettings aggregateByIdentifier](self, "aggregateByIdentifier"));
    objc_msgSend(v4, "setRequireOutgoingInteraction:", -[_CDPeopleSuggesterSettings requireOutgoingInteraction](self, "requireOutgoingInteraction"));
    objc_msgSend(v4, "setUseTitleToContrainKeywords:", -[_CDPeopleSuggesterSettings useTitleToContrainKeywords](self, "useTitleToContrainKeywords"));
    v12 = [(_CDPeopleSuggesterSettings *)self ignoreContactIdentifiers];
    [v4 setIgnoreContactIdentifiers:v12];

    objc_msgSend(v4, "setInferActiveInteractions:", -[_CDPeopleSuggesterSettings inferActiveInteractions](self, "inferActiveInteractions"));
  }
  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithString:@"Settings {\n"];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_CDPeopleSuggesterSettings maxNumberOfPeopleSuggested](self, "maxNumberOfPeopleSuggested"));
  [v3 appendFormat:@"    maxNumberOfPeopleSuggested: %@\n", v4];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[_CDPeopleSuggesterSettings useFuture](self, "useFuture"));
  [v3 appendFormat:@"                     useFuture: %@\n", v5];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[_CDPeopleSuggesterSettings aggregateByIdentifier](self, "aggregateByIdentifier"));
  [v3 appendFormat:@"         aggregateByIdentifier: %@\n", v6];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_CDPeopleSuggesterSettings requireOutgoingInteraction](self, "requireOutgoingInteraction"));
  [v3 appendFormat:@"    requireOutgoingInteraction: %@\n", v7];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_CDPeopleSuggesterSettings useTitleToContrainKeywords](self, "useTitleToContrainKeywords"));
  [v3 appendFormat:@"    useTitleToContrainKeywords: %@\n", v8];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[_CDPeopleSuggesterSettings inferActiveInteractions](self, "inferActiveInteractions"));
  [v3 appendFormat:@"       inferActiveInteractions: %@\n", v9];

  objc_super v10 = [(_CDPeopleSuggesterSettings *)self constrainMechanisms];
  [v3 appendFormat:@"           constrainMechanisms: %@\n", v10];

  v11 = [(_CDPeopleSuggesterSettings *)self constrainBundleIds];
  [v3 appendFormat:@"            constrainBundleIds: %@\n", v11];

  v12 = [(_CDPeopleSuggesterSettings *)self constrainAccounts];
  [v3 appendFormat:@"             constrainAccounts: %@\n", v12];

  v13 = [(_CDPeopleSuggesterSettings *)self constrainDomainIdentifiers];
  [v3 appendFormat:@"    constrainDomainIdentifiers: %@\n", v13];

  v14 = [(_CDPeopleSuggesterSettings *)self constrainIdentifiers];
  [v3 appendFormat:@"          constrainIdentifiers: %@\n", v14];

  v15 = [(_CDPeopleSuggesterSettings *)self constrainPersonIds];
  [v3 appendFormat:@"            constrainPersonIds: %@\n", v15];

  v16 = [(_CDPeopleSuggesterSettings *)self constrainPersonIdType];
  [v3 appendFormat:@"         constrainPersonIdType: %@\n", v16];

  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_CDPeopleSuggesterSettings constrainMaxRecipientCount](self, "constrainMaxRecipientCount"));
  [v3 appendFormat:@"    constrainMaxRecipientCount: %@\n", v17];

  v18 = [(_CDPeopleSuggesterSettings *)self ignoreContactIdentifiers];
  [v3 appendFormat:@"      ignoreContactIdentifiers: %@\n", v18];

  [v3 appendFormat:@"}\n"];
  return v3;
}

- (unint64_t)maxNumberOfPeopleSuggested
{
  return self->_maxNumberOfPeopleSuggested;
}

- (void)setMaxNumberOfPeopleSuggested:(unint64_t)a3
{
  self->_maxNumberOfPeopleSuggested = a3;
}

- (NSSet)constrainMechanisms
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConstrainMechanisms:(id)a3
{
}

- (NSSet)constrainBundleIds
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConstrainBundleIds:(id)a3
{
}

- (NSSet)constrainAccounts
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConstrainAccounts:(id)a3
{
}

- (NSSet)constrainDomainIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setConstrainDomainIdentifiers:(id)a3
{
}

- (NSSet)constrainIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConstrainIdentifiers:(id)a3
{
}

- (NSSet)constrainPersonIds
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConstrainPersonIds:(id)a3
{
}

- (NSSet)constrainPersonIdType
{
  return (NSSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConstrainPersonIdType:(id)a3
{
}

- (unint64_t)constrainMaxRecipientCount
{
  return self->_constrainMaxRecipientCount;
}

- (void)setConstrainMaxRecipientCount:(unint64_t)a3
{
  self->_constrainMaxRecipientCount = a3;
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

- (BOOL)useTitleToContrainKeywords
{
  return self->_useTitleToContrainKeywords;
}

- (void)setUseTitleToContrainKeywords:(BOOL)a3
{
  self->_useTitleToContrainKeywords = a3;
}

- (BOOL)inferActiveInteractions
{
  return self->_inferActiveInteractions;
}

- (void)setInferActiveInteractions:(BOOL)a3
{
  self->_inferActiveInteractions = a3;
}

- (NSSet)ignoreContactIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setIgnoreContactIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_constrainPersonIdType, 0);
  objc_storeStrong((id *)&self->_constrainPersonIds, 0);
  objc_storeStrong((id *)&self->_constrainIdentifiers, 0);
  objc_storeStrong((id *)&self->_constrainDomainIdentifiers, 0);
  objc_storeStrong((id *)&self->_constrainAccounts, 0);
  objc_storeStrong((id *)&self->_constrainBundleIds, 0);
  objc_storeStrong((id *)&self->_constrainMechanisms, 0);
}

@end