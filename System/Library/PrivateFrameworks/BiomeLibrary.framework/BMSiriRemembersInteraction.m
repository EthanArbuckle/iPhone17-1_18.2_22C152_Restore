@interface BMSiriRemembersInteraction
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriRemembersInteraction)initWithIdentifier:(id)a3 type:(id)a4 domain:(id)a5 appBundleId:(id)a6 status:(int)a7 direction:(int)a8 isDonatedBySiri:(id)a9 startDate:(id)a10 durationInSeconds:(id)a11 fields:(id)a12 groupIdentifier:(id)a13 appIntentInteractionIdentifier:(id)a14 interactionSource:(int)a15 contentHash:(id)a16 userDonatorType:(int)a17;
- (BMSiriRemembersInteraction)initWithIdentifier:(id)a3 type:(id)a4 domain:(id)a5 appBundleId:(id)a6 status:(int)a7 direction:(int)a8 isDonatedBySiri:(id)a9 startDate:(id)a10 durationInSeconds:(id)a11 interactionFields:(id)a12;
- (BMSiriRemembersInteraction)initWithIdentifier:(id)a3 type:(id)a4 domain:(id)a5 appBundleId:(id)a6 status:(int)a7 direction:(int)a8 isDonatedBySiri:(id)a9 startDate:(id)a10 durationInSeconds:(id)a11 interactionFields:(id)a12 fields:(id)a13;
- (BMSiriRemembersInteraction)initWithIdentifier:(id)a3 type:(id)a4 domain:(id)a5 appBundleId:(id)a6 status:(int)a7 direction:(int)a8 isDonatedBySiri:(id)a9 startDate:(id)a10 durationInSeconds:(id)a11 interactionFields:(id)a12 fields:(id)a13 groupIdentifier:(id)a14;
- (BMSiriRemembersInteraction)initWithIdentifier:(id)a3 type:(id)a4 domain:(id)a5 appBundleId:(id)a6 status:(int)a7 direction:(int)a8 isDonatedBySiri:(id)a9 startDate:(id)a10 durationInSeconds:(id)a11 interactionFields:(id)a12 fields:(id)a13 groupIdentifier:(id)a14 appIntentInteractionIdentifier:(id)a15 interactionSource:(int)a16;
- (BMSiriRemembersInteraction)initWithIdentifier:(id)a3 type:(id)a4 domain:(id)a5 appBundleId:(id)a6 status:(int)a7 direction:(int)a8 isDonatedBySiri:(id)a9 startDate:(id)a10 durationInSeconds:(id)a11 interactionFields:(id)a12 fields:(id)a13 groupIdentifier:(id)a14 appIntentInteractionIdentifier:(id)a15 interactionSource:(int)a16 contentHash:(id)a17;
- (BMSiriRemembersInteraction)initWithIdentifier:(id)a3 type:(id)a4 domain:(id)a5 appBundleId:(id)a6 status:(int)a7 direction:(int)a8 isDonatedBySiri:(id)a9 startDate:(id)a10 durationInSeconds:(id)a11 interactionFields:(id)a12 fields:(id)a13 groupIdentifier:(id)a14 appIntentInteractionIdentifier:(id)a15 interactionSource:(int)a16 contentHash:(id)a17 userDonatorType:(int)a18;
- (BMSiriRemembersInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasContentHash;
- (BOOL)hasDurationInSeconds;
- (BOOL)hasIsDonatedBySiri;
- (BOOL)isDonatedBySiri;
- (BOOL)isEqual:(id)a3;
- (NSArray)interactionFields;
- (NSDate)startDate;
- (NSString)appBundleId;
- (NSString)appIntentInteractionIdentifier;
- (NSString)description;
- (NSString)domain;
- (NSString)fields;
- (NSString)groupIdentifier;
- (NSString)identifier;
- (NSString)type;
- (double)durationInSeconds;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)direction;
- (int)interactionSource;
- (int)status;
- (int)userDonatorType;
- (int64_t)contentHash;
- (unsigned)dataVersion;
- (void)setHasContentHash:(BOOL)a3;
- (void)setHasDurationInSeconds:(BOOL)a3;
- (void)setHasIsDonatedBySiri:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriRemembersInteraction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionFields, 0);
  objc_storeStrong((id *)&self->_appIntentInteractionIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSArray)interactionFields
{
  return self->_interactionFields;
}

- (int)userDonatorType
{
  return self->_userDonatorType;
}

- (void)setHasContentHash:(BOOL)a3
{
  self->_hasContentHash = a3;
}

- (BOOL)hasContentHash
{
  return self->_hasContentHash;
}

- (int64_t)contentHash
{
  return self->_contentHash;
}

- (int)interactionSource
{
  return self->_interactionSource;
}

- (NSString)appIntentInteractionIdentifier
{
  return self->_appIntentInteractionIdentifier;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSString)fields
{
  return self->_fields;
}

- (void)setHasDurationInSeconds:(BOOL)a3
{
  self->_hasDurationInSeconds = a3;
}

- (BOOL)hasDurationInSeconds
{
  return self->_hasDurationInSeconds;
}

- (double)durationInSeconds
{
  return self->_durationInSeconds;
}

- (void)setHasIsDonatedBySiri:(BOOL)a3
{
  self->_hasIsDonatedBySiri = a3;
}

- (BOOL)hasIsDonatedBySiri
{
  return self->_hasIsDonatedBySiri;
}

- (BOOL)isDonatedBySiri
{
  return self->_isDonatedBySiri;
}

- (int)direction
{
  return self->_direction;
}

