@interface BMUserFocusInferredMode
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMUserFocusInferredMode)initWithAbsoluteTimestamp:(id)a3 modeIdentifier:(id)a4 origin:(int)a5 originBundleID:(id)a6 isAutomationEnabled:(id)a7 isStart:(id)a8 uuid:(id)a9 originAnchorType:(id)a10 uiLocation:(id)a11 confidenceScore:(id)a12 serializedTriggers:(id)a13 modeType:(int)a14 shouldSuggestTriggers:(id)a15 userModeName:(id)a16;
- (BMUserFocusInferredMode)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasConfidenceScore;
- (BOOL)hasIsAutomationEnabled;
- (BOOL)hasIsStart;
- (BOOL)hasShouldSuggestTriggers;
- (BOOL)hasUiLocation;
- (BOOL)isAutomationEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStart;
- (BOOL)shouldSuggestTriggers;
- (NSArray)serializedTriggers;
- (NSDate)absoluteTimestamp;
- (NSString)description;
- (NSString)modeIdentifier;
- (NSString)originAnchorType;
- (NSString)originBundleID;
- (NSString)userModeName;
- (NSString)uuid;
- (double)confidenceScore;
- (id)_serializedTriggersJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)modeType;
- (int)origin;
- (unint64_t)uiLocation;
- (unsigned)dataVersion;
- (void)setHasConfidenceScore:(BOOL)a3;
- (void)setHasIsAutomationEnabled:(BOOL)a3;
- (void)setHasIsStart:(BOOL)a3;
- (void)setHasShouldSuggestTriggers:(BOOL)a3;
- (void)setHasUiLocation:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMUserFocusInferredMode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userModeName, 0);
  objc_storeStrong((id *)&self->_serializedTriggers, 0);
  objc_storeStrong((id *)&self->_originAnchorType, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_originBundleID, 0);

  objc_storeStrong((id *)&self->_modeIdentifier, 0);
}

- (NSString)userModeName
{
  return self->_userModeName;
}

- (void)setHasShouldSuggestTriggers:(BOOL)a3
{
  self->_hasShouldSuggestTriggers = a3;
}

- (BOOL)hasShouldSuggestTriggers
{
  return self->_hasShouldSuggestTriggers;
}

- (BOOL)shouldSuggestTriggers
{
  return self->_shouldSuggestTriggers;
}

- (int)modeType
{
  return self->_modeType;
}

- (NSArray)serializedTriggers
{
  return self->_serializedTriggers;
}

- (void)setHasConfidenceScore:(BOOL)a3
{
  self->_hasConfidenceScore = a3;
}

- (BOOL)hasConfidenceScore
{
  return self->_hasConfidenceScore;
}

- (double)confidenceScore
{
  return self->_confidenceScore;
}

- (void)setHasUiLocation:(BOOL)a3
{
  self->_hasUiLocation = a3;
}

- (BOOL)hasUiLocation
{
  return self->_hasUiLocation;
}

- (unint64_t)uiLocation
{
  return self->_uiLocation;
}

- (NSString)originAnchorType
{
  return self->_originAnchorType;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setHasIsStart:(BOOL)a3
{
  self->_hasIsStart = a3;
}

- (BOOL)hasIsStart
{
  return self->_hasIsStart;
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (void)setHasIsAutomationEnabled:(BOOL)a3
{
  self->_hasIsAutomationEnabled = a3;
}

- (BOOL)hasIsAutomationEnabled
{
  return self->_hasIsAutomationEnabled;
}

- (BOOL)isAutomationEnabled
{
  return self->_isAutomationEnabled;
}

- (NSString)originBundleID
{
  return self->_originBundleID;
}

- (int)origin
{
  return self->_origin;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
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
    v6 = [(BMUserFocusInferredMode *)self absoluteTimestamp];
    uint64_t v7 = [v5 absoluteTimestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMUserFocusInferredMode *)self absoluteTimestamp];
      v10 = [v5 absoluteTimestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_54;
      }
    }
    v13 = [(BMUserFocusInferredMode *)self modeIdentifier];
    uint64_t v14 = [v5 modeIdentifier];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMUserFocusInferredMode *)self modeIdentifier];
      v17 = [v5 modeIdentifier];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_54;
      }
    }
    int v19 = [(BMUserFocusInferredMode *)self origin];
    if (v19 == [v5 origin])
    {
      v20 = [(BMUserFocusInferredMode *)self originBundleID];
      uint64_t v21 = [v5 originBundleID];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(BMUserFocusInferredMode *)self originBundleID];
        v24 = [v5 originBundleID];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_54;
        }
      }
      if ([(BMUserFocusInferredMode *)self hasIsAutomationEnabled]
        || [v5 hasIsAutomationEnabled])
      {
        if (![(BMUserFocusInferredMode *)self hasIsAutomationEnabled]) {
          goto LABEL_54;
        }
        if (![v5 hasIsAutomationEnabled]) {
          goto LABEL_54;
        }
        int v26 = [(BMUserFocusInferredMode *)self isAutomationEnabled];
        if (v26 != [v5 isAutomationEnabled]) {
          goto LABEL_54;
        }
      }
      if (-[BMUserFocusInferredMode hasIsStart](self, "hasIsStart") || [v5 hasIsStart])
      {
        if (![(BMUserFocusInferredMode *)self hasIsStart]) {
          goto LABEL_54;
        }
        if (![v5 hasIsStart]) {
          goto LABEL_54;
        }
        int v27 = [(BMUserFocusInferredMode *)self isStart];
        if (v27 != [v5 isStart]) {
          goto LABEL_54;
        }
      }
      v28 = [(BMUserFocusInferredMode *)self uuid];
      uint64_t v29 = [v5 uuid];
      if (v28 == (void *)v29)
      {
      }
      else
      {
        v30 = (void *)v29;
        v31 = [(BMUserFocusInferredMode *)self uuid];
        v32 = [v5 uuid];
        int v33 = [v31 isEqual:v32];

        if (!v33) {
          goto LABEL_54;
        }
      }
      v34 = [(BMUserFocusInferredMode *)self originAnchorType];
      uint64_t v35 = [v5 originAnchorType];
      if (v34 == (void *)v35)
      {
      }
      else
      {
        v36 = (void *)v35;
        v37 = [(BMUserFocusInferredMode *)self originAnchorType];
        v38 = [v5 originAnchorType];
        int v39 = [v37 isEqual:v38];

        if (!v39) {
          goto LABEL_54;
        }
      }
      if ([(BMUserFocusInferredMode *)self hasUiLocation]
        || [v5 hasUiLocation])
      {
        if (![(BMUserFocusInferredMode *)self hasUiLocation]) {
          goto LABEL_54;
        }
        if (![v5 hasUiLocation]) {
          goto LABEL_54;
        }
        unint64_t v40 = [(BMUserFocusInferredMode *)self uiLocation];
        if (v40 != [v5 uiLocation]) {
          goto LABEL_54;
        }
      }
      if ([(BMUserFocusInferredMode *)self hasConfidenceScore]
        || [v5 hasConfidenceScore])
      {
        if (![(BMUserFocusInferredMode *)self hasConfidenceScore]) {
          goto LABEL_54;
        }
        if (![v5 hasConfidenceScore]) {
          goto LABEL_54;
        }
        [(BMUserFocusInferredMode *)self confidenceScore];
        double v42 = v41;
        [v5 confidenceScore];
        if (v42 != v43) {
          goto LABEL_54;
        }
      }
      v44 = [(BMUserFocusInferredMode *)self serializedTriggers];
      uint64_t v45 = [v5 serializedTriggers];
      if (v44 == (void *)v45)
      {
      }
      else
      {
        v46 = (void *)v45;
        v47 = [(BMUserFocusInferredMode *)self serializedTriggers];
        v48 = [v5 serializedTriggers];
        int v49 = [v47 isEqual:v48];

        if (!v49) {
          goto LABEL_54;
        }
      }
      int v50 = [(BMUserFocusInferredMode *)self modeType];
      if (v50 == [v5 modeType])
      {
        if (![(BMUserFocusInferredMode *)self hasShouldSuggestTriggers]
          && ![v5 hasShouldSuggestTriggers]
          || [(BMUserFocusInferredMode *)self hasShouldSuggestTriggers]
          && [v5 hasShouldSuggestTriggers]
          && (int v51 = [(BMUserFocusInferredMode *)self shouldSuggestTriggers],
              v51 == [v5 shouldSuggestTriggers]))
        {
          v53 = [(BMUserFocusInferredMode *)self userModeName];
          v54 = [v5 userModeName];
          if (v53 == v54)
          {
            char v12 = 1;
          }
          else
          {
            v55 = [(BMUserFocusInferredMode *)self userModeName];
            v56 = [v5 userModeName];
            char v12 = [v55 isEqual:v56];
          }
          goto LABEL_55;
        }
      }
    }
