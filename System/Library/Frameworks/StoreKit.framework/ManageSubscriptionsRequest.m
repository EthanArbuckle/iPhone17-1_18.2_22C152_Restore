@interface ManageSubscriptionsRequest
+ (BOOL)supportsSecureCoding;
- (ManageSubscriptionsRequest)init;
- (ManageSubscriptionsRequest)initWithCoder:(id)a3;
- (ManageSubscriptionsRequest)initWithFamilyID:(id)a3;
- (ManageSubscriptionsRequest)initWithFamilyID:(id)a3 sceneID:(id)a4;
- (NSString)familyID;
- (NSString)sceneID;
- (void)encodeWithCoder:(id)a3;
- (void)setSceneID:(id)a3;
@end

@implementation ManageSubscriptionsRequest

- (ManageSubscriptionsRequest)init
{
  return [(ManageSubscriptionsRequest *)self initWithFamilyID:0 sceneID:0];
}

- (ManageSubscriptionsRequest)initWithFamilyID:(id)a3
{
  return [(ManageSubscriptionsRequest *)self initWithFamilyID:a3 sceneID:0];
}

- (ManageSubscriptionsRequest)initWithFamilyID:(id)a3 sceneID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ManageSubscriptionsRequest;
  v9 = [(ManageSubscriptionsRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_familyID, a3);
    objc_storeStrong((id *)&v10->_sceneID, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ManageSubscriptionsRequest *)self familyID];
  [v4 encodeObject:v5 forKey:@"familyID"];

  id v6 = [(ManageSubscriptionsRequest *)self sceneID];
  [v4 encodeObject:v6 forKey:@"sceneID"];
}

- (ManageSubscriptionsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"familyID"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sceneID"];

  id v7 = [(ManageSubscriptionsRequest *)self initWithFamilyID:v5 sceneID:v6];
  return v7;
}

- (NSString)familyID
{
  return self->_familyID;
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (void)setSceneID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneID, 0);

  objc_storeStrong((id *)&self->_familyID, 0);
}

@end