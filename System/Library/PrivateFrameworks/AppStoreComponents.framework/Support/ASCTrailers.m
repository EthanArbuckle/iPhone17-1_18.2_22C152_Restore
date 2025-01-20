@interface ASCTrailers
+ (BOOL)supportsSecureCoding;
- (ASCMediaPlatform)mediaPlatform;
- (ASCTrailers)initWithCoder:(id)a3;
- (ASCTrailers)initWithVideos:(id)a3 mediaPlatform:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)videos;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCTrailers

- (ASCTrailers)initWithVideos:(id)a3 mediaPlatform:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_10000F3C4();
  v14.receiver = self;
  v14.super_class = (Class)ASCTrailers;
  v8 = [(ASCTrailers *)&v14 init];
  if (v8)
  {
    v9 = (NSArray *)[v6 copy];
    videos = v8->_videos;
    v8->_videos = v9;

    v11 = (ASCMediaPlatform *)[v7 copy];
    mediaPlatform = v8->_mediaPlatform;
    v8->_mediaPlatform = v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCTrailers)initWithCoder:(id)a3
{
  id v4 = a3;
  sub_10000F3C4();
  id v5 = objc_alloc((Class)NSSet);
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"videos"];
  if (v8)
  {
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaPlatform"];
    if (v9)
    {
      v17.receiver = self;
      v17.super_class = (Class)ASCTrailers;
      v10 = [(ASCTrailers *)&v17 init];
      if (v10)
      {
        v11 = (NSArray *)[v8 copy];
        videos = v10->_videos;
        v10->_videos = v11;

        v13 = (ASCMediaPlatform *)[v9 copy];
        mediaPlatform = v10->_mediaPlatform;
        v10->_mediaPlatform = v13;
      }
      self = v10;
      v15 = self;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10013F414();
      }
      v15 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10013F3CC();
    }
    v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCTrailers *)self videos];
  [v4 encodeObject:v5 forKey:@"videos"];

  id v6 = [(ASCTrailers *)self mediaPlatform];
  [v4 encodeObject:v6 forKey:@"mediaPlatform"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCTrailers *)self videos];
  [(ASCHasher *)v3 combineObject:v4];

  id v5 = [(ASCTrailers *)self mediaPlatform];
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
    v8 = [(ASCTrailers *)self videos];
    uint64_t v9 = [v7 videos];
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
      v11 = [(ASCTrailers *)self mediaPlatform];
      uint64_t v12 = [v7 mediaPlatform];
      v13 = (void *)v12;
      if (v11 && v12) {
        unsigned __int8 v14 = [v11 isEqual:v12];
      }
      else {
        unsigned __int8 v14 = v11 == (void *)v12;
      }

      goto LABEL_18;
    }
    unsigned __int8 v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  unsigned __int8 v14 = 0;
LABEL_19:

  return v14;
}

- (id)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCTrailers *)self videos];
  [(ASCDescriber *)v3 addObject:v4 withName:@"videos"];

  id v5 = [(ASCTrailers *)self mediaPlatform];
  [(ASCDescriber *)v3 addObject:v5 withName:@"mediaPlatform"];

  unint64_t v6 = [(ASCDescriber *)v3 finalizeDescription];

  return v6;
}

- (NSArray)videos
{
  return self->_videos;
}

- (ASCMediaPlatform)mediaPlatform
{
  return self->_mediaPlatform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaPlatform, 0);

  objc_storeStrong((id *)&self->_videos, 0);
}

@end