@interface SYMessageStatusRecord
- (BOOL)applicationACKReceived;
- (BOOL)deviceACKReceived;
- (BOOL)isComplete;
- (BOOL)responseReceived;
- (NSString)messageID;
- (SYMessageStatusRecord)initWithMessageID:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)initFiller;
- (void)setApplicationACKReceived:(BOOL)a3;
- (void)setDeviceACKReceived:(BOOL)a3;
- (void)setMessageID:(id)a3;
- (void)setResponseReceived:(BOOL)a3;
@end

@implementation SYMessageStatusRecord

- (SYMessageStatusRecord)initWithMessageID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SYMessageStatusRecord;
  v5 = [(SYMessageStatusRecord *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(SYMessageStatusRecord *)v5 setMessageID:v4];
    v7 = v6;
  }

  return v6;
}

- (id)initFiller
{
  return [(SYMessageStatusRecord *)self initWithMessageID:@"<filler>"];
}

- (BOOL)isComplete
{
  v3 = [(SYMessageStatusRecord *)self messageID];
  if ([v3 isEqualToString:@"<filler>"]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(SYMessageStatusRecord *)self deviceACKReceived]
  }
      && [(SYMessageStatusRecord *)self applicationACKReceived]
      && [(SYMessageStatusRecord *)self responseReceived];

  return v4;
}

- (id)description
{
  if ([(SYMessageStatusRecord *)self isComplete])
  {
    id v3 = [NSString alloc];
    BOOL v4 = [(SYMessageStatusRecord *)self messageID];
    v5 = (void *)[v3 initWithFormat:@"Sync message %@; complete", v4];
  }
  else
  {
    v5 = [(SYMessageStatusRecord *)self debugDescription];
  }
  return v5;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  BOOL v4 = [(SYMessageStatusRecord *)self messageID];
  v5 = objc_msgSend(v3, "initWithFormat:", @"Sync message %@; device ACK: %d, app ACK: %d, responded: %d",
                 v4,
                 [(SYMessageStatusRecord *)self deviceACKReceived],
                 [(SYMessageStatusRecord *)self applicationACKReceived],
                 [(SYMessageStatusRecord *)self responseReceived]);

  return v5;
}

- (NSString)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
}

- (BOOL)deviceACKReceived
{
  return self->_deviceACKReceived;
}

- (void)setDeviceACKReceived:(BOOL)a3
{
  self->_deviceACKReceived = a3;
}

- (BOOL)applicationACKReceived
{
  return self->_applicationACKReceived;
}

- (void)setApplicationACKReceived:(BOOL)a3
{
  self->_applicationACKReceived = a3;
}

- (BOOL)responseReceived
{
  return self->_responseReceived;
}

- (void)setResponseReceived:(BOOL)a3
{
  self->_responseReceived = a3;
}

- (void).cxx_destruct
{
}

@end