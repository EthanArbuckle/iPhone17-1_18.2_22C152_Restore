@interface BMPersonalizedSensingMomentsContextMomentsContext
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMPersonalizedSensingMomentsContextMomentsContext)initWithContextIdentifier:(id)a3 contextStrings:(id)a4 contextCreationTimestamp:(id)a5 associatedPatternType:(id)a6 metadataContentBitmap:(id)a7;
- (BMPersonalizedSensingMomentsContextMomentsContext)initWithContextIdentifier:(id)a3 contextStrings:(id)a4 contextCreationTimestamp:(id)a5 associatedPatternType:(id)a6 metadataContentBitmap:(id)a7 actionType:(id)a8;
- (BMPersonalizedSensingMomentsContextMomentsContext)initWithContextIdentifier:(id)a3 contextStrings:(id)a4 contextCreationTimestamp:(id)a5 associatedPatternType:(id)a6 metadataContentBitmap:(id)a7 actionType:(id)a8 associatedLocations:(id)a9 associatedContacts:(id)a10 associatedTime:(id)a11 associatedMusic:(id)a12;
- (BMPersonalizedSensingMomentsContextMomentsContext)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasActionType;
- (BOOL)hasAssociatedPatternType;
- (BOOL)hasMetadataContentBitmap;
- (BOOL)isEqual:(id)a3;
- (NSArray)associatedContacts;
- (NSArray)associatedLocations;
- (NSArray)associatedMusic;
- (NSArray)associatedTime;
- (NSArray)contextStrings;
- (NSDate)contextCreationTimestamp;
- (NSString)description;
- (NSUUID)contextIdentifier;
- (id)_associatedContactsJSONArray;
- (id)_associatedLocationsJSONArray;
- (id)_associatedMusicJSONArray;
- (id)_associatedTimeJSONArray;
- (id)_contextStringsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)actionType;
- (unsigned)associatedPatternType;
- (unsigned)dataVersion;
- (unsigned)metadataContentBitmap;
- (void)setHasActionType:(BOOL)a3;
- (void)setHasAssociatedPatternType:(BOOL)a3;
- (void)setHasMetadataContentBitmap:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPersonalizedSensingMomentsContextMomentsContext

- (BMPersonalizedSensingMomentsContextMomentsContext)initWithContextIdentifier:(id)a3 contextStrings:(id)a4 contextCreationTimestamp:(id)a5 associatedPatternType:(id)a6 metadataContentBitmap:(id)a7 actionType:(id)a8
{
  return [(BMPersonalizedSensingMomentsContextMomentsContext *)self initWithContextIdentifier:a3 contextStrings:a4 contextCreationTimestamp:a5 associatedPatternType:a6 metadataContentBitmap:a7 actionType:a8 associatedLocations:MEMORY[0x1E4F1CBF0] associatedContacts:MEMORY[0x1E4F1CBF0] associatedTime:MEMORY[0x1E4F1CBF0] associatedMusic:MEMORY[0x1E4F1CBF0]];
}

- (BMPersonalizedSensingMomentsContextMomentsContext)initWithContextIdentifier:(id)a3 contextStrings:(id)a4 contextCreationTimestamp:(id)a5 associatedPatternType:(id)a6 metadataContentBitmap:(id)a7
{
  return [(BMPersonalizedSensingMomentsContextMomentsContext *)self initWithContextIdentifier:a3 contextStrings:a4 contextCreationTimestamp:a5 associatedPatternType:a6 metadataContentBitmap:a7 actionType:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedMusic, 0);
  objc_storeStrong((id *)&self->_associatedTime, 0);
  objc_storeStrong((id *)&self->_associatedContacts, 0);
  objc_storeStrong((id *)&self->_associatedLocations, 0);
  objc_storeStrong((id *)&self->_contextStrings, 0);

  objc_storeStrong((id *)&self->_raw_contextIdentifier, 0);
}

- (NSArray)associatedMusic
{
  return self->_associatedMusic;
}

- (NSArray)associatedTime
{
  return self->_associatedTime;
}

- (NSArray)associatedContacts
{
  return self->_associatedContacts;
}

- (NSArray)associatedLocations
{
  return self->_associatedLocations;
}

- (void)setHasActionType:(BOOL)a3
{
  self->_hasActionType = a3;
}

- (BOOL)hasActionType
{
  return self->_hasActionType;
}

- (unsigned)actionType
{
  return self->_actionType;
}

- (void)setHasMetadataContentBitmap:(BOOL)a3
{
  self->_hasMetadataContentBitmap = a3;
}

- (BOOL)hasMetadataContentBitmap
{
  return self->_hasMetadataContentBitmap;
}

- (unsigned)metadataContentBitmap
{
  return self->_metadataContentBitmap;
}

- (void)setHasAssociatedPatternType:(BOOL)a3
{
  self->_hasAssociatedPatternType = a3;
}

- (BOOL)hasAssociatedPatternType
{
  return self->_hasAssociatedPatternType;
}

- (unsigned)associatedPatternType
{
  return self->_associatedPatternType;
}

