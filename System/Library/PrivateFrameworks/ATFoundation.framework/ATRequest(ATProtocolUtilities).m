@interface ATRequest(ATProtocolUtilities)
- (id)ATPMessage;
- (id)ATPMessageWithPayloadData:()ATProtocolUtilities;
- (id)initWithATPMessage:()ATProtocolUtilities;
@end

@implementation ATRequest(ATProtocolUtilities)

- (id)ATPMessageWithPayloadData:()ATProtocolUtilities
{
  v7.receiver = a1;
  v7.super_class = (Class)&off_1F33E96F8;
  id v4 = a3;
  v5 = objc_msgSendSuper2(&v7, sel_ATPMessageWithPayloadData_, v4);
  objc_msgSend(v5, "setMessageType:", 3, v7.receiver, v7.super_class);
  objc_msgSend(v5, "setMessageID:", objc_msgSend(a1, "messageID"));
  objc_msgSend(v5, "setSessionID:", objc_msgSend(a1, "sessionID"));
  [v5 setPayload:v4];

  return v5;
}

- (id)ATPMessage
{
  v9.receiver = a1;
  v9.super_class = (Class)&off_1F33E96F8;
  v2 = objc_msgSendSuper2(&v9, sel_ATPMessage);
  [v2 setMessageType:0];
  v3 = objc_alloc_init(ATPRequest);
  [v2 setRequest:v3];

  id v4 = [a1 command];
  v5 = [v2 request];
  [v5 setCommand:v4];

  v6 = [a1 dataClass];
  objc_super v7 = [v2 request];
  [v7 setDataClass:v6];

  return v2;
}

- (id)initWithATPMessage:()ATProtocolUtilities
{
  id v4 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&off_1F33E96F8;
  id v5 = objc_msgSendSuper2(&v11, sel_initWithATPMessage_, v4);
  if (v5)
  {
    v6 = [v4 request];
    objc_super v7 = [v6 command];
    [v5 setCommand:v7];

    v8 = [v4 request];
    objc_super v9 = [v8 dataClass];
    [v5 setDataClass:v9];
  }
  return v5;
}

@end