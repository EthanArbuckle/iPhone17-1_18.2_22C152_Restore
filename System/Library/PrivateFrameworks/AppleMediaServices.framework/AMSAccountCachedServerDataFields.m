@interface AMSAccountCachedServerDataFields
+ (BOOL)supportsSecureCoding;
- (AMSAccountCachedServerDataFields)initWithCoder:(id)a3;
- (BOOL)autoPlayEnabled;
- (BOOL)hasAgreedToAppClipTerms;
- (BOOL)hasAgreedToTerms;
- (BOOL)hasHardwareWatchOffer;
- (BOOL)hasSubscriptionFamilySharingEnabled;
- (BOOL)isAskToBuy;
- (BOOL)isDisabledAccount;
- (BOOL)isInBadCredit;
- (BOOL)isInFamily;
- (BOOL)isInRestrictedRegion;
- (BOOL)isManagedAccount;
- (BOOL)isRestrictedAccount;
- (BOOL)personalization;
- (BOOL)retailDemo;
- (BOOL)underThirteen;
- (NSDate)expiration;
- (NSNumber)isU18OrCountrysEquivalent;
- (NSNumber)oneAccountLinkedDSID;
- (NSString)acAccountName;
- (NSString)combinedStoreFrontID;
- (NSString)creditBalance;
- (NSString)firstName;
- (NSString)iso2CountryCode;
- (NSString)iso3CountryCode;
- (NSString)isoCountryCode;
- (NSString)lastName;
- (NSString)storefrontId;
- (unint64_t)accountFlagsVersion;
- (unint64_t)identityLastVerified;
- (unint64_t)verifiedExpirationDate;
- (void)encodeWithCoder:(id)a3;
- (void)setAcAccountName:(id)a3;
- (void)setAccountFlagsVersion:(unint64_t)a3;
- (void)setAutoPlayEnabled:(BOOL)a3;
- (void)setCombinedStoreFrontID:(id)a3;
- (void)setCreditBalance:(id)a3;
- (void)setExpiration:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setHasAgreedToAppClipTerms:(BOOL)a3;
- (void)setHasAgreedToTerms:(BOOL)a3;
- (void)setHasHardwareWatchOffer:(BOOL)a3;
- (void)setHasSubscriptionFamilySharingEnabled:(BOOL)a3;
- (void)setIdentityLastVerified:(unint64_t)a3;
- (void)setIsAskToBuy:(BOOL)a3;
- (void)setIsDisabledAccount:(BOOL)a3;
- (void)setIsInBadCredit:(BOOL)a3;
- (void)setIsInFamily:(BOOL)a3;
- (void)setIsInRestrictedRegion:(BOOL)a3;
- (void)setIsManagedAccount:(BOOL)a3;
- (void)setIsRestrictedAccount:(BOOL)a3;
- (void)setIsU18OrCountrysEquivalent:(id)a3;
- (void)setIso2CountryCode:(id)a3;
- (void)setIso3CountryCode:(id)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setLastName:(id)a3;
- (void)setOneAccountLinkedDSID:(id)a3;
- (void)setPersonalization:(BOOL)a3;
- (void)setRetailDemo:(BOOL)a3;
- (void)setStorefrontId:(id)a3;
- (void)setUnderThirteen:(BOOL)a3;
- (void)setVerifiedExpirationDate:(unint64_t)a3;
@end

@implementation AMSAccountCachedServerDataFields

