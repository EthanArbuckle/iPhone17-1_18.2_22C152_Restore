@interface MSSetupFailedEvent
- (MSSetupFailedEvent)initWithErrorNamed:(id)a3;
- (NSString)errorName;
- (NSString)serviceID;
- (id)encoded;
- (void)setErrorName:(id)a3;
- (void)setServiceID:(id)a3;
@end

@implementation MSSetupFailedEvent

- (MSSetupFailedEvent)initWithErrorNamed:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSSetupFailedEvent;
  v5 = [(MSBaseSetupEvent *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(MSBaseSetupEvent *)v5 setEventName:@"com.apple.cloudmediaservices.setupfailed"];
    [(MSSetupFailedEvent *)v6 setErrorName:v4];
  }

  return v6;
}

- (id)encoded
{
  v9[2] = *MEMORY[0x263EF8340];
  serviceID = (__CFString *)self->_serviceID;
  if (!serviceID) {
    serviceID = &stru_26D978A38;
  }
  v8[0] = @"service";
  v8[1] = @"errorName";
  errorName = self->_errorName;
  v9[0] = serviceID;
  v9[1] = errorName;
  id v4 = NSDictionary;
  v5 = serviceID;
  v6 = [v4 dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
}

- (NSString)errorName
{
  return self->_errorName;
}

- (void)setErrorName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorName, 0);

  objc_storeStrong((id *)&self->_serviceID, 0);
}

@end