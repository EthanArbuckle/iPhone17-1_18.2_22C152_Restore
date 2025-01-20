@interface EMListUnsubscribeDetector
+ (id)receivingAccountFromMessage:(id)a3;
+ (id)validatedUnsubscribeTypeForHeader:(id)a3;
+ (int64_t)unsubscribeTypeForHeader:(id)a3;
+ (uint64_t)_validateHeaders:(uint64_t)a1;
- (BOOL)shouldIgnoreMessageWithHeaders:(id)a3;
- (EMListUnsubscribeDetector)init;
- (EMListUnsubscribeDetector)initWithMutableDictionary:(id)a3;
- (id)_listIDString:(id)a3;
- (id)_normalizedAddress:(id)a3;
- (id)_persistentKeyForHeaders:(id)a3;
- (id)_senderString:(id)a3;
- (id)commandForMessage:(id)a3;
- (id)commandForMessage:(id)a3 mailToOnly:(BOOL)a4;
- (void)acceptCommand:(id)a3;
- (void)ignoreCommand:(id)a3;
- (void)removeAllPersistedCommands;
@end

@implementation EMListUnsubscribeDetector

+ (uint64_t)_validateHeaders:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v17 = a2;
  self;
  v2 = [v17 encodedHeaders];
  v3 = EMRecodeDataToNetwork(v2);

  if (v3)
  {
    id v22 = 0;
    id v16 = objc_alloc_init(MEMORY[0x1E4F607F0]);
    v4 = [v16 verificationContextForMessageData:v3 error:&v22];
    id v5 = v22;
    v6 = v5;
    uint64_t v7 = 2;
    if (v4 && !v5)
    {
      [v4 dkimSignatureHeaders];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v19;
        uint64_t v11 = *MEMORY[0x1E4F606D8];
        uint64_t v12 = *MEMORY[0x1E4F606E0];
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v8);
            }
            v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) signedHeaderFields];
            if ([v14 containsObject:v11]
              && ([v14 containsObject:v12] & 1) != 0)
            {

              if ([v16 verifyMessageWithContext:v4 options:1 error:0]) {
                uint64_t v7 = 1;
              }
              else {
                uint64_t v7 = 2;
              }
              goto LABEL_19;
            }
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

      uint64_t v7 = 2;
LABEL_19:
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (int64_t)unsubscribeTypeForHeader:(id)a3
{
  id v3 = a3;
  v4 = [[_EMUnsubscribeInfo alloc] initWithHeaders:v3];
  if (v4)
  {
    postURL = v4->_postURL;
    int64_t v6 = v4->_mailtoURL != 0;
    BOOL v7 = postURL == 0;
    if (postURL) {
      uint64_t v8 = v6 | 2;
    }
    else {
      uint64_t v8 = v4->_mailtoURL != 0;
    }
    if (!v7) {
      v6 |= 6uLL;
    }
    if (v4->_postContent) {
      int64_t v9 = v6;
    }
    else {
      int64_t v9 = v8;
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

+ (id)validatedUnsubscribeTypeForHeader:(id)a3
{
  id v3 = a3;
  v4 = [[_EMUnsubscribeInfo alloc] initWithHeaders:v3];
  id v5 = v4;
  if (!v4) {
    goto LABEL_15;
  }
  postURL = v4->_postURL;
  BOOL v7 = v4->_mailtoURL != 0;
  if (postURL) {
    uint64_t v8 = v7 | 2;
  }
  else {
    uint64_t v8 = v4->_mailtoURL != 0;
  }
  if (!v4->_postContent) {
    goto LABEL_16;
  }
  uint64_t v8 = postURL ? v7 | 6 : v4->_mailtoURL != 0;
  if (!postURL || (v8 & 2) == 0) {
    goto LABEL_16;
  }
  uint64_t v10 = +[EMListUnsubscribeDetector _validateHeaders:]((uint64_t)EMListUnsubscribeDetector, v3);
  if (v10)
  {
    if (v10 != 2)
    {
LABEL_16:
      uint64_t v11 = [NSNumber numberWithInteger:v8];
      goto LABEL_17;
    }
LABEL_15:
    uint64_t v8 = 0;
    goto LABEL_16;
  }
  uint64_t v11 = 0;
LABEL_17:

  return v11;
}

- (EMListUnsubscribeDetector)initWithMutableDictionary:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"EMListUnsubscribeDetector.m", 134, @"Invalid parameter not satisfying: %@", @"dictionary" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)EMListUnsubscribeDetector;
  BOOL v7 = [(EMListUnsubscribeDetector *)&v11 init];
  uint64_t v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_persistentDictionary, a3);
  }

  return v8;
}

