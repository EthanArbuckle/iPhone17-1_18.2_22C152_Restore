@interface BMShareSheetFeedback
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMShareSheetFeedback)initWithDerivedIntentIdentifier:(id)a3 targetBundleID:(id)a4 extensionContextUUID:(id)a5 attachments:(id)a6 locationUUIDs:(id)a7 photoSuggestedContacts:(id)a8 modelSuggestionProxies:(id)a9 adaptedModelRecipeID:(id)a10 isAdaptedModelUsed:(id)a11 isAdaptedModelCreated:(id)a12 supportedBundleIDs:(id)a13 peopleSuggestionsDisabled:(id)a14 reasonType:(id)a15 reason:(id)a16 sourceBundleID:(id)a17 transportBundleID:(id)a18 numberOfVisibleSuggestions:(id)a19 trackingID:(id)a20 iCloudFamilyInvocation:(id)a21 engagementType:(int)a22 indexSelected:(id)a23;
- (BMShareSheetFeedback)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasICloudFamilyInvocation;
- (BOOL)hasIndexSelected;
- (BOOL)hasIsAdaptedModelCreated;
- (BOOL)hasIsAdaptedModelUsed;
- (BOOL)hasNumberOfVisibleSuggestions;
- (BOOL)hasPeopleSuggestionsDisabled;
- (BOOL)iCloudFamilyInvocation;
- (BOOL)isAdaptedModelCreated;
- (BOOL)isAdaptedModelUsed;
- (BOOL)isEqual:(id)a3;
- (NSArray)locationUUIDs;
- (NSArray)photoSuggestedContacts;
- (NSData)attachments;
- (NSData)modelSuggestionProxies;
- (NSString)adaptedModelRecipeID;
- (NSString)derivedIntentIdentifier;
- (NSString)description;
- (NSString)extensionContextUUID;
- (NSString)reason;
- (NSString)reasonType;
- (NSString)sourceBundleID;
- (NSString)supportedBundleIDs;
- (NSString)targetBundleID;
- (NSString)trackingID;
- (NSString)transportBundleID;
- (double)numberOfVisibleSuggestions;
- (id)_locationUUIDsJSONArray;
- (id)_photoSuggestedContactsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)engagementType;
- (int)indexSelected;
- (int)peopleSuggestionsDisabled;
- (unsigned)dataVersion;
- (void)setHasICloudFamilyInvocation:(BOOL)a3;
- (void)setHasIndexSelected:(BOOL)a3;
- (void)setHasIsAdaptedModelCreated:(BOOL)a3;
- (void)setHasIsAdaptedModelUsed:(BOOL)a3;
- (void)setHasNumberOfVisibleSuggestions:(BOOL)a3;
- (void)setHasPeopleSuggestionsDisabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMShareSheetFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingID, 0);
  objc_storeStrong((id *)&self->_transportBundleID, 0);
  objc_storeStrong((id *)&self->_sourceBundleID, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_reasonType, 0);
  objc_storeStrong((id *)&self->_supportedBundleIDs, 0);
  objc_storeStrong((id *)&self->_adaptedModelRecipeID, 0);
  objc_storeStrong((id *)&self->_modelSuggestionProxies, 0);
  objc_storeStrong((id *)&self->_photoSuggestedContacts, 0);
  objc_storeStrong((id *)&self->_locationUUIDs, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_extensionContextUUID, 0);
  objc_storeStrong((id *)&self->_targetBundleID, 0);

  objc_storeStrong((id *)&self->_derivedIntentIdentifier, 0);
}

- (void)setHasIndexSelected:(BOOL)a3
{
  self->_hasIndexSelected = a3;
}

- (BOOL)hasIndexSelected
{
  return self->_hasIndexSelected;
}

- (int)indexSelected
{
  return self->_indexSelected;
}

- (int)engagementType
{
  return self->_engagementType;
}

- (void)setHasICloudFamilyInvocation:(BOOL)a3
{
  self->_hasICloudFamilyInvocation = a3;
}

- (BOOL)hasICloudFamilyInvocation
{
  return self->_hasICloudFamilyInvocation;
}

- (BOOL)iCloudFamilyInvocation
{
  return self->_iCloudFamilyInvocation;
}

- (NSString)trackingID
{
  return self->_trackingID;
}

- (void)setHasNumberOfVisibleSuggestions:(BOOL)a3
{
  self->_hasNumberOfVisibleSuggestions = a3;
}

- (BOOL)hasNumberOfVisibleSuggestions
{
  return self->_hasNumberOfVisibleSuggestions;
}

- (double)numberOfVisibleSuggestions
{
  return self->_numberOfVisibleSuggestions;
}

- (NSString)transportBundleID
{
  return self->_transportBundleID;
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)reasonType
{
  return self->_reasonType;
}

- (void)setHasPeopleSuggestionsDisabled:(BOOL)a3
{
  self->_hasPeopleSuggestionsDisabled = a3;
}

- (BOOL)hasPeopleSuggestionsDisabled
{
  return self->_hasPeopleSuggestionsDisabled;
}

- (int)peopleSuggestionsDisabled
{
  return self->_peopleSuggestionsDisabled;
}

- (NSString)supportedBundleIDs
{
  return self->_supportedBundleIDs;
}

- (void)setHasIsAdaptedModelCreated:(BOOL)a3
{
  self->_hasIsAdaptedModelCreated = a3;
}

- (BOOL)hasIsAdaptedModelCreated
{
  return self->_hasIsAdaptedModelCreated;
}

- (BOOL)isAdaptedModelCreated
{
  return self->_isAdaptedModelCreated;
}

- (void)setHasIsAdaptedModelUsed:(BOOL)a3
{
  self->_hasIsAdaptedModelUsed = a3;
}

- (BOOL)hasIsAdaptedModelUsed
{
  return self->_hasIsAdaptedModelUsed;
}

- (BOOL)isAdaptedModelUsed
{
  return self->_isAdaptedModelUsed;
}

- (NSString)adaptedModelRecipeID
{
  return self->_adaptedModelRecipeID;
}

- (NSData)modelSuggestionProxies
{
  return self->_modelSuggestionProxies;
}

- (NSArray)photoSuggestedContacts
{
  return self->_photoSuggestedContacts;
}

- (NSArray)locationUUIDs
{
  return self->_locationUUIDs;
}

- (NSData)attachments
{
  return self->_attachments;
}

- (NSString)extensionContextUUID
{
  return self->_extensionContextUUID;
}

- (NSString)targetBundleID
{
  return self->_targetBundleID;
}

