@interface BMProactiveHarvestingNotificationStack
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMProactiveHarvestingNotificationStack)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMProactiveHarvestingNotificationStack)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 notificationIDs:(id)a5 appBundleID:(id)a6 threadID:(id)a7 stackState:(id)a8 sectionID:(id)a9 contentProtection:(id)a10 personaId:(id)a11;
- (BOOL)hasSectionID;
- (BOOL)hasStackState;
- (BOOL)isEqual:(id)a3;
- (NSArray)notificationIDs;
- (NSDate)absoluteTimestamp;
- (NSString)appBundleID;
- (NSString)contentProtection;
- (NSString)description;
- (NSString)personaId;
- (NSString)threadID;
- (NSString)uniqueID;
- (id)_notificationIDsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int64_t)sectionID;
- (int64_t)stackState;
- (unsigned)dataVersion;
- (void)setHasSectionID:(BOOL)a3;
- (void)setHasStackState:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMProactiveHarvestingNotificationStack

+ (id)columns
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uniqueID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:1];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"notificationIDs_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_29653];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appBundleID" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"threadID" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"stackState" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:3 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sectionID" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:3 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentProtection" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"personaId" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_notificationIDs, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

- (NSString)personaId
{
  return self->_personaId;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void)setHasSectionID:(BOOL)a3
{
  self->_hasSectionID = a3;
}

- (BOOL)hasSectionID
{
  return self->_hasSectionID;
}

- (int64_t)sectionID
{
  return self->_sectionID;
}

- (void)setHasStackState:(BOOL)a3
{
  self->_hasStackState = a3;
}

- (BOOL)hasStackState
{
  return self->_hasStackState;
}

- (int64_t)stackState
{
  return self->_stackState;
}

