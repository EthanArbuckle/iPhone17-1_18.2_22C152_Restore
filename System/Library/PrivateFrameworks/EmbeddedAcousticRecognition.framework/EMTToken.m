@interface EMTToken
- (BOOL)followedBySpace;
- (BOOL)isEqual:(id)a3;
- (BOOL)precededBySpace;
- (EMTToken)initWithText:(id)a3 confidence:(float)a4 precededBySpace:(BOOL)a5 followedBySpace:(BOOL)a6;
- (EMTToken)initWithText:(id)a3 confidence:(float)a4 score:(float)a5 precededBySpace:(BOOL)a6 followedBySpace:(BOOL)a7;
- (NSString)text;
- (float)confidence;
- (float)score;
- (id)description;
- (unint64_t)hash;
@end

@implementation EMTToken

- (EMTToken)initWithText:(id)a3 confidence:(float)a4 precededBySpace:(BOOL)a5 followedBySpace:(BOOL)a6
{
  return -[EMTToken initWithText:confidence:score:precededBySpace:followedBySpace:](self, "initWithText:confidence:score:precededBySpace:followedBySpace:", a3, a5, a6);
}

- (EMTToken)initWithText:(id)a3 confidence:(float)a4 score:(float)a5 precededBySpace:(BOOL)a6 followedBySpace:(BOOL)a7
{
  id v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)EMTToken;
  v13 = [(EMTToken *)&v17 init];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    text = v13->_text;
    v13->_text = (NSString *)v14;

    v13->_confidence = a4;
    v13->_score = a5;
    v13->_precededBySpace = a6;
    v13->_followedBySpace = a7;
  }

  return v13;
}

- (id)description
{
  return self->_text;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    text = self->_text;
    v7 = [v5 text];
    if ([(NSString *)text isEqual:v7]
      && (float confidence = self->_confidence, [v5 confidence], confidence == v9)
      && (float score = self->_score, [v5 score], score == v11)
      && (int precededBySpace = self->_precededBySpace, precededBySpace == [v5 precededBySpace]))
    {
      int followedBySpace = self->_followedBySpace;
      BOOL v14 = followedBySpace == [v5 followedBySpace];
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  if (self->_confidence == 0.0) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = 527 * LODWORD(self->_confidence);
  }
  return 17 * (17 * (v2 + [(NSString *)self->_text hash]) + 11 * self->_precededBySpace)
       + 11 * self->_followedBySpace;
}

- (NSString)text
{
  return self->_text;
}

- (float)confidence
{
  return self->_confidence;
}

- (float)score
{
  return self->_score;
}

- (BOOL)precededBySpace
{
  return self->_precededBySpace;
}

- (BOOL)followedBySpace
{
  return self->_followedBySpace;
}

- (void).cxx_destruct
{
}

@end