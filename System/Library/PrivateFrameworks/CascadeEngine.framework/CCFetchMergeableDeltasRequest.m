@interface CCFetchMergeableDeltasRequest
+ (id)fetchMergableDeltasRequestFromPeerToPeerMessage:(id)a3 set:(id)a4 stateVector:(id)a5 atomBatchVersion:(unint64_t)a6;
- (CCSet)set;
- (CKDistributedTimestampStateVector)stateVector;
- (id)dictionaryRepresentation;
- (id)initFromDictionary:(id)a3;
- (unint64_t)atomBatchVersion;
- (void)dictionaryRepresentation;
- (void)setAtomBatchVersion:(unint64_t)a3;
- (void)setSet:(id)a3;
- (void)setStateVector:(id)a3;
@end

@implementation CCFetchMergeableDeltasRequest

+ (id)fetchMergableDeltasRequestFromPeerToPeerMessage:(id)a3 set:(id)a4 stateVector:(id)a5 atomBatchVersion:(unint64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [CCFetchMergeableDeltasRequest alloc];
  v13 = [v11 device];
  uint64_t v14 = [v11 protocolVersion];
  [v11 walltime];
  double v16 = v15;
  v17 = [v11 peerPublicKey];

  v18 = [(CCPeerToPeerMessage *)v12 initWithDevice:v13 protocolVersion:v14 wallTime:v17 peerPublicKey:v16];
  [(CCFetchMergeableDeltasRequest *)v18 setSet:v10];

  [(CCFetchMergeableDeltasRequest *)v18 setStateVector:v9];
  [(CCFetchMergeableDeltasRequest *)v18 setAtomBatchVersion:a6];
  return v18;
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CCFetchMergeableDeltasRequest;
  v5 = [(CCPeerToPeerMessage *)&v23 initFromDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"itemType"];
    unsigned __int16 v7 = [v6 integerValue];

    v8 = [MEMORY[0x263F29E78] currentPersonaIdentifier];
    id v9 = objc_alloc(MEMORY[0x263F31770]);
    id v10 = [v4 objectForKeyedSubscript:@"descriptors"];
    uint64_t v11 = [v9 initWithItemType:v7 personaIdentifier:v8 encodedDescriptors:v10 options:1 error:0];
    v12 = (void *)v5[5];
    v5[5] = v11;

    v13 = [v4 objectForKeyedSubscript:@"atomBatchVersion"];
    v5[7] = [v13 unsignedIntegerValue];

    uint64_t v14 = [v4 objectForKeyedSubscript:@"stateVector"];
    double v15 = (void *)MEMORY[0x263F08928];
    double v16 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    id v22 = 0;
    uint64_t v17 = [v15 unarchivedObjectOfClasses:v16 fromData:v14 error:&v22];
    id v18 = v22;
    v19 = (void *)v5[6];
    v5[6] = v17;

    if (v18)
    {
      v20 = __biome_log_for_category();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        -[CCFetchMergeableDeltasRequest initFromDictionary:]((uint64_t)v18, v20);
      }
    }
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  v22[4] = *MEMORY[0x263EF8340];
  stateVector = self->_stateVector;
  id v20 = 0;
  id v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:stateVector requiringSecureCoding:1 error:&v20];
  id v5 = v20;
  if (v5)
  {
    v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      [(CCFetchMergeableDeltasRequest *)(uint64_t)v5 dictionaryRepresentation];
    }
  }
  id v18 = v5;
  v21[0] = @"itemType";
  unsigned __int16 v7 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[CCSet itemType](self->_set, "itemType"));
  v22[0] = v7;
  v21[1] = @"descriptors";
  v8 = (void *)MEMORY[0x263F31798];
  id v9 = [(CCSet *)self->_set descriptors];
  id v10 = [v8 encodedStringFromDescriptors:v9 error:0];
  uint64_t v11 = v10;
  if (!v10)
  {
    uint64_t v11 = [MEMORY[0x263EFF9D0] null];
  }
  v22[1] = v11;
  v21[2] = @"stateVector";
  v12 = v4;
  if (!v4)
  {
    v12 = [MEMORY[0x263EFF8F8] data];
  }
  v22[2] = v12;
  v21[3] = @"atomBatchVersion";
  v13 = [NSNumber numberWithUnsignedInteger:self->_atomBatchVersion];
  v22[3] = v13;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
  double v15 = (void *)[v14 mutableCopy];

  if (v4)
  {
    if (v10) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v10) {
      goto LABEL_11;
    }
  }

LABEL_11:
  v19.receiver = self;
  v19.super_class = (Class)CCFetchMergeableDeltasRequest;
  double v16 = [(CCPeerToPeerMessage *)&v19 dictionaryRepresentation];
  [v15 addEntriesFromDictionary:v16];

  return v15;
}

- (CCSet)set
{
  return self->_set;
}

- (void)setSet:(id)a3
{
}

- (CKDistributedTimestampStateVector)stateVector
{
  return self->_stateVector;
}

- (void)setStateVector:(id)a3
{
}

- (unint64_t)atomBatchVersion
{
  return self->_atomBatchVersion;
}

- (void)setAtomBatchVersion:(unint64_t)a3
{
  self->_atomBatchVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateVector, 0);
  objc_storeStrong((id *)&self->_set, 0);
}

- (void)initFromDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_249B69000, a2, OS_LOG_TYPE_FAULT, "failed to unarchive CKDistributedTimestampStateVector with error %@", (uint8_t *)&v2, 0xCu);
}

- (void)dictionaryRepresentation
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_249B69000, a2, OS_LOG_TYPE_FAULT, "failed to archive CKDistributedTimestampStateVector with error %@", (uint8_t *)&v2, 0xCu);
}

@end