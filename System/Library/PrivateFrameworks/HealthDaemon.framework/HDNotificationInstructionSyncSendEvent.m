@interface HDNotificationInstructionSyncSendEvent
- (BOOL)isEventSubmissionIHAGated;
- (HDNotificationInstructionSyncSendEvent)initWithNotificationInstructionMessage:(id)a3 sendError:(id)a4;
- (NSString)eventName;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation HDNotificationInstructionSyncSendEvent

- (HDNotificationInstructionSyncSendEvent)initWithNotificationInstructionMessage:(id)a3 sendError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDNotificationInstructionSyncSendEvent;
  v8 = [(HDNotificationInstructionSyncSendEvent *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    message = v8->_message;
    v8->_message = (HDNotificationInstructionMessage *)v9;

    uint64_t v11 = [v7 copy];
    sendError = v8->_sendError;
    v8->_sendError = (NSError *)v11;
  }
  return v8;
}

- (NSString)eventName
{
  return (NSString *)@"com.apple.health.healthapp.notificationsync";
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = @"categoryIdentifier";
  v4 = [(HDNotificationInstructionMessage *)self->_message categoryIdentifier];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v16 = @"clientIdentifier";
  id v6 = [(HDNotificationInstructionMessage *)self->_message clientIdentifier];
  v17[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  v8 = (void *)[v5 initWithDictionary:v7];

  sendError = self->_sendError;
  if (sendError)
  {
    v10 = NSString;
    uint64_t v11 = [(NSError *)sendError domain];
    v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSError code](self->_sendError, "code"));
    v13 = [v10 stringWithFormat:@"%@_%@", v11, v12];
    [v8 setObject:v13 forKeyedSubscript:@"error"];
  }
  objc_super v14 = (void *)[v8 copy];

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendError, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end