@interface CRKConcreteTimerPrimitives
- (id)scheduleTimerWithIdentifier:(id)a3 timeInterval:(double)a4 fireHandler:(id)a5;
@end

@implementation CRKConcreteTimerPrimitives

- (id)scheduleTimerWithIdentifier:(id)a3 timeInterval:(double)a4 fireHandler:(id)a5
{
  return +[CRKDispatchTimer scheduledTimerWithTimerInterval:MEMORY[0x263EF83A0] queue:a5 handler:a4];
}

@end