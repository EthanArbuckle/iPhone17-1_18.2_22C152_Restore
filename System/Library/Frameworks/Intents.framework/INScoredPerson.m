@interface INScoredPerson
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INPerson)person;
- (INScoredPerson)initWithCoder:(id)a3;
- (INScoredPerson)initWithPerson:(id)a3 recommendation:(int64_t)a4;
- (INScoredPerson)initWithPerson:(id)a3 score:(id)a4;
- (INScoredPerson)initWithPerson:(id)a3 score:(id)a4 recommendation:(int64_t)a5;
- (NSNumber)score;
- (id)_dictionaryRepresentation;
- (id)description;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)recommendation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INScoredPerson

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);

  objc_storeStrong((id *)&self->_person, 0);
}

- (int64_t)recommendation
{
  return self->_recommendation;
}

- (NSNumber)score
{
  return self->_score;
}

- (INPerson)person
{
  return self->_person;
}

- (id)_dictionaryRepresentation
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"person";
  person = self->_person;
  v4 = person;
  if (!person)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[0] = v4;
  v10[1] = @"score";
  score = self->_score;
  v6 = score;
  if (!score)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v6;
  v10[2] = @"recommendation";
  v7 = [NSNumber numberWithInteger:self->_recommendation];
  v11[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  if (score)
  {
    if (person) {
      goto LABEL_7;
    }
  }
  else
  {

    if (person) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v8;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INScoredPerson;
  v6 = [(INScoredPerson *)&v11 description];
  v7 = [(INScoredPerson *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (id)description
{
  return [(INScoredPerson *)self descriptionAtIndent:0];
}

- (INScoredPerson)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"person"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"score"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"recommendation"];

  v8 = [(INScoredPerson *)self initWithPerson:v5 score:v6 recommendation:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  person = self->_person;
  id v5 = a3;
  [v5 encodeObject:person forKey:@"person"];
  [v5 encodeObject:self->_score forKey:@"score"];
  [v5 encodeInteger:self->_recommendation forKey:@"recommendation"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    person = self->_person;
    BOOL v8 = (person == (INPerson *)v5[1] || -[INPerson isEqual:](person, "isEqual:"))
      && ((score = self->_score, score == (NSNumber *)v5[2]) || -[NSNumber isEqual:](score, "isEqual:"))
      && self->_recommendation == v5[3];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INPerson *)self->_person hash];
  return [(NSNumber *)self->_score hash] ^ v3;
}

- (INScoredPerson)initWithPerson:(id)a3 score:(id)a4 recommendation:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)INScoredPerson;
  v10 = [(INScoredPerson *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    person = v10->_person;
    v10->_person = (INPerson *)v11;

    uint64_t v13 = [v9 copy];
    score = v10->_score;
    v10->_score = (NSNumber *)v13;

    v10->_recommendation = a5;
  }

  return v10;
}

- (INScoredPerson)initWithPerson:(id)a3 recommendation:(int64_t)a4
{
  if (a4) {
    double v6 = 0.5;
  }
  else {
    double v6 = 1.0;
  }
  uint64_t v7 = NSNumber;
  id v8 = a3;
  id v9 = [v7 numberWithDouble:v6];
  v10 = [(INScoredPerson *)self initWithPerson:v8 score:v9 recommendation:a4];

  return v10;
}

- (INScoredPerson)initWithPerson:(id)a3 score:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    [v7 doubleValue];
    if (v9 < 1.0) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = [(INScoredPerson *)self initWithPerson:v6 score:v8 recommendation:v10];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end