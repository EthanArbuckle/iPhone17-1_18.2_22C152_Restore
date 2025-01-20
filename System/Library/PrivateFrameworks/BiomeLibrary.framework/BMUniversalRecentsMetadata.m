@interface BMUniversalRecentsMetadata
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMUniversalRecentsMetadata)initWithAbsoluteTimestamp:(id)a3 userActivityData:(id)a4 title:(id)a5 activityType:(id)a6 associatedBundleID:(id)a7 associatedURLString:(id)a8 modeIdentifier:(id)a9 topics:(id)a10 hasAssociatedImageRepresentation:(id)a11 uuid:(id)a12;
- (BMUniversalRecentsMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasAssociatedImageRepresentation;
- (BOOL)hasHasAssociatedImageRepresentation;
- (BOOL)isEqual:(id)a3;
- (NSArray)topics;
- (NSData)userActivityData;
- (NSDate)absoluteTimestamp;
- (NSString)activityType;
- (NSString)associatedBundleID;
- (NSString)associatedURLString;
- (NSString)description;
- (NSString)modeIdentifier;
- (NSString)title;
- (NSString)uuid;
- (id)_topicsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasHasAssociatedImageRepresentation:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMUniversalRecentsMetadata

+ (id)columns
{
  v14[10] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:2];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userActivityData" dataType:4 requestOnly:0 fieldNumber:2 protoDataType:14 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"title" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"activityType" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"associatedBundleID" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"associatedURLString" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"modeIdentifier" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"topics_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_36492];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hasAssociatedImageRepresentation" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:12 convertedType:0];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uuid" dataType:2 requestOnly:0 fieldNumber:10 protoDataType:13 convertedType:0];
  v14[0] = v2;
  v14[1] = v3;
  v14[2] = v4;
  v14[3] = v5;
  v14[4] = v6;
  v14[5] = v7;
  v14[6] = v8;
  v14[7] = v9;
  v14[8] = v10;
  v14[9] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedURLString, 0);
  objc_storeStrong((id *)&self->_associatedBundleID, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_userActivityData, 0);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setHasHasAssociatedImageRepresentation:(BOOL)a3
{
  self->_hasHasAssociatedImageRepresentation = a3;
}

- (BOOL)hasHasAssociatedImageRepresentation
{
  return self->_hasHasAssociatedImageRepresentation;
}

- (BOOL)hasAssociatedImageRepresentation
{
  return self->_hasAssociatedImageRepresentation;
}

- (NSArray)topics
{
  return self->_topics;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (NSString)associatedURLString
{
  return self->_associatedURLString;
}

- (NSString)associatedBundleID
{
  return self->_associatedBundleID;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (NSString)title
{
  return self->_title;
}

- (NSData)userActivityData
{
  return self->_userActivityData;
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
    v6 = [(BMUniversalRecentsMetadata *)self absoluteTimestamp];
    uint64_t v7 = [v5 absoluteTimestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMUniversalRecentsMetadata *)self absoluteTimestamp];
      v10 = [v5 absoluteTimestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_40;
      }
    }
    id v13 = [(BMUniversalRecentsMetadata *)self userActivityData];
    uint64_t v14 = [v5 userActivityData];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMUniversalRecentsMetadata *)self userActivityData];
      v17 = [v5 userActivityData];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_40;
      }
    }
    v19 = [(BMUniversalRecentsMetadata *)self title];
    uint64_t v20 = [v5 title];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMUniversalRecentsMetadata *)self title];
      v23 = [v5 title];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_40;
      }
    }
    v25 = [(BMUniversalRecentsMetadata *)self activityType];
    uint64_t v26 = [v5 activityType];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMUniversalRecentsMetadata *)self activityType];
      v29 = [v5 activityType];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_40;
      }
    }
    v31 = [(BMUniversalRecentsMetadata *)self associatedBundleID];
    uint64_t v32 = [v5 associatedBundleID];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMUniversalRecentsMetadata *)self associatedBundleID];
      v35 = [v5 associatedBundleID];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_40;
      }
    }
    v37 = [(BMUniversalRecentsMetadata *)self associatedURLString];
    uint64_t v38 = [v5 associatedURLString];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMUniversalRecentsMetadata *)self associatedURLString];
      v41 = [v5 associatedURLString];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_40;
      }
    }
    v43 = [(BMUniversalRecentsMetadata *)self modeIdentifier];
    uint64_t v44 = [v5 modeIdentifier];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(BMUniversalRecentsMetadata *)self modeIdentifier];
      v47 = [v5 modeIdentifier];
      int v48 = [v46 isEqual:v47];

      if (!v48) {
        goto LABEL_40;
      }
    }
    v49 = [(BMUniversalRecentsMetadata *)self topics];
    uint64_t v50 = [v5 topics];
    if (v49 == (void *)v50)
    {
    }
    else
    {
      v51 = (void *)v50;
      v52 = [(BMUniversalRecentsMetadata *)self topics];
      v53 = [v5 topics];
      int v54 = [v52 isEqual:v53];

      if (!v54) {
        goto LABEL_40;
      }
    }
    if (![(BMUniversalRecentsMetadata *)self hasHasAssociatedImageRepresentation]
      && ![v5 hasHasAssociatedImageRepresentation]
      || [(BMUniversalRecentsMetadata *)self hasHasAssociatedImageRepresentation]
      && [v5 hasHasAssociatedImageRepresentation]
      && (int v55 = [(BMUniversalRecentsMetadata *)self hasAssociatedImageRepresentation],
          v55 == [v5 hasAssociatedImageRepresentation]))
    {
      v57 = [(BMUniversalRecentsMetadata *)self uuid];
      v58 = [v5 uuid];
      if (v57 == v58)
      {
        char v12 = 1;
      }
      else
      {
        v59 = [(BMUniversalRecentsMetadata *)self uuid];
        v60 = [v5 uuid];
        char v12 = [v59 isEqual:v60];
      }
      goto LABEL_41;
    }
