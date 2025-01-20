@interface GCRacingWheelInputState
- (GCGearShifterElement)shifter;
- (GCSteeringWheelElement)wheel;
- (id)acceleratorPedal;
- (id)brakePedal;
- (id)clutchPedal;
@end

@implementation GCRacingWheelInputState

- (GCSteeringWheelElement)wheel
{
  return (GCSteeringWheelElement *)[(_GCDevicePhysicalInputFacade *)self objectForKeyedSubscript:@"Steering Wheel"];
}

- (id)acceleratorPedal
{
  return [(_GCDevicePhysicalInputFacade *)self objectForKeyedSubscript:@"Accelerator Pedal"];
}

- (id)brakePedal
{
  return [(_GCDevicePhysicalInputFacade *)self objectForKeyedSubscript:@"Brake Pedal"];
}

- (id)clutchPedal
{
  return [(_GCDevicePhysicalInputFacade *)self objectForKeyedSubscript:@"Clutch Pedal"];
}

- (GCGearShifterElement)shifter
{
  return (GCGearShifterElement *)[(_GCDevicePhysicalInputFacade *)self objectForKeyedSubscript:@"Shifter"];
}

@end