@interface MFPlaceholderMessageRewriter
+ (id)_deriveOutgoingMessageContentFromLibraryMessageContent:(id)a3;
- (MFMessageRewriterPlaceholderResolver)placeholderResolver;
- (MFOutgoingMessageContent)originalMessageContent;
- (MFPlaceholderMessageRewriter)init;
- (MFPlaceholderMessageRewriter)initWithOriginalMessageContent:(id)a3 resolver:(id)a4;
- (id)accountProxyGenerator;
- (id)attachments;
- (id)bccRecipients;
- (id)ccRecipients;
- (id)composeWebView;
- (id)rewrittenMessageContent;
- (id)savedHeaders;
- (id)sendingAccountProxy;
- (id)sendingEmailAddress;
- (id)shouldCreateRichTextRepresentation;
- (id)subject;
- (id)toRecipients;
- (void)setPlaceholderResolver:(id)a3;
@end

@implementation MFPlaceholderMessageRewriter

- (MFPlaceholderMessageRewriter)init
{
  return [(MFPlaceholderMessageRewriter *)self initWithOriginalMessageContent:0 resolver:0];
}

- (MFPlaceholderMessageRewriter)initWithOriginalMessageContent:(id)a3 resolver:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFPlaceholderMessageRewriter;
  v9 = [(MFPlaceholderMessageRewriter *)&v13 init];
  if (v9)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    placeholders = v9->_placeholders;
    v9->_placeholders = v10;

    objc_storeStrong((id *)&v9->_originalMessageContent, a3);
    objc_storeWeak((id *)&v9->_placeholderResolver, v8);
  }

  return v9;
}

+ (id)_deriveOutgoingMessageContentFromLibraryMessageContent:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  v3 = [v39 libraryMessage];

  if (!v3)
  {
    id v40 = 0;
    goto LABEL_47;
  }
  v36 = [v39 libraryMessage];
  v38 = [v36 messageBody];
  v4 = [v38 preferredBodyPart];
  v5 = v4;
  v37 = v4;
  if (v4)
  {
    v35 = [v4 contentToOffset:1 resultOffset:0 asHTML:1];
    v6 = [v5 type];
    if ([v6 isEqualToString:@"multipart"])
    {
      id v7 = [v37 subtype];
      int v8 = [v7 isEqualToString:@"related"];

      if (v8)
      {
        v9 = [MEMORY[0x1E4F1CA48] array];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v10 = v35;
        v11 = 0;
        uint64_t v12 = [v10 countByEnumeratingWithState:&v45 objects:v50 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v46 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v16 = v15;
                v17 = [v16 htmlData];
                if (v17)
                {
                  [v16 preferredEncoding];
                  uint64_t v18 = MFCreateStringWithData();

                  v11 = (void *)v18;
                }
                v19 = [v16 attachmentsInDocument];
                [v9 addObjectsFromArray:v19];
              }
              else
              {
                [v9 addObject:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v45 objects:v50 count:16];
          }
          while (v12);
        }

        id v20 = objc_alloc_init(MEMORY[0x1E4F77C20]);
        [v20 setHtmlBody:v11];
        [v20 setMixedContent:v9];
        id v40 = v20;

        goto LABEL_22;
      }
    }
    else
    {
    }
    id v40 = objc_alloc_init(MEMORY[0x1E4F77C28]);
    [v40 setMixedContent:v35];
LABEL_22:
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v21 = v35;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v42;
LABEL_24:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v42 != v23) {
          objc_enumerationMutation(v21);
        }
        v25 = *(void **)(*((void *)&v41 + 1) + 8 * v24);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v22 == ++v24)
        {
          uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v49 count:16];
          if (v22) {
            goto LABEL_24;
          }
          goto LABEL_30;
        }
      }
      id v26 = v25;

      if (v26) {
        goto LABEL_45;
      }
    }
    else
    {
LABEL_30:
    }
    v27 = [v38 topLevelPart];
    for (uint64_t j = 0; j < [v27 numberOfAlternatives]; ++j)
    {
      v29 = [v27 alternativeAtIndex:j];
      v30 = [v29 type];
      if ([v30 isEqualToString:@"text"])
      {
        v31 = [v29 subtype];
        if ([v31 isEqualToString:@"plain"])
        {

LABEL_41:
          if (v29)
          {
            _plaintextDocumentForMimePart(v29);
            id v26 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_44;
          }
          break;
        }
        v32 = [v29 subtype];
        char v33 = [v32 isEqualToString:@"enriched"];

        if (v33) {
          goto LABEL_41;
        }
      }
      else
      {
      }
    }
    id v26 = 0;