LABEL_40:
    char v12 = 0;
LABEL_41:

    goto LABEL_42;
  }
  char v12 = 0;
LABEL_42:

  return v12;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
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
  v41[10] = *MEMORY[0x1E4F143B8];
  v3 = [(BMUniversalRecentsMetadata *)self absoluteTimestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMUniversalRecentsMetadata *)self absoluteTimestamp];
    [v5 timeIntervalSince1970];
    uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    uint64_t v6 = 0;
  }

  uint64_t v7 = [(BMUniversalRecentsMetadata *)self userActivityData];
  uint64_t v8 = [v7 base64EncodedStringWithOptions:0];

  uint64_t v9 = [(BMUniversalRecentsMetadata *)self title];
  uint64_t v10 = [(BMUniversalRecentsMetadata *)self activityType];
  uint64_t v11 = [(BMUniversalRecentsMetadata *)self associatedBundleID];
  uint64_t v12 = [(BMUniversalRecentsMetadata *)self associatedURLString];
  v39 = [(BMUniversalRecentsMetadata *)self modeIdentifier];
  uint64_t v38 = [(BMUniversalRecentsMetadata *)self _topicsJSONArray];
  id v13 = 0;
  if ([(BMUniversalRecentsMetadata *)self hasHasAssociatedImageRepresentation])
  {
    id v13 = objc_msgSend(NSNumber, "numberWithBool:", -[BMUniversalRecentsMetadata hasAssociatedImageRepresentation](self, "hasAssociatedImageRepresentation"));
  }
  uint64_t v14 = [(BMUniversalRecentsMetadata *)self uuid];
  v40[0] = @"absoluteTimestamp";
  uint64_t v15 = v6;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)v15;
  v41[0] = v15;
  v40[1] = @"userActivityData";
  uint64_t v16 = v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v32 = (void *)v16;
  v41[1] = v16;
  v40[2] = @"title";
  uint64_t v17 = v9;
  if (!v9)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v17;
  v41[2] = v17;
  v40[3] = @"activityType";
  uint64_t v18 = v10;
  if (!v10)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)v6;
  int v30 = (void *)v18;
  v41[3] = v18;
  v40[4] = @"associatedBundleID";
  uint64_t v19 = v11;
  if (!v11)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  int v36 = (void *)v8;
  v29 = (void *)v19;
  v41[4] = v19;
  v40[5] = @"associatedURLString";
  uint64_t v20 = (void *)v12;
  if (!v12)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)v9;
  v41[5] = v20;
  v40[6] = @"modeIdentifier";
  v21 = v39;
  if (!v39)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v12;
  v23 = (void *)v10;
  v41[6] = v21;
  v40[7] = @"topics";
  int v24 = v38;
  if (!v38)
  {
    int v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v11;
  v41[7] = v24;
  v40[8] = @"hasAssociatedImageRepresentation";
  uint64_t v26 = v13;
  if (!v13)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v41[8] = v26;
  v40[9] = @"uuid";
  v27 = v14;
  if (!v14)
  {
    v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v41[9] = v27;
  id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:10];
  if (v14)
  {
    if (v13) {
      goto LABEL_28;
    }
  }
  else
  {

    if (v13) {
      goto LABEL_28;
    }
  }

LABEL_28:
  if (!v38) {

  }
  if (!v39) {
  if (!v22)
  }

  if (!v25) {
  if (v23)
  }
  {
    if (v35) {
      goto LABEL_38;
    }
  }
  else
  {

    if (v35)
    {
LABEL_38:
      if (v36) {
        goto LABEL_39;
      }
LABEL_47:

      if (v37) {
        goto LABEL_40;
      }
      goto LABEL_48;
    }
  }

  if (!v36) {
    goto LABEL_47;
  }
LABEL_39:
  if (v37) {
    goto LABEL_40;
  }
LABEL_48:

LABEL_40:

  return v34;
}

