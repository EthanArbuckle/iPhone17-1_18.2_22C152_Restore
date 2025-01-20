@interface BMAppActivity
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAppActivity)initWithBundleID:(id)a3 activityType:(id)a4 beginningOfActivity:(id)a5 contentDescription:(id)a6 expirationDate:(id)a7 isEligibleForPrediction:(id)a8 isPubliclyIndexable:(id)a9 itemIdentifier:(id)a10 itemRelatedContentURL:(id)a11 itemRelatedUniqueIdentifier:(id)a12 shortcutAvailability:(id)a13 suggestedInvocationPhrase:(id)a14 title:(id)a15 userActivityRequiredString:(id)a16 userActivityUUID:(id)a17 sourceID:(id)a18 sourceBundleID:(id)a19 sourceItemID:(id)a20 sourceGroupID:(id)a21 calendarUserActivityDate:(id)a22 calendarUserActivityExternalID:(id)a23 calendarUserActivityEndDate:(id)a24;
- (BMAppActivity)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)beginningOfActivity;
- (BOOL)hasBeginningOfActivity;
- (BOOL)hasIsEligibleForPrediction;
- (BOOL)hasIsPubliclyIndexable;
- (BOOL)hasShortcutAvailability;
- (BOOL)isEligibleForPrediction;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPubliclyIndexable;
- (NSDate)calendarUserActivityDate;
- (NSDate)calendarUserActivityEndDate;
- (NSDate)expirationDate;
- (NSString)activityType;
- (NSString)bundleID;
- (NSString)calendarUserActivityExternalID;
- (NSString)contentDescription;
- (NSString)description;
- (NSString)itemIdentifier;
- (NSString)itemRelatedUniqueIdentifier;
- (NSString)sourceBundleID;
- (NSString)sourceGroupID;
- (NSString)sourceID;
- (NSString)sourceItemID;
- (NSString)suggestedInvocationPhrase;
- (NSString)title;
- (NSString)userActivityRequiredString;
- (NSString)userActivityUUID;
- (NSURL)itemRelatedContentURL;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)shortcutAvailability;
- (unsigned)dataVersion;
- (void)setHasBeginningOfActivity:(BOOL)a3;
- (void)setHasIsEligibleForPrediction:(BOOL)a3;
- (void)setHasIsPubliclyIndexable:(BOOL)a3;
- (void)setHasShortcutAvailability:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMAppActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarUserActivityExternalID, 0);
  objc_storeStrong((id *)&self->_sourceGroupID, 0);
  objc_storeStrong((id *)&self->_sourceItemID, 0);
  objc_storeStrong((id *)&self->_sourceBundleID, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);
  objc_storeStrong((id *)&self->_userActivityUUID, 0);
  objc_storeStrong((id *)&self->_userActivityRequiredString, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_suggestedInvocationPhrase, 0);
  objc_storeStrong((id *)&self->_itemRelatedUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_contentDescription, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_raw_itemRelatedContentURL, 0);
}

- (NSString)calendarUserActivityExternalID
{
  return self->_calendarUserActivityExternalID;
}

- (NSString)sourceGroupID
{
  return self->_sourceGroupID;
}

- (NSString)sourceItemID
{
  return self->_sourceItemID;
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (NSString)sourceID
{
  return self->_sourceID;
}

- (NSString)userActivityUUID
{
  return self->_userActivityUUID;
}

- (NSString)userActivityRequiredString
{
  return self->_userActivityRequiredString;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)suggestedInvocationPhrase
{
  return self->_suggestedInvocationPhrase;
}

- (void)setHasShortcutAvailability:(BOOL)a3
{
  self->_hasShortcutAvailability = a3;
}

- (BOOL)hasShortcutAvailability
{
  return self->_hasShortcutAvailability;
}

- (int)shortcutAvailability
{
  return self->_shortcutAvailability;
}

- (NSString)itemRelatedUniqueIdentifier
{
  return self->_itemRelatedUniqueIdentifier;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setHasIsPubliclyIndexable:(BOOL)a3
{
  self->_hasIsPubliclyIndexable = a3;
}

- (BOOL)hasIsPubliclyIndexable
{
  return self->_hasIsPubliclyIndexable;
}

- (BOOL)isPubliclyIndexable
{
  return self->_isPubliclyIndexable;
}

- (void)setHasIsEligibleForPrediction:(BOOL)a3
{
  self->_hasIsEligibleForPrediction = a3;
}

- (BOOL)hasIsEligibleForPrediction
{
  return self->_hasIsEligibleForPrediction;
}

- (BOOL)isEligibleForPrediction
{
  return self->_isEligibleForPrediction;
}

- (NSString)contentDescription
{
  return self->_contentDescription;
}

- (void)setHasBeginningOfActivity:(BOOL)a3
{
  self->_hasBeginningOfActivity = a3;
}

- (BOOL)hasBeginningOfActivity
{
  return self->_hasBeginningOfActivity;
}

- (BOOL)beginningOfActivity
{
  return self->_beginningOfActivity;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMAppActivity *)self bundleID];
    uint64_t v7 = [v5 bundleID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMAppActivity *)self bundleID];
      v10 = [v5 bundleID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_89;
      }
    }
    v13 = [(BMAppActivity *)self activityType];
    uint64_t v14 = [v5 activityType];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMAppActivity *)self activityType];
      v17 = [v5 activityType];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_89;
      }
    }
    if ([(BMAppActivity *)self hasBeginningOfActivity]
      || [v5 hasBeginningOfActivity])
    {
      if (![(BMAppActivity *)self hasBeginningOfActivity]) {
        goto LABEL_89;
      }
      if (![v5 hasBeginningOfActivity]) {
        goto LABEL_89;
      }
      int v19 = [(BMAppActivity *)self beginningOfActivity];
      if (v19 != [v5 beginningOfActivity]) {
        goto LABEL_89;
      }
    }
    v20 = [(BMAppActivity *)self contentDescription];
    uint64_t v21 = [v5 contentDescription];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      v22 = (void *)v21;
      v23 = [(BMAppActivity *)self contentDescription];
      v24 = [v5 contentDescription];
      int v25 = [v23 isEqual:v24];

      if (!v25) {
        goto LABEL_89;
      }
    }
    v26 = [(BMAppActivity *)self expirationDate];
    uint64_t v27 = [v5 expirationDate];
    if (v26 == (void *)v27)
    {
    }
    else
    {
      v28 = (void *)v27;
      v29 = [(BMAppActivity *)self expirationDate];
      v30 = [v5 expirationDate];
      int v31 = [v29 isEqual:v30];

      if (!v31) {
        goto LABEL_89;
      }
    }
    if ([(BMAppActivity *)self hasIsEligibleForPrediction]
      || [v5 hasIsEligibleForPrediction])
    {
      if (![(BMAppActivity *)self hasIsEligibleForPrediction]) {
        goto LABEL_89;
      }
      if (![v5 hasIsEligibleForPrediction]) {
        goto LABEL_89;
      }
      int v32 = [(BMAppActivity *)self isEligibleForPrediction];
      if (v32 != [v5 isEligibleForPrediction]) {
        goto LABEL_89;
      }
    }
    if ([(BMAppActivity *)self hasIsPubliclyIndexable]
      || [v5 hasIsPubliclyIndexable])
    {
      if (![(BMAppActivity *)self hasIsPubliclyIndexable]) {
        goto LABEL_89;
      }
      if (![v5 hasIsPubliclyIndexable]) {
        goto LABEL_89;
      }
      int v33 = [(BMAppActivity *)self isPubliclyIndexable];
      if (v33 != [v5 isPubliclyIndexable]) {
        goto LABEL_89;
      }
    }
    v34 = [(BMAppActivity *)self itemIdentifier];
    uint64_t v35 = [v5 itemIdentifier];
    if (v34 == (void *)v35)
    {
    }
    else
    {
      v36 = (void *)v35;
      v37 = [(BMAppActivity *)self itemIdentifier];
      v38 = [v5 itemIdentifier];
      int v39 = [v37 isEqual:v38];

      if (!v39) {
        goto LABEL_89;
      }
    }
    v40 = [(BMAppActivity *)self itemRelatedContentURL];
    uint64_t v41 = [v5 itemRelatedContentURL];
    if (v40 == (void *)v41)
    {
    }
    else
    {
      v42 = (void *)v41;
      v43 = [(BMAppActivity *)self itemRelatedContentURL];
      v44 = [v5 itemRelatedContentURL];
      int v45 = [v43 isEqual:v44];

      if (!v45) {
        goto LABEL_89;
      }
    }
    v46 = [(BMAppActivity *)self itemRelatedUniqueIdentifier];
    uint64_t v47 = [v5 itemRelatedUniqueIdentifier];
    if (v46 == (void *)v47)
    {
    }
    else
    {
      v48 = (void *)v47;
      v49 = [(BMAppActivity *)self itemRelatedUniqueIdentifier];
      v50 = [v5 itemRelatedUniqueIdentifier];
      int v51 = [v49 isEqual:v50];

      if (!v51) {
        goto LABEL_89;
      }
    }
    if ([(BMAppActivity *)self hasShortcutAvailability]
      || [v5 hasShortcutAvailability])
    {
      if (![(BMAppActivity *)self hasShortcutAvailability]) {
        goto LABEL_89;
      }
      if (![v5 hasShortcutAvailability]) {
        goto LABEL_89;
      }
      int v52 = [(BMAppActivity *)self shortcutAvailability];
      if (v52 != [v5 shortcutAvailability]) {
        goto LABEL_89;
      }
    }
    v53 = [(BMAppActivity *)self suggestedInvocationPhrase];
    uint64_t v54 = [v5 suggestedInvocationPhrase];
    if (v53 == (void *)v54)
    {
    }
    else
    {
      v55 = (void *)v54;
      v56 = [(BMAppActivity *)self suggestedInvocationPhrase];
      v57 = [v5 suggestedInvocationPhrase];
      int v58 = [v56 isEqual:v57];

      if (!v58) {
        goto LABEL_89;
      }
    }
    v59 = [(BMAppActivity *)self title];
    uint64_t v60 = [v5 title];
    if (v59 == (void *)v60)
    {
    }
    else
    {
      v61 = (void *)v60;
      v62 = [(BMAppActivity *)self title];
      v63 = [v5 title];
      int v64 = [v62 isEqual:v63];

      if (!v64) {
        goto LABEL_89;
      }
    }
    v65 = [(BMAppActivity *)self userActivityRequiredString];
    uint64_t v66 = [v5 userActivityRequiredString];
    if (v65 == (void *)v66)
    {
    }
    else
    {
      v67 = (void *)v66;
      v68 = [(BMAppActivity *)self userActivityRequiredString];
      v69 = [v5 userActivityRequiredString];
      int v70 = [v68 isEqual:v69];

      if (!v70) {
        goto LABEL_89;
      }
    }
    v71 = [(BMAppActivity *)self userActivityUUID];
    uint64_t v72 = [v5 userActivityUUID];
    if (v71 == (void *)v72)
    {
    }
    else
    {
      v73 = (void *)v72;
      v74 = [(BMAppActivity *)self userActivityUUID];
      v75 = [v5 userActivityUUID];
      int v76 = [v74 isEqual:v75];

      if (!v76) {
        goto LABEL_89;
      }
    }
    v77 = [(BMAppActivity *)self sourceID];
    uint64_t v78 = [v5 sourceID];
    if (v77 == (void *)v78)
    {
    }
    else
    {
      v79 = (void *)v78;
      v80 = [(BMAppActivity *)self sourceID];
      v81 = [v5 sourceID];
      int v82 = [v80 isEqual:v81];

      if (!v82) {
        goto LABEL_89;
      }
    }
    v83 = [(BMAppActivity *)self sourceBundleID];
    uint64_t v84 = [v5 sourceBundleID];
    if (v83 == (void *)v84)
    {
    }
    else
    {
      v85 = (void *)v84;
      v86 = [(BMAppActivity *)self sourceBundleID];
      v87 = [v5 sourceBundleID];
      int v88 = [v86 isEqual:v87];

      if (!v88) {
        goto LABEL_89;
      }
    }
    v89 = [(BMAppActivity *)self sourceItemID];
    uint64_t v90 = [v5 sourceItemID];
    if (v89 == (void *)v90)
    {
    }
    else
    {
      v91 = (void *)v90;
      v92 = [(BMAppActivity *)self sourceItemID];
      v93 = [v5 sourceItemID];
      int v94 = [v92 isEqual:v93];

      if (!v94) {
        goto LABEL_89;
      }
    }
    v95 = [(BMAppActivity *)self sourceGroupID];
    uint64_t v96 = [v5 sourceGroupID];
    if (v95 == (void *)v96)
    {
    }
    else
    {
      v97 = (void *)v96;
      v98 = [(BMAppActivity *)self sourceGroupID];
      v99 = [v5 sourceGroupID];
      int v100 = [v98 isEqual:v99];

      if (!v100) {
        goto LABEL_89;
      }
    }
    v101 = [(BMAppActivity *)self calendarUserActivityDate];
    uint64_t v102 = [v5 calendarUserActivityDate];
    if (v101 == (void *)v102)
    {
    }
    else
    {
      v103 = (void *)v102;
      v104 = [(BMAppActivity *)self calendarUserActivityDate];
      v105 = [v5 calendarUserActivityDate];
      int v106 = [v104 isEqual:v105];

      if (!v106) {
        goto LABEL_89;
      }
    }
    v107 = [(BMAppActivity *)self calendarUserActivityExternalID];
    uint64_t v108 = [v5 calendarUserActivityExternalID];
    if (v107 == (void *)v108)
    {
    }
    else
    {
      v109 = (void *)v108;
      v110 = [(BMAppActivity *)self calendarUserActivityExternalID];
      v111 = [v5 calendarUserActivityExternalID];
      int v112 = [v110 isEqual:v111];

      if (!v112)
      {
LABEL_89:
        char v12 = 0;
LABEL_90:

        goto LABEL_91;
      }
    }
    v114 = [(BMAppActivity *)self calendarUserActivityEndDate];
    v115 = [v5 calendarUserActivityEndDate];
    if (v114 == v115)
    {
      char v12 = 1;
    }
    else
    {
      v116 = [(BMAppActivity *)self calendarUserActivityEndDate];
      v117 = [v5 calendarUserActivityEndDate];
      char v12 = [v116 isEqual:v117];
    }
    goto LABEL_90;
  }
  char v12 = 0;
