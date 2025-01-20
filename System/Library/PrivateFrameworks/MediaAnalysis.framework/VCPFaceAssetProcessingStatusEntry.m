@interface VCPFaceAssetProcessingStatusEntry
+ (id)entryWithPreviousStatus:(unint64_t)a3 previousAttempts:(unint64_t)a4 andLastAttemptDate:(id)a5;
- (NSDate)currentAttemptDate;
- (NSDate)lastAttemptDate;
- (VCPFaceAssetProcessingStatusEntry)initWithPreviousStatus:(unint64_t)a3 previousAttempts:(unint64_t)a4 andLastAttemptDate:(id)a5;
- (unint64_t)previousAttempts;
- (unint64_t)previousStatus;
@end

@implementation VCPFaceAssetProcessingStatusEntry

- (VCPFaceAssetProcessingStatusEntry)initWithPreviousStatus:(unint64_t)a3 previousAttempts:(unint64_t)a4 andLastAttemptDate:(id)a5
{
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VCPFaceAssetProcessingStatusEntry;
  v10 = [(VCPFaceAssetProcessingStatusEntry *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_previousStatus = a3;
    v10->_previousAttempts = a4;
    objc_storeStrong((id *)&v10->_lastAttemptDate, a5);
    uint64_t v12 = +[NSDate now];
    currentAttemptDate = v11->_currentAttemptDate;
    v11->_currentAttemptDate = (NSDate *)v12;
  }
  return v11;
}

+ (id)entryWithPreviousStatus:(unint64_t)a3 previousAttempts:(unint64_t)a4 andLastAttemptDate:(id)a5
{
  id v7 = a5;
  v8 = [[VCPFaceAssetProcessingStatusEntry alloc] initWithPreviousStatus:a3 previousAttempts:a4 andLastAttemptDate:v7];

  return v8;
}

- (unint64_t)previousStatus
{
  return self->_previousStatus;
}

- (unint64_t)previousAttempts
{
  return self->_previousAttempts;
}

- (NSDate)lastAttemptDate
{
  return self->_lastAttemptDate;
}

- (NSDate)currentAttemptDate
{
  return self->_currentAttemptDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAttemptDate, 0);
  objc_storeStrong((id *)&self->_lastAttemptDate, 0);
}

@end