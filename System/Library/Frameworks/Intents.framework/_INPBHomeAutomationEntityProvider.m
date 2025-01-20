@interface _INPBHomeAutomationEntityProvider
+ (BOOL)supportsSecureCoding;
+ (Class)accessoryNamesType;
+ (Class)intentFromEntitiesType;
+ (Class)roomNamesType;
+ (Class)serviceGroupsType;
+ (Class)serviceNamesType;
+ (Class)zoneNamesType;
- (BOOL)hasDestinationDeviceId;
- (BOOL)hasHomeName;
- (BOOL)hasIntentDeviceQuantifier;
- (BOOL)hasIntentDeviceType;
- (BOOL)hasIntentPlaceHint;
- (BOOL)hasIntentReference;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)accessoryNames;
- (NSArray)intentFromEntities;
- (NSArray)roomNames;
- (NSArray)serviceGroups;
- (NSArray)serviceNames;
- (NSArray)zoneNames;
- (_INPBHomeAutomationEntityProvider)initWithCoder:(id)a3;
- (_INPBString)destinationDeviceId;
- (_INPBString)homeName;
- (_INPBString)intentDeviceQuantifier;
- (_INPBString)intentDeviceType;
- (_INPBString)intentPlaceHint;
- (_INPBString)intentReference;
- (id)accessoryNamesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)intentFromEntitiesAtIndex:(unint64_t)a3;
- (id)roomNamesAtIndex:(unint64_t)a3;
- (id)serviceGroupsAtIndex:(unint64_t)a3;
- (id)serviceNamesAtIndex:(unint64_t)a3;
- (id)zoneNamesAtIndex:(unint64_t)a3;
- (unint64_t)accessoryNamesCount;
- (unint64_t)hash;
- (unint64_t)intentFromEntitiesCount;
- (unint64_t)roomNamesCount;
- (unint64_t)serviceGroupsCount;
- (unint64_t)serviceNamesCount;
- (unint64_t)zoneNamesCount;
- (void)addAccessoryNames:(id)a3;
- (void)addIntentFromEntities:(id)a3;
- (void)addRoomNames:(id)a3;
- (void)addServiceGroups:(id)a3;
- (void)addServiceNames:(id)a3;
- (void)addZoneNames:(id)a3;
- (void)clearAccessoryNames;
- (void)clearIntentFromEntities;
- (void)clearRoomNames;
- (void)clearServiceGroups;
- (void)clearServiceNames;
- (void)clearZoneNames;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryNames:(id)a3;
- (void)setDestinationDeviceId:(id)a3;
- (void)setHomeName:(id)a3;
- (void)setIntentDeviceQuantifier:(id)a3;
- (void)setIntentDeviceType:(id)a3;
- (void)setIntentFromEntities:(id)a3;
- (void)setIntentPlaceHint:(id)a3;
- (void)setIntentReference:(id)a3;
- (void)setRoomNames:(id)a3;
- (void)setServiceGroups:(id)a3;
- (void)setServiceNames:(id)a3;
- (void)setZoneNames:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBHomeAutomationEntityProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneNames, 0);
  objc_storeStrong((id *)&self->_serviceNames, 0);
  objc_storeStrong((id *)&self->_serviceGroups, 0);
  objc_storeStrong((id *)&self->_roomNames, 0);
  objc_storeStrong((id *)&self->_intentReference, 0);
  objc_storeStrong((id *)&self->_intentPlaceHint, 0);
  objc_storeStrong((id *)&self->_intentFromEntities, 0);
  objc_storeStrong((id *)&self->_intentDeviceType, 0);
  objc_storeStrong((id *)&self->_intentDeviceQuantifier, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_destinationDeviceId, 0);

  objc_storeStrong((id *)&self->_accessoryNames, 0);
}

- (NSArray)zoneNames
{
  return self->_zoneNames;
}

- (NSArray)serviceNames
{
  return self->_serviceNames;
}

- (NSArray)serviceGroups
{
  return self->_serviceGroups;
}

- (NSArray)roomNames
{
  return self->_roomNames;
}