- (NSString)derivedIntentIdentifier
{
  return self->_derivedIntentIdentifier;
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
    v6 = [(BMShareSheetFeedback *)self derivedIntentIdentifier];
    uint64_t v7 = [v5 derivedIntentIdentifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMShareSheetFeedback *)self derivedIntentIdentifier];
      v10 = [v5 derivedIntentIdentifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_90;
      }
    }
    v13 = [(BMShareSheetFeedback *)self targetBundleID];
    uint64_t v14 = [v5 targetBundleID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMShareSheetFeedback *)self targetBundleID];
      v17 = [v5 targetBundleID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_90;
      }
    }
    v19 = [(BMShareSheetFeedback *)self extensionContextUUID];
    uint64_t v20 = [v5 extensionContextUUID];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMShareSheetFeedback *)self extensionContextUUID];
      v23 = [v5 extensionContextUUID];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_90;
      }
    }
    v25 = [(BMShareSheetFeedback *)self attachments];
    uint64_t v26 = [v5 attachments];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMShareSheetFeedback *)self attachments];
      v29 = [v5 attachments];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_90;
      }
    }
    v31 = [(BMShareSheetFeedback *)self locationUUIDs];
    uint64_t v32 = [v5 locationUUIDs];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMShareSheetFeedback *)self locationUUIDs];
      v35 = [v5 locationUUIDs];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_90;
      }
    }
    v37 = [(BMShareSheetFeedback *)self photoSuggestedContacts];
    uint64_t v38 = [v5 photoSuggestedContacts];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMShareSheetFeedback *)self photoSuggestedContacts];
      v41 = [v5 photoSuggestedContacts];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_90;
      }
    }
    v43 = [(BMShareSheetFeedback *)self modelSuggestionProxies];
    uint64_t v44 = [v5 modelSuggestionProxies];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(BMShareSheetFeedback *)self modelSuggestionProxies];
      v47 = [v5 modelSuggestionProxies];
      int v48 = [v46 isEqual:v47];

      if (!v48) {
        goto LABEL_90;
      }
    }
    v49 = [(BMShareSheetFeedback *)self adaptedModelRecipeID];
    uint64_t v50 = [v5 adaptedModelRecipeID];
    if (v49 == (void *)v50)
    {
    }
    else
    {
      v51 = (void *)v50;
      v52 = [(BMShareSheetFeedback *)self adaptedModelRecipeID];
      v53 = [v5 adaptedModelRecipeID];
      int v54 = [v52 isEqual:v53];

      if (!v54) {
        goto LABEL_90;
      }
    }
    if ([(BMShareSheetFeedback *)self hasIsAdaptedModelUsed]
      || [v5 hasIsAdaptedModelUsed])
    {
      if (![(BMShareSheetFeedback *)self hasIsAdaptedModelUsed]) {
        goto LABEL_90;
      }
      if (![v5 hasIsAdaptedModelUsed]) {
        goto LABEL_90;
      }
      int v55 = [(BMShareSheetFeedback *)self isAdaptedModelUsed];
      if (v55 != [v5 isAdaptedModelUsed]) {
        goto LABEL_90;
      }
    }
    if ([(BMShareSheetFeedback *)self hasIsAdaptedModelCreated]
      || [v5 hasIsAdaptedModelCreated])
    {
      if (![(BMShareSheetFeedback *)self hasIsAdaptedModelCreated]) {
        goto LABEL_90;
      }
      if (![v5 hasIsAdaptedModelCreated]) {
        goto LABEL_90;
      }
      int v56 = [(BMShareSheetFeedback *)self isAdaptedModelCreated];
      if (v56 != [v5 isAdaptedModelCreated]) {
        goto LABEL_90;
      }
    }
    v57 = [(BMShareSheetFeedback *)self supportedBundleIDs];
    uint64_t v58 = [v5 supportedBundleIDs];
    if (v57 == (void *)v58)
    {
    }
    else
    {
      v59 = (void *)v58;
      v60 = [(BMShareSheetFeedback *)self supportedBundleIDs];
      v61 = [v5 supportedBundleIDs];
      int v62 = [v60 isEqual:v61];

      if (!v62) {
        goto LABEL_90;
      }
    }
    if ([(BMShareSheetFeedback *)self hasPeopleSuggestionsDisabled]
      || [v5 hasPeopleSuggestionsDisabled])
    {
      if (![(BMShareSheetFeedback *)self hasPeopleSuggestionsDisabled]) {
        goto LABEL_90;
      }
      if (![v5 hasPeopleSuggestionsDisabled]) {
        goto LABEL_90;
      }
      int v63 = [(BMShareSheetFeedback *)self peopleSuggestionsDisabled];
      if (v63 != [v5 peopleSuggestionsDisabled]) {
        goto LABEL_90;
      }
    }
    v64 = [(BMShareSheetFeedback *)self reasonType];
    uint64_t v65 = [v5 reasonType];
    if (v64 == (void *)v65)
    {
    }
    else
    {
      v66 = (void *)v65;
      v67 = [(BMShareSheetFeedback *)self reasonType];
      v68 = [v5 reasonType];
      int v69 = [v67 isEqual:v68];

      if (!v69) {
        goto LABEL_90;
      }
    }
    v70 = [(BMShareSheetFeedback *)self reason];
    uint64_t v71 = [v5 reason];
    if (v70 == (void *)v71)
    {
    }
    else
    {
      v72 = (void *)v71;
      v73 = [(BMShareSheetFeedback *)self reason];
      v74 = [v5 reason];
      int v75 = [v73 isEqual:v74];

      if (!v75) {
        goto LABEL_90;
      }
    }
    v76 = [(BMShareSheetFeedback *)self sourceBundleID];
    uint64_t v77 = [v5 sourceBundleID];
    if (v76 == (void *)v77)
    {
    }
    else
    {
      v78 = (void *)v77;
      v79 = [(BMShareSheetFeedback *)self sourceBundleID];
      v80 = [v5 sourceBundleID];
      int v81 = [v79 isEqual:v80];

      if (!v81) {
        goto LABEL_90;
      }
    }
    v82 = [(BMShareSheetFeedback *)self transportBundleID];
    uint64_t v83 = [v5 transportBundleID];
    if (v82 == (void *)v83)
    {
    }
    else
    {
      v84 = (void *)v83;
      v85 = [(BMShareSheetFeedback *)self transportBundleID];
      v86 = [v5 transportBundleID];
      int v87 = [v85 isEqual:v86];

      if (!v87) {
        goto LABEL_90;
      }
    }
    if ([(BMShareSheetFeedback *)self hasNumberOfVisibleSuggestions]
      || [v5 hasNumberOfVisibleSuggestions])
    {
      if (![(BMShareSheetFeedback *)self hasNumberOfVisibleSuggestions]) {
        goto LABEL_90;
      }
      if (![v5 hasNumberOfVisibleSuggestions]) {
        goto LABEL_90;
      }
      [(BMShareSheetFeedback *)self numberOfVisibleSuggestions];
      double v89 = v88;
      [v5 numberOfVisibleSuggestions];
      if (v89 != v90) {
        goto LABEL_90;
      }
    }
    v91 = [(BMShareSheetFeedback *)self trackingID];
    uint64_t v92 = [v5 trackingID];
    if (v91 == (void *)v92)
    {
    }
    else
    {
      v93 = (void *)v92;
      v94 = [(BMShareSheetFeedback *)self trackingID];
      v95 = [v5 trackingID];
      int v96 = [v94 isEqual:v95];

      if (!v96) {
        goto LABEL_90;
      }
    }
    if (![(BMShareSheetFeedback *)self hasICloudFamilyInvocation]
      && ![v5 hasICloudFamilyInvocation]
      || [(BMShareSheetFeedback *)self hasICloudFamilyInvocation]
      && [v5 hasICloudFamilyInvocation]
      && (int v97 = [(BMShareSheetFeedback *)self iCloudFamilyInvocation],
          v97 == [v5 iCloudFamilyInvocation]))
    {
      int v98 = [(BMShareSheetFeedback *)self engagementType];
      if (v98 == [v5 engagementType])
      {
        if (![(BMShareSheetFeedback *)self hasIndexSelected]
          && ![v5 hasIndexSelected])
        {
          BOOL v12 = 1;
          goto LABEL_91;
        }
        if ([(BMShareSheetFeedback *)self hasIndexSelected]
          && [v5 hasIndexSelected])
        {
          int v99 = [(BMShareSheetFeedback *)self indexSelected];
          BOOL v12 = v99 == [v5 indexSelected];
LABEL_91:

          goto LABEL_92;
        }
      }
    }
LABEL_90:
    BOOL v12 = 0;
    goto LABEL_91;
  }
  BOOL v12 = 0;
LABEL_92:

  return v12;
}

- (id)jsonDictionary
{
  v75[21] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMShareSheetFeedback *)self derivedIntentIdentifier];
  uint64_t v4 = [(BMShareSheetFeedback *)self targetBundleID];
  uint64_t v5 = [(BMShareSheetFeedback *)self extensionContextUUID];
  v6 = [(BMShareSheetFeedback *)self attachments];
  uint64_t v7 = [v6 base64EncodedStringWithOptions:0];

  uint64_t v8 = [(BMShareSheetFeedback *)self _locationUUIDsJSONArray];
  uint64_t v9 = [(BMShareSheetFeedback *)self _photoSuggestedContactsJSONArray];
  v10 = [(BMShareSheetFeedback *)self modelSuggestionProxies];
  uint64_t v11 = [v10 base64EncodedStringWithOptions:0];

  v72 = [(BMShareSheetFeedback *)self adaptedModelRecipeID];
  id v73 = 0;
  if ([(BMShareSheetFeedback *)self hasIsAdaptedModelUsed])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMShareSheetFeedback isAdaptedModelUsed](self, "isAdaptedModelUsed"));
    id v73 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMShareSheetFeedback *)self hasIsAdaptedModelCreated])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMShareSheetFeedback isAdaptedModelCreated](self, "isAdaptedModelCreated"));
    id v71 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v71 = 0;
  }
  v70 = [(BMShareSheetFeedback *)self supportedBundleIDs];
  if ([(BMShareSheetFeedback *)self hasPeopleSuggestionsDisabled])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMShareSheetFeedback peopleSuggestionsDisabled](self, "peopleSuggestionsDisabled"));
    id v69 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v69 = 0;
  }
  v68 = [(BMShareSheetFeedback *)self reasonType];
  v67 = [(BMShareSheetFeedback *)self reason];
  v66 = [(BMShareSheetFeedback *)self sourceBundleID];
  uint64_t v65 = [(BMShareSheetFeedback *)self transportBundleID];
  if (![(BMShareSheetFeedback *)self hasNumberOfVisibleSuggestions]
    || ([(BMShareSheetFeedback *)self numberOfVisibleSuggestions], fabs(v12) == INFINITY))
  {
    id v64 = 0;
  }
  else
  {
    [(BMShareSheetFeedback *)self numberOfVisibleSuggestions];
    v13 = NSNumber;
    [(BMShareSheetFeedback *)self numberOfVisibleSuggestions];
    objc_msgSend(v13, "numberWithDouble:");
    id v64 = (id)objc_claimAutoreleasedReturnValue();
  }
  int v63 = [(BMShareSheetFeedback *)self trackingID];
  if ([(BMShareSheetFeedback *)self hasICloudFamilyInvocation])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMShareSheetFeedback iCloudFamilyInvocation](self, "iCloudFamilyInvocation"));
    id v62 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v62 = 0;
  }
  v61 = objc_msgSend(NSNumber, "numberWithInt:", -[BMShareSheetFeedback engagementType](self, "engagementType"));
  if ([(BMShareSheetFeedback *)self hasIndexSelected])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMShareSheetFeedback indexSelected](self, "indexSelected"));
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = 0;
  }
  v74[0] = @"derivedIntentIdentifier";
  uint64_t v15 = v3;
  if (!v3)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v51 = (void *)v15;
  v75[0] = v15;
  v74[1] = @"targetBundleID";
  uint64_t v16 = v4;
  if (!v4)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v50 = (void *)v16;
  v75[1] = v16;
  v74[2] = @"extensionContextUUID";
  uint64_t v17 = v5;
  if (!v5)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v49 = (void *)v17;
  v75[2] = v17;
  v74[3] = @"attachments";
  uint64_t v18 = v7;
  if (!v7)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  int v48 = (void *)v18;
  v75[3] = v18;
  v74[4] = @"locationUUIDs";
  uint64_t v19 = v8;
  if (!v8)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v47 = (void *)v19;
  v75[4] = v19;
  v74[5] = @"photoSuggestedContacts";
  uint64_t v20 = v9;
  if (!v9)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v46 = (void *)v20;
  v75[5] = v20;
  v74[6] = @"modelSuggestionProxies";
  uint64_t v21 = v11;
  if (!v11)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v45 = (void *)v21;
  v75[6] = v21;
  v74[7] = @"adaptedModelRecipeID";
  uint64_t v22 = (uint64_t)v72;
  if (!v72)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v75[7] = v22;
  v74[8] = @"isAdaptedModelUsed";
  uint64_t v23 = (uint64_t)v73;
  if (!v73)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v75[8] = v23;
  v74[9] = @"isAdaptedModelCreated";
  uint64_t v24 = (uint64_t)v71;
  if (!v71)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  int v55 = (void *)v24;
  v75[9] = v24;
  v74[10] = @"supportedBundleIDs";
  uint64_t v25 = (uint64_t)v70;
  if (!v70)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v60 = (void *)v4;
  v75[10] = v25;
  v74[11] = @"peopleSuggestionsDisabled";
  uint64_t v26 = (uint64_t)v69;
  v27 = (void *)v25;
  if (!v69)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  int v56 = (void *)v9;
  int v54 = (void *)v26;
  v75[11] = v26;
  v74[12] = @"reasonType";
  uint64_t v28 = (uint64_t)v68;
  if (!v68)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v58 = (void *)v7;
  v75[12] = v28;
  v74[13] = @"reason";
  uint64_t v29 = (uint64_t)v67;
  if (!v67)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v57 = (void *)v8;
  uint64_t v40 = v29;
  v75[13] = v29;
  v74[14] = @"sourceBundleID";
  int v30 = v66;
  if (!v66)
  {
    int v30 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v29);
  }
  v43 = (void *)v23;
  v59 = (void *)v3;
  v75[14] = v30;
  v74[15] = @"transportBundleID";
  v31 = v65;
  if (!v65)
  {
    v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v53 = (void *)v5;
  v75[15] = v31;
  v74[16] = @"numberOfVisibleSuggestions";
  uint64_t v32 = v64;
  if (!v64)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  int v42 = v27;
  uint64_t v44 = (void *)v22;
  v75[16] = v32;
  v74[17] = @"trackingID";
  v33 = v63;
  if (!v63)
  {
    v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = (void *)v11;
  v75[17] = v33;
  v74[18] = @"iCloudFamilyInvocation";
  v35 = v62;
  if (!v62)
  {
    v35 = [MEMORY[0x1E4F1CA98] null];
  }
  int v36 = (void *)v28;
  v75[18] = v35;
  v74[19] = @"engagementType";
  v37 = v61;
  if (!v61)
  {
    v37 = [MEMORY[0x1E4F1CA98] null];
  }
  v75[19] = v37;
  v74[20] = @"indexSelected";
  uint64_t v38 = v14;
  if (!v14)
  {
    uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
  }
  v75[20] = v38;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v75, v74, 21, v40);
  id v52 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14) {

  }
  if (!v61) {
  if (!v62)
  }

  if (!v63) {
  if (!v64)
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
  if (!v73)
  }

  if (v72)
  {
    if (v34) {
      goto LABEL_89;
    }
  }
  else
  {

    if (v34)
    {
LABEL_89:
      if (v56) {
        goto LABEL_90;
      }
      goto LABEL_100;
    }
  }

  if (v56)
  {
LABEL_90:
    if (v57) {
      goto LABEL_91;
    }
    goto LABEL_101;
  }
