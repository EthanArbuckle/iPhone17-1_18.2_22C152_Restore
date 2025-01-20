@interface SRApplicationUsage
+ (BOOL)supportsSecureCoding;
+ (SRApplicationUsage)applicationUsageWithBundleIdentifier:(id)a3 reportApplicationIdentifier:(id)a4 totalUsageTime:(double)a5 relativeStartTime:(double)a6;
+ (SRApplicationUsage)applicationUsageWithBundleIdentifier:(id)a3 reportApplicationIdentifier:(id)a4 totalUsageTime:(double)a5 relativeStartTime:(double)a6 textInputSessions:(id)a7 supplementalCategories:(id)a8;
- (BOOL)isEqual:(id)a3;
- (NSArray)supplementalCategories;
- (NSArray)textInputSessions;
- (NSMutableArray)mutableSupplementalCategories;
- (NSMutableArray)mutableTextInputSessions;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)reportApplicationIdentifier;
- (NSTimeInterval)relativeStartTime;
- (NSTimeInterval)usageTime;
- (SRApplicationUsage)initWithCoder:(id)a3;
- (id)sr_dictionaryRepresentation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setMutableSupplementalCategories:(id)a3;
- (void)setMutableTextInputSessions:(id)a3;
- (void)setRelativeStartTime:(double)a3;
- (void)setReportApplicationIdentifier:(id)a3;
- (void)setUsageTime:(double)a3;
@end

@implementation SRApplicationUsage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRUsageReports.m", 366, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[SRApplicationUsage bundleIdentifier](self, "bundleIdentifier"), @"bundleIdentifier");
  [(SRApplicationUsage *)self usageTime];
  objc_msgSend(a3, "encodeDouble:forKey:", @"totalUsageTime");
  [(SRApplicationUsage *)self relativeStartTime];
  objc_msgSend(a3, "encodeDouble:forKey:", @"relativeStartTime");
  objc_msgSend(a3, "encodeObject:forKey:", -[SRApplicationUsage reportApplicationIdentifier](self, "reportApplicationIdentifier"), @"reportApplicationIdentifier");
  objc_msgSend(a3, "encodeObject:forKey:", -[SRApplicationUsage mutableTextInputSessions](self, "mutableTextInputSessions"), @"textInputSessions");
  v6 = [(SRApplicationUsage *)self supplementalCategories];

  [a3 encodeObject:v6 forKey:@"supplementalCategories"];
}

- (SRApplicationUsage)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRUsageReports.m", 376, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  [a3 decodeDoubleForKey:@"totalUsageTime"];
  double v8 = v7;
  [a3 decodeDoubleForKey:@"relativeStartTime"];
  double v10 = v9;
  uint64_t v11 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"reportApplicationIdentifier"];
  v12 = (void *)MEMORY[0x263EFFA08];
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0), @"textInputSessions"), "mutableCopy");
  v15 = (void *)MEMORY[0x263EFFA08];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0), @"supplementalCategories"), "mutableCopy");

  v19 = objc_alloc_init(SRApplicationUsage);
  [(SRApplicationUsage *)v19 setBundleIdentifier:v6];
  [(SRApplicationUsage *)v19 setUsageTime:v8];
  [(SRApplicationUsage *)v19 setRelativeStartTime:v10];
  [(SRApplicationUsage *)v19 setMutableTextInputSessions:v14];

  [(SRApplicationUsage *)v19 setMutableSupplementalCategories:v18];
  if (v11) {
    v20 = (__CFString *)v11;
  }
  else {
    v20 = &stru_26D165EC8;
  }
  [(SRApplicationUsage *)v19 setReportApplicationIdentifier:v20];
  return v19;
}

+ (SRApplicationUsage)applicationUsageWithBundleIdentifier:(id)a3 reportApplicationIdentifier:(id)a4 totalUsageTime:(double)a5 relativeStartTime:(double)a6
{
  return (SRApplicationUsage *)[a1 applicationUsageWithBundleIdentifier:a3 reportApplicationIdentifier:a4 totalUsageTime:MEMORY[0x263EFFA68] relativeStartTime:MEMORY[0x263EFFA68] textInputSessions:a5 supplementalCategories:a6];
}

