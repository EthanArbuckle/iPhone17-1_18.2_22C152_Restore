@interface CTSweetgumUsagePlanMetrics
+ (BOOL)supportsSecureCoding;
- (BOOL)currentUsedPlan;
- (BOOL)isEqual:(id)a3;
- (BOOL)throttled;
- (CTSweetgumUsagePlanItemData)dataUsage;
- (CTSweetgumUsagePlanItemMessages)messages;
- (CTSweetgumUsagePlanItemVoice)voice;
- (CTSweetgumUsagePlanMetrics)init;
- (CTSweetgumUsagePlanMetrics)initWithCoder:(id)a3;
- (NSDate)lastUpdatedAt;
- (NSString)planLabel;
- (NSString)remainingBalance;
- (id)description;
- (int64_t)planCategory;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentUsedPlan:(BOOL)a3;
- (void)setDataUsage:(id)a3;
- (void)setLastUpdatedAt:(id)a3;
- (void)setMessages:(id)a3;
- (void)setPlanCategory:(int64_t)a3;
- (void)setPlanLabel:(id)a3;
- (void)setRemainingBalance:(id)a3;
- (void)setThrottled:(BOOL)a3;
- (void)setVoice:(id)a3;
@end

@implementation CTSweetgumUsagePlanMetrics

