@interface DDCopyAction
+ (BOOL)actionAvailableForContact:(id)a3;
- (BOOL)canBePerformedWhenDeviceIsLocked;
- (DDCopyAction)initWithQueryString:(id)a3 range:(_NSRange)a4 context:(id)a5;
- (DDCopyAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5;
- (id)iconName;
- (id)localizedName;
- (void)_copyURL:(id)a3;
- (void)copyStringOnly:(id)a3;
- (void)performFromView:(id)a3;
@end

@implementation DDCopyAction

- (DDCopyAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)DDCopyAction;
  v5 = [(DDAction *)&v11 initWithURL:a3 result:a4 context:a5];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = (uint64_t)v5->super._result;
    if (v7)
    {
      if (!v6->super._url)
      {
        uint64_t v8 = _DDURLFromResult(v7);
        url = v6->super._url;
        v6->super._url = (NSURL *)v8;
      }
    }
  }
  return v6;
}

+ (BOOL)actionAvailableForContact:(id)a3
{
  v3 = DDDefaultAddressForContact(a3);
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)localizedName
{
  if (!self->super._result)
  {
    url = self->super._url;
    if (!url)
    {
      contact = self->super._contact;
      if (contact)
      {
        v16 = DDDefaultAddressForContact(contact);

        if (v16)
        {
          v17 = DDDefaultAddressForContact(self->super._contact);

          if (v17)
          {
LABEL_48:
            v22 = @"Copy Address";
            goto LABEL_49;
          }
        }
      }
      goto LABEL_38;
    }
    uint64_t v7 = [(NSURL *)url scheme];
    uint64_t v8 = [v7 lowercaseString];

    BOOL v9 = [(NSURL *)self->super._url dd_isAnySimpleTelephonyScheme];
    v10 = self->super._url;
    if (!v9)
    {
      if ([(NSURL *)v10 dd_isMaps:1]
        && (DDMapAddressFromURL(self->super._url),
            v18 = objc_claimAutoreleasedReturnValue(),
            v18,
            v18))
      {
        char v13 = 0;
        int v4 = 3;
        int v14 = 1;
      }
      else
      {
        if ([v8 isEqualToString:@"mailto"])
        {
          int v14 = 0;
          char v13 = 1;
        }
        else
        {
          if (([v8 isEqualToString:@"http"] & 1) == 0) {
            [v8 isEqualToString:@"https"];
          }
          int v14 = 0;
          char v13 = 0;
        }
        int v4 = 1;
      }
      goto LABEL_34;
    }
    uint64_t v25 = 0;
    objc_super v11 = [(NSURL *)v10 dd_phoneNumberFromTelSchemeAndExtractBody:0 serviceID:&v25 suggestions:0];
    v12 = v11;
    if (v25)
    {
      char v13 = 0;
    }
    else
    {
      if ([v11 length] && !objc_msgSend(v12, "isEqualToString:", @"open"))
      {
        char v13 = 0;
        int v4 = 2;
        goto LABEL_29;
      }
      char v13 = [v12 containsString:@"@"];
    }
    int v4 = 1;
LABEL_29:

    int v14 = 0;
LABEL_34:

LABEL_35:
    switch(v4)
    {
      case 1:
        if (v13) {
          goto LABEL_37;
        }
        goto LABEL_47;
      case 2:
        goto LABEL_43;
      case 3:
        if (!v14) {
          goto LABEL_48;
        }
        v22 = @"Copy Location";
        break;
      case 4:
        v22 = @"Copy Event";
        break;
      default:
        goto LABEL_38;
    }
    goto LABEL_49;
  }
  int Category = DDResultGetCategory();
  if (Category == 2) {
    goto LABEL_38;
  }
  int v4 = Category;
  if (Category != 1)
  {
    int v14 = 0;
    char v13 = 0;
    goto LABEL_35;
  }
  if (DDResultHasType())
  {
    MatchedString = (void *)DDResultGetMatchedString();
    if (dd_handleIsChatBot(MatchedString))
    {
LABEL_38:
      if (DDResultHasType())
      {
        v22 = @"Copy Code";
      }
      else if (DDResultHasType())
      {
        v22 = @"Copy Flight Code";
      }
      else
      {
        v22 = @"Copy";
      }
      goto LABEL_49;
    }
LABEL_37:
    v22 = @"Copy Email";
    goto LABEL_49;
  }
  v19 = [(NSURL *)self->super._url scheme];
  v20 = [v19 lowercaseString];
  char v21 = [v20 isEqualToString:@"mailto"];

  if (v21) {
    goto LABEL_37;
  }
  if ([(NSURL *)self->super._url dd_isAnySimpleTelephonyScheme]
    && !+[DDTextMessageAction isShowMessageURL:self->super._url])
  {
LABEL_43:
    v22 = @"Copy Phone Number";
  }
  else
  {
LABEL_47:
    v22 = @"Copy Link";
  }
LABEL_49:
  v23 = DDLocalizedString(v22);
  return v23;
}