LABEL_100:

  if (v57)
  {
LABEL_91:
    if (v58) {
      goto LABEL_92;
    }
    goto LABEL_102;
  }
LABEL_101:

  if (v58)
  {
LABEL_92:
    if (v53) {
      goto LABEL_93;
    }
    goto LABEL_103;
  }
LABEL_102:

  if (v53)
  {
LABEL_93:
    if (v60) {
      goto LABEL_94;
    }
LABEL_104:

    if (v59) {
      goto LABEL_95;
    }
    goto LABEL_105;
  }
LABEL_103:

  if (!v60) {
    goto LABEL_104;
  }
LABEL_94:
  if (v59) {
    goto LABEL_95;
  }
LABEL_105:

LABEL_95:

  return v52;
}

- (id)_photoSuggestedContactsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMShareSheetFeedback *)self photoSuggestedContacts];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) base64EncodedStringWithOptions:0];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_locationUUIDsJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMShareSheetFeedback *)self locationUUIDs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMShareSheetFeedback)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v380[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"derivedIntentIdentifier"];
  v317 = (void *)v7;
  if (!v7 || (uint64_t v8 = (void *)v7, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
LABEL_4:
    long long v10 = [v6 objectForKeyedSubscript:@"targetBundleID"];
    if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v318 = 0;
      goto LABEL_7;
    }
    uint64_t v18 = v10;
    uint64_t v19 = self;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v318 = v18;
      long long v10 = v18;
LABEL_7:
      long long v11 = [v6 objectForKeyedSubscript:@"extensionContextUUID"];
      v312 = self;
      if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v311 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v311 = v11;
LABEL_10:
        long long v12 = [v6 objectForKeyedSubscript:@"attachments"];
        v309 = v11;
        v313 = v6;
        if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          long long v13 = v12;
          id v14 = 0;
LABEL_13:
          id v15 = [v6 objectForKeyedSubscript:@"locationUUIDs"];
          uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
          int v17 = [v15 isEqual:v16];

          if (v17)
          {
            id v304 = v9;

            id v15 = 0;
LABEL_33:
            uint64_t v20 = v318;
            long long v12 = v13;
LABEL_34:
            v35 = a4;
            v320 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
            long long v325 = 0u;
            long long v326 = 0u;
            long long v327 = 0u;
            long long v328 = 0u;
            id v15 = v15;
            uint64_t v36 = [v15 countByEnumeratingWithState:&v325 objects:v370 count:16];
            v318 = v20;
            v310 = a4;
            id v37 = v14;
            if (!v36)
            {
LABEL_43:

              uint64_t v44 = [v313 objectForKeyedSubscript:@"photoSuggestedContacts"];
              v45 = [MEMORY[0x1E4F1CA98] null];
              int v46 = [v44 isEqual:v45];

              if (v46)
              {

                uint64_t v44 = 0;
              }
              else if (v44)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  id obj = v44;
                  if (v35)
                  {
                    id v88 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v89 = *MEMORY[0x1E4F502C8];
                    uint64_t v364 = *MEMORY[0x1E4F28568];
                    v316 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"photoSuggestedContacts"];
                    v365 = v316;
                    uint64_t v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v365 forKeys:&v364 count:1];
                    v91 = v88;
                    id v49 = (id)v90;
                    id v92 = (id)[v91 initWithDomain:v89 code:2 userInfo:v90];
                    uint64_t v25 = 0;
                    id *v35 = v92;
                    id v9 = v304;
                    int v30 = v311;
                    goto LABEL_211;
                  }
                  uint64_t v25 = 0;
                  id v9 = v304;
                  int v30 = v311;
                  id v14 = v37;
                  goto LABEL_213;
                }
              }
              v316 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v44, "count"));
              long long v321 = 0u;
              long long v322 = 0u;
              long long v323 = 0u;
              long long v324 = 0u;
              id obj = v44;
              uint64_t v66 = [obj countByEnumeratingWithState:&v321 objects:v363 count:16];
              if (!v66) {
                goto LABEL_64;
              }
              uint64_t v67 = v66;
              uint64_t v68 = *(void *)v322;
              id v302 = v15;
LABEL_57:
              id v69 = v37;
              v70 = v10;
              uint64_t v71 = 0;
              while (1)
              {
                if (*(void *)v322 != v68) {
                  objc_enumerationMutation(obj);
                }
                v72 = *(void **)(*((void *)&v321 + 1) + 8 * v71);
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  break;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (v310)
                  {
                    id v86 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v87 = *MEMORY[0x1E4F502C8];
                    uint64_t v359 = *MEMORY[0x1E4F28568];
                    v74 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", objc_opt_class(), @"photoSuggestedContacts"];
                    v360 = v74;
                    id v301 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v360 forKeys:&v359 count:1];
                    v84 = objc_msgSend(v86, "initWithDomain:code:userInfo:", v87, 2);
                    v85 = v304;
                    long long v10 = v70;
                    int v81 = v310;
                    int v30 = v311;
                    goto LABEL_75;
                  }
                  goto LABEL_79;
                }
                id v73 = v72;
                [v316 addObject:v73];

                if (v67 == ++v71)
                {
                  uint64_t v67 = [obj countByEnumeratingWithState:&v321 objects:v363 count:16];
                  long long v10 = v70;
                  id v37 = v69;
                  id v15 = v302;
                  v35 = v310;
                  if (v67) {
                    goto LABEL_57;
                  }
LABEL_64:

                  v74 = [v313 objectForKeyedSubscript:@"modelSuggestionProxies"];
                  v300 = v74;
                  if (!v74)
                  {
                    id v49 = 0;
                    id v9 = v304;
                    goto LABEL_86;
                  }
                  objc_opt_class();
                  id v9 = v304;
                  if (objc_opt_isKindOfClass())
                  {
                    id v49 = 0;
LABEL_86:
                    uint64_t v93 = [v313 objectForKeyedSubscript:@"adaptedModelRecipeID"];
                    v298 = (void *)v93;
                    if (v93)
                    {
                      v94 = (void *)v93;
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v301 = v94;
                          goto LABEL_89;
                        }
                        if (v310)
                        {
                          id v277 = v49;
                          id v125 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v126 = *MEMORY[0x1E4F502C8];
                          uint64_t v355 = *MEMORY[0x1E4F28568];
                          v127 = v10;
                          id v128 = v9;
                          id v129 = [NSString alloc];
                          uint64_t v240 = objc_opt_class();
                          v130 = v129;
                          id v9 = v128;
                          long long v10 = v127;
                          id v297 = (id)[v130 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v240, @"adaptedModelRecipeID"];
                          id v356 = v297;
                          int v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v356 forKeys:&v355 count:1];
                          v131 = v125;
                          id v49 = v277;
                          id v132 = (id)[v131 initWithDomain:v126 code:2 userInfo:v96];
                          id v301 = 0;
                          uint64_t v25 = 0;
                          int v30 = v311;
                          id *v310 = v132;
                          v74 = v300;
                          goto LABEL_207;
                        }
                        id v301 = 0;
                        uint64_t v25 = 0;
                        int v30 = v311;
                        goto LABEL_208;
                      }
                    }
                    id v301 = 0;