LABEL_91:

  return v12;
}

- (NSDate)calendarUserActivityEndDate
{
  if (self->_hasRaw_calendarUserActivityEndDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_calendarUserActivityEndDate];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)calendarUserActivityDate
{
  if (self->_hasRaw_calendarUserActivityDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_calendarUserActivityDate];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSURL)itemRelatedContentURL
{
  raw_itemRelatedContentURL = self->_raw_itemRelatedContentURL;
  if (raw_itemRelatedContentURL)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_itemRelatedContentURL toType:4];
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSDate)expirationDate
{
  if (self->_hasRaw_expirationDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_expirationDate];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v82[22] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMAppActivity *)self bundleID];
  uint64_t v4 = [(BMAppActivity *)self activityType];
  if ([(BMAppActivity *)self hasBeginningOfActivity])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAppActivity beginningOfActivity](self, "beginningOfActivity"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = [(BMAppActivity *)self contentDescription];
  uint64_t v7 = [(BMAppActivity *)self expirationDate];
  if (v7)
  {
    v8 = NSNumber;
    v9 = [(BMAppActivity *)self expirationDate];
    [v9 timeIntervalSince1970];
    objc_msgSend(v8, "numberWithDouble:");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }

  if ([(BMAppActivity *)self hasIsEligibleForPrediction])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAppActivity isEligibleForPrediction](self, "isEligibleForPrediction"));
    id v80 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v80 = 0;
  }
  if ([(BMAppActivity *)self hasIsPubliclyIndexable])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAppActivity isPubliclyIndexable](self, "isPubliclyIndexable"));
    id v79 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v79 = 0;
  }
  uint64_t v78 = [(BMAppActivity *)self itemIdentifier];
  int v11 = [(BMAppActivity *)self itemRelatedContentURL];
  v77 = [v11 absoluteString];

  int v76 = [(BMAppActivity *)self itemRelatedUniqueIdentifier];
  if ([(BMAppActivity *)self hasShortcutAvailability])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMAppActivity shortcutAvailability](self, "shortcutAvailability"));
    id v75 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v75 = 0;
  }
  v74 = [(BMAppActivity *)self suggestedInvocationPhrase];
  v73 = [(BMAppActivity *)self title];
  uint64_t v72 = [(BMAppActivity *)self userActivityRequiredString];
  v71 = [(BMAppActivity *)self userActivityUUID];
  int v70 = [(BMAppActivity *)self sourceID];
  v69 = [(BMAppActivity *)self sourceBundleID];
  v68 = [(BMAppActivity *)self sourceItemID];
  v67 = [(BMAppActivity *)self sourceGroupID];
  char v12 = [(BMAppActivity *)self calendarUserActivityDate];
  if (v12)
  {
    v13 = NSNumber;
    uint64_t v14 = [(BMAppActivity *)self calendarUserActivityDate];
    [v14 timeIntervalSinceReferenceDate];
    objc_msgSend(v13, "numberWithDouble:");
    id v66 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v66 = 0;
  }

  v65 = [(BMAppActivity *)self calendarUserActivityExternalID];
  v15 = [(BMAppActivity *)self calendarUserActivityEndDate];
  if (v15)
  {
    v16 = NSNumber;
    v17 = [(BMAppActivity *)self calendarUserActivityEndDate];
    [v17 timeIntervalSinceReferenceDate];
    objc_msgSend(v16, "numberWithDouble:");
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = 0;
  }

  v81[0] = @"bundleID";
  uint64_t v19 = v3;
  if (!v3)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v56 = (void *)v19;
  v82[0] = v19;
  v81[1] = @"activityType";
  uint64_t v20 = v4;
  if (!v4)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v55 = (void *)v20;
  v82[1] = v20;
  v81[2] = @"beginningOfActivity";
  uint64_t v21 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v54 = (void *)v21;
  v82[2] = v21;
  v81[3] = @"contentDescription";
  uint64_t v22 = v6;
  if (!v6)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v53 = (void *)v22;
  v82[3] = v22;
  v81[4] = @"expirationDate";
  uint64_t v23 = (uint64_t)v10;
  if (!v10)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  int v52 = (void *)v23;
  v82[4] = v23;
  v81[5] = @"isEligibleForPrediction";
  uint64_t v24 = (uint64_t)v80;
  if (!v80)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v82[5] = v24;
  v81[6] = @"isPubliclyIndexable";
  uint64_t v25 = (uint64_t)v79;
  if (!v79)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v82[6] = v25;
  v81[7] = @"itemIdentifier";
  uint64_t v26 = (uint64_t)v78;
  if (!v78)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v82[7] = v26;
  v81[8] = @"itemRelatedContentURL";
  uint64_t v27 = (uint64_t)v77;
  if (!v77)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v82[8] = v27;
  v81[9] = @"itemRelatedUniqueIdentifier";
  uint64_t v28 = (uint64_t)v76;
  if (!v76)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v61 = (void *)v28;
  v82[9] = v28;
  v81[10] = @"shortcutAvailability";
  uint64_t v29 = (uint64_t)v75;
  if (!v75)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v60 = (void *)v29;
  v82[10] = v29;
  v81[11] = @"suggestedInvocationPhrase";
  uint64_t v30 = (uint64_t)v74;
  if (!v74)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  int v64 = (void *)v3;
  v82[11] = v30;
  v81[12] = @"title";
  uint64_t v31 = (uint64_t)v73;
  int v32 = (void *)v30;
  if (!v73)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v59 = (void *)v31;
  v82[12] = v31;
  v81[13] = @"userActivityRequiredString";
  uint64_t v33 = (uint64_t)v72;
  if (!v72)
  {
    uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v50 = (void *)v25;
  int v58 = (void *)v33;
  v82[13] = v33;
  v81[14] = @"userActivityUUID";
  uint64_t v34 = (uint64_t)v71;
  if (!v71)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
  }
  v63 = v5;
  uint64_t v45 = v34;
  v82[14] = v34;
  v81[15] = @"sourceID";
  uint64_t v35 = v70;
  if (!v70)
  {
    uint64_t v35 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v34);
  }
  v48 = (void *)v27;
  v49 = (void *)v26;
  v82[15] = v35;
  v81[16] = @"sourceBundleID";
  v36 = v69;
  if (!v69)
  {
    v36 = [MEMORY[0x1E4F1CA98] null];
  }
  int v51 = (void *)v24;
  v62 = v10;
  v82[16] = v36;
  v81[17] = @"sourceItemID";
  v37 = v68;
  if (!v68)
  {
    v37 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v47 = v32;
  v38 = (void *)v4;
  v82[17] = v37;
  v81[18] = @"sourceGroupID";
  int v39 = v67;
  if (!v67)
  {
    int v39 = [MEMORY[0x1E4F1CA98] null];
  }
  v40 = (void *)v6;
  v82[18] = v39;
  v81[19] = @"calendarUserActivityDate";
  uint64_t v41 = v66;
  if (!v66)
  {
    uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
  }
  v82[19] = v41;
  v81[20] = @"calendarUserActivityExternalID";
  v42 = v65;
  if (!v65)
  {
    v42 = [MEMORY[0x1E4F1CA98] null];
  }
  v82[20] = v42;
  v81[21] = @"calendarUserActivityEndDate";
  v43 = v18;
  if (!v18)
  {
    v43 = [MEMORY[0x1E4F1CA98] null];
  }
  v82[21] = v43;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v82, v81, 22, v45);
  id v57 = (id)objc_claimAutoreleasedReturnValue();
  if (!v18) {

  }
  if (!v65) {
  if (!v66)
  }

  if (!v67) {
  if (!v68)
  }

  if (!v69) {
  if (!v70)
  }

  if (!v71) {
  if (!v72)
  }

  if (!v73) {
  if (!v74)
  }

  if (!v75) {
  if (!v76)
  }

  if (!v77) {
  if (!v78)
  }

  if (!v79) {
  if (v80)
  }
  {
    if (v62) {
      goto LABEL_100;
    }
  }
  else
  {

    if (v62)
    {
LABEL_100:
      if (v40) {
        goto LABEL_101;
      }
      goto LABEL_109;
    }
  }

  if (v40)
  {
LABEL_101:
    if (v63) {
      goto LABEL_102;
    }
    goto LABEL_110;
  }
