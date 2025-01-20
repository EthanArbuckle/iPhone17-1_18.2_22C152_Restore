@interface SWHighlight
+ (BOOL)supportsSecureCoding;
+ (id)highlightsForSLHighlights:(id)a3;
+ (id)requiredSpotlightAttributeKeys;
+ (unsigned)highlightContentTypeForType:(unsigned __int8)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocalResource;
- (BOOL)isSyndicatableMedia;
- (NSURL)URL;
- (SLHighlight)slHighlight;
- (SWHighlight)initWithCSSearchableItem:(id)a3 error:(id *)a4;
- (SWHighlight)initWithCSSearchableItemUniqueIdentifier:(id)a3 error:(id *)a4;
- (SWHighlight)initWithCSSearchableItemUniqueIdentifier:(id)a3 forType:(unsigned __int8)a4 error:(id *)a5;
- (SWHighlight)initWithCoder:(id)a3;
- (SWHighlight)initWithSLHighlight:(id)a3;
- (id)attributions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)hideContextMenu;
- (id)identifier;
- (id)livePhotoComplementURL;
- (id)replyContextMenuWithPresentingViewController:(id)a3;
- (id)resourceUTI;
- (id)stringIdentifier;
- (id)timestamp;
- (unint64_t)hash;
- (void)_setSLHighlight:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)hideContextMenu;
@end

@implementation SWHighlight

+ (id)highlightsForSLHighlights:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = [[SWCollaborationHighlight alloc] initWithSLCollaborationHighlight:v10];
        }
        else
        {
          v12 = [SWHighlight alloc];
          v11 = -[SWHighlight initWithSLHighlight:](v12, "initWithSLHighlight:", v10, (void)v16);
        }
        v13 = v11;
        objc_msgSend(v4, "addObject:", v11, (void)v16);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v14 = (void *)[v4 copy];

  return v14;
}

- (SWHighlight)initWithSLHighlight:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SWHighlight;
  id v5 = [(SWHighlight *)&v13 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(SWHighlight *)v5 _setSLHighlight:v4];
    uint64_t v7 = [SWHighlightIdentifier alloc];
    uint64_t v8 = [(SWHighlight *)v6 slHighlight];
    v9 = [v8 identifier];
    uint64_t v10 = [(SWHighlightIdentifier *)v7 initWithStringIdentifier:v9];
    identifier = v6->_identifier;
    v6->_identifier = (NSSecureCoding *)v10;
  }
  return v6;
}

- (id)stringIdentifier
{
  v2 = [(SWHighlight *)self slHighlight];
  id v3 = [v2 identifier];

  return v3;
}

- (NSURL)URL
{
  v2 = [(SWHighlight *)self slHighlight];
  id v3 = [v2 resourceURL];

  return (NSURL *)v3;
}

- (id)attributions
{
  v2 = [(SWHighlight *)self slHighlight];
  id v3 = [v2 attributions];

  return v3;
}

- (id)timestamp
{
  v2 = [(SWHighlight *)self slHighlight];
  id v3 = [v2 timestamp];

  return v3;
}

+ (id)requiredSpotlightAttributeKeys
{
  return (id)[MEMORY[0x1E4FA5650] requiredSpotlightAttributeKeys];
}

- (SWHighlight)initWithCSSearchableItem:(id)a3 error:(id *)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4FA5650];
  id v7 = a3;
  uint64_t v8 = (void *)[[v6 alloc] initWithCSSearchableItem:v7 error:a4];

  if (v8)
  {
    self = [(SWHighlight *)self initWithSLHighlight:v8];
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (SWHighlight)initWithCSSearchableItemUniqueIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4FA5650];
  id v7 = a3;
  uint64_t v8 = (void *)[[v6 alloc] initWithCSSearchableItemUniqueIdentifier:v7 error:a4];

  if (v8)
  {
    self = [(SWHighlight *)self initWithSLHighlight:v8];
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (SWHighlight)initWithCSSearchableItemUniqueIdentifier:(id)a3 forType:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  uint64_t v8 = (objc_class *)MEMORY[0x1E4FA5650];
  id v9 = a3;
  uint64_t v10 = objc_msgSend([v8 alloc], "initWithCSSearchableItemUniqueIdentifier:forContentType:error:", v9, +[SWHighlight highlightContentTypeForType:](SWHighlight, "highlightContentTypeForType:", v6), a5);

  if (v10)
  {
    self = [(SWHighlight *)self initWithSLHighlight:v10];
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isLocalResource
{
  v2 = [(SWHighlight *)self slHighlight];
  char v3 = [v2 isLocalResource];

  return v3;
}

- (BOOL)isSyndicatableMedia
{
  v2 = [(SWHighlight *)self slHighlight];
  char v3 = [v2 isSyndicatableMedia];

  return v3;
}

- (id)livePhotoComplementURL
{
  v2 = [(SWHighlight *)self slHighlight];
  char v3 = [v2 livePhotoComplementURL];

  return v3;
}

- (id)resourceUTI
{
  v2 = [(SWHighlight *)self slHighlight];
  char v3 = [v2 resourceUTI];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SWHighlight *)self slHighlight];
  [v4 encodeObject:v5 forKey:@"slh"];
}

