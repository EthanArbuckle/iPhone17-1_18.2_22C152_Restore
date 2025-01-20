@interface BMMailCategorization
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMailCategorization)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMailCategorization)initWithMessageId:(id)a3 eventType:(id)a4 trialExperimentId:(id)a5 trialExperimentDeploymentId:(id)a6 trialExperimentTreatmentId:(id)a7 trialRolloutId:(id)a8 trialRolloutDeploymentId:(id)a9 trialRolloutFactorPackId:(id)a10 predictedCategory:(int)a11 blackPearlModelVersion:(id)a12 blackPearlSenderModelVersion:(id)a13 blackPearlFinalRuleVersion:(id)a14 blackPearlBreakthroughVersion:(id)a15 reasonCodes:(id)a16 currCategoryView:(int)a17 prevCategoryView:(int)a18 isBreakthrough:(id)a19 isBlackPearlEnabled:(id)a20 elapsedTimeSinceEmailReceived:(id)a21 recategorizationBy:(int)a22 isThread:(id)a23 senderId:(id)a24 receivingAccountDomain:(int)a25 hasIcloudAccountEnabled:(id)a26;
- (BMMailCategorization)initWithMessageId:(id)a3 eventType:(id)a4 trialExperimentId:(id)a5 trialExperimentDeploymentId:(id)a6 trialExperimentTreatmentId:(id)a7 trialRolloutId:(id)a8 trialRolloutDeploymentId:(id)a9 trialRolloutFactorPackId:(id)a10 predictedCategory:(int)a11 blackPearlModelVersion:(id)a12 blackPearlSenderModelVersion:(id)a13 blackPearlFinalRuleVersion:(id)a14 blackPearlBreakthroughVersion:(id)a15 reasonCodes:(id)a16 currMailbox:(int)a17 prevMailbox:(int)a18 isBreakthrough:(id)a19 isBlackPearlEnabled:(id)a20 elapsedTimeSinceEmailReceived:(id)a21 recategorizationBy:(int)a22 isThread:(id)a23;
- (BOOL)hasHasIcloudAccountEnabled;
- (BOOL)hasIcloudAccountEnabled;
- (BOOL)hasIsBlackPearlEnabled;
- (BOOL)hasIsBreakthrough;
- (BOOL)hasIsThread;
- (BOOL)isBlackPearlEnabled;
- (BOOL)isBreakthrough;
- (BOOL)isEqual:(id)a3;
- (BOOL)isThread;
- (NSString)blackPearlBreakthroughVersion;
- (NSString)blackPearlFinalRuleVersion;
- (NSString)blackPearlModelVersion;
- (NSString)blackPearlSenderModelVersion;
- (NSString)description;
- (NSString)elapsedTimeSinceEmailReceived;
- (NSString)eventType;
- (NSString)messageId;
- (NSString)reasonCodes;
- (NSString)senderId;
- (NSString)trialExperimentDeploymentId;
- (NSString)trialExperimentId;
- (NSString)trialExperimentTreatmentId;
- (NSString)trialRolloutDeploymentId;
- (NSString)trialRolloutFactorPackId;
- (NSString)trialRolloutId;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)currCategoryView;
- (int)predictedCategory;
- (int)prevCategoryView;
- (int)recategorizationBy;
- (int)receivingAccountDomain;
- (unsigned)dataVersion;
- (void)setHasHasIcloudAccountEnabled:(BOOL)a3;
- (void)setHasIsBlackPearlEnabled:(BOOL)a3;
- (void)setHasIsBreakthrough:(BOOL)a3;
- (void)setHasIsThread:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMailCategorization

- (BMMailCategorization)initWithMessageId:(id)a3 eventType:(id)a4 trialExperimentId:(id)a5 trialExperimentDeploymentId:(id)a6 trialExperimentTreatmentId:(id)a7 trialRolloutId:(id)a8 trialRolloutDeploymentId:(id)a9 trialRolloutFactorPackId:(id)a10 predictedCategory:(int)a11 blackPearlModelVersion:(id)a12 blackPearlSenderModelVersion:(id)a13 blackPearlFinalRuleVersion:(id)a14 blackPearlBreakthroughVersion:(id)a15 reasonCodes:(id)a16 currMailbox:(int)a17 prevMailbox:(int)a18 isBreakthrough:(id)a19 isBlackPearlEnabled:(id)a20 elapsedTimeSinceEmailReceived:(id)a21 recategorizationBy:(int)a22 isThread:(id)a23
{
  LODWORD(v26) = 0;
  LODWORD(v25) = a22;
  LODWORD(v24) = a11;
  return -[BMMailCategorization initWithMessageId:eventType:trialExperimentId:trialExperimentDeploymentId:trialExperimentTreatmentId:trialRolloutId:trialRolloutDeploymentId:trialRolloutFactorPackId:predictedCategory:blackPearlModelVersion:blackPearlSenderModelVersion:blackPearlFinalRuleVersion:blackPearlBreakthroughVersion:reasonCodes:currCategoryView:prevCategoryView:isBreakthrough:isBlackPearlEnabled:elapsedTimeSinceEmailReceived:recategorizationBy:isThread:senderId:receivingAccountDomain:hasIcloudAccountEnabled:](self, "initWithMessageId:eventType:trialExperimentId:trialExperimentDeploymentId:trialExperimentTreatmentId:trialRolloutId:trialRolloutDeploymentId:trialRolloutFactorPackId:predictedCategory:blackPearlModelVersion:blackPearlSenderModelVersion:blackPearlFinalRuleVersion:blackPearlBreakthroughVersion:reasonCodes:currCategoryView:prevCategoryView:isBreakthrough:isBlackPearlEnabled:elapsedTimeSinceEmailReceived:recategorizationBy:isThread:senderId:receivingAccountDomain:hasIcloudAccountEnabled:", a3, a4, a5, a6, a7, a8, a9, a10, v24, a12, a13, a14, a15,
           a16,
           __PAIR64__(a18, a17),
           a19,
           a20,
           a21,
           v25,
           a23,
           0,
           v26,
           0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderId, 0);
  objc_storeStrong((id *)&self->_elapsedTimeSinceEmailReceived, 0);
  objc_storeStrong((id *)&self->_reasonCodes, 0);
  objc_storeStrong((id *)&self->_blackPearlBreakthroughVersion, 0);
  objc_storeStrong((id *)&self->_blackPearlFinalRuleVersion, 0);
  objc_storeStrong((id *)&self->_blackPearlSenderModelVersion, 0);
  objc_storeStrong((id *)&self->_blackPearlModelVersion, 0);
  objc_storeStrong((id *)&self->_trialRolloutFactorPackId, 0);
  objc_storeStrong((id *)&self->_trialRolloutDeploymentId, 0);
  objc_storeStrong((id *)&self->_trialRolloutId, 0);
  objc_storeStrong((id *)&self->_trialExperimentTreatmentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentDeploymentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_eventType, 0);

  objc_storeStrong((id *)&self->_messageId, 0);
}

- (void)setHasHasIcloudAccountEnabled:(BOOL)a3
{
  self->_hasHasIcloudAccountEnabled = a3;
}

- (BOOL)hasHasIcloudAccountEnabled
{
  return self->_hasHasIcloudAccountEnabled;
}

- (BOOL)hasIcloudAccountEnabled
{
  return self->_hasIcloudAccountEnabled;
}

- (int)receivingAccountDomain
{
  return self->_receivingAccountDomain;
}

- (NSString)senderId
{
  return self->_senderId;
}

- (void)setHasIsThread:(BOOL)a3
{
  self->_hasIsThread = a3;
}

- (BOOL)hasIsThread
{
  return self->_hasIsThread;
}

- (BOOL)isThread
{
  return self->_isThread;
}

- (int)recategorizationBy
{
  return self->_recategorizationBy;
}

- (NSString)elapsedTimeSinceEmailReceived
{
  return self->_elapsedTimeSinceEmailReceived;
}

- (void)setHasIsBlackPearlEnabled:(BOOL)a3
{
  self->_hasIsBlackPearlEnabled = a3;
}

- (BOOL)hasIsBlackPearlEnabled
{
  return self->_hasIsBlackPearlEnabled;
}

- (BOOL)isBlackPearlEnabled
{
  return self->_isBlackPearlEnabled;
}

- (void)setHasIsBreakthrough:(BOOL)a3
{
  self->_hasIsBreakthrough = a3;
}

- (BOOL)hasIsBreakthrough
{
  return self->_hasIsBreakthrough;
}

- (BOOL)isBreakthrough
{
  return self->_isBreakthrough;
}

- (int)prevCategoryView
{
  return self->_prevCategoryView;
}

- (int)currCategoryView
{
  return self->_currCategoryView;
}

- (NSString)reasonCodes
{
  return self->_reasonCodes;
}

- (NSString)blackPearlBreakthroughVersion
{
  return self->_blackPearlBreakthroughVersion;
}

- (NSString)blackPearlFinalRuleVersion
{
  return self->_blackPearlFinalRuleVersion;
}

- (NSString)blackPearlSenderModelVersion
{
  return self->_blackPearlSenderModelVersion;
}

- (NSString)blackPearlModelVersion
{
  return self->_blackPearlModelVersion;
}

- (int)predictedCategory
{
  return self->_predictedCategory;
}

- (NSString)trialRolloutFactorPackId
{
  return self->_trialRolloutFactorPackId;
}

- (NSString)trialRolloutDeploymentId
{
  return self->_trialRolloutDeploymentId;
}

- (NSString)trialRolloutId
{
  return self->_trialRolloutId;
}

- (NSString)trialExperimentTreatmentId
{
  return self->_trialExperimentTreatmentId;
}

- (NSString)trialExperimentDeploymentId
{
  return self->_trialExperimentDeploymentId;
}

