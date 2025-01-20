@interface DDTelephoneNumberAction
- (BCSBusinessItem)bizItem;
- (BOOL)menuItemNameCanFallbackToServiceName;
- (DDTelephoneNumberAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5;
- (id)compactTitle;
- (id)contactAndLabelForPhoneNumber:(id *)a3;
- (id)contactsMatchingPhoneNumber:(void *)a3 inContactStore:;
- (id)handleString;
- (id)iconName;
- (id)labelToUseForEmail:(void *)a3 ofContact:;
- (id)labelToUseForPhoneNumber:(void *)a3 ofContact:;
- (void)setBizItem:(id)a3;
@end

@implementation DDTelephoneNumberAction

- (DDTelephoneNumberAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v39.receiver = self;
  v39.super_class = (Class)DDTelephoneNumberAction;
  v10 = [(DDAction *)&v39 initWithURL:v8 result:a4 context:v9];
  if (v10)
  {
    if (v8)
    {
      v11 = [v8 scheme];
      v12 = [v11 lowercaseString];

      if (([v12 isEqualToString:@"sms"] & 1) != 0
        || ([v12 isEqualToString:@"sip"] & 1) != 0
        || [v12 isEqualToString:@"tel"])
      {
        url = v10->super._url;
        id v37 = 0;
        id v38 = 0;
        id v36 = 0;
        uint64_t v14 = [(NSURL *)url dd_phoneNumberFromTelSchemeAndExtractBody:&v38 serviceID:&v37 suggestions:&v36];
        v15 = (NSString *)v38;
        v16 = (NSString *)v37;
        v17 = (NSString *)v36;
        phoneNumber = v10->_phoneNumber;
        v10->_phoneNumber = (NSString *)v14;

        body = v10->_body;
        v10->_body = v15;
        v20 = v15;

        suggestions = v10->_suggestions;
        v10->_suggestions = v17;
        v22 = v17;

        serviceID = v10->_serviceID;
        v10->_serviceID = v16;
        v24 = v16;
      }
      else if ([v12 isEqualToString:@"mailto"])
      {
        uint64_t v30 = [(NSURL *)v10->super._url dd_emailFromMailtoScheme];
        v20 = v10->_phoneNumber;
        v10->_phoneNumber = (NSString *)v30;
      }
      else
      {
        v20 = (NSString *)[objc_alloc(MEMORY[0x1E4FADBC0]) initWithURL:v8];
        v31 = [(NSString *)v20 handle];
        uint64_t v32 = [v31 value];
        v33 = v10->_phoneNumber;
        v10->_phoneNumber = (NSString *)v32;

        if (!v10->_phoneNumber)
        {
          uint64_t v34 = objc_msgSend(v8, "dd_phoneNumberFromTelScheme");
          v35 = v10->_phoneNumber;
          v10->_phoneNumber = (NSString *)v34;
        }
      }

      if (!v10->_phoneNumber)
      {
        uint64_t v25 = objc_msgSend(v8, "dd_emailFromMailtoScheme");
        v26 = v10->_phoneNumber;
        v10->_phoneNumber = (NSString *)v25;
      }
      goto LABEL_12;
    }
    if (!a4)
    {
      v27 = [v9 objectForKeyedSubscript:@"ContactValue"];

      if (v27)
      {
        uint64_t v28 = [v9 objectForKeyedSubscript:@"ContactValue"];
        v12 = v10->_phoneNumber;
        v10->_phoneNumber = (NSString *)v28;
LABEL_12:
      }
    }
  }

  return v10;
}

- (id)iconName
{
  return @"phone";
}

- (id)compactTitle
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  id v16 = 0;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __39__DDTelephoneNumberAction_compactTitle__block_invoke;
  activity_block[3] = &unk_1E5A85F20;
  activity_block[4] = self;
  activity_block[5] = &v11;
  _os_activity_initiate(&dword_1A1709000, "searching for name in Contacts to display Call compact label", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  if ([(id)v12[5] length])
  {
    phoneNumber = (NSString *)v12[5];
    goto LABEL_3;
  }
  url = self->super._url;
  if (!url)
  {
LABEL_11:
    if (![(NSString *)self->_phoneNumber length])
    {
      v9.receiver = self;
      v9.super_class = (Class)DDTelephoneNumberAction;
      v4 = [(DDAction *)&v9 compactTitle];
      goto LABEL_4;
    }
    BOOL v8 = [(NSString *)self->_phoneNumber containsString:@"@"];
    phoneNumber = self->_phoneNumber;
    if (!v8)
    {
      TUFormattedPhoneNumber();
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
LABEL_3:
    v4 = phoneNumber;
LABEL_4:
    v5 = v4;
    goto LABEL_5;
  }
  v5 = [(NSURL *)url dd_formattedPhoneNumber];
  if (![v5 length])
  {

    goto LABEL_11;
  }
LABEL_5:
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __39__DDTelephoneNumberAction_compactTitle__block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) contactAndLabelForPhoneNumber:0];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1B910], "stringFromContact:style:");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (![*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) length])
  {
    uint64_t v5 = [MEMORY[0x1E4F1B910] stringFromContact:v8 style:0];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (id)contactsMatchingPhoneNumber:(void *)a3 inContactStore:
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_8;
  }
  char isDeviceLocked = dd_isDeviceLocked();
  id v8 = 0;
  if (!v6 || (isDeviceLocked & 1) != 0) {
    goto LABEL_14;
  }
  if (![v5 length])
  {
LABEL_8:
    id v8 = 0;
    goto LABEL_14;
  }
  if (v5)
  {
    if ([v5 containsString:@"@"])
    {
      objc_super v9 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v5];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v5];
      objc_super v9 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v10];
    }
    uint64_t v11 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    v16[0] = v11;
    v12 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:1000];
    uint64_t v13 = *MEMORY[0x1E4F1AEE0];
    v16[1] = v12;
    v16[2] = v13;
    v16[3] = *MEMORY[0x1E4F1ADC8];
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];

    id v8 = [v6 unifiedContactsMatchingPredicate:v9 keysToFetch:v14 error:0];
  }
  else
  {
    id v8 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[DDTelephoneNumberAction contactsMatchingPhoneNumber:inContactStore:]((uint64_t)v8, (uint64_t)v5);
  }
