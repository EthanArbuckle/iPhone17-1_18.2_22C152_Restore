@interface CNComposeRecipient
+ (BOOL)supportsSecureCoding;
+ (CNComposeRecipient)composeRecipientWithAutocompleteResult:(id)a3;
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (OS_os_log)namingLog;
+ (OS_os_log)os_log;
+ (id)descriptorsForRequiredKeysForContact;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
- (BOOL)isDirectoryServerResult;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentAddressToRecipient:(id)a3;
- (BOOL)isGroup;
- (BOOL)isMemberOfGroup;
- (BOOL)isRemovableFromSearchResults;
- (BOOL)isSuggestedRecipient;
- (BOOL)showsAccessoryButton;
- (BOOL)showsChevronButton;
- (BOOL)supportsPasteboardUnarchiving;
- (BOOL)wasCompleteMatch;
- (CNAutocompleteResult)autocompleteResult;
- (CNComposeRecipient)init;
- (CNComposeRecipient)initWithCoder:(id)a3;
- (CNComposeRecipient)initWithContact:(id)a3 address:(id)a4 displayString:(id)a5 kind:(unint64_t)a6;
- (CNComposeRecipient)initWithContact:(id)a3 address:(id)a4 kind:(unint64_t)a5;
- (CNComposeRecipientOriginContext)originContext;
- (CNContact)contact;
- (NSArray)cachedCompleteMatches;
- (NSArray)cachedMatchedStrings;
- (NSArray)cachedSortedMembers;
- (NSPersonNameComponents)nameComponents;
- (NSSet)cachedHandles;
- (NSString)address;
- (NSString)commentedAddress;
- (NSString)compositeName;
- (NSString)contactIdentifier;
- (NSString)countryCode;
- (NSString)description;
- (NSString)displayString;
- (NSString)inputAddress;
- (NSString)label;
- (NSString)normalizedAddress;
- (NSString)pasteboardString;
- (NSString)placeholderName;
- (NSString)shortName;
- (NSString)stringForEqualityTesting;
- (NSString)uncommentedAddress;
- (NSString)unlocalizedLabel;
- (NSString)valueIdentifier;
- (id)_unformattedAddress;
- (id)associatedHandles;
- (id)children;
- (id)childrenWithCompleteMatches;
- (id)completelyMatchedAttributedStrings;
- (id)contactWithKeysToFetch:(id)a3;
- (id)fetchContactWithKeys:(id)a3;
- (id)labeledValueIdentifier;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (id)nameComponentsFromAddress;
- (id)nameComponentsFromContact;
- (id)preferredSendingAddress;
- (id)rawDisplayString;
- (id)sortedChildren;
- (id)unifiedHandles;
- (unint64_t)hash;
- (unint64_t)kind;
- (unint64_t)sourceType;
- (void)addRecipientToPasteboard:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAddress:(id)a3;
- (void)setAutocompleteResult:(id)a3;
- (void)setCachedCompleteMatches:(id)a3;
- (void)setCachedHandles:(id)a3;
- (void)setCachedMatchedStrings:(id)a3;
- (void)setCachedSortedMembers:(id)a3;
- (void)setCompositeName:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setDisplayString:(id)a3;
- (void)setInputAddress:(id)a3;
- (void)setIsMemberOfGroup:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setNameComponents:(id)a3;
- (void)setOriginContext:(id)a3;
- (void)setUnlocalizedLabel:(id)a3;
- (void)setValueIdentifier:(id)a3;
@end

@implementation CNComposeRecipient

+ (OS_os_log)os_log
{
  if (os_log_cn_once_token_5 != -1) {
    dispatch_once(&os_log_cn_once_token_5, &__block_literal_global_7);
  }
  v2 = (void *)os_log_cn_once_object_5;

  return (OS_os_log *)v2;
}

uint64_t __28__CNComposeRecipient_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.autocomplete.ui", "compose-recipient");
  uint64_t v1 = os_log_cn_once_object_5;
  os_log_cn_once_object_5 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (OS_os_log)namingLog
{
  if (namingLog_cn_once_token_6 != -1) {
    dispatch_once(&namingLog_cn_once_token_6, &__block_literal_global_37);
  }
  v2 = (void *)namingLog_cn_once_object_6;

  return (OS_os_log *)v2;
}

