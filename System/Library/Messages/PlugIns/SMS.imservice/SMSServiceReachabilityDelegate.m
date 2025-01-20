@interface SMSServiceReachabilityDelegate
- (_TtC3SMS30SMSServiceReachabilityDelegate)init;
- (_TtC3SMS30SMSServiceReachabilityDelegate)initWithServiceSession:(id)a3;
- (int64_t)maxChatParticipantsForContext:(id)a3;
@end

@implementation SMSServiceReachabilityDelegate

- (int64_t)maxChatParticipantsForContext:(id)a3
{
  v5 = self;
  id v6 = a3;
  v7 = self;
  id v8 = [v6 senderLastAddressedHandle];
  id v9 = [v6 senderLastAddressedSIMID];
  LODWORD(v5) = [v5 IMMMSMaxRecipientsForPhoneNumber:v8 simID:v9];

  return (int)v5;
}

- (_TtC3SMS30SMSServiceReachabilityDelegate)initWithServiceSession:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SMSServiceReachabilityDelegate();
  return [(SMSServiceReachabilityDelegate *)&v5 initWithServiceSession:a3];
}

- (_TtC3SMS30SMSServiceReachabilityDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SMSServiceReachabilityDelegate();
  return [(SMSServiceReachabilityDelegate *)&v3 init];
}

@end