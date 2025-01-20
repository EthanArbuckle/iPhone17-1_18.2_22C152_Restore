@interface BLSHPendingEnvironmentUpdateOperation
- (BLSBacklightChangeEvent)triggerEvent;
- (BLSHPendingEnvironmentUpdateOperation)initWithEvents:(id)a3 withInitialSpecifier:(id)a4;
- (BLSHPendingEnvironmentUpdateOperation)initWithTriggerEvent:(id)a3 withInitialSpecifier:(id)a4;
- (BLSHPresentationDateSpecifier)initialSpecifier;
- (BOOL)didUpdateInitialState;
- (BOOL)isCompleted;
- (BOOL)isStarted;
- (NSArray)events;
- (NSString)description;
- (int64_t)type;
- (void)setCompleted:(BOOL)a3;
- (void)setStarted:(BOOL)a3;
- (void)setUpdatedInitialState:(BOOL)a3;
@end

@implementation BLSHPendingEnvironmentUpdateOperation

- (BLSHPendingEnvironmentUpdateOperation)initWithEvents:(id)a3 withInitialSpecifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BLSHPendingEnvironmentUpdateOperation;
  v9 = [(BLSHPendingEnvironmentUpdateOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_events, a3);
    objc_storeStrong((id *)&v10->_initialSpecifier, a4);
  }

  return v10;
}

- (BLSHPendingEnvironmentUpdateOperation)initWithTriggerEvent:(id)a3 withInitialSpecifier:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v12 = a3;
  v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:&v12 count:1];

  v10 = -[BLSHPendingEnvironmentUpdateOperation initWithEvents:withInitialSpecifier:](self, "initWithEvents:withInitialSpecifier:", v9, v7, v12, v13);
  return v10;
}

- (int64_t)type
{
  return 3;
}

- (BLSBacklightChangeEvent)triggerEvent
{
  return (BLSBacklightChangeEvent *)[(NSArray *)self->_events firstObject];
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingEnvironmentUpdateOperation isStarted](self, "isStarted"), @"started");
  id v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingEnvironmentUpdateOperation didUpdateInitialState](self, "didUpdateInitialState"), @"updatedInitialState");
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingEnvironmentUpdateOperation isCompleted](self, "isCompleted"), @"completed");
  id v7 = NSStringFromBLSBacklightChangeEvents();
  id v8 = (id)[v3 appendObject:v7 withName:@"events"];

  id v9 = (id)[v3 appendObject:self->_initialSpecifier withName:@"initial" skipIfNil:1];
  v10 = [v3 build];

  return (NSString *)v10;
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (NSArray)events
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)didUpdateInitialState
{
  return self->_updatedInitialState;
}

- (void)setUpdatedInitialState:(BOOL)a3
{
  self->_updatedInitialState = a3;
}

- (BLSHPresentationDateSpecifier)initialSpecifier
{
  return (BLSHPresentationDateSpecifier *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialSpecifier, 0);

  objc_storeStrong((id *)&self->_events, 0);
}

@end