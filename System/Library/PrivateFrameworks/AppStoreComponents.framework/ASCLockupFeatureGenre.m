@interface ASCLockupFeatureGenre
+ (BOOL)supportsSecureCoding;
- (ASCLockupFeatureGenre)initWithCoder:(id)a3;
- (ASCLockupFeatureGenre)initWithGenreName:(id)a3 genreID:(id)a4 subgenres:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)subgenres;
- (NSString)description;
- (NSString)genreID;
- (NSString)genreName;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupFeatureGenre

- (ASCLockupFeatureGenre)initWithGenreName:(id)a3 genreID:(id)a4 subgenres:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ASCLockupFeatureGenre;
  v11 = [(ASCLockupFeatureGenre *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    genreName = v11->_genreName;
    v11->_genreName = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    genreID = v11->_genreID;
    v11->_genreID = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    subgenres = v11->_subgenres;
    v11->_subgenres = (NSArray *)v16;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureGenre)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"genreName"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"genreID"];
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"subgenres"];

  v11 = [(ASCLockupFeatureGenre *)self initWithGenreName:v5 genreID:v6 subgenres:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASCLockupFeatureGenre *)self genreName];
  [v4 encodeObject:v5 forKey:@"genreName"];

  v6 = [(ASCLockupFeatureGenre *)self genreID];
  [v4 encodeObject:v6 forKey:@"genreID"];

  id v7 = [(ASCLockupFeatureGenre *)self subgenres];
  [v4 encodeObject:v7 forKey:@"subgenres"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCLockupFeatureGenre *)self genreName];
  [(ASCHasher *)v3 combineObject:v4];

  v5 = [(ASCLockupFeatureGenre *)self genreID];
  [(ASCHasher *)v3 combineObject:v5];

  v6 = [(ASCLockupFeatureGenre *)self subgenres];
  [(ASCHasher *)v3 combineObject:v6];

  unint64_t v7 = [(ASCHasher *)v3 finalizeHash];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockupFeatureGenre *)a3;
  if (self != v4)
  {
    objc_opt_class();
    v5 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
    }
    else
    {
      v6 = 0;
    }
    uint64_t v8 = v6;

    if (!v8)
    {
      char v7 = 0;
LABEL_27:

      goto LABEL_28;
    }
    id v9 = [(ASCLockupFeatureGenre *)self genreName];
    uint64_t v10 = [(ASCLockupFeatureGenre *)v8 genreName];
    v11 = (void *)v10;
    if (v9 && v10)
    {
      if ([v9 isEqual:v10])
      {
LABEL_12:
        uint64_t v12 = [(ASCLockupFeatureGenre *)self genreID];
        uint64_t v13 = [(ASCLockupFeatureGenre *)v8 genreID];
        uint64_t v14 = (void *)v13;
        if (v12 && v13)
        {
          if ([v12 isEqual:v13]) {
            goto LABEL_15;
          }
        }
        else if (v12 == (void *)v13)
        {
LABEL_15:
          v15 = [(ASCLockupFeatureGenre *)self subgenres];
          uint64_t v16 = [(ASCLockupFeatureGenre *)v8 subgenres];
          v17 = (void *)v16;
          if (v15 && v16) {
            char v7 = [v15 isEqual:v16];
          }
          else {
            char v7 = v15 == (void *)v16;
          }

          goto LABEL_25;
        }
        char v7 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    else if (v9 == (void *)v10)
    {
      goto LABEL_12;
    }
    char v7 = 0;
LABEL_26:

    goto LABEL_27;
  }
  char v7 = 1;
LABEL_28:

  return v7;
}

- (NSString)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCLockupFeatureGenre *)self genreName];
  [(ASCDescriber *)v3 addObject:v4 withName:@"genreName"];

  v5 = [(ASCLockupFeatureGenre *)self genreID];
  [(ASCDescriber *)v3 addObject:v5 withName:@"genreID"];

  v6 = [(ASCLockupFeatureGenre *)self subgenres];
  [(ASCDescriber *)v3 addObject:v6 withName:@"subgenres"];

  char v7 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v7;
}

- (NSString)genreName
{
  return self->_genreName;
}

- (NSString)genreID
{
  return self->_genreID;
}

- (NSArray)subgenres
{
  return self->_subgenres;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subgenres, 0);
  objc_storeStrong((id *)&self->_genreID, 0);

  objc_storeStrong((id *)&self->_genreName, 0);
}

@end