LABEL_44:

LABEL_45:
    [v40 setPlaintextAlternative:v26];

    goto LABEL_46;
  }
  id v40 = 0;
LABEL_46:

LABEL_47:

  return v40;
}

- (id)rewrittenMessageContent
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  rewrittenMessageContent = self->_rewrittenMessageContent;
  if (!rewrittenMessageContent)
  {
    long long v44 = self;
    id v39 = self->_originalMessageContent;
    v4 = [(MFOutgoingMessageContent *)v39 libraryContent];

    if (v4)
    {
      v5 = objc_opt_class();
      v6 = [(MFOutgoingMessageContent *)v39 libraryContent];
      id v7 = [v5 _deriveOutgoingMessageContentFromLibraryMessageContent:v6];
    }
    else
    {
      id v7 = v39;
    }
    id v40 = v7;
    long long v46 = (void *)[v7 copy];
    int v8 = [v7 richtextContent];
    v38 = [v8 mixedContent];

    long long v47 = [MEMORY[0x1E4F1CA48] array];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    obuint64_t j = v38;
    uint64_t v9 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v9)
    {
      uint64_t v48 = *(void *)v50;
      uint64_t v43 = *MEMORY[0x1E4F73430];
      unint64_t v42 = *MEMORY[0x1E4F77AE0];
      unint64_t v41 = *MEMORY[0x1E4F77AE8];
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v50 != v48) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v49 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  [v47 addObject:v11];
                  goto LABEL_50;
                }
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v19 = [v11 mimePart];
                id v18 = [v19 partURL];
                id v20 = [v19 bodyParameterForKey:v43];
                unsigned int v21 = [v19 approximateRawSize];
                uint64_t v22 = 0;
                if (v42 < v21 && v41 > v21)
                {
                  uint64_t v23 = (void *)[v19 copyBodyDataToOffset:-1 resultOffset:0 downloadIfNecessary:1];
                  uint64_t v22 = [MEMORY[0x1E4F77B80] placeholderFromSerializedRepresentation:v23];
                }
LABEL_32:
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v19 = v11;
                  uint64_t v22 = [v19 placeholder];
                  id v18 = [v19 url];
                  id v20 = [v19 contentID];
                  goto LABEL_32;
                }
                id v18 = 0;
                id v20 = 0;
                uint64_t v22 = 0;
              }
              uint64_t v24 = [(MFPlaceholderMessageRewriter *)v44 placeholderResolver];
              v25 = v24;
              if (v22)
              {
                [(NSMutableArray *)v44->_placeholders addObject:v22];
                uint64_t v26 = [v25 contentForPlaceholder:v22];
                goto LABEL_38;
              }
              v27 = [v24 contentForURL:v18];
              if (v27)
              {

                goto LABEL_42;
              }
              uint64_t v26 = [v25 contentForContentID:v20];
