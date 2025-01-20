@interface SatelliteSMSOutgoingMessage
- (BOOL)notifyDowngrade;
- (CTXPCServiceSubscriptionContext)context;
- (NSData)textPayload;
- (NSString)destinationPhoneNumber;
- (SatelliteSMSOutgoingMessage)initWithDestinationPhoneNumber:(id)a3 codecID:(int64_t)a4 textPayload:(id)a5 notifyDowngrade:(BOOL)a6;
- (id)makeOutgoingMessageWithError:(id *)a3;
- (int64_t)codecID;
- (void)setContext:(id)a3;
@end

@implementation SatelliteSMSOutgoingMessage

- (SatelliteSMSOutgoingMessage)initWithDestinationPhoneNumber:(id)a3 codecID:(int64_t)a4 textPayload:(id)a5 notifyDowngrade:(BOOL)a6
{
  id v11 = a3;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SatelliteSMSOutgoingMessage;
  v13 = [(SatelliteSMSOutgoingMessage *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_destinationPhoneNumber, a3);
    v14->_codecID = a4;
    objc_storeStrong((id *)&v14->_textPayload, a5);
    v14->_notifyDowngrade = a6;
  }

  return v14;
}

- (id)makeOutgoingMessageWithError:(id *)a3
{
  v5 = (objc_class *)sub_DE58();
  if (v5)
  {
    id v6 = [v5 alloc];
    char v7 = objc_opt_respondsToSelector();
    id v8 = v6;
    v9 = [(SatelliteSMSOutgoingMessage *)self context];
    v10 = [(SatelliteSMSOutgoingMessage *)self destinationPhoneNumber];
    int64_t v11 = [(SatelliteSMSOutgoingMessage *)self codecID];
    id v12 = [(SatelliteSMSOutgoingMessage *)self textPayload];
    if (v7) {
      v13 = (id *)objc_msgSend(v8, "initWithContext:destinationPhoneNumber:codecID:textPayload:notifyDowngrade:error:", v9, v10, v11, v12, -[SatelliteSMSOutgoingMessage notifyDowngrade](self, "notifyDowngrade"), a3);
    }
    else {
      v13 = (id *)[v8 initWithContext:v9 destinationPhoneNumber:v10 codecID:v11 textPayload:v12 error:a3];
    }
    a3 = v13;
  }
  else
  {
    v14 = +[SatelliteSMSUtilities logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_E4F4(v14);
    }

    if (a3)
    {
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      CFStringRef v18 = @"Attempt to initialize SatelliteSMSIncomingMessage when CTStewieSatSmsMessageIncoming class is not present";
      v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      *a3 = +[NSError errorWithDomain:@"com.apple.imservice.SatelliteSMS.error" code:0 userInfo:v15];

      a3 = 0;
    }
  }

  return a3;
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)destinationPhoneNumber
{
  return self->_destinationPhoneNumber;
}

- (int64_t)codecID
{
  return self->_codecID;
}

- (NSData)textPayload
{
  return self->_textPayload;
}

- (BOOL)notifyDowngrade
{
  return self->_notifyDowngrade;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textPayload, 0);
  objc_storeStrong((id *)&self->_destinationPhoneNumber, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end