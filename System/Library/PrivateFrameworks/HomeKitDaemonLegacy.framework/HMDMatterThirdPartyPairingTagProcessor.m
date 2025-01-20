@interface HMDMatterThirdPartyPairingTagProcessor
- (HMDMatterThirdPartyPairingLogEvent)logEvent;
- (HMDMatterThirdPartyPairingTagProcessor)initWithSubmitter:(id)a3;
- (HMMStateTracker)stateTracker;
- (id)tagProcessingBlocks;
- (int64_t)startTime;
- (void)closeSessionWithEvent:(id)a3;
- (void)processAccessoryInfoEvent:(id)a3;
- (void)processAccessoryTransport:(id)a3;
- (void)processCASESanityCheckEvent:(id)a3;
- (void)processCredentialsToClientEvent:(id)a3;
- (void)processFirmwareVersionEvent:(id)a3;
- (void)processLongestPairingState:(id)a3;
- (void)processPairingErrorCancelledEvent:(id)a3;
- (void)processPairingErrorEvent:(id)a3;
- (void)processPairingEventWindowOpenedSetupDuration:(id)a3;
- (void)processPairingStartEvent:(id)a3;
- (void)processStateChange:(id)a3;
- (void)processThreadScanResultsEvent:(id)a3;
- (void)processThreadSetupDuration:(id)a3;
- (void)processWiFiScanResultsEvent:(id)a3;
- (void)setLogEventCloseReason:(unint64_t)a3;
- (void)setStartTime:(int64_t)a3;
- (void)setStateTracker:(id)a3;
@end

@implementation HMDMatterThirdPartyPairingTagProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateTracker, 0);
  objc_storeStrong((id *)&self->_logEvent, 0);
}

- (void)setStateTracker:(id)a3
{
}

- (HMMStateTracker)stateTracker
{
  return self->_stateTracker;
}

- (void)setStartTime:(int64_t)a3
{
  self->_startTime = a3;
}

- (int64_t)startTime
{
  return self->_startTime;
}

- (HMDMatterThirdPartyPairingLogEvent)logEvent
{
  return self->_logEvent;
}

- (void)setLogEventCloseReason:(unint64_t)a3
{
  BOOL v3 = a3 == 0;
  id v4 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
  [v4 setCleanClose:v3];
}

- (void)closeSessionWithEvent:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDMatterThirdPartyPairingTagProcessor *)self stateTracker];
  objc_msgSend(v5, "endWithTime:", objc_msgSend(v4, "tagTime"));

  v6 = NSNumber;
  v7 = [(HMDMatterThirdPartyPairingTagProcessor *)self stateTracker];
  v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "totalDuration"));
  v9 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
  [v9 setPairingDuration:v8];

  v10 = NSNumber;
  v11 = self;
  v12 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
  v13 = [v12 errorCode];
  v14 = [v10 numberWithBool:v13 == 0];
  v15 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
  [v15 setSuccess:v14];

  [(HMMLogEventTagProcessor *)v11 closeForReason:0];
  if (isInternalBuild())
  {
    id v31 = v4;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v16 = [(HMDMatterThirdPartyPairingTagProcessor *)v11 stateTracker];
    v17 = [v16 states];

    id obj = v17;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v34 = 0;
      uint64_t v20 = *(void *)v36;
      do
      {
        uint64_t v21 = 0;
        uint64_t v32 = v19;
        do
        {
          if (*(void *)v36 != v20) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v35 + 1) + 8 * v21);
          v23 = (void *)MEMORY[0x1D9452090]();
          v24 = v11;
          v25 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            uint64_t v26 = v20;
            v28 = v27 = v11;
            v29 = [v22 name];
            uint64_t v30 = [v22 duration];
            *(_DWORD *)buf = 138544130;
            v40 = v28;
            __int16 v41 = 2048;
            uint64_t v42 = v34 + v21;
            __int16 v43 = 2112;
            v44 = v29;
            __int16 v45 = 2048;
            uint64_t v46 = v30;
            _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Matter pairing state %ld: %@ for %lu msec", buf, 0x2Au);

            v11 = v27;
            uint64_t v20 = v26;
            uint64_t v19 = v32;
          }

          ++v21;
        }
        while (v19 != v21);
        v34 += v21;
        uint64_t v19 = [obj countByEnumeratingWithState:&v35 objects:v47 count:16];
      }
      while (v19);
    }

    id v4 = v31;
  }
}