- (int)status
{
  return self->_status;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
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
    v6 = [(BMSiriRemembersInteraction *)self identifier];
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriRemembersInteraction *)self identifier];
      v10 = [v5 identifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_54;
      }
    }
    v13 = [(BMSiriRemembersInteraction *)self type];
    uint64_t v14 = [v5 type];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriRemembersInteraction *)self type];
      v17 = [v5 type];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_54;
      }
    }
    v19 = [(BMSiriRemembersInteraction *)self domain];
    uint64_t v20 = [v5 domain];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMSiriRemembersInteraction *)self domain];
      v23 = [v5 domain];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_54;
      }
    }
    v25 = [(BMSiriRemembersInteraction *)self appBundleId];
    uint64_t v26 = [v5 appBundleId];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMSiriRemembersInteraction *)self appBundleId];
      v29 = [v5 appBundleId];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_54;
      }
    }
    int v31 = [(BMSiriRemembersInteraction *)self status];
    if (v31 != [v5 status]) {
      goto LABEL_54;
    }
    int v32 = [(BMSiriRemembersInteraction *)self direction];
    if (v32 != [v5 direction]) {
      goto LABEL_54;
    }
    if ([(BMSiriRemembersInteraction *)self hasIsDonatedBySiri]
      || [v5 hasIsDonatedBySiri])
    {
      if (![(BMSiriRemembersInteraction *)self hasIsDonatedBySiri]) {
        goto LABEL_54;
      }
      if (![v5 hasIsDonatedBySiri]) {
        goto LABEL_54;
      }
      int v33 = [(BMSiriRemembersInteraction *)self isDonatedBySiri];
      if (v33 != [v5 isDonatedBySiri]) {
        goto LABEL_54;
      }
    }
    v34 = [(BMSiriRemembersInteraction *)self startDate];
    uint64_t v35 = [v5 startDate];
    if (v34 == (void *)v35)
    {
    }
    else
    {
      v36 = (void *)v35;
      v37 = [(BMSiriRemembersInteraction *)self startDate];
      v38 = [v5 startDate];
      int v39 = [v37 isEqual:v38];

      if (!v39) {
        goto LABEL_54;
      }
    }
    if ([(BMSiriRemembersInteraction *)self hasDurationInSeconds]
      || [v5 hasDurationInSeconds])
    {
      if (![(BMSiriRemembersInteraction *)self hasDurationInSeconds]) {
        goto LABEL_54;
      }
      if (![v5 hasDurationInSeconds]) {
        goto LABEL_54;
      }
      [(BMSiriRemembersInteraction *)self durationInSeconds];
      double v41 = v40;
      [v5 durationInSeconds];
      if (v41 != v42) {
        goto LABEL_54;
      }
    }
    v43 = [(BMSiriRemembersInteraction *)self fields];
    uint64_t v44 = [v5 fields];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(BMSiriRemembersInteraction *)self fields];
      v47 = [v5 fields];
      int v48 = [v46 isEqual:v47];

      if (!v48) {
        goto LABEL_54;
      }
    }
    v49 = [(BMSiriRemembersInteraction *)self groupIdentifier];
    uint64_t v50 = [v5 groupIdentifier];
    if (v49 == (void *)v50)
    {
    }
    else
    {
      v51 = (void *)v50;
      v52 = [(BMSiriRemembersInteraction *)self groupIdentifier];
      v53 = [v5 groupIdentifier];
      int v54 = [v52 isEqual:v53];

      if (!v54) {
        goto LABEL_54;
      }
    }
    v55 = [(BMSiriRemembersInteraction *)self appIntentInteractionIdentifier];
    uint64_t v56 = [v5 appIntentInteractionIdentifier];
    if (v55 == (void *)v56)
    {
    }
    else
    {
      v57 = (void *)v56;
      v58 = [(BMSiriRemembersInteraction *)self appIntentInteractionIdentifier];
      v59 = [v5 appIntentInteractionIdentifier];
      int v60 = [v58 isEqual:v59];

      if (!v60) {
        goto LABEL_54;
      }
    }
    int v61 = [(BMSiriRemembersInteraction *)self interactionSource];
    if (v61 == [v5 interactionSource])
    {
      if (![(BMSiriRemembersInteraction *)self hasContentHash]
        && ![v5 hasContentHash]
        || [(BMSiriRemembersInteraction *)self hasContentHash]
        && [v5 hasContentHash]
        && (int64_t v62 = -[BMSiriRemembersInteraction contentHash](self, "contentHash"), v62 == [v5 contentHash]))
      {
        int v63 = [(BMSiriRemembersInteraction *)self userDonatorType];
        BOOL v12 = v63 == [v5 userDonatorType];
LABEL_55:

        goto LABEL_56;
      }
    }
LABEL_54:
    BOOL v12 = 0;
    goto LABEL_55;
  }
  BOOL v12 = 0;
LABEL_56:

  return v12;
}