LABEL_14:

  return v8;
}

- (id)labelToUseForPhoneNumber:(void *)a3 ofContact:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    [a3 phoneNumbers];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    a1 = (void *)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (a1)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        id v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v6);
          }
          objc_super v9 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v8);
          v10 = objc_msgSend(v9, "value", (void)v13);
          char v11 = [v10 isLikePhoneNumber:v5];

          if (v11)
          {
            a1 = [v9 label];
            goto LABEL_12;
          }
          id v8 = (char *)v8 + 1;
        }
        while (a1 != v8);
        a1 = (void *)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (a1) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return a1;
}

- (id)labelToUseForEmail:(void *)a3 ofContact:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1 && [v5 length])
  {
    uint64_t v7 = [v6 emailAddresses];
    id v8 = [v5 lowercaseString];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v7;
    v10 = (void *)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v9);
          }
          long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          long long v14 = objc_msgSend(v13, "value", (void)v17);
          long long v15 = [v14 lowercaseString];

          if ([v15 length] && (objc_msgSend(v8, "isEqualToString:", v15) & 1) != 0)
          {
            v10 = [v13 label];

            goto LABEL_15;
          }
        }
        v10 = (void *)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  else
  {
    v10 = 0;
    id v8 = v5;
  }

  return v10;
}