- (NSString)threadID
{
  return self->_threadID;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (NSArray)notificationIDs
{
  return self->_notificationIDs;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
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
    v6 = [(BMProactiveHarvestingNotificationStack *)self uniqueID];
    uint64_t v7 = [v5 uniqueID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMProactiveHarvestingNotificationStack *)self uniqueID];
      v10 = [v5 uniqueID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_35;
      }
    }
    v13 = [(BMProactiveHarvestingNotificationStack *)self absoluteTimestamp];
    uint64_t v14 = [v5 absoluteTimestamp];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMProactiveHarvestingNotificationStack *)self absoluteTimestamp];
      v17 = [v5 absoluteTimestamp];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_35;
      }
    }
    v19 = [(BMProactiveHarvestingNotificationStack *)self notificationIDs];
    uint64_t v20 = [v5 notificationIDs];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMProactiveHarvestingNotificationStack *)self notificationIDs];
      v23 = [v5 notificationIDs];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_35;
      }
    }
    v25 = [(BMProactiveHarvestingNotificationStack *)self appBundleID];
    uint64_t v26 = [v5 appBundleID];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMProactiveHarvestingNotificationStack *)self appBundleID];
      v29 = [v5 appBundleID];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_35;
      }
    }
    v31 = [(BMProactiveHarvestingNotificationStack *)self threadID];
    uint64_t v32 = [v5 threadID];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMProactiveHarvestingNotificationStack *)self threadID];
      v35 = [v5 threadID];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_35;
      }
    }
    if ([(BMProactiveHarvestingNotificationStack *)self hasStackState]
      || [v5 hasStackState])
    {
      if (![(BMProactiveHarvestingNotificationStack *)self hasStackState]) {
        goto LABEL_35;
      }
      if (![v5 hasStackState]) {
        goto LABEL_35;
      }
      int64_t v37 = [(BMProactiveHarvestingNotificationStack *)self stackState];
      if (v37 != [v5 stackState]) {
        goto LABEL_35;
      }
    }
    if ([(BMProactiveHarvestingNotificationStack *)self hasSectionID]
      || [v5 hasSectionID])
    {
      if (![(BMProactiveHarvestingNotificationStack *)self hasSectionID]) {
        goto LABEL_35;
      }
      if (![v5 hasSectionID]) {
        goto LABEL_35;
      }
      int64_t v38 = [(BMProactiveHarvestingNotificationStack *)self sectionID];
      if (v38 != [v5 sectionID]) {
        goto LABEL_35;
      }
    }
    v39 = [(BMProactiveHarvestingNotificationStack *)self contentProtection];
    uint64_t v40 = [v5 contentProtection];
    if (v39 == (void *)v40)
    {
    }
    else
    {
      v41 = (void *)v40;
      v42 = [(BMProactiveHarvestingNotificationStack *)self contentProtection];
      v43 = [v5 contentProtection];
      int v44 = [v42 isEqual:v43];

      if (!v44)
      {
LABEL_35:
        char v12 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
    v46 = [(BMProactiveHarvestingNotificationStack *)self personaId];
    v47 = [v5 personaId];
    if (v46 == v47)
    {
      char v12 = 1;
    }
    else
    {
      v48 = [(BMProactiveHarvestingNotificationStack *)self personaId];
      v49 = [v5 personaId];
      char v12 = [v48 isEqual:v49];
    }
    goto LABEL_36;
  }
  char v12 = 0;
LABEL_37:

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
  v34[9] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMProactiveHarvestingNotificationStack *)self uniqueID];
  id v4 = [(BMProactiveHarvestingNotificationStack *)self absoluteTimestamp];
  if (v4)
  {
    id v5 = NSNumber;
    v6 = [(BMProactiveHarvestingNotificationStack *)self absoluteTimestamp];
    [v6 timeIntervalSinceReferenceDate];
    uint64_t v7 = objc_msgSend(v5, "numberWithDouble:");
  }
  else
  {
    uint64_t v7 = 0;
  }

  v8 = [(BMProactiveHarvestingNotificationStack *)self _notificationIDsJSONArray];
  v9 = [(BMProactiveHarvestingNotificationStack *)self appBundleID];
  uint64_t v10 = [(BMProactiveHarvestingNotificationStack *)self threadID];
  if ([(BMProactiveHarvestingNotificationStack *)self hasStackState])
  {
    uint64_t v32 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMProactiveHarvestingNotificationStack stackState](self, "stackState"));
  }
  else
  {
    uint64_t v32 = 0;
  }
  if ([(BMProactiveHarvestingNotificationStack *)self hasSectionID])
  {
    v31 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMProactiveHarvestingNotificationStack sectionID](self, "sectionID"));
  }
  else
  {
    v31 = 0;
  }
  int v11 = [(BMProactiveHarvestingNotificationStack *)self contentProtection];
  char v12 = [(BMProactiveHarvestingNotificationStack *)self personaId];
  v33[0] = @"uniqueID";
  uint64_t v13 = v3;
  if (!v3)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v13;
  v34[0] = v13;
  v33[1] = @"absoluteTimestamp";
  uint64_t v14 = v7;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v26 = (void *)v14;
  v34[1] = v14;
  v33[2] = @"notificationIDs";
  uint64_t v15 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v15;
  v34[2] = v15;
  v33[3] = @"appBundleID";
  uint64_t v16 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  int v30 = (void *)v3;
  int v24 = (void *)v16;
  v34[3] = v16;
  v33[4] = @"threadID";
  v17 = (void *)v10;
  if (!v10)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v7;
  v34[4] = v17;
  v33[5] = @"stackState";
  int v18 = v32;
  if (!v32)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[5] = v18;
  v33[6] = @"sectionID";
  v19 = v31;
  if (!v31)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v20 = (void *)v10;
  v34[6] = v19;
  v33[7] = @"contentProtection";
  v21 = v11;
  if (!v11)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[7] = v21;
  v33[8] = @"personaId";
  v22 = v12;
  if (!v12)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[8] = v22;
  id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:9];
  if (v12)
  {
    if (v11) {
      goto LABEL_30;
    }
  }
  else
  {

    if (v11) {
      goto LABEL_30;
    }
  }

LABEL_30:
  if (!v31) {

  }
  if (!v32) {
  if (!v20)
  }

  if (v9)
  {
    if (v8) {
      goto LABEL_38;
    }
  }
  else
  {

    if (v8)
    {
LABEL_38:
      if (v29) {
        goto LABEL_39;
      }
LABEL_47:

      if (v30) {
        goto LABEL_40;
      }
      goto LABEL_48;
    }
  }

  if (!v29) {
    goto LABEL_47;
  }
LABEL_39:
  if (v30) {
    goto LABEL_40;
  }
LABEL_48:

LABEL_40:

  return v28;
}

- (id)_notificationIDsJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMProactiveHarvestingNotificationStack *)self notificationIDs];
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

