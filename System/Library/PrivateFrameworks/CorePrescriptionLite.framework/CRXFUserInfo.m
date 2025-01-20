@interface CRXFUserInfo
- (CRXFUserInfo)initWithUserID:(id)a3 firstName:(id)a4;
- (NSString)firstName;
- (NSString)userID;
- (id)description;
@end

@implementation CRXFUserInfo

- (CRXFUserInfo)initWithUserID:(id)a3 firstName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRXFUserInfo;
  v9 = [(CRXFUserInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userID, a3);
    objc_storeStrong((id *)&v10->_firstName, a4);
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CRXFUserInfo *)self userID];
  v6 = [(CRXFUserInfo *)self firstName];
  id v7 = [v3 stringWithFormat:@"%@<%p> userID:%@, firstName:%@", v4, self, v5, v6];

  return v7;
}

- (NSString)userID
{
  return self->_userID;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_userID, 0);
}

@end