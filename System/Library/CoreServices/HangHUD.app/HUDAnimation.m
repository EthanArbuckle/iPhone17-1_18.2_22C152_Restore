@interface HUDAnimation
- (BOOL)canceled;
- (BOOL)retargeted;
- (NSObject)identifier;
- (double)endTime;
- (double)fromValue;
- (double)startTime;
- (double)toValue;
- (double)valueAtTime:(double)a3;
- (id)completionBlock;
- (id)updateBlock;
- (void)setCanceled:(BOOL)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setEndTime:(double)a3;
- (void)setFromValue:(double)a3;
- (void)setIdentifier:(id)a3;
- (void)setRetargeted:(BOOL)a3;
- (void)setStartTime:(double)a3;
- (void)setToValue:(double)a3;
- (void)setUpdateBlock:(id)a3;
@end

@implementation HUDAnimation

- (double)valueAtTime:(double)a3
{
  return self->_fromValue
       + fmax(fmin((a3 - self->_startTime) / (self->_endTime - self->_startTime), 1.0), 0.0)
       * (self->_toValue - self->_fromValue);
}

- (NSObject)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (double)fromValue
{
  return self->_fromValue;
}

- (void)setFromValue:(double)a3
{
  self->_fromValue = a3;
}

- (double)toValue
{
  return self->_toValue;
}

- (void)setToValue:(double)a3
{
  self->_toValue = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (BOOL)retargeted
{
  return self->_retargeted;
}

- (void)setRetargeted:(BOOL)a3
{
  self->_retargeted = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_updateBlock, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end