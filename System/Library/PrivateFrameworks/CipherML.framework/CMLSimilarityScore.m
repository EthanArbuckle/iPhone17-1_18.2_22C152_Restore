@interface CMLSimilarityScore
+ (BOOL)supportsSecureCoding;
+ (id)scoreWithIdentifier:(unint64_t)a3 score:(float)a4;
+ (id)scoreWithIdentifier:(unint64_t)a3 score:(float)a4 metadata:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSimilarityScore:(id)a3;
- (CMLSimilarityScore)initWithCoder:(id)a3;
- (CMLSimilarityScore)initWithIdentifier:(unint64_t)a3 score:(float)a4 metadata:(id)a5;
- (NSData)metadata;
- (float)score;
- (unint64_t)hash;
- (unint64_t)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setMetadata:(id)a3;
- (void)setScore:(float)a3;
@end

@implementation CMLSimilarityScore

- (CMLSimilarityScore)initWithIdentifier:(unint64_t)a3 score:(float)a4 metadata:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CMLSimilarityScore;
  v10 = [(CMLSimilarityScore *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_identifier = a3;
    v10->_score = a4;
    objc_storeStrong((id *)&v10->_metadata, a5);
  }

  return v11;
}

+ (id)scoreWithIdentifier:(unint64_t)a3 score:(float)a4
{
  id v6 = objc_alloc((Class)objc_opt_class());
  *(float *)&double v7 = a4;
  v8 = (void *)[v6 initWithIdentifier:a3 score:0 metadata:v7];
  return v8;
}

+ (id)scoreWithIdentifier:(unint64_t)a3 score:(float)a4 metadata:(id)a5
{
  id v7 = a5;
  id v8 = objc_alloc((Class)objc_opt_class());
  *(float *)&double v9 = a4;
  v10 = (void *)[v8 initWithIdentifier:a3 score:v7 metadata:v9];

  return v10;
}

- (BOOL)isEqualToSimilarityScore:(id)a3
{
  id v4 = a3;
  v5 = [(CMLSimilarityScore *)self metadata];
  if (v5)
  {

LABEL_4:
    id v7 = [(CMLSimilarityScore *)self metadata];
    id v8 = [v4 metadata];
    char v9 = [v7 isEqual:v8];

    goto LABEL_5;
  }
  id v6 = [v4 metadata];

  if (v6) {
    goto LABEL_4;
  }
  char v9 = 1;
LABEL_5:
  unint64_t v10 = [(CMLSimilarityScore *)self identifier];
  if (v10 == [v4 identifier])
  {
    [(CMLSimilarityScore *)self score];
    float v12 = v11;
    [v4 score];
    if (v12 == v13) {
      BOOL v14 = v9;
    }
    else {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CMLSimilarityScore *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CMLSimilarityScore *)self isEqualToSimilarityScore:v5];

  return v6;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[CMLSimilarityScore identifier](self, "identifier"));
  uint64_t v4 = [v3 hash];
  v5 = NSNumber;
  [(CMLSimilarityScore *)self score];
  BOOL v6 = objc_msgSend(v5, "numberWithFloat:");
  uint64_t v7 = [v6 hash] ^ v4;
  id v8 = [(CMLSimilarityScore *)self metadata];
  unint64_t v9 = v7 ^ [v8 hash];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMLSimilarityScore)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"identifier"];
  [v4 decodeFloatForKey:@"score"];
  int v7 = v6;
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];

  LODWORD(v9) = v7;
  unint64_t v10 = [(CMLSimilarityScore *)self initWithIdentifier:v5 score:v8 metadata:v9];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[CMLSimilarityScore identifier](self, "identifier"), @"identifier");
  [(CMLSimilarityScore *)self score];
  objc_msgSend(v4, "encodeFloat:forKey:", @"score");
  id v5 = [(CMLSimilarityScore *)self metadata];
  [v4 encodeObject:v5 forKey:@"metadata"];
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end