- (_INPBString)intentReference
{
  return self->_intentReference;
}

- (_INPBString)intentPlaceHint
{
  return self->_intentPlaceHint;
}

- (NSArray)intentFromEntities
{
  return self->_intentFromEntities;
}

- (_INPBString)intentDeviceType
{
  return self->_intentDeviceType;
}

- (_INPBString)intentDeviceQuantifier
{
  return self->_intentDeviceQuantifier;
}

- (_INPBString)homeName
{
  return self->_homeName;
}

- (_INPBString)destinationDeviceId
{
  return self->_destinationDeviceId;
}

- (NSArray)accessoryNames
{
  return self->_accessoryNames;
}

- (id)dictionaryRepresentation
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_accessoryNames count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v5 = self->_accessoryNames;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v79 objects:v88 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v80 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v79 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v79 objects:v88 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"accessoryNames"];
  }
  v11 = [(_INPBHomeAutomationEntityProvider *)self destinationDeviceId];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"destinationDeviceId"];

  v13 = [(_INPBHomeAutomationEntityProvider *)self homeName];
  v14 = [v13 dictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:@"homeName"];

  v15 = [(_INPBHomeAutomationEntityProvider *)self intentDeviceQuantifier];
  v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"intentDeviceQuantifier"];

  v17 = [(_INPBHomeAutomationEntityProvider *)self intentDeviceType];
  v18 = [v17 dictionaryRepresentation];
  [v3 setObject:v18 forKeyedSubscript:@"intentDeviceType"];

  if ([(NSArray *)self->_intentFromEntities count])
  {
    v19 = [MEMORY[0x1E4F1CA48] array];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v20 = self->_intentFromEntities;
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v75 objects:v87 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v76;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v76 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v75 + 1) + 8 * j) dictionaryRepresentation];
          [v19 addObject:v25];
        }
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v75 objects:v87 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKeyedSubscript:@"intentFromEntities"];
  }
  v26 = [(_INPBHomeAutomationEntityProvider *)self intentPlaceHint];
  v27 = [v26 dictionaryRepresentation];
  [v3 setObject:v27 forKeyedSubscript:@"intentPlaceHint"];

  v28 = [(_INPBHomeAutomationEntityProvider *)self intentReference];
  v29 = [v28 dictionaryRepresentation];
  [v3 setObject:v29 forKeyedSubscript:@"intentReference"];

  if ([(NSArray *)self->_roomNames count])
  {
    v30 = [MEMORY[0x1E4F1CA48] array];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v31 = self->_roomNames;
    uint64_t v32 = [(NSArray *)v31 countByEnumeratingWithState:&v71 objects:v86 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v72;
      do
      {
        for (uint64_t k = 0; k != v33; ++k)
        {
          if (*(void *)v72 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = [*(id *)(*((void *)&v71 + 1) + 8 * k) dictionaryRepresentation];
          [v30 addObject:v36];
        }
        uint64_t v33 = [(NSArray *)v31 countByEnumeratingWithState:&v71 objects:v86 count:16];
      }
      while (v33);
    }

    [v3 setObject:v30 forKeyedSubscript:@"roomNames"];
  }
  if ([(NSArray *)self->_serviceGroups count])
  {
    v37 = [MEMORY[0x1E4F1CA48] array];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v38 = self->_serviceGroups;
    uint64_t v39 = [(NSArray *)v38 countByEnumeratingWithState:&v67 objects:v85 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v68;
      do
      {
        for (uint64_t m = 0; m != v40; ++m)
        {
          if (*(void *)v68 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = [*(id *)(*((void *)&v67 + 1) + 8 * m) dictionaryRepresentation];
          [v37 addObject:v43];
        }
        uint64_t v40 = [(NSArray *)v38 countByEnumeratingWithState:&v67 objects:v85 count:16];
      }
      while (v40);
    }

    [v3 setObject:v37 forKeyedSubscript:@"serviceGroups"];
  }
  if ([(NSArray *)self->_serviceNames count])
  {
    v44 = [MEMORY[0x1E4F1CA48] array];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v45 = self->_serviceNames;
    uint64_t v46 = [(NSArray *)v45 countByEnumeratingWithState:&v63 objects:v84 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v64;
      do
      {
        for (uint64_t n = 0; n != v47; ++n)
        {
          if (*(void *)v64 != v48) {
            objc_enumerationMutation(v45);
          }
          v50 = [*(id *)(*((void *)&v63 + 1) + 8 * n) dictionaryRepresentation];
          [v44 addObject:v50];
        }
        uint64_t v47 = [(NSArray *)v45 countByEnumeratingWithState:&v63 objects:v84 count:16];
      }
      while (v47);
    }

    [v3 setObject:v44 forKeyedSubscript:@"serviceNames"];
  }
  if ([(NSArray *)self->_zoneNames count])
  {
    v51 = [MEMORY[0x1E4F1CA48] array];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    v52 = self->_zoneNames;
    uint64_t v53 = [(NSArray *)v52 countByEnumeratingWithState:&v59 objects:v83 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v60;
      do
      {
        for (iuint64_t i = 0; ii != v54; ++ii)
        {
          if (*(void *)v60 != v55) {
            objc_enumerationMutation(v52);
          }
          v57 = objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * ii), "dictionaryRepresentation", (void)v59);
          [v51 addObject:v57];
        }
        uint64_t v54 = [(NSArray *)v52 countByEnumeratingWithState:&v59 objects:v83 count:16];
      }
      while (v54);
    }

    [v3 setObject:v51 forKeyedSubscript:@"zoneNames"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_accessoryNames hash];
  unint64_t v4 = [(_INPBString *)self->_destinationDeviceId hash] ^ v3;
  unint64_t v5 = [(_INPBString *)self->_homeName hash];
  unint64_t v6 = v4 ^ v5 ^ [(_INPBString *)self->_intentDeviceQuantifier hash];
  unint64_t v7 = [(_INPBString *)self->_intentDeviceType hash];
  uint64_t v8 = v7 ^ [(NSArray *)self->_intentFromEntities hash];
  unint64_t v9 = v6 ^ v8 ^ [(_INPBString *)self->_intentPlaceHint hash];
  unint64_t v10 = [(_INPBString *)self->_intentReference hash];
  uint64_t v11 = v10 ^ [(NSArray *)self->_roomNames hash];
  uint64_t v12 = v11 ^ [(NSArray *)self->_serviceGroups hash];
  uint64_t v13 = v9 ^ v12 ^ [(NSArray *)self->_serviceNames hash];
  return v13 ^ [(NSArray *)self->_zoneNames hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_62;
  }
  unint64_t v5 = [(_INPBHomeAutomationEntityProvider *)self accessoryNames];
  unint64_t v6 = [v4 accessoryNames];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v7 = [(_INPBHomeAutomationEntityProvider *)self accessoryNames];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    unint64_t v9 = [(_INPBHomeAutomationEntityProvider *)self accessoryNames];
    unint64_t v10 = [v4 accessoryNames];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBHomeAutomationEntityProvider *)self destinationDeviceId];
  unint64_t v6 = [v4 destinationDeviceId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v12 = [(_INPBHomeAutomationEntityProvider *)self destinationDeviceId];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(_INPBHomeAutomationEntityProvider *)self destinationDeviceId];
    v15 = [v4 destinationDeviceId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBHomeAutomationEntityProvider *)self homeName];
  unint64_t v6 = [v4 homeName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v17 = [(_INPBHomeAutomationEntityProvider *)self homeName];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBHomeAutomationEntityProvider *)self homeName];
    v20 = [v4 homeName];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBHomeAutomationEntityProvider *)self intentDeviceQuantifier];
  unint64_t v6 = [v4 intentDeviceQuantifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v22 = [(_INPBHomeAutomationEntityProvider *)self intentDeviceQuantifier];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    v24 = [(_INPBHomeAutomationEntityProvider *)self intentDeviceQuantifier];
    v25 = [v4 intentDeviceQuantifier];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBHomeAutomationEntityProvider *)self intentDeviceType];
  unint64_t v6 = [v4 intentDeviceType];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v27 = [(_INPBHomeAutomationEntityProvider *)self intentDeviceType];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBHomeAutomationEntityProvider *)self intentDeviceType];
    v30 = [v4 intentDeviceType];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBHomeAutomationEntityProvider *)self intentFromEntities];
  unint64_t v6 = [v4 intentFromEntities];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v32 = [(_INPBHomeAutomationEntityProvider *)self intentFromEntities];
  if (v32)
  {
    uint64_t v33 = (void *)v32;
    uint64_t v34 = [(_INPBHomeAutomationEntityProvider *)self intentFromEntities];
    v35 = [v4 intentFromEntities];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBHomeAutomationEntityProvider *)self intentPlaceHint];
  unint64_t v6 = [v4 intentPlaceHint];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v37 = [(_INPBHomeAutomationEntityProvider *)self intentPlaceHint];
  if (v37)
  {
    v38 = (void *)v37;
    uint64_t v39 = [(_INPBHomeAutomationEntityProvider *)self intentPlaceHint];
    uint64_t v40 = [v4 intentPlaceHint];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBHomeAutomationEntityProvider *)self intentReference];
  unint64_t v6 = [v4 intentReference];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v42 = [(_INPBHomeAutomationEntityProvider *)self intentReference];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(_INPBHomeAutomationEntityProvider *)self intentReference];
    v45 = [v4 intentReference];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBHomeAutomationEntityProvider *)self roomNames];
  unint64_t v6 = [v4 roomNames];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v47 = [(_INPBHomeAutomationEntityProvider *)self roomNames];
  if (v47)
  {
    uint64_t v48 = (void *)v47;
    v49 = [(_INPBHomeAutomationEntityProvider *)self roomNames];
    v50 = [v4 roomNames];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBHomeAutomationEntityProvider *)self serviceGroups];
  unint64_t v6 = [v4 serviceGroups];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v52 = [(_INPBHomeAutomationEntityProvider *)self serviceGroups];
  if (v52)
  {
    uint64_t v53 = (void *)v52;
    uint64_t v54 = [(_INPBHomeAutomationEntityProvider *)self serviceGroups];
    uint64_t v55 = [v4 serviceGroups];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBHomeAutomationEntityProvider *)self serviceNames];
  unint64_t v6 = [v4 serviceNames];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v57 = [(_INPBHomeAutomationEntityProvider *)self serviceNames];
  if (v57)
  {
    v58 = (void *)v57;
    long long v59 = [(_INPBHomeAutomationEntityProvider *)self serviceNames];
    long long v60 = [v4 serviceNames];
    int v61 = [v59 isEqual:v60];

    if (!v61) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBHomeAutomationEntityProvider *)self zoneNames];
  unint64_t v6 = [v4 zoneNames];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v62 = [(_INPBHomeAutomationEntityProvider *)self zoneNames];
    if (!v62)
    {

LABEL_65:
      BOOL v67 = 1;
      goto LABEL_63;
    }
    long long v63 = (void *)v62;
    long long v64 = [(_INPBHomeAutomationEntityProvider *)self zoneNames];
    long long v65 = [v4 zoneNames];
    char v66 = [v64 isEqual:v65];

    if (v66) {
      goto LABEL_65;
    }
  }
  else
  {
LABEL_61:
  }
