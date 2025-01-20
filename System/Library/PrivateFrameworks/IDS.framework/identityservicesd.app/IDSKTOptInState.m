@interface IDSKTOptInState
- (BOOL)isEqual:(id)a3;
- (IDSKTOptInState)initWithTimeStamp:(id)a3 status:(unint64_t)a4 error:(id)a5;
- (NSDate)timestamp;
- (NSError)error;
- (id)description;
- (unint64_t)hash;
- (unint64_t)status;
@end

@implementation IDSKTOptInState

- (IDSKTOptInState)initWithTimeStamp:(id)a3 status:(unint64_t)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)IDSKTOptInState;
  v11 = [(IDSKTOptInState *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_timestamp, a3);
    v12->_status = a4;
    objc_storeStrong((id *)&v12->_error, a5);
  }

  return v12;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(IDSKTOptInState *)self timestamp];
  unint64_t v5 = [(IDSKTOptInState *)self status];
  v6 = [(IDSKTOptInState *)self error];
  v7 = +[NSString stringWithFormat:@"<%@: %p { timestamp: %@, status: %ld@, error: %@ }>", v3, self, v4, v5, v6];

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(IDSKTOptInState *)self timestamp];
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = [(IDSKTOptInState *)self status] ^ v4;
  v6 = [(IDSKTOptInState *)self error];
  unint64_t v7 = v5 ^ (unint64_t)[v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 timestamp];
    unint64_t v7 = [(IDSKTOptInState *)self timestamp];
    if ([v6 isEqualToDate:v7]
      && (id v8 = [v5 status], v8 == (id)-[IDSKTOptInState status](self, "status")))
    {
      id v9 = [v5 error];
      id v10 = [(IDSKTOptInState *)self error];
      unsigned __int8 v11 = [v9 isEqual:v10];
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)status
{
  return self->_status;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end