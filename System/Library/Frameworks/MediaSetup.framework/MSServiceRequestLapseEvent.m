@interface MSServiceRequestLapseEvent
- (MSServiceRequestLapseEvent)initWithServiceID:(id)a3;
- (NSDate)dateOfRequest;
- (NSDate)recordCreationDate;
- (NSString)serviceID;
- (double)durationBetweenRequestAndReadyToUse;
- (double)durationBetweenRequestAndRecordCreation;
- (unint64_t)endTime;
- (unint64_t)timeOfRequest;
- (void)setDateOfRequest:(id)a3;
- (void)setEndTime:(unint64_t)a3;
- (void)setRecordCreationDate:(id)a3;
- (void)setServiceID:(id)a3;
- (void)setTimeOfRequest:(unint64_t)a3;
@end

@implementation MSServiceRequestLapseEvent

- (MSServiceRequestLapseEvent)initWithServiceID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSServiceRequestLapseEvent;
  v5 = [(MSServiceRequestLapseEvent *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MSServiceRequestLapseEvent *)v5 setServiceID:v4];
  }

  return v6;
}

- (double)durationBetweenRequestAndRecordCreation
{
  [(NSDate *)self->_recordCreationDate timeIntervalSinceDate:self->_dateOfRequest];
  return result;
}

- (double)durationBetweenRequestAndReadyToUse
{
  MEMORY[0x270F24828](self->_endTime - self->_timeOfRequest, a2);
  return result;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
}

- (NSDate)recordCreationDate
{
  return self->_recordCreationDate;
}

- (void)setRecordCreationDate:(id)a3
{
}

- (unint64_t)timeOfRequest
{
  return self->_timeOfRequest;
}

- (void)setTimeOfRequest:(unint64_t)a3
{
  self->_timeOfRequest = a3;
}

- (NSDate)dateOfRequest
{
  return self->_dateOfRequest;
}

- (void)setDateOfRequest:(id)a3
{
}

- (unint64_t)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(unint64_t)a3
{
  self->_endTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfRequest, 0);
  objc_storeStrong((id *)&self->_recordCreationDate, 0);

  objc_storeStrong((id *)&self->_serviceID, 0);
}

@end