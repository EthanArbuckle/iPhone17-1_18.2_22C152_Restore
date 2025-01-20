@interface ATXScheduledTimeEvent
+ (BOOL)supportsSecureCoding;
+ (UTType)uniformType;
- (ATXScheduledTimeEvent)initWithCoder:(id)a3;
- (ATXScheduledTimeEvent)initWithDomainIdentifier:(id)a3 identifier:(id)a4 eventDescription:(id)a5 startDate:(id)a6 endDate:(id)a7 priority:(int64_t)a8 source:(id)a9 relevanceTag:(int64_t)a10 fuzzyTime:(int64_t)a11 context:(id)a12 isGap:(BOOL)a13 isPast:(BOOL)a14 isAllDayEvent:(BOOL)a15 isCompleted:(BOOL)a16 etaMinutes:(double)a17 mediumPresentation:(id)a18 smallPresentation:(id)a19 glyphPresentation:(id)a20 sourceLocation:(id)a21 destinationLocation:(id)a22 actions:(id)a23 feedbackOptions:(id)a24;
- (ATXTimeContext)context;
- (ATXTimeEventLocation)destinationLocation;
- (ATXTimeEventLocation)sourceLocation;
- (ATXTimeEventPresentation)mediumPresentation;
- (ATXTimeEventPresentation)smallPresentation;
- (ATXTimeEventSource)source;
- (ATXTimeGlyphPresentation)glyphPresentation;
- (BOOL)isAllDayEvent;
- (BOOL)isCompleted;
- (BOOL)isGap;
- (BOOL)isPast;
- (NSArray)actions;
- (NSArray)feedbackOptions;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)domainIdentifier;
- (NSString)eventDescription;
- (NSString)identifier;
- (double)etaMinutes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)fuzzyTime;
- (int64_t)priority;
- (int64_t)relevanceTag;
- (void)encodeWithCoder:(id)a3;
- (void)setIsCompleted:(BOOL)a3;
@end

@implementation ATXScheduledTimeEvent

+ (UTType)uniformType
{
  return (UTType *)[MEMORY[0x1E4F442D8] exportedTypeWithIdentifier:@"com.proactive.scheduledTimeEvent" conformingToType:*MEMORY[0x1E4F44408]];
}

