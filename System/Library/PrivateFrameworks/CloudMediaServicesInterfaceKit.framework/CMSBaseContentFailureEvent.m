@interface CMSBaseContentFailureEvent
- (CMSBaseContentFailureEvent)initWithServiceID:(id)a3 sessionIdentifier:(id)a4;
- (NSString)eventName;
- (NSString)serviceID;
- (NSString)sessionIdentifier;
- (id)encoded;
- (void)setEventName:(id)a3;
- (void)setServiceID:(id)a3;
- (void)setSessionIdentifier:(id)a3;
@end

@implementation CMSBaseContentFailureEvent

- (CMSBaseContentFailureEvent)initWithServiceID:(id)a3 sessionIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CMSBaseContentFailureEvent;
  v9 = [(CMSBaseContentFailureEvent *)&v14 init];
  p_isa = (id *)&v9->super.isa;
  if (!v9) {
    goto LABEL_5;
  }
  v11 = 0;
  if (v7 && v8)
  {
    eventName = v9->_eventName;
    v9->_eventName = (NSString *)&stru_26DE5AB78;

    objc_storeStrong(p_isa + 2, a3);
    objc_storeStrong(p_isa + 3, a4);
LABEL_5:
    v11 = p_isa;
  }

  return v11;
}

- (id)encoded
{
  v6[2] = *MEMORY[0x263EF8340];
  v5[0] = @"service";
  v5[1] = @"sessionIdentifier";
  sessionIdentifier = self->_sessionIdentifier;
  v6[0] = self->_serviceID;
  v6[1] = sessionIdentifier;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  return v3;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end