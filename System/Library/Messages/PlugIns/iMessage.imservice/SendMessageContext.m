@interface SendMessageContext
- (GroupMessageContext)groupMessageContext;
- (IDSAccount)idsAccount;
- (IDSService)idsService;
- (IMDAccount)imdAccount;
- (IMDChat)chat;
- (MessageDeliveryContext)messageDeliveryContext;
- (MessageServiceSession)serviceSession;
- (NSArray)originalParticipantURIs;
- (NSArray)participantURIs;
- (NSDate)sendDate;
- (NSNumber)sendDuration;
- (NSString)fromURI;
- (SendMessageContext)initWithChat:(id)a3 withIMDAccount:(id)a4 withIDSAccount:(id)a5 withCallerURI:(id)a6 serviceSession:(id)a7 withIDSService:(id)a8 withParticipantURIs:(id)a9 withOriginalParticipantURIs:(id)a10;
- (void)setGroupMessageContext:(id)a3;
- (void)setMessageDeliveryContext:(id)a3;
- (void)setSendDate:(id)a3;
- (void)setSendDuration:(id)a3;
@end

@implementation SendMessageContext

- (SendMessageContext)initWithChat:(id)a3 withIMDAccount:(id)a4 withIDSAccount:(id)a5 withCallerURI:(id)a6 serviceSession:(id)a7 withIDSService:(id)a8 withParticipantURIs:(id)a9 withOriginalParticipantURIs:(id)a10
{
  v16 = (IMDChat *)a3;
  v17 = (IMDAccount *)a4;
  v18 = (IDSAccount *)a5;
  v19 = (NSString *)a6;
  v20 = (MessageServiceSession *)a7;
  v21 = (IDSService *)a8;
  v22 = (NSArray *)a9;
  v42 = (NSArray *)a10;
  v43.receiver = self;
  v43.super_class = (Class)SendMessageContext;
  v23 = [(SendMessageContext *)&v43 init];
  chat = v23->_chat;
  v23->_chat = v16;
  v25 = v16;

  imdAccount = v23->_imdAccount;
  v23->_imdAccount = v17;
  v27 = v17;

  idsAccount = v23->_idsAccount;
  v23->_idsAccount = v18;
  v29 = v18;

  fromURI = v23->_fromURI;
  v23->_fromURI = v19;
  v31 = v19;

  serviceSession = v23->_serviceSession;
  v23->_serviceSession = v20;
  v33 = v20;

  idsService = v23->_idsService;
  v23->_idsService = v21;
  v35 = v21;

  participantURIs = v23->_participantURIs;
  v23->_participantURIs = v22;
  v37 = v22;

  originalParticipantURIs = v23->_originalParticipantURIs;
  v23->_originalParticipantURIs = v42;
  v39 = v42;

  sendDuration = v23->_sendDuration;
  v23->_sendDuration = (NSNumber *)&off_E39A0;

  return v23;
}

- (MessageServiceSession)serviceSession
{
  return self->_serviceSession;
}

- (IMDChat)chat
{
  return self->_chat;
}

- (IMDAccount)imdAccount
{
  return self->_imdAccount;
}

- (IDSAccount)idsAccount
{
  return self->_idsAccount;
}

- (NSString)fromURI
{
  return self->_fromURI;
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (NSArray)participantURIs
{
  return self->_participantURIs;
}

- (NSArray)originalParticipantURIs
{
  return self->_originalParticipantURIs;
}

- (GroupMessageContext)groupMessageContext
{
  return self->_groupMessageContext;
}

- (void)setGroupMessageContext:(id)a3
{
}

- (MessageDeliveryContext)messageDeliveryContext
{
  return self->_messageDeliveryContext;
}

- (void)setMessageDeliveryContext:(id)a3
{
}

- (NSDate)sendDate
{
  return self->_sendDate;
}

- (void)setSendDate:(id)a3
{
}

- (NSNumber)sendDuration
{
  return self->_sendDuration;
}

- (void)setSendDuration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendDuration, 0);
  objc_storeStrong((id *)&self->_sendDate, 0);
  objc_storeStrong((id *)&self->_messageDeliveryContext, 0);
  objc_storeStrong((id *)&self->_groupMessageContext, 0);
  objc_storeStrong((id *)&self->_originalParticipantURIs, 0);
  objc_storeStrong((id *)&self->_participantURIs, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_fromURI, 0);
  objc_storeStrong((id *)&self->_idsAccount, 0);
  objc_storeStrong((id *)&self->_imdAccount, 0);
  objc_storeStrong((id *)&self->_chat, 0);

  objc_storeStrong((id *)&self->_serviceSession, 0);
}

@end