+ (SRApplicationUsage)applicationUsageWithBundleIdentifier:(id)a3 reportApplicationIdentifier:(id)a4 totalUsageTime:(double)a5 relativeStartTime:(double)a6 textInputSessions:(id)a7 supplementalCategories:(id)a8
{
  v14 = objc_alloc_init(SRApplicationUsage);
  [(SRApplicationUsage *)v14 setBundleIdentifier:a3];
  [(SRApplicationUsage *)v14 setUsageTime:a5];
  [(SRApplicationUsage *)v14 setRelativeStartTime:a6];
  [(SRApplicationUsage *)v14 setReportApplicationIdentifier:a4];
  -[SRApplicationUsage setMutableTextInputSessions:](v14, "setMutableTextInputSessions:", [MEMORY[0x263EFF980] arrayWithArray:a7]);
  -[SRApplicationUsage setMutableSupplementalCategories:](v14, "setMutableSupplementalCategories:", [MEMORY[0x263EFF980] arrayWithArray:a8]);

  return v14;
}

- (NSArray)textInputSessions
{
  if (![(SRApplicationUsage *)self mutableTextInputSessions]) {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
  v3 = (void *)MEMORY[0x263EFF8C0];
  v4 = [(SRApplicationUsage *)self mutableTextInputSessions];

  return (NSArray *)[v3 arrayWithArray:v4];
}

- (NSArray)supplementalCategories
{
  if (![(SRApplicationUsage *)self mutableSupplementalCategories]) {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
  v3 = (void *)MEMORY[0x263EFF8C0];
  v4 = [(SRApplicationUsage *)self mutableSupplementalCategories];

  return (NSArray *)[v3 arrayWithArray:v4];
}

- (void)dealloc
{
  [(SRApplicationUsage *)self setBundleIdentifier:0];
  [(SRApplicationUsage *)self setReportApplicationIdentifier:0];

  v3.receiver = self;
  v3.super_class = (Class)SRApplicationUsage;
  [(SRApplicationUsage *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(SRApplicationUsage *)self bundleIdentifier];
  [(SRApplicationUsage *)self usageTime];
  uint64_t v8 = v7;
  [(SRApplicationUsage *)self relativeStartTime];
  return (NSString *)[v3 stringWithFormat:@"%@ {bundleIdentifier: %@, totalUsageTime: %f, relativeStartTime:%f reportApplicationIdentifier: %@, textInputSessions: %@, supplementalCategories: %@}", v5, v6, v8, v9, -[SRApplicationUsage reportApplicationIdentifier](self, "reportApplicationIdentifier"), -[SRApplicationUsage textInputSessions](self, "textInputSessions"), -[SRApplicationUsage supplementalCategories](self, "supplementalCategories")];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v19) = 1;
    return v19;
  }
  uint64_t v23 = v10;
  uint64_t v24 = v9;
  uint64_t v25 = v6;
  uint64_t v26 = v5;
  uint64_t v27 = v4;
  uint64_t v28 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_16:
    LOBYTE(v19) = 0;
    return v19;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    goto LABEL_6;
  }
  if ([a3 bundleIdentifier])
  {
    bundleIdentifier = self->_bundleIdentifier;
LABEL_6:
    int v14 = !-[NSString isEqualToString:](bundleIdentifier, "isEqualToString:", objc_msgSend(a3, "bundleIdentifier", v10, v9, v6, v26, v27, v28, v7, v8));
    goto LABEL_7;
  }
  int v14 = 0;
LABEL_7:
  reportApplicationIdentifier = self->_reportApplicationIdentifier;
  if (!reportApplicationIdentifier)
  {
    if (![a3 reportApplicationIdentifier])
    {
      int v16 = 0;
      goto LABEL_11;
    }
    reportApplicationIdentifier = self->_reportApplicationIdentifier;
  }
  int v16 = !-[NSString isEqualToString:](reportApplicationIdentifier, "isEqualToString:", objc_msgSend(a3, "reportApplicationIdentifier", v23, v24, v25, v26, v27, v28));
LABEL_11:
  if ((v14 | v16)) {
    goto LABEL_16;
  }
  double usageTime = self->_usageTime;
  [a3 usageTime];
  if (usageTime != v18) {
    goto LABEL_16;
  }
  BOOL v19 = -[NSArray isEqualToArray:](-[SRApplicationUsage textInputSessions](self, "textInputSessions"), "isEqualToArray:", [a3 textInputSessions]);
  if (v19)
  {
    BOOL v19 = -[NSArray isEqualToArray:](-[SRApplicationUsage supplementalCategories](self, "supplementalCategories"), "isEqualToArray:", [a3 supplementalCategories]);
    if (v19)
    {
      double relativeStartTime = self->_relativeStartTime;
      [a3 relativeStartTime];
      LOBYTE(v19) = relativeStartTime == v21;
    }
  }
  return v19;
}