- (id)iconName
{
  if (self->super._result && DDResultGetCategory() == 1)
  {
    if ((DDResultHasType() & 1) == 0)
    {
      v3 = [(NSURL *)self->super._url scheme];
      int v4 = [v3 lowercaseString];
      char v5 = [v4 isEqualToString:@"mailto"];

      if ((v5 & 1) == 0 && ![(NSURL *)self->super._url dd_isAnySimpleTelephonyScheme])
      {
        v6 = [(NSURL *)self->super._url scheme];
        uint64_t v7 = [v6 lowercaseString];
        char v8 = [v7 isEqualToString:@"upi"];

        if ((v8 & 1) == 0) {
          return @"link";
        }
      }
    }
    return @"doc.on.doc";
  }
  url = self->super._url;
  if (!url) {
    return @"doc.on.doc";
  }
  v10 = [(NSURL *)url scheme];
  objc_super v11 = [v10 lowercaseString];

  if (([v11 isEqualToString:@"http"] & 1) == 0
    && ![v11 isEqualToString:@"https"]
    || ([v11 isEqualToString:@"mailto"] & 1) != 0
    || [(NSURL *)self->super._url dd_isAnySimpleTelephonyScheme])
  {

    return @"doc.on.doc";
  }
  if ([(NSURL *)self->super._url dd_isMaps:1])
  {
    char v13 = DDMapAddressFromURL(self->super._url);

    if (v13) {
      return @"doc.on.doc";
    }
  }
  else
  {
  }
  return @"link";
}

- (void)_copyURL:(id)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = v4;
  if (!v4) {
    goto LABEL_16;
  }
  v6 = [v4 scheme];
  uint64_t v7 = [v6 lowercaseString];

  if ([v7 isEqualToString:@"mailto"])
  {
    uint64_t v8 = objc_msgSend(v5, "dd_emailFromMailtoScheme");
  }
  else if ([v7 isEqualToString:@"tel"])
  {
    uint64_t v8 = objc_msgSend(v5, "dd_phoneNumberFromTelScheme");
  }
  else
  {
    if (!objc_msgSend(v5, "dd_isMaps:", 1))
    {
LABEL_9:
      BOOL v9 = objc_msgSend(v5, "_web_userVisibleString");
      goto LABEL_10;
    }
    uint64_t v8 = DDMapAddressFromURL(v5);
  }
  BOOL v9 = (void *)v8;
  if (!v8) {
    goto LABEL_9;
  }
