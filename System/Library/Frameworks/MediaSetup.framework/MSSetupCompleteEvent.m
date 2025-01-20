@interface MSSetupCompleteEvent
- (BOOL)didSwitchAccount;
- (MSSetupCompleteEvent)init;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSString)serviceID;
- (id)encoded;
- (unint64_t)numberOfHomeAdded;
- (unint64_t)numberOfHomesWithVR;
- (void)addHome:(id)a3;
- (void)setDidSwitchAccount:(BOOL)a3;
- (void)setEndTime:(id)a3;
- (void)setNumberOfHomeAdded:(unint64_t)a3;
- (void)setNumberOfHomesWithVR:(unint64_t)a3;
- (void)setServiceID:(id)a3;
- (void)setStartTime:(id)a3;
@end

@implementation MSSetupCompleteEvent

- (MSSetupCompleteEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSSetupCompleteEvent;
  v2 = [(MSBaseSetupEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(MSBaseSetupEvent *)v2 setEventName:@"com.apple.cloudmediaservices.setupcompleted"];
    id v4 = objc_alloc_init(MEMORY[0x263EFF910]);
    [(MSSetupCompleteEvent *)v3 setStartTime:v4];

    [(MSSetupCompleteEvent *)v3 setNumberOfHomeAdded:0];
    [(MSSetupCompleteEvent *)v3 setNumberOfHomesWithVR:0];
    [(MSSetupCompleteEvent *)v3 setDidSwitchAccount:0];
  }
  return v3;
}

- (void)addHome:(id)a3
{
  id v4 = a3;
  [(MSSetupCompleteEvent *)self setNumberOfHomeAdded:[(MSSetupCompleteEvent *)self numberOfHomeAdded] + 1];
  v5 = NSNumber;
  id v8 = [v4 currentUser];
  uint64_t v6 = objc_msgSend(v8, "ms_voiceRecognitionEnabledInHome:", v4);

  v7 = [v5 numberWithBool:v6];
  -[MSSetupCompleteEvent setNumberOfHomesWithVR:](self, "setNumberOfHomesWithVR:", -[MSSetupCompleteEvent numberOfHomesWithVR](self, "numberOfHomesWithVR") + (int)[v7 intValue]);
}

- (id)encoded
{
  v12[5] = *MEMORY[0x263EF8340];
  [(NSDate *)self->_endTime timeIntervalSinceDate:self->_startTime];
  *(float *)&double v3 = v3;
  v11[0] = @"duration";
  id v4 = [NSNumber numberWithFloat:v3];
  serviceID = self->_serviceID;
  v12[0] = v4;
  v12[1] = serviceID;
  v11[1] = @"service";
  v11[2] = @"numberOfHomesAdded";
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_numberOfHomeAdded];
  v12[2] = v6;
  v11[3] = @"numberOfHomesWithVR";
  v7 = [NSNumber numberWithUnsignedInteger:self->_numberOfHomesWithVR];
  v12[3] = v7;
  v11[4] = @"didSwitchAccount";
  id v8 = [NSNumber numberWithBool:self->_didSwitchAccount];
  v12[4] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:5];

  return v9;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
}

- (unint64_t)numberOfHomesWithVR
{
  return self->_numberOfHomesWithVR;
}

- (void)setNumberOfHomesWithVR:(unint64_t)a3
{
  self->_numberOfHomesWithVR = a3;
}

- (unint64_t)numberOfHomeAdded
{
  return self->_numberOfHomeAdded;
}

- (void)setNumberOfHomeAdded:(unint64_t)a3
{
  self->_numberOfHomeAdded = a3;
}

- (BOOL)didSwitchAccount
{
  return self->_didSwitchAccount;
}

- (void)setDidSwitchAccount:(BOOL)a3
{
  self->_didSwitchAccount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);

  objc_storeStrong((id *)&self->_serviceID, 0);
}

@end