@interface INHomeAutomationEntityProvider
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INHomeAutomationEntityProvider)initWithCoder:(id)a3;
- (INHomeAutomationEntityProvider)initWithRoomNames:(id)a3 homeName:(id)a4 zoneNames:(id)a5 accessoryNames:(id)a6 serviceNames:(id)a7 serviceGroups:(id)a8 intentFromEntities:(id)a9 intentDeviceQuantifier:(id)a10 destinationDeviceId:(id)a11 intentDeviceType:(id)a12 intentPlaceHint:(id)a13 intentReference:(id)a14;
- (NSArray)accessoryNames;
- (NSArray)intentFromEntities;
- (NSArray)roomNames;
- (NSArray)serviceGroups;
- (NSArray)serviceNames;
- (NSArray)zoneNames;
- (NSString)description;
- (NSString)destinationDeviceId;
- (NSString)homeName;
- (NSString)intentDeviceQuantifier;
- (NSString)intentDeviceType;
- (NSString)intentPlaceHint;
- (NSString)intentReference;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INHomeAutomationEntityProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentReference, 0);
  objc_storeStrong((id *)&self->_intentPlaceHint, 0);
  objc_storeStrong((id *)&self->_intentDeviceType, 0);
  objc_storeStrong((id *)&self->_destinationDeviceId, 0);
  objc_storeStrong((id *)&self->_intentDeviceQuantifier, 0);
  objc_storeStrong((id *)&self->_intentFromEntities, 0);
  objc_storeStrong((id *)&self->_serviceGroups, 0);
  objc_storeStrong((id *)&self->_serviceNames, 0);
  objc_storeStrong((id *)&self->_accessoryNames, 0);
  objc_storeStrong((id *)&self->_zoneNames, 0);
  objc_storeStrong((id *)&self->_homeName, 0);

  objc_storeStrong((id *)&self->_roomNames, 0);
}

- (NSString)intentReference
{
  return self->_intentReference;
}

- (NSString)intentPlaceHint
{
  return self->_intentPlaceHint;
}

- (NSString)intentDeviceType
{
  return self->_intentDeviceType;
}

- (NSString)destinationDeviceId
{
  return self->_destinationDeviceId;
}

- (NSString)intentDeviceQuantifier
{
  return self->_intentDeviceQuantifier;
}

- (NSArray)intentFromEntities
{
  return self->_intentFromEntities;
}

- (NSArray)serviceGroups
{
  return self->_serviceGroups;
}

- (NSArray)serviceNames
{
  return self->_serviceNames;
}

- (NSArray)accessoryNames
{
  return self->_accessoryNames;
}

- (NSArray)zoneNames
{
  return self->_zoneNames;
}

- (NSString)homeName
{
  return self->_homeName;
}

- (NSArray)roomNames
{
  return self->_roomNames;
}

