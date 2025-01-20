@interface IAMAction
- (BOOL)requiresDelegate;
- (IAMAction)initWithICAction:(id)a3;
- (IAMAction)initWithIdentifier:(id)a3 displayText:(id)a4 url:(id)a5 requiresDelegate:(BOOL)a6 actionParameters:(id)a7;
- (NSDictionary)actionParameters;
- (NSString)displayText;
- (NSString)identifier;
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation IAMAction

- (IAMAction)initWithIdentifier:(id)a3 displayText:(id)a4 url:(id)a5 requiresDelegate:(BOOL)a6 actionParameters:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)IAMAction;
  v16 = [(IAMAction *)&v24 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    displayText = v16->_displayText;
    v16->_displayText = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    url = v16->_url;
    v16->_url = (NSURL *)v21;

    v16->_requiresDelegate = a6;
    objc_storeStrong((id *)&v16->_actionParameters, a7);
  }

  return v16;
}

- (IAMAction)initWithICAction:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IAMAction;
  v5 = [(IAMAction *)&v20 init];
  if (v5)
  {
    v6 = [v4 identifier];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = [v4 displayText];
    uint64_t v10 = [v9 copy];
    displayText = v5->_displayText;
    v5->_displayText = (NSString *)v10;

    id v12 = NSURL;
    id v13 = [v4 uRL];
    uint64_t v14 = [v12 URLWithString:v13];
    url = v5->_url;
    v5->_url = (NSURL *)v14;

    v5->_requiresDelegate = [v4 requiresDelegate];
    v16 = [v4 actionParameters];
    uint64_t v17 = objc_msgSend(v16, "iam_dictionaryFromArrayOfICIIAMParameters");
    actionParameters = v5->_actionParameters;
    v5->_actionParameters = (NSDictionary *)v17;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  identifier = self->_identifier;
  displayText = self->_displayText;
  BOOL requiresDelegate = self->_requiresDelegate;
  url = self->_url;
  actionParameters = self->_actionParameters;
  return (id)[v4 initWithIdentifier:identifier displayText:displayText url:url requiresDelegate:requiresDelegate actionParameters:actionParameters];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayText
{
  return self->_displayText;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)requiresDelegate
{
  return self->_requiresDelegate;
}

- (NSDictionary)actionParameters
{
  return self->_actionParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionParameters, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end