LABEL_54:
    char v12 = 0;
LABEL_55:

    goto LABEL_56;
  }
  char v12 = 0;
LABEL_56:

  return v12;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v54[14] = *MEMORY[0x1E4F143B8];
  v3 = [(BMUserFocusInferredMode *)self absoluteTimestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMUserFocusInferredMode *)self absoluteTimestamp];
    [v5 timeIntervalSinceReferenceDate];
    objc_msgSend(v4, "numberWithDouble:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }

  uint64_t v7 = [(BMUserFocusInferredMode *)self modeIdentifier];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMUserFocusInferredMode origin](self, "origin"));
  v9 = [(BMUserFocusInferredMode *)self originBundleID];
  if ([(BMUserFocusInferredMode *)self hasIsAutomationEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMUserFocusInferredMode isAutomationEnabled](self, "isAutomationEnabled"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
  if ([(BMUserFocusInferredMode *)self hasIsStart])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMUserFocusInferredMode isStart](self, "isStart"));
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
  v52 = [(BMUserFocusInferredMode *)self uuid];
  int v51 = [(BMUserFocusInferredMode *)self originAnchorType];
  if ([(BMUserFocusInferredMode *)self hasUiLocation])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMUserFocusInferredMode uiLocation](self, "uiLocation"));
    id v50 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v50 = 0;
  }
  if (![(BMUserFocusInferredMode *)self hasConfidenceScore]
    || ([(BMUserFocusInferredMode *)self confidenceScore], fabs(v12) == INFINITY))
  {
    id v49 = 0;
  }
  else
  {
    [(BMUserFocusInferredMode *)self confidenceScore];
    v13 = NSNumber;
    [(BMUserFocusInferredMode *)self confidenceScore];
    objc_msgSend(v13, "numberWithDouble:");
    id v49 = (id)objc_claimAutoreleasedReturnValue();
  }
  v48 = [(BMUserFocusInferredMode *)self _serializedTriggersJSONArray];
  v47 = objc_msgSend(NSNumber, "numberWithInt:", -[BMUserFocusInferredMode modeType](self, "modeType"));
  if ([(BMUserFocusInferredMode *)self hasShouldSuggestTriggers])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMUserFocusInferredMode shouldSuggestTriggers](self, "shouldSuggestTriggers"));
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = 0;
  }
  v15 = [(BMUserFocusInferredMode *)self userModeName];
  v53[0] = @"absoluteTimestamp";
  uint64_t v16 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  double v41 = (void *)v16;
  v54[0] = v16;
  v53[1] = @"modeIdentifier";
  uint64_t v17 = v7;
  if (!v7)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  unint64_t v40 = (void *)v17;
  v54[1] = v17;
  v53[2] = @"origin";
  uint64_t v18 = v8;
  if (!v8)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  int v39 = (void *)v18;
  v54[2] = v18;
  v53[3] = @"originBundleID";
  uint64_t v19 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v38 = (void *)v19;
  v54[3] = v19;
  v53[4] = @"isAutomationEnabled";
  uint64_t v20 = (uint64_t)v10;
  if (!v10)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)v20;
  v54[4] = v20;
  v53[5] = @"isStart";
  uint64_t v21 = (uint64_t)v11;
  if (!v11)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v46 = (void *)v8;
  v36 = (void *)v21;
  v54[5] = v21;
  v53[6] = @"uuid";
  uint64_t v22 = (uint64_t)v52;
  if (!v52)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v45 = v10;
  v54[6] = v22;
  v53[7] = @"originAnchorType";
  uint64_t v23 = (uint64_t)v51;
  if (!v51)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v44 = v11;
  v54[7] = v23;
  v53[8] = @"uiLocation";
  v24 = v50;
  if (!v50)
  {
    v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v54[8] = v24;
  v53[9] = @"confidenceScore";
  int v25 = v49;
  if (!v49)
  {
    int v25 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v33 = v23;
  uint64_t v35 = (void *)v22;
  double v43 = v6;
  v54[9] = v25;
  v53[10] = @"serializedTriggers";
  int v26 = v48;
  if (!v48)
  {
    int v26 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v23, v35, v36, v37, v38, v39, v40, v41);
  }
  int v27 = (void *)v7;
  v54[10] = v26;
  v53[11] = @"modeType";
  v28 = v47;
  if (!v47)
  {
    v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v54[11] = v28;
  v53[12] = @"shouldSuggestTriggers";
  uint64_t v29 = v14;
  v30 = v14;
  if (!v14)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v54[12] = v29;
  v53[13] = @"userModeName";
  v31 = v15;
  if (!v15)
  {
    v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v54[13] = v31;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v54, v53, 14, v33);
  id v42 = (id)objc_claimAutoreleasedReturnValue();
  if (!v15) {

  }
  if (!v30) {
  if (!v47)
  }

  if (!v48) {
  if (!v49)
  }

  if (!v50) {
  if (!v51)
  }

  if (!v52) {
  if (v44)
  }
  {
    if (v45) {
      goto LABEL_66;
    }
  }
  else
  {

    if (v45)
    {
LABEL_66:
      if (v9) {
        goto LABEL_67;
      }
      goto LABEL_75;
    }
  }

  if (v9)
  {
LABEL_67:
    if (v46) {
      goto LABEL_68;
    }
    goto LABEL_76;
  }
LABEL_75:

  if (v46)
  {
LABEL_68:
    if (v27) {
      goto LABEL_69;
    }
LABEL_77:

    if (v43) {
      goto LABEL_70;
    }
    goto LABEL_78;
  }
LABEL_76:

  if (!v27) {
    goto LABEL_77;
  }
LABEL_69:
  if (v43) {
    goto LABEL_70;
  }
LABEL_78:

LABEL_70:

  return v42;
}

- (id)_serializedTriggersJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMUserFocusInferredMode *)self serializedTriggers];
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
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) base64EncodedStringWithOptions:0];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMUserFocusInferredMode)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v221[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"absoluteTimestamp"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v9 = v6;
    id v10 = [v8 alloc];
    [v9 doubleValue];
    double v12 = v11;

    id v13 = (id)[v10 initWithTimeIntervalSinceReferenceDate:v12];
LABEL_6:
    uint64_t v7 = (uint64_t)v13;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v111 = 0;
        unint64_t v40 = 0;
        goto LABEL_143;
      }
      id v125 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v126 = *MEMORY[0x1E4F502C8];
      uint64_t v220 = *MEMORY[0x1E4F28568];
      uint64_t v127 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
      v221[0] = v127;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v221 forKeys:&v220 count:1];
      id v128 = (id)[v125 initWithDomain:v126 code:2 userInfo:v15];
      v111 = 0;
      unint64_t v40 = 0;
      *a4 = v128;
      uint64_t v35 = (void *)v127;
      goto LABEL_142;
    }
    id v13 = v6;
    goto LABEL_6;
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  uint64_t v7 = [v14 dateFromString:v6];

