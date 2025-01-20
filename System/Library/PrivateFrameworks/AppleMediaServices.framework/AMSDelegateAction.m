@interface AMSDelegateAction
- (AMSDelegateAction)initWithDialogAction:(id)a3;
- (AMSDelegateAction)initWithIdentifier:(id)a3 parameters:(id)a4;
- (NSDictionary)parameters;
- (NSString)identifier;
- (id)actionPayload;
- (id)description;
@end

@implementation AMSDelegateAction

- (AMSDelegateAction)initWithIdentifier:(id)a3 parameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSDelegateAction;
  v9 = [(AMSDelegateAction *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_parameters, a4);
  }

  return v10;
}

- (AMSDelegateAction)initWithDialogAction:(id)a3
{
  id v4 = a3;
  v5 = [v4 kind];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F29128] UUID];
    id v7 = [v8 UUIDString];
  }
  v9 = [v4 parameters];

  if (v9)
  {
    v10 = [v4 parameters];
    v11 = [v10 valueForKey:@"identifier"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v11;

      if (!v12)
      {
        id v13 = 0;
        goto LABEL_11;
      }
      id v13 = v12;
      v11 = v7;
      id v7 = v13;
    }
    else
    {
      id v13 = 0;
    }

LABEL_11:
  }
  v14 = [v4 parameters];
  v15 = [(AMSDelegateAction *)self initWithIdentifier:v7 parameters:v14];

  return v15;
}

- (id)description
{
  if (os_variant_has_internal_content())
  {
    v3 = [(AMSDelegateAction *)self parameters];
    id v4 = [v3 description];
  }
  else
  {
    id v4 = @"<private>";
  }
  v5 = NSString;
  v6 = [(AMSDelegateAction *)self identifier];
  id v7 = [v5 stringWithFormat:@"{ id: %@, parameters: %@ }", v6, v4];

  return v7;
}

- (id)actionPayload
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(AMSDelegateAction *)self parameters];

  if (v4)
  {
    v5 = [(AMSDelegateAction *)self parameters];
    [v3 addEntriesFromDictionary:v5];
  }
  v6 = [v3 objectForKey:@"actionKind"];

  if (!v6)
  {
    id v7 = [(AMSDelegateAction *)self identifier];
    [v3 setObject:v7 forKeyedSubscript:@"actionKind"];
  }
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end