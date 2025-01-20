@interface CTNetwork
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTNetwork)initWithCoder:(id)a3;
- (NSString)name;
- (NSString)plmn;
- (NSString)rat;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setPlmn:(id)a3;
- (void)setRat:(id)a3;
@end

@implementation CTNetwork

- (BOOL)isEqual:(id)a3
{
  v4 = (CTNetwork *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(CTNetwork *)self name];
      v7 = [(CTNetwork *)v5 name];
      if (v6 == v7 || [v6 isEqualToString:v7])
      {
        v8 = [(CTNetwork *)self plmn];
        v9 = [(CTNetwork *)v5 plmn];
        if (v8 == v9 || [v8 isEqualToString:v9])
        {
          v10 = [(CTNetwork *)self rat];
          v11 = [(CTNetwork *)v5 rat];
          if (v10 == v11) {
            char v12 = 1;
          }
          else {
            char v12 = [v10 isEqualToString:v11];
          }
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTNetwork *)self name];
  [v3 appendFormat:@", name=%@", v4];

  v5 = [(CTNetwork *)self plmn];
  [v3 appendFormat:@", plmn=%@", v5];

  v6 = [(CTNetwork *)self rat];
  [v3 appendFormat:@", rat=%@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTNetwork *)self name];
  v6 = (void *)[v5 copy];
  [v4 setName:v6];

  v7 = [(CTNetwork *)self plmn];
  v8 = (void *)[v7 copy];
  [v4 setPlmn:v8];

  v9 = [(CTNetwork *)self rat];
  v10 = (void *)[v9 copy];
  [v4 setRat:v10];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTNetwork *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  v6 = [(CTNetwork *)self plmn];
  [v4 encodeObject:v6 forKey:@"plmn"];

  id v7 = [(CTNetwork *)self rat];
  [v4 encodeObject:v7 forKey:@"rat"];
}

- (CTNetwork)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTNetwork;
  v5 = [(CTNetwork *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"plmn"];
    plmn = v5->_plmn;
    v5->_plmn = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rat"];
    rat = v5->_rat;
    v5->_rat = (NSString *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
}

- (NSString)rat
{
  return self->_rat;
}

- (void)setRat:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rat, 0);
  objc_storeStrong((id *)&self->_plmn, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end