- (BMProactiveHarvestingNotificationStack)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v133[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"uniqueID"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v16 = *MEMORY[0x1E4F502C8];
        uint64_t v132 = *MEMORY[0x1E4F28568];
        id v17 = v5;
        int v18 = self;
        id v19 = [NSString alloc];
        uint64_t v83 = objc_opt_class();
        uint64_t v20 = v19;
        self = v18;
        id v5 = v17;
        v8 = (void *)[v20 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v83, @"uniqueID"];
        v133[0] = v8;
        uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v133 forKeys:&v132 count:1];
        id v21 = (id)[v15 initWithDomain:v16 code:2 userInfo:v7];
        v22 = 0;
        v23 = 0;
        *a4 = v21;
        goto LABEL_100;
      }
      v22 = 0;
      v23 = 0;
      goto LABEL_101;
    }
    id v105 = v6;
  }
  else
  {
    id v105 = 0;
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:@"absoluteTimestamp"];
  v103 = v7;
  v104 = v6;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (objc_class *)MEMORY[0x1E4F1C9C8];
      id v10 = v7;
      id v11 = [v9 alloc];
      [v10 doubleValue];
      double v13 = v12;

      id v14 = (id)[v11 initWithTimeIntervalSinceReferenceDate:v13];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v24 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        v8 = [v24 dateFromString:v7];

        goto LABEL_16;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v67 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v68 = *MEMORY[0x1E4F502C8];
          uint64_t v130 = *MEMORY[0x1E4F28568];
          id v25 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
          id v131 = v25;
          id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v131 forKeys:&v130 count:1];
          id v69 = (id)[v67 initWithDomain:v68 code:2 userInfo:v28];
          v8 = 0;
          v23 = 0;
          *a4 = v69;
          v22 = v105;
          goto LABEL_98;
        }
        v8 = 0;
        v23 = 0;
        v22 = v105;
        goto LABEL_100;
      }
      id v14 = v7;
    }
    v8 = v14;
  }
  else
  {
    v8 = 0;
  }
LABEL_16:
  id v25 = [v5 objectForKeyedSubscript:@"notificationIDs"];
  uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  int v27 = [v25 isEqual:v26];

  v102 = v8;
  if (v27)
  {

    id v25 = 0;
  }
  else if (v25)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v23 = 0;
        v22 = v105;
        goto LABEL_99;
      }
      id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v57 = *MEMORY[0x1E4F502C8];
      uint64_t v128 = *MEMORY[0x1E4F28568];
      id v28 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"notificationIDs"];
      v129 = v28;
      id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v129 forKeys:&v128 count:1];
      id v58 = (id)[v56 initWithDomain:v57 code:2 userInfo:v36];
      v23 = 0;
      *a4 = v58;
LABEL_56:
      v22 = v105;
      goto LABEL_97;
    }
  }
  id v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v25, "count"));
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v25 = v25;
  uint64_t v29 = [v25 countByEnumeratingWithState:&v107 objects:v127 count:16];
  if (!v29) {
    goto LABEL_29;
  }
  uint64_t v30 = v29;
  uint64_t v31 = *(void *)v108;
  id v101 = v5;
  while (2)
  {
    uint64_t v32 = self;
    for (uint64_t i = 0; i != v30; ++i)
    {
      if (*(void *)v108 != v31) {
        objc_enumerationMutation(v25);
      }
      uint64_t v34 = *(void *)(*((void *)&v107 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (a4)
        {
          id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v48 = *MEMORY[0x1E4F502C8];
          uint64_t v125 = *MEMORY[0x1E4F28568];
          v35 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"notificationIDs"];
          v126 = v35;
          uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v126 forKeys:&v125 count:1];
          v50 = v47;
          uint64_t v51 = v48;
LABEL_52:
          v55 = (void *)v49;
          self = v32;
          v22 = v105;
          v23 = 0;
          *a4 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v51, 2);
          id v36 = v25;
          id v5 = v101;
          v8 = v102;
          goto LABEL_95;
        }
        goto LABEL_53;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v53 = *MEMORY[0x1E4F502C8];
          uint64_t v123 = *MEMORY[0x1E4F28568];
          uint64_t v54 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"notificationIDs"];
          uint64_t v124 = v54;
          uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v124 forKeys:&v123 count:1];
          v50 = v52;
          uint64_t v51 = v53;
          v35 = (void *)v54;
          goto LABEL_52;
        }
LABEL_53:
        v23 = 0;
        id v36 = v25;
        self = v32;
        id v5 = v101;
        goto LABEL_56;
      }
      [v28 addObject:v34];
    }
    uint64_t v30 = [v25 countByEnumeratingWithState:&v107 objects:v127 count:16];
    self = v32;
    id v5 = v101;
    if (v30) {
      continue;
    }
    break;
  }
