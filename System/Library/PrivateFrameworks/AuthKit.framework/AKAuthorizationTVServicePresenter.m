@interface AKAuthorizationTVServicePresenter
- (id)_filterDeprecatedType:(id)a3;
- (id)_stringForType:(int64_t)a3;
- (id)buildDidStartServerAuthorizationMessage;
- (id)buildDidTapNotificationMessage;
- (id)buildFetchAppIconMessage;
- (id)buildFetchAppIconReplyWithImageData:(id)a3 imageScale:(id)a4;
- (int64_t)_typeFromString:(id)a3;
- (int64_t)typeOfMessage:(id)a3;
@end

@implementation AKAuthorizationTVServicePresenter

- (int64_t)typeOfMessage:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"type"];
  int64_t v5 = [(AKAuthorizationTVServicePresenter *)self _typeFromString:v4];

  return v5;
}

- (id)buildDidTapNotificationMessage
{
  v6[1] = *MEMORY[0x1E4F143B8];
  int64_t v5 = @"type";
  v2 = [(AKAuthorizationTVServicePresenter *)self _stringForType:1];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)buildDidStartServerAuthorizationMessage
{
  v6[1] = *MEMORY[0x1E4F143B8];
  int64_t v5 = @"type";
  v2 = [(AKAuthorizationTVServicePresenter *)self _stringForType:2];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)buildFetchAppIconMessage
{
  v6[1] = *MEMORY[0x1E4F143B8];
  int64_t v5 = @"type";
  v2 = [(AKAuthorizationTVServicePresenter *)self _stringForType:3];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)buildFetchAppIconReplyWithImageData:(id)a3 imageScale:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v13 = @"type";
  v8 = [(AKAuthorizationTVServicePresenter *)self _stringForType:4];
  v14[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v10 = (void *)[v9 mutableCopy];

  if (v6 && v7)
  {
    [v10 setObject:v6 forKeyedSubscript:@"IconData"];
    [v10 setObject:v7 forKeyedSubscript:@"IconScale"];
  }
  v11 = (void *)[v10 copy];

  return v11;
}

- (int64_t)_typeFromString:(id)a3
{
  v3 = [(AKAuthorizationTVServicePresenter *)self _filterDeprecatedType:a3];
  if ([v3 isEqualToString:@"DidTapNotification"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"DidStartServerAuthorization"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"FetchAppIcon"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"FetchAppIconReply"])
  {
    int64_t v4 = 4;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)_stringForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"Unknown";
  }
  else {
    return off_1E575F748[a3 - 1];
  }
}

- (id)_filterDeprecatedType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"StartProgressAnimation"]) {
    int64_t v4 = @"DidTapNotification";
  }
  else {
    int64_t v4 = (__CFString *)v3;
  }

  return v4;
}

@end