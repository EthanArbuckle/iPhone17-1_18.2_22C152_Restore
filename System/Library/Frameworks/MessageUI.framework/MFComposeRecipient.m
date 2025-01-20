@interface MFComposeRecipient
+ (BOOL)supportsSecureCoding;
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (id)_requiredKeyDescriptors;
+ (id)composeRecipientWithAutocompleteResult:(id)a3;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
+ (id)recipientWithProperty:(int)a3 address:(id)a4;
+ (id)recipientWithRecord:(void *)a3 property:(int)a4 identifier:(int)a5;
+ (id)recipientWithRecord:(void *)a3 recordID:(int)a4 property:(int)a5 identifier:(int)a6;
- (BOOL)isDirectoryServerResult;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroup;
- (BOOL)isRemovableFromSearchResults;
- (BOOL)isSuggestedRecipient;
- (BOOL)showsAccessoryButton;
- (BOOL)wasCompleteMatch;
- (CNAutocompleteResult)autocompleteResult;
- (CNContact)contact;
- (MFComposeRecipient)init;
- (MFComposeRecipient)initWithCoder:(id)a3;
- (MFComposeRecipient)initWithContact:(id)a3 address:(id)a4 kind:(unint64_t)a5;
- (MFComposeRecipient)initWithRecord:(void *)a3 recordID:(int)a4 property:(int)a5 identifier:(int)a6 address:(id)a7;
- (MFComposeRecipientOriginContext)originContext;
- (NSString)address;
- (NSString)commentedAddress;
- (NSString)compositeName;
- (NSString)contactIdentifier;
- (NSString)countryCode;
- (NSString)description;
- (NSString)displayString;
- (NSString)label;
- (NSString)normalizedAddress;
- (NSString)placeholderName;
- (NSString)shortName;
- (NSString)uncommentedAddress;
- (NSString)unlocalizedLabel;
- (NSString)valueIdentifier;
- (id)_unformattedAddress;
- (id)children;
- (id)childrenWithCompleteMatches;
- (id)completelyMatchedAttributedStrings;
- (id)labeledValueIdentifier;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (id)preferredSendingAddress;
- (id)sortedChildren;
- (int)identifier;
- (int)property;
- (int)recordID;
- (unint64_t)hash;
- (unint64_t)kind;
- (unint64_t)sourceType;
- (void)encodeWithCoder:(id)a3;
- (void)record;
- (void)setAddress:(id)a3;
- (void)setAutocompleteResult:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setDisplayString:(id)a3;
- (void)setIdentifier:(int)a3;
- (void)setLabel:(id)a3;
- (void)setOriginContext:(id)a3;
- (void)setRecord:(void *)a3 recordID:(int)a4 identifier:(int)a5;
- (void)setSourceType:(unint64_t)a3;
- (void)setUnlocalizedLabel:(id)a3;
- (void)setValueIdentifier:(id)a3;
@end

@implementation MFComposeRecipient

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.mobilemail.recipient";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 isEqualToString:@"com.apple.mobilemail.recipient"])
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v8 error:0];
    v11 = (void *)[objc_alloc((Class)a1) initWithCoder:v10];
    [v10 finishDecoding];

    if (!a5) {
      goto LABEL_7;
    }
  }
  else
  {
    v11 = 0;
    if (!a5) {
      goto LABEL_7;
    }
  }
  if (!v11)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
  }
LABEL_7:

  return v11;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  [v2 addObject:@"com.apple.mobilemail.recipient"];
  v3 = [(id)*MEMORY[0x1E4F44518] identifier];
  [v2 addObject:v3];

  v4 = [NSString writableTypeIdentifiersForItemProvider];
  [v2 addObjectsFromArray:v4];

  return (NSArray *)v2;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a4;
  id v8 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v6];
  if ([v6 isEqualToString:@"com.apple.mobilemail.recipient"])
  {
    id v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
    v7[2](v7, v9, 0);

LABEL_3:
    v10 = 0;
    goto LABEL_10;
  }
  if ([v8 conformsToType:*MEMORY[0x1E4F44470]])
  {
    v11 = [(MFComposeRecipient *)self commentedAddress];
    v10 = [v11 loadDataWithTypeIdentifier:v6 forItemProviderCompletionHandler:v7];
  }
  else
  {
    if ([v8 conformsToType:*MEMORY[0x1E4F44518]])
    {
      v12 = [(MFComposeRecipient *)self contact];
      v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        v16 = (void *)MEMORY[0x1E4F1B8F8];
        v17 = [(MFComposeRecipient *)self commentedAddress];
        objc_msgSend(v16, "em_contactFromEmailAddress:", v17);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v18 = (void *)MEMORY[0x1E4F1B998];
      v23[0] = v14;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      id v22 = 0;
      v20 = [v18 dataWithContacts:v19 error:&v22];
      id v21 = v22;

      ((void (**)(id, void *, id))v7)[2](v7, v20, v21);
      goto LABEL_3;
    }
    v7[2](v7, 0, 0);
    v10 = 0;
  }
