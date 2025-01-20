@interface BMRankableSocialHighlight
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMRankableSocialHighlight)initWithHighlightIdentifier:(id)a3 highlightType:(unint64_t)a4 syndicationDate:(id)a5 sourceBundleId:(id)a6 applicationIdentifiers:(id)a7 resourceUrl:(id)a8 sender:(id)a9 domainIdentifier:(id)a10 batchIdentifier:(id)a11 calculatedFeatures:(id)a12 clientIdentifier:(id)a13 contentCreationDate:(id)a14 groupPhotoPath:(id)a15 displayName:(id)a16 isPrimary:(id)a17 attributionIdentifier:(id)a18 rank:(id)a19 score:(id)a20 isConversationAutoDonating:(id)a21 originatingDeviceId:(id)a22 rankingDate:(id)a23 resolvedUrl:(id)a24;
- (BMRankableSocialHighlight)initWithHighlightIdentifier:(id)a3 highlightType:(unint64_t)a4 syndicationDate:(id)a5 sourceBundleId:(id)a6 applicationIdentifiers:(id)a7 resourceUrl:(id)a8 sender:(id)a9 domainIdentifier:(id)a10 batchIdentifier:(id)a11 calculatedFeatures:(id)a12 clientIdentifier:(id)a13 contentCreationDate:(id)a14 groupPhotoPathDigest:(id)a15 displayName:(id)a16 isPrimary:(id)a17 attributionIdentifier:(id)a18 rank:(id)a19 score:(id)a20 isConversationAutoDonating:(id)a21 originatingDeviceId:(id)a22 rankingDate:(id)a23 resolvedUrl:(id)a24;
- (BMRankableSocialHighlight)initWithHighlightIdentifier:(id)a3 highlightType:(unint64_t)a4 syndicationDate:(id)a5 sourceBundleId:(id)a6 applicationIdentifiers:(id)a7 resourceUrl:(id)a8 sender:(id)a9 domainIdentifier:(id)a10 batchIdentifier:(id)a11 calculatedFeatures:(id)a12 clientIdentifier:(id)a13 contentCreationDate:(id)a14 groupPhotoPathDigest:(id)a15 displayName:(id)a16 isPrimary:(id)a17 attributionIdentifier:(id)a18 rank:(id)a19 score:(id)a20 isConversationAutoDonating:(id)a21 originatingDeviceId:(id)a22 rankingDate:(id)a23 resolvedUrl:(id)a24 clientVariant:(id)a25;
- (BMRankableSocialHighlight)initWithProto:(id)a3;
- (BMRankableSocialHighlight)initWithProtoData:(id)a3;
- (BMSocialHighlightContact)sender;
- (NSArray)applicationIdentifiers;
- (NSDate)contentCreationDate;
- (NSDate)rankingDate;
- (NSDate)syndicationDate;
- (NSDictionary)calculatedFeatures;
- (NSNumber)isConversationAutoDonating;
- (NSNumber)isPrimary;
- (NSNumber)rank;
- (NSNumber)score;
- (NSString)attributionIdentifier;
- (NSString)batchIdentifier;
- (NSString)clientIdentifier;
- (NSString)clientVariant;
- (NSString)displayName;
- (NSString)domainIdentifier;
- (NSString)groupPhotoPathDigest;
- (NSString)highlightIdentifier;
- (NSString)originatingDeviceId;
- (NSString)resolvedUrl;
- (NSString)sourceBundleId;
- (NSURL)resourceUrl;
- (id)encodeAsProto;
- (id)proto;
- (int)_protoType;
- (unint64_t)_socialHighlightTypeForProtoType:(int)a3;
- (unint64_t)highlightType;
- (unsigned)dataVersion;
- (void)_protoType;
@end

@implementation BMRankableSocialHighlight

- (unsigned)dataVersion
{
  return 3;
}

