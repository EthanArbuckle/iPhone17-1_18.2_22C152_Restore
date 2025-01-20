@interface IRCandidateDO
+ (BOOL)supportsSecureCoding;
+ (IRCandidateDO)candidateDOWithLastSeenDate:(id)a3 lastUsedDate:(id)a4 firstSeenDate:(id)a5 candidateIdentifier:(id)a6 nodes:(id)a7;
+ (id)candidateDOFromCandidate:(id)a3;
+ (id)candidateForIdentifier:(id)a3 within:(id)a4;
+ (id)candidateFromCandidateDO:(id)a3;
+ (id)mediaRemoteSpeakerCandidate;
- (BOOL)containsAirPlayOrUnknownAVODTarget;
- (BOOL)containsAirplayTarget;
- (BOOL)containsUnknownAVODTarget;
- (BOOL)isBrokeredDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCandidateDO:(id)a3;
- (BOOL)isFirstPartyDevice;
- (BOOL)isMac;
- (BOOL)isMediaRemoteLocal;
- (BOOL)isSameICloudWithSystemState:(id)a3;
- (BOOL)isSameWiFi;
- (IRCandidateDO)initWithCoder:(id)a3;
- (IRCandidateDO)initWithLastSeenDate:(id)a3 lastUsedDate:(id)a4 firstSeenDate:(id)a5 candidateIdentifier:(id)a6 nodes:(id)a7;
- (NSDate)firstSeenDate;
- (NSDate)lastSeenDate;
- (NSDate)lastUsedDate;
- (NSSet)nodes;
- (NSString)candidateIdentifier;
- (id)copyWithReplacementCandidateIdentifier:(id)a3;
- (id)copyWithReplacementFirstSeenDate:(id)a3;
- (id)copyWithReplacementLastSeenDate:(id)a3;
- (id)copyWithReplacementLastUsedDate:(id)a3;
- (id)copyWithReplacementNodes:(id)a3;
- (id)description;
- (id)exportAsDictionary;
- (id)name;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IRCandidateDO

+ (id)candidateDOFromCandidate:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 nodes];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __54__IRCandidateDO_Extensions__candidateDOFromCandidate___block_invoke;
  v19[3] = &unk_2653A0B10;
  id v6 = v4;
  id v20 = v6;
  [v5 enumerateObjectsUsingBlock:v19];

  v7 = [v3 avOutpuDeviceIdentifier];
  if (v7 || ([v3 rapportIdentifier], (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    v8 = [IRNodeDO alloc];
    v9 = [v3 avOutpuDeviceIdentifier];
    v10 = [v3 rapportIdentifier];
    v11 = [v3 idsIdentifier];
    v12 = [(IRNodeDO *)v8 initWithAvOutpuDeviceIdentifier:v9 rapportIdentifier:v10 idsIdentifier:v11 avOutputDevice:0 rapportDevice:0 isLocal:0];
    [v6 addObject:v12];

    goto LABEL_5;
  }
  v18 = [v3 idsIdentifier];

  if (v18) {
    goto LABEL_4;
  }
LABEL_5:
  v13 = [MEMORY[0x263EFF910] now];
  v14 = [v3 candidateIdentifier];
  v15 = (void *)[v6 copy];
  v16 = +[IRCandidateDO candidateDOWithLastSeenDate:v13 lastUsedDate:0 firstSeenDate:0 candidateIdentifier:v14 nodes:v15];

  return v16;
}

void __54__IRCandidateDO_Extensions__candidateDOFromCandidate___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[IRNodeDO nodeDOFromNode:a2];
  [v2 addObject:v3];
}

+ (id)candidateFromCandidateDO:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F500B8];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 candidateIdentifier];
  v7 = (void *)[v5 initWithCandidateIdentifier:v6];

  v8 = objc_opt_new();
  v9 = [v4 nodes];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__IRCandidateDO_Extensions__candidateFromCandidateDO___block_invoke;
  v13[3] = &unk_26539FF00;
  id v14 = v8;
  id v10 = v8;
  [v9 enumerateObjectsUsingBlock:v13];

  v11 = (void *)[v10 copy];
  [v7 updateNodes:v11];

  return v7;
}

void __54__IRCandidateDO_Extensions__candidateFromCandidateDO___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[IRNodeDO nodeFromNodeDO:a2];
  [v2 addObject:v3];
}

