@interface FHTransaction
+ (BOOL)supportsSecureCoding;
+ (id)_allowedCountryNamesForMapsMerchant;
+ (id)fhProperties;
- (BOOL)hasLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)recurring;
- (CLLocation)location;
- (FHTransaction)initWithCoder:(id)a3;
- (FHTransaction)initWithDictionary:(id)a3;
- (FHTransaction)initWithDictionary:(id)a3 dateFormatter:(id)a4;
- (FHTransaction)initWithJsonString:(id)a3;
- (NSDate)disputeLastUpdatedDate;
- (NSDate)disputeOpenDate;
- (NSDate)transactionDate;
- (NSDate)transactionStatusChangedDate;
- (NSDecimalNumber)amount;
- (NSDictionary)compoundFeatures;
- (NSString)altDSID;
- (NSString)associatedReceiptUniqueID;
- (NSString)city;
- (NSString)country;
- (NSString)countryCode;
- (NSString)currencyCode;
- (NSString)displayName;
- (NSString)financeTransactionIdentifier;
- (NSString)identifier;
- (NSString)industryCategory;
- (NSString)merchantDetailedCategory;
- (NSString)merchantUniqueIdentifier;
- (NSString)name;
- (NSString)paymentHash;
- (NSString)peerPaymentCounterpartHandle;
- (NSString)rawName;
- (NSString)receiptIdentifier;
- (NSString)state;
- (NSString)street;
- (NSString)transactionDescription;
- (NSString)transactionServiceIdentifier;
- (NSString)transactionSourceIdentifier;
- (NSString)zip;
- (NSTimeZone)timeZone;
- (id)description;
- (id)toDictionary;
- (id)toJson:(id)a3;
- (int)mapsMerchantBrandResultProviderID;
- (int)mapsMerchantResultProviderID;
- (int64_t)accountType;
- (int64_t)amountFromDatabase;
- (int64_t)category;
- (int64_t)industryCode;
- (int64_t)peerPaymentType;
- (int64_t)transactionStatus;
- (int64_t)transactionType;
- (unint64_t)cardType;
- (unint64_t)disputeStatus;
- (unint64_t)disputeType;
- (unint64_t)hash;
- (unint64_t)mapsMerchantBrandID;
- (unint64_t)mapsMerchantID;
- (unint64_t)suggestedSuggestionCategory;
- (unint64_t)transactionInternalState;
- (unint64_t)transactionSource;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountType:(int64_t)a3;
- (void)setAltDSID:(id)a3;
- (void)setAmount:(id)a3;
- (void)setAmountFromDatabase:(int64_t)a3;
- (void)setAssociatedReceiptUniqueID:(id)a3;
- (void)setCardType:(unint64_t)a3;
- (void)setCategory:(int64_t)a3;
- (void)setCity:(id)a3;
- (void)setCompoundFeatures:(id)a3;
- (void)setCountry:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDisputeLastUpdatedDate:(id)a3;
- (void)setDisputeOpenDate:(id)a3;
- (void)setDisputeStatus:(unint64_t)a3;
- (void)setDisputeType:(unint64_t)a3;
- (void)setFinanceTransactionIdentifier:(id)a3;
- (void)setHasLocation:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIndustryCategory:(id)a3;
- (void)setIndustryCode:(int64_t)a3;
- (void)setLocation:(id)a3;
- (void)setMapsMerchantBrandID:(unint64_t)a3;
- (void)setMapsMerchantBrandResultProviderID:(int)a3;
- (void)setMapsMerchantID:(unint64_t)a3;
- (void)setMapsMerchantResultProviderID:(int)a3;
- (void)setMerchantDetailedCategory:(id)a3;
- (void)setMerchantUniqueIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setPaymentHash:(id)a3;
- (void)setPeerPaymentCounterpartHandle:(id)a3;
- (void)setPeerPaymentType:(int64_t)a3;
- (void)setRawName:(id)a3;
- (void)setReceiptIdentifier:(id)a3;
- (void)setRecurring:(BOOL)a3;
- (void)setState:(id)a3;
- (void)setStreet:(id)a3;
- (void)setSuggestedSuggestionCategory:(unint64_t)a3;
- (void)setTimeZone:(id)a3;
- (void)setTransactionDate:(id)a3;
- (void)setTransactionDescription:(id)a3;
- (void)setTransactionInternalState:(unint64_t)a3;
- (void)setTransactionServiceIdentifier:(id)a3;
- (void)setTransactionSource:(unint64_t)a3;
- (void)setTransactionSourceIdentifier:(id)a3;
- (void)setTransactionStatus:(int64_t)a3;
- (void)setTransactionStatusChangedDate:(id)a3;
- (void)setTransactionType:(int64_t)a3;
- (void)setZip:(id)a3;
@end

@implementation FHTransaction

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FHTransaction *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(FHTransaction *)self transactionServiceIdentifier];
  [v4 encodeObject:v6 forKey:@"serviceIdentifier"];

  v7 = [(FHTransaction *)self financeTransactionIdentifier];
  [v4 encodeObject:v7 forKey:@"financeTransactionIdentifier"];

  v8 = [(FHTransaction *)self paymentHash];
  [v4 encodeObject:v8 forKey:@"paymentHash"];

  v9 = [(FHTransaction *)self amount];
  [v4 encodeObject:v9 forKey:@"amount"];

  v10 = [(FHTransaction *)self currencyCode];
  [v4 encodeObject:v10 forKey:@"currencyCode"];

  v11 = [(FHTransaction *)self transactionDate];
  [v4 encodeObject:v11 forKey:@"transactionDate"];

  v12 = [(FHTransaction *)self transactionStatusChangedDate];
  [v4 encodeObject:v12 forKey:@"transactionStatusChangedDate"];

  v13 = [(FHTransaction *)self transactionSourceIdentifier];
  [v4 encodeObject:v13 forKey:@"transactionSourceIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[FHTransaction transactionStatus](self, "transactionStatus"), @"transactionStatus");
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHTransaction transactionSource](self, "transactionSource"), @"transactionSource");
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHTransaction cardType](self, "cardType"), @"cardType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHTransaction transactionType](self, "transactionType"), @"transactionType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHTransaction transactionInternalState](self, "transactionInternalState"), @"transactionInternalState");
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHTransaction accountType](self, "accountType"), @"accountType");
  v14 = [(FHTransaction *)self timeZone];
  [v4 encodeObject:v14 forKey:@"timeZone"];

  v15 = [(FHTransaction *)self altDSID];
  [v4 encodeObject:v15 forKey:@"altDSID"];

  v16 = [(FHTransaction *)self receiptIdentifier];
  [v4 encodeObject:v16 forKey:@"receiptIdentifier"];

  v17 = [(FHTransaction *)self associatedReceiptUniqueID];
  [v4 encodeObject:v17 forKey:@"associatedReceiptUniqueID"];

  v18 = [(FHTransaction *)self merchantUniqueIdentifier];
  [v4 encodeObject:v18 forKey:@"merchantUniqueIdentifier"];

  v19 = [(FHTransaction *)self name];
  [v4 encodeObject:v19 forKey:@"name"];

  v20 = [(FHTransaction *)self rawName];
  [v4 encodeObject:v20 forKey:@"rawName"];

  v21 = [(FHTransaction *)self displayName];
  [v4 encodeObject:v21 forKey:@"displayName"];

  v22 = [(FHTransaction *)self industryCategory];
  [v4 encodeObject:v22 forKey:@"industryCategory"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[FHTransaction industryCode](self, "industryCode"), @"industryCode");
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHTransaction category](self, "category"), @"category");
  v23 = [(FHTransaction *)self street];
  [v4 encodeObject:v23 forKey:@"street"];

  v24 = [(FHTransaction *)self city];
  [v4 encodeObject:v24 forKey:@"city"];

  v25 = [(FHTransaction *)self state];
  [v4 encodeObject:v25 forKey:@"state"];

  v26 = [(FHTransaction *)self zip];
  [v4 encodeObject:v26 forKey:@"zip"];

  v27 = [(FHTransaction *)self countryCode];
  [v4 encodeObject:v27 forKey:@"countryCode"];

  v28 = [(FHTransaction *)self country];
  [v4 encodeObject:v28 forKey:@"country"];

  v29 = [(FHTransaction *)self merchantDetailedCategory];
  [v4 encodeObject:v29 forKey:@"merchantDetailedCategory"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[FHTransaction mapsMerchantID](self, "mapsMerchantID"), @"mapsMerchantID");
  objc_msgSend(v4, "encodeInt32:forKey:", -[FHTransaction mapsMerchantResultProviderID](self, "mapsMerchantResultProviderID"), @"mapsMerchantResultProviderID");
  objc_msgSend(v4, "encodeInt64:forKey:", -[FHTransaction mapsMerchantBrandID](self, "mapsMerchantBrandID"), @"mapsMerchantBrandID");
  objc_msgSend(v4, "encodeInt32:forKey:", -[FHTransaction mapsMerchantBrandResultProviderID](self, "mapsMerchantBrandResultProviderID"), @"mapsMerchantBrandResultProviderID");
  objc_msgSend(v4, "encodeBool:forKey:", -[FHTransaction hasLocation](self, "hasLocation"), @"hasLocation");
  v30 = [(FHTransaction *)self location];
  [v4 encodeObject:v30 forKey:@"location"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[FHTransaction disputeType](self, "disputeType"), @"disputeType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHTransaction disputeStatus](self, "disputeStatus"), @"disputeStatus");
  v31 = [(FHTransaction *)self peerPaymentCounterpartHandle];
  [v4 encodeObject:v31 forKey:@"peerPaymentCounterpartHandle"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[FHTransaction peerPaymentType](self, "peerPaymentType"), @"peerPaymentType");
  v32 = [(FHTransaction *)self transactionDescription];
  [v4 encodeObject:v32 forKey:@"transactionDescription"];

  objc_msgSend(v4, "encodeBool:forKey:", -[FHTransaction recurring](self, "recurring"), @"recurring");
  v33 = [(FHTransaction *)self disputeOpenDate];
  [v4 encodeObject:v33 forKey:@"disputeOpenDate"];

  id v34 = [(FHTransaction *)self disputeLastUpdatedDate];
  [v4 encodeObject:v34 forKey:@"disputeLastUpdatedDate"];
}