- (AMSAccountCachedServerDataFields)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)AMSAccountCachedServerDataFields;
  v5 = [(AMSAccountCachedServerDataFields *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kACAccountName"];
    acAccountName = v5->_acAccountName;
    v5->_acAccountName = (NSString *)v6;

    v5->_accountFlagsVersion = [v4 decodeInt64ForKey:@"kAccountFlagsVersion"];
    v5->_autoPlayEnabled = [v4 decodeBoolForKey:@"kAutoPlayEnabled"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCombinedStoreFrontID"];
    combinedStoreFrontID = v5->_combinedStoreFrontID;
    v5->_combinedStoreFrontID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCreditBalance"];
    creditBalance = v5->_creditBalance;
    v5->_creditBalance = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kFirstName"];
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v12;

    v5->_hasAgreedToAppClipTerms = [v4 decodeBoolForKey:@"kHasAgreedToAppClipTerms"];
    v5->_hasAgreedToTerms = [v4 decodeBoolForKey:@"kHasAgreedToTerms"];
    v5->_hasSubscriptionFamilySharingEnabled = [v4 decodeBoolForKey:@"kHasSubscriptionFamilySharingEnabled"];
    v5->_hasHardwareWatchOffer = [v4 decodeBoolForKey:@"kHasHardwareWatchOffer"];
    v5->_identityLastVerified = [v4 decodeInt64ForKey:@"kIdentityLastVerified"];
    v5->_isAskToBuy = [v4 decodeBoolForKey:@"kIsAskToBuy"];
    v5->_isDisabledAccount = [v4 decodeBoolForKey:@"kIsDisabledAccount"];
    v5->_isInBadCredit = [v4 decodeBoolForKey:@"kIsInBadCredit"];
    v5->_isInFamily = [v4 decodeBoolForKey:@"kIsInFamily"];
    v5->_isInRestrictedRegion = [v4 decodeBoolForKey:@"kIsInRestrictedRegion"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kIsU18OrCountrysEquivalent"];
    isU18OrCountrysEquivalent = v5->_isU18OrCountrysEquivalent;
    v5->_isU18OrCountrysEquivalent = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kISOCountryCode"];
    isoCountryCode = v5->_isoCountryCode;
    v5->_isoCountryCode = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kISO2CountryCode"];
    iso2CountryCode = v5->_iso2CountryCode;
    v5->_iso2CountryCode = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kISO3CountryCode"];
    iso3CountryCode = v5->_iso3CountryCode;
    v5->_iso3CountryCode = (NSString *)v20;

    v5->_isRestrictedAccount = [v4 decodeBoolForKey:@"kIsRestrictedAccount"];
    v5->_isManagedAccount = [v4 decodeBoolForKey:@"kIsManagedAccount"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kLastName"];
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kOneAccountLinkedDSID"];
    oneAccountLinkedDSID = v5->_oneAccountLinkedDSID;
    v5->_oneAccountLinkedDSID = (NSNumber *)v24;

    v5->_personalization = [v4 decodeBoolForKey:@"kPersonalization"];
    v5->_retailDemo = [v4 decodeBoolForKey:@"kRetailDemo"];
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kStorefrontId"];
    storefrontId = v5->_storefrontId;
    v5->_storefrontId = (NSString *)v26;

    v5->_underThirteen = [v4 decodeBoolForKey:@"kUnderThirteen"];
    v5->_verifiedExpirationDate = [v4 decodeInt64ForKey:@"kVerifiedExpirationDate"];
    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kExpiryTimestamp"];
    expiration = v5->_expiration;
    v5->_expiration = (NSDate *)v28;
  }
  return v5;
}

- (void)setVerifiedExpirationDate:(unint64_t)a3
{
  self->_verifiedExpirationDate = a3;
}

- (void)setUnderThirteen:(BOOL)a3
{
  self->_underThirteen = a3;
}

- (void)setRetailDemo:(BOOL)a3
{
  self->_retailDemo = a3;
}

- (void)setPersonalization:(BOOL)a3
{
  self->_personalization = a3;
}

- (void)setIsRestrictedAccount:(BOOL)a3
{
  self->_isRestrictedAccount = a3;
}

- (void)setIsManagedAccount:(BOOL)a3
{
  self->_isManagedAccount = a3;
}

- (void)setIsInRestrictedRegion:(BOOL)a3
{
  self->_isInRestrictedRegion = a3;
}

- (void)setIsInFamily:(BOOL)a3
{
  self->_isInFamily = a3;
}

- (void)setIsInBadCredit:(BOOL)a3
{
  self->_isInBadCredit = a3;
}

- (void)setIsDisabledAccount:(BOOL)a3
{
  self->_isDisabledAccount = a3;
}

- (void)setIsAskToBuy:(BOOL)a3
{
  self->_isAskToBuy = a3;
}

- (void)setIdentityLastVerified:(unint64_t)a3
{
  self->_identityLastVerified = a3;
}

- (void)setHasSubscriptionFamilySharingEnabled:(BOOL)a3
{
  self->_hasSubscriptionFamilySharingEnabled = a3;
}

- (void)setHasHardwareWatchOffer:(BOOL)a3
{
  self->_hasHardwareWatchOffer = a3;
}

- (void)setHasAgreedToTerms:(BOOL)a3
{
  self->_hasAgreedToTerms = a3;
}

- (void)setHasAgreedToAppClipTerms:(BOOL)a3
{
  self->_hasAgreedToAppClipTerms = a3;
}

- (void)setAutoPlayEnabled:(BOOL)a3
{
  self->_autoPlayEnabled = a3;
}

- (void)setAccountFlagsVersion:(unint64_t)a3
{
  self->_accountFlagsVersion = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AMSAccountCachedServerDataFields *)self acAccountName];
  [v4 encodeObject:v5 forKey:@"kACAccountName"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[AMSAccountCachedServerDataFields accountFlagsVersion](self, "accountFlagsVersion"), @"kAccountFlagsVersion");
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields autoPlayEnabled](self, "autoPlayEnabled"), @"kAutoPlayEnabled");
  uint64_t v6 = [(AMSAccountCachedServerDataFields *)self combinedStoreFrontID];
  [v4 encodeObject:v6 forKey:@"kCombinedStoreFrontID"];

  v7 = [(AMSAccountCachedServerDataFields *)self creditBalance];
  [v4 encodeObject:v7 forKey:@"kCreditBalance"];

  uint64_t v8 = [(AMSAccountCachedServerDataFields *)self firstName];
  [v4 encodeObject:v8 forKey:@"kFirstName"];

  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields hasAgreedToAppClipTerms](self, "hasAgreedToAppClipTerms"), @"kHasAgreedToAppClipTerms");
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields hasAgreedToTerms](self, "hasAgreedToTerms"), @"kHasAgreedToTerms");
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields hasSubscriptionFamilySharingEnabled](self, "hasSubscriptionFamilySharingEnabled"), @"kHasSubscriptionFamilySharingEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields hasHardwareWatchOffer](self, "hasHardwareWatchOffer"), @"kHasHardwareWatchOffer");
  objc_msgSend(v4, "encodeInt64:forKey:", -[AMSAccountCachedServerDataFields identityLastVerified](self, "identityLastVerified"), @"kIdentityLastVerified");
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields isAskToBuy](self, "isAskToBuy"), @"kIsAskToBuy");
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields isDisabledAccount](self, "isDisabledAccount"), @"kIsDisabledAccount");
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields isInBadCredit](self, "isInBadCredit"), @"kIsInBadCredit");
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields isInFamily](self, "isInFamily"), @"kIsInFamily");
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields isInRestrictedRegion](self, "isInRestrictedRegion"), @"kIsInRestrictedRegion");
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields isDisabledAccount](self, "isDisabledAccount"), @"kIsDisabledAccount");
  v9 = [(AMSAccountCachedServerDataFields *)self isU18OrCountrysEquivalent];
  [v4 encodeObject:v9 forKey:@"kIsU18OrCountrysEquivalent"];

  uint64_t v10 = [(AMSAccountCachedServerDataFields *)self isoCountryCode];
  [v4 encodeObject:v10 forKey:@"kISOCountryCode"];

  v11 = [(AMSAccountCachedServerDataFields *)self iso2CountryCode];
  [v4 encodeObject:v11 forKey:@"kISO2CountryCode"];

  uint64_t v12 = [(AMSAccountCachedServerDataFields *)self iso3CountryCode];
  [v4 encodeObject:v12 forKey:@"kISO3CountryCode"];

  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields isRestrictedAccount](self, "isRestrictedAccount"), @"kIsRestrictedAccount");
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields isManagedAccount](self, "isManagedAccount"), @"kIsManagedAccount");
  v13 = [(AMSAccountCachedServerDataFields *)self lastName];
  [v4 encodeObject:v13 forKey:@"kLastName"];

  uint64_t v14 = [(AMSAccountCachedServerDataFields *)self oneAccountLinkedDSID];
  [v4 encodeObject:v14 forKey:@"kOneAccountLinkedDSID"];

  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields personalization](self, "personalization"), @"kPersonalization");
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields retailDemo](self, "retailDemo"), @"kRetailDemo");
  v15 = [(AMSAccountCachedServerDataFields *)self storefrontId];
  [v4 encodeObject:v15 forKey:@"kStorefrontId"];

  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields underThirteen](self, "underThirteen"), @"kUnderThirteen");
  objc_msgSend(v4, "encodeInt64:forKey:", -[AMSAccountCachedServerDataFields verifiedExpirationDate](self, "verifiedExpirationDate"), @"kVerifiedExpirationDate");
  id v16 = [(AMSAccountCachedServerDataFields *)self expiration];
  [v4 encodeObject:v16 forKey:@"kExpiryTimestamp"];
}

