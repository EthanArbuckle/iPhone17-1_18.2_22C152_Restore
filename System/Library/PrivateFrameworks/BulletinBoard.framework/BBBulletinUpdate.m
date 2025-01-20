@interface BBBulletinUpdate
+ (BOOL)supportsSecureCoding;
- (BBBulletin)bulletin;
- (BBBulletinUpdate)initWithBulletin:(id)a3 feeds:(unint64_t)a4;
- (BBBulletinUpdate)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)typeDescription;
- (unint64_t)feeds;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BBBulletinUpdate

- (BBBulletinUpdate)initWithBulletin:(id)a3 feeds:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BBBulletinUpdate;
  v7 = [(BBBulletinUpdate *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    bulletin = v7->_bulletin;
    v7->_bulletin = (BBBulletin *)v8;

    v7->_feeds = a4;
  }

  return v7;
}

- (id)typeDescription
{
  return 0;
}

- (unint64_t)hash
{
  v3 = [(BBBulletinUpdate *)self bulletin];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(BBBulletinUpdate *)self feeds] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (BBBulletinUpdate *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      unint64_t v5 = v4;
      id v6 = [(BBBulletinUpdate *)self bulletin];
      v7 = [(BBBulletinUpdate *)v5 bulletin];
      if (BSEqualObjects())
      {
        unint64_t v8 = [(BBBulletinUpdate *)self feeds];
        BOOL v9 = v8 == [(BBBulletinUpdate *)v5 feeds];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  uint64_t v4 = [(BBBulletinUpdate *)self bulletin];
  id v5 = (id)[v3 appendObject:v4 withName:@"Bulletin"];

  id v6 = (id)objc_msgSend(v3, "appendInteger:withName:", -[BBBulletinUpdate feeds](self, "feeds"), @"Feeds");
  v7 = [(BBBulletinUpdate *)self typeDescription];
  id v8 = (id)[v3 appendObject:v7 withName:@"Type"];

  BOOL v9 = [v3 build];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(BBBulletinUpdate *)self bulletin];
  [v5 encodeObject:v4 forKey:@"bulletin"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[BBBulletinUpdate feeds](self, "feeds"), @"feeds");
}

- (BBBulletinUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bulletin"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"feeds"];

  v7 = [(BBBulletinUpdate *)self initWithBulletin:v5 feeds:v6];
  return v7;
}

- (BBBulletin)bulletin
{
  return self->_bulletin;
}

- (unint64_t)feeds
{
  return self->_feeds;
}

- (void).cxx_destruct
{
}

@end