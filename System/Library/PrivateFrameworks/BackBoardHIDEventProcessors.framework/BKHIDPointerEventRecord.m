@interface BKHIDPointerEventRecord
- (BKHIDEventSenderInfo)senderInfo;
- (BOOL)trackingButtonDown;
- (BOOL)trackingPointerMovement;
- (NSSet)destinations;
- (double)destinationCaptureTime;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setDestinationCaptureTime:(double)a3;
- (void)setDestinations:(id)a3;
- (void)setSenderInfo:(id)a3;
- (void)setTrackingButtonDown:(BOOL)a3;
- (void)setTrackingPointerMovement:(BOOL)a3;
@end

@implementation BKHIDPointerEventRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_senderInfo, 0);
}

- (BOOL)trackingButtonDown
{
  return self->_trackingButtonDown;
}

- (BOOL)trackingPointerMovement
{
  return self->_trackingPointerMovement;
}

- (void)setDestinationCaptureTime:(double)a3
{
  self->_destinationCaptureTime = a3;
}

- (double)destinationCaptureTime
{
  return self->_destinationCaptureTime;
}

- (void)setDestinations:(id)a3
{
}

- (NSSet)destinations
{
  return self->_destinations;
}

- (void)setSenderInfo:(id)a3
{
}

- (BKHIDEventSenderInfo)senderInfo
{
  return self->_senderInfo;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  id v5 = (id)[v3 appendDouble:@"trackedTime" withName:4 decimalPrecision:v4 - self->_destinationCaptureTime];
  id v6 = (id)[v3 appendBool:self->_didTrackButtonDown withName:@"didTrackButtonDown"];
  id v7 = (id)[v3 appendBool:self->_didTrackPointerMovement withName:@"didTrackPointerMovement"];
  return v3;
}

- (id)succinctDescription
{
  v2 = [(BKHIDPointerEventRecord *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BKHIDPointerEventRecord *)self descriptionBuilderWithMultilinePrefix:a3];
  double v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  double v4 = [(BKHIDPointerEventRecord *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_senderInfo withName:@"senderInfo"];
  id v6 = (id)[v4 appendObject:self->_destinations withName:@"destinations"];
  id v7 = (id)[v4 appendDouble:@"destinationCaptureTime" withName:4 decimalPrecision:self->_destinationCaptureTime];
  id v8 = (id)[v4 appendBool:self->_trackingButtonDown withName:@"trackingButtonDown"];
  id v9 = (id)[v4 appendBool:self->_trackingPointerMovement withName:@"trackingPointerMovement"];
  return v4;
}

- (void)setTrackingButtonDown:(BOOL)a3
{
  self->_didTrackButtonDown |= a3;
  self->_trackingButtonDown = a3;
}

- (void)setTrackingPointerMovement:(BOOL)a3
{
  self->_didTrackPointerMovement |= a3;
  self->_trackingPointerMovement = a3;
}

@end