- (void)processStateChange:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 tagData];
  uint64_t v6 = *MEMORY[0x1E4F69FE0];
  v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F69FE0]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    v10 = @"Adding WiFi Credentials";
    v11 = @"Discovery";
    switch([v9 integerValue])
    {
      case 12:
        goto LABEL_26;
      case 13:
        v11 = @"Adding System Commissioner";
        goto LABEL_26;
      case 14:
      case 15:
        v11 = @"Adding WiFi Credentials";
        goto LABEL_26;
      case 16:
        goto LABEL_24;
      case 17:
      case 18:
        v11 = @"Network Scan";
        goto LABEL_26;
      case 19:
        v10 = @"Network Scan";
        goto LABEL_24;
      case 20:
      case 21:
      case 22:
        v11 = @"Opening Pairing Window";
        goto LABEL_26;
      case 23:
        v10 = @"Opening Pairing Window";
        goto LABEL_24;
      case 24:
      case 25:
        v11 = @"Opening Pairing Window With Passcode";
        goto LABEL_26;
      case 26:
        v10 = @"Opening Pairing Window With Passcode - Failed";
        goto LABEL_24;
      case 27:
      case 28:
        v11 = @"Commissioning Accessory";
        goto LABEL_26;
      case 29:
        v10 = @"Commissioning Accessory";
        goto LABEL_24;
      case 30:
      case 31:
        v11 = @"Retrieving Thread Credentials";
        goto LABEL_26;
      case 32:
        v10 = @"Retrieving Thread Credentials";
        goto LABEL_24;
      case 33:
      case 34:
        v11 = @"CASE session sanity check";
        goto LABEL_26;
      case 35:
        v10 = @"CASE session sanity check";
        goto LABEL_24;
      case 36:
        v11 = @"Resident Confirmation";
LABEL_26:
        v16 = [(HMDMatterThirdPartyPairingTagProcessor *)self stateTracker];
        uint64_t v19 = [v4 tagTime];
        uint64_t v18 = [v4 tagData];
        [v16 enterState:v11 enterTime:v19 enterData:v18];
        goto LABEL_27;
      case 37:
      case 38:
        v10 = @"Resident Confirmation";
LABEL_24:
        v16 = [(HMDMatterThirdPartyPairingTagProcessor *)self stateTracker];
        uint64_t v17 = [v4 tagTime];
        uint64_t v18 = [v4 tagData];
        [v16 exitState:v10 exitTime:v17 exitData:v18];
LABEL_27:

        break;
      default:
        break;
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1D9452090]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v20 = 138543618;
      uint64_t v21 = v15;
      __int16 v22 = 2112;
      uint64_t v23 = v6;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Missing tag field %@, or not an NSNumber", (uint8_t *)&v20, 0x16u);
    }
  }
}

- (void)processLongestPairingState:(id)a3
{
  id v4 = a3;
  v5 = [v4 tagData];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F69F98]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  id v9 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
  [v9 setLongestStateName:v8];

  v10 = [v4 tagData];

  v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F69FA0]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  id v14 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
  [v14 setLongestStateDuration:v13];
}

- (void)processCredentialsToClientEvent:(id)a3
{
  id v3 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
  [v3 setCredentialsSentToClient:MEMORY[0x1E4F1CC38]];
}

- (void)processWiFiScanResultsEvent:(id)a3
{
  id v3 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
  [v3 setProvidedWiFiScanResults:MEMORY[0x1E4F1CC38]];
}

- (void)processThreadScanResultsEvent:(id)a3
{
  id v3 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
  [v3 setProvidedThreadScanResults:MEMORY[0x1E4F1CC38]];
}

- (void)processFirmwareVersionEvent:(id)a3
{
  id v4 = [a3 tagData];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6A018]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v8 = v6;

  if (v8)
  {
    v7 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
    [v7 setFirmwareVersion:v8];
  }
}

- (void)processPairingEventWindowOpenedSetupDuration:(id)a3
{
  id v4 = [a3 tagData];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F69FC8]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v8 = v6;

  if (v8)
  {
    v7 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
    [v7 setPairingWindowOpenedWithPasscodeDuration:v8];
  }
}

- (void)processAccessoryTransport:(id)a3
{
  id v4 = [a3 tagData];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F69FF0]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v8 = v6;

  if (v8)
  {
    v7 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
    [v7 setAccessoryTransportType:v8];
  }
}

- (void)processThreadSetupDuration:(id)a3
{
  id v4 = [a3 tagData];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F69FC8]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v8 = v6;

  if (v8)
  {
    v7 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
    [v7 setThreadSetupDuration:v8];
  }
}