- (CTSweetgumUsagePlanMetrics)init
{
  v11.receiver = self;
  v11.super_class = (Class)CTSweetgumUsagePlanMetrics;
  v2 = [(CTSweetgumUsagePlanMetrics *)&v11 init];
  v3 = v2;
  if (v2)
  {
    planLabel = v2->_planLabel;
    v2->_planLabel = 0;

    dataUsage = v3->_dataUsage;
    v3->_planCategory = 0;
    v3->_dataUsage = 0;
    v3->_currentUsedPlan = 0;

    messages = v3->_messages;
    v3->_messages = 0;

    voice = v3->_voice;
    v3->_voice = 0;

    remainingBalance = v3->_remainingBalance;
    v3->_remainingBalance = 0;

    v3->_throttled = 0;
    lastUpdatedAt = v3->_lastUpdatedAt;
    v3->_lastUpdatedAt = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSweetgumUsagePlanMetrics *)self planLabel];
  [v3 appendFormat:@", planLabel=%@", v4];

  [v3 appendFormat:@", planCategory=%s", CTSweetgumPlanCategoryAsString(-[CTSweetgumUsagePlanMetrics planCategory](self, "planCategory"))];
  [v3 appendFormat:@", currentUsedPlan=%d", -[CTSweetgumUsagePlanMetrics currentUsedPlan](self, "currentUsedPlan")];
  v5 = [(CTSweetgumUsagePlanMetrics *)self dataUsage];
  [v3 appendFormat:@", data=%@", v5];

  v6 = [(CTSweetgumUsagePlanMetrics *)self messages];
  [v3 appendFormat:@", messages=%@", v6];

  v7 = [(CTSweetgumUsagePlanMetrics *)self voice];
  [v3 appendFormat:@", voice=%@", v7];

  v8 = [(CTSweetgumUsagePlanMetrics *)self remainingBalance];
  [v3 appendFormat:@", remainingBalance=%@", v8];

  [v3 appendFormat:@", throttled=%d", -[CTSweetgumUsagePlanMetrics throttled](self, "throttled")];
  v9 = [(CTSweetgumUsagePlanMetrics *)self lastUpdatedAt];
  [v3 appendFormat:@", lastUpdatedAt=%@", v9];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v7 = (CTSweetgumUsagePlanMetrics *)a3;
  if (v7 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [(CTSweetgumUsagePlanMetrics *)self planLabel];
      v9 = [(CTSweetgumUsagePlanMetrics *)v7 planLabel];
      if (v8 != v9)
      {
        v3 = [(CTSweetgumUsagePlanMetrics *)self planLabel];
        v4 = [(CTSweetgumUsagePlanMetrics *)v7 planLabel];
        if (![v3 isEqualToString:v4])
        {
          char v10 = 0;
          goto LABEL_44;
        }
      }
      int64_t v11 = [(CTSweetgumUsagePlanMetrics *)self planCategory];
      if (v11 != [(CTSweetgumUsagePlanMetrics *)v7 planCategory]
        || (BOOL v12 = [(CTSweetgumUsagePlanMetrics *)self currentUsedPlan],
            v12 != [(CTSweetgumUsagePlanMetrics *)v7 currentUsedPlan]))
      {
        char v10 = 0;
        goto LABEL_43;
      }
      v13 = [(CTSweetgumUsagePlanMetrics *)self dataUsage];
      v14 = [(CTSweetgumUsagePlanMetrics *)v7 dataUsage];
      if (v13 != v14)
      {
        v5 = [(CTSweetgumUsagePlanMetrics *)self dataUsage];
        v15 = [(CTSweetgumUsagePlanMetrics *)v7 dataUsage];
        if (![v5 isEqual:v15])
        {
          char v10 = 0;
          goto LABEL_41;
        }
        v53 = v15;
      }
      uint64_t v16 = [(CTSweetgumUsagePlanMetrics *)self messages];
      uint64_t v17 = [(CTSweetgumUsagePlanMetrics *)v7 messages];
      v55 = v13;
      v56 = (void *)v16;
      BOOL v18 = v16 == v17;
      v19 = (void *)v17;
      if (v18)
      {
        v54 = (void *)v17;
      }
      else
      {
        v20 = v5;
        v21 = [(CTSweetgumUsagePlanMetrics *)self messages];
        v51 = [(CTSweetgumUsagePlanMetrics *)v7 messages];
        v52 = v21;
        if (!objc_msgSend(v21, "isEqual:"))
        {
          char v10 = 0;
          v24 = v19;
          v27 = v56;
LABEL_39:

LABEL_40:
          v15 = v53;
          v5 = v20;
          v13 = v55;
          if (v55 == v14)
          {
LABEL_42:

LABEL_43:
            if (v8 == v9)
            {
LABEL_45:

              goto LABEL_46;
            }
LABEL_44:

            goto LABEL_45;
          }
LABEL_41:

          goto LABEL_42;
        }
        v54 = v19;
        v5 = v20;
      }
      uint64_t v22 = [(CTSweetgumUsagePlanMetrics *)self voice];
      uint64_t v49 = [(CTSweetgumUsagePlanMetrics *)v7 voice];
      v50 = (void *)v22;
      v48 = v14;
      if (v22 != v49)
      {
        v23 = [(CTSweetgumUsagePlanMetrics *)self voice];
        v44 = [(CTSweetgumUsagePlanMetrics *)v7 voice];
        v45 = v23;
        if (!objc_msgSend(v23, "isEqual:"))
        {
          v20 = v5;
          v24 = v54;
          char v10 = 0;
          v25 = (void *)v49;
          v26 = v50;
LABEL_37:

LABEL_38:
          v27 = v56;
          v14 = v48;
          if (v56 == v24) {
            goto LABEL_40;
          }
          goto LABEL_39;
        }
      }
      uint64_t v28 = [(CTSweetgumUsagePlanMetrics *)self remainingBalance];
      uint64_t v46 = [(CTSweetgumUsagePlanMetrics *)v7 remainingBalance];
      v47 = (void *)v28;
      if (v28 == v46)
      {
        v43 = v5;
      }
      else
      {
        v29 = [(CTSweetgumUsagePlanMetrics *)self remainingBalance];
        v41 = [(CTSweetgumUsagePlanMetrics *)v7 remainingBalance];
        v42 = v29;
        int v30 = objc_msgSend(v29, "isEqualToString:");
        v31 = v54;
        if (!v30)
        {
          v20 = v5;
          char v10 = 0;
          v39 = (void *)v46;
          v38 = v47;
          goto LABEL_34;
        }
        v43 = v5;
      }
      BOOL v32 = [(CTSweetgumUsagePlanMetrics *)self throttled];
      if (v32 == [(CTSweetgumUsagePlanMetrics *)v7 throttled])
      {
        v33 = [(CTSweetgumUsagePlanMetrics *)self lastUpdatedAt];
        uint64_t v34 = [(CTSweetgumUsagePlanMetrics *)v7 lastUpdatedAt];
        if (v33 == (void *)v34)
        {

          char v10 = 1;
        }
        else
        {
          v35 = (void *)v34;
          v36 = [(CTSweetgumUsagePlanMetrics *)self lastUpdatedAt];
          v37 = [(CTSweetgumUsagePlanMetrics *)v7 lastUpdatedAt];
          char v10 = [v36 isEqualToDate:v37];
        }
      }
      else
      {
        char v10 = 0;
      }
      v39 = (void *)v46;
      v38 = v47;
      v20 = v43;
      v31 = v54;
      if (v47 == (void *)v46)
      {
        v24 = v54;
LABEL_36:

        v25 = (void *)v49;
        v26 = v50;
        if (v50 == (void *)v49) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
LABEL_34:
      v24 = v31;

      goto LABEL_36;
    }
    char v10 = 0;
  }
