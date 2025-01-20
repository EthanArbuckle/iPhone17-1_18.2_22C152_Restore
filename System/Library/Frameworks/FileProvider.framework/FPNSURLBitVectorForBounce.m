@interface FPNSURLBitVectorForBounce
- (BOOL)foundAllAvailableBounceNumbers;
- (FPNSURLBitVectorForBounce)init;
- (id)findNextAvailableBounceNumber;
- (id)findNextAvailableBounceNumberFromIndex:(int)a3;
- (int)bitCount;
- (void)markBounceNumberAsFound:(id)a3;
@end

@implementation FPNSURLBitVectorForBounce

- (FPNSURLBitVectorForBounce)init
{
  v6.receiver = self;
  v6.super_class = (Class)FPNSURLBitVectorForBounce;
  v2 = [(FPNSURLBitVectorForBounce *)&v6 init];
  if (v2)
  {
    int v3 = objc_msgSend(NSString, "fp_maximumBounceLevel");
    v2->_bitCount = v3;
    Mutable = CFBitVectorCreateMutable(0, v3);
    v2->_vector = Mutable;
    CFBitVectorSetCount(Mutable, v2->_bitCount);
  }
  return v2;
}

- (void)markBounceNumberAsFound:(id)a3
{
  id v5 = a3;
  unsigned int v4 = [v5 unsignedIntValue];
  if (objc_msgSend(NSString, "fp_maximumBounceLevel") >= (unint64_t)v4) {
    CFBitVectorSetBitAtIndex(self->_vector, (int)([v5 intValue] - 1), 1u);
  }
}

- (id)findNextAvailableBounceNumberFromIndex:(int)a3
{
  int v3 = NSNumber;
  v7.location = a3;
  v7.length = self->_bitCount - 1;
  CFIndex FirstIndexOfBit = CFBitVectorGetFirstIndexOfBit(self->_vector, v7, 0);

  return (id)[v3 numberWithInt:FirstIndexOfBit];
}

- (id)findNextAvailableBounceNumber
{
  return [(FPNSURLBitVectorForBounce *)self findNextAvailableBounceNumberFromIndex:1];
}

- (BOOL)foundAllAvailableBounceNumbers
{
  v3.length = self->_bitCount - 1;
  v3.location = 1;
  return CFBitVectorGetCountOfBit(self->_vector, v3, 1u) == self->_bitCount - 2;
}

- (int)bitCount
{
  return self->_bitCount;
}

@end