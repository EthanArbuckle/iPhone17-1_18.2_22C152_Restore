@interface GEOWiFiQualityServiceRequester
- (id)_validateResponse:(id)a3;
- (void)cancel;
@end

@implementation GEOWiFiQualityServiceRequester

- (void)cancel
{
}

- (id)_validateResponse:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = 0;
  }
  else
  {
    v5 = +[NSError GEOErrorWithCode:-16 reason:@"server responded with wrong type"];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end