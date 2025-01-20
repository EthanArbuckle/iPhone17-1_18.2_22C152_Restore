@interface RequesterRequest
- (NSDate)date;
- (NSString)description;
- (NSString)itemIdentifier;
- (NSString)offerName;
- (NSString)requestIdentifier;
- (NSString)uniqueIdentifier;
- (RequestLocalizations)localizations;
- (RequesterRequest)initWithDate:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5 itemIdentifier:(id)a6 localizations:(id)a7 offerName:(id)a8 status:(int64_t)a9;
- (RequesterRequest)initWithDictionary:(id)a3;
- (id)compile;
- (int64_t)status;
@end

@implementation RequesterRequest

- (RequesterRequest)initWithDate:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5 itemIdentifier:(id)a6 localizations:(id)a7 offerName:(id)a8 status:(int64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)RequesterRequest;
  v19 = [(RequesterRequest *)&v25 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_date, a3);
    objc_storeStrong((id *)&v20->_requestIdentifier, a4);
    objc_storeStrong((id *)&v20->_uniqueIdentifier, a5);
    objc_storeStrong((id *)&v20->_itemIdentifier, a6);
    objc_storeStrong((id *)&v20->_localizations, a7);
    objc_storeStrong((id *)&v20->_offerName, a8);
    v20->_status = a9;
  }

  return v20;
}

- (RequesterRequest)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"date"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
LABEL_5:
    v7 = v6;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 doubleValue];
    +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v7 = 0;
LABEL_7:

  v8 = [v4 objectForKeyedSubscript:@"identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  v10 = [v4 objectForKeyedSubscript:@"uniqueIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  v12 = [v4 objectForKeyedSubscript:@"itemIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  v14 = [RequestLocalizations alloc];
  v15 = [v4 objectForKeyedSubscript:@"localizations"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }

  id v17 = [(RequestLocalizations *)v14 initWithDictionary:v16];
  id v18 = [v4 objectForKeyedSubscript:@"offerName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }

  v20 = [v4 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v21 = v20;
  }
  else {
    id v21 = 0;
  }

  if (v21) {
    uint64_t v22 = (uint64_t)[v21 integerValue];
  }
  else {
    uint64_t v22 = -2;
  }
  id v23 = 0;
  if (v7 && v9 && v11 && v13 && v17)
  {
    self = [(RequesterRequest *)self initWithDate:v7 requestIdentifier:v9 uniqueIdentifier:v11 itemIdentifier:v13 localizations:v17 offerName:v19 status:v22];
    id v23 = self;
  }

  return v23;
}

- (id)compile
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(RequesterRequest *)self date];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v4, @"date");

  v5 = [(RequesterRequest *)self requestIdentifier];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v5, @"identifier");

  id v6 = [(RequesterRequest *)self uniqueIdentifier];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v6, @"uniqueIdentifier");

  v7 = [(RequesterRequest *)self itemIdentifier];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v7, @"itemIdentifier");

  v8 = [(RequesterRequest *)self localizations];
  id v9 = [v8 compile];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v9, @"localizations");

  v10 = [(RequesterRequest *)self offerName];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v10, @"offerName");

  id v11 = +[NSNumber numberWithInteger:[(RequesterRequest *)self status]];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v11, @"status");

  return v3;
}

- (NSString)description
{
  id v3 = [(RequesterRequest *)self compile];
  id v4 = [(RequesterRequest *)self ap_generateDescriptionWithSubObjects:v3];

  return (NSString *)v4;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (RequestLocalizations)localizations
{
  return self->_localizations;
}

- (NSString)offerName
{
  return self->_offerName;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offerName, 0);
  objc_storeStrong((id *)&self->_localizations, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end