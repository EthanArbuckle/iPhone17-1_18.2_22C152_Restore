@interface XRCourierAgent
+ (id)sendCourierToVisitWaitingRoom:(id)a3 message:(id)a4 details:(id)a5;
+ (id)sendCourierToVisitWaitingRoom:(id)a3 message:(id)a4 details:(id)a5 replyStop:(id)a6 replyTicket:(id)a7;
- (BOOL)yieldNow;
- (NSDictionary)details;
- (NSDictionary)reply;
- (NSString)message;
- (XRCourierAgent)init;
- (XRCourierAgent)initWithMessage:(id)a3 details:(id)a4;
- (XRMobileAgentOwner)roomOwner;
- (id)agentDiagnosticsName;
- (void)executeStopOnItinerary:(id)a3;
- (void)sendToWaitingRoom:(id)a3;
- (void)sendToWaitingRoom:(id)a3 replyStop:(id)a4 replyTicket:(id)a5;
- (void)setReply:(id)a3;
- (void)setRoomOwner:(id)a3;
@end

@implementation XRCourierAgent

+ (id)sendCourierToVisitWaitingRoom:(id)a3 message:(id)a4 details:(id)a5 replyStop:(id)a6 replyTicket:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [XRCourierAgent alloc];
  v19 = [v16 initWithMessage:v17 details:v14, v13, v18];

  [v19 sendToWaitingRoom:v20 replyStop:(uint64_t)v15 replyTicket:(uint64_t)v12];

  return v19;
}

+ (id)sendCourierToVisitWaitingRoom:(id)a3 message:(id)a4 details:(id)a5
{
  return (id)MEMORY[0x270F9A6D0](a1, sel_sendCourierToVisitWaitingRoom_message_details_replyStop_replyTicket_, a3, a4, a5);
}

- (XRCourierAgent)initWithMessage:(id)a3 details:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)XRCourierAgent;
  v9 = [(XRCourierAgent *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_message, a3);
    uint64_t v15 = [v8 copyWithZone:v11];
    details = v10->_details;
    v10->_details = (NSDictionary *)v15;
  }
  return v10;
}

- (void)sendToWaitingRoom:(id)a3 replyStop:(id)a4 replyTicket:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v10 visitorTicketForAgent:v11 team:(uint64_t)self];
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [self activateAtStop:v13 activationTicket:v10 finalDestination:v14 finalTicket:v9];
}

- (void)sendToWaitingRoom:(id)a3
{
}

- (XRCourierAgent)init
{
  return 0;
}

- (id)agentDiagnosticsName
{
  return @"Courier";
}

- (BOOL)yieldNow
{
  return 0;
}

- (void)executeStopOnItinerary:(id)a3
{
  id v4 = a3;
  [self performSelector:v5 withObject:v6 withObject:v7 withObject:v8];
  id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9 == @"Activating")
  {
    v21.receiver = self;
    v21.super_class = (Class)XRCourierAgent;
    [(XRMobileAgent *)&v21 executeStopOnItinerary:v4];
    id v14 = [v4 _currentStopWithTransitionContext:v10 completion:v11];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      if (self->_roomOwner) {
        v19 = XRMobileAgentFinished;
      }
      else {
        v19 = &XRMobileAgentFailed;
      }
    }
    else
    {
      v19 = XRMobileAgentFinished;
    }
    [v4 finishedWithMode:v16 finished:v17 finishedWithError:v18];
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)XRCourierAgent;
    [(XRMobileAgent *)&v20 executeStopOnItinerary:v4];
  }
}

- (XRMobileAgentOwner)roomOwner
{
  return self->_roomOwner;
}

- (void)setRoomOwner:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (NSDictionary)details
{
  return self->_details;
}

- (NSDictionary)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reply, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_roomOwner, 0);
}

@end