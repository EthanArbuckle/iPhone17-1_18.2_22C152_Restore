@interface ServiceProductPageConfiguration
- (BOOL)isLoadable;
- (BOOL)isParentalRequest;
- (BOOL)showsRightButton;
- (BOOL)showsStoreButton;
- (NSDictionary)productPageDictionary;
- (NSDictionary)productParameters;
- (NSDictionary)scriptContextDictionary;
- (NSString)cancelButtonTitle;
- (NSString)hostApplicationIdentifier;
- (NSString)parentalRequestPromptString;
- (NSString)rightButtonTitle;
- (NSURL)productURL;
- (id)copyITMLOptionsDictionary;
- (int64_t)productPageStyle;
- (void)setCancelButtonTitle:(id)a3;
- (void)setHostApplicationIdentifier:(id)a3;
- (void)setLoadable:(BOOL)a3;
- (void)setParentalRequest:(BOOL)a3;
- (void)setParentalRequestPromptString:(id)a3;
- (void)setProductPageDictionary:(id)a3;
- (void)setProductPageStyle:(int64_t)a3;
- (void)setProductParameters:(id)a3;
- (void)setProductURL:(id)a3;
- (void)setRightButtonTitle:(id)a3;
- (void)setScriptContextDictionary:(id)a3;
- (void)setShowsRightButton:(BOOL)a3;
- (void)setShowsStoreButton:(BOOL)a3;
@end

@implementation ServiceProductPageConfiguration

- (id)copyITMLOptionsDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  if (self->_parentalRequest)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = v4;
    parentalRequestPromptString = self->_parentalRequestPromptString;
    if (parentalRequestPromptString) {
      [v4 setObject:parentalRequestPromptString forKey:@"prompt"];
    }
    [v3 setObject:v5 forKey:@"parentalRequestData"];
  }
  hostApplicationIdentifier = self->_hostApplicationIdentifier;
  if (hostApplicationIdentifier)
  {
    [v3 setObject:hostApplicationIdentifier forKey:@"hostApp"];
    [v3 setObject:self->_hostApplicationIdentifier forKey:kOptionKeyReferrerApp];
  }
  productPageDictionary = self->_productPageDictionary;
  if (productPageDictionary) {
    [v3 setObject:productPageDictionary forKey:@"sidePackData"];
  }
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  v10 = v9;
  if (self->_productParameters) {
    [v9 addEntriesFromDictionary:];
  }
  productURL = self->_productURL;
  if (productURL)
  {
    v12 = [(NSURL *)productURL absoluteString];
    uint64_t v13 = kOptionKeyURL;
    [v10 setObject:v12 forKey:kOptionKeyURL];
    [v3 setObject:v12 forKey:v13];
  }
  int64_t productPageStyle = self->_productPageStyle;
  if (productPageStyle == 3)
  {
    CFStringRef v15 = @"ipad";
  }
  else
  {
    if (productPageStyle != 2) {
      goto LABEL_18;
    }
    CFStringRef v15 = @"iphone";
  }
  [v10 setObject:v15 forKey:@"style"];
LABEL_18:
  if (self->_cancelButtonTitle)
  {
    id v16 = [objc_alloc((Class)NSDictionary) initWithObjectsAndKeys:self->_cancelButtonTitle, @"title", @"cancel", @"type", 0];
    [v10 setObject:v16 forKey:@"cancelButton"];
  }
  if (self->_rightButtonTitle && self->_showsRightButton)
  {
    id v17 = [objc_alloc((Class)NSDictionary) initWithObjectsAndKeys:self->_rightButtonTitle, @"title", @"right", @"type", 0];
    [v10 setObject:v17 forKey:@"okButton"];
  }
  if (self->_showsStoreButton)
  {
    v18 = +[NSNumber numberWithBool:1];
    [v10 setObject:v18 forKey:@"showsStoreButton"];
  }
  [v3 setObject:v10 forKey:@"storeSheet"];

  return v3;
}

- (BOOL)isLoadable
{
  return self->_productPageDictionary || self->_productParameters || self->_productURL != 0;
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (void)setCancelButtonTitle:(id)a3
{
}

- (NSString)hostApplicationIdentifier
{
  return self->_hostApplicationIdentifier;
}

- (void)setHostApplicationIdentifier:(id)a3
{
}

- (BOOL)isParentalRequest
{
  return self->_parentalRequest;
}

- (void)setParentalRequest:(BOOL)a3
{
  self->_parentalRequest = a3;
}

- (NSString)parentalRequestPromptString
{
  return self->_parentalRequestPromptString;
}

- (void)setParentalRequestPromptString:(id)a3
{
}

- (NSDictionary)productPageDictionary
{
  return self->_productPageDictionary;
}

- (void)setProductPageDictionary:(id)a3
{
}

- (int64_t)productPageStyle
{
  return self->_productPageStyle;
}

- (void)setProductPageStyle:(int64_t)a3
{
  self->_int64_t productPageStyle = a3;
}

- (NSDictionary)productParameters
{
  return self->_productParameters;
}

- (void)setProductParameters:(id)a3
{
}

- (NSURL)productURL
{
  return self->_productURL;
}

- (void)setProductURL:(id)a3
{
}

- (NSString)rightButtonTitle
{
  return self->_rightButtonTitle;
}

- (void)setRightButtonTitle:(id)a3
{
}

- (NSDictionary)scriptContextDictionary
{
  return self->_scriptContextDictionary;
}

- (void)setScriptContextDictionary:(id)a3
{
}

- (BOOL)showsRightButton
{
  return self->_showsRightButton;
}

- (void)setShowsRightButton:(BOOL)a3
{
  self->_showsRightButton = a3;
}

- (BOOL)showsStoreButton
{
  return self->_showsStoreButton;
}

- (void)setShowsStoreButton:(BOOL)a3
{
  self->_showsStoreButton = a3;
}

- (void)setLoadable:(BOOL)a3
{
  self->_loadable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scriptContextDictionary, 0);
  objc_storeStrong((id *)&self->_rightButtonTitle, 0);
  objc_storeStrong((id *)&self->_productURL, 0);
  objc_storeStrong((id *)&self->_productParameters, 0);
  objc_storeStrong((id *)&self->_productPageDictionary, 0);
  objc_storeStrong((id *)&self->_parentalRequestPromptString, 0);
  objc_storeStrong((id *)&self->_hostApplicationIdentifier, 0);

  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
}

@end