- (NSDate)startDate
{
  if (self->_hasRaw_startDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_startDate];
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
  v51[15] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMSiriRemembersInteraction *)self identifier];
  uint64_t v4 = [(BMSiriRemembersInteraction *)self type];
  uint64_t v5 = [(BMSiriRemembersInteraction *)self domain];
  v49 = [(BMSiriRemembersInteraction *)self appBundleId];
  int v48 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriRemembersInteraction status](self, "status"));
  v47 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriRemembersInteraction direction](self, "direction"));
  if ([(BMSiriRemembersInteraction *)self hasIsDonatedBySiri])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriRemembersInteraction isDonatedBySiri](self, "isDonatedBySiri"));
    id v46 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v46 = 0;
  }
  v6 = [(BMSiriRemembersInteraction *)self startDate];
  if (v6)
  {
    uint64_t v7 = NSNumber;
    v8 = [(BMSiriRemembersInteraction *)self startDate];
    [v8 timeIntervalSince1970];
    objc_msgSend(v7, "numberWithDouble:");
    id v45 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v45 = 0;
  }

  if (![(BMSiriRemembersInteraction *)self hasDurationInSeconds]
    || ([(BMSiriRemembersInteraction *)self durationInSeconds], fabs(v9) == INFINITY))
  {
    id v44 = 0;
  }
  else
  {
    [(BMSiriRemembersInteraction *)self durationInSeconds];
    v10 = NSNumber;
    [(BMSiriRemembersInteraction *)self durationInSeconds];
    objc_msgSend(v10, "numberWithDouble:");
    id v44 = (id)objc_claimAutoreleasedReturnValue();
  }
  v43 = [(BMSiriRemembersInteraction *)self fields];
  double v42 = [(BMSiriRemembersInteraction *)self groupIdentifier];
  double v41 = [(BMSiriRemembersInteraction *)self appIntentInteractionIdentifier];
  double v40 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriRemembersInteraction interactionSource](self, "interactionSource"));
  if ([(BMSiriRemembersInteraction *)self hasContentHash])
  {
    objc_msgSend(NSNumber, "numberWithLongLong:", -[BMSiriRemembersInteraction contentHash](self, "contentHash"));
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
  BOOL v12 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriRemembersInteraction userDonatorType](self, "userDonatorType"));
  v50[0] = @"identifier";
  uint64_t v13 = v3;
  if (!v3)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v35 = (void *)v13;
  v51[0] = v13;
  v50[1] = @"type";
  uint64_t v14 = v4;
  if (!v4)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = (void *)v14;
  v51[1] = v14;
  v50[2] = @"domain";
  uint64_t v15 = v5;
  if (!v5)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  int v33 = (void *)v15;
  v51[2] = v15;
  v50[3] = @"appBundleId";
  uint64_t v16 = (uint64_t)v49;
  if (!v49)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v51[3] = v16;
  v50[4] = @"status";
  uint64_t v17 = (uint64_t)v48;
  if (!v48)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v51[4] = v17;
  v50[5] = @"direction";
  uint64_t v18 = (uint64_t)v47;
  if (!v47)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v38 = (void *)v4;
  v51[5] = v18;
  v50[6] = @"isDonatedBySiri";
  uint64_t v19 = (uint64_t)v46;
  if (!v46)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)v5;
  v29 = (void *)v19;
  v51[6] = v19;
  v50[7] = @"startDate";
  uint64_t v20 = v45;
  if (!v45)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  int v32 = (void *)v16;
  v51[7] = v20;
  v50[8] = @"durationInSeconds";
  v21 = v44;
  if (!v44)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  int v39 = (void *)v3;
  v51[8] = v21;
  v50[9] = @"fields";
  v22 = v43;
  if (!v43)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  int v31 = (void *)v17;
  v51[9] = v22;
  v50[10] = @"groupIdentifier";
  v23 = v42;
  if (!v42)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
  }
  int v30 = (void *)v18;
  v51[10] = v23;
  v50[11] = @"appIntentInteractionIdentifier";
  int v24 = v41;
  if (!v41)
  {
    int v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v51[11] = v24;
  v50[12] = @"interactionSource";
  v25 = v40;
  if (!v40)
  {
    v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v51[12] = v25;
  v50[13] = @"contentHash";
  uint64_t v26 = v11;
  if (!v11)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v51[13] = v26;
  v50[14] = @"userDonatorType";
  v27 = v12;
  if (!v12)
  {
    v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v51[14] = v27;
  id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:15];
  if (v12)
  {
    if (v11) {
      goto LABEL_46;
    }
  }
  else
  {

    if (v11) {
      goto LABEL_46;
    }
  }

LABEL_46:
  if (!v40) {

  }
  if (!v41) {
  if (!v42)
  }

  if (!v43) {
  if (!v44)
  }

  if (!v45) {
  if (!v46)
  }

  if (!v47) {
  if (!v48)
  }

  if (v49)
  {
    if (v37) {
      goto LABEL_66;
    }
  }
  else
  {

    if (v37)
    {
LABEL_66:
      if (v38) {
        goto LABEL_67;
      }
LABEL_75:

      if (v39) {
        goto LABEL_68;
      }
      goto LABEL_76;
    }
  }

  if (!v38) {
    goto LABEL_75;
  }
LABEL_67:
  if (v39) {
    goto LABEL_68;
  }
LABEL_76:

LABEL_68:

  return v36;
}

- (BMSiriRemembersInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v180[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"identifier"];
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
    v8 = [v5 objectForKeyedSubscript:@"type"];
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v147 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v147 = v8;
LABEL_7:
      uint64_t v9 = [v5 objectForKeyedSubscript:@"domain"];
      id v148 = v7;
      v149 = (void *)v9;
      if (!v9 || (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v145 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v145 = v10;
LABEL_10:
        id v11 = [v5 objectForKeyedSubscript:@"appBundleId"];
        v146 = v11;
        if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v12 = 0;
LABEL_13:
          uint64_t v13 = [v5 objectForKeyedSubscript:@"status"];
          id v143 = v12;
          v139 = (void *)v13;
          if (v13 && (uint64_t v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v144 = v14;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  id v144 = 0;
                  int v39 = 0;
                  v37 = v147;
                  v43 = v145;
                  goto LABEL_130;
                }
                id v83 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v84 = *MEMORY[0x1E4F502C8];
                uint64_t v171 = *MEMORY[0x1E4F28568];
                id v142 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"status"];
                id v172 = v142;
                v140 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v172 forKeys:&v171 count:1];
                id v85 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v84, 2);
                id v144 = 0;
                int v39 = 0;
                *a4 = v85;
                id v11 = v146;
                v37 = v147;
                v43 = v145;
                goto LABEL_129;
              }
              id v144 = [NSNumber numberWithInt:BMSiriRemembersInteractionInteractionStatusFromString(v14)];
            }
          }
          else
          {
            id v144 = 0;
          }
          uint64_t v15 = [v5 objectForKeyedSubscript:@"direction"];
          v140 = (void *)v15;
          v137 = v8;
          if (v15 && (uint64_t v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v142 = v16;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  id v142 = 0;
                  int v39 = 0;
                  v37 = v147;
                  v43 = v145;
                  uint64_t v14 = v139;
                  goto LABEL_129;
                }
                id v91 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v92 = *MEMORY[0x1E4F502C8];
                uint64_t v169 = *MEMORY[0x1E4F28568];
                id v141 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"direction"];
                id v170 = v141;
                uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v170 forKeys:&v169 count:1];
                id v93 = (id)[v91 initWithDomain:v92 code:2 userInfo:v17];
                id v142 = 0;
                int v39 = 0;
                *a4 = v93;
                id v11 = v146;
                v37 = v147;
                v43 = v145;
                goto LABEL_115;
              }
              id v142 = [NSNumber numberWithInt:BMSiriRemembersInteractionInteractionDirectionFromString(v16)];
            }
          }
          else
          {
            id v142 = 0;
          }
          uint64_t v17 = [v5 objectForKeyedSubscript:@"isDonatedBySiri"];
          if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v132 = v17;
            id v141 = 0;
