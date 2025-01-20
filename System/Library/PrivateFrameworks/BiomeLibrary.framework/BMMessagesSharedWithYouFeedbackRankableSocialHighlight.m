@interface BMMessagesSharedWithYouFeedbackRankableSocialHighlight
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMessagesSharedWithYouFeedbackRankableSocialHighlight)initWithHighlightIdentifier:(id)a3 highlightType:(int)a4 syndicationSecondsSinceReferenceDate:(id)a5 sourceBundleID:(id)a6 applicationIdentifiers:(id)a7 resourceURL:(id)a8 sender:(id)a9 domainIdentifier:(id)a10 batchIdentifier:(id)a11 calculatedFeatures:(id)a12 clientIdentifier:(id)a13 contentCreationSecondsSinceReferenceDate:(id)a14 groupPhotoPathDigest:(id)a15 displayName:(id)a16 isPrimary:(id)a17 attributionIdentifier:(id)a18 rank:(id)a19 score:(id)a20 isConversationAutoDonating:(id)a21 originatingDeviceId:(id)a22 rankingSecondsSinceReferenceDate:(id)a23 resolvedUrl:(id)a24 clientVariant:(id)a25;
- (BMMessagesSharedWithYouFeedbackRankableSocialHighlight)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact)sender;
- (BOOL)hasContentCreationSecondsSinceReferenceDate;
- (BOOL)hasIsConversationAutoDonating;
- (BOOL)hasIsPrimary;
- (BOOL)hasRank;
- (BOOL)hasRankingSecondsSinceReferenceDate;
- (BOOL)hasScore;
- (BOOL)hasSyndicationSecondsSinceReferenceDate;
- (BOOL)isConversationAutoDonating;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrimary;
- (NSArray)applicationIdentifiers;
- (NSArray)calculatedFeatures;
- (NSString)attributionIdentifier;
- (NSString)batchIdentifier;
- (NSString)clientIdentifier;
- (NSString)clientVariant;
- (NSString)description;
- (NSString)displayName;
- (NSString)domainIdentifier;
- (NSString)groupPhotoPathDigest;
- (NSString)highlightIdentifier;
- (NSString)originatingDeviceId;
- (NSString)resolvedUrl;
- (NSString)resourceURL;
- (NSString)sourceBundleID;
- (double)contentCreationSecondsSinceReferenceDate;
- (double)rankingSecondsSinceReferenceDate;
- (double)score;
- (double)syndicationSecondsSinceReferenceDate;
- (id)_applicationIdentifiersJSONArray;
- (id)_calculatedFeaturesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)highlightType;
- (unsigned)dataVersion;
- (unsigned)rank;
- (void)setHasContentCreationSecondsSinceReferenceDate:(BOOL)a3;
- (void)setHasIsConversationAutoDonating:(BOOL)a3;
- (void)setHasIsPrimary:(BOOL)a3;
- (void)setHasRank:(BOOL)a3;
- (void)setHasRankingSecondsSinceReferenceDate:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasSyndicationSecondsSinceReferenceDate:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMessagesSharedWithYouFeedbackRankableSocialHighlight

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientVariant, 0);
  objc_storeStrong((id *)&self->_resolvedUrl, 0);
  objc_storeStrong((id *)&self->_originatingDeviceId, 0);
  objc_storeStrong((id *)&self->_attributionIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_groupPhotoPathDigest, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_calculatedFeatures, 0);
  objc_storeStrong((id *)&self->_batchIdentifier, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_resourceURL, 0);
  objc_storeStrong((id *)&self->_applicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_sourceBundleID, 0);

  objc_storeStrong((id *)&self->_highlightIdentifier, 0);
}

- (NSString)clientVariant
{
  return self->_clientVariant;
}

- (NSString)resolvedUrl
{
  return self->_resolvedUrl;
}

- (void)setHasRankingSecondsSinceReferenceDate:(BOOL)a3
{
  self->_hasRankingSecondsSinceReferenceDate = a3;
}

- (BOOL)hasRankingSecondsSinceReferenceDate
{
  return self->_hasRankingSecondsSinceReferenceDate;
}

- (double)rankingSecondsSinceReferenceDate
{
  return self->_rankingSecondsSinceReferenceDate;
}

- (NSString)originatingDeviceId
{
  return self->_originatingDeviceId;
}

- (void)setHasIsConversationAutoDonating:(BOOL)a3
{
  self->_hasIsConversationAutoDonating = a3;
}

- (BOOL)hasIsConversationAutoDonating
{
  return self->_hasIsConversationAutoDonating;
}

- (BOOL)isConversationAutoDonating
{
  return self->_isConversationAutoDonating;
}

- (void)setHasScore:(BOOL)a3
{
  self->_hasScore = a3;
}

- (BOOL)hasScore
{
  return self->_hasScore;
}

- (double)score
{
  return self->_score;
}

- (void)setHasRank:(BOOL)a3
{
  self->_hasRank = a3;
}

- (BOOL)hasRank
{
  return self->_hasRank;
}

- (unsigned)rank
{
  return self->_rank;
}

- (NSString)attributionIdentifier
{
  return self->_attributionIdentifier;
}

- (void)setHasIsPrimary:(BOOL)a3
{
  self->_hasIsPrimary = a3;
}

- (BOOL)hasIsPrimary
{
  return self->_hasIsPrimary;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)groupPhotoPathDigest
{
  return self->_groupPhotoPathDigest;
}

- (void)setHasContentCreationSecondsSinceReferenceDate:(BOOL)a3
{
  self->_hasContentCreationSecondsSinceReferenceDate = a3;
}

- (BOOL)hasContentCreationSecondsSinceReferenceDate
{
  return self->_hasContentCreationSecondsSinceReferenceDate;
}

- (double)contentCreationSecondsSinceReferenceDate
{
  return self->_contentCreationSecondsSinceReferenceDate;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSArray)calculatedFeatures
{
  return self->_calculatedFeatures;
}

- (NSString)batchIdentifier
{
  return self->_batchIdentifier;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact)sender
{
  return self->_sender;
}

- (NSString)resourceURL
{
  return self->_resourceURL;
}

