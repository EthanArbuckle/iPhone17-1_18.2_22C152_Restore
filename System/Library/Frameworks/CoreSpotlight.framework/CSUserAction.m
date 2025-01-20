@interface CSUserAction
+ (BOOL)supportsSecureCoding;
+ (id)actionFromUserActivity:(id)a3 searchableItem:(id)a4;
- (BOOL)isEqual:(id)a3;
- (CSUserAction)initWithCoder:(id)a3;
- (CSUserAction)initWithUserActivity:(id)a3 searchableItem:(id)a4;
- (CSUserAction)initWithXPCDict:(id)a3;
- (NSArray)madeCurrentDates;
- (NSArray)madeCurrentEndDates;
- (NSArray)madeInitiallyCurrentDates;
- (NSArray)sentToIndexerDates;
- (NSDictionary)userInfo;
- (NSSet)keywords;
- (NSString)contentAction;
- (NSString)itemIdentifier;
- (NSUUID)uaIdentifier;
- (OS_xpc_object)xpc_dictionary;
- (double)madeCurrentInterval;
- (id)_propertiesDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (unint64_t)eligibility;
- (unint64_t)hash;
- (void)encodeWithCSCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContentAction:(id)a3;
- (void)setEligibility:(unint64_t)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setKeywords:(id)a3;
- (void)setMadeCurrentDates:(id)a3;
- (void)setMadeCurrentEndDates:(id)a3;
- (void)setMadeCurrentInterval:(double)a3;
- (void)setMadeInitiallyCurrentDates:(id)a3;
- (void)setSentToIndexerDates:(id)a3;
- (void)setUaIdentifier:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)updateWithUserAction:(id)a3;
@end

@implementation CSUserAction

- (void)updateWithUserAction:(id)a3
{
  v4 = (id *)a3;
  if (!v4) {
    goto LABEL_24;
  }
  v27 = v4;
  if ([v4[7] count])
  {
    NSUInteger v5 = [(NSArray *)self->_madeInitiallyCurrentDates count];
    id v6 = v27[7];
    if (!v5)
    {
      v13 = (NSArray *)v6;
      goto LABEL_7;
    }
    v7 = [v6 firstObject];
    [v7 timeIntervalSinceReferenceDate];
    double v9 = v8;

    v10 = [(NSArray *)self->_madeInitiallyCurrentDates lastObject];
    [v10 timeIntervalSinceReferenceDate];
    double v12 = v11;

    if (v9 > v12)
    {
      v13 = [v27[7] arrayByAddingObjectsFromArray:self->_madeInitiallyCurrentDates];
LABEL_7:
      madeInitiallyCurrentDates = self->_madeInitiallyCurrentDates;
      self->_madeInitiallyCurrentDates = v13;
    }
  }
  if ([v27[8] count])
  {
    NSUInteger v15 = [(NSArray *)self->_madeCurrentDates count];
    id v16 = v27[8];
    if (v15)
    {
      v17 = [v16 arrayByAddingObjectsFromArray:self->_madeCurrentDates];
    }
    else
    {
      v17 = (NSArray *)v16;
    }
    madeCurrentDates = self->_madeCurrentDates;
    self->_madeCurrentDates = v17;
  }
  if ([v27[9] count])
  {
    NSUInteger v19 = [(NSArray *)self->_madeCurrentEndDates count];
    id v20 = v27[9];
    if (v19)
    {
      v21 = [v20 arrayByAddingObjectsFromArray:self->_madeCurrentEndDates];
    }
    else
    {
      v21 = (NSArray *)v20;
    }
    madeCurrentEndDates = self->_madeCurrentEndDates;
    self->_madeCurrentEndDates = v21;
  }
  if ([v27[10] count])
  {
    NSUInteger v23 = [(NSArray *)self->_sentToIndexerDates count];
    id v24 = v27[10];
    if (v23)
    {
      v25 = [v24 arrayByAddingObjectsFromArray:self->_sentToIndexerDates];
    }
    else
    {
      v25 = (NSArray *)v24;
    }
    sentToIndexerDates = self->_sentToIndexerDates;
    self->_sentToIndexerDates = v25;
  }
  *(void *)&self->_madeCurrentInterval = v27[11];
LABEL_24:

  MEMORY[0x1F41817F8]();
}