- (FHTransaction)initWithCoder:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)FHTransaction;
  v5 = [(FHTransaction *)&v37 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(FHTransaction *)v5 setIdentifier:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceIdentifier"];
    [(FHTransaction *)v5 setTransactionServiceIdentifier:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"financeTransactionIdentifier"];
    [(FHTransaction *)v5 setFinanceTransactionIdentifier:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentHash"];
    [(FHTransaction *)v5 setPaymentHash:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    [(FHTransaction *)v5 setAmount:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    [(FHTransaction *)v5 setCurrencyCode:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionDate"];
    [(FHTransaction *)v5 setTransactionDate:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionStatusChangedDate"];
    [(FHTransaction *)v5 setTransactionStatusChangedDate:v13];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionSourceIdentifier"];
    [(FHTransaction *)v5 setTransactionSourceIdentifier:v14];

    -[FHTransaction setTransactionStatus:](v5, "setTransactionStatus:", [v4 decodeIntegerForKey:@"transactionStatus"]);
    -[FHTransaction setTransactionSource:](v5, "setTransactionSource:", [v4 decodeIntegerForKey:@"transactionSource"]);
    -[FHTransaction setCardType:](v5, "setCardType:", [v4 decodeIntegerForKey:@"cardType"]);
    -[FHTransaction setTransactionType:](v5, "setTransactionType:", [v4 decodeIntegerForKey:@"transactionType"]);
    -[FHTransaction setAccountType:](v5, "setAccountType:", [v4 decodeIntegerForKey:@"accountType"]);
    -[FHTransaction setTransactionInternalState:](v5, "setTransactionInternalState:", [v4 decodeIntegerForKey:@"transactionInternalState"]);
    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"];
    [(FHTransaction *)v5 setTimeZone:v15];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    [(FHTransaction *)v5 setAltDSID:v16];

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"receiptIdentifier"];
    [(FHTransaction *)v5 setReceiptIdentifier:v17];

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedReceiptUniqueID"];
    [(FHTransaction *)v5 setAssociatedReceiptUniqueID:v18];

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantUniqueIdentifier"];
    [(FHTransaction *)v5 setMerchantUniqueIdentifier:v19];

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    [(FHTransaction *)v5 setName:v20];

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawName"];
    [(FHTransaction *)v5 setRawName:v21];

    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    [(FHTransaction *)v5 setDisplayName:v22];

    v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"industryCategory"];
    [(FHTransaction *)v5 setIndustryCategory:v23];

    -[FHTransaction setIndustryCode:](v5, "setIndustryCode:", [v4 decodeIntegerForKey:@"industryCode"]);
    -[FHTransaction setCategory:](v5, "setCategory:", [v4 decodeIntegerForKey:@"category"]);
    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"street"];
    [(FHTransaction *)v5 setStreet:v24];

    v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"city"];
    [(FHTransaction *)v5 setCity:v25];

    v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    [(FHTransaction *)v5 setState:v26];

    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zip"];
    [(FHTransaction *)v5 setZip:v27];

    v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
    [(FHTransaction *)v5 setCountryCode:v28];

    v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"country"];
    [(FHTransaction *)v5 setCountry:v29];

    v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantDetailedCategory"];
    [(FHTransaction *)v5 setMerchantDetailedCategory:v30];

    -[FHTransaction setMapsMerchantID:](v5, "setMapsMerchantID:", [v4 decodeInt64ForKey:@"mapsMerchantID"]);
    -[FHTransaction setMapsMerchantResultProviderID:](v5, "setMapsMerchantResultProviderID:", [v4 decodeInt32ForKey:@"mapsMerchantResultProviderID"]);
    -[FHTransaction setMapsMerchantBrandID:](v5, "setMapsMerchantBrandID:", [v4 decodeInt64ForKey:@"mapsMerchantBrandID"]);
    -[FHTransaction setMapsMerchantBrandResultProviderID:](v5, "setMapsMerchantBrandResultProviderID:", [v4 decodeInt32ForKey:@"mapsMerchantBrandResultProviderID"]);
    v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
    [(FHTransaction *)v5 setLocation:v31];

    -[FHTransaction setHasLocation:](v5, "setHasLocation:", [v4 decodeBoolForKey:@"hasLocation"]);
    -[FHTransaction setDisputeType:](v5, "setDisputeType:", [v4 decodeIntegerForKey:@"disputeType"]);
    -[FHTransaction setDisputeStatus:](v5, "setDisputeStatus:", [v4 decodeIntegerForKey:@"disputeStatus"]);
    v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerPaymentCounterpartHandle"];
    [(FHTransaction *)v5 setPeerPaymentCounterpartHandle:v32];

    -[FHTransaction setPeerPaymentType:](v5, "setPeerPaymentType:", [v4 decodeIntegerForKey:@"peerPaymentType"]);
    v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionDescription"];
    [(FHTransaction *)v5 setTransactionDescription:v33];

    -[FHTransaction setRecurring:](v5, "setRecurring:", [v4 decodeBoolForKey:@"recurring"]);
    id v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"disputeOpenDate"];
    [(FHTransaction *)v5 setDisputeOpenDate:v34];

    v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"disputeLastUpdatedDate"];
    [(FHTransaction *)v5 setDisputeLastUpdatedDate:v35];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  v3 = [(FHTransaction *)self identifier];
  uint64_t v4 = [v3 hash];

  v5 = [(FHTransaction *)self transactionServiceIdentifier];
  uint64_t v6 = [v5 hash] - v4 + 32 * v4;

  v7 = [(FHTransaction *)self financeTransactionIdentifier];
  uint64_t v8 = [v7 hash] - v6 + 32 * v6;

  v9 = [(FHTransaction *)self paymentHash];
  uint64_t v10 = [v9 hash] - v8 + 32 * v8;

  v11 = [(FHTransaction *)self transactionSourceIdentifier];
  uint64_t v12 = [v11 hash] - v10 + 32 * v10;

  v13 = [(FHTransaction *)self amount];
  uint64_t v14 = [v13 hash] - v12 + 32 * v12;

  v15 = [(FHTransaction *)self currencyCode];
  uint64_t v16 = [v15 hash] - v14 + 32 * v14;

  v17 = [(FHTransaction *)self transactionDate];
  uint64_t v18 = [v17 hash] - v16 + 32 * v16;

  v19 = [(FHTransaction *)self transactionStatusChangedDate];
  uint64_t v20 = [v19 hash] - v18 + 32 * v18;

  v21 = [(FHTransaction *)self industryCategory];
  uint64_t v22 = [v21 hash] - v20 + 32 * v20;

  v23 = [(FHTransaction *)self displayName];
  uint64_t v24 = [v23 hash] - v22 + 32 * v22;

  v25 = [(FHTransaction *)self merchantUniqueIdentifier];
  uint64_t v26 = [v25 hash] - v24 + 32 * v24;

  v27 = [(FHTransaction *)self name];
  uint64_t v28 = [v27 hash] - v26 + 32 * v26;

  v29 = [(FHTransaction *)self rawName];
  uint64_t v30 = [v29 hash] - v28 + 32 * v28;

  int64_t v31 = [(FHTransaction *)self industryCode] - v30 + 32 * v30;
  int64_t v32 = [(FHTransaction *)self category] - v31 + 32 * v31;
  v33 = [(FHTransaction *)self street];
  uint64_t v34 = [v33 hash] - v32 + 32 * v32;

  v35 = [(FHTransaction *)self city];
  uint64_t v36 = [v35 hash] - v34 + 32 * v34;

  objc_super v37 = [(FHTransaction *)self state];
  uint64_t v38 = [v37 hash] - v36 + 32 * v36;

  v39 = [(FHTransaction *)self zip];
  uint64_t v40 = [v39 hash] - v38 + 32 * v38;

  v41 = [(FHTransaction *)self countryCode];
  uint64_t v42 = [v41 hash] - v40 + 32 * v40;

  v43 = [(FHTransaction *)self altDSID];
  uint64_t v44 = [v43 hash] - v42 + 32 * v42;

  v45 = [(FHTransaction *)self receiptIdentifier];
  uint64_t v46 = [v45 hash] - v44 + 32 * v44;

  v47 = [(FHTransaction *)self associatedReceiptUniqueID];
  uint64_t v48 = [v47 hash] - v46 + 32 * v46;

  v49 = [(FHTransaction *)self country];
  uint64_t v50 = [v49 hash] - v48 + 32 * v48;

  v51 = [(FHTransaction *)self merchantDetailedCategory];
  uint64_t v52 = [v51 hash] - v50 + 32 * v50;

  int64_t v53 = [(FHTransaction *)self transactionStatus] - v52 + 32 * v52;
  unint64_t v54 = [(FHTransaction *)self transactionSource] - v53 + 32 * v53;
  unint64_t v55 = [(FHTransaction *)self cardType] - v54 + 32 * v54;
  int64_t v56 = [(FHTransaction *)self transactionType] - v55 + 32 * v55;
  int64_t v57 = [(FHTransaction *)self accountType] - v56 + 32 * v56;
  unint64_t v58 = [(FHTransaction *)self transactionInternalState] - v57 + 32 * v57;
  v59 = [(FHTransaction *)self timeZone];
  uint64_t v60 = [v59 hash] - v58 + 32 * v58;

  v61 = [(FHTransaction *)self location];
  uint64_t v62 = [v61 hash] - v60 + 32 * v60;

  unint64_t v63 = 31 * ([(FHTransaction *)self mapsMerchantID] - v62 + 32 * v62);
  unint64_t v64 = 31 * (v63 + [(FHTransaction *)self mapsMerchantResultProviderID]);
  unint64_t v65 = v64 + [(FHTransaction *)self hasLocation];
  unint64_t v66 = [(FHTransaction *)self disputeType] - v65 + 32 * v65;
  unint64_t v67 = [(FHTransaction *)self disputeStatus] - v66 + 32 * v66;
  v68 = [(FHTransaction *)self peerPaymentCounterpartHandle];
  uint64_t v69 = [v68 hash] - v67 + 32 * v67;

  int64_t v70 = [(FHTransaction *)self peerPaymentType] - v69 + 32 * v69;
  v71 = [(FHTransaction *)self transactionDescription];
  uint64_t v72 = 31 * ([v71 hash] - v70 + 32 * v70);

  uint64_t v73 = v72 + [(FHTransaction *)self recurring];
  v74 = [(FHTransaction *)self disputeOpenDate];
  uint64_t v75 = [v74 hash] - v73 + 32 * v73;

  v76 = [(FHTransaction *)self disputeLastUpdatedDate];
  unint64_t v77 = [v76 hash] - v75 + 32 * v75 + 0x73EFC91BB9778D9FLL;

  return v77;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (FHTransaction *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v22 = 1;
    goto LABEL_89;
  }
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v22 = 0;
    goto LABEL_89;
  }
  uint64_t v6 = [(FHTransaction *)self identifier];
  id v139 = [(FHTransaction *)v5 identifier];
  id v140 = v6;
  int v138 = [v6 isEqualToString:v139];
  if (!v138)
  {
    int v23 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    uint64_t v142 = 0;
    int v141 = 0;
    memset(v137, 0, sizeof(v137));
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    char v22 = 0;
    goto LABEL_22;
  }
  uint64_t v8 = [(FHTransaction *)self transactionServiceIdentifier];
  v135 = [(FHTransaction *)v5 transactionServiceIdentifier];
  v136 = v8;
  if (!objc_msgSend(v8, "isEqualToString:"))
  {
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    uint64_t v142 = 0;
    int v141 = 0;
    memset(v137, 0, sizeof(v137));
    int v24 = 0;
    int v25 = 0;
    int v23 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    char v22 = 0;
    goto LABEL_22;
  }
  v9 = [(FHTransaction *)self financeTransactionIdentifier];
  v133 = [(FHTransaction *)v5 financeTransactionIdentifier];
  v134 = v9;
  if (!objc_msgSend(v9, "isEqualToString:"))
  {
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    uint64_t v142 = 0;
    int v141 = 0;
    memset(v137, 0, 72);
    int v24 = 0;
    int v25 = 0;
    int v23 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    char v22 = 0;
    *(_DWORD *)&v137[72] = 1;
    goto LABEL_22;
  }
  uint64_t v10 = [(FHTransaction *)self paymentHash];
  v131 = [(FHTransaction *)v5 paymentHash];
  v132 = v10;
  if (!objc_msgSend(v10, "isEqualToString:"))
  {
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    uint64_t v142 = 0;
    int v141 = 0;
    memset(v137, 0, 68);
    int v24 = 0;
    int v25 = 0;
    int v23 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    char v22 = 0;
    *(void *)&v137[68] = 0x100000001;
    goto LABEL_22;
  }
  v11 = [(FHTransaction *)self transactionSourceIdentifier];
  [(FHTransaction *)v5 transactionSourceIdentifier];
  v129 = v130 = v11;
  if (!objc_msgSend(v11, "isEqualToString:"))
  {
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    uint64_t v142 = 0;
    int v141 = 0;
    memset(v137, 0, 64);
    int v24 = 0;
    int v25 = 0;
    int v23 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    char v22 = 0;
    *(void *)&v137[68] = 0x100000001;
    *(_DWORD *)&v137[64] = 1;
    goto LABEL_22;
  }
  uint64_t v12 = [(FHTransaction *)self amount];
  v127 = [(FHTransaction *)v5 amount];
  v128 = v12;
  if (!objc_msgSend(v12, "isEqual:"))
  {
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    uint64_t v142 = 0;
    int v141 = 0;
    memset(v137, 0, 60);
    int v24 = 0;
    int v25 = 0;
    int v23 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    char v22 = 0;
    *(void *)&v137[68] = 0x100000001;
    *(void *)&v137[60] = 0x100000001;
    goto LABEL_22;
  }
  v13 = [(FHTransaction *)self currencyCode];
  v125 = [(FHTransaction *)v5 currencyCode];
  v126 = v13;
  if (!objc_msgSend(v13, "isEqualToString:"))
  {
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    uint64_t v142 = 0;
    int v141 = 0;
    memset(v137, 0, 56);
    int v24 = 0;
    int v25 = 0;
    int v23 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    char v22 = 0;
    *(void *)&v137[68] = 0x100000001;
    *(void *)&v137[60] = 0x100000001;
    *(_DWORD *)&v137[56] = 1;
    goto LABEL_22;
  }
  uint64_t v14 = [(FHTransaction *)self transactionDate];
  v123 = [(FHTransaction *)v5 transactionDate];
  v124 = v14;
  if (!objc_msgSend(v14, "isEqual:"))
  {
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    uint64_t v142 = 0;
    int v141 = 0;
    memset(v137, 0, 52);
    int v24 = 0;
    int v25 = 0;
    int v23 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    char v22 = 0;
    *(void *)&v137[68] = 0x100000001;
    *(void *)&v137[60] = 0x100000001;
    *(void *)&v137[52] = 0x100000001;
    goto LABEL_22;
  }
  v15 = [(FHTransaction *)self transactionStatusChangedDate];
  v121 = [(FHTransaction *)v5 transactionStatusChangedDate];
  v122 = v15;
  if (!objc_msgSend(v15, "isEqual:"))
  {
    int v20 = 0;
    int v21 = 0;
    uint64_t v142 = 0;
    int v141 = 0;
    memset(v137, 0, 52);
    int v24 = 0;
    int v25 = 0;
    int v23 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    char v22 = 0;
    *(void *)&v137[68] = 0x100000001;
    *(void *)&v137[60] = 0x100000001;
    *(void *)&v137[52] = 0x100000001;
    int v19 = 1;
    goto LABEL_22;
  }
  uint64_t v16 = [(FHTransaction *)self industryCategory];
  v119 = [(FHTransaction *)v5 industryCategory];
  v120 = v16;
  if (!objc_msgSend(v16, "isEqualToString:"))
  {
    int v21 = 0;
    uint64_t v142 = 0;
    int v141 = 0;
    memset(v137, 0, 52);
    int v24 = 0;
    int v25 = 0;
    int v23 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    char v22 = 0;
    *(void *)&v137[68] = 0x100000001;
    *(void *)&v137[60] = 0x100000001;
    *(void *)&v137[52] = 0x100000001;
    int v19 = 1;
    int v20 = 1;
    goto LABEL_22;
  }
  uint64_t v17 = [(FHTransaction *)self displayName];
  LODWORD(v142) = v17 != 0;
  v115 = (void *)v17;
  if (v17
    && ([(FHTransaction *)v5 displayName], (v118 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v18 = [(FHTransaction *)self displayName];
    v111 = [(FHTransaction *)v5 displayName];
    v112 = v18;
    int v141 = 0;
    HIDWORD(v142) = 1;
    if ((objc_msgSend(v18, "isEqual:") & 1) == 0)
    {
      *(void *)&v137[68] = 0x100000001;
      *(void *)&v137[60] = 0x100000001;
      *(void *)&v137[52] = 0x100000001;
      int v19 = 1;
      int v20 = 1;
      int v21 = 1;
      LODWORD(v142) = 1;
      char v22 = 0;
LABEL_100:
      memset(v137, 0, 52);
      int v24 = 0;
      int v25 = 0;
      int v23 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v38 = [(FHTransaction *)self displayName];
    [(FHTransaction *)v5 displayName];
    HIDWORD(v142) = 0;
    v118 = 0;
    v116 = int v141 = 1;
    v117 = (void *)v38;
    if ((void *)v38 != v116)
    {
      *(_DWORD *)&v137[68] = 1;
      *(_DWORD *)&v137[72] = 1;
      *(_DWORD *)&v137[60] = 1;
      *(_DWORD *)&v137[64] = 1;
      *(_DWORD *)&v137[52] = 1;
      *(_DWORD *)&v137[56] = 1;
      int v19 = 1;
      int v20 = 1;
      int v21 = 1;
      char v22 = 0;
      goto LABEL_100;
    }
  }
  v39 = [(FHTransaction *)self street];
  v113 = [(FHTransaction *)v5 street];
  v114 = v39;
  if (objc_msgSend(v39, "isEqualToString:"))
  {
    uint64_t v40 = [(FHTransaction *)self city];
    v109 = [(FHTransaction *)v5 city];
    v110 = v40;
    if (objc_msgSend(v40, "isEqualToString:"))
    {
      v41 = [(FHTransaction *)self state];
      v107 = [(FHTransaction *)v5 state];
      v108 = v41;
      if (objc_msgSend(v41, "isEqualToString:"))
      {
        uint64_t v42 = [(FHTransaction *)self zip];
        v105 = [(FHTransaction *)v5 zip];
        v106 = v42;
        if (objc_msgSend(v42, "isEqualToString:"))
        {
          v43 = [(FHTransaction *)self countryCode];
          v103 = [(FHTransaction *)v5 countryCode];
          v104 = v43;
          if (objc_msgSend(v43, "isEqualToString:"))
          {
            uint64_t v44 = [(FHTransaction *)self altDSID];
            v101 = [(FHTransaction *)v5 altDSID];
            v102 = v44;
            if (objc_msgSend(v44, "isEqualToString:"))
            {
              v45 = [(FHTransaction *)self receiptIdentifier];
              v99 = [(FHTransaction *)v5 receiptIdentifier];
              v100 = v45;
              if (objc_msgSend(v45, "isEqualToString:"))
              {
                uint64_t v46 = [(FHTransaction *)self associatedReceiptUniqueID];
                v97 = [(FHTransaction *)v5 associatedReceiptUniqueID];
                v98 = v46;
                if (objc_msgSend(v46, "isEqualToString:"))
                {
                  v47 = [(FHTransaction *)self country];
                  v95 = [(FHTransaction *)v5 country];
                  v96 = v47;
                  if (objc_msgSend(v47, "isEqualToString:"))
                  {
                    uint64_t v48 = [(FHTransaction *)self merchantUniqueIdentifier];
                    v93 = [(FHTransaction *)v5 merchantUniqueIdentifier];
                    v94 = v48;
                    if (objc_msgSend(v48, "isEqualToString:"))
                    {
                      v49 = [(FHTransaction *)self name];
                      v91 = [(FHTransaction *)v5 name];
                      v92 = v49;
                      if (objc_msgSend(v49, "isEqualToString:"))
                      {
                        uint64_t v50 = [(FHTransaction *)self rawName];
                        v89 = [(FHTransaction *)v5 rawName];
                        v90 = v50;
                        if (objc_msgSend(v50, "isEqualToString:"))
                        {
                          v51 = [(FHTransaction *)self timeZone];
                          v87 = [(FHTransaction *)v5 timeZone];
                          v88 = v51;
                          if (objc_msgSend(v51, "isEqual:"))
                          {
                            uint64_t v52 = [(FHTransaction *)self merchantDetailedCategory];
                            v85 = [(FHTransaction *)v5 merchantDetailedCategory];
                            v86 = v52;
                            if (objc_msgSend(v52, "isEqualToString:"))
                            {
                              int64_t v53 = [(FHTransaction *)self location];
                              v83 = [(FHTransaction *)v5 location];
                              v84 = v53;
                              if (!objc_msgSend(v53, "isEqual:")) {
                                goto LABEL_150;
                              }
                              int64_t v54 = [(FHTransaction *)self industryCode];
                              if (v54 != [(FHTransaction *)v5 industryCode]) {
                                goto LABEL_150;
                              }
                              int64_t v55 = [(FHTransaction *)self category];
                              if (v55 != [(FHTransaction *)v5 category]) {
                                goto LABEL_150;
                              }
                              int64_t v56 = [(FHTransaction *)self transactionStatus];
                              if (v56 != [(FHTransaction *)v5 transactionStatus]) {
                                goto LABEL_150;
                              }
                              unint64_t v57 = [(FHTransaction *)self transactionSource];
                              if (v57 != [(FHTransaction *)v5 transactionSource]) {
                                goto LABEL_150;
                              }
                              unint64_t v58 = [(FHTransaction *)self cardType];
                              if (v58 != [(FHTransaction *)v5 cardType]) {
                                goto LABEL_150;
                              }
                              int64_t v59 = [(FHTransaction *)self transactionType];
                              if (v59 != [(FHTransaction *)v5 transactionType]) {
                                goto LABEL_150;
                              }
                              int64_t v60 = [(FHTransaction *)self accountType];
                              if (v60 != [(FHTransaction *)v5 accountType]) {
                                goto LABEL_150;
                              }
                              unint64_t v61 = [(FHTransaction *)self transactionInternalState];
                              if (v61 != [(FHTransaction *)v5 transactionInternalState]) {
                                goto LABEL_150;
                              }
                              BOOL v62 = [(FHTransaction *)self hasLocation];
                              if (v62 == [(FHTransaction *)v5 hasLocation]
                                && (unint64_t v63 = [(FHTransaction *)self mapsMerchantID],
                                    v63 == [(FHTransaction *)v5 mapsMerchantID])
                                && (int v64 = [(FHTransaction *)self mapsMerchantResultProviderID], v64 == [(FHTransaction *)v5 mapsMerchantResultProviderID])&& (v65 = [(FHTransaction *)self mapsMerchantBrandID], v65 == [(FHTransaction *)v5 mapsMerchantBrandID])&& (v66 = [(FHTransaction *)self mapsMerchantBrandResultProviderID], v66 == [(FHTransaction *)v5 mapsMerchantBrandResultProviderID])&& (v67 = [(FHTransaction *)self disputeType], v67 == [(FHTransaction *)v5 disputeType])&& (v68 = [(FHTransaction *)self disputeStatus], v68 == [(FHTransaction *)v5 disputeStatus]))
                              {
                                uint64_t v69 = [(FHTransaction *)self peerPaymentCounterpartHandle];
                                v81 = [(FHTransaction *)v5 peerPaymentCounterpartHandle];
                                v82 = v69;
                                if (objc_msgSend(v69, "isEqualToString:")
                                  && (int64_t v70 = [(FHTransaction *)self peerPaymentType],
                                      v70 == [(FHTransaction *)v5 peerPaymentType]))
                                {
                                  v71 = [(FHTransaction *)self transactionDescription];
                                  v79 = [(FHTransaction *)v5 transactionDescription];
                                  v80 = v71;
                                  if (objc_msgSend(v71, "isEqualToString:")
                                    && (BOOL v72 = [(FHTransaction *)self recurring],
                                        v72 == [(FHTransaction *)v5 recurring]))
                                  {
                                    uint64_t v73 = [(FHTransaction *)self disputeOpenDate];
                                    unint64_t v77 = [(FHTransaction *)v5 disputeOpenDate];
                                    v78 = v73;
                                    if (objc_msgSend(v73, "isEqual:"))
                                    {
                                      v74 = [(FHTransaction *)self disputeLastUpdatedDate];
                                      uint64_t v75 = [(FHTransaction *)v5 disputeLastUpdatedDate];
                                      v76 = v74;
                                      char v22 = [v74 isEqual:v75];
                                      v7 = (void *)v75;
                                      *(_DWORD *)&v137[68] = 1;
                                      *(_DWORD *)&v137[72] = 1;
                                      *(_DWORD *)&v137[60] = 1;
                                      *(_DWORD *)&v137[64] = 1;
                                      *(_DWORD *)&v137[52] = 1;
                                      *(_DWORD *)&v137[56] = 1;
                                      int v19 = 1;
                                      int v20 = 1;
                                      int v21 = 1;
                                      v116 = v117;
                                      int v28 = 1;
                                    }
                                    else
                                    {
                                      int v28 = 0;
                                      char v22 = 0;
                                      *(_DWORD *)&v137[68] = 1;
                                      *(_DWORD *)&v137[72] = 1;
                                      *(_DWORD *)&v137[60] = 1;
                                      *(_DWORD *)&v137[64] = 1;
                                      *(_DWORD *)&v137[52] = 1;
                                      *(_DWORD *)&v137[56] = 1;
                                      int v19 = 1;
                                      int v20 = 1;
                                      int v21 = 1;
                                      v116 = v117;
                                    }
                                    *(_DWORD *)&v137[44] = 1;
                                    *(_DWORD *)&v137[48] = 1;
                                    *(_DWORD *)&v137[36] = 1;
                                    *(_DWORD *)&v137[40] = 1;
                                    *(_DWORD *)&v137[28] = 1;
                                    *(_DWORD *)&v137[32] = 1;
                                    *(_DWORD *)&v137[20] = 1;
                                    *(_DWORD *)&v137[24] = 1;
                                    *(_DWORD *)&v137[12] = 1;
                                    *(_DWORD *)&v137[16] = 1;
                                    *(_DWORD *)&v137[4] = 1;
                                    *(_DWORD *)&v137[8] = 1;
                                    *(_DWORD *)v137 = 1;
                                    int v24 = 1;
                                    int v25 = 1;
                                    int v23 = 1;
                                    int v26 = 1;
                                    int v27 = 1;
                                  }
                                  else
                                  {
                                    int v27 = 0;
                                    int v28 = 0;
                                    char v22 = 0;
                                    *(_DWORD *)&v137[68] = 1;
                                    *(_DWORD *)&v137[72] = 1;
                                    *(_DWORD *)&v137[60] = 1;
                                    *(_DWORD *)&v137[64] = 1;
                                    *(_DWORD *)&v137[52] = 1;
                                    *(_DWORD *)&v137[56] = 1;
                                    int v19 = 1;
                                    int v20 = 1;
                                    int v21 = 1;
                                    v116 = v117;
                                    *(_DWORD *)&v137[44] = 1;
                                    *(_DWORD *)&v137[48] = 1;
                                    *(_DWORD *)&v137[36] = 1;
                                    *(_DWORD *)&v137[40] = 1;
                                    *(_DWORD *)&v137[28] = 1;
                                    *(_DWORD *)&v137[32] = 1;
                                    *(_DWORD *)&v137[20] = 1;
                                    *(_DWORD *)&v137[24] = 1;
                                    *(_DWORD *)&v137[12] = 1;
                                    *(_DWORD *)&v137[16] = 1;
                                    *(_DWORD *)&v137[4] = 1;
                                    *(_DWORD *)&v137[8] = 1;
                                    *(_DWORD *)v137 = 1;
                                    int v24 = 1;
                                    int v25 = 1;
                                    int v23 = 1;
                                    int v26 = 1;
                                  }
                                }
                                else
                                {
                                  int v26 = 0;
                                  int v27 = 0;
                                  int v28 = 0;
                                  char v22 = 0;
                                  *(_DWORD *)&v137[68] = 1;
                                  *(_DWORD *)&v137[72] = 1;
                                  *(_DWORD *)&v137[60] = 1;
                                  *(_DWORD *)&v137[64] = 1;
                                  *(_DWORD *)&v137[52] = 1;
                                  *(_DWORD *)&v137[56] = 1;
                                  int v19 = 1;
                                  int v20 = 1;
                                  int v21 = 1;
                                  v116 = v117;
                                  *(_DWORD *)&v137[44] = 1;
                                  *(_DWORD *)&v137[48] = 1;
                                  *(_DWORD *)&v137[36] = 1;
                                  *(_DWORD *)&v137[40] = 1;
                                  *(_DWORD *)&v137[28] = 1;
                                  *(_DWORD *)&v137[32] = 1;
                                  *(_DWORD *)&v137[20] = 1;
                                  *(_DWORD *)&v137[24] = 1;
                                  *(_DWORD *)&v137[12] = 1;
                                  *(_DWORD *)&v137[16] = 1;
                                  *(_DWORD *)&v137[4] = 1;
                                  *(_DWORD *)&v137[8] = 1;
                                  *(_DWORD *)v137 = 1;
                                  int v24 = 1;
                                  int v25 = 1;
                                  int v23 = 1;
                                }
                              }
                              else
                              {
LABEL_150:
                                int v23 = 0;
                                int v26 = 0;
                                int v27 = 0;
                                int v28 = 0;
                                char v22 = 0;
                                *(_DWORD *)&v137[68] = 1;
                                *(_DWORD *)&v137[72] = 1;
                                *(_DWORD *)&v137[60] = 1;
                                *(_DWORD *)&v137[64] = 1;
                                *(_DWORD *)&v137[52] = 1;
                                *(_DWORD *)&v137[56] = 1;
                                int v19 = 1;
                                int v20 = 1;
                                int v21 = 1;
                                v116 = v117;
                                *(_DWORD *)&v137[44] = 1;
                                *(_DWORD *)&v137[48] = 1;
                                *(_DWORD *)&v137[36] = 1;
                                *(_DWORD *)&v137[40] = 1;
                                *(_DWORD *)&v137[28] = 1;
                                *(_DWORD *)&v137[32] = 1;
                                *(_DWORD *)&v137[20] = 1;
                                *(_DWORD *)&v137[24] = 1;
                                *(_DWORD *)&v137[12] = 1;
                                *(_DWORD *)&v137[16] = 1;
                                *(_DWORD *)&v137[4] = 1;
                                *(_DWORD *)&v137[8] = 1;
                                *(_DWORD *)v137 = 1;
                                int v24 = 1;
                                int v25 = 1;
                              }
                            }
                            else
                            {
                              int v25 = 0;
                              int v23 = 0;
                              int v26 = 0;
                              int v27 = 0;
                              int v28 = 0;
                              char v22 = 0;
                              *(_DWORD *)&v137[68] = 1;
                              *(_DWORD *)&v137[72] = 1;
                              *(_DWORD *)&v137[60] = 1;
                              *(_DWORD *)&v137[64] = 1;
                              *(_DWORD *)&v137[52] = 1;
                              *(_DWORD *)&v137[56] = 1;
                              int v19 = 1;
                              int v20 = 1;
                              int v21 = 1;
                              v116 = v117;
                              *(_DWORD *)&v137[44] = 1;
                              *(_DWORD *)&v137[48] = 1;
                              *(_DWORD *)&v137[36] = 1;
                              *(_DWORD *)&v137[40] = 1;
                              *(_DWORD *)&v137[28] = 1;
                              *(_DWORD *)&v137[32] = 1;
                              *(_DWORD *)&v137[20] = 1;
                              *(_DWORD *)&v137[24] = 1;
                              *(_DWORD *)&v137[12] = 1;
                              *(_DWORD *)&v137[16] = 1;
                              *(_DWORD *)&v137[4] = 1;
                              *(_DWORD *)&v137[8] = 1;
                              *(_DWORD *)v137 = 1;
                              int v24 = 1;
                            }
                          }
                          else
                          {
                            int v24 = 0;
                            int v25 = 0;
                            int v23 = 0;
                            int v26 = 0;
                            int v27 = 0;
                            int v28 = 0;
                            char v22 = 0;
                            *(_DWORD *)&v137[68] = 1;
                            *(_DWORD *)&v137[72] = 1;
                            *(_DWORD *)&v137[60] = 1;
                            *(_DWORD *)&v137[64] = 1;
                            *(_DWORD *)&v137[52] = 1;
                            *(_DWORD *)&v137[56] = 1;
                            int v19 = 1;
                            int v20 = 1;
                            int v21 = 1;
                            v116 = v117;
                            *(_DWORD *)&v137[44] = 1;
                            *(_DWORD *)&v137[48] = 1;
                            *(_DWORD *)&v137[36] = 1;
                            *(_DWORD *)&v137[40] = 1;
                            *(_DWORD *)&v137[28] = 1;
                            *(_DWORD *)&v137[32] = 1;
                            *(_DWORD *)&v137[20] = 1;
                            *(_DWORD *)&v137[24] = 1;
                            *(_DWORD *)&v137[12] = 1;
                            *(_DWORD *)&v137[16] = 1;
                            *(_DWORD *)&v137[4] = 1;
                            *(_DWORD *)&v137[8] = 1;
                            *(_DWORD *)v137 = 1;
                          }
                        }
                        else
                        {
                          *(_DWORD *)v137 = 0;
                          int v24 = 0;
                          int v25 = 0;
                          int v23 = 0;
                          int v26 = 0;
                          int v27 = 0;
                          int v28 = 0;
                          char v22 = 0;
                          *(_DWORD *)&v137[68] = 1;
                          *(_DWORD *)&v137[72] = 1;
                          *(_DWORD *)&v137[60] = 1;
                          *(_DWORD *)&v137[64] = 1;
                          *(_DWORD *)&v137[52] = 1;
                          *(_DWORD *)&v137[56] = 1;
                          int v19 = 1;
                          int v20 = 1;
                          int v21 = 1;
                          v116 = v117;
                          *(_DWORD *)&v137[44] = 1;
                          *(_DWORD *)&v137[48] = 1;
                          *(_DWORD *)&v137[36] = 1;
                          *(_DWORD *)&v137[40] = 1;
                          *(_DWORD *)&v137[28] = 1;
                          *(_DWORD *)&v137[32] = 1;
                          *(_DWORD *)&v137[20] = 1;
                          *(_DWORD *)&v137[24] = 1;
                          *(_DWORD *)&v137[12] = 1;
                          *(_DWORD *)&v137[16] = 1;
                          *(_DWORD *)&v137[8] = 1;
                          *(_DWORD *)&v137[4] = 1;
                        }
                      }
                      else
                      {
                        *(void *)v137 = 0;
                        int v24 = 0;
                        int v25 = 0;
                        int v23 = 0;
                        int v26 = 0;
                        int v27 = 0;
                        int v28 = 0;
                        char v22 = 0;
                        *(_DWORD *)&v137[68] = 1;
                        *(_DWORD *)&v137[72] = 1;
                        *(_DWORD *)&v137[60] = 1;
                        *(_DWORD *)&v137[64] = 1;
                        *(_DWORD *)&v137[52] = 1;
                        *(_DWORD *)&v137[56] = 1;
                        int v19 = 1;
                        int v20 = 1;
                        int v21 = 1;
                        v116 = v117;
                        *(_DWORD *)&v137[44] = 1;
                        *(_DWORD *)&v137[48] = 1;
                        *(_DWORD *)&v137[36] = 1;
                        *(_DWORD *)&v137[40] = 1;
                        *(_DWORD *)&v137[28] = 1;
                        *(_DWORD *)&v137[32] = 1;
                        *(_DWORD *)&v137[20] = 1;
                        *(_DWORD *)&v137[24] = 1;
                        *(_DWORD *)&v137[12] = 1;
                        *(_DWORD *)&v137[16] = 1;
                        *(_DWORD *)&v137[8] = 1;
                      }
                    }
                    else
                    {
                      *(void *)&v137[4] = 0;
                      *(_DWORD *)v137 = 0;
                      int v24 = 0;
                      int v25 = 0;
                      int v23 = 0;
                      int v26 = 0;
                      int v27 = 0;
                      int v28 = 0;
                      char v22 = 0;
                      *(_DWORD *)&v137[68] = 1;
                      *(_DWORD *)&v137[72] = 1;
                      *(_DWORD *)&v137[60] = 1;
                      *(_DWORD *)&v137[64] = 1;
                      *(_DWORD *)&v137[52] = 1;
                      *(_DWORD *)&v137[56] = 1;
                      int v19 = 1;
                      int v20 = 1;
                      int v21 = 1;
                      v116 = v117;
                      *(_DWORD *)&v137[44] = 1;
                      *(_DWORD *)&v137[48] = 1;
                      *(_DWORD *)&v137[36] = 1;
                      *(_DWORD *)&v137[40] = 1;
                      *(_DWORD *)&v137[28] = 1;
                      *(_DWORD *)&v137[32] = 1;
                      *(_DWORD *)&v137[20] = 1;
                      *(_DWORD *)&v137[24] = 1;
                      *(_DWORD *)&v137[16] = 1;
                      *(_DWORD *)&v137[12] = 1;
                    }
                  }
                  else
                  {
                    *(void *)v137 = 0;
                    *(void *)&v137[8] = 0;
                    int v24 = 0;
                    int v25 = 0;
                    int v23 = 0;
                    int v26 = 0;
                    int v27 = 0;
                    int v28 = 0;
                    char v22 = 0;
                    *(_DWORD *)&v137[68] = 1;
                    *(_DWORD *)&v137[72] = 1;
                    *(_DWORD *)&v137[60] = 1;
                    *(_DWORD *)&v137[64] = 1;
                    *(_DWORD *)&v137[52] = 1;
                    *(_DWORD *)&v137[56] = 1;
                    int v19 = 1;
                    int v20 = 1;
                    int v21 = 1;
                    v116 = v117;
                    *(_DWORD *)&v137[44] = 1;
                    *(_DWORD *)&v137[48] = 1;
                    *(_DWORD *)&v137[36] = 1;
                    *(_DWORD *)&v137[40] = 1;
                    *(_DWORD *)&v137[28] = 1;
                    *(_DWORD *)&v137[32] = 1;
                    *(_DWORD *)&v137[20] = 1;
                    *(_DWORD *)&v137[24] = 1;
                    *(_DWORD *)&v137[16] = 1;
                  }
                }
                else
                {
                  memset(v137, 0, 20);
                  int v24 = 0;
                  int v25 = 0;
                  int v23 = 0;
                  int v26 = 0;
                  int v27 = 0;
                  int v28 = 0;
                  char v22 = 0;
                  *(void *)&v137[68] = 0x100000001;
                  *(void *)&v137[60] = 0x100000001;
                  *(void *)&v137[52] = 0x100000001;
                  int v19 = 1;
                  int v20 = 1;
                  int v21 = 1;
                  v116 = v117;
                  *(void *)&v137[44] = 0x100000001;
                  *(void *)&v137[36] = 0x100000001;
                  *(void *)&v137[28] = 0x100000001;
                  *(void *)&v137[20] = 0x100000001;
                }
              }
              else
              {
                memset(v137, 0, 24);
                int v24 = 0;
                int v25 = 0;
                int v23 = 0;
                int v26 = 0;
                int v27 = 0;
                int v28 = 0;
                char v22 = 0;
                *(void *)&v137[68] = 0x100000001;
                *(void *)&v137[60] = 0x100000001;
                *(void *)&v137[52] = 0x100000001;
                int v19 = 1;
                int v20 = 1;
                int v21 = 1;
                v116 = v117;
                *(void *)&v137[44] = 0x100000001;
                *(void *)&v137[36] = 0x100000001;
                *(void *)&v137[28] = 0x100000001;
                *(_DWORD *)&v137[24] = 1;
              }
            }
            else
            {
              memset(v137, 0, 28);
              int v24 = 0;
              int v25 = 0;
              int v23 = 0;
              int v26 = 0;
              int v27 = 0;
              int v28 = 0;
              char v22 = 0;
              *(void *)&v137[68] = 0x100000001;
              *(void *)&v137[60] = 0x100000001;
              *(void *)&v137[52] = 0x100000001;
              int v19 = 1;
              int v20 = 1;
              int v21 = 1;
              v116 = v117;
              *(void *)&v137[44] = 0x100000001;
              *(void *)&v137[36] = 0x100000001;
              *(void *)&v137[28] = 0x100000001;
            }
          }
          else
          {
            memset(v137, 0, 32);
            int v24 = 0;
            int v25 = 0;
            int v23 = 0;
            int v26 = 0;
            int v27 = 0;
            int v28 = 0;
            char v22 = 0;
            *(void *)&v137[68] = 0x100000001;
            *(void *)&v137[60] = 0x100000001;
            *(void *)&v137[52] = 0x100000001;
            int v19 = 1;
            int v20 = 1;
            int v21 = 1;
            v116 = v117;
            *(void *)&v137[44] = 0x100000001;
            *(void *)&v137[36] = 0x100000001;
            *(_DWORD *)&v137[32] = 1;
          }
        }
        else
        {
          memset(v137, 0, 36);
          int v24 = 0;
          int v25 = 0;
          int v23 = 0;
          int v26 = 0;
          int v27 = 0;
          int v28 = 0;
          char v22 = 0;
          *(void *)&v137[68] = 0x100000001;
          *(void *)&v137[60] = 0x100000001;
          *(void *)&v137[52] = 0x100000001;
          int v19 = 1;
          int v20 = 1;
          int v21 = 1;
          v116 = v117;
          *(void *)&v137[44] = 0x100000001;
          *(void *)&v137[36] = 0x100000001;
        }
      }
      else
      {
        memset(v137, 0, 40);
        int v24 = 0;
        int v25 = 0;
        int v23 = 0;
        int v26 = 0;
        int v27 = 0;
        int v28 = 0;
        char v22 = 0;
        *(void *)&v137[68] = 0x100000001;
        *(void *)&v137[60] = 0x100000001;
        *(void *)&v137[52] = 0x100000001;
        int v19 = 1;
        int v20 = 1;
        int v21 = 1;
        v116 = v117;
        *(void *)&v137[44] = 0x100000001;
        *(_DWORD *)&v137[40] = 1;
      }
    }
    else
    {
      memset(v137, 0, 44);
      int v24 = 0;
      int v25 = 0;
      int v23 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      char v22 = 0;
      *(void *)&v137[68] = 0x100000001;
      *(void *)&v137[60] = 0x100000001;
      *(void *)&v137[52] = 0x100000001;
      int v19 = 1;
      int v20 = 1;
      int v21 = 1;
      v116 = v117;
      *(void *)&v137[44] = 0x100000001;
    }
  }
  else
  {
    memset(v137, 0, 48);
    int v24 = 0;
    int v25 = 0;
    int v23 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    char v22 = 0;
    *(void *)&v137[68] = 0x100000001;
    *(void *)&v137[60] = 0x100000001;
    *(void *)&v137[52] = 0x100000001;
    int v19 = 1;
    int v20 = 1;
    int v21 = 1;
    v116 = v117;
    *(_DWORD *)&v137[48] = 1;
  }
LABEL_22:
  if (v28)
  {
    int v29 = v24;
    int v30 = v20;
    int v31 = v21;
    int v32 = v19;
    int v33 = v23;
    int v34 = v26;
    int v35 = v27;

    int v36 = v35;
    int v26 = v34;
    int v23 = v33;
    int v19 = v32;
    int v21 = v31;
    int v20 = v30;
    int v24 = v29;
    if (!v36) {
      goto LABEL_24;
    }
  }
  else if (!v27)
  {
LABEL_24:
    if (v26) {
      goto LABEL_25;
    }
    goto LABEL_31;
  }

  if (v26)
  {
LABEL_25:

    if (!v23) {
      goto LABEL_26;
    }
    goto LABEL_32;
  }
LABEL_31:
  if (!v23)
  {
LABEL_26:
    if (v25) {
      goto LABEL_27;
    }
LABEL_33:
    if (!v24) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_32:

  if (!v25) {
    goto LABEL_33;
  }
LABEL_27:

  if (v24)
  {
LABEL_34:
  }
LABEL_35:
  if (*(_DWORD *)v137)
  {
  }
  if (*(_DWORD *)&v137[4])
  {
  }
  if (*(_DWORD *)&v137[8])
  {
  }
  if (*(_DWORD *)&v137[12])
  {
  }
  if (*(_DWORD *)&v137[16])
  {
  }
  if (*(_DWORD *)&v137[20])
  {
  }
  if (*(_DWORD *)&v137[24])
  {
  }
  if (*(_DWORD *)&v137[28])
  {
  }
  if (*(_DWORD *)&v137[32])
  {
  }
  if (*(_DWORD *)&v137[36])
  {
  }
  if (*(_DWORD *)&v137[40])
  {
  }
  if (*(_DWORD *)&v137[44])
  {
  }
  if (*(_DWORD *)&v137[48])
  {
  }
  if (v141)
  {
  }
  if (HIDWORD(v142))
  {
  }
  if (v142)
  {

    if (!v21) {
      goto LABEL_67;
    }
  }
  else if (!v21)
  {
LABEL_67:
    if (v20) {
      goto LABEL_68;
    }
    goto LABEL_72;
  }

  if (v20)
  {
LABEL_68:

    if (!v19) {
      goto LABEL_74;
    }
    goto LABEL_73;
  }
LABEL_72:
  if (v19)
  {
LABEL_73:
  }
LABEL_74:
  if (*(_DWORD *)&v137[52])
  {
  }
  if (*(_DWORD *)&v137[56])
  {
  }
  if (*(_DWORD *)&v137[60])
  {
  }
  if (*(_DWORD *)&v137[64])
  {
  }
  if (*(_DWORD *)&v137[68])
  {
  }
  if (*(_DWORD *)&v137[72])
  {
  }
  if (v138)
  {
  }
LABEL_89:

  return v22;
}

- (FHTransaction)initWithDictionary:(id)a3 dateFormatter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v111.receiver = self;
  v111.super_class = (Class)FHTransaction;
  uint64_t v8 = [(FHTransaction *)&v111 init];
  if (v8)
  {
    uint64_t v9 = [v6 valueForKey:@"identifier"];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v6 valueForKey:@"serviceIdentifier"];
    transactionServiceIdentifier = v8->_transactionServiceIdentifier;
    v8->_transactionServiceIdentifier = (NSString *)v11;

    uint64_t v13 = [v6 valueForKey:@"financeTransactionIdentifier"];
    financeTransactionIdentifier = v8->_financeTransactionIdentifier;
    v8->_financeTransactionIdentifier = (NSString *)v13;

    uint64_t v15 = [v6 valueForKey:@"paymentHash"];
    paymentHash = v8->_paymentHash;
    v8->_paymentHash = (NSString *)v15;

    uint64_t v17 = [v6 valueForKey:@"transactionSourceIdentifier"];
    transactionSourceIdentifier = v8->_transactionSourceIdentifier;
    v8->_transactionSourceIdentifier = (NSString *)v17;

    int v19 = [v6 valueForKey:@"amount"];

    if (v19)
    {
      id v20 = objc_alloc(MEMORY[0x263F087B0]);
      int v21 = [v6 valueForKey:@"amount"];
      [v21 doubleValue];
      uint64_t v22 = objc_msgSend(v20, "initWithDouble:");
      amount = v8->_amount;
      v8->_amount = (NSDecimalNumber *)v22;
    }
    uint64_t v24 = [v6 valueForKey:@"currencyCode"];
    currencyCode = v8->_currencyCode;
    v8->_currencyCode = (NSString *)v24;

    int v26 = [v6 valueForKey:@"transactionDate"];
    uint64_t v27 = [v7 dateFromString:v26];
    transactionDate = v8->_transactionDate;
    v8->_transactionDate = (NSDate *)v27;

    int v29 = [v6 valueForKey:@"transactionStatusChangedDate"];
    uint64_t v30 = [v7 dateFromString:v29];
    transactionStatusChangedDate = v8->_transactionStatusChangedDate;
    v8->_transactionStatusChangedDate = (NSDate *)v30;

    int v32 = [v6 valueForKey:@"transactionStatus"];
    v8->_transactionStatus = [v32 integerValue];

    int v33 = [v6 valueForKey:@"transactionSource"];
    v8->_transactionSource = [v33 integerValue];

    int v34 = [v6 valueForKey:@"cardType"];
    v8->_cardType = [v34 integerValue];

    int v35 = [v6 valueForKey:@"transactionType"];
    v8->_transactionType = [v35 integerValue];

    int v36 = [v6 valueForKey:@"accountType"];
    v8->_accountType = [v36 integerValue];

    objc_super v37 = [v6 valueForKey:@"transactionInternalState"];
    v8->_transactionInternalState = [v37 integerValue];

    uint64_t v38 = [v6 valueForKey:@"street"];
    street = v8->_street;
    v8->_street = (NSString *)v38;

    uint64_t v40 = [v6 valueForKey:@"city"];
    city = v8->_city;
    v8->_city = (NSString *)v40;

    uint64_t v42 = [v6 valueForKey:@"state"];
    state = v8->_state;
    v8->_state = (NSString *)v42;

    uint64_t v44 = [v6 valueForKey:@"zip"];
    zip = v8->_zip;
    v8->_zip = (NSString *)v44;

    uint64_t v46 = [v6 valueForKey:@"countryCode"];
    countryCode = v8->_countryCode;
    v8->_countryCode = (NSString *)v46;

    uint64_t v48 = [v6 valueForKey:@"altDSID"];
    altDSID = v8->_altDSID;
    v8->_altDSID = (NSString *)v48;

    uint64_t v50 = [v6 valueForKey:@"receiptIdentifier"];
    receiptIdentifier = v8->_receiptIdentifier;
    v8->_receiptIdentifier = (NSString *)v50;

    uint64_t v52 = [v6 valueForKey:@"associatedReceiptUniqueID"];
    associatedReceiptUniqueID = v8->_associatedReceiptUniqueID;
    v8->_associatedReceiptUniqueID = (NSString *)v52;

    uint64_t v54 = [v6 valueForKey:@"country"];
    country = v8->_country;
    v8->_country = (NSString *)v54;

    uint64_t v56 = [v6 valueForKey:@"merchantUniqueIdentifier"];
    merchantUniqueIdentifier = v8->_merchantUniqueIdentifier;
    v8->_merchantUniqueIdentifier = (NSString *)v56;

    uint64_t v58 = [v6 valueForKey:@"name"];
    name = v8->_name;
    v8->_name = (NSString *)v58;

    uint64_t v60 = [v6 valueForKey:@"rawName"];
    rawName = v8->_rawName;
    v8->_rawName = (NSString *)v60;

    BOOL v62 = [v6 valueForKey:@"industryCode"];
    v8->_industryCode = [v62 integerValue];

    unint64_t v63 = [v6 valueForKey:@"category"];
    v8->_category = [v63 integerValue];

    uint64_t v64 = [v6 valueForKey:@"merchantDetailedCategory"];
    merchantDetailedCategory = v8->_merchantDetailedCategory;
    v8->_merchantDetailedCategory = (NSString *)v64;

    uint64_t v66 = [v6 valueForKey:@"industryCategory"];
    industryCategory = v8->_industryCategory;
    v8->_industryCategory = (NSString *)v66;

    uint64_t v68 = [v6 valueForKey:@"displayName"];
    displayName = v8->_displayName;
    v8->_displayName = (NSString *)v68;

    int64_t v70 = [v6 valueForKey:@"mapsMerchantID"];
    v8->_mapsMerchantID = [v70 unsignedLongLongValue];

    v71 = [v6 valueForKey:@"mapsMerchantResultProviderID"];
    v8->_mapsMerchantResultProviderID = [v71 integerValue];

    BOOL v72 = [v6 valueForKey:@"mapsMerchantBrandID"];
    v8->_mapsMerchantBrandID = [v72 unsignedLongLongValue];

    uint64_t v73 = [v6 valueForKey:@"mapsMerchantBrandResultProviderID"];
    v8->_mapsMerchantBrandResultProviderID = [v73 integerValue];

    v74 = [v6 valueForKey:@"locationLatitude"];
    [v74 doubleValue];
    CLLocationDegrees v76 = v75;

    unint64_t v77 = [v6 valueForKey:@"locationLongitude"];
    [v77 doubleValue];
    CLLocationDegrees v79 = v78;

    CLLocationCoordinate2D v80 = CLLocationCoordinate2DMake(v76, v79);
    if ((v76 != 0.0 || v79 != 0.0) && CLLocationCoordinate2DIsValid(v80))
    {
      id v81 = objc_alloc(MEMORY[0x263F00A50]);
      v82 = [v6 valueForKey:@"locationHorizontalAccuracy"];
      [v82 doubleValue];
      double v84 = v83;
      v85 = [v6 valueForKey:@"locationVerticalAccuracy"];
      [v85 doubleValue];
      double v87 = v86;
      v88 = [MEMORY[0x263EFF910] now];
      uint64_t v89 = objc_msgSend(v81, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v88, v80.latitude, v80.longitude, 0.0, v84, v87);
      location = v8->_location;
      v8->_location = (CLLocation *)v89;
    }
    v91 = [v6 valueForKey:@"timeZone"];

    if (v91)
    {
      v92 = (void *)MEMORY[0x263EFFA18];
      v93 = [v6 valueForKey:@"timeZone"];
      uint64_t v94 = objc_msgSend(v92, "timeZoneForSecondsFromGMT:", objc_msgSend(v93, "integerValue"));
      timeZone = v8->_timeZone;
      v8->_timeZone = (NSTimeZone *)v94;
    }
    v96 = [v6 valueForKey:@"disputeType"];
    v8->_disputeType = [v96 integerValue];

    v97 = [v6 valueForKey:@"disputeStatus"];
    v8->_disputeStatus = [v97 integerValue];

    uint64_t v98 = [v6 valueForKey:@"peerPaymentCounterpartHandle"];
    peerPaymentCounterpartHandle = v8->_peerPaymentCounterpartHandle;
    v8->_peerPaymentCounterpartHandle = (NSString *)v98;

    v100 = [v6 valueForKey:@"peerPaymentType"];
    v8->_peerPaymentType = [v100 integerValue];

    uint64_t v101 = [v6 valueForKey:@"transactionDescription"];
    transactionDescription = v8->_transactionDescription;
    v8->_transactionDescription = (NSString *)v101;

    v103 = [v6 valueForKey:@"recurring"];
    v8->_recurring = v103 != 0;

    v104 = [v6 valueForKey:@"disputeOpenDate"];
    uint64_t v105 = [v7 dateFromString:v104];
    disputeOpenDate = v8->_disputeOpenDate;
    v8->_disputeOpenDate = (NSDate *)v105;

    v107 = [v6 valueForKey:@"disputeLastUpdatedDate"];
    uint64_t v108 = [v7 dateFromString:v107];
    disputeLastUpdatedDate = v8->_disputeLastUpdatedDate;
    v8->_disputeLastUpdatedDate = (NSDate *)v108;
  }
  return v8;
}

- (FHTransaction)initWithDictionary:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F08790];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setDateFormat:@"YYYY-MM-dd HH:mm:ss Z"];
  id v7 = [(FHTransaction *)self initWithDictionary:v5 dateFormatter:v6];

  return v7;
}