- (id)_dictionaryRepresentation
{
  v39[12] = *MEMORY[0x1E4F143B8];
  roomNames = self->_roomNames;
  uint64_t v3 = (uint64_t)roomNames;
  v38[0] = @"roomNames";
  if (!roomNames)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v39[0] = v3;
  v38[1] = @"homeName";
  uint64_t homeName = (uint64_t)self->_homeName;
  uint64_t v35 = homeName;
  if (!homeName)
  {
    uint64_t homeName = [MEMORY[0x1E4F1CA98] null];
  }
  v39[1] = homeName;
  v38[2] = @"zoneNames";
  uint64_t zoneNames = (uint64_t)self->_zoneNames;
  uint64_t v33 = zoneNames;
  if (!zoneNames)
  {
    uint64_t zoneNames = [MEMORY[0x1E4F1CA98] null];
  }
  v39[2] = zoneNames;
  v38[3] = @"accessoryNames";
  uint64_t accessoryNames = (uint64_t)self->_accessoryNames;
  uint64_t v32 = accessoryNames;
  if (!accessoryNames)
  {
    uint64_t accessoryNames = [MEMORY[0x1E4F1CA98] null];
  }
  v39[3] = accessoryNames;
  v38[4] = @"serviceNames";
  uint64_t serviceNames = (uint64_t)self->_serviceNames;
  uint64_t v31 = serviceNames;
  if (!serviceNames)
  {
    uint64_t serviceNames = [MEMORY[0x1E4F1CA98] null];
  }
  v39[4] = serviceNames;
  v38[5] = @"serviceGroups";
  uint64_t serviceGroups = (uint64_t)self->_serviceGroups;
  uint64_t v30 = serviceGroups;
  if (!serviceGroups)
  {
    uint64_t serviceGroups = [MEMORY[0x1E4F1CA98] null];
  }
  v39[5] = serviceGroups;
  v38[6] = @"intentFromEntities";
  intentFromEntities = self->_intentFromEntities;
  uint64_t v10 = (uint64_t)intentFromEntities;
  if (!intentFromEntities)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v10;
  v39[6] = v10;
  v38[7] = @"intentDeviceQuantifier";
  intentDeviceQuantifier = self->_intentDeviceQuantifier;
  uint64_t v12 = (uint64_t)intentDeviceQuantifier;
  if (!intentDeviceQuantifier)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v36 = (void *)v3;
  v24 = (void *)v12;
  v39[7] = v12;
  v38[8] = @"destinationDeviceId";
  destinationDeviceId = self->_destinationDeviceId;
  uint64_t v14 = (uint64_t)destinationDeviceId;
  if (!destinationDeviceId)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)serviceGroups;
  v27 = (void *)serviceNames;
  v28 = (void *)accessoryNames;
  v34 = (void *)homeName;
  v23 = (void *)v14;
  v39[8] = v14;
  v38[9] = @"intentDeviceType";
  intentDeviceType = self->_intentDeviceType;
  v16 = intentDeviceType;
  if (!intentDeviceType)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v17 = (void *)zoneNames;
  v39[9] = v16;
  v38[10] = @"intentPlaceHint";
  intentPlaceHint = self->_intentPlaceHint;
  v19 = intentPlaceHint;
  if (!intentPlaceHint)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v39[10] = v19;
  v38[11] = @"intentReference";
  intentReference = self->_intentReference;
  v21 = intentReference;
  if (!intentReference)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v39[11] = v21;
  id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:12];
  if (intentReference)
  {
    if (intentPlaceHint) {
      goto LABEL_27;
    }
LABEL_48:

    if (intentDeviceType) {
      goto LABEL_28;
    }
    goto LABEL_49;
  }

  if (!intentPlaceHint) {
    goto LABEL_48;
  }
LABEL_27:
  if (intentDeviceType) {
    goto LABEL_28;
  }
LABEL_49:

LABEL_28:
  if (!destinationDeviceId) {

  }
  if (intentDeviceQuantifier)
  {
    if (intentFromEntities) {
      goto LABEL_32;
    }
  }
  else
  {

    if (intentFromEntities) {
      goto LABEL_32;
    }
  }

LABEL_32:
  if (!v30) {

  }
  if (!v31) {
  if (!v32)
  }

  if (!v33) {
  if (!v35)
  }

  if (!roomNames) {

  }
  return v29;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INHomeAutomationEntityProvider;
  v6 = [(INHomeAutomationEntityProvider *)&v11 description];
  v7 = [(INHomeAutomationEntityProvider *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INHomeAutomationEntityProvider *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_roomNames];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"roomNames");

  v9 = [v6 encodeObject:self->_homeName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"homeName");

  uint64_t v10 = [v6 encodeObject:self->_zoneNames];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"zoneNames");

  objc_super v11 = [v6 encodeObject:self->_accessoryNames];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"accessoryNames");

  uint64_t v12 = [v6 encodeObject:self->_serviceNames];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"serviceNames");

  v13 = [v6 encodeObject:self->_serviceGroups];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"serviceGroups");

  uint64_t v14 = [v6 encodeObject:self->_intentFromEntities];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, @"intentFromEntities");

  v15 = [v6 encodeObject:self->_intentDeviceQuantifier];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, @"intentDeviceQuantifier");

  v16 = [v6 encodeObject:self->_destinationDeviceId];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, @"destinationDeviceId");

  v17 = [v6 encodeObject:self->_intentDeviceType];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v17, @"intentDeviceType");

  v18 = [v6 encodeObject:self->_intentPlaceHint];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v18, @"intentPlaceHint");

  v19 = [v6 encodeObject:self->_intentReference];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v19, @"intentReference");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  roomNames = self->_roomNames;
  id v5 = a3;
  [v5 encodeObject:roomNames forKey:@"roomNames"];
  [v5 encodeObject:self->_homeName forKey:@"homeName"];
  [v5 encodeObject:self->_zoneNames forKey:@"zoneNames"];
  [v5 encodeObject:self->_accessoryNames forKey:@"accessoryNames"];
  [v5 encodeObject:self->_serviceNames forKey:@"serviceNames"];
  [v5 encodeObject:self->_serviceGroups forKey:@"serviceGroups"];
  [v5 encodeObject:self->_intentFromEntities forKey:@"intentFromEntities"];
  [v5 encodeObject:self->_intentDeviceQuantifier forKey:@"intentDeviceQuantifier"];
  [v5 encodeObject:self->_destinationDeviceId forKey:@"destinationDeviceId"];
  [v5 encodeObject:self->_intentDeviceType forKey:@"intentDeviceType"];
  [v5 encodeObject:self->_intentPlaceHint forKey:@"intentPlaceHint"];
  [v5 encodeObject:self->_intentReference forKey:@"intentReference"];
}

