@interface PHNetwork
+ (id)networkFromDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)code;
- (NSString)displayName;
- (NSString)name;
- (PHNetwork)init;
- (PHNetwork)initWithName:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)state;
- (void)setDictionaryRepresentation:(id)a3;
- (void)setName:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation PHNetwork

+ (id)networkFromDictionary:(id)a3
{
  if (a3)
  {
    uint64_t v3 = *MEMORY[0x263F02F60];
    id v4 = a3;
    v5 = [v4 objectForKey:v3];
    v6 = [[PHNetwork alloc] initWithName:v5];
    [(PHNetwork *)v6 setDictionaryRepresentation:v4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PHNetwork)init
{
  return [(PHNetwork *)self initWithName:&stru_26DF94838];
}

- (PHNetwork)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHNetwork;
  v6 = [(PHNetwork *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

- (NSString)displayName
{
  uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [(PHNetwork *)self name];
  id v5 = [v3 localizedStringForKey:v4 value:&stru_26DF94838 table:@"Carrier"];

  return (NSString *)v5;
}

- (NSString)code
{
  uint64_t v3 = [(PHNetwork *)self dictionaryRepresentation];

  if (v3)
  {
    id v4 = [(PHNetwork *)self dictionaryRepresentation];
    id v5 = [v4 valueForKey:*MEMORY[0x263F02F38]];
  }
  else
  {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(PHNetwork *)self dictionaryRepresentation];
    if (v6
      && (v7 = (void *)v6,
          [v5 dictionaryRepresentation],
          v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          v8))
    {
      objc_super v9 = [(PHNetwork *)self code];
      if (v9)
      {
        v10 = [v5 code];
        if (v10)
        {
          v11 = [(PHNetwork *)self code];
          v12 = [v5 code];
          char v13 = [v11 isEqualToString:v12];
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(PHNetwork *)self dictionaryRepresentation];
  if (v3) {
    [(PHNetwork *)self dictionaryRepresentation];
  }
  else {
  id v4 = [(PHNetwork *)self name];
  }
  unint64_t v5 = [v4 hash];

  return v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(PHNetwork *)self name];
  unint64_t v5 = [(PHNetwork *)self code];
  uint64_t v6 = [v3 stringWithFormat:@"PHNetwork: '%@' %@. State:%lu", v4, v5, -[PHNetwork state](self, "state")];

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDictionaryRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end