LABEL_10:
  if ([v9 length])
  {
    v10 = (void *)MEMORY[0x1E4F1CA60];
    objc_super v11 = [(id)*MEMORY[0x1E4F44510] identifier];
    v12 = [(id)*MEMORY[0x1E4F444F8] identifier];
    char v13 = objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v9, v11, v5, v12, 0);

    id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v33 = *MEMORY[0x1E4F42530];
    v34[0] = v5;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    v16 = (void *)[v14 initWithString:v9 attributes:v15];

    uint64_t v17 = [v16 length];
    uint64_t v31 = *MEMORY[0x1E4F424F8];
    uint64_t v32 = *MEMORY[0x1E4F42558];
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v19 = objc_msgSend(v16, "dataFromRange:documentAttributes:error:", 0, v17, v18, 0);

    if (v19)
    {
      v20 = [(id)*MEMORY[0x1E4F444A0] identifier];
      [v13 setObject:v19 forKey:v20];
    }
    char v21 = [MEMORY[0x1E4F1C978] arrayWithObject:v13];
  }
  else
  {
    v22 = (void *)MEMORY[0x1E4F1C978];
    v23 = (void *)MEMORY[0x1E4F1C9E8];
    v24 = [(id)*MEMORY[0x1E4F444F8] identifier];
    uint64_t v25 = objc_msgSend(v23, "dictionaryWithObjectsAndKeys:", v5, v24, 0);
    char v21 = [v22 arrayWithObject:v25];
  }
  v26 = (void *)MEMORY[0x1E4F42C50];
  int64_t dataOwner = self->_dataOwner;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __25__DDCopyAction__copyURL___block_invoke;
  v29[3] = &unk_1E5A853B0;
  id v30 = v21;
  id v28 = v21;
  [v26 _performAsDataOwner:dataOwner block:v29];

LABEL_16:
}

void __25__DDCopyAction__copyURL___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F42C50] generalPasteboard];
  [v2 setItems:*(void *)(a1 + 32)];
}

- (void)copyStringOnly:(id)a3
{
  id v4 = a3;
  char v5 = (void *)MEMORY[0x1E4F42C50];
  int64_t dataOwner = self->_dataOwner;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__DDCopyAction_copyStringOnly___block_invoke;
  v8[3] = &unk_1E5A853B0;
  id v9 = v4;
  id v7 = v4;
  [v5 _performAsDataOwner:dataOwner block:v8];
}

void __31__DDCopyAction_copyStringOnly___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) length])
  {
    id v2 = [(id)*MEMORY[0x1E4F44510] identifier];
    uint64_t v3 = *(void *)(a1 + 32);
    id v7 = v2;
    uint64_t v8 = v3;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    v9[0] = v4;
    char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    char v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v6 = [MEMORY[0x1E4F42C50] generalPasteboard];
  [v6 setItems:v5];
}

