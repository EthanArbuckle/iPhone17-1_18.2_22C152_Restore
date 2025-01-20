@interface HUPressedItemContext
- (BOOL)isActive;
- (BOOL)isUserInitiated;
- (HFItem)item;
- (HUElasticApplier)applier;
- (NSTimer)programmaticBounceTimer;
- (double)beginTime;
- (double)currentViewScale;
- (double)rawInputProgress;
- (void)setActive:(BOOL)a3;
- (void)setApplier:(id)a3;
- (void)setBeginTime:(double)a3;
- (void)setCurrentViewScale:(double)a3;
- (void)setIsUserInitiated:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setProgrammaticBounceTimer:(id)a3;
- (void)setRawInputProgress:(double)a3;
@end

@implementation HUPressedItemContext

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (HUElasticApplier)applier
{
  return self->_applier;
}

- (void)setApplier:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (double)beginTime
{
  return self->_beginTime;
}

- (void)setBeginTime:(double)a3
{
  self->_beginTime = a3;
}

- (double)rawInputProgress
{
  return self->_rawInputProgress;
}

- (void)setRawInputProgress:(double)a3
{
  self->_rawInputProgress = a3;
}

- (double)currentViewScale
{
  return self->_currentViewScale;
}

- (void)setCurrentViewScale:(double)a3
{
  self->_currentViewScale = a3;
}

- (BOOL)isUserInitiated
{
  return self->_isUserInitiated;
}

- (void)setIsUserInitiated:(BOOL)a3
{
  self->_isUserInitiated = a3;
}

- (NSTimer)programmaticBounceTimer
{
  return self->_programmaticBounceTimer;
}

- (void)setProgrammaticBounceTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_programmaticBounceTimer, 0);
  objc_storeStrong((id *)&self->_applier, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end