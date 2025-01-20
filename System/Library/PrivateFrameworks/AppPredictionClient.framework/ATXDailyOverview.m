@interface ATXDailyOverview
+ (BOOL)supportsSecureCoding;
- (ATXDailyOverview)initWithCoder:(id)a3;
- (ATXDailyOverview)initWithType:(unint64_t)a3 sections:(id)a4 dailySummary:(id)a5 pinnedEvents:(id)a6;
- (ATXDailyTimeSummary)dailySummary;
- (NSArray)pinnedEvents;
- (NSArray)sections;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXDailyOverview

- (ATXDailyOverview)initWithType:(unint64_t)a3 sections:(id)a4 dailySummary:(id)a5 pinnedEvents:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ATXDailyOverview;
  v13 = [(ATXDailyOverview *)&v20 init];
  v14 = v13;
  if (v13)
  {
    v13->_type = a3;
    uint64_t v15 = [v10 copy];
    sections = v14->_sections;
    v14->_sections = (NSArray *)v15;

    objc_storeStrong((id *)&v14->_dailySummary, a5);
    uint64_t v17 = [v12 copy];
    pinnedEvents = v14->_pinnedEvents;
    v14->_pinnedEvents = (NSArray *)v17;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXDailyOverview)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ATXDailyOverview;
  v5 = [(ATXDailyOverview *)&v24 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    v6 = (void *)MEMORY[0x1AD0D3C30]();
    id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v8 = self;
    v9 = self;
    id v10 = objc_msgSend(v7, "initWithObjects:", v8, v9, 0);

    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"sections"];
    sections = v5->_sections;
    v5->_sections = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dailySummary"];
    dailySummary = v5->_dailySummary;
    v5->_dailySummary = (ATXDailyTimeSummary *)v13;

    uint64_t v15 = (void *)MEMORY[0x1AD0D3C30]();
    id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v17 = self;
    v18 = self;
    v19 = objc_msgSend(v16, "initWithObjects:", v17, v18, 0);

    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"pinnedEvents"];
    pinnedEvents = v5->_pinnedEvents;
    v5->_pinnedEvents = (NSArray *)v20;

    v22 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_sections forKey:@"sections"];
  [v5 encodeObject:self->_dailySummary forKey:@"dailySummary"];
  [v5 encodeObject:self->_pinnedEvents forKey:@"pinnedEvents"];
}

- (unint64_t)type
{
  return self->_type;
}

- (NSArray)sections
{
  return self->_sections;
}

- (ATXDailyTimeSummary)dailySummary
{
  return self->_dailySummary;
}

- (NSArray)pinnedEvents
{
  return self->_pinnedEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedEvents, 0);
  objc_storeStrong((id *)&self->_dailySummary, 0);

  objc_storeStrong((id *)&self->_sections, 0);
}

@end