LABEL_89:
                    uint64_t v95 = [v313 objectForKeyedSubscript:@"isAdaptedModelUsed"];
                    v295 = (void *)v95;
                    if (v95 && (int v96 = (void *)v95, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v297 = v96;
                        goto LABEL_92;
                      }
                      if (!v310)
                      {
                        id v297 = 0;
                        uint64_t v25 = 0;
                        int v30 = v311;
                        goto LABEL_207;
                      }
                      id v278 = v49;
                      id v133 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v307 = *MEMORY[0x1E4F502C8];
                      uint64_t v353 = *MEMORY[0x1E4F28568];
                      v134 = v10;
                      id v135 = v9;
                      id v136 = [NSString alloc];
                      uint64_t v241 = objc_opt_class();
                      v137 = v136;
                      id v9 = v135;
                      long long v10 = v134;
                      v74 = v300;
                      v116 = (id *)[v137 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v241, @"isAdaptedModelUsed"];
                      v354 = v116;
                      uint64_t v138 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v354 forKeys:&v353 count:1];
                      v139 = v133;
                      id v49 = v278;
                      v296 = (void *)v138;
                      id v297 = 0;
                      uint64_t v25 = 0;
                      id *v310 = (id)objc_msgSend(v139, "initWithDomain:code:userInfo:", v307, 2);
                    }
                    else
                    {
                      id v297 = 0;
LABEL_92:
                      uint64_t v97 = [v313 objectForKeyedSubscript:@"isAdaptedModelCreated"];
                      v296 = (void *)v97;
                      if (!v97 || (int v98 = (void *)v97, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v306 = 0;
LABEL_95:
                        uint64_t v99 = [v313 objectForKeyedSubscript:@"supportedBundleIDs"];
                        v292 = (void *)v99;
                        if (v99 && (v100 = (void *)v99, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v293 = v100;
                            goto LABEL_98;
                          }
                          if (v310)
                          {
                            id v280 = v49;
                            id v149 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v294 = *MEMORY[0x1E4F502C8];
                            uint64_t v349 = *MEMORY[0x1E4F28568];
                            v150 = v10;
                            id v151 = v9;
                            id v152 = [NSString alloc];
                            uint64_t v243 = objc_opt_class();
                            v153 = v152;
                            v116 = v306;
                            id v9 = v151;
                            long long v10 = v150;
                            id v291 = (id)[v153 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v243, @"supportedBundleIDs"];
                            id v350 = v291;
                            uint64_t v154 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v350 forKeys:&v349 count:1];
                            v155 = v149;
                            id v49 = v280;
                            v290 = (void *)v154;
                            id v156 = (id)objc_msgSend(v155, "initWithDomain:code:userInfo:", v294, 2);
                            id v293 = 0;
                            uint64_t v25 = 0;
                            id *v310 = v156;
                            int v30 = v311;
                            v74 = v300;
                            goto LABEL_204;
                          }
                          id v293 = 0;
                          uint64_t v25 = 0;
                          int v30 = v311;
                          v116 = v306;
                        }
                        else
                        {
                          id v293 = 0;
LABEL_98:
                          uint64_t v101 = [v313 objectForKeyedSubscript:@"peopleSuggestionsDisabled"];
                          v290 = (void *)v101;
                          if (v101 && (v102 = (void *)v101, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                          {
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v291 = v102;
                              goto LABEL_101;
                            }
                            if (v310)
                            {
                              id v281 = v49;
                              id v157 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v158 = *MEMORY[0x1E4F502C8];
                              uint64_t v347 = *MEMORY[0x1E4F28568];
                              v159 = v10;
                              id v160 = v9;
                              id v161 = [NSString alloc];
                              uint64_t v244 = objc_opt_class();
                              v162 = v161;
                              v116 = v306;
                              id v9 = v160;
                              long long v10 = v159;
                              v74 = v300;
                              id v275 = (id)[v162 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v244, @"peopleSuggestionsDisabled"];
                              id v348 = v275;
                              uint64_t v163 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v348 forKeys:&v347 count:1];
                              v164 = v157;
                              id v49 = v281;
                              v274 = (void *)v163;
                              id v165 = (id)objc_msgSend(v164, "initWithDomain:code:userInfo:", v158, 2);
                              id v291 = 0;
                              uint64_t v25 = 0;
                              int v30 = v311;
                              id *v310 = v165;
                              goto LABEL_203;
                            }
                            id v291 = 0;
                            uint64_t v25 = 0;
                            int v30 = v311;
                            v116 = v306;
                          }
                          else
                          {
                            id v291 = 0;
LABEL_101:
                            uint64_t v103 = [v313 objectForKeyedSubscript:@"reasonType"];
                            v274 = (void *)v103;
                            if (v103 && (v104 = (void *)v103, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                            {
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v275 = v104;
                                goto LABEL_104;
                              }
                              if (v310)
                              {
                                id v276 = objc_alloc(MEMORY[0x1E4F28C58]);
                                id v282 = v49;
                                uint64_t v271 = *MEMORY[0x1E4F502C8];
                                uint64_t v345 = *MEMORY[0x1E4F28568];
                                v166 = v10;
                                id v167 = v9;
                                id v168 = [NSString alloc];
                                uint64_t v245 = objc_opt_class();
                                v169 = v168;
                                v116 = v306;
                                id v9 = v167;
                                long long v10 = v166;
                                id v272 = (id)[v169 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v245, @"reasonType"];
                                id v346 = v272;
                                uint64_t v170 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v346 forKeys:&v345 count:1];
                                id v49 = v282;
                                uint64_t v171 = v271;
                                v270 = (void *)v170;
                                id v172 = (id)objc_msgSend(v276, "initWithDomain:code:userInfo:", v171, 2);
                                id v275 = 0;
                                uint64_t v25 = 0;
                                id *v310 = v172;
                                int v30 = v311;
                                goto LABEL_202;
                              }
                              id v275 = 0;
                              uint64_t v25 = 0;
                              int v30 = v311;
                              v116 = v306;
                            }
                            else
                            {
                              id v275 = 0;
LABEL_104:
                              uint64_t v105 = [v313 objectForKeyedSubscript:@"reason"];
                              v270 = (void *)v105;
                              if (v105 && (v106 = (void *)v105, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                              {
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v272 = v106;
                                  goto LABEL_107;
                                }
                                if (v310)
                                {
                                  id v283 = v49;
                                  id v173 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  uint64_t v273 = *MEMORY[0x1E4F502C8];
                                  uint64_t v343 = *MEMORY[0x1E4F28568];
                                  v174 = v10;
                                  id v175 = v9;
                                  id v176 = [NSString alloc];
                                  uint64_t v246 = objc_opt_class();
                                  v177 = v176;
                                  v116 = v306;
                                  id v9 = v175;
                                  long long v10 = v174;
                                  id v268 = (id)[v177 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v246, @"reason"];
                                  id v344 = v268;
                                  uint64_t v178 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v344 forKeys:&v343 count:1];
                                  v179 = v173;
                                  id v49 = v283;
                                  v267 = (void *)v178;
                                  id v180 = (id)objc_msgSend(v179, "initWithDomain:code:userInfo:", v273, 2);
                                  id v272 = 0;
                                  uint64_t v25 = 0;
                                  id *v310 = v180;
                                  int v30 = v311;
                                  v74 = v300;
                                  goto LABEL_201;
                                }
                                id v272 = 0;
                                uint64_t v25 = 0;
                                int v30 = v311;
                                v116 = v306;
                              }
                              else
                              {
                                id v272 = 0;
LABEL_107:
                                uint64_t v107 = [v313 objectForKeyedSubscript:@"sourceBundleID"];
                                v267 = (void *)v107;
                                if (v107
                                  && (v108 = (void *)v107, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                {
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v268 = v108;
                                    goto LABEL_110;
                                  }
                                  if (v310)
                                  {
                                    id v284 = v49;
                                    id v181 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v269 = *MEMORY[0x1E4F502C8];
                                    uint64_t v341 = *MEMORY[0x1E4F28568];
                                    v182 = v10;
                                    id v183 = v9;
                                    id v184 = [NSString alloc];
                                    uint64_t v247 = objc_opt_class();
                                    v185 = v184;
                                    v116 = v306;
                                    id v9 = v183;
                                    long long v10 = v182;
                                    id v265 = (id)[v185 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v247, @"sourceBundleID"];
                                    id v342 = v265;
                                    uint64_t v186 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v342 forKeys:&v341 count:1];
                                    v187 = v181;
                                    id v49 = v284;
                                    v264 = (void *)v186;
                                    id v188 = (id)objc_msgSend(v187, "initWithDomain:code:userInfo:", v269, 2);
                                    id v268 = 0;
                                    uint64_t v25 = 0;
                                    id *v310 = v188;
                                    int v30 = v311;
                                    v74 = v300;
                                    goto LABEL_200;
                                  }
                                  id v268 = 0;
                                  uint64_t v25 = 0;
                                  int v30 = v311;
                                  v116 = v306;
                                }
                                else
                                {
                                  id v268 = 0;
LABEL_110:
                                  uint64_t v109 = [v313 objectForKeyedSubscript:@"transportBundleID"];
                                  v264 = (void *)v109;
                                  if (v109
                                    && (v110 = (void *)v109, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                  {
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v265 = v110;
                                      goto LABEL_113;
                                    }
                                    if (v310)
                                    {
                                      id v285 = v49;
                                      id v189 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v266 = *MEMORY[0x1E4F502C8];
                                      uint64_t v339 = *MEMORY[0x1E4F28568];
                                      v190 = v10;
                                      id v191 = v9;
                                      id v192 = [NSString alloc];
                                      uint64_t v248 = objc_opt_class();
                                      v193 = v192;
                                      v116 = v306;
                                      id v9 = v191;
                                      long long v10 = v190;
                                      id v263 = (id)[v193 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v248, @"transportBundleID"];
                                      id v340 = v263;
                                      uint64_t v194 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v340 forKeys:&v339 count:1];
                                      v195 = v189;
                                      id v49 = v285;
                                      v260 = (void *)v194;
                                      id v196 = (id)objc_msgSend(v195, "initWithDomain:code:userInfo:", v266, 2);
                                      id v265 = 0;
                                      uint64_t v25 = 0;
                                      id *v310 = v196;
                                      int v30 = v311;
                                      v74 = v300;
                                      goto LABEL_199;
                                    }
                                    id v265 = 0;
                                    uint64_t v25 = 0;
                                    int v30 = v311;
                                    v116 = v306;
                                  }
                                  else
                                  {
                                    id v265 = 0;
LABEL_113:
                                    uint64_t v111 = [v313 objectForKeyedSubscript:@"numberOfVisibleSuggestions"];
                                    v260 = (void *)v111;
                                    if (v111
                                      && (v112 = (void *)v111, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                    {
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v263 = v112;
                                        goto LABEL_116;
                                      }
                                      if (v310)
                                      {
                                        id v286 = v49;
                                        id v197 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v198 = *MEMORY[0x1E4F502C8];
                                        uint64_t v337 = *MEMORY[0x1E4F28568];
                                        v199 = v10;
                                        id v200 = v9;
                                        id v201 = [NSString alloc];
                                        uint64_t v249 = objc_opt_class();
                                        v202 = v201;
                                        v116 = v306;
                                        id v9 = v200;
                                        long long v10 = v199;
                                        v74 = v300;
                                        id v261 = (id)[v202 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v249, @"numberOfVisibleSuggestions"];
                                        id v338 = v261;
                                        uint64_t v203 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v338 forKeys:&v337 count:1];
                                        v204 = v197;
                                        id v49 = v286;
                                        v258 = (void *)v203;
                                        id v205 = (id)objc_msgSend(v204, "initWithDomain:code:userInfo:", v198, 2);
                                        id v263 = 0;
                                        uint64_t v25 = 0;
                                        int v30 = v311;
                                        id *v310 = v205;
                                        goto LABEL_198;
                                      }
                                      id v263 = 0;
                                      uint64_t v25 = 0;
                                      int v30 = v311;
                                      v116 = v306;
                                    }
                                    else
                                    {
                                      id v263 = 0;
LABEL_116:
                                      uint64_t v113 = [v313 objectForKeyedSubscript:@"trackingID"];
                                      v258 = (void *)v113;
                                      if (v113
                                        && (v114 = (void *)v113, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                      {
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          id v261 = v114;
                                          goto LABEL_119;
                                        }
                                        if (v310)
                                        {
                                          id v287 = v49;
                                          id v206 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          uint64_t v262 = *MEMORY[0x1E4F502C8];
                                          uint64_t v335 = *MEMORY[0x1E4F28568];
                                          v207 = v10;
                                          id v208 = v9;
                                          id v209 = [NSString alloc];
                                          uint64_t v250 = objc_opt_class();
                                          v210 = v209;
                                          v116 = v306;
                                          id v9 = v208;
                                          long long v10 = v207;
                                          id v259 = (id)[v210 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v250, @"trackingID"];
                                          id v336 = v259;
                                          uint64_t v211 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v336 forKeys:&v335 count:1];
                                          v212 = v206;
                                          id v49 = v287;
                                          v256 = (void *)v211;
                                          id v213 = (id)objc_msgSend(v212, "initWithDomain:code:userInfo:", v262, 2);
                                          id v261 = 0;
                                          uint64_t v25 = 0;
                                          id *v310 = v213;
                                          int v30 = v311;
                                          v74 = v300;
                                          goto LABEL_197;
                                        }
                                        id v261 = 0;
                                        uint64_t v25 = 0;
                                        int v30 = v311;
                                        v116 = v306;
                                      }
                                      else
                                      {
                                        id v261 = 0;
LABEL_119:
                                        uint64_t v115 = [v313 objectForKeyedSubscript:@"iCloudFamilyInvocation"];
                                        v116 = v306;
                                        v256 = (void *)v115;
                                        if (v115
                                          && (v117 = (void *)v115, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                        {
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v259 = v117;
                                            goto LABEL_122;
                                          }
                                          if (v310)
                                          {
                                            id v214 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            uint64_t v215 = *MEMORY[0x1E4F502C8];
                                            uint64_t v333 = *MEMORY[0x1E4F28568];
                                            v216 = v10;
                                            id v217 = v9;
                                            id v218 = [NSString alloc];
                                            uint64_t v251 = objc_opt_class();
                                            v219 = v218;
                                            id v9 = v217;
                                            long long v10 = v216;
                                            v74 = v300;
                                            id v257 = (id)[v219 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v251, @"iCloudFamilyInvocation"];
                                            id v334 = v257;
                                            v255 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v334 forKeys:&v333 count:1];
                                            id v220 = (id)objc_msgSend(v214, "initWithDomain:code:userInfo:", v215, 2);
                                            id v259 = 0;
                                            uint64_t v25 = 0;
                                            int v30 = v311;
                                            id *v310 = v220;
                                            goto LABEL_196;
                                          }
                                          id v259 = 0;
                                          uint64_t v25 = 0;
                                          int v30 = v311;
                                        }
                                        else
                                        {
                                          id v259 = 0;
LABEL_122:
                                          uint64_t v118 = [v313 objectForKeyedSubscript:@"engagementType"];
                                          v255 = (void *)v118;
                                          if (!v118
                                            || (v119 = (void *)v118,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            id v257 = 0;
                                            goto LABEL_190;
                                          }
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v257 = v119;
LABEL_189:

LABEL_190:
                                            id v226 = [v313 objectForKeyedSubscript:@"indexSelected"];
                                            v254 = v226;
                                            if (!v226)
                                            {
LABEL_193:
                                              int v30 = v311;
                                              goto LABEL_194;
                                            }
                                            objc_opt_class();
                                            if (objc_opt_isKindOfClass())
                                            {
                                              id v226 = 0;
                                              goto LABEL_193;
                                            }
                                            objc_opt_class();
                                            int v30 = v311;
                                            if (objc_opt_isKindOfClass())
                                            {
                                              id v226 = v226;
LABEL_194:
                                              v253 = v226;
                                              LODWORD(v252) = [v257 intValue];
                                              uint64_t v25 = objc_retain(-[BMShareSheetFeedback initWithDerivedIntentIdentifier:targetBundleID:extensionContextUUID:attachments:locationUUIDs:photoSuggestedContacts:modelSuggestionProxies:adaptedModelRecipeID:isAdaptedModelUsed:isAdaptedModelCreated:supportedBundleIDs:peopleSuggestionsDisabled:reasonType:reason:sourceBundleID:transportBundleID:numberOfVisibleSuggestions:trackingID:iCloudFamilyInvocation:engagementType:indexSelected:](v312, "initWithDerivedIntentIdentifier:targetBundleID:extensionContextUUID:attachments:locationUUIDs:photoSuggestedContacts:modelSuggestionProxies:adaptedModelRecipeID:isAdaptedModelUsed:isAdaptedModelCreated:supportedBundleIDs:peopleSuggestionsDisabled:reasonType:reason:sourceBundleID:transportBundleID:numberOfVisibleSuggestions:trackingID:iCloudFamilyInvocation:engagementType:indexSelected:", v9, v318, v30, v37, v320, v316, v49, v301, v297, v116, v293,
                                                        v291,
                                                        v275,
                                                        v272,
                                                        v268,
                                                        v265,
                                                        v263,
                                                        v261,
                                                        v259,
                                                        v252,
                                                        v226));
                                              v312 = v25;
                                            }
                                            else
                                            {
                                              uint64_t v25 = (BMShareSheetFeedback *)v310;
                                              if (v310)
                                              {
                                                id v288 = v49;
                                                id v228 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                uint64_t v229 = *MEMORY[0x1E4F502C8];
                                                uint64_t v329 = *MEMORY[0x1E4F28568];
                                                id v308 = v9;
                                                v230 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"indexSelected"];
                                                v330 = v230;
                                                v231 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v330 forKeys:&v329 count:1];
                                                v232 = v228;
                                                id v49 = v288;
                                                uint64_t v233 = v229;
                                                int v30 = v311;
                                                id *v310 = (id)[v232 initWithDomain:v233 code:2 userInfo:v231];

                                                id v9 = v308;
                                                v253 = 0;
                                                uint64_t v25 = 0;
                                              }
                                              else
                                              {
                                                v253 = 0;
                                              }
                                            }
LABEL_195:
                                          }
                                          else
                                          {
                                            objc_opt_class();
                                            if (objc_opt_isKindOfClass())
                                            {
                                              id v221 = v119;
                                              id v222 = v49;
                                              v223 = NSNumber;
                                              v224 = BMShareSheetFeedbackEngagementTypeFromString(v221);
                                              v225 = v223;
                                              id v49 = v222;
                                              id v257 = [v225 numberWithInt:v224];

                                              v116 = v306;
                                              goto LABEL_189;
                                            }
                                            if (v310)
                                            {
                                              id v289 = v49;
                                              id v234 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              uint64_t v235 = *MEMORY[0x1E4F502C8];
                                              uint64_t v331 = *MEMORY[0x1E4F28568];
                                              v253 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"engagementType"];
                                              v332 = v253;
                                              uint64_t v236 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v332 forKeys:&v331 count:1];
                                              v237 = v234;
                                              id v49 = v289;
                                              v254 = (void *)v236;
                                              id v257 = 0;
                                              uint64_t v25 = 0;
                                              id *v310 = (id)objc_msgSend(v237, "initWithDomain:code:userInfo:", v235, 2);
                                              int v30 = v311;
                                              v116 = v306;
                                              goto LABEL_195;
                                            }
                                            id v257 = 0;
                                            uint64_t v25 = 0;
                                            int v30 = v311;
                                            v116 = v306;
                                          }
LABEL_196:
                                        }
LABEL_197:
                                      }
LABEL_198:
                                    }
LABEL_199:
                                  }
LABEL_200:
                                }
LABEL_201:
                              }
LABEL_202:
                            }