LABEL_109:

  if (v63)
  {
LABEL_102:
    if (v38) {
      goto LABEL_103;
    }
LABEL_111:

    if (v64) {
      goto LABEL_104;
    }
    goto LABEL_112;
  }
LABEL_110:

  if (!v38) {
    goto LABEL_111;
  }
LABEL_103:
  if (v64) {
    goto LABEL_104;
  }
LABEL_112:

LABEL_104:

  return v57;
}

- (BMAppActivity)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v245[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"bundleID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v199 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v199 = v7;
LABEL_4:
    v8 = [v6 objectForKeyedSubscript:@"activityType"];
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v198 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v198 = v8;
LABEL_7:
      v9 = [v6 objectForKeyedSubscript:@"beginningOfActivity"];
      v197 = self;
      if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v195 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v195 = v9;
LABEL_10:
        id v10 = [v6 objectForKeyedSubscript:@"contentDescription"];
        if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v196 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v196 = v10;
LABEL_13:
          uint64_t v11 = [v6 objectForKeyedSubscript:@"expirationDate"];
          v192 = (void *)v11;
          if (!v11 || (char v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v193 = 0;
            goto LABEL_38;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = v12;
            id v14 = objc_alloc(MEMORY[0x1E4F1C9C8]);
            [v13 doubleValue];
            id v193 = (id)objc_msgSend(v14, "initWithTimeIntervalSince1970:");
LABEL_37:

            goto LABEL_38;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = objc_alloc_init(MEMORY[0x1E4F28D48]);
            id v31 = v12;
            id v193 = [v13 dateFromString:v31];

            goto LABEL_37;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v193 = v12;
LABEL_38:
            uint64_t v32 = [v6 objectForKeyedSubscript:@"isEligibleForPrediction"];
            v191 = (void *)v32;
            if (!v32 || (uint64_t v33 = (void *)v32, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v190 = 0;
              goto LABEL_41;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v190 = v33;
LABEL_41:
              uint64_t v34 = [v6 objectForKeyedSubscript:@"isPubliclyIndexable"];
              v187 = v7;
              v188 = v34;
              if (!v34 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                uint64_t v35 = v8;
                v36 = v9;
                v37 = v10;
                id v189 = 0;
LABEL_44:
                uint64_t v38 = [v6 objectForKeyedSubscript:@"itemIdentifier"];
                v186 = (void *)v38;
                if (v38 && (int v39 = (void *)v38, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (!a4)
                    {
                      id v185 = 0;
                      uint64_t v20 = 0;
                      v17 = v198;
                      uint64_t v19 = v199;
                      a4 = v195;
                      id v10 = v37;
                      v9 = v36;
                      v8 = v35;
                      uint64_t v7 = v187;
                      goto LABEL_146;
                    }
                    id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v71 = *MEMORY[0x1E4F502C8];
                    uint64_t v230 = *MEMORY[0x1E4F28568];
                    v184 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"itemIdentifier"];
                    v231 = v184;
                    uint64_t v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v231 forKeys:&v230 count:1];
                    id v73 = (id)[v70 initWithDomain:v71 code:2 userInfo:v72];
                    id v185 = 0;
                    uint64_t v20 = 0;
                    *a4 = v73;
                    v74 = (void *)v72;
                    v17 = v198;
                    uint64_t v19 = v199;
                    a4 = v195;
                    id v10 = v37;
                    v9 = v36;
                    v8 = v35;
                    uint64_t v7 = v187;
                    uint64_t v34 = v188;
                    goto LABEL_144;
                  }
                  id v185 = v39;
                }
                else
                {
                  id v185 = 0;
                }
                uint64_t v40 = [v6 objectForKeyedSubscript:@"itemRelatedContentURL"];
                v183 = v37;
                v184 = (void *)v40;
                if (v40)
                {
                  uint64_t v41 = (void *)v40;
                  objc_opt_class();
                  v9 = v36;
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    v8 = v35;
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      uint64_t v7 = v187;
                      uint64_t v20 = (BMAppActivity *)a4;
                      if (!a4)
                      {
                        v17 = v198;
                        uint64_t v19 = v199;
                        a4 = v195;
                        id v10 = v183;
                        goto LABEL_145;
                      }
                      id v182 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v75 = *MEMORY[0x1E4F502C8];
                      uint64_t v226 = *MEMORY[0x1E4F28568];
                      uint64_t v76 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"itemRelatedContentURL"];
                      uint64_t v227 = v76;
                      v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v227 forKeys:&v226 count:1];
                      v20->super.super.isa = (Class)(id)[v182 initWithDomain:v75 code:2 userInfo:v77];

                      v74 = (void *)v76;
                      uint64_t v20 = 0;
                      v17 = v198;
                      uint64_t v19 = v199;
                      a4 = v195;
                      goto LABEL_143;
                    }
                    v181 = v9;
                    id v59 = v41;
                    uint64_t v60 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v59];
                    uint64_t v7 = v187;
                    if (!v60)
                    {
                      uint64_t v20 = (BMAppActivity *)a4;
                      if (a4)
                      {
                        id v115 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v116 = *MEMORY[0x1E4F502C8];
                        uint64_t v228 = *MEMORY[0x1E4F28568];
                        v117 = (void *)[[NSString alloc] initWithFormat:@"-initWithString: for %@ returned nil", @"itemRelatedContentURL"];
                        v229 = v117;
                        v118 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v229 forKeys:&v228 count:1];
                        v20->super.super.isa = (Class)(id)[v115 initWithDomain:v116 code:2 userInfo:v118];

                        uint64_t v20 = 0;
                      }
                      v74 = v59;
                      v184 = v59;
                      v17 = v198;
                      uint64_t v19 = v199;
                      a4 = v195;
                      uint64_t v34 = v188;
                      v9 = v181;
                      id v10 = v183;
                      goto LABEL_144;
                    }
                    uint64_t v61 = v60;

                    v180 = (void *)v61;