- (INHomeAutomationEntityProvider)initWithCoder:(id)a3
{
  v42[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  v42[0] = objc_opt_class();
  v42[1] = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
  id v6 = [v3 setWithArray:v5];
  v7 = [v4 decodeObjectOfClasses:v6 forKey:@"roomNames"];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeName"];
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  v41[0] = objc_opt_class();
  v41[1] = objc_opt_class();
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  objc_super v11 = [v9 setWithArray:v10];
  v36 = [v4 decodeObjectOfClasses:v11 forKey:@"zoneNames"];

  uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
  v40[0] = objc_opt_class();
  v40[1] = objc_opt_class();
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  uint64_t v14 = [v12 setWithArray:v13];
  uint64_t v35 = [v4 decodeObjectOfClasses:v14 forKey:@"accessoryNames"];

  v15 = (void *)MEMORY[0x1E4F1CAD0];
  v39[0] = objc_opt_class();
  v39[1] = objc_opt_class();
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  v17 = [v15 setWithArray:v16];
  v18 = [v4 decodeObjectOfClasses:v17 forKey:@"serviceNames"];

  v19 = (void *)MEMORY[0x1E4F1CAD0];
  v38[0] = objc_opt_class();
  v38[1] = objc_opt_class();
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  v21 = [v19 setWithArray:v20];
  v34 = [v4 decodeObjectOfClasses:v21 forKey:@"serviceGroups"];

  v22 = (void *)MEMORY[0x1E4F1CAD0];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  v24 = [v22 setWithArray:v23];
  uint64_t v31 = [v4 decodeObjectOfClasses:v24 forKey:@"intentFromEntities"];

  uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentDeviceQuantifier"];
  v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destinationDeviceId"];
  v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentDeviceType"];
  v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentPlaceHint"];
  v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentReference"];

  uint64_t v33 = [(INHomeAutomationEntityProvider *)self initWithRoomNames:v7 homeName:v8 zoneNames:v36 accessoryNames:v35 serviceNames:v18 serviceGroups:v34 intentFromEntities:v31 intentDeviceQuantifier:v30 destinationDeviceId:v25 intentDeviceType:v26 intentPlaceHint:v27 intentReference:v28];
  return v33;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INHomeAutomationEntityProvider *)a3;
  if (v4 == self)
  {
    BOOL v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      roomNames = self->_roomNames;
      if (roomNames != v5->_roomNames && !-[NSArray isEqual:](roomNames, "isEqual:")) {
        goto LABEL_30;
      }
      uint64_t homeName = self->_homeName;
      if (homeName != v5->_homeName && !-[NSString isEqual:](homeName, "isEqual:")) {
        goto LABEL_30;
      }
      uint64_t zoneNames = self->_zoneNames;
      if (zoneNames != v5->_zoneNames && !-[NSArray isEqual:](zoneNames, "isEqual:")) {
        goto LABEL_30;
      }
      uint64_t accessoryNames = self->_accessoryNames;
      if (accessoryNames != v5->_accessoryNames && !-[NSArray isEqual:](accessoryNames, "isEqual:")) {
        goto LABEL_30;
      }
      uint64_t serviceNames = self->_serviceNames;
      if (serviceNames != v5->_serviceNames && !-[NSArray isEqual:](serviceNames, "isEqual:")) {
        goto LABEL_30;
      }
      if (((uint64_t serviceGroups = self->_serviceGroups, serviceGroups == v5->_serviceGroups)
         || -[NSArray isEqual:](serviceGroups, "isEqual:"))
        && ((intentFromEntities = self->_intentFromEntities, intentFromEntities == v5->_intentFromEntities)
         || -[NSArray isEqual:](intentFromEntities, "isEqual:"))
        && ((intentDeviceQuantifier = self->_intentDeviceQuantifier,
             intentDeviceQuantifier == v5->_intentDeviceQuantifier)
         || -[NSString isEqual:](intentDeviceQuantifier, "isEqual:"))
        && ((destinationDeviceId = self->_destinationDeviceId, destinationDeviceId == v5->_destinationDeviceId)
         || -[NSString isEqual:](destinationDeviceId, "isEqual:"))
        && ((intentDeviceType = self->_intentDeviceType, intentDeviceType == v5->_intentDeviceType)
         || -[NSString isEqual:](intentDeviceType, "isEqual:"))
        && ((intentPlaceHint = self->_intentPlaceHint, intentPlaceHint == v5->_intentPlaceHint)
         || -[NSString isEqual:](intentPlaceHint, "isEqual:"))
        && ((intentReference = self->_intentReference, intentReference == v5->_intentReference)
         || -[NSString isEqual:](intentReference, "isEqual:")))
      {
        BOOL v18 = 1;
      }
      else
      {
LABEL_30:
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_roomNames hash];
  NSUInteger v4 = [(NSString *)self->_homeName hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_zoneNames hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_accessoryNames hash];
  uint64_t v7 = [(NSArray *)self->_serviceNames hash];
  uint64_t v8 = v7 ^ [(NSArray *)self->_serviceGroups hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSArray *)self->_intentFromEntities hash];
  NSUInteger v10 = [(NSString *)self->_intentDeviceQuantifier hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_destinationDeviceId hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_intentDeviceType hash];
  NSUInteger v13 = v9 ^ v12 ^ [(NSString *)self->_intentPlaceHint hash];
  return v13 ^ [(NSString *)self->_intentReference hash];
}

