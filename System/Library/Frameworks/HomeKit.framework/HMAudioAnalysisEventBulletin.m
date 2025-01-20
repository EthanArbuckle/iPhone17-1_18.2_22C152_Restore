@interface HMAudioAnalysisEventBulletin
+ (id)initWithProto:(id)a3;
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMAudioAnalysisEventBulletin)initWithAccessoryIdentifier:(id)a3 homeIdentifier:(id)a4 startDate:(id)a5 endDate:(id)a6 reason:(unint64_t)a7 state:(unint64_t)a8;
- (NSArray)attributeDescriptions;
- (NSDate)dateOfOccurrence;
- (NSDate)startDate;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)accessoryIdentifier;
- (NSUUID)homeIdentifier;
- (id)proto;
- (unint64_t)reason;
- (unint64_t)state;
@end

@implementation HMAudioAnalysisEventBulletin

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_dateOfOccurrence, 0);
}

- (NSUUID)accessoryIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)homeIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)dateOfOccurrence
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)reason
{
  return self->_reason;
}

- (unint64_t)state
{
  return self->_state;
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
  v31[6] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v4 = [(HMAudioAnalysisEventBulletin *)self accessoryIdentifier];
  v30 = (void *)v4;
  if (v4) {
    v5 = (__CFString *)v4;
  }
  else {
    v5 = @"nil";
  }
  v29 = (void *)[v3 initWithName:@"accessory" value:v5];
  v31[0] = v29;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v7 = [(HMAudioAnalysisEventBulletin *)self homeIdentifier];
  v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = @"nil";
  }
  v28 = (void *)[v6 initWithName:@"homeIdentifier" value:v9];
  v31[1] = v28;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMAudioAnalysisEventBulletin reason](self, "reason"));
  v11 = (void *)[v10 initWithName:@"reason" value:v27];
  v31[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMAudioAnalysisEventBulletin state](self, "state"));
  v14 = (void *)[v12 initWithName:@"state" value:v13];
  v31[3] = v14;
  id v15 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v16 = [(HMAudioAnalysisEventBulletin *)self startDate];
  v17 = (void *)v16;
  if (v16) {
    v18 = (__CFString *)v16;
  }
  else {
    v18 = @"nil";
  }
  v19 = (void *)[v15 initWithName:@"startDate" value:v18];
  v31[4] = v19;
  id v20 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v21 = [(HMAudioAnalysisEventBulletin *)self dateOfOccurrence];
  v22 = (void *)v21;
  if (v21) {
    v23 = (__CFString *)v21;
  }
  else {
    v23 = @"nil";
  }
  v24 = (void *)[v20 initWithName:@"endDate" value:v23];
  v31[5] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:6];

  return (NSArray *)v25;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMAudioAnalysisEventBulletin *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  uint64_t v7 = v6;
  if (self == v4)
  {
    char v16 = 1;
  }
  else if (v6)
  {
    v8 = [(HMAudioAnalysisEventBulletin *)self dateOfOccurrence];
    v9 = [(HMAudioAnalysisEventBulletin *)v7 dateOfOccurrence];
    if (v8 == v9
      && (unint64_t v10 = [(HMAudioAnalysisEventBulletin *)self state],
          v10 == [(HMAudioAnalysisEventBulletin *)v7 state])
      && (unint64_t v11 = [(HMAudioAnalysisEventBulletin *)self reason],
          v11 == [(HMAudioAnalysisEventBulletin *)v7 reason]))
    {
      id v12 = [(HMAudioAnalysisEventBulletin *)self homeIdentifier];
      v13 = [(HMAudioAnalysisEventBulletin *)v7 homeIdentifier];
      if ([v12 isEqual:v13])
      {
        v14 = [(HMAudioAnalysisEventBulletin *)self accessoryIdentifier];
        id v15 = [(HMAudioAnalysisEventBulletin *)v7 accessoryIdentifier];
        char v16 = [v14 isEqual:v15];
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (id)proto
{
  id v3 = objc_alloc_init(HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent);
  [(HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent *)v3 setState:[(HMAudioAnalysisEventBulletin *)self state]];
  [(HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent *)v3 setReason:[(HMAudioAnalysisEventBulletin *)self reason]];
  uint64_t v4 = [(HMAudioAnalysisEventBulletin *)self dateOfOccurrence];
  [v4 timeIntervalSince1970];
  [(HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent *)v3 setDateOfOccurrence:(uint64_t)(v5 * 1000.0)];

  id v6 = [(HMAudioAnalysisEventBulletin *)self accessoryIdentifier];
  uint64_t v7 = [v6 UUIDString];
  [(HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent *)v3 setAccessoryIdentifier:v7];

  v8 = [(HMAudioAnalysisEventBulletin *)self homeIdentifier];
  v9 = [v8 UUIDString];
  [(HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent *)v3 setHomeIdentifier:v9];

  unint64_t v10 = [(HMAudioAnalysisEventBulletin *)self startDate];
  [v10 timeIntervalSince1970];
  [(HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent *)v3 setEventStartDate:(uint64_t)(v11 * 1000.0)];

  return v3;
}

- (HMAudioAnalysisEventBulletin)initWithAccessoryIdentifier:(id)a3 homeIdentifier:(id)a4 startDate:(id)a5 endDate:(id)a6 reason:(unint64_t)a7 state:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HMAudioAnalysisEventBulletin;
  v18 = [(HMAudioAnalysisEventBulletin *)&v22 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_accessoryIdentifier, a3);
    objc_storeStrong((id *)&v19->_homeIdentifier, a4);
    objc_storeStrong((id *)&v19->_dateOfOccurrence, a6);
    v19->_state = a8;
    v19->_reason = a7;
    objc_storeStrong((id *)&v19->_startDate, a5);
  }

  return v19;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_44529 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_44529, &__block_literal_global_44530);
  }
  v2 = (void *)logCategory__hmf_once_v2_44531;

  return v2;
}

uint64_t __43__HMAudioAnalysisEventBulletin_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_44531;
  logCategory__hmf_once_v2_44531 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)initWithProto:(id)a3
{
  id v3 = a3;
  if ([v3 hasState]
    && [v3 hasReason]
    && [v3 hasAccessoryIdentifier]
    && [v3 hasHomeIdentifier]
    && [v3 hasDateOfOccurrence])
  {
    double v4 = (double)[v3 dateOfOccurrence] / 1000.0;
    double v5 = (double)[v3 eventStartDate] / 1000.0;
    uint64_t v6 = [v3 reason];
    uint64_t v7 = [v3 state];
    v8 = [HMAudioAnalysisEventBulletin alloc];
    id v9 = objc_alloc(MEMORY[0x1E4F29128]);
    unint64_t v10 = [v3 accessoryIdentifier];
    double v11 = (void *)[v9 initWithUUIDString:v10];
    id v12 = objc_alloc(MEMORY[0x1E4F29128]);
    v13 = [v3 homeIdentifier];
    id v14 = (void *)[v12 initWithUUIDString:v13];
    id v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v5];
    id v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v4];
    id v17 = [(HMAudioAnalysisEventBulletin *)v8 initWithAccessoryIdentifier:v11 homeIdentifier:v14 startDate:v15 endDate:v16 reason:v6 state:v7];
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

@end