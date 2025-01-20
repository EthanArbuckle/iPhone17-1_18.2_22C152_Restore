@interface IQFMapsPersonalizationResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isCandidateForPromotion;
- (IQFMapsPersonalizationResult)initWithCoder:(id)a3;
- (IQFMapsPersonalizationResult)initWithMUID:(id)a3 resultType:(unint64_t)a4 eventName:(id)a5 startEventDate:(id)a6 endEventDate:(id)a7 terminal:(id)a8 flightCode:(id)a9 ticketNumber:(id)a10 numberOfVisits:(id)a11 dateOfLastVisit:(id)a12 numberOfGuests:(id)a13;
- (IQFMapsPersonalizationResult)initWithMUID:(id)a3 resultType:(unint64_t)a4 eventName:(id)a5 startEventDate:(id)a6 endEventDate:(id)a7 terminal:(id)a8 flightCode:(id)a9 ticketNumber:(id)a10 numberOfVisits:(id)a11 numberOfVisitsGivenLocation:(id)a12 dateOfLastVisit:(id)a13 entityRelevanceScore:(id)a14 numberOfGuests:(id)a15;
- (NSDate)dateOfLastVisit;
- (NSDate)endEventDate;
- (NSDate)startEventDate;
- (NSNumber)entityRelevanceScore;
- (NSNumber)numberOfGuests;
- (NSNumber)numberOfVisits;
- (NSNumber)numberOfVisitsGivenLocation;
- (NSString)eventName;
- (NSString)flightCode;
- (NSString)muid;
- (NSString)terminal;
- (NSString)ticketNumber;
- (double)score;
- (id)_isCandidateForPromotion;
- (id)_score;
- (unint64_t)resultType;
- (void)encodeWithCoder:(id)a3;
- (void)setDateOfLastVisit:(id)a3;
- (void)setEndEventDate:(id)a3;
- (void)setEntityRelevanceScore:(id)a3;
- (void)setEventName:(id)a3;
- (void)setFlightCode:(id)a3;
- (void)setIsCandidateForPromotion:(BOOL)a3;
- (void)setMuid:(id)a3;
- (void)setNumberOfGuests:(id)a3;
- (void)setNumberOfVisits:(id)a3;
- (void)setNumberOfVisitsGivenLocation:(id)a3;
- (void)setResultType:(unint64_t)a3;
- (void)setScore:(double)a3;
- (void)setStartEventDate:(id)a3;
- (void)setTerminal:(id)a3;
- (void)setTicketNumber:(id)a3;
@end

@implementation IQFMapsPersonalizationResult

- (IQFMapsPersonalizationResult)initWithMUID:(id)a3 resultType:(unint64_t)a4 eventName:(id)a5 startEventDate:(id)a6 endEventDate:(id)a7 terminal:(id)a8 flightCode:(id)a9 ticketNumber:(id)a10 numberOfVisits:(id)a11 dateOfLastVisit:(id)a12 numberOfGuests:(id)a13
{
  return [(IQFMapsPersonalizationResult *)self initWithMUID:a3 resultType:a4 eventName:a5 startEventDate:a6 endEventDate:a7 terminal:a8 flightCode:a9 ticketNumber:a10 numberOfVisits:a11 numberOfVisitsGivenLocation:&unk_2702E3278 dateOfLastVisit:a12 entityRelevanceScore:&unk_2702E3278 numberOfGuests:a13];
}