- (unint64_t)_socialHighlightTypeForProtoType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 < 3) {
    return a3;
  }
  v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[BMRankableSocialHighlight _socialHighlightTypeForProtoType:](v3);
  }

  return 0;
}

- (int)_protoType
{
  unint64_t v3 = [(BMRankableSocialHighlight *)self highlightType];
  if (v3 >= 3)
  {
    v4 = __biome_log_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[BMRankableSocialHighlight _protoType](self);
    }

    LODWORD(v3) = 0;
  }
  return v3;
}

- (BMRankableSocialHighlight)initWithHighlightIdentifier:(id)a3 highlightType:(unint64_t)a4 syndicationDate:(id)a5 sourceBundleId:(id)a6 applicationIdentifiers:(id)a7 resourceUrl:(id)a8 sender:(id)a9 domainIdentifier:(id)a10 batchIdentifier:(id)a11 calculatedFeatures:(id)a12 clientIdentifier:(id)a13 contentCreationDate:(id)a14 groupPhotoPathDigest:(id)a15 displayName:(id)a16 isPrimary:(id)a17 attributionIdentifier:(id)a18 rank:(id)a19 score:(id)a20 isConversationAutoDonating:(id)a21 originatingDeviceId:(id)a22 rankingDate:(id)a23 resolvedUrl:(id)a24 clientVariant:(id)a25
{
  id v59 = a3;
  id v41 = a5;
  id v58 = a5;
  id v42 = a6;
  id v57 = a6;
  id v43 = a7;
  id v56 = a7;
  id v55 = a8;
  id v54 = a9;
  id v53 = a10;
  id v52 = a11;
  id v51 = a12;
  id v50 = a13;
  id v49 = a14;
  id v48 = a15;
  id v47 = a16;
  id v46 = a17;
  id v45 = a18;
  id v29 = a19;
  id v30 = a20;
  id v31 = a21;
  id v32 = a22;
  id v33 = a23;
  id v34 = a24;
  id v35 = a25;
  v60.receiver = self;
  v60.super_class = (Class)BMRankableSocialHighlight;
  v36 = [(BMEventBase *)&v60 init];
  v37 = v36;
  if (v36)
  {
    objc_storeStrong((id *)&v36->_highlightIdentifier, a3);
    v37->_highlightType = a4;
    objc_storeStrong((id *)&v37->_syndicationDate, v41);
    objc_storeStrong((id *)&v37->_sourceBundleId, v42);
    objc_storeStrong((id *)&v37->_applicationIdentifiers, v43);
    objc_storeStrong((id *)&v37->_resourceUrl, a8);
    objc_storeStrong((id *)&v37->_sender, a9);
    objc_storeStrong((id *)&v37->_domainIdentifier, a10);
    objc_storeStrong((id *)&v37->_batchIdentifier, a11);
    objc_storeStrong((id *)&v37->_calculatedFeatures, a12);
    objc_storeStrong((id *)&v37->_clientIdentifier, a13);
    objc_storeStrong((id *)&v37->_contentCreationDate, a14);
    objc_storeStrong((id *)&v37->_groupPhotoPathDigest, a15);
    objc_storeStrong((id *)&v37->_displayName, a16);
    objc_storeStrong((id *)&v37->_isPrimary, a17);
    objc_storeStrong((id *)&v37->_attributionIdentifier, a18);
    objc_storeStrong((id *)&v37->_rank, a19);
    objc_storeStrong((id *)&v37->_score, a20);
    objc_storeStrong((id *)&v37->_isConversationAutoDonating, a21);
    objc_storeStrong((id *)&v37->_originatingDeviceId, a22);
    objc_storeStrong((id *)&v37->_rankingDate, a23);
    objc_storeStrong((id *)&v37->_resolvedUrl, a24);
    objc_storeStrong((id *)&v37->_clientVariant, a25);
  }

  return v37;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 3)
  {
    id v4 = a3;
    v5 = [[BMRankableSocialHighlight alloc] initWithProtoData:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)encodeAsProto
{
  v2 = [(BMRankableSocialHighlight *)self proto];
  unint64_t v3 = [v2 data];

  return v3;
}

- (BMRankableSocialHighlight)initWithProto:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v56 = self;
    id v45 = v4;
    id v5 = v4;
    id v55 = [v5 highlightIdentifier];
    if ([v5 hasSyndicationSecondsSinceReferenceDate])
    {
      id v6 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [v5 syndicationSecondsSinceReferenceDate];
      id v54 = objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      id v54 = 0;
    }
    if ([v5 hasContentCreationSecondsSinceReferenceDate])
    {
      id v8 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [v5 contentCreationSecondsSinceReferenceDate];
      id v53 = objc_msgSend(v8, "initWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      id v53 = 0;
    }
    if ([v5 hasRankingSecondsSinceReferenceDate])
    {
      id v9 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [v5 rankingSecondsSinceReferenceDate];
      id v52 = objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      id v52 = 0;
    }
    v10 = objc_opt_new();
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v11 = [v5 calculatedFeatures];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v59 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x192FB0D60]();
          if ([v16 hasName] && objc_msgSend(v16, "hasValue"))
          {
            v18 = NSNumber;
            [v16 value];
            v19 = objc_msgSend(v18, "numberWithDouble:");
            v20 = [v16 name];
            [v10 setObject:v19 forKeyedSubscript:v20];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v58 objects:v62 count:16];
      }
      while (v13);
    }

    v21 = [v5 groupPhotoPathDigest];
    int v22 = [v21 hasPrefix:@"file://"];

    v23 = [v5 groupPhotoPathDigest];
    v24 = v23;
    if (v22)
    {
      uint64_t v25 = bm_sha256(v23);

      v24 = (void *)v25;
    }
    if ([v5 hasHighlightType]) {
      uint64_t v43 = -[BMRankableSocialHighlight _socialHighlightTypeForProtoType:](v56, "_socialHighlightTypeForProtoType:", [v5 highlightType]);
    }
    else {
      uint64_t v43 = 0;
    }
    id v50 = [v5 sourceBundleId];
    id v49 = [v5 applicationIdentifiers];
    int v44 = [v5 hasResourceUrl];
    id v51 = v24;
    if (v44)
    {
      id v26 = objc_alloc(MEMORY[0x1E4F1CB10]);
      id v35 = [v5 resourceUrl];
      id v46 = objc_msgSend(v26, "initWithString:");
    }
    else
    {
      id v46 = 0;
    }
    v27 = [BMSocialHighlightContact alloc];
    id v42 = [v5 sender];
    id v41 = [(BMSocialHighlightContact *)v27 initWithProto:v42];
    id v48 = [v5 domainIdentifier];
    v40 = [v5 batchIdentifier];
    v39 = [v5 clientIdentifier];
    id v47 = [v5 displayName];
    v38 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isPrimary"));
    v37 = [v5 attributionIdentifier];
    v36 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "rank"));
    v28 = NSNumber;
    [v5 score];
    id v29 = objc_msgSend(v28, "numberWithDouble:");
    id v30 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isConversationAutoDonating"));
    id v31 = [v5 originatingDeviceId];
    id v32 = [v5 resolvedUrl];
    id v33 = [v5 clientVariant];
    id v57 = objc_retain(-[BMRankableSocialHighlight initWithHighlightIdentifier:highlightType:syndicationDate:sourceBundleId:applicationIdentifiers:resourceUrl:sender:domainIdentifier:batchIdentifier:calculatedFeatures:clientIdentifier:contentCreationDate:groupPhotoPathDigest:displayName:isPrimary:attributionIdentifier:rank:score:isConversationAutoDonating:originatingDeviceId:rankingDate:resolvedUrl:clientVariant:](v56, "initWithHighlightIdentifier:highlightType:syndicationDate:sourceBundleId:applicationIdentifiers:resourceUrl:sender:domainIdentifier:batchIdentifier:calculatedFeatures:clientIdentifier:contentCreationDate:groupPhotoPathDigest:displayName:isPrimary:attributionIdentifier:rank:score:isConversationAutoDonating:originatingDeviceId:rankingDate:resolvedUrl:clientVariant:", v55, v43, v54, v50, v49, v46, v41, v48, v40, v10, v39, v53, v51,
              v47,
              v38,
              v37,
              v36,
              v29,
              v30,
              v31,
              v52,
              v32,
              v33));

    if (v44)
    {
    }
    self = v57;
    v7 = v57;
    id v4 = v45;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BMRankableSocialHighlight)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBRankableSocialHighlight alloc] initWithData:v4];

    self = [(BMRankableSocialHighlight *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v4 = self->_calculatedFeatures;
  uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        v10 = -[NSDictionary objectForKeyedSubscript:](self->_calculatedFeatures, "objectForKeyedSubscript:", v9, (void)v27);
        [v10 doubleValue];
        double v12 = v11;

        uint64_t v13 = objc_opt_new();
        [v13 setName:v9];
        [v13 setValue:v12];
        [v3 addObject:v13];
      }
      uint64_t v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
  }

  uint64_t v14 = objc_opt_new();
  [v14 setHighlightIdentifier:self->_highlightIdentifier];
  objc_msgSend(v14, "setHighlightType:", -[BMRankableSocialHighlight _protoType](self, "_protoType"));
  syndicationDate = self->_syndicationDate;
  if (syndicationDate)
  {
    [(NSDate *)syndicationDate timeIntervalSinceReferenceDate];
    objc_msgSend(v14, "setSyndicationSecondsSinceReferenceDate:");
  }
  objc_msgSend(v14, "setSourceBundleId:", self->_sourceBundleId, (void)v27);
  if (self->_applicationIdentifiers) {
    applicationIdentifiers = self->_applicationIdentifiers;
  }
  else {
    applicationIdentifiers = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  v17 = (void *)[(NSArray *)applicationIdentifiers mutableCopy];
  [v14 setApplicationIdentifiers:v17];

  v18 = [(NSURL *)self->_resourceUrl absoluteString];
  [v14 setResourceUrl:v18];

  v19 = [(BMSocialHighlightContact *)self->_sender proto];
  [v14 setSender:v19];

  [v14 setDomainIdentifier:self->_domainIdentifier];
  [v14 setBatchIdentifier:self->_batchIdentifier];
  [v14 setCalculatedFeatures:v3];
  [v14 setClientIdentifier:self->_clientIdentifier];
  contentCreationDate = self->_contentCreationDate;
  if (contentCreationDate)
  {
    [(NSDate *)contentCreationDate timeIntervalSinceReferenceDate];
    objc_msgSend(v14, "setContentCreationSecondsSinceReferenceDate:");
  }
  [v14 setGroupPhotoPathDigest:self->_groupPhotoPathDigest];
  [v14 setDisplayName:self->_displayName];
  isPrimary = self->_isPrimary;
  if (isPrimary) {
    objc_msgSend(v14, "setIsPrimary:", -[NSNumber BOOLValue](isPrimary, "BOOLValue"));
  }
  [v14 setAttributionIdentifier:self->_attributionIdentifier];
  rank = self->_rank;
  if (rank) {
    objc_msgSend(v14, "setRank:", -[NSNumber unsignedIntegerValue](rank, "unsignedIntegerValue"));
  }
  score = self->_score;
  if (score)
  {
    [(NSNumber *)score doubleValue];
    objc_msgSend(v14, "setScore:");
  }
  isConversationAutoDonating = self->_isConversationAutoDonating;
  if (isConversationAutoDonating) {
    objc_msgSend(v14, "setIsConversationAutoDonating:", -[NSNumber BOOLValue](isConversationAutoDonating, "BOOLValue"));
  }
  rankingDate = self->_rankingDate;
  if (rankingDate)
  {
    [(NSDate *)rankingDate timeIntervalSinceReferenceDate];
    objc_msgSend(v14, "setRankingSecondsSinceReferenceDate:");
  }
  [v14 setResolvedUrl:self->_resolvedUrl];
  [v14 setClientVariant:self->_clientVariant];

  return v14;
}