LABEL_9:
  v15 = [v5 objectForKeyedSubscript:@"modeIdentifier"];
  v182 = v6;
  v183 = (void *)v7;
  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v16 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v15;
LABEL_12:
    uint64_t v17 = [v5 objectForKeyedSubscript:@"origin"];
    if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v179 = 0;
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v179 = v17;
      goto LABEL_15;
    }
    uint64_t v35 = v16;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v179 = [NSNumber numberWithInt:BMUserFocusInferredModeOriginFromString(v17)];
LABEL_15:
      uint64_t v18 = [v5 objectForKeyedSubscript:@"originBundleID"];
      id v180 = v16;
      v181 = (void *)v18;
      if (!v18 || (uint64_t v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v20 = 0;
        goto LABEL_18;
      }
      uint64_t v35 = v16;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = v19;
LABEL_18:
        uint64_t v21 = [v5 objectForKeyedSubscript:@"isAutomationEnabled"];
        id v177 = v20;
        if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v173 = v21;
          id v174 = 0;
          goto LABEL_21;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v173 = v21;
          id v174 = v21;
LABEL_21:
          uint64_t v22 = [v5 objectForKeyedSubscript:@"isStart"];
          v176 = (void *)v22;
          if (!v22 || (uint64_t v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v175 = 0;
            goto LABEL_24;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v175 = v23;
LABEL_24:
            uint64_t v24 = [v5 objectForKeyedSubscript:@"uuid"];
            v172 = (void *)v24;
            if (!v24 || (int v25 = (void *)v24, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v165 = 0;
LABEL_27:
              uint64_t v26 = [v5 objectForKeyedSubscript:@"originAnchorType"];
              v170 = (void *)v26;
              if (v26 && (int v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (!a4)
                  {
                    id v171 = 0;
                    unint64_t v40 = 0;
                    v38 = v179;
                    id v49 = v173;
                    v77 = v165;
                    goto LABEL_135;
                  }
                  id v99 = objc_alloc(MEMORY[0x1E4F28C58]);
                  v100 = v15;
                  uint64_t v101 = *MEMORY[0x1E4F502C8];
                  uint64_t v206 = *MEMORY[0x1E4F28568];
                  v102 = v17;
                  id v103 = [NSString alloc];
                  uint64_t v151 = objc_opt_class();
                  v104 = v103;
                  uint64_t v17 = v102;
                  uint64_t v105 = [v104 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v151, @"originAnchorType"];
                  uint64_t v207 = v105;
                  uint64_t v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v207 forKeys:&v206 count:1];
                  uint64_t v107 = v101;
                  v15 = v100;
                  v58 = (void *)v105;
                  v164 = (void *)v106;
                  id v108 = (id)objc_msgSend(v99, "initWithDomain:code:userInfo:", v107, 2);
                  id v171 = 0;
                  unint64_t v40 = 0;
                  *a4 = v108;
                  id v20 = v177;
                  v38 = v179;
                  goto LABEL_148;
                }
                id v171 = v27;
              }
              else
              {
                id v171 = 0;
              }
              uint64_t v28 = [v5 objectForKeyedSubscript:@"uiLocation"];
              v164 = (void *)v28;
              if (!v28 || (uint64_t v29 = (void *)v28, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v160 = 0;
LABEL_33:
                uint64_t v30 = [v5 objectForKeyedSubscript:@"confidenceScore"];
                v158 = v17;
                v159 = v15;
                v162 = (void *)v30;
                if (v30 && (v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (a4)
                    {
                      id v122 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v123 = *MEMORY[0x1E4F502C8];
                      uint64_t v202 = *MEMORY[0x1E4F28568];
                      id v32 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"confidenceScore"];
                      id v203 = v32;
                      id v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v203 forKeys:&v202 count:1];
                      id v124 = (id)[v122 initWithDomain:v123 code:2 userInfo:v50];
                      id v163 = 0;
                      unint64_t v40 = 0;
                      *a4 = v124;
                      id v20 = v177;
                      v38 = v179;
                      id v49 = v173;
                      v77 = v165;
                      v58 = v160;
                      goto LABEL_131;
                    }
                    id v163 = 0;
                    unint64_t v40 = 0;
                    id v20 = v177;
                    v38 = v179;
                    id v49 = v173;
                    v77 = v165;
                    v58 = v160;
                    goto LABEL_133;
                  }
                  id v163 = v31;
                }
                else
                {
                  id v163 = 0;
                }
                id v32 = [v5 objectForKeyedSubscript:@"serializedTriggers"];
                uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
                int v34 = [v32 isEqual:v33];

                if (v34)
                {
                  v168 = self;

                  id v32 = 0;
                }
                else
                {
                  if (v32)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if (!a4)
                      {
                        unint64_t v40 = 0;
                        id v20 = v177;
                        v38 = v179;
                        id v49 = v173;
                        v77 = v165;
                        v58 = v160;
                        goto LABEL_132;
                      }
                      id v129 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v130 = *MEMORY[0x1E4F502C8];
                      uint64_t v200 = *MEMORY[0x1E4F28568];
                      id v50 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"serializedTriggers"];
                      v201 = v50;
                      uint64_t v131 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v201 forKeys:&v200 count:1];
                      id v132 = (id)[v129 initWithDomain:v130 code:2 userInfo:v131];
                      unint64_t v40 = 0;
                      *a4 = v132;
                      v121 = (void *)v131;
                      goto LABEL_107;
                    }
                  }
                  v168 = self;
                }
                id v50 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v32, "count"));
                long long v185 = 0u;
                long long v186 = 0u;
                long long v187 = 0u;
                long long v188 = 0u;
                id v32 = v32;
                uint64_t v51 = [v32 countByEnumeratingWithState:&v185 objects:v199 count:16];
                if (!v51) {
                  goto LABEL_70;
                }
                uint64_t v52 = v51;
                uint64_t v53 = *(void *)v186;
