@interface UrsaSuggestion
- (UrsaSuggestion)initWithIssue:(id)a3;
- (id)getSuggestionHeaderSpecifier;
- (id)getSuggestionIdentifier;
- (id)getSuggestionInfoSpecifier;
- (int)getSuggestionType;
- (void)handleUrsaIssueSpecifierAction:(id)a3;
@end

@implementation UrsaSuggestion

- (UrsaSuggestion)initWithIssue:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)UrsaSuggestion;
  v5 = [(UrsaSuggestion *)&v33 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"radar"];
    id v7 = [v6 intValue];

    v35[0] = @"BUI";
    v34[0] = @"source";
    v34[1] = @"radar";
    v8 = +[NSNumber numberWithInt:v7];
    v34[2] = @"action";
    v35[1] = v8;
    v35[2] = @"seen";
    v9 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];

    v32 = v9;
    id v31 = v9;
    AnalyticsSendEventLazy();
    PLLogRegisteredEvent();
    v29 = +[NSString stringWithFormat:@"rdar://%i", v7];
    v30 = +[NSString stringWithFormat:@"livability://%i", v7];
    v28 = +[NSURL URLWithString:v30];
    v27 = +[NSString stringWithFormat:@"Open %@", v29];
    v10 = +[FLFollowUpAction actionWithLabel:v27 url:v28];
    id v11 = objc_alloc_init((Class)FLFollowUpItem);
    [v11 setTitle:@"Battery Life Issue Detected"];
    v12 = [v4 objectForKeyedSubscript:@"driMessage"];
    v13 = [v12 stringValue];
    v14 = [@"[Internal] " stringByAppendingString:v13];
    [v11 setInformativeText:v14];

    v15 = +[NSArray arrayWithObject:v10];
    [v11 setActions:v15];

    v16 = +[PSSpecifier preferenceSpecifierNamed:&stru_C3A18 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
    id v17 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"URSA_ISSUE_HEADER_SPECIFIER_%d", v7);
    [v16 setIdentifier:v17];

    [v16 setProperty:objc_opt_class() forKey:PSCellClassKey];
    uint64_t v18 = FLFollowUpSingleItemKey;
    [v16 setProperty:v11 forKey:FLFollowUpSingleItemKey];
    header = v5->_header;
    v5->_header = (PSSpecifier *)v16;
    id v20 = v16;

    v21 = [v10 label];
    v22 = +[PSSpecifier preferenceSpecifierNamed:v21 target:v5 set:0 get:0 detail:0 cell:13 edit:0];

    id v23 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"URSA_ISSUE_ACTION_SPECIFIER_%d", v7);
    [v22 setIdentifier:v23];

    [v22 setProperty:v10 forKey:FLFollowUpSingleActionKey];
    [v22 setProperty:v11 forKey:v18];
    [v22 setButtonAction:"handleUrsaIssueSpecifierAction:"];
    [v22 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    v24 = +[NSNumber numberWithInt:v7];
    [v22 setProperty:v24 forKey:@"com.apple.perfpowerservices.ursa.radar"];

    info = v5->_info;
    v5->_info = (PSSpecifier *)v22;
  }
  return v5;
}

- (id)getSuggestionIdentifier
{
  return [(PSSpecifier *)self->_info identifier];
}

- (int)getSuggestionType
{
  return 11;
}

- (id)getSuggestionHeaderSpecifier
{
  return self->_header;
}

- (id)getSuggestionInfoSpecifier
{
  return self->_info;
}

- (void)handleUrsaIssueSpecifierAction:(id)a3
{
  uint64_t v3 = FLFollowUpSingleItemKey;
  id v4 = a3;
  v5 = [v4 propertyForKey:v3];
  v6 = [v4 propertyForKey:FLFollowUpSingleActionKey];
  v14[0] = @"BUI";
  v13[0] = @"source";
  v13[1] = @"radar";
  id v7 = [v4 objectForKeyedSubscript:@"com.apple.perfpowerservices.ursa.radar"];

  v13[2] = @"action";
  v14[1] = v7;
  v14[2] = @"tapped";
  v8 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

  v9 = +[FLFollowUpActionHandler handlerWithItem:v5];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_36F68;
  v11[3] = &unk_BF498;
  id v12 = v8;
  id v10 = v8;
  [v9 handleAction:v6 completion:v11];
  PLLogRegisteredEvent();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);

  objc_storeStrong((id *)&self->_header, 0);
}

@end