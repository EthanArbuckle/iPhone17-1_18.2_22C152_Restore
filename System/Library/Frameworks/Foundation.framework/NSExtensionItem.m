@interface NSExtensionItem
+ (BOOL)supportsSecureCoding;
- (NSArray)attachments;
- (NSAttributedString)attributedContentText;
- (NSAttributedString)attributedTitle;
- (NSDictionary)userInfo;
- (NSExtensionItem)init;
- (NSExtensionItem)initWithCoder:(id)a3;
- (id)_matchingDictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAttachments:(NSArray *)attachments;
- (void)setAttributedContentText:(NSAttributedString *)attributedContentText;
- (void)setAttributedTitle:(NSAttributedString *)attributedTitle;
- (void)setUserInfo:(NSDictionary *)userInfo;
@end

@implementation NSExtensionItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSExtensionItem)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)NSExtensionItem;
  v2 = [(NSExtensionItem *)&v4 init];
  if (v2) {
    v2->_userInfo = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

- (NSExtensionItem)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSExtensionItem;
  objc_super v4 = [(NSExtensionItem *)&v6 init];
  if (v4) {
    v4->_userInfo = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "allowedClasses"), @"NSExtensionItemUserInfoKey"), "mutableCopy");
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSExtensionItem;
  [(NSExtensionItem *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_alloc_init(NSExtensionItem);
  uint64_t v5 = (NSMutableDictionary *)[(NSDictionary *)[(NSExtensionItem *)self userInfo] mutableCopy];
  objc_super v6 = (void *)[(NSMutableDictionary *)v5 objectForKey:@"NSExtensionItemAttachmentsKey"];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(id *)(*((void *)&v15 + 1) + 8 * v11);
        if (objc_opt_isKindOfClass()) {
          id v12 = (id)[v12 copy];
        }
        [v7 addObject:v12];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v9);
  }
  [(NSMutableDictionary *)v5 setObject:v7 forKey:@"NSExtensionItemAttachmentsKey"];

  v4->_userInfo = v5;
  return v4;
}

- (void)setAttributedTitle:(NSAttributedString *)attributedTitle
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (attributedTitle)
  {
    id v12 = 0;
    NSUInteger v5 = [(NSAttributedString *)attributedTitle length];
    uint64_t v17 = _MergedGlobals_84();
    v18[0] = off_1EB1E80B8();
    objc_super v6 = -[NSAttributedString dataFromRange:documentAttributes:error:](attributedTitle, "dataFromRange:documentAttributes:error:", 0, v5, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1], &v12);
    if (v6)
    {
      [(NSMutableDictionary *)self->_userInfo setValue:v6 forKey:@"NSExtensionItemAttributedTitleKey"];
      if (-[NSAttributedString prefersRTFDInRange:](attributedTitle, "prefersRTFDInRange:", 0, [(NSAttributedString *)attributedTitle length]))
      {
        NSUInteger v7 = [(NSAttributedString *)attributedTitle length];
        uint64_t v15 = _MergedGlobals_84();
        uint64_t v16 = off_1EB1E80C0();
        uint64_t v8 = -[NSAttributedString dataFromRange:documentAttributes:error:](attributedTitle, "dataFromRange:documentAttributes:error:", 0, v7, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1], &v12);
        if (v8) {
          [(NSMutableDictionary *)self->_userInfo setValue:v8 forKey:@"_NSExtensionItemRTFDAttributedTitleKey"];
        }
        else {
          NSLog((NSString *)@"unable to create RTFD representation of attributed string! error - %@", [v12 description]);
        }
      }
    }
    else
    {
      uint64_t v10 = _NSOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = [v12 description];
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = v11;
        _os_log_error_impl(&dword_181795000, v10, OS_LOG_TYPE_ERROR, "unable to create RTF representation of attributed string! error - %@", buf, 0xCu);
      }
    }
  }
  else
  {
    [(NSMutableDictionary *)self->_userInfo removeObjectForKey:@"NSExtensionItemAttributedTitleKey"];
    userInfo = self->_userInfo;
    [(NSMutableDictionary *)userInfo removeObjectForKey:@"_NSExtensionItemRTFDAttributedTitleKey"];
  }
}