LABEL_63:
                uint64_t v54 = 0;
                while (1)
                {
                  if (*(void *)v186 != v53) {
                    objc_enumerationMutation(v32);
                  }
                  uint64_t v55 = *(void *)(*((void *)&v185 + 1) + 8 * v54);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    break;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (a4)
                    {
                      id v109 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v110 = *MEMORY[0x1E4F502C8];
                      uint64_t v195 = *MEMORY[0x1E4F28568];
                      v155 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", objc_opt_class(), @"serializedTriggers"];
                      v196 = v155;
                      uint64_t v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v196 forKeys:&v195 count:1];
                      v97 = v109;
                      uint64_t v98 = v110;
                      goto LABEL_93;
                    }
                    goto LABEL_97;
                  }
                  [v50 addObject:v55];
                  if (v52 == ++v54)
                  {
                    uint64_t v52 = [v32 countByEnumeratingWithState:&v185 objects:v199 count:16];
                    if (v52) {
                      goto LABEL_63;
                    }
LABEL_70:

                    uint64_t v56 = [v5 objectForKeyedSubscript:@"modeType"];
                    v155 = (void *)v56;
                    if (!v56)
                    {
                      id v157 = 0;
                      self = v168;
LABEL_110:
                      id v20 = v177;
                      v77 = v165;
                      v58 = v160;
                      goto LABEL_117;
                    }
                    v57 = (void *)v56;
                    objc_opt_class();
                    self = v168;
                    v58 = v160;
                    if (objc_opt_isKindOfClass())
                    {
                      id v157 = 0;
                      goto LABEL_116;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v157 = v57;
LABEL_116:
                      id v20 = v177;
                      v77 = v165;
LABEL_117:
                      uint64_t v133 = [v5 objectForKeyedSubscript:@"shouldSuggestTriggers"];
                      v169 = (void *)v133;
                      if (!v133 || (v134 = (void *)v133, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v156 = 0;
                        goto LABEL_120;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v156 = v134;
LABEL_120:
                        id v135 = [v5 objectForKeyedSubscript:@"userModeName"];
                        v166 = v135;
                        if (!v135)
                        {
LABEL_123:
                          v38 = v179;
                          goto LABEL_124;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v135 = 0;
                          goto LABEL_123;
                        }
                        objc_opt_class();
                        v38 = v179;
                        if (objc_opt_isKindOfClass())
                        {
                          id v135 = v135;
                          id v20 = v177;
LABEL_124:
                          uint64_t v136 = [v38 intValue];
                          LODWORD(v153) = [v157 intValue];
                          self = [(BMUserFocusInferredMode *)self initWithAbsoluteTimestamp:v183 modeIdentifier:v180 origin:v136 originBundleID:v20 isAutomationEnabled:v174 isStart:v175 uuid:v77 originAnchorType:v171 uiLocation:v58 confidenceScore:v163 serializedTriggers:v50 modeType:v153 shouldSuggestTriggers:v156 userModeName:v135];
                          unint64_t v40 = self;
                        }
                        else
                        {
                          if (a4)
                          {
                            id v161 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v154 = *MEMORY[0x1E4F502C8];
                            uint64_t v189 = *MEMORY[0x1E4F28568];
                            v142 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"userModeName"];
                            v190 = v142;
                            v143 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v190 forKeys:&v189 count:1];
                            *a4 = (id)[v161 initWithDomain:v154 code:2 userInfo:v143];
                          }
                          id v135 = 0;
                          unint64_t v40 = 0;
                          id v20 = v177;
                        }
LABEL_125:
                      }
                      else
                      {
                        if (a4)
                        {
                          id v139 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v167 = *MEMORY[0x1E4F502C8];
                          uint64_t v191 = *MEMORY[0x1E4F28568];
                          id v135 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"shouldSuggestTriggers"];
                          id v192 = v135;
                          uint64_t v140 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v192 forKeys:&v191 count:1];
                          uint64_t v141 = v167;
                          v166 = (void *)v140;
                          unint64_t v40 = 0;
                          id v156 = 0;
                          *a4 = (id)objc_msgSend(v139, "initWithDomain:code:userInfo:", v141, 2);
                          id v20 = v177;
                          v38 = v179;
                          goto LABEL_125;
                        }
                        id v156 = 0;
                        unint64_t v40 = 0;
                        id v20 = v177;
                        v38 = v179;
                      }
                      v137 = v169;
