@interface MSServiceEvent
- (BOOL)didSucceed;
- (MSServiceEvent)initWithEventType:(int)a3;
- (MSServiceEvent)initWithEventType:(int)a3 serviceID:(id)a4;
- (MSServiceEvent)initWithEventType:(int)a3 serviceID:(id)a4 didSucceed:(BOOL)a5;
- (MSStopwatch)stopwatch;
- (NSString)eventName;
- (NSUUID)serviceID;
- (int)eventType;
- (void)setDidSucceed:(BOOL)a3;
- (void)setEventType:(int)a3;
- (void)setServiceID:(id)a3;
- (void)setStopwatch:(id)a3;
@end

@implementation MSServiceEvent

- (MSServiceEvent)initWithEventType:(int)a3 serviceID:(id)a4 didSucceed:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MSServiceEvent;
  v9 = [(MSServiceEvent *)&v16 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_8;
  }
  if (v6 != 2 || !v8)
  {
    [(MSServiceEvent *)v9 setEventType:v6];
    [(MSServiceEvent *)v10 setServiceID:v8];
    [(MSServiceEvent *)v10 setDidSucceed:v5];
    v13 = objc_alloc_init(MSStopwatch);
    [(MSServiceEvent *)v10 setStopwatch:v13];

LABEL_8:
    v12 = v10;
    goto LABEL_9;
  }
  v11 = _MSLogingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_225D52000, v11, OS_LOG_TYPE_DEFAULT, "Failed to create MSServiceEvent. Tried to log batched update for a particular serviceID", v15, 2u);
  }

  v12 = 0;
LABEL_9:

  return v12;
}

- (MSServiceEvent)initWithEventType:(int)a3 serviceID:(id)a4
{
  return [(MSServiceEvent *)self initWithEventType:*(void *)&a3 serviceID:a4 didSucceed:0];
}

- (MSServiceEvent)initWithEventType:(int)a3
{
  return [(MSServiceEvent *)self initWithEventType:*(void *)&a3 serviceID:0 didSucceed:0];
}

- (NSString)eventName
{
  uint64_t eventType = self->_eventType;
  if (eventType > 2) {
    return 0;
  }
  else {
    return &off_264775388[eventType]->isa;
  }
}

- (int)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int)a3
{
  self->_uint64_t eventType = a3;
}

- (NSUUID)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
}

- (void)setDidSucceed:(BOOL)a3
{
  self->_didSucceed = a3;
}

- (MSStopwatch)stopwatch
{
  return self->_stopwatch;
}

- (void)setStopwatch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopwatch, 0);

  objc_storeStrong((id *)&self->_serviceID, 0);
}

@end