- (NSArray)contextStrings
{
  return self->_contextStrings;
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
    v6 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self contextIdentifier];
    uint64_t v7 = [v5 contextIdentifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self contextIdentifier];
      v10 = [v5 contextIdentifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_40;
      }
    }
    v13 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self contextStrings];
    uint64_t v14 = [v5 contextStrings];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self contextStrings];
      v17 = [v5 contextStrings];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_40;
      }
    }
    v19 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self contextCreationTimestamp];
    uint64_t v20 = [v5 contextCreationTimestamp];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self contextCreationTimestamp];
      v23 = [v5 contextCreationTimestamp];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_40;
      }
    }
    if ([(BMPersonalizedSensingMomentsContextMomentsContext *)self hasAssociatedPatternType]
      || [v5 hasAssociatedPatternType])
    {
      if (![(BMPersonalizedSensingMomentsContextMomentsContext *)self hasAssociatedPatternType])goto LABEL_40; {
      if (![v5 hasAssociatedPatternType])
      }
        goto LABEL_40;
      unsigned int v25 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self associatedPatternType];
      if (v25 != [v5 associatedPatternType]) {
        goto LABEL_40;
      }
    }
    if ([(BMPersonalizedSensingMomentsContextMomentsContext *)self hasMetadataContentBitmap]
      || [v5 hasMetadataContentBitmap])
    {
      if (![(BMPersonalizedSensingMomentsContextMomentsContext *)self hasMetadataContentBitmap])goto LABEL_40; {
      if (![v5 hasMetadataContentBitmap])
      }
        goto LABEL_40;
      unsigned int v26 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self metadataContentBitmap];
      if (v26 != [v5 metadataContentBitmap]) {
        goto LABEL_40;
      }
    }
    if ([(BMPersonalizedSensingMomentsContextMomentsContext *)self hasActionType]
      || [v5 hasActionType])
    {
      if (![(BMPersonalizedSensingMomentsContextMomentsContext *)self hasActionType]) {
        goto LABEL_40;
      }
      if (![v5 hasActionType]) {
        goto LABEL_40;
      }
      unsigned int v27 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self actionType];
      if (v27 != [v5 actionType]) {
        goto LABEL_40;
      }
    }
    v28 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self associatedLocations];
    uint64_t v29 = [v5 associatedLocations];
    if (v28 == (void *)v29)
    {
    }
    else
    {
      v30 = (void *)v29;
      v31 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self associatedLocations];
      v32 = [v5 associatedLocations];
      int v33 = [v31 isEqual:v32];

      if (!v33) {
        goto LABEL_40;
      }
    }
    v34 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self associatedContacts];
    uint64_t v35 = [v5 associatedContacts];
    if (v34 == (void *)v35)
    {
    }
    else
    {
      v36 = (void *)v35;
      v37 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self associatedContacts];
      v38 = [v5 associatedContacts];
      int v39 = [v37 isEqual:v38];

      if (!v39) {
        goto LABEL_40;
      }
    }
    v40 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self associatedTime];
    uint64_t v41 = [v5 associatedTime];
    if (v40 == (void *)v41)
    {
    }
    else
    {
      v42 = (void *)v41;
      v43 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self associatedTime];
      v44 = [v5 associatedTime];
      int v45 = [v43 isEqual:v44];

      if (!v45)
      {
LABEL_40:
        char v12 = 0;
LABEL_41:

        goto LABEL_42;
      }
    }
    v47 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self associatedMusic];
    v48 = [v5 associatedMusic];
    if (v47 == v48)
    {
      char v12 = 1;
    }
    else
    {
      v49 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self associatedMusic];
      v50 = [v5 associatedMusic];
      char v12 = [v49 isEqual:v50];
    }
    goto LABEL_41;
  }
  char v12 = 0;
LABEL_42:

  return v12;
}

- (NSDate)contextCreationTimestamp
{
  if (self->_hasRaw_contextCreationTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_contextCreationTimestamp];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSUUID)contextIdentifier
{
  raw_contextIdentifier = self->_raw_contextIdentifier;
  if (raw_contextIdentifier)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_contextIdentifier toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (id)jsonDictionary
{
  v40[10] = *MEMORY[0x1E4F143B8];
  v3 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self contextIdentifier];
  uint64_t v4 = [v3 UUIDString];

  uint64_t v5 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self _contextStringsJSONArray];
  v6 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self contextCreationTimestamp];
  if (v6)
  {
    uint64_t v7 = NSNumber;
    v8 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self contextCreationTimestamp];
    [v8 timeIntervalSince1970];
    uint64_t v9 = objc_msgSend(v7, "numberWithDouble:");
  }
  else
  {
    uint64_t v9 = 0;
  }

  if ([(BMPersonalizedSensingMomentsContextMomentsContext *)self hasAssociatedPatternType])
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContext associatedPatternType](self, "associatedPatternType"));
  }
  else
  {
    uint64_t v10 = 0;
  }
  if ([(BMPersonalizedSensingMomentsContextMomentsContext *)self hasMetadataContentBitmap])
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContext metadataContentBitmap](self, "metadataContentBitmap"));
  }
  else
  {
    uint64_t v11 = 0;
  }
  if ([(BMPersonalizedSensingMomentsContextMomentsContext *)self hasActionType])
  {
    char v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContext actionType](self, "actionType"));
  }
  else
  {
    char v12 = 0;
  }
  v38 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self _associatedLocationsJSONArray];
  v37 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self _associatedContactsJSONArray];
  v13 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self _associatedTimeJSONArray];
  uint64_t v14 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self _associatedMusicJSONArray];
  v39[0] = @"contextIdentifier";
  uint64_t v15 = v4;
  if (!v4)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v32 = (void *)v15;
  v40[0] = v15;
  v39[1] = @"contextStrings";
  uint64_t v16 = v5;
  if (!v5)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v16;
  v40[1] = v16;
  v39[2] = @"contextCreationTimestamp";
  uint64_t v17 = v9;
  if (!v9)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = (void *)v17;
  v40[2] = v17;
  v39[3] = @"associatedPatternType";
  uint64_t v18 = v10;
  if (!v10)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v36 = (void *)v4;
  uint64_t v29 = (void *)v18;
  v40[3] = v18;
  v39[4] = @"metadataContentBitmap";
  uint64_t v19 = v11;
  if (!v11)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v35 = (void *)v5;
  v28 = (void *)v19;
  v40[4] = v19;
  v39[5] = @"actionType";
  uint64_t v20 = v12;
  if (!v12)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = (void *)v9;
  v40[5] = v20;
  v39[6] = @"associatedLocations";
  v21 = v38;
  if (!v38)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v10;
  v40[6] = v21;
  v39[7] = @"associatedContacts";
  v23 = v37;
  if (!v37)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
  }
  int v24 = (void *)v11;
  v40[7] = v23;
  v39[8] = @"associatedTime";
  unsigned int v25 = v13;
  if (!v13)
  {
    unsigned int v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v40[8] = v25;
  v39[9] = @"associatedMusic";
  unsigned int v26 = v14;
  if (!v14)
  {
    unsigned int v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v40[9] = v26;
  id v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:10];
  if (v14)
  {
    if (v13) {
      goto LABEL_35;
    }
  }
  else
  {

    if (v13) {
      goto LABEL_35;
    }
  }

LABEL_35:
  if (!v37) {

  }
  if (!v38) {
  if (!v12)
  }

  if (!v24) {
  if (v22)
  }
  {
    if (v34) {
      goto LABEL_45;
    }
  }
  else
  {

    if (v34)
    {
LABEL_45:
      if (v35) {
        goto LABEL_46;
      }
LABEL_54:

      if (v36) {
        goto LABEL_47;
      }
      goto LABEL_55;
    }
  }

  if (!v35) {
    goto LABEL_54;
  }
LABEL_46:
  if (v36) {
    goto LABEL_47;
  }
LABEL_55:

LABEL_47:

  return v33;
}

- (id)_associatedMusicJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self associatedMusic];
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

- (id)_associatedTimeJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self associatedTime];
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

- (id)_associatedContactsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self associatedContacts];
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

- (id)_associatedLocationsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self associatedLocations];
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

- (id)_contextStringsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self contextStrings];
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