- (NSString)highlightIdentifier
{
  return self->_highlightIdentifier;
}

- (unint64_t)highlightType
{
  return self->_highlightType;
}

- (NSDate)syndicationDate
{
  return self->_syndicationDate;
}

- (NSString)sourceBundleId
{
  return self->_sourceBundleId;
}

- (NSArray)applicationIdentifiers
{
  return self->_applicationIdentifiers;
}

- (NSURL)resourceUrl
{
  return self->_resourceUrl;
}

- (BMSocialHighlightContact)sender
{
  return self->_sender;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (NSString)batchIdentifier
{
  return self->_batchIdentifier;
}

- (NSDictionary)calculatedFeatures
{
  return self->_calculatedFeatures;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSDate)contentCreationDate
{
  return self->_contentCreationDate;
}

- (NSString)groupPhotoPathDigest
{
  return self->_groupPhotoPathDigest;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSNumber)isPrimary
{
  return self->_isPrimary;
}

- (NSString)attributionIdentifier
{
  return self->_attributionIdentifier;
}

- (NSNumber)rank
{
  return self->_rank;
}

- (NSNumber)score
{
  return self->_score;
}

- (NSNumber)isConversationAutoDonating
{
  return self->_isConversationAutoDonating;
}

- (NSString)originatingDeviceId
{
  return self->_originatingDeviceId;
}

- (NSDate)rankingDate
{
  return self->_rankingDate;
}

- (NSString)resolvedUrl
{
  return self->_resolvedUrl;
}

- (NSString)clientVariant
{
  return self->_clientVariant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientVariant, 0);
  objc_storeStrong((id *)&self->_resolvedUrl, 0);
  objc_storeStrong((id *)&self->_rankingDate, 0);
  objc_storeStrong((id *)&self->_originatingDeviceId, 0);
  objc_storeStrong((id *)&self->_isConversationAutoDonating, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_rank, 0);
  objc_storeStrong((id *)&self->_attributionIdentifier, 0);
  objc_storeStrong((id *)&self->_isPrimary, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_groupPhotoPathDigest, 0);
  objc_storeStrong((id *)&self->_contentCreationDate, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_calculatedFeatures, 0);
  objc_storeStrong((id *)&self->_batchIdentifier, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_resourceUrl, 0);
  objc_storeStrong((id *)&self->_applicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_sourceBundleId, 0);
  objc_storeStrong((id *)&self->_syndicationDate, 0);

  objc_storeStrong((id *)&self->_highlightIdentifier, 0);
}