LABEL_29:

  v35 = [v5 objectForKeyedSubscript:@"appBundleID"];
  if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v36 = v35;
      goto LABEL_32;
    }
    if (a4)
    {
      id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v60 = *MEMORY[0x1E4F502C8];
      uint64_t v121 = *MEMORY[0x1E4F28568];
      v61 = v35;
      id v62 = [NSString alloc];
      uint64_t v84 = objc_opt_class();
      v63 = v62;
      v35 = v61;
      v55 = (void *)[v63 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v84, @"appBundleID"];
      v122 = v55;
      v100 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v122 forKeys:&v121 count:1];
      id v64 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v60, 2);
      v23 = 0;
      id v36 = 0;
      *a4 = v64;
      v22 = v105;
      v8 = v102;

      goto LABEL_95;
    }
    id v36 = 0;
    v23 = 0;
    v22 = v105;
  }
  else
  {
    id v36 = 0;
LABEL_32:
    uint64_t v37 = [v5 objectForKeyedSubscript:@"threadID"];
    v95 = v35;
    v99 = (void *)v37;
    if (v37 && (int64_t v38 = (void *)v37, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v89 = v36;
        id v96 = v38;
        goto LABEL_35;
      }
      v23 = (BMProactiveHarvestingNotificationStack *)a4;
      if (a4)
      {
        id v97 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v65 = *MEMORY[0x1E4F502C8];
        uint64_t v119 = *MEMORY[0x1E4F28568];
        id v98 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"threadID"];
        id v120 = v98;
        v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v120 forKeys:&v119 count:1];
        id v66 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v65, 2);
        v23 = 0;
        v55 = 0;
        v22 = v105;
        *a4 = v66;
        goto LABEL_93;
      }
      v55 = 0;
      v22 = v105;
    }
    else
    {
      id v89 = v36;
      id v96 = 0;
LABEL_35:
      uint64_t v39 = [v5 objectForKeyedSubscript:@"stackState"];
      v92 = (void *)v39;
      if (v39 && (uint64_t v40 = (void *)v39, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v98 = v40;
          goto LABEL_38;
        }
        if (a4)
        {
          id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v71 = *MEMORY[0x1E4F502C8];
          uint64_t v117 = *MEMORY[0x1E4F28568];
          id v93 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"stackState"];
          id v118 = v93;
          uint64_t v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
          uint64_t v73 = v71;
          v35 = v95;
          v88 = (void *)v72;
          v23 = 0;
          id v98 = 0;
          *a4 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v73, 2);
          v22 = v105;
          v55 = v96;
          id v36 = v89;
          goto LABEL_92;
        }
        id v98 = 0;
        v23 = 0;
        v22 = v105;
        v55 = v96;
        id v36 = v89;
      }
      else
      {
        id v98 = 0;
LABEL_38:
        uint64_t v41 = [v5 objectForKeyedSubscript:@"sectionID"];
        id v36 = v89;
        v88 = (void *)v41;
        if (v41 && (v42 = (void *)v41, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v93 = v42;
            goto LABEL_41;
          }
          if (a4)
          {
            id v94 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v74 = *MEMORY[0x1E4F502C8];
            uint64_t v115 = *MEMORY[0x1E4F28568];
            id v90 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"sectionID"];
            id v116 = v90;
            v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v116 forKeys:&v115 count:1];
            uint64_t v76 = v74;
            v35 = v95;
            id v77 = (id)[v94 initWithDomain:v76 code:2 userInfo:v75];
            v23 = 0;
            id v93 = 0;
            *a4 = v77;
            v22 = v105;
            goto LABEL_90;
          }
          id v93 = 0;
          v23 = 0;
          v22 = v105;
        }
        else
        {
          id v93 = 0;
LABEL_41:
          uint64_t v43 = [v5 objectForKeyedSubscript:@"contentProtection"];
          v87 = (void *)v43;
          if (v43 && (int v44 = (void *)v43, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v90 = v44;
              goto LABEL_44;
            }
            if (a4)
            {
              id v91 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v78 = *MEMORY[0x1E4F502C8];
              uint64_t v113 = *MEMORY[0x1E4F28568];
              id v46 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contentProtection"];
              id v114 = v46;
              v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
              id v79 = (id)[v91 initWithDomain:v78 code:2 userInfo:v45];
              v23 = 0;
              id v90 = 0;
              *a4 = v79;
              v22 = v105;
              goto LABEL_88;
            }
            id v90 = 0;
            v23 = 0;
            v22 = v105;
          }
          else
          {
            id v90 = 0;
LABEL_44:
            v45 = [v5 objectForKeyedSubscript:@"personaId"];
            if (!v45 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v46 = 0;
              v22 = v105;
              goto LABEL_47;
            }
            objc_opt_class();
            v22 = v105;
            if (objc_opt_isKindOfClass())
            {
              id v46 = v45;
LABEL_47:
              self = [(BMProactiveHarvestingNotificationStack *)self initWithUniqueID:v22 absoluteTimestamp:v8 notificationIDs:v28 appBundleID:v89 threadID:v96 stackState:v98 sectionID:v93 contentProtection:v90 personaId:v46];
              v23 = self;
            }
            else
            {
              if (a4)
              {
                id v86 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v85 = *MEMORY[0x1E4F502C8];
                uint64_t v111 = *MEMORY[0x1E4F28568];
                v80 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"personaId"];
                v112 = v80;
                v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
                *a4 = (id)[v86 initWithDomain:v85 code:2 userInfo:v81];
              }
              id v46 = 0;
              v23 = 0;
            }
LABEL_88:

            v35 = v95;
          }
          v75 = v87;