uint64_t __31__CNComposeRecipient_namingLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.autocomplete.ui", "compose-recipient-naming");
  uint64_t v1 = namingLog_cn_once_object_6;
  namingLog_cn_once_object_6 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)descriptorsForRequiredKeysForContact
{
  v7[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F1AEE0];
  v7[0] = *MEMORY[0x1E4F1ADC8];
  v7[1] = v2;
  v3 = [MEMORY[0x1E4F1BBA8] descriptorForRequiredKeys];
  v7[2] = v3;
  v4 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v7[3] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];

  return v5;
}

- (CNComposeRecipient)init
{
  return [(CNComposeRecipient *)self initWithContact:0 address:0 kind:5];
}

- (CNComposeRecipient)initWithContact:(id)a3 address:(id)a4 kind:(unint64_t)a5
{
  return [(CNComposeRecipient *)self initWithContact:a3 address:a4 displayString:0 kind:a5];
}

- (CNComposeRecipient)initWithContact:(id)a3 address:(id)a4 displayString:(id)a5 kind:(unint64_t)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CNComposeRecipient;
  v14 = [(CNComposeRecipient *)&v26 init];
  if (v14)
  {
    v15 = [(id)objc_opt_class() namingLog];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v24 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v24);
      *(_DWORD *)buf = 138544387;
      v28 = v25;
      __int16 v29 = 2048;
      v30 = v14;
      __int16 v31 = 2113;
      id v32 = v13;
      __int16 v33 = 2113;
      id v34 = v12;
      __int16 v35 = 2048;
      unint64_t v36 = a6;
      _os_log_debug_impl(&dword_1B5AF5000, v15, OS_LOG_TYPE_DEBUG, "Initializing %{public}@ %p with displayString '%{private}@', address '%{private}@' (%lu)", buf, 0x34u);
    }
    objc_storeStrong((id *)&v14->_contact, a3);
    uint64_t v16 = [v12 copy];
    inputAddress = v14->_inputAddress;
    v14->_inputAddress = (NSString *)v16;

    uint64_t v18 = _displayableAddressOfKind(v12, a6);
    address = v14->_address;
    v14->_address = (NSString *)v18;

    if (v13)
    {
      uint64_t v20 = [v13 copy];
      displayString = v14->_displayString;
      v14->_displayString = (NSString *)v20;
    }
    else
    {
      displayString = v14->_displayString;
      v14->_displayString = (NSString *)&stru_1F0EC0C28;
    }

    v14->_kind = a6;
    v22 = v14;
  }

  return v14;
}

+ (CNComposeRecipient)composeRecipientWithAutocompleteResult:(id)a3
{
  id v3 = a3;
  if (![v3 resultType])
  {
    v7 = [v3 value];
    uint64_t v8 = [v7 addressType];

    if ((unint64_t)(v8 - 1) > 4) {
      uint64_t v9 = 5;
    }
    else {
      uint64_t v9 = qword_1B5B40CA8[v8 - 1];
    }
    v10 = [v3 value];
    id v11 = [v10 address];

    if (!v11 || (objc_msgSend(v11, "ea_isLegalEmailAddress") & 1) != 0)
    {
LABEL_19:
      if ([v11 length])
      {
        v6 = [[CNComposeRecipient alloc] initWithContact:0 address:v11 kind:v9];
        [(CNComposeRecipient *)v6 setAutocompleteResult:v3];
        v15 = [v3 displayName];
        [(CNComposeRecipient *)v6 setDisplayString:v15];

        uint64_t v16 = [v3 value];
        v17 = [v16 identifier];
        [(CNComposeRecipient *)v6 setValueIdentifier:v17];

        uint64_t v18 = [v3 value];
        v19 = [v18 label];
        [(CNComposeRecipient *)v6 setUnlocalizedLabel:v19];

        uint64_t v20 = [v3 identifier];

        if (v20)
        {
          v21 = [v3 identifier];
          [(CNComposeRecipient *)v6 setContactIdentifier:v21];
        }
      }
      else
      {
        v6 = 0;
      }
      v22 = [v3 nameComponents];
      if (v22)
      {
        v23 = objc_opt_new();
        v24 = [v22 firstName];
        [v23 setGivenName:v24];

        v25 = [v22 lastName];
        [v23 setFamilyName:v25];

        objc_super v26 = [v22 nickname];
        [v23 setNickname:v26];

        v27 = [v22 nameSuffix];
        [v23 setNameSuffix:v27];

        [(CNComposeRecipient *)v6 setNameComponents:v23];
      }
      else
      {
        v28 = [v3 displayName];
        __int16 v29 = _normalizeAddressOfKind(v28, 1);
        char v30 = [v11 isEqualToString:v29];

        if (v30)
        {
LABEL_28:

          goto LABEL_29;
        }
        __int16 v31 = (void *)MEMORY[0x1E4F5A470];
        v23 = [v3 displayName];
        id v32 = [v31 componentsFromString:v23];
        [(CNComposeRecipient *)v6 setNameComponents:v32];
      }
      goto LABEL_28;
    }
    id v12 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
    id v13 = [v12 scheme];
    if ([v13 length])
    {
      if ([@"mailto" isEqualToString:v13])
      {
        uint64_t v14 = [v12 resourceSpecifier];

        uint64_t v9 = 0;
      }
      else
      {
        if (![@"tel" isEqualToString:v13])
        {
          if ([@"urn" isEqualToString:v13]) {
            uint64_t v9 = 4;
          }
          goto LABEL_18;
        }
        uint64_t v14 = [v12 resourceSpecifier];

        uint64_t v9 = 1;
      }
      id v11 = (void *)v14;
    }
LABEL_18:

    goto LABEL_19;
  }
  if ([v3 resultType] == 1)
  {
    v4 = [CNComposeRecipientGroup alloc];
    v5 = [v3 displayName];
    v6 = [(CNComposeRecipientGroup *)v4 initWithChildren:0 displayString:v5];

    [(CNComposeRecipient *)v6 setAutocompleteResult:v3];
  }
  else
  {
    v6 = 0;
  }
LABEL_29:

  return v6;
}