- (BMRankableSocialHighlight)initWithHighlightIdentifier:(id)a3 highlightType:(unint64_t)a4 syndicationDate:(id)a5 sourceBundleId:(id)a6 applicationIdentifiers:(id)a7 resourceUrl:(id)a8 sender:(id)a9 domainIdentifier:(id)a10 batchIdentifier:(id)a11 calculatedFeatures:(id)a12 clientIdentifier:(id)a13 contentCreationDate:(id)a14 groupPhotoPath:(id)a15 displayName:(id)a16 isPrimary:(id)a17 attributionIdentifier:(id)a18 rank:(id)a19 score:(id)a20 isConversationAutoDonating:(id)a21 originatingDeviceId:(id)a22 rankingDate:(id)a23 resolvedUrl:(id)a24
{
  id v54 = a3;
  id v53 = a5;
  id v52 = a6;
  id v51 = a7;
  id v46 = a8;
  id v50 = a9;
  id v49 = a10;
  id v45 = a11;
  id v48 = a12;
  id v47 = a13;
  id v28 = a14;
  id v29 = a15;
  id v41 = a16;
  id v30 = a17;
  id v40 = a18;
  id v31 = a19;
  id v32 = a20;
  id v33 = a21;
  id v34 = a22;
  id v35 = a23;
  id v36 = a24;
  if ([v29 hasPrefix:@"file://"])
  {
    bm_sha256(v29);
    id v37 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v37 = v29;
  }
  v38 = v37;
  int v44 = -[BMRankableSocialHighlight initWithHighlightIdentifier:highlightType:syndicationDate:sourceBundleId:applicationIdentifiers:resourceUrl:sender:domainIdentifier:batchIdentifier:calculatedFeatures:clientIdentifier:contentCreationDate:groupPhotoPathDigest:displayName:isPrimary:attributionIdentifier:rank:score:isConversationAutoDonating:originatingDeviceId:rankingDate:resolvedUrl:clientVariant:](self, "initWithHighlightIdentifier:highlightType:syndicationDate:sourceBundleId:applicationIdentifiers:resourceUrl:sender:domainIdentifier:batchIdentifier:calculatedFeatures:clientIdentifier:contentCreationDate:groupPhotoPathDigest:displayName:isPrimary:attributionIdentifier:rank:score:isConversationAutoDonating:originatingDeviceId:rankingDate:resolvedUrl:clientVariant:", v54, a4, v53, v52, v51, v46, v50, v49, v45, v48, v47, v28, v37, v41,
          v30,
          v40,
          v31,
          v32,
          v33,
          v34,
          v35,
          v36,
          0);

  return v44;
}

