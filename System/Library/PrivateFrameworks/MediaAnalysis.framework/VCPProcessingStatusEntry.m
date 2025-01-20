@interface VCPProcessingStatusEntry
+ (id)entryWithLocalIdentifier:(id)a3 taskID:(unint64_t)a4 status:(unint64_t)a5 attempts:(unint64_t)a6 lastAttemptDate:(id)a7 andNextAttemptDate:(id)a8 errorCode:(unint64_t)a9 errorLine:(unint64_t)a10;
- (NSDate)lastAttemptDate;
- (NSDate)nextAttemptDate;
- (NSString)localIdentifier;
- (VCPProcessingStatusEntry)initWithLocalIdentifier:(id)a3 taskID:(unint64_t)a4 status:(unint64_t)a5 attempts:(unint64_t)a6 lastAttemptDate:(id)a7 andNextAttemptDate:(id)a8 errorCode:(unint64_t)a9 errorLine:(unint64_t)a10;
- (unint64_t)attempts;
- (unint64_t)errorCode;
- (unint64_t)errorLine;
- (unint64_t)status;
- (unint64_t)taskID;
@end

@implementation VCPProcessingStatusEntry

- (VCPProcessingStatusEntry)initWithLocalIdentifier:(id)a3 taskID:(unint64_t)a4 status:(unint64_t)a5 attempts:(unint64_t)a6 lastAttemptDate:(id)a7 andNextAttemptDate:(id)a8 errorCode:(unint64_t)a9 errorLine:(unint64_t)a10
{
  id v17 = a3;
  id v18 = a7;
  id v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)VCPProcessingStatusEntry;
  v20 = [(VCPProcessingStatusEntry *)&v23 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_localIdentifier, a3);
    v21->_taskID = a4;
    v21->_status = a5;
    v21->_attempts = a6;
    objc_storeStrong((id *)&v21->_lastAttemptDate, a7);
    objc_storeStrong((id *)&v21->_nextAttemptDate, a8);
    v21->_errorCode = a9;
    v21->_errorLine = a10;
  }

  return v21;
}

+ (id)entryWithLocalIdentifier:(id)a3 taskID:(unint64_t)a4 status:(unint64_t)a5 attempts:(unint64_t)a6 lastAttemptDate:(id)a7 andNextAttemptDate:(id)a8 errorCode:(unint64_t)a9 errorLine:(unint64_t)a10
{
  id v15 = a8;
  id v16 = a7;
  id v17 = a3;
  id v18 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLocalIdentifier:v17 taskID:a4 status:a5 attempts:a6 lastAttemptDate:v16 andNextAttemptDate:v15 errorCode:a9 errorLine:a10];

  return v18;
}

- (unint64_t)taskID
{
  return self->_taskID;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (unint64_t)status
{
  return self->_status;
}

- (unint64_t)attempts
{
  return self->_attempts;
}

- (NSDate)lastAttemptDate
{
  return self->_lastAttemptDate;
}

- (NSDate)nextAttemptDate
{
  return self->_nextAttemptDate;
}

- (unint64_t)errorCode
{
  return self->_errorCode;
}

- (unint64_t)errorLine
{
  return self->_errorLine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextAttemptDate, 0);
  objc_storeStrong((id *)&self->_lastAttemptDate, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

@end