- (CNComposeRecipient)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contact"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactIdentifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"address"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"kind"];

  uint64_t v9 = [(CNComposeRecipient *)self initWithContact:v5 address:v7 kind:v8];
  [(CNComposeRecipient *)v9 setContactIdentifier:v6];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_contact || self->_contactIdentifier) {
    objc_msgSend(v4, "encodeObject:forKey:");
  }
  v5 = [(CNComposeRecipient *)self inputAddress];

  if (v5)
  {
    v6 = [(CNComposeRecipient *)self inputAddress];
    [v9 encodeObject:v6 forKey:@"address"];
  }
  unint64_t kind = self->_kind;
  uint64_t v8 = v9;
  if (kind)
  {
    [v9 encodeInteger:kind forKey:@"kind"];
    uint64_t v8 = v9;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)addRecipientToPasteboard:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28DB0];
  id v5 = a3;
  v6 = [v4 archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  id v7 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__CNComposeRecipient_addRecipientToPasteboard___block_invoke;
  v9[3] = &unk_1E6128AC0;
  id v10 = v6;
  id v8 = v6;
  [v7 registerDataRepresentationForTypeIdentifier:@"kCNPasteboardTypeComposeRecipient" visibility:0 loadHandler:v9];
  [v5 addObject:v7];
}

uint64_t __47__CNComposeRecipient_addRecipientToPasteboard___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

- (id)contactWithKeysToFetch:(id)a3
{
  id v4 = a3;
  if (![(CNContact *)self->_contact areKeysAvailable:v4])
  {
    id v5 = [(CNComposeRecipient *)self fetchContactWithKeys:v4];
    contact = self->_contact;
    self->_contact = v5;
  }
  id v7 = self->_contact;

  return v7;
}

- (CNContact)contact
{
  contact = self->_contact;
  if (!contact
    || (+[CNComposeRecipient descriptorsForRequiredKeysForContact], id v4 = objc_claimAutoreleasedReturnValue(), v5 = [(CNContact *)contact areKeysAvailable:v4], v4, !v5))
  {
    v6 = +[CNComposeRecipient descriptorsForRequiredKeysForContact];
    id v7 = [(CNComposeRecipient *)self fetchContactWithKeys:v6];
    id v8 = self->_contact;
    self->_contact = v7;
  }
  id v9 = self->_contact;

  return v9;
}

