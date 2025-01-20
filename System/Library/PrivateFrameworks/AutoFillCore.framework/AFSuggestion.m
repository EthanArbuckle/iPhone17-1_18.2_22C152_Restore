@interface AFSuggestion
- (AFSuggestion)initWithTitle:(id)a3 applicationKey:(id)a4 applicationBundleId:(id)a5 altDSID:(id)a6 customInfoType:(unint64_t)a7;
- (AFSuggestion)initWithTitle:(id)a3 subTitle:(id)a4 creditCardPayload:(id)a5 customInfoType:(unint64_t)a6;
- (AFSuggestion)initWithTitle:(id)a3 subTitle:(id)a4 usernameAndPasswordPayload:(id)a5 creditCardPayload:(id)a6 oneTimeCodePayload:(id)a7 leadingImage:(CGImage *)a8 trailingImage:(CGImage *)a9 applicationKey:(id)a10 applicationBundleId:(id)a11 altDSID:(id)a12 customInfoType:(unint64_t)a13;
- (AFSuggestion)initWithTitle:(id)a3 subTitle:(id)a4 usernameAndPasswordPayload:(id)a5 leadingImage:(CGImage *)a6 trailingImage:(CGImage *)a7 applicationKey:(id)a8 applicationBundleId:(id)a9 altDSID:(id)a10 customInfoType:(unint64_t)a11;
- (AFSuggestion)initWithTitle:(id)a3 subTitle:(id)a4 usernameAndPasswordPayload:(id)a5 leadingImage:(CGImage *)a6 trailingImage:(CGImage *)a7 customInfoType:(unint64_t)a8;
- (AFSuggestion)initWithTitle:(id)a3 subtitle:(id)a4 oneTimeCodePayload:(id)a5 customInfoType:(unint64_t)a6;
- (CGImage)leadingImage;
- (CGImage)trailingImage;
- (NSDictionary)creditCardPayload;
- (NSDictionary)oneTimeCodePayload;
- (NSDictionary)usernameAndPasswordPayload;
- (NSString)altDSID;
- (NSString)applicationBundleId;
- (NSString)applicationKey;
- (NSString)subTitle;
- (NSString)title;
- (unint64_t)customInfoType;
@end

@implementation AFSuggestion

- (AFSuggestion)initWithTitle:(id)a3 subTitle:(id)a4 usernameAndPasswordPayload:(id)a5 creditCardPayload:(id)a6 oneTimeCodePayload:(id)a7 leadingImage:(CGImage *)a8 trailingImage:(CGImage *)a9 applicationKey:(id)a10 applicationBundleId:(id)a11 altDSID:(id)a12 customInfoType:(unint64_t)a13
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  v45.receiver = self;
  v45.super_class = (Class)AFSuggestion;
  v26 = [(AFSuggestion *)&v45 init];
  if (v26)
  {
    uint64_t v27 = [v18 copy];
    title = v26->_title;
    v26->_title = (NSString *)v27;

    uint64_t v29 = [v19 copy];
    subTitle = v26->_subTitle;
    v26->_subTitle = (NSString *)v29;

    uint64_t v31 = [v20 copy];
    usernameAndPasswordPayload = v26->_usernameAndPasswordPayload;
    v26->_usernameAndPasswordPayload = (NSDictionary *)v31;

    uint64_t v33 = [v21 copy];
    creditCardPayload = v26->_creditCardPayload;
    v26->_creditCardPayload = (NSDictionary *)v33;

    uint64_t v35 = [v22 copy];
    oneTimeCodePayload = v26->_oneTimeCodePayload;
    v26->_oneTimeCodePayload = (NSDictionary *)v35;

    v26->_leadingImage = a8;
    v26->_trailingImage = a9;
    uint64_t v37 = [v23 copy];
    applicationKey = v26->_applicationKey;
    v26->_applicationKey = (NSString *)v37;

    uint64_t v39 = [v24 copy];
    applicationBundleId = v26->_applicationBundleId;
    v26->_applicationBundleId = (NSString *)v39;

    uint64_t v41 = [v25 copy];
    altDSID = v26->_altDSID;
    v26->_altDSID = (NSString *)v41;

    v26->_customInfoType = a13;
  }

  return v26;
}