LABEL_203:
                          }
LABEL_204:
                        }
LABEL_205:

LABEL_206:
                        int v96 = v295;
LABEL_207:

LABEL_208:
LABEL_209:

                        goto LABEL_210;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v306 = v98;
                        goto LABEL_95;
                      }
                      v116 = v310;
                      if (v310)
                      {
                        id v279 = v49;
                        id v140 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v141 = *MEMORY[0x1E4F502C8];
                        uint64_t v351 = *MEMORY[0x1E4F28568];
                        v142 = v10;
                        id v143 = v9;
                        id v144 = [NSString alloc];
                        uint64_t v242 = objc_opt_class();
                        v145 = v144;
                        id v9 = v143;
                        long long v10 = v142;
                        v74 = v300;
                        id v293 = (id)[v145 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v242, @"isAdaptedModelCreated"];
                        id v352 = v293;
                        uint64_t v146 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v352 forKeys:&v351 count:1];
                        v147 = v140;
                        id v49 = v279;
                        v292 = (void *)v146;
                        id v148 = (id)objc_msgSend(v147, "initWithDomain:code:userInfo:", v141, 2);
                        v116 = 0;
                        uint64_t v25 = 0;
                        int v30 = v311;
                        id *v310 = v148;
                        goto LABEL_205;
                      }
                      uint64_t v25 = 0;
                    }
                    int v30 = v311;
                    goto LABEL_206;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v49 = v74;
                    goto LABEL_86;
                  }
                  if (v35)
                  {
                    id v120 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v121 = *MEMORY[0x1E4F502C8];
                    uint64_t v357 = *MEMORY[0x1E4F28568];
                    id v122 = [NSString alloc];
                    uint64_t v239 = objc_opt_class();
                    v123 = v122;
                    id v9 = v304;
                    id v301 = (id)[v123 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", v239, @"modelSuggestionProxies"];
                    id v358 = v301;
                    v299 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v358 forKeys:&v357 count:1];
                    id v124 = (id)objc_msgSend(v120, "initWithDomain:code:userInfo:", v121, 2);
                    id v49 = 0;
                    uint64_t v25 = 0;
                    int v30 = v311;
                    id *v310 = v124;

                    goto LABEL_209;
                  }
                  id v49 = 0;
                  uint64_t v25 = 0;
                  int v30 = v311;
