@interface ASCArtwork
+ (BOOL)supportsSecureCoding;
- (ASCArtwork)initWithCoder:(id)a3;
- (ASCArtwork)initWithImage:(id)a3 decoration:(id)a4;
- (ASCArtwork)initWithURLTemplate:(id)a3 width:(double)a4 height:(double)a5 decoration:(id)a6 preferredCrop:(id)a7 preferredFormat:(id)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPortrait;
- (NSString)URLTemplate;
- (NSString)decoration;
- (NSString)preferredCrop;
- (NSString)preferredFormat;
- (UIImage)embeddedImage;
- (double)height;
- (double)width;
- (id)dataSource;
- (id)description;
- (id)makeURLWithSubstitutions:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCArtwork

- (ASCArtwork)initWithURLTemplate:(id)a3 width:(double)a4 height:(double)a5 decoration:(id)a6 preferredCrop:(id)a7 preferredFormat:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v28.receiver = self;
  v28.super_class = (Class)ASCArtwork;
  v18 = [(ASCArtwork *)&v28 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    id dataSource = v18->_dataSource;
    v18->_id dataSource = (id)v19;

    v18->_width = a4;
    v18->_height = a5;
    uint64_t v21 = [v15 copy];
    decoration = v18->_decoration;
    v18->_decoration = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    preferredCrop = v18->_preferredCrop;
    v18->_preferredCrop = (NSString *)v23;

    uint64_t v25 = [v17 copy];
    preferredFormat = v18->_preferredFormat;
    v18->_preferredFormat = (NSString *)v25;
  }
  return v18;
}

- (ASCArtwork)initWithImage:(id)a3 decoration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ASCArtwork;
  v9 = [(ASCArtwork *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_dataSource, a3);
    [v7 size];
    v10->_width = v11;
    [v7 size];
    v10->_height = v12;
    uint64_t v13 = [v8 copy];
    decoration = v10->_decoration;
    v10->_decoration = (NSString *)v13;

    objc_storeStrong((id *)&v10->_preferredCrop, @"bb");
    objc_storeStrong((id *)&v10->_preferredFormat, @"png");
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCArtwork)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"dataSource"];
  if (v8)
  {
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"decoration"];
    if (v9)
    {
      v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredCrop"];
      if (v10)
      {
        double v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredFormat"];
        if (v11)
        {
          v50.receiver = self;
          v50.super_class = (Class)ASCArtwork;
          double v12 = [(ASCArtwork *)&v50 init];
          uint64_t v13 = v12;
          if (v12)
          {
            objc_storeStrong(&v12->_dataSource, v8);
            [v4 decodeDoubleForKey:@"width"];
            v13->_width = v14;
            [v4 decodeDoubleForKey:@"height"];
            v13->_height = v15;
            v13->_isPortrait = v15 >= v13->_width;
            objc_storeStrong((id *)&v13->_decoration, v9);
            objc_storeStrong((id *)&v13->_preferredCrop, v10);
            objc_storeStrong((id *)&v13->_preferredFormat, v11);
          }
          self = v13;
          objc_super v16 = self;
        }
        else
        {
          BOOL v41 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
          if (v41) {
            -[ASCArtwork initWithCoder:].cold.4(v41, v42, v43, v44, v45, v46, v47, v48);
          }
          objc_super v16 = 0;
        }
      }
      else
      {
        BOOL v33 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v33) {
          -[ASCArtwork initWithCoder:](v33, v34, v35, v36, v37, v38, v39, v40);
        }
        objc_super v16 = 0;
      }
    }
    else
    {
      BOOL v25 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v25) {
        -[ASCArtwork initWithCoder:](v25, v26, v27, v28, v29, v30, v31, v32);
      }
      objc_super v16 = 0;
    }
  }
  else
  {
    BOOL v17 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v17) {
      -[ASCArtwork initWithCoder:](v17, v18, v19, v20, v21, v22, v23, v24);
    }
    objc_super v16 = 0;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCArtwork *)self dataSource];
  [v4 encodeObject:v5 forKey:@"dataSource"];

  [(ASCArtwork *)self width];
  objc_msgSend(v4, "encodeDouble:forKey:", @"width");
  [(ASCArtwork *)self height];
  objc_msgSend(v4, "encodeDouble:forKey:", @"height");
  uint64_t v6 = [(ASCArtwork *)self decoration];
  [v4 encodeObject:v6 forKey:@"decoration"];

  id v7 = [(ASCArtwork *)self preferredCrop];
  [v4 encodeObject:v7 forKey:@"preferredCrop"];

  id v8 = [(ASCArtwork *)self preferredFormat];
  [v4 encodeObject:v8 forKey:@"preferredFormat"];
}

- (UIImage)embeddedImage
{
  objc_opt_class();
  v3 = [(ASCArtwork *)self dataSource];
  id v4 = v3;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v3 = v4;
    }
    else {
      v3 = 0;
    }
  }
  id v5 = v3;

  return v5;
}