- (BMPersonalizedSensingMomentsContextMomentsContext)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v272[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"contextIdentifier"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v269 = *MEMORY[0x1E4F28568];
        uint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contextIdentifier"];
        v270 = v7;
        id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v270 forKeys:&v269 count:1];
        id v27 = (id)[v25 initWithDomain:v26 code:2 userInfo:v8];
        v28 = 0;
        *a4 = v27;
        goto LABEL_204;
      }
      v28 = 0;
      goto LABEL_206;
    }
    id v22 = v6;
    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v22];
    if (!v23)
    {
      id v49 = v22;
      if (a4)
      {
        id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v51 = *MEMORY[0x1E4F502C8];
        uint64_t v271 = *MEMORY[0x1E4F28568];
        id v8 = (id)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"contextIdentifier"];
        v272[0] = v8;
        v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v272 forKeys:&v271 count:1];
        *a4 = (id)[v50 initWithDomain:v51 code:2 userInfo:v52];

        v28 = 0;
        uint64_t v7 = v49;
        goto LABEL_204;
      }
      v28 = 0;
      uint64_t v7 = v22;
      goto LABEL_205;
    }
    int v24 = (void *)v23;

    uint64_t v7 = v24;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = [v5 objectForKeyedSubscript:@"contextStrings"];
  uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  int v10 = [v8 isEqual:v9];

  v197 = self;
  v198 = v6;
  if (v10)
  {
    v196 = v7;
    long long v11 = v5;

    id v8 = 0;
  }
  else
  {
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v39 = *MEMORY[0x1E4F502C8];
          uint64_t v267 = *MEMORY[0x1E4F28568];
          v200 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"contextStrings"];
          v268 = v200;
          uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v268 forKeys:&v267 count:1];
          uint64_t v41 = v39;
          v37 = (void *)v40;
          id v42 = (id)[v38 initWithDomain:v41 code:2 userInfo:v40];
          v28 = 0;
          *a4 = v42;
          goto LABEL_203;
        }
        v28 = 0;
        goto LABEL_204;
      }
    }
    v196 = v7;
    long long v11 = v5;
  }
  v200 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v222 = 0u;
  long long v223 = 0u;
  long long v224 = 0u;
  long long v225 = 0u;
  id v8 = v8;
  uint64_t v12 = [v8 countByEnumeratingWithState:&v222 objects:v266 count:16];
  if (!v12)
  {
LABEL_19:

    id v5 = v11;
    id v17 = [v11 objectForKeyedSubscript:@"contextCreationTimestamp"];
    if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v21 = 0;
      goto LABEL_51;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v43 = (objc_class *)MEMORY[0x1E4F1C9C8];
      id v44 = v17;
      id v45 = [v43 alloc];
      [v44 doubleValue];
      double v47 = v46;

      id v48 = (id)[v45 initWithTimeIntervalSince1970:v47];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v53 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        uint64_t v21 = [v53 dateFromString:v17];

        goto LABEL_51;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v37 = 0;
          v28 = 0;
          self = v197;
          uint64_t v7 = v196;
LABEL_202:

          goto LABEL_203;
        }
        id v113 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v114 = *MEMORY[0x1E4F502C8];
        uint64_t v260 = *MEMORY[0x1E4F28568];
        id v32 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"contextCreationTimestamp"];
        id v261 = v32;
        v187 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v261 forKeys:&v260 count:1];
        id v115 = (id)objc_msgSend(v113, "initWithDomain:code:userInfo:", v114, 2);
        v37 = 0;
        v28 = 0;
        *a4 = v115;
        self = v197;
        uint64_t v7 = v196;

LABEL_201:
        goto LABEL_202;
      }
      id v48 = v17;
    }
    uint64_t v21 = (uint64_t)v48;
