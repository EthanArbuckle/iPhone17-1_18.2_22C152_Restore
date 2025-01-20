@interface HMDCloudSyncAnalysisResultLogEvent
- (BOOL)lastDecryptionFailed;
- (BOOL)uploadMaximumDelayReached;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSDictionary)legacyUploadErrorCountMap;
- (NSDictionary)legacyUploadReasonCountMap;
- (NSDictionary)uploadErrorCountMap;
- (NSString)coreAnalyticsEventName;
- (unint64_t)bytesFetched;
- (unint64_t)bytesPushed;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)decryptionFailedCount;
- (unint64_t)fetchCount;
- (unint64_t)fetchErrorCount;
- (unint64_t)incomingPushCount;
- (unint64_t)legacyBytesFetched;
- (unint64_t)legacyBytesPushed;
- (unint64_t)legacyFetchCount;
- (unint64_t)legacyFetchErrorCount;
- (unint64_t)legacyUploadCount;
- (unint64_t)legacyUploadErrorCount;
- (unint64_t)uploadCount;
- (unint64_t)uploadErrorCount;
- (void)setBytesFetched:(unint64_t)a3;
- (void)setBytesPushed:(unint64_t)a3;
- (void)setDecryptionFailedCount:(unint64_t)a3;
- (void)setFetchCount:(unint64_t)a3;
- (void)setFetchErrorCount:(unint64_t)a3;
- (void)setIncomingPushCount:(unint64_t)a3;
- (void)setLastDecryptionFailed:(BOOL)a3;
- (void)setLegacyBytesFetched:(unint64_t)a3;
- (void)setLegacyBytesPushed:(unint64_t)a3;
- (void)setLegacyFetchCount:(unint64_t)a3;
- (void)setLegacyFetchErrorCount:(unint64_t)a3;
- (void)setLegacyUploadCount:(unint64_t)a3;
- (void)setLegacyUploadErrorCount:(unint64_t)a3;
- (void)setLegacyUploadErrorCountMap:(id)a3;
- (void)setLegacyUploadReasonCountMap:(id)a3;
- (void)setUploadCount:(unint64_t)a3;
- (void)setUploadErrorCount:(unint64_t)a3;
- (void)setUploadErrorCountMap:(id)a3;
- (void)setUploadMaximumDelayReached:(BOOL)a3;
@end

@implementation HMDCloudSyncAnalysisResultLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyUploadErrorCountMap, 0);
  objc_storeStrong((id *)&self->_uploadErrorCountMap, 0);
  objc_storeStrong((id *)&self->_legacyUploadReasonCountMap, 0);
}

- (void)setLegacyUploadErrorCountMap:(id)a3
{
}

- (NSDictionary)legacyUploadErrorCountMap
{
  return self->_legacyUploadErrorCountMap;
}

- (void)setUploadErrorCountMap:(id)a3
{
}

- (NSDictionary)uploadErrorCountMap
{
  return self->_uploadErrorCountMap;
}

- (void)setLegacyUploadReasonCountMap:(id)a3
{
}

- (NSDictionary)legacyUploadReasonCountMap
{
  return self->_legacyUploadReasonCountMap;
}

- (void)setLegacyBytesPushed:(unint64_t)a3
{
  self->_legacyBytesPushed = a3;
}

- (unint64_t)legacyBytesPushed
{
  return self->_legacyBytesPushed;
}

- (void)setLegacyBytesFetched:(unint64_t)a3
{
  self->_legacyBytesFetched = a3;
}

- (unint64_t)legacyBytesFetched
{
  return self->_legacyBytesFetched;
}

- (void)setBytesPushed:(unint64_t)a3
{
  self->_bytesPushed = a3;
}

- (unint64_t)bytesPushed
{
  return self->_bytesPushed;
}

- (void)setBytesFetched:(unint64_t)a3
{
  self->_bytesFetched = a3;
}

- (unint64_t)bytesFetched
{
  return self->_bytesFetched;
}

- (void)setDecryptionFailedCount:(unint64_t)a3
{
  self->_decryptionFailedCount = a3;
}

- (unint64_t)decryptionFailedCount
{
  return self->_decryptionFailedCount;
}

- (void)setLegacyUploadErrorCount:(unint64_t)a3
{
  self->_legacyUploadErrorCount = a3;
}

- (unint64_t)legacyUploadErrorCount
{
  return self->_legacyUploadErrorCount;
}

- (void)setUploadErrorCount:(unint64_t)a3
{
  self->_uploadErrorCount = a3;
}

