@interface HMResponseBase
- (HMRequestBase)request;
- (HMResponseBase)initWithRequest:(id)a3 error:(id)a4;
- (HMResponseBase)initWithRequest:(id)a3 value:(id)a4 error:(id)a5;
- (NSCopying)value;
- (NSError)error;
- (void)setRequest:(id)a3;
@end

@implementation HMResponseBase

- (NSError)error
{
  return self->_error;
}

- (HMRequestBase)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (HMResponseBase)initWithRequest:(id)a3 value:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMResponseBase;
  v12 = [(HMResponseBase *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_value, a4);
    objc_storeStrong((id *)&v13->_error, a5);
  }

  return v13;
}

- (NSCopying)value
{
  return self->_value;
}

- (HMResponseBase)initWithRequest:(id)a3 error:(id)a4
{
  return [(HMResponseBase *)self initWithRequest:a3 value:0 error:a4];
}

@end