+ (id)candidateForIdentifier:(id)a3 within:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__IRCandidateDO_Extensions__candidateForIdentifier_within___block_invoke;
  v9[3] = &unk_26539F7C8;
  id v10 = v5;
  id v6 = v5;
  v7 = [a4 firstWhere:v9];

  return v7;
}

uint64_t __59__IRCandidateDO_Extensions__candidateForIdentifier_within___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 candidateIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

+ (id)mediaRemoteSpeakerCandidate
{
  v2 = +[IRAVOutputDeviceDO aVOutputDeviceDOWithDeviceID:@"Speaker" modelID:0 deviceName:@"Speaker" hasAirplayProperties:0 discoveredOverInfra:0 discoveredWithBroker:0 deviceType:3 deviceSubType:1];
  id v3 = +[IRNodeDO nodeDOWithAvOutpuDeviceIdentifier:@"Speaker" rapportIdentifier:0 idsIdentifier:0 avOutputDevice:v2 rapportDevice:0 isLocal:1];
  uint64_t v4 = [MEMORY[0x263EFF910] date];
  id v5 = [MEMORY[0x263EFF910] date];
  id v6 = [MEMORY[0x263EFFA08] setWithObject:v3];
  v7 = +[IRCandidateDO candidateDOWithLastSeenDate:v4 lastUsedDate:0 firstSeenDate:v5 candidateIdentifier:@"Speaker" nodes:v6];

  return v7;
}

- (id)exportAsDictionary
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  [v4 setDateFormat:@"yyyy-MMM-dd HH:mm:ss.SSSSSS"];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = [(IRCandidateDO *)self lastSeenDate];
  v7 = [v4 stringFromDate:v6];
  [v3 setObject:v7 forKeyedSubscript:@"lastSeenDate"];

  v8 = [(IRCandidateDO *)self candidateIdentifier];
  [v3 setObject:v8 forKeyedSubscript:@"candidateIdentifier"];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v9 = [(IRCandidateDO *)self nodes];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v16 + 1) + 8 * i) exportAsDictionary];
        [v5 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [v3 setObject:v5 forKeyedSubscript:@"nodes"];

  return v3;
}

- (id)name
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__8;
  uint64_t v12 = __Block_byref_object_dispose__8;
  v13 = &stru_27039A840;
  v2 = [(IRCandidateDO *)self nodes];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__IRCandidateDO_Extensions__name__block_invoke;
  v7[3] = &unk_2653A0B38;
  v7[4] = &v8;
  [v2 enumerateObjectsUsingBlock:v7];

  if ([(id)v9[5] hasSuffix:@"|"])
  {
    uint64_t v3 = objc_msgSend((id)v9[5], "substringToIndex:", objc_msgSend((id)v9[5], "length") - 1);
    id v4 = (void *)v9[5];
    v9[5] = v3;
  }
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __33__IRCandidateDO_Extensions__name__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v7 = [a2 computeName];
  uint64_t v4 = [v3 stringByAppendingFormat:@"%@|", v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (BOOL)isSameWiFi
{
  v2 = [(IRCandidateDO *)self nodes];
  uint64_t v3 = [v2 firstWhere:&__block_literal_global_19];
  BOOL v4 = v3 != 0;

  return v4;
}

uint64_t __39__IRCandidateDO_Extensions__isSameWiFi__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 avOutputDevice];
  if ([v3 hasAirplayProperties])
  {
    BOOL v4 = [v2 avOutputDevice];
    if ([v4 hasAirplayProperties])
    {
      uint64_t v5 = [v2 avOutputDevice];
      uint64_t v6 = [v5 discoveredOverInfra];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

- (BOOL)isMac
{
  uint64_t v3 = [(IRCandidateDO *)self nodes];
  if ([v3 count] == 1)
  {
    BOOL v4 = [(IRCandidateDO *)self nodes];
    uint64_t v5 = [v4 anyObject];
    uint64_t v6 = [v5 avOutputDevice];
    if (v6)
    {
      id v7 = [(IRCandidateDO *)self nodes];
      uint64_t v8 = [v7 anyObject];
      v9 = [v8 avOutputDevice];
      if ([v9 deviceType])
      {
        BOOL v10 = 0;
      }
      else
      {
        id v14 = [(IRCandidateDO *)self nodes];
        uint64_t v11 = [v14 anyObject];
        uint64_t v12 = [v11 avOutputDevice];
        BOOL v10 = [v12 deviceSubType] == 18;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isBrokeredDevice
{
  uint64_t v3 = +[IRPreferences shared];
  BOOL v4 = [v3 loiSameSpaceOverrideBrokerForCandidateIDArray];
  uint64_t v5 = [(IRCandidateDO *)self candidateIdentifier];
  char v6 = [v4 containsObject:v5];

  if (v6) {
    return 1;
  }
  uint64_t v8 = [(IRCandidateDO *)self nodes];
  v9 = [v8 firstWhere:&__block_literal_global_37_0];
  BOOL v7 = v9 != 0;

  return v7;
}

uint64_t __45__IRCandidateDO_Extensions__isBrokeredDevice__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 avOutputDevice];
  uint64_t v3 = [v2 discoveredWithBroker];

  return v3;
}

- (BOOL)isSameICloudWithSystemState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IRCandidateDO *)self nodes];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__IRCandidateDO_Extensions__isSameICloudWithSystemState___block_invoke;
  v10[3] = &unk_2653A0170;
  id v11 = v4;
  id v6 = v4;
  BOOL v7 = [v5 firstWhere:v10];
  BOOL v8 = v7 != 0;

  return v8;
}

uint64_t __57__IRCandidateDO_Extensions__isSameICloudWithSystemState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 rapportDevice];
  id v4 = [v3 iCloudId];
  uint64_t v5 = [*(id *)(a1 + 32) iCloudId];
  uint64_t v6 = [v4 isEqual:v5];

  return v6;
}