- (NSString)trialExperimentId
{
  return self->_trialExperimentId;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (NSString)messageId
{
  return self->_messageId;
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
    v6 = [(BMMailCategorization *)self messageId];
    uint64_t v7 = [v5 messageId];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMailCategorization *)self messageId];
      v10 = [v5 messageId];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_88;
      }
    }
    v13 = [(BMMailCategorization *)self eventType];
    uint64_t v14 = [v5 eventType];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMMailCategorization *)self eventType];
      v17 = [v5 eventType];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_88;
      }
    }
    v19 = [(BMMailCategorization *)self trialExperimentId];
    uint64_t v20 = [v5 trialExperimentId];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMMailCategorization *)self trialExperimentId];
      v23 = [v5 trialExperimentId];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_88;
      }
    }
    uint64_t v25 = [(BMMailCategorization *)self trialExperimentDeploymentId];
    uint64_t v26 = [v5 trialExperimentDeploymentId];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMMailCategorization *)self trialExperimentDeploymentId];
      v29 = [v5 trialExperimentDeploymentId];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_88;
      }
    }
    v31 = [(BMMailCategorization *)self trialExperimentTreatmentId];
    uint64_t v32 = [v5 trialExperimentTreatmentId];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMMailCategorization *)self trialExperimentTreatmentId];
      v35 = [v5 trialExperimentTreatmentId];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_88;
      }
    }
    v37 = [(BMMailCategorization *)self trialRolloutId];
    uint64_t v38 = [v5 trialRolloutId];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMMailCategorization *)self trialRolloutId];
      v41 = [v5 trialRolloutId];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_88;
      }
    }
    v43 = [(BMMailCategorization *)self trialRolloutDeploymentId];
    uint64_t v44 = [v5 trialRolloutDeploymentId];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(BMMailCategorization *)self trialRolloutDeploymentId];
      v47 = [v5 trialRolloutDeploymentId];
      int v48 = [v46 isEqual:v47];

      if (!v48) {
        goto LABEL_88;
      }
    }
    v49 = [(BMMailCategorization *)self trialRolloutFactorPackId];
    uint64_t v50 = [v5 trialRolloutFactorPackId];
    if (v49 == (void *)v50)
    {
    }
    else
    {
      v51 = (void *)v50;
      v52 = [(BMMailCategorization *)self trialRolloutFactorPackId];
      v53 = [v5 trialRolloutFactorPackId];
      int v54 = [v52 isEqual:v53];

      if (!v54) {
        goto LABEL_88;
      }
    }
    int v55 = [(BMMailCategorization *)self predictedCategory];
    if (v55 == [v5 predictedCategory])
    {
      v56 = [(BMMailCategorization *)self blackPearlModelVersion];
      uint64_t v57 = [v5 blackPearlModelVersion];
      if (v56 == (void *)v57)
      {
      }
      else
      {
        v58 = (void *)v57;
        v59 = [(BMMailCategorization *)self blackPearlModelVersion];
        v60 = [v5 blackPearlModelVersion];
        int v61 = [v59 isEqual:v60];

        if (!v61) {
          goto LABEL_88;
        }
      }
      v62 = [(BMMailCategorization *)self blackPearlSenderModelVersion];
      uint64_t v63 = [v5 blackPearlSenderModelVersion];
      if (v62 == (void *)v63)
      {
      }
      else
      {
        v64 = (void *)v63;
        v65 = [(BMMailCategorization *)self blackPearlSenderModelVersion];
        v66 = [v5 blackPearlSenderModelVersion];
        int v67 = [v65 isEqual:v66];

        if (!v67) {
          goto LABEL_88;
        }
      }
      v68 = [(BMMailCategorization *)self blackPearlFinalRuleVersion];
      uint64_t v69 = [v5 blackPearlFinalRuleVersion];
      if (v68 == (void *)v69)
      {
      }
      else
      {
        v70 = (void *)v69;
        v71 = [(BMMailCategorization *)self blackPearlFinalRuleVersion];
        v72 = [v5 blackPearlFinalRuleVersion];
        int v73 = [v71 isEqual:v72];

        if (!v73) {
          goto LABEL_88;
        }
      }
      v74 = [(BMMailCategorization *)self blackPearlBreakthroughVersion];
      uint64_t v75 = [v5 blackPearlBreakthroughVersion];
      if (v74 == (void *)v75)
      {
      }
      else
      {
        v76 = (void *)v75;
        v77 = [(BMMailCategorization *)self blackPearlBreakthroughVersion];
        v78 = [v5 blackPearlBreakthroughVersion];
        int v79 = [v77 isEqual:v78];

        if (!v79) {
          goto LABEL_88;
        }
      }
      v80 = [(BMMailCategorization *)self reasonCodes];
      uint64_t v81 = [v5 reasonCodes];
      if (v80 == (void *)v81)
      {
      }
      else
      {
        v82 = (void *)v81;
        v83 = [(BMMailCategorization *)self reasonCodes];
        v84 = [v5 reasonCodes];
        int v85 = [v83 isEqual:v84];

        if (!v85) {
          goto LABEL_88;
        }
      }
      int v86 = [(BMMailCategorization *)self currCategoryView];
      if (v86 != [v5 currCategoryView]) {
        goto LABEL_88;
      }
      int v87 = [(BMMailCategorization *)self prevCategoryView];
      if (v87 != [v5 prevCategoryView]) {
        goto LABEL_88;
      }
      if ([(BMMailCategorization *)self hasIsBreakthrough]
        || [v5 hasIsBreakthrough])
      {
        if (![(BMMailCategorization *)self hasIsBreakthrough]) {
          goto LABEL_88;
        }
        if (![v5 hasIsBreakthrough]) {
          goto LABEL_88;
        }
        int v88 = [(BMMailCategorization *)self isBreakthrough];
        if (v88 != [v5 isBreakthrough]) {
          goto LABEL_88;
        }
      }
      if ([(BMMailCategorization *)self hasIsBlackPearlEnabled]
        || [v5 hasIsBlackPearlEnabled])
      {
        if (![(BMMailCategorization *)self hasIsBlackPearlEnabled]) {
          goto LABEL_88;
        }
        if (![v5 hasIsBlackPearlEnabled]) {
          goto LABEL_88;
        }
        int v89 = [(BMMailCategorization *)self isBlackPearlEnabled];
        if (v89 != [v5 isBlackPearlEnabled]) {
          goto LABEL_88;
        }
      }
      v90 = [(BMMailCategorization *)self elapsedTimeSinceEmailReceived];
      uint64_t v91 = [v5 elapsedTimeSinceEmailReceived];
      if (v90 == (void *)v91)
      {
      }
      else
      {
        v92 = (void *)v91;
        v93 = [(BMMailCategorization *)self elapsedTimeSinceEmailReceived];
        v94 = [v5 elapsedTimeSinceEmailReceived];
        int v95 = [v93 isEqual:v94];

        if (!v95) {
          goto LABEL_88;
        }
      }
      int v96 = [(BMMailCategorization *)self recategorizationBy];
      if (v96 != [v5 recategorizationBy]) {
        goto LABEL_88;
      }
      if (-[BMMailCategorization hasIsThread](self, "hasIsThread") || [v5 hasIsThread])
      {
        if (![(BMMailCategorization *)self hasIsThread]) {
          goto LABEL_88;
        }
        if (![v5 hasIsThread]) {
          goto LABEL_88;
        }
        int v97 = [(BMMailCategorization *)self isThread];
        if (v97 != [v5 isThread]) {
          goto LABEL_88;
        }
      }
      v98 = [(BMMailCategorization *)self senderId];
      uint64_t v99 = [v5 senderId];
      if (v98 == (void *)v99)
      {
      }
      else
      {
        v100 = (void *)v99;
        v101 = [(BMMailCategorization *)self senderId];
        v102 = [v5 senderId];
        int v103 = [v101 isEqual:v102];

        if (!v103) {
          goto LABEL_88;
        }
      }
      int v104 = [(BMMailCategorization *)self receivingAccountDomain];
      if (v104 == [v5 receivingAccountDomain])
      {
        if (![(BMMailCategorization *)self hasHasIcloudAccountEnabled]
          && ![v5 hasHasIcloudAccountEnabled])
        {
          LOBYTE(v12) = 1;
          goto LABEL_89;
        }
        if ([(BMMailCategorization *)self hasHasIcloudAccountEnabled]
          && [v5 hasHasIcloudAccountEnabled])
        {
          BOOL v105 = [(BMMailCategorization *)self hasIcloudAccountEnabled];
          int v12 = v105 ^ [v5 hasIcloudAccountEnabled] ^ 1;
LABEL_89:

          goto LABEL_90;
        }
      }
    }
LABEL_88:
    LOBYTE(v12) = 0;
    goto LABEL_89;
  }
  LOBYTE(v12) = 0;
LABEL_90:

  return v12;
}

