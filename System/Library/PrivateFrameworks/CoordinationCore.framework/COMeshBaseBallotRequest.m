@interface COMeshBaseBallotRequest
+ (BOOL)supportsSecureCoding;
- (COBallot)ballot;
- (COMeshBaseBallotRequest)initWithBallot:(id)a3 generation:(unint64_t)a4;
- (COMeshBaseBallotRequest)initWithBallot:(id)a3 generation:(unint64_t)a4 variant:(int64_t)a5;
- (COMeshBaseBallotRequest)initWithCoder:(id)a3;
- (int64_t)variant;
- (unint64_t)generation;
- (void)encodeWithCoder:(id)a3;
- (void)setBallot:(id)a3;
@end

@implementation COMeshBaseBallotRequest

- (COMeshBaseBallotRequest)initWithBallot:(id)a3 generation:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)COMeshBaseBallotRequest;
  v7 = [(COMeshCommand *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    ballot = v7->_ballot;
    v7->_ballot = (COBallot *)v8;

    v7->_generation = a4;
    v7->_variant = 1;
  }

  return v7;
}

- (COMeshBaseBallotRequest)initWithBallot:(id)a3 generation:(unint64_t)a4 variant:(int64_t)a5
{
  result = [(COMeshBaseBallotRequest *)self initWithBallot:a3 generation:a4];
  if (result) {
    result->_variant = a5;
  }
  return result;
}

- (COMeshBaseBallotRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)COMeshBaseBallotRequest;
  v5 = [(COMeshCommand *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ballot"];
    ballot = v5->_ballot;
    v5->_ballot = (COBallot *)v6;

    uint64_t v8 = [v4 decodeIntegerForKey:@"variant"];
    v5->_variant = v8;
    if (v8) {
      v5->_generation = [v4 decodeInt64ForKey:@"generation"];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)COMeshBaseBallotRequest;
  [(COMeshCommand *)&v7 encodeWithCoder:v4];
  v5 = [(COMeshBaseBallotRequest *)self ballot];
  [v4 encodeObject:v5 forKey:@"ballot"];

  int64_t v6 = [(COMeshBaseBallotRequest *)self variant];
  [v4 encodeInteger:v6 forKey:@"variant"];
  if (v6) {
    objc_msgSend(v4, "encodeInt64:forKey:", -[COMeshBaseBallotRequest generation](self, "generation"), @"generation");
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (COBallot)ballot
{
  return self->_ballot;
}

- (void)setBallot:(id)a3
{
}

- (unint64_t)generation
{
  return self->_generation;
}

- (int64_t)variant
{
  return self->_variant;
}

- (void).cxx_destruct
{
}

@end