- (id)sr_dictionaryRepresentation
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](-[SRApplicationUsage textInputSessions](self, "textInputSessions"), "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v4 = [(SRApplicationUsage *)self textInputSessions];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "sr_dictionaryRepresentation"));
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v6);
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](-[SRApplicationUsage supplementalCategories](self, "supplementalCategories"), "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v22 = self;
  uint64_t v10 = [(SRApplicationUsage *)self supplementalCategories];
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        if ([v15 conformsToProtocol:&unk_26D1759A8])
        {
          objc_msgSend(v9, "addObject:", objc_msgSend(v15, "sr_dictionaryRepresentation"));
        }
        else
        {
          int v16 = SRLogUsageReport;
          if (os_log_type_enabled((os_log_t)SRLogUsageReport, OS_LOG_TYPE_FAULT))
          {
            uint64_t v17 = (objc_class *)objc_opt_class();
            double v18 = NSStringFromClass(v17);
            *(_DWORD *)buf = 138543362;
            v34 = v18;
            _os_log_fault_impl(&dword_21FCA3000, v16, OS_LOG_TYPE_FAULT, "Unable to output usage of class %{public}@", buf, 0xCu);
            int v16 = SRLogUsageReport;
          }
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138477827;
            v34 = (NSString *)v15;
            _os_log_error_impl(&dword_21FCA3000, v16, OS_LOG_TYPE_ERROR, "%{private}@ does not conform to <SRSampleExporting> protocol. Excluding from dictionary output", buf, 0xCu);
          }
        }
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v12);
  }
  v31[0] = @"totalUsageTime";
  uint64_t v19 = [NSNumber numberWithDouble:v22->_usageTime];
  bundleIdentifier = &stru_26D165EC8;
  if (v22->_bundleIdentifier) {
    bundleIdentifier = (__CFString *)v22->_bundleIdentifier;
  }
  v32[0] = v19;
  v32[1] = bundleIdentifier;
  v31[1] = @"bundleIdentifier";
  v31[2] = @"reportApplicationIdentifier";
  v32[2] = v22->_reportApplicationIdentifier;
  v32[3] = v3;
  v31[3] = @"textInputSessions";
  v31[4] = @"supplementalCategories";
  v32[4] = v9;
  v31[5] = @"relativeStartTime";
  v32[5] = [NSNumber numberWithDouble:v22->_relativeStartTime];
  return (id)[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:6];
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSTimeInterval)usageTime
{
  return self->_usageTime;
}

- (void)setUsageTime:(double)a3
{
  self->_double usageTime = a3;
}

- (NSString)reportApplicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReportApplicationIdentifier:(id)a3
{
}

- (NSTimeInterval)relativeStartTime
{
  return self->_relativeStartTime;
}

- (void)setRelativeStartTime:(double)a3
{
  self->_double relativeStartTime = a3;
}

- (NSMutableArray)mutableTextInputSessions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMutableTextInputSessions:(id)a3
{
}

- (NSMutableArray)mutableSupplementalCategories
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMutableSupplementalCategories:(id)a3
{
}

@end