LABEL_51:
    v189 = (void *)v21;
    uint64_t v54 = [v5 objectForKeyedSubscript:@"associatedPatternType"];
    v186 = (void *)v54;
    if (v54)
    {
      v55 = (void *)v54;
      objc_opt_class();
      self = v197;
      if (objc_opt_isKindOfClass())
      {
        id v32 = 0;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v32 = 0;
            v28 = 0;
            uint64_t v7 = v196;
            v37 = v189;
LABEL_200:

            goto LABEL_201;
          }
          id v76 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v77 = *MEMORY[0x1E4F502C8];
          uint64_t v258 = *MEMORY[0x1E4F28568];
          id v184 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"associatedPatternType"];
          id v259 = v184;
          v185 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v259 forKeys:&v258 count:1];
          id v78 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v77, 2);
          v28 = 0;
          id v32 = 0;
          *a4 = v78;
          goto LABEL_118;
        }
        id v32 = v55;
      }
    }
    else
    {
      id v32 = 0;
      self = v197;
    }
    uint64_t v56 = [v5 objectForKeyedSubscript:@"metadataContentBitmap"];
    v185 = (void *)v56;
    if (!v56 || (v57 = (void *)v56, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v184 = 0;
      goto LABEL_60;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v184 = v57;
LABEL_60:
      v58 = [v5 objectForKeyedSubscript:@"actionType"];
      v194 = v58;
      v188 = v5;
      if (!v58 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v59 = self;
        id v181 = 0;
LABEL_63:
        v60 = [v188 objectForKeyedSubscript:@"associatedLocations"];
        v61 = [MEMORY[0x1E4F1CA98] null];
        int v62 = [v60 isEqual:v61];

        uint64_t v7 = v196;
        if (v62)
        {

          v60 = 0;
          v37 = v189;
LABEL_67:
          v191 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v60, "count"));
          long long v217 = 0u;
          long long v218 = 0u;
          long long v219 = 0u;
          long long v220 = 0u;
          id v63 = v60;
          uint64_t v64 = [v63 countByEnumeratingWithState:&v217 objects:v251 count:16];
          id v5 = v188;
          obuint64_t j = v63;
          if (!v64) {
            goto LABEL_77;
          }
          uint64_t v65 = v64;
          uint64_t v66 = *(void *)v218;
          while (1)
          {
            for (uint64_t i = 0; i != v65; ++i)
            {
              if (*(void *)v218 != v66) {
                objc_enumerationMutation(obj);
              }
              v68 = *(void **)(*((void *)&v217 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v87 = a4;
                if (a4)
                {
                  id v88 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v89 = *MEMORY[0x1E4F502C8];
                  uint64_t v249 = *MEMORY[0x1E4F28568];
                  id v69 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"associatedLocations"];
                  id v250 = v69;
                  v90 = (void *)MEMORY[0x1E4F1C9E8];
                  v91 = &v250;
                  v92 = &v249;
LABEL_93:
                  id v93 = [v90 dictionaryWithObjects:v91 forKeys:v92 count:1];
                  uint64_t v94 = v89;
                  v58 = v194;
                  id v95 = (id)[v88 initWithDomain:v94 code:2 userInfo:v93];
                  v28 = 0;
                  id *v87 = v95;
                  id v182 = obj;
                  id v5 = v188;
LABEL_94:
                  uint64_t v6 = v198;
                  uint64_t v7 = v196;
                  goto LABEL_194;
                }
LABEL_114:
                v28 = 0;
                v37 = v189;
                id v182 = obj;
                id v5 = v188;
                goto LABEL_115;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v87 = a4;
                if (a4)
                {
                  id v88 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v89 = *MEMORY[0x1E4F502C8];
                  uint64_t v247 = *MEMORY[0x1E4F28568];
                  id v69 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"associatedLocations"];
                  id v248 = v69;
                  v90 = (void *)MEMORY[0x1E4F1C9E8];
                  v91 = &v248;
                  v92 = &v247;
                  goto LABEL_93;
                }
                goto LABEL_114;
              }
              id v69 = v68;
              v70 = [BMPersonalizedSensingMomentsContextMomentsContextLocationMetaData alloc];
              id v216 = 0;
              v71 = [(BMPersonalizedSensingMomentsContextMomentsContextLocationMetaData *)v70 initWithJSONDictionary:v69 error:&v216];
              id v72 = v216;
              if (v72)
              {
                id v93 = v72;
                uint64_t v6 = v198;
                uint64_t v7 = v196;
                if (a4) {
                  *a4 = v72;
                }

                v28 = 0;
                id v182 = obj;
                id v5 = v188;
                goto LABEL_193;
              }
              [v191 addObject:v71];

              v58 = v194;
            }
            id v63 = obj;
            uint64_t v65 = [obj countByEnumeratingWithState:&v217 objects:v251 count:16];
            id v5 = v188;
            v37 = v189;
            if (!v65)
            {
LABEL_77:

              v73 = [v5 objectForKeyedSubscript:@"associatedContacts"];
              v74 = [MEMORY[0x1E4F1CA98] null];
              int v75 = [v73 isEqual:v74];

              if (v75)
              {

                v73 = 0;
LABEL_100:
                v180 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v73, "count"));
                long long v212 = 0u;
                long long v213 = 0u;
                long long v214 = 0u;
                long long v215 = 0u;
                id v182 = v73;
                uint64_t v96 = [v182 countByEnumeratingWithState:&v212 objects:v244 count:16];
                if (!v96) {
                  goto LABEL_110;
                }
                uint64_t v97 = v96;
                uint64_t v98 = *(void *)v213;
                while (1)
                {
                  id v99 = v5;
                  for (uint64_t j = 0; j != v97; ++j)
                  {
                    if (*(void *)v213 != v98) {
                      objc_enumerationMutation(v182);
                    }
                    v101 = *(void **)(*((void *)&v212 + 1) + 8 * j);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v116 = a4;
                      if (a4)
                      {
                        id v117 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v118 = *MEMORY[0x1E4F502C8];
                        uint64_t v242 = *MEMORY[0x1E4F28568];
                        id v102 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"associatedContacts"];
                        id v243 = v102;
                        v119 = (void *)MEMORY[0x1E4F1C9E8];
                        v120 = &v243;
                        v121 = &v242;
LABEL_128:
                        id v122 = [v119 dictionaryWithObjects:v120 forKeys:v121 count:1];
                        id v123 = (id)[v117 initWithDomain:v118 code:2 userInfo:v122];
                        v28 = 0;
                        id *v116 = v123;
                        id v93 = v182;
                        id v5 = v99;
                        goto LABEL_129;
                      }
LABEL_150:
                      v28 = 0;
                      id v93 = v182;
                      id v5 = v99;
                      uint64_t v6 = v198;
                      goto LABEL_151;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      v116 = a4;
                      if (a4)
                      {
                        id v117 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v118 = *MEMORY[0x1E4F502C8];
                        uint64_t v240 = *MEMORY[0x1E4F28568];
                        id v102 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"associatedContacts"];
                        id v241 = v102;
                        v119 = (void *)MEMORY[0x1E4F1C9E8];
                        v120 = &v241;
                        v121 = &v240;
                        goto LABEL_128;
                      }
                      goto LABEL_150;
                    }
                    id v102 = v101;
                    v103 = [BMPersonalizedSensingMomentsContextMomentsContextContactMetaData alloc];
                    id v211 = 0;
                    v104 = [(BMPersonalizedSensingMomentsContextMomentsContextContactMetaData *)v103 initWithJSONDictionary:v102 error:&v211];
                    id v105 = v211;
                    if (v105)
                    {
                      id v122 = v105;
                      uint64_t v6 = v198;
                      if (a4) {
                        *a4 = v105;
                      }

                      v28 = 0;
                      id v93 = v182;
                      id v5 = v99;
                      goto LABEL_133;
                    }
                    [v180 addObject:v104];

                    v58 = v194;
                  }
                  uint64_t v97 = [v182 countByEnumeratingWithState:&v212 objects:v244 count:16];
                  id v5 = v99;
                  if (!v97)
                  {
LABEL_110:

                    id v93 = [v5 objectForKeyedSubscript:@"associatedTime"];
                    v106 = [MEMORY[0x1E4F1CA98] null];
                    int v107 = [v93 isEqual:v106];

                    if (v107)
                    {

                      id v93 = 0;
LABEL_136:
                      id v102 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v93, "count"));
                      long long v207 = 0u;
                      long long v208 = 0u;
                      long long v209 = 0u;
                      long long v210 = 0u;
                      id v93 = v93;
                      uint64_t v124 = [v93 countByEnumeratingWithState:&v207 objects:v237 count:16];
                      if (!v124) {
                        goto LABEL_146;
                      }
                      uint64_t v125 = v124;
                      uint64_t v174 = *(void *)v208;
                      while (1)
                      {
                        for (uint64_t k = 0; k != v125; ++k)
                        {
                          if (*(void *)v208 != v174) {
                            objc_enumerationMutation(v93);
                          }
                          v127 = *(void **)(*((void *)&v207 + 1) + 8 * k);
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v137 = a4;
                            if (a4)
                            {
                              id v138 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v139 = *MEMORY[0x1E4F502C8];
                              uint64_t v235 = *MEMORY[0x1E4F28568];
                              uint64_t v140 = [[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"associatedTime"];
                              uint64_t v236 = v140;
                              v141 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v236 forKeys:&v235 count:1];
                              v142 = v138;
                              uint64_t v143 = v139;
LABEL_158:
                              id *v137 = (id)[v142 initWithDomain:v143 code:2 userInfo:v141];

                              v145 = (void *)v140;
                              v28 = 0;
                              id v122 = v93;
                              id v5 = v188;
                              uint64_t v6 = v198;
LABEL_159:
                              id v69 = v180;
                              goto LABEL_191;
                            }
LABEL_178:
                            v28 = 0;
                            id v122 = v93;
                            id v5 = v188;
LABEL_129:
                            uint64_t v6 = v198;
                            goto LABEL_133;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            v137 = a4;
                            if (a4)
                            {
                              id v144 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v176 = *MEMORY[0x1E4F502C8];
                              uint64_t v233 = *MEMORY[0x1E4F28568];
                              uint64_t v140 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"associatedTime"];
                              uint64_t v234 = v140;
                              v141 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v234 forKeys:&v233 count:1];
                              v142 = v144;
                              uint64_t v143 = v176;
                              goto LABEL_158;
                            }
                            goto LABEL_178;
                          }
                          id v128 = v127;
                          v129 = [BMPersonalizedSensingMomentsContextMomentsContextTimeMetaData alloc];
                          id v206 = 0;
                          v130 = [(BMPersonalizedSensingMomentsContextMomentsContextTimeMetaData *)v129 initWithJSONDictionary:v128 error:&v206];
                          id v131 = v206;
                          if (v131)
                          {
                            v146 = v131;
                            v177 = v128;
                            uint64_t v6 = v198;
                            if (a4) {
                              *a4 = v131;
                            }

                            v28 = 0;
                            id v122 = v93;
                            id v5 = v188;
                            id v69 = v180;
LABEL_190:
                            v145 = v177;
                            goto LABEL_191;
                          }
                          [v102 addObject:v130];
                        }
                        id v5 = v188;
                        uint64_t v125 = [v93 countByEnumeratingWithState:&v207 objects:v237 count:16];
                        if (!v125)
                        {
LABEL_146:

                          id v122 = [v5 objectForKeyedSubscript:@"associatedMusic"];
                          v132 = [MEMORY[0x1E4F1CA98] null];
                          int v175 = [v122 isEqual:v132];

                          if (v175)
                          {

                            id v122 = 0;
LABEL_165:
                            uint64_t v147 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v122, "count"));
                            long long v202 = 0u;
                            long long v203 = 0u;
                            long long v204 = 0u;
                            long long v205 = 0u;
                            id v122 = v122;
                            uint64_t v148 = [v122 countByEnumeratingWithState:&v202 objects:v230 count:16];
                            if (!v148) {
                              goto LABEL_175;
                            }
                            uint64_t v149 = v148;
                            uint64_t v171 = *(void *)v203;
                            v177 = (void *)v147;