- (NSArray)applicationIdentifiers
{
  return self->_applicationIdentifiers;
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (void)setHasSyndicationSecondsSinceReferenceDate:(BOOL)a3
{
  self->_hasSyndicationSecondsSinceReferenceDate = a3;
}

- (BOOL)hasSyndicationSecondsSinceReferenceDate
{
  return self->_hasSyndicationSecondsSinceReferenceDate;
}

- (double)syndicationSecondsSinceReferenceDate
{
  return self->_syndicationSecondsSinceReferenceDate;
}

- (int)highlightType
{
  return self->_highlightType;
}

- (NSString)highlightIdentifier
{
  return self->_highlightIdentifier;
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
    v6 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self highlightIdentifier];
    uint64_t v7 = [v5 highlightIdentifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self highlightIdentifier];
      v10 = [v5 highlightIdentifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_93;
      }
    }
    int v13 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self highlightType];
    if (v13 != [v5 highlightType]) {
      goto LABEL_93;
    }
    if (-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasSyndicationSecondsSinceReferenceDate](self, "hasSyndicationSecondsSinceReferenceDate")|| [v5 hasSyndicationSecondsSinceReferenceDate])
    {
      if (![(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self hasSyndicationSecondsSinceReferenceDate])goto LABEL_93; {
      if (![v5 hasSyndicationSecondsSinceReferenceDate])
      }
        goto LABEL_93;
      [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self syndicationSecondsSinceReferenceDate];
      double v15 = v14;
      [v5 syndicationSecondsSinceReferenceDate];
      if (v15 != v16) {
        goto LABEL_93;
      }
    }
    v17 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self sourceBundleID];
    uint64_t v18 = [v5 sourceBundleID];
    if (v17 == (void *)v18)
    {
    }
    else
    {
      v19 = (void *)v18;
      v20 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self sourceBundleID];
      v21 = [v5 sourceBundleID];
      int v22 = [v20 isEqual:v21];

      if (!v22) {
        goto LABEL_93;
      }
    }
    v23 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self applicationIdentifiers];
    uint64_t v24 = [v5 applicationIdentifiers];
    if (v23 == (void *)v24)
    {
    }
    else
    {
      v25 = (void *)v24;
      v26 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self applicationIdentifiers];
      v27 = [v5 applicationIdentifiers];
      int v28 = [v26 isEqual:v27];

      if (!v28) {
        goto LABEL_93;
      }
    }
    v29 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self resourceURL];
    uint64_t v30 = [v5 resourceURL];
    if (v29 == (void *)v30)
    {
    }
    else
    {
      v31 = (void *)v30;
      v32 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self resourceURL];
      v33 = [v5 resourceURL];
      int v34 = [v32 isEqual:v33];

      if (!v34) {
        goto LABEL_93;
      }
    }
    v35 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self sender];
    uint64_t v36 = [v5 sender];
    if (v35 == (void *)v36)
    {
    }
    else
    {
      v37 = (void *)v36;
      v38 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self sender];
      v39 = [v5 sender];
      int v40 = [v38 isEqual:v39];

      if (!v40) {
        goto LABEL_93;
      }
    }
    v41 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self domainIdentifier];
    uint64_t v42 = [v5 domainIdentifier];
    if (v41 == (void *)v42)
    {
    }
    else
    {
      v43 = (void *)v42;
      v44 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self domainIdentifier];
      v45 = [v5 domainIdentifier];
      int v46 = [v44 isEqual:v45];

      if (!v46) {
        goto LABEL_93;
      }
    }
    v47 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self batchIdentifier];
    uint64_t v48 = [v5 batchIdentifier];
    if (v47 == (void *)v48)
    {
    }
    else
    {
      v49 = (void *)v48;
      v50 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self batchIdentifier];
      v51 = [v5 batchIdentifier];
      int v52 = [v50 isEqual:v51];

      if (!v52) {
        goto LABEL_93;
      }
    }
    v53 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self calculatedFeatures];
    uint64_t v54 = [v5 calculatedFeatures];
    if (v53 == (void *)v54)
    {
    }
    else
    {
      v55 = (void *)v54;
      v56 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self calculatedFeatures];
      v57 = [v5 calculatedFeatures];
      int v58 = [v56 isEqual:v57];

      if (!v58) {
        goto LABEL_93;
      }
    }
    v59 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self clientIdentifier];
    uint64_t v60 = [v5 clientIdentifier];
    if (v59 == (void *)v60)
    {
    }
    else
    {
      v61 = (void *)v60;
      v62 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self clientIdentifier];
      v63 = [v5 clientIdentifier];
      int v64 = [v62 isEqual:v63];

      if (!v64) {
        goto LABEL_93;
      }
    }
    if (-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasContentCreationSecondsSinceReferenceDate](self, "hasContentCreationSecondsSinceReferenceDate")|| [v5 hasContentCreationSecondsSinceReferenceDate])
    {
      if (![(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self hasContentCreationSecondsSinceReferenceDate])goto LABEL_93; {
      if (![v5 hasContentCreationSecondsSinceReferenceDate])
      }
        goto LABEL_93;
      [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self contentCreationSecondsSinceReferenceDate];
      double v66 = v65;
      [v5 contentCreationSecondsSinceReferenceDate];
      if (v66 != v67) {
        goto LABEL_93;
      }
    }
    v68 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self groupPhotoPathDigest];
    uint64_t v69 = [v5 groupPhotoPathDigest];
    if (v68 == (void *)v69)
    {
    }
    else
    {
      v70 = (void *)v69;
      v71 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self groupPhotoPathDigest];
      v72 = [v5 groupPhotoPathDigest];
      int v73 = [v71 isEqual:v72];

      if (!v73) {
        goto LABEL_93;
      }
    }
    v74 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self displayName];
    uint64_t v75 = [v5 displayName];
    if (v74 == (void *)v75)
    {
    }
    else
    {
      v76 = (void *)v75;
      v77 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self displayName];
      v78 = [v5 displayName];
      int v79 = [v77 isEqual:v78];

      if (!v79) {
        goto LABEL_93;
      }
    }
    if ([(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self hasIsPrimary]
      || [v5 hasIsPrimary])
    {
      if (![(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self hasIsPrimary]) {
        goto LABEL_93;
      }
      if (![v5 hasIsPrimary]) {
        goto LABEL_93;
      }
      int v80 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self isPrimary];
      if (v80 != [v5 isPrimary]) {
        goto LABEL_93;
      }
    }
    v81 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self attributionIdentifier];
    uint64_t v82 = [v5 attributionIdentifier];
    if (v81 == (void *)v82)
    {
    }
    else
    {
      v83 = (void *)v82;
      v84 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self attributionIdentifier];
      v85 = [v5 attributionIdentifier];
      int v86 = [v84 isEqual:v85];

      if (!v86) {
        goto LABEL_93;
      }
    }
    if ([(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self hasRank]
      || [v5 hasRank])
    {
      if (![(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self hasRank]) {
        goto LABEL_93;
      }
      if (![v5 hasRank]) {
        goto LABEL_93;
      }
      unsigned int v87 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self rank];
      if (v87 != [v5 rank]) {
        goto LABEL_93;
      }
    }
    if ([(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self hasScore]
      || [v5 hasScore])
    {
      if (![(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self hasScore]) {
        goto LABEL_93;
      }
      if (![v5 hasScore]) {
        goto LABEL_93;
      }
      [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self score];
      double v89 = v88;
      [v5 score];
      if (v89 != v90) {
        goto LABEL_93;
      }
    }
    if (-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasIsConversationAutoDonating](self, "hasIsConversationAutoDonating")|| [v5 hasIsConversationAutoDonating])
    {
      if (![(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self hasIsConversationAutoDonating])goto LABEL_93; {
      if (![v5 hasIsConversationAutoDonating])
      }
        goto LABEL_93;
      int v91 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self isConversationAutoDonating];
      if (v91 != [v5 isConversationAutoDonating]) {
        goto LABEL_93;
      }
    }
    v92 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self originatingDeviceId];
    uint64_t v93 = [v5 originatingDeviceId];
    if (v92 == (void *)v93)
    {
    }
    else
    {
      v94 = (void *)v93;
      v95 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self originatingDeviceId];
      v96 = [v5 originatingDeviceId];
      int v97 = [v95 isEqual:v96];

      if (!v97) {
        goto LABEL_93;
      }
    }
    if (-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasRankingSecondsSinceReferenceDate](self, "hasRankingSecondsSinceReferenceDate")|| [v5 hasRankingSecondsSinceReferenceDate])
    {
      if (![(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self hasRankingSecondsSinceReferenceDate])goto LABEL_93; {
      if (![v5 hasRankingSecondsSinceReferenceDate])
      }
        goto LABEL_93;
      [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self rankingSecondsSinceReferenceDate];
      double v99 = v98;
      [v5 rankingSecondsSinceReferenceDate];
      if (v99 != v100) {
        goto LABEL_93;
      }
    }
    v101 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self resolvedUrl];
    uint64_t v102 = [v5 resolvedUrl];
    if (v101 == (void *)v102)
    {
    }
    else
    {
      v103 = (void *)v102;
      v104 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self resolvedUrl];
      v105 = [v5 resolvedUrl];
      int v106 = [v104 isEqual:v105];

      if (!v106)
      {
LABEL_93:
        char v12 = 0;
LABEL_94:

        goto LABEL_95;
      }
    }
    v108 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self clientVariant];
    v109 = [v5 clientVariant];
    if (v108 == v109)
    {
      char v12 = 1;
    }
    else
    {
      v110 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self clientVariant];
      v111 = [v5 clientVariant];
      char v12 = [v110 isEqual:v111];
    }
    goto LABEL_94;
  }
  char v12 = 0;
LABEL_95:

  return v12;
}

- (id)jsonDictionary
{
  v85[23] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self highlightIdentifier];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight highlightType](self, "highlightType"));
  if (![(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self hasSyndicationSecondsSinceReferenceDate]|| ([(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self syndicationSecondsSinceReferenceDate], fabs(v5) == INFINITY))
  {
    id v7 = 0;
  }
  else
  {
    [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self syndicationSecondsSinceReferenceDate];
    v6 = NSNumber;
    [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self syndicationSecondsSinceReferenceDate];
    objc_msgSend(v6, "numberWithDouble:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v8 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self sourceBundleID];
  uint64_t v9 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self _applicationIdentifiersJSONArray];
  uint64_t v10 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self resourceURL];
  int v11 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self sender];
  uint64_t v12 = [v11 jsonDictionary];

  v83 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self domainIdentifier];
  uint64_t v82 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self batchIdentifier];
  v81 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self _calculatedFeaturesJSONArray];
  int v80 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self clientIdentifier];
  if (![(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self hasContentCreationSecondsSinceReferenceDate]|| ([(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self contentCreationSecondsSinceReferenceDate], fabs(v13) == INFINITY))
  {
    id v79 = 0;
  }
  else
  {
    [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self contentCreationSecondsSinceReferenceDate];
    double v14 = NSNumber;
    [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self contentCreationSecondsSinceReferenceDate];
    objc_msgSend(v14, "numberWithDouble:");
    id v79 = (id)objc_claimAutoreleasedReturnValue();
  }
  v78 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self groupPhotoPathDigest];
  v77 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self displayName];
  if ([(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self hasIsPrimary])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight isPrimary](self, "isPrimary"));
    id v76 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v76 = 0;
  }
  uint64_t v75 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self attributionIdentifier];
  if ([(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self hasRank])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight rank](self, "rank"));
    id v74 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v74 = 0;
  }
  if (![(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self hasScore]
    || ([(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self score], fabs(v15) == INFINITY))
  {
    id v73 = 0;
  }
  else
  {
    [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self score];
    double v16 = NSNumber;
    [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self score];
    objc_msgSend(v16, "numberWithDouble:");
    id v73 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self hasIsConversationAutoDonating])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight isConversationAutoDonating](self, "isConversationAutoDonating"));
    id v72 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v72 = 0;
  }
  v71 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self originatingDeviceId];
  if (![(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self hasRankingSecondsSinceReferenceDate]|| ([(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self rankingSecondsSinceReferenceDate], fabs(v17) == INFINITY))
  {
    id v70 = 0;
  }
  else
  {
    [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self rankingSecondsSinceReferenceDate];
    uint64_t v18 = NSNumber;
    [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self rankingSecondsSinceReferenceDate];
    objc_msgSend(v18, "numberWithDouble:");
    id v70 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v69 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self resolvedUrl];
  v19 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self clientVariant];
  v84[0] = @"highlightIdentifier";
  uint64_t v20 = v3;
  if (!v3)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v57 = (void *)v20;
  v85[0] = v20;
  v84[1] = @"highlightType";
  uint64_t v21 = v4;
  if (!v4)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v56 = (void *)v21;
  v85[1] = v21;
  v84[2] = @"syndicationSecondsSinceReferenceDate";
  uint64_t v22 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v55 = (void *)v22;
  v85[2] = v22;
  v84[3] = @"sourceBundleID";
  uint64_t v23 = v8;
  if (!v8)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v54 = (void *)v23;
  v85[3] = v23;
  v84[4] = @"applicationIdentifiers";
  uint64_t v24 = v9;
  if (!v9)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v53 = (void *)v24;
  v85[4] = v24;
  v84[5] = @"resourceURL";
  uint64_t v25 = v10;
  if (!v10)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  int v52 = (void *)v25;
  v85[5] = v25;
  v84[6] = @"sender";
  uint64_t v26 = v12;
  if (!v12)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v51 = (void *)v26;
  v85[6] = v26;
  v84[7] = @"domainIdentifier";
  uint64_t v27 = (uint64_t)v83;
  if (!v83)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v85[7] = v27;
  v84[8] = @"batchIdentifier";
  uint64_t v28 = (uint64_t)v82;
  if (!v82)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v85[8] = v28;
  v84[9] = @"calculatedFeatures";
  uint64_t v29 = (uint64_t)v81;
  if (!v81)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v62 = (void *)v29;
  v85[9] = v29;
  v84[10] = @"clientIdentifier";
  uint64_t v30 = (uint64_t)v80;
  if (!v80)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v61 = (void *)v30;
  v85[10] = v30;
  v84[11] = @"contentCreationSecondsSinceReferenceDate";
  uint64_t v31 = (uint64_t)v79;
  if (!v79)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v60 = (void *)v31;
  v85[11] = v31;
  v84[12] = @"groupPhotoPathDigest";
  uint64_t v32 = (uint64_t)v78;
  if (!v78)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  double v66 = (void *)v8;
  v85[12] = v32;
  v84[13] = @"displayName";
  uint64_t v33 = (uint64_t)v77;
  int v34 = (void *)v32;
  if (!v77)
  {
    uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
  }
  int v64 = (void *)v12;
  v59 = (void *)v33;
  v85[13] = v33;
  v84[14] = @"isPrimary";
  uint64_t v35 = (uint64_t)v76;
  if (!v76)
  {
    uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
  }
  double v65 = (void *)v10;
  uint64_t v46 = v35;
  v85[14] = v35;
  v84[15] = @"attributionIdentifier";
  uint64_t v36 = v75;
  if (!v75)
  {
    uint64_t v36 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v35);
  }
  double v67 = v7;
  v85[15] = v36;
  v84[16] = @"rank";
  v37 = v74;
  if (!v74)
  {
    v37 = [MEMORY[0x1E4F1CA98] null];
  }
  v68 = (void *)v3;
  v85[16] = v37;
  v84[17] = @"score";
  v38 = v73;
  if (!v73)
  {
    v38 = [MEMORY[0x1E4F1CA98] null];
  }
  v63 = (void *)v4;
  v85[17] = v38;
  v84[18] = @"isConversationAutoDonating";
  v39 = v72;
  if (!v72)
  {
    v39 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v48 = v34;
  v50 = (void *)v27;
  v85[18] = v39;
  v84[19] = @"originatingDeviceId";
  int v40 = v71;
  if (!v71)
  {
    int v40 = [MEMORY[0x1E4F1CA98] null];
  }
  v41 = (void *)v9;
  v85[19] = v40;
  v84[20] = @"rankingSecondsSinceReferenceDate";
  uint64_t v42 = v70;
  if (!v70)
  {
    uint64_t v42 = [MEMORY[0x1E4F1CA98] null];
  }
  v49 = (void *)v28;
  v85[20] = v42;
  v84[21] = @"resolvedUrl";
  v43 = v69;
  if (!v69)
  {
    v43 = [MEMORY[0x1E4F1CA98] null];
  }
  v85[21] = v43;
  v84[22] = @"clientVariant";
  v44 = v19;
  if (!v19)
  {
    v44 = [MEMORY[0x1E4F1CA98] null];
  }
  v85[22] = v44;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v85, v84, 23, v46);
  id v58 = (id)objc_claimAutoreleasedReturnValue();
  if (!v19) {

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
  if (!v80)
  }

  if (!v81) {
  if (!v82)
  }

  if (v83)
  {
    if (v64) {
      goto LABEL_104;
    }
  }
  else
  {

    if (v64)
    {
LABEL_104:
      if (v65) {
        goto LABEL_105;
      }
      goto LABEL_115;
    }
  }

  if (v65)
  {
LABEL_105:
    if (v41) {
      goto LABEL_106;
    }
    goto LABEL_116;
  }