- (id)fetchContactWithKeys:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  autocompleteResult = self->_autocompleteResult;
  if (autocompleteResult)
  {
    id v16 = 0;
    v6 = [(CNAutocompleteResult *)autocompleteResult contactWithKeysToFetch:v4 error:&v16];
    id v7 = v16;
    if (v6) {
      goto LABEL_7;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = self->_contactIdentifier;
  if (!v8)
  {
    contact = self->_contact;
    if (!contact
      || ![(CNContact *)contact hasBeenPersisted]
      || ([(CNContact *)self->_contact identifier],
          (id v8 = (NSString *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v6 = 0;
      if (!v7) {
        goto LABEL_11;
      }
      goto LABEL_8;
    }
  }
  id v9 = CNAutocompleteSharedContactStore();
  id v15 = v7;
  v6 = [v9 unifiedContactWithIdentifier:v8 keysToFetch:v4 error:&v15];
  id v10 = v15;

  id v7 = v10;
LABEL_7:
  if (!v7) {
    goto LABEL_11;
  }
LABEL_8:
  id v11 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v7 localizedDescription];
    *(_DWORD *)buf = 134218242;
    uint64_t v18 = self;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    _os_log_impl(&dword_1B5AF5000, v11, OS_LOG_TYPE_DEFAULT, "Error fetching contact for recipient: %p, %@", buf, 0x16u);
  }
LABEL_11:

  return v6;
}

- (unint64_t)sourceType
{
  uint64_t v2 = [(CNComposeRecipient *)self autocompleteResult];
  unint64_t v3 = [v2 sourceType];

  return v3;
}

- (NSString)displayString
{
  if (self->_displayString) {
    return self->_displayString;
  }
  else {
    return (NSString *)&stru_1F0EC0C28;
  }
}

- (void)setDisplayString:(id)a3
{
  if (a3) {
    unint64_t v3 = (__CFString *)a3;
  }
  else {
    unint64_t v3 = &stru_1F0EC0C28;
  }
  objc_storeStrong((id *)&self->_displayString, v3);
}

- (id)rawDisplayString
{
  return self->_displayString;
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
  unint64_t v3 = [(CNComposeRecipient *)self sourceType] & 5;
  char v4 = [(CNComposeRecipient *)self sourceType];
  BOOL result = 0;
  if (v3)
  {
    if ((v4 & 2) == 0) {
      return ![(CNComposeRecipient *)self isMemberOfGroup];
    }
  }
  return result;
}

- (BOOL)showsAccessoryButton
{
  if ([(CNComposeRecipient *)self isSuggestedRecipient]) {
    return 1;
  }

  return [(CNComposeRecipient *)self isRemovableFromSearchResults];
}

- (BOOL)wasCompleteMatch
{
  uint64_t v2 = self;
  v7[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(CNComposeRecipientOriginContext *)self->_originContext searchTerm];
  v7[0] = v2;
  char v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  uint64_t v6 = 0;
  LOBYTE(v2) = _fastCountOfCompleteMatches(v3, v4, &v6) != 0;

  return (char)v2;
}

- (BOOL)isSuggestedRecipient
{
  return [(CNComposeRecipient *)self sourceType] == 4
      || [(CNComposeRecipient *)self sourceType] == 20;
}

- (BOOL)showsChevronButton
{
  return 0;
}

- (BOOL)isDirectoryServerResult
{
  return [(CNComposeRecipient *)self sourceType] == 8;
}

- (id)completelyMatchedAttributedStrings
{
  v13[1] = *MEMORY[0x1E4F143B8];
  cachedMatchedStrings = self->_cachedMatchedStrings;
  if (!cachedMatchedStrings)
  {
    char v4 = [(CNComposeRecipientOriginContext *)self->_originContext searchTerm];
    v13[0] = self;
    BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v11 = 0;
    id v12 = 0;
    id v6 = _sortedArrayByRelevancy(v4, v5, &v12, &v11);
    id v7 = v12;
    id v8 = (NSArray *)v11;

    id v9 = self->_cachedMatchedStrings;
    self->_cachedMatchedStrings = v8;

    cachedMatchedStrings = self->_cachedMatchedStrings;
  }

  return cachedMatchedStrings;
}

- (id)preferredSendingAddress
{
  return (id)[(CNAutocompleteResult *)self->_autocompleteResult lastSendingAddress];
}

- (void)setAddress:(id)a3
{
  char v4 = (NSString *)[a3 copy];
  inputAddress = self->_inputAddress;
  self->_inputAddress = v4;

  id v6 = [(CNComposeRecipient *)self uncommentedAddress];
  _displayableAddressOfKind(v6, self->_kind);
  id v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  address = self->_address;
  self->_address = v7;

  compositeName = self->_compositeName;
  self->_compositeName = 0;

  shortName = self->_shortName;
  self->_shortName = 0;
}

- (NSString)normalizedAddress
{
  unint64_t v3 = [(CNComposeRecipient *)self uncommentedAddress];
  char v4 = _normalizeAddressOfKind(v3, self->_kind);

  return (NSString *)v4;
}

- (id)unifiedHandles
{
  cachedHandles = self->_cachedHandles;
  if (!cachedHandles)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    BOOL v5 = [(CNComposeRecipient *)self associatedHandles];
    id v6 = (NSSet *)[v4 initWithArray:v5];
    id v7 = self->_cachedHandles;
    self->_cachedHandles = v6;

    cachedHandles = self->_cachedHandles;
  }

  return cachedHandles;
}

- (id)associatedHandles
{
  v17[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F1AEE0];
  v17[0] = *MEMORY[0x1E4F1ADC8];
  v17[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  BOOL v5 = [(CNComposeRecipient *)self contactWithKeysToFetch:v4];

  if (v5)
  {
    id v6 = [v5 emailAddresses];
    id v7 = objc_msgSend(v6, "_cn_map:", &__block_literal_global_79);

    id v8 = [v5 phoneNumbers];
    id v9 = objc_msgSend(v8, "_cn_map:", &__block_literal_global_81);

    id v10 = [(CNComposeRecipient *)self normalizedAddress];
    id v15 = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    id v12 = [v7 arrayByAddingObjectsFromArray:v9];
    id v13 = [v11 arrayByAddingObjectsFromArray:v12];
  }
  else
  {
    id v7 = [(CNComposeRecipient *)self normalizedAddress];
    id v16 = v7;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  }

  return v13;
}

uint64_t __39__CNComposeRecipient_associatedHandles__block_invoke(uint64_t a1, void *a2)
{
  return [a2 value];
}

uint64_t __39__CNComposeRecipient_associatedHandles__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 value];
}