LABEL_167:
                            uint64_t v150 = 0;
                            while (1)
                            {
                              if (*(void *)v203 != v171) {
                                objc_enumerationMutation(v122);
                              }
                              v151 = *(void **)(*((void *)&v202 + 1) + 8 * v150);
                              objc_opt_class();
                              if (objc_opt_isKindOfClass()) {
                                break;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                              {
                                id v5 = v188;
                                uint64_t v6 = v198;
                                id v69 = v180;
                                if (!a4) {
                                  goto LABEL_189;
                                }
                                id v169 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v168 = *MEMORY[0x1E4F502C8];
                                uint64_t v226 = *MEMORY[0x1E4F28568];
                                v172 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"associatedMusic"];
                                v227 = v172;
                                v159 = (void *)MEMORY[0x1E4F1C9E8];
                                v160 = &v227;
                                v161 = &v226;
                                goto LABEL_184;
                              }
                              id v152 = v151;
                              v153 = [BMPersonalizedSensingMomentsContextMomentsContextMusicMetaData alloc];
                              id v201 = 0;
                              v154 = [(BMPersonalizedSensingMomentsContextMomentsContextMusicMetaData *)v153 initWithJSONDictionary:v152 error:&v201];
                              id v155 = v201;
                              if (v155)
                              {
                                id v170 = v155;
                                v172 = v152;
                                if (a4) {
                                  *a4 = v155;
                                }

                                id v5 = v188;
                                uint64_t v6 = v198;
                                id v69 = v180;
                                v162 = v170;
LABEL_188:

LABEL_189:
                                v28 = 0;
                                goto LABEL_190;
                              }
                              [v177 addObject:v154];

                              if (v149 == ++v150)
                              {
                                id v5 = v188;
                                uint64_t v147 = (uint64_t)v177;
                                uint64_t v149 = [v122 countByEnumeratingWithState:&v202 objects:v230 count:16];
                                if (v149) {
                                  goto LABEL_167;
                                }
LABEL_175:

                                uint64_t v167 = v147;
                                v156 = (void *)v147;
                                id v69 = v180;
                                v28 = [(BMPersonalizedSensingMomentsContextMomentsContext *)v197 initWithContextIdentifier:v196 contextStrings:v200 contextCreationTimestamp:v189 associatedPatternType:v32 metadataContentBitmap:v184 actionType:v181 associatedLocations:v191 associatedContacts:v180 associatedTime:v102 associatedMusic:v167];
                                v197 = v28;
                                v145 = v156;
                                uint64_t v6 = v198;
LABEL_191:

LABEL_192:
                                uint64_t v7 = v196;
LABEL_193:
                                v58 = v194;
LABEL_194:

                                v37 = v189;
                                self = v197;
LABEL_195:

LABEL_196:
                                goto LABEL_197;
                              }
                            }
                            id v5 = v188;
                            uint64_t v6 = v198;
                            id v69 = v180;
                            if (!a4) {
                              goto LABEL_189;
                            }
                            id v169 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v168 = *MEMORY[0x1E4F502C8];
                            uint64_t v228 = *MEMORY[0x1E4F28568];
                            v172 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"associatedMusic"];
                            v229 = v172;
                            v159 = (void *)MEMORY[0x1E4F1C9E8];
                            v160 = &v229;
                            v161 = &v228;
LABEL_184:
                            v162 = [v159 dictionaryWithObjects:v160 forKeys:v161 count:1];
                            *a4 = (id)[v169 initWithDomain:v168 code:2 userInfo:v162];
                            goto LABEL_188;
                          }
                          if (!v122) {
                            goto LABEL_165;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass()) {
                            goto LABEL_165;
                          }
                          uint64_t v6 = v198;
                          if (a4)
                          {
                            id v179 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v173 = *MEMORY[0x1E4F502C8];
                            uint64_t v231 = *MEMORY[0x1E4F28568];
                            uint64_t v164 = [[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"associatedMusic"];
                            uint64_t v232 = v164;
                            v165 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v232 forKeys:&v231 count:1];
                            *a4 = (id)[v179 initWithDomain:v173 code:2 userInfo:v165];

                            v145 = (void *)v164;
                            v28 = 0;
                            goto LABEL_159;
                          }
                          v28 = 0;
LABEL_133:
                          id v69 = v180;
                          goto LABEL_192;
                        }
                      }
                    }
                    uint64_t v6 = v198;
                    if (!v93) {
                      goto LABEL_136;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      goto LABEL_136;
                    }
                    if (a4)
                    {
                      id v178 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v157 = *MEMORY[0x1E4F502C8];
                      uint64_t v238 = *MEMORY[0x1E4F28568];
                      id v102 = (id)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"associatedTime"];
                      id v239 = v102;
                      id v122 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v239 forKeys:&v238 count:1];
                      id v158 = (id)[v178 initWithDomain:v157 code:2 userInfo:v122];
                      v28 = 0;
                      *a4 = v158;
                      goto LABEL_133;
                    }
                    v28 = 0;