- (NSAttributedString)attributedTitle
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableDictionary *)self->_userInfo objectForKey:@"_NSExtensionItemRTFDAttributedTitleKey"];
  if (!v3
    || (uint64_t v4 = v3,
        *(void *)buf = 0,
        UIFoundationLibrary(),
        NSUInteger v5 = [NSAttributedString alloc],
        uint64_t v17 = _MergedGlobals_84(),
        v18[0] = off_1EB1E80C0(),
        (objc_super v6 = -[NSAttributedString initWithData:options:documentAttributes:error:](v5, "initWithData:options:documentAttributes:error:", v4, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1], 0, buf)) == 0))
  {
    result = (NSAttributedString *)[(NSMutableDictionary *)self->_userInfo objectForKey:@"NSExtensionItemAttributedTitleKey"];
    if (!result) {
      return result;
    }
    uint64_t v8 = result;
    id v13 = 0;
    UIFoundationLibrary();
    uint64_t v9 = [NSAttributedString alloc];
    uint64_t v15 = _MergedGlobals_84();
    uint64_t v16 = off_1EB1E80B8();
    uint64_t v10 = -[NSAttributedString initWithData:options:documentAttributes:error:](v9, "initWithData:options:documentAttributes:error:", v8, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1], 0, &v13);
    if (!v10)
    {
      uint64_t v11 = _NSOSLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = [v13 description];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v12;
        _os_log_error_impl(&dword_181795000, v11, OS_LOG_TYPE_ERROR, "unable to create attributed string representation from RTF data! error - %@", buf, 0xCu);
      }
    }
    objc_super v6 = (NSAttributedString *)v10;
  }
  return v6;
}

- (void)setAttributedContentText:(NSAttributedString *)attributedContentText
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (attributedContentText)
  {
    NSUInteger v5 = [(NSAttributedString *)attributedContentText length];
    uint64_t v11 = _MergedGlobals_84();
    v12[0] = off_1EB1E80B8();
    -[NSMutableDictionary setValue:forKey:](self->_userInfo, "setValue:forKey:", -[NSAttributedString dataFromRange:documentAttributes:error:](attributedContentText, "dataFromRange:documentAttributes:error:", 0, v5, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1], &v8), @"NSExtensionItemAttributedContentTextKey");
    if (-[NSAttributedString prefersRTFDInRange:](attributedContentText, "prefersRTFDInRange:", 0, [(NSAttributedString *)attributedContentText length]))
    {
      NSUInteger v6 = [(NSAttributedString *)attributedContentText length];
      uint64_t v9 = _MergedGlobals_84();
      uint64_t v10 = off_1EB1E80C0();
      -[NSMutableDictionary setValue:forKey:](self->_userInfo, "setValue:forKey:", -[NSAttributedString dataFromRange:documentAttributes:error:](attributedContentText, "dataFromRange:documentAttributes:error:", 0, v6, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1], &v8), @"_NSExtensionItemRTFDAttributedContentTextKey");
    }
  }
  else
  {
    [(NSMutableDictionary *)self->_userInfo removeObjectForKey:@"NSExtensionItemAttributedContentTextKey"];
    userInfo = self->_userInfo;
    [(NSMutableDictionary *)userInfo removeObjectForKey:@"_NSExtensionItemRTFDAttributedContentTextKey"];
  }
}

- (NSAttributedString)attributedContentText
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableDictionary *)self->_userInfo objectForKey:@"_NSExtensionItemRTFDAttributedContentTextKey"];
  if (!v3
    || (uint64_t v4 = v3,
        uint64_t v10 = 0,
        UIFoundationLibrary(),
        NSUInteger v5 = [NSAttributedString alloc],
        uint64_t v13 = _MergedGlobals_84(),
        v14[0] = off_1EB1E80C0(),
        (NSUInteger v6 = -[NSAttributedString initWithData:options:documentAttributes:error:](v5, "initWithData:options:documentAttributes:error:", v4, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1, 0), 0, &v10)) == 0))
  {
    result = (NSAttributedString *)[(NSMutableDictionary *)self->_userInfo objectForKey:@"NSExtensionItemAttributedContentTextKey"];
    if (!result) {
      return result;
    }
    uint64_t v8 = result;
    uint64_t v10 = 0;
    UIFoundationLibrary();
    uint64_t v9 = [NSAttributedString alloc];
    uint64_t v11 = _MergedGlobals_84();
    uint64_t v12 = off_1EB1E80B8();
    NSUInteger v6 = -[NSAttributedString initWithData:options:documentAttributes:error:](v9, "initWithData:options:documentAttributes:error:", v8, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1], 0, &v10);
  }
  return v6;
}

