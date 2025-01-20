@interface ASCProgressOfferMetadata
+ (BOOL)supportsSecureCoding;
- (ASCProgressOfferMetadata)initWithCoder:(id)a3;
- (ASCProgressOfferMetadata)initWithPercent:(double)a3 cancellable:(BOOL)a4;
- (BOOL)cancellable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIndeterminate;
- (BOOL)isProgress;
- (double)percent;
- (id)description;
- (id)initIndeterminate;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIndeterminate:(BOOL)a3;
@end

@implementation ASCProgressOfferMetadata

- (ASCProgressOfferMetadata)initWithPercent:(double)a3 cancellable:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ASCProgressOfferMetadata;
  result = [(ASCOfferMetadata *)&v7 _init];
  if (result)
  {
    result->_percent = a3;
    result->_cancellable = a4;
  }
  return result;
}

- (id)initIndeterminate
{
  v3.receiver = self;
  v3.super_class = (Class)ASCProgressOfferMetadata;
  id result = [(ASCOfferMetadata *)&v3 _init];
  if (result) {
    *((void *)result + 2) = 0x7FF0000000000000;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCProgressOfferMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ASCProgressOfferMetadata;
  v5 = [(ASCOfferMetadata *)&v8 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"percent"];
    v5->_percent = v6;
    v5->_cancellable = [v4 decodeBoolForKey:@"cancellable"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASCProgressOfferMetadata;
  id v4 = a3;
  [(ASCOfferMetadata *)&v5 encodeWithCoder:v4];
  [(ASCProgressOfferMetadata *)self percent];
  objc_msgSend(v4, "encodeDouble:forKey:", @"percent");
  objc_msgSend(v4, "encodeBool:forKey:", -[ASCProgressOfferMetadata cancellable](self, "cancellable"), @"cancellable");
}

- (unint64_t)hash
{
  objc_super v3 = objc_alloc_init(ASCHasher);
  [(ASCProgressOfferMetadata *)self percent];
  [(ASCHasher *)v3 combineInteger:(uint64_t)v4];
  unint64_t v5 = [(ASCHasher *)v3 finalizeHash];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      double v6 = v5;
    }
    else {
      double v6 = 0;
    }
  }
  else
  {
    double v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    [(ASCProgressOfferMetadata *)self percent];
    double v9 = v8;
    [v7 percent];
    BOOL v11 = v9 == v10;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)description
{
  objc_super v3 = [[ASCDescriber alloc] initWithObject:self];
  [(ASCProgressOfferMetadata *)self percent];
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", @"percent");
  [(ASCDescriber *)v3 addBool:[(ASCProgressOfferMetadata *)self cancellable] withName:@"cancellable"];
  id v4 = [(ASCDescriber *)v3 finalizeDescription];

  return v4;
}

- (BOOL)isProgress
{
  return 1;
}

- (BOOL)isIndeterminate
{
  [(ASCProgressOfferMetadata *)self percent];
  return fabs(v2) == INFINITY;
}

- (double)percent
{
  return self->_percent;
}

- (BOOL)cancellable
{
  return self->_cancellable;
}

- (void)setIndeterminate:(BOOL)a3
{
  self->_indeterminate = a3;
}

@end