LABEL_10:

  return v10;
}

- (MFComposeRecipient)init
{
  return [(MFComposeRecipient *)self initWithContact:0 address:0 kind:5];
}

- (MFComposeRecipient)initWithContact:(id)a3 address:(id)a4 kind:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MFComposeRecipient;
  v11 = [(MFComposeRecipient *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contact, a3);
    uint64_t v13 = [v10 copy];
    address = v12->_address;
    v12->_address = (NSString *)v13;

    v12->_kind = a5;
  }

  return v12;
}

+ (id)composeRecipientWithAutocompleteResult:(id)a3
{
  id v3 = a3;
  if ([v3 resultType])
  {
    if ([v3 resultType] == 1)
    {
      v4 = [[MFComposeRecipientGroup alloc] initWithChildren:0 displayString:0];
      [(MFComposeRecipient *)v4 setAutocompleteResult:v3];
    }
    else
    {
      v4 = 0;
    }
    goto LABEL_24;
  }
  v5 = [v3 value];
  uint64_t v6 = [v5 addressType];

  if ((unint64_t)(v6 - 1) >= 3) {
    uint64_t v7 = 5;
  }
  else {
    uint64_t v7 = v6 - 1;
  }
  id v8 = [v3 value];
  id v9 = [v8 address];

  if (v9 && (objc_msgSend(v9, "ea_isLegalEmailAddress") & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
    v11 = [v10 scheme];
    if ([v11 length])
    {
      if ([@"mailto" isEqualToString:v11])
      {
        uint64_t v12 = [v10 resourceSpecifier];

        uint64_t v7 = 0;
      }
      else
      {
        if (![@"tel" isEqualToString:v11])
        {
          if ([@"urn" isEqualToString:v11]) {
            uint64_t v7 = 4;
          }
          goto LABEL_18;
        }
        uint64_t v12 = [v10 resourceSpecifier];

        uint64_t v7 = 1;
      }
      id v9 = (void *)v12;
    }
LABEL_18:
  }
  if ([v9 length])
  {
    v4 = [[MFComposeRecipient alloc] initWithContact:0 address:v9 kind:v7];
    [(MFComposeRecipient *)v4 setAutocompleteResult:v3];
    uint64_t v13 = [v3 displayName];
    [(MFComposeRecipient *)v4 setDisplayString:v13];

    id v14 = [v3 value];
    v15 = [v14 identifier];
    [(MFComposeRecipient *)v4 setValueIdentifier:v15];

    objc_super v16 = [v3 value];
    v17 = [v16 label];
    [(MFComposeRecipient *)v4 setUnlocalizedLabel:v17];

    -[MFComposeRecipient setSourceType:](v4, "setSourceType:", [v3 sourceType]);
    v18 = [v3 identifier];

    if (v18)
    {
      v19 = [v3 identifier];
      [(MFComposeRecipient *)v4 setContactIdentifier:v19];
    }
  }
  else
  {
    v4 = 0;
  }

LABEL_24:

  return v4;
}

- (MFComposeRecipient)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contact"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"property"];
  unsigned int v19 = -1431655766;
  [v6 getValue:&v19 size:4];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactIdentifier"];
  id v8 = [v4 decodeObjectForKey:@"address"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"kind"];
  if (v5 || ![v4 containsValueForKey:@"recordID"])
  {
    self = [(MFComposeRecipient *)self initWithContact:v5 address:v8 kind:v9];
  }
  else
  {
    objc_super v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordID"];
    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"address"];
    v11 = +[MFAddressBookManager sharedManager];
    uint64_t v12 = (const void *)[v11 addressBook];

    ABRecordID recordID = -1431655766;
    [v16 getValue:&recordID size:4];
    unsigned int v17 = -1431655766;
    [v15 getValue:&v17 size:4];
    ABRecordRef PersonWithRecordID = ABAddressBookGetPersonWithRecordID(v12, recordID);
    if (PersonWithRecordID) {
      self = [(MFComposeRecipient *)self initWithRecord:PersonWithRecordID recordID:recordID property:v19 identifier:v17 address:v10];
    }
  }
  -[MFComposeRecipient setContactIdentifier:](self, "setContactIdentifier:", v7, v15);

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  if (*(_OWORD *)&self->_contact == 0)
  {
    if (self->_record)
    {
      uint64_t v6 = [MEMORY[0x1E4F29238] valueWithBytes:&self->_property objCType:"i"];
      [v9 encodeObject:v6 forKey:@"property"];
      if (self->_recordID)
      {
        uint64_t v7 = [MEMORY[0x1E4F29238] valueWithBytes:&self->_recordID objCType:"i"];
        [v9 encodeObject:v7 forKey:@"recordID"];
        id v8 = [MEMORY[0x1E4F29238] valueWithBytes:&self->_identifier objCType:"i"];
        [v9 encodeObject:v8 forKey:@"identifier"];
      }
    }
  }
  else
  {
    objc_msgSend(v9, "encodeObject:forKey:");
  }
  address = self->_address;
  if (address) {
    [v9 encodeObject:address forKey:@"address"];
  }
  unint64_t kind = self->_kind;
  if (kind) {
    [v9 encodeInteger:kind forKey:@"kind"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MFComposeRecipient)initWithRecord:(void *)a3 recordID:(int)a4 property:(int)a5 identifier:(int)a6 address:(id)a7
{
  id v13 = a7;
  int v14 = *MEMORY[0x1E4F49CC8];
  if (*MEMORY[0x1E4F49CC8] == a5)
  {
    uint64_t v15 = 1;
  }
  else if (*MEMORY[0x1E4F49AC0] == a5)
  {
    uint64_t v15 = 0;
  }
  else if (*MEMORY[0x1E4F49B48] == a5)
  {
    uint64_t v15 = 2;
  }
  else
  {
    uint64_t v15 = 5;
  }
  objc_super v16 = [(MFComposeRecipient *)self initWithContact:0 address:v13 kind:v15];
  if (v16)
  {
    if (a3)
    {
      v16->_record = (void *)CFRetain(a3);
      v16->_ABRecordID recordID = a4;
    }
    else
    {
      a6 = -1;
    }
    v16->_identifier = a6;
    objc_storeStrong((id *)&v16->_address, a7);
    v16->_property = a5;
    if (v14 == a5)
    {
      uint64_t v17 = 1;
    }
    else if (*MEMORY[0x1E4F49AC0] == a5)
    {
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = 5;
      if (*MEMORY[0x1E4F49B48] == a5) {
        uint64_t v17 = 2;
      }
    }
    v16->_unint64_t kind = v17;
  }

  return v16;
}

+ (id)recipientWithRecord:(void *)a3 recordID:(int)a4 property:(int)a5 identifier:(int)a6
{
  uint64_t v6 = (void *)[objc_alloc((Class)a1) initWithRecord:a3 recordID:*(void *)&a4 property:*(void *)&a5 identifier:*(void *)&a6 address:0];

  return v6;
}

+ (id)recipientWithRecord:(void *)a3 property:(int)a4 identifier:(int)a5
{
  v5 = (void *)[objc_alloc((Class)a1) initWithRecord:a3 recordID:0xFFFFFFFFLL property:*(void *)&a4 identifier:*(void *)&a5 address:0];

  return v5;
}

+ (id)recipientWithProperty:(int)a3 address:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithRecord:0 recordID:0xFFFFFFFFLL property:v4 identifier:0xFFFFFFFFLL address:v6];

  return v7;
}