- (EMListUnsubscribeDetector)init
{
  id v3 = +[EMUbiquitouslyPersistedDictionary sharedDictionaryWithIdentifier:@"com.apple.mail.listUnsubscribeInfo"];
  v4 = [(EMListUnsubscribeDetector *)self initWithMutableDictionary:v3];

  return v4;
}

- (id)commandForMessage:(id)a3 mailToOnly:(BOOL)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [v6 headers];
  if ([(EMListUnsubscribeDetector *)self shouldIgnoreMessageWithHeaders:v7])
  {
    uint64_t v8 = 0;
    goto LABEL_45;
  }
  int64_t v9 = [(id)objc_opt_class() receivingAccountFromMessage:v6];
  uint64_t v10 = [v9 deliveryAccount];

  if (v10)
  {
    if (a4)
    {
      BOOL v11 = 0;
    }
    else
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F60D70];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __58__EMListUnsubscribeDetector_commandForMessage_mailToOnly___block_invoke;
      v43[3] = &unk_1E63E41B0;
      id v44 = v7;
      v13 = [v12 futureWithBlock:v43];
      v14 = [v13 resultWithTimeout:0 error:3.0];
      v15 = v14;
      if (v14)
      {
        BOOL v11 = [v14 integerValue] == 1;
      }
      else
      {
        id v16 = EMLogCategoryMessageLoading();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v17 = (objc_class *)objc_opt_class();
          long long v18 = NSStringFromClass(v17);
          [(EMListUnsubscribeDetector *)v18 commandForMessage:buf mailToOnly:v16];
        }

        BOOL v11 = 0;
      }
    }
    v42 = [v7 firstHeaderForKey:*MEMORY[0x1E4F606D0]];
    long long v19 = [[_EMUnsubscribeInfo alloc] initWithHeaders:v7];
    long long v20 = v19;
    if (v19)
    {
      postContent = v19->_postContent;
      postURL = v19->_postURL;
      mailtoURL = v19->_mailtoURL;
      if (!v11) {
        goto LABEL_30;
      }
    }
    else
    {
      postContent = 0;
      postURL = 0;
      mailtoURL = 0;
      if (!v11) {
        goto LABEL_30;
      }
    }
    if (postContent && postURL)
    {
      uint64_t v24 = [v7 firstSenderAddress];
      if (v20)
      {
        v25 = v20->_postURL;
        v26 = v20->_postContent;
        v27 = v20->_postURL;
        uint64_t v28 = v20->_mailtoURL != 0;
        BOOL v29 = v27 == 0;
        if (v27) {
          uint64_t v30 = v28 | 2;
        }
        else {
          uint64_t v30 = v20->_mailtoURL != 0;
        }
        if (!v29) {
          v28 |= 6uLL;
        }
        if (v20->_postContent) {
          uint64_t v31 = v28;
        }
        else {
          uint64_t v31 = v30;
        }
      }
      else
      {
        v26 = 0;
        v25 = 0;
        uint64_t v31 = 0;
      }
      uint64_t v8 = +[EMListUnsubscribeCommand oneClickUnsubscribeCommandWithListID:v42 sender:v24 URL:v25 postContent:v26 headerUnsubscribeTypes:v31];
      goto LABEL_41;
    }
LABEL_30:
    if (!mailtoURL)
    {
      uint64_t v8 = 0;
      goto LABEL_43;
    }
    if (v19) {
      v32 = v19->_mailtoURL;
    }
    else {
      v32 = 0;
    }
    uint64_t v24 = +[EMMailToURLComponents componentsWithURL:v32];
    v33 = [v24 toRecipients];
    BOOL v34 = [v33 count] == 0;

    if (v34)
    {
      uint64_t v8 = 0;
      goto LABEL_42;
    }
    v25 = [v24 toRecipients];
    v26 = [(NSURL *)v25 objectAtIndexedSubscript:0];
    v41 = [v7 firstSenderAddress];
    v35 = [v24 subject];
    v36 = [v24 body];
    if (v20)
    {
      v37 = v20->_postURL;
      BOOL v38 = v20->_mailtoURL != 0;
      uint64_t v39 = v38 | 2;
      if (!v37) {
        uint64_t v39 = v20->_mailtoURL != 0;
      }
      if (v20->_postContent)
      {
        uint64_t v39 = v38 | 6;
        if (!v37) {
          uint64_t v39 = v20->_mailtoURL != 0;
        }
      }
    }
    else
    {
      uint64_t v39 = 0;
    }
    uint64_t v8 = +[EMListUnsubscribeCommand mailtoUnsubscribeCommandWithListID:v42 address:v26 sender:v41 subject:v35 body:v36 account:v9 headerUnsubscribeTypes:v39];