LABEL_22:
            uint64_t v18 = [v5 objectForKeyedSubscript:@"startDate"];
            v133 = (void *)v18;
            if (v18 && (uint64_t v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v47 = (objc_class *)MEMORY[0x1E4F1C9C8];
                id v48 = v19;
                id v49 = [v47 alloc];
                [v48 doubleValue];
                double v51 = v50;

                id v11 = v146;
                id v138 = (id)[v49 initWithTimeIntervalSince1970:v51];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v69 = objc_alloc_init(MEMORY[0x1E4F28D48]);
                  id v138 = [v69 dateFromString:v19];
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (!a4)
                    {
                      id v138 = 0;
                      int v39 = 0;
                      v37 = v147;
                      v43 = v145;
                      uint64_t v14 = v139;
                      uint64_t v17 = v132;
                      v68 = v133;
                      goto LABEL_127;
                    }
                    id v108 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v109 = *MEMORY[0x1E4F502C8];
                    uint64_t v165 = *MEMORY[0x1E4F28568];
                    id v136 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"startDate"];
                    id v166 = v136;
                    uint64_t v110 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v166 forKeys:&v165 count:1];
                    v111 = v108;
                    id v11 = v146;
                    v134 = (void *)v110;
                    id v112 = (id)objc_msgSend(v111, "initWithDomain:code:userInfo:", v109, 2);
                    id v138 = 0;
                    int v39 = 0;
                    *a4 = v112;
                    v68 = v133;
                    v37 = v147;
                    v43 = v145;
                    uint64_t v14 = v139;
                    uint64_t v17 = v132;
                    goto LABEL_126;
                  }
                  id v138 = v19;
                }
              }
            }
            else
            {
              id v138 = 0;
            }
            uint64_t v20 = [v5 objectForKeyedSubscript:@"durationInSeconds"];
            v134 = (void *)v20;
            if (v20 && (v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  id v136 = 0;
                  int v39 = 0;
                  v37 = v147;
                  v43 = v145;
                  uint64_t v14 = v139;
                  uint64_t v17 = v132;
                  v68 = v133;
                  goto LABEL_126;
                }
                id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v71 = *MEMORY[0x1E4F502C8];
                uint64_t v163 = *MEMORY[0x1E4F28568];
                id v72 = [NSString alloc];
                uint64_t v121 = objc_opt_class();
                v73 = v72;
                id v12 = v143;
                id v135 = (id)[v73 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v121, @"durationInSeconds"];
                id v164 = v135;
                uint64_t v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v164 forKeys:&v163 count:1];
                v75 = v70;
                id v11 = v146;
                v131 = (void *)v74;
                id v76 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v71, 2);
                id v136 = 0;
                int v39 = 0;
                *a4 = v76;
                v37 = v147;
                v43 = v145;
                goto LABEL_137;
              }
              id v136 = v21;
            }
            else
            {
              id v136 = 0;
            }
            uint64_t v22 = [v5 objectForKeyedSubscript:@"fields"];
            v131 = (void *)v22;
            if (!v22 || (v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v135 = 0;
              goto LABEL_31;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v135 = v23;
LABEL_31:
              uint64_t v24 = [v5 objectForKeyedSubscript:@"groupIdentifier"];
              v128 = (void *)v24;
              if (!v24 || (v25 = (void *)v24, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v130 = 0;
                goto LABEL_34;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v130 = v25;
LABEL_34:
                uint64_t v26 = [v5 objectForKeyedSubscript:@"appIntentInteractionIdentifier"];
                v127 = (void *)v26;
                if (!v26 || (v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v129 = 0;
                  goto LABEL_37;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v129 = v27;
LABEL_37:
                  uint64_t v28 = [v5 objectForKeyedSubscript:@"interactionSource"];
                  v125 = (void *)v28;
                  if (!v28 || (v29 = (void *)v28, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v30 = 0;
LABEL_40:
                    int v31 = [v5 objectForKeyedSubscript:@"contentHash"];
                    v124 = v30;
                    if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (!a4)
                        {
                          id v126 = 0;
                          int v39 = 0;
                          v37 = v147;
                          goto LABEL_121;
                        }
                        id v99 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v100 = *MEMORY[0x1E4F502C8];
                        uint64_t v153 = *MEMORY[0x1E4F28568];
                        v34 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"contentHash"];
                        v154 = v34;
                        int v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v154 forKeys:&v153 count:1];
                        uint64_t v101 = v100;
                        id v12 = v143;
                        id v102 = (id)[v99 initWithDomain:v101 code:2 userInfo:v32];
                        id v126 = 0;
                        int v39 = 0;
                        *a4 = v102;
                        goto LABEL_151;
                      }
                      id v126 = v31;
                    }
                    else
                    {
                      id v126 = 0;
                    }
                    int v32 = [v5 objectForKeyedSubscript:@"userDonatorType"];
                    if (!v32 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      int v33 = self;
                      v34 = 0;
LABEL_119:
                      uint64_t v103 = [v144 intValue];
                      uint64_t v104 = [v142 intValue];
                      int v105 = [v30 intValue];
                      LODWORD(v123) = [v34 intValue];
                      LODWORD(v122) = v105;
                      v106 = v33;
                      v37 = v147;
                      id v12 = v143;
                      int v39 = objc_retain(-[BMSiriRemembersInteraction initWithIdentifier:type:domain:appBundleId:status:direction:isDonatedBySiri:startDate:durationInSeconds:fields:groupIdentifier:appIntentInteractionIdentifier:interactionSource:contentHash:userDonatorType:](v106, "initWithIdentifier:type:domain:appBundleId:status:direction:isDonatedBySiri:startDate:durationInSeconds:fields:groupIdentifier:appIntentInteractionIdentifier:interactionSource:contentHash:userDonatorType:", v148, v147, v145, v143, v103, v104, v141, v138, v136, v135, v130, v129, v122, v126,
                                v123,
                                v30));
                      self = v39;
LABEL_120:

LABEL_121:
                      uint64_t v14 = v139;
                      uint64_t v17 = v132;
                      v68 = v133;

                      id v11 = v146;
LABEL_122:

                      v43 = v145;
LABEL_123:

LABEL_124:
LABEL_125:

LABEL_126:
                      goto LABEL_127;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      int v33 = self;
                      id v82 = v32;
LABEL_118:
                      v34 = v82;
                      goto LABEL_119;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      int v33 = self;
                      id v82 = [NSNumber numberWithInt:BMSiriRemembersInteractionUserDonatorTypeFromString(v32)];
                      goto LABEL_118;
                    }
                    if (a4)
                    {
                      id v116 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v117 = *MEMORY[0x1E4F502C8];
                      uint64_t v151 = *MEMORY[0x1E4F28568];
                      v118 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"userDonatorType"];
                      v152 = v118;
                      v119 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v152 forKeys:&v151 count:1];
                      *a4 = (id)[v116 initWithDomain:v117 code:2 userInfo:v119];
                    }
                    v34 = 0;
                    int v39 = 0;
LABEL_151:
                    v37 = v147;
                    goto LABEL_120;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v30 = v29;
                    goto LABEL_40;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v30 = [NSNumber numberWithInt:BMSiriRemembersInteractionInteractionSourceFromString(v29)];
                    goto LABEL_40;
                  }
                  if (a4)
                  {
                    id v113 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v114 = *MEMORY[0x1E4F502C8];
                    uint64_t v155 = *MEMORY[0x1E4F28568];
                    id v126 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"interactionSource"];
                    id v156 = v126;
                    int v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v156 forKeys:&v155 count:1];
                    id v115 = (id)[v113 initWithDomain:v114 code:2 userInfo:v31];
                    v124 = 0;
                    int v39 = 0;
                    *a4 = v115;
                    v37 = v147;
                    goto LABEL_121;
                  }
                  v124 = 0;
                  int v39 = 0;
                  id v11 = v146;
                  v37 = v147;