LABEL_38:
              v27 = (void *)v26;

              if (v27)
              {
LABEL_42:
                v28 = [v46 multipartContent];
                if (v28)
                {
                  objc_opt_class();
                  char isKindOfClass = objc_opt_isKindOfClass();

                  if (isKindOfClass)
                  {
                    v30 = [v46 multipartContent];
                    v31 = [v30 htmlBody];
                    v32 = [v31 stringByAppendingString:v27];
                    char v33 = [v46 multipartContent];
                    [v33 setHtmlBody:v32];
                  }
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v34 = objc_msgSend(MEMORY[0x1E4F60840], "mf_utf8HTMLStringWithString:", v27);
                  [v47 addObject:v34];
                }
                else
                {
                  [v47 addObject:v27];
                }
              }

              goto LABEL_49;
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = v11;
            uint64_t v13 = [v12 mimeBody];
            int v14 = [v13 isHTML];

            if (v14)
            {
              v15 = [v12 htmlData];
              if (v15)
              {
                id v16 = (void *)MEMORY[0x1E4F60840];
                [v12 preferredEncoding];
                v17 = (void *)MFCreateStringWithData();
                objc_msgSend(v16, "mf_utf8HTMLStringWithString:", v17);
                id v18 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_26;
              }
              id v18 = 0;
            }
            else
            {
              v15 = [v12 mimePart];
              [v12 preferredEncoding];
              v17 = _plaintextDocumentForMimePart(v15);
              [v47 addObject:v17];
              id v18 = 0;
LABEL_26:
            }
LABEL_28:
            if (v18)
            {
              [v46 setTextPartsAreHTML:1];
              [v47 addObject:v18];
            }
            goto LABEL_49;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v18 = v11;
            goto LABEL_28;
          }
          id v18 = 0;
LABEL_49:

LABEL_50:
          ++v10;
        }
        while (v9 != v10);
        uint64_t v35 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
        uint64_t v9 = v35;
      }
      while (v35);
    }

    [v46 setMixedContent:v47];
    [v46 setPlaceholders:v44->_placeholders];
    v36 = v44->_rewrittenMessageContent;
    v44->_rewrittenMessageContent = (MFOutgoingMessageContent *)v46;

    rewrittenMessageContent = v44->_rewrittenMessageContent;
  }

  return rewrittenMessageContent;
}

- (id)accountProxyGenerator
{
  return 0;
}

- (id)composeWebView
{
  return 0;
}

- (id)toRecipients
{
  v2 = [(MFOutgoingMessageContent *)self->_originalMessageContent headers];
  v3 = (void *)[v2 copyAddressListForTo];

  return v3;
}

- (id)ccRecipients
{
  v2 = [(MFOutgoingMessageContent *)self->_originalMessageContent headers];
  v3 = (void *)[v2 copyAddressListForCc];

  return v3;
}

- (id)bccRecipients
{
  v2 = [(MFOutgoingMessageContent *)self->_originalMessageContent headers];
  v3 = (void *)[v2 copyAddressListForBcc];

  return v3;
}

- (id)subject
{
  v2 = [(MFOutgoingMessageContent *)self->_originalMessageContent headers];
  v3 = [v2 headersForKey:*MEMORY[0x1E4F60738]];
  v4 = [v3 firstObject];

  return v4;
}

- (id)savedHeaders
{
  v2 = [(MFOutgoingMessageContent *)self->_originalMessageContent headers];
  v3 = (void *)[v2 mutableCopy];

  return v3;
}

- (id)sendingEmailAddress
{
  v2 = [(MFOutgoingMessageContent *)self->_originalMessageContent headers];
  v3 = (void *)[v2 copyAddressListForSender];
  v4 = [v3 firstObject];

  return v4;
}

- (id)sendingAccountProxy
{
  return 0;
}

- (id)attachments
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)shouldCreateRichTextRepresentation
{
  return (id)[MEMORY[0x1E4F60D70] futureWithResult:MEMORY[0x1E4F1CC28]];
}

- (MFOutgoingMessageContent)originalMessageContent
{
  return self->_originalMessageContent;
}

- (MFMessageRewriterPlaceholderResolver)placeholderResolver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderResolver);

  return (MFMessageRewriterPlaceholderResolver *)WeakRetained;
}

- (void)setPlaceholderResolver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_placeholderResolver);
  objc_storeStrong((id *)&self->_rewrittenMessageContent, 0);
  objc_storeStrong((id *)&self->_originalMessageContent, 0);

  objc_storeStrong((id *)&self->_placeholders, 0);
}

@end