LABEL_41:
LABEL_42:

LABEL_43:
    goto LABEL_44;
  }
  uint64_t v8 = 0;
LABEL_44:

LABEL_45:
  return v8;
}

uint64_t __58__EMListUnsubscribeDetector_commandForMessage_mailToOnly___block_invoke(uint64_t a1)
{
  v1 = NSNumber;
  uint64_t v2 = +[EMListUnsubscribeDetector _validateHeaders:]((uint64_t)EMListUnsubscribeDetector, *(void **)(a1 + 32));
  return [v1 numberWithInteger:v2];
}

- (id)commandForMessage:(id)a3
{
  id v3 = [(EMListUnsubscribeDetector *)self commandForMessage:a3 mailToOnly:0];
  return v3;
}

- (void)acceptCommand:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"EMListUnsubscribeDetector.m", 199, @"Invalid parameter not satisfying: %@", @"command" object file lineNumber description];

    id v5 = 0;
  }
  id v6 = [(EMListUnsubscribeDetector *)self _persistentKeyForHeaders:v5];
  if (v6) {
    [(EMMutableDictionaryProtocol *)self->_persistentDictionary setObject:@"accepted" forKey:v6];
  }
}

- (void)ignoreCommand:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"EMListUnsubscribeDetector.m", 207, @"Invalid parameter not satisfying: %@", @"command" object file lineNumber description];

    id v5 = 0;
  }
  id v6 = [(EMListUnsubscribeDetector *)self _persistentKeyForHeaders:v5];
  if (v6) {
    [(EMMutableDictionaryProtocol *)self->_persistentDictionary setObject:@"ignored" forKey:v6];
  }
}

- (void)removeAllPersistedCommands
{
}

- (id)_normalizedAddress:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^[^<>]*<([^>]+)>\\s*$|^(.+)$" options:8 error:0];
    id v5 = objc_msgSend(v4, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), @"$1$2");
    id v6 = [v5 lowercaseString];

    BOOL v7 = [MEMORY[0x1E4F605B0] idnaEncodedAddressForAddress:v6];

    if ((unint64_t)[v7 length] > 0x3E)
    {
      id v8 = [v7 substringToIndex:62];
    }
    else
    {
      id v8 = v7;
    }
    int64_t v9 = v8;
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (id)_listIDString:(id)a3
{
  id v3 = NSString;
  v4 = [(EMListUnsubscribeDetector *)self _normalizedAddress:a3];
  id v5 = [v3 stringWithFormat:@"L:%@", v4];

  return v5;
}

- (id)_senderString:(id)a3
{
  id v3 = NSString;
  v4 = [(EMListUnsubscribeDetector *)self _normalizedAddress:a3];
  id v5 = [v3 stringWithFormat:@"S:%@", v4];

  return v5;
}

- (id)_persistentKeyForHeaders:(id)a3
{
  id v4 = a3;
  id v5 = [v4 sender];
  id v6 = [v4 listID];
  if ([v6 length])
  {
    uint64_t v7 = [(EMListUnsubscribeDetector *)self _listIDString:v6];
LABEL_5:
    id v8 = (void *)v7;
    goto LABEL_6;
  }
  if ([v5 length])
  {
    uint64_t v7 = [(EMListUnsubscribeDetector *)self _senderString:v5];
    goto LABEL_5;
  }
  id v8 = 0;
LABEL_6:

  return v8;
}

- (BOOL)shouldIgnoreMessageWithHeaders:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 firstHeaderForKey:*MEMORY[0x1E4F606D0]];
    uint64_t v7 = [(EMListUnsubscribeDetector *)self _listIDString:v6];

    id v8 = [v5 firstSenderAddress];
    int64_t v9 = [(EMListUnsubscribeDetector *)self _senderString:v8];

    uint64_t v10 = [(EMMutableDictionaryProtocol *)self->_persistentDictionary objectForKey:v7];
    if (v10
      || ([(EMMutableDictionaryProtocol *)self->_persistentDictionary objectForKey:v9],
          (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      if ([v10 isEqual:@"accepted"]) {
        char v11 = 1;
      }
      else {
        char v11 = [v10 isEqual:@"ignored"];
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

+ (id)receivingAccountFromMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 account];
  int v5 = [v4 conformsToProtocol:&unk_1F1A86690];

  if (v5)
  {
    id v6 = [v3 account];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (void)commandForMessage:(uint8_t *)buf mailToOnly:(os_log_t)log .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "<%{public}@> Timeout validating headers for: %@", buf, 0x16u);
}

@end