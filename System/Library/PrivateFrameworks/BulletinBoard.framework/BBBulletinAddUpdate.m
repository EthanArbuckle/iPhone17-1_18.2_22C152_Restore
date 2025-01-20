@interface BBBulletinAddUpdate
+ (BOOL)supportsSecureCoding;
+ (id)updateWithBulletin:(id)a3 feeds:(unint64_t)a4 shouldPlayLightsAndSirens:(BOOL)a5;
- (BBBulletinAddUpdate)initWithBulletin:(id)a3 feeds:(unint64_t)a4 shouldPlayLightsAndSirens:(BOOL)a5;
- (BBBulletinAddUpdate)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldPlayLightsAndSirens;
- (id)description;
- (id)typeDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BBBulletinAddUpdate

+ (id)updateWithBulletin:(id)a3 feeds:(unint64_t)a4 shouldPlayLightsAndSirens:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)a1) initWithBulletin:v8 feeds:a4 shouldPlayLightsAndSirens:v5];

  return v9;
}

- (BBBulletinAddUpdate)initWithBulletin:(id)a3 feeds:(unint64_t)a4 shouldPlayLightsAndSirens:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)BBBulletinAddUpdate;
  result = [(BBBulletinUpdate *)&v7 initWithBulletin:a3 feeds:a4];
  if (result) {
    result->_shouldPlayLightsAndSirens = a5;
  }
  return result;
}

- (id)typeDescription
{
  return @"add";
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)BBBulletinAddUpdate;
  unint64_t v3 = [(BBBulletinUpdate *)&v5 hash];
  return v3 ^ [(BBBulletinAddUpdate *)self shouldPlayLightsAndSirens];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BBBulletinAddUpdate *)a3;
  if (self == v4)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      objc_super v5 = v4;
      v9.receiver = self;
      v9.super_class = (Class)BBBulletinAddUpdate;
      if ([(BBBulletinUpdate *)&v9 isEqual:v5])
      {
        BOOL v6 = [(BBBulletinAddUpdate *)self shouldPlayLightsAndSirens];
        BOOL v7 = v6 ^ [(BBBulletinAddUpdate *)v5 shouldPlayLightsAndSirens] ^ 1;
      }
      else
      {
        LOBYTE(v7) = 0;
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (id)description
{
  unint64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[BBBulletinAddUpdate shouldPlayLightsAndSirens](self, "shouldPlayLightsAndSirens"), @"Should Play Lights And Sirens");
  objc_super v5 = [v3 build];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BBBulletinAddUpdate;
  id v4 = a3;
  [(BBBulletinUpdate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletinAddUpdate shouldPlayLightsAndSirens](self, "shouldPlayLightsAndSirens", v5.receiver, v5.super_class), @"shouldPlayLightsAndSirens");
}

- (BBBulletinAddUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BBBulletinAddUpdate;
  objc_super v5 = [(BBBulletinUpdate *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_shouldPlayLightsAndSirens = [v4 decodeBoolForKey:@"shouldPlayLightsAndSirens"];
  }

  return v5;
}

- (BOOL)shouldPlayLightsAndSirens
{
  return self->_shouldPlayLightsAndSirens;
}

@end