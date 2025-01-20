@interface DDUIPairCompleteMessage
- (BOOL)isCancellation;
- (DDUIPairCompleteMessage)initWithCancellationReason:(id)a3;
- (DDUIPairCompleteMessage)initWithDictionaryRepresentation:(id)a3;
- (DDUIPairCompleteMessage)initWithNotificationResult:(unint64_t)a3;
- (DDUIPairCompleteMessage)initWithNotificationResult:(unint64_t)a3 listenerUUID:(id)a4;
- (NSDictionary)cancellationReason;
- (NSUUID)listenerUUID;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)notificationResult;
- (void)setIsCancellation:(BOOL)a3;
@end

@implementation DDUIPairCompleteMessage

- (DDUIPairCompleteMessage)initWithNotificationResult:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DDUIPairCompleteMessage;
  result = [(DDUIPairCompleteMessage *)&v5 init];
  if (result) {
    result->_notificationResult = a3;
  }
  return result;
}

- (DDUIPairCompleteMessage)initWithNotificationResult:(unint64_t)a3 listenerUUID:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DDUIPairCompleteMessage;
  v8 = [(DDUIPairCompleteMessage *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_notificationResult = a3;
    objc_storeStrong((id *)&v8->_listenerUUID, a4);
  }

  return v9;
}

- (DDUIPairCompleteMessage)initWithCancellationReason:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DDUIPairCompleteMessage;
  v6 = [(DDUIPairCompleteMessage *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cancellationReason, a3);
    v7->_isCancellation = 1;
  }

  return v7;
}

- (DDUIPairCompleteMessage)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKeyedSubscript:@"DDUIMessageResponseIsCancelKey"];
    int v7 = [v6 BOOLValue];

    if (v7)
    {
      v8 = [v5 objectForKeyedSubscript:@"DDUIMessageResponseCancelReasonKey"];
      self = [(DDUIPairCompleteMessage *)self initWithCancellationReason:v8];
    }
    else
    {
      v8 = [v5 objectForKeyedSubscript:@"DDUIMessageResponseListenerUUIDKey"];
      v10 = [v5 objectForKeyedSubscript:@"DDUIMessageResponseResultKey"];
      uint64_t v11 = [v10 unsignedIntegerValue];
      if (v8) {
        v12 = [(DDUIPairCompleteMessage *)self initWithNotificationResult:v11 listenerUUID:v8];
      }
      else {
        v12 = [(DDUIPairCompleteMessage *)self initWithNotificationResult:v11];
      }
      self = v12;
    }
    objc_super v9 = self;
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = @"DDUIMessageResponseIsCancelKey";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[DDUIPairCompleteMessage isCancellation](self, "isCancellation"));
  v13[0] = v3;
  v12[1] = @"DDUIMessageResponseResultKey";
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DDUIPairCompleteMessage notificationResult](self, "notificationResult"));
  v13[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v6 = (void *)[v5 mutableCopy];

  int v7 = [(DDUIPairCompleteMessage *)self cancellationReason];

  if (v7)
  {
    v8 = [(DDUIPairCompleteMessage *)self cancellationReason];
    [v6 setObject:v8 forKeyedSubscript:@"DDUIMessageResponseCancelReasonKey"];
  }
  objc_super v9 = [(DDUIPairCompleteMessage *)self listenerUUID];

  if (v9)
  {
    v10 = [(DDUIPairCompleteMessage *)self listenerUUID];
    [v6 setObject:v10 forKeyedSubscript:@"DDUIMessageResponseListenerUUIDKey"];
  }
  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_isCancellation) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  v6 = DDUINotificationResultString(self->_notificationResult);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; isCancellation = %@; notificationResult = \"%@\"; cancellationReason = %@; listenerUUID = %@>",
    v4,
    self,
    v5,
    v6,
    self->_cancellationReason,
  int v7 = self->_listenerUUID);

  return v7;
}

- (unint64_t)notificationResult
{
  return self->_notificationResult;
}

- (NSUUID)listenerUUID
{
  return self->_listenerUUID;
}

- (NSDictionary)cancellationReason
{
  return self->_cancellationReason;
}

- (BOOL)isCancellation
{
  return self->_isCancellation;
}

- (void)setIsCancellation:(BOOL)a3
{
  self->_isCancellation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancellationReason, 0);
  objc_storeStrong((id *)&self->_listenerUUID, 0);
}

@end