- (NSString)commentedAddress
{
  if (self->_kind)
  {
    uint64_t v3 = [(CNComposeRecipient *)self address];
  }
  else
  {
    id v4 = [(CNComposeRecipient *)self uncommentedAddress];
    BOOL v5 = +[CNComposeRecipientNamer nameForComposeRecipient:sources:]((uint64_t)CNComposeRecipientNamer, self, 2147483615);
    if (v4 && [v4 length] && v5 && objc_msgSend(v5, "length"))
    {
      id v6 = [MEMORY[0x1E4F605A0] formattedAddressWithName:v5 email:v4 useQuotes:1];
    }
    else
    {
      id v6 = v4;
    }
    uint64_t v3 = v6;
    if (!v6)
    {
      uint64_t v3 = [(CNComposeRecipient *)self inputAddress];

      if (v3)
      {
        id v7 = [(CNComposeRecipient *)self inputAddress];
        id v8 = objc_msgSend(v7, "ea_uncommentedAddress");

        id v9 = [(CNComposeRecipient *)self inputAddress];
        id v10 = objc_msgSend(v9, "ea_addressComment");

        uint64_t v3 = [MEMORY[0x1E4F605A0] formattedAddressWithName:v10 email:v8 useQuotes:1];
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
    id v4 = [(CNComposeRecipient *)self unlocalizedLabel];
    if (v4)
    {
      BOOL v5 = [(CNComposeRecipient *)self contact];

      if (v5)
      {
        id v6 = [MEMORY[0x1E4F1BA20] localizedStringForLabel:v4];
        id v7 = self->_label;
        self->_label = v6;
      }
    }

    label = self->_label;
  }

  return label;
}

- (NSString)unlocalizedLabel
{
  uint64_t v3 = [(CNComposeRecipient *)self contact];

  if (v3) {
    id v4 = self->_unlocalizedLabel;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (NSString)compositeName
{
  uint64_t v3 = self->_compositeName;
  if (!v3)
  {
    +[CNComposeRecipientNamer nameForComposeRecipient:]((uint64_t)CNComposeRecipientNamer, self);
    uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v4 = (NSString *)[(NSString *)v3 copy];
    compositeName = self->_compositeName;
    self->_compositeName = v4;
  }

  return v3;
}

- (NSString)shortName
{
  uint64_t v3 = self->_shortName;
  if (!v3)
  {
    +[CNComposeRecipientShortNamer shortNameForComposeRecipient:]((uint64_t)CNComposeRecipientShortNamer, self);
    uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v4 = (NSString *)[(NSString *)v3 copy];
    shortName = self->_shortName;
    self->_shortName = v4;
  }

  return v3;
}

- (NSString)placeholderName
{
  unint64_t v2 = [(CNComposeRecipient *)self sourceType];
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = v3;
  if (v2 == 1) {
    BOOL v5 = @"RECENT_PLACEHOLDER_NAME";
  }
  else {
    BOOL v5 = @"PLACEHOLDER_NAME";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_1F0EC0C28 table:@"Localized"];

  return (NSString *)v6;
}

- (NSPersonNameComponents)nameComponents
{
  uint64_t v3 = self->_nameComponents;
  if (!v3)
  {
    uint64_t v3 = [(CNComposeRecipient *)self nameComponentsFromContact];
    if (!v3)
    {
      id v4 = [(CNComposeRecipient *)self nameComponentsFromAddress];
      uint64_t v3 = v4;
      if (v4) {
        BOOL v5 = v4;
      }
    }
  }

  return v3;
}

- (id)nameComponentsFromContact
{
  if (self->_contact)
  {
    unint64_t v2 = objc_msgSend(MEMORY[0x1E4F28F30], "componentsForContact:");
  }
  else
  {
    unint64_t v2 = 0;
  }

  return v2;
}

- (id)nameComponentsFromAddress
{
  address = self->_address;
  if (address && !self->_kind)
  {
    BOOL v5 = [(NSString *)address ea_addressComment];
    id v6 = v5;
    if (v5 && ([v5 isEqualToString:self->_address] & 1) == 0)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F28F38]);
      id v4 = [v7 personNameComponentsFromString:v6];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSString)uncommentedAddress
{
  v38[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CNComposeRecipient *)self inputAddress];

  if (v3)
  {
    unint64_t kind = self->_kind;
    BOOL v5 = [(CNComposeRecipient *)self inputAddress];
    id v6 = v5;
    if (!kind)
    {
      uint64_t v7 = objc_msgSend(v5, "ea_uncommentedAddress");

      id v6 = (void *)v7;
    }
  }
  else
  {
    uint64_t v8 = *MEMORY[0x1E4F1AEE0];
    v38[0] = *MEMORY[0x1E4F1ADC8];
    v38[1] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    id v10 = [(CNComposeRecipient *)self contactWithKeysToFetch:v9];

    if (v10)
    {
      if (self->_kind == 1)
      {
        long long v34 = 0uLL;
        long long v35 = 0uLL;
        long long v32 = 0uLL;
        long long v33 = 0uLL;
        id v11 = [v10 phoneNumbers];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v33;
          while (2)
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v33 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              v17 = [v16 identifier];
              int v18 = [v17 isEqualToString:self->_valueIdentifier];

              if (v18)
              {
                objc_super v26 = [v16 value];
                id v6 = [v26 stringValue];

                goto LABEL_27;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
      }
      else
      {
        long long v30 = 0uLL;
        long long v31 = 0uLL;
        *((void *)&v28 + 1) = 0;
        long long v29 = 0uLL;
        id v11 = objc_msgSend(v10, "emailAddresses", 0);
        uint64_t v19 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v29;
          while (2)
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v29 != v21) {
                objc_enumerationMutation(v11);
              }
              v23 = *(void **)(*((void *)&v28 + 1) + 8 * j);
              v24 = [v23 identifier];
              int v25 = [v24 isEqualToString:self->_valueIdentifier];

              if (v25)
              {
                id v6 = [v23 value];
                goto LABEL_27;
              }
            }
            uint64_t v20 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }
      }
      id v6 = 0;
LABEL_27:
    }
    else
    {
      id v6 = 0;
    }
  }

  return (NSString *)v6;
}

