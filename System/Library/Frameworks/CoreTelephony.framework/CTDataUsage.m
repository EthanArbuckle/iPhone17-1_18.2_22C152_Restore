@interface CTDataUsage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (CTDataUsage)initWithCoder:(id)a3;
- (CTDataUsage)initWithHome:(unint64_t)a3 roaming:(unint64_t)a4;
- (CTDataUsage)initWithHome:(unint64_t)a3 roaming:(unint64_t)a4 wifi:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)cellularHome;
- (unint64_t)cellularRoaming;
- (unint64_t)hash;
- (unint64_t)wifi;
- (void)addUsage:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCellularHome:(unint64_t)a3;
- (void)setCellularRoaming:(unint64_t)a3;
- (void)setWifi:(unint64_t)a3;
@end

@implementation CTDataUsage

- (CTDataUsage)initWithHome:(unint64_t)a3 roaming:(unint64_t)a4 wifi:(unint64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CTDataUsage;
  result = [(CTDataUsage *)&v8 init];
  if (result)
  {
    result->_cellularHome = a3;
    result->_cellularRoaming = a4;
    result->_wifi = 0;
  }
  return result;
}

- (CTDataUsage)initWithHome:(unint64_t)a3 roaming:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CTDataUsage;
  result = [(CTDataUsage *)&v7 init];
  if (result)
  {
    result->_cellularHome = a3;
    result->_cellularRoaming = a4;
    result->_wifi = 0;
  }
  return result;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", cellular home = %lu", -[CTDataUsage cellularHome](self, "cellularHome")];
  [v3 appendFormat:@", cellular roaming = %lu", -[CTDataUsage cellularRoaming](self, "cellularRoaming")];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CTDataUsage *)self cellularHome];
  if (v5 == [v4 cellularHome])
  {
    unint64_t v6 = [(CTDataUsage *)self cellularRoaming];
    BOOL v7 = v6 == [v4 cellularRoaming];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CTDataUsage *)self cellularHome];
  return [(CTDataUsage *)self cellularRoaming] | v3;
}

- (void)addUsage:(id)a3
{
  id v4 = a3;
  -[CTDataUsage setCellularHome:](self, "setCellularHome:", -[CTDataUsage cellularHome](self, "cellularHome") + [v4 cellularHome]);
  uint64_t v5 = [v4 cellularRoaming];

  unint64_t v6 = [(CTDataUsage *)self cellularRoaming] + v5;

  [(CTDataUsage *)self setCellularRoaming:v6];
}

- (BOOL)isEmpty
{
  return ![(CTDataUsage *)self cellularHome]
      && [(CTDataUsage *)self cellularRoaming] == 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[1] = [(CTDataUsage *)self cellularHome];
  v4[2] = [(CTDataUsage *)self cellularRoaming];
  v4[3] = [(CTDataUsage *)self wifi];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  unint64_t v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[CTDataUsage cellularHome](self, "cellularHome"));
  [v5 encodeObject:v6 forKey:@"cellularHome"];

  BOOL v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTDataUsage cellularRoaming](self, "cellularRoaming"));
  [v5 encodeObject:v7 forKey:@"cellularRoaming"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTDataUsage wifi](self, "wifi"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v8 forKey:@"wifiKey"];
}

- (CTDataUsage)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTDataUsage;
  id v5 = [(CTDataUsage *)&v10 init];
  if (v5)
  {
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cellularHome"];
    v5->_cellularHome = [v6 unsignedIntegerValue];

    BOOL v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cellularRoaming"];
    v5->_cellularRoaming = [v7 unsignedIntegerValue];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wifiKey"];
    v5->_wifi = [v8 unsignedIntegerValue];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)cellularHome
{
  return self->_cellularHome;
}

- (void)setCellularHome:(unint64_t)a3
{
  self->_cellularHome = a3;
}

- (unint64_t)cellularRoaming
{
  return self->_cellularRoaming;
}

- (void)setCellularRoaming:(unint64_t)a3
{
  self->_cellularRoaming = a3;
}

- (unint64_t)wifi
{
  return self->_wifi;
}

- (void)setWifi:(unint64_t)a3
{
  self->_wifi = a3;
}

@end