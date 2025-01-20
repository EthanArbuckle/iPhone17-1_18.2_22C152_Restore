@interface MFMessageSendService
+ (BOOL)handleMessage:(id)a3 connectionState:(id)a4 replyObject:(id *)a5 error:(id *)a6;
+ (id)requiredEntitlement;
+ (id)serviceName;
@end

@implementation MFMessageSendService

+ (id)serviceName
{
  return MSSendEmailMessageUICommand;
}

+ (id)requiredEntitlement
{
  return @"com.apple.mobilemail.mailservices";
}

+ (BOOL)handleMessage:(id)a3 connectionState:(id)a4 replyObject:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  v10 = xpc_dictionary_get_value(v9, (const char *)[_MSMailServiceArguments UTF8String]);
  if (!v10)
  {
    v33 = +[NSAssertionHandler currentHandler];
    [v33 handleFailureInMethod:a2, a1, @"MFDeliveryService.m", 605, @"Invalid parameter not satisfying: %@", @"args" object file lineNumber description];
  }
  v11 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  v12 = [v11 objectForKeyedSubscript:MSSendEmailArgumentKeyRFC822Data];
  v38 = [v11 objectForKeyedSubscript:MSSendEmailArgumentKeyAutosaveIdentifier];
  v13 = [v11 objectForKeyedSubscript:MSSendEmailArgumentKeyHideMyEmailMessage];
  char v14 = [v13 BOOLValue];

  v15 = [v11 objectForKeyedSubscript:MSSendEmailArgumentKeySendLaterDate];
  v37 = v15;
  if (v12)
  {
    v16 = +[MFMailMessage messageWithRFC822Data:v12];
    if (!v16)
    {
      v17 = a5;
      BOOL v24 = 0;
      id v23 = 0;
LABEL_15:

      BOOL v25 = v24;
      goto LABEL_16;
    }
    +[MailAccount accountThatMessageIsFrom:v16 includingInactive:1];
    v18 = v17 = a5;
    if (v18)
    {
      if (v15)
      {
        id v36 = v16;
        id v34 = v15;
        v35 = +[DaemonAppController sharedController];
        id v19 = objc_alloc((Class)EMOutgoingMessage);
        v20 = [v36 messageData];
        id v21 = [v19 initWithMessageData:v20];

        v22 = [v35 outgoingMessageRepository];
        [v22 saveSendLaterMessage:v21 sendLaterDate:v34 completion:0];

        id v23 = 0;
        BOOL v24 = 1;
        goto LABEL_12;
      }
      id v39 = 0;
      v26 = sub_100065014(v16, v18, 0, v14, &v39);
      id v23 = v39;
      BOOL v24 = v26 != 0;

      if (v26)
      {
LABEL_12:
        if (v38)
        {
          v27 = +[MSAutosave autosave];
          [v27 removeAutosavedMessageWithIdentifier:v38];

          BOOL v24 = 1;
        }
      }
    }
    else
    {
      BOOL v24 = 0;
      id v23 = 0;
    }

    goto LABEL_15;
  }
  v17 = a5;
  BOOL v25 = 0;
  id v23 = 0;
LABEL_16:
  xpc_object_t reply = xpc_dictionary_create_reply(v9);
  v29 = (const char *)[MSSendEmailResultKeyInAirplaneMode UTF8String];
  v30 = +[MFNetworkController sharedInstance];
  xpc_dictionary_set_BOOL(reply, v29, (BOOL)[v30 inAirplaneMode]);

  xpc_dictionary_set_BOOL(reply, (const char *)[MSSendEmailResultKeySuccess UTF8String], v25);
  id v31 = reply;
  id *v17 = v31;

  return 1;
}

@end