- (NSString)stringForEqualityTesting
{
  uint64_t v3 = [(CNComposeRecipient *)self address];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%p", self);

    uint64_t v3 = (void *)v4;
  }

  return (NSString *)v3;
}

- (NSString)pasteboardString
{
  uint64_t v3 = [(CNComposeRecipient *)self uncommentedAddress];
  if (!v3)
  {
    uint64_t v3 = [(CNComposeRecipient *)self address];
    if (!v3)
    {
      uint64_t v3 = [(CNComposeRecipient *)self compositeName];
    }
  }

  return (NSString *)v3;
}

- (BOOL)supportsPasteboardUnarchiving
{
  uint64_t v3 = [(CNComposeRecipient *)self contact];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    BOOL v5 = [(CNComposeRecipient *)self inputAddress];
    if (v5) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = [(CNComposeRecipient *)self isGroup];
    }
  }
  return v4;
}

- (void)setOriginContext:(id)a3
{
}

- (id)_unformattedAddress
{
  uint64_t v3 = [(CNComposeRecipient *)self uncommentedAddress];
  if (self->_kind == 1)
  {
    uint64_t v4 = UIUnformattedPhoneNumberFromString();

    uint64_t v3 = (void *)v4;
  }

  return v3;
}

- (id)labeledValueIdentifier
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__2;
  id v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  v17[0] = *MEMORY[0x1E4F1ADC8];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  uint64_t v4 = [(CNComposeRecipient *)self contactWithKeysToFetch:v3];

  if (v4)
  {
    BOOL v5 = [(CNComposeRecipient *)self inputAddress];
    BOOL v6 = v5 == 0;

    if (!v6)
    {
      uint64_t v7 = [v4 emailAddresses];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __44__CNComposeRecipient_labeledValueIdentifier__block_invoke;
      v10[3] = &unk_1E6128B08;
      v10[4] = self;
      v10[5] = &v11;
      [v7 enumerateObjectsUsingBlock:v10];
    }
  }
  id v8 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v8;
}