- (id)_topicsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMUniversalRecentsMetadata *)self topics];
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

- (BMUniversalRecentsMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v176[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"absoluteTimestamp"];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = (objc_class *)MEMORY[0x1E4F1C9C8];
      id v8 = v5;
      id v9 = [v7 alloc];
      [v8 doubleValue];
      double v11 = v10;

      id v12 = (id)[v9 initWithTimeIntervalSince1970:v11];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        uint64_t v6 = [v13 dateFromString:v5];

        goto LABEL_9;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v104 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v105 = *MEMORY[0x1E4F502C8];
          uint64_t v175 = *MEMORY[0x1E4F28568];
          id v106 = v4;
          id v107 = [NSString alloc];
          uint64_t v123 = objc_opt_class();
          v108 = v107;
          id v4 = v106;
          uint64_t v109 = [v108 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", v123, @"absoluteTimestamp"];
          v176[0] = v109;
          uint64_t v110 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v176 forKeys:&v175 count:1];
          v111 = v104;
          id v15 = (id)v109;
          uint64_t v112 = v105;
          long long v14 = (void *)v110;
          uint64_t v6 = 0;
          v46 = 0;
          *a4 = (id)[v111 initWithDomain:v112 code:2 userInfo:v110];
          goto LABEL_121;
        }
        uint64_t v6 = 0;
        v46 = 0;
        goto LABEL_122;
      }
      id v12 = v5;
    }
    uint64_t v6 = v12;
  }
  else
  {
    uint64_t v6 = 0;
  }
LABEL_9:
  long long v14 = [v4 objectForKeyedSubscript:@"userActivityData"];
  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
        v40 = v14;
        uint64_t v41 = *MEMORY[0x1E4F502C8];
        uint64_t v173 = *MEMORY[0x1E4F28568];
        uint64_t v42 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", objc_opt_class(), @"userActivityData"];
        uint64_t v174 = v42;
        uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v174 forKeys:&v173 count:1];
        uint64_t v43 = v41;
        long long v14 = v40;
        uint64_t v44 = (id *)v42;
        id v45 = (id)[v39 initWithDomain:v43 code:2 userInfo:v16];
        v46 = 0;
        id v15 = 0;
        *a4 = v45;
        goto LABEL_120;
      }
      id v15 = 0;
      v46 = 0;
      goto LABEL_121;
    }
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }
  uint64_t v16 = [v4 objectForKeyedSubscript:@"title"];
  v141 = v16;
  if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v44 = a4;
      if (a4)
      {
        id v132 = v15;
        id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
        int v48 = v14;
        uint64_t v49 = *MEMORY[0x1E4F502C8];
        uint64_t v171 = *MEMORY[0x1E4F28568];
        uint64_t v50 = v6;
        id v51 = [NSString alloc];
        uint64_t v118 = objc_opt_class();
        v52 = v51;
        uint64_t v6 = v50;
        id v140 = (id)[v52 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v118, @"title"];
        id v172 = v140;
        uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v172 forKeys:&v171 count:1];
        v53 = v47;
        id v15 = v132;
        uint64_t v54 = v49;
        long long v14 = v48;
        v46 = 0;
        uint64_t v44 = 0;
        *a4 = (id)[v53 initWithDomain:v54 code:2 userInfo:v17];
        goto LABEL_119;
      }
      v46 = 0;
      goto LABEL_120;
    }
    v138 = v16;
  }
  else
  {
    v138 = 0;
  }
  uint64_t v17 = [v4 objectForKeyedSubscript:@"activityType"];
  v146 = v17;
  if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        id v140 = 0;
        v46 = 0;
        uint64_t v44 = v138;
        goto LABEL_119;
      }
      id v55 = v15;
      id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
      v57 = v14;
      uint64_t v58 = *MEMORY[0x1E4F502C8];
      uint64_t v169 = *MEMORY[0x1E4F28568];
      v59 = v6;
      id v60 = [NSString alloc];
      uint64_t v119 = objc_opt_class();
      v61 = v60;
      uint64_t v6 = v59;
      v62 = (void *)[v61 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v119, @"activityType"];
      v170 = v62;
      uint64_t v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v170 forKeys:&v169 count:1];
      v64 = v56;
      id v15 = v55;
      uint64_t v17 = v146;
      uint64_t v65 = v58;
      long long v14 = v57;
      v137 = (void *)v63;
      v46 = 0;
      id v140 = 0;
      *a4 = (id)objc_msgSend(v64, "initWithDomain:code:userInfo:", v65, 2);