LABEL_210:

LABEL_211:
                  id v14 = v37;
LABEL_212:

LABEL_213:
LABEL_214:

                  long long v11 = v309;
                  goto LABEL_215;
                }
              }
              int v81 = v310;
              if (v310)
              {
                id v82 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v83 = *MEMORY[0x1E4F502C8];
                uint64_t v361 = *MEMORY[0x1E4F28568];
                v74 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"photoSuggestedContacts"];
                v362 = v74;
                id v301 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v362 forKeys:&v361 count:1];
                v84 = objc_msgSend(v82, "initWithDomain:code:userInfo:", v83, 2);
                v85 = v304;
                long long v10 = v70;
                int v30 = v311;
LABEL_75:
                uint64_t v25 = 0;
                *int v81 = v84;
                id v37 = v69;
                id v15 = v302;
                id v9 = v85;
                id v49 = obj;
                goto LABEL_209;
              }
LABEL_79:
              uint64_t v25 = 0;
              id v49 = obj;
              id v9 = v304;
              long long v10 = v70;
              int v30 = v311;
              id v14 = v69;
              id v15 = v302;
              goto LABEL_212;
            }
            uint64_t v38 = v36;
            uint64_t v39 = *(void *)v326;
            v303 = v37;
LABEL_36:
            uint64_t v40 = v12;
            uint64_t v41 = 0;
            while (1)
            {
              if (*(void *)v326 != v39) {
                objc_enumerationMutation(v15);
              }
              int v42 = *(void **)(*((void *)&v325 + 1) + 8 * v41);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                break;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (a4)
                {
                  id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v54 = *MEMORY[0x1E4F502C8];
                  uint64_t v366 = *MEMORY[0x1E4F28568];
                  v316 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"locationUUIDs"];
                  v367 = v316;
                  uint64_t v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v367 forKeys:&v366 count:1];
                  uint64_t v50 = v53;
                  uint64_t v51 = v54;
                  id v49 = (id)v55;
                  id v52 = (id)v55;
                  goto LABEL_49;
                }
                goto LABEL_50;
              }
              id v43 = v42;
              [v320 addObject:v43];

              if (v38 == ++v41)
              {
                uint64_t v38 = [v15 countByEnumeratingWithState:&v325 objects:v370 count:16];
                long long v12 = v40;
                id v37 = v303;
                v35 = a4;
                if (!v38) {
                  goto LABEL_43;
                }
                goto LABEL_36;
              }
            }
            if (a4)
            {
              id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v48 = *MEMORY[0x1E4F502C8];
              uint64_t v368 = *MEMORY[0x1E4F28568];
              v316 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"locationUUIDs"];
              v369 = v316;
              id v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v369 forKeys:&v368 count:1];
              uint64_t v50 = v47;
              uint64_t v51 = v48;
              id v52 = v49;
LABEL_49:
              id v9 = v304;
              int v30 = v311;
              uint64_t v25 = 0;
              *a4 = (id)[v50 initWithDomain:v51 code:2 userInfo:v52];
              id obj = v15;
              long long v12 = v40;
              id v14 = v303;
              goto LABEL_212;
            }
LABEL_50:
            uint64_t v25 = 0;
            id v14 = v303;
            id v9 = v304;
            int v30 = v311;
            long long v12 = v40;

            goto LABEL_214;
          }
          if (!v15)
          {
            id v304 = v9;
            goto LABEL_33;
          }
          objc_opt_class();
          long long v12 = v13;
          if (objc_opt_isKindOfClass())
          {
            id v304 = v9;
            uint64_t v20 = v318;
            goto LABEL_34;
          }
          if (a4)
          {
            id v75 = objc_alloc(MEMORY[0x1E4F28C58]);
            id v76 = v9;
            uint64_t v77 = *MEMORY[0x1E4F502C8];
            uint64_t v371 = *MEMORY[0x1E4F28568];
            v320 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"locationUUIDs"];
            v372 = v320;
            uint64_t v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v372 forKeys:&v371 count:1];
            uint64_t v79 = v77;
            id v9 = v76;
            id obja = (id)v78;
            id v80 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v79, 2);
            uint64_t v25 = 0;
            *a4 = v80;
            int v30 = v311;

            goto LABEL_214;
          }
          uint64_t v25 = 0;
          int v30 = v311;
LABEL_215:
          a4 = v318;

          id v6 = v313;
          goto LABEL_216;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v13 = v12;
          id v14 = v12;
          goto LABEL_13;
        }
        if (a4)
        {
          id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
          v57 = v10;
          id v58 = v9;
          uint64_t v59 = *MEMORY[0x1E4F502C8];
          uint64_t v373 = *MEMORY[0x1E4F28568];
          v60 = v12;
          id v61 = [NSString alloc];
          uint64_t v238 = objc_opt_class();
          id v62 = v61;
          long long v12 = v60;
          id v15 = (id)[v62 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", v238, @"attachments"];
          id v374 = v15;
          uint64_t v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v374 forKeys:&v373 count:1];
          uint64_t v64 = v59;
          id v9 = v58;
          long long v10 = v57;
          v320 = (void *)v63;
          id v65 = (id)objc_msgSend(v56, "initWithDomain:code:userInfo:", v64, 2);
          id v14 = 0;
          uint64_t v25 = 0;
          *a4 = v65;
          int v30 = v311;
          goto LABEL_214;
        }
        id v14 = 0;
        uint64_t v25 = 0;
        int v30 = v311;
LABEL_78:
        a4 = v318;
LABEL_216:

        self = v312;
        goto LABEL_217;
      }
      if (a4)
      {
        id v319 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v32 = *MEMORY[0x1E4F502C8];
        uint64_t v375 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"extensionContextUUID"];
        id v376 = v14;
        uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v376 forKeys:&v375 count:1];
        id v34 = (id)[v319 initWithDomain:v32 code:2 userInfo:v33];
        int v30 = 0;
        uint64_t v25 = 0;
        *a4 = v34;
        long long v12 = (void *)v33;
        goto LABEL_78;
      }
      int v30 = 0;
      uint64_t v25 = 0;
      a4 = v318;
LABEL_217:

      goto LABEL_218;
    }
    if (a4)
    {
      id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v27 = *MEMORY[0x1E4F502C8];
      uint64_t v377 = *MEMORY[0x1E4F28568];
      uint64_t v28 = a4;
      id v305 = v9;
      uint64_t v29 = v18;
      int v30 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"targetBundleID"];
      v378 = v30;
      long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v378 forKeys:&v377 count:1];
      id v31 = (id)[v26 initWithDomain:v27 code:2 userInfo:v11];
      a4 = 0;
      uint64_t v25 = 0;
      id *v28 = v31;
      self = v19;
      long long v10 = v29;
      id v9 = v305;
      goto LABEL_217;
    }
    uint64_t v25 = 0;
    long long v10 = v18;
LABEL_218:

    goto LABEL_219;
  }
  if (a4)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v22 = a4;
    uint64_t v23 = *MEMORY[0x1E4F502C8];
    uint64_t v379 = *MEMORY[0x1E4F28568];
    a4 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"derivedIntentIdentifier"];
    v380[0] = a4;
    long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v380 forKeys:&v379 count:1];
    id v24 = (id)[v21 initWithDomain:v23 code:2 userInfo:v10];
    id v9 = 0;
    uint64_t v25 = 0;
    id *v22 = v24;
    goto LABEL_218;
  }
  id v9 = 0;
  uint64_t v25 = 0;