+ (id)actionFromUserActivity:(id)a3 searchableItem:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithUserActivity:v6 searchableItem:v5];

  return v7;
}

- (CSUserAction)initWithUserActivity:(id)a3 searchableItem:(id)a4
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  double v9 = 0;
  if (v6 && v7)
  {
    v39.receiver = self;
    v39.super_class = (Class)CSUserAction;
    v10 = [(CSUserAction *)&v39 init];
    if (!v10)
    {
LABEL_26:
      self = v10;
      double v9 = self;
      goto LABEL_27;
    }
    uint64_t v11 = [v8 uniqueIdentifier];
    itemIdentifier = v10->_itemIdentifier;
    v10->_itemIdentifier = (NSString *)v11;

    uint64_t v13 = [v6 keywords];
    keywords = v10->_keywords;
    v10->_keywords = (NSSet *)v13;

    if ([v6 isEligibleForHandoff]) {
      v10->_eligibility |= 2uLL;
    }
    if ([v6 isEligibleForPublicIndexing]) {
      v10->_eligibility |= 4uLL;
    }
    if ([v6 isEligibleForSearch]) {
      v10->_eligibility |= 1uLL;
    }
    if ([v6 isEligibleForPrediction]) {
      v10->_eligibility |= 8uLL;
    }
    uint64_t v15 = [v6 userInfo];
    userInfo = v10->_userInfo;
    v10->_userInfo = (NSDictionary *)v15;

    v17 = [v6 _originalUniqueIdentifier];
    v18 = v17;
    if (v17)
    {
      NSUInteger v19 = v17;
    }
    else
    {
      NSUInteger v19 = [v6 _uniqueIdentifier];
    }
    uaIdentifier = v10->_uaIdentifier;
    v10->_uaIdentifier = v19;

    uint64_t v21 = [v6 _madeInitiallyCurrentDate];
    v22 = (void *)v21;
    if (v21)
    {
      v43[0] = v21;
      uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
      madeInitiallyCurrentDates = v10->_madeInitiallyCurrentDates;
      v10->_madeInitiallyCurrentDates = (NSArray *)v23;
    }
    uint64_t v25 = [v6 _madeCurrentDate];
    v26 = (void *)v25;
    if (v25)
    {
      uint64_t v42 = v25;
      uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
      madeCurrentDates = v10->_madeCurrentDates;
      v10->_madeCurrentDates = (NSArray *)v27;
    }
    else if (!v22)
    {
LABEL_25:

      goto LABEL_26;
    }
    uint64_t v29 = [v6 _madeCurrentEndDate];
    v30 = (void *)v29;
    if (v29)
    {
      uint64_t v41 = v29;
      uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
      madeCurrentEndDates = v10->_madeCurrentEndDates;
      v10->_madeCurrentEndDates = (NSArray *)v31;
    }
    uint64_t v33 = [v6 _sentToIndexerDate];
    v34 = (void *)v33;
    if (v33)
    {
      uint64_t v40 = v33;
      uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
      sentToIndexerDates = v10->_sentToIndexerDates;
      v10->_sentToIndexerDates = (NSArray *)v35;
    }
    [v6 _madeCurrentInterval];
    v10->_madeCurrentInterval = v37;

    goto LABEL_25;
  }
