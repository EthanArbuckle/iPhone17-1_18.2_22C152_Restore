@interface ASCGenre
+ (BOOL)supportsSecureCoding;
- (ASCGenre)initWithCoder:(id)a3;
- (ASCGenre)initWithName:(id)a3 identifier:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NSString)name;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCGenre

- (ASCGenre)initWithName:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_10000F3C4();
  v14.receiver = self;
  v14.super_class = (Class)ASCGenre;
  v8 = [(ASCGenre *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    name = v8->_name;
    v8->_name = v9;

    v11 = (NSString *)[v7 copy];
    identifier = v8->_identifier;
    v8->_identifier = v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCGenre)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASCGenre;
  v5 = [(ASCGenre *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASCGenre *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  id v6 = [(ASCGenre *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCGenre *)self name];
  [(ASCHasher *)v3 combineObject:v4];

  v5 = [(ASCGenre *)self identifier];
  [(ASCHasher *)v3 combineObject:v5];

  unint64_t v6 = [(ASCHasher *)v3 finalizeHash];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCGenre *)a3;
  if (self != v4)
  {
    objc_opt_class();
    v5 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        unint64_t v6 = v5;
      }
      else {
        unint64_t v6 = 0;
      }
    }
    else
    {
      unint64_t v6 = 0;
    }
    uint64_t v8 = v6;

    if (!v8)
    {
      unsigned __int8 v7 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v9 = [(ASCGenre *)self name];
    uint64_t v10 = [(ASCGenre *)v8 name];
    objc_super v11 = (void *)v10;
    if (v9 && v10)
    {
      if ([v9 isEqual:v10]) {
        goto LABEL_12;
      }
    }
    else if (v9 == (void *)v10)
    {
LABEL_12:
      v12 = [(ASCGenre *)self identifier];
      uint64_t v13 = [(ASCGenre *)v8 identifier];
      objc_super v14 = (void *)v13;
      if (v12 && v13) {
        unsigned __int8 v7 = [v12 isEqual:v13];
      }
      else {
        unsigned __int8 v7 = v12 == (void *)v13;
      }

      goto LABEL_20;
    }
    unsigned __int8 v7 = 0;
LABEL_20:

    goto LABEL_21;
  }
  unsigned __int8 v7 = 1;
LABEL_22:

  return v7;
}

- (id)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCGenre *)self name];
  [(ASCDescriber *)v3 addObject:v4 withName:@"name"];

  v5 = [(ASCGenre *)self identifier];
  [(ASCDescriber *)v3 addObject:v5 withName:@"identifier"];

  unint64_t v6 = [(ASCDescriber *)v3 finalizeDescription];

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end