- (int)property
{
  return self->_property;
}

- (void)record
{
  return self->_record;
}

- (void)setRecord:(void *)a3 recordID:(int)a4 identifier:(int)a5
{
  if (a3 && !self->_record)
  {
    self->_record = (void *)CFRetain(a3);
    self->_ABRecordID recordID = a4;
    self->_identifier = a5;
    label = self->_label;
    self->_label = 0;
  }
}

- (int)recordID
{
  return self->_recordID;
}

- (int)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int)a3
{
  if (self->_identifier != a3)
  {
    v5 = [(MFComposeRecipient *)self record];
    if (v5)
    {
      CFTypeRef v6 = ABRecordCopyValue(v5, self->_property);
      if (v6)
      {
        uint64_t v7 = v6;
        if (ABMultiValueGetCount(v6) >= 1 && ABMultiValueGetIndexForIdentifier(v7, a3) != -1)
        {
          self->_identifier = a3;
          label = self->_label;
          self->_label = 0;
        }
        CFRelease(v7);
      }
    }
  }
}

+ (id)_requiredKeyDescriptors
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F1BBA8], "descriptorForRequiredKeys", *MEMORY[0x1E4F1ADC8], *MEMORY[0x1E4F1AEE0]);
  v5[2] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];

  return v3;
}

