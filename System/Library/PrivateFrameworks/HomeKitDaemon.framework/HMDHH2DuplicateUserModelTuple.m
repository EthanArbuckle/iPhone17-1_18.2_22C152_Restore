@interface HMDHH2DuplicateUserModelTuple
- (HMDHH2DuplicateUserModelTuple)initWithHomeModelID:(id)a3 userMergeID:(id)a4;
- (NSString)userMergeID;
- (NSUUID)homeModelID;
- (id)description;
@end

@implementation HMDHH2DuplicateUserModelTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userMergeID, 0);
  objc_storeStrong((id *)&self->_homeModelID, 0);
}

- (NSString)userMergeID
{
  return self->_userMergeID;
}

- (NSUUID)homeModelID
{
  return self->_homeModelID;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(HMDHH2DuplicateUserModelTuple *)self homeModelID];
  v7 = [(HMDHH2DuplicateUserModelTuple *)self userMergeID];
  v8 = [v3 stringWithFormat:@"<%@: home = %@, user = %@>", v5, v6, v7];

  return v8;
}

- (HMDHH2DuplicateUserModelTuple)initWithHomeModelID:(id)a3 userMergeID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDHH2DuplicateUserModelTuple;
  v9 = [(HMDHH2DuplicateUserModelTuple *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_homeModelID, a3);
    objc_storeStrong((id *)&v10->_userMergeID, a4);
  }

  return v10;
}

@end