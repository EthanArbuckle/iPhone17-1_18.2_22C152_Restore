@interface IDSGFTMetricsMKI
- (void)receivedFirstPacketTime:(double)a3;
- (void)receivedFromGFT2;
- (void)receivedFromPush;
- (void)receivedFromQR;
- (void)receivedFromRatcheting;
@end

@implementation IDSGFTMetricsMKI

- (void)receivedFromPush
{
  objc_msgSend_event_(self, a2, @"recvPush", v2);
}

- (void)receivedFromQR
{
  objc_msgSend_event_(self, a2, @"recvQR", v2);
}

- (void)receivedFromRatcheting
{
  objc_msgSend_event_(self, a2, @"recvRcht", v2);
}

- (void)receivedFromGFT2
{
  objc_msgSend_event_(self, a2, @"recvGFT2", v2);
}

- (void)receivedFirstPacketTime:(double)a3
{
}

@end