LABEL_219:

  return v25;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMShareSheetFeedback *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_derivedIntentIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_targetBundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_extensionContextUUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_attachments) {
    PBDataWriterWriteDataField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = self->_locationUUIDs;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v10 = self->_photoSuggestedContacts;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteDataField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (self->_modelSuggestionProxies) {
    PBDataWriterWriteDataField();
  }
  if (self->_adaptedModelRecipeID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasIsAdaptedModelUsed) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsAdaptedModelCreated) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_supportedBundleIDs) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasPeopleSuggestionsDisabled) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_reasonType) {
    PBDataWriterWriteStringField();
  }
  if (self->_reason) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceBundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_transportBundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasNumberOfVisibleSuggestions) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_trackingID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasICloudFamilyInvocation) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasIndexSelected) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v83.receiver = self;
  v83.super_class = (Class)BMShareSheetFeedback;
  uint64_t v5 = [(BMEventBase *)&v83 init];
  if (!v5) {
    goto LABEL_119;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v9 = (int *)MEMORY[0x1E4F940E0];
  long long v10 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v11 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v10]) {
        break;
      }
      char v12 = 0;
      unsigned int v13 = 0;
      unint64_t v14 = 0;
      while (1)
      {
        uint64_t v15 = *v8;
        uint64_t v16 = *(void *)&v4[v15];
        unint64_t v17 = v16 + 1;
        if (v16 == -1 || v17 > *(void *)&v4[*v9]) {
          break;
        }
        char v18 = *(unsigned char *)(*(void *)&v4[*v11] + v16);
        *(void *)&v4[v15] = v17;
        v14 |= (unint64_t)(v18 & 0x7F) << v12;
        if ((v18 & 0x80) == 0) {
          goto LABEL_13;
        }
        v12 += 7;
        BOOL v19 = v13++ >= 9;
        if (v19)
        {
          unint64_t v14 = 0;
          int v20 = v4[*v10];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      int v20 = v4[*v10];
      if (v4[*v10]) {
        unint64_t v14 = 0;
      }
LABEL_15:
      if (v20 || (v14 & 7) == 4) {
        break;
      }
      switch((v14 >> 3))
      {
        case 1u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 48;
          goto LABEL_63;
        case 2u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 56;
          goto LABEL_63;
        case 3u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 64;
          goto LABEL_63;
        case 4u:
          uint64_t v22 = PBReaderReadData();
          uint64_t v23 = 72;
          goto LABEL_63;
        case 5u:
          uint64_t v24 = PBReaderReadString();
          if (!v24) {
            goto LABEL_121;
          }
          uint64_t v25 = (void *)v24;
          id v26 = v6;
          goto LABEL_30;
        case 6u:
          uint64_t v27 = PBReaderReadData();
          if (!v27) {
            goto LABEL_121;
          }
          uint64_t v25 = (void *)v27;
          id v26 = v7;
LABEL_30:
          [v26 addObject:v25];

          continue;
        case 7u:
          uint64_t v22 = PBReaderReadData();
          uint64_t v23 = 96;
          goto LABEL_63;
        case 8u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 104;
          goto LABEL_63;
        case 9u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          v5->_hasIsAdaptedModelUsed = 1;
          while (2)
          {
            uint64_t v31 = *v8;
            uint64_t v32 = *(void *)&v4[v31];
            unint64_t v33 = v32 + 1;
            if (v32 == -1 || v33 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)&v4[*v11] + v32);
              *(void *)&v4[v31] = v33;
              v30 |= (unint64_t)(v34 & 0x7F) << v28;
              if (v34 < 0)
              {
                v28 += 7;
                BOOL v19 = v29++ >= 9;
                if (v19)
                {
                  uint64_t v30 = 0;
                  goto LABEL_90;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v30 = 0;
          }
LABEL_90:
          BOOL v73 = v30 != 0;
          uint64_t v74 = 16;
          goto LABEL_103;
        case 0xAu:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0;
          v5->_hasIsAdaptedModelCreated = 1;
          while (2)
          {
            uint64_t v38 = *v8;
            uint64_t v39 = *(void *)&v4[v38];
            unint64_t v40 = v39 + 1;
            if (v39 == -1 || v40 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)&v4[*v11] + v39);
              *(void *)&v4[v38] = v40;
              v37 |= (unint64_t)(v41 & 0x7F) << v35;
              if (v41 < 0)
              {
                v35 += 7;
                BOOL v19 = v36++ >= 9;
                if (v19)
                {
                  uint64_t v37 = 0;
                  goto LABEL_94;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v37 = 0;
          }
LABEL_94:
          BOOL v73 = v37 != 0;
          uint64_t v74 = 18;
          goto LABEL_103;
        case 0xBu:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 112;
          goto LABEL_63;
        case 0xCu:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v44 = 0;
          v5->_hasPeopleSuggestionsDisabled = 1;
          while (2)
          {
            uint64_t v45 = *v8;
            uint64_t v46 = *(void *)&v4[v45];
            unint64_t v47 = v46 + 1;
            if (v46 == -1 || v47 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v48 = *(unsigned char *)(*(void *)&v4[*v11] + v46);
              *(void *)&v4[v45] = v47;
              v44 |= (unint64_t)(v48 & 0x7F) << v42;
              if (v48 < 0)
              {
                v42 += 7;
                BOOL v19 = v43++ >= 9;
                if (v19)
                {
                  LODWORD(v44) = 0;
                  goto LABEL_98;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            LODWORD(v44) = 0;
          }
LABEL_98:
          uint64_t v75 = 32;
          goto LABEL_114;
        case 0xDu:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 120;
          goto LABEL_63;
        case 0xEu:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 128;
          goto LABEL_63;
        case 0xFu:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 136;
          goto LABEL_63;
        case 0x10u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 144;
          goto LABEL_63;
        case 0x11u:
          v5->_hasNumberOfVisibleSuggestions = 1;
          uint64_t v49 = *v8;
          unint64_t v50 = *(void *)&v4[v49];
          if (v50 <= 0xFFFFFFFFFFFFFFF7 && v50 + 8 <= *(void *)&v4[*v9])
          {
            double v51 = *(double *)(*(void *)&v4[*v11] + v50);
            *(void *)&v4[v49] = v50 + 8;
          }
          else
          {
            v4[*v10] = 1;
            double v51 = 0.0;
          }
          v5->_numberOfVisibleSuggestions = v51;
          continue;
        case 0x12u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 160;
LABEL_63:
          id v52 = *(Class *)((char *)&v5->super.super.isa + v23);
          *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

          continue;
        case 0x13u:
          char v53 = 0;
          unsigned int v54 = 0;
          uint64_t v55 = 0;
          v5->_hasICloudFamilyInvocation = 1;
          while (2)
          {
            uint64_t v56 = *v8;
            uint64_t v57 = *(void *)&v4[v56];
            unint64_t v58 = v57 + 1;
            if (v57 == -1 || v58 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v59 = *(unsigned char *)(*(void *)&v4[*v11] + v57);
              *(void *)&v4[v56] = v58;
              v55 |= (unint64_t)(v59 & 0x7F) << v53;
              if (v59 < 0)
              {
                v53 += 7;
                BOOL v19 = v54++ >= 9;
                if (v19)
                {
                  uint64_t v55 = 0;
                  goto LABEL_102;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v55 = 0;
          }
LABEL_102:
          BOOL v73 = v55 != 0;
          uint64_t v74 = 22;
LABEL_103:
          *((unsigned char *)&v5->super.super.isa + v74) = v73;
          continue;
        case 0x14u:
          char v60 = 0;
          unsigned int v61 = 0;
          uint64_t v62 = 0;
          while (2)
          {
            uint64_t v63 = *v8;
            uint64_t v64 = *(void *)&v4[v63];
            unint64_t v65 = v64 + 1;
            if (v64 == -1 || v65 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v66 = *(unsigned char *)(*(void *)&v4[*v11] + v64);
              *(void *)&v4[v63] = v65;
              v62 |= (unint64_t)(v66 & 0x7F) << v60;
              if (v66 < 0)
              {
                v60 += 7;
                BOOL v19 = v61++ >= 9;
                if (v19)
                {
                  LODWORD(v62) = 0;
                  goto LABEL_107;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            LODWORD(v62) = 0;
          }
LABEL_107:
          if (v62 >= 5) {
            LODWORD(v62) = 0;
          }
          v5->_engagementType = v62;
          continue;
        case 0x15u:
          char v67 = 0;
          unsigned int v68 = 0;
          uint64_t v44 = 0;
          v5->_hasIndexSelected = 1;
          break;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_121:

          goto LABEL_118;
      }
      while (1)
      {
        uint64_t v69 = *v8;
        uint64_t v70 = *(void *)&v4[v69];
        unint64_t v71 = v70 + 1;
        if (v70 == -1 || v71 > *(void *)&v4[*v9]) {
          break;
        }
        char v72 = *(unsigned char *)(*(void *)&v4[*v11] + v70);
        *(void *)&v4[v69] = v71;
        v44 |= (unint64_t)(v72 & 0x7F) << v67;
        if ((v72 & 0x80) == 0) {
          goto LABEL_111;
        }
        v67 += 7;
        BOOL v19 = v68++ >= 9;
        if (v19)
        {
          LODWORD(v44) = 0;
          goto LABEL_113;
        }
      }
      v4[*v10] = 1;
LABEL_111:
      if (v4[*v10]) {
        LODWORD(v44) = 0;
      }
LABEL_113:
      uint64_t v75 = 40;
LABEL_114:
      *(_DWORD *)((char *)&v5->super.super.isa + v75) = v44;
    }
    while (*(void *)&v4[*v8] < *(void *)&v4[*v9]);
  }
  uint64_t v76 = [v6 copy];
  locationUUIDs = v5->_locationUUIDs;
  v5->_locationUUIDs = (NSArray *)v76;

  uint64_t v78 = [v7 copy];
  photoSuggestedContacts = v5->_photoSuggestedContacts;
  v5->_photoSuggestedContacts = (NSArray *)v78;

  int v80 = v4[*v10];
  if (v80) {
LABEL_118:
  }
    int v81 = 0;
  else {
LABEL_119:
  }
    int v81 = v5;

  return v81;
}

- (NSString)description
{
  id v18 = [NSString alloc];
  uint64_t v27 = [(BMShareSheetFeedback *)self derivedIntentIdentifier];
  id v26 = [(BMShareSheetFeedback *)self targetBundleID];
  uint64_t v25 = [(BMShareSheetFeedback *)self extensionContextUUID];
  uint64_t v24 = [(BMShareSheetFeedback *)self attachments];
  uint64_t v23 = [(BMShareSheetFeedback *)self locationUUIDs];
  uint64_t v22 = [(BMShareSheetFeedback *)self photoSuggestedContacts];
  unint64_t v17 = [(BMShareSheetFeedback *)self modelSuggestionProxies];
  long long v21 = [(BMShareSheetFeedback *)self adaptedModelRecipeID];
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", -[BMShareSheetFeedback isAdaptedModelUsed](self, "isAdaptedModelUsed"));
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", -[BMShareSheetFeedback isAdaptedModelCreated](self, "isAdaptedModelCreated"));
  int v20 = [(BMShareSheetFeedback *)self supportedBundleIDs];
  char v12 = objc_msgSend(NSNumber, "numberWithInt:", -[BMShareSheetFeedback peopleSuggestionsDisabled](self, "peopleSuggestionsDisabled"));
  unint64_t v14 = [(BMShareSheetFeedback *)self reasonType];
  uint64_t v11 = [(BMShareSheetFeedback *)self reason];
  unsigned int v13 = [(BMShareSheetFeedback *)self sourceBundleID];
  long long v10 = [(BMShareSheetFeedback *)self transportBundleID];
  uint64_t v3 = NSNumber;
  [(BMShareSheetFeedback *)self numberOfVisibleSuggestions];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v5 = [(BMShareSheetFeedback *)self trackingID];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMShareSheetFeedback iCloudFamilyInvocation](self, "iCloudFamilyInvocation"));
  uint64_t v7 = BMShareSheetFeedbackEngagementTypeAsString([(BMShareSheetFeedback *)self engagementType]);
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMShareSheetFeedback indexSelected](self, "indexSelected"));
  BOOL v19 = objc_msgSend(v18, "initWithFormat:", @"BMShareSheetFeedback with derivedIntentIdentifier: %@, targetBundleID: %@, extensionContextUUID: %@, attachments: %@, locationUUIDs: %@, photoSuggestedContacts: %@, modelSuggestionProxies: %@, adaptedModelRecipeID: %@, isAdaptedModelUsed: %@, isAdaptedModelCreated: %@, supportedBundleIDs: %@, peopleSuggestionsDisabled: %@, reasonType: %@, reason: %@, sourceBundleID: %@, transportBundleID: %@, numberOfVisibleSuggestions: %@, trackingID: %@, iCloudFamilyInvocation: %@, engagementType: %@, indexSelected: %@", v27, v26, v25, v24, v23, v22, v17, v21, v16, v15, v20, v12, v14, v11, v13, v10,
                  v4,
                  v5,
                  v6,
                  v7,
                  v8);

  return (NSString *)v19;
}

- (BMShareSheetFeedback)initWithDerivedIntentIdentifier:(id)a3 targetBundleID:(id)a4 extensionContextUUID:(id)a5 attachments:(id)a6 locationUUIDs:(id)a7 photoSuggestedContacts:(id)a8 modelSuggestionProxies:(id)a9 adaptedModelRecipeID:(id)a10 isAdaptedModelUsed:(id)a11 isAdaptedModelCreated:(id)a12 supportedBundleIDs:(id)a13 peopleSuggestionsDisabled:(id)a14 reasonType:(id)a15 reason:(id)a16 sourceBundleID:(id)a17 transportBundleID:(id)a18 numberOfVisibleSuggestions:(id)a19 trackingID:(id)a20 iCloudFamilyInvocation:(id)a21 engagementType:(int)a22 indexSelected:(id)a23
{
  id v58 = a3;
  id v41 = a4;
  id v57 = a4;
  id v42 = a5;
  id v56 = a5;
  id v43 = a6;
  id v55 = a6;
  id v44 = a7;
  id v54 = a7;
  id v53 = a8;
  id v52 = a9;
  id v51 = a10;
  id v28 = a11;
  id v29 = a12;
  id v50 = a13;
  id v30 = a14;
  id v49 = a15;
  id v48 = a16;
  id v47 = a17;
  id v46 = a18;
  id v31 = a19;
  id v32 = a20;
  id v33 = a21;
  id v34 = a23;
  v59.receiver = self;
  v59.super_class = (Class)BMShareSheetFeedback;
  char v35 = [(BMEventBase *)&v59 init];
  if (v35)
  {
    v35->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v35->_derivedIntentIdentifier, a3);
    objc_storeStrong((id *)&v35->_targetBundleID, v41);
    objc_storeStrong((id *)&v35->_extensionContextUUID, v42);
    objc_storeStrong((id *)&v35->_attachments, v43);
    objc_storeStrong((id *)&v35->_locationUUIDs, v44);
    objc_storeStrong((id *)&v35->_photoSuggestedContacts, a8);
    objc_storeStrong((id *)&v35->_modelSuggestionProxies, a9);
    objc_storeStrong((id *)&v35->_adaptedModelRecipeID, a10);
    if (v28)
    {
      v35->_hasIsAdaptedModelUsed = 1;
      v35->_isAdaptedModelUsed = [v28 BOOLValue];
    }
    else
    {
      v35->_hasIsAdaptedModelUsed = 0;
      v35->_isAdaptedModelUsed = 0;
    }
    if (v29)
    {
      v35->_hasIsAdaptedModelCreated = 1;
      v35->_isAdaptedModelCreated = [v29 BOOLValue];
    }
    else
    {
      v35->_hasIsAdaptedModelCreated = 0;
      v35->_isAdaptedModelCreated = 0;
    }
    objc_storeStrong((id *)&v35->_supportedBundleIDs, a13);
    if (v30)
    {
      v35->_hasPeopleSuggestionsDisabled = 1;
      int v36 = [v30 intValue];
    }
    else
    {
      v35->_hasPeopleSuggestionsDisabled = 0;
      int v36 = -1;
    }
    v35->_peopleSuggestionsDisabled = v36;
    objc_storeStrong((id *)&v35->_reasonType, a15);
    objc_storeStrong((id *)&v35->_reason, a16);
    objc_storeStrong((id *)&v35->_sourceBundleID, a17);
    objc_storeStrong((id *)&v35->_transportBundleID, a18);
    if (v31)
    {
      v35->_hasNumberOfVisibleSuggestions = 1;
      [v31 doubleValue];
    }
    else
    {
      v35->_hasNumberOfVisibleSuggestions = 0;
      double v37 = -1.0;
    }
    v35->_numberOfVisibleSuggestions = v37;
    objc_storeStrong((id *)&v35->_trackingID, a20);
    if (v33)
    {
      v35->_hasICloudFamilyInvocation = 1;
      v35->_iCloudFamilyInvocation = [v33 BOOLValue];
    }
    else
    {
      v35->_hasICloudFamilyInvocation = 0;
      v35->_iCloudFamilyInvocation = 0;
    }
    v35->_engagementType = a22;
    if (v34)
    {
      v35->_hasIndexSelected = 1;
      int v38 = [v34 intValue];
    }
    else
    {
      v35->_hasIndexSelected = 0;
      int v38 = -1;
    }
    v35->_indexSelected = v38;
  }

  return v35;
}

+ (id)protoFields
{
  v25[21] = *MEMORY[0x1E4F143B8];
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"derivedIntentIdentifier" number:1 type:13 subMessageClass:0];
  v25[0] = v24;
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"targetBundleID" number:2 type:13 subMessageClass:0];
  v25[1] = v23;
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"extensionContextUUID" number:3 type:13 subMessageClass:0];
  v25[2] = v22;
  long long v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"attachments" number:4 type:14 subMessageClass:0];
  v25[3] = v21;
  int v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"locationUUIDs" number:5 type:13 subMessageClass:0];
  v25[4] = v20;
  BOOL v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"photoSuggestedContacts" number:6 type:14 subMessageClass:0];
  v25[5] = v19;
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"modelSuggestionProxies" number:7 type:14 subMessageClass:0];
  v25[6] = v18;
  unint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"adaptedModelRecipeID" number:8 type:13 subMessageClass:0];
  v25[7] = v17;
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isAdaptedModelUsed" number:9 type:12 subMessageClass:0];
  v25[8] = v16;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isAdaptedModelCreated" number:10 type:12 subMessageClass:0];
  v25[9] = v15;
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"supportedBundleIDs" number:11 type:13 subMessageClass:0];
  v25[10] = v14;
  unsigned int v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"peopleSuggestionsDisabled" number:12 type:2 subMessageClass:0];
  v25[11] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"reasonType" number:13 type:13 subMessageClass:0];
  v25[12] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"reason" number:14 type:13 subMessageClass:0];
  v25[13] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sourceBundleID" number:15 type:13 subMessageClass:0];
  v25[14] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"transportBundleID" number:16 type:13 subMessageClass:0];
  v25[15] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numberOfVisibleSuggestions" number:17 type:0 subMessageClass:0];
  v25[16] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"trackingID" number:18 type:13 subMessageClass:0];
  v25[17] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"iCloudFamilyInvocation" number:19 type:12 subMessageClass:0];
  v25[18] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"engagementType" number:20 type:4 subMessageClass:0];
  v25[19] = v9;
  long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"indexSelected" number:21 type:2 subMessageClass:0];
  v25[20] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:21];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF53D0;
}