- (FHTransaction)initWithJsonString:(id)a3
{
  uint64_t v4 = [a3 dataUsingEncoding:4];
  id v5 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:0 error:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    self = [(FHTransaction *)self initWithDictionary:v5];
  }
  id v6 = self;

  return v6;
}

- (id)toDictionary
{
  v3 = objc_opt_new();
  [v3 safelySetObject:self->_identifier forKey:@"identifier"];
  [v3 safelySetObject:self->_transactionServiceIdentifier forKey:@"serviceIdentifier"];
  [v3 safelySetObject:self->_financeTransactionIdentifier forKey:@"financeTransactionIdentifier"];
  [v3 safelySetObject:self->_paymentHash forKey:@"paymentHash"];
  [v3 safelySetObject:self->_transactionSourceIdentifier forKey:@"transactionSourceIdentifier"];
  [v3 safelySetObject:self->_amount forKey:@"amount"];
  [v3 safelySetObject:self->_currencyCode forKey:@"currencyCode"];
  [v3 setDate:self->_transactionDate forKey:@"transactionDate"];
  [v3 setDate:self->_transactionStatusChangedDate forKey:@"transactionStatusChangedDate"];
  [v3 setInteger:self->_transactionStatus forKey:@"transactionStatus"];
  [v3 setInteger:self->_transactionSource forKey:@"transactionSource"];
  [v3 setInteger:self->_cardType forKey:@"cardType"];
  [v3 setInteger:self->_transactionType forKey:@"transactionType"];
  [v3 setInteger:self->_accountType forKey:@"accountType"];
  [v3 safelySetObject:self->_altDSID forKey:@"altDSID"];
  [v3 safelySetObject:self->_receiptIdentifier forKey:@"receiptIdentifier"];
  [v3 safelySetObject:self->_associatedReceiptUniqueID forKey:@"associatedReceiptUniqueID"];
  [v3 setInteger:self->_transactionInternalState forKey:@"transactionInternalState"];
  objc_msgSend(v3, "setInteger:forKey:", -[NSTimeZone secondsFromGMT](self->_timeZone, "secondsFromGMT"), @"timeZone");
  [v3 safelySetObject:self->_merchantUniqueIdentifier forKey:@"merchantUniqueIdentifier"];
  [v3 safelySetObject:self->_name forKey:@"name"];
  [v3 safelySetObject:self->_rawName forKey:@"rawName"];
  [v3 setInteger:self->_industryCode forKey:@"industryCode"];
  [v3 setInteger:self->_category forKey:@"category"];
  [v3 safelySetObject:self->_industryCategory forKey:@"industryCategory"];
  [v3 safelySetObject:self->_displayName forKey:@"displayName"];
  [v3 safelySetObject:self->_street forKey:@"street"];
  [v3 safelySetObject:self->_city forKey:@"city"];
  [v3 safelySetObject:self->_state forKey:@"state"];
  [v3 safelySetObject:self->_zip forKey:@"zip"];
  [v3 safelySetObject:self->_countryCode forKey:@"countryCode"];
  [v3 safelySetObject:self->_country forKey:@"country"];
  [v3 safelySetObject:self->_merchantDetailedCategory forKey:@"merchantDetailedCategory"];
  [v3 setUnsignedLongLong:self->_mapsMerchantID forKey:@"mapsMerchantID"];
  [v3 setInt32:self->_mapsMerchantResultProviderID forKey:@"mapsMerchantResultProviderID"];
  [v3 setUnsignedLongLong:self->_mapsMerchantBrandID forKey:@"mapsMerchantBrandID"];
  [v3 setInt32:self->_mapsMerchantBrandResultProviderID forKey:@"mapsMerchantBrandResultProviderID"];
  [v3 safelySetObject:self->_location forKey:@"location"];
  [v3 setInteger:self->_disputeType forKey:@"disputeType"];
  [v3 setInteger:self->_disputeStatus forKey:@"disputeStatus"];
  [v3 safelySetObject:self->_peerPaymentCounterpartHandle forKey:@"peerPaymentCounterpartHandle"];
  [v3 setInteger:self->_peerPaymentType forKey:@"peerPaymentType"];
  [v3 safelySetObject:self->_transactionDescription forKey:@"transactionDescription"];
  [v3 setBool:self->_recurring forKey:@"recurring"];
  [v3 safelySetObject:self->_disputeOpenDate forKey:@"disputeOpenDate"];
  [v3 safelySetObject:self->_disputeLastUpdatedDate forKey:@"disputeLastUpdatedDate"];
  uint64_t v4 = [NSDictionary dictionaryWithDictionary:v3];

  return v4;
}