LABEL_56:
                    uint64_t v42 = [v6 objectForKeyedSubscript:@"itemRelatedUniqueIdentifier"];
                    v179 = (void *)v42;
                    if (v42 && (v43 = (void *)v42, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (!a4)
                        {
                          id v44 = 0;
                          uint64_t v20 = 0;
                          v17 = v198;
                          uint64_t v19 = v199;
                          a4 = v195;
                          goto LABEL_142;
                        }
                        id v78 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v79 = *MEMORY[0x1E4F502C8];
                        uint64_t v224 = *MEMORY[0x1E4F28568];
                        id v80 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"itemRelatedUniqueIdentifier"];
                        v225 = v80;
                        v178 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v225 forKeys:&v224 count:1];
                        id v81 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v79, 2);
                        id v44 = 0;
                        uint64_t v20 = 0;
                        *a4 = v81;
                        v17 = v198;
                        uint64_t v19 = v199;
                        a4 = v195;
LABEL_141:

LABEL_142:
                        v74 = v180;
                        v9 = v181;
LABEL_143:
                        id v10 = v183;
LABEL_144:

LABEL_145:
                        goto LABEL_146;
                      }
                      id v44 = v43;
                    }
                    else
                    {
                      id v44 = 0;
                    }
                    uint64_t v45 = [v6 objectForKeyedSubscript:@"shortcutAvailability"];
                    v178 = (void *)v45;
                    if (v45 && (v46 = (void *)v45, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (!a4)
                        {
                          id v80 = 0;
                          uint64_t v20 = 0;
                          v17 = v198;
                          uint64_t v19 = v199;
                          a4 = v195;
                          goto LABEL_141;
                        }
                        id v98 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v99 = *MEMORY[0x1E4F502C8];
                        uint64_t v222 = *MEMORY[0x1E4F28568];
                        id v100 = [NSString alloc];
                        uint64_t v153 = objc_opt_class();
                        v101 = v100;
                        uint64_t v34 = v188;
                        id v177 = (id)[v101 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v153, @"shortcutAvailability"];
                        id v223 = v177;
                        v176 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v223 forKeys:&v222 count:1];
                        id v102 = (id)objc_msgSend(v98, "initWithDomain:code:userInfo:", v99, 2);
                        id v80 = 0;
                        uint64_t v20 = 0;
                        *a4 = v102;
                        v17 = v198;
                        uint64_t v19 = v199;
                        a4 = v195;
                        goto LABEL_140;
                      }
                      uint64_t v47 = v8;
                      id v48 = v46;
                    }
                    else
                    {
                      uint64_t v47 = v8;
                      id v48 = 0;
                    }
                    uint64_t v49 = [v6 objectForKeyedSubscript:@"suggestedInvocationPhrase"];
                    v176 = (void *)v49;
                    if (v49 && (v50 = (void *)v49, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (!a4)
                        {
                          id v177 = 0;
                          uint64_t v20 = 0;
                          v17 = v198;
                          uint64_t v19 = v199;
                          a4 = v195;
                          id v80 = v48;
                          v8 = v47;
                          uint64_t v7 = v187;
                          goto LABEL_140;
                        }
                        id v103 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v104 = *MEMORY[0x1E4F502C8];
                        uint64_t v220 = *MEMORY[0x1E4F28568];
                        id v174 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"suggestedInvocationPhrase"];
                        id v221 = v174;
                        v173 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v221 forKeys:&v220 count:1];
                        id v105 = (id)objc_msgSend(v103, "initWithDomain:code:userInfo:", v104, 2);
                        id v177 = 0;
                        uint64_t v20 = 0;
                        *a4 = v105;
                        v17 = v198;
                        uint64_t v19 = v199;
                        a4 = v195;
                        id v80 = v48;
                        v8 = v47;
                        uint64_t v7 = v187;
LABEL_139:

LABEL_140:
                        goto LABEL_141;
                      }
                      id v177 = v50;
                    }
                    else
                    {
                      id v177 = 0;
                    }
                    uint64_t v51 = [v6 objectForKeyedSubscript:@"title"];
                    v173 = (void *)v51;
                    id v175 = v44;
                    if (v51 && (int v52 = (void *)v51, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      v53 = v187;
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (!a4)
                        {
                          id v174 = 0;
                          uint64_t v20 = 0;
                          v17 = v198;
                          uint64_t v19 = v199;
                          a4 = v195;
                          id v80 = v48;
                          v8 = v47;
                          uint64_t v7 = v187;
                          uint64_t v34 = v188;
                          goto LABEL_139;
                        }
                        id v107 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v108 = *MEMORY[0x1E4F502C8];
                        uint64_t v218 = *MEMORY[0x1E4F28568];
                        id v172 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"title"];
                        id v219 = v172;
                        v171 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v219 forKeys:&v218 count:1];
                        id v109 = (id)objc_msgSend(v107, "initWithDomain:code:userInfo:", v108, 2);
                        id v174 = 0;
                        uint64_t v20 = 0;
                        *a4 = v109;
                        v17 = v198;
                        uint64_t v19 = v199;
                        a4 = v195;
                        id v80 = v48;
                        v8 = v47;
                        uint64_t v7 = v187;
                        uint64_t v34 = v188;
                        goto LABEL_138;
                      }
                      id v174 = v52;
                    }
                    else
                    {
                      id v174 = 0;
                      v53 = v187;
                    }
                    uint64_t v54 = [v6 objectForKeyedSubscript:@"userActivityRequiredString"];
                    id v170 = v48;
                    v171 = (void *)v54;
                    v168 = v47;
                    if (v54 && (v55 = (void *)v54, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      uint64_t v7 = v53;
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (!a4)
                        {
                          id v172 = 0;
                          uint64_t v20 = 0;
                          v17 = v198;
                          uint64_t v19 = v199;
                          a4 = v195;
                          uint64_t v34 = v188;
                          id v80 = v48;
                          v8 = v168;
                          goto LABEL_138;
                        }
                        id v112 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v113 = *MEMORY[0x1E4F502C8];
                        uint64_t v216 = *MEMORY[0x1E4F28568];
                        id v169 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"userActivityRequiredString"];
                        id v217 = v169;
                        v167 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v217 forKeys:&v216 count:1];
                        id v114 = (id)objc_msgSend(v112, "initWithDomain:code:userInfo:", v113, 2);
                        id v172 = 0;
                        uint64_t v20 = 0;
                        *a4 = v114;
                        v17 = v198;
                        uint64_t v19 = v199;
                        a4 = v195;
                        uint64_t v34 = v188;
                        id v80 = v48;
                        v8 = v168;
LABEL_137:

LABEL_138:
                        goto LABEL_139;
                      }
                      id v172 = v55;
                      id v56 = v48;
                    }
                    else
                    {
                      id v172 = 0;
                      uint64_t v7 = v53;
                      id v56 = v48;
                    }
                    uint64_t v57 = [v6 objectForKeyedSubscript:@"userActivityUUID"];
                    v167 = (void *)v57;
                    if (v57)
                    {
                      int v58 = (void *)v57;
                      objc_opt_class();
                      v8 = v168;
                      if (objc_opt_isKindOfClass())
                      {
                        id v169 = 0;
                      }
                      else
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (!a4)
                          {
                            id v169 = 0;
                            uint64_t v20 = 0;
                            v17 = v198;
                            uint64_t v19 = v199;
                            a4 = v195;
                            id v80 = v56;
                            uint64_t v34 = v188;
                            goto LABEL_137;
                          }
                          id v119 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v120 = *MEMORY[0x1E4F502C8];
                          uint64_t v214 = *MEMORY[0x1E4F28568];
                          id v165 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"userActivityUUID"];
                          id v215 = v165;
                          int v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v215 forKeys:&v214 count:1];
                          id v121 = (id)[v119 initWithDomain:v120 code:2 userInfo:v82];
                          id v169 = 0;
                          uint64_t v20 = 0;
                          *a4 = v121;
                          v17 = v198;
                          uint64_t v19 = v199;
                          a4 = v195;
                          id v80 = v56;
                          goto LABEL_136;
                        }
                        id v169 = v58;
                      }
                    }
                    else
                    {
                      id v169 = 0;
                      v8 = v168;
                    }
                    int v82 = [v6 objectForKeyedSubscript:@"sourceID"];
                    id v80 = v56;
                    if (v82 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (!a4)
                        {
                          id v165 = 0;
                          uint64_t v20 = 0;
                          v17 = v198;
                          uint64_t v19 = v199;
                          a4 = v195;
                          id v80 = v170;
                          goto LABEL_136;
                        }
                        id v166 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v124 = *MEMORY[0x1E4F502C8];
                        uint64_t v212 = *MEMORY[0x1E4F28568];
                        id v164 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sourceID"];
                        id v213 = v164;
                        v162 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v213 forKeys:&v212 count:1];
                        id v125 = (id)objc_msgSend(v166, "initWithDomain:code:userInfo:", v124, 2);
                        id v165 = 0;
                        uint64_t v20 = 0;
                        *a4 = v125;
                        v17 = v198;
                        uint64_t v19 = v199;
                        a4 = v195;
                        goto LABEL_213;
                      }
                      id v165 = v82;
                      id v80 = v170;
                    }
                    else
                    {
                      id v165 = 0;
                    }
                    uint64_t v83 = [v6 objectForKeyedSubscript:@"sourceBundleID"];
                    v162 = (void *)v83;
                    if (!v83 || (uint64_t v84 = (void *)v83, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v164 = 0;
                      goto LABEL_114;
                    }
                    int v106 = v82;
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v164 = v84;
                      id v80 = v170;
LABEL_114:
                      uint64_t v85 = [v6 objectForKeyedSubscript:@"sourceItemID"];
                      v160 = (void *)v85;
                      if (!v85 || (v86 = (void *)v85, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v163 = 0;
                        goto LABEL_117;
                      }
                      int v106 = v82;
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v163 = v86;
                        id v80 = v170;
LABEL_117:
                        uint64_t v87 = [v6 objectForKeyedSubscript:@"sourceGroupID"];
                        v159 = (void *)v87;
                        if (!v87 || (int v88 = (void *)v87, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          id v161 = 0;
                          goto LABEL_120;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v161 = v88;
                          id v80 = v170;
LABEL_120:
                          uint64_t v89 = [v6 objectForKeyedSubscript:@"calendarUserActivityDate"];
                          v157 = (void *)v89;
                          if (!v89 || (uint64_t v90 = (void *)v89, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v155 = 0;
LABEL_123:
                            uint64_t v91 = [v6 objectForKeyedSubscript:@"calendarUserActivityExternalID"];
                            v156 = (void *)v91;
                            if (v91 && (v92 = (void *)v91, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                              {
                                if (!a4)
                                {
                                  id v158 = 0;
                                  uint64_t v20 = 0;
                                  uint64_t v19 = v199;
                                  a4 = v195;
                                  id v80 = v170;
                                  uint64_t v96 = v155;
                                  goto LABEL_131;
                                }
                                id v139 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v140 = *MEMORY[0x1E4F502C8];
                                uint64_t v202 = *MEMORY[0x1E4F28568];
                                id v95 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"calendarUserActivityExternalID"];
                                id v203 = v95;
                                v154 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v203 forKeys:&v202 count:1];
                                id v141 = (id)objc_msgSend(v139, "initWithDomain:code:userInfo:", v140, 2);
                                id v158 = 0;
                                uint64_t v20 = 0;
                                *a4 = v141;
                                uint64_t v19 = v199;
                                a4 = v195;
                                goto LABEL_230;
                              }
                              id v158 = v92;
                              id v80 = v170;
                            }
                            else
                            {
                              id v158 = 0;
                            }
                            uint64_t v93 = [v6 objectForKeyedSubscript:@"calendarUserActivityEndDate"];
                            v154 = (void *)v93;
                            if (!v93 || (int v94 = (void *)v93, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              id v95 = 0;
                              uint64_t v19 = v199;
LABEL_129:
                              uint64_t v96 = v155;
                              a4 = v195;
                              uint64_t v20 = objc_retain(-[BMAppActivity initWithBundleID:activityType:beginningOfActivity:contentDescription:expirationDate:isEligibleForPrediction:isPubliclyIndexable:itemIdentifier:itemRelatedContentURL:itemRelatedUniqueIdentifier:shortcutAvailability:suggestedInvocationPhrase:title:userActivityRequiredString:userActivityUUID:sourceID:sourceBundleID:sourceItemID:sourceGroupID:calendarUserActivityDate:calendarUserActivityExternalID:calendarUserActivityEndDate:](v197, "initWithBundleID:activityType:beginningOfActivity:contentDescription:expirationDate:isEligibleForPrediction:isPubliclyIndexable:itemIdentifier:itemRelatedContentURL:itemRelatedUniqueIdentifier:shortcutAvailability:suggestedInvocationPhrase:title:userActivityRequiredString:userActivityUUID:sourceID:sourceBundleID:sourceItemID:sourceGroupID:calendarUserActivityDate:calendarUserActivityExternalID:calendarUserActivityEndDate:", v19, v198, v195, v196, v193, v190, v189, v185, v180, v175, v80,
                                        v177,
                                        v174,
                                        v172,
                                        v169,
                                        v165,
                                        v164,
                                        v163,
                                        v161,
                                        v155,
                                        v158,
                                        v95));
                              v197 = v20;
LABEL_130:

LABEL_131:
                              v17 = v198;
LABEL_132:

LABEL_133:
LABEL_134:

LABEL_135:
LABEL_136:

                              uint64_t v34 = v188;
                              id v44 = v175;
                              goto LABEL_137;
                            }
                            objc_opt_class();
                            uint64_t v19 = v199;
                            if (objc_opt_isKindOfClass())
                            {
                              id v129 = v94;
                              id v130 = objc_alloc(MEMORY[0x1E4F1C9C8]);
                              [v129 doubleValue];
                              id v95 = (id)objc_msgSend(v130, "initWithTimeIntervalSinceReferenceDate:");

                              goto LABEL_129;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v142 = objc_alloc_init(MEMORY[0x1E4F28D48]);
                              id v143 = v94;
                              id v95 = [v142 dateFromString:v143];

LABEL_223:
                              id v80 = v170;
                              goto LABEL_129;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v95 = v94;
                              goto LABEL_223;
                            }
                            if (a4)
                            {
                              id v147 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v148 = *MEMORY[0x1E4F502C8];
                              uint64_t v200 = *MEMORY[0x1E4F28568];
                              v149 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"calendarUserActivityEndDate"];
                              v201 = v149;
                              v150 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v201 forKeys:&v200 count:1];
                              uint64_t v151 = v148;
                              uint64_t v19 = v199;
                              *a4 = (id)[v147 initWithDomain:v151 code:2 userInfo:v150];
                            }
                            id v95 = 0;
                            uint64_t v20 = 0;
                            a4 = v195;
LABEL_230:
                            id v80 = v170;
                            uint64_t v96 = v155;
                            goto LABEL_130;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v122 = v90;
                            id v123 = objc_alloc(MEMORY[0x1E4F1C9C8]);
                            [v122 doubleValue];
                            id v155 = (id)objc_msgSend(v123, "initWithTimeIntervalSinceReferenceDate:");

                            goto LABEL_123;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v137 = objc_alloc_init(MEMORY[0x1E4F28D48]);
                            id v138 = v90;
                            id v155 = [v137 dateFromString:v138];

LABEL_218:
                            id v80 = v170;
                            goto LABEL_123;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v155 = v90;
                            goto LABEL_218;
                          }
                          if (a4)
                          {
                            id v144 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v145 = *MEMORY[0x1E4F502C8];
                            uint64_t v204 = *MEMORY[0x1E4F28568];
                            id v158 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"calendarUserActivityDate"];
                            id v205 = v158;
                            v156 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v205 forKeys:&v204 count:1];
                            id v146 = (id)objc_msgSend(v144, "initWithDomain:code:userInfo:", v145, 2);
                            uint64_t v96 = 0;
                            uint64_t v20 = 0;
                            *a4 = v146;
                            uint64_t v19 = v199;
                            a4 = v195;
                            id v80 = v170;
                            goto LABEL_131;
                          }
                          uint64_t v96 = 0;
                          uint64_t v20 = 0;
LABEL_201:
                          v17 = v198;
                          uint64_t v19 = v199;
                          a4 = v195;
                          id v80 = v170;
                          goto LABEL_132;
                        }
                        if (a4)
                        {
                          id v134 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v135 = *MEMORY[0x1E4F502C8];
                          uint64_t v206 = *MEMORY[0x1E4F28568];
                          uint64_t v96 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sourceGroupID"];
                          v207 = v96;
                          v157 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v207 forKeys:&v206 count:1];
                          id v136 = (id)objc_msgSend(v134, "initWithDomain:code:userInfo:", v135, 2);
                          id v161 = 0;
                          uint64_t v20 = 0;
                          *a4 = v136;
                          goto LABEL_201;
                        }
                        id v161 = 0;
                        uint64_t v20 = 0;
                        v17 = v198;
                        uint64_t v19 = v199;
                        a4 = v195;
