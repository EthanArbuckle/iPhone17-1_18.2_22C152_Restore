@interface Request
- (BOOL)isMocked;
- (NSDate)date;
- (NSDictionary)requestInfo;
- (NSString)description;
- (NSString)itemBundleIdentifier;
- (NSString)itemIdentifier;
- (NSString)offerName;
- (NSString)productType;
- (NSString)productTypeName;
- (NSString)requestIdentifier;
- (NSString)uniqueIdentifier;
- (NSURL)previewURL;
- (NSURL)productURL;
- (Request)initWithDate:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5 itemBundleIdentifier:(id)a6 itemIdentifier:(id)a7 localizations:(id)a8 mocked:(BOOL)a9 offerName:(id)a10 previewURL:(id)a11 productType:(id)a12 productTypeName:(id)a13 productURL:(id)a14 requestInfo:(id)a15 status:(int64_t)a16;
- (Request)initWithDictionary:(id)a3;
- (RequestLocalizations)localizations;
- (id)compile;
- (int64_t)status;
@end

@implementation Request

- (Request)initWithDate:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5 itemBundleIdentifier:(id)a6 itemIdentifier:(id)a7 localizations:(id)a8 mocked:(BOOL)a9 offerName:(id)a10 previewURL:(id)a11 productType:(id)a12 productTypeName:(id)a13 productURL:(id)a14 requestInfo:(id)a15 status:(int64_t)a16
{
  id v41 = a3;
  id v32 = a4;
  id v39 = a4;
  id v33 = a5;
  id v37 = a5;
  id v34 = a6;
  id v21 = a6;
  id v35 = a7;
  id v22 = a7;
  id v40 = a8;
  id v38 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  id v26 = a14;
  id v27 = a15;
  v42.receiver = self;
  v42.super_class = (Class)Request;
  v28 = [(Request *)&v42 init];
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_date, a3);
    objc_storeStrong((id *)&v29->_requestIdentifier, v32);
    objc_storeStrong((id *)&v29->_uniqueIdentifier, v33);
    objc_storeStrong((id *)&v29->_itemBundleIdentifier, v34);
    objc_storeStrong((id *)&v29->_itemIdentifier, v35);
    objc_storeStrong((id *)&v29->_localizations, a8);
    v29->_mocked = a9;
    objc_storeStrong((id *)&v29->_offerName, a10);
    objc_storeStrong((id *)&v29->_previewURL, a11);
    objc_storeStrong((id *)&v29->_productType, a12);
    objc_storeStrong((id *)&v29->_productTypeName, a13);
    objc_storeStrong((id *)&v29->_productURL, a14);
    objc_storeStrong((id *)&v29->_requestInfo, a15);
    v29->_status = a16;
  }

  return v29;
}

- (Request)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"date"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
LABEL_5:
    v56 = v6;
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
  v56 = 0;
LABEL_7:

  v7 = [v4 objectForKeyedSubscript:@"identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v55 = v7;
  }
  else {
    id v55 = 0;
  }

  v8 = [v4 objectForKeyedSubscript:@"uniqueIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v51 = v8;
  }
  else {
    id v51 = 0;
  }

  v9 = [v4 objectForKeyedSubscript:@"itemIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  v11 = [v4 objectForKeyedSubscript:@"itemBundleIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v48 = v12;

  v13 = [RequestLocalizations alloc];
  v14 = [v4 objectForKeyedSubscript:@"localizations"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }

  v50 = [(RequestLocalizations *)v13 initWithDictionary:v15];
  v16 = [v4 objectForKeyedSubscript:@"mocked"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }

  unsigned __int8 v45 = [v17 BOOLValue];
  v18 = [v4 objectForKeyedSubscript:@"offerName"];
  objc_opt_class();
  v54 = self;
  if (objc_opt_isKindOfClass()) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }

  v20 = [v4 objectForKeyedSubscript:@"previewURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = v20;
LABEL_32:
    id v22 = v21;
    goto LABEL_34;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = +[NSURL URLWithString:v20];
    goto LABEL_32;
  }
  id v22 = 0;
LABEL_34:

  id v23 = [v4 objectForKeyedSubscript:@"productType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v24 = v23;
  }
  else {
    id v24 = 0;
  }

  id v25 = [v4 objectForKeyedSubscript:@"productTypeName"];
  objc_opt_class();
  id v47 = v19;
  if (objc_opt_isKindOfClass()) {
    id v26 = v25;
  }
  else {
    id v26 = 0;
  }

  id v27 = [v4 objectForKeyedSubscript:@"productURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v28 = v27;
LABEL_44:
    v29 = v28;
    goto LABEL_46;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v28 = +[NSURL URLWithString:v27];
    goto LABEL_44;
  }
  v29 = 0;