LABEL_27:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentToIndexerDates, 0);
  objc_storeStrong((id *)&self->_madeCurrentEndDates, 0);
  objc_storeStrong((id *)&self->_madeCurrentDates, 0);
  objc_storeStrong((id *)&self->_madeInitiallyCurrentDates, 0);
  objc_storeStrong((id *)&self->_uaIdentifier, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_contentAction, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

- (void)encodeWithCSCoder:(id)a3
{
  id v30 = a3;
  [v30 beginType:"CSUserAction"];
  v4 = [(CSUserAction *)self itemIdentifier];
  [v30 encodeNSString:v4];

  uint64_t v5 = [(CSUserAction *)self contentAction];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = &stru_1EDBB3A50;
  }
  [v30 encodeNSString:v7];

  objc_msgSend(v30, "encodeInt32:", -[CSUserAction eligibility](self, "eligibility"));
  uint64_t v8 = [(CSUserAction *)self userInfo];
  double v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = MEMORY[0x1E4F1CC08];
  }
  [v30 encodeObject:v10];

  uint64_t v11 = [(CSUserAction *)self keywords];
  uint64_t v12 = [v11 allObjects];
  uint64_t v13 = (void *)v12;
  v14 = (void *)MEMORY[0x1E4F1CBF0];
  if (v12) {
    uint64_t v15 = v12;
  }
  else {
    uint64_t v15 = MEMORY[0x1E4F1CBF0];
  }
  [v30 encodeObject:v15];

  id v16 = [(CSUserAction *)self uaIdentifier];
  uint64_t v17 = [v16 UUIDString];
  v18 = (void *)v17;
  if (v17) {
    NSUInteger v19 = (__CFString *)v17;
  }
  else {
    NSUInteger v19 = &stru_1EDBB3A50;
  }
  [v30 encodeNSString:v19];

  id v20 = [(CSUserAction *)self madeInitiallyCurrentDates];
  uint64_t v21 = [(CSUserAction *)self madeCurrentDates];
  if ([v20 count] || v21)
  {
    if (v20) {
      v22 = v20;
    }
    else {
      v22 = v14;
    }
    [v30 encodeObject:v22];
    if (v21) {
      uint64_t v23 = v21;
    }
    else {
      uint64_t v23 = v14;
    }
    [v30 encodeObject:v23];
    uint64_t v24 = [(CSUserAction *)self madeCurrentEndDates];
    uint64_t v25 = (void *)v24;
    if (v24) {
      uint64_t v26 = v24;
    }
    else {
      uint64_t v26 = (uint64_t)v14;
    }
    [v30 encodeObject:v26];

    uint64_t v27 = [(CSUserAction *)self sentToIndexerDates];
    v28 = (void *)v27;
    if (v27) {
      uint64_t v29 = v27;
    }
    else {
      uint64_t v29 = (uint64_t)v14;
    }
    [v30 encodeObject:v29];

    [(CSUserAction *)self madeCurrentInterval];
    objc_msgSend(v30, "encodeDouble:");
  }
  [v30 endType];
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_itemIdentifier forKey:@"id"];
  [v5 encodeObject:self->_contentAction forKey:@"act"];
  [v5 encodeObject:self->_userInfo forKey:@"ui"];
  [v5 encodeObject:self->_keywords forKey:@"kw"];
  [v5 encodeInteger:self->_eligibility forKey:@"elig"];
  [v5 encodeObject:self->_uaIdentifier forKey:@"uaid"];
  if ([(NSArray *)self->_madeInitiallyCurrentDates count]) {
    [v5 encodeObject:self->_madeInitiallyCurrentDates forKey:@"micd"];
  }
  if ([(NSArray *)self->_madeCurrentDates count]) {
    [v5 encodeObject:self->_madeCurrentDates forKey:@"mcd"];
  }
  if ([(NSArray *)self->_madeCurrentEndDates count]) {
    [v5 encodeObject:self->_madeCurrentEndDates forKey:@"mced"];
  }
  if ([(NSArray *)self->_sentToIndexerDates count]) {
    [v5 encodeObject:self->_sentToIndexerDates forKey:@"sid"];
  }
  v4 = v5;
  if (self->_madeCurrentInterval != 0.0)
  {
    objc_msgSend(v5, "encodeDouble:forKey:", @"mci");
    v4 = v5;
  }
}