LABEL_62:
  BOOL v67 = 0;
LABEL_63:

  return v67;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBHomeAutomationEntityProvider allocWithZone:](_INPBHomeAutomationEntityProvider, "allocWithZone:") init];
  unint64_t v6 = (void *)[(NSArray *)self->_accessoryNames copyWithZone:a3];
  [(_INPBHomeAutomationEntityProvider *)v5 setAccessoryNames:v6];

  id v7 = [(_INPBString *)self->_destinationDeviceId copyWithZone:a3];
  [(_INPBHomeAutomationEntityProvider *)v5 setDestinationDeviceId:v7];

  id v8 = [(_INPBString *)self->_homeName copyWithZone:a3];
  [(_INPBHomeAutomationEntityProvider *)v5 setHomeName:v8];

  id v9 = [(_INPBString *)self->_intentDeviceQuantifier copyWithZone:a3];
  [(_INPBHomeAutomationEntityProvider *)v5 setIntentDeviceQuantifier:v9];

  id v10 = [(_INPBString *)self->_intentDeviceType copyWithZone:a3];
  [(_INPBHomeAutomationEntityProvider *)v5 setIntentDeviceType:v10];

  int v11 = (void *)[(NSArray *)self->_intentFromEntities copyWithZone:a3];
  [(_INPBHomeAutomationEntityProvider *)v5 setIntentFromEntities:v11];

  id v12 = [(_INPBString *)self->_intentPlaceHint copyWithZone:a3];
  [(_INPBHomeAutomationEntityProvider *)v5 setIntentPlaceHint:v12];

  id v13 = [(_INPBString *)self->_intentReference copyWithZone:a3];
  [(_INPBHomeAutomationEntityProvider *)v5 setIntentReference:v13];

  v14 = (void *)[(NSArray *)self->_roomNames copyWithZone:a3];
  [(_INPBHomeAutomationEntityProvider *)v5 setRoomNames:v14];

  v15 = (void *)[(NSArray *)self->_serviceGroups copyWithZone:a3];
  [(_INPBHomeAutomationEntityProvider *)v5 setServiceGroups:v15];

  int v16 = (void *)[(NSArray *)self->_serviceNames copyWithZone:a3];
  [(_INPBHomeAutomationEntityProvider *)v5 setServiceNames:v16];

  uint64_t v17 = (void *)[(NSArray *)self->_zoneNames copyWithZone:a3];
  [(_INPBHomeAutomationEntityProvider *)v5 setZoneNames:v17];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBHomeAutomationEntityProvider *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBHomeAutomationEntityProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBHomeAutomationEntityProvider *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBHomeAutomationEntityProvider *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBHomeAutomationEntityProvider *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  unint64_t v5 = self->_accessoryNames;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v68;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v68 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v67 objects:v76 count:16];
    }
    while (v7);
  }

  id v10 = [(_INPBHomeAutomationEntityProvider *)self destinationDeviceId];

  if (v10)
  {
    int v11 = [(_INPBHomeAutomationEntityProvider *)self destinationDeviceId];
    PBDataWriterWriteSubmessage();
  }
  id v12 = [(_INPBHomeAutomationEntityProvider *)self homeName];

  if (v12)
  {
    id v13 = [(_INPBHomeAutomationEntityProvider *)self homeName];
    PBDataWriterWriteSubmessage();
  }
  v14 = [(_INPBHomeAutomationEntityProvider *)self intentDeviceQuantifier];

  if (v14)
  {
    v15 = [(_INPBHomeAutomationEntityProvider *)self intentDeviceQuantifier];
    PBDataWriterWriteSubmessage();
  }
  int v16 = [(_INPBHomeAutomationEntityProvider *)self intentDeviceType];

  if (v16)
  {
    uint64_t v17 = [(_INPBHomeAutomationEntityProvider *)self intentDeviceType];
    PBDataWriterWriteSubmessage();
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v18 = self->_intentFromEntities;
  uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v63 objects:v75 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v64;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v64 != v21) {
          objc_enumerationMutation(v18);
        }
        PBDataWriterWriteSubmessage();
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v63 objects:v75 count:16];
    }
    while (v20);
  }

  uint64_t v23 = [(_INPBHomeAutomationEntityProvider *)self intentPlaceHint];

  if (v23)
  {
    v24 = [(_INPBHomeAutomationEntityProvider *)self intentPlaceHint];
    PBDataWriterWriteSubmessage();
  }
  v25 = [(_INPBHomeAutomationEntityProvider *)self intentReference];

  if (v25)
  {
    int v26 = [(_INPBHomeAutomationEntityProvider *)self intentReference];
    PBDataWriterWriteSubmessage();
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v27 = self->_roomNames;
  uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v59 objects:v74 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v60;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v60 != v30) {
          objc_enumerationMutation(v27);
        }
        PBDataWriterWriteSubmessage();
        ++v31;
      }
      while (v29 != v31);
      uint64_t v29 = [(NSArray *)v27 countByEnumeratingWithState:&v59 objects:v74 count:16];
    }
    while (v29);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v32 = self->_serviceGroups;
  uint64_t v33 = [(NSArray *)v32 countByEnumeratingWithState:&v55 objects:v73 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v56;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v56 != v35) {
          objc_enumerationMutation(v32);
        }
        PBDataWriterWriteSubmessage();
        ++v36;
      }
      while (v34 != v36);
      uint64_t v34 = [(NSArray *)v32 countByEnumeratingWithState:&v55 objects:v73 count:16];
    }
    while (v34);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v37 = self->_serviceNames;
  uint64_t v38 = [(NSArray *)v37 countByEnumeratingWithState:&v51 objects:v72 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v52;
    do
    {
      uint64_t v41 = 0;
      do
      {
        if (*(void *)v52 != v40) {
          objc_enumerationMutation(v37);
        }
        PBDataWriterWriteSubmessage();
        ++v41;
      }
      while (v39 != v41);
      uint64_t v39 = [(NSArray *)v37 countByEnumeratingWithState:&v51 objects:v72 count:16];
    }
    while (v39);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v42 = self->_zoneNames;
  uint64_t v43 = [(NSArray *)v42 countByEnumeratingWithState:&v47 objects:v71 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v48;
    do
    {
      uint64_t v46 = 0;
      do
      {
        if (*(void *)v48 != v45) {
          objc_enumerationMutation(v42);
        }
        PBDataWriterWriteSubmessage();
        ++v46;
      }
      while (v44 != v46);
      uint64_t v44 = [(NSArray *)v42 countByEnumeratingWithState:&v47 objects:v71 count:16];
    }
    while (v44);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBHomeAutomationEntityProviderReadFrom(self, (uint64_t)a3);
}

- (id)zoneNamesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_zoneNames objectAtIndexedSubscript:a3];
}