- (id)jsonDictionary
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMMailCategorization *)self messageId];
  uint64_t v4 = [(BMMailCategorization *)self eventType];
  uint64_t v5 = [(BMMailCategorization *)self trialExperimentId];
  v6 = [(BMMailCategorization *)self trialExperimentDeploymentId];
  uint64_t v7 = [(BMMailCategorization *)self trialExperimentTreatmentId];
  uint64_t v8 = [(BMMailCategorization *)self trialRolloutId];
  v77 = [(BMMailCategorization *)self trialRolloutDeploymentId];
  v76 = [(BMMailCategorization *)self trialRolloutFactorPackId];
  uint64_t v75 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorization predictedCategory](self, "predictedCategory"));
  v74 = [(BMMailCategorization *)self blackPearlModelVersion];
  int v73 = [(BMMailCategorization *)self blackPearlSenderModelVersion];
  v72 = [(BMMailCategorization *)self blackPearlFinalRuleVersion];
  v71 = [(BMMailCategorization *)self blackPearlBreakthroughVersion];
  v70 = [(BMMailCategorization *)self reasonCodes];
  v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorization currCategoryView](self, "currCategoryView"));
  v62 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorization prevCategoryView](self, "prevCategoryView"));
  if ([(BMMailCategorization *)self hasIsBreakthrough])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMailCategorization isBreakthrough](self, "isBreakthrough"));
    id v69 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v69 = 0;
  }
  if ([(BMMailCategorization *)self hasIsBlackPearlEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMailCategorization isBlackPearlEnabled](self, "isBlackPearlEnabled"));
    id v68 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v68 = 0;
  }
  int v67 = [(BMMailCategorization *)self elapsedTimeSinceEmailReceived];
  v66 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorization recategorizationBy](self, "recategorizationBy"));
  if ([(BMMailCategorization *)self hasIsThread])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMailCategorization isThread](self, "isThread"));
    id v65 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v65 = 0;
  }
  v64 = [(BMMailCategorization *)self senderId];
  uint64_t v63 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorization receivingAccountDomain](self, "receivingAccountDomain"));
  if ([(BMMailCategorization *)self hasHasIcloudAccountEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMailCategorization hasIcloudAccountEnabled](self, "hasIcloudAccountEnabled"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
  v78[0] = @"messageId";
  uint64_t v11 = v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v53 = (void *)v11;
  v90[0] = v11;
  v78[1] = @"eventType";
  uint64_t v12 = v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v52 = (void *)v12;
  v90[1] = v12;
  v78[2] = @"trialExperimentId";
  uint64_t v13 = v5;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v51 = (void *)v13;
  v90[2] = v13;
  v78[3] = @"trialExperimentDeploymentId";
  uint64_t v14 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v50 = (void *)v14;
  v90[3] = v14;
  v78[4] = @"trialExperimentTreatmentId";
  uint64_t v15 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v49 = (void *)v15;
  v90[4] = v15;
  v78[5] = @"trialRolloutId";
  uint64_t v16 = v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  int v48 = (void *)v16;
  v90[5] = v16;
  v78[6] = @"trialRolloutDeploymentId";
  uint64_t v17 = (uint64_t)v77;
  if (!v77)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v90[6] = v17;
  v78[7] = @"trialRolloutFactorPackId";
  uint64_t v18 = (uint64_t)v76;
  if (!v76)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v90[7] = v18;
  v78[8] = @"predictedCategory";
  uint64_t v19 = (uint64_t)v75;
  if (!v75)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v57 = (void *)v19;
  v90[8] = v19;
  v78[9] = @"blackPearlModelVersion";
  uint64_t v20 = (uint64_t)v74;
  if (!v74)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v56 = (void *)v20;
  v90[9] = v20;
  v78[10] = @"blackPearlSenderModelVersion";
  uint64_t v21 = (uint64_t)v73;
  if (!v73)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  int v55 = (void *)v21;
  v90[10] = v21;
  v78[11] = @"blackPearlFinalRuleVersion";
  uint64_t v22 = (uint64_t)v72;
  if (!v72)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v45 = (void *)v22;
  v90[11] = v22;
  v78[12] = @"blackPearlBreakthroughVersion";
  uint64_t v23 = (uint64_t)v71;
  if (!v71)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v44 = (void *)v23;
  int v61 = v10;
  v90[12] = v23;
  v78[13] = @"reasonCodes";
  uint64_t v24 = (uint64_t)v70;
  if (!v70)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v43 = (void *)v24;
  v90[13] = v24;
  v78[14] = @"currCategoryView";
  v46 = (void *)v18;
  if (v9)
  {
    uint64_t v91 = v9;
    int v79 = @"currMailbox";
    uint64_t v25 = (uint64_t)v9;
  }
  else
  {
    uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v91 = v38;
    int v79 = @"currMailbox";
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  int v42 = (void *)v25;
  uint64_t v92 = v25;
  v80 = @"prevCategoryView";
  if (v62)
  {
    v93 = v62;
    uint64_t v81 = @"prevMailbox";
    uint64_t v26 = (uint64_t)v62;
  }
  else
  {
    v37 = [MEMORY[0x1E4F1CA98] null];
    v93 = v37;
    uint64_t v81 = @"prevMailbox";
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v60 = (void *)v3;
  v41 = (void *)v26;
  uint64_t v94 = v26;
  v82 = @"isBreakthrough";
  uint64_t v27 = (uint64_t)v69;
  if (!v69)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v59 = (void *)v5;
  uint64_t v95 = v27;
  v83 = @"isBlackPearlEnabled";
  uint64_t v28 = (uint64_t)v68;
  if (!v68)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v58 = (void *)v4;
  uint64_t v96 = v28;
  v84 = @"elapsedTimeSinceEmailReceived";
  v29 = v67;
  if (!v67)
  {
    v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v39 = (void *)v28;
  v40 = (void *)v27;
  int v97 = v29;
  int v85 = @"recategorizationBy";
  int v30 = v66;
  if (!v66)
  {
    int v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v8;
  v98 = v30;
  int v86 = @"isThread";
  uint64_t v32 = v65;
  if (!v65)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v47 = (void *)v17;
  uint64_t v99 = v32;
  int v87 = @"senderId";
  v33 = v64;
  if (!v64)
  {
    v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v100 = v33;
  int v88 = @"receivingAccountDomain";
  v34 = v63;
  if (!v63)
  {
    v34 = [MEMORY[0x1E4F1CA98] null];
  }
  v101 = v34;
  int v89 = @"hasIcloudAccountEnabled";
  v35 = v61;
  if (!v61)
  {
    v35 = [MEMORY[0x1E4F1CA98] null];
  }
  v102 = v35;
  id v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v78 count:26];
  if (!v61) {

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
  if (!v62)
  }
  {
  }
  if (!v9)
  {
  }
  if (!v70) {

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

  if (v77)
  {
    if (v31) {
      goto LABEL_99;
    }
  }
  else
  {

    if (v31)
    {
LABEL_99:
      if (v7) {
        goto LABEL_100;
      }
      goto LABEL_109;
    }
  }

  if (v7)
  {
LABEL_100:
    if (v6) {
      goto LABEL_101;
    }
    goto LABEL_110;
  }
LABEL_109:

  if (v6)
  {
LABEL_101:
    if (v59) {
      goto LABEL_102;
    }
    goto LABEL_111;
  }
LABEL_110:

  if (v59)
  {
LABEL_102:
    if (v58) {
      goto LABEL_103;
    }
LABEL_112:

    if (v60) {
      goto LABEL_104;
    }
    goto LABEL_113;
  }
LABEL_111:

  if (!v58) {
    goto LABEL_112;
  }
LABEL_103:
  if (v60) {
    goto LABEL_104;
  }
LABEL_113:

LABEL_104:

  return v54;
}

- (BMMailCategorization)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v260[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"messageId"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
LABEL_4:
    uint64_t v8 = [v5 objectForKeyedSubscript:@"eventType"];
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v9 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
LABEL_7:
      id v10 = [v5 objectForKeyedSubscript:@"trialExperimentId"];
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v209 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v209 = v10;
LABEL_10:
        v212 = [v5 objectForKeyedSubscript:@"trialExperimentDeploymentId"];
        v204 = v6;
        if (!v212 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v207 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v207 = v212;
LABEL_13:
          uint64_t v11 = [v5 objectForKeyedSubscript:@"trialExperimentTreatmentId"];
          v208 = v11;
          v201 = a4;
          if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v205 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v205 = v11;
LABEL_16:
            uint64_t v12 = [v5 objectForKeyedSubscript:@"trialRolloutId"];
            v203 = (void *)v12;
            if (!v12 || (uint64_t v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v200 = 0;
              goto LABEL_19;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v200 = v13;
LABEL_19:
              uint64_t v14 = [v5 objectForKeyedSubscript:@"trialRolloutDeploymentId"];
              id v197 = v7;
              v198 = v10;
              if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v199 = 0;
                goto LABEL_22;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v199 = v14;
LABEL_22:
                uint64_t v15 = [v5 objectForKeyedSubscript:@"trialRolloutFactorPackId"];
                v190 = (void *)v15;
                if (!v15 || (uint64_t v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v194 = 0;
                  goto LABEL_25;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v194 = v16;
LABEL_25:
                  uint64_t v17 = [v5 objectForKeyedSubscript:@"predictedCategory"];
                  id v191 = v9;
                  v188 = (void *)v17;
                  if (!v17 || (uint64_t v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v189 = 0;
                    goto LABEL_68;
                  }
                  uint64_t v38 = v14;
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v189 = v18;
LABEL_67:

LABEL_68:
                    v58 = [v5 objectForKeyedSubscript:@"blackPearlModelVersion"];
                    if (!v58 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v187 = 0;
                      goto LABEL_71;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v187 = v58;
LABEL_71:
                      v193 = [v5 objectForKeyedSubscript:@"blackPearlSenderModelVersion"];
                      if (!v193 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v186 = 0;
                        goto LABEL_74;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v186 = v193;
LABEL_74:
                        v59 = [v5 objectForKeyedSubscript:@"blackPearlFinalRuleVersion"];
                        if (!v59 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v182 = 0;
                          goto LABEL_77;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          v182 = v59;
LABEL_77:
                          uint64_t v60 = [v5 objectForKeyedSubscript:@"blackPearlBreakthroughVersion"];
                          v180 = v58;
                          v183 = (void *)v60;
                          if (!v60 || (int v61 = (void *)v60, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v185 = 0;
                            goto LABEL_80;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v185 = v61;
LABEL_80:
                            v62 = [v5 objectForKeyedSubscript:@"reasonCodes"];
                            if (!v62 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              id v181 = 0;
                              goto LABEL_83;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v181 = v62;
LABEL_83:
                              v173 = v62;
                              uint64_t v63 = [v5 objectForKeyedSubscript:@"currCategoryView"];
                              if (v63)
                              {
                                id v64 = v63;
                              }
                              else
                              {
                                id v64 = [v5 objectForKeyedSubscript:@"currMailbox"];

                                if (!v64)
                                {
                                  v175 = 0;
                                  goto LABEL_120;
                                }
                              }
                              objc_opt_class();
                              v175 = v64;
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                              {
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v179 = v64;
                                }
                                else
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    if (!v201)
                                    {
                                      id v179 = 0;
                                      uint64_t v22 = 0;
                                      id v54 = v190;
                                      id v69 = v182;
                                      v76 = v173;
                                      goto LABEL_212;
                                    }
                                    id v98 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v99 = *MEMORY[0x1E4F502C8];
                                    uint64_t v231 = *MEMORY[0x1E4F28568];
                                    id v174 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"currCategoryView"];
                                    id v232 = v174;
                                    uint64_t v100 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v232 forKeys:&v231 count:1];
                                    id v179 = 0;
                                    uint64_t v22 = 0;
                                    id *v201 = (id)[v98 initWithDomain:v99 code:2 userInfo:v100];
                                    id v54 = v190;
                                    id v69 = v182;
                                    id v84 = (id)v100;
                                    goto LABEL_239;
                                  }
                                  id v77 = v64;
                                  id v179 = [NSNumber numberWithInt:BMMailCategorizationMailboxTypeFromString(v77)];
                                }
LABEL_121:
                                v83 = [v5 objectForKeyedSubscript:@"prevCategoryView"];
                                if (v83)
                                {
                                  id v84 = v83;
                                }
                                else
                                {
                                  id v84 = [v5 objectForKeyedSubscript:@"prevMailbox"];

                                  if (!v84)
                                  {
                                    id v176 = 0;
                                    goto LABEL_134;
                                  }
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v176 = v84;
LABEL_134:
                                  id v174 = 0;
                                  goto LABEL_135;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v174 = v84;
LABEL_130:
                                  id v176 = v84;

LABEL_135:
                                  uint64_t v86 = [v5 objectForKeyedSubscript:@"isBreakthrough"];
                                  v170 = (void *)v86;
                                  if (v86 && (int v87 = (void *)v86, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                  {
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (!v201)
                                      {
                                        id v172 = 0;
                                        uint64_t v22 = 0;
                                        id v54 = v190;
                                        id v84 = v176;
                                        id v69 = v182;
                                        v76 = v173;
                                        goto LABEL_209;
                                      }
                                      id v94 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v95 = *MEMORY[0x1E4F502C8];
                                      uint64_t v227 = *MEMORY[0x1E4F28568];
                                      id v96 = [NSString alloc];
                                      uint64_t v151 = objc_opt_class();
                                      int v97 = v96;
                                      uint64_t v11 = v208;
                                      id v171 = (id)[v97 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v151, @"isBreakthrough"];
                                      id v228 = v171;
                                      v169 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v228 forKeys:&v227 count:1];
                                      id v172 = 0;
                                      uint64_t v22 = 0;
                                      id *v201 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v95, 2);
                                      id v54 = v190;
                                      goto LABEL_235;
                                    }
                                    id v172 = v87;
                                  }
                                  else
                                  {
                                    id v172 = 0;
                                  }
                                  uint64_t v88 = [v5 objectForKeyedSubscript:@"isBlackPearlEnabled"];
                                  v169 = (void *)v88;
                                  if (!v88
                                    || (int v89 = (void *)v88, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    id v171 = 0;
                                    goto LABEL_141;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v171 = v89;
LABEL_141:
                                    uint64_t v90 = [v5 objectForKeyedSubscript:@"elapsedTimeSinceEmailReceived"];
                                    v167 = (void *)v90;
                                    if (!v90
                                      || (uint64_t v91 = (void *)v90, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      id v168 = 0;
LABEL_144:
                                      uint64_t v92 = [v5 objectForKeyedSubscript:@"recategorizationBy"];
                                      v178 = v59;
                                      v162 = (void *)v92;
                                      if (v92
                                        && (v93 = (void *)v92, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                      {
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          id v166 = v93;
                                        }
                                        else
                                        {
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                          {
                                            if (!v201)
                                            {
                                              id v166 = 0;
                                              uint64_t v22 = 0;
                                              id v54 = v190;
                                              id v84 = v176;
                                              goto LABEL_206;
                                            }
                                            id v145 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            uint64_t v146 = *MEMORY[0x1E4F502C8];
                                            uint64_t v221 = *MEMORY[0x1E4F28568];
                                            id v164 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"recategorizationBy"];
                                            id v222 = v164;
                                            v115 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v222 forKeys:&v221 count:1];
                                            id v147 = (id)[v145 initWithDomain:v146 code:2 userInfo:v115];
                                            id v166 = 0;
                                            uint64_t v22 = 0;
                                            id *v201 = v147;
                                            id v54 = v190;
                                            v114 = v176;
                                            goto LABEL_205;
                                          }
                                          id v113 = v93;
                                          id v166 = [NSNumber numberWithInt:BMMailCategorizationByTypeFromString(v113)];
                                        }
                                      }
                                      else
                                      {
                                        id v166 = 0;
                                      }
                                      v114 = v176;
                                      v115 = [v5 objectForKeyedSubscript:@"isThread"];
                                      if (v115 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                      {
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                        {
                                          if (!v201)
                                          {
                                            id v164 = 0;
                                            uint64_t v22 = 0;
                                            id v54 = v190;
                                            v114 = v176;
                                            goto LABEL_205;
                                          }
                                          id v165 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          uint64_t v121 = *MEMORY[0x1E4F502C8];
                                          uint64_t v219 = *MEMORY[0x1E4F28568];
                                          id v122 = [NSString alloc];
                                          uint64_t v153 = objc_opt_class();
                                          v123 = v122;
                                          uint64_t v11 = v208;
                                          id v163 = (id)[v123 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v153, @"isThread"];
                                          id v220 = v163;
                                          v160 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v220 forKeys:&v219 count:1];
                                          id v124 = (id)objc_msgSend(v165, "initWithDomain:code:userInfo:", v121, 2);
                                          id v164 = 0;
                                          uint64_t v22 = 0;
                                          id *v201 = v124;
                                          id v54 = v190;
                                          v114 = v176;
LABEL_204:

LABEL_205:
                                          id v84 = v114;
                                          goto LABEL_206;
                                        }
                                        v159 = v115;
                                        id v164 = v115;
                                      }
                                      else
                                      {
                                        v159 = v115;
                                        id v164 = 0;
                                      }
                                      uint64_t v116 = [v5 objectForKeyedSubscript:@"senderId"];
                                      v160 = (void *)v116;
                                      if (v116
                                        && (v117 = (void *)v116, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                      {
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                        {
                                          if (!v201)
                                          {
                                            id v163 = 0;
                                            uint64_t v22 = 0;
                                            id v54 = v190;
                                            v114 = v176;
                                            v115 = v159;
                                            goto LABEL_204;
                                          }
                                          id v125 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          uint64_t v126 = *MEMORY[0x1E4F502C8];
                                          uint64_t v217 = *MEMORY[0x1E4F28568];
                                          id v161 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"senderId"];
                                          id v218 = v161;
                                          v158 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v218 forKeys:&v217 count:1];
                                          id v163 = 0;
                                          uint64_t v22 = 0;
                                          id *v201 = (id)objc_msgSend(v125, "initWithDomain:code:userInfo:", v126, 2);
                                          id v54 = v190;
                                          v114 = v176;
                                          goto LABEL_203;
                                        }
                                        id v163 = v117;
                                      }
                                      else
                                      {
                                        id v163 = 0;
                                      }
                                      uint64_t v118 = [v5 objectForKeyedSubscript:@"receivingAccountDomain"];
                                      v158 = (void *)v118;
                                      if (v118
                                        && (v119 = (void *)v118, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                      {
                                        v120 = v14;
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          id v161 = v119;
                                        }
                                        else
                                        {
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                          {
                                            if (!v201)
                                            {
                                              id v161 = 0;
                                              uint64_t v22 = 0;
                                              goto LABEL_202;
                                            }
                                            id v148 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            uint64_t v177 = *MEMORY[0x1E4F502C8];
                                            uint64_t v215 = *MEMORY[0x1E4F28568];
                                            v137 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"receivingAccountDomain"];
                                            v216 = v137;
                                            uint64_t v149 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v216 forKeys:&v215 count:1];
                                            id v150 = (id)[v148 initWithDomain:v177 code:2 userInfo:v149];
                                            id v161 = 0;
                                            uint64_t v22 = 0;
                                            id *v201 = v150;
                                            v128 = (void *)v149;
                                            uint64_t v14 = v120;
                                            goto LABEL_201;
                                          }
                                          id v127 = v119;
                                          id v161 = [NSNumber numberWithInt:BMMailCategorizationDomainFromString(v127)];
                                        }
                                      }
                                      else
                                      {
                                        id v161 = 0;
                                      }
                                      v128 = [v5 objectForKeyedSubscript:@"hasIcloudAccountEnabled"];
                                      v196 = v8;
                                      if (v128 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                      {
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                        {
                                          if (v201)
                                          {
                                            id v139 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            v140 = v128;
                                            uint64_t v141 = *MEMORY[0x1E4F502C8];
                                            uint64_t v213 = *MEMORY[0x1E4F28568];
                                            v142 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"hasIcloudAccountEnabled"];
                                            v214 = v142;
                                            v143 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v214 forKeys:&v213 count:1];
                                            uint64_t v144 = v141;
                                            v128 = v140;
                                            uint64_t v8 = v196;
                                            id *v201 = (id)[v139 initWithDomain:v144 code:2 userInfo:v143];

                                            uint64_t v11 = v208;
                                          }
                                          v137 = 0;
                                          uint64_t v22 = 0;
                                          goto LABEL_201;
                                        }
                                        id v129 = v199;
                                        v202 = v14;
                                        id v130 = v191;
                                        v131 = self;
                                        v157 = v128;
                                        id v132 = v128;
                                      }
                                      else
                                      {
                                        v157 = v128;
                                        id v129 = v199;
                                        v202 = v14;
                                        id v130 = v191;
                                        v131 = self;
                                        id v132 = 0;
                                      }
                                      int v133 = [v189 intValue];
                                      unsigned int v134 = [v179 intValue];
                                      unsigned int v135 = [v174 intValue];
                                      int v136 = [v166 intValue];
                                      v137 = v132;
                                      LODWORD(v156) = [v161 intValue];
                                      LODWORD(v155) = v136;
                                      LODWORD(v154) = v133;
                                      id v199 = v129;
                                      uint64_t v22 = objc_retain(-[BMMailCategorization initWithMessageId:eventType:trialExperimentId:trialExperimentDeploymentId:trialExperimentTreatmentId:trialRolloutId:trialRolloutDeploymentId:trialRolloutFactorPackId:predictedCategory:blackPearlModelVersion:blackPearlSenderModelVersion:blackPearlFinalRuleVersion:blackPearlBreakthroughVersion:reasonCodes:currCategoryView:prevCategoryView:isBreakthrough:isBlackPearlEnabled:elapsedTimeSinceEmailReceived:recategorizationBy:isThread:senderId:receivingAccountDomain:hasIcloudAccountEnabled:](v131, "initWithMessageId:eventType:trialExperimentId:trialExperimentDeploymentId:trialExperimentTreatmentId:trialRolloutId:trialRolloutDeploymentId:trialRolloutFactorPackId:predictedCategory:blackPearlModelVersion:blackPearlSenderModelVersion:blackPearlFinalRuleVersion:blackPearlBreakthroughVersion:reasonCodes:currCategoryView:prevCategoryView:isBreakthrough:isBlackPearlEnabled:elapsedTimeSinceEmailReceived:recategorizationBy:isThread:senderId:receivingAccountDomain:hasIcloudAccountEnabled:", v197, v130, v209, v207, v205, v200, v129, v194, v154, v187,
                                                v186,
                                                v182,
                                                v185,
                                                v181,
                                                __PAIR64__(v135, v134),
                                                v172,
                                                v171,
                                                v168,
                                                v155,
                                                v164,
                                                v163,
                                                v156,
                                                v132));
                                      self = v22;
                                      uint64_t v8 = v196;
                                      uint64_t v11 = v208;
                                      uint64_t v14 = v202;
                                      v114 = v176;
                                      v128 = v157;
LABEL_201:

LABEL_202:
                                      id v54 = v190;
                                      v59 = v178;
LABEL_203:
                                      v115 = v159;

                                      goto LABEL_204;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v168 = v91;
                                      goto LABEL_144;
                                    }
                                    v101 = v59;
                                    if (v201)
                                    {
                                      id v111 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v112 = *MEMORY[0x1E4F502C8];
                                      uint64_t v223 = *MEMORY[0x1E4F28568];
                                      id v166 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"elapsedTimeSinceEmailReceived"];
                                      id v224 = v166;
                                      v162 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v224 forKeys:&v223 count:1];
                                      id v168 = 0;
                                      uint64_t v22 = 0;
                                      id *v201 = (id)objc_msgSend(v111, "initWithDomain:code:userInfo:", v112, 2);
                                      id v54 = v190;
                                      id v84 = v176;
LABEL_206:
                                      v76 = v173;

                                      id v69 = v182;
LABEL_207:

LABEL_208:
LABEL_209:
                                      v110 = v170;
                                      goto LABEL_210;
                                    }
                                    id v168 = 0;
                                    uint64_t v22 = 0;
LABEL_241:
                                    id v54 = v190;
                                    v59 = v101;
                                    id v69 = v182;
                                    v76 = v173;
                                    id v84 = v176;
                                    goto LABEL_207;
                                  }
                                  v101 = v59;
                                  if (v201)
                                  {
                                    id v102 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v103 = *MEMORY[0x1E4F502C8];
                                    uint64_t v225 = *MEMORY[0x1E4F28568];
                                    id v104 = [NSString alloc];
                                    uint64_t v152 = objc_opt_class();
                                    BOOL v105 = v104;
                                    uint64_t v11 = v208;
                                    id v168 = (id)[v105 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v152, @"isBlackPearlEnabled"];
                                    id v226 = v168;
                                    v167 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v226 forKeys:&v225 count:1];
                                    id v171 = 0;
                                    uint64_t v22 = 0;
                                    id *v201 = (id)objc_msgSend(v102, "initWithDomain:code:userInfo:", v103, 2);
                                    goto LABEL_241;
                                  }
                                  id v171 = 0;
                                  uint64_t v22 = 0;
                                  id v54 = v190;
LABEL_235:
                                  id v69 = v182;
                                  v76 = v173;
                                  id v84 = v176;
                                  goto LABEL_208;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v85 = v84;
                                  id v174 = [NSNumber numberWithInt:BMMailCategorizationMailboxTypeFromString(v85)];

                                  goto LABEL_130;
                                }
                                if (v201)
                                {
                                  id v106 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  uint64_t v107 = *MEMORY[0x1E4F502C8];
                                  uint64_t v229 = *MEMORY[0x1E4F28568];
                                  id v172 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"prevCategoryView"];
                                  id v230 = v172;
                                  uint64_t v108 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v230 forKeys:&v229 count:1];
                                  id v109 = (id)[v106 initWithDomain:v107 code:2 userInfo:v108];
                                  v110 = (void *)v108;
                                  id v174 = 0;
                                  uint64_t v22 = 0;
                                  id *v201 = v109;
                                  id v54 = v190;
                                  id v69 = v182;
                                  v76 = v173;
LABEL_210:

LABEL_211:
                                  goto LABEL_212;
                                }
                                id v174 = 0;
                                uint64_t v22 = 0;
                                id v54 = v190;
                                id v69 = v182;
LABEL_239:
                                v76 = v173;
                                goto LABEL_211;
                              }
LABEL_120:
                              id v179 = 0;
                              goto LABEL_121;
                            }
                            if (v201)
                            {
                              id v81 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v82 = *MEMORY[0x1E4F502C8];
                              uint64_t v233 = *MEMORY[0x1E4F28568];
                              v76 = v62;
                              id v179 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"reasonCodes"];
                              id v234 = v179;
                              v175 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v234 forKeys:&v233 count:1];
                              id v181 = 0;
                              uint64_t v22 = 0;
                              id *v201 = (id)objc_msgSend(v81, "initWithDomain:code:userInfo:", v82, 2);
                              id v54 = v190;
                              id v69 = v182;
LABEL_212:

                              goto LABEL_213;
                            }
                            id v181 = 0;
                            uint64_t v22 = 0;
                            id v54 = v190;
                            v76 = v62;
                            id v69 = v182;
LABEL_213:

                            v58 = v180;
                            goto LABEL_214;
                          }
                          if (v201)
                          {
                            id v74 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v75 = *MEMORY[0x1E4F502C8];
                            uint64_t v235 = *MEMORY[0x1E4F28568];
                            id v181 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"blackPearlBreakthroughVersion"];
                            id v236 = v181;
                            v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v236 forKeys:&v235 count:1];
                            id v185 = 0;
                            uint64_t v22 = 0;
                            id *v201 = (id)[v74 initWithDomain:v75 code:2 userInfo:v76];
                            id v54 = v190;
                            id v69 = v182;
                            goto LABEL_213;
                          }
                          id v185 = 0;
                          uint64_t v22 = 0;
                          id v54 = v190;
                          id v69 = v182;
LABEL_214:

                          goto LABEL_215;
                        }
                        id v69 = v201;
                        if (v201)
                        {
                          id v184 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v71 = *MEMORY[0x1E4F502C8];
                          uint64_t v237 = *MEMORY[0x1E4F28568];
                          id v185 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"blackPearlFinalRuleVersion"];
                          id v238 = v185;
                          uint64_t v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v238 forKeys:&v237 count:1];
                          int v73 = v184;
                          v183 = (void *)v72;
                          uint64_t v22 = 0;
                          id *v201 = (id)objc_msgSend(v73, "initWithDomain:code:userInfo:", v71, 2);
                          id v69 = 0;
                          id v54 = v190;
                          goto LABEL_214;
                        }
                        uint64_t v22 = 0;
