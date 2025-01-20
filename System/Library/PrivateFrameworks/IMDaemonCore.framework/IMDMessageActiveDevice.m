@interface IMDMessageActiveDevice
- (BOOL)_hasReceivedReadReceiptRecently;
- (BOOL)hasReceivedReadReceipt;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldDisplayAttachmentDownloadFailure;
- (BOOL)shouldDisplayRemoteDecryptionFailure;
- (BOOL)shouldSendTypingIndicator;
- (IMDMessageActiveDevice)initWithIDSDestination:(id)a3 latestDate:(id)a4 latestReadReceiptDate:(id)a5 hasReceivedReadReceipt:(BOOL)a6;
- (NSDate)latestActiveDate;
- (NSDate)latestReadReceipt;
- (NSString)idsDestination;
- (id)description;
- (void)setHasReceivedReadReceipt:(BOOL)a3;
- (void)setIdsDestination:(id)a3;
- (void)setLatestActiveDate:(id)a3;
- (void)setLatestReadReceipt:(id)a3;
@end

@implementation IMDMessageActiveDevice

- (IMDMessageActiveDevice)initWithIDSDestination:(id)a3 latestDate:(id)a4 latestReadReceiptDate:(id)a5 hasReceivedReadReceipt:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = 0;
  if (v11 && v12)
  {
    v18.receiver = self;
    v18.super_class = (Class)IMDMessageActiveDevice;
    v15 = [(IMDMessageActiveDevice *)&v18 init];
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_idsDestination, a3);
      objc_storeStrong((id *)&v16->_latestActiveDate, a4);
      v16->_hasReceivedReadReceipt = a6;
      objc_storeStrong((id *)&v16->_latestReadReceipt, a5);
    }
    self = v16;
    v14 = self;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (IMDMessageActiveDevice *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4 == self)
    {
      char v7 = 1;
    }
    else
    {
      idsDestination = self->_idsDestination;
      v6 = [(IMDMessageActiveDevice *)v4 idsDestination];
      char v7 = [(NSString *)idsDestination isEqualToString:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)_hasReceivedReadReceiptRecently
{
  BOOL result = self->_hasReceivedReadReceipt
        && ([MEMORY[0x1E4F1C9C8] date],
            v3 = objc_claimAutoreleasedReturnValue(),
            [v3 timeIntervalSinceDate:self->_latestReadReceipt],
            double v5 = v4,
            v3,
            v5 <= 86400.0)
        && self->_hasReceivedReadReceipt;
  return result;
}

- (BOOL)shouldSendTypingIndicator
{
  if (![(IMDMessageActiveDevice *)self _hasReceivedReadReceiptRecently]) {
    return 1;
  }
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSinceDate:self->_latestActiveDate];
  BOOL v5 = v4 <= 300.0;

  return v5;
}

- (BOOL)shouldDisplayAttachmentDownloadFailure
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSinceDate:self->_latestActiveDate];
  LOBYTE(self) = v4 <= 86400.0;

  return (char)self;
}

- (BOOL)shouldDisplayRemoteDecryptionFailure
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSinceDate:self->_latestActiveDate];
  LOBYTE(self) = v4 <= 600.0;

  return (char)self;
}

- (id)description
{
  v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  char v7 = @"YES";
  if (!self->_hasReceivedReadReceipt) {
    char v7 = @"NO";
  }
  v8 = [v3 stringWithFormat:@"[%@: <Device%@ activeDate:%@ readReceipt:%@, read ReceiptDate %@>]", v5, self->_idsDestination, self->_latestActiveDate, v7, self->_latestReadReceipt];

  return v8;
}

- (NSString)idsDestination
{
  return self->_idsDestination;
}

- (void)setIdsDestination:(id)a3
{
}

- (NSDate)latestActiveDate
{
  return self->_latestActiveDate;
}

- (void)setLatestActiveDate:(id)a3
{
}

- (BOOL)hasReceivedReadReceipt
{
  return self->_hasReceivedReadReceipt;
}

- (void)setHasReceivedReadReceipt:(BOOL)a3
{
  self->_hasReceivedReadReceipt = a3;
}

- (NSDate)latestReadReceipt
{
  return self->_latestReadReceipt;
}

- (void)setLatestReadReceipt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestReadReceipt, 0);
  objc_storeStrong((id *)&self->_latestActiveDate, 0);

  objc_storeStrong((id *)&self->_idsDestination, 0);
}

@end