- (IQFMapsPersonalizationResult)initWithMUID:(id)a3 resultType:(unint64_t)a4 eventName:(id)a5 startEventDate:(id)a6 endEventDate:(id)a7 terminal:(id)a8 flightCode:(id)a9 ticketNumber:(id)a10 numberOfVisits:(id)a11 numberOfVisitsGivenLocation:(id)a12 dateOfLastVisit:(id)a13 entityRelevanceScore:(id)a14 numberOfGuests:(id)a15
{
  id v38 = a3;
  id v29 = a5;
  id v37 = a5;
  id v36 = a6;
  id v30 = a7;
  id v35 = a7;
  id v34 = a8;
  id v33 = a9;
  id v32 = a10;
  id v19 = a11;
  id v20 = a12;
  id v21 = a13;
  id v22 = a14;
  id v23 = a15;
  v39.receiver = self;
  v39.super_class = (Class)IQFMapsPersonalizationResult;
  v24 = [(IQFMapsPersonalizationResult *)&v39 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_muid, a3);
    v25->_resultType = a4;
    objc_storeStrong((id *)&v25->_eventName, v29);
    objc_storeStrong((id *)&v25->_startEventDate, a6);
    objc_storeStrong((id *)&v25->_endEventDate, v30);
    objc_storeStrong((id *)&v25->_terminal, a8);
    objc_storeStrong((id *)&v25->_flightCode, a9);
    objc_storeStrong((id *)&v25->_ticketNumber, a10);
    objc_storeStrong((id *)&v25->_numberOfVisits, a11);
    objc_storeStrong((id *)&v25->_numberOfVisitsGivenLocation, a12);
    objc_storeStrong((id *)&v25->_dateOfLastVisit, a13);
    objc_storeStrong((id *)&v25->_entityRelevanceScore, a14);
    objc_storeStrong((id *)&v25->_numberOfGuests, a15);
  }

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IQFMapsPersonalizationResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)IQFMapsPersonalizationResult;
  v5 = [(IQFMapsPersonalizationResult *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_muid"];
    muid = v5->_muid;
    v5->_muid = (NSString *)v6;

    v5->_resultType = [v4 decodeIntegerForKey:@"_resultType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_eventName"];
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_startEventDate"];
    startEventDate = v5->_startEventDate;
    v5->_startEventDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_endEventDate"];
    endEventDate = v5->_endEventDate;
    v5->_endEventDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_terminal"];
    terminal = v5->_terminal;
    v5->_terminal = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_flightCode"];
    flightCode = v5->_flightCode;
    v5->_flightCode = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ticketNumber"];
    ticketNumber = v5->_ticketNumber;
    v5->_ticketNumber = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_numberOfVisits"];
    numberOfVisits = v5->_numberOfVisits;
    v5->_numberOfVisits = (NSNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_numberOfVisitsGivenLocation"];
    numberOfVisitsGivenLocation = v5->_numberOfVisitsGivenLocation;
    v5->_numberOfVisitsGivenLocation = (NSNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_dateOfLastVisit"];
    dateOfLastVisit = v5->_dateOfLastVisit;
    v5->_dateOfLastVisit = (NSDate *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_entityRelevanceScore"];
    entityRelevanceScore = v5->_entityRelevanceScore;
    v5->_entityRelevanceScore = (NSNumber *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_numberOfGuests"];
    numberOfGuests = v5->_numberOfGuests;
    v5->_numberOfGuests = (NSNumber *)v28;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  muid = self->_muid;
  id v18 = v4;
  if (muid)
  {
    [v4 encodeObject:muid forKey:@"_muid"];
    id v4 = v18;
  }
  [v4 encodeInteger:self->_resultType forKey:@"_resultType"];
  eventName = self->_eventName;
  if (eventName) {
    [v18 encodeObject:eventName forKey:@"_eventName"];
  }
  startEventDate = self->_startEventDate;
  if (startEventDate) {
    [v18 encodeObject:startEventDate forKey:@"_startEventDate"];
  }
  endEventDate = self->_endEventDate;
  v9 = v18;
  if (endEventDate)
  {
    [v18 encodeObject:endEventDate forKey:@"_endEventDate"];
    v9 = v18;
  }
  terminal = self->_terminal;
  if (terminal)
  {
    [v18 encodeObject:terminal forKey:@"_terminal"];
    v9 = v18;
  }
  flightCode = self->_flightCode;
  if (flightCode)
  {
    [v18 encodeObject:flightCode forKey:@"_flightCode"];
    v9 = v18;
  }
  ticketNumber = self->_ticketNumber;
  if (ticketNumber)
  {
    [v18 encodeObject:ticketNumber forKey:@"_ticketNumber"];
    v9 = v18;
  }
  numberOfVisits = self->_numberOfVisits;
  if (numberOfVisits)
  {
    [v18 encodeObject:numberOfVisits forKey:@"_numberOfVisits"];
    v9 = v18;
  }
  numberOfVisitsGivenLocation = self->_numberOfVisitsGivenLocation;
  if (numberOfVisitsGivenLocation)
  {
    [v18 encodeObject:numberOfVisitsGivenLocation forKey:@"_numberOfVisitsGivenLocation"];
    v9 = v18;
  }
  dateOfLastVisit = self->_dateOfLastVisit;
  if (dateOfLastVisit)
  {
    [v18 encodeObject:dateOfLastVisit forKey:@"_dateOfLastVisit"];
    v9 = v18;
  }
  entityRelevanceScore = self->_entityRelevanceScore;
  if (entityRelevanceScore)
  {
    [v18 encodeObject:entityRelevanceScore forKey:@"_entityRelevanceScore"];
    v9 = v18;
  }
  numberOfGuests = self->_numberOfGuests;
  if (numberOfGuests)
  {
    [v18 encodeObject:numberOfGuests forKey:@"_numberOfGuests"];
    v9 = v18;
  }
}

- (void)setIsCandidateForPromotion:(BOOL)a3
{
  self->_isCandidateForPromotion = [NSNumber numberWithBool:a3];

  MEMORY[0x270F9A758]();
}

- (BOOL)isCandidateForPromotion
{
  return [(NSNumber *)self->_isCandidateForPromotion BOOLValue];
}

- (id)_isCandidateForPromotion
{
  return self->_isCandidateForPromotion;
}

- (void)setScore:(double)a3
{
  self->_score = [NSNumber numberWithDouble:a3];

  MEMORY[0x270F9A758]();
}

- (double)score
{
  [(NSNumber *)self->_score doubleValue];
  return result;
}

- (id)_score
{
  return self->_score;
}

- (NSString)muid
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMuid:(id)a3
{
}

- (unint64_t)resultType
{
  return self->_resultType;
}

- (void)setResultType:(unint64_t)a3
{
  self->_resultType = a3;
}

- (NSString)eventName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEventName:(id)a3
{
}

- (NSDate)startEventDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStartEventDate:(id)a3
{
}

- (NSDate)endEventDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEndEventDate:(id)a3
{
}

- (NSString)terminal
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTerminal:(id)a3
{
}

- (NSString)flightCode
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFlightCode:(id)a3
{
}

- (NSString)ticketNumber
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTicketNumber:(id)a3
{
}

- (NSNumber)numberOfVisits
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setNumberOfVisits:(id)a3
{
}

- (NSNumber)numberOfVisitsGivenLocation
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setNumberOfVisitsGivenLocation:(id)a3
{
}

- (NSDate)dateOfLastVisit
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDateOfLastVisit:(id)a3
{
}

- (NSNumber)numberOfGuests
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setNumberOfGuests:(id)a3
{
}

- (NSNumber)entityRelevanceScore
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setEntityRelevanceScore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityRelevanceScore, 0);
  objc_storeStrong((id *)&self->_numberOfGuests, 0);
  objc_storeStrong((id *)&self->_dateOfLastVisit, 0);
  objc_storeStrong((id *)&self->_numberOfVisitsGivenLocation, 0);
  objc_storeStrong((id *)&self->_numberOfVisits, 0);
  objc_storeStrong((id *)&self->_ticketNumber, 0);
  objc_storeStrong((id *)&self->_flightCode, 0);
  objc_storeStrong((id *)&self->_terminal, 0);
  objc_storeStrong((id *)&self->_endEventDate, 0);
  objc_storeStrong((id *)&self->_startEventDate, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_muid, 0);
  objc_storeStrong((id *)&self->_isCandidateForPromotion, 0);

  objc_storeStrong((id *)&self->_score, 0);
}

@end