LABEL_164:
                        uint64_t v11 = v208;
                        id v54 = v190;
LABEL_215:

                        goto LABEL_216;
                      }
                      if (v201)
                      {
                        id v67 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v68 = *MEMORY[0x1E4F502C8];
                        uint64_t v239 = *MEMORY[0x1E4F28568];
                        id v69 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"blackPearlSenderModelVersion"];
                        v240 = v69;
                        uint64_t v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v240 forKeys:&v239 count:1];
                        id v186 = 0;
                        uint64_t v22 = 0;
                        id *v201 = (id)[v67 initWithDomain:v68 code:2 userInfo:v70];
                        v59 = (void *)v70;
                        goto LABEL_164;
                      }
                      id v186 = 0;
                      uint64_t v22 = 0;
LABEL_158:
                      id v54 = v190;
LABEL_216:

                      id v10 = v198;
                      goto LABEL_217;
                    }
                    if (v201)
                    {
                      id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v66 = *MEMORY[0x1E4F502C8];
                      uint64_t v241 = *MEMORY[0x1E4F28568];
                      id v186 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"blackPearlModelVersion"];
                      id v242 = v186;
                      v193 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v242 forKeys:&v241 count:1];
                      id v187 = 0;
                      uint64_t v22 = 0;
                      id *v201 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v66, 2);
                      goto LABEL_158;
                    }
                    id v187 = 0;
                    uint64_t v22 = 0;