LABEL_115:

  if (v41)
  {
LABEL_106:
    if (v66) {
      goto LABEL_107;
    }
    goto LABEL_117;
  }
LABEL_116:

  if (v66)
  {
LABEL_107:
    if (v67) {
      goto LABEL_108;
    }
    goto LABEL_118;
  }
LABEL_117:

  if (v67)
  {
LABEL_108:
    if (v63) {
      goto LABEL_109;
    }
LABEL_119:

    if (v68) {
      goto LABEL_110;
    }
    goto LABEL_120;
  }
LABEL_118:

  if (!v63) {
    goto LABEL_119;
  }
LABEL_109:
  if (v68) {
    goto LABEL_110;
  }
LABEL_120:

LABEL_110:

  return v58;
}

- (id)_calculatedFeaturesJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self calculatedFeatures];
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
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_applicationIdentifiersJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self applicationIdentifiers];
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

- (BMMessagesSharedWithYouFeedbackRankableSocialHighlight)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v323[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"highlightIdentifier"];
  v253 = self;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_4:
    v254 = [v6 objectForKeyedSubscript:@"highlightType"];
    if (!v254 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v250 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v250 = v254;
LABEL_15:

LABEL_16:
      uint64_t v18 = [v6 objectForKeyedSubscript:@"syndicationSecondsSinceReferenceDate"];
      v251 = a4;
      if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v252 = 0;
LABEL_19:
        v19 = [v6 objectForKeyedSubscript:@"sourceBundleID"];
        v248 = v7;
        if (!v19)
        {
          uint64_t v21 = v6;
          uint64_t v22 = v18;
          id v20 = v8;
          goto LABEL_23;
        }
        id v20 = v8;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v21 = v6;
          uint64_t v22 = v18;
LABEL_23:
          id v23 = 0;
LABEL_24:
          uint64_t v24 = v21;
          id v25 = [v21 objectForKeyedSubscript:@"applicationIdentifiers"];
          uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
          int v27 = [v25 isEqual:v26];

          v249 = v20;
          id v246 = v23;
          v247 = v22;
          if (v27)
          {

            id v25 = 0;
LABEL_35:
            v255 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v25, "count"));
            long long v264 = 0u;
            long long v265 = 0u;
            long long v266 = 0u;
            long long v267 = 0u;
            id v25 = v25;
            uint64_t v38 = [v25 countByEnumeratingWithState:&v264 objects:v313 count:16];
            if (!v38) {
              goto LABEL_44;
            }
            uint64_t v39 = v38;
            uint64_t v40 = *(void *)v265;
            while (1)
            {
              uint64_t v29 = v19;
              for (uint64_t i = 0; i != v39; ++i)
              {
                if (*(void *)v265 != v40) {
                  objc_enumerationMutation(v25);
                }
                uint64_t v42 = *(void **)(*((void *)&v264 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v46 = v251;
                  if (v251)
                  {
                    id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v48 = *MEMORY[0x1E4F502C8];
                    uint64_t v311 = *MEMORY[0x1E4F28568];
                    v245 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"applicationIdentifiers"];
                    v312 = v245;
                    v49 = (void *)MEMORY[0x1E4F1C9E8];
                    v50 = &v312;
                    v51 = &v311;
LABEL_51:
                    uint64_t v52 = [v49 dictionaryWithObjects:v50 forKeys:v51 count:1];
                    v53 = v47;
                    uint64_t v54 = (void *)v52;
                    id v8 = v249;
                    long long v14 = v250;
                    id v55 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v48, 2);
                    uint64_t v16 = 0;
                    *uint64_t v46 = v55;
                    v56 = v25;
                    id v6 = v24;
                    goto LABEL_264;
                  }
LABEL_52:
                  uint64_t v16 = 0;
                  v56 = v25;
                  id v6 = v24;
                  id v8 = v249;
                  long long v14 = v250;
                  uint64_t v28 = v246;
                  uint64_t v18 = v247;
                  goto LABEL_267;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  uint64_t v46 = v251;
                  if (v251)
                  {
                    id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v48 = *MEMORY[0x1E4F502C8];
                    uint64_t v309 = *MEMORY[0x1E4F28568];
                    v245 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"applicationIdentifiers"];
                    v310 = v245;
                    v49 = (void *)MEMORY[0x1E4F1C9E8];
                    v50 = &v310;
                    v51 = &v309;
                    goto LABEL_51;
                  }
                  goto LABEL_52;
                }
                id v43 = v42;
                [v255 addObject:v43];
              }
              uint64_t v39 = [v25 countByEnumeratingWithState:&v264 objects:v313 count:16];
              if (!v39)
              {
LABEL_44:

                id v6 = v24;
                uint64_t v44 = [v24 objectForKeyedSubscript:@"resourceURL"];
                id v240 = v25;
                v245 = (void *)v44;
                if (v44)
                {
                  v45 = (void *)v44;
                  objc_opt_class();
                  uint64_t v18 = v247;
                  if (objc_opt_isKindOfClass())
                  {
                    id v239 = 0;
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if (v251)
                      {
                        id v87 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v88 = *MEMORY[0x1E4F502C8];
                        uint64_t v307 = *MEMORY[0x1E4F28568];
                        id v79 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"resourceURL"];
                        id v308 = v79;
                        id v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v308 forKeys:&v307 count:1];
                        id v89 = (id)[v87 initWithDomain:v88 code:2 userInfo:v72];
                        uint64_t v16 = 0;
                        v56 = 0;
                        id *v251 = v89;
                        id v8 = v249;
                        long long v14 = v250;
                        goto LABEL_263;
                      }
                      v56 = 0;
                      uint64_t v16 = 0;
                      id v8 = v249;
                      long long v14 = v250;
                      uint64_t v29 = v19;
                      goto LABEL_266;
                    }
                    id v239 = v45;
                  }
                }
                else
                {
                  id v239 = 0;
                  uint64_t v18 = v247;
                }
                v71 = [v6 objectForKeyedSubscript:@"sender"];
                id v8 = v249;
                if (v71)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v79 = v71;
                      int v80 = [BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact alloc];
                      id v263 = 0;
                      id v72 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *)v80 initWithJSONDictionary:v79 error:&v263];
                      id v81 = v263;
                      if (!v81)
                      {
                        v235 = v71;

                        goto LABEL_66;
                      }
                      uint64_t v82 = v81;
                      long long v14 = v250;
                      if (v251) {
                        id *v251 = v81;
                      }

                      uint64_t v16 = 0;
                      id v8 = v249;
                    }
                    else
                    {
                      uint64_t v54 = v71;
                      if (!v251)
                      {
                        uint64_t v16 = 0;
                        long long v14 = v250;
                        v56 = v239;
                        goto LABEL_265;
                      }
                      id v90 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v91 = *MEMORY[0x1E4F502C8];
                      uint64_t v305 = *MEMORY[0x1E4F28568];
                      id v72 = (BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"sender"];
                      v306 = v72;
                      v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v306 forKeys:&v305 count:1];
                      id v8 = v249;
                      id *v251 = (id)[v90 initWithDomain:v91 code:2 userInfo:v92];

                      uint64_t v16 = 0;
                      id v79 = v71;
                      long long v14 = v250;
                    }
                    v56 = v239;
                    goto LABEL_263;
                  }
                }
                v235 = v71;
                id v72 = 0;
