@interface CKSOSMessage
- (BOOL)isCritical;
- (BOOL)useStandalone;
- (CKSOSMessage)initWithMessage:(id)a3 recipients:(id)a4;
- (CKSOSMessage)initWithSMSMessage:(id)a3 mmsMessage:(id)a4 recipients:(id)a5;
- (CLLocation)location;
- (NSArray)handles;
- (NSArray)recipients;
- (NSDictionary)recipientReasonMessages;
- (NSDictionary)recipientReasons;
- (NSString)locationURL;
- (NSString)message;
- (NSString)mmsMessage;
- (NSString)smsMessage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)failureBlock;
- (id)messageForReasons:(unint64_t)a3;
- (void)setFailureBlock:(id)a3;
- (void)setHandles:(id)a3;
- (void)setIsCritical:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setLocationURL:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMmsMessage:(id)a3;
- (void)setRecipientReasonMessages:(id)a3;
- (void)setRecipientReasons:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSmsMessage:(id)a3;
- (void)setUseStandalone:(BOOL)a3;
@end

@implementation CKSOSMessage

- (CKSOSMessage)initWithMessage:(id)a3 recipients:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CKSOSMessage;
  v9 = [(CKSOSMessage *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_smsMessage, a3);
    uint64_t v11 = [v8 copy];
    recipients = v10->_recipients;
    v10->_recipients = (NSArray *)v11;
  }
  return v10;
}

- (CKSOSMessage)initWithSMSMessage:(id)a3 mmsMessage:(id)a4 recipients:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CKSOSMessage;
  v12 = [(CKSOSMessage *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_smsMessage, a3);
    objc_storeStrong((id *)&v13->_mmsMessage, a4);
    uint64_t v14 = [v11 copy];
    recipients = v13->_recipients;
    v13->_recipients = (NSArray *)v14;
  }
  return v13;
}

- (id)description
{
  v3 = NSString;
  if (self->_useStandalone) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  if (self->_location) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  recipients = self->_recipients;
  if ([(NSString *)self->_locationURL length]) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  return (id)[v3 stringWithFormat:@"CKSOSMessage: recipients %@ useStandalone %@ location present? %@ location URL present? %@  handles %@ ", recipients, v4, v5, v7, self->_handles];
}

- (NSString)message
{
  return (NSString *)[(CKSOSMessage *)self messageForReasons:1];
}

- (id)messageForReasons:(unint64_t)a3
{
  v5 = [(CKSOSMessage *)self recipientReasonMessages];
  v6 = [NSNumber numberWithUnsignedInteger:a3];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (![v7 length])
  {
    mmsMessage = self->_mmsMessage;
    if (!mmsMessage) {
      mmsMessage = self->_smsMessage;
    }
    id v9 = mmsMessage;

    id v7 = v9;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)[(NSString *)self->_message copyWithZone:a3];
  [v5 setMessage:v6];

  id v7 = (void *)[(NSString *)self->_smsMessage copyWithZone:a3];
  [v5 setSmsMessage:v7];

  id v8 = (void *)[(NSString *)self->_mmsMessage copyWithZone:a3];
  [v5 setMmsMessage:v8];

  id v9 = (void *)[(NSArray *)self->_recipients copyWithZone:a3];
  [v5 setRecipients:v9];

  id v10 = (void *)[self->_failureBlock copy];
  [v5 setFailureBlock:v10];

  id v11 = (void *)[(CLLocation *)self->_location copyWithZone:a3];
  [v5 setLocation:v11];

  v12 = (void *)[(NSString *)self->_locationURL copyWithZone:a3];
  [v5 setLocationURL:v12];

  [v5 setUseStandalone:self->_useStandalone];
  [v5 setIsCritical:self->_isCritical];
  return v5;
}

- (void)setRecipients:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_recipients != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_recipients, a3);
    handles = self->_handles;
    self->_handles = 0;

    v5 = v7;
  }
}

- (NSArray)handles
{
  handles = self->_handles;
  if (!handles)
  {
    recipients = self->_recipients;
    v5 = [MEMORY[0x1E4F6BDB8] smsService];
    CKMakeHandlesFromRecipientsWithFallbackService(recipients, v5);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    id v7 = self->_handles;
    self->_handles = v6;

    handles = self->_handles;
  }

  return handles;
}

- (NSString)locationURL
{
  return self->_locationURL;
}

- (void)setLocationURL:(id)a3
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (NSDictionary)recipientReasons
{
  return self->_recipientReasons;
}

- (void)setRecipientReasons:(id)a3
{
}

- (NSDictionary)recipientReasonMessages
{
  return self->_recipientReasonMessages;
}

- (void)setRecipientReasonMessages:(id)a3
{
}

- (id)failureBlock
{
  return self->_failureBlock;
}

- (void)setFailureBlock:(id)a3
{
}

- (BOOL)useStandalone
{
  return self->_useStandalone;
}

- (void)setUseStandalone:(BOOL)a3
{
  self->_useStandalone = a3;
}

- (BOOL)isCritical
{
  return self->_isCritical;
}

- (void)setIsCritical:(BOOL)a3
{
  self->_isCritical = a3;
}

- (void)setMessage:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (void)setHandles:(id)a3
{
}

- (NSString)smsMessage
{
  return self->_smsMessage;
}

- (void)setSmsMessage:(id)a3
{
}

- (NSString)mmsMessage
{
  return self->_mmsMessage;
}

- (void)setMmsMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mmsMessage, 0);
  objc_storeStrong((id *)&self->_smsMessage, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong(&self->_failureBlock, 0);
  objc_storeStrong((id *)&self->_recipientReasonMessages, 0);
  objc_storeStrong((id *)&self->_recipientReasons, 0);
  objc_storeStrong((id *)&self->_recipients, 0);

  objc_storeStrong((id *)&self->_locationURL, 0);
}

@end