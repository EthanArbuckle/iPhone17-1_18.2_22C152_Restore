@interface GEOJunction
+ (BOOL)supportsSecureCoding;
- (GEOJunction)initWithCoder:(id)a3;
- (GEOJunction)initWithJunctionInfo:(id)a3;
- (GEOJunction)initWithManeuverType:(int)a3 drivingSide:(int)a4;
- (GEOJunction)initWithStep:(id)a3;
- (GEOJunctionElement)elements;
- (int)drivingSide;
- (int)junctionType;
- (int)maneuverType;
- (unint64_t)numElements;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOJunction

- (GEOJunction)initWithStep:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOJunction;
  v5 = [(GEOJunction *)&v15 init];
  if (v5)
  {
    v6 = [v4 geoStep];
    v5->_maneuverType = [v6 maneuverType];

    v5->_drivingSide = [v4 drivingSide];
    v7 = [v4 geoStep];
    v5->_junctionType = [v7 junctionType];

    v8 = (void *)MEMORY[0x1E4F1C9B8];
    v9 = [v4 geoStep];
    uint64_t v10 = [v9 junctionElements];
    v11 = [v4 geoStep];
    uint64_t v12 = objc_msgSend(v8, "dataWithBytes:length:", v10, 16 * objc_msgSend(v11, "junctionElementsCount"));
    elementsData = v5->_elementsData;
    v5->_elementsData = (NSData *)v12;
  }
  return v5;
}

- (GEOJunction)initWithManeuverType:(int)a3 drivingSide:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)GEOJunction;
  result = [(GEOJunction *)&v7 init];
  if (result)
  {
    result->_maneuverType = a3;
    result->_drivingSide = a4;
  }
  return result;
}

- (GEOJunction)initWithJunctionInfo:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOJunction;
  v5 = [(GEOJunction *)&v9 init];
  if (v5)
  {
    v5->_maneuverType = [v4 maneuverType];
    v5->_drivingSide = [v4 drivingSide];
    v5->_junctionType = [v4 junctionType];
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", objc_msgSend(v4, "junctionElements"), 16 * objc_msgSend(v4, "junctionElementsCount"));
    elementsData = v5->_elementsData;
    v5->_elementsData = (NSData *)v6;
  }
  return v5;
}

- (GEOJunctionElement)elements
{
  return (GEOJunctionElement *)[(NSData *)self->_elementsData bytes];
}

- (unint64_t)numElements
{
  return [(NSData *)self->_elementsData length] >> 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOJunction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOJunction;
  v5 = [(GEOJunction *)&v9 init];
  if (v5)
  {
    v5->_maneuverType = [v4 decodeInt32ForKey:@"ManeuverType"];
    v5->_drivingSide = [v4 decodeInt32ForKey:@"DrivingSide"];
    v5->_junctionType = [v4 decodeInt32ForKey:@"JunctionType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ElementsData"];
    elementsData = v5->_elementsData;
    v5->_elementsData = (NSData *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", -[GEOJunction maneuverType](self, "maneuverType"), @"ManeuverType");
  objc_msgSend(v5, "encodeInt32:forKey:", -[GEOJunction drivingSide](self, "drivingSide"), @"DrivingSide");
  objc_msgSend(v5, "encodeInt32:forKey:", -[GEOJunction junctionType](self, "junctionType"), @"JunctionType");
  elementsData = self->_elementsData;
  if (elementsData) {
    [v5 encodeObject:elementsData forKey:@"ElementsData"];
  }
}

- (int)maneuverType
{
  return self->_maneuverType;
}

- (int)drivingSide
{
  return self->_drivingSide;
}

- (int)junctionType
{
  return self->_junctionType;
}

- (void).cxx_destruct
{
}

@end