- (unint64_t)zoneNamesCount
{
  return [(NSArray *)self->_zoneNames count];
}

- (void)addZoneNames:(id)a3
{
  id v4 = a3;
  zoneNames = self->_zoneNames;
  id v8 = v4;
  if (!zoneNames)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_zoneNames;
    self->_zoneNames = v6;

    id v4 = v8;
    zoneNames = self->_zoneNames;
  }
  [(NSArray *)zoneNames addObject:v4];
}

- (void)clearZoneNames
{
}

- (void)setZoneNames:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  zoneNames = self->_zoneNames;
  self->_zoneNames = v4;

  MEMORY[0x1F41817F8](v4, zoneNames);
}

- (id)serviceNamesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_serviceNames objectAtIndexedSubscript:a3];
}

- (unint64_t)serviceNamesCount
{
  return [(NSArray *)self->_serviceNames count];
}

- (void)addServiceNames:(id)a3
{
  id v4 = a3;
  serviceNames = self->_serviceNames;
  id v8 = v4;
  if (!serviceNames)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_serviceNames;
    self->_serviceNames = v6;

    id v4 = v8;
    serviceNames = self->_serviceNames;
  }
  [(NSArray *)serviceNames addObject:v4];
}

- (void)clearServiceNames
{
}

- (void)setServiceNames:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  serviceNames = self->_serviceNames;
  self->_serviceNames = v4;

  MEMORY[0x1F41817F8](v4, serviceNames);
}

