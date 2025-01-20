@interface IDSSystemAccount
- (IDSSystemAccount)initWithUsername:(id)a3 DSID:(id)a4;
- (NSString)DSID;
- (NSString)username;
- (id)description;
@end

@implementation IDSSystemAccount

- (IDSSystemAccount)initWithUsername:(id)a3 DSID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IDSSystemAccount;
  v8 = [(IDSSystemAccount *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    username = v8->_username;
    v8->_username = v9;

    v11 = (NSString *)[v7 copy];
    DSID = v8->_DSID;
    v8->_DSID = v11;
  }
  return v8;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@: %p username: %@, DSID: %@>", v4, self, self->_username, self->_DSID];

  return v5;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)DSID
{
  return self->_DSID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DSID, 0);

  objc_storeStrong((id *)&self->_username, 0);
}

@end