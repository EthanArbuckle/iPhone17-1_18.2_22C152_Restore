@interface BatchMetadata
- (NSDate)dateCreated;
- (NSDate)dateLastProcessed;
- (NSDate)dateUploaded;
- (NSNumber)category;
- (NSString)batchIdentifier;
- (NSString)timestampReferenceIdentifier;
- (int)batchStatus;
- (unint64_t)batchSize;
- (unint64_t)eventCount;
- (unint64_t)processedAttempts;
- (void)setBatchIdentifier:(id)a3;
- (void)setBatchSize:(unint64_t)a3;
- (void)setBatchStatus:(int)a3;
- (void)setCategory:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastProcessed:(id)a3;
- (void)setDateUploaded:(id)a3;
- (void)setEventCount:(unint64_t)a3;
- (void)setProcessedAttempts:(unint64_t)a3;
- (void)setTimestampReferenceIdentifier:(id)a3;
@end

@implementation BatchMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_dateUploaded, 0);
  objc_storeStrong((id *)&self->_dateLastProcessed, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_timestampReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_batchIdentifier, 0);
}

- (void)setCategory:(id)a3
{
}

- (NSNumber)category
{
  return self->_category;
}

- (void)setEventCount:(unint64_t)a3
{
  self->_eventCount = a3;
}

- (unint64_t)eventCount
{
  return self->_eventCount;
}

- (void)setDateUploaded:(id)a3
{
}

- (NSDate)dateUploaded
{
  return self->_dateUploaded;
}

- (void)setDateLastProcessed:(id)a3
{
}

- (NSDate)dateLastProcessed
{
  return self->_dateLastProcessed;
}

- (void)setDateCreated:(id)a3
{
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setProcessedAttempts:(unint64_t)a3
{
  self->_processedAttempts = a3;
}

- (unint64_t)processedAttempts
{
  return self->_processedAttempts;
}

- (void)setBatchStatus:(int)a3
{
  self->_batchStatus = a3;
}

- (int)batchStatus
{
  return self->_batchStatus;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setTimestampReferenceIdentifier:(id)a3
{
}

- (NSString)timestampReferenceIdentifier
{
  return self->_timestampReferenceIdentifier;
}

- (void)setBatchIdentifier:(id)a3
{
}

- (NSString)batchIdentifier
{
  return self->_batchIdentifier;
}

@end