LABEL_46:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  planLabel = self->_planLabel;
  id v5 = a3;
  [v5 encodeObject:planLabel forKey:@"planLabel"];
  [v5 encodeInteger:self->_planCategory forKey:@"planCategory"];
  [v5 encodeBool:self->_currentUsedPlan forKey:@"currentUsedPlan"];
  [v5 encodeObject:self->_dataUsage forKey:@"dataUsage"];
  [v5 encodeObject:self->_messages forKey:@"messages"];
  [v5 encodeObject:self->_voice forKey:@"voice"];
  [v5 encodeObject:self->_remainingBalance forKey:@"remainingBalance"];
  [v5 encodeBool:self->_throttled forKey:@"throttled"];
  [v5 encodeObject:self->_lastUpdatedAt forKey:@"lastUpdatedAt"];
}

- (CTSweetgumUsagePlanMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTSweetgumUsagePlanMetrics;
  id v5 = [(CTSweetgumUsagePlanMetrics *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"planLabel"];
    planLabel = v5->_planLabel;
    v5->_planLabel = (NSString *)v6;

    v5->_planCategory = [v4 decodeIntegerForKey:@"planCategory"];
    v5->_currentUsedPlan = [v4 decodeBoolForKey:@"currentUsedPlan"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataUsage"];
    dataUsage = v5->_dataUsage;
    v5->_dataUsage = (CTSweetgumUsagePlanItemData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messages"];
    messages = v5->_messages;
    v5->_messages = (CTSweetgumUsagePlanItemMessages *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"voice"];
    voice = v5->_voice;
    v5->_voice = (CTSweetgumUsagePlanItemVoice *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remainingBalance"];
    remainingBalance = v5->_remainingBalance;
    v5->_remainingBalance = (NSString *)v14;

    v5->_throttled = [v4 decodeBoolForKey:@"throttled"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdatedAt"];
    lastUpdatedAt = v5->_lastUpdatedAt;
    v5->_lastUpdatedAt = (NSDate *)v16;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)planLabel
{
  return self->_planLabel;
}

- (void)setPlanLabel:(id)a3
{
}

- (int64_t)planCategory
{
  return self->_planCategory;
}

- (void)setPlanCategory:(int64_t)a3
{
  self->_planCategory = a3;
}

- (BOOL)currentUsedPlan
{
  return self->_currentUsedPlan;
}

- (void)setCurrentUsedPlan:(BOOL)a3
{
  self->_currentUsedPlan = a3;
}

- (CTSweetgumUsagePlanItemData)dataUsage
{
  return self->_dataUsage;
}

- (void)setDataUsage:(id)a3
{
}

- (CTSweetgumUsagePlanItemMessages)messages
{
  return self->_messages;
}

- (void)setMessages:(id)a3
{
}

- (CTSweetgumUsagePlanItemVoice)voice
{
  return self->_voice;
}

- (void)setVoice:(id)a3
{
}

- (NSString)remainingBalance
{
  return self->_remainingBalance;
}

- (void)setRemainingBalance:(id)a3
{
}

- (BOOL)throttled
{
  return self->_throttled;
}

- (void)setThrottled:(BOOL)a3
{
  self->_throttled = a3;
}

- (NSDate)lastUpdatedAt
{
  return self->_lastUpdatedAt;
}

- (void)setLastUpdatedAt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedAt, 0);
  objc_storeStrong((id *)&self->_remainingBalance, 0);
  objc_storeStrong((id *)&self->_voice, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_dataUsage, 0);

  objc_storeStrong((id *)&self->_planLabel, 0);
}

@end