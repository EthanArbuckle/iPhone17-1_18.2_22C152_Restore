@interface ANHomeContext
+ (BOOL)supportsSecureCoding;
- (ANHomeContext)init;
- (ANHomeContext)initWithCoder:(id)a3;
- (BOOL)isEmpty;
- (NSArray)roomNames;
- (NSArray)zoneNames;
- (NSString)homeName;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setHomeName:(id)a3;
- (void)setIsEmpty:(BOOL)a3;
- (void)setRoomNames:(id)a3;
- (void)setZoneNames:(id)a3;
@end

@implementation ANHomeContext

- (ANHomeContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)ANHomeContext;
  v2 = [(ANHomeContext *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(ANHomeContext *)v2 setHomeName:&stru_26D2D46B0];
    uint64_t v4 = MEMORY[0x263EFFA68];
    [(ANHomeContext *)v3 setZoneNames:MEMORY[0x263EFFA68]];
    [(ANHomeContext *)v3 setRoomNames:v4];
  }
  return v3;
}

- (BOOL)isEmpty
{
  v3 = [(ANHomeContext *)self homeName];
  if ([v3 length])
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(ANHomeContext *)self zoneNames];
    if ([v5 count])
    {
      BOOL v4 = 0;
    }
    else
    {
      objc_super v6 = [(ANHomeContext *)self roomNames];
      BOOL v4 = [v6 count] == 0;
    }
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = [(ANHomeContext *)self homeName];
  v5 = [(ANHomeContext *)self zoneNames];
  objc_super v6 = [v5 description];
  v7 = [(ANHomeContext *)self roomNames];
  v8 = [v7 description];
  v9 = [v3 stringWithFormat:@"Home Name: %@, Zone Names: %@, Room Names: %@", v4, v6, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ANHomeContext *)self homeName];
  [v4 encodeObject:v5 forKey:@"home"];

  objc_super v6 = [(ANHomeContext *)self zoneNames];
  [v4 encodeObject:v6 forKey:@"zones"];

  id v7 = [(ANHomeContext *)self roomNames];
  [v4 encodeObject:v7 forKey:@"rooms"];
}

- (ANHomeContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ANHomeContext;
  v5 = [(ANHomeContext *)&v13 init];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
    [(ANHomeContext *)v5 setHomeName:v6];

    id v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"zones"];
    [(ANHomeContext *)v5 setZoneNames:v10];

    v11 = [v4 decodeObjectOfClasses:v9 forKey:@"rooms"];
    [(ANHomeContext *)v5 setRoomNames:v11];
  }
  return v5;
}

- (NSString)homeName
{
  return self->_homeName;
}

- (void)setHomeName:(id)a3
{
}

- (NSArray)zoneNames
{
  return self->_zoneNames;
}

- (void)setZoneNames:(id)a3
{
}

- (NSArray)roomNames
{
  return self->_roomNames;
}

- (void)setRoomNames:(id)a3
{
}

- (void)setIsEmpty:(BOOL)a3
{
  self->_isEmpty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomNames, 0);
  objc_storeStrong((id *)&self->_zoneNames, 0);

  objc_storeStrong((id *)&self->_homeName, 0);
}

@end