- (void)setAttachments:(NSArray *)attachments
{
  userInfo = self->_userInfo;
  id v4 = (id)[(NSArray *)attachments copy];

  [(NSMutableDictionary *)userInfo setValue:v4 forKey:@"NSExtensionItemAttachmentsKey"];
}

- (NSArray)attachments
{
  return (NSArray *)[(NSMutableDictionary *)self->_userInfo objectForKey:@"NSExtensionItemAttachmentsKey"];
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
  self->_userInfo = (NSMutableDictionary *)[(NSDictionary *)userInfo mutableCopy];
}

- (NSDictionary)userInfo
{
  v2 = (void *)[(NSMutableDictionary *)self->_userInfo copy];

  return (NSDictionary *)v2;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSExtensionItem;
  return +[NSString stringWithFormat:@"%@ - userInfo: %@", [(NSExtensionItem *)&v3 description], self->_userInfo];
}

- (id)_matchingDictionaryRepresentation
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3052000000;
  v40 = __Block_byref_object_copy__4;
  v41 = __Block_byref_object_dispose__4;
  uint64_t v42 = 0;
  uint64_t v42 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  objc_super v3 = [(NSExtensionItem *)self userInfo];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __52__NSExtensionItem__matchingDictionaryRepresentation__block_invoke;
  v32[3] = &unk_1E51F8160;
  v32[4] = &v33;
  v32[5] = &v37;
  [(NSDictionary *)v3 enumerateKeysAndObjectsUsingBlock:v32];
  if ([(NSArray *)[(NSExtensionItem *)self attachments] count])
  {
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = off_1EB1E80C8();
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    NSUInteger v5 = [(NSExtensionItem *)self attachments];
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v50 objects:v49 count:16];
    if (!v6) {
      goto LABEL_37;
    }
    uint64_t v7 = *(void *)v51;
    obj = v5;
    v27 = v31;
    while (1)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v51 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v50 + 1) + 8 * v8);
        uint64_t v10 = off_1EB1E80D0();
        uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithArray:", objc_msgSend(v9, "registeredTypeIdentifiers", v27));
        uint64_t v12 = v11;
        if (!*((unsigned char *)v34 + 24) || (uint64_t v13 = v10, ([v11 containsObject:v10] & 1) == 0))
        {
          uint64_t v13 = v4;
          if (![v12 containsObject:v4])
          {
            uint64_t v13 = 0;
            goto LABEL_25;
          }
        }
        if (v13)
        {
          uint64_t v14 = objc_alloc_init(NSExtensionURLResult);
          v47 = @"NSItemProviderOptionsDispatchMode";
          v48 = @"NSItemProviderOptionsDispatchModeAsynchronous";
          uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v31[0] = __52__NSExtensionItem__matchingDictionaryRepresentation__block_invoke_60;
          v31[1] = &unk_1E51F8188;
          v31[2] = v14;
          [v9 loadItemForTypeIdentifier:v13 options:v15 completionHandler:v30];
          char v16 = [(NSExtensionURLResult *)v14 wait:2.0];
          id v17 = [(NSExtensionURLResult *)v14 copiedURL];

          if (v17) {
            char v18 = v16;
          }
          else {
            char v18 = 1;
          }
          if (v18) {
            goto LABEL_22;
          }
          if (v13 == v10)
          {
            if (objc_msgSend((id)objc_msgSend(v17, "scheme"), "caseInsensitiveCompare:", @"http")
              && objc_msgSend((id)objc_msgSend(v17, "scheme"), "caseInsensitiveCompare:", @"https"))
            {
              goto LABEL_22;
            }
            uint64_t v13 = 0;
            int v19 = 1;
          }
          else
          {
            if (v13 == v4 && [v17 isFileURL])
            {
              uint64_t v13 = off_1EB1E80E0((uint64_t)v17, 0);
              int v19 = 0;
              goto LABEL_23;
            }
LABEL_22:
            int v19 = 0;
            uint64_t v13 = 0;
          }
LABEL_23:

          if (v19)
          {
            [v12 addObject:@"com.apple.active-webpage"];
            goto LABEL_28;
          }
        }
