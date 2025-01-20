@interface BMDistributedContextTranslatedEventMessage
- (BMDistributedContextTranslatedEventMessage)initWithStreamIdentifier:(id)a3 eventData:(id)a4 eventDataVersion:(id)a5;
- (NSData)eventData;
- (NSNumber)eventDataVersion;
- (NSString)streamIdentifier;
- (void)setEventData:(id)a3;
- (void)setEventDataVersion:(id)a3;
- (void)setStreamIdentifier:(id)a3;
@end

@implementation BMDistributedContextTranslatedEventMessage

- (BMDistributedContextTranslatedEventMessage)initWithStreamIdentifier:(id)a3 eventData:(id)a4 eventDataVersion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMDistributedContextTranslatedEventMessage;
  v12 = [(BMDistributedContextTranslatedEventMessage *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_streamIdentifier, a3);
    objc_storeStrong((id *)&v13->_eventData, a4);
    objc_storeStrong((id *)&v13->_eventDataVersion, a5);
  }

  return v13;
}

- (NSString)streamIdentifier
{
  return self->_streamIdentifier;
}

- (void)setStreamIdentifier:(id)a3
{
}

- (NSData)eventData
{
  return self->_eventData;
}

- (void)setEventData:(id)a3
{
}

- (NSNumber)eventDataVersion
{
  return self->_eventDataVersion;
}

- (void)setEventDataVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDataVersion, 0);
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_streamIdentifier, 0);
}

@end