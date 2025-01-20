@interface LNSuggestedAction
+ (BOOL)supportsSecureCoding;
- (LNAction)action;
- (LNSuggestedAction)initWithAction:(id)a3 systemProtocol:(id)a4 dialogParameters:(id)a5;
- (LNSuggestedAction)initWithCoder:(id)a3;
- (LNSystemProtocol)systemProtocol;
- (NSDictionary)dialogParameters;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNSuggestedAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogParameters, 0);
  objc_storeStrong((id *)&self->_systemProtocol, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (NSDictionary)dialogParameters
{
  return self->_dialogParameters;
}

- (LNSystemProtocol)systemProtocol
{
  return self->_systemProtocol;
}

- (LNAction)action
{
  return self->_action;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNSuggestedAction *)self action];
  [v4 encodeObject:v5 forKey:@"action"];

  v6 = [(LNSuggestedAction *)self systemProtocol];
  [v4 encodeObject:v6 forKey:@"systemProtocol"];

  id v7 = [(LNSuggestedAction *)self dialogParameters];
  [v4 encodeObject:v7 forKey:@"dialogParameters"];
}

- (LNSuggestedAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemProtocol"];
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"dialogParameters"];

  v11 = [(LNSuggestedAction *)self initWithAction:v5 systemProtocol:v6 dialogParameters:v10];
  return v11;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(LNSuggestedAction *)self action];
  id v7 = [(LNSuggestedAction *)self systemProtocol];
  uint64_t v8 = [(LNSuggestedAction *)self dialogParameters];
  v9 = [v3 stringWithFormat:@"<%@: %p, action: %@, systemProtocol: %@, dialogParameters: %@>", v5, self, v6, v7, v8];

  return v9;
}

- (LNSuggestedAction)initWithAction:(id)a3 systemProtocol:(id)a4 dialogParameters:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)LNSuggestedAction;
  v12 = [(LNSuggestedAction *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_action, a3);
    objc_storeStrong((id *)&v13->_systemProtocol, a4);
    uint64_t v14 = [v11 copy];
    dialogParameters = v13->_dialogParameters;
    v13->_dialogParameters = (NSDictionary *)v14;

    v16 = v13;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end