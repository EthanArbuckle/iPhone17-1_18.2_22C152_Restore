@interface ASDPurchaseHistoryQuery
+ (BOOL)supportsSecureCoding;
- (ASDPurchaseHistoryQuery)initWithCoder:(id)a3;
- (NSArray)bundleIDs;
- (NSArray)sortOptions;
- (NSArray)storeIDs;
- (NSString)searchTerm;
- (id)description;
- (int64_t)accountID;
- (int64_t)currentlyOptedInForMacOSEligibility;
- (int64_t)currentlyOptedInForXROSEligibility;
- (int64_t)includeArcade;
- (int64_t)isFirstParty;
- (int64_t)isHidden;
- (int64_t)isPreorder;
- (int64_t)optedInForMacOSEligibility;
- (int64_t)optedInForXROSEligibility;
- (int64_t)supportsRealityDevice;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountID:(int64_t)a3;
- (void)setBundleIDs:(id)a3;
- (void)setCurrentlyOptedInForMacOSEligibility:(int64_t)a3;
- (void)setCurrentlyOptedInForXROSEligibility:(int64_t)a3;
- (void)setIncludeArcade:(int64_t)a3;
- (void)setIsFirstParty:(int64_t)a3;
- (void)setIsHidden:(int64_t)a3;
- (void)setIsPreorder:(int64_t)a3;
- (void)setOptedInForMacOSEligibility:(int64_t)a3;
- (void)setOptedInForXROSEligibility:(int64_t)a3;
- (void)setSearchTerm:(id)a3;
- (void)setSortOptions:(id)a3;
- (void)setStoreIDs:(id)a3;
- (void)setSupportsRealityDevice:(int64_t)a3;
@end

@implementation ASDPurchaseHistoryQuery

- (void)setSortOptions:(id)a3
{
}

- (void)setIsPreorder:(int64_t)a3
{
  self->_isPreorder = a3;
}

- (void)setIsHidden:(int64_t)a3
{
  self->_isHidden = a3;
}

- (void)setIsFirstParty:(int64_t)a3
{
  self->_isFirstParty = a3;
}

- (void)setAccountID:(int64_t)a3
{
  self->_accountID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeIDs, 0);
  objc_storeStrong((id *)&self->_sortOptions, 0);
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t accountID = self->_accountID;
  id v5 = a3;
  [v5 encodeInt64:accountID forKey:@"A"];
  [v5 encodeInteger:self->_isFirstParty forKey:@"B"];
  [v5 encodeInteger:self->_isHidden forKey:@"C"];
  [v5 encodeInteger:self->_optedInForMacOSEligibility forKey:@"H"];
  [v5 encodeInteger:self->_optedInForXROSEligibility forKey:@"I"];
  [v5 encodeInteger:self->_isPreorder forKey:@"D"];
  [v5 encodeObject:self->_searchTerm forKey:@"E"];
  [v5 encodeObject:self->_sortOptions forKey:@"F"];
  [v5 encodeInteger:self->_supportsRealityDevice forKey:@"L"];
  [v5 encodeObject:self->_storeIDs forKey:@"G"];
  [v5 encodeInteger:self->_currentlyOptedInForMacOSEligibility forKey:@"J"];
  [v5 encodeInteger:self->_currentlyOptedInForXROSEligibility forKey:@"K"];
  [v5 encodeObject:self->_bundleIDs forKey:@"M"];
  [v5 encodeInteger:self->_includeArcade forKey:@"N"];
}