- (unint64_t)uploadErrorCount
{
  return self->_uploadErrorCount;
}

- (void)setLegacyUploadCount:(unint64_t)a3
{
  self->_legacyUploadCount = a3;
}

- (unint64_t)legacyUploadCount
{
  return self->_legacyUploadCount;
}

- (void)setUploadCount:(unint64_t)a3
{
  self->_uploadCount = a3;
}

- (unint64_t)uploadCount
{
  return self->_uploadCount;
}

- (void)setLegacyFetchErrorCount:(unint64_t)a3
{
  self->_legacyFetchErrorCount = a3;
}

- (unint64_t)legacyFetchErrorCount
{
  return self->_legacyFetchErrorCount;
}

- (void)setFetchErrorCount:(unint64_t)a3
{
  self->_fetchErrorCount = a3;
}

- (unint64_t)fetchErrorCount
{
  return self->_fetchErrorCount;
}

- (void)setLegacyFetchCount:(unint64_t)a3
{
  self->_legacyFetchCount = a3;
}

- (unint64_t)legacyFetchCount
{
  return self->_legacyFetchCount;
}

- (void)setFetchCount:(unint64_t)a3
{
  self->_fetchCount = a3;
}

- (unint64_t)fetchCount
{
  return self->_fetchCount;
}

- (void)setIncomingPushCount:(unint64_t)a3
{
  self->_incomingPushCount = a3;
}

- (unint64_t)incomingPushCount
{
  return self->_incomingPushCount;
}

- (void)setLastDecryptionFailed:(BOOL)a3
{
  self->_lastDecryptionFailed = a3;
}

- (BOOL)lastDecryptionFailed
{
  return self->_lastDecryptionFailed;
}

- (void)setUploadMaximumDelayReached:(BOOL)a3
{
  self->_uploadMaximumDelayReached = a3;
}