- (BOOL)isFirstPartyDevice
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = [(IRCandidateDO *)self nodes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = [*(id *)(*((void *)&v11 + 1) + 8 * i) avOutputDevice];
        BOOL v8 = v7;
        if (v7
          && ([v7 deviceSubType] == 13
           || [v8 deviceSubType] == 18
           || [v8 deviceSubType] == 19
           || [v8 deviceSubType] == 12))
        {

          BOOL v9 = 1;
          goto LABEL_16;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      BOOL v9 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_16:

  return v9;
}

- (BOOL)containsAirplayTarget
{
  uint64_t v3 = +[IRPreferences shared];
  uint64_t v4 = [v3 overrideIsAirplayForCandidateIDArray];
  uint64_t v5 = [(IRCandidateDO *)self candidateIdentifier];
  char v6 = [v4 containsObject:v5];

  if (v6) {
    return 1;
  }
  BOOL v8 = [(IRCandidateDO *)self nodes];
  BOOL v9 = [v8 firstWhere:&__block_literal_global_39_0];
  BOOL v7 = v9 != 0;

  return v7;
}

uint64_t __50__IRCandidateDO_Extensions__containsAirplayTarget__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 deviceTypeAndSubType];
  uint64_t v3 = [v2 first];
  uint64_t v4 = [v3 unsignedIntegerValue];

  if (v2) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  uint64_t v6 = v5;

  return v6;
}

- (BOOL)containsUnknownAVODTarget
{
  uint64_t v3 = [(IRCandidateDO *)self nodes];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 1;
  }
  BOOL v5 = [(IRCandidateDO *)self nodes];
  uint64_t v6 = [v5 firstWhere:&__block_literal_global_41];
  BOOL v7 = v6 != 0;

  return v7;
}

BOOL __54__IRCandidateDO_Extensions__containsUnknownAVODTarget__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 deviceTypeAndSubType];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)containsAirPlayOrUnknownAVODTarget
{
  if ([(IRCandidateDO *)self containsAirplayTarget]) {
    return 1;
  }

  return [(IRCandidateDO *)self containsUnknownAVODTarget];
}

- (BOOL)isMediaRemoteLocal
{
  BOOL v3 = [(IRCandidateDO *)self candidateIdentifier];
  char v4 = [v3 isEqual:@"Speaker"];

  if (v4) {
    return 1;
  }
  uint64_t v6 = [(IRCandidateDO *)self nodes];
  uint64_t v7 = [v6 count];

  if (v7 != 1) {
    return 0;
  }
  BOOL v8 = [(IRCandidateDO *)self nodes];
  BOOL v9 = [v8 anyObject];
  BOOL v10 = [v9 deviceTypeAndSubType];

  long long v11 = [v10 first];
  uint64_t v12 = [v11 unsignedIntegerValue];

  if (v10) {
    BOOL v13 = v12 == 3;
  }
  else {
    BOOL v13 = 0;
  }
  BOOL v5 = v13;

  return v5;
}

