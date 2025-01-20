@interface ASCScreenshots
+ (BOOL)supportsSecureCoding;
- (ASCMediaPlatform)mediaPlatform;
- (ASCScreenshots)initWithArtwork:(id)a3 mediaPlatform:(id)a4;
- (ASCScreenshots)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)artwork;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCScreenshots

- (ASCScreenshots)initWithArtwork:(id)a3 mediaPlatform:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v14.receiver = self;
  v14.super_class = (Class)ASCScreenshots;
  v8 = [(ASCScreenshots *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    artwork = v8->_artwork;
    v8->_artwork = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    mediaPlatform = v8->_mediaPlatform;
    v8->_mediaPlatform = (ASCMediaPlatform *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCScreenshots)initWithCoder:(id)a3
{
  id v4 = a3;
  +[ASCEligibility assertCurrentProcessEligibility]();
  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"artwork"];
  if (v8)
  {
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaPlatform"];
    if (v9)
    {
      v17.receiver = self;
      v17.super_class = (Class)ASCScreenshots;
      v10 = [(ASCScreenshots *)&v17 init];
      if (v10)
      {
        uint64_t v11 = [v8 copy];
        artwork = v10->_artwork;
        v10->_artwork = (NSArray *)v11;

        uint64_t v13 = [v9 copy];
        mediaPlatform = v10->_mediaPlatform;
        v10->_mediaPlatform = (ASCMediaPlatform *)v13;
      }
      self = v10;
      v15 = self;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ASCScreenshots initWithCoder:]();
      }
      v15 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ASCScreenshots initWithCoder:]();
    }
    v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCScreenshots *)self artwork];
  [v4 encodeObject:v5 forKey:@"artwork"];

  id v6 = [(ASCScreenshots *)self mediaPlatform];
  [v4 encodeObject:v6 forKey:@"mediaPlatform"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCScreenshots *)self artwork];
  [(ASCHasher *)v3 combineObject:v4];

  id v5 = [(ASCScreenshots *)self mediaPlatform];
  [(ASCHasher *)v3 combineObject:v5];

  unint64_t v6 = [(ASCHasher *)v3 finalizeHash];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
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
  id v7 = v6;

  if (v7)
  {
    v8 = [(ASCScreenshots *)self artwork];
    uint64_t v9 = [v7 artwork];
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if ([v8 isEqual:v9]) {
        goto LABEL_10;
      }
    }
    else if (v8 == (void *)v9)
    {
LABEL_10:
      uint64_t v11 = [(ASCScreenshots *)self mediaPlatform];
      uint64_t v12 = [v7 mediaPlatform];
      uint64_t v13 = (void *)v12;
      if (v11 && v12) {
        char v14 = [v11 isEqual:v12];
      }
      else {
        char v14 = v11 == (void *)v12;
      }

      goto LABEL_18;
    }
    char v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  char v14 = 0;
LABEL_19:

  return v14;
}

- (id)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCScreenshots *)self artwork];
  [(ASCDescriber *)v3 addObject:v4 withName:@"artwork"];

  id v5 = [(ASCScreenshots *)self mediaPlatform];
  [(ASCDescriber *)v3 addObject:v5 withName:@"mediaPlatform"];

  unint64_t v6 = [(ASCDescriber *)v3 finalizeDescription];

  return v6;
}

- (NSArray)artwork
{
  return self->_artwork;
}

- (ASCMediaPlatform)mediaPlatform
{
  return self->_mediaPlatform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaPlatform, 0);

  objc_storeStrong((id *)&self->_artwork, 0);
}

- (void)initWithCoder:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not decode ASCScreenshots because artwork was missing", v0, 2u);
}

- (void)initWithCoder:.cold.2()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not decode ASCScreenshots because mediaPlatform was missing", v0, 2u);
}

@end