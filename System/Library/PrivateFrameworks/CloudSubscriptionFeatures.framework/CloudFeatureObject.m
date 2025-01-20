@interface CloudFeatureObject
- (BOOL)canUse;
- (CloudFeatureObject)init;
- (CloudFeatureObject)initWithFeatureID:(id)a3 status:(int64_t)a4 canUse:(BOOL)a5 accessToken:(id)a6;
- (CloudFeatureObject)initWithFeatureID:(id)a3 status:(int64_t)a4 canUse:(BOOL)a5 intValue:(int64_t)a6 accessToken:(id)a7;
- (CloudFeatureObject)initWithFeatureID:(id)a3 status:(int64_t)a4 canUse:(BOOL)a5 limit:(id)a6 accessToken:(id)a7;
- (NSNumber)limit;
- (NSString)accessToken;
- (NSString)featureID;
- (id)description;
- (int64_t)status;
@end

@implementation CloudFeatureObject

- (CloudFeatureObject)initWithFeatureID:(id)a3 status:(int64_t)a4 canUse:(BOOL)a5 limit:(id)a6 accessToken:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CloudFeatureObject;
  v15 = [(CloudFeatureObject *)&v21 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    featureID = v15->_featureID;
    v15->_featureID = (NSString *)v16;

    v15->_status = a4;
    v15->_canUse = a5;
    objc_storeStrong((id *)&v15->_limit, a6);
    uint64_t v18 = [v14 copy];
    accessToken = v15->_accessToken;
    v15->_accessToken = (NSString *)v18;
  }
  return v15;
}

- (CloudFeatureObject)initWithFeatureID:(id)a3 status:(int64_t)a4 canUse:(BOOL)a5 accessToken:(id)a6
{
  return [(CloudFeatureObject *)self initWithFeatureID:a3 status:a4 canUse:a5 limit:0 accessToken:a6];
}

- (CloudFeatureObject)initWithFeatureID:(id)a3 status:(int64_t)a4 canUse:(BOOL)a5 intValue:(int64_t)a6 accessToken:(id)a7
{
  BOOL v8 = a5;
  id v12 = NSNumber;
  id v13 = a7;
  id v14 = a3;
  v15 = [v12 numberWithInteger:a6];
  uint64_t v16 = [(CloudFeatureObject *)self initWithFeatureID:v14 status:a4 canUse:v8 limit:v15 accessToken:v13];

  return v16;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"ID: %@, status: %ld, canUse: %d, limit: %@, accessToken: %@", self->_featureID, self->_status, self->_canUse, self->_limit, self->_accessToken];
}

- (CloudFeatureObject)init
{
  v3.receiver = self;
  v3.super_class = (Class)CloudFeatureObject;
  return [(CloudFeatureObject *)&v3 init];
}

- (NSString)featureID
{
  return self->_featureID;
}

- (BOOL)canUse
{
  return self->_canUse;
}

- (NSNumber)limit
{
  return self->_limit;
}

- (NSString)accessToken
{
  return self->_accessToken;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessToken, 0);
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_featureID, 0);
}

@end