LABEL_95:
      uint64_t v16 = v141;
      uint64_t v44 = v138;
      goto LABEL_118;
    }
    id v140 = v17;
  }
  else
  {
    id v140 = 0;
  }
  uint64_t v18 = [v4 objectForKeyedSubscript:@"associatedBundleID"];
  v137 = (void *)v18;
  if (!v18 || (uint64_t v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v139 = 0;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      id v66 = v15;
      id v67 = objc_alloc(MEMORY[0x1E4F28C58]);
      v68 = v14;
      uint64_t v69 = *MEMORY[0x1E4F502C8];
      uint64_t v167 = *MEMORY[0x1E4F28568];
      v70 = v6;
      id v71 = [NSString alloc];
      uint64_t v120 = objc_opt_class();
      v72 = v71;
      uint64_t v6 = v70;
      id v136 = (id)[v72 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v120, @"associatedBundleID"];
      id v168 = v136;
      uint64_t v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v168 forKeys:&v167 count:1];
      v74 = v67;
      id v15 = v66;
      uint64_t v17 = v146;
      uint64_t v75 = v69;
      long long v14 = v68;
      v135 = (void *)v73;
      v46 = 0;
      v62 = 0;
      *a4 = (id)objc_msgSend(v74, "initWithDomain:code:userInfo:", v75, 2);
      uint64_t v16 = v141;
      uint64_t v44 = v138;
      goto LABEL_117;
    }
    v62 = 0;
    v46 = 0;
    goto LABEL_95;
  }
  id v139 = v19;