LABEL_151:
                    uint64_t v7 = v196;
                    id v69 = v180;
                    goto LABEL_194;
                  }
                }
              }
              if (!v73) {
                goto LABEL_100;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                goto LABEL_100;
              }
              id v182 = v73;
              if (a4)
              {
                id v133 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v134 = *MEMORY[0x1E4F502C8];
                uint64_t v245 = *MEMORY[0x1E4F28568];
                uint64_t v135 = [[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"associatedContacts"];
                uint64_t v246 = v135;
                id v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v246 forKeys:&v245 count:1];
                id v136 = (id)[v133 initWithDomain:v134 code:2 userInfo:v93];
                v28 = 0;
                *a4 = v136;
                id v69 = (id)v135;
                goto LABEL_94;
              }
              v28 = 0;
LABEL_115:
              self = v197;
              uint64_t v6 = v198;
              uint64_t v7 = v196;
              goto LABEL_195;
            }
          }
        }
        v37 = v189;
        if (!v60) {
          goto LABEL_67;
        }
        objc_opt_class();
        obuint64_t j = v60;
        if (objc_opt_isKindOfClass()) {
          goto LABEL_67;
        }
        self = v59;
        if (a4)
        {
          id v108 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v109 = *MEMORY[0x1E4F502C8];
          uint64_t v252 = *MEMORY[0x1E4F28568];
          v191 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"associatedLocations"];
          v253 = v191;
          uint64_t v110 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v253 forKeys:&v252 count:1];
          uint64_t v111 = v109;
          v37 = v189;
          id v183 = (id)v110;
          id v112 = (id)objc_msgSend(v108, "initWithDomain:code:userInfo:", v111, 2);
          v28 = 0;
          *a4 = v112;
          id v5 = v188;

          goto LABEL_196;
        }
        v28 = 0;
        id v5 = v188;
LABEL_197:

        goto LABEL_198;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v59 = self;
        id v181 = v58;
        goto LABEL_63;
      }
      if (a4)
      {
        id v192 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v81 = *MEMORY[0x1E4F502C8];
        uint64_t v254 = *MEMORY[0x1E4F28568];
        id v82 = [NSString alloc];
        uint64_t v166 = objc_opt_class();
        v83 = v82;
        v58 = v194;
        obuint64_t j = (id)[v83 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v166, @"actionType"];
        id v255 = obj;
        uint64_t v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v255 forKeys:&v254 count:1];
        v85 = v192;
        v193 = (void *)v84;
        id v86 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v81, 2);
        v28 = 0;
        id v181 = 0;
        *a4 = v86;
        uint64_t v7 = v196;
        v37 = v189;

        goto LABEL_197;
      }
      id v181 = 0;
      v28 = 0;
LABEL_120:
      uint64_t v7 = v196;
      v37 = v189;
LABEL_198:

      goto LABEL_199;
    }
    if (a4)
    {
      id v195 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v79 = *MEMORY[0x1E4F502C8];
      uint64_t v256 = *MEMORY[0x1E4F28568];
      id v181 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"metadataContentBitmap"];
      id v257 = v181;
      v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v257 forKeys:&v256 count:1];
      id v80 = (id)[v195 initWithDomain:v79 code:2 userInfo:v58];
      v28 = 0;
      id v184 = 0;
      *a4 = v80;
      goto LABEL_120;
    }
    id v184 = 0;
    v28 = 0;
LABEL_118:
    uint64_t v7 = v196;
    v37 = v189;
LABEL_199:

    goto LABEL_200;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v223;
LABEL_11:
  uint64_t v15 = 0;
  while (1)
  {
    if (*(void *)v223 != v14) {
      objc_enumerationMutation(v8);
    }
    uint64_t v16 = *(void **)(*((void *)&v222 + 1) + 8 * v15);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v29 = a4;
      if (!a4) {
        goto LABEL_38;
      }
      id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v36 = *MEMORY[0x1E4F502C8];
      uint64_t v262 = *MEMORY[0x1E4F28568];
      id v17 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"contextStrings"];
      id v263 = v17;
      id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v263 forKeys:&v262 count:1];
      id v33 = v35;
      uint64_t v34 = v36;
LABEL_31:
      v28 = 0;
      *uint64_t v29 = (id)[v33 initWithDomain:v34 code:2 userInfo:v32];
LABEL_35:
      v37 = v8;
      id v5 = v11;
      self = v197;
      uint64_t v7 = v196;
      goto LABEL_201;
    }
    id v17 = v16;
    uint64_t v18 = [BMPersonalizedSensingMomentsContextMomentsContextString alloc];
    id v221 = 0;
    uint64_t v19 = [(BMPersonalizedSensingMomentsContextMomentsContextString *)v18 initWithJSONDictionary:v17 error:&v221];
    id v20 = v221;
    if (v20)
    {
      id v32 = v20;
      if (a4) {
        *a4 = v20;
      }

      v28 = 0;
      goto LABEL_35;
    }
    [v200 addObject:v19];

    if (v13 == ++v15)
    {
      uint64_t v13 = [v8 countByEnumeratingWithState:&v222 objects:v266 count:16];
      if (!v13) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
  }
  uint64_t v29 = a4;
  if (a4)
  {
    id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v31 = *MEMORY[0x1E4F502C8];
    uint64_t v264 = *MEMORY[0x1E4F28568];
    id v17 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"contextStrings"];
    id v265 = v17;
    id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v265 forKeys:&v264 count:1];
    id v33 = v30;
    uint64_t v34 = v31;
    goto LABEL_31;
  }
LABEL_38:
  v28 = 0;
  v37 = v8;
  id v5 = v11;
  self = v197;
  uint64_t v7 = v196;
LABEL_203:

LABEL_204:
LABEL_205:

LABEL_206:
  return v28;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMPersonalizedSensingMomentsContextMomentsContext *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_raw_contextIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v5 = self->_contextStrings;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v53;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v53 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v52 + 1) + 8 * v9);
        uint64_t v51 = 0;
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v7);
  }

  if (self->_hasRaw_contextCreationTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasAssociatedPatternType) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasMetadataContentBitmap) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasActionType) {
    PBDataWriterWriteUint32Field();
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v11 = self->_associatedLocations;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v47 objects:v59 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v48;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v48 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v47 + 1) + 8 * v15);
        uint64_t v51 = 0;
        PBDataWriterPlaceMark();
        [v16 writeTo:v4];
        PBDataWriterRecallMark();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v47 objects:v59 count:16];
    }
    while (v13);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v17 = self->_associatedContacts;
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v43 objects:v58 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v44;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v44 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(void **)(*((void *)&v43 + 1) + 8 * v21);
        uint64_t v51 = 0;
        PBDataWriterPlaceMark();
        [v22 writeTo:v4];
        PBDataWriterRecallMark();
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v43 objects:v58 count:16];
    }
    while (v19);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v23 = self->_associatedTime;
  uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v39 objects:v57 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v40;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v40 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v39 + 1) + 8 * v27);
        uint64_t v51 = 0;
        PBDataWriterPlaceMark();
        [v28 writeTo:v4];
        PBDataWriterRecallMark();
        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [(NSArray *)v23 countByEnumeratingWithState:&v39 objects:v57 count:16];
    }
    while (v25);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v29 = self->_associatedMusic;
  uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v35 objects:v56 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v36;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v36 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void **)(*((void *)&v35 + 1) + 8 * v33);
        uint64_t v51 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v34, "writeTo:", v4, (void)v35);
        PBDataWriterRecallMark();
        ++v33;
      }
      while (v31 != v33);
      uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v35 objects:v56 count:16];
    }
    while (v31);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)BMPersonalizedSensingMomentsContextMomentsContext;
  id v5 = [(BMEventBase *)&v71 init];
  if (!v5) {
    goto LABEL_81;
  }
  v70 = objc_opt_new();
  v68 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = (int *)MEMORY[0x1E4F940E8];
  int v10 = (int *)MEMORY[0x1E4F940E0];
  long long v11 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v12 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v11]) {
        break;
      }
      char v13 = 0;
      unsigned int v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        uint64_t v16 = *v9;
        uint64_t v17 = *(void *)&v4[v16];
        unint64_t v18 = v17 + 1;
        if (v17 == -1 || v18 > *(void *)&v4[*v10]) {
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
          int v21 = v4[*v11];
          goto LABEL_15;
        }
      }
      v4[*v11] = 1;
LABEL_13:
      int v21 = v4[*v11];
      if (v4[*v11]) {
        unint64_t v15 = 0;
      }
LABEL_15:
      if (v21 || (v15 & 7) == 4) {
        break;
      }
      switch((v15 >> 3))
      {
        case 1u:
          uint64_t v23 = PBReaderReadString();
          raw_contextIdentifier = v5->_raw_contextIdentifier;
          v5->_raw_contextIdentifier = (NSString *)v23;

          continue;
        case 2u:
          uint64_t v72 = 0;
          uint64_t v73 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_83;
          }
          id v25 = [[BMPersonalizedSensingMomentsContextMomentsContextString alloc] initByReadFrom:v4];
          if (!v25) {
            goto LABEL_83;
          }
          uint64_t v26 = v25;
          uint64_t v27 = v70;
          goto LABEL_62;
        case 3u:
          v5->_hasRaw_contextCreationTimestamp = 1;
          uint64_t v28 = *v9;
          unint64_t v29 = *(void *)&v4[v28];
          if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)&v4[*v10])
          {
            double v30 = *(double *)(*(void *)&v4[*v12] + v29);
            *(void *)&v4[v28] = v29 + 8;
          }
          else
          {
            v4[*v11] = 1;
            double v30 = 0.0;
          }
          v5->_raw_contextCreationTimestamp = v30;
          continue;
        case 4u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          v5->_hasAssociatedPatternType = 1;
          while (2)
          {
            uint64_t v34 = *v9;
            uint64_t v35 = *(void *)&v4[v34];
            unint64_t v36 = v35 + 1;
            if (v35 == -1 || v36 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)&v4[*v12] + v35);
              *(void *)&v4[v34] = v36;
              v33 |= (unint64_t)(v37 & 0x7F) << v31;
              if (v37 < 0)
              {
                v31 += 7;
                BOOL v20 = v32++ >= 9;
                if (v20)
                {
                  LODWORD(v33) = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v33) = 0;
          }
LABEL_66:
          uint64_t v54 = 48;
          goto LABEL_75;
        case 5u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v33 = 0;
          v5->_hasMetadataContentBitmap = 1;
          while (2)
          {
            uint64_t v40 = *v9;
            uint64_t v41 = *(void *)&v4[v40];
            unint64_t v42 = v41 + 1;
            if (v41 == -1 || v42 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)&v4[*v12] + v41);
              *(void *)&v4[v40] = v42;
              v33 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                BOOL v20 = v39++ >= 9;
                if (v20)
                {
                  LODWORD(v33) = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v33) = 0;
          }
LABEL_70:
          uint64_t v54 = 52;
          goto LABEL_75;
        case 6u:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v33 = 0;
          v5->_hasActionType = 1;
          break;
        case 7u:
          uint64_t v72 = 0;
          uint64_t v73 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_83;
          }
          id v50 = [[BMPersonalizedSensingMomentsContextMomentsContextLocationMetaData alloc] initByReadFrom:v4];
          if (!v50) {
            goto LABEL_83;
          }
          uint64_t v26 = v50;
          uint64_t v27 = v68;
          goto LABEL_62;
        case 8u:
          uint64_t v72 = 0;
          uint64_t v73 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_83;
          }
          id v51 = [[BMPersonalizedSensingMomentsContextMomentsContextContactMetaData alloc] initByReadFrom:v4];
          if (!v51) {
            goto LABEL_83;
          }
          uint64_t v26 = v51;
          uint64_t v27 = v6;
          goto LABEL_62;
        case 9u:
          uint64_t v72 = 0;
          uint64_t v73 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_83;
          }
          id v52 = [[BMPersonalizedSensingMomentsContextMomentsContextTimeMetaData alloc] initByReadFrom:v4];
          if (!v52) {
            goto LABEL_83;
          }
          uint64_t v26 = v52;
          uint64_t v27 = v7;
          goto LABEL_62;
        case 0xAu:
          uint64_t v72 = 0;
          uint64_t v73 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_83;
          }
          id v53 = [[BMPersonalizedSensingMomentsContextMomentsContextMusicMetaData alloc] initByReadFrom:v4];
          if (!v53) {
            goto LABEL_83;
          }
          uint64_t v26 = v53;
          uint64_t v27 = v8;
LABEL_62:
          objc_msgSend(v27, "addObject:", v26, v68);
          PBReaderRecallMark();

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_83:

          goto LABEL_80;
      }
      while (1)
      {
        uint64_t v46 = *v9;
        uint64_t v47 = *(void *)&v4[v46];
        unint64_t v48 = v47 + 1;
        if (v47 == -1 || v48 > *(void *)&v4[*v10]) {
          break;
        }
        char v49 = *(unsigned char *)(*(void *)&v4[*v12] + v47);
        *(void *)&v4[v46] = v48;
        v33 |= (unint64_t)(v49 & 0x7F) << v44;
        if ((v49 & 0x80) == 0) {
          goto LABEL_72;
        }
        v44 += 7;
        BOOL v20 = v45++ >= 9;
        if (v20)
        {
          LODWORD(v33) = 0;
          goto LABEL_74;
        }
      }
      v4[*v11] = 1;
LABEL_72:
      if (v4[*v11]) {
        LODWORD(v33) = 0;
      }
LABEL_74:
      uint64_t v54 = 56;