- (void)performFromView:(id)a3
{
  if (!self->_query)
  {
    self->_int64_t dataOwner = [a3 _dataOwnerForCopy];
    id v4 = [(NSURL *)self->super._url scheme];
    char v5 = [v4 lowercaseString];

    DDUIRecordOtherActionInSheetForResultIfNeeded((uint64_t)self->super._result);
    if ([(NSURL *)self->super._url dd_isAnySimpleTelephonyScheme])
    {
      uint64_t v26 = 0;
      if (self->super._result) {
        DDResultCopyPhoneValue();
      }
      url = self->super._url;
      id v25 = 0;
      id v9 = [(NSURL *)url dd_phoneNumberFromTelSchemeAndExtractBody:0 serviceID:&v25 suggestions:0];
      id v10 = v25;
      if (v10 || ![v9 length] || (objc_msgSend(v9, "isEqualToString:", @"open") & 1) != 0) {
        [(DDCopyAction *)self _copyURL:self->super._url];
      }
      else {
        [(DDCopyAction *)self copyStringOnly:v9];
      }

      goto LABEL_21;
    }
    if ([v5 isEqualToString:@"upi"])
    {
      if (self->super._result)
      {
        uint64_t v6 = DDResultCopyUPIIdentifierValue();
        if (v6)
        {
          id v7 = (const void *)v6;
          [(DDCopyAction *)self copyStringOnly:v6];
          CFRelease(v7);
LABEL_31:

          return;
        }
      }
      goto LABEL_29;
    }
    if ([v5 isEqualToString:@"mailto"])
    {
      uint64_t v26 = 0;
      if (self->super._result) {
        DDResultCopyMailValue();
      }
      goto LABEL_29;
    }
    if ([(NSURL *)self->super._url dd_isMaps:1])
    {
      if (self->super._result && DDResultGetCategory() == 3) {
        goto LABEL_25;
      }
LABEL_29:
      v12 = self->super._url;
LABEL_30:
      [(DDCopyAction *)self _copyURL:v12];
      goto LABEL_31;
    }
    if (([v5 isEqualToString:@"http"] & 1) != 0
      || [v5 isEqualToString:@"https"])
    {
      goto LABEL_29;
    }
    if (self->super._result)
    {
      uint64_t v13 = DDResultCopyAuthCode();
      if (v13)
      {
        id v14 = (void *)v13;
        v15 = [MEMORY[0x1E4F42C50] generalPasteboard];
        v16 = v15;
        uint64_t v17 = v14;
      }
      else
      {
        int Category = DDResultGetCategory();
        if (Category == 3)
        {
LABEL_25:
          id v10 = [MEMORY[0x1E4F42C50] generalPasteboard];
          objc_super v11 = DDResultGetMatchedString();
          [v10 setString:v11];
LABEL_26:

LABEL_21:
          goto LABEL_31;
        }
        int v22 = Category;
        if ((Category & 0xFFFFFFFE) != 4)
        {
          if (Category == 1)
          {
            _DDURLFromResult((uint64_t)self->super._result);
            id v10 = (id)objc_claimAutoreleasedReturnValue();
            if (v10)
            {
              objc_super v11 = [MEMORY[0x1E4F42C50] generalPasteboard];
              [v11 setURL:v10];
            }
            else
            {
              objc_super v11 = DDResultGetMatchedString();
              v23 = [MEMORY[0x1E4F42C50] generalPasteboard];
              [v23 setString:v11];
            }
            goto LABEL_26;
          }
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
            -[DDCopyAction performFromView:](v22);
          }
        }
        v16 = DDResultGetMatchedString();
        v15 = [MEMORY[0x1E4F42C50] generalPasteboard];
        id v14 = v15;
        uint64_t v17 = v16;
      }
      [v15 setString:v17];
    }
    else
    {
      contact = self->super._contact;
      if (!contact
        || (DDDefaultAddressForContact(contact),
            v19 = objc_claimAutoreleasedReturnValue(),
            v19,
            !v19))
      {
        v12 = self->super._url;
        if (!v12)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[DDCopyAction performFromView:]();
          }
          goto LABEL_31;
        }
        goto LABEL_30;
      }
      v16 = DDDefaultAddressForContact(self->super._contact);
      if (!v16)
      {
LABEL_37:

        goto LABEL_31;
      }
      id v14 = [MEMORY[0x1E4F42C50] generalPasteboard];
      v20 = [MEMORY[0x1E4F1BA88] stringFromPostalAddress:v16 style:0];
      [v14 setString:v20];
    }
    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x1E4F42C50], "generalPasteboard", a3);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  [v24 setString:self->_query];
}

- (BOOL)canBePerformedWhenDeviceIsLocked
{
  return 1;
}

- (void).cxx_destruct
{
}

- (DDCopyAction)initWithQueryString:(id)a3 range:(_NSRange)a4 context:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  objc_msgSend(a3, "substringWithRange:", location, length);
  id v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  query = self->_query;
  self->_query = v10;

  v12 = [(DDCopyAction *)self initWithURL:0 result:0 context:v9];
  return v12;
}

- (void)performFromView:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "No result, and no known scheme", v0, 2u);
}

- (void)performFromView:(int)a1 .cold.2(int a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Unknown category %x", (uint8_t *)v1, 8u);
}

@end