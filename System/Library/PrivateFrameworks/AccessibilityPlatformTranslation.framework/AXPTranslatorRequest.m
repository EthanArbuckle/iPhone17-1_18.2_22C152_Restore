@interface AXPTranslatorRequest
+ (BOOL)supportsSecureCoding;
+ (id)allowedDecodableClasses;
+ (id)requestWithTranslation:(id)a3;
- (AXPTranslationObject)translation;
- (AXPTranslatorRequest)initWithCoder:(id)a3;
- (NSDictionary)parameters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)actionType;
- (unint64_t)attributeType;
- (unint64_t)clientType;
- (unint64_t)requestType;
- (void)encodeWithCoder:(id)a3;
- (void)setActionType:(unint64_t)a3;
- (void)setAttributeType:(unint64_t)a3;
- (void)setClientType:(unint64_t)a3;
- (void)setParameters:(id)a3;
- (void)setRequestType:(unint64_t)a3;
- (void)setTranslation:(id)a3;
@end

@implementation AXPTranslatorRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)requestWithTranslation:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setTranslation:v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_new();
  objc_msgSend(v5, "setRequestType:", -[AXPTranslatorRequest requestType](self, "requestType"));
  v6 = [(AXPTranslatorRequest *)self parameters];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setParameters:v7];

  objc_msgSend(v5, "setAttributeType:", -[AXPTranslatorRequest attributeType](self, "attributeType"));
  objc_msgSend(v5, "setActionType:", -[AXPTranslatorRequest actionType](self, "actionType"));
  v8 = [(AXPTranslatorRequest *)self translation];
  [v5 setTranslation:v8];

  objc_msgSend(v5, "setClientType:", -[AXPTranslatorRequest clientType](self, "clientType"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AXPTranslatorRequest *)self parameters];
  [v4 encodeObject:v5 forKey:@"parameters"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[AXPTranslatorRequest requestType](self, "requestType"), @"requestType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXPTranslatorRequest actionType](self, "actionType"), @"actionType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXPTranslatorRequest attributeType](self, "attributeType"), @"attributeType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXPTranslatorRequest clientType](self, "clientType"), @"clientType");
  id v6 = [(AXPTranslatorRequest *)self translation];
  [v4 encodeObject:v6 forKey:@"translation"];
}

+ (id)allowedDecodableClasses
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__AXPTranslatorRequest_allowedDecodableClasses__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allowedDecodableClasses_onceToken_0 != -1) {
    dispatch_once(&allowedDecodableClasses_onceToken_0, block);
  }
  v2 = (void *)allowedDecodableClasses_Allowed_0;

  return v2;
}

void __47__AXPTranslatorRequest_allowedDecodableClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = +[AXPTranslationObject allowedDecodableClasses];
  uint64_t v8 = [v10 setByAddingObjectsFromSet:v7];
  v9 = (void *)allowedDecodableClasses_Allowed_0;
  allowedDecodableClasses_Allowed_0 = v8;
}

- (AXPTranslatorRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(AXPTranslatorRequest);
  -[AXPTranslatorRequest setRequestType:](v5, "setRequestType:", [v4 decodeIntegerForKey:@"requestType"]);
  -[AXPTranslatorRequest setActionType:](v5, "setActionType:", [v4 decodeIntegerForKey:@"actionType"]);
  -[AXPTranslatorRequest setAttributeType:](v5, "setAttributeType:", [v4 decodeIntegerForKey:@"attributeType"]);
  -[AXPTranslatorRequest setClientType:](v5, "setClientType:", [v4 decodeIntegerForKey:@"clientType"]);
  uint64_t v6 = [(id)objc_opt_class() allowedDecodableClasses];
  v7 = [v4 decodeObjectOfClasses:v6 forKey:@"parameters"];
  [(AXPTranslatorRequest *)v5 setParameters:v7];

  uint64_t v8 = [(id)objc_opt_class() allowedDecodableClasses];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"translation"];

  [(AXPTranslatorRequest *)v5 setTranslation:v9];
  return v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)AXPTranslatorRequest;
  id v4 = [(AXPTranslatorRequest *)&v12 description];
  unint64_t v5 = [(AXPTranslatorRequest *)self requestType];
  uint64_t v6 = _AXPActionToString([(AXPTranslatorRequest *)self actionType]);
  v7 = _AXPAttributeToString([(AXPTranslatorRequest *)self attributeType]);
  uint64_t v8 = [(AXPTranslatorRequest *)self parameters];
  v9 = [(AXPTranslatorRequest *)self translation];
  id v10 = [v3 stringWithFormat:@"%@: Type: %d, action: %@, attribute: %@, params: %@: translation: %@", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (AXPTranslationObject)translation
{
  return self->_translation;
}

- (void)setTranslation:(id)a3
{
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (unint64_t)attributeType
{
  return self->_attributeType;
}

- (void)setAttributeType:(unint64_t)a3
{
  self->_attributeType = a3;
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(unint64_t)a3
{
  self->_actionType = a3;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (unint64_t)clientType
{
  return self->_clientType;
}

- (void)setClientType:(unint64_t)a3
{
  self->_clientType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_translation, 0);
}

@end