LABEL_155:
                  uint64_t v14 = v139;
                  uint64_t v17 = v132;
                  v68 = v133;
                  goto LABEL_122;
                }
                if (a4)
                {
                  id v94 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v95 = *MEMORY[0x1E4F502C8];
                  uint64_t v157 = *MEMORY[0x1E4F28568];
                  v124 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"appIntentInteractionIdentifier"];
                  v158 = v124;
                  uint64_t v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v158 forKeys:&v157 count:1];
                  v97 = v94;
                  id v11 = v146;
                  v125 = (void *)v96;
                  id v98 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v95, 2);
                  id v129 = 0;
                  int v39 = 0;
                  *a4 = v98;
                  v37 = v147;
                  goto LABEL_155;
                }
                id v129 = 0;
                int v39 = 0;
LABEL_147:
                v37 = v147;
                v43 = v145;
                uint64_t v14 = v139;
                uint64_t v17 = v132;
                v68 = v133;
                goto LABEL_123;
              }
              if (a4)
              {
                id v86 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v87 = *MEMORY[0x1E4F502C8];
                uint64_t v159 = *MEMORY[0x1E4F28568];
                id v129 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"groupIdentifier"];
                id v160 = v129;
                uint64_t v88 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v160 forKeys:&v159 count:1];
                v89 = v86;
                id v11 = v146;
                v127 = (void *)v88;
                id v90 = (id)objc_msgSend(v89, "initWithDomain:code:userInfo:", v87, 2);
                id v130 = 0;
                int v39 = 0;
                *a4 = v90;
                goto LABEL_147;
              }
              id v130 = 0;
              int v39 = 0;
LABEL_140:
              v37 = v147;
              v43 = v145;
              uint64_t v14 = v139;
              uint64_t v17 = v132;
              v68 = v133;
              goto LABEL_124;
            }
            if (a4)
            {
              id v77 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v78 = *MEMORY[0x1E4F502C8];
              uint64_t v161 = *MEMORY[0x1E4F28568];
              id v130 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"fields"];
              id v162 = v130;
              uint64_t v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v162 forKeys:&v161 count:1];
              v80 = v77;
              id v11 = v146;
              v128 = (void *)v79;
              id v81 = (id)objc_msgSend(v80, "initWithDomain:code:userInfo:", v78, 2);
              id v135 = 0;
              int v39 = 0;
              *a4 = v81;
              goto LABEL_140;
            }
            id v135 = 0;
            int v39 = 0;
            v37 = v147;
            v43 = v145;
LABEL_137:
            uint64_t v14 = v139;
            uint64_t v17 = v132;
            v68 = v133;
            goto LABEL_125;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v132 = v17;
            id v141 = v17;
            goto LABEL_22;
          }
          if (a4)
          {
            id v61 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v62 = *MEMORY[0x1E4F502C8];
            uint64_t v167 = *MEMORY[0x1E4F28568];
            id v63 = [NSString alloc];
            uint64_t v120 = objc_opt_class();
            v64 = v63;
            id v12 = v143;
            id v138 = (id)[v64 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v120, @"isDonatedBySiri"];
            id v168 = v138;
            uint64_t v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v168 forKeys:&v167 count:1];
            v66 = v61;
            id v11 = v146;
            id v67 = (id)[v66 initWithDomain:v62 code:2 userInfo:v65];
            id v141 = 0;
            int v39 = 0;
            *a4 = v67;
            v68 = (void *)v65;
            v37 = v147;
            v43 = v145;
            uint64_t v14 = v139;
LABEL_127:

            goto LABEL_128;
          }
          id v141 = 0;
          int v39 = 0;
          v37 = v147;
          v43 = v145;
LABEL_115:
          uint64_t v14 = v139;
LABEL_128:

          v8 = v137;
LABEL_129:

          goto LABEL_130;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          goto LABEL_13;
        }
        if (a4)
        {
          id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v58 = *MEMORY[0x1E4F502C8];
          uint64_t v173 = *MEMORY[0x1E4F28568];
          id v144 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"appBundleId"];
          id v174 = v144;
          uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v174 forKeys:&v173 count:1];
          v59 = v57;
          id v11 = v146;
          id v60 = (id)[v59 initWithDomain:v58 code:2 userInfo:v14];
          id v12 = 0;
          int v39 = 0;
          *a4 = v60;
          v37 = v147;
          v43 = v145;
LABEL_130:

          goto LABEL_131;
        }
        id v12 = 0;
        int v39 = 0;
        v37 = v147;
        v43 = v145;
LABEL_131:

        id v7 = v148;
        goto LABEL_132;
      }
      if (a4)
      {
        id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v53 = *MEMORY[0x1E4F502C8];
        uint64_t v175 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"domain"];
        id v176 = v12;
        uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v176 forKeys:&v175 count:1];
        v55 = v52;
        id v11 = (void *)v54;
        id v56 = (id)[v55 initWithDomain:v53 code:2 userInfo:v54];
        v43 = 0;
        int v39 = 0;
        *a4 = v56;
        v37 = v147;
        goto LABEL_131;
      }
      v43 = 0;
      int v39 = 0;
      v37 = v147;
LABEL_132:

      goto LABEL_133;
    }
    if (a4)
    {
      id v40 = v7;
      id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v42 = *MEMORY[0x1E4F502C8];
      uint64_t v177 = *MEMORY[0x1E4F28568];
      v43 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"type"];
      v178 = v43;
      uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v178 forKeys:&v177 count:1];
      id v45 = v41;
      id v7 = v40;
      v149 = (void *)v44;
      id v46 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v42, 2);
      v37 = 0;
      int v39 = 0;
      *a4 = v46;
      goto LABEL_132;
    }
    v37 = 0;
    int v39 = 0;
LABEL_133:

    goto LABEL_134;
  }
  if (a4)
  {
    id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v36 = *MEMORY[0x1E4F502C8];
    uint64_t v179 = *MEMORY[0x1E4F28568];
    v37 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
    v180[0] = v37;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v180 forKeys:&v179 count:1];
    id v38 = (id)[v35 initWithDomain:v36 code:2 userInfo:v8];
    id v7 = 0;
    int v39 = 0;
    *a4 = v38;
    goto LABEL_133;
  }
  id v7 = 0;
  int v39 = 0;
