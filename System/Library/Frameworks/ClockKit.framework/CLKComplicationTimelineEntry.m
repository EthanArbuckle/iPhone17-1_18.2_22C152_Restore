@interface CLKComplicationTimelineEntry
+ (BOOL)supportsSecureCoding;
+ (CLKComplicationTimelineEntry)entryWithDate:(NSDate *)date complicationTemplate:(CLKComplicationTemplate *)complicationTemplate;
+ (CLKComplicationTimelineEntry)entryWithDate:(NSDate *)date complicationTemplate:(CLKComplicationTemplate *)complicationTemplate timelineAnimationGroup:(NSString *)timelineAnimationGroup;
- (BOOL)finalized;
- (BOOL)tl_validate:(id *)a3;
- (BOOL)validateComplicationFamily:(int64_t)a3;
- (BOOL)validateWithError:(id *)a3;
- (CLKComplicationTemplate)complicationTemplate;
- (CLKComplicationTimelineEntry)initWithCoder:(id)a3;
- (NSDate)date;
- (NSString)description;
- (NSString)timelineAnimationGroup;
- (id)copyWithZone:(_NSZone *)a3;
- (id)finalizedCopy;
- (void)encodeWithCoder:(id)a3;
- (void)finalize;
- (void)setComplicationTemplate:(CLKComplicationTemplate *)complicationTemplate;
- (void)setDate:(NSDate *)date;
- (void)setFinalized:(BOOL)a3;
- (void)setTimelineAnimationGroup:(NSString *)timelineAnimationGroup;
@end

@implementation CLKComplicationTimelineEntry

+ (CLKComplicationTimelineEntry)entryWithDate:(NSDate *)date complicationTemplate:(CLKComplicationTemplate *)complicationTemplate
{
  return (CLKComplicationTimelineEntry *)[a1 entryWithDate:date complicationTemplate:complicationTemplate timelineAnimationGroup:0];
}

+ (CLKComplicationTimelineEntry)entryWithDate:(NSDate *)date complicationTemplate:(CLKComplicationTemplate *)complicationTemplate timelineAnimationGroup:(NSString *)timelineAnimationGroup
{
  v8 = timelineAnimationGroup;
  v9 = complicationTemplate;
  v10 = date;
  id v11 = objc_alloc_init((Class)a1);
  [v11 setDate:v10];

  [v11 setComplicationTemplate:v9];
  [v11 setTimelineAnimationGroup:v8];

  return (CLKComplicationTimelineEntry *)v11;
}

- (BOOL)validateComplicationFamily:(int64_t)a3
{
  p_complicationTemplate = &self->_complicationTemplate;
  BOOL v5 = -[CLKComplicationTemplate isCompatibleWithFamily:](self->_complicationTemplate, "isCompatibleWithFamily:");
  if (!v5)
  {
    v6 = CLKLoggingObjectForDomain(10);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      [(CLKComplicationTimelineEntry *)a3 validateComplicationFamily:v6];
    }
  }
  return v5;
}

- (BOOL)validateWithError:(id *)a3
{
  v3 = a3;
  v14[1] = *MEMORY[0x263EF8340];
  if (self->_date)
  {
    complicationTemplate = self->_complicationTemplate;
    if (complicationTemplate)
    {
      LOBYTE(v3) = [(CLKComplicationTemplate *)complicationTemplate validateWithError:a3];
      BOOL v5 = 0;
      goto LABEL_13;
    }
    v6 = @"complicationTemplate";
  }
  else
  {
    v6 = @"date";
  }
  v7 = NSString;
  uint64_t v8 = objc_opt_class();
  BOOL v5 = [v7 stringWithFormat:@"Property '%@' is not set on %@. This property must not be nil when passing %@ to the complication data handler.", v6, v8, objc_opt_class()];
  if (!v5)
  {
LABEL_12:
    LOBYTE(v3) = 0;
    goto LABEL_13;
  }
  v9 = CLKLoggingObjectForDomain(10);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    -[CLKComplicationTimelineEntry validateWithError:]((uint64_t)v5, v9);
  }

  if (v3)
  {
    if (!*v3)
    {
      v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = *MEMORY[0x263F08320];
      v14[0] = v5;
      id v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
      id *v3 = [v10 errorWithDomain:@"CLKComplicationTimelineErrorDomain" code:1 userInfo:v11];
    }
    goto LABEL_12;
  }
