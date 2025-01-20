@interface MSSetupEarlyExitEvent
- (BOOL)didEncounterError;
- (MSSetupEarlyExitEvent)initWithExitReason:(id)a3 didEncounterError:(BOOL)a4;
- (NSString)exitReason;
- (NSString)serviceID;
- (id)encoded;
- (void)setDidEncounterError:(BOOL)a3;
- (void)setExitReason:(id)a3;
- (void)setServiceID:(id)a3;
@end

@implementation MSSetupEarlyExitEvent

- (MSSetupEarlyExitEvent)initWithExitReason:(id)a3 didEncounterError:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSSetupEarlyExitEvent;
  v7 = [(MSBaseSetupEvent *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(MSBaseSetupEvent *)v7 setEventName:@"com.apple.cloudmediaservices.setupearlyexit"];
    [(MSSetupEarlyExitEvent *)v8 setExitReason:v6];
    [(MSSetupEarlyExitEvent *)v8 setDidEncounterError:v4];
  }

  return v8;
}

- (id)encoded
{
  v11[3] = *MEMORY[0x263EF8340];
  serviceID = (__CFString *)self->_serviceID;
  if (!serviceID) {
    serviceID = &stru_26D978A38;
  }
  exitReason = self->_exitReason;
  v10[0] = @"service";
  v10[1] = @"exitReason";
  v11[0] = serviceID;
  v11[1] = exitReason;
  v10[2] = @"didEncounterError";
  BOOL v4 = NSNumber;
  BOOL didEncounterError = self->_didEncounterError;
  id v6 = serviceID;
  v7 = [v4 numberWithBool:didEncounterError];
  v11[2] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
}

- (NSString)exitReason
{
  return self->_exitReason;
}

- (void)setExitReason:(id)a3
{
}

- (BOOL)didEncounterError
{
  return self->_didEncounterError;
}

- (void)setDidEncounterError:(BOOL)a3
{
  self->_BOOL didEncounterError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitReason, 0);

  objc_storeStrong((id *)&self->_serviceID, 0);
}

@end