- (id)toJson:(id)a3
{
  id v4 = a3;
  id v5 = [(FHTransaction *)self toDictionary];
  id v10 = v4;
  id v6 = [MEMORY[0x263F08900] dataWithJSONObject:v5 options:2 error:&v10];
  id v7 = v10;

  if (v6) {
    uint64_t v8 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)fhProperties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__FHTransaction_fhProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (fhProperties_onceToken != -1) {
    dispatch_once(&fhProperties_onceToken, block);
  }
  v2 = (void *)fhProperties__fhProperties;
  return v2;
}

void __29__FHTransaction_fhProperties__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFFA08]);
  v1 = (void *)fhProperties__fhProperties;
  fhProperties__fhProperties = (uint64_t)v0;

  v2 = objc_opt_new();
  unsigned int outCount = 0;
  v3 = (objc_class *)objc_opt_class();
  id v4 = class_copyIvarList(v3, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      id v6 = [NSString stringWithUTF8String:ivar_getName(v4[i])];
      id v7 = [v6 substringFromIndex:1];
      [v2 addObject:v7];
    }
  }
  free(v4);
  uint64_t v8 = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v2];
  uint64_t v9 = (void *)fhProperties__fhProperties;
  fhProperties__fhProperties = v8;
}

+ (id)_allowedCountryNamesForMapsMerchant
{
  if (_allowedCountryNamesForMapsMerchant_onceToken != -1) {
    dispatch_once(&_allowedCountryNamesForMapsMerchant_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)_allowedCountryNamesForMapsMerchant__allowedCountryNames;
  return v2;
}

uint64_t __52__FHTransaction__allowedCountryNamesForMapsMerchant__block_invoke()
{
  _allowedCountryNamesForMapsMerchant__allowedCountryNames = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"USA", @"usa", @"United States", 0);
  return MEMORY[0x270F9A758]();
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%@'; ", @"identifier", self->_identifier];
  objc_msgSend(v3, "appendFormat:", @"%@: '%@'; ",
    @"serviceIdentifier",
    self->_transactionServiceIdentifier);
  objc_msgSend(v3, "appendFormat:", @"%@: '%@'; ",
    @"financeTransactionIdentifier",
    self->_financeTransactionIdentifier);
  [v3 appendFormat:@"%@: '%@'; ", @"paymentHash", self->_paymentHash];
  objc_msgSend(v3, "appendFormat:", @"%@: '%@'; ",
    @"transactionSourceIdentifier",
    self->_transactionSourceIdentifier);
  [v3 appendFormat:@"%@: '%@'; ", @"amount", self->_amount];
  [v3 appendFormat:@"%@: '%@'; ", @"currencyCode", self->_currencyCode];
  [v3 appendFormat:@"%@: '%@'; ", @"transactionDate", self->_transactionDate];
  objc_msgSend(v3, "appendFormat:", @"%@: '%@'; ",
    @"transactionStatusChangedDate",
    self->_transactionStatusChangedDate);
  [v3 appendFormat:@"%@: '%lu'; ", @"transactionStatus", self->_transactionStatus];
  [v3 appendFormat:@"%@: '%lu'; ", @"transactionSource", self->_transactionSource];
  [v3 appendFormat:@"%@: '%lu'; ", @"cardType", self->_cardType];
  [v3 appendFormat:@"%@: '%lu'; ", @"transactionType", self->_transactionType];
  [v3 appendFormat:@"%@: '%lu'; ", @"accountType", self->_accountType];
  [v3 appendFormat:@"%@: '%@'; ", @"altDSID", self->_altDSID];
  [v3 appendFormat:@"%@: '%@'; ", @"receiptIdentifier", self->_receiptIdentifier];
  objc_msgSend(v3, "appendFormat:", @"%@: '%@'; ",
    @"associatedReceiptUniqueID",
    self->_associatedReceiptUniqueID);
  objc_msgSend(v3, "appendFormat:", @"%@: '%lu'; ",
    @"transactionInternalState",
    self->_transactionInternalState);
  timeZone = self->_timeZone;
  if (timeZone)
  {
    id v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSTimeZone secondsFromGMT](timeZone, "secondsFromGMT"));
    [v3 appendFormat:@"%@: '%@'; ", @"timeZone", v5];
  }
  else
  {
    [v3 appendFormat:@"%@: '%@'; ", @"timeZone", 0];
  }
  objc_msgSend(v3, "appendFormat:", @"%@: '%@'; ",
    @"merchantUniqueIdentifier",
    self->_merchantUniqueIdentifier);
  [v3 appendFormat:@"%@: '%@'; ", @"name", self->_name];
  [v3 appendFormat:@"%@: '%@'; ", @"rawName", self->_rawName];
  [v3 appendFormat:@"%@: '%lu'; ", @"industryCode", self->_industryCode];
  [v3 appendFormat:@"%@: '%lu'; ", @"category", self->_category];
  [v3 appendFormat:@"%@: '%@'; ", @"industryCategory", self->_industryCategory];
  [v3 appendFormat:@"%@: '%@'; ", @"displayName", self->_displayName];
  [v3 appendFormat:@"%@: '%@'; ", @"street", self->_street];
  [v3 appendFormat:@"%@: '%@'; ", @"city", self->_city];
  [v3 appendFormat:@"%@: '%@'; ", @"state", self->_state];
  [v3 appendFormat:@"%@: '%@'; ", @"zip", self->_zip];
  [v3 appendFormat:@"%@: '%@'; ", @"countryCode", self->_countryCode];
  [v3 appendFormat:@"%@: '%@'; ", @"country", self->_country];
  objc_msgSend(v3, "appendFormat:", @"%@: '%@'; ",
    @"merchantDetailedCategory",
    self->_merchantDetailedCategory);
  [v3 appendFormat:@"%@: '%llu'; ", @"mapsMerchantID", self->_mapsMerchantID];
  objc_msgSend(v3, "appendFormat:", @"%@: '%d'; ",
    @"mapsMerchantResultProviderID",
    self->_mapsMerchantResultProviderID);
  [v3 appendFormat:@"%@: '%llu'; ", @"mapsMerchantBrandID", self->_mapsMerchantBrandID];
  objc_msgSend(v3, "appendFormat:", @"%@: '%d'; ",
    @"mapsMerchantBrandResultProviderID",
    self->_mapsMerchantBrandResultProviderID);
  [(CLLocation *)self->_location coordinate];
  [v3 appendFormat:@"%@: '%f'; ", @"locationLatitude", v6];
  [(CLLocation *)self->_location coordinate];
  [v3 appendFormat:@"%@: '%f'; ", @"locationLongitude", v7];
  [(CLLocation *)self->_location horizontalAccuracy];
  [v3 appendFormat:@"%@: '%f'; ", @"locationHorizontalAccuracy", v8];
  [(CLLocation *)self->_location verticalAccuracy];
  [v3 appendFormat:@"%@: '%f'; ", @"locationVerticalAccuracy", v9];
  [v3 appendFormat:@"%@: '%lu'; ", @"disputeType", self->_disputeType];
  [v3 appendFormat:@"%@: '%lu'; ", @"disputeStatus", self->_disputeStatus];
  [v3 appendFormat:@"%@: '%@'; ", @"disputeOpenDate", self->_disputeOpenDate];
  [v3 appendFormat:@"%@: '%@'; ", @"disputeLastUpdatedDate", self->_disputeLastUpdatedDate];
  objc_msgSend(v3, "appendFormat:", @"%@: '%@'; ",
    @"peerPaymentCounterpartHandle",
    self->_peerPaymentCounterpartHandle);
  [v3 appendFormat:@"%@: '%lu'; ", @"peerPaymentType", self->_peerPaymentType];
  [v3 appendFormat:@"%@: '%@'; ", @"transactionDescription", self->_transactionDescription];
  [v3 appendFormat:@"%@: '%d'; ", @"recurring", self->_recurring];
  [v3 appendFormat:@">"];
  return v3;
}

