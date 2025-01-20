@interface CTDataSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isAirplaneModeEnabled;
- (BOOL)isCellularDataCapable;
- (BOOL)isCellularDataEnabled;
- (CTDataSettings)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAirplaneModeEnabled:(BOOL)a3;
- (void)setCellularDataCapable:(BOOL)a3;
- (void)setCellularDataEnabled:(BOOL)a3;
@end

@implementation CTDataSettings

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", cellularDataEnabled=%d", -[CTDataSettings isCellularDataEnabled](self, "isCellularDataEnabled")];
  [v3 appendFormat:@", airplaneModeEnabled=%d", -[CTDataSettings isAirplaneModeEnabled](self, "isAirplaneModeEnabled")];
  [v3 appendFormat:@", cellularDataCapable=%d", -[CTDataSettings isCellularDataCapable](self, "isCellularDataCapable")];
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setCellularDataEnabled:", -[CTDataSettings isCellularDataEnabled](self, "isCellularDataEnabled"));
  objc_msgSend(v4, "setAirplaneModeEnabled:", -[CTDataSettings isAirplaneModeEnabled](self, "isAirplaneModeEnabled"));
  objc_msgSend(v4, "setCellularDataCapable:", -[CTDataSettings isCellularDataCapable](self, "isCellularDataCapable"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTDataSettings isCellularDataEnabled](self, "isCellularDataEnabled"), @"cellularDataEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[CTDataSettings isAirplaneModeEnabled](self, "isAirplaneModeEnabled"), @"airplaneModeEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[CTDataSettings isCellularDataCapable](self, "isCellularDataCapable"), @"cellularDataCapable");
}

- (CTDataSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTDataSettings;
  v5 = [(CTDataSettings *)&v7 init];
  if (v5)
  {
    -[CTDataSettings setCellularDataEnabled:](v5, "setCellularDataEnabled:", [v4 decodeBoolForKey:@"cellularDataEnabled"]);
    -[CTDataSettings setAirplaneModeEnabled:](v5, "setAirplaneModeEnabled:", [v4 decodeBoolForKey:@"airplaneModeEnabled"]);
    -[CTDataSettings setCellularDataCapable:](v5, "setCellularDataCapable:", [v4 decodeBoolForKey:@"cellularDataCapable"]);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isCellularDataEnabled
{
  return self->_cellularDataEnabled;
}

- (void)setCellularDataEnabled:(BOOL)a3
{
  self->_cellularDataEnabled = a3;
}

- (BOOL)isAirplaneModeEnabled
{
  return self->_airplaneModeEnabled;
}

- (void)setAirplaneModeEnabled:(BOOL)a3
{
  self->_airplaneModeEnabled = a3;
}

- (BOOL)isCellularDataCapable
{
  return self->_cellularDataCapable;
}

- (void)setCellularDataCapable:(BOOL)a3
{
  self->_cellularDataCapable = a3;
}

@end