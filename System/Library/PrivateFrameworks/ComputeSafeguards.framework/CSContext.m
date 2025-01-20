@interface CSContext
- (BOOL)isEqual:(id)a3;
- (CSContext)initWithIdentifier:(id)a3 andState:(id)a4;
- (NSNumber)state;
- (NSString)identifier;
- (id)description;
@end

@implementation CSContext

- (CSContext)initWithIdentifier:(id)a3 andState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSContext;
  v9 = [(CSContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_state, a4);
  }

  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"CSContext: %@, %@", self->_identifier, self->_state];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CSContext *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else if ([(CSContext *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    identifier = self->_identifier;
    id v7 = [(CSContext *)v5 identifier];
    if ([(NSString *)identifier isEqual:v7])
    {
      state = self->_state;
      v9 = [(CSContext *)v5 state];
      char v10 = [(NSNumber *)state isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSNumber)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end