LABEL_132:
                    id v54 = v190;
LABEL_217:

                    id v9 = v191;
                    goto LABEL_218;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v57 = v18;
                    id v189 = [NSNumber numberWithInt:BMMailCategorizationCategoryFromString(v57)];

                    goto LABEL_67;
                  }
                  if (v201)
                  {
                    id v78 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v79 = *MEMORY[0x1E4F502C8];
                    uint64_t v243 = *MEMORY[0x1E4F28568];
                    id v187 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"predictedCategory"];
                    id v244 = v187;
                    uint64_t v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v244 forKeys:&v243 count:1];
                    id v189 = 0;
                    uint64_t v22 = 0;
                    id *v201 = (id)[v78 initWithDomain:v79 code:2 userInfo:v80];
                    v58 = (void *)v80;
                    uint64_t v14 = v38;
                    goto LABEL_132;
                  }
                  id v189 = 0;
                  uint64_t v22 = 0;
                  id v54 = v190;
LABEL_218:

                  goto LABEL_219;
                }
                if (v201)
                {
                  id v195 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v55 = *MEMORY[0x1E4F502C8];
                  uint64_t v245 = *MEMORY[0x1E4F28568];
                  id v54 = v190;
                  id v189 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"trialRolloutFactorPackId"];
                  id v246 = v189;
                  v188 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v246 forKeys:&v245 count:1];
                  id v56 = (id)objc_msgSend(v195, "initWithDomain:code:userInfo:", v55, 2);
                  id v194 = 0;
                  uint64_t v22 = 0;
                  id *v201 = v56;
                  goto LABEL_218;
                }
                id v194 = 0;
                uint64_t v22 = 0;
                id v54 = v190;