LABEL_220:
                        id v80 = v170;
                        goto LABEL_133;
                      }
                      if (a4)
                      {
                        id v131 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v132 = *MEMORY[0x1E4F502C8];
                        uint64_t v208 = *MEMORY[0x1E4F28568];
                        id v161 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sourceItemID"];
                        id v209 = v161;
                        v159 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v209 forKeys:&v208 count:1];
                        id v133 = (id)objc_msgSend(v131, "initWithDomain:code:userInfo:", v132, 2);
                        id v163 = 0;
                        uint64_t v20 = 0;
                        *a4 = v133;
                        v17 = v198;
                        uint64_t v19 = v199;
                        a4 = v195;
                        goto LABEL_220;
                      }
                      id v163 = 0;
                      uint64_t v20 = 0;
LABEL_215:
                      v17 = v198;
                      uint64_t v19 = v199;
                      a4 = v195;
                      int v82 = v106;
                      id v80 = v170;
                      goto LABEL_134;
                    }
                    if (a4)
                    {
                      id v126 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v127 = *MEMORY[0x1E4F502C8];
                      uint64_t v210 = *MEMORY[0x1E4F28568];
                      id v163 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sourceBundleID"];
                      id v211 = v163;
                      v160 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v211 forKeys:&v210 count:1];
                      id v128 = (id)objc_msgSend(v126, "initWithDomain:code:userInfo:", v127, 2);
                      id v164 = 0;
                      uint64_t v20 = 0;
                      *a4 = v128;
                      goto LABEL_215;
                    }
                    id v164 = 0;
                    uint64_t v20 = 0;
                    v17 = v198;
                    uint64_t v19 = v199;
                    a4 = v195;
LABEL_213:
                    id v80 = v170;
                    goto LABEL_135;
                  }
                  v180 = 0;
                  v181 = v36;
                }
                else
                {
                  v180 = 0;
                  v181 = v36;
                }
                v8 = v35;
                uint64_t v7 = v187;
                goto LABEL_56;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v35 = v8;
                v36 = v9;
                v37 = v10;
                id v189 = v34;
                goto LABEL_44;
              }
              if (a4)
              {
                id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v66 = *MEMORY[0x1E4F502C8];
                uint64_t v232 = *MEMORY[0x1E4F28568];
                id v67 = [NSString alloc];
                uint64_t v152 = objc_opt_class();
                v68 = v67;
                uint64_t v34 = v188;
                id v185 = (id)[v68 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v152, @"isPubliclyIndexable"];
                id v233 = v185;
                v186 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v233 forKeys:&v232 count:1];
                id v69 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v66, 2);
                id v189 = 0;
                uint64_t v20 = 0;
                *a4 = v69;
                v17 = v198;
                uint64_t v19 = v199;
                a4 = v195;
LABEL_146:

LABEL_147:
LABEL_148:

                goto LABEL_149;
              }
              id v189 = 0;
              uint64_t v20 = 0;
LABEL_162:
              v17 = v198;
              uint64_t v19 = v199;
              a4 = v195;
              goto LABEL_147;
            }
            if (a4)
            {
              id v62 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v63 = *MEMORY[0x1E4F502C8];
              uint64_t v234 = *MEMORY[0x1E4F28568];
              id v189 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isEligibleForPrediction"];
              id v235 = v189;
              uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v235 forKeys:&v234 count:1];
              id v64 = (id)[v62 initWithDomain:v63 code:2 userInfo:v34];
              id v190 = 0;
              uint64_t v20 = 0;
              *a4 = v64;
              goto LABEL_162;
            }
            id v190 = 0;
            uint64_t v20 = 0;
LABEL_170:
            v17 = v198;
            uint64_t v19 = v199;
            a4 = v195;
            goto LABEL_148;
          }
          if (a4)
          {
            id v194 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v110 = *MEMORY[0x1E4F502C8];
            uint64_t v236 = *MEMORY[0x1E4F28568];
            id v190 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"expirationDate"];
            id v237 = v190;
            v191 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v237 forKeys:&v236 count:1];
            id v111 = (id)objc_msgSend(v194, "initWithDomain:code:userInfo:", v110, 2);
            id v193 = 0;
            uint64_t v20 = 0;
            *a4 = v111;
            goto LABEL_170;
          }
          id v193 = 0;
          uint64_t v20 = 0;
LABEL_34:
          v17 = v198;
          uint64_t v19 = v199;
          a4 = v195;
LABEL_149:

          goto LABEL_150;
        }
        if (a4)
        {
          id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v29 = *MEMORY[0x1E4F502C8];
          uint64_t v238 = *MEMORY[0x1E4F28568];
          id v193 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contentDescription"];
          id v239 = v193;
          v192 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v239 forKeys:&v238 count:1];
          id v30 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2);
          id v196 = 0;
          uint64_t v20 = 0;
          *a4 = v30;
          goto LABEL_34;
        }
        id v196 = 0;
        uint64_t v20 = 0;
        v17 = v198;
        uint64_t v19 = v199;
        a4 = v195;
LABEL_150:

        self = v197;
        goto LABEL_151;
      }
      if (a4)
      {
        id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v240 = *MEMORY[0x1E4F28568];
        id v196 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"beginningOfActivity"];
        id v241 = v196;
        id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v241 forKeys:&v240 count:1];
        id v27 = (id)[v25 initWithDomain:v26 code:2 userInfo:v10];
        uint64_t v20 = 0;
        *a4 = v27;
        a4 = 0;
        v17 = v198;
        uint64_t v19 = v199;
        goto LABEL_150;
      }
      uint64_t v20 = 0;
      v17 = v198;
      uint64_t v19 = v199;
LABEL_151:

      goto LABEL_152;
    }
    if (a4)
    {
      id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v22 = *MEMORY[0x1E4F502C8];
      uint64_t v242 = *MEMORY[0x1E4F28568];
      uint64_t v23 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"activityType"];
      v243 = v23;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v243 forKeys:&v242 count:1];
      id v24 = (id)[v21 initWithDomain:v22 code:2 userInfo:v9];
      v17 = 0;
      uint64_t v20 = 0;
      *a4 = v24;
      a4 = v23;
      uint64_t v19 = v199;
      goto LABEL_151;
    }
    v17 = 0;
    uint64_t v20 = 0;
    uint64_t v19 = v199;
LABEL_152:

    goto LABEL_153;
  }
  if (a4)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = *MEMORY[0x1E4F502C8];
    uint64_t v244 = *MEMORY[0x1E4F28568];
    v17 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleID"];
    v245[0] = v17;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v245 forKeys:&v244 count:1];
    id v18 = (id)[v15 initWithDomain:v16 code:2 userInfo:v8];
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    *a4 = v18;
    goto LABEL_152;
  }
  uint64_t v19 = 0;
  uint64_t v20 = 0;