LABEL_127:

LABEL_128:
                      id v49 = v173;

                      goto LABEL_129;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v157 = [NSNumber numberWithInt:BMUserFocusInferredModeTypeFromString(v57)];
                      goto LABEL_110;
                    }
                    if (a4)
                    {
                      id v144 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v145 = *MEMORY[0x1E4F502C8];
                      uint64_t v193 = *MEMORY[0x1E4F28568];
                      id v156 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"modeType"];
                      id v194 = v156;
                      v137 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v194 forKeys:&v193 count:1];
                      id v157 = 0;
                      unint64_t v40 = 0;
                      *a4 = (id)[v144 initWithDomain:v145 code:2 userInfo:v137];
                      id v20 = v177;
                      v38 = v179;
                      v77 = v165;
                      v58 = v160;
                      goto LABEL_127;
                    }
                    id v157 = 0;
                    unint64_t v40 = 0;
                    id v20 = v177;
                    v38 = v179;
                    id v49 = v173;
                    v77 = v165;
                    v58 = v160;
LABEL_129:

                    v121 = v157;
LABEL_130:

LABEL_131:
                    uint64_t v17 = v158;
LABEL_132:

                    v15 = v159;
LABEL_133:

LABEL_134:
LABEL_135:
                    v48 = v174;
LABEL_136:

                    goto LABEL_137;
                  }
                }
                if (a4)
                {
                  id v94 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v95 = *MEMORY[0x1E4F502C8];
                  uint64_t v197 = *MEMORY[0x1E4F28568];
                  v155 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"serializedTriggers"];
                  v198 = v155;
                  uint64_t v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v198 forKeys:&v197 count:1];
                  v97 = v94;
                  uint64_t v98 = v95;
LABEL_93:
                  id v156 = (id)v96;
                  v77 = v165;
                  self = v168;
                  id v20 = v177;
                  v38 = v179;
                  v58 = v160;
                  unint64_t v40 = 0;
                  *a4 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v98, 2);
                  id v157 = v32;
                  goto LABEL_128;
                }
LABEL_97:
                unint64_t v40 = 0;
                v121 = v32;
                self = v168;
LABEL_107:
                id v20 = v177;
                v38 = v179;
                id v49 = v173;
                v77 = v165;
                v58 = v160;
                goto LABEL_130;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v160 = v29;
                goto LABEL_33;
              }
              if (a4)
              {
                id v112 = objc_alloc(MEMORY[0x1E4F28C58]);
                v113 = v15;
                uint64_t v114 = *MEMORY[0x1E4F502C8];
                uint64_t v204 = *MEMORY[0x1E4F28568];
                v115 = v17;
                id v116 = [NSString alloc];
                uint64_t v152 = objc_opt_class();
                v117 = v116;
                uint64_t v17 = v115;
                id v163 = (id)[v117 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v152, @"uiLocation"];
                id v205 = v163;
                uint64_t v118 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v205 forKeys:&v204 count:1];
                uint64_t v119 = v114;
                v15 = v113;
                v162 = (void *)v118;
                id v120 = (id)objc_msgSend(v112, "initWithDomain:code:userInfo:", v119, 2);
                v58 = 0;
                unint64_t v40 = 0;
                *a4 = v120;
                v38 = v179;
                id v49 = v173;
                v77 = v165;
                goto LABEL_133;
              }
              v58 = 0;
              unint64_t v40 = 0;
              v38 = v179;
LABEL_148:
              id v49 = v173;
              v77 = v165;
              goto LABEL_134;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v165 = v25;
              goto LABEL_27;
            }
            if (a4)
            {
              id v79 = objc_alloc(MEMORY[0x1E4F28C58]);
              v80 = v15;
              uint64_t v81 = *MEMORY[0x1E4F502C8];
              uint64_t v208 = *MEMORY[0x1E4F28568];
              v82 = v17;
              id v83 = [NSString alloc];
              uint64_t v149 = objc_opt_class();
              v84 = v83;
              uint64_t v17 = v82;
              id v171 = (id)[v84 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v149, @"uuid"];
              id v209 = v171;
              uint64_t v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v209 forKeys:&v208 count:1];
              uint64_t v86 = v81;
              v15 = v80;
              v48 = v174;
              v170 = (void *)v85;
              id v87 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v86, 2);
              v77 = 0;
              unint64_t v40 = 0;
              *a4 = v87;
              v38 = v179;
              id v49 = v173;
              goto LABEL_136;
            }
            unint64_t v40 = 0;
            v38 = v179;
            id v49 = v173;
            v48 = v174;
            v77 = 0;
LABEL_137:

            goto LABEL_138;
          }
          if (a4)
          {
            id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
            v69 = v15;
            uint64_t v70 = *MEMORY[0x1E4F502C8];
            uint64_t v210 = *MEMORY[0x1E4F28568];
            v71 = v17;
            id v72 = [NSString alloc];
            uint64_t v148 = objc_opt_class();
            v73 = v72;
            uint64_t v17 = v71;
            uint64_t v74 = [v73 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v148, @"isStart"];
            uint64_t v211 = v74;
            uint64_t v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v211 forKeys:&v210 count:1];
            uint64_t v76 = v70;
            v15 = v69;
            v77 = (void *)v74;
            v48 = v174;
            v172 = (void *)v75;
            id v78 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v76, 2);
            id v175 = 0;
            unint64_t v40 = 0;
            *a4 = v78;
            v38 = v179;
            id v49 = v173;
            goto LABEL_137;
          }
          id v175 = 0;
          unint64_t v40 = 0;
          v38 = v179;
          id v49 = v173;
          v48 = v174;
LABEL_138:

          goto LABEL_139;
        }
        if (a4)
        {
          id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
          v60 = v15;
          uint64_t v61 = *MEMORY[0x1E4F502C8];
          uint64_t v212 = *MEMORY[0x1E4F28568];
          v62 = v17;
          id v63 = [NSString alloc];
          uint64_t v147 = objc_opt_class();
          id v49 = v21;
          v64 = v63;
          uint64_t v17 = v62;
          id v175 = (id)[v64 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v147, @"isAutomationEnabled"];
          id v213 = v175;
          uint64_t v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v213 forKeys:&v212 count:1];
          uint64_t v66 = v61;
          v15 = v60;
          v176 = (void *)v65;
          id v67 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v66, 2);
          v48 = 0;
          unint64_t v40 = 0;
          *a4 = v67;
          v38 = v179;
          goto LABEL_138;
        }
        unint64_t v40 = 0;
        v38 = v179;
        id v49 = v21;
        v48 = 0;
