@interface LKNamingSimilarity
+ (BOOL)supportsSecureCoding;
+ (id)namingSimilarityWithSimilarity:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLKNamingSimilarity:(id)a3;
- (LKNamingSimilarity)init;
- (LKNamingSimilarity)initWithCoder:(id)a3;
- (unint64_t)similarity;
- (void)encodeWithCoder:(id)a3;
- (void)setSimilarity:(unint64_t)a3;
@end

@implementation LKNamingSimilarity

+ (id)namingSimilarityWithSimilarity:(unint64_t)a3
{
  v4 = objc_opt_new();
  [v4 setSimilarity:a3];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LKNamingSimilarity)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)LKNamingSimilarity;
  v5 = [(LKNamingSimilarity *)&v7 init];
  if (v5) {
    -[LKNamingSimilarity setSimilarity:](v5, "setSimilarity:", [v4 decodeIntegerForKey:@"similarity"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LKNamingSimilarity similarity](self, "similarity"), @"similarity");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LKNamingSimilarity *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(LKNamingSimilarity *)self isEqualToLKNamingSimilarity:v5];

  return v6;
}

- (BOOL)isEqualToLKNamingSimilarity:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(LKNamingSimilarity *)self similarity];
  uint64_t v6 = [v4 similarity];

  return v5 == v6;
}

- (LKNamingSimilarity)init
{
  v3.receiver = self;
  v3.super_class = (Class)LKNamingSimilarity;
  result = [(LKNamingSimilarity *)&v3 init];
  if (result) {
    result->_similarity = 2;
  }
  return result;
}

- (void)setSimilarity:(unint64_t)a3
{
  if (self->_similarity != a3) {
    self->_similarity = a3;
  }
}

- (unint64_t)similarity
{
  return self->_similarity;
}

@end