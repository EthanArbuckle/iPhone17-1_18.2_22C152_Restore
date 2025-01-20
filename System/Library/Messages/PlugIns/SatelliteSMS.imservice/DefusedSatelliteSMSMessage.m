@interface DefusedSatelliteSMSMessage
+ (id)defusedSatelliteSMSMessageWithDictionary:(id)a3 senderID:(id)a4;
- (NSArray)texts;
- (void)setTexts:(id)a3;
@end

@implementation DefusedSatelliteSMSMessage

+ (id)defusedSatelliteSMSMessageWithDictionary:(id)a3 senderID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(DefusedSatelliteSMSMessage);
  v8 = +[IMDChatRegistry sharedInstance];
  id v9 = [v8 hasKnownSenderChatWithChatIdentifier:v5];

  v10 = +[IMSenderContext contextWithKnownSender:v9 serviceName:IMServiceNameiMessageLite];
  uint64_t v14 = 0;
  v11 = +[IMBlastdoor sendSatelliteSMSDictionary:v6 senderContext:v10 error:&v14];

  if (v11)
  {
    v12 = [v11 plainTextBodies];
    [(DefusedSatelliteSMSMessage *)v7 setTexts:v12];
  }

  return v7;
}

- (NSArray)texts
{
  return self->_texts;
}

- (void)setTexts:(id)a3
{
}

- (void).cxx_destruct
{
}

@end