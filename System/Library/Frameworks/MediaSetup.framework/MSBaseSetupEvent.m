@interface MSBaseSetupEvent
- (MSBaseSetupEvent)init;
- (NSString)eventName;
- (id)encoded;
- (void)setEventName:(id)a3;
@end

@implementation MSBaseSetupEvent

- (MSBaseSetupEvent)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSBaseSetupEvent;
  v2 = [(MSBaseSetupEvent *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MSBaseSetupEvent *)v2 setEventName:&stru_26D978A38];
  }
  return v3;
}

- (id)encoded
{
  return (id)MEMORY[0x263EFFA78];
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end