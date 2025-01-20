@interface RequestLocalizations
- (NSString)approve;
- (NSString)body;
- (NSString)decline;
- (NSString)title;
- (RequestLocalizations)initWithApprove:(id)a3 body:(id)a4 decline:(id)a5 title:(id)a6;
- (RequestLocalizations)initWithDictionary:(id)a3;
- (id)compile;
- (id)description;
@end

@implementation RequestLocalizations

- (RequestLocalizations)initWithApprove:(id)a3 body:(id)a4 decline:(id)a5 title:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  v15 = 0;
  if (v10 && v11 && v12 && v13)
  {
    v26.receiver = self;
    v26.super_class = (Class)RequestLocalizations;
    v16 = [(RequestLocalizations *)&v26 init];
    if (v16)
    {
      v17 = (NSString *)[v14 copy];
      title = v16->_title;
      v16->_title = v17;

      v19 = (NSString *)[v11 copy];
      body = v16->_body;
      v16->_body = v19;

      v21 = (NSString *)[v10 copy];
      approve = v16->_approve;
      v16->_approve = v21;

      v23 = (NSString *)[v12 copy];
      decline = v16->_decline;
      v16->_decline = v23;
    }
    self = v16;
    v15 = self;
  }

  return v15;
}

- (RequestLocalizations)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"approve"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  v7 = [v4 objectForKeyedSubscript:@"body"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  v9 = [v4 objectForKeyedSubscript:@"decline"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  id v11 = [v4 objectForKeyedSubscript:@"title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  id v13 = [(RequestLocalizations *)self initWithApprove:v6 body:v8 decline:v10 title:v12];
  return v13;
}

- (id)compile
{
  v9[0] = @"approve";
  v3 = [(RequestLocalizations *)self approve];
  v10[0] = v3;
  v9[1] = @"body";
  id v4 = [(RequestLocalizations *)self body];
  v10[1] = v4;
  v9[2] = @"decline";
  v5 = [(RequestLocalizations *)self decline];
  v10[2] = v5;
  v9[3] = @"title";
  id v6 = [(RequestLocalizations *)self title];
  v10[3] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (id)description
{
  v3 = [(RequestLocalizations *)self compile];
  id v4 = [(RequestLocalizations *)self ap_generateDescriptionWithSubObjects:v3];

  return v4;
}

- (NSString)approve
{
  return self->_approve;
}

- (NSString)body
{
  return self->_body;
}

- (NSString)decline
{
  return self->_decline;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_decline, 0);
  objc_storeStrong((id *)&self->_body, 0);

  objc_storeStrong((id *)&self->_approve, 0);
}

@end