LABEL_66:
                uint64_t v73 = [v6 objectForKeyedSubscript:@"domainIdentifier"];
                v238 = (void *)v73;
                if (v73 && (id v74 = (void *)v73, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (v251)
                    {
                      id v93 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v94 = *MEMORY[0x1E4F502C8];
                      uint64_t v303 = *MEMORY[0x1E4F28568];
                      uint64_t v95 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"domainIdentifier"];
                      uint64_t v304 = v95;
                      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v304 forKeys:&v303 count:1];
                      v234 = v96 = (void *)v95;
                      id v97 = (id)objc_msgSend(v93, "initWithDomain:code:userInfo:", v94, 2);
                      uint64_t v16 = 0;
                      double v98 = 0;
                      id *v251 = v97;
                      double v99 = v249;
                      long long v14 = v250;
                      v56 = v239;
                      goto LABEL_261;
                    }
                    uint64_t v16 = 0;
                    double v98 = 0;
                    double v99 = v249;
                    long long v14 = v250;
                    v56 = v239;
                    goto LABEL_262;
                  }
                  id v233 = v74;
                }
                else
                {
                  id v233 = 0;
                }
                uint64_t v75 = v251;
                uint64_t v76 = [v6 objectForKeyedSubscript:@"batchIdentifier"];
                v234 = (void *)v76;
                if (v76)
                {
                  v77 = (void *)v76;
                  v78 = v72;
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if (v251)
                      {
                        id v125 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v126 = *MEMORY[0x1E4F502C8];
                        uint64_t v301 = *MEMORY[0x1E4F28568];
                        id obj = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"batchIdentifier"];
                        id v302 = obj;
                        v242 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v302 forKeys:&v301 count:1];
                        id v127 = (id)[v125 initWithDomain:v126 code:2 userInfo:v242];
                        uint64_t v16 = 0;
                        id v232 = 0;
                        id *v251 = v127;
                        double v99 = v249;
                        long long v14 = v250;
                        v56 = v239;
                        goto LABEL_259;
                      }
                      v96 = 0;
                      uint64_t v16 = 0;
                      double v99 = v249;
                      long long v14 = v250;
                      v56 = v239;
                      double v98 = v233;
                      goto LABEL_261;
                    }
                    id v232 = v77;
LABEL_82:
                    v83 = [v6 objectForKeyedSubscript:@"calculatedFeatures"];
                    v84 = [MEMORY[0x1E4F1CA98] null];
                    int v85 = [v83 isEqual:v84];

                    if (v85)
                    {
                      v231 = v78;
                      v244 = v6;

                      goto LABEL_99;
                    }
                    if (v83)
                    {
                      objc_opt_class();
                      id obj = v83;
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        id v72 = v78;
                        if (v251)
                        {
                          id v135 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v136 = *MEMORY[0x1E4F502C8];
                          uint64_t v299 = *MEMORY[0x1E4F28568];
                          v242 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"calculatedFeatures"];
                          v300 = v242;
                          uint64_t v137 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v300 forKeys:&v299 count:1];
                          uint64_t v138 = v136;
                          v139 = (void *)v137;
                          uint64_t v16 = 0;
                          id *v251 = (id)[v135 initWithDomain:v138 code:2 userInfo:v137];
                          double v99 = v249;
                          long long v14 = v250;
                          v56 = v239;
                          goto LABEL_258;
                        }
                        uint64_t v16 = 0;
                        double v99 = v249;
                        long long v14 = v250;
                        v56 = v239;
                        double v98 = v233;
                        goto LABEL_260;
                      }
                      v231 = v78;
                      v244 = v6;
                      int v86 = v83;
                    }
                    else
                    {
                      v231 = v78;
                      v244 = v6;
LABEL_99:
                      int v86 = 0;
                    }
                    v242 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v86, "count"));
                    long long v259 = 0u;
                    long long v260 = 0u;
                    long long v261 = 0u;
                    long long v262 = 0u;
                    id obj = v86;
                    uint64_t v100 = [obj countByEnumeratingWithState:&v259 objects:v298 count:16];
                    id v101 = v246;
                    if (!v100) {
                      goto LABEL_110;
                    }
                    uint64_t v102 = v100;
                    uint64_t v103 = *(void *)v260;
                    v236 = v19;
                    v104 = v249;
LABEL_102:
                    uint64_t v105 = 0;
                    while (1)
                    {
                      if (*(void *)v260 != v103) {
                        objc_enumerationMutation(obj);
                      }
                      int v106 = *(void **)(*((void *)&v259 + 1) + 8 * v105);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass()) {
                        break;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        v128 = v251;
                        if (v251)
                        {
                          id v129 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v130 = *MEMORY[0x1E4F502C8];
                          uint64_t v294 = *MEMORY[0x1E4F28568];
                          id v107 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"calculatedFeatures"];
                          id v295 = v107;
                          v131 = (void *)MEMORY[0x1E4F1C9E8];
                          v132 = &v295;
                          v133 = &v294;
                          goto LABEL_140;
                        }
                        goto LABEL_147;
                      }
                      id v107 = v106;
                      v108 = [BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature alloc];
                      id v258 = 0;
                      v109 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature *)v108 initWithJSONDictionary:v107 error:&v258];
                      id v110 = v258;
                      if (v110)
                      {
                        id v134 = v110;
                        if (v251) {
                          id *v251 = v110;
                        }
                        id v229 = v134;

                        uint64_t v16 = 0;
                        goto LABEL_144;
                      }
                      [v242 addObject:v109];

                      if (v102 == ++v105)
                      {
                        uint64_t v102 = [obj countByEnumeratingWithState:&v259 objects:v298 count:16];
                        v19 = v236;
                        id v101 = v246;
                        uint64_t v75 = v251;
                        if (v102) {
                          goto LABEL_102;
                        }
LABEL_110:

                        id v6 = v244;
                        id v107 = [v244 objectForKeyedSubscript:@"clientIdentifier"];
                        if (v107 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                        {
                          v140 = v19;
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v230 = v107;
                            uint64_t v75 = v251;
                            id v101 = v246;
                            goto LABEL_113;
                          }
                          if (!v251)
                          {
                            id v230 = 0;
                            uint64_t v16 = 0;
                            long long v14 = v250;
                            double v99 = v249;
                            v56 = v239;
                            id v72 = v231;
                            goto LABEL_257;
                          }
                          id v141 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v142 = *MEMORY[0x1E4F502C8];
                          uint64_t v292 = *MEMORY[0x1E4F28568];
                          id v229 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"clientIdentifier"];
                          id v293 = v229;
                          v228 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v293 forKeys:&v292 count:1];
                          uint64_t v16 = 0;
                          id v230 = 0;
                          id *v251 = (id)objc_msgSend(v141, "initWithDomain:code:userInfo:", v142, 2);
                          long long v14 = v250;
                          v19 = v140;
                          v104 = v249;
                        }
                        else
                        {
                          id v230 = 0;
LABEL_113:
                          uint64_t v111 = [v244 objectForKeyedSubscript:@"contentCreationSecondsSinceReferenceDate"];
                          v228 = (void *)v111;
                          if (!v111 || (v112 = (void *)v111, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v229 = 0;
LABEL_116:
                            uint64_t v113 = [v244 objectForKeyedSubscript:@"groupPhotoPathDigest"];
                            v237 = v19;
                            v227 = (void *)v113;
                            if (v113)
                            {
                              v114 = (void *)v113;
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                              {
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v222 = v114;
                                  goto LABEL_119;
                                }
                                if (v75)
                                {
                                  id v152 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  uint64_t v153 = *MEMORY[0x1E4F502C8];
                                  uint64_t v288 = *MEMORY[0x1E4F28568];
                                  v104 = v249;
                                  v226 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"groupPhotoPathDigest"];
                                  v289 = v226;
                                  v225 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v289 forKeys:&v288 count:1];
                                  id v154 = (id)objc_msgSend(v152, "initWithDomain:code:userInfo:", v153, 2);
                                  uint64_t v16 = 0;
                                  v150 = 0;
                                  *uint64_t v75 = v154;
                                  long long v14 = v250;
                                  v19 = v237;
                                  v56 = v239;
                                  id v72 = v231;
                                  goto LABEL_253;
                                }
                                uint64_t v16 = 0;
                                v104 = v249;
                                long long v14 = v250;
                                v56 = v239;
                                id v72 = v231;
                                v150 = 0;
                                goto LABEL_254;
                              }
                            }
                            id v222 = 0;