- (AFSuggestion)initWithTitle:(id)a3 subTitle:(id)a4 usernameAndPasswordPayload:(id)a5 leadingImage:(CGImage *)a6 trailingImage:(CGImage *)a7 applicationKey:(id)a8 applicationBundleId:(id)a9 altDSID:(id)a10 customInfoType:(unint64_t)a11
{
  return [(AFSuggestion *)self initWithTitle:a3 subTitle:a4 usernameAndPasswordPayload:a5 creditCardPayload:0 oneTimeCodePayload:0 leadingImage:a6 trailingImage:a7 applicationKey:a8 applicationBundleId:a9 altDSID:a10 customInfoType:a11];
}

- (AFSuggestion)initWithTitle:(id)a3 subTitle:(id)a4 usernameAndPasswordPayload:(id)a5 leadingImage:(CGImage *)a6 trailingImage:(CGImage *)a7 customInfoType:(unint64_t)a8
{
  return [(AFSuggestion *)self initWithTitle:a3 subTitle:a4 usernameAndPasswordPayload:a5 creditCardPayload:0 oneTimeCodePayload:0 leadingImage:a6 trailingImage:a7 applicationKey:0 applicationBundleId:0 altDSID:0 customInfoType:a8];
}

- (AFSuggestion)initWithTitle:(id)a3 applicationKey:(id)a4 applicationBundleId:(id)a5 altDSID:(id)a6 customInfoType:(unint64_t)a7
{
  return [(AFSuggestion *)self initWithTitle:a3 subTitle:0 usernameAndPasswordPayload:0 creditCardPayload:0 oneTimeCodePayload:0 leadingImage:0 trailingImage:0 applicationKey:a4 applicationBundleId:a5 altDSID:a6 customInfoType:a7];
}

- (AFSuggestion)initWithTitle:(id)a3 subTitle:(id)a4 creditCardPayload:(id)a5 customInfoType:(unint64_t)a6
{
  return [(AFSuggestion *)self initWithTitle:a3 subTitle:a4 usernameAndPasswordPayload:0 creditCardPayload:a5 oneTimeCodePayload:0 leadingImage:0 trailingImage:0 applicationKey:0 applicationBundleId:0 altDSID:0 customInfoType:a6];
}

- (AFSuggestion)initWithTitle:(id)a3 subtitle:(id)a4 oneTimeCodePayload:(id)a5 customInfoType:(unint64_t)a6
{
  return [(AFSuggestion *)self initWithTitle:a3 subTitle:a4 usernameAndPasswordPayload:0 creditCardPayload:0 oneTimeCodePayload:a5 leadingImage:0 trailingImage:0 applicationKey:0 applicationBundleId:0 altDSID:0 customInfoType:a6];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (NSDictionary)usernameAndPasswordPayload
{
  return self->_usernameAndPasswordPayload;
}

- (NSDictionary)creditCardPayload
{
  return self->_creditCardPayload;
}

- (NSDictionary)oneTimeCodePayload
{
  return self->_oneTimeCodePayload;
}

- (CGImage)leadingImage
{
  return self->_leadingImage;
}

- (CGImage)trailingImage
{
  return self->_trailingImage;
}

- (unint64_t)customInfoType
{
  return self->_customInfoType;
}

- (NSString)applicationKey
{
  return self->_applicationKey;
}

- (NSString)applicationBundleId
{
  return self->_applicationBundleId;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_applicationBundleId, 0);
  objc_storeStrong((id *)&self->_applicationKey, 0);
  objc_storeStrong((id *)&self->_oneTimeCodePayload, 0);
  objc_storeStrong((id *)&self->_creditCardPayload, 0);
  objc_storeStrong((id *)&self->_usernameAndPasswordPayload, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end