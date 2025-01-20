@interface HMAudioAnalysisAggregateEventBulletin
+ (id)decodeBulletinsFromEvent:(id)a3 error:(id *)a4;
+ (id)logCategory;
+ (id)shortDescription;
+ (id)topicWithAccessoryUUID:(id)a3 homeUUID:(id)a4;
- (BOOL)checkIfBulletinExists:(id)a3;
- (HMAudioAnalysisAggregateEventBulletin)initWithBulletins:(id)a3 eventSource:(id)a4 eventTimestamp:(double)a5;
- (NSArray)attributeDescriptions;
- (NSArray)bulletins;
- (NSString)description;
- (NSString)shortDescription;
- (id)bulletinsByAddingOrReplacingBulletin:(id)a3;
- (id)encodedData;
@end

@implementation HMAudioAnalysisAggregateEventBulletin

- (void).cxx_destruct
{
}

- (NSArray)bulletins
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (NSArray)attributeDescriptions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v4 = [(HMAudioAnalysisAggregateEventBulletin *)self bulletins];
  v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
  }
  v7 = (void *)[v3 initWithName:@"Bulletins:" value:v6];
  v10[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  return (NSArray *)v8;
}

- (id)encodedData
{
  id v3 = objc_alloc_init(HMAudioAnalysisEventBulletinEventProtoValueEvent);
  uint64_t v4 = [(HMAudioAnalysisAggregateEventBulletin *)self bulletins];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__HMAudioAnalysisAggregateEventBulletin_encodedData__block_invoke;
  v8[3] = &unk_1E5943B80;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_each:", v8);

  uint64_t v6 = [(HMAudioAnalysisEventBulletinEventProtoValueEvent *)v5 data];

  return v6;
}

void __52__HMAudioAnalysisAggregateEventBulletin_encodedData__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 proto];
  [v2 addEvents:v3];
}

- (id)bulletinsByAddingOrReplacingBulletin:(id)a3
{
  id v4 = a3;
  v5 = [(HMAudioAnalysisAggregateEventBulletin *)self bulletins];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __78__HMAudioAnalysisAggregateEventBulletin_bulletinsByAddingOrReplacingBulletin___block_invoke;
  v10[3] = &unk_1E5943B58;
  id v11 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "na_filter:", v10);

  v8 = [v7 arrayByAddingObject:v6];

  return v8;
}

BOOL __78__HMAudioAnalysisAggregateEventBulletin_bulletinsByAddingOrReplacingBulletin___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 reason];
  return v3 != [*(id *)(a1 + 32) reason];
}

- (BOOL)checkIfBulletinExists:(id)a3
{
  id v4 = a3;
  v5 = [(HMAudioAnalysisAggregateEventBulletin *)self bulletins];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__HMAudioAnalysisAggregateEventBulletin_checkIfBulletinExists___block_invoke;
  v9[3] = &unk_1E5943B58;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

uint64_t __63__HMAudioAnalysisAggregateEventBulletin_checkIfBulletinExists___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

- (HMAudioAnalysisAggregateEventBulletin)initWithBulletins:(id)a3 eventSource:(id)a4 eventTimestamp:(double)a5
{
  id v9 = a3;
  id v10 = (objc_class *)MEMORY[0x1E4F69F48];
  id v11 = a4;
  v12 = (void *)[[v10 alloc] initWithSource:v11 cachePolicy:2 combineType:2 timestamp:a5];

  v17.receiver = self;
  v17.super_class = (Class)HMAudioAnalysisAggregateEventBulletin;
  v16.receiver = [(HMEEvent *)&v17 initWithSubclassedEventMetadata:v12];
  v16.super_class = (Class)HMAudioAnalysisAggregateEventBulletin;
  v13 = [(HMEEvent *)&v16 initWithSubclassedEventMetadata:v12];
  v14 = v13;
  if (v13) {
    objc_storeStrong((id *)&v13->_bulletins, a3);
  }

  return v14;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_48623 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_48623, &__block_literal_global_12_48624);
  }
  v2 = (void *)logCategory__hmf_once_v2_48625;

  return v2;
}

uint64_t __52__HMAudioAnalysisAggregateEventBulletin_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_48625;
  logCategory__hmf_once_v2_48625 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)topicWithAccessoryUUID:(id)a3 homeUUID:(id)a4
{
  return (id)[NSString stringWithFormat:@"localXPC.home.%@.accessory.%@.audio.analysis.aggregate.event.updated", a4, a3];
}

+ (id)decodeBulletinsFromEvent:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [HMAudioAnalysisEventBulletinEventProtoValueEvent alloc];
  char v7 = [v5 encodedData];
  v8 = [(HMAudioAnalysisEventBulletinEventProtoValueEvent *)v6 initWithData:v7];

  if (v8)
  {
    id v9 = [(HMAudioAnalysisEventBulletinEventProtoValueEvent *)v8 events];
    id v10 = objc_msgSend(v9, "na_map:", &__block_literal_global_48636);

    if (!v10)
    {
      id v10 = [MEMORY[0x1E4F1C978] array];
    }
    id v11 = [HMAudioAnalysisAggregateEventBulletin alloc];
    v12 = [v5 eventMetadata];
    v13 = [v12 source];
    v14 = [v5 eventMetadata];
    [v14 intervalSinceReferenceDate];
    v15 = -[HMAudioAnalysisAggregateEventBulletin initWithBulletins:eventSource:eventTimestamp:](v11, "initWithBulletins:eventSource:eventTimestamp:", v10, v13);

    if (a4 && !v15)
    {
      *a4 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    }
  }
  else
  {
    objc_super v16 = (void *)MEMORY[0x19F3A64A0]();
    objc_super v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      int v20 = 138543618;
      v21 = v18;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode proto audio analysis aggregate event from: %@", (uint8_t *)&v20, 0x16u);
    }
    if (a4)
    {
      [MEMORY[0x1E4F28C58] hmErrorWithCode:19];
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

HMAudioAnalysisEventBulletin *__72__HMAudioAnalysisAggregateEventBulletin_decodeBulletinsFromEvent_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HMAudioAnalysisEventBulletin initWithProto:a2];
}

@end