LABEL_119:
                            uint64_t v115 = [v244 objectForKeyedSubscript:@"displayName"];
                            v225 = (void *)v115;
                            if (v115 && (v116 = (void *)v115, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                            {
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v117 = v116;
                                goto LABEL_122;
                              }
                              if (!v75)
                              {
                                v226 = 0;
                                uint64_t v16 = 0;
                                v104 = v249;
                                long long v14 = v250;
                                v56 = v239;
                                id v72 = v231;
                                v150 = v222;
                                goto LABEL_253;
                              }
                              id v159 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v160 = *MEMORY[0x1E4F502C8];
                              uint64_t v286 = *MEMORY[0x1E4F28568];
                              v104 = v249;
                              id v223 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"displayName"];
                              id v287 = v223;
                              v221 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v287 forKeys:&v286 count:1];
                              id v161 = (id)objc_msgSend(v159, "initWithDomain:code:userInfo:", v160, 2);
                              uint64_t v16 = 0;
                              v226 = 0;
                              *uint64_t v75 = v161;
                              long long v14 = v250;
                              v19 = v237;
                            }
                            else
                            {
                              id v117 = 0;
LABEL_122:
                              uint64_t v118 = [v244 objectForKeyedSubscript:@"isPrimary"];
                              v226 = v117;
                              v221 = (void *)v118;
                              if (!v118 || (v119 = (void *)v118, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v223 = 0;
LABEL_125:
                                uint64_t v120 = [v244 objectForKeyedSubscript:@"attributionIdentifier"];
                                v219 = (void *)v120;
                                if (!v120
                                  || (v121 = (void *)v120, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  id v220 = 0;
LABEL_128:
                                  uint64_t v122 = [v244 objectForKeyedSubscript:@"rank"];
                                  v216 = (void *)v122;
                                  if (!v122
                                    || (v123 = (void *)v122, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    id v217 = 0;
                                    goto LABEL_131;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v217 = v123;
LABEL_131:
                                    id v124 = [v244 objectForKeyedSubscript:@"score"];
                                    v213 = v124;
                                    if (v124)
                                    {
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v124 = 0;
                                        goto LABEL_176;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v124 = v124;
                                        goto LABEL_176;
                                      }
                                      if (v251)
                                      {
                                        id v215 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v210 = *MEMORY[0x1E4F502C8];
                                        uint64_t v278 = *MEMORY[0x1E4F28568];
                                        id v72 = v231;
                                        v104 = v249;
                                        id v211 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"score"];
                                        id v279 = v211;
                                        v155 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v279 forKeys:&v278 count:1];
                                        id v176 = (id)[v215 initWithDomain:v210 code:2 userInfo:v155];
                                        v173 = 0;
                                        v214 = 0;
                                        id *v251 = v176;
                                        v56 = v239;
                                        goto LABEL_237;
                                      }
                                      v214 = 0;
                                      uint64_t v16 = 0;
                                      v104 = v249;
                                      long long v14 = v250;
                                      v56 = v239;
                                      id v72 = v231;
LABEL_235:
                                      v150 = v222;
LABEL_249:

LABEL_250:
LABEL_251:

LABEL_252:
LABEL_253:

LABEL_254:
LABEL_255:

LABEL_256:
                                      double v99 = v104;

LABEL_257:
                                      v139 = v230;
LABEL_258:

LABEL_259:
                                      double v98 = v233;

LABEL_260:
                                      v96 = v232;
LABEL_261:

LABEL_262:
                                      id v79 = v235;
                                      id v8 = v99;
LABEL_263:

                                      uint64_t v54 = v79;
                                      id v25 = v240;
LABEL_264:
                                      uint64_t v18 = v247;
LABEL_265:
                                      uint64_t v29 = v19;

LABEL_266:
                                      uint64_t v28 = v246;

LABEL_267:
                                      goto LABEL_268;
                                    }
LABEL_176:
                                    v155 = [v244 objectForKeyedSubscript:@"isConversationAutoDonating"];
                                    v214 = v124;
                                    if (v155)
                                    {
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                      {
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          v205 = v155;
                                          id v211 = v155;
                                          goto LABEL_179;
                                        }
                                        if (v251)
                                        {
                                          id v212 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          uint64_t v208 = *MEMORY[0x1E4F502C8];
                                          uint64_t v276 = *MEMORY[0x1E4F28568];
                                          id v72 = v231;
                                          v104 = v249;
                                          id v209 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isConversationAutoDonating"];
                                          id v277 = v209;
                                          uint64_t v179 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v277 forKeys:&v276 count:1];
                                          uint64_t v180 = v208;
                                          v207 = (void *)v179;
                                          id v181 = (id)objc_msgSend(v212, "initWithDomain:code:userInfo:", v180, 2);
                                          v173 = 0;
                                          id v211 = 0;
                                          id *v251 = v181;
                                          v56 = v239;
                                          v150 = v222;
                                          goto LABEL_247;
                                        }
                                        id v211 = 0;
                                        v173 = 0;
                                        v56 = v239;
                                        v104 = v249;
                                        id v72 = v231;
LABEL_237:
                                        v150 = v222;
                                        goto LABEL_248;
                                      }
                                    }
                                    v205 = v155;
                                    id v211 = 0;
LABEL_179:
                                    uint64_t v156 = [v244 objectForKeyedSubscript:@"originatingDeviceId"];
                                    v207 = (void *)v156;
                                    if (!v156
                                      || (v157 = (void *)v156, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      id v209 = 0;
                                      goto LABEL_182;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (v251)
                                      {
                                        id v182 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v183 = *MEMORY[0x1E4F502C8];
                                        uint64_t v274 = *MEMORY[0x1E4F28568];
                                        v104 = v249;
                                        v202 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"originatingDeviceId"];
                                        v275 = v202;
                                        v204 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v275 forKeys:&v274 count:1];
                                        v173 = 0;
                                        id v209 = 0;
                                        id *v251 = (id)objc_msgSend(v182, "initWithDomain:code:userInfo:", v183, 2);
                                        v19 = v237;
                                        v56 = v239;
                                        v150 = v222;
                                        v155 = v205;
                                        goto LABEL_246;
                                      }
                                      id v209 = 0;
                                      v173 = 0;
                                      v56 = v239;
                                      v104 = v249;
                                      id v72 = v231;
                                      v150 = v222;
                                      v155 = v205;
                                      goto LABEL_247;
                                    }
                                    id v209 = v157;
LABEL_182:
                                    id v158 = [v244 objectForKeyedSubscript:@"rankingSecondsSinceReferenceDate"];
                                    v155 = v205;
                                    v204 = v158;
                                    if (v158)
                                    {
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v158 = 0;
                                        goto LABEL_198;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v158 = v158;
                                        goto LABEL_198;
                                      }
                                      if (v251)
                                      {
                                        id v203 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v201 = *MEMORY[0x1E4F502C8];
                                        uint64_t v272 = *MEMORY[0x1E4F28568];
                                        v104 = v249;
                                        id v206 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"rankingSecondsSinceReferenceDate"];
                                        id v273 = v206;
                                        uint64_t v184 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v273 forKeys:&v272 count:1];
                                        uint64_t v185 = v201;
                                        v200 = (void *)v184;
                                        id v186 = (id)objc_msgSend(v203, "initWithDomain:code:userInfo:", v185, 2);
                                        v173 = 0;
                                        v202 = 0;
                                        id *v251 = v186;
                                        v56 = v239;
                                        goto LABEL_241;
                                      }
                                      v202 = 0;
                                      v173 = 0;
                                      v56 = v239;
                                      v104 = v249;
                                      v150 = v222;
LABEL_246:

                                      id v72 = v231;
LABEL_247:

LABEL_248:
                                      uint64_t v16 = v173;
                                      long long v14 = v250;
                                      goto LABEL_249;
                                    }
LABEL_198:
                                    uint64_t v167 = [v244 objectForKeyedSubscript:@"resolvedUrl"];
                                    v200 = (void *)v167;
                                    v202 = v158;
                                    if (v167
                                      && (v168 = (void *)v167, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                    {
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v206 = v168;
                                        goto LABEL_201;
                                      }
                                      if (!v251)
                                      {
                                        id v206 = 0;
                                        v173 = 0;
                                        v56 = v239;
                                        v104 = v249;
LABEL_241:
                                        v150 = v222;
                                        goto LABEL_245;
                                      }
                                      id v187 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v188 = *MEMORY[0x1E4F502C8];
                                      uint64_t v270 = *MEMORY[0x1E4F28568];
                                      v104 = v249;
                                      id v171 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"resolvedUrl"];
                                      id v271 = v171;
                                      v199 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v271 forKeys:&v270 count:1];
                                      id v189 = (id)objc_msgSend(v187, "initWithDomain:code:userInfo:", v188, 2);
                                      v173 = 0;
                                      id v206 = 0;
                                      id *v251 = v189;
LABEL_233:
                                      v19 = v237;
                                      v56 = v239;
                                    }
                                    else
                                    {
                                      id v206 = 0;
LABEL_201:
                                      uint64_t v169 = [v244 objectForKeyedSubscript:@"clientVariant"];
                                      v199 = (void *)v169;
                                      if (!v169
                                        || (v170 = (void *)v169, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        id v171 = 0;
                                        v172 = v250;
                                        goto LABEL_204;
                                      }
                                      objc_opt_class();
                                      char isKindOfClass = objc_opt_isKindOfClass();
                                      v178 = v170;
                                      v172 = v250;
                                      if (isKindOfClass)
                                      {
                                        id v171 = v178;
LABEL_204:
                                        id v250 = v172;
                                        id v197 = v158;
                                        v150 = v222;
                                        v104 = v249;
                                        v56 = v239;
                                        v253 = objc_retain(-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight initWithHighlightIdentifier:highlightType:syndicationSecondsSinceReferenceDate:sourceBundleID:applicationIdentifiers:resourceURL:sender:domainIdentifier:batchIdentifier:calculatedFeatures:clientIdentifier:contentCreationSecondsSinceReferenceDate:groupPhotoPathDigest:displayName:isPrimary:attributionIdentifier:rank:score:isConversationAutoDonating:originatingDeviceId:rankingSecondsSinceReferenceDate:resolvedUrl:clientVariant:](v253, "initWithHighlightIdentifier:highlightType:syndicationSecondsSinceReferenceDate:sourceBundleID:applicationIdentifiers:resourceURL:sender:domainIdentifier:batchIdentifier:calculatedFeatures:clientIdentifier:contentCreationSecondsSinceReferenceDate:groupPhotoPathDigest:displayName:isPrimary:attributionIdentifier:rank:score:isConversationAutoDonating:originatingDeviceId:rankingSecondsSinceReferenceDate:resolvedUrl:clientVariant:", v249, [v172 intValue], v252, v101, v255, v239, v231, v233, v232, v242, v230,
                                                   v229,
                                                   v222,
                                                   v226,
                                                   v223,
                                                   v220,
                                                   v217,
                                                   v214,
                                                   v211,
                                                   v209,
                                                   v197,
                                                   v206,
                                                   v171));
                                        v173 = v253;
LABEL_244:

LABEL_245:
                                        goto LABEL_246;
                                      }
                                      if (v251)
                                      {
                                        id v198 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v190 = *MEMORY[0x1E4F502C8];
                                        uint64_t v268 = *MEMORY[0x1E4F28568];
                                        v191 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"clientVariant"];
                                        v269 = v191;
                                        v192 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v269 forKeys:&v268 count:1];
                                        id *v251 = (id)[v198 initWithDomain:v190 code:2 userInfo:v192];

                                        v104 = v249;
                                        id v171 = 0;
                                        v173 = 0;
                                        goto LABEL_233;
                                      }
                                      id v171 = 0;
                                      v173 = 0;
                                      v56 = v239;
                                      v104 = v249;
                                    }
                                    v150 = v222;
                                    goto LABEL_244;
                                  }
                                  if (v251)
                                  {
                                    id v174 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v218 = *MEMORY[0x1E4F502C8];
                                    uint64_t v280 = *MEMORY[0x1E4F28568];
                                    id v72 = v231;
                                    v104 = v249;
                                    v214 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"rank"];
                                    v281 = v214;
                                    v213 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v281 forKeys:&v280 count:1];
                                    id v175 = (id)objc_msgSend(v174, "initWithDomain:code:userInfo:", v218, 2);
                                    uint64_t v16 = 0;
                                    id v217 = 0;
                                    long long v14 = v250;
                                    id *v251 = v175;
                                    v56 = v239;
                                    goto LABEL_235;
                                  }
                                  id v217 = 0;
                                  uint64_t v16 = 0;
                                  v104 = v249;
                                  long long v14 = v250;
