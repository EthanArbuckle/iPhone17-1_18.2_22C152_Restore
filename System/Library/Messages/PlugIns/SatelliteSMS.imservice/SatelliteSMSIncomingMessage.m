@interface SatelliteSMSIncomingMessage
- (CTXPCServiceSubscriptionContext)context;
- (NSData)textPayload;
- (NSNumber)timestamp;
- (NSString)sourcePhoneNumber;
- (NSString)uniqueID;
- (SatelliteSMSIncomingMessage)initWithIncomingCTMessage:(id)a3 error:(id *)p_isa;
- (SatelliteSMSIncomingMessage)initWithTimestamp:(id)a3 pendingTotalCount:(int64_t)a4 pendingCount:(int64_t)a5 sourcePhoneNumber:(id)a6 codecID:(int64_t)a7 textPayload:(id)a8 uniqueID:(id)a9;
- (int64_t)codecID;
- (int64_t)pendingCount;
- (int64_t)pendingTotalCount;
@end

@implementation SatelliteSMSIncomingMessage

- (SatelliteSMSIncomingMessage)initWithTimestamp:(id)a3 pendingTotalCount:(int64_t)a4 pendingCount:(int64_t)a5 sourcePhoneNumber:(id)a6 codecID:(int64_t)a7 textPayload:(id)a8 uniqueID:(id)a9
{
  id v22 = a3;
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)SatelliteSMSIncomingMessage;
  v18 = [(SatelliteSMSIncomingMessage *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_timestamp, a3);
    v19->_pendingTotalCount = a4;
    v19->_pendingCount = a5;
    objc_storeStrong((id *)&v19->_sourcePhoneNumber, a6);
    v19->_codecID = a7;
    objc_storeStrong((id *)&v19->_textPayload, a8);
    objc_storeStrong((id *)&v19->_uniqueID, a9);
  }

  return v19;
}

- (SatelliteSMSIncomingMessage)initWithIncomingCTMessage:(id)a3 error:(id *)p_isa
{
  id v6 = a3;
  if (sub_DD1C())
  {
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      v8 = [v7 timestamp];
      id v9 = [v7 pendingTotalCount];
      id v10 = [v7 pendingCount];
      v11 = [v7 sourcePhoneNumber];
      id v12 = [v7 codecID];
      v13 = [v7 textPayload];
      v14 = [v7 uniqueID];
      id v15 = [(SatelliteSMSIncomingMessage *)self initWithTimestamp:v8 pendingTotalCount:v9 pendingCount:v10 sourcePhoneNumber:v11 codecID:v12 textPayload:v13 uniqueID:v14];

      uint64_t v16 = [v7 context];

      context = v15->_context;
      v15->_context = (CTXPCServiceSubscriptionContext *)v16;

      self = v15;
      p_isa = (id *)&self->super.isa;
      goto LABEL_13;
    }
    v21 = +[SatelliteSMSUtilities logger];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      sub_E538(v21);
    }

    if (p_isa)
    {
      NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
      CFStringRef v24 = @"Attempt to initialize SatelliteSMSIncomingMessage with something other than CTStewieSatSmsMessageIncoming";
      v19 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      uint64_t v20 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    v18 = +[SatelliteSMSUtilities logger];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_E4F4(v18);
    }

    if (p_isa)
    {
      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      CFStringRef v26 = @"Attempt to initialize SatelliteSMSIncomingMessage when CTStewieSatSmsMessageIncoming class is not present";
      v19 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      uint64_t v20 = 0;
LABEL_12:
      *p_isa = +[NSError errorWithDomain:@"com.apple.imservice.SatelliteSMS.error" code:v20 userInfo:v19];

      p_isa = 0;
    }
  }
LABEL_13:

  return (SatelliteSMSIncomingMessage *)p_isa;
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (int64_t)pendingTotalCount
{
  return self->_pendingTotalCount;
}

- (int64_t)pendingCount
{
  return self->_pendingCount;
}

- (NSString)sourcePhoneNumber
{
  return self->_sourcePhoneNumber;
}

- (int64_t)codecID
{
  return self->_codecID;
}

- (NSData)textPayload
{
  return self->_textPayload;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_textPayload, 0);
  objc_storeStrong((id *)&self->_sourcePhoneNumber, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end