- (id)contactAndLabelForPhoneNumber:(id *)a3
{
  v25[3] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] == 3)
  {
    if (DDResultGetCategory() == 2)
    {
      if (DDResultGetSubresultWithType())
      {
        DDResultGetMatchedString();
        id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (v5) {
          goto LABEL_29;
        }
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
          -[DDTelephoneNumberAction contactAndLabelForPhoneNumber:]();
        }
        CFArrayRef SubResults = (const __CFArray *)DDResultGetSubResults();
        if (SubResults)
        {
          CFArrayRef v8 = SubResults;
          if (CFArrayGetCount(SubResults) >= 1)
          {
            CFIndex v12 = 0;
            long long v13 = MEMORY[0x1E4F14500];
            do
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
                -[DDTelephoneNumberAction contactAndLabelForPhoneNumber:]((uint8_t *)v25, v8, v12, (uint64_t *)((char *)v25 + 4));
              }
              ++v12;
            }
            while (v12 < CFArrayGetCount(v8));
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          -[DDTelephoneNumberAction contactAndLabelForPhoneNumber:]();
        }
        DDUILogAssertionFailure((uint64_t)"valueResult != NULL", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MobileDataDetectorsUI/Actions/DDCallAction.m", (uint64_t)"-[DDTelephoneNumberAction contactAndLabelForPhoneNumber:]", 198, @"PhoneNumber without a <Value>", v9, v10, v11, v25[0]);
      }
    }
    id v5 = self->_phoneNumber;
    if (!v5)
    {
      if (self->super._result && (uint64_t v14 = DDResultCopyExtractedURL()) != 0)
      {
        long long v15 = (const void *)v14;
        long long v16 = [MEMORY[0x1E4F1CB10] URLWithString:v14];
        long long v17 = [v16 scheme];
        long long v18 = [v17 lowercaseString];
        int v19 = [v18 isEqualToString:@"tel"];

        if (v19)
        {
          objc_msgSend(v16, "dd_formattedPhoneNumber");
          id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v5 = 0;
        }
        CFRelease(v15);
      }
      else
      {
        id v5 = 0;
      }
    }
LABEL_29:
    long long v20 = objc_opt_new();
    if (!v20)
    {
      id v6 = 0;
LABEL_44:

      goto LABEL_45;
    }
    v21 = -[DDTelephoneNumberAction contactsMatchingPhoneNumber:inContactStore:]((uint64_t)self, v5, v20);
    if ([v21 count] == 1)
    {
      id v6 = [v21 objectAtIndexedSubscript:0];
      if (a3)
      {
        if ([(NSString *)v5 containsString:@"@"])
        {
          uint64_t v22 = -[DDTelephoneNumberAction labelToUseForEmail:ofContact:]((uint64_t)self, v5, v6);
          if (!v22) {
            goto LABEL_43;
          }
        }
        else
        {
          if (!v5) {
            goto LABEL_43;
          }
          v23 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v5];
          if (v23)
          {
            uint64_t v22 = -[DDTelephoneNumberAction labelToUseForPhoneNumber:ofContact:](self, v23, v6);
          }
          else
          {
            uint64_t v22 = 0;
          }

          if (!v22) {
            goto LABEL_43;
          }
        }
        *a3 = [MEMORY[0x1E4F1BA20] localizedStringForLabel:v22];
      }
    }
    else
    {
      id v6 = 0;
    }
LABEL_43:

    goto LABEL_44;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[DDTelephoneNumberAction contactAndLabelForPhoneNumber:].cold.4();
  }
  id v6 = 0;
LABEL_45:
  return v6;
}

- (id)handleString
{
  return self->_phoneNumber;
}

- (BOOL)menuItemNameCanFallbackToServiceName
{
  return 1;
}

- (BCSBusinessItem)bizItem
{
  return (BCSBusinessItem *)objc_getProperty(self, a2, 144, 1);
}

- (void)setBizItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->bizItem, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

- (void)contactsMatchingPhoneNumber:(uint64_t)a1 inContactStore:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Found these contacts: %@ for phone number %@", (uint8_t *)&v2, 0x16u);
}

- (void)contactAndLabelForPhoneNumber:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Phone number results without any subresults", v0, 2u);
}

- (void)contactAndLabelForPhoneNumber:(CFIndex)idx .cold.2(uint8_t *a1, CFArrayRef theArray, CFIndex idx, uint64_t *a4)
{
  CFArrayGetValueAtIndex(theArray, idx);
  uint64_t Type = DDResultGetType();
  *(_DWORD *)a1 = 138412290;
  *a4 = Type;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Subresult type: %@", a1, 0xCu);
}

- (void)contactAndLabelForPhoneNumber:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 138412290;
  uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Phone number without a Value sub-binder: %@", (uint8_t *)&v0, 0xCu);
}

- (void)contactAndLabelForPhoneNumber:.cold.4()
{
  *(_WORD *)int v0 = 0;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "No access to Contacts", v0, 2u);
}

@end