LABEL_134:

  return v39;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSiriRemembersInteraction *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_type) {
    PBDataWriterWriteStringField();
  }
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  if (self->_appBundleId) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasIsDonatedBySiri) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasRaw_startDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasDurationInSeconds) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_fields) {
    PBDataWriterWriteStringField();
  }
  if (self->_groupIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_appIntentInteractionIdentifier) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasContentHash) {
    PBDataWriterWriteInt64Field();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)BMSiriRemembersInteraction;
  id v5 = [(BMEventBase *)&v71 init];
  if (!v5) {
    goto LABEL_119;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v9 = (int *)MEMORY[0x1E4F940B8];
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
          uint64_t v21 = 56;
          goto LABEL_56;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 64;
          goto LABEL_56;
        case 3u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 72;
          goto LABEL_56;
        case 4u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 80;
          goto LABEL_56;
        case 5u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
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
                  LODWORD(v24) = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_81:
          if (v24 >= 8) {
            LODWORD(v24) = 0;
          }
          uint64_t v67 = 40;
          goto LABEL_110;
        case 6u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v24 = 0;
          while (2)
          {
            uint64_t v31 = *v6;
            uint64_t v32 = *(void *)&v4[v31];
            unint64_t v33 = v32 + 1;
            if (v32 == -1 || v33 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)&v4[*v9] + v32);
              *(void *)&v4[v31] = v33;
              v24 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                BOOL v17 = v30++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_87;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_87:
          if (v24 >= 4) {
            LODWORD(v24) = 0;
          }
          uint64_t v67 = 44;
          goto LABEL_110;
        case 7u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0;
          v5->_hasIsDonatedBySiri = 1;
          while (2)
          {
            uint64_t v38 = *v6;
            uint64_t v39 = *(void *)&v4[v38];
            unint64_t v40 = v39 + 1;
            if (v39 == -1 || v40 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)&v4[*v9] + v39);
              *(void *)&v4[v38] = v40;
              v37 |= (unint64_t)(v41 & 0x7F) << v35;
              if (v41 < 0)
              {
                v35 += 7;
                BOOL v17 = v36++ >= 9;
                if (v17)
                {
                  uint64_t v37 = 0;
                  goto LABEL_93;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v37 = 0;
          }
LABEL_93:
          v5->_isDonatedBySiri = v37 != 0;
          continue;
        case 8u:
          v5->_hasRaw_startDate = 1;
          uint64_t v42 = *v6;
          unint64_t v43 = *(void *)&v4[v42];
          if (v43 <= 0xFFFFFFFFFFFFFFF7 && v43 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v44 = *(objc_class **)(*(void *)&v4[*v9] + v43);
            *(void *)&v4[v42] = v43 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v44 = 0;
          }
          uint64_t v68 = 24;
          goto LABEL_115;
        case 9u:
          v5->_hasDurationInSeconds = 1;
          uint64_t v45 = *v6;
          unint64_t v46 = *(void *)&v4[v45];
          if (v46 <= 0xFFFFFFFFFFFFFFF7 && v46 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v44 = *(objc_class **)(*(void *)&v4[*v9] + v46);
            *(void *)&v4[v45] = v46 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v44 = 0;
          }
          uint64_t v68 = 88;
LABEL_115:
          *(Class *)((char *)&v5->super.super.isa + v68) = v44;
          continue;
        case 0xBu:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 96;
          goto LABEL_56;
        case 0xCu:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 104;
          goto LABEL_56;
        case 0xDu:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 112;
LABEL_56:
          v47 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 0xEu:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v24 = 0;
          while (2)
          {
            uint64_t v50 = *v6;
            uint64_t v51 = *(void *)&v4[v50];
            unint64_t v52 = v51 + 1;
            if (v51 == -1 || v52 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v53 = *(unsigned char *)(*(void *)&v4[*v9] + v51);
              *(void *)&v4[v50] = v52;
              v24 |= (unint64_t)(v53 & 0x7F) << v48;
              if (v53 < 0)
              {
                v48 += 7;
                BOOL v17 = v49++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_97;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_97:
          if (v24 >= 3) {
            LODWORD(v24) = 0;
          }
          uint64_t v67 = 48;
          goto LABEL_110;
        case 0xFu:
          char v54 = 0;
          unsigned int v55 = 0;
          int64_t v56 = 0;
          v5->_hasContentHash = 1;
          while (2)
          {
            uint64_t v57 = *v6;
            uint64_t v58 = *(void *)&v4[v57];
            unint64_t v59 = v58 + 1;
            if (v58 == -1 || v59 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v60 = *(unsigned char *)(*(void *)&v4[*v9] + v58);
              *(void *)&v4[v57] = v59;
              v56 |= (unint64_t)(v60 & 0x7F) << v54;
              if (v60 < 0)
              {
                v54 += 7;
                BOOL v17 = v55++ >= 9;
                if (v17)
                {
                  int64_t v56 = 0;
                  goto LABEL_103;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            int64_t v56 = 0;
          }
LABEL_103:
          v5->_contentHash = v56;
          continue;
        case 0x10u:
          char v61 = 0;
          unsigned int v62 = 0;
          uint64_t v24 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_118;
          }
          continue;
      }
      while (1)
      {
        uint64_t v63 = *v6;
        uint64_t v64 = *(void *)&v4[v63];
        unint64_t v65 = v64 + 1;
        if (v64 == -1 || v65 > *(void *)&v4[*v7]) {
          break;
        }
        char v66 = *(unsigned char *)(*(void *)&v4[*v9] + v64);
        *(void *)&v4[v63] = v65;
        v24 |= (unint64_t)(v66 & 0x7F) << v61;
        if ((v66 & 0x80) == 0) {
          goto LABEL_105;
        }
        v61 += 7;
        BOOL v17 = v62++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_107;
        }
      }
      v4[*v8] = 1;
LABEL_105:
      if (v4[*v8]) {
        LODWORD(v24) = 0;
      }
LABEL_107:
      if (v24 >= 4) {
        LODWORD(v24) = 0;
      }
      uint64_t v67 = 52;
LABEL_110:
      *(_DWORD *)((char *)&v5->super.super.isa + v67) = v24;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_118:
  }
    id v69 = 0;
  else {
LABEL_119:
  }
    id v69 = v5;

  return v69;
}

- (NSString)description
{
  id v17 = [NSString alloc];
  char v16 = [(BMSiriRemembersInteraction *)self identifier];
  uint64_t v21 = [(BMSiriRemembersInteraction *)self type];
  uint64_t v20 = [(BMSiriRemembersInteraction *)self domain];
  unint64_t v15 = [(BMSiriRemembersInteraction *)self appBundleId];
  uint64_t v14 = BMSiriRemembersInteractionInteractionStatusAsString([(BMSiriRemembersInteraction *)self status]);
  uint64_t v19 = BMSiriRemembersInteractionInteractionDirectionAsString([(BMSiriRemembersInteraction *)self direction]);
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriRemembersInteraction isDonatedBySiri](self, "isDonatedBySiri"));
  uint64_t v3 = [(BMSiriRemembersInteraction *)self startDate];
  id v4 = NSNumber;
  [(BMSiriRemembersInteraction *)self durationInSeconds];
  unint64_t v12 = objc_msgSend(v4, "numberWithDouble:");
  id v5 = [(BMSiriRemembersInteraction *)self fields];
  v6 = [(BMSiriRemembersInteraction *)self groupIdentifier];
  id v7 = [(BMSiriRemembersInteraction *)self appIntentInteractionIdentifier];
  v8 = BMSiriRemembersInteractionInteractionSourceAsString([(BMSiriRemembersInteraction *)self interactionSource]);
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMSiriRemembersInteraction contentHash](self, "contentHash"));
  char v10 = BMSiriRemembersInteractionUserDonatorTypeAsString([(BMSiriRemembersInteraction *)self userDonatorType]);
  int v18 = (void *)[v17 initWithFormat:@"BMSiriRemembersInteraction with identifier: %@, type: %@, domain: %@, appBundleId: %@, status: %@, direction: %@, isDonatedBySiri: %@, startDate: %@, durationInSeconds: %@, fields: %@, groupIdentifier: %@, appIntentInteractionIdentifier: %@, interactionSource: %@, contentHash: %@, userDonatorType: %@", v16, v21, v20, v15, v14, v19, v13, v3, v12, v5, v6, v7, v8, v9, v10];

  return (NSString *)v18;
}