LABEL_139:
        v111 = v183;

        uint64_t v35 = v180;
        goto LABEL_140;
      }
      unint64_t v40 = (BMUserFocusInferredMode *)a4;
      if (a4)
      {
        id v178 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v41 = *MEMORY[0x1E4F502C8];
        uint64_t v214 = *MEMORY[0x1E4F28568];
        id v42 = v15;
        id v43 = [NSString alloc];
        uint64_t v146 = objc_opt_class();
        v44 = v43;
        v15 = v42;
        uint64_t v45 = [v44 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v146, @"originBundleID"];
        uint64_t v215 = v45;
        uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v215 forKeys:&v214 count:1];
        id v47 = (id)[v178 initWithDomain:v41 code:2 userInfo:v46];
        id v20 = 0;
        unint64_t v40 = 0;
        *a4 = v47;
        v48 = (void *)v45;
        id v49 = (void *)v46;
        v38 = v179;
        goto LABEL_139;
      }
      id v20 = 0;
      v38 = v179;
LABEL_99:
      v111 = v183;
LABEL_140:

      goto LABEL_141;
    }
    v38 = a4;
    if (a4)
    {
      id v88 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v89 = *MEMORY[0x1E4F502C8];
      uint64_t v216 = *MEMORY[0x1E4F28568];
      v90 = v15;
      id v91 = [NSString alloc];
      uint64_t v150 = objc_opt_class();
      v92 = v91;
      v15 = v90;
      id v20 = (id)[v92 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", v150, @"origin"];
      id v217 = v20;
      v181 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v217 forKeys:&v216 count:1];
      id v93 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v89, 2);
      v38 = 0;
      unint64_t v40 = 0;
      *a4 = v93;
      goto LABEL_99;
    }
    unint64_t v40 = 0;
LABEL_113:
    v111 = v183;
LABEL_141:

    uint64_t v6 = v182;
    goto LABEL_142;
  }
  if (a4)
  {
    id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v37 = *MEMORY[0x1E4F502C8];
    uint64_t v218 = *MEMORY[0x1E4F28568];
    v38 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"modeIdentifier"];
    v219 = v38;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v219 forKeys:&v218 count:1];
    id v39 = (id)[v36 initWithDomain:v37 code:2 userInfo:v17];
    uint64_t v35 = 0;
    unint64_t v40 = 0;
    *a4 = v39;
    goto LABEL_113;
  }
  unint64_t v40 = 0;
  uint64_t v35 = 0;
  v111 = (void *)v7;
LABEL_142:

LABEL_143:
  return v40;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMUserFocusInferredMode *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_modeIdentifier) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_originBundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasIsAutomationEnabled) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsStart) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_uuid) {
    PBDataWriterWriteStringField();
  }
  if (self->_originAnchorType) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasUiLocation) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_hasConfidenceScore) {
    PBDataWriterWriteDoubleField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_serializedTriggers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  PBDataWriterWriteUint32Field();
  if (self->_hasShouldSuggestTriggers) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_userModeName) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v81.receiver = self;
  v81.super_class = (Class)BMUserFocusInferredMode;
  id v5 = [(BMEventBase *)&v81 init];
  if (!v5) {
    goto LABEL_116;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    long long v10 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v9]) {
        break;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *v7;
        uint64_t v15 = *(void *)&v4[v14];
        unint64_t v16 = v15 + 1;
        if (v15 == -1 || v16 > *(void *)&v4[*v8]) {
          break;
        }
        char v17 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
        *(void *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0) {
          goto LABEL_13;
        }
        v11 += 7;
        BOOL v18 = v12++ >= 9;
        if (v18)
        {
          unint64_t v13 = 0;
          int v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v19 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v13 = 0;
      }
LABEL_15:
      if (v19 || (v13 & 7) == 4) {
        break;
      }
      switch((v13 >> 3))
      {
        case 1u:
          v5->_hasRaw_absoluteTimestamp = 1;
          uint64_t v21 = *v7;
          unint64_t v22 = *(void *)&v4[v21];
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)&v4[*v8])
          {
            uint64_t v23 = *(objc_class **)(*(void *)&v4[*v10] + v22);
            *(void *)&v4[v21] = v22 + 8;
          }
          else
          {
            v4[*v9] = 1;
            uint64_t v23 = 0;
          }
          uint64_t v75 = 24;
          goto LABEL_112;
        case 2u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 56;
          goto LABEL_75;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          while (2)
          {
            uint64_t v29 = *v7;
            uint64_t v30 = *(void *)&v4[v29];
            unint64_t v31 = v30 + 1;
            if (v30 == -1 || v31 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)&v4[*v10] + v30);
              *(void *)&v4[v29] = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                BOOL v18 = v27++ >= 9;
                if (v18)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v28) = 0;
          }
