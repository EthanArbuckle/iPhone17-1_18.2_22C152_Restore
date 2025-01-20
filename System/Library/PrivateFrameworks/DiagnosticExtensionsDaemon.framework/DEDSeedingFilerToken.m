@interface DEDSeedingFilerToken
- (DEDSeedingFilerToken)initWithEntityID:(id)a3 type:(int64_t)a4 token:(id)a5 dsid:(id)a6;
- (NSNumber)entityID;
- (NSString)dsid;
- (NSString)token;
- (id)compiledEntityID;
- (int64_t)submissionType;
@end

@implementation DEDSeedingFilerToken

- (DEDSeedingFilerToken)initWithEntityID:(id)a3 type:(int64_t)a4 token:(id)a5 dsid:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)DEDSeedingFilerToken;
  v13 = [(DEDSeedingFilerToken *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    entityID = v13->_entityID;
    v13->_entityID = (NSNumber *)v14;

    v13->_submissionType = a4;
    uint64_t v16 = [v11 copy];
    token = v13->_token;
    v13->_token = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    dsid = v13->_dsid;
    v13->_dsid = (NSString *)v18;
  }
  return v13;
}

- (id)compiledEntityID
{
  v3 = NSString;
  int64_t v4 = [(DEDSeedingFilerToken *)self submissionType];
  v5 = "Unknown";
  if (v4 == 2) {
    v5 = "FFU";
  }
  if (v4 == 1) {
    v6 = "FR";
  }
  else {
    v6 = v5;
  }
  v7 = [(DEDSeedingFilerToken *)self entityID];
  v8 = [v3 stringWithFormat:@"%s:%@", v6, v7];

  return v8;
}

- (NSNumber)entityID
{
  return self->_entityID;
}

- (NSString)token
{
  return self->_token;
}

- (NSString)dsid
{
  return self->_dsid;
}

- (int64_t)submissionType
{
  return self->_submissionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_entityID, 0);
}

@end