void __44__CNComposeRecipient_labeledValueIdentifier__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  BOOL v6 = [v12 value];
  uint64_t v7 = [*(id *)(a1 + 32) inputAddress];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = [v12 identifier];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

- (BOOL)isEquivalentAddressToRecipient:(id)a3
{
  uint64_t v4 = (CNComposeRecipient *)a3;
  unint64_t v5 = [(CNComposeRecipient *)self kind];
  if (v5 == [(CNComposeRecipient *)v4 kind])
  {
    if (self == v4)
    {
      BOOL v13 = 1;
    }
    else
    {
      if ([(CNComposeRecipient *)self kind])
      {
        if ([(CNComposeRecipient *)self kind] == 1)
        {
          BOOL v6 = (void *)MEMORY[0x1E4F1BA70];
          uint64_t v7 = [(CNComposeRecipient *)self address];
          int v8 = [v6 phoneNumberWithStringValue:v7];

          uint64_t v9 = (void *)MEMORY[0x1E4F1BA70];
          uint64_t v10 = [(CNComposeRecipient *)v4 address];
          uint64_t v11 = [v9 phoneNumberWithStringValue:v10];

          char v12 = [v8 isEqual:v11];
        }
        else
        {
          int v8 = [(CNComposeRecipient *)v4 normalizedAddress];
          uint64_t v11 = [(CNComposeRecipient *)self normalizedAddress];
          char v12 = [v8 isEqualToString:v11];
        }
      }
      else
      {
        int v8 = [(CNComposeRecipient *)self address];
        uint64_t v11 = [(CNComposeRecipient *)v4 address];
        char v12 = objc_msgSend(v8, "_cn_caseInsensitiveIsEqual:", v11);
      }
      BOOL v13 = v12;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CNComposeRecipient *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      && ([(CNComposeRecipient *)self address], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0)
      && (BOOL v6 = (void *)v5,
          [(CNComposeRecipient *)v4 address],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7))
    {
      int v8 = [(CNComposeRecipient *)v4 address];
      uint64_t v9 = [(CNComposeRecipient *)self address];
      char v10 = objc_msgSend(v9, "ea_isEqualToEmailAddress:", v8);
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(CNComposeRecipient *)self address];

  if (v3)
  {
    uint64_t v4 = [(CNComposeRecipient *)self address];
    unint64_t v5 = [v4 hash];

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CNComposeRecipient;
    return [(CNComposeRecipient *)&v7 hash];
  }
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  if (([(CNComposeRecipient *)self sourceType] & 2) != 0) {
    [v3 addObject:@"Contact"];
  }
  if (([(CNComposeRecipient *)self sourceType] & 0x10) != 0) {
    [v3 addObject:@"Prediction"];
  }
  if ([(CNComposeRecipient *)self sourceType]) {
    [v3 addObject:@"Recent"];
  }
  if (([(CNComposeRecipient *)self sourceType] & 0x48) != 0) {
    [v3 addObject:@"Server"];
  }
  if (([(CNComposeRecipient *)self sourceType] & 4) != 0) {
    [v3 addObject:@"Suggestion"];
  }
  if (![(CNComposeRecipient *)self sourceType]) {
    [v3 addObject:@"<undefined>"];
  }
  uint64_t v4 = [v3 componentsJoinedByString:@"+"];
  unint64_t v5 = NSString;
  BOOL v6 = (objc_class *)objc_opt_class();
  objc_super v7 = NSStringFromClass(v6);
  int v8 = [(CNComposeRecipient *)self displayString];
  uint64_t v9 = [(CNComposeRecipient *)self address];
  objc_msgSend(v5, "stringWithFormat:", @"<%@: %p; displayString: %@; address: %@; autocompleteSource: %@>",
    v7,
    self,
    v8,
    v9,
  char v10 = v4);

  return (NSString *)v10;
}

- (void)setCompositeName:(id)a3
{
}

- (CNComposeRecipientOriginContext)originContext
{
  return self->_originContext;
}

- (void)setContact:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void)setLabel:(id)a3
{
}