LABEL_21:
  uint64_t v20 = [v4 objectForKeyedSubscript:@"associatedURLString"];
  v135 = (void *)v20;
  if (v20 && (v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v76 = v15;
        id v77 = objc_alloc(MEMORY[0x1E4F28C58]);
        v78 = v14;
        uint64_t v79 = *MEMORY[0x1E4F502C8];
        uint64_t v165 = *MEMORY[0x1E4F28568];
        v80 = v6;
        id v81 = [NSString alloc];
        uint64_t v121 = objc_opt_class();
        v82 = v81;
        uint64_t v6 = v80;
        id v24 = (id)[v82 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v121, @"associatedURLString"];
        id v166 = v24;
        uint64_t v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v166 forKeys:&v165 count:1];
        v84 = v77;
        id v15 = v76;
        uint64_t v17 = v146;
        uint64_t v85 = v79;
        long long v14 = v78;
        v130 = (void *)v83;
        v46 = 0;
        id v136 = 0;
        *a4 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v85, 2);
        uint64_t v16 = v141;
        uint64_t v44 = v138;
        goto LABEL_115;
      }
      id v136 = 0;
      v46 = 0;
      uint64_t v44 = v138;
      goto LABEL_116;
    }
    v133 = v6;
    id v136 = v21;
  }
  else
  {
    v133 = v6;
    id v136 = 0;
  }
  uint64_t v22 = [v4 objectForKeyedSubscript:@"modeIdentifier"];
  v129 = v5;
  v130 = (void *)v22;
  id v131 = v15;
  if (v22 && (v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v86 = objc_alloc(MEMORY[0x1E4F28C58]);
        v87 = v14;
        uint64_t v88 = *MEMORY[0x1E4F502C8];
        uint64_t v163 = *MEMORY[0x1E4F28568];
        id v89 = [NSString alloc];
        uint64_t v122 = objc_opt_class();
        v90 = v89;
        uint64_t v6 = v133;
        id v25 = (id)[v90 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v122, @"modeIdentifier"];
        id v164 = v25;
        uint64_t v91 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v164 forKeys:&v163 count:1];
        uint64_t v92 = v88;
        long long v14 = v87;
        v145 = (void *)v91;
        v46 = 0;
        id v24 = 0;
        *a4 = (id)objc_msgSend(v86, "initWithDomain:code:userInfo:", v92, 2);
        uint64_t v44 = v138;
        goto LABEL_113;
      }
      id v24 = 0;
      v46 = 0;
      uint64_t v44 = v138;
      uint64_t v6 = v133;
      goto LABEL_115;
    }
    id v24 = v23;
  }
  else
  {
    id v24 = 0;
  }
  id v25 = [v4 objectForKeyedSubscript:@"topics"];
  uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  int v27 = [v25 isEqual:v26];

  uint64_t v6 = v133;
  v128 = v14;
  if (v27)
  {
    v126 = v4;
    id v127 = v24;

    id v25 = 0;
  }
  else
  {
    if (v25)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v101 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v102 = *MEMORY[0x1E4F502C8];
          uint64_t v161 = *MEMORY[0x1E4F28568];
          v145 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"topics"];
          v162 = v145;
          id v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v162 forKeys:&v161 count:1];
          id v103 = (id)[v101 initWithDomain:v102 code:2 userInfo:v38];
          v46 = 0;
          *a4 = v103;
          uint64_t v44 = v138;
          goto LABEL_112;
        }
        v46 = 0;
        id v15 = v131;
        uint64_t v44 = v138;
        goto LABEL_114;
      }
    }
    v126 = v4;
    id v127 = v24;
  }
  v145 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v25, "count"));
  long long v148 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  id v25 = v25;
  uint64_t v28 = [v25 countByEnumeratingWithState:&v148 objects:v160 count:16];
  if (!v28) {
    goto LABEL_50;
  }
  uint64_t v29 = v28;
  uint64_t v30 = *(void *)v149;
  while (2)
  {
    for (uint64_t i = 0; i != v29; ++i)
    {
      if (*(void *)v149 != v30) {
        objc_enumerationMutation(v25);
      }
      uint64_t v32 = *(void **)(*((void *)&v148 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v93 = a4;
        if (a4)
        {
          id v94 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v95 = *MEMORY[0x1E4F502C8];
          uint64_t v158 = *MEMORY[0x1E4F28568];
          id v33 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"topics"];
          id v159 = v33;
          v96 = (void *)MEMORY[0x1E4F1C9E8];
          v97 = &v159;
          v98 = &v158;
LABEL_75:
          id v99 = [v96 dictionaryWithObjects:v97 forKeys:v98 count:1];
          id v100 = (id)[v94 initWithDomain:v95 code:2 userInfo:v99];
          v46 = 0;
          id *v93 = v100;
LABEL_79:
          id v38 = v25;
          id v4 = v126;
          uint64_t v6 = v133;
          uint64_t v16 = v141;
          uint64_t v44 = v138;
          id v37 = v139;
          goto LABEL_109;
        }
LABEL_84:
        v46 = 0;
        id v38 = v25;
        id v4 = v126;
        uint64_t v6 = v133;
        uint64_t v16 = v141;
        uint64_t v44 = v138;
        goto LABEL_111;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v93 = a4;
        if (a4)
        {
          id v94 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v95 = *MEMORY[0x1E4F502C8];
          uint64_t v156 = *MEMORY[0x1E4F28568];
          id v33 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"topics"];
          id v157 = v33;
          v96 = (void *)MEMORY[0x1E4F1C9E8];
          v97 = &v157;
          v98 = &v156;
          goto LABEL_75;
        }
        goto LABEL_84;
      }
      id v33 = v32;
      id v34 = [BMUniversalRecentsMetadataTopic alloc];
      id v147 = 0;
      v35 = [(BMUniversalRecentsMetadataTopic *)v34 initWithJSONDictionary:v33 error:&v147];
      id v36 = v147;
      if (v36)
      {
        id v99 = v36;
        if (a4) {
          *a4 = v36;
        }

        v46 = 0;
        goto LABEL_79;
      }
      [v145 addObject:v35];

      uint64_t v17 = v146;
    }
    uint64_t v29 = [v25 countByEnumeratingWithState:&v148 objects:v160 count:16];
    uint64_t v16 = v141;
    if (v29) {
      continue;
    }
    break;
  }