- (void)processCASESanityCheckEvent:(id)a3
{
  id v4 = [a3 tagData];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F69FC0]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v8 = v6;

  if (v8)
  {
    v7 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
    [v7 setCaseSessionSanityCheckPassed:v8];
  }
}

- (void)processAccessoryInfoEvent:(id)a3
{
  id v64 = a3;
  id v4 = [v64 tagData];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6A038]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
    [v8 setCommunicationProtocol:v7];
  }
  id v9 = [v64 tagData];
  v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F6A030]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    id v13 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
    [v13 setMatterCategoryNumber:v12];
  }
  id v14 = [v64 tagData];
  v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F6A098]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  if (v17)
  {
    uint64_t v18 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
    [v18 setMatterVendorNumber:v17];
  }
  uint64_t v19 = [v64 tagData];
  int v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F6A058]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v21 = v20;
  }
  else {
    uint64_t v21 = 0;
  }
  id v22 = v21;

  if (v22)
  {
    uint64_t v23 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
    [v23 setMatterProductNumber:v22];
  }
  v62 = v17;
  uint64_t v24 = [v64 tagData];
  v25 = [v24 objectForKeyedSubscript:*MEMORY[0x1E4F6A050]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v26 = v25;
  }
  else {
    uint64_t v26 = 0;
  }
  id v27 = v26;

  if (v27)
  {
    v28 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
    [v28 setMatterProductID:v27];
  }
  v60 = v27;
  v61 = v22;
  v29 = [v64 tagData];
  uint64_t v30 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F6A028]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v31 = v30;
  }
  else {
    id v31 = 0;
  }
  id v32 = v31;

  if (v32)
  {
    v33 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
    [v33 setClient:v32];
  }
  uint64_t v34 = [v64 tagData];
  long long v35 = [v34 objectForKeyedSubscript:*MEMORY[0x1E4F6A088]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v36 = v35;
  }
  else {
    long long v36 = 0;
  }
  id v37 = v36;

  if (v37)
  {
    long long v38 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
    [v38 setSupportsSoftAP:v37];
  }
  v39 = [v64 tagData];
  v40 = [v39 objectForKeyedSubscript:*MEMORY[0x1E4F6A048]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v41 = v40;
  }
  else {
    __int16 v41 = 0;
  }
  id v42 = v41;

  if (v42)
  {
    __int16 v43 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
    [v43 setHasShortDiscriminator:v42];
  }
  v63 = v12;
  v44 = [v64 tagData];
  __int16 v45 = [v44 objectForKeyedSubscript:*MEMORY[0x1E4F6A060]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v46 = v45;
  }
  else {
    uint64_t v46 = 0;
  }
  id v47 = v46;

  if (v47)
  {
    uint64_t v48 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
    [v48 setRequiresMatterCustomCommissioningFlow:v47];
  }
  v49 = v7;
  v50 = [v64 tagData];
  v51 = [v50 objectForKeyedSubscript:*MEMORY[0x1E4F6A008]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v52 = v51;
  }
  else {
    v52 = 0;
  }
  id v53 = v52;

  if (v53)
  {
    v54 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
    [v54 setDiscoveredOverBLE:v53];
  }
  v55 = [v64 tagData];
  v56 = [v55 objectForKeyedSubscript:*MEMORY[0x1E4F6A020]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v57 = v56;
  }
  else {
    v57 = 0;
  }
  id v58 = v57;

  if (v58)
  {
    v59 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
    [v59 setKnownToSystemCommissioner:v58];
  }
}

- (void)processPairingErrorCancelledEvent:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F2D140];
  id v7 = a3;
  v5 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
  [v5 setErrorDomain:v4];

  uint64_t v6 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
  [v6 setErrorCode:&unk_1F2DC7888];

  [(HMDMatterThirdPartyPairingTagProcessor *)self closeSessionWithEvent:v7];
}

- (void)processPairingErrorEvent:(id)a3
{
  id v28 = a3;
  uint64_t v4 = [v28 tagData];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6A228]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [v28 tagData];
    id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F6A230]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;

    id v12 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
    [v12 setErrorDomain:v11];

    id v13 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
    id v14 = v13;
    v15 = v7;
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4F2D140];
    id v17 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
    [v17 setErrorDomain:v16];

    id v13 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
    id v14 = v13;
    v15 = &unk_1F2DC7870;
  }
  [v13 setErrorCode:v15];

  uint64_t v18 = [v28 tagData];
  uint64_t v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F6A238]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v20 = v19;
  }
  else {
    int v20 = 0;
  }
  id v21 = v20;

  if (v21)
  {
    id v22 = [v28 tagData];
    uint64_t v23 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F6A240]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v24 = v23;
    }
    else {
      uint64_t v24 = 0;
    }
    id v25 = v24;

    uint64_t v26 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
    [v26 setUnderlyingErrorDomain:v25];

    id v27 = [(HMDMatterThirdPartyPairingTagProcessor *)self logEvent];
    [v27 setUnderlyingErrorCode:v21];
  }
  [(HMDMatterThirdPartyPairingTagProcessor *)self closeSessionWithEvent:v28];
}