- (BOOL)uploadMaximumDelayReached
{
  return self->_uploadMaximumDelayReached;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCloudSyncAnalysisResultLogEvent uploadMaximumDelayReached](self, "uploadMaximumDelayReached"));
  [v3 setObject:v4 forKeyedSubscript:@"uploadMaximumDelayReached"];

  v5 = +[HMDLogEventHistograms lowVolumeHistogram];
  v6 = objc_msgSend(v5, "intervalIndexForValue:", -[HMDCloudSyncAnalysisResultLogEvent decryptionFailedCount](self, "decryptionFailedCount"));
  [v3 setObject:v6 forKeyedSubscript:@"decryptionFailedCount"];

  v7 = +[HMDLogEventHistograms lowVolumeHistogram];
  v8 = objc_msgSend(v7, "intervalIndexForValue:", -[HMDCloudSyncAnalysisResultLogEvent incomingPushCount](self, "incomingPushCount"));
  [v3 setObject:v8 forKeyedSubscript:@"incomingPushCount"];

  v9 = +[HMDLogEventHistograms lowVolumeHistogram];
  v10 = objc_msgSend(v9, "intervalIndexForValue:", -[HMDCloudSyncAnalysisResultLogEvent fetchCount](self, "fetchCount"));
  [v3 setObject:v10 forKeyedSubscript:@"fetchCount"];

  v11 = +[HMDLogEventHistograms lowVolumeHistogram];
  v12 = objc_msgSend(v11, "intervalIndexForValue:", -[HMDCloudSyncAnalysisResultLogEvent fetchErrorCount](self, "fetchErrorCount"));
  [v3 setObject:v12 forKeyedSubscript:@"fetchErrorCount"];

  v13 = +[HMDLogEventHistograms lowVolumeHistogram];
  v14 = objc_msgSend(v13, "intervalIndexForValue:", -[HMDCloudSyncAnalysisResultLogEvent legacyFetchCount](self, "legacyFetchCount"));
  [v3 setObject:v14 forKeyedSubscript:@"legacyFetchCount"];

  v15 = +[HMDLogEventHistograms lowVolumeHistogram];
  v16 = objc_msgSend(v15, "intervalIndexForValue:", -[HMDCloudSyncAnalysisResultLogEvent legacyFetchErrorCount](self, "legacyFetchErrorCount"));
  [v3 setObject:v16 forKeyedSubscript:@"legacyFetchErrorCount"];

  v17 = +[HMDLogEventHistograms lowVolumeHistogram];
  v18 = objc_msgSend(v17, "intervalIndexForValue:", -[HMDCloudSyncAnalysisResultLogEvent uploadCount](self, "uploadCount"));
  [v3 setObject:v18 forKeyedSubscript:@"uploadCount"];

  v19 = +[HMDLogEventHistograms lowVolumeHistogram];
  v20 = objc_msgSend(v19, "intervalIndexForValue:", -[HMDCloudSyncAnalysisResultLogEvent legacyUploadCount](self, "legacyUploadCount"));
  [v3 setObject:v20 forKeyedSubscript:@"legacyUploadCount"];

  v21 = [(HMDCloudSyncAnalysisResultLogEvent *)self legacyUploadReasonCountMap];
  v22 = [v21 keysSortedByValueUsingComparator:&__block_literal_global_201199];

  unint64_t v23 = [v22 count];
  if (v23 >= 3) {
    uint64_t v24 = 3;
  }
  else {
    uint64_t v24 = v23;
  }
  v25 = objc_msgSend(v22, "subarrayWithRange:", 0, v24);

  v100 = v25;
  if ([v25 count])
  {
    unint64_t v26 = 0;
    do
    {
      v27 = [v25 objectAtIndexedSubscript:v26];
      unint64_t v28 = v26 + 1;
      v29 = objc_msgSend(NSString, "stringWithFormat:", @"topLegacyUploadReason%d", v26 + 1);
      [v3 setObject:v27 forKeyedSubscript:v29];

      v30 = [(HMDCloudSyncAnalysisResultLogEvent *)self legacyUploadReasonCountMap];
      v31 = [v25 objectAtIndexedSubscript:v26];
      v32 = [v30 objectForKeyedSubscript:v31];
      v33 = self;
      uint64_t v34 = [v32 unsignedIntegerValue];

      v35 = +[HMDLogEventHistograms lowVolumeHistogram];
      uint64_t v36 = v34;
      self = v33;
      v25 = v100;
      v37 = [v35 intervalIndexForValue:v36];
      v38 = objc_msgSend(NSString, "stringWithFormat:", @"topLegacyUploadReasonCount%d", v28);
      [v3 setObject:v37 forKeyedSubscript:v38];

      unint64_t v26 = v28;
    }
    while ([v100 count] > v28);
  }
  v39 = +[HMDLogEventHistograms lowVolumeHistogram];
  v40 = objc_msgSend(v39, "intervalIndexForValue:", -[HMDCloudSyncAnalysisResultLogEvent uploadErrorCount](self, "uploadErrorCount"));
  [v3 setObject:v40 forKeyedSubscript:@"uploadErrorCount"];

  v41 = [(HMDCloudSyncAnalysisResultLogEvent *)self uploadErrorCountMap];
  v42 = [v41 keysSortedByValueUsingComparator:&__block_literal_global_114_201201];

  unint64_t v43 = [v42 count];
  if (v43 >= 3) {
    uint64_t v44 = 3;
  }
  else {
    uint64_t v44 = v43;
  }
  v45 = objc_msgSend(v42, "subarrayWithRange:", 0, v44);

  v46 = self;
  v101 = v45;
  if ([v45 count])
  {
    unint64_t v47 = 0;
    do
    {
      v48 = [v45 objectAtIndexedSubscript:v47];
      unint64_t v49 = v47 + 1;
      v50 = objc_msgSend(NSString, "stringWithFormat:", @"topUploadError%d", v47 + 1);
      [v3 setObject:v48 forKeyedSubscript:v50];

      v51 = [(HMDCloudSyncAnalysisResultLogEvent *)v46 uploadErrorCountMap];
      v52 = [v101 objectAtIndexedSubscript:v47];
      v53 = [v51 objectForKeyedSubscript:v52];
      uint64_t v54 = [v53 unsignedIntegerValue];

      v55 = +[HMDLogEventHistograms lowVolumeHistogram];
      v56 = [v55 intervalIndexForValue:v54];
      v57 = objc_msgSend(NSString, "stringWithFormat:", @"topUploadErrorCount%d", v49);
      [v3 setObject:v56 forKeyedSubscript:v57];

      v45 = v101;
      unint64_t v47 = v49;
    }
    while ([v101 count] > v49);
  }
  v58 = +[HMDLogEventHistograms lowVolumeHistogram];
  v59 = objc_msgSend(v58, "intervalIndexForValue:", -[HMDCloudSyncAnalysisResultLogEvent legacyUploadErrorCount](v46, "legacyUploadErrorCount"));
  [v3 setObject:v59 forKeyedSubscript:@"legacyUploadErrorCount"];

  v60 = [(HMDCloudSyncAnalysisResultLogEvent *)v46 legacyUploadErrorCountMap];
  v61 = [v60 keysSortedByValueUsingComparator:&__block_literal_global_125_201206];

  unint64_t v62 = [v61 count];
  if (v62 >= 3) {
    uint64_t v63 = 3;
  }
  else {
    uint64_t v63 = v62;
  }
  v64 = objc_msgSend(v61, "subarrayWithRange:", 0, v63);

  if ([v64 count])
  {
    v65 = &OBJC_METACLASS___HMDXPCMessageSendPolicyParameters;
    unint64_t v66 = 0;
    do
    {
      v67 = [v64 objectAtIndexedSubscript:v66];
      unint64_t v68 = v66 + 1;
      objc_msgSend(NSString, "stringWithFormat:", @"topLegacyUploadError%d", v66 + 1);
      v70 = v69 = v65;
      [v3 setObject:v67 forKeyedSubscript:v70];

      v71 = [(HMDCloudSyncAnalysisResultLogEvent *)v46 legacyUploadErrorCountMap];
      v72 = [v64 objectAtIndexedSubscript:v66];
      v73 = [v71 objectForKeyedSubscript:v72];
      uint64_t v74 = [v73 unsignedIntegerValue];

      v65 = v69;
      v75 = [&v69[57] lowVolumeHistogram];
      v76 = [v75 intervalIndexForValue:v74];
      v77 = objc_msgSend(NSString, "stringWithFormat:", @"topLegacyUploadErrorCount%d", v68);
      [v3 setObject:v76 forKeyedSubscript:v77];

      unint64_t v66 = v68;
    }
    while ([v64 count] > v68);
  }
  unint64_t v78 = [(HMDCloudSyncAnalysisResultLogEvent *)v46 bytesFetched];
  v79 = NSNumber;
  unint64_t v80 = [(HMDCloudSyncAnalysisResultLogEvent *)v46 bytesFetched];
  if (v78 >> 21 <= 2) {
    unint64_t v81 = v80 >> 20;
  }
  else {
    unint64_t v81 = v80 / 0x500000 + 5;
  }
  v82 = [v79 numberWithUnsignedInteger:v81];
  [v3 setObject:v82 forKeyedSubscript:@"bytesFetched"];

  unint64_t v83 = [(HMDCloudSyncAnalysisResultLogEvent *)v46 bytesPushed];
  v84 = NSNumber;
  unint64_t v85 = [(HMDCloudSyncAnalysisResultLogEvent *)v46 bytesPushed];
  if (v83 > 0x5FFFFF) {
    unint64_t v86 = v85 / 0x500000 + 5;
  }
  else {
    unint64_t v86 = v85 >> 20;
  }
  v87 = [v84 numberWithUnsignedInteger:v86];
  [v3 setObject:v87 forKeyedSubscript:@"bytesPushed"];

  unint64_t v88 = [(HMDCloudSyncAnalysisResultLogEvent *)v46 legacyBytesFetched];
  v89 = NSNumber;
  unint64_t v90 = [(HMDCloudSyncAnalysisResultLogEvent *)v46 legacyBytesFetched];
  if (v88 > 0x5FFFFF) {
    unint64_t v91 = v90 / 0x500000 + 5;
  }
  else {
    unint64_t v91 = v90 >> 20;
  }
  v92 = [v89 numberWithUnsignedInteger:v91];
  [v3 setObject:v92 forKeyedSubscript:@"legacyBytesFetched"];

  unint64_t v93 = [(HMDCloudSyncAnalysisResultLogEvent *)v46 legacyBytesPushed];
  v94 = NSNumber;
  unint64_t v95 = [(HMDCloudSyncAnalysisResultLogEvent *)v46 legacyBytesPushed];
  if (v93 > 0x5FFFFF) {
    unint64_t v96 = v95 / 0x500000 + 5;
  }
  else {
    unint64_t v96 = v95 >> 20;
  }
  v97 = [v94 numberWithUnsignedInteger:v96];
  [v3 setObject:v97 forKeyedSubscript:@"legacyBytesPushed"];

  v98 = (void *)[v3 copy];
  return (NSDictionary *)v98;
}

uint64_t __66__HMDCloudSyncAnalysisResultLogEvent_coreAnalyticsEventDictionary__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __66__HMDCloudSyncAnalysisResultLogEvent_coreAnalyticsEventDictionary__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __66__HMDCloudSyncAnalysisResultLogEvent_coreAnalyticsEventDictionary__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.cloudSyncHomeData";
}

@end