LABEL_50:

  id v4 = v126;
  id v33 = [v126 objectForKeyedSubscript:@"hasAssociatedImageRepresentation"];
  if (!v33)
  {
    id v38 = 0;
    uint64_t v6 = v133;
    id v37 = v139;
    goto LABEL_91;
  }
  objc_opt_class();
  uint64_t v6 = v133;
  id v37 = v139;
  if (objc_opt_isKindOfClass())
  {
    id v38 = 0;
    goto LABEL_91;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v38 = v33;
LABEL_91:
    id v99 = [v126 objectForKeyedSubscript:@"uuid"];
    v125 = v99;
    if (v99)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v99 = 0;
        goto LABEL_98;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v99 = v99;
        uint64_t v16 = v141;
        goto LABEL_98;
      }
      if (a4)
      {
        id v134 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v124 = *MEMORY[0x1E4F502C8];
        uint64_t v152 = *MEMORY[0x1E4F28568];
        v115 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"uuid"];
        v153 = v115;
        v116 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v153 forKeys:&v152 count:1];
        *a4 = (id)[v134 initWithDomain:v124 code:2 userInfo:v116];
      }
      id v99 = 0;
      v46 = 0;
      uint64_t v16 = v141;
LABEL_107:
      uint64_t v44 = v138;
    }
    else
    {
LABEL_98:
      uint64_t v44 = v138;
      v46 = [(BMUniversalRecentsMetadata *)self initWithAbsoluteTimestamp:v6 userActivityData:v131 title:v138 activityType:v140 associatedBundleID:v37 associatedURLString:v136 modeIdentifier:v127 topics:v145 hasAssociatedImageRepresentation:v38 uuid:v99];
      self = v46;
    }

LABEL_109:
    uint64_t v17 = v146;
  }
  else
  {
    if (a4)
    {
      id v142 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v113 = *MEMORY[0x1E4F502C8];
      uint64_t v154 = *MEMORY[0x1E4F28568];
      id v99 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"hasAssociatedImageRepresentation"];
      id v155 = v99;
      v125 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v155 forKeys:&v154 count:1];
      id v114 = (id)objc_msgSend(v142, "initWithDomain:code:userInfo:", v113, 2);
      v46 = 0;
      id v38 = 0;
      *a4 = v114;
      goto LABEL_107;
    }
    id v38 = 0;
    v46 = 0;
    uint64_t v44 = v138;
  }
  id v139 = v37;

LABEL_111:
  id v24 = v127;
LABEL_112:

  long long v14 = v128;
LABEL_113:

  id v15 = v131;
LABEL_114:

  uint64_t v5 = v129;
LABEL_115:

LABEL_116:
  v62 = v139;
LABEL_117:

LABEL_118:
LABEL_119:

LABEL_120:
LABEL_121:

LABEL_122:
  return v46;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMUniversalRecentsMetadata *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_userActivityData) {
    PBDataWriterWriteDataField();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_activityType) {
    PBDataWriterWriteStringField();
  }
  if (self->_associatedBundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_associatedURLString) {
    PBDataWriterWriteStringField();
  }
  if (self->_modeIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_topics;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (self->_hasHasAssociatedImageRepresentation) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_uuid) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)BMUniversalRecentsMetadata;
  uint64_t v5 = [(BMEventBase *)&v45 init];
  if (!v5) {
    goto LABEL_53;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  id v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    double v10 = &OBJC_IVAR___BMSiriMusicInferenceTrainingIndependentSignals__foregroundBundleRecencyS;
    long long v11 = &OBJC_IVAR___BMSiriMusicInferenceTrainingIndependentSignals__foregroundBundleRecencyS;
    long long v12 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v9]) {
        break;
      }
      char v13 = 0;
      unsigned int v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        uint64_t v16 = *v7;
        uint64_t v17 = *(void *)&v4[v16];
        unint64_t v18 = v17 + 1;
        if (v17 == -1 || v18 > *(void *)&v4[*v8]) {
          break;
        }
        char v19 = *(unsigned char *)(*(void *)&v4[*v12] + v17);
        *(void *)&v4[v16] = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0) {
          goto LABEL_13;
        }
        v13 += 7;
        BOOL v20 = v14++ >= 9;
        if (v20)
        {
          unint64_t v15 = 0;
          int v21 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v21 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v15 = 0;
      }