- (BMSiriRemembersInteraction)initWithIdentifier:(id)a3 type:(id)a4 domain:(id)a5 appBundleId:(id)a6 status:(int)a7 direction:(int)a8 isDonatedBySiri:(id)a9 startDate:(id)a10 durationInSeconds:(id)a11 fields:(id)a12 groupIdentifier:(id)a13 appIntentInteractionIdentifier:(id)a14 interactionSource:(int)a15 contentHash:(id)a16 userDonatorType:(int)a17
{
  id v40 = a3;
  id v32 = a4;
  id v39 = a4;
  id v38 = a5;
  id v37 = a6;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v36 = a12;
  id v23 = a13;
  id v24 = a14;
  id v25 = a16;
  v41.receiver = self;
  v41.super_class = (Class)BMSiriRemembersInteraction;
  uint64_t v26 = [(BMEventBase *)&v41 init];
  if (v26)
  {
    v26->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v26->_identifier, a3);
    objc_storeStrong((id *)&v26->_type, v32);
    objc_storeStrong((id *)&v26->_domain, a5);
    objc_storeStrong((id *)&v26->_appBundleId, a6);
    v26->_status = a7;
    v26->_direction = a8;
    if (v20)
    {
      v26->_hasIsDonatedBySiri = 1;
      v26->_isDonatedBySiri = [v20 BOOLValue];
    }
    else
    {
      v26->_hasIsDonatedBySiri = 0;
      v26->_isDonatedBySiri = 0;
    }
    if (v21)
    {
      v26->_hasRaw_startDate = 1;
      [v21 timeIntervalSince1970];
    }
    else
    {
      v26->_hasRaw_startDate = 0;
      double v27 = -1.0;
    }
    v26->_raw_startDate = v27;
    if (v22)
    {
      v26->_hasDurationInSeconds = 1;
      [v22 doubleValue];
    }
    else
    {
      v26->_hasDurationInSeconds = 0;
      double v28 = -1.0;
    }
    v26->_durationInSeconds = v28;
    objc_storeStrong((id *)&v26->_fields, a12);
    objc_storeStrong((id *)&v26->_groupIdentifier, a13);
    objc_storeStrong((id *)&v26->_appIntentInteractionIdentifier, a14);
    v26->_interactionSource = a15;
    if (v25)
    {
      v26->_hasContentHash = 1;
      uint64_t v29 = [v25 longLongValue];
    }
    else
    {
      v26->_hasContentHash = 0;
      uint64_t v29 = -1;
    }
    v26->_contentHash = v29;
    v26->_userDonatorType = a17;
  }

  return v26;
}

+ (id)protoFields
{
  v20[16] = *MEMORY[0x1E4F143B8];
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:1 type:13 subMessageClass:0];
  v20[0] = v19;
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"type" number:2 type:13 subMessageClass:0];
  v20[1] = v18;
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"domain" number:3 type:13 subMessageClass:0];
  v20[2] = v17;
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appBundleId" number:4 type:13 subMessageClass:0];
  v20[3] = v16;
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"status" number:5 type:4 subMessageClass:0];
  v20[4] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"direction" number:6 type:4 subMessageClass:0];
  v20[5] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isDonatedBySiri" number:7 type:12 subMessageClass:0];
  v20[6] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"startDate" number:8 type:0 subMessageClass:0];
  v20[7] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"durationInSeconds" number:9 type:0 subMessageClass:0];
  v20[8] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"interactionFields" number:10 type:14 subMessageClass:objc_opt_class()];
  v20[9] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fields" number:11 type:13 subMessageClass:0];
  v20[10] = v5;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"groupIdentifier" number:12 type:13 subMessageClass:0];
  v20[11] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appIntentInteractionIdentifier" number:13 type:13 subMessageClass:0];
  v20[12] = v7;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"interactionSource" number:14 type:4 subMessageClass:0];
  v20[13] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentHash" number:15 type:3 subMessageClass:0];
  v20[14] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userDonatorType" number:16 type:4 subMessageClass:0];
  v20[15] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:16];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3EB8;
}