LABEL_219:

                id v7 = v197;
                goto LABEL_220;
              }
              if (v201)
              {
                id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v52 = *MEMORY[0x1E4F502C8];
                uint64_t v247 = *MEMORY[0x1E4F28568];
                id v194 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"trialRolloutDeploymentId"];
                id v248 = v194;
                uint64_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v248 forKeys:&v247 count:1];
                id v199 = 0;
                uint64_t v22 = 0;
                id *v201 = (id)[v51 initWithDomain:v52 code:2 userInfo:v53];
                id v54 = (void *)v53;
                uint64_t v11 = v208;
                goto LABEL_219;
              }
              id v199 = 0;
              uint64_t v22 = 0;
LABEL_220:

              v6 = v204;
              goto LABEL_221;
            }
            if (v201)
            {
              id v44 = objc_alloc(MEMORY[0x1E4F28C58]);
              id v45 = v7;
              id v46 = v44;
              v47 = v45;
              uint64_t v48 = *MEMORY[0x1E4F502C8];
              uint64_t v249 = *MEMORY[0x1E4F28568];
              id v199 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"trialRolloutId"];
              id v250 = v199;
              uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v250 forKeys:&v249 count:1];
              uint64_t v50 = v46;
              id v7 = v47;
              uint64_t v14 = (void *)v49;
              id v200 = 0;
              uint64_t v22 = 0;
              id *v201 = (id)[v50 initWithDomain:v48 code:2 userInfo:v49];
              goto LABEL_220;
            }
            id v200 = 0;
            uint64_t v22 = 0;
LABEL_221:

            goto LABEL_222;
          }
          if (a4)
          {
            id v206 = objc_alloc(MEMORY[0x1E4F28C58]);
            id v192 = v9;
            id v39 = v7;
            uint64_t v40 = *MEMORY[0x1E4F502C8];
            uint64_t v251 = *MEMORY[0x1E4F28568];
            id v200 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"trialExperimentTreatmentId"];
            id v252 = v200;
            uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v252 forKeys:&v251 count:1];
            uint64_t v42 = v40;
            id v7 = v39;
            id v9 = v192;
            v203 = (void *)v41;
            id v43 = (id)objc_msgSend(v206, "initWithDomain:code:userInfo:", v42, 2);
            id v205 = 0;
            uint64_t v22 = 0;
            *a4 = v43;
            goto LABEL_221;
          }
          id v205 = 0;
          uint64_t v22 = 0;
LABEL_222:

          goto LABEL_223;
        }
        if (a4)
        {
          id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
          id v33 = v7;
          id v34 = v32;
          v35 = v33;
          uint64_t v36 = *MEMORY[0x1E4F502C8];
          uint64_t v253 = *MEMORY[0x1E4F28568];
          id v205 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"trialExperimentDeploymentId"];
          id v254 = v205;
          uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v254 forKeys:&v253 count:1];
          v37 = v34;
          id v7 = v35;
          v6 = v204;
          id v207 = 0;
          uint64_t v22 = 0;
          *a4 = (id)[v37 initWithDomain:v36 code:2 userInfo:v11];
          goto LABEL_222;
        }
        id v207 = 0;
        uint64_t v22 = 0;
LABEL_223:

        goto LABEL_224;
      }
      if (a4)
      {
        id v210 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v30 = *MEMORY[0x1E4F502C8];
        uint64_t v255 = *MEMORY[0x1E4F28568];
        id v207 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"trialExperimentId"];
        id v256 = v207;
        v212 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v256 forKeys:&v255 count:1];
        id v31 = (id)[v210 initWithDomain:v30 code:2 userInfo:v212];
        id v209 = 0;
        uint64_t v22 = 0;
        *a4 = v31;
        goto LABEL_223;
      }
      id v209 = 0;
      uint64_t v22 = 0;
LABEL_224:

      goto LABEL_225;
    }
    if (a4)
    {
      id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v24 = v7;
      id v25 = v23;
      uint64_t v26 = v6;
      uint64_t v27 = v24;
      uint64_t v28 = *MEMORY[0x1E4F502C8];
      uint64_t v257 = *MEMORY[0x1E4F28568];
      id v209 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"eventType"];
      id v258 = v209;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v258 forKeys:&v257 count:1];
      v29 = v25;
      id v7 = v27;
      v6 = v26;
      id v9 = 0;
      uint64_t v22 = 0;
      *a4 = (id)[v29 initWithDomain:v28 code:2 userInfo:v10];
      goto LABEL_224;
    }
    id v9 = 0;
    uint64_t v22 = 0;
LABEL_225:

    goto LABEL_226;
  }
  if (a4)
  {
    id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v20 = *MEMORY[0x1E4F502C8];
    uint64_t v259 = *MEMORY[0x1E4F28568];
    id v9 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"messageId"];
    v260[0] = v9;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v260 forKeys:&v259 count:1];
    id v21 = (id)[v19 initWithDomain:v20 code:2 userInfo:v8];
    id v7 = 0;
    uint64_t v22 = 0;
    *a4 = v21;
    goto LABEL_225;
  }
  id v7 = 0;
  uint64_t v22 = 0;