LABEL_15:
      if (v21 || (v15 & 7) == 4) {
        break;
      }
      switch((v15 >> 3))
      {
        case 1u:
          *((unsigned char *)&v5->super.super.isa + v10[958]) = 1;
          uint64_t v23 = *v7;
          unint64_t v24 = *(void *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)&v4[*v8])
          {
            id v25 = *(objc_class **)(*(void *)&v4[*v12] + v24);
            *(void *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v9] = 1;
            id v25 = 0;
          }
          *(Class *)((char *)&v5->super.super.isa + v11[959]) = v25;
          continue;
        case 2u:
          uint64_t v26 = PBReaderReadData();
          uint64_t v27 = 40;
          goto LABEL_42;
        case 3u:
          uint64_t v26 = PBReaderReadString();
          uint64_t v27 = 48;
          goto LABEL_42;
        case 4u:
          uint64_t v26 = PBReaderReadString();
          uint64_t v27 = 56;
          goto LABEL_42;
        case 5u:
          uint64_t v26 = PBReaderReadString();
          uint64_t v27 = 64;
          goto LABEL_42;
        case 6u:
          uint64_t v26 = PBReaderReadString();
          uint64_t v27 = 72;
          goto LABEL_42;
        case 7u:
          uint64_t v26 = PBReaderReadString();
          uint64_t v27 = 80;
          goto LABEL_42;
        case 8u:
          uint64_t v46 = 0;
          uint64_t v47 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_55;
          }
          uint64_t v28 = v11;
          uint64_t v29 = v10;
          id v30 = [[BMUniversalRecentsMetadataTopic alloc] initByReadFrom:v4];
          if (!v30) {
            goto LABEL_55;
          }
          v31 = v30;
          [v6 addObject:v30];
          PBReaderRecallMark();

          double v10 = v29;
          long long v11 = v28;
          continue;
        case 9u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          v5->_hasHasAssociatedImageRepresentation = 1;
          break;
        case 0xAu:
          uint64_t v26 = PBReaderReadString();
          uint64_t v27 = 96;
LABEL_42:
          id v39 = *(Class *)((char *)&v5->super.super.isa + v27);
          *(Class *)((char *)&v5->super.super.isa + v27) = (Class)v26;

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_55:

          goto LABEL_52;
      }
      while (1)
      {
        uint64_t v35 = *v7;
        uint64_t v36 = *(void *)&v4[v35];
        unint64_t v37 = v36 + 1;
        if (v36 == -1 || v37 > *(void *)&v4[*v8]) {
          break;
        }
        char v38 = *(unsigned char *)(*(void *)&v4[*v12] + v36);
        *(void *)&v4[v35] = v37;
        v34 |= (unint64_t)(v38 & 0x7F) << v32;
        if ((v38 & 0x80) == 0) {
          goto LABEL_46;
        }
        v32 += 7;
        BOOL v20 = v33++ >= 9;
        if (v20)
        {
          uint64_t v34 = 0;
          goto LABEL_48;
        }
      }
      v4[*v9] = 1;
LABEL_46:
      if (v4[*v9]) {
        uint64_t v34 = 0;
      }
LABEL_48:
      v5->_hasAssociatedImageRepresentation = v34 != 0;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v40 = [v6 copy];
  topics = v5->_topics;
  v5->_topics = (NSArray *)v40;

  int v42 = v4[*v9];
  if (v42) {
LABEL_52:
  }
    uint64_t v43 = 0;
  else {
LABEL_53:
  }
    uint64_t v43 = v5;

  return v43;
}