- (INHomeAutomationEntityProvider)initWithRoomNames:(id)a3 homeName:(id)a4 zoneNames:(id)a5 accessoryNames:(id)a6 serviceNames:(id)a7 serviceGroups:(id)a8 intentFromEntities:(id)a9 intentDeviceQuantifier:(id)a10 destinationDeviceId:(id)a11 intentDeviceType:(id)a12 intentPlaceHint:(id)a13 intentReference:(id)a14
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v58 = a6;
  id v57 = a7;
  id v56 = a8;
  v22 = v20;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = a12;
  id v27 = a13;
  id v28 = a14;
  v59.receiver = self;
  v59.super_class = (Class)INHomeAutomationEntityProvider;
  id v29 = [(INHomeAutomationEntityProvider *)&v59 init];
  if (v29)
  {
    uint64_t v30 = [v19 copy];
    roomNames = v29->_roomNames;
    v29->_roomNames = (NSArray *)v30;

    uint64_t v32 = [v22 copy];
    uint64_t homeName = v29->_homeName;
    v29->_uint64_t homeName = (NSString *)v32;

    uint64_t v34 = [v21 copy];
    uint64_t zoneNames = v29->_zoneNames;
    v29->_uint64_t zoneNames = (NSArray *)v34;

    uint64_t v36 = [v58 copy];
    uint64_t accessoryNames = v29->_accessoryNames;
    v29->_uint64_t accessoryNames = (NSArray *)v36;

    uint64_t v38 = [v57 copy];
    uint64_t serviceNames = v29->_serviceNames;
    v29->_uint64_t serviceNames = (NSArray *)v38;

    uint64_t v40 = [v56 copy];
    uint64_t serviceGroups = v29->_serviceGroups;
    v29->_uint64_t serviceGroups = (NSArray *)v40;

    uint64_t v42 = [v23 copy];
    intentFromEntities = v29->_intentFromEntities;
    v29->_intentFromEntities = (NSArray *)v42;

    uint64_t v44 = [v24 copy];
    intentDeviceQuantifier = v29->_intentDeviceQuantifier;
    v29->_intentDeviceQuantifier = (NSString *)v44;

    uint64_t v46 = [v25 copy];
    destinationDeviceId = v29->_destinationDeviceId;
    v29->_destinationDeviceId = (NSString *)v46;

    uint64_t v48 = [v26 copy];
    intentDeviceType = v29->_intentDeviceType;
    v29->_intentDeviceType = (NSString *)v48;

    uint64_t v50 = [v27 copy];
    intentPlaceHint = v29->_intentPlaceHint;
    v29->_intentPlaceHint = (NSString *)v50;

    uint64_t v52 = [v28 copy];
    intentReference = v29->_intentReference;
    v29->_intentReference = (NSString *)v52;
  }
  return v29;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v43 = (objc_class *)a1;
    uint64_t v9 = objc_opt_class();
    NSUInteger v10 = [v8 objectForKeyedSubscript:@"roomNames"];
    v47 = [v7 decodeObjectsOfClass:v9 from:v10];

    uint64_t v11 = objc_opt_class();
    NSUInteger v12 = [v8 objectForKeyedSubscript:@"homeName"];
    uint64_t v46 = [v7 decodeObjectOfClass:v11 from:v12];

    uint64_t v13 = objc_opt_class();
    uint64_t v14 = [v8 objectForKeyedSubscript:@"zoneNames"];
    v45 = [v7 decodeObjectsOfClass:v13 from:v14];

    uint64_t v15 = objc_opt_class();
    v16 = [v8 objectForKeyedSubscript:@"accessoryNames"];
    uint64_t v44 = [v7 decodeObjectsOfClass:v15 from:v16];

    uint64_t v17 = objc_opt_class();
    BOOL v18 = [v8 objectForKeyedSubscript:@"serviceNames"];
    v41 = [v7 decodeObjectsOfClass:v17 from:v18];

    uint64_t v19 = objc_opt_class();
    id v20 = [v8 objectForKeyedSubscript:@"serviceGroups"];
    uint64_t v42 = [v7 decodeObjectsOfClass:v19 from:v20];

    uint64_t v21 = objc_opt_class();
    v22 = [v8 objectForKeyedSubscript:@"intentFromEntities"];
    id v23 = [v7 decodeObjectsOfClass:v21 from:v22];

    uint64_t v24 = objc_opt_class();
    id v25 = [v8 objectForKeyedSubscript:@"intentDeviceQuantifier"];
    uint64_t v40 = [v7 decodeObjectOfClass:v24 from:v25];

    uint64_t v26 = objc_opt_class();
    id v27 = [v8 objectForKeyedSubscript:@"destinationDeviceId"];
    id v28 = [v7 decodeObjectOfClass:v26 from:v27];

    uint64_t v29 = objc_opt_class();
    uint64_t v30 = [v8 objectForKeyedSubscript:@"intentDeviceType"];
    v39 = [v7 decodeObjectOfClass:v29 from:v30];

    uint64_t v31 = objc_opt_class();
    uint64_t v32 = [v8 objectForKeyedSubscript:@"intentPlaceHint"];
    uint64_t v33 = [v7 decodeObjectOfClass:v31 from:v32];

    uint64_t v34 = objc_opt_class();
    uint64_t v35 = [v8 objectForKeyedSubscript:@"intentReference"];
    uint64_t v36 = [v7 decodeObjectOfClass:v34 from:v35];

    v37 = (void *)[[v43 alloc] initWithRoomNames:v47 homeName:v46 zoneNames:v45 accessoryNames:v44 serviceNames:v41 serviceGroups:v42 intentFromEntities:v23 intentDeviceQuantifier:v40 destinationDeviceId:v28 intentDeviceType:v39 intentPlaceHint:v33 intentReference:v36];
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end