- (id)serviceGroupsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_serviceGroups objectAtIndexedSubscript:a3];
}

- (unint64_t)serviceGroupsCount
{
  return [(NSArray *)self->_serviceGroups count];
}

- (void)addServiceGroups:(id)a3
{
  id v4 = a3;
  serviceGroups = self->_serviceGroups;
  id v8 = v4;
  if (!serviceGroups)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_serviceGroups;
    self->_serviceGroups = v6;

    id v4 = v8;
    serviceGroups = self->_serviceGroups;
  }
  [(NSArray *)serviceGroups addObject:v4];
}

- (void)clearServiceGroups
{
}

- (void)setServiceGroups:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  serviceGroups = self->_serviceGroups;
  self->_serviceGroups = v4;

  MEMORY[0x1F41817F8](v4, serviceGroups);
}

- (id)roomNamesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_roomNames objectAtIndexedSubscript:a3];
}

- (unint64_t)roomNamesCount
{
  return [(NSArray *)self->_roomNames count];
}

- (void)addRoomNames:(id)a3
{
  id v4 = a3;
  roomNames = self->_roomNames;
  id v8 = v4;
  if (!roomNames)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_roomNames;
    self->_roomNames = v6;

    id v4 = v8;
    roomNames = self->_roomNames;
  }
  [(NSArray *)roomNames addObject:v4];
}