- (NSString)description
{
  id v15 = [NSString alloc];
  unsigned int v14 = [(BMUniversalRecentsMetadata *)self absoluteTimestamp];
  v3 = [(BMUniversalRecentsMetadata *)self userActivityData];
  id v4 = [(BMUniversalRecentsMetadata *)self title];
  uint64_t v5 = [(BMUniversalRecentsMetadata *)self activityType];
  uint64_t v6 = [(BMUniversalRecentsMetadata *)self associatedBundleID];
  uint64_t v7 = [(BMUniversalRecentsMetadata *)self associatedURLString];
  uint64_t v8 = [(BMUniversalRecentsMetadata *)self modeIdentifier];
  id v9 = [(BMUniversalRecentsMetadata *)self topics];
  double v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMUniversalRecentsMetadata hasAssociatedImageRepresentation](self, "hasAssociatedImageRepresentation"));
  long long v11 = [(BMUniversalRecentsMetadata *)self uuid];
  long long v12 = (void *)[v15 initWithFormat:@"BMUniversalRecentsMetadata with absoluteTimestamp: %@, userActivityData: %@, title: %@, activityType: %@, associatedBundleID: %@, associatedURLString: %@, modeIdentifier: %@, topics: %@, hasAssociatedImageRepresentation: %@, uuid: %@", v14, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMUniversalRecentsMetadata)initWithAbsoluteTimestamp:(id)a3 userActivityData:(id)a4 title:(id)a5 activityType:(id)a6 associatedBundleID:(id)a7 associatedURLString:(id)a8 modeIdentifier:(id)a9 topics:(id)a10 hasAssociatedImageRepresentation:(id)a11 uuid:(id)a12
{
  id v17 = a3;
  id obj = a4;
  id v18 = a4;
  char v19 = v17;
  id v39 = v18;
  id v27 = a5;
  id v38 = a5;
  id v28 = a6;
  id v37 = a6;
  id v29 = a7;
  id v36 = a7;
  id v30 = a8;
  id v35 = a8;
  id v34 = a9;
  id v31 = a10;
  id v20 = a10;
  id v21 = a11;
  id v32 = a12;
  id v22 = a12;
  v40.receiver = self;
  v40.super_class = (Class)BMUniversalRecentsMetadata;
  uint64_t v23 = [(BMEventBase *)&v40 init];
  if (v23)
  {
    v23->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v19)
    {
      v23->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v19, "timeIntervalSince1970", obj, a5, a6, v29, a8, a10, a12);
    }
    else
    {
      char v19 = 0;
      v23->_hasRaw_absoluteTimestamp = 0;
      double v24 = -1.0;
    }
    v23->_raw_absoluteTimestamp = v24;
    objc_storeStrong((id *)&v23->_userActivityData, obj);
    objc_storeStrong((id *)&v23->_title, v27);
    objc_storeStrong((id *)&v23->_activityType, v28);
    objc_storeStrong((id *)&v23->_associatedBundleID, v29);
    objc_storeStrong((id *)&v23->_associatedURLString, v30);
    objc_storeStrong((id *)&v23->_modeIdentifier, a9);
    objc_storeStrong((id *)&v23->_topics, v31);
    if (v21)
    {
      v23->_hasHasAssociatedImageRepresentation = 1;
      v23->_hasAssociatedImageRepresentation = [v21 BOOLValue];
    }
    else
    {
      v23->_hasHasAssociatedImageRepresentation = 0;
      v23->_hasAssociatedImageRepresentation = 0;
    }
    objc_storeStrong((id *)&v23->_uuid, v32);
  }

  return v23;
}

+ (id)protoFields
{
  v14[10] = *MEMORY[0x1E4F143B8];
  char v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:1 type:0 subMessageClass:0];
  v14[0] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userActivityData" number:2 type:14 subMessageClass:0];
  v14[1] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"title" number:3 type:13 subMessageClass:0];
  v14[2] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activityType" number:4 type:13 subMessageClass:0];
  v14[3] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"associatedBundleID" number:5 type:13 subMessageClass:0];
  v14[4] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"associatedURLString" number:6 type:13 subMessageClass:0];
  v14[5] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"modeIdentifier" number:7 type:13 subMessageClass:0];
  v14[6] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"topics" number:8 type:14 subMessageClass:objc_opt_class()];
  v14[7] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hasAssociatedImageRepresentation" number:9 type:12 subMessageClass:0];
  v14[8] = v9;
  double v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uuid" number:10 type:13 subMessageClass:0];
  v14[9] = v10;
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4C80;
}

id __37__BMUniversalRecentsMetadata_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 _topicsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  if (a4)
  {
    if (a4 != 1)
    {
      id v9 = 0;
      goto LABEL_9;
    }
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMUniversalRecentsMetadata;
  }
  else
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMUniversalRecentsMetadata_v0;
  }
  uint64_t v8 = [[v7 alloc] initByReadFrom:v6];
  id v9 = (void *)v8;
  if (v8) {
    *(_DWORD *)(v8 + 36) = a4;
  }

LABEL_9:

  return v9;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end