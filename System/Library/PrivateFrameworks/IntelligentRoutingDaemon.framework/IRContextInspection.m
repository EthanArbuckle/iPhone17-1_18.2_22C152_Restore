@interface IRContextInspection
- (IRContextInspection)initWithDate:(id)a3 policies:(id)a4 foregroundApp:(id)a5;
- (NSDate)date;
- (NSDictionary)policies;
- (NSString)foregroundApp;
@end

@implementation IRContextInspection

- (IRContextInspection)initWithDate:(id)a3 policies:(id)a4 foregroundApp:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IRContextInspection;
  v12 = [(IRContextInspection *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_date, a3);
    objc_storeStrong((id *)&v13->_policies, a4);
    objc_storeStrong((id *)&v13->_foregroundApp, a5);
  }

  return v13;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)foregroundApp
{
  return self->_foregroundApp;
}

- (NSDictionary)policies
{
  return self->_policies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);
  objc_storeStrong((id *)&self->_foregroundApp, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end