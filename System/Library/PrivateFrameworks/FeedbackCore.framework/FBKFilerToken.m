@interface FBKFilerToken
- (FBKFilerToken)initWithEntityID:(id)a3 type:(unint64_t)a4 token:(id)a5 dsid:(id)a6;
- (NSNumber)dsid;
- (NSNumber)entityID;
- (NSString)token;
- (unint64_t)entityType;
@end

@implementation FBKFilerToken

- (FBKFilerToken)initWithEntityID:(id)a3 type:(unint64_t)a4 token:(id)a5 dsid:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)FBKFilerToken;
  v13 = [(FBKFilerToken *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    entityID = v13->_entityID;
    v13->_entityID = (NSNumber *)v14;

    v13->_entityType = a4;
    uint64_t v16 = [v11 copy];
    token = v13->_token;
    v13->_token = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    dsid = v13->_dsid;
    v13->_dsid = (NSNumber *)v18;
  }
  return v13;
}

- (NSNumber)entityID
{
  return self->_entityID;
}

- (NSString)token
{
  return self->_token;
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (unint64_t)entityType
{
  return self->_entityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_entityID, 0);
}

@end