- (BOOL)isDisabledAccount
{
  return self->_isDisabledAccount;
}

- (unint64_t)verifiedExpirationDate
{
  return self->_verifiedExpirationDate;
}

- (BOOL)underThirteen
{
  return self->_underThirteen;
}

- (NSString)storefrontId
{
  return self->_storefrontId;
}

- (BOOL)retailDemo
{
  return self->_retailDemo;
}

- (BOOL)personalization
{
  return self->_personalization;
}

- (NSNumber)oneAccountLinkedDSID
{
  return self->_oneAccountLinkedDSID;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (NSString)iso3CountryCode
{
  return self->_iso3CountryCode;
}

- (NSString)iso2CountryCode
{
  return self->_iso2CountryCode;
}

- (NSNumber)isU18OrCountrysEquivalent
{
  return self->_isU18OrCountrysEquivalent;
}

- (BOOL)isRestrictedAccount
{
  return self->_isRestrictedAccount;
}

- (BOOL)isManagedAccount
{
  return self->_isManagedAccount;
}

- (BOOL)isInRestrictedRegion
{
  return self->_isInRestrictedRegion;
}

- (BOOL)isInFamily
{
  return self->_isInFamily;
}

- (BOOL)isInBadCredit
{
  return self->_isInBadCredit;
}

- (BOOL)isAskToBuy
{
  return self->_isAskToBuy;
}

- (unint64_t)identityLastVerified
{
  return self->_identityLastVerified;
}

- (BOOL)hasSubscriptionFamilySharingEnabled
{
  return self->_hasSubscriptionFamilySharingEnabled;
}

- (BOOL)hasHardwareWatchOffer
{
  return self->_hasHardwareWatchOffer;
}

- (BOOL)hasAgreedToTerms
{
  return self->_hasAgreedToTerms;
}

- (BOOL)hasAgreedToAppClipTerms
{
  return self->_hasAgreedToAppClipTerms;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (NSString)creditBalance
{
  return self->_creditBalance;
}

- (NSString)combinedStoreFrontID
{
  return self->_combinedStoreFrontID;
}

- (BOOL)autoPlayEnabled
{
  return self->_autoPlayEnabled;
}

- (unint64_t)accountFlagsVersion
{
  return self->_accountFlagsVersion;
}

- (NSString)acAccountName
{
  return self->_acAccountName;
}

- (void)setStorefrontId:(id)a3
{
}

- (void)setOneAccountLinkedDSID:(id)a3
{
}

- (void)setLastName:(id)a3
{
}

- (void)setIsoCountryCode:(id)a3
{
}

- (void)setIso3CountryCode:(id)a3
{
}

- (void)setIso2CountryCode:(id)a3
{
}

- (void)setIsU18OrCountrysEquivalent:(id)a3
{
}

- (void)setFirstName:(id)a3
{
}

- (void)setExpiration:(id)a3
{
}

- (void)setCreditBalance:(id)a3
{
}

- (void)setCombinedStoreFrontID:(id)a3
{
}

- (void)setAcAccountName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_storefrontId, 0);
  objc_storeStrong((id *)&self->_oneAccountLinkedDSID, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_iso3CountryCode, 0);
  objc_storeStrong((id *)&self->_iso2CountryCode, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_isU18OrCountrysEquivalent, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_creditBalance, 0);
  objc_storeStrong((id *)&self->_combinedStoreFrontID, 0);
  objc_storeStrong((id *)&self->_acAccountName, 0);
}

@end