- (CSUserAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)CSUserAction;
  id v5 = [(CSUserAction *)&v52 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"act"];
    contentAction = v5->_contentAction;
    v5->_contentAction = (NSString *)v8;

    v51 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v50 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v51, "setWithObjects:", v50, v10, v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"ui"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v19;

    uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"kw"];
    keywords = v5->_keywords;
    v5->_keywords = (NSSet *)v24;

    v5->_eligibility = [v4 decodeIntegerForKey:@"elig"];
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uaid"];
    uaIdentifier = v5->_uaIdentifier;
    v5->_uaIdentifier = (NSUUID *)v26;

    v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    id v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"micd"];
    madeInitiallyCurrentDates = v5->_madeInitiallyCurrentDates;
    v5->_madeInitiallyCurrentDates = (NSArray *)v31;

    uint64_t v33 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"mcd"];
    madeCurrentDates = v5->_madeCurrentDates;
    v5->_madeCurrentDates = (NSArray *)v36;

    v38 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v39 = objc_opt_class();
    uint64_t v40 = objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
    uint64_t v41 = [v4 decodeObjectOfClasses:v40 forKey:@"mced"];
    madeCurrentEndDates = v5->_madeCurrentEndDates;
    v5->_madeCurrentEndDates = (NSArray *)v41;

    v43 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v44 = objc_opt_class();
    v45 = objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
    uint64_t v46 = [v4 decodeObjectOfClasses:v45 forKey:@"sid"];
    sentToIndexerDates = v5->_sentToIndexerDates;
    v5->_sentToIndexerDates = (NSArray *)v46;

    [v4 decodeDoubleForKey:@"mci"];
    v5->_madeCurrentInterval = v48;
  }

  return v5;
}

