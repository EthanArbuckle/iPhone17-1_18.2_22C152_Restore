@interface ASAccessoryEvent
+ (BOOL)supportsSecureCoding;
- (ASAccessory)accessory;
- (ASAccessoryEvent)initWithEventType:(int64_t)a3;
- (ASAccessoryEvent)initWithEventType:(int64_t)a3 error:(id)a4;
- (NSError)error;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int64_t)eventType;
- (void)setAccessory:(id)a3;
- (void)setError:(id)a3;
@end

@implementation ASAccessoryEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASAccessoryEvent)initWithEventType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ASAccessoryEvent;
  v4 = [(ASAccessoryEvent *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_eventType = a3;
    v6 = v4;
  }

  return v5;
}

- (ASAccessoryEvent)initWithEventType:(int64_t)a3 error:(id)a4
{
  id v7 = a4;
  objc_super v8 = [(ASAccessoryEvent *)self initWithEventType:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_error, a4);
    v10 = v9;
  }

  return v9;
}

- (id)description
{
  return [(ASAccessoryEvent *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    v4 = (__CFString *)0;
  }
  int64_t eventType = self->_eventType;
  if (eventType)
  {
    v10 = ASAccessoryEventTypeToString(eventType);
    CUAppendF();
    v6 = v4;

    v4 = v6;
  }
  id v7 = &stru_26F86DD88;
  if (v4) {
    id v7 = v4;
  }
  objc_super v8 = v7;

  return v8;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (ASAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_accessory, 0);
}

@end