- (ASDPurchaseHistoryQuery)initWithCoder:(id)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ASDPurchaseHistoryQuery;
  id v5 = [(ASDPurchaseHistoryQuery *)&v24 init];
  if (v5)
  {
    v5->_int64_t accountID = [v4 decodeInt64ForKey:@"A"];
    v5->_isFirstParty = [v4 decodeIntegerForKey:@"B"];
    v5->_isHidden = [v4 decodeIntegerForKey:@"C"];
    v5->_optedInForMacOSEligibility = [v4 decodeIntegerForKey:@"H"];
    v5->_optedInForXROSEligibility = [v4 decodeIntegerForKey:@"I"];
    v5->_isPreorder = [v4 decodeIntegerForKey:@"D"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"E"];
    searchTerm = v5->_searchTerm;
    v5->_searchTerm = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"F"];
    sortOptions = v5->_sortOptions;
    v5->_sortOptions = (NSArray *)v11;

    v5->_supportsRealityDevice = [v4 decodeIntegerForKey:@"L"];
    v13 = (void *)MEMORY[0x1E4F1CAD0];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    v15 = [v13 setWithArray:v14];
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"G"];
    storeIDs = v5->_storeIDs;
    v5->_storeIDs = (NSArray *)v16;

    v5->_currentlyOptedInForMacOSEligibility = [v4 decodeIntegerForKey:@"J"];
    v5->_currentlyOptedInForXROSEligibility = [v4 decodeIntegerForKey:@"K"];
    v18 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    v20 = [v18 setWithArray:v19];
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"M"];
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = (NSArray *)v21;

    v5->_includeArcade = [v4 decodeIntegerForKey:@"N"];
  }

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"int64_t accountID = %lld", -[ASDPurchaseHistoryQuery accountID](self, "accountID"));
  [v3 addObject:v4];

  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"isFirstParty = %ld", -[ASDPurchaseHistoryQuery isFirstParty](self, "isFirstParty"));
  [v3 addObject:v5];

  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"isHidden = %ld", -[ASDPurchaseHistoryQuery isHidden](self, "isHidden"));
  [v3 addObject:v6];

  v7 = objc_msgSend(NSString, "stringWithFormat:", @"isPreorder = %ld", -[ASDPurchaseHistoryQuery isPreorder](self, "isPreorder"));
  [v3 addObject:v7];

  v8 = NSString;
  v9 = [(ASDPurchaseHistoryQuery *)self searchTerm];
  v10 = [v8 stringWithFormat:@"searchTerm = %@", v9];
  [v3 addObject:v10];

  uint64_t v11 = NSString;
  v12 = [(ASDPurchaseHistoryQuery *)self storeIDs];
  v13 = [v11 stringWithFormat:@"storeIDs = %@", v12];
  [v3 addObject:v13];

  v14 = NSString;
  v15 = [(ASDPurchaseHistoryQuery *)self bundleIDs];
  uint64_t v16 = [v14 stringWithFormat:@"bundleIDs = %@", v15];
  [v3 addObject:v16];

  v17 = objc_msgSend(NSString, "stringWithFormat:", @"includeArcade = %ld", -[ASDPurchaseHistoryQuery includeArcade](self, "includeArcade"));
  [v3 addObject:v17];

  v18 = NSString;
  v23.receiver = self;
  v23.super_class = (Class)ASDPurchaseHistoryQuery;
  v19 = [(ASDPurchaseHistoryQuery *)&v23 description];
  v20 = [v3 componentsJoinedByString:@"; "];
  uint64_t v21 = [v18 stringWithFormat:@"%@: {%@}", v19, v20];

  return v21;
}

- (int64_t)accountID
{
  return self->_accountID;
}

- (NSArray)bundleIDs
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleIDs:(id)a3
{
}

- (int64_t)includeArcade
{
  return self->_includeArcade;
}

- (void)setIncludeArcade:(int64_t)a3
{
  self->_includeArcade = a3;
}

- (int64_t)isFirstParty
{
  return self->_isFirstParty;
}

- (int64_t)isHidden
{
  return self->_isHidden;
}

- (int64_t)currentlyOptedInForMacOSEligibility
{
  return self->_currentlyOptedInForMacOSEligibility;
}

- (void)setCurrentlyOptedInForMacOSEligibility:(int64_t)a3
{
  self->_currentlyOptedInForMacOSEligibility = a3;
}

- (int64_t)currentlyOptedInForXROSEligibility
{
  return self->_currentlyOptedInForXROSEligibility;
}

- (void)setCurrentlyOptedInForXROSEligibility:(int64_t)a3
{
  self->_currentlyOptedInForXROSEligibility = a3;
}

- (int64_t)optedInForMacOSEligibility
{
  return self->_optedInForMacOSEligibility;
}

- (void)setOptedInForMacOSEligibility:(int64_t)a3
{
  self->_optedInForMacOSEligibility = a3;
}

- (int64_t)optedInForXROSEligibility
{
  return self->_optedInForXROSEligibility;
}

- (void)setOptedInForXROSEligibility:(int64_t)a3
{
  self->_optedInForXROSEligibility = a3;
}

- (int64_t)isPreorder
{
  return self->_isPreorder;
}

- (NSString)searchTerm
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSearchTerm:(id)a3
{
}

- (NSArray)sortOptions
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (int64_t)supportsRealityDevice
{
  return self->_supportsRealityDevice;
}

- (void)setSupportsRealityDevice:(int64_t)a3
{
  self->_supportsRealityDevice = a3;
}

- (NSArray)storeIDs
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setStoreIDs:(id)a3
{
}

@end