- (NSString)URLTemplate
{
  objc_opt_class();
  id v3 = [(ASCArtwork *)self dataSource];
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5) {
    uint64_t v6 = (__CFString *)[v5 copy];
  }
  else {
    uint64_t v6 = @"<embedded image>";
  }

  return (NSString *)v6;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCArtwork *)self dataSource];
  [(ASCHasher *)v3 combineObject:v4];

  [(ASCArtwork *)self width];
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  [(ASCArtwork *)self height];
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  id v5 = [(ASCArtwork *)self decoration];
  [(ASCHasher *)v3 combineObject:v5];

  uint64_t v6 = [(ASCArtwork *)self preferredCrop];
  [(ASCHasher *)v3 combineObject:v6];

  id v7 = [(ASCArtwork *)self preferredFormat];
  [(ASCHasher *)v3 combineObject:v7];

  unint64_t v8 = [(ASCHasher *)v3 finalizeHash];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCArtwork *)a3;
  if (self != v4)
  {
    objc_opt_class();
    id v5 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    unint64_t v8 = v6;

    if (!v8)
    {
      char v7 = 0;
LABEL_28:

      goto LABEL_29;
    }
    v9 = [(ASCArtwork *)self dataSource];
    uint64_t v10 = [(ASCArtwork *)v8 dataSource];
    double v11 = (void *)v10;
    if (v9 && v10)
    {
      if (![v9 isEqual:v10]) {
        goto LABEL_26;
      }
    }
    else if (v9 != (void *)v10)
    {
LABEL_26:
      char v7 = 0;
LABEL_27:

      goto LABEL_28;
    }
    [(ASCArtwork *)self width];
    double v13 = v12;
    [(ASCArtwork *)v8 width];
    if (v13 != v14) {
      goto LABEL_26;
    }
    [(ASCArtwork *)self height];
    double v16 = v15;
    [(ASCArtwork *)v8 height];
    if (v16 != v17) {
      goto LABEL_26;
    }
    uint64_t v18 = [(ASCArtwork *)self decoration];
    uint64_t v19 = [(ASCArtwork *)v8 decoration];
    uint64_t v20 = (void *)v19;
    if (v18 && v19)
    {
      if ([v18 isEqual:v19])
      {
LABEL_20:
        uint64_t v21 = [(ASCArtwork *)self preferredCrop];
        uint64_t v22 = [(ASCArtwork *)v8 preferredCrop];
        uint64_t v23 = (void *)v22;
        if (v21 && v22)
        {
          if ([v21 isEqual:v22]) {
            goto LABEL_23;
          }
        }
        else if (v21 == (void *)v22)
        {
LABEL_23:
          uint64_t v24 = [(ASCArtwork *)self preferredFormat];
          uint64_t v25 = [(ASCArtwork *)v8 preferredFormat];
          uint64_t v26 = (void *)v25;
          uint64_t v28 = v24;
          if (v24 && v25) {
            char v7 = [v24 isEqual:v25];
          }
          else {
            char v7 = v24 == (void *)v25;
          }

          goto LABEL_36;
        }
        char v7 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
    else if (v18 == (void *)v19)
    {
      goto LABEL_20;
    }
    char v7 = 0;
LABEL_37:

    goto LABEL_27;
  }
  char v7 = 1;
LABEL_29:

  return v7;
}

- (id)description
{
  id v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCArtwork *)self URLTemplate];
  [(ASCDescriber *)v3 addObject:v4 withName:@"URLTemplate"];

  [(ASCArtwork *)self width];
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", @"width");
  [(ASCArtwork *)self height];
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", @"height");
  id v5 = [(ASCArtwork *)self decoration];
  [(ASCDescriber *)v3 addObject:v5 withName:@"decoration"];

  uint64_t v6 = [(ASCArtwork *)self preferredCrop];
  [(ASCDescriber *)v3 addObject:v6 withName:@"preferredCrop"];

  char v7 = [(ASCArtwork *)self preferredFormat];
  [(ASCDescriber *)v3 addObject:v7 withName:@"preferredFormat"];

  unint64_t v8 = [(ASCDescriber *)v3 finalizeDescription];

  return v8;
}

- (id)makeURLWithSubstitutions:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCArtwork *)self URLTemplate];
  uint64_t v6 = (void *)[v5 mutableCopy];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__ASCArtwork_makeURLWithSubstitutions___block_invoke;
  v10[3] = &unk_1E645D9E0;
  id v11 = v6;
  id v7 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];

  unint64_t v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];

  return v8;
}

void __39__ASCArtwork_makeURLWithSubstitutions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", v6, v5, 0, 0, objc_msgSend(v4, "length"));
}

- (double)width
{
  return self->_width;
}

- (double)height
{
  return self->_height;
}

- (BOOL)isPortrait
{
  return self->_isPortrait;
}

- (NSString)decoration
{
  return self->_decoration;
}

- (NSString)preferredCrop
{
  return self->_preferredCrop;
}

- (NSString)preferredFormat
{
  return self->_preferredFormat;
}

- (id)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_preferredFormat, 0);
  objc_storeStrong((id *)&self->_preferredCrop, 0);

  objc_storeStrong((id *)&self->_decoration, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end