- (IRCandidateDO)initWithLastSeenDate:(id)a3 lastUsedDate:(id)a4 firstSeenDate:(id)a5 candidateIdentifier:(id)a6 nodes:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)IRCandidateDO;
  long long v17 = [(IRCandidateDO *)&v21 init];
  long long v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_lastSeenDate, a3);
    objc_storeStrong((id *)&v18->_lastUsedDate, a4);
    objc_storeStrong((id *)&v18->_firstSeenDate, a5);
    objc_storeStrong((id *)&v18->_candidateIdentifier, a6);
    objc_storeStrong((id *)&v18->_nodes, a7);
  }

  return v18;
}

+ (IRCandidateDO)candidateDOWithLastSeenDate:(id)a3 lastUsedDate:(id)a4 firstSeenDate:(id)a5 candidateIdentifier:(id)a6 nodes:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  long long v17 = (void *)[objc_alloc((Class)a1) initWithLastSeenDate:v16 lastUsedDate:v15 firstSeenDate:v14 candidateIdentifier:v13 nodes:v12];

  return (IRCandidateDO *)v17;
}

- (id)copyWithReplacementLastSeenDate:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLastSeenDate:v4 lastUsedDate:self->_lastUsedDate firstSeenDate:self->_firstSeenDate candidateIdentifier:self->_candidateIdentifier nodes:self->_nodes];

  return v5;
}

- (id)copyWithReplacementLastUsedDate:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLastSeenDate:self->_lastSeenDate lastUsedDate:v4 firstSeenDate:self->_firstSeenDate candidateIdentifier:self->_candidateIdentifier nodes:self->_nodes];

  return v5;
}

- (id)copyWithReplacementFirstSeenDate:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLastSeenDate:self->_lastSeenDate lastUsedDate:self->_lastUsedDate firstSeenDate:v4 candidateIdentifier:self->_candidateIdentifier nodes:self->_nodes];

  return v5;
}

- (id)copyWithReplacementCandidateIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLastSeenDate:self->_lastSeenDate lastUsedDate:self->_lastUsedDate firstSeenDate:self->_firstSeenDate candidateIdentifier:v4 nodes:self->_nodes];

  return v5;
}

- (id)copyWithReplacementNodes:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLastSeenDate:self->_lastSeenDate lastUsedDate:self->_lastUsedDate firstSeenDate:self->_firstSeenDate candidateIdentifier:self->_candidateIdentifier nodes:v4];

  return v5;
}

- (BOOL)isEqualToCandidateDO:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  int v6 = self->_candidateIdentifier != 0;
  uint64_t v7 = [v4 candidateIdentifier];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_8;
  }
  candidateIdentifier = self->_candidateIdentifier;
  if (candidateIdentifier)
  {
    BOOL v10 = [v5 candidateIdentifier];
    int v11 = [(NSString *)candidateIdentifier isEqual:v10];

    if (!v11) {
      goto LABEL_8;
    }
  }
  int v12 = self->_nodes != 0;
  id v13 = [v5 nodes];
  int v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    char v17 = 0;
  }
  else
  {
    nodes = self->_nodes;
    if (nodes)
    {
      id v16 = [v5 nodes];
      char v17 = [(NSSet *)nodes isEqual:v16];
    }
    else
    {
      char v17 = 1;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IRCandidateDO *)a3;
  BOOL v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(IRCandidateDO *)self isEqualToCandidateDO:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_candidateIdentifier hash];
  return [(NSSet *)self->_nodes hash] - v3 + 32 * v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRCandidateDO)initWithCoder:(id)a3
{
  v44[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastSeenDate"];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      int v8 = (objc_class *)objc_opt_class();
      BOOL v9 = NSStringFromClass(v8);
      BOOL v10 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRCandidateDO key \"lastSeenDate\" (expected %@, decoded %@)", v7, v9, 0];
      uint64_t v43 = *MEMORY[0x263F08320];
      v44[0] = v10;
      int v11 = [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];
      int v12 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRCandidateDOOCNTErrorDomain" code:3 userInfo:v11];
      [v4 failWithError:v12];
LABEL_15:

LABEL_16:
      int v14 = 0;
LABEL_17:

LABEL_18:
      goto LABEL_19;
    }
