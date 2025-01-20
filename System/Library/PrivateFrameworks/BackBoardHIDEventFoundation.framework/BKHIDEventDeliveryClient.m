@interface BKHIDEventDeliveryClient
- (void)invalidate;
- (void)setBufferTimer:(uint64_t)a1;
- (void)setProcessDescription:(uint64_t)a1;
@end

@implementation BKHIDEventDeliveryClient

- (void)setBufferTimer:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferTimer, 0);
  objc_storeStrong((id *)&self->_observerResolutions, 0);
  objc_storeStrong((id *)&self->_keyCommandsRegistrations, 0);
  objc_storeStrong((id *)&self->_deferringRules, 0);
  objc_storeStrong((id *)&self->_keyCommandDeliveryRoots, 0);
  objc_storeStrong((id *)&self->_deliveryRoots, 0);

  objc_storeStrong((id *)&self->_processDescription, 0);
}

- (void)invalidate
{
  [(BSContinuousMachTimer *)self->_bufferTimer invalidate];
  bufferTimer = self->_bufferTimer;
  self->_bufferTimer = 0;
}

- (void)setProcessDescription:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

@end