LABEL_226:

  return v22;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMMailCategorization *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_messageId) {
    PBDataWriterWriteStringField();
  }
  if (self->_eventType) {
    PBDataWriterWriteStringField();
  }
  if (self->_trialExperimentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_trialExperimentDeploymentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_trialExperimentTreatmentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_trialRolloutId) {
    PBDataWriterWriteStringField();
  }
  if (self->_trialRolloutDeploymentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_trialRolloutFactorPackId) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_blackPearlModelVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_blackPearlSenderModelVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_blackPearlFinalRuleVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_blackPearlBreakthroughVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_reasonCodes) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasIsBreakthrough) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsBlackPearlEnabled) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_elapsedTimeSinceEmailReceived) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasIsThread) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_senderId) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasHasIcloudAccountEnabled) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)BMMailCategorization;
  id v5 = [(BMEventBase *)&v77 init];
  if (!v5) {
    goto LABEL_152;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
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
        unint64_t v14 = *(void *)&v4[v13];
        if (v14 == -1 || v14 >= *(void *)&v4[*v7]) {
          break;
        }
        char v15 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v16 = v11++ >= 9;
        if (v16)
        {
          unint64_t v12 = 0;
          int v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v17 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v17 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 48;
          goto LABEL_86;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 56;
          goto LABEL_86;
        case 3u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 64;
          goto LABEL_86;
        case 4u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 72;
          goto LABEL_86;
        case 5u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 80;
          goto LABEL_86;
        case 6u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 88;
          goto LABEL_86;
        case 7u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 96;
          goto LABEL_86;
        case 8u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 104;
          goto LABEL_86;
        case 9u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          while (2)
          {
            uint64_t v24 = *v6;
            unint64_t v25 = *(void *)&v4[v24];
            if (v25 == -1 || v25 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
              *(void *)&v4[v24] = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                BOOL v16 = v22++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_104;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_104:
          if (v23 >= 7) {
            LODWORD(v23) = 0;
          }
          uint64_t v72 = 28;
          goto LABEL_143;
        case 0xAu:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 112;
          goto LABEL_86;
        case 0xBu:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 120;
          goto LABEL_86;
        case 0xCu:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 128;
          goto LABEL_86;
        case 0xDu:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 136;
          goto LABEL_86;
        case 0xEu:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 144;
          goto LABEL_86;
        case 0xFu:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v23 = 0;
          while (2)
          {
            uint64_t v29 = *v6;
            unint64_t v30 = *(void *)&v4[v29];
            if (v30 == -1 || v30 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
              *(void *)&v4[v29] = v30 + 1;
              v23 |= (unint64_t)(v31 & 0x7F) << v27;
              if (v31 < 0)
              {
                v27 += 7;
                BOOL v16 = v28++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_110;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_110:
          if (v23 >= 8) {
            LODWORD(v23) = 0;
          }
          uint64_t v72 = 32;
          goto LABEL_143;
        case 0x10u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v23 = 0;
          while (2)
          {
            uint64_t v34 = *v6;
            unint64_t v35 = *(void *)&v4[v34];
            if (v35 == -1 || v35 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)&v4[*v9] + v35);
              *(void *)&v4[v34] = v35 + 1;
              v23 |= (unint64_t)(v36 & 0x7F) << v32;
              if (v36 < 0)
              {
                v32 += 7;
                BOOL v16 = v33++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_116;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_116:
          if (v23 >= 8) {
            LODWORD(v23) = 0;
          }
          uint64_t v72 = 36;
          goto LABEL_143;
        case 0x11u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v39 = 0;
          v5->_hasIsBreakthrough = 1;
          while (2)
          {
            uint64_t v40 = *v6;
            unint64_t v41 = *(void *)&v4[v40];
            if (v41 == -1 || v41 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v42 = *(unsigned char *)(*(void *)&v4[*v9] + v41);
              *(void *)&v4[v40] = v41 + 1;
              v39 |= (unint64_t)(v42 & 0x7F) << v37;
              if (v42 < 0)
              {
                v37 += 7;
                BOOL v16 = v38++ >= 9;
                if (v16)
                {
                  uint64_t v39 = 0;
                  goto LABEL_122;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v39 = 0;
          }
LABEL_122:
          BOOL v73 = v39 != 0;
          uint64_t v74 = 16;
          goto LABEL_148;
        case 0x12u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v45 = 0;
          v5->_hasIsBlackPearlEnabled = 1;
          while (2)
          {
            uint64_t v46 = *v6;
            unint64_t v47 = *(void *)&v4[v46];
            if (v47 == -1 || v47 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v48 = *(unsigned char *)(*(void *)&v4[*v9] + v47);
              *(void *)&v4[v46] = v47 + 1;
              v45 |= (unint64_t)(v48 & 0x7F) << v43;
              if (v48 < 0)
              {
                v43 += 7;
                BOOL v16 = v44++ >= 9;
                if (v16)
                {
                  uint64_t v45 = 0;
                  goto LABEL_126;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v45 = 0;
          }
LABEL_126:
          BOOL v73 = v45 != 0;
          uint64_t v74 = 18;
          goto LABEL_148;
        case 0x13u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 152;
          goto LABEL_86;
        case 0x14u:
          char v49 = 0;
          unsigned int v50 = 0;
          uint64_t v23 = 0;
          while (2)
          {
            uint64_t v51 = *v6;
            unint64_t v52 = *(void *)&v4[v51];
            if (v52 == -1 || v52 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v53 = *(unsigned char *)(*(void *)&v4[*v9] + v52);
              *(void *)&v4[v51] = v52 + 1;
              v23 |= (unint64_t)(v53 & 0x7F) << v49;
              if (v53 < 0)
              {
                v49 += 7;
                BOOL v16 = v50++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_130;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_130:
          if (v23 >= 7) {
            LODWORD(v23) = 0;
          }
          uint64_t v72 = 40;
          goto LABEL_143;
        case 0x15u:
          char v54 = 0;
          unsigned int v55 = 0;
          uint64_t v56 = 0;
          v5->_hasIsThread = 1;
          while (2)
          {
            uint64_t v57 = *v6;
            unint64_t v58 = *(void *)&v4[v57];
            if (v58 == -1 || v58 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v59 = *(unsigned char *)(*(void *)&v4[*v9] + v58);
              *(void *)&v4[v57] = v58 + 1;
              v56 |= (unint64_t)(v59 & 0x7F) << v54;
              if (v59 < 0)
              {
                v54 += 7;
                BOOL v16 = v55++ >= 9;
                if (v16)
                {
                  uint64_t v56 = 0;
                  goto LABEL_136;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v56 = 0;
          }
LABEL_136:
          BOOL v73 = v56 != 0;
          uint64_t v74 = 20;
          goto LABEL_148;
        case 0x16u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 160;
LABEL_86:
          uint64_t v60 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        case 0x17u:
          char v61 = 0;
          unsigned int v62 = 0;
          uint64_t v23 = 0;
          while (2)
          {
            uint64_t v63 = *v6;
            unint64_t v64 = *(void *)&v4[v63];
            if (v64 == -1 || v64 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v65 = *(unsigned char *)(*(void *)&v4[*v9] + v64);
              *(void *)&v4[v63] = v64 + 1;
              v23 |= (unint64_t)(v65 & 0x7F) << v61;
              if (v65 < 0)
              {
                v61 += 7;
                BOOL v16 = v62++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_140;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_140:
          if (v23 >= 9) {
            LODWORD(v23) = 0;
          }
          uint64_t v72 = 44;
LABEL_143:
          *(_DWORD *)((char *)&v5->super.super.isa + v72) = v23;
          continue;
        case 0x18u:
          char v66 = 0;
          unsigned int v67 = 0;
          uint64_t v68 = 0;
          v5->_hasHasIcloudAccountEnabled = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_151;
          }
          continue;
      }
      while (1)
      {
        uint64_t v69 = *v6;
        unint64_t v70 = *(void *)&v4[v69];
        if (v70 == -1 || v70 >= *(void *)&v4[*v7]) {
          break;
        }
        char v71 = *(unsigned char *)(*(void *)&v4[*v9] + v70);
        *(void *)&v4[v69] = v70 + 1;
        v68 |= (unint64_t)(v71 & 0x7F) << v66;
        if ((v71 & 0x80) == 0) {
          goto LABEL_145;
        }
        v66 += 7;
        BOOL v16 = v67++ >= 9;
        if (v16)
        {
          uint64_t v68 = 0;
          goto LABEL_147;
        }
      }
      v4[*v8] = 1;
LABEL_145:
      if (v4[*v8]) {
        uint64_t v68 = 0;
      }
LABEL_147:
      BOOL v73 = v68 != 0;
      uint64_t v74 = 22;
LABEL_148:
      *((unsigned char *)&v5->super.super.isa + v74) = v73;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_151:
  }
    uint64_t v75 = 0;
  else {
LABEL_152:
  }
    uint64_t v75 = v5;

  return v75;
}

- (NSString)description
{
  id v18 = [NSString alloc];
  uint64_t v29 = [(BMMailCategorization *)self messageId];
  char v26 = [(BMMailCategorization *)self eventType];
  unsigned int v28 = [(BMMailCategorization *)self trialExperimentId];
  unint64_t v25 = [(BMMailCategorization *)self trialExperimentDeploymentId];
  char v27 = [(BMMailCategorization *)self trialExperimentTreatmentId];
  uint64_t v23 = [(BMMailCategorization *)self trialRolloutId];
  uint64_t v24 = [(BMMailCategorization *)self trialRolloutDeploymentId];
  int v17 = [(BMMailCategorization *)self trialRolloutFactorPackId];
  unsigned int v22 = BMMailCategorizationCategoryAsString([(BMMailCategorization *)self predictedCategory]);
  BOOL v16 = [(BMMailCategorization *)self blackPearlModelVersion];
  char v21 = [(BMMailCategorization *)self blackPearlSenderModelVersion];
  char v15 = [(BMMailCategorization *)self blackPearlFinalRuleVersion];
  uint64_t v20 = [(BMMailCategorization *)self blackPearlBreakthroughVersion];
  unint64_t v14 = [(BMMailCategorization *)self reasonCodes];
  unint64_t v12 = BMMailCategorizationMailboxTypeAsString([(BMMailCategorization *)self currCategoryView]);
  uint64_t v13 = BMMailCategorizationMailboxTypeAsString([(BMMailCategorization *)self prevCategoryView]);
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMailCategorization isBreakthrough](self, "isBreakthrough"));
  char v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMailCategorization isBlackPearlEnabled](self, "isBlackPearlEnabled"));
  uint64_t v3 = [(BMMailCategorization *)self elapsedTimeSinceEmailReceived];
  id v9 = BMMailCategorizationByTypeAsString([(BMMailCategorization *)self recategorizationBy]);
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMailCategorization isThread](self, "isThread"));
  id v5 = [(BMMailCategorization *)self senderId];
  v6 = BMMailCategorizationDomainAsString([(BMMailCategorization *)self receivingAccountDomain]);
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMailCategorization hasIcloudAccountEnabled](self, "hasIcloudAccountEnabled"));
  uint64_t v19 = objc_msgSend(v18, "initWithFormat:", @"BMMailCategorization with messageId: %@, eventType: %@, trialExperimentId: %@, trialExperimentDeploymentId: %@, trialExperimentTreatmentId: %@, trialRolloutId: %@, trialRolloutDeploymentId: %@, trialRolloutFactorPackId: %@, predictedCategory: %@, blackPearlModelVersion: %@, blackPearlSenderModelVersion: %@, blackPearlFinalRuleVersion: %@, blackPearlBreakthroughVersion: %@, reasonCodes: %@, currCategoryView: %@, prevCategoryView: %@, isBreakthrough: %@, isBlackPearlEnabled: %@, elapsedTimeSinceEmailReceived: %@, recategorizationBy: %@, isThread: %@, senderId: %@, receivingAccountDomain: %@, hasIcloudAccountEnabled: %@", v29, v26, v28, v25, v27, v23, v24, v17, v22, v16, v21, v15, v20, v14, v12, v13,
                  v11,
                  v10,
                  v3,
                  v9,
                  v4,
                  v5,
                  v6,
                  v7);

  return (NSString *)v19;
}

- (BMMailCategorization)initWithMessageId:(id)a3 eventType:(id)a4 trialExperimentId:(id)a5 trialExperimentDeploymentId:(id)a6 trialExperimentTreatmentId:(id)a7 trialRolloutId:(id)a8 trialRolloutDeploymentId:(id)a9 trialRolloutFactorPackId:(id)a10 predictedCategory:(int)a11 blackPearlModelVersion:(id)a12 blackPearlSenderModelVersion:(id)a13 blackPearlFinalRuleVersion:(id)a14 blackPearlBreakthroughVersion:(id)a15 reasonCodes:(id)a16 currCategoryView:(int)a17 prevCategoryView:(int)a18 isBreakthrough:(id)a19 isBlackPearlEnabled:(id)a20 elapsedTimeSinceEmailReceived:(id)a21 recategorizationBy:(int)a22 isThread:(id)a23 senderId:(id)a24 receivingAccountDomain:(int)a25 hasIcloudAccountEnabled:(id)a26
{
  id v55 = a3;
  id v54 = a4;
  id v53 = a5;
  id v52 = a6;
  id v38 = a7;
  id v51 = a7;
  id v39 = a8;
  id v50 = a8;
  id v49 = a9;
  id v48 = a10;
  id v47 = a12;
  id v46 = a13;
  id v45 = a14;
  id v44 = a15;
  id v43 = a16;
  id v31 = a19;
  id v32 = a20;
  id v42 = a21;
  id v33 = a23;
  id v41 = a24;
  id v34 = a26;
  v56.receiver = self;
  v56.super_class = (Class)BMMailCategorization;
  unint64_t v35 = [(BMEventBase *)&v56 init];
  if (v35)
  {
    v35->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v35->_messageId, a3);
    objc_storeStrong((id *)&v35->_eventType, a4);
    objc_storeStrong((id *)&v35->_trialExperimentId, a5);
    objc_storeStrong((id *)&v35->_trialExperimentDeploymentId, a6);
    objc_storeStrong((id *)&v35->_trialExperimentTreatmentId, v38);
    objc_storeStrong((id *)&v35->_trialRolloutId, v39);
    objc_storeStrong((id *)&v35->_trialRolloutDeploymentId, a9);
    objc_storeStrong((id *)&v35->_trialRolloutFactorPackId, a10);
    v35->_predictedCategory = a11;
    objc_storeStrong((id *)&v35->_blackPearlModelVersion, a12);
    objc_storeStrong((id *)&v35->_blackPearlSenderModelVersion, a13);
    objc_storeStrong((id *)&v35->_blackPearlFinalRuleVersion, a14);
    objc_storeStrong((id *)&v35->_blackPearlBreakthroughVersion, a15);
    objc_storeStrong((id *)&v35->_reasonCodes, a16);
    v35->_currCategoryView = a17;
    v35->_prevCategoryView = a18;
    if (v31)
    {
      v35->_hasIsBreakthrough = 1;
      v35->_isBreakthrough = [v31 BOOLValue];
    }
    else
    {
      v35->_hasIsBreakthrough = 0;
      v35->_isBreakthrough = 0;
    }
    if (v32)
    {
      v35->_hasIsBlackPearlEnabled = 1;
      v35->_isBlackPearlEnabled = [v32 BOOLValue];
    }
    else
    {
      v35->_hasIsBlackPearlEnabled = 0;
      v35->_isBlackPearlEnabled = 0;
    }
    objc_storeStrong((id *)&v35->_elapsedTimeSinceEmailReceived, a21);
    v35->_recategorizationBy = a22;
    if (v33)
    {
      v35->_hasIsThread = 1;
      v35->_isThread = [v33 BOOLValue];
    }
    else
    {
      v35->_hasIsThread = 0;
      v35->_isThread = 0;
    }
    objc_storeStrong((id *)&v35->_senderId, a24);
    v35->_receivingAccountDomain = a25;
    if (v34)
    {
      v35->_hasHasIcloudAccountEnabled = 1;
      v35->_hasIcloudAccountEnabled = [v34 BOOLValue];
    }
    else
    {
      v35->_hasHasIcloudAccountEnabled = 0;
      v35->_hasIcloudAccountEnabled = 0;
    }
  }

  return v35;
}

+ (id)protoFields
{
  v28[24] = *MEMORY[0x1E4F143B8];
  char v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"messageId" number:1 type:13 subMessageClass:0];
  v28[0] = v27;
  char v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventType" number:2 type:13 subMessageClass:0];
  v28[1] = v26;
  unint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"trialExperimentId" number:3 type:13 subMessageClass:0];
  v28[2] = v25;
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"trialExperimentDeploymentId" number:4 type:13 subMessageClass:0];
  v28[3] = v24;
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"trialExperimentTreatmentId" number:5 type:13 subMessageClass:0];
  v28[4] = v23;
  unsigned int v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"trialRolloutId" number:6 type:13 subMessageClass:0];
  v28[5] = v22;
  char v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"trialRolloutDeploymentId" number:7 type:13 subMessageClass:0];
  v28[6] = v21;
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"trialRolloutFactorPackId" number:8 type:13 subMessageClass:0];
  v28[7] = v20;
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"predictedCategory" number:9 type:4 subMessageClass:0];
  v28[8] = v19;
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"blackPearlModelVersion" number:10 type:13 subMessageClass:0];
  v28[9] = v18;
  int v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"blackPearlSenderModelVersion" number:11 type:13 subMessageClass:0];
  v28[10] = v17;
  BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"blackPearlFinalRuleVersion" number:12 type:13 subMessageClass:0];
  v28[11] = v16;
  char v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"blackPearlBreakthroughVersion" number:13 type:13 subMessageClass:0];
  v28[12] = v15;
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"reasonCodes" number:14 type:13 subMessageClass:0];
  v28[13] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"currCategoryView" number:15 type:4 subMessageClass:0];
  v28[14] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"prevCategoryView" number:16 type:4 subMessageClass:0];
  v28[15] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isBreakthrough" number:17 type:12 subMessageClass:0];
  v28[16] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isBlackPearlEnabled" number:18 type:12 subMessageClass:0];
  v28[17] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"elapsedTimeSinceEmailReceived" number:19 type:13 subMessageClass:0];
  v28[18] = v5;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"recategorizationBy" number:20 type:4 subMessageClass:0];
  v28[19] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isThread" number:21 type:12 subMessageClass:0];
  v28[20] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"senderId" number:22 type:13 subMessageClass:0];
  v28[21] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"receivingAccountDomain" number:23 type:4 subMessageClass:0];
  v28[22] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hasIcloudAccountEnabled" number:24 type:12 subMessageClass:0];
  v28[23] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:24];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6ED0;
}

