@interface IMMessageSyndicationAction
- (void)addParametersToSendMessageDictionary:(id)a3;
@end

@implementation IMMessageSyndicationAction

- (void)addParametersToSendMessageDictionary:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)IMMessageSyndicationAction;
  id v4 = a3;
  [(IMMessageSyndicationAction *)&v13 addParametersToSendMessageDictionary:v4];
  id v5 = [(IMMessageSyndicationAction *)self messagePartRange];
  uint64_t v7 = v6;
  v8 = +[NSNumber numberWithUnsignedInteger:v5];
  [v4 setObject:v8 forKeyedSubscript:IMSyndicationActionRangeLocationKey];

  v9 = +[NSNumber numberWithUnsignedInteger:v7];
  [v4 setObject:v9 forKeyedSubscript:IMSyndicationActionRangeLengthKey];

  v10 = [(IMMessageSyndicationAction *)self messagePartGUID];
  v11 = [v10 encodedMessagePartGUID];
  id v12 = [v11 copy];
  [v4 setObject:v12 forKeyedSubscript:IMSyndicationActionMessagePartGUIDKey];
}

@end