LABEL_81:
          if (v28 >= 0x12) {
            LODWORD(v28) = 0;
          }
          uint64_t v72 = 44;
          goto LABEL_102;
        case 4u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 64;
          goto LABEL_75;
        case 5u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          v5->_hasIsAutomationEnabled = 1;
          while (2)
          {
            uint64_t v36 = *v7;
            uint64_t v37 = *(void *)&v4[v36];
            unint64_t v38 = v37 + 1;
            if (v37 == -1 || v38 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v39 = *(unsigned char *)(*(void *)&v4[*v10] + v37);
              *(void *)&v4[v36] = v38;
              v35 |= (unint64_t)(v39 & 0x7F) << v33;
              if (v39 < 0)
              {
                v33 += 7;
                BOOL v18 = v34++ >= 9;
                if (v18)
                {
                  uint64_t v35 = 0;
                  goto LABEL_87;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v35 = 0;
          }
LABEL_87:
          BOOL v73 = v35 != 0;
          uint64_t v74 = 32;
          goto LABEL_107;
        case 6u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v42 = 0;
          v5->_hasIsStart = 1;
          while (2)
          {
            uint64_t v43 = *v7;
            uint64_t v44 = *(void *)&v4[v43];
            unint64_t v45 = v44 + 1;
            if (v44 == -1 || v45 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v46 = *(unsigned char *)(*(void *)&v4[*v10] + v44);
              *(void *)&v4[v43] = v45;
              v42 |= (unint64_t)(v46 & 0x7F) << v40;
              if (v46 < 0)
              {
                v40 += 7;
                BOOL v18 = v41++ >= 9;
                if (v18)
                {
                  uint64_t v42 = 0;
                  goto LABEL_91;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v42 = 0;
          }
LABEL_91:
          BOOL v73 = v42 != 0;
          uint64_t v74 = 34;
          goto LABEL_107;
        case 7u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 72;
          goto LABEL_75;
        case 8u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 80;
          goto LABEL_75;
        case 9u:
          char v47 = 0;
          unsigned int v48 = 0;
          unint64_t v49 = 0;
          v5->_hasUiLocation = 1;
          while (2)
          {
            uint64_t v50 = *v7;
            uint64_t v51 = *(void *)&v4[v50];
            unint64_t v52 = v51 + 1;
            if (v51 == -1 || v52 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v53 = *(unsigned char *)(*(void *)&v4[*v10] + v51);
              *(void *)&v4[v50] = v52;
              v49 |= (unint64_t)(v53 & 0x7F) << v47;
              if (v53 < 0)
              {
                v47 += 7;
                BOOL v18 = v48++ >= 9;
                if (v18)
                {
                  unint64_t v49 = 0;
                  goto LABEL_95;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            unint64_t v49 = 0;
          }
LABEL_95:
          v5->_uiLocation = v49;
          continue;
        case 0xAu:
          v5->_hasConfidenceScore = 1;
          uint64_t v54 = *v7;
          unint64_t v55 = *(void *)&v4[v54];
          if (v55 <= 0xFFFFFFFFFFFFFFF7 && v55 + 8 <= *(void *)&v4[*v8])
          {
            uint64_t v23 = *(objc_class **)(*(void *)&v4[*v10] + v55);
            *(void *)&v4[v54] = v55 + 8;
          }
          else
          {
            v4[*v9] = 1;
            uint64_t v23 = 0;
          }
          uint64_t v75 = 96;
LABEL_112:
          *(Class *)((char *)&v5->super.super.isa + v75) = v23;
          continue;
        case 0xBu:
          uint64_t v56 = PBReaderReadData();
          if (!v56) {
            goto LABEL_118;
          }
          v57 = (void *)v56;
          [v6 addObject:v56];

          continue;
        case 0xCu:
          char v58 = 0;
          unsigned int v59 = 0;
          uint64_t v28 = 0;
          while (2)
          {
            uint64_t v60 = *v7;
            uint64_t v61 = *(void *)&v4[v60];
            unint64_t v62 = v61 + 1;
            if (v61 == -1 || v62 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v63 = *(unsigned char *)(*(void *)&v4[*v10] + v61);
              *(void *)&v4[v60] = v62;
              v28 |= (unint64_t)(v63 & 0x7F) << v58;
              if (v63 < 0)
              {
                v58 += 7;
                BOOL v18 = v59++ >= 9;
                if (v18)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_99;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v28) = 0;
          }
LABEL_99:
          if (v28 >= 0x13) {
            LODWORD(v28) = 0;
          }
          uint64_t v72 = 48;
LABEL_102:
          *(_DWORD *)((char *)&v5->super.super.isa + v72) = v28;
          continue;
        case 0xDu:
          char v64 = 0;
          unsigned int v65 = 0;
          uint64_t v66 = 0;
          v5->_hasShouldSuggestTriggers = 1;
          break;
        case 0xEu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 112;
LABEL_75:
          v71 = *(Class *)((char *)&v5->super.super.isa + v25);
          *(Class *)((char *)&v5->super.super.isa + v25) = (Class)v24;

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_118:

          goto LABEL_115;
      }
      while (1)
      {
        uint64_t v67 = *v7;
        uint64_t v68 = *(void *)&v4[v67];
        unint64_t v69 = v68 + 1;
        if (v68 == -1 || v69 > *(void *)&v4[*v8]) {
          break;
        }
        char v70 = *(unsigned char *)(*(void *)&v4[*v10] + v68);
        *(void *)&v4[v67] = v69;
        v66 |= (unint64_t)(v70 & 0x7F) << v64;
        if ((v70 & 0x80) == 0) {
          goto LABEL_104;
        }
        v64 += 7;
        BOOL v18 = v65++ >= 9;
        if (v18)
        {
          uint64_t v66 = 0;
          goto LABEL_106;
        }
      }
      v4[*v9] = 1;
LABEL_104:
      if (v4[*v9]) {
        uint64_t v66 = 0;
      }
LABEL_106:
      BOOL v73 = v66 != 0;
      uint64_t v74 = 38;
LABEL_107:
      *((unsigned char *)&v5->super.super.isa + v74) = v73;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v76 = [v6 copy];
  serializedTriggers = v5->_serializedTriggers;
  v5->_serializedTriggers = (NSArray *)v76;

  int v78 = v4[*v9];
  if (v78) {
LABEL_115:
  }
    id v79 = 0;
  else {
LABEL_116:
  }
    id v79 = v5;

  return v79;
}

- (NSString)description
{
  id v15 = [NSString alloc];
  id v20 = [(BMUserFocusInferredMode *)self absoluteTimestamp];
  int v19 = [(BMUserFocusInferredMode *)self modeIdentifier];
  BOOL v18 = BMUserFocusInferredModeOriginAsString([(BMUserFocusInferredMode *)self origin]);
  char v17 = [(BMUserFocusInferredMode *)self originBundleID];
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", -[BMUserFocusInferredMode isAutomationEnabled](self, "isAutomationEnabled"));
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMUserFocusInferredMode isStart](self, "isStart"));
  id v4 = [(BMUserFocusInferredMode *)self uuid];
  id v5 = [(BMUserFocusInferredMode *)self originAnchorType];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMUserFocusInferredMode uiLocation](self, "uiLocation"));
  uint64_t v7 = NSNumber;
  [(BMUserFocusInferredMode *)self confidenceScore];
  uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
  uint64_t v9 = [(BMUserFocusInferredMode *)self serializedTriggers];
  long long v10 = BMUserFocusInferredModeTypeAsString([(BMUserFocusInferredMode *)self modeType]);
  char v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMUserFocusInferredMode shouldSuggestTriggers](self, "shouldSuggestTriggers"));
  unsigned int v12 = [(BMUserFocusInferredMode *)self userModeName];
  id v16 = (id)[v15 initWithFormat:@"BMUserFocusInferredMode with absoluteTimestamp: %@, modeIdentifier: %@, origin: %@, originBundleID: %@, isAutomationEnabled: %@, isStart: %@, uuid: %@, originAnchorType: %@, uiLocation: %@, confidenceScore: %@, serializedTriggers: %@, modeType: %@, shouldSuggestTriggers: %@, userModeName: %@", v20, v19, v18, v17, v14, v3, v4, v5, v6, v8, v9, v10, v11, v12];

  return (NSString *)v16;
}

- (BMUserFocusInferredMode)initWithAbsoluteTimestamp:(id)a3 modeIdentifier:(id)a4 origin:(int)a5 originBundleID:(id)a6 isAutomationEnabled:(id)a7 isStart:(id)a8 uuid:(id)a9 originAnchorType:(id)a10 uiLocation:(id)a11 confidenceScore:(id)a12 serializedTriggers:(id)a13 modeType:(int)a14 shouldSuggestTriggers:(id)a15 userModeName:(id)a16
{
  id v20 = a3;
  id obj = a4;
  id v40 = a4;
  id v35 = a6;
  id v39 = a6;
  id v21 = a7;
  id v22 = a8;
  id v38 = a9;
  id v37 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  id v26 = a15;
  id v27 = a16;
  v41.receiver = self;
  v41.super_class = (Class)BMUserFocusInferredMode;
  uint64_t v28 = [(BMEventBase *)&v41 init];
  if (v28)
  {
    v28->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v20)
    {
      v28->_hasRaw_absoluteTimestamp = 1;
      [v20 timeIntervalSinceReferenceDate];
    }
    else
    {
      v28->_hasRaw_absoluteTimestamp = 0;
      double v29 = -1.0;
    }
    v28->_raw_absoluteTimestamp = v29;
    objc_storeStrong((id *)&v28->_modeIdentifier, obj);
    v28->_origin = a5;
    objc_storeStrong((id *)&v28->_originBundleID, v35);
    if (v21)
    {
      v28->_hasIsAutomationEnabled = 1;
      v28->_isAutomationEnabled = [v21 BOOLValue];
    }
    else
    {
      v28->_hasIsAutomationEnabled = 0;
      v28->_isAutomationEnabled = 0;
    }
    if (v22)
    {
      v28->_hasIsStart = 1;
      v28->_isStart = [v22 BOOLValue];
    }
    else
    {
      v28->_hasIsStart = 0;
      v28->_isStart = 0;
    }
    objc_storeStrong((id *)&v28->_uuid, a9);
    objc_storeStrong((id *)&v28->_originAnchorType, a10);
    if (v23)
    {
      v28->_hasUiLocation = 1;
      uint64_t v30 = [v23 unsignedLongLongValue];
    }
    else
    {
      uint64_t v30 = 0;
      v28->_hasUiLocation = 0;
    }
    v28->_uiLocation = v30;
    if (v24)
    {
      v28->_hasConfidenceScore = 1;
      [v24 doubleValue];
    }
    else
    {
      v28->_hasConfidenceScore = 0;
      double v31 = -1.0;
    }
    v28->_confidenceScore = v31;
    objc_storeStrong((id *)&v28->_serializedTriggers, a13);
    v28->_modeType = a14;
    if (v26)
    {
      v28->_hasShouldSuggestTriggers = 1;
      v28->_shouldSuggestTriggers = [v26 BOOLValue];
    }
    else
    {
      v28->_hasShouldSuggestTriggers = 0;
      v28->_shouldSuggestTriggers = 0;
    }
    objc_storeStrong((id *)&v28->_userModeName, a16);
  }

  return v28;
}

+ (id)protoFields
{
  v18[14] = *MEMORY[0x1E4F143B8];
  char v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:1 type:0 subMessageClass:0];
  v18[0] = v17;
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"modeIdentifier" number:2 type:13 subMessageClass:0];
  v18[1] = v16;
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"origin" number:3 type:4 subMessageClass:0];
  v18[2] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"originBundleID" number:4 type:13 subMessageClass:0];
  v18[3] = v14;
  unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isAutomationEnabled" number:5 type:12 subMessageClass:0];
  v18[4] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isStart" number:6 type:12 subMessageClass:0];
  v18[5] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uuid" number:7 type:13 subMessageClass:0];
  v18[6] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"originAnchorType" number:8 type:13 subMessageClass:0];
  v18[7] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uiLocation" number:9 type:5 subMessageClass:0];
  v18[8] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"confidenceScore" number:10 type:0 subMessageClass:0];
  v18[9] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"serializedTriggers" number:11 type:14 subMessageClass:0];
  v18[10] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"modeType" number:12 type:4 subMessageClass:0];
  v18[11] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shouldSuggestTriggers" number:13 type:12 subMessageClass:0];
  v18[12] = v9;
  long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userModeName" number:14 type:13 subMessageClass:0];
  v18[13] = v10;
  char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:14];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5D30;
}

