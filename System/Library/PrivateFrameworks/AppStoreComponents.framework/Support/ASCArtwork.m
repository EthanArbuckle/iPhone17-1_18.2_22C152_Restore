@interface ASCArtwork
+ (BOOL)supportsSecureCoding;
- (ASCArtwork)initWithCoder:(id)a3;
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
  sub_10000F3C4();
  v28.receiver = self;
  v28.super_class = (Class)ASCArtwork;
  v18 = [(ASCArtwork *)&v28 init];
  if (v18)
  {
    id v19 = [v14 copy];
    id dataSource = v18->_dataSource;
    v18->_id dataSource = v19;

    v18->_width = a4;
    v18->_height = a5;
    v21 = (NSString *)[v15 copy];
    decoration = v18->_decoration;
    v18->_decoration = v21;

    v23 = (NSString *)[v16 copy];
    preferredCrop = v18->_preferredCrop;
    v18->_preferredCrop = v23;

    v25 = (NSString *)[v17 copy];
    preferredFormat = v18->_preferredFormat;
    v18->_preferredFormat = v25;
  }
  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCArtwork)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", objc_opt_class(), 0);
  v6 = [v4 decodeObjectOfClasses:v5 forKey:@"dataSource"];
  if (v6)
  {
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"decoration"];
    if (v7)
    {
      v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredCrop"];
      if (v8)
      {
        v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredFormat"];
        if (v9)
        {
          v48.receiver = self;
          v48.super_class = (Class)ASCArtwork;
          v10 = [(ASCArtwork *)&v48 init];
          v11 = v10;
          if (v10)
          {
            objc_storeStrong(&v10->_dataSource, v6);
            [v4 decodeDoubleForKey:@"width"];
            v11->_width = v12;
            [v4 decodeDoubleForKey:@"height"];
            v11->_height = v13;
            v11->_isPortrait = v13 >= v11->_width;
            objc_storeStrong((id *)&v11->_decoration, v7);
            objc_storeStrong((id *)&v11->_preferredCrop, v8);
            objc_storeStrong((id *)&v11->_preferredFormat, v9);
          }
          self = v11;
          id v14 = self;
        }
        else
        {
          BOOL v39 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v39) {
            sub_10013E380(v39, v40, v41, v42, v43, v44, v45, v46);
          }
          id v14 = 0;
        }
      }
      else
      {
        BOOL v31 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v31) {
          sub_10013E344(v31, v32, v33, v34, v35, v36, v37, v38);
        }
        id v14 = 0;
      }
    }
    else
    {
      BOOL v23 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v23) {
        sub_10013E308(v23, v24, v25, v26, v27, v28, v29, v30);
      }
      id v14 = 0;
    }
  }
  else
  {
    BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v15) {
      sub_10013E2CC(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    id v14 = 0;
  }

  return v14;
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
  v6 = [(ASCArtwork *)self decoration];
  [v4 encodeObject:v6 forKey:@"decoration"];

  v7 = [(ASCArtwork *)self preferredCrop];
  [v4 encodeObject:v7 forKey:@"preferredCrop"];

  id v8 = [(ASCArtwork *)self preferredFormat];
  [v4 encodeObject:v8 forKey:@"preferredFormat"];
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
    v6 = (__CFString *)[v5 copy];
  }
  else {
    v6 = @"<embedded image>";
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

  v6 = [(ASCArtwork *)self preferredCrop];
  [(ASCHasher *)v3 combineObject:v6];

  v7 = [(ASCArtwork *)self preferredFormat];
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
    unint64_t v8 = v6;

    if (!v8)
    {
      unsigned __int8 v7 = 0;
LABEL_28:

      goto LABEL_29;
    }
    v9 = [(ASCArtwork *)self dataSource];
    uint64_t v10 = [(ASCArtwork *)v8 dataSource];
    v11 = (void *)v10;
    if (v9 && v10)
    {
      if (![v9 isEqual:v10]) {
        goto LABEL_26;
      }
    }
    else if (v9 != (void *)v10)
    {
LABEL_26:
      unsigned __int8 v7 = 0;
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
        BOOL v23 = (void *)v22;
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
            unsigned __int8 v7 = [v24 isEqual:v25];
          }
          else {
            unsigned __int8 v7 = v24 == (void *)v25;
          }

          goto LABEL_36;
        }
        unsigned __int8 v7 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
    else if (v18 == (void *)v19)
    {
      goto LABEL_20;
    }
    unsigned __int8 v7 = 0;
LABEL_37:

    goto LABEL_27;
  }
  unsigned __int8 v7 = 1;
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

  v6 = [(ASCArtwork *)self preferredCrop];
  [(ASCDescriber *)v3 addObject:v6 withName:@"preferredCrop"];

  unsigned __int8 v7 = [(ASCArtwork *)self preferredFormat];
  [(ASCDescriber *)v3 addObject:v7 withName:@"preferredFormat"];

  unint64_t v8 = [(ASCDescriber *)v3 finalizeDescription];

  return v8;
}

- (id)makeURLWithSubstitutions:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCArtwork *)self URLTemplate];
  id v6 = [v5 mutableCopy];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000BA88;
  v10[3] = &unk_100183EF8;
  id v11 = v6;
  id v7 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];

  unint64_t v8 = +[NSURL URLWithString:v7];

  return v8;
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

- (UIImage)embeddedImage
{
  return self->_embeddedImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddedImage, 0);
  objc_storeStrong(&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_preferredFormat, 0);
  objc_storeStrong((id *)&self->_preferredCrop, 0);

  objc_storeStrong((id *)&self->_decoration, 0);
}

@end