LABEL_13:

  return (char)v3;
}

- (void)finalize
{
  if (!self->_finalized)
  {
    v3 = [(CLKComplicationTemplate *)self->_complicationTemplate finalizedCopyClass];
    complicationTemplate = self->_complicationTemplate;
    if (v3)
    {
      BOOL v5 = [(CLKComplicationTemplate *)complicationTemplate finalizedCopy];
      v6 = self->_complicationTemplate;
      self->_complicationTemplate = v5;
    }
    else
    {
      [(CLKComplicationTemplate *)complicationTemplate finalize];
    }
    self->_finalized = 1;
  }
}

- (id)finalizedCopy
{
  if (self->_finalized)
  {
    v2 = self;
  }
  else
  {
    v2 = (CLKComplicationTimelineEntry *)[(CLKComplicationTimelineEntry *)self copy];
    [(CLKComplicationTimelineEntry *)v2 finalize];
  }

  return v2;
}

- (BOOL)tl_validate:(id *)a3
{
  BOOL v4 = -[CLKComplicationTimelineEntry validateWithError:](self, "validateWithError:");
  BOOL v5 = v4;
  if (a3 && !v4)
  {
    *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"CLKComplicationEntryError" code:400 userInfo:&unk_26CCDC558];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  date = self->_date;
  id v5 = a3;
  [v5 encodeObject:date forKey:@"date"];
  [v5 encodeObject:self->_complicationTemplate forKey:@"tmpl"];
  [v5 encodeObject:self->_timelineAnimationGroup forKey:@"anim"];
  [v5 encodeBool:self->_finalized forKey:@"finalized"];
}

- (CLKComplicationTimelineEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CLKComplicationTimelineEntry *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tmpl"];
    complicationTemplate = v5->_complicationTemplate;
    v5->_complicationTemplate = (CLKComplicationTemplate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anim"];
    timelineAnimationGroup = v5->_timelineAnimationGroup;
    v5->_timelineAnimationGroup = (NSString *)v10;

    v5->_finalized = [v4 decodeBoolForKey:@"finalized"];
  }

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CLKComplicationTimelineEntry;
  id v4 = [(CLKComplicationTimelineEntry *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@ date = %@, template = %@, animationGroup = %@", v4, self->_date, self->_complicationTemplate, self->_timelineAnimationGroup];

  return (NSString *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_finalized)
  {
    return self;
  }
  else
  {
    id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
    [v4 setDate:self->_date];
    [v4 setComplicationTemplate:self->_complicationTemplate];
    [v4 setTimelineAnimationGroup:self->_timelineAnimationGroup];
    return v4;
  }
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(NSDate *)date
{
}

- (CLKComplicationTemplate)complicationTemplate
{
  return self->_complicationTemplate;
}

- (void)setComplicationTemplate:(CLKComplicationTemplate *)complicationTemplate
{
}

- (NSString)timelineAnimationGroup
{
  return self->_timelineAnimationGroup;
}

- (void)setTimelineAnimationGroup:(NSString *)timelineAnimationGroup
{
}

- (BOOL)finalized
{
  return self->_finalized;
}

- (void)setFinalized:(BOOL)a3
{
  self->_finalized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineAnimationGroup, 0);
  objc_storeStrong((id *)&self->_complicationTemplate, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

- (void)validateComplicationFamily:(NSObject *)a3 .cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = CLKStringForComplicationFamily(a1);
  uint64_t v6 = CLKStringForComplicationFamily([*a2 compatibleFamily]);
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_fault_impl(&dword_21C599000, a3, OS_LOG_TYPE_FAULT, "Data handler called with incompatible template for complication family. Expected template for '%@', but received one for '%@'.", (uint8_t *)&v7, 0x16u);
}

- (void)validateWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_21C599000, a2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v2, 0xCu);
}

@end