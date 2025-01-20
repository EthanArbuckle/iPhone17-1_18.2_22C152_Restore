@interface _EMUnsubscribeInfo
- (_EMUnsubscribeInfo)initWithHeaders:(id)a3;
- (void)setMailtoURL:(uint64_t)a1;
- (void)setPostContent:(uint64_t)a1;
- (void)setPostURL:(uint64_t)a1;
@end

@implementation _EMUnsubscribeInfo

- (_EMUnsubscribeInfo)initWithHeaders:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (_EMUnsubscribeInfo *)objc_opt_new();
  v5 = [v3 listUnsubscribePostContent];
  -[_EMUnsubscribeInfo setPostContent:]((uint64_t)v4, v5);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = [v3 listUnsubscribeCommands];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(*((void *)&v13 + 1) + 8 * v9)];
        if (objc_msgSend(v10, "ef_hasScheme:", @"mailto"))
        {
          -[_EMUnsubscribeInfo setMailtoURL:]((uint64_t)v4, v10);
        }
        else if (objc_msgSend(v10, "ef_hasScheme:", @"https"))
        {
          -[_EMUnsubscribeInfo setPostURL:]((uint64_t)v4, v10);
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)setPostContent:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setMailtoURL:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (void)setPostURL:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postContent, 0);
  objc_storeStrong((id *)&self->_postURL, 0);
  objc_storeStrong((id *)&self->_mailtoURL, 0);
}

@end