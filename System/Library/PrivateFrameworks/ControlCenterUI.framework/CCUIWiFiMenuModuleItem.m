@interface CCUIWiFiMenuModuleItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isHotspot;
- (BOOL)isSecure;
- (unint64_t)hash;
- (unint64_t)signalBars;
- (void)setHotspot:(BOOL)a3;
- (void)setSecure:(BOOL)a3;
- (void)setSignalBars:(unint64_t)a3;
@end

@implementation CCUIWiFiMenuModuleItem

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCUIWiFiMenuModuleItem;
  if ([(CCUIMenuModuleItem *)&v9 isEqual:v4])
  {
    id v5 = v4;
    [(CCUIWiFiMenuModuleItem *)self isHotspot];
    [v5 isHotspot];
    if (BSEqualBools()
      && ([(CCUIWiFiMenuModuleItem *)self isSecure],
          [v5 isSecure],
          BSEqualBools()))
    {
      unint64_t v6 = [(CCUIWiFiMenuModuleItem *)self signalBars];
      BOOL v7 = v6 == [v5 signalBars];
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  v10.receiver = self;
  v10.super_class = (Class)CCUIWiFiMenuModuleItem;
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[CCUIMenuModuleItem hash](&v10, sel_hash));
  id v5 = (id)objc_msgSend(v3, "appendBool:", -[CCUIWiFiMenuModuleItem isHotspot](self, "isHotspot"));
  id v6 = (id)objc_msgSend(v3, "appendBool:", -[CCUIWiFiMenuModuleItem isSecure](self, "isSecure"));
  id v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[CCUIWiFiMenuModuleItem signalBars](self, "signalBars"));
  unint64_t v8 = [v3 hash];

  return v8;
}

- (BOOL)isHotspot
{
  return self->_hotspot;
}

- (void)setHotspot:(BOOL)a3
{
  self->_hotspot = a3;
}

- (BOOL)isSecure
{
  return self->_secure;
}

- (void)setSecure:(BOOL)a3
{
  self->_secure = a3;
}

- (unint64_t)signalBars
{
  return self->_signalBars;
}

- (void)setSignalBars:(unint64_t)a3
{
  self->_signalBars = a3;
}

@end