@interface ACTAcceptCandidate
- (ACTAcceptCandidate)initWithCandidate:(id)a3 timestamp:(double)a4;
- (ACTAcceptCandidate)initWithCandidate:(id)a3 timestamp:(double)a4 intendedCandidate:(id)a5;
- (NSString)intendedCandidate;
- (TIKeyboardCandidate)candidate;
- (double)timestamp;
- (id)description;
- (id)shortDescription;
- (void)applyWithTyper:(id)a3 log:(id)a4;
@end

@implementation ACTAcceptCandidate

- (ACTAcceptCandidate)initWithCandidate:(id)a3 timestamp:(double)a4
{
  return [(ACTAcceptCandidate *)self initWithCandidate:a3 timestamp:0 intendedCandidate:a4];
}

- (ACTAcceptCandidate)initWithCandidate:(id)a3 timestamp:(double)a4 intendedCandidate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ACTAcceptCandidate;
  v11 = [(ACTAcceptCandidate *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_candidate, a3);
    v12->_timestamp = a4;
    objc_storeStrong((id *)&v12->_intendedCandidate, a5);
  }

  return v12;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(ACTAcceptCandidate *)self candidate];
  [(ACTAcceptCandidate *)self timestamp];
  v7 = +[NSString stringWithFormat:@"<%@: candidate=%@, t=%.2f>", v4, v5, v6];

  return v7;
}

- (id)shortDescription
{
  v3 = [(ACTAcceptCandidate *)self candidate];
  v4 = [v3 input];
  v5 = @"Prediction Accepted";
  if (([v4 isEqualToString:@" "] & 1) == 0)
  {
    uint64_t v6 = [(ACTAcceptCandidate *)self candidate];
    v7 = [v6 input];
    unsigned int v8 = [v7 isEqualToString:&stru_8DEF0];
    id v9 = @"Completion Accepted";
    if (v8) {
      id v9 = @"Prediction Accepted";
    }
    v5 = v9;
  }
  id v10 = [(ACTAcceptCandidate *)self candidate];
  v11 = [v10 candidate];
  v12 = +[NSString stringWithFormat:@"%@: %@ ", v5, v11];

  return v12;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACTAcceptCandidate *)self candidate];
  [(ACTAcceptCandidate *)self timestamp];
  objc_msgSend(v7, "_performAcceptCandidate:timestamp:typingLog:predictiveCandidate:intendedTransliteration:", v8, v6, 1, self->_intendedCandidate);
}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (NSString)intendedCandidate
{
  return self->_intendedCandidate;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intendedCandidate, 0);

  objc_storeStrong((id *)&self->_candidate, 0);
}

@end