+ (id)columns
{
  v20[16] = *MEMORY[0x1E4F143B8];
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"type" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"domain" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appBundleId" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"status" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"direction" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isDonatedBySiri" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"startDate" dataType:3 requestOnly:0 fieldNumber:8 protoDataType:0 convertedType:2];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"durationInSeconds" dataType:1 requestOnly:0 fieldNumber:9 protoDataType:0 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"interactionFields_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_133];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"fields" dataType:2 requestOnly:0 fieldNumber:11 protoDataType:13 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"groupIdentifier" dataType:2 requestOnly:0 fieldNumber:12 protoDataType:13 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appIntentInteractionIdentifier" dataType:2 requestOnly:0 fieldNumber:13 protoDataType:13 convertedType:0];
  unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"interactionSource" dataType:0 requestOnly:0 fieldNumber:14 protoDataType:4 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentHash" dataType:0 requestOnly:0 fieldNumber:15 protoDataType:3 convertedType:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userDonatorType" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:4 convertedType:0];
  v20[0] = v19;
  v20[1] = v18;
  v20[2] = v17;
  v20[3] = v16;
  v20[4] = v15;
  v20[5] = v14;
  v20[6] = v2;
  v20[7] = v3;
  v20[8] = v4;
  v20[9] = v5;
  v20[10] = v13;
  v20[11] = v6;
  v20[12] = v7;
  v20[13] = v12;
  v20[14] = v8;
  v20[15] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:16];

  return v11;
}

uint64_t __37__BMSiriRemembersInteraction_columns__block_invoke()
{
  return 0;
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

    v8 = [[BMSiriRemembersInteraction alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[9] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (BMSiriRemembersInteraction)initWithIdentifier:(id)a3 type:(id)a4 domain:(id)a5 appBundleId:(id)a6 status:(int)a7 direction:(int)a8 isDonatedBySiri:(id)a9 startDate:(id)a10 durationInSeconds:(id)a11 interactionFields:(id)a12 fields:(id)a13 groupIdentifier:(id)a14 appIntentInteractionIdentifier:(id)a15 interactionSource:(int)a16 contentHash:(id)a17 userDonatorType:(int)a18
{
  return -[BMSiriRemembersInteraction initWithIdentifier:type:domain:appBundleId:status:direction:isDonatedBySiri:startDate:durationInSeconds:fields:groupIdentifier:appIntentInteractionIdentifier:interactionSource:contentHash:userDonatorType:](self, "initWithIdentifier:type:domain:appBundleId:status:direction:isDonatedBySiri:startDate:durationInSeconds:fields:groupIdentifier:appIntentInteractionIdentifier:interactionSource:contentHash:userDonatorType:", a3, a4, a5, a6, *(void *)&a7, *(void *)&a8);
}

- (BMSiriRemembersInteraction)initWithIdentifier:(id)a3 type:(id)a4 domain:(id)a5 appBundleId:(id)a6 status:(int)a7 direction:(int)a8 isDonatedBySiri:(id)a9 startDate:(id)a10 durationInSeconds:(id)a11 interactionFields:(id)a12 fields:(id)a13 groupIdentifier:(id)a14 appIntentInteractionIdentifier:(id)a15 interactionSource:(int)a16 contentHash:(id)a17
{
  LODWORD(v19) = 0;
  LODWORD(v18) = a16;
  return [(BMSiriRemembersInteraction *)self initWithIdentifier:a3 type:a4 domain:a5 appBundleId:a6 status:*(void *)&a7 direction:*(void *)&a8 isDonatedBySiri:a9 startDate:a10 durationInSeconds:a11 interactionFields:a12 fields:a13 groupIdentifier:a14 appIntentInteractionIdentifier:a15 interactionSource:v18 contentHash:a17 userDonatorType:v19];
}

- (BMSiriRemembersInteraction)initWithIdentifier:(id)a3 type:(id)a4 domain:(id)a5 appBundleId:(id)a6 status:(int)a7 direction:(int)a8 isDonatedBySiri:(id)a9 startDate:(id)a10 durationInSeconds:(id)a11 interactionFields:(id)a12 fields:(id)a13 groupIdentifier:(id)a14 appIntentInteractionIdentifier:(id)a15 interactionSource:(int)a16
{
  LODWORD(v17) = a16;
  return [(BMSiriRemembersInteraction *)self initWithIdentifier:a3 type:a4 domain:a5 appBundleId:a6 status:*(void *)&a7 direction:*(void *)&a8 isDonatedBySiri:a9 startDate:a10 durationInSeconds:a11 interactionFields:a12 fields:a13 groupIdentifier:a14 appIntentInteractionIdentifier:a15 interactionSource:v17 contentHash:0];
}

- (BMSiriRemembersInteraction)initWithIdentifier:(id)a3 type:(id)a4 domain:(id)a5 appBundleId:(id)a6 status:(int)a7 direction:(int)a8 isDonatedBySiri:(id)a9 startDate:(id)a10 durationInSeconds:(id)a11 interactionFields:(id)a12 fields:(id)a13 groupIdentifier:(id)a14
{
  LODWORD(v15) = 0;
  return [(BMSiriRemembersInteraction *)self initWithIdentifier:a3 type:a4 domain:a5 appBundleId:a6 status:*(void *)&a7 direction:*(void *)&a8 isDonatedBySiri:a9 startDate:a10 durationInSeconds:a11 interactionFields:a12 fields:a13 groupIdentifier:a14 appIntentInteractionIdentifier:0 interactionSource:v15];
}

- (BMSiriRemembersInteraction)initWithIdentifier:(id)a3 type:(id)a4 domain:(id)a5 appBundleId:(id)a6 status:(int)a7 direction:(int)a8 isDonatedBySiri:(id)a9 startDate:(id)a10 durationInSeconds:(id)a11 interactionFields:(id)a12 fields:(id)a13
{
  return [(BMSiriRemembersInteraction *)self initWithIdentifier:a3 type:a4 domain:a5 appBundleId:a6 status:*(void *)&a7 direction:*(void *)&a8 isDonatedBySiri:a9 startDate:a10 durationInSeconds:a11 interactionFields:a12 fields:a13 groupIdentifier:0];
}

- (BMSiriRemembersInteraction)initWithIdentifier:(id)a3 type:(id)a4 domain:(id)a5 appBundleId:(id)a6 status:(int)a7 direction:(int)a8 isDonatedBySiri:(id)a9 startDate:(id)a10 durationInSeconds:(id)a11 interactionFields:(id)a12
{
  return [(BMSiriRemembersInteraction *)self initWithIdentifier:a3 type:a4 domain:a5 appBundleId:a6 status:*(void *)&a7 direction:*(void *)&a8 isDonatedBySiri:a9 startDate:a10 durationInSeconds:a11 interactionFields:a12 fields:0 groupIdentifier:0];
}

@end