LABEL_153:

  return v20;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMAppActivity *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_activityType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasBeginningOfActivity)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_contentDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasRaw_expirationDate)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasIsEligibleForPrediction)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsPubliclyIndexable)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_itemIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_raw_itemRelatedContentURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_itemRelatedUniqueIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasShortcutAvailability)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_suggestedInvocationPhrase)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_userActivityRequiredString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_userActivityUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sourceID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sourceBundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sourceItemID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sourceGroupID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasRaw_calendarUserActivityDate)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_calendarUserActivityExternalID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasRaw_calendarUserActivityEndDate)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)BMAppActivity;
  id v5 = [(BMEventBase *)&v63 init];
  if (!v5) {
    goto LABEL_103;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v17 = v11++ >= 9;
        if (v17)
        {
          unint64_t v12 = 0;
          int v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v18 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v18 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 88;
          goto LABEL_71;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 96;
          goto LABEL_71;
        case 3u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          v5->_hasBeginningOfActivity = 1;
          while (2)
          {
            uint64_t v25 = *v6;
            uint64_t v26 = *(void *)&v4[v25];
            unint64_t v27 = v26 + 1;
            if (v26 == -1 || v27 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
              *(void *)&v4[v25] = v27;
              v24 |= (unint64_t)(v28 & 0x7F) << v22;
              if (v28 < 0)
              {
                v22 += 7;
                BOOL v17 = v23++ >= 9;
                if (v17)
                {
                  uint64_t v24 = 0;
                  goto LABEL_80;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v24 = 0;
          }
LABEL_80:
          BOOL v58 = v24 != 0;
          uint64_t v59 = 72;
          goto LABEL_89;
        case 4u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 104;
          goto LABEL_71;
        case 5u:
          v5->_hasRaw_expirationDate = 1;
          uint64_t v29 = *v6;
          unint64_t v30 = *(void *)&v4[v29];
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)&v4[*v7])
          {
            id v31 = *(objc_class **)(*(void *)&v4[*v9] + v30);
            *(void *)&v4[v29] = v30 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v31 = 0;
          }
          uint64_t v60 = 24;
          goto LABEL_100;
        case 6u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          v5->_hasIsEligibleForPrediction = 1;
          while (2)
          {
            uint64_t v35 = *v6;
            uint64_t v36 = *(void *)&v4[v35];
            unint64_t v37 = v36 + 1;
            if (v36 == -1 || v37 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)&v4[*v9] + v36);
              *(void *)&v4[v35] = v37;
              v34 |= (unint64_t)(v38 & 0x7F) << v32;
              if (v38 < 0)
              {
                v32 += 7;
                BOOL v17 = v33++ >= 9;
                if (v17)
                {
                  uint64_t v34 = 0;
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v34 = 0;
          }
LABEL_84:
          BOOL v58 = v34 != 0;
          uint64_t v59 = 74;
          goto LABEL_89;
        case 7u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v41 = 0;
          v5->_hasIsPubliclyIndexable = 1;
          while (2)
          {
            uint64_t v42 = *v6;
            uint64_t v43 = *(void *)&v4[v42];
            unint64_t v44 = v43 + 1;
            if (v43 == -1 || v44 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v45 = *(unsigned char *)(*(void *)&v4[*v9] + v43);
              *(void *)&v4[v42] = v44;
              v41 |= (unint64_t)(v45 & 0x7F) << v39;
              if (v45 < 0)
              {
                v39 += 7;
                BOOL v17 = v40++ >= 9;
                if (v17)
                {
                  uint64_t v41 = 0;
                  goto LABEL_88;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v41 = 0;
          }
LABEL_88:
          BOOL v58 = v41 != 0;
          uint64_t v59 = 76;
LABEL_89:
          *((unsigned char *)&v5->super.super.isa + v59) = v58;
          continue;
        case 8u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 112;
          goto LABEL_71;
        case 9u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 32;
          goto LABEL_71;
        case 0xAu:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 120;
          goto LABEL_71;
        case 0xBu:
          char v46 = 0;
          unsigned int v47 = 0;
          uint64_t v48 = 0;
          v5->_hasShortcutAvailability = 1;
          break;
        case 0xCu:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 128;
          goto LABEL_71;
        case 0xDu:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 136;
          goto LABEL_71;
        case 0xEu:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 144;
          goto LABEL_71;
        case 0xFu:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 152;
          goto LABEL_71;
        case 0x10u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 160;
          goto LABEL_71;
        case 0x11u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 168;
          goto LABEL_71;
        case 0x12u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 176;
          goto LABEL_71;
        case 0x13u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 184;
          goto LABEL_71;
        case 0x14u:
          v5->_hasRaw_calendarUserActivityDate = 1;
          uint64_t v53 = *v6;
          unint64_t v54 = *(void *)&v4[v53];
          if (v54 <= 0xFFFFFFFFFFFFFFF7 && v54 + 8 <= *(void *)&v4[*v7])
          {
            id v31 = *(objc_class **)(*(void *)&v4[*v9] + v54);
            *(void *)&v4[v53] = v54 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v31 = 0;
          }
          uint64_t v60 = 48;
          goto LABEL_100;
        case 0x15u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 192;
LABEL_71:
          v55 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 0x16u:
          v5->_hasRaw_calendarUserActivityEndDate = 1;
          uint64_t v56 = *v6;
          unint64_t v57 = *(void *)&v4[v56];
          if (v57 <= 0xFFFFFFFFFFFFFFF7 && v57 + 8 <= *(void *)&v4[*v7])
          {
            id v31 = *(objc_class **)(*(void *)&v4[*v9] + v57);
            *(void *)&v4[v56] = v57 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v31 = 0;
          }
          uint64_t v60 = 64;
LABEL_100:
          *(Class *)((char *)&v5->super.super.isa + v60) = v31;
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_102;
          }
          continue;
      }
      while (1)
      {
        uint64_t v49 = *v6;
        uint64_t v50 = *(void *)&v4[v49];
        unint64_t v51 = v50 + 1;
        if (v50 == -1 || v51 > *(void *)&v4[*v7]) {
          break;
        }
        char v52 = *(unsigned char *)(*(void *)&v4[*v9] + v50);
        *(void *)&v4[v49] = v51;
        v48 |= (unint64_t)(v52 & 0x7F) << v46;
        if ((v52 & 0x80) == 0) {
          goto LABEL_91;
        }
        v46 += 7;
        BOOL v17 = v47++ >= 9;
        if (v17)
        {
          LODWORD(v48) = 0;
          goto LABEL_93;
        }
      }
      v4[*v8] = 1;
LABEL_91:
      if (v4[*v8]) {
        LODWORD(v48) = 0;
      }
LABEL_93:
      v5->_shortcutAvailability = v48;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_102:
  }
    uint64_t v61 = 0;
  else {
LABEL_103:
  }
    uint64_t v61 = v5;

  return v61;
}

- (NSString)description
{
  id v17 = [NSString alloc];
  uint64_t v25 = [(BMAppActivity *)self bundleID];
  unint64_t v27 = [(BMAppActivity *)self activityType];
  char v16 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppActivity beginningOfActivity](self, "beginningOfActivity"));
  uint64_t v26 = [(BMAppActivity *)self contentDescription];
  unint64_t v15 = [(BMAppActivity *)self expirationDate];
  uint64_t v24 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppActivity isEligibleForPrediction](self, "isEligibleForPrediction"));
  unsigned int v23 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppActivity isPubliclyIndexable](self, "isPubliclyIndexable"));
  char v22 = [(BMAppActivity *)self itemIdentifier];
  uint64_t v14 = [(BMAppActivity *)self itemRelatedContentURL];
  uint64_t v21 = [(BMAppActivity *)self itemRelatedUniqueIdentifier];
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAppActivity shortcutAvailability](self, "shortcutAvailability"));
  uint64_t v19 = [(BMAppActivity *)self suggestedInvocationPhrase];
  uint64_t v13 = [(BMAppActivity *)self title];
  unint64_t v12 = [(BMAppActivity *)self userActivityRequiredString];
  uint64_t v3 = [(BMAppActivity *)self userActivityUUID];
  unsigned int v11 = [(BMAppActivity *)self sourceID];
  id v4 = [(BMAppActivity *)self sourceBundleID];
  id v5 = [(BMAppActivity *)self sourceItemID];
  id v6 = [(BMAppActivity *)self sourceGroupID];
  uint64_t v7 = [(BMAppActivity *)self calendarUserActivityDate];
  v8 = [(BMAppActivity *)self calendarUserActivityExternalID];
  v9 = [(BMAppActivity *)self calendarUserActivityEndDate];
  int v18 = objc_msgSend(v17, "initWithFormat:", @"BMAppActivity with bundleID: %@, activityType: %@, beginningOfActivity: %@, contentDescription: %@, expirationDate: %@, isEligibleForPrediction: %@, isPubliclyIndexable: %@, itemIdentifier: %@, itemRelatedContentURL: %@, itemRelatedUniqueIdentifier: %@, shortcutAvailability: %@, suggestedInvocationPhrase: %@, title: %@, userActivityRequiredString: %@, userActivityUUID: %@, sourceID: %@, sourceBundleID: %@, sourceItemID: %@, sourceGroupID: %@, calendarUserActivityDate: %@, calendarUserActivityExternalID: %@, calendarUserActivityEndDate: %@", v25, v27, v16, v26, v15, v24, v23, v22, v14, v21, v20, v19, v13, v12, v3, v11,
                  v4,
                  v5,
                  v6,
                  v7,
                  v8,
                  v9);

  return (NSString *)v18;
}