LABEL_75:
      *(_DWORD *)((char *)&v5->super.super.isa + v54) = v33;
    }
    while (*(void *)&v4[*v9] < *(void *)&v4[*v10]);
  }
  uint64_t v55 = objc_msgSend(v70, "copy", v68);
  contextStrings = v5->_contextStrings;
  v5->_contextStrings = (NSArray *)v55;

  uint64_t v57 = [v69 copy];
  associatedLocations = v5->_associatedLocations;
  v5->_associatedLocations = (NSArray *)v57;

  uint64_t v59 = [v6 copy];
  associatedContacts = v5->_associatedContacts;
  v5->_associatedContacts = (NSArray *)v59;

  uint64_t v61 = [v7 copy];
  associatedTime = v5->_associatedTime;
  v5->_associatedTime = (NSArray *)v61;

  uint64_t v63 = [v8 copy];
  associatedMusic = v5->_associatedMusic;
  v5->_associatedMusic = (NSArray *)v63;

  int v65 = v4[*v11];
  if (v65) {
LABEL_80:
  }
    uint64_t v66 = 0;
  else {
LABEL_81:
  }
    uint64_t v66 = v5;

  return v66;
}

- (NSString)description
{
  id v14 = [NSString alloc];
  char v13 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self contextIdentifier];
  v3 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self contextStrings];
  id v4 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self contextCreationTimestamp];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContext associatedPatternType](self, "associatedPatternType"));
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContext metadataContentBitmap](self, "metadataContentBitmap"));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContext actionType](self, "actionType"));
  uint64_t v8 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self associatedLocations];
  uint64_t v9 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self associatedContacts];
  int v10 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self associatedTime];
  long long v11 = [(BMPersonalizedSensingMomentsContextMomentsContext *)self associatedMusic];
  id v15 = (id)[v14 initWithFormat:@"BMPersonalizedSensingMomentsContextMomentsContext with contextIdentifier: %@, contextStrings: %@, contextCreationTimestamp: %@, associatedPatternType: %@, metadataContentBitmap: %@, actionType: %@, associatedLocations: %@, associatedContacts: %@, associatedTime: %@, associatedMusic: %@", v13, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v15;
}

- (BMPersonalizedSensingMomentsContextMomentsContext)initWithContextIdentifier:(id)a3 contextStrings:(id)a4 contextCreationTimestamp:(id)a5 associatedPatternType:(id)a6 metadataContentBitmap:(id)a7 actionType:(id)a8 associatedLocations:(id)a9 associatedContacts:(id)a10 associatedTime:(id)a11 associatedMusic:(id)a12
{
  id v17 = a3;
  obuint64_t j = a4;
  id v41 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v35 = a9;
  id v40 = a9;
  id v36 = a10;
  id v22 = a10;
  id v37 = a11;
  id v23 = a11;
  id v38 = a12;
  uint64_t v24 = v17;
  id v25 = a12;
  v42.receiver = self;
  v42.super_class = (Class)BMPersonalizedSensingMomentsContextMomentsContext;
  uint64_t v26 = [(BMEventBase *)&v42 init];
  if (v26)
  {
    v26->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v24)
    {
      uint64_t v27 = objc_msgSend(v24, "UUIDString", obj, a9, a10, a11, a12);
      raw_contextIdentifier = v26->_raw_contextIdentifier;
      v26->_raw_contextIdentifier = (NSString *)v27;
    }
    else
    {
      raw_contextIdentifier = v26->_raw_contextIdentifier;
      v26->_raw_contextIdentifier = 0;
    }

    objc_storeStrong((id *)&v26->_contextStrings, obj);
    if (v18)
    {
      v26->_hasRaw_contextCreationTimestamp = 1;
      [v18 timeIntervalSince1970];
    }
    else
    {
      v26->_hasRaw_contextCreationTimestamp = 0;
      double v29 = -1.0;
    }
    v26->_raw_contextCreationTimestamp = v29;
    if (v19)
    {
      v26->_hasAssociatedPatternType = 1;
      unsigned int v30 = [v19 unsignedIntValue];
    }
    else
    {
      unsigned int v30 = 0;
      v26->_hasAssociatedPatternType = 0;
    }
    v26->_associatedPatternType = v30;
    if (v20)
    {
      v26->_hasMetadataContentBitmap = 1;
      unsigned int v31 = [v20 unsignedIntValue];
    }
    else
    {
      unsigned int v31 = 0;
      v26->_hasMetadataContentBitmap = 0;
    }
    v26->_metadataContentBitmap = v31;
    if (v21)
    {
      v26->_hasActionType = 1;
      unsigned int v32 = [v21 unsignedIntValue];
    }
    else
    {
      unsigned int v32 = 0;
      v26->_hasActionType = 0;
    }
    v26->_actionType = v32;
    objc_storeStrong((id *)&v26->_associatedLocations, v35);
    objc_storeStrong((id *)&v26->_associatedContacts, v36);
    objc_storeStrong((id *)&v26->_associatedTime, v37);
    objc_storeStrong((id *)&v26->_associatedMusic, v38);
  }

  return v26;
}

+ (id)protoFields
{
  v14[10] = *MEMORY[0x1E4F143B8];
  char v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contextIdentifier" number:1 type:13 subMessageClass:0];
  v14[0] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contextStrings" number:2 type:14 subMessageClass:objc_opt_class()];
  v14[1] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contextCreationTimestamp" number:3 type:0 subMessageClass:0];
  v14[2] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"associatedPatternType" number:4 type:4 subMessageClass:0];
  v14[3] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"metadataContentBitmap" number:5 type:4 subMessageClass:0];
  v14[4] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"actionType" number:6 type:4 subMessageClass:0];
  v14[5] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"associatedLocations" number:7 type:14 subMessageClass:objc_opt_class()];
  v14[6] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"associatedContacts" number:8 type:14 subMessageClass:objc_opt_class()];
  v14[7] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"associatedTime" number:9 type:14 subMessageClass:objc_opt_class()];
  v14[8] = v9;
  int v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"associatedMusic" number:10 type:14 subMessageClass:objc_opt_class()];
  v14[9] = v10;
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6D80;
}

+ (id)columns
{
  v14[10] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contextIdentifier" dataType:6 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:3];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"contextStrings_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_422];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contextCreationTimestamp" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:2];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"associatedPatternType" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"metadataContentBitmap" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"actionType" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"associatedLocations_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_424];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"associatedContacts_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_426];
  int v10 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"associatedTime_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_428];
  long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"associatedMusic_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_430];
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

id __60__BMPersonalizedSensingMomentsContextMomentsContext_columns__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 _associatedMusicJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __60__BMPersonalizedSensingMomentsContextMomentsContext_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 _associatedTimeJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __60__BMPersonalizedSensingMomentsContextMomentsContext_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 _associatedContactsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __60__BMPersonalizedSensingMomentsContextMomentsContext_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 _associatedLocationsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __60__BMPersonalizedSensingMomentsContextMomentsContext_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 _contextStringsJSONArray];
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

    uint64_t v8 = [[BMPersonalizedSensingMomentsContextMomentsContext alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[11] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end