LABEL_230:
                                  v56 = v239;
                                  id v72 = v231;
                                  v150 = v222;
                                  goto LABEL_250;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v220 = v121;
                                  goto LABEL_128;
                                }
                                if (v251)
                                {
                                  id v164 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  uint64_t v165 = *MEMORY[0x1E4F502C8];
                                  uint64_t v282 = *MEMORY[0x1E4F28568];
                                  v104 = v249;
                                  id v217 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"attributionIdentifier"];
                                  id v283 = v217;
                                  v216 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v283 forKeys:&v282 count:1];
                                  id v166 = (id)objc_msgSend(v164, "initWithDomain:code:userInfo:", v165, 2);
                                  uint64_t v16 = 0;
                                  id v220 = 0;
                                  id *v251 = v166;
                                  long long v14 = v250;
                                  v19 = v237;
                                  goto LABEL_230;
                                }
                                id v220 = 0;
                                uint64_t v16 = 0;
                                v104 = v249;
                                long long v14 = v250;
                                v56 = v239;
                                id v72 = v231;
LABEL_226:
                                v150 = v222;
                                goto LABEL_251;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v223 = v119;
                                goto LABEL_125;
                              }
                              if (v251)
                              {
                                id v162 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v224 = *MEMORY[0x1E4F502C8];
                                uint64_t v284 = *MEMORY[0x1E4F28568];
                                id v72 = v231;
                                v104 = v249;
                                id v220 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isPrimary"];
                                id v285 = v220;
                                v219 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v285 forKeys:&v284 count:1];
                                id v163 = (id)objc_msgSend(v162, "initWithDomain:code:userInfo:", v224, 2);
                                uint64_t v16 = 0;
                                id v223 = 0;
                                long long v14 = v250;
                                id *v251 = v163;
                                v56 = v239;
                                goto LABEL_226;
                              }
                              id v223 = 0;
                              uint64_t v16 = 0;
                              v104 = v249;
                              long long v14 = v250;
                            }
                            v56 = v239;
                            id v72 = v231;
                            v150 = v222;
                            goto LABEL_252;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v229 = v112;
                            goto LABEL_116;
                          }
                          if (v75)
                          {
                            v143 = v75;
                            id v144 = objc_alloc(MEMORY[0x1E4F28C58]);
                            v145 = v19;
                            uint64_t v146 = *MEMORY[0x1E4F502C8];
                            uint64_t v290 = *MEMORY[0x1E4F28568];
                            uint64_t v147 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"contentCreationSecondsSinceReferenceDate"];
                            uint64_t v291 = v147;
                            uint64_t v148 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v291 forKeys:&v290 count:1];
                            v149 = v144;
                            v150 = (void *)v147;
                            v104 = v249;
                            uint64_t v151 = v146;
                            v19 = v145;
                            v227 = (void *)v148;
                            uint64_t v16 = 0;
                            id v229 = 0;
                            id *v143 = (id)objc_msgSend(v149, "initWithDomain:code:userInfo:", v151, 2);
                            long long v14 = v250;
                            v56 = v239;
                            id v72 = v231;
                            goto LABEL_254;
                          }
                          id v229 = 0;
                          uint64_t v16 = 0;
                          v104 = v249;
                          long long v14 = v250;
                        }
                        v56 = v239;
                        id v72 = v231;
                        goto LABEL_255;
                      }
                    }
                    v128 = v251;
                    if (v251)
                    {
                      id v129 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v130 = *MEMORY[0x1E4F502C8];
                      uint64_t v296 = *MEMORY[0x1E4F28568];
                      id v107 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"calculatedFeatures"];
                      id v297 = v107;
                      v131 = (void *)MEMORY[0x1E4F1C9E8];
                      v132 = &v297;
                      v133 = &v296;
LABEL_140:
                      id v229 = [v131 dictionaryWithObjects:v132 forKeys:v133 count:1];
                      uint64_t v16 = 0;
                      id *v128 = (id)objc_msgSend(v129, "initWithDomain:code:userInfo:", v130, 2);
LABEL_144:
                      id v230 = obj;
                      id v6 = v244;
                      long long v14 = v250;
                      v19 = v236;
                      v56 = v239;
                      id v72 = v231;
                      goto LABEL_256;
                    }
LABEL_147:
                    uint64_t v16 = 0;
                    v139 = obj;
                    id v6 = v244;
                    double v99 = v249;
                    long long v14 = v250;
                    v19 = v236;
                    v56 = v239;
                    id v72 = v231;
                    goto LABEL_258;
                  }
                }
                else
                {
                  v78 = v72;
                }
                id v232 = 0;
                goto LABEL_82;
              }
            }
          }
          v243 = v24;
          if (!v25) {
            goto LABEL_35;
          }
          uint64_t v28 = v23;
          uint64_t v29 = v19;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_35;
          }
          if (v251)
          {
            id v64 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v65 = *MEMORY[0x1E4F502C8];
            uint64_t v314 = *MEMORY[0x1E4F28568];
            v255 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"applicationIdentifiers"];
            v315 = v255;
            uint64_t v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v315 forKeys:&v314 count:1];
            double v67 = v64;
            uint64_t v28 = v23;
            id v8 = v20;
            v56 = (void *)v66;
            uint64_t v16 = 0;
            id *v251 = (id)[v67 initWithDomain:v65 code:2 userInfo:v66];
            long long v14 = v250;
            uint64_t v18 = v22;
            id v6 = v243;
            goto LABEL_267;
          }
          uint64_t v16 = 0;
          long long v14 = v250;
          uint64_t v18 = v22;
          id v6 = v243;
          id v8 = v20;
LABEL_268:
          v19 = v29;

          uint64_t v7 = v248;
          goto LABEL_269;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v21 = v6;
          uint64_t v22 = v18;
          id v23 = v19;
          goto LABEL_24;
        }
        if (v251)
        {
          id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v256 = *MEMORY[0x1E4F502C8];
          uint64_t v316 = *MEMORY[0x1E4F28568];
          id v58 = v18;
          id v59 = [NSString alloc];
          uint64_t v29 = v19;
          uint64_t v196 = objc_opt_class();
          uint64_t v60 = v59;
          uint64_t v18 = v58;
          id v25 = (id)[v60 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v196, @"sourceBundleID"];
          id v317 = v25;
          uint64_t v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v317 forKeys:&v316 count:1];
          uint64_t v62 = v256;
          v257 = (void *)v61;
          id v63 = (id)objc_msgSend(v57, "initWithDomain:code:userInfo:", v62, 2);
          uint64_t v28 = 0;
          uint64_t v16 = 0;
          id *v251 = v63;
          long long v14 = v250;
          id v8 = v20;

          goto LABEL_268;
        }
        uint64_t v16 = 0;
        long long v14 = v250;
        uint64_t v28 = 0;
LABEL_269:

        goto LABEL_270;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v252 = v18;
        goto LABEL_19;
      }
      if (a4)
      {
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v31 = *MEMORY[0x1E4F502C8];
        uint64_t v318 = *MEMORY[0x1E4F28568];
        uint64_t v32 = v18;
        id v33 = [NSString alloc];
        uint64_t v195 = objc_opt_class();
        int v34 = v33;
        uint64_t v18 = v32;
        uint64_t v35 = [v34 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v195, @"syndicationSecondsSinceReferenceDate"];
        uint64_t v319 = v35;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v319 forKeys:&v318 count:1];
        uint64_t v36 = v30;
        uint64_t v28 = (void *)v35;
        id v37 = (id)[v36 initWithDomain:v31 code:2 userInfo:v19];
        id v252 = 0;
        uint64_t v16 = 0;
        long long v14 = v250;
        *a4 = v37;
        goto LABEL_269;
      }
      id v252 = 0;
      uint64_t v16 = 0;
      long long v14 = v250;
LABEL_270:

      goto LABEL_271;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v254;
      id v250 = [NSNumber numberWithInt:BMMessagesSharedWithYouFeedbackRankableSocialHighlightTypeFromString(v17)];

      goto LABEL_15;
    }
    if (a4)
    {
      id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v69 = *MEMORY[0x1E4F502C8];
      uint64_t v320 = *MEMORY[0x1E4F28568];
      id v252 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"highlightType"];
      id v321 = v252;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v321 forKeys:&v320 count:1];
      id v70 = (id)[v68 initWithDomain:v69 code:2 userInfo:v18];
      long long v14 = 0;
      uint64_t v16 = 0;
      *a4 = v70;
      goto LABEL_270;
    }
    long long v14 = 0;
    uint64_t v16 = 0;
LABEL_271:

    goto LABEL_272;
  }
  if (a4)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v10 = *MEMORY[0x1E4F502C8];
    uint64_t v322 = *MEMORY[0x1E4F28568];
    id v11 = v6;
    id v12 = [NSString alloc];
    uint64_t v194 = objc_opt_class();
    long long v13 = v12;
    id v6 = v11;
    long long v14 = (void *)[v13 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v194, @"highlightIdentifier"];
    v323[0] = v14;
    v254 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v323 forKeys:&v322 count:1];
    id v15 = (id)[v9 initWithDomain:v10 code:2 userInfo:v254];
    id v8 = 0;
    uint64_t v16 = 0;
    *a4 = v15;
    goto LABEL_271;
  }
  id v8 = 0;
  uint64_t v16 = 0;
