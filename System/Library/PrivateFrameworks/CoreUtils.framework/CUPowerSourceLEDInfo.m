@interface CUPowerSourceLEDInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CUPowerSourceLEDInfo)initWithCoder:(id)a3;
- (id)description;
- (int)LEDColor;
- (int)LEDState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLEDColor:(int)a3;
- (void)setLEDState:(int)a3;
@end

@implementation CUPowerSourceLEDInfo

- (void)setLEDState:(int)a3
{
  self->_LEDState = a3;
}

- (int)LEDState
{
  return self->_LEDState;
}

- (void)setLEDColor:(int)a3
{
  self->_LEDColor = a3;
}

- (int)LEDColor
{
  return self->_LEDColor;
}

- (id)description
{
  CFMutableStringRef v27 = 0;
  NSAppendPrintF(&v27, (uint64_t)"CUPowerSourceLEDInfo %{ptr}", v2, v3, v4, v5, v6, v7, (uint64_t)self);
  v9 = v27;
  CFMutableStringRef v26 = v9;
  NSAppendPrintF(&v26, (uint64_t)", St %d (%s)", v10, v11, v12, v13, v14, v15, self->_LEDState);
  v16 = v26;

  CFMutableStringRef v25 = v16;
  NSAppendPrintF(&v25, (uint64_t)", Cl %d (%s)", v17, v18, v19, v20, v21, v22, self->_LEDColor);
  v23 = v25;

  return v23;
}

- (unint64_t)hash
{
  return self->_LEDColor ^ self->_LEDState;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int LEDState = self->_LEDState, LEDState == [v4 LEDState]))
  {
    int LEDColor = self->_LEDColor;
    BOOL v7 = LEDColor == [v4 LEDColor];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t LEDState = self->_LEDState;
  id v7 = v4;
  if (LEDState)
  {
    [v4 encodeInteger:LEDState forKey:@"state"];
    id v4 = v7;
  }
  uint64_t LEDColor = self->_LEDColor;
  if (LEDColor)
  {
    [v7 encodeInteger:LEDColor forKey:@"color"];
    id v4 = v7;
  }
}

- (CUPowerSourceLEDInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CUPowerSourceLEDInfo;
  uint64_t v5 = [(CUPowerSourceLEDInfo *)&v8 init];
  if (v5)
  {
    uint64_t v9 = 0;
    if (NSDecodeSInt64RangedIfPresent(v4, @"state", 0xFFFFFFFF80000000, 0x7FFFFFFFLL, &v9)) {
      v5->_uint64_t LEDState = v9;
    }
    uint64_t v9 = 0;
    if (NSDecodeSInt64RangedIfPresent(v4, @"color", 0xFFFFFFFF80000000, 0x7FFFFFFFLL, &v9)) {
      v5->_uint64_t LEDColor = v9;
    }
    uint64_t v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end