- (BMAppActivity)initWithBundleID:(id)a3 activityType:(id)a4 beginningOfActivity:(id)a5 contentDescription:(id)a6 expirationDate:(id)a7 isEligibleForPrediction:(id)a8 isPubliclyIndexable:(id)a9 itemIdentifier:(id)a10 itemRelatedContentURL:(id)a11 itemRelatedUniqueIdentifier:(id)a12 shortcutAvailability:(id)a13 suggestedInvocationPhrase:(id)a14 title:(id)a15 userActivityRequiredString:(id)a16 userActivityUUID:(id)a17 sourceID:(id)a18 sourceBundleID:(id)a19 sourceItemID:(id)a20 sourceGroupID:(id)a21 calendarUserActivityDate:(id)a22 calendarUserActivityExternalID:(id)a23 calendarUserActivityEndDate:(id)a24
{
  id v62 = a3;
  id v47 = a4;
  id v61 = a4;
  id v28 = a5;
  id v48 = a6;
  id v60 = a6;
  id v64 = a7;
  id v29 = a8;
  id v30 = a9;
  id v59 = a10;
  id v31 = a11;
  id v57 = a12;
  id v63 = a13;
  id v56 = a14;
  id v55 = a15;
  id v54 = a16;
  id v53 = a17;
  id v52 = a18;
  id v51 = a19;
  id v32 = a20;
  id v50 = a21;
  unsigned int v33 = v30;
  id v34 = a22;
  id v35 = a23;
  uint64_t v36 = v31;
  id v37 = a24;
  v65.receiver = self;
  v65.super_class = (Class)BMAppActivity;
  char v38 = [(BMEventBase *)&v65 init];
  if (v38)
  {
    v38->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v38->_bundleID, a3);
    objc_storeStrong((id *)&v38->_activityType, v47);
    if (v28)
    {
      v38->_hasBeginningOfActivity = 1;
      v38->_beginningOfActivity = [v28 BOOLValue];
    }
    else
    {
      id v28 = 0;
      v38->_hasBeginningOfActivity = 0;
      v38->_beginningOfActivity = 0;
    }
    objc_storeStrong((id *)&v38->_contentDescription, v48);
    if (v64)
    {
      v38->_hasRaw_expirationDate = 1;
      [v64 timeIntervalSince1970];
    }
    else
    {
      v38->_hasRaw_expirationDate = 0;
      double v39 = -1.0;
    }
    v38->_raw_expirationDate = v39;
    if (v29)
    {
      v38->_hasIsEligibleForPrediction = 1;
      v38->_isEligibleForPrediction = [v29 BOOLValue];
    }
    else
    {
      v38->_hasIsEligibleForPrediction = 0;
      v38->_isEligibleForPrediction = 0;
    }
    if (v33)
    {
      v38->_hasIsPubliclyIndexable = 1;
      v38->_isPubliclyIndexable = [v33 BOOLValue];
    }
    else
    {
      v38->_hasIsPubliclyIndexable = 0;
      v38->_isPubliclyIndexable = 0;
    }
    objc_storeStrong((id *)&v38->_itemIdentifier, a10);
    if (v36)
    {
      uint64_t v40 = [v36 absoluteString];
      raw_itemRelatedContentURL = v38->_raw_itemRelatedContentURL;
      v38->_raw_itemRelatedContentURL = (NSString *)v40;
    }
    else
    {
      raw_itemRelatedContentURL = v38->_raw_itemRelatedContentURL;
      v38->_raw_itemRelatedContentURL = 0;
    }

    objc_storeStrong((id *)&v38->_itemRelatedUniqueIdentifier, a12);
    if (v63)
    {
      v38->_hasShortcutAvailability = 1;
      int v42 = [v63 intValue];
    }
    else
    {
      v38->_hasShortcutAvailability = 0;
      int v42 = -1;
    }
    v38->_shortcutAvailability = v42;
    objc_storeStrong((id *)&v38->_suggestedInvocationPhrase, a14);
    objc_storeStrong((id *)&v38->_title, a15);
    objc_storeStrong((id *)&v38->_userActivityRequiredString, a16);
    objc_storeStrong((id *)&v38->_userActivityUUID, a17);
    objc_storeStrong((id *)&v38->_sourceID, a18);
    objc_storeStrong((id *)&v38->_sourceBundleID, a19);
    objc_storeStrong((id *)&v38->_sourceItemID, a20);
    objc_storeStrong((id *)&v38->_sourceGroupID, a21);
    if (v34)
    {
      v38->_hasRaw_calendarUserActivityDate = 1;
      [v34 timeIntervalSinceReferenceDate];
    }
    else
    {
      v38->_hasRaw_calendarUserActivityDate = 0;
      double v43 = -1.0;
    }
    v38->_raw_calendarUserActivityDate = v43;
    objc_storeStrong((id *)&v38->_calendarUserActivityExternalID, a23);
    if (v37)
    {
      v38->_hasRaw_calendarUserActivityEndDate = 1;
      [v37 timeIntervalSinceReferenceDate];
    }
    else
    {
      v38->_hasRaw_calendarUserActivityEndDate = 0;
      double v44 = -1.0;
    }
    v38->_raw_calendarUserActivityEndDate = v44;
  }

  return v38;
}

+ (id)protoFields
{
  v26[22] = *MEMORY[0x1E4F143B8];
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleID" number:1 type:13 subMessageClass:0];
  v26[0] = v25;
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activityType" number:2 type:13 subMessageClass:0];
  v26[1] = v24;
  unsigned int v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"beginningOfActivity" number:3 type:12 subMessageClass:0];
  v26[2] = v23;
  char v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentDescription" number:4 type:13 subMessageClass:0];
  v26[3] = v22;
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"expirationDate" number:5 type:0 subMessageClass:0];
  v26[4] = v21;
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isEligibleForPrediction" number:6 type:12 subMessageClass:0];
  v26[5] = v20;
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isPubliclyIndexable" number:7 type:12 subMessageClass:0];
  v26[6] = v19;
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"itemIdentifier" number:8 type:13 subMessageClass:0];
  v26[7] = v18;
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"itemRelatedContentURL" number:9 type:13 subMessageClass:0];
  v26[8] = v17;
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"itemRelatedUniqueIdentifier" number:10 type:13 subMessageClass:0];
  v26[9] = v16;
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shortcutAvailability" number:11 type:2 subMessageClass:0];
  v26[10] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"suggestedInvocationPhrase" number:12 type:13 subMessageClass:0];
  v26[11] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"title" number:13 type:13 subMessageClass:0];
  v26[12] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userActivityRequiredString" number:14 type:13 subMessageClass:0];
  v26[13] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userActivityUUID" number:15 type:13 subMessageClass:0];
  v26[14] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sourceID" number:16 type:13 subMessageClass:0];
  v26[15] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sourceBundleID" number:17 type:13 subMessageClass:0];
  v26[16] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sourceItemID" number:18 type:13 subMessageClass:0];
  v26[17] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sourceGroupID" number:19 type:13 subMessageClass:0];
  v26[18] = v7;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"calendarUserActivityDate" number:20 type:0 subMessageClass:0];
  v26[19] = v8;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"calendarUserActivityExternalID" number:21 type:13 subMessageClass:0];
  v26[20] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"calendarUserActivityEndDate" number:22 type:0 subMessageClass:0];
  v26[21] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:22];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3450;
}

+ (id)columns
{
  v26[22] = *MEMORY[0x1E4F143B8];
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"activityType" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  unsigned int v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"beginningOfActivity" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentDescription" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  char v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"expirationDate" dataType:3 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:2];
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isEligibleForPrediction" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isPubliclyIndexable" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"itemIdentifier" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"itemRelatedContentURL" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:4];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"itemRelatedUniqueIdentifier" dataType:2 requestOnly:0 fieldNumber:10 protoDataType:13 convertedType:0];
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shortcutAvailability" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:2 convertedType:0];
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"suggestedInvocationPhrase" dataType:2 requestOnly:0 fieldNumber:12 protoDataType:13 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"title" dataType:2 requestOnly:0 fieldNumber:13 protoDataType:13 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userActivityRequiredString" dataType:2 requestOnly:0 fieldNumber:14 protoDataType:13 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userActivityUUID" dataType:2 requestOnly:0 fieldNumber:15 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sourceID" dataType:2 requestOnly:0 fieldNumber:16 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sourceBundleID" dataType:2 requestOnly:0 fieldNumber:17 protoDataType:13 convertedType:0];
  unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sourceItemID" dataType:2 requestOnly:0 fieldNumber:18 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sourceGroupID" dataType:2 requestOnly:0 fieldNumber:19 protoDataType:13 convertedType:0];
  unsigned int v11 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"calendarUserActivityDate" dataType:3 requestOnly:0 fieldNumber:20 protoDataType:0 convertedType:1];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"calendarUserActivityExternalID" dataType:2 requestOnly:0 fieldNumber:21 protoDataType:13 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"calendarUserActivityEndDate" dataType:3 requestOnly:0 fieldNumber:22 protoDataType:0 convertedType:1];
  v26[0] = v25;
  v26[1] = v24;
  v26[2] = v23;
  v26[3] = v13;
  v26[4] = v22;
  v26[5] = v21;
  v26[6] = v20;
  v26[7] = v19;
  v26[8] = v18;
  v26[9] = v17;
  v26[10] = v16;
  v26[11] = v15;
  v26[12] = v2;
  v26[13] = v3;
  v26[14] = v14;
  v26[15] = v4;
  v26[16] = v5;
  v26[17] = v12;
  v26[18] = v6;
  v26[19] = v11;
  v26[20] = v7;
  v26[21] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:22];

  return v10;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    v8 = [[BMAppActivity alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[20] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end