- (void)setUnlocalizedLabel:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSArray)cachedCompleteMatches
{
  return self->_cachedCompleteMatches;
}

- (void)setCachedCompleteMatches:(id)a3
{
}

- (NSArray)cachedMatchedStrings
{
  return self->_cachedMatchedStrings;
}

- (void)setCachedMatchedStrings:(id)a3
{
}

- (NSArray)cachedSortedMembers
{
  return self->_cachedSortedMembers;
}

- (void)setCachedSortedMembers:(id)a3
{
}

- (NSSet)cachedHandles
{
  return self->_cachedHandles;
}

- (void)setCachedHandles:(id)a3
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

- (NSString)inputAddress
{
  return self->_inputAddress;
}

- (void)setInputAddress:(id)a3
{
}

- (BOOL)isMemberOfGroup
{
  return self->_isMemberOfGroup;
}

- (void)setIsMemberOfGroup:(BOOL)a3
{
  self->_isMemberOfGroup = a3;
}

- (CNAutocompleteResult)autocompleteResult
{
  return self->_autocompleteResult;
}

- (void)setAutocompleteResult:(id)a3
{
}

- (void)setNameComponents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_autocompleteResult, 0);
  objc_storeStrong((id *)&self->_inputAddress, 0);
  objc_storeStrong((id *)&self->_valueIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedHandles, 0);
  objc_storeStrong((id *)&self->_cachedSortedMembers, 0);
  objc_storeStrong((id *)&self->_cachedMatchedStrings, 0);
  objc_storeStrong((id *)&self->_cachedCompleteMatches, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_unlocalizedLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_originContext, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_shortName, 0);

  objc_storeStrong((id *)&self->_compositeName, 0);
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.contactsui.composerecipient";
  unint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  if (!UTTypeConformsTo((CFStringRef)a4, @"com.apple.contactsui.composerecipient"))
  {
    int v8 = 0;
    if (!a5) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  id v12 = 0;
  int v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v12];
  id v9 = v12;
  if (v9)
  {
    char v10 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[CNComposeRecipient(NSItemProvider) objectWithItemProviderData:typeIdentifier:error:](v9, v10);
    }
  }
  if (a5)
  {
LABEL_9:
    if (!v8)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    }
  }
LABEL_11:

  return v8;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  unint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  [v2 addObject:@"com.apple.contactsui.composerecipient"];
  [v2 addObject:*MEMORY[0x1E4F22718]];
  uint64_t v3 = [NSString writableTypeIdentifiersForItemProvider];
  [v2 addObjectsFromArray:v3];

  return (NSArray *)v2;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = (__CFString *)a3;
  id v7 = (void (**)(id, id, void))a4;
  if ([(__CFString *)v6 isEqualToString:@"com.apple.contactsui.composerecipient"])
  {
    id v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
    v7[2](v7, v8, 0);
    goto LABEL_3;
  }
  if (!UTTypeConformsTo(v6, (CFStringRef)*MEMORY[0x1E4F22688]))
  {
    if (!UTTypeConformsTo(v6, (CFStringRef)*MEMORY[0x1E4F22718]))
    {
      v7[2](v7, 0, 0);
      goto LABEL_4;
    }
    id v12 = [(CNComposeRecipient *)self contact];
    BOOL v13 = v12;
    if (v12)
    {
      id v8 = v12;
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F1B8F8];
      id v15 = [(CNComposeRecipient *)self commentedAddress];
      objc_msgSend(v14, "em_contactFromEmailAddress:", v15);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v16 = (void *)MEMORY[0x1E4F1B998];
    v21[0] = v8;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    id v20 = 0;
    int v18 = [v16 dataWithContacts:v17 error:&v20];
    id v19 = v20;

    ((void (**)(id, id, id))v7)[2](v7, v18, v19);
LABEL_3:

LABEL_4:
    id v9 = 0;
    goto LABEL_7;
  }
  char v10 = [(CNComposeRecipient *)self commentedAddress];
  id v9 = [v10 loadDataWithTypeIdentifier:v6 forItemProviderCompletionHandler:v7];

LABEL_7:

  return v9;
}

@end