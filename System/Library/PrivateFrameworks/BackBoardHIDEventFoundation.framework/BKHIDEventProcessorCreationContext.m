@interface BKHIDEventProcessorCreationContext
- (BKHIDEventDispatcher)eventDispatcher;
- (BKHIDEventProcessorRegistering)eventProcessorRegistry;
- (BKHIDSystemInterfacing)systemInterface;
- (BKIOHIDServiceMatcherDataProviding)serviceMatcherDataProvider;
- (void)setEventDispatcher:(id)a3;
- (void)setEventProcessorRegistry:(id)a3;
- (void)setServiceMatcherDataProvider:(id)a3;
- (void)setSystemInterface:(id)a3;
@end

@implementation BKHIDEventProcessorCreationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventProcessorRegistry, 0);
  objc_storeStrong((id *)&self->_serviceMatcherDataProvider, 0);
  objc_storeStrong((id *)&self->_eventDispatcher, 0);

  objc_storeStrong((id *)&self->_systemInterface, 0);
}

- (void)setEventProcessorRegistry:(id)a3
{
}

- (BKHIDEventProcessorRegistering)eventProcessorRegistry
{
  return self->_eventProcessorRegistry;
}

- (void)setServiceMatcherDataProvider:(id)a3
{
}

- (BKIOHIDServiceMatcherDataProviding)serviceMatcherDataProvider
{
  return self->_serviceMatcherDataProvider;
}

- (void)setEventDispatcher:(id)a3
{
}

- (BKHIDEventDispatcher)eventDispatcher
{
  return self->_eventDispatcher;
}

- (void)setSystemInterface:(id)a3
{
}

- (BKHIDSystemInterfacing)systemInterface
{
  return self->_systemInterface;
}

@end