- (CNContact)contact
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  contact = self->_contact;
  if (contact) {
    goto LABEL_13;
  }
  autocompleteResult = self->_autocompleteResult;
  if (!autocompleteResult)
  {
    id v9 = 0;
    goto LABEL_6;
  }
  v5 = +[MFComposeRecipient _requiredKeyDescriptors];
  id v20 = 0;
  CFTypeRef v6 = [(CNAutocompleteResult *)autocompleteResult contactWithKeysToFetch:v5 error:&v20];
  id v7 = v20;
  id v8 = self->_contact;
  self->_contact = v6;

  id v9 = v7;
  if (!self->_contact)
  {
LABEL_6:
    if (self->_contactIdentifier)
    {
      id v10 = [MEMORY[0x1E4F1B980] storeWithOptions:3];
      contactIdentifier = self->_contactIdentifier;
      uint64_t v12 = +[MFComposeRecipient _requiredKeyDescriptors];
      id v19 = v9;
      id v13 = [v10 unifiedContactWithIdentifier:contactIdentifier keysToFetch:v12 error:&v19];
      id v14 = v19;

      uint64_t v15 = self->_contact;
      self->_contact = v13;

      id v9 = v14;
    }
  }
  if (v9)
  {
    objc_super v16 = MFLogGeneral();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v9 localizedDescription];
      *(_DWORD *)buf = 134218242;
      id v22 = self;
      __int16 v23 = 2112;
      v24 = v17;
      _os_log_impl(&dword_1AF945000, v16, OS_LOG_TYPE_DEFAULT, "#Warning Error fetching contact for recipient: %p, %@", buf, 0x16u);
    }
  }

  contact = self->_contact;
LABEL_13:

  return contact;
}

- (id)children
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)sortedChildren
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)childrenWithCompleteMatches
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)isGroup
{
  return 0;
}

- (BOOL)isRemovableFromSearchResults
{
  BOOL v3 = ([(MFComposeRecipient *)self sourceType] & 5) != 0;
  return ([(MFComposeRecipient *)self sourceType] & 2) == 0 && v3;
}

- (BOOL)showsAccessoryButton
{
  if ([(MFComposeRecipient *)self isSuggestedRecipient]) {
    return 1;
  }

  return [(MFComposeRecipient *)self isRemovableFromSearchResults];
}

- (BOOL)wasCompleteMatch
{
  v8[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MFComposeRecipientOriginContext *)self->_originContext searchTerm];
  v8[0] = self;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  uint64_t v7 = 0;
  BOOL v5 = _fastCountOfCompleteMatches(v3, v4, &v7) != 0;

  return v5;
}

- (BOOL)isSuggestedRecipient
{
  return [(MFComposeRecipient *)self sourceType] == 4
      || [(MFComposeRecipient *)self sourceType] == 20;
}

- (BOOL)isDirectoryServerResult
{
  return [(MFComposeRecipient *)self sourceType] == 8;
}