- (void)clearRoomNames
{
}

- (void)setRoomNames:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  roomNames = self->_roomNames;
  self->_roomNames = v4;

  MEMORY[0x1F41817F8](v4, roomNames);
}

- (BOOL)hasIntentReference
{
  return self->_intentReference != 0;
}

- (void)setIntentReference:(id)a3
{
}

- (BOOL)hasIntentPlaceHint
{
  return self->_intentPlaceHint != 0;
}

- (void)setIntentPlaceHint:(id)a3
{
}

- (id)intentFromEntitiesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_intentFromEntities objectAtIndexedSubscript:a3];
}

- (unint64_t)intentFromEntitiesCount
{
  return [(NSArray *)self->_intentFromEntities count];
}

- (void)addIntentFromEntities:(id)a3
{
  id v4 = a3;
  intentFromEntities = self->_intentFromEntities;
  id v8 = v4;
  if (!intentFromEntities)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_intentFromEntities;
    self->_intentFromEntities = v6;

    id v4 = v8;
    intentFromEntities = self->_intentFromEntities;
  }
  [(NSArray *)intentFromEntities addObject:v4];
}

- (void)clearIntentFromEntities
{
}

- (void)setIntentFromEntities:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  intentFromEntities = self->_intentFromEntities;
  self->_intentFromEntities = v4;

  MEMORY[0x1F41817F8](v4, intentFromEntities);
}