LABEL_46:

  v30 = [v4 objectForKeyedSubscript:@"requestInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v31 = v30;
  }
  else {
    id v31 = 0;
  }

  id v32 = [v4 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v33 = v32;
  }
  else {
    id v33 = 0;
  }
  id v46 = v24;

  if (v33) {
    uint64_t v34 = (uint64_t)[v33 integerValue];
  }
  else {
    uint64_t v34 = -2;
  }
  id v35 = v51;
  id v36 = v22;
  id v37 = v26;
  v53 = v4;
  v49 = v22;
  if (v56 && v55 && v51 && v10 && v50)
  {
    id v39 = v31;
    id v38 = v46;
    id v40 = v47;
    LOBYTE(v44) = v45;
    id v41 = v48;
    objc_super v42 = v37;
    v54 = [(Request *)v54 initWithDate:v56 requestIdentifier:v55 uniqueIdentifier:v51 itemBundleIdentifier:v48 itemIdentifier:v10 localizations:v50 mocked:v44 offerName:v47 previewURL:v36 productType:v46 productTypeName:v37 productURL:v29 requestInfo:v31 status:v34];
    v52 = v54;
  }
  else
  {
    id v40 = v47;
    id v41 = v48;
    id v39 = v31;
    id v38 = v46;
    objc_super v42 = v37;
    v52 = 0;
  }

  return v52;
}

- (id)compile
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(Request *)self date];
  [v3 ap_setNullableObject:v4 forKey:@"date"];

  v5 = [(Request *)self requestIdentifier];
  [v3 ap_setNullableObject:v5 forKey:@"identifier"];

  id v6 = [(Request *)self uniqueIdentifier];
  [v3 ap_setNullableObject:v6 forKey:@"uniqueIdentifier"];

  v7 = [(Request *)self itemBundleIdentifier];
  [v3 ap_setNullableObject:v7 forKey:@"itemBundleIdentifier"];

  v8 = [(Request *)self itemIdentifier];
  [v3 ap_setNullableObject:v8 forKey:@"itemIdentifier"];

  v9 = [(Request *)self localizations];
  id v10 = [v9 compile];
  [v3 ap_setNullableObject:v10 forKey:@"localizations"];

  v11 = +[NSNumber numberWithBool:[(Request *)self isMocked]];
  [v3 ap_setNullableObject:v11 forKey:@"mocked"];

  id v12 = [(Request *)self offerName];
  [v3 ap_setNullableObject:v12 forKey:@"offerName"];

  v13 = [(Request *)self previewURL];
  v14 = [v13 absoluteString];
  [v3 ap_setNullableObject:v14 forKey:@"previewURL"];

  id v15 = [(Request *)self productType];
  [v3 ap_setNullableObject:v15 forKey:@"productType"];

  v16 = [(Request *)self productTypeName];
  [v3 ap_setNullableObject:v16 forKey:@"productTypeName"];

  id v17 = [(Request *)self productURL];
  v18 = [v17 absoluteString];
  [v3 ap_setNullableObject:v18 forKey:@"productURL"];

  id v19 = [(Request *)self requestInfo];
  [v3 ap_setNullableObject:v19 forKey:@"requestInfo"];

  v20 = +[NSNumber numberWithInteger:[(Request *)self status]];
  [v3 ap_setNullableObject:v20 forKey:@"status"];

  return v3;
}

- (NSString)description
{
  id v3 = [(Request *)self compile];
  id v4 = [(Request *)self ap_generateDescriptionWithSubObjects:v3];

  return (NSString *)v4;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSString)itemBundleIdentifier
{
  return self->_itemBundleIdentifier;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (RequestLocalizations)localizations
{
  return self->_localizations;
}

- (BOOL)isMocked
{
  return self->_mocked;
}

- (NSString)offerName
{
  return self->_offerName;
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)productTypeName
{
  return self->_productTypeName;
}

- (NSURL)productURL
{
  return self->_productURL;
}

- (NSDictionary)requestInfo
{
  return self->_requestInfo;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_productURL, 0);
  objc_storeStrong((id *)&self->_productTypeName, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_previewURL, 0);
  objc_storeStrong((id *)&self->_offerName, 0);
  objc_storeStrong((id *)&self->_localizations, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_itemBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end