- (id)completelyMatchedAttributedStrings
{
  v14[1] = *MEMORY[0x1E4F143B8];
  cachedMatchedStrings = self->_cachedMatchedStrings;
  if (!cachedMatchedStrings)
  {
    uint64_t v4 = [(MFComposeRecipientOriginContext *)self->_originContext searchTerm];
    v14[0] = self;
    BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    id v12 = 0;
    id v13 = 0;
    id v6 = _sortedArrayByRelevancy(v4, v5, &v13, &v12);
    id v7 = v13;
    id v8 = (NSArray *)v12;

    id v10 = self->_cachedMatchedStrings;
    p_cachedMatchedStrings = &self->_cachedMatchedStrings;
    *p_cachedMatchedStrings = v8;

    cachedMatchedStrings = *p_cachedMatchedStrings;
  }

  return cachedMatchedStrings;
}

- (id)preferredSendingAddress
{
  return (id)[(CNAutocompleteResult *)self->_autocompleteResult lastSendingAddress];
}

- (NSString)address
{
  BOOL v3 = [(MFComposeRecipient *)self uncommentedAddress];
  unint64_t kind = self->_kind;
  id v5 = v3;
  id v6 = v5;
  id v7 = v5;
  if (v5)
  {
    id v7 = v5;
    if (kind == 1)
    {
      id v8 = (void *)CPPhoneNumberCopyFormattedStringForTextMessage();
      id v9 = v8;
      id v7 = v6;
      if (v8)
      {
        id v10 = v8;

        id v7 = [@"\u200E" stringByAppendingString:v10];
      }
    }
  }

  return (NSString *)v7;
}

- (void)setAddress:(id)a3
{
  id v7 = a3;
  uint64_t v4 = (NSString *)[v7 copy];
  address = self->_address;
  self->_address = v4;

  compositeName = self->_compositeName;
  self->_compositeName = 0;
}