- (OS_xpc_object)xpc_dictionary
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "id", [(NSString *)self->_itemIdentifier UTF8String]);
  xpc_dictionary_set_string(v3, "act", [(NSString *)self->_contentAction UTF8String]);
  xpc_dictionary_set_uint64(v3, "elig", self->_eligibility);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v4 encodeObject:self->_userInfo forKey:*MEMORY[0x1E4F284E8]];
  id v5 = [v4 encodedData];
  xpc_dictionary_set_data(v3, "ui", (const void *)[v5 bytes], objc_msgSend(v5, "length"));
  id v6 = [(NSUUID *)self->_uaIdentifier UUIDString];
  xpc_dictionary_set_string(v3, "uaid", (const char *)[v6 UTF8String]);

  addXPCDateArrayToXPCDict(v3, self->_madeInitiallyCurrentDates, (const char *)@"micd");
  addXPCDateArrayToXPCDict(v3, self->_madeCurrentDates, "mcd");
  addXPCDateArrayToXPCDict(v3, self->_madeCurrentEndDates, "mced");
  addXPCDateArrayToXPCDict(v3, self->_sentToIndexerDates, "sid");
  double madeCurrentInterval = self->_madeCurrentInterval;
  if (madeCurrentInterval != 0.0) {
    xpc_dictionary_set_double(v3, "mci", madeCurrentInterval);
  }

  return (OS_xpc_object *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setItemIdentifier:self->_itemIdentifier];
  [v4 setContentAction:self->_contentAction];
  id v5 = (void *)[(NSDictionary *)self->_userInfo copy];
  [v4 setUserInfo:v5];

  id v6 = (void *)[(NSSet *)self->_keywords copy];
  [v4 setKeywords:v6];

  [v4 setEligibility:self->_eligibility];
  [v4 setUaIdentifier:self->_uaIdentifier];
  [v4 setMadeInitiallyCurrentDates:self->_madeInitiallyCurrentDates];
  [v4 setMadeCurrentDates:self->_madeCurrentDates];
  [v4 setMadeCurrentEndDates:self->_madeCurrentEndDates];
  [v4 setSentToIndexerDates:self->_sentToIndexerDates];
  [v4 setMadeCurrentInterval:self->_madeCurrentInterval];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    itemIdentifier = self->_itemIdentifier;
    if ((itemIdentifier == (NSString *)v5[1] || -[NSString isEqualToString:](itemIdentifier, "isEqualToString:"))
      && ((contentAction = self->_contentAction, contentAction == (NSString *)v5[2])
       || -[NSString isEqualToString:](contentAction, "isEqualToString:"))
      && ((userInfo = self->_userInfo, userInfo == (NSDictionary *)v5[3])
       || -[NSDictionary isEqual:](userInfo, "isEqual:"))
      && ((keywords = self->_keywords, keywords == (NSSet *)v5[4])
       || -[NSSet isEqual:](keywords, "isEqual:"))
      && self->_eligibility == v5[5])
    {
      uaIdentifier = self->_uaIdentifier;
      if (uaIdentifier == (NSUUID *)v5[6]) {
        char v11 = 1;
      }
      else {
        char v11 = -[NSUUID isEqual:](uaIdentifier, "isEqual:");
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return [(NSString *)self->_itemIdentifier hash];
}

- (id)_propertiesDescription
{
  xpc_object_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  id v4 = [NSString alloc];
  id v5 = [(NSUUID *)self->_uaIdentifier UUIDString];
  id v6 = (void *)[v4 initWithFormat:@"uuid=%@", v5];
  [v3 addObject:v6];

  id v7 = (void *)[[NSString alloc] initWithFormat:@"id=%@", self->_itemIdentifier];
  [v3 addObject:v7];

  if ([(NSArray *)self->_madeInitiallyCurrentDates count])
  {
    id v8 = [NSString alloc];
    double v9 = [(NSArray *)self->_madeInitiallyCurrentDates componentsJoinedByString:@", "];
    uint64_t v10 = (void *)[v8 initWithFormat:@"inital=[%@]", v9];
    [v3 addObject:v10];
  }
  if ([(NSArray *)self->_madeCurrentDates count])
  {
    id v11 = [NSString alloc];
    uint64_t v12 = [(NSArray *)self->_madeCurrentDates componentsJoinedByString:@", "];
    uint64_t v13 = (void *)[v11 initWithFormat:@"start=[%@]", v12];
    [v3 addObject:v13];
  }
  if ([(NSArray *)self->_madeCurrentEndDates count])
  {
    id v14 = [NSString alloc];
    uint64_t v15 = [(NSArray *)self->_madeCurrentEndDates componentsJoinedByString:@", "];
    uint64_t v16 = (void *)[v14 initWithFormat:@"end=[%@]", v15];
    [v3 addObject:v16];
  }
  if ([(NSArray *)self->_sentToIndexerDates count])
  {
    id v17 = [NSString alloc];
    v18 = [(NSArray *)self->_sentToIndexerDates componentsJoinedByString:@", "];
    uint64_t v19 = (void *)[v17 initWithFormat:@"sent=[%@]", v18];
    [v3 addObject:v19];
  }
  if (self->_madeCurrentInterval != 0.0)
  {
    id v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"currentInterval=%g", *(void *)&self->_madeCurrentInterval);
    [v3 addObject:v20];
  }
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  uint64_t v22 = v21;
  unint64_t eligibility = self->_eligibility;
  if (eligibility)
  {
    [v21 addObject:@"eligible-for-search"];
    if ((eligibility & 2) == 0)
    {
LABEL_13:
      if ((eligibility & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_23;
    }
  }
  else if ((eligibility & 2) == 0)
  {
    goto LABEL_13;
  }
  [v22 addObject:@"eligible-for-handoff"];
  if ((eligibility & 4) == 0)
  {
LABEL_14:
    if ((eligibility & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_23:
  [v22 addObject:@"eligible-for-public-indexing"];
  if ((eligibility & 8) != 0) {
LABEL_15:
  }
    [v22 addObject:@"eligible-for-prediction"];
LABEL_16:
  if ([v22 count])
  {
    id v24 = [NSString alloc];
    uint64_t v25 = [v22 componentsJoinedByString:@"|"];
    uint64_t v26 = (void *)[v24 initWithFormat:@"flags=%@", v25];
    [v3 addObject:v26];
  }
  uint64_t v27 = [v3 componentsJoinedByString:@", "];

  return v27;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  id v5 = [(CSUserAction *)self _propertiesDescription];
  id v6 = (void *)[v3 initWithFormat:@"<%@:%p; %@>", v4, self, v5];

  return v6;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  id v5 = [(CSUserAction *)self _propertiesDescription];
  id v6 = objc_msgSend(v3, "initWithFormat:", @"<%@:%p; %@, keywords:%@, userInfo:%@>",
                 v4,
                 self,
                 v5,
                 self->_keywords,
                 self->_userInfo);

  return v6;
}

- (NSString)itemIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSString)contentAction
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContentAction:(id)a3
{
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUserInfo:(id)a3
{
}

- (NSSet)keywords
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKeywords:(id)a3
{
}

- (unint64_t)eligibility
{
  return self->_eligibility;
}

- (void)setEligibility:(unint64_t)a3
{
  self->_unint64_t eligibility = a3;
}

- (NSUUID)uaIdentifier
{
  return self->_uaIdentifier;
}

- (void)setUaIdentifier:(id)a3
{
}

- (NSArray)madeInitiallyCurrentDates
{
  return self->_madeInitiallyCurrentDates;
}

- (void)setMadeInitiallyCurrentDates:(id)a3
{
}

- (NSArray)madeCurrentDates
{
  return self->_madeCurrentDates;
}

- (void)setMadeCurrentDates:(id)a3
{
}

- (NSArray)madeCurrentEndDates
{
  return self->_madeCurrentEndDates;
}

- (void)setMadeCurrentEndDates:(id)a3
{
}

- (NSArray)sentToIndexerDates
{
  return self->_sentToIndexerDates;
}

- (void)setSentToIndexerDates:(id)a3
{
}

- (double)madeCurrentInterval
{
  return self->_madeCurrentInterval;
}

- (void)setMadeCurrentInterval:(double)a3
{
  self->_double madeCurrentInterval = a3;
}

- (CSUserAction)initWithXPCDict:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CSUserAction;
  id v5 = [(CSUserAction *)&v35 init];
  if (v5)
  {
    id v6 = +[CSXPCConnection copyNSStringForKey:"id" fromXPCDictionary:v4];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = v6;

    id v8 = +[CSXPCConnection copyNSStringForKey:"act" fromXPCDictionary:v4];
    contentAction = v5->_contentAction;
    v5->_contentAction = v8;

    uint64_t v10 = +[CSXPCConnection dataWrapperForKey:"ui" sizeKey:0 fromXPCDictionary:v4];
    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F28DC0]);
      uint64_t v12 = [v10 data];
      uint64_t v13 = (void *)[v11 initForReadingFromData:v12 error:0];

      id v14 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
      uint64_t v15 = [v13 decodeObjectOfClasses:v14 forKey:*MEMORY[0x1E4F284E8]];
      userInfo = v5->_userInfo;
      v5->_userInfo = (NSDictionary *)v15;
    }
    id v17 = xpc_dictionary_get_value(v4, "kw");
    id v18 = +[CSXPCConnection copyNSStringArrayFromXPCArray:v17];

    if (v18)
    {
      uint64_t v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v18];
      keywords = v5->_keywords;
      v5->_keywords = (NSSet *)v19;
    }
    v5->_unint64_t eligibility = xpc_dictionary_get_uint64(v4, "elig");
    string = xpc_dictionary_get_string(v4, "uaid");
    if (string)
    {
      id v22 = objc_alloc(MEMORY[0x1E4F29128]);
      uint64_t v23 = [NSString stringWithUTF8String:string];
      uint64_t v24 = [v22 initWithUUIDString:v23];
      uaIdentifier = v5->_uaIdentifier;
      v5->_uaIdentifier = (NSUUID *)v24;
    }
    uint64_t v26 = copyXPCDateArrayFromXPCDict(v4, (const char *)@"micd");
    madeInitiallyCurrentDates = v5->_madeInitiallyCurrentDates;
    v5->_madeInitiallyCurrentDates = (NSArray *)v26;

    uint64_t v28 = copyXPCDateArrayFromXPCDict(v4, "mcd");
    madeCurrentDates = v5->_madeCurrentDates;
    v5->_madeCurrentDates = (NSArray *)v28;

    uint64_t v30 = copyXPCDateArrayFromXPCDict(v4, "mced");
    madeCurrentEndDates = v5->_madeCurrentEndDates;
    v5->_madeCurrentEndDates = (NSArray *)v30;

    uint64_t v32 = copyXPCDateArrayFromXPCDict(v4, "sid");
    sentToIndexerDates = v5->_sentToIndexerDates;
    v5->_sentToIndexerDates = (NSArray *)v32;

    v5->_double madeCurrentInterval = xpc_dictionary_get_double(v4, "mci");
  }

  return v5;
}

@end