- (BOOL)hasLocation
{
  v3 = [(FHTransaction *)self location];
  if (v3)
  {
    id v4 = [(FHTransaction *)self location];
    [v4 coordinate];
    if (v5 == 0.0)
    {
      BOOL v8 = 0;
    }
    else
    {
      uint64_t v6 = [(FHTransaction *)self location];
      [v6 coordinate];
      BOOL v8 = v7 != 0.0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)transactionServiceIdentifier
{
  return self->_transactionServiceIdentifier;
}

- (void)setTransactionServiceIdentifier:(id)a3
{
}

- (NSString)financeTransactionIdentifier
{
  return self->_financeTransactionIdentifier;
}

- (void)setFinanceTransactionIdentifier:(id)a3
{
}

- (NSString)paymentHash
{
  return self->_paymentHash;
}

- (void)setPaymentHash:(id)a3
{
}

- (NSString)transactionSourceIdentifier
{
  return self->_transactionSourceIdentifier;
}

- (void)setTransactionSourceIdentifier:(id)a3
{
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
}

- (NSDate)transactionStatusChangedDate
{
  return self->_transactionStatusChangedDate;
}

- (void)setTransactionStatusChangedDate:(id)a3
{
}

- (int64_t)transactionStatus
{
  return self->_transactionStatus;
}

- (void)setTransactionStatus:(int64_t)a3
{
  self->_transactionStatus = a3;
}

- (unint64_t)transactionSource
{
  return self->_transactionSource;
}

- (void)setTransactionSource:(unint64_t)a3
{
  self->_transactionSource = a3;
}

- (unint64_t)cardType
{
  return self->_cardType;
}

- (void)setCardType:(unint64_t)a3
{
  self->_cardType = a3;
}

- (int64_t)transactionType
{
  return self->_transactionType;
}

- (void)setTransactionType:(int64_t)a3
{
  self->_transactionType = a3;
}

- (int64_t)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(int64_t)a3
{
  self->_accountType = a3;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)receiptIdentifier
{
  return self->_receiptIdentifier;
}

- (void)setReceiptIdentifier:(id)a3
{
}

- (NSString)associatedReceiptUniqueID
{
  return self->_associatedReceiptUniqueID;
}

- (void)setAssociatedReceiptUniqueID:(id)a3
{
}

- (NSString)merchantUniqueIdentifier
{
  return self->_merchantUniqueIdentifier;
}

- (void)setMerchantUniqueIdentifier:(id)a3
{
}

- (unint64_t)mapsMerchantID
{
  return self->_mapsMerchantID;
}

- (void)setMapsMerchantID:(unint64_t)a3
{
  self->_mapsMerchantID = a3;
}

- (int)mapsMerchantResultProviderID
{
  return self->_mapsMerchantResultProviderID;
}

- (void)setMapsMerchantResultProviderID:(int)a3
{
  self->_mapsMerchantResultProviderID = a3;
}

- (unint64_t)mapsMerchantBrandID
{
  return self->_mapsMerchantBrandID;
}

- (void)setMapsMerchantBrandID:(unint64_t)a3
{
  self->_mapsMerchantBrandID = a3;
}

- (int)mapsMerchantBrandResultProviderID
{
  return self->_mapsMerchantBrandResultProviderID;
}

- (void)setMapsMerchantBrandResultProviderID:(int)a3
{
  self->_mapsMerchantBrandResultProviderID = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)rawName
{
  return self->_rawName;
}

- (void)setRawName:(id)a3
{
}

- (int64_t)industryCode
{
  return self->_industryCode;
}

- (void)setIndustryCode:(int64_t)a3
{
  self->_industryCode = a3;
}

- (NSString)industryCategory
{
  return self->_industryCategory;
}

- (void)setIndustryCategory:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)street
{
  return self->_street;
}

- (void)setStreet:(id)a3
{
}

- (NSString)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)zip
{
  return self->_zip;
}