- (NSString)normalizedAddress
{
  BOOL v3 = [(MFComposeRecipient *)self uncommentedAddress];
  unint64_t kind = self->_kind;
  id v5 = v3;
  id v6 = v5;
  id v7 = v5;
  if (!v5) {
    goto LABEL_15;
  }
  id v7 = v5;
  if (kind != 1) {
    goto LABEL_15;
  }
  id v8 = v5;
  [v8 UTF8String];
  id v9 = (char *)CPPhoneNumberCopyNormalized();
  if (!v9)
  {
    id v7 = v8;
    goto LABEL_15;
  }
  CFStringRef v10 = CFStringCreateWithCString(0, v9, 0x8000100u);
  v11 = (const void *)CPPhoneNumberCopyHomeCountryCode();
  id v12 = (const void *)CFPhoneNumberCreate();
  uint64_t String = CFPhoneNumberCreateString();

  id v7 = (void *)String;
  if (String)
  {
    if (!v12) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v7 = (void *)CFPhoneNumberCreateString();
  if (v12) {
LABEL_9:
  }
    CFRelease(v12);
LABEL_10:
  if (v11) {
    CFRelease(v11);
  }
  if (v10) {
    CFRelease(v10);
  }
  free(v9);
LABEL_15:

  return (NSString *)v7;
}

- (NSString)commentedAddress
{
  if (self->_kind)
  {
    BOOL v3 = [(MFComposeRecipient *)self address];
  }
  else
  {
    uint64_t v4 = [(MFComposeRecipient *)self uncommentedAddress];
    uint64_t v5 = [(MFComposeRecipient *)self compositeName];
    id v6 = (void *)v5;
    if (v4 && v5)
    {
      id v7 = [MEMORY[0x1E4F605A0] formattedAddressWithName:v5 email:v4 useQuotes:1];
    }
    else
    {
      id v7 = v4;
    }
    BOOL v3 = v7;
    if (!v7)
    {
      address = self->_address;
      if (address)
      {
        id v9 = [(NSString *)address ea_uncommentedAddress];
        CFStringRef v10 = [(NSString *)self->_address ea_addressComment];
        BOOL v3 = [MEMORY[0x1E4F605A0] formattedAddressWithName:v10 email:v9 useQuotes:1];
      }
      else
      {
        BOOL v3 = 0;
      }
    }
  }

  return (NSString *)v3;
}

- (NSString)label
{
  label = self->_label;
  if (!label)
  {
    uint64_t v4 = [(MFComposeRecipient *)self unlocalizedLabel];
    if (v4)
    {
      uint64_t v5 = [(MFComposeRecipient *)self contact];

      if (v5)
      {
        id v6 = [MEMORY[0x1E4F1BA20] localizedStringForLabel:v4];
      }
      else
      {
        id v6 = (NSString *)ABAddressBookCopyLocalizedLabel(v4);
      }
      id v7 = self->_label;
      self->_label = v6;
    }
    label = self->_label;
  }

  return label;
}

- (NSString)unlocalizedLabel
{
  BOOL v3 = [(MFComposeRecipient *)self contact];

  if (v3)
  {
    uint64_t v4 = self->_unlocalizedLabel;
  }
  else if ([(MFComposeRecipient *)self record] {
         && (v5 = ABRecordCopyValue([(MFComposeRecipient *)self record], self->_property), (id v6 = v5) != 0))
  }
  {
    if (ABMultiValueGetCount(v5) < 1
      || (CFIndex IndexForIdentifier = ABMultiValueGetIndexForIdentifier(v6, self->_identifier), IndexForIdentifier == -1))
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = (__CFString *)ABMultiValueCopyLabelAtIndex(v6, IndexForIdentifier);
    }
    CFRelease(v6);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)compositeName
{
  compositeName = self->_compositeName;
  if (!compositeName)
  {
    uint64_t v4 = [(MFComposeRecipient *)self contact];

    if (v4)
    {
      CFTypeRef v5 = (void *)MEMORY[0x1E4F1B910];
      id v6 = [(MFComposeRecipient *)self contact];
      id v7 = [v5 stringFromContact:v6 style:0];

      if (!v7) {
        goto LABEL_7;
      }
    }
    else if (![(MFComposeRecipient *)self record] {
           || (id v7 = (NSString *)ABRecordCopyCompositeName([(MFComposeRecipient *)self record])) == 0)
    }
    {
LABEL_7:
      if (self->_kind)
      {
        id v7 = 0;
      }
      else
      {
        id v8 = [(NSString *)self->_address ea_addressComment];
        id v9 = (NSString *)[v8 copy];

        if (v9 == self->_address) {
          id v7 = 0;
        }
        else {
          id v7 = v9;
        }
      }
    }
    CFStringRef v10 = self->_compositeName;
    self->_compositeName = v7;

    compositeName = self->_compositeName;
  }

  return compositeName;
}

- (NSString)shortName
{
  BOOL v3 = [(MFComposeRecipient *)self compositeName];
  uint64_t v4 = v3;
  if (!v3) {
    goto LABEL_3;
  }
  CFTypeRef v5 = objc_msgSend(v3, "ea_personNameComponents");
  id v6 = objc_alloc_init(MEMORY[0x1E4F28F38]);
  [v6 setStyle:1];
  id v7 = [v6 stringFromPersonNameComponents:v5];

  if (!v7)
  {
LABEL_3:
    id v8 = [(MFComposeRecipient *)self address];
    id v9 = v8;
    if (v8)
    {
      if (objc_msgSend(v8, "ea_isLegalEmailAddress"))
      {
        objc_msgSend(v9, "substringToIndex:", objc_msgSend(MEMORY[0x1E4F605B0], "rangeOfAddressDomainFromAddress:", v9) - 1);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v10 = v9;
      }
      id v7 = v10;
    }
    else
    {
      id v7 = 0;
    }
  }

  return (NSString *)v7;
}

- (NSString)displayString
{
  BOOL v3 = self->_displayString;
  if (![(NSString *)v3 length])
  {
    uint64_t v4 = [(MFComposeRecipient *)self compositeName];

    BOOL v3 = (NSString *)v4;
    if (!v4)
    {
      BOOL v3 = [(MFComposeRecipient *)self address];
      if (!v3)
      {
        BOOL v3 = [(MFComposeRecipient *)self placeholderName];
      }
    }
  }

  return v3;
}

- (NSString)placeholderName
{
  unint64_t v2 = [(MFComposeRecipient *)self sourceType];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = v3;
  if (v2 == 1) {
    [v3 localizedStringForKey:@"RECENT_PLACEHOLDER_NAME" value:&stru_1F0817A00 table:@"Main"];
  }
  else {
  CFTypeRef v5 = [v3 localizedStringForKey:@"PLACEHOLDER_NAME" value:&stru_1F0817A00 table:@"Main"];
  }

  return (NSString *)v5;
}

- (NSString)uncommentedAddress
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  address = self->_address;
  if (address)
  {
    if (self->_kind)
    {
      uint64_t v4 = address;
    }
    else
    {
      uint64_t v4 = [(NSString *)address ea_uncommentedAddress];
    }
    id v8 = v4;
    goto LABEL_17;
  }
  CFTypeRef v5 = [(MFComposeRecipient *)self contact];

  if (!v5)
  {
    uint64_t v15 = [(MFComposeRecipient *)self record];
    if (!v15 || (CFTypeRef v16 = ABRecordCopyValue(v15, self->_property), (v17 = v16) == 0))
    {
      id v8 = 0;
      goto LABEL_17;
    }
    if (ABMultiValueGetCount(v16) < 1) {
      goto LABEL_25;
    }
    ABMultiValueIdentifier identifier = self->_identifier;
    if (identifier < 0)
    {
      CFIndex IndexForIdentifier = 0;
    }
    else
    {
      CFIndex IndexForIdentifier = ABMultiValueGetIndexForIdentifier(v17, identifier);
      if (IndexForIdentifier == -1)
      {
LABEL_25:
        id v8 = 0;
LABEL_42:
        CFRelease(v17);
        goto LABEL_17;
      }
    }
    id v8 = (void *)ABMultiValueCopyValueAtIndex(v17, IndexForIdentifier);
    goto LABEL_42;
  }
  if (self->_kind == 1)
  {
    long long v34 = 0uLL;
    long long v35 = 0uLL;
    long long v32 = 0uLL;
    long long v33 = 0uLL;
    id v6 = [(MFComposeRecipient *)self contact];
    id v7 = [v6 phoneNumbers];

    id v8 = (void *)[v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v33;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v12 = [v11 identifier];
          int v13 = [v12 isEqualToString:self->_valueIdentifier];

          if (v13)
          {
            v27 = [v11 value];
            id v8 = [v27 stringValue];

            goto LABEL_37;
          }
        }
        id v8 = (void *)[v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_37:
  }
  else
  {
    long long v30 = 0uLL;
    long long v31 = 0uLL;
    *((void *)&v28 + 1) = 0;
    long long v29 = 0uLL;
    id v20 = [(MFComposeRecipient *)self contact];
    id v21 = [v20 emailAddresses];

    id v8 = (void *)[v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v8)
    {
      uint64_t v22 = *(void *)v29;
      while (2)
      {
        for (j = 0; j != v8; j = (char *)j + 1)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v21);
          }
          v24 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
          uint64_t v25 = [v24 identifier];
          int v26 = [v25 isEqualToString:self->_valueIdentifier];

          if (v26)
          {
            id v8 = [v24 value];
            goto LABEL_39;
          }
        }
        id v8 = (void *)[v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_39:
  }
LABEL_17:

  return (NSString *)v8;
}

- (void)setOriginContext:(id)a3
{
}

- (id)_unformattedAddress
{
  BOOL v3 = [(MFComposeRecipient *)self uncommentedAddress];
  if (self->_kind == 1)
  {
    uint64_t v4 = UIUnformattedPhoneNumberFromString();

    BOOL v3 = (void *)v4;
  }

  return v3;
}

- (id)labeledValueIdentifier
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  int v13 = __Block_byref_object_copy__1;
  id v14 = __Block_byref_object_dispose__1;
  id v15 = 0;
  BOOL v3 = [(MFComposeRecipient *)self contact];
  if (v3)
  {
    address = self->_address;

    if (address)
    {
      CFTypeRef v5 = [(MFComposeRecipient *)self contact];
      id v6 = [v5 emailAddresses];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __44__MFComposeRecipient_labeledValueIdentifier__block_invoke;
      v9[3] = &unk_1E5F79AA0;
      v9[4] = self;
      v9[5] = &v10;
      [v6 enumerateObjectsUsingBlock:v9];
    }
  }
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __44__MFComposeRecipient_labeledValueIdentifier__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  id v6 = [v11 value];
  int v7 = [v6 isEqualToString:*(void *)(*(void *)(a1 + 32) + 32)];

  if (v7)
  {
    uint64_t v8 = [v11 identifier];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MFComposeRecipient *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    if (self->_kind == 1)
    {
      id v5 = [(MFComposeRecipient *)self _unformattedAddress];
      [v5 UTF8String];

      id v6 = [(MFComposeRecipient *)v4 _unformattedAddress];
      [v6 UTF8String];

      int v7 = [(MFComposeRecipient *)self countryCode];
      if (!v7)
      {
        active = (const void *)CPPhoneNumberCopyActiveCountryCode();
        CFAutorelease(active);
      }
      char v9 = CPPhoneNumbersEqual();
    }
    else
    {
      uint64_t v10 = [(MFComposeRecipient *)self address];
      if (!v10
        || ([(MFComposeRecipient *)v4 address],
            id v11 = objc_claimAutoreleasedReturnValue(),
            v11,
            v10,
            !v11))
      {
        char v9 = 0;
        goto LABEL_12;
      }
      int v7 = [(MFComposeRecipient *)v4 address];
      uint64_t v12 = [(MFComposeRecipient *)self address];
      char v9 = objc_msgSend(v12, "ea_isEqualToEmailAddress:", v7);
    }
  }
LABEL_12:

  return v9;
}