- (void)processPairingStartEvent:(id)a3
{
  id v4 = a3;
  -[HMDMatterThirdPartyPairingTagProcessor setStartTime:](self, "setStartTime:", [v4 tagTime]);
  id v6 = [(HMDMatterThirdPartyPairingTagProcessor *)self stateTracker];
  uint64_t v5 = [v4 tagTime];

  [v6 startWithTime:v5];
}

- (id)tagProcessingBlocks
{
  if (tagProcessingBlocks_token != -1) {
    dispatch_once(&tagProcessingBlocks_token, &__block_literal_global_23646);
  }
  v2 = (void *)tagProcessingBlocks_processingBlocks;
  return v2;
}

void __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke()
{
  v10[15] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F6A080];
  v9[0] = *MEMORY[0x1E4F6A078];
  v9[1] = v0;
  v10[0] = &__block_literal_global_11_23648;
  v10[1] = &__block_literal_global_13;
  uint64_t v1 = *MEMORY[0x1E4F69FE8];
  v9[2] = *MEMORY[0x1E4F6A070];
  v9[3] = v1;
  v10[2] = &__block_literal_global_15;
  v10[3] = &__block_literal_global_17_23649;
  uint64_t v2 = *MEMORY[0x1E4F69FB0];
  v9[4] = *MEMORY[0x1E4F69FA8];
  v9[5] = v2;
  v10[4] = &__block_literal_global_19_23650;
  v10[5] = &__block_literal_global_21_23651;
  uint64_t v3 = *MEMORY[0x1E4F6A068];
  v9[6] = *MEMORY[0x1E4F69FF8];
  v9[7] = v3;
  v10[6] = &__block_literal_global_23_23652;
  v10[7] = &__block_literal_global_25;
  uint64_t v4 = *MEMORY[0x1E4F6A090];
  v9[8] = *MEMORY[0x1E4F6A010];
  v9[9] = v4;
  v10[8] = &__block_literal_global_27;
  v10[9] = &__block_literal_global_29_23653;
  uint64_t v5 = *MEMORY[0x1E4F69FD8];
  v9[10] = *MEMORY[0x1E4F6A0A0];
  v9[11] = v5;
  v10[10] = &__block_literal_global_31_23654;
  v10[11] = &__block_literal_global_33;
  uint64_t v6 = *MEMORY[0x1E4F69FB8];
  v9[12] = *MEMORY[0x1E4F6A040];
  v9[13] = v6;
  v10[12] = &__block_literal_global_35_23655;
  v10[13] = &__block_literal_global_37;
  v9[14] = *MEMORY[0x1E4F69FD0];
  v10[14] = &__block_literal_global_39_23656;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:15];
  id v8 = (void *)tagProcessingBlocks_processingBlocks;
  tagProcessingBlocks_processingBlocks = v7;
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_16(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processPairingErrorCancelledEvent:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_15(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processCASESanityCheckEvent:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_14(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processCredentialsToClientEvent:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_13(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processLongestPairingState:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_12(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processWiFiScanResultsEvent:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_11(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processThreadScanResultsEvent:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processFirmwareVersionEvent:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processAccessoryInfoEvent:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processAccessoryTransport:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processPairingEventWindowOpenedSetupDuration:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processThreadSetupDuration:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processStateChange:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processPairingErrorEvent:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processPairingSuccessEvent:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processPairingStartEvent:");
}

- (HMDMatterThirdPartyPairingTagProcessor)initWithSubmitter:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HMDMatterThirdPartyPairingTagProcessor;
  uint64_t v3 = [(HMMLogEventTagProcessor *)&v9 initWithSubmitter:a3];
  if (v3)
  {
    uint64_t v4 = objc_alloc_init(HMDMatterThirdPartyPairingLogEvent);
    logEvent = v3->_logEvent;
    v3->_logEvent = v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F6A298]) initAutoStopPreviousState:0];
    stateTracker = v3->_stateTracker;
    v3->_stateTracker = (HMMStateTracker *)v6;
  }
  return v3;
}

@end