+ (id)columns
{
  v18[14] = *MEMORY[0x1E4F143B8];
  char v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:1];
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"modeIdentifier" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"origin" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"originBundleID" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isAutomationEnabled" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isStart" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uuid" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"originAnchorType" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uiLocation" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:5 convertedType:0];
  unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"confidenceScore" dataType:1 requestOnly:0 fieldNumber:10 protoDataType:0 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"serializedTriggers_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_196];
  unsigned int v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"modeType" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:4 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shouldSuggestTriggers" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:12 convertedType:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userModeName" dataType:2 requestOnly:0 fieldNumber:14 protoDataType:13 convertedType:0];
  v18[0] = v17;
  v18[1] = v16;
  v18[2] = v15;
  v18[3] = v14;
  v18[4] = v2;
  v18[5] = v3;
  v18[6] = v4;
  v18[7] = v5;
  v18[8] = v6;
  v18[9] = v13;
  v18[10] = v7;
  v18[11] = v12;
  v18[12] = v8;
  v18[13] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:14];

  return v11;
}

id __34__BMUserFocusInferredMode_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 _serializedTriggersJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  if (a4 == 1)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMUserFocusInferredMode_v1;
  }
  else
  {
    if (a4 != 2)
    {
      uint64_t v9 = 0;
      goto LABEL_9;
    }
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMUserFocusInferredMode;
  }
  uint64_t v8 = [[v7 alloc] initByReadFrom:v6];
  uint64_t v9 = (void *)v8;
  if (v8) {
    *(_DWORD *)(v8 + 40) = a4;
  }

LABEL_9:

  return v9;
}

+ (unsigned)latestDataVersion
{
  return 2;
}

@end