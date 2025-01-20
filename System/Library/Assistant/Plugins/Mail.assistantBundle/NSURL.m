@interface NSURL
+ (id)mf_URLForMessageLibraryID:(id)a3 externalID:(id)a4;
+ (id)mf_fileURLInTempAppendingTimestampedPathComponent:(id)a3 withExtension:(id)a4;
- (BOOL)mf_isDocumentURL;
- (BOOL)mf_isInternallyHandleable;
- (BOOL)mf_isOAuthRedirectURL;
- (id)mf_conversationCriterion;
- (id)mf_messageCriterion;
@end

@implementation NSURL

+ (id)mf_URLForMessageLibraryID:(id)a3 externalID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSURLComponents);
  [v7 setScheme:EMAppleMailURLScheme];
  [v7 setHost:@"message"];
  v8 = +[NSString stringWithFormat:@"/%@", v5];
  [v7 setPath:v8];

  if (v6)
  {
    v9 = +[NSURLQueryItem queryItemWithName:@"uuid" value:v6];
    v13 = v9;
    v10 = +[NSArray arrayWithObjects:&v13 count:1];
    [v7 setQueryItems:v10];
  }
  v11 = [v7 URL];

  return v11;
}

+ (id)mf_fileURLInTempAppendingTimestampedPathComponent:(id)a3 withExtension:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = NSTemporaryDirectory();
  v8 = +[NSURL fileURLWithPath:v7];
  v9 = objc_msgSend(v8, "ef_URLByAppendingTimestampedPathComponent:withExtension:", v5, v6);

  return v9;
}

- (BOOL)mf_isInternallyHandleable
{
  v3 = [(NSURL *)self scheme];
  if ([v3 caseInsensitiveCompare:EMMailToURLScheme]
    && [v3 caseInsensitiveCompare:EMAppleMailReplyURLScheme]
    && [v3 caseInsensitiveCompare:EMAppleMailForwardURLScheme]
    && [v3 caseInsensitiveCompare:EMMessageIDURLScheme]
    && [v3 caseInsensitiveCompare:EMAppleMailHandoffPayloadURLScheme]
    && [v3 caseInsensitiveCompare:EMAppleMailShowVIPMessagesURLScheme]
    && [v3 caseInsensitiveCompare:EMAppleMailShowVIPSettingsURLScheme])
  {
    v4 = [(NSURL *)self searchResultIdentifier];
    char v5 = v4 == 0;
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (BOOL)mf_isDocumentURL
{
  if (![(NSURL *)self ef_hasScheme:EMAppleMailURLScheme]
    || ![(NSURL *)self ef_hasHost:@"document"])
  {
    return 0;
  }
  v3 = [(NSURL *)self pathComponents];
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (BOOL)mf_isOAuthRedirectURL
{
  if (qword_111E0 != -1) {
    dispatch_once(&qword_111E0, &stru_C458);
  }
  v3 = (void *)qword_111D8;
  BOOL v4 = [(NSURL *)self scheme];
  LOBYTE(v3) = objc_msgSend(v3, "ef_caseInsensitiveIsEqualToString:", v4);

  return (char)v3;
}

- (id)mf_messageCriterion
{
  v3 = [(NSURL *)self em_internalMessageID];
  if (v3)
  {
    id v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%lld", objc_msgSend(v3, "databaseID"));
    char v5 = +[MFMessageCriterion criterionForLibraryID:v4];
    id v6 = [v3 externalID];
    if (v6)
    {
      id v7 = [objc_alloc((Class)MFMessageCriterion) initWithType:36 qualifier:3 expression:v6];
      v13[0] = v5;
      v13[1] = v7;
      v8 = +[NSArray arrayWithObjects:v13 count:2];
      id v9 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v8];
    }
    else
    {
      id v9 = v5;
    }

    goto LABEL_13;
  }
  v10 = [(NSURL *)self em_messageIDHeader];
  if (v10)
  {
    id v9 = [objc_alloc((Class)MFMessageCriterion) initWithType:1 qualifier:3 expression:v10];
    [v9 setCriterionIdentifier:ECMessageHeaderKeyMessageID];
LABEL_12:

    goto LABEL_13;
  }
  if (![(NSURL *)self mf_isDocumentURL])
  {
    id v9 = 0;
    goto LABEL_12;
  }
  v11 = [(NSURL *)self lastPathComponent];
  if (v11)
  {
    id v9 = +[MFMessageCriterion criterionForDocumentID:v11];

    goto LABEL_12;
  }
  id v9 = 0;
LABEL_13:

  return v9;
}

- (id)mf_conversationCriterion
{
  if ([(NSURL *)self ef_hasScheme:EMAppleMailURLScheme]
    && [(NSURL *)self ef_hasHost:@"conversation"])
  {
    v3 = [(NSURL *)self pathComponents];
    if ([v3 count] == (char *)&dword_0 + 2)
    {
      id v4 = [v3 lastObject];
      id v5 = [objc_alloc((Class)MFMessageCriterion) initWithType:34 qualifier:3 expression:v4];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end