LABEL_272:

  return v16;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_highlightIdentifier) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasSyndicationSecondsSinceReferenceDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_sourceBundleID) {
    PBDataWriterWriteStringField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = self->_applicationIdentifiers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  if (self->_resourceURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_sender)
  {
    uint64_t v20 = 0;
    PBDataWriterPlaceMark();
    [(BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *)self->_sender writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_domainIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_batchIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = self->_calculatedFeatures;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
        uint64_t v20 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v15, "writeTo:", v4, (void)v16);
        PBDataWriterRecallMark();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v25 count:16];
    }
    while (v12);
  }

  if (self->_clientIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasContentCreationSecondsSinceReferenceDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_groupPhotoPathDigest) {
    PBDataWriterWriteStringField();
  }
  if (self->_displayName) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasIsPrimary) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_attributionIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRank) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasScore) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasIsConversationAutoDonating) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_originatingDeviceId) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRankingSecondsSinceReferenceDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_resolvedUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_clientVariant) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)BMMessagesSharedWithYouFeedbackRankableSocialHighlight;
  uint64_t v5 = [(BMEventBase *)&v77 init];
  if (!v5) {
    goto LABEL_115;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v9 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v10 = (int *)MEMORY[0x1E4F940C8];
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
          uint64_t v23 = 40;
          goto LABEL_83;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          while (2)
          {
            uint64_t v27 = *v8;
            uint64_t v28 = *(void *)&v4[v27];
            unint64_t v29 = v28 + 1;
            if (v28 == -1 || v29 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)&v4[*v11] + v28);
              *(void *)&v4[v27] = v29;
              v26 |= (unint64_t)(v30 & 0x7F) << v24;
              if (v30 < 0)
              {
                v24 += 7;
                BOOL v19 = v25++ >= 9;
                if (v19)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_87;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            LODWORD(v26) = 0;
          }
LABEL_87:
          if (v26 >= 3) {
            LODWORD(v26) = 0;
          }
          v5->_highlightType = v26;
          continue;
        case 3u:
          v5->_hasSyndicationSecondsSinceReferenceDate = 1;
          uint64_t v31 = *v8;
          unint64_t v32 = *(void *)&v4[v31];
          if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(void *)&v4[*v9])
          {
            id v33 = *(objc_class **)(*(void *)&v4[*v11] + v32);
            *(void *)&v4[v31] = v32 + 8;
          }
          else
          {
            v4[*v10] = 1;
            id v33 = 0;
          }
          uint64_t v69 = 48;
          goto LABEL_111;
        case 4u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 56;
          goto LABEL_83;
        case 5u:
          uint64_t v34 = PBReaderReadString();
          if (!v34) {
            goto LABEL_117;
          }
          uint64_t v35 = (void *)v34;
          [v6 addObject:v34];
          goto LABEL_45;
        case 6u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 72;
          goto LABEL_83;
        case 7u:
          uint64_t v78 = 0;
          uint64_t v79 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_117;
          }
          uint64_t v36 = [[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact alloc] initByReadFrom:v4];
          if (!v36) {
            goto LABEL_117;
          }
          sender = v5->_sender;
          v5->_sender = v36;

          PBReaderRecallMark();
          continue;
        case 8u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 88;
          goto LABEL_83;
        case 9u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 96;
          goto LABEL_83;
        case 0xAu:
          uint64_t v78 = 0;
          uint64_t v79 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_117;
          }
          id v38 = [[BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature alloc] initByReadFrom:v4];
          if (!v38) {
            goto LABEL_117;
          }
          uint64_t v35 = v38;
          [v7 addObject:v38];
          PBReaderRecallMark();
LABEL_45:

          continue;
        case 0xBu:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 112;
          goto LABEL_83;
        case 0xCu:
          v5->_hasContentCreationSecondsSinceReferenceDate = 1;
          uint64_t v39 = *v8;
          unint64_t v40 = *(void *)&v4[v39];
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(void *)&v4[*v9])
          {
            id v33 = *(objc_class **)(*(void *)&v4[*v11] + v40);
            *(void *)&v4[v39] = v40 + 8;
          }
          else
          {
            v4[*v10] = 1;
            id v33 = 0;
          }
          uint64_t v69 = 120;
          goto LABEL_111;
        case 0xDu:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 128;
          goto LABEL_83;
        case 0xEu:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 136;
          goto LABEL_83;
        case 0xFu:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v43 = 0;
          v5->_hasIsPrimary = 1;
          while (2)
          {
            uint64_t v44 = *v8;
            uint64_t v45 = *(void *)&v4[v44];
            unint64_t v46 = v45 + 1;
            if (v45 == -1 || v46 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v47 = *(unsigned char *)(*(void *)&v4[*v11] + v45);
              *(void *)&v4[v44] = v46;
              v43 |= (unint64_t)(v47 & 0x7F) << v41;
              if (v47 < 0)
              {
                v41 += 7;
                BOOL v19 = v42++ >= 9;
                if (v19)
                {
                  uint64_t v43 = 0;
                  goto LABEL_93;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v43 = 0;
          }
LABEL_93:
          BOOL v67 = v43 != 0;
          uint64_t v68 = 18;
          goto LABEL_102;
        case 0x10u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 144;
          goto LABEL_83;
        case 0x11u:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v50 = 0;
          v5->_hasRank = 1;
          while (2)
          {
            uint64_t v51 = *v8;
            uint64_t v52 = *(void *)&v4[v51];
            unint64_t v53 = v52 + 1;
            if (v52 == -1 || v53 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v54 = *(unsigned char *)(*(void *)&v4[*v11] + v52);
              *(void *)&v4[v51] = v53;
              v50 |= (unint64_t)(v54 & 0x7F) << v48;
              if (v54 < 0)
              {
                v48 += 7;
                BOOL v19 = v49++ >= 9;
                if (v19)
                {
                  LODWORD(v50) = 0;
                  goto LABEL_97;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            LODWORD(v50) = 0;
          }
LABEL_97:
          v5->_rank = v50;
          continue;
        case 0x12u:
          v5->_hasScore = 1;
          uint64_t v55 = *v8;
          unint64_t v56 = *(void *)&v4[v55];
          if (v56 <= 0xFFFFFFFFFFFFFFF7 && v56 + 8 <= *(void *)&v4[*v9])
          {
            id v33 = *(objc_class **)(*(void *)&v4[*v11] + v56);
            *(void *)&v4[v55] = v56 + 8;
          }
          else
          {
            v4[*v10] = 1;
            id v33 = 0;
          }
          uint64_t v69 = 152;
          goto LABEL_111;
        case 0x13u:
          char v57 = 0;
          unsigned int v58 = 0;
          uint64_t v59 = 0;
          v5->_hasIsConversationAutoDonating = 1;
          break;
        case 0x14u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 160;
          goto LABEL_83;
        case 0x15u:
          v5->_hasRankingSecondsSinceReferenceDate = 1;
          uint64_t v64 = *v8;
          unint64_t v65 = *(void *)&v4[v64];
          if (v65 <= 0xFFFFFFFFFFFFFFF7 && v65 + 8 <= *(void *)&v4[*v9])
          {
            id v33 = *(objc_class **)(*(void *)&v4[*v11] + v65);
            *(void *)&v4[v64] = v65 + 8;
          }
          else
          {
            v4[*v10] = 1;
            id v33 = 0;
          }
          uint64_t v69 = 168;
LABEL_111:
          *(Class *)((char *)&v5->super.super.isa + v69) = v33;
          continue;
        case 0x16u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 176;
          goto LABEL_83;
        case 0x17u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 184;
LABEL_83:
          uint64_t v66 = *(Class *)((char *)&v5->super.super.isa + v23);
          *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_117:

          goto LABEL_114;
      }
      while (1)
      {
        uint64_t v60 = *v8;
        uint64_t v61 = *(void *)&v4[v60];
        unint64_t v62 = v61 + 1;
        if (v61 == -1 || v62 > *(void *)&v4[*v9]) {
          break;
        }
        char v63 = *(unsigned char *)(*(void *)&v4[*v11] + v61);
        *(void *)&v4[v60] = v62;
        v59 |= (unint64_t)(v63 & 0x7F) << v57;
        if ((v63 & 0x80) == 0) {
          goto LABEL_99;
        }
        v57 += 7;
        BOOL v19 = v58++ >= 9;
        if (v19)
        {
          uint64_t v59 = 0;
          goto LABEL_101;
        }
      }
      v4[*v10] = 1;
LABEL_99:
      if (v4[*v10]) {
        uint64_t v59 = 0;
      }
LABEL_101:
      BOOL v67 = v59 != 0;
      uint64_t v68 = 22;
LABEL_102:
      *((unsigned char *)&v5->super.super.isa + v68) = v67;
    }
    while (*(void *)&v4[*v8] < *(void *)&v4[*v9]);
  }
  uint64_t v70 = [v6 copy];
  applicationIdentifiers = v5->_applicationIdentifiers;
  v5->_applicationIdentifiers = (NSArray *)v70;

  uint64_t v72 = [v7 copy];
  calculatedFeatures = v5->_calculatedFeatures;
  v5->_calculatedFeatures = (NSArray *)v72;

  int v74 = v4[*v10];
  if (v74) {
LABEL_114:
  }
    uint64_t v75 = 0;
  else {
LABEL_115:
  }
    uint64_t v75 = v5;

  return v75;
}

- (NSString)description
{
  id v20 = [NSString alloc];
  uint64_t v31 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self highlightIdentifier];
  unint64_t v32 = BMMessagesSharedWithYouFeedbackRankableSocialHighlightTypeAsString([(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self highlightType]);
  uint64_t v3 = NSNumber;
  [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self syndicationSecondsSinceReferenceDate];
  char v30 = objc_msgSend(v3, "numberWithDouble:");
  unint64_t v29 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self sourceBundleID];
  uint64_t v28 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self applicationIdentifiers];
  uint64_t v27 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self resourceURL];
  BOOL v19 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self sender];
  uint64_t v26 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self domainIdentifier];
  char v18 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self batchIdentifier];
  unsigned int v25 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self calculatedFeatures];
  unint64_t v17 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self clientIdentifier];
  id v4 = NSNumber;
  [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self contentCreationSecondsSinceReferenceDate];
  char v24 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v23 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self groupPhotoPathDigest];
  uint64_t v22 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self displayName];
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight isPrimary](self, "isPrimary"));
  uint64_t v15 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self attributionIdentifier];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight rank](self, "rank"));
  uint64_t v6 = NSNumber;
  [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self score];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight isConversationAutoDonating](self, "isConversationAutoDonating"));
  uint64_t v9 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self originatingDeviceId];
  uint64_t v10 = NSNumber;
  [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self rankingSecondsSinceReferenceDate];
  uint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
  char v12 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self resolvedUrl];
  unsigned int v13 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self clientVariant];
  long long v21 = objc_msgSend(v20, "initWithFormat:", @"BMMessagesSharedWithYouFeedbackRankableSocialHighlight with highlightIdentifier: %@, highlightType: %@, syndicationSecondsSinceReferenceDate: %@, sourceBundleID: %@, applicationIdentifiers: %@, resourceURL: %@, sender: %@, domainIdentifier: %@, batchIdentifier: %@, calculatedFeatures: %@, clientIdentifier: %@, contentCreationSecondsSinceReferenceDate: %@, groupPhotoPathDigest: %@, displayName: %@, isPrimary: %@, attributionIdentifier: %@, rank: %@, score: %@, isConversationAutoDonating: %@, originatingDeviceId: %@, rankingSecondsSinceReferenceDate: %@, resolvedUrl: %@, clientVariant: %@", v31, v32, v30, v29, v28, v27, v19, v26, v18, v25, v17, v24, v23, v22, v16, v15,
                  v5,
                  v7,
                  v8,
                  v9,
                  v11,
                  v12,
                  v13);

  return (NSString *)v21;
}