LABEL_6:
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUsedDate"];
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v15 = (objc_class *)objc_opt_class();
        BOOL v9 = NSStringFromClass(v15);
        id v16 = (objc_class *)objc_opt_class();
        BOOL v10 = NSStringFromClass(v16);
        int v11 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRCandidateDO key \"lastUsedDate\" (expected %@, decoded %@)", v9, v10, 0];
        uint64_t v41 = *MEMORY[0x263F08320];
        v42 = v11;
        int v12 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        char v17 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRCandidateDOOCNTErrorDomain" code:3 userInfo:v12];
        [v4 failWithError:v17];
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      long long v18 = [v4 error];

      if (v18)
      {
        int v14 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    BOOL v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstSeenDate"];
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        long long v19 = (objc_class *)objc_opt_class();
        BOOL v10 = NSStringFromClass(v19);
        id v20 = (objc_class *)objc_opt_class();
        int v11 = NSStringFromClass(v20);
        int v12 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRCandidateDO key \"firstSeenDate\" (expected %@, decoded %@)", v10, v11, 0];
        uint64_t v39 = *MEMORY[0x263F08320];
        v40 = v12;
        char v17 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        objc_super v21 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRCandidateDOOCNTErrorDomain" code:3 userInfo:v17];
        [v4 failWithError:v21];

        goto LABEL_14;
      }
    }
    else
    {
      v23 = [v4 error];

      if (v23)
      {
        int v14 = 0;
        goto LABEL_18;
      }
    }
    BOOL v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candidateIdentifier"];
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v24 = (objc_class *)objc_opt_class();
        v36 = NSStringFromClass(v24);
        v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        v27 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRCandidateDO key \"candidateIdentifier\" (expected %@, decoded %@)", v36, v26, 0];
        uint64_t v37 = *MEMORY[0x263F08320];
        v38 = v27;
        v28 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        v29 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRCandidateDOOCNTErrorDomain" code:3 userInfo:v28];
        [v4 failWithError:v29];

        goto LABEL_16;
      }
    }
    else
    {
      v30 = [v4 error];

      if (v30) {
        goto LABEL_16;
      }
    }
    id v31 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v32 = objc_opt_class();
    v33 = objc_msgSend(v31, "initWithObjects:", v32, objc_opt_class(), 0);
    v34 = [v4 decodeObjectOfClasses:v33 forKey:@"nodes"];

    if (v34 || ([v4 error], v35 = objc_claimAutoreleasedReturnValue(), v35, !v35))
    {
      self = [(IRCandidateDO *)self initWithLastSeenDate:v5 lastUsedDate:v7 firstSeenDate:v9 candidateIdentifier:v10 nodes:v34];
      int v14 = self;
    }
    else
    {
      int v14 = 0;
    }

    goto LABEL_17;
  }
  id v13 = [v4 error];

  if (!v13) {
    goto LABEL_6;
  }
  int v14 = 0;
LABEL_20:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  lastSeenDate = self->_lastSeenDate;
  id v10 = v4;
  if (lastSeenDate)
  {
    [v4 encodeObject:lastSeenDate forKey:@"lastSeenDate"];
    id v4 = v10;
  }
  lastUsedDate = self->_lastUsedDate;
  if (lastUsedDate)
  {
    [v10 encodeObject:lastUsedDate forKey:@"lastUsedDate"];
    id v4 = v10;
  }
  firstSeenDate = self->_firstSeenDate;
  if (firstSeenDate)
  {
    [v10 encodeObject:firstSeenDate forKey:@"firstSeenDate"];
    id v4 = v10;
  }
  candidateIdentifier = self->_candidateIdentifier;
  if (candidateIdentifier)
  {
    [v10 encodeObject:candidateIdentifier forKey:@"candidateIdentifier"];
    id v4 = v10;
  }
  nodes = self->_nodes;
  if (nodes)
  {
    [v10 encodeObject:nodes forKey:@"nodes"];
    id v4 = v10;
  }
}

- (id)description
{
  id v2 = (void *)[[NSString alloc] initWithFormat:@"<IRCandidateDO | lastSeenDate:%@ lastUsedDate:%@ firstSeenDate:%@ candidateIdentifier:%@ nodes:%@>", self->_lastSeenDate, self->_lastUsedDate, self->_firstSeenDate, self->_candidateIdentifier, self->_nodes];

  return v2;
}

- (NSDate)lastSeenDate
{
  return self->_lastSeenDate;
}

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (NSDate)firstSeenDate
{
  return self->_firstSeenDate;
}

- (NSString)candidateIdentifier
{
  return self->_candidateIdentifier;
}

- (NSSet)nodes
{
  return self->_nodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_candidateIdentifier, 0);
  objc_storeStrong((id *)&self->_firstSeenDate, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);

  objc_storeStrong((id *)&self->_lastSeenDate, 0);
}

@end