LABEL_90:
        }
        v55 = v96;
LABEL_92:
      }
LABEL_93:
    }
LABEL_95:
  }
LABEL_97:

LABEL_98:
  uint64_t v7 = v103;
  uint64_t v6 = v104;
LABEL_99:

LABEL_100:
LABEL_101:

  return v23;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMProactiveHarvestingNotificationStack *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uniqueID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_notificationIDs;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_appBundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_threadID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasStackState) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_hasSectionID) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_contentProtection) {
    PBDataWriterWriteStringField();
  }
  if (self->_personaId) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)BMProactiveHarvestingNotificationStack;
  id v5 = [(BMEventBase *)&v48 init];
  if (!v5) {
    goto LABEL_61;
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
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 40;
          goto LABEL_46;
        case 2u:
          v5->_hasRaw_absoluteTimestamp = 1;
          uint64_t v23 = *v7;
          unint64_t v24 = *(void *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)&v4[*v8])
          {
            double v25 = *(double *)(*(void *)&v4[*v10] + v24);
            *(void *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v9] = 1;
            double v25 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v25;
          continue;
        case 3u:
          uint64_t v26 = PBReaderReadString();
          if (!v26) {
            goto LABEL_63;
          }
          int v27 = (void *)v26;
          [v6 addObject:v26];

          continue;
        case 4u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 56;
          goto LABEL_46;
        case 5u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 64;
          goto LABEL_46;
        case 6u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          v5->_hasStackState = 1;
          while (2)
          {
            uint64_t v31 = *v7;
            uint64_t v32 = *(void *)&v4[v31];
            unint64_t v33 = v32 + 1;
            if (v32 == -1 || v33 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)&v4[*v10] + v32);
              *(void *)&v4[v31] = v33;
              uint64_t v30 = (objc_class *)(((unint64_t)(v34 & 0x7F) << v28) | (unint64_t)v30);
              if (v34 < 0)
              {
                v28 += 7;
                BOOL v18 = v29++ >= 9;
                if (v18)
                {
                  uint64_t v30 = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v30 = 0;
          }
LABEL_50:
          uint64_t v42 = 72;
          goto LABEL_55;
        case 7u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v30 = 0;
          v5->_hasSectionID = 1;
          break;
        case 8u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 88;
          goto LABEL_46;
        case 9u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 96;
LABEL_46:
          uint64_t v41 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_63:

          goto LABEL_60;
      }
      while (1)
      {
        uint64_t v37 = *v7;
        uint64_t v38 = *(void *)&v4[v37];
        unint64_t v39 = v38 + 1;
        if (v38 == -1 || v39 > *(void *)&v4[*v8]) {
          break;
        }
        char v40 = *(unsigned char *)(*(void *)&v4[*v10] + v38);
        *(void *)&v4[v37] = v39;
        uint64_t v30 = (objc_class *)(((unint64_t)(v40 & 0x7F) << v35) | (unint64_t)v30);
        if ((v40 & 0x80) == 0) {
          goto LABEL_52;
        }
        v35 += 7;
        BOOL v18 = v36++ >= 9;
        if (v18)
        {
          uint64_t v30 = 0;
          goto LABEL_54;
        }
      }
      v4[*v9] = 1;
LABEL_52:
      if (v4[*v9]) {
        uint64_t v30 = 0;
      }
LABEL_54:
      uint64_t v42 = 80;
LABEL_55:
      *(Class *)((char *)&v5->super.super.isa + v42) = v30;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v43 = [v6 copy];
  notificationIDs = v5->_notificationIDs;
  v5->_notificationIDs = (NSArray *)v43;

  int v45 = v4[*v9];
  if (v45) {
LABEL_60:
  }
    id v46 = 0;
  else {
LABEL_61:
  }
    id v46 = v5;

  return v46;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMProactiveHarvestingNotificationStack *)self uniqueID];
  id v5 = [(BMProactiveHarvestingNotificationStack *)self absoluteTimestamp];
  uint64_t v6 = [(BMProactiveHarvestingNotificationStack *)self notificationIDs];
  uint64_t v7 = [(BMProactiveHarvestingNotificationStack *)self appBundleID];
  uint64_t v8 = [(BMProactiveHarvestingNotificationStack *)self threadID];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMProactiveHarvestingNotificationStack stackState](self, "stackState"));
  long long v10 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMProactiveHarvestingNotificationStack sectionID](self, "sectionID"));
  char v11 = [(BMProactiveHarvestingNotificationStack *)self contentProtection];
  unsigned int v12 = [(BMProactiveHarvestingNotificationStack *)self personaId];
  unint64_t v13 = (void *)[v3 initWithFormat:@"BMProactiveHarvestingNotificationStack with uniqueID: %@, absoluteTimestamp: %@, notificationIDs: %@, appBundleID: %@, threadID: %@, stackState: %@, sectionID: %@, contentProtection: %@, personaId: %@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (BMProactiveHarvestingNotificationStack)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 notificationIDs:(id)a5 appBundleID:(id)a6 threadID:(id)a7 stackState:(id)a8 sectionID:(id)a9 contentProtection:(id)a10 personaId:(id)a11
{
  id v31 = a3;
  id v18 = a4;
  id v30 = a5;
  id v29 = a6;
  id v28 = a7;
  id v19 = a8;
  id v20 = a9;
  id v27 = a10;
  id v26 = a11;
  v32.receiver = self;
  v32.super_class = (Class)BMProactiveHarvestingNotificationStack;
  uint64_t v21 = [(BMEventBase *)&v32 init];
  if (v21)
  {
    v21->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v21->_uniqueID, a3);
    if (v18)
    {
      v21->_hasRaw_absoluteTimestamp = 1;
      [v18 timeIntervalSinceReferenceDate];
    }
    else
    {
      v21->_hasRaw_absoluteTimestamp = 0;
      double v22 = -1.0;
    }
    v21->_raw_absoluteTimestamp = v22;
    objc_storeStrong((id *)&v21->_notificationIDs, a5);
    objc_storeStrong((id *)&v21->_appBundleID, a6);
    objc_storeStrong((id *)&v21->_threadID, a7);
    if (v19)
    {
      v21->_hasStackState = 1;
      uint64_t v23 = [v19 longLongValue];
    }
    else
    {
      v21->_hasStackState = 0;
      uint64_t v23 = -1;
    }
    v21->_stackState = v23;
    if (v20)
    {
      v21->_hasSectionID = 1;
      uint64_t v24 = [v20 longLongValue];
    }
    else
    {
      v21->_hasSectionID = 0;
      uint64_t v24 = -1;
    }
    v21->_sectionID = v24;
    objc_storeStrong((id *)&v21->_contentProtection, a10);
    objc_storeStrong((id *)&v21->_personaId, a11);
  }

  return v21;
}

+ (id)protoFields
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uniqueID" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"absoluteTimestamp", 2, 0, 0, v2);
  v13[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"notificationIDs" number:3 type:13 subMessageClass:0];
  v13[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appBundleID" number:4 type:13 subMessageClass:0];
  v13[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"threadID" number:5 type:13 subMessageClass:0];
  v13[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stackState" number:6 type:3 subMessageClass:0];
  v13[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sectionID" number:7 type:3 subMessageClass:0];
  v13[6] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentProtection" number:8 type:13 subMessageClass:0];
  v13[7] = v9;
  long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"personaId" number:9 type:13 subMessageClass:0];
  v13[8] = v10;
  char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4800;
}

id __49__BMProactiveHarvestingNotificationStack_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _notificationIDsJSONArray];
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
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMProactiveHarvestingNotificationStack alloc] initByReadFrom:v7];
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

@end