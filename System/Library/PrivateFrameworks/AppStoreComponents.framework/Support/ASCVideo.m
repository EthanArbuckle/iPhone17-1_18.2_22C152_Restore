@interface ASCVideo
+ (BOOL)supportsSecureCoding;
- (ASCArtwork)preview;
- (ASCVideo)initWithCoder:(id)a3;
- (ASCVideo)initWithVideoURL:(id)a3 preview:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)videoURL;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCVideo

- (ASCVideo)initWithVideoURL:(id)a3 preview:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_10000F3C4();
  v14.receiver = self;
  v14.super_class = (Class)ASCVideo;
  v8 = [(ASCVideo *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    videoURL = v8->_videoURL;
    v8->_videoURL = v9;

    v11 = (ASCArtwork *)[v7 copy];
    preview = v8->_preview;
    v8->_preview = v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCVideo)initWithCoder:(id)a3
{
  id v4 = a3;
  sub_10000F3C4();
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"videoURL"];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preview"];
    if (v6)
    {
      v14.receiver = self;
      v14.super_class = (Class)ASCVideo;
      id v7 = [(ASCVideo *)&v14 init];
      if (v7)
      {
        v8 = (NSString *)[v5 copy];
        videoURL = v7->_videoURL;
        v7->_videoURL = v8;

        v10 = (ASCArtwork *)[v6 copy];
        preview = v7->_preview;
        v7->_preview = v10;
      }
      self = v7;
      v12 = self;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10013F5D0();
      }
      v12 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10013F588();
    }
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASCVideo *)self videoURL];
  [v4 encodeObject:v5 forKey:@"videoURL"];

  id v6 = [(ASCVideo *)self preview];
  [v4 encodeObject:v6 forKey:@"preview"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCVideo *)self videoURL];
  [(ASCHasher *)v3 combineObject:v4];

  v5 = [(ASCVideo *)self preview];
  [(ASCHasher *)v3 combineObject:v5];

  unint64_t v6 = [(ASCHasher *)v3 finalizeHash];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCVideo *)a3;
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
    v8 = v6;

    if (!v8)
    {
      unsigned __int8 v7 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v9 = [(ASCVideo *)self videoURL];
    uint64_t v10 = [(ASCVideo *)v8 videoURL];
    v11 = (void *)v10;
    if (v9 && v10)
    {
      if ([v9 isEqual:v10]) {
        goto LABEL_12;
      }
    }
    else if (v9 == (void *)v10)
    {
LABEL_12:
      v12 = [(ASCVideo *)self preview];
      uint64_t v13 = [(ASCVideo *)v8 preview];
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
  id v4 = [(ASCVideo *)self videoURL];
  [(ASCDescriber *)v3 addObject:v4 withName:@"videoURL"];

  v5 = [(ASCVideo *)self preview];
  [(ASCDescriber *)v3 addObject:v5 withName:@"preview"];

  unint64_t v6 = [(ASCDescriber *)v3 finalizeDescription];

  return v6;
}

- (NSString)videoURL
{
  return self->_videoURL;
}

- (ASCArtwork)preview
{
  return self->_preview;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview, 0);

  objc_storeStrong((id *)&self->_videoURL, 0);
}

@end