- (SWHighlight)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SWHighlight;
  id v5 = [(SWHighlight *)&v14 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"slh"];
  [(SWHighlight *)v5 _setSLHighlight:v6];

  id v7 = [(SWHighlight *)v5 slHighlight];

  if (v7)
  {
    uint64_t v8 = [SWHighlightIdentifier alloc];
    id v9 = [(SWHighlight *)v5 slHighlight];
    uint64_t v10 = [v9 identifier];
    uint64_t v11 = [(SWHighlightIdentifier *)v8 initWithStringIdentifier:v10];
    identifier = v5->_identifier;
    v5->_identifier = (NSSecureCoding *)v11;

LABEL_4:
    id v7 = v5;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = [(SWHighlight *)self slHighlight];
  uint64_t v6 = (void *)[v5 copy];
  [v4 _setSLHighlight:v6];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(SWHighlight *)self slHighlight];
    id v7 = [v5 slHighlight];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(SWHighlight *)self slHighlight];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (unsigned)highlightContentTypeForType:(unsigned __int8)a3
{
  return a3 == 1;
}

- (id)replyContextMenuWithPresentingViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(SWHighlight *)self slHighlight];
  uint64_t v6 = [v5 attributions];
  uint64_t v7 = [v6 count];

  if (v7 == 1)
  {
    char v8 = objc_alloc_init(SWHighlightContextMenu);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    long long v16 = __60__SWHighlight_replyContextMenuWithPresentingViewController___block_invoke;
    long long v17 = &unk_1E5665BF0;
    long long v18 = self;
    id v19 = v4;
    id v9 = _Block_copy(&v14);
    uint64_t v10 = SWFrameworkBundle();
    uint64_t v11 = objc_msgSend(v10, "localizedStringForKey:value:table:", @"REPLY_CONTEXTMENU", &stru_1EDF19D18, @"SharedWithYou", v14, v15, v16, v17, v18);
    [(SWHighlightContextMenu *)v8 setTitle:v11];

    [(SWHighlightContextMenu *)v8 setIdentifier:*MEMORY[0x1E4F3BE58]];
    [(SWHighlightContextMenu *)v8 setActionBlock:v9];
  }
  else
  {
    v12 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SWHighlight replyContextMenuWithPresentingViewController:](v12);
    }

    char v8 = 0;
  }

  return v8;
}

void __60__SWHighlight_replyContextMenuWithPresentingViewController___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) attributions];
  id v8 = [v2 firstObject];

  if (v8)
  {
    unint64_t v3 = [v8 attachmentGUID];
  }
  else
  {
    unint64_t v3 = 0;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4FA5680]);
  id v5 = [v8 uniqueIdentifier];
  [v4 presentTranscriptForMessageGUID:v5 attachmentGUID:v3 presentingViewController:*(void *)(a1 + 40)];
  uint64_t v6 = [*(id *)(a1 + 32) attributions];
  uint64_t v7 = [v6 firstObject];
  SLSendPortraitFeedbackTypeAppButtonForAttribution();
}

- (id)hideContextMenu
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(SWHighlight *)self slHighlight];
  id v4 = [v3 attributions];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = objc_alloc_init(SWHighlightContextMenu);
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = [(SWHighlight *)self slHighlight];
    id v9 = [v8 attributions];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v22 + 1) + 8 * i) uniqueIdentifier];
          if ([v14 length]) {
            [v7 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __30__SWHighlight_hideContextMenu__block_invoke;
    aBlock[3] = &unk_1E5665868;
    id v21 = v7;
    uint64_t v15 = v7;
    long long v16 = _Block_copy(aBlock);
    long long v17 = SWFrameworkBundle();
    long long v18 = [v17 localizedStringForKey:@"HIDE_CONTEXTMENU" value:&stru_1EDF19D18 table:@"SharedWithYou"];
    [(SWHighlightContextMenu *)v6 setTitle:v18];

    [(SWHighlightContextMenu *)v6 setIdentifier:*MEMORY[0x1E4F3BE48]];
    [(SWHighlightContextMenu *)v6 setActionBlock:v16];
  }
  else
  {
    uint64_t v15 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SWHighlight hideContextMenu](v15);
    }
    uint64_t v6 = 0;
  }

  return v6;
}

void __30__SWHighlight_hideContextMenu__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v7 = SWFrameworkLogHandle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v14 = v6;
          _os_log_impl(&dword_18FB18000, v7, OS_LOG_TYPE_INFO, "[SWHighlight] hideContextMenu invoked. Sending remove action for message guid: %@", buf, 0xCu);
        }

        if ([v6 length])
        {
          id v8 = [MEMORY[0x1E4FA5678] sharedController];
          [v8 removeMessageGUIDFromSyndication:v6];
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v3);
  }
}

- (id)identifier
{
  return self->_identifier;
}

- (SLHighlight)slHighlight
{
  return self->_slHighlight;
}

- (void)_setSLHighlight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slHighlight, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)replyContextMenuWithPresentingViewController:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_18FB18000, log, OS_LOG_TYPE_ERROR, "[SWHighlight] replyContextMenu: Not generating context menu due to multiple or lack of attributions.", v1, 2u);
}

- (void)hideContextMenu
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_18FB18000, log, OS_LOG_TYPE_ERROR, "[SWHighlight] hideContextMenu: Not generating context menu due to multiple or lack of attributions.", v1, 2u);
}

@end