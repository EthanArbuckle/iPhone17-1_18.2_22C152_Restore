@interface _HDAlertSuppressorAssertion
- (void)setKeepaliveTimer:(uint64_t)a1;
@end

@implementation _HDAlertSuppressorAssertion

- (void)setKeepaliveTimer:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keepaliveTimer, 0);

  objc_storeStrong((id *)&self->_processBundleIdentifier, 0);
}

@end