LABEL_25:
        if ((unint64_t)[v12 count] >= 2
          && ([v12 containsObject:@"com.apple.active-webpage"] & 1) == 0)
        {
          [v12 removeObject:v10];
        }
LABEL_28:
        if ((unint64_t)[v12 count] >= 2) {
          [v12 removeObject:off_1EB1E80D8()];
        }
        if (v13)
        {
          v45[0] = @"registeredTypeIdentifiers";
          uint64_t v20 = [v12 allObjects];
          v45[1] = @"fileProviderItem";
          v46[0] = v20;
          v21 = (__CFString **)v45;
          v22 = v46;
          uint64_t v23 = 2;
          v46[1] = v13;
        }
        else
        {
          v43 = @"registeredTypeIdentifiers";
          uint64_t v44 = [v12 allObjects];
          v21 = &v43;
          v22 = &v44;
          uint64_t v23 = 1;
        }
        objc_msgSend(v29, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, v21, v23));

        ++v8;
      }
      while (v6 != v8);
      uint64_t v24 = [(NSArray *)obj countByEnumeratingWithState:&v50 objects:v49 count:16];
      uint64_t v6 = v24;
      if (!v24)
      {
LABEL_37:
        [(id)v38[5] setObject:v29 forKey:@"attachments"];

        break;
      }
    }
  }
  v25 = (void *)v38[5];
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  return v25;
}

void __52__NSExtensionItem__matchingDictionaryRepresentation__block_invoke(uint64_t a1, __CFString *a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(__CFString *)a2 isEqualToString:@"NSExtensionItemAttributedTitleKey"]) {
    uint64_t v4 = @"title";
  }
  if ([(__CFString *)v4 isEqualToString:@"NSExtensionItemAttributedContentTextKey"])uint64_t v4 = @"contentText"; {
  if (([(__CFString *)v4 isEqualToString:@"NSExtensionItemAttachmentsKey"] & 1) == 0)
  }
  {
    if ([(__CFString *)v4 isEqualToString:@"supportsJavaScript"]
      && (objc_getClass("NSNumber"), (objc_opt_isKindOfClass() & 1) != 0)
      && [a3 BOOLValue])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
    else if (([(__CFString *)v4 hasPrefix:@"com.apple.UIKit"] & 1) == 0)
    {
      uint64_t v11 = 0;
      uint64_t v12 = &v11;
      uint64_t v13 = 0x2020000000;
      char v14 = 0;
      uint64_t v6 = objc_opt_class();
      id v7 = +[NSExtensionContext _extensionContextHostProtocolAllowedClassesForItems];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __52__NSExtensionItem__matchingDictionaryRepresentation__block_invoke_2;
      v10[3] = &unk_1E51F6DD0;
      v10[4] = v6;
      v10[5] = &v11;
      [v7 enumerateObjectsUsingBlock:v10];
      if (*((unsigned char *)v12 + 24))
      {
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:a3 forKey:v4];
      }
      else
      {
        uint64_t v8 = _NSOSLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          uint64_t v9 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          char v16 = v4;
          __int16 v17 = 2112;
          uint64_t v18 = v9;
          _os_log_error_impl(&dword_181795000, v8, OS_LOG_TYPE_ERROR, "Unable to encode value for key %@ because it is of unsupported type %@", buf, 0x16u);
        }
      }
      _Block_object_dispose(&v11, 8);
    }
  }
}

uint64_t __52__NSExtensionItem__matchingDictionaryRepresentation__block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) isSubclassOfClass:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __52__NSExtensionItem__matchingDictionaryRepresentation__block_invoke_60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 32) setURL:a2];
    }
  }
  NSUInteger v5 = *(void **)(a1 + 32);

  return [v5 signal];
}

@end