- (ATXScheduledTimeEvent)initWithDomainIdentifier:(id)a3 identifier:(id)a4 eventDescription:(id)a5 startDate:(id)a6 endDate:(id)a7 priority:(int64_t)a8 source:(id)a9 relevanceTag:(int64_t)a10 fuzzyTime:(int64_t)a11 context:(id)a12 isGap:(BOOL)a13 isPast:(BOOL)a14 isAllDayEvent:(BOOL)a15 isCompleted:(BOOL)a16 etaMinutes:(double)a17 mediumPresentation:(id)a18 smallPresentation:(id)a19 glyphPresentation:(id)a20 sourceLocation:(id)a21 destinationLocation:(id)a22 actions:(id)a23 feedbackOptions:(id)a24
{
  id v58 = a3;
  id v57 = a4;
  id v56 = a5;
  id obj = a6;
  id v55 = a6;
  id v29 = a7;
  id v30 = a9;
  id v31 = a12;
  id v32 = a18;
  id v54 = a19;
  id v33 = a20;
  id v53 = a21;
  id v34 = a22;
  id v35 = a23;
  id v36 = a24;
  v59.receiver = self;
  v59.super_class = (Class)ATXScheduledTimeEvent;
  v37 = [(ATXScheduledTimeEvent *)&v59 init];
  if (v37)
  {
    uint64_t v38 = [v58 copy];
    domainIdentifier = v37->_domainIdentifier;
    v37->_domainIdentifier = (NSString *)v38;

    uint64_t v40 = [v57 copy];
    identifier = v37->_identifier;
    v37->_identifier = (NSString *)v40;

    uint64_t v42 = [v56 copy];
    eventDescription = v37->_eventDescription;
    v37->_eventDescription = (NSString *)v42;

    objc_storeStrong((id *)&v37->_startDate, obj);
    objc_storeStrong((id *)&v37->_endDate, a7);
    v37->_priority = a8;
    objc_storeStrong((id *)&v37->_source, a9);
    v37->_relevanceTag = a10;
    v37->_fuzzyTime = a11;
    objc_storeStrong((id *)&v37->_context, a12);
    v37->_isGap = a13;
    v37->_isPast = a14;
    v37->_isAllDayEvent = a15;
    v37->_isCompleted = a16;
    v37->_etaMinutes = a17;
    objc_storeStrong((id *)&v37->_mediumPresentation, a18);
    objc_storeStrong((id *)&v37->_smallPresentation, a19);
    objc_storeStrong((id *)&v37->_glyphPresentation, a20);
    objc_storeStrong((id *)&v37->_sourceLocation, a21);
    objc_storeStrong((id *)&v37->_destinationLocation, a22);
    uint64_t v44 = [v35 copy];
    actions = v37->_actions;
    v37->_actions = (NSArray *)v44;

    uint64_t v46 = [v36 copy];
    feedbackOptions = v37->_feedbackOptions;
    v37->_feedbackOptions = (NSArray *)v46;

    v48 = v37;
  }

  return v37;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL isGap = self->_isGap;
  id v5 = a3;
  [v5 encodeBool:isGap forKey:@"gap"];
  [v5 encodeBool:self->_isPast forKey:@"past"];
  [v5 encodeBool:self->_isAllDayEvent forKey:@"allDay"];
  [v5 encodeInteger:self->_relevanceTag forKey:@"relevanceTag"];
  [v5 encodeInteger:self->_fuzzyTime forKey:@"fuzzyTime"];
  [v5 encodeBool:self->_isCompleted forKey:@"complete"];
  [v5 encodeInteger:self->_priority forKey:@"priority"];
  [v5 encodeObject:self->_eventDescription forKey:@"eventDescription"];
  [v5 encodeObject:self->_startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  [v5 encodeObject:self->_mediumPresentation forKey:@"mediumPresentation"];
  [v5 encodeObject:self->_smallPresentation forKey:@"smallPresentation"];
  [v5 encodeObject:self->_glyphPresentation forKey:@"glyphPresentation"];
  [v5 encodeObject:self->_destinationLocation forKey:@"locationDest"];
  [v5 encodeObject:self->_sourceLocation forKey:@"locationSource"];
  [v5 encodeDouble:@"minutes" forKey:self->_etaMinutes];
  [v5 encodeObject:self->_source forKey:@"source"];
  [v5 encodeObject:self->_domainIdentifier forKey:@"domainIdentifier"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_context forKey:@"context"];
  [v5 encodeObject:self->_actions forKey:@"actions"];
  [v5 encodeObject:self->_feedbackOptions forKey:@"feedbackOptions"];
}

- (ATXScheduledTimeEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)ATXScheduledTimeEvent;
  id v5 = [(ATXScheduledTimeEvent *)&v36 init];
  if (v5)
  {
    v5->_BOOL isGap = [v4 decodeBoolForKey:@"gap"];
    v5->_isPast = [v4 decodeBoolForKey:@"past"];
    v5->_isAllDayEvent = [v4 decodeBoolForKey:@"allDay"];
    v5->_relevanceTag = [v4 decodeIntegerForKey:@"relevanceTag"];
    v5->_fuzzyTime = [v4 decodeIntegerForKey:@"fuzzyTime"];
    v5->_isCompleted = [v4 decodeBoolForKey:@"complete"];
    v5->_priority = [v4 decodeIntegerForKey:@"priority"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventDescription"];
    eventDescription = v5->_eventDescription;
    v5->_eventDescription = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediumPresentation"];
    mediumPresentation = v5->_mediumPresentation;
    v5->_mediumPresentation = (ATXTimeEventPresentation *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"smallPresentation"];
    smallPresentation = v5->_smallPresentation;
    v5->_smallPresentation = (ATXTimeEventPresentation *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"glyphPresentation"];
    glyphPresentation = v5->_glyphPresentation;
    v5->_glyphPresentation = (ATXTimeGlyphPresentation *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationSource"];
    sourceLocation = v5->_sourceLocation;
    v5->_sourceLocation = (ATXTimeEventLocation *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationDest"];
    destinationLocation = v5->_destinationLocation;
    v5->_destinationLocation = (ATXTimeEventLocation *)v20;

    [v4 decodeDoubleForKey:@"minutes"];
    v5->_etaMinutes = v22;
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];
    source = v5->_source;
    v5->_source = (ATXTimeEventSource *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domainIdentifier"];
    domainIdentifier = v5->_domainIdentifier;
    v5->_domainIdentifier = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
    context = v5->_context;
    v5->_context = (ATXTimeContext *)v29;

    uint64_t v31 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"actions"];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v31;

    uint64_t v33 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"feedbackOptions"];
    feedbackOptions = v5->_feedbackOptions;
    v5->_feedbackOptions = (NSArray *)v33;
  }
  return v5;
}

- (id)description
{
  if (self->_isGap)
  {
    v2 = @"\n\nGap\n";
  }
  else
  {
    id v4 = NSString;
    BOOL isPast = self->_isPast;
    int64_t priority = self->_priority;
    eventDescription = self->_eventDescription;
    uint64_t v8 = [MEMORY[0x1E4F28C10] localizedStringFromDate:self->_startDate dateStyle:1 timeStyle:1];
    v9 = [MEMORY[0x1E4F28C10] localizedStringFromDate:self->_endDate dateStyle:1 timeStyle:1];
    uint64_t v10 = [(ATXTimeEventLocation *)self->_destinationLocation geoLocation];
    v11 = [(ATXTimeEventLocation *)self->_destinationLocation title];
    v2 = [v4 stringWithFormat:@"\n\nPriority: %ld\nIs Past: %d\nEvent Description: %@\nStart Date: %@\nEnd Date: %@\nGeoLocation: %@\nLocation Title: %@\nLOI Type: %ld\n", priority, isPast, eventDescription, v8, v9, v10, v11, -[ATXTimeEventLocation destinationLOIType](self->_destinationLocation, "destinationLOIType")];
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  LODWORD(v6) = *(_DWORD *)&self->_isGap;
  return (id)objc_msgSend(v4, "initWithDomainIdentifier:identifier:eventDescription:startDate:endDate:priority:source:relevanceTag:fuzzyTime:context:isGap:isPast:isAllDayEvent:isCompleted:etaMinutes:mediumPresentation:smallPresentation:glyphPresentation:sourceLocation:destinationLocation:actions:feedbackOptions:", self->_domainIdentifier, self->_identifier, self->_eventDescription, self->_startDate, self->_endDate, self->_priority, self->_etaMinutes, self->_source, self->_relevanceTag, self->_fuzzyTime, self->_context, v6, self->_mediumPresentation, self->_smallPresentation, self->_glyphPresentation,
               self->_sourceLocation,
               self->_destinationLocation,
               self->_actions,
               self->_feedbackOptions);
}

- (BOOL)isGap
{
  return self->_isGap;
}

- (BOOL)isPast
{
  return self->_isPast;
}

- (BOOL)isAllDayEvent
{
  return self->_isAllDayEvent;
}

- (int64_t)fuzzyTime
{
  return self->_fuzzyTime;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (int64_t)relevanceTag
{
  return self->_relevanceTag;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (ATXTimeEventSource)source
{
  return self->_source;
}

- (double)etaMinutes
{
  return self->_etaMinutes;
}

- (int64_t)priority
{
  return self->_priority;
}

- (NSString)eventDescription
{
  return self->_eventDescription;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (ATXTimeEventPresentation)mediumPresentation
{
  return self->_mediumPresentation;
}

- (ATXTimeEventPresentation)smallPresentation
{
  return self->_smallPresentation;
}

- (ATXTimeGlyphPresentation)glyphPresentation
{
  return self->_glyphPresentation;
}

- (ATXTimeEventLocation)sourceLocation
{
  return self->_sourceLocation;
}

- (ATXTimeEventLocation)destinationLocation
{
  return self->_destinationLocation;
}

- (ATXTimeContext)context
{
  return self->_context;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSArray)feedbackOptions
{
  return self->_feedbackOptions;
}

- (BOOL)isCompleted
{
  return self->_isCompleted;
}

- (void)setIsCompleted:(BOOL)a3
{
  self->_isCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackOptions, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_destinationLocation, 0);
  objc_storeStrong((id *)&self->_sourceLocation, 0);
  objc_storeStrong((id *)&self->_glyphPresentation, 0);
  objc_storeStrong((id *)&self->_smallPresentation, 0);
  objc_storeStrong((id *)&self->_mediumPresentation, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventDescription, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_domainIdentifier, 0);
}

@end