- (void)setZip:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
}

- (NSString)merchantDetailedCategory
{
  return self->_merchantDetailedCategory;
}

- (void)setMerchantDetailedCategory:(id)a3
{
}

- (int64_t)category
{
  return self->_category;
}

- (void)setCategory:(int64_t)a3
{
  self->_category = a3;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (unint64_t)disputeType
{
  return self->_disputeType;
}

- (void)setDisputeType:(unint64_t)a3
{
  self->_disputeType = a3;
}

- (unint64_t)disputeStatus
{
  return self->_disputeStatus;
}

- (void)setDisputeStatus:(unint64_t)a3
{
  self->_disputeStatus = a3;
}

- (NSDate)disputeOpenDate
{
  return self->_disputeOpenDate;
}

- (void)setDisputeOpenDate:(id)a3
{
}

- (NSDate)disputeLastUpdatedDate
{
  return self->_disputeLastUpdatedDate;
}

- (void)setDisputeLastUpdatedDate:(id)a3
{
}

- (NSString)peerPaymentCounterpartHandle
{
  return self->_peerPaymentCounterpartHandle;
}

- (void)setPeerPaymentCounterpartHandle:(id)a3
{
}

- (int64_t)peerPaymentType
{
  return self->_peerPaymentType;
}

- (void)setPeerPaymentType:(int64_t)a3
{
  self->_peerPaymentType = a3;
}

- (NSString)transactionDescription
{
  return self->_transactionDescription;
}

- (void)setTransactionDescription:(id)a3
{
}

- (BOOL)recurring
{
  return self->_recurring;
}

- (void)setRecurring:(BOOL)a3
{
  self->_recurring = a3;
}

- (unint64_t)transactionInternalState
{
  return self->_transactionInternalState;
}

- (void)setTransactionInternalState:(unint64_t)a3
{
  self->_transactionInternalState = a3;
}

- (void)setHasLocation:(BOOL)a3
{
  self->_hasLocation = a3;
}

- (NSDictionary)compoundFeatures
{
  return self->_compoundFeatures;
}

- (void)setCompoundFeatures:(id)a3
{
}

- (int64_t)amountFromDatabase
{
  return self->_amountFromDatabase;
}

- (void)setAmountFromDatabase:(int64_t)a3
{
  self->_amountFromDatabase = a3;
}

- (unint64_t)suggestedSuggestionCategory
{
  return self->_suggestedSuggestionCategory;
}

- (void)setSuggestedSuggestionCategory:(unint64_t)a3
{
  self->_suggestedSuggestionCategory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compoundFeatures, 0);
  objc_storeStrong((id *)&self->_transactionDescription, 0);
  objc_storeStrong((id *)&self->_peerPaymentCounterpartHandle, 0);
  objc_storeStrong((id *)&self->_disputeLastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_disputeOpenDate, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_merchantDetailedCategory, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_zip, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_street, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_industryCategory, 0);
  objc_storeStrong((id *)&self->_rawName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_merchantUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedReceiptUniqueID, 0);
  objc_storeStrong((id *)&self->_receiptIdentifier, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_transactionStatusChangedDate, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentHash, 0);
  objc_storeStrong((id *)&self->_financeTransactionIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end