- (BMRankableSocialHighlight)initWithHighlightIdentifier:(id)a3 highlightType:(unint64_t)a4 syndicationDate:(id)a5 sourceBundleId:(id)a6 applicationIdentifiers:(id)a7 resourceUrl:(id)a8 sender:(id)a9 domainIdentifier:(id)a10 batchIdentifier:(id)a11 calculatedFeatures:(id)a12 clientIdentifier:(id)a13 contentCreationDate:(id)a14 groupPhotoPathDigest:(id)a15 displayName:(id)a16 isPrimary:(id)a17 attributionIdentifier:(id)a18 rank:(id)a19 score:(id)a20 isConversationAutoDonating:(id)a21 originatingDeviceId:(id)a22 rankingDate:(id)a23 resolvedUrl:(id)a24
{
  return -[BMRankableSocialHighlight initWithHighlightIdentifier:highlightType:syndicationDate:sourceBundleId:applicationIdentifiers:resourceUrl:sender:domainIdentifier:batchIdentifier:calculatedFeatures:clientIdentifier:contentCreationDate:groupPhotoPathDigest:displayName:isPrimary:attributionIdentifier:rank:score:isConversationAutoDonating:originatingDeviceId:rankingDate:resolvedUrl:clientVariant:](self, "initWithHighlightIdentifier:highlightType:syndicationDate:sourceBundleId:applicationIdentifiers:resourceUrl:sender:domainIdentifier:batchIdentifier:calculatedFeatures:clientIdentifier:contentCreationDate:groupPhotoPathDigest:displayName:isPrimary:attributionIdentifier:rank:score:isConversationAutoDonating:originatingDeviceId:rankingDate:resolvedUrl:clientVariant:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           0);
}

- (void)_socialHighlightTypeForProtoType:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMRankableSocialHighlight: unable to convert BMPBSocialHighlightType enum value: %@", v4, v5, v6, v7, v8);
}

- (void)_protoType
{
  v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "highlightType"));
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMRankableSocialHighlight: unable to convert BMSocialHighlightType enum value: %@", v4, v5, v6, v7, v8);
}

@end