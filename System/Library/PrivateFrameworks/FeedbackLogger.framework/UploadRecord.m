@interface UploadRecord
- (NSData)payload;
- (NSDate)dateCreated;
- (NSDate)dateLastProcessed;
- (NSDate)dateUploaded;
- (NSString)applicationIdentifier;
- (NSString)timestampReferenceIdentifier;
- (NSString)uploadIdentifier;
- (id)outcomeTelemetryDictionary;
- (int)uploadStatus;
- (unint64_t)processedAttempts;
- (unint64_t)size;
- (void)setApplicationIdentifier:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastProcessed:(id)a3;
- (void)setDateUploaded:(id)a3;
- (void)setPayload:(id)a3;
- (void)setProcessedAttempts:(unint64_t)a3;
- (void)setSize:(unint64_t)a3;
- (void)setTimestampReferenceIdentifier:(id)a3;
- (void)setUploadIdentifier:(id)a3;
- (void)setUploadStatus:(int)a3;
@end

@implementation UploadRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_dateUploaded, 0);
  objc_storeStrong((id *)&self->_dateLastProcessed, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_timestampReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_uploadIdentifier, 0);
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unint64_t)size
{
  return self->_size;
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

- (void)setUploadStatus:(int)a3
{
  self->_uploadStatus = a3;
}

- (int)uploadStatus
{
  return self->_uploadStatus;
}

- (void)setTimestampReferenceIdentifier:(id)a3
{
}

- (NSString)timestampReferenceIdentifier
{
  return self->_timestampReferenceIdentifier;
}

- (void)setPayload:(id)a3
{
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setUploadIdentifier:(id)a3
{
}

- (NSString)uploadIdentifier
{
  return self->_uploadIdentifier;
}

- (id)outcomeTelemetryDictionary
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v3 = [(UploadRecord *)self dateUploaded];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(UploadRecord *)self dateLastProcessed];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [MEMORY[0x1E4F1C9C8] date];
    }
    id v5 = v8;
  }
  v9 = [(UploadRecord *)self dateCreated];
  [v9 timeIntervalSinceDate:v5];
  uint64_t v11 = (uint64_t)v10;

  unint64_t v12 = ([(UploadRecord *)self size] + 1023) >> 10;
  v21[0] = @"age";
  v13 = [MEMORY[0x1E4F28ED0] numberWithInteger:v11 / -3600];
  v22[0] = v13;
  v21[1] = @"bundle_id";
  uint64_t v14 = [(UploadRecord *)self applicationIdentifier];
  v15 = (void *)v14;
  v16 = &stru_1F13B9D50;
  if (v14) {
    v16 = (__CFString *)v14;
  }
  v22[1] = v16;
  v22[2] = &unk_1F13BBA50;
  v21[2] = @"category";
  v21[3] = @"outcome";
  v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[UploadRecord uploadStatus](self, "uploadStatus"));
  v22[3] = v17;
  v21[4] = @"size";
  v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v12];
  v22[4] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];

  return v19;
}

@end