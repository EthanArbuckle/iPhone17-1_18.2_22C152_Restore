@interface BMAppIntent_v11
- (int)handlingStatus;
@end

@implementation BMAppIntent_v11

- (int)handlingStatus
{
  v4.receiver = self;
  v4.super_class = (Class)BMAppIntent_v11;
  unsigned int v2 = [(BMAppIntent *)&v4 handlingStatus];
  if (v2 < 7) {
    return v2 + 1;
  }
  else {
    return 0;
  }
}

@end