- (BMMessagesSharedWithYouFeedbackRankableSocialHighlight)initWithHighlightIdentifier:(id)a3 highlightType:(int)a4 syndicationSecondsSinceReferenceDate:(id)a5 sourceBundleID:(id)a6 applicationIdentifiers:(id)a7 resourceURL:(id)a8 sender:(id)a9 domainIdentifier:(id)a10 batchIdentifier:(id)a11 calculatedFeatures:(id)a12 clientIdentifier:(id)a13 contentCreationSecondsSinceReferenceDate:(id)a14 groupPhotoPathDigest:(id)a15 displayName:(id)a16 isPrimary:(id)a17 attributionIdentifier:(id)a18 rank:(id)a19 score:(id)a20 isConversationAutoDonating:(id)a21 originatingDeviceId:(id)a22 rankingSecondsSinceReferenceDate:(id)a23 resolvedUrl:(id)a24 clientVariant:(id)a25
{
  id v60 = a3;
  id v29 = a5;
  id v43 = a6;
  id v59 = a6;
  id v44 = a7;
  id v58 = a7;
  id v57 = a8;
  id v56 = a9;
  id v55 = a10;
  id v54 = a11;
  id v53 = a12;
  id v52 = a13;
  id v62 = a14;
  id v51 = a15;
  id v50 = a16;
  id v30 = a17;
  id v49 = a18;
  id v31 = a19;
  id v32 = a20;
  id v33 = a21;
  id v48 = a22;
  id v61 = a23;
  id v47 = a24;
  id v46 = a25;
  v63.receiver = self;
  v63.super_class = (Class)BMMessagesSharedWithYouFeedbackRankableSocialHighlight;
  uint64_t v34 = [(BMEventBase *)&v63 init];
  if (v34)
  {
    v34->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v34->_highlightIdentifier, a3);
    v34->_highlightType = a4;
    if (v29)
    {
      v34->_hasSyndicationSecondsSinceReferenceDate = 1;
      [v29 doubleValue];
    }
    else
    {
      id v29 = 0;
      v34->_hasSyndicationSecondsSinceReferenceDate = 0;
      double v35 = -1.0;
    }
    v34->_syndicationSecondsSinceReferenceDate = v35;
    objc_storeStrong((id *)&v34->_sourceBundleID, v43);
    objc_storeStrong((id *)&v34->_applicationIdentifiers, v44);
    objc_storeStrong((id *)&v34->_resourceURL, a8);
    objc_storeStrong((id *)&v34->_sender, a9);
    objc_storeStrong((id *)&v34->_domainIdentifier, a10);
    objc_storeStrong((id *)&v34->_batchIdentifier, a11);
    objc_storeStrong((id *)&v34->_calculatedFeatures, a12);
    objc_storeStrong((id *)&v34->_clientIdentifier, a13);
    if (v62)
    {
      v34->_hasContentCreationSecondsSinceReferenceDate = 1;
      [v62 doubleValue];
    }
    else
    {
      v34->_hasContentCreationSecondsSinceReferenceDate = 0;
      double v36 = -1.0;
    }
    v34->_contentCreationSecondsSinceReferenceDate = v36;
    objc_storeStrong((id *)&v34->_groupPhotoPathDigest, a15);
    objc_storeStrong((id *)&v34->_displayName, a16);
    if (v30)
    {
      v34->_hasIsPrimary = 1;
      v34->_isPrimary = [v30 BOOLValue];
    }
    else
    {
      v34->_hasIsPrimary = 0;
      v34->_isPrimary = 0;
    }
    objc_storeStrong((id *)&v34->_attributionIdentifier, a18);
    if (v31)
    {
      v34->_hasRank = 1;
      unsigned int v37 = [v31 unsignedIntValue];
    }
    else
    {
      unsigned int v37 = 0;
      v34->_hasRank = 0;
    }
    v34->_rank = v37;
    if (v32)
    {
      v34->_hasScore = 1;
      [v32 doubleValue];
    }
    else
    {
      v34->_hasScore = 0;
      double v38 = -1.0;
    }
    v34->_score = v38;
    if (v33)
    {
      v34->_hasIsConversationAutoDonating = 1;
      v34->_isConversationAutoDonating = [v33 BOOLValue];
    }
    else
    {
      v34->_hasIsConversationAutoDonating = 0;
      v34->_isConversationAutoDonating = 0;
    }
    objc_storeStrong((id *)&v34->_originatingDeviceId, a22);
    if (v61)
    {
      v34->_hasRankingSecondsSinceReferenceDate = 1;
      [v61 doubleValue];
    }
    else
    {
      v34->_hasRankingSecondsSinceReferenceDate = 0;
      double v39 = -1.0;
    }
    v34->_rankingSecondsSinceReferenceDate = v39;
    objc_storeStrong((id *)&v34->_resolvedUrl, a24);
    objc_storeStrong((id *)&v34->_clientVariant, a25);
  }

  return v34;
}

+ (id)protoFields
{
  v27[23] = *MEMORY[0x1E4F143B8];
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"highlightIdentifier" number:1 type:13 subMessageClass:0];
  v27[0] = v26;
  unsigned int v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"highlightType" number:2 type:4 subMessageClass:0];
  v27[1] = v25;
  char v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"syndicationSecondsSinceReferenceDate" number:3 type:0 subMessageClass:0];
  v27[2] = v24;
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sourceBundleID" number:4 type:13 subMessageClass:0];
  v27[3] = v23;
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"applicationIdentifiers" number:5 type:13 subMessageClass:0];
  v27[4] = v22;
  long long v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"resourceURL" number:6 type:13 subMessageClass:0];
  v27[5] = v21;
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sender" number:7 type:14 subMessageClass:objc_opt_class()];
  v27[6] = v20;
  BOOL v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"domainIdentifier" number:8 type:13 subMessageClass:0];
  v27[7] = v19;
  char v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"batchIdentifier" number:9 type:13 subMessageClass:0];
  v27[8] = v18;
  unint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"calculatedFeatures" number:10 type:14 subMessageClass:objc_opt_class()];
  v27[9] = v17;
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientIdentifier" number:11 type:13 subMessageClass:0];
  v27[10] = v16;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentCreationSecondsSinceReferenceDate" number:12 type:0 subMessageClass:0];
  v27[11] = v15;
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"groupPhotoPathDigest" number:13 type:13 subMessageClass:0];
  v27[12] = v14;
  unsigned int v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"displayName" number:14 type:13 subMessageClass:0];
  v27[13] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isPrimary" number:15 type:12 subMessageClass:0];
  v27[14] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"attributionIdentifier" number:16 type:13 subMessageClass:0];
  v27[15] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rank" number:17 type:4 subMessageClass:0];
  v27[16] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"score" number:18 type:0 subMessageClass:0];
  v27[17] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isConversationAutoDonating" number:19 type:12 subMessageClass:0];
  v27[18] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"originatingDeviceId" number:20 type:13 subMessageClass:0];
  v27[19] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rankingSecondsSinceReferenceDate" number:21 type:0 subMessageClass:0];
  v27[20] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"resolvedUrl" number:22 type:13 subMessageClass:0];
  v27[21] = v9;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientVariant" number:23 type:13 subMessageClass:0];
  v27[22] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:23];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7128;
}

+ (id)columns
{
  v27[23] = *MEMORY[0x1E4F143B8];
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"highlightIdentifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  unsigned int v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"highlightType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  char v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"syndicationSecondsSinceReferenceDate" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:0];
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sourceBundleID" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"applicationIdentifiers_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_309_81031];
  long long v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"resourceURL" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"sender_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_311];
  BOOL v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"domainIdentifier" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  char v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"batchIdentifier" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  unint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"calculatedFeatures_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_313];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientIdentifier" dataType:2 requestOnly:0 fieldNumber:11 protoDataType:13 convertedType:0];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentCreationSecondsSinceReferenceDate" dataType:1 requestOnly:0 fieldNumber:12 protoDataType:0 convertedType:0];
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"groupPhotoPathDigest" dataType:2 requestOnly:0 fieldNumber:13 protoDataType:13 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"displayName" dataType:2 requestOnly:0 fieldNumber:14 protoDataType:13 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isPrimary" dataType:0 requestOnly:0 fieldNumber:15 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"attributionIdentifier" dataType:2 requestOnly:0 fieldNumber:16 protoDataType:13 convertedType:0];
  unsigned int v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rank" dataType:0 requestOnly:0 fieldNumber:17 protoDataType:4 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"score" dataType:1 requestOnly:0 fieldNumber:18 protoDataType:0 convertedType:0];
  char v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isConversationAutoDonating" dataType:0 requestOnly:0 fieldNumber:19 protoDataType:12 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"originatingDeviceId" dataType:2 requestOnly:0 fieldNumber:20 protoDataType:13 convertedType:0];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rankingSecondsSinceReferenceDate" dataType:1 requestOnly:0 fieldNumber:21 protoDataType:0 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"resolvedUrl" dataType:2 requestOnly:0 fieldNumber:22 protoDataType:13 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientVariant" dataType:2 requestOnly:0 fieldNumber:23 protoDataType:13 convertedType:0];
  v27[0] = v26;
  v27[1] = v25;
  v27[2] = v24;
  v27[3] = v23;
  v27[4] = v22;
  v27[5] = v21;
  v27[6] = v20;
  v27[7] = v19;
  v27[8] = v18;
  v27[9] = v17;
  v27[10] = v16;
  v27[11] = v15;
  v27[12] = v14;
  v27[13] = v2;
  v27[14] = v3;
  v27[15] = v4;
  v27[16] = v13;
  v27[17] = v5;
  v27[18] = v12;
  v27[19] = v6;
  v27[20] = v11;
  v27[21] = v7;
  v27[22] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:23];

  return v10;
}

id __65__BMMessagesSharedWithYouFeedbackRankableSocialHighlight_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _calculatedFeaturesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __65__BMMessagesSharedWithYouFeedbackRankableSocialHighlight_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 sender];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __65__BMMessagesSharedWithYouFeedbackRankableSocialHighlight_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _applicationIdentifiersJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 4)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    uint64_t v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMMessagesSharedWithYouFeedbackRankableSocialHighlight alloc] initByReadFrom:v6];
    uint64_t v8 = v7;
    if (v7) {
      v7[7] = 4;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 4;
}

@end