- (unint64_t)hash
{
  if ([(MFComposeRecipient *)self record] && *MEMORY[0x1E4F49CC8] == self->_property)
  {
    BOOL v3 = [(MFComposeRecipient *)self _unformattedAddress];
    if (v3)
    {
      char v8 = 0;
      CPPhoneNumberGetLastFour();
    }
    unint64_t v4 = 0;
    goto LABEL_10;
  }
  id v5 = [(MFComposeRecipient *)self address];

  if (v5)
  {
    BOOL v3 = [(MFComposeRecipient *)self address];
    unint64_t v4 = [v3 hash];
LABEL_10:

    return v4;
  }
  v7.receiver = self;
  v7.super_class = (Class)MFComposeRecipient;
  return [(MFComposeRecipient *)&v7 hash];
}

- (NSString)description
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  if (([(MFComposeRecipient *)self sourceType] & 2) != 0) {
    [v3 addObject:@"Contact"];
  }
  if (([(MFComposeRecipient *)self sourceType] & 0x10) != 0) {
    [v3 addObject:@"Prediction"];
  }
  if ([(MFComposeRecipient *)self sourceType]) {
    [v3 addObject:@"Recent"];
  }
  if (([(MFComposeRecipient *)self sourceType] & 0x48) != 0) {
    [v3 addObject:@"Server"];
  }
  if (([(MFComposeRecipient *)self sourceType] & 4) != 0) {
    [v3 addObject:@"Suggestion"];
  }
  if (![(MFComposeRecipient *)self sourceType]) {
    [v3 addObject:@"<undefined>"];
  }
  unint64_t v4 = [v3 componentsJoinedByString:@"+"];
  id v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  objc_super v7 = NSStringFromClass(v6);
  char v8 = [(MFComposeRecipient *)self displayString];
  char v9 = [(MFComposeRecipient *)self address];
  objc_msgSend(v5, "stringWithFormat:", @"<%@: %p; displayString: %@; address: %@; autocompleteSource: %@>",
    v7,
    self,
    v8,
    v9,
  uint64_t v10 = v4);

  return (NSString *)v10;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (MFComposeRecipientOriginContext)originContext
{
  return self->_originContext;
}

- (void)setLabel:(id)a3
{
}

- (void)setUnlocalizedLabel:(id)a3
{
}

- (void)setDisplayString:(id)a3
{
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSString)valueIdentifier
{
  return self->_valueIdentifier;
}

- (void)setValueIdentifier:(id)a3
{
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(unint64_t)a3
{
  self->_sourceType = a3;
}

- (void)setContact:(id)a3
{
}

- (CNAutocompleteResult)autocompleteResult
{
  return self->_autocompleteResult;
}

- (void)setAutocompleteResult:(id)a3
{
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originContext, 0);
  objc_storeStrong((id *)&self->_unlocalizedLabel, 0);
  objc_storeStrong((id *)&self->_compositeName, 0);
  objc_storeStrong((id *)&self->_valueIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_autocompleteResult, 0);
  objc_storeStrong((id *)&self->_cachedSortedMembers, 0);
  objc_storeStrong((id *)&self->_cachedMatchedStrings, 0);
  objc_storeStrong((id *)&self->_cachedCompleteMatches, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_address, 0);
}

@end