+ (id)columns
{
  v25[21] = *MEMORY[0x1E4F143B8];
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"derivedIntentIdentifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"targetBundleID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"extensionContextUUID" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  unsigned int v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"attachments" dataType:4 requestOnly:0 fieldNumber:4 protoDataType:14 convertedType:0];
  long long v21 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"locationUUIDs_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_121];
  int v20 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"photoSuggestedContacts_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_123_44400];
  BOOL v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"modelSuggestionProxies" dataType:4 requestOnly:0 fieldNumber:7 protoDataType:14 convertedType:0];
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"adaptedModelRecipeID" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  unint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isAdaptedModelUsed" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:12 convertedType:0];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isAdaptedModelCreated" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:12 convertedType:0];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"supportedBundleIDs" dataType:2 requestOnly:0 fieldNumber:11 protoDataType:13 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"peopleSuggestionsDisabled" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:2 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"reasonType" dataType:2 requestOnly:0 fieldNumber:13 protoDataType:13 convertedType:0];
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"reason" dataType:2 requestOnly:0 fieldNumber:14 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sourceBundleID" dataType:2 requestOnly:0 fieldNumber:15 protoDataType:13 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"transportBundleID" dataType:2 requestOnly:0 fieldNumber:16 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numberOfVisibleSuggestions" dataType:1 requestOnly:0 fieldNumber:17 protoDataType:0 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"trackingID" dataType:2 requestOnly:0 fieldNumber:18 protoDataType:13 convertedType:0];
  char v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"iCloudFamilyInvocation" dataType:0 requestOnly:0 fieldNumber:19 protoDataType:12 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"engagementType" dataType:0 requestOnly:0 fieldNumber:20 protoDataType:4 convertedType:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"indexSelected" dataType:0 requestOnly:0 fieldNumber:21 protoDataType:2 convertedType:0];
  v25[0] = v24;
  v25[1] = v23;
  v25[2] = v22;
  v25[3] = v13;
  v25[4] = v21;
  v25[5] = v20;
  v25[6] = v19;
  v25[7] = v18;
  v25[8] = v17;
  v25[9] = v16;
  v25[10] = v15;
  v25[11] = v2;
  v25[12] = v3;
  v25[13] = v14;
  v25[14] = v4;
  v25[15] = v5;
  v25[16] = v6;
  v25[17] = v7;
  v25[18] = v12;
  v25[19] = v8;
  v25[20] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:21];

  return v11;
}

id __31__BMShareSheetFeedback_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _photoSuggestedContactsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __31__BMShareSheetFeedback_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _locationUUIDsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMShareSheetFeedback alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[7] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end