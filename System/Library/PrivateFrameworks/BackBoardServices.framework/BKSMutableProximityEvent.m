@interface BKSMutableProximityEvent
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDetectionMask:(unsigned int)a3;
- (void)setMode:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation BKSMutableProximityEvent

- (void)setTimestamp:(unint64_t)a3
{
  self->super._timestamp = a3;
}

- (void)setMode:(int)a3
{
  self->super._mode = a3;
}

- (void)setDetectionMask:(unsigned int)a3
{
  self->super._detectionMask = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [BKSProximityDetectionMaskChangeEvent alloc];
  return -[BKSProximityDetectionMaskChangeEvent _initWithCopyOf:](v4, self);
}

@end