- (BOOL)hasIntentDeviceType
{
  return self->_intentDeviceType != 0;
}

- (void)setIntentDeviceType:(id)a3
{
}

- (BOOL)hasIntentDeviceQuantifier
{
  return self->_intentDeviceQuantifier != 0;
}

- (void)setIntentDeviceQuantifier:(id)a3
{
}

- (BOOL)hasHomeName
{
  return self->_homeName != 0;
}

- (void)setHomeName:(id)a3
{
}

- (BOOL)hasDestinationDeviceId
{
  return self->_destinationDeviceId != 0;
}

- (void)setDestinationDeviceId:(id)a3
{
}

- (id)accessoryNamesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_accessoryNames objectAtIndexedSubscript:a3];
}

- (unint64_t)accessoryNamesCount
{
  return [(NSArray *)self->_accessoryNames count];
}

- (void)addAccessoryNames:(id)a3
{
  id v4 = a3;
  accessoryNames = self->_accessoryNames;
  id v8 = v4;
  if (!accessoryNames)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_accessoryNames;
    self->_accessoryNames = v6;

    id v4 = v8;
    accessoryNames = self->_accessoryNames;
  }
  [(NSArray *)accessoryNames addObject:v4];
}

- (void)clearAccessoryNames
{
}

- (void)setAccessoryNames:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  accessoryNames = self->_accessoryNames;
  self->_accessoryNames = v4;

  MEMORY[0x1F41817F8](v4, accessoryNames);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)zoneNamesType
{
  return (Class)objc_opt_class();
}

+ (Class)serviceNamesType
{
  return (Class)objc_opt_class();
}

+ (Class)serviceGroupsType
{
  return (Class)objc_opt_class();
}

+ (Class)roomNamesType
{
  return (Class)objc_opt_class();
}

+ (Class)intentFromEntitiesType
{
  return (Class)objc_opt_class();
}

+ (Class)accessoryNamesType
{
  return (Class)objc_opt_class();
}

@end