+ (id)columns
{
  v30[26] = *MEMORY[0x1E4F143B8];
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"messageId" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  unsigned int v28 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventType" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  char v27 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"trialExperimentId" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  char v26 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"trialExperimentDeploymentId" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  unint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"trialExperimentTreatmentId" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"trialRolloutId" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"trialRolloutDeploymentId" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  unsigned int v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"trialRolloutFactorPackId" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  char v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"predictedCategory" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:4 convertedType:0];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"blackPearlModelVersion" dataType:2 requestOnly:0 fieldNumber:10 protoDataType:13 convertedType:0];
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"blackPearlSenderModelVersion" dataType:2 requestOnly:0 fieldNumber:11 protoDataType:13 convertedType:0];
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"blackPearlFinalRuleVersion" dataType:2 requestOnly:0 fieldNumber:12 protoDataType:13 convertedType:0];
  int v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"blackPearlBreakthroughVersion" dataType:2 requestOnly:0 fieldNumber:13 protoDataType:13 convertedType:0];
  BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"reasonCodes" dataType:2 requestOnly:0 fieldNumber:14 protoDataType:13 convertedType:0];
  char v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"currCategoryView" dataType:0 requestOnly:0 fieldNumber:15 protoDataType:4 convertedType:0];
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"currMailbox" dataType:0 requestOnly:0 fieldNumber:15 protoDataType:4 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"prevCategoryView" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:4 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"prevMailbox" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isBreakthrough" dataType:0 requestOnly:0 fieldNumber:17 protoDataType:12 convertedType:0];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isBlackPearlEnabled" dataType:0 requestOnly:0 fieldNumber:18 protoDataType:12 convertedType:0];
  unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"elapsedTimeSinceEmailReceived" dataType:2 requestOnly:0 fieldNumber:19 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"recategorizationBy" dataType:0 requestOnly:0 fieldNumber:20 protoDataType:4 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isThread" dataType:0 requestOnly:0 fieldNumber:21 protoDataType:12 convertedType:0];
  unsigned int v11 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"senderId" dataType:2 requestOnly:0 fieldNumber:22 protoDataType:13 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"receivingAccountDomain" dataType:0 requestOnly:0 fieldNumber:23 protoDataType:4 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hasIcloudAccountEnabled" dataType:0 requestOnly:0 fieldNumber:24 protoDataType:12 convertedType:0];
  v30[0] = v29;
  v30[1] = v28;
  v30[2] = v27;
  v30[3] = v26;
  v30[4] = v25;
  v30[5] = v24;
  v30[6] = v23;
  v30[7] = v22;
  v30[8] = v21;
  v30[9] = v20;
  v30[10] = v19;
  v30[11] = v18;
  v30[12] = v17;
  v30[13] = v16;
  v30[14] = v15;
  v30[15] = v14;
  v30[16] = v2;
  v30[17] = v3;
  v30[18] = v4;
  v30[19] = v13;
  v30[20] = v12;
  v30[21] = v5;
  v30[22] = v6;
  v30[23] = v11;
  v30[24] = v7;
  v30[25] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:26];

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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMMailCategorization alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[6] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end