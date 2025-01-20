@interface CNFavoritesEntry
+ (BOOL)favoritesEntryValueForLabeledValueValue:(void *)a3 propertyKey:(void *)a4 isEqualToValue:;
+ (CNLabeledValue)createLabeledValueForFavoritesEntryValue:(void *)a3 label:(uint64_t)a4 iOSLegacyIdentifier:(void *)a5 propertyKey:;
+ (id)contactFormatter;
+ (id)descriptorsForRequiredKeysForPropertyKey:(id)a3;
+ (id)favoritesEntryValueForLabeledValueValue:(void *)a3 propertyKey:;
+ (id)instantMessageAddressForFavoritesEntryValue:(uint64_t)a1;
+ (id)labeledValueValueForFavoritesEntryValue:(void *)a3 propertyKey:;
+ (id)socialProfileForFavoritesEntryValue:(uint64_t)a1;
+ (id)valueStringFromSocialProfile:(uint64_t)a1;
+ (void)initialize;
- (BOOL)dirty;
- (BOOL)isEqual:(id)a3;
- (BOOL)rematchWithContacts;
- (BOOL)rematchWithGeminiManager:(id)a3;
- (CNContactProperty)contactProperty;
- (CNFavoritesEntry)initWithContact:(id)a3 propertyKey:(id)a4 identifier:(id)a5 type:(int64_t)a6;
- (CNFavoritesEntry)initWithContact:(id)a3 propertyKey:(id)a4 identifier:(id)a5 type:(int64_t)a6 store:(id)a7;
- (CNFavoritesEntry)initWithContact:(id)a3 propertyKey:(id)a4 labeledValueIdentifier:(id)a5 actionType:(id)a6 bundleIdentifier:(id)a7 store:(id)a8;
- (CNFavoritesEntry)initWithDictionaryRepresentation:(id)a3 store:(id)a4;
- (NSString)actionChannel;
- (NSString)actionType;
- (NSString)bundleIdentifier;
- (NSString)name;
- (NSString)value;
- (id)_convertFromEntryType:(void *)a3 toActionType:(void *)a4 bundleIdentifier:;
- (id)_initWithContact:(void *)a3 propertyKey:(void *)a4 labeledValueIdentifier:(unint64_t)a5 entryType:(void *)a6 actionType:(void *)a7 bundleIdentifier:(void *)a8 store:;
- (id)dictionaryRepresentation;
- (id)rematch;
- (int)abIdentifier;
- (int)abUid;
- (int)oldAbUid;
- (int64_t)type;
- (uint64_t)_entryTypeForActionType:(void *)a3 bundleIdentifier:;
- (uint64_t)setContact:(uint64_t)a1;
- (void)applyChangeRecord:(id)a3;
- (void)dealloc;
- (void)dictionaryRepresentation:(id *)a3 isDirty:(BOOL *)a4;
- (void)resetContactMatch;
- (void)setAbIdentifier:(int)a3;
- (void)setAbUid:(int)a3;
- (void)setActionChannel:(id)a3;
- (void)setActionType:(uint64_t)a1;
- (void)setBundleIdentifier:(uint64_t)a1;
- (void)setContactStore:(uint64_t)a1;
- (void)setDirty:(BOOL)a3;
- (void)setLabel:(uint64_t)a1;
- (void)setLabeledValueIdentifier:(uint64_t)a1;
- (void)setOldAbUid:(int)a3;
- (void)setPropertyKey:(uint64_t)a1;
- (void)setValue:(id)a3;
@end

@implementation CNFavoritesEntry

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CNFavoritesEntry;
  objc_msgSendSuper2(&v2, sel_initialize);
  ABInitialize();
}

+ (id)contactFormatter
{
  self;
  if (contactFormatter_onceToken != -1) {
    dispatch_once(&contactFormatter_onceToken, &__block_literal_global_118);
  }
  v0 = (void *)contactFormatter___contactFormatter;

  return v0;
}

uint64_t __36__CNFavoritesEntry_contactFormatter__block_invoke()
{
  v0 = objc_alloc_init(CNContactFormatter);
  v1 = (void *)contactFormatter___contactFormatter;
  contactFormatter___contactFormatter = (uint64_t)v0;

  [(id)contactFormatter___contactFormatter setStyle:0];
  objc_super v2 = (void *)contactFormatter___contactFormatter;

  return [v2 setFallbackStyle:-1];
}

+ (id)descriptorsForRequiredKeysForPropertyKey:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = v4;
  if (v3) {
    [v4 addObject:v3];
  }
  v6 = +[CNFavoritesEntry contactFormatter]();
  v7 = [v6 descriptorForRequiredKeys];
  [v5 addObject:v7];

  [v5 addObject:@"iOSLegacyIdentifier"];
  v8 = +[CNGeminiManager descriptorForRequiredKeys];
  [v5 addObject:v8];

  v9 = (void *)[v5 copy];

  return v9;
}

+ (id)valueStringFromSocialProfile:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = (void *)MEMORY[0x1E4F28F98];
  v4 = [v2 dictionaryRepresentation];

  v5 = [v3 dataWithPropertyList:v4 format:100 options:0 error:0];

  v6 = [v5 base64EncodedStringWithOptions:0];

  return v6;
}

+ (id)favoritesEntryValueForLabeledValueValue:(void *)a3 propertyKey:
{
  id v4 = a2;
  id v5 = a3;
  self;
  if ([v5 isEqualToString:@"phoneNumbers"])
  {
    id v6 = [v4 stringValue];
LABEL_5:
    v7 = v6;
    goto LABEL_16;
  }
  if ([v5 isEqualToString:@"emailAddresses"])
  {
    id v6 = v4;
    goto LABEL_5;
  }
  if ([v5 isEqualToString:@"socialProfiles"])
  {
    objc_opt_class();
    id v8 = v4;
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
LABEL_14:
    id v10 = v9;

    v7 = +[CNFavoritesEntry valueStringFromSocialProfile:]((uint64_t)CNFavoritesEntry, v10);

    goto LABEL_16;
  }
  if ([v5 isEqualToString:@"instantMessageAddresses"])
  {
    objc_opt_class();
    id v8 = v4;
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    goto LABEL_14;
  }
  NSLog(&cfstr_AttemptingToCr.isa);
  v7 = 0;
LABEL_16:

  return v7;
}

+ (id)socialProfileForFavoritesEntryValue:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v2 options:0];

  id v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:0];
  id v5 = +[CNSocialProfile socialProfileWithDictionaryRepresentation:v4];

  return v5;
}

+ (id)instantMessageAddressForFavoritesEntryValue:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v2 options:0];

  id v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:0];
  id v5 = +[CNInstantMessageAddress instantMessageAddressWithDictionaryRepresentation:v4];

  return v5;
}

+ (id)labeledValueValueForFavoritesEntryValue:(void *)a3 propertyKey:
{
  id v4 = a2;
  id v5 = a3;
  self;
  if ([v5 isEqualToString:@"phoneNumbers"])
  {
    id v6 = +[CNPhoneNumber phoneNumberWithStringValue:v4];
LABEL_9:
    v7 = v6;
    goto LABEL_10;
  }
  if ([v5 isEqualToString:@"emailAddresses"])
  {
    id v6 = v4;
    goto LABEL_9;
  }
  if ([v5 isEqualToString:@"socialProfiles"])
  {
    +[CNFavoritesEntry socialProfileForFavoritesEntryValue:]((uint64_t)CNFavoritesEntry, v4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ([v5 isEqualToString:@"instantMessageAddresses"])
  {
    +[CNFavoritesEntry instantMessageAddressForFavoritesEntryValue:]((uint64_t)CNFavoritesEntry, v4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  NSLog(&cfstr_AttemptingToCr_0.isa);
  v7 = 0;
LABEL_10:

  return v7;
}

+ (CNLabeledValue)createLabeledValueForFavoritesEntryValue:(void *)a3 label:(uint64_t)a4 iOSLegacyIdentifier:(void *)a5 propertyKey:
{
  id v8 = a5;
  id v9 = a3;
  id v10 = a2;
  uint64_t v11 = self;
  v12 = +[CNFavoritesEntry labeledValueValueForFavoritesEntryValue:propertyKey:](v11, v10, v8);

  v13 = [[CNLabeledValue alloc] initWithLabel:v9 value:v12];
  [(CNLabeledValue *)v13 setIOSLegacyIdentifier:a4];

  return v13;
}

- (CNFavoritesEntry)initWithContact:(id)a3 propertyKey:(id)a4 identifier:(id)a5 type:(int64_t)a6
{
  return (CNFavoritesEntry *)-[CNFavoritesEntry _initWithContact:propertyKey:labeledValueIdentifier:entryType:actionType:bundleIdentifier:store:]((id *)&self->super.isa, a3, a4, a5, a6, 0, 0, 0);
}

- (id)_initWithContact:(void *)a3 propertyKey:(void *)a4 labeledValueIdentifier:(unint64_t)a5 entryType:(void *)a6 actionType:(void *)a7 bundleIdentifier:(void *)a8 store:
{
  v35[4] = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (a1)
  {
    v34.receiver = a1;
    v34.super_class = (Class)CNFavoritesEntry;
    a1 = (id *)objc_msgSendSuper2(&v34, sel_init);
    if (a1)
    {
      v35[0] = @"phoneNumbers";
      v35[1] = @"emailAddresses";
      v35[2] = @"socialProfiles";
      v35[3] = @"instantMessageAddresses";
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:4];
      char v22 = [v21 containsObject:v16];

      if (v22)
      {
        if (v18)
        {
          if (a5 == -1) {
            a5 = (int)-[CNFavoritesEntry _entryTypeForActionType:bundleIdentifier:]((uint64_t)a1, v18, v19);
          }
        }
        else
        {
          id v32 = v19;
          id v33 = 0;
          -[CNFavoritesEntry _convertFromEntryType:toActionType:bundleIdentifier:](a1, a5, &v33, &v32);
          id v18 = v33;
          id v24 = v32;

          id v19 = v24;
        }
        a1[7] = (id)a5;
        -[CNFavoritesEntry setActionType:]((uint64_t)a1, v18);
        -[CNFavoritesEntry setBundleIdentifier:]((uint64_t)a1, v19);
        -[CNFavoritesEntry setPropertyKey:]((uint64_t)a1, v16);
        v25 = +[CN sourceContactForValue:0 labeledValueIdentifier:v17 propertyKey:v16 inUnifiedContact:v15];
        -[CNFavoritesEntry setContact:]((uint64_t)a1, v25);

        -[CNFavoritesEntry setLabeledValueIdentifier:]((uint64_t)a1, v17);
        objc_msgSend(a1, "setAbUid:", objc_msgSend(a1[13], "iOSLegacyIdentifier"));
        [a1 setOldAbUid:0xFFFFFFFFLL];
        -[CNFavoritesEntry setContactStore:]((uint64_t)a1, v20);
        v26 = [a1[13] valueForKey:v16];
        v23 = +[CNLabeledValue labeledValueWithIdentifier:v17 inArray:v26];

        if (v23)
        {
          objc_msgSend(a1, "setAbIdentifier:", objc_msgSend(v23, "iOSLegacyIdentifier"));
          v27 = [v23 label];
          -[CNFavoritesEntry setLabel:]((uint64_t)a1, v27);

          v28 = [v23 value];
          v29 = +[CNFavoritesEntry favoritesEntryValueForLabeledValueValue:propertyKey:]((uint64_t)CNFavoritesEntry, v28, v16);
          [a1 setValue:v29];

          v30 = [a1[8] identifierWithError:0];
          -[CNChangesNotifierProxy setCoalescingTimer:]((uint64_t)a1, v30);
        }
        else
        {
          v30 = a1;
          a1 = 0;
        }
      }
      else
      {
        [MEMORY[0x1E4F1CA00] raise:@"CNFavoritesEntryInvalidPropertyException", @"The property %@ is not supported for favorites", v16 format];
        v23 = a1;
        a1 = 0;
      }
    }
  }

  return a1;
}

- (CNFavoritesEntry)initWithContact:(id)a3 propertyKey:(id)a4 identifier:(id)a5 type:(int64_t)a6 store:(id)a7
{
  return (CNFavoritesEntry *)-[CNFavoritesEntry _initWithContact:propertyKey:labeledValueIdentifier:entryType:actionType:bundleIdentifier:store:]((id *)&self->super.isa, a3, a4, a5, a6, 0, 0, a7);
}

- (CNFavoritesEntry)initWithContact:(id)a3 propertyKey:(id)a4 labeledValueIdentifier:(id)a5 actionType:(id)a6 bundleIdentifier:(id)a7 store:(id)a8
{
  return (CNFavoritesEntry *)-[CNFavoritesEntry _initWithContact:propertyKey:labeledValueIdentifier:entryType:actionType:bundleIdentifier:store:]((id *)&self->super.isa, a3, a4, a5, 0xFFFFFFFFFFFFFFFFLL, a6, a7, a8);
}

- (id)_convertFromEntryType:(void *)a3 toActionType:(void *)a4 bundleIdentifier:
{
  if (result)
  {
    if (a2 <= 2)
    {
      id v5 = (id *)off_1E56B8B30[a2];
      *a3 = *off_1E56B8B18[a2];
      result = *v5;
      *a4 = result;
    }
  }
  return result;
}

- (uint64_t)_entryTypeForActionType:(void *)a3 bundleIdentifier:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if ([v5 isEqualToString:@"AudioCallActionType"]
      && ([v6 isEqualToString:@"com.apple.mobilephone"] & 1) != 0)
    {
      a1 = 0;
    }
    else if ([v5 isEqualToString:@"VideoCallActionType"] {
           && ([v6 isEqualToString:@"com.apple.facetime"] & 1) != 0)
    }
    {
      a1 = 1;
    }
    else if ([v5 isEqualToString:@"AudioCallActionType"])
    {
      if ([v6 isEqualToString:@"com.apple.facetime"]) {
        a1 = 2;
      }
      else {
        a1 = 0xFFFFFFFFLL;
      }
    }
    else
    {
      a1 = 0xFFFFFFFFLL;
    }
  }

  return a1;
}

- (void)setActionType:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)setBundleIdentifier:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)setPropertyKey:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (uint64_t)setContact:(uint64_t)a1
{
  id v4 = a2;
  id v5 = v4;
  if (a1)
  {
    id v4 = (id *)(a1 + 104);
    if (*(id **)(a1 + 104) != v5)
    {
      id v8 = v5;
      objc_storeStrong(v4, a2);
      id v6 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = 0;

      id v5 = v8;
    }
  }

  return MEMORY[0x1F41817F8](v4, v5);
}

- (void)setLabeledValueIdentifier:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 112), a2);
  }
}

- (void)setContactStore:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void)setLabel:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (void)dealloc
{
  -[CNFavoritesEntry setContact:]((uint64_t)self, 0);
  v3.receiver = self;
  v3.super_class = (Class)CNFavoritesEntry;
  [(CNFavoritesEntry *)&v3 dealloc];
}

- (NSString)name
{
  name = self->_name;
  if (!name)
  {
    if (!self->_contact)
    {
      id v4 = [(CNFavoritesEntry *)self contactProperty];
      id v5 = [v4 contact];
      -[CNFavoritesEntry setContact:]((uint64_t)self, v5);
    }
    id v6 = +[CNFavoritesEntry contactFormatter]();
    v7 = self->_contact;
    id v8 = [v6 stringFromContact:v7];
    id v9 = self->_name;
    self->_name = v8;

    objc_setProperty_nonatomic_copy(self, v10, self->_name, 96);
    name = self->_name;
  }

  return name;
}

- (CNContactProperty)contactProperty
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (self) {
    contact = self->_contact;
  }
  else {
    contact = 0;
  }
  p_super = contact;
  id v5 = +[CN contactPropertiesByKey];
  id v6 = v5;
  if (self) {
    propertyKey = self->_propertyKey;
  }
  else {
    propertyKey = 0;
  }
  id v8 = [v5 objectForKeyedSubscript:propertyKey];

  if (!p_super
    || (!self ? (id v9 = 0) : (id v9 = self->_contact),
        int v10 = [(CNContact *)v9 iOSLegacyIdentifier],
        v10 != [(CNFavoritesEntry *)self abUid]))
  {
    if (self) {
      contactStore = self->_contactStore;
    }
    else {
      contactStore = 0;
    }
    v12 = contactStore;
    uint64_t v13 = [(CNFavoritesEntry *)self abUid];
    if (self) {
      v14 = self->_propertyKey;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;
    id v16 = +[CNFavoritesEntry descriptorsForRequiredKeysForPropertyKey:v15];
    uint64_t v17 = fetchContactMatchingLegacyIdentifier(v12, v13, v16);

    if (v17)
    {
      name = self->_name;
      self->_name = 0;

      p_super = (CNContact *)v17;
LABEL_17:
      labeledValueIdentifier = self->_labeledValueIdentifier;
      goto LABEL_18;
    }
    p_super = 0;
  }
  if (self) {
    goto LABEL_17;
  }
  labeledValueIdentifier = 0;
LABEL_18:
  id v20 = labeledValueIdentifier;
  if (p_super)
  {
    [v8 CNValueForContact:p_super];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v21 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = [(NSString *)v21 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v47;
      v45 = v8;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v47 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          int v27 = [v26 iOSLegacyIdentifier];
          if (v27 != [(CNFavoritesEntry *)self abIdentifier])
          {
            v28 = [v26 identifier];
            char v29 = [v28 isEqual:v20];

            if ((v29 & 1) == 0) {
              continue;
            }
          }
          v39 = [v26 identifier];

          v37 = v21;
          id v8 = v45;
          goto LABEL_35;
        }
        uint64_t v23 = [(NSString *)v21 countByEnumeratingWithState:&v46 objects:v51 count:16];
        id v8 = v45;
        if (v23) {
          continue;
        }
        break;
      }
    }
  }
  v30 = objc_alloc_init(CNMutableContact);
  v31 = [(CNFavoritesEntry *)self value];
  if (self) {
    label = self->_label;
  }
  else {
    label = 0;
  }
  id v33 = label;
  uint64_t v34 = [(CNFavoritesEntry *)self abIdentifier];
  if (self) {
    v35 = self->_propertyKey;
  }
  else {
    v35 = 0;
  }
  v36 = v35;
  v37 = +[CNFavoritesEntry createLabeledValueForFavoritesEntryValue:label:iOSLegacyIdentifier:propertyKey:]((uint64_t)CNFavoritesEntry, v31, v33, v34, v36);

  v50 = v37;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
  [v8 setCNValue:v38 onContact:v30];

  v39 = [v37 identifier];
  v21 = v20;
  p_super = &v30->super;
LABEL_35:

  -[CNFavoritesEntry setContact:]((uint64_t)self, p_super);
  -[CNFavoritesEntry setLabeledValueIdentifier:]((uint64_t)self, v39);
  if (self)
  {
    v40 = self->_contact;
    v41 = self->_propertyKey;
    v42 = self->_labeledValueIdentifier;
  }
  else
  {
    v41 = 0;
    v40 = 0;
    v42 = 0;
  }
  v43 = +[CNContactProperty contactPropertyWithContact:v40 propertyKey:v41 identifier:v42];

  return (CNContactProperty *)v43;
}

- (BOOL)isEqual:(id)a3
{
  id v9 = (id *)a3;
  int64_t v10 = [(CNFavoritesEntry *)self type];
  if (v10 != [v9 type]) {
    goto LABEL_63;
  }
  uint64_t v11 = [(CNFavoritesEntry *)self actionType];
  if (v11 || ([v9 actionType], (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = [(CNFavoritesEntry *)self actionType];
    id v5 = [v9 actionType];
    if (([v4 isEqual:v5] & 1) == 0)
    {

      if (v11) {
      else
      }

      goto LABEL_63;
    }
    int v12 = 1;
  }
  else
  {
    int v12 = 0;
  }
  uint64_t v13 = [(CNFavoritesEntry *)self bundleIdentifier];
  if (!v13)
  {
    id v6 = [v9 bundleIdentifier];
    if (!v6)
    {
      int v44 = 0;
      if (!self) {
        goto LABEL_20;
      }
LABEL_17:
      id v15 = self->_propertyKey;
      if (v15)
      {
        v43 = v15;
        objc_super v3 = self->_propertyKey;
        int v42 = 0;
        if (!v9)
        {
          id v17 = 0;
          goto LABEL_26;
        }
LABEL_25:
        id v17 = v9[10];
LABEL_26:
        id v40 = v17;
        if (!-[NSString isEqual:](v3, "isEqual:"))
        {
          v41 = v3;
          uint64_t v14 = 0;
          goto LABEL_39;
        }
        v39 = v6;
        int v38 = 1;
LABEL_30:
        v41 = v3;
        id v18 = [(CNFavoritesEntry *)self value];
        if (v18 || ([v9 value], (uint64_t v34 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v36 = v5;
          v37 = v4;
          int v19 = v12;
          id v20 = v7;
          v21 = [(CNFavoritesEntry *)self value];
          uint64_t v22 = [v9 value];
          uint64_t v14 = [v21 isEqual:v22];

          if (v18)
          {

            v7 = v20;
            int v12 = v19;
            if (v38)
            {
              id v5 = v36;
              id v4 = v37;
              id v6 = v39;
              goto LABEL_39;
            }
            id v5 = v36;
            id v4 = v37;
            id v6 = v39;
            goto LABEL_69;
          }
          v7 = v20;
          int v12 = v19;
          id v5 = v36;
          id v4 = v37;
          uint64_t v23 = (void *)v34;
        }
        else
        {
          uint64_t v23 = 0;
          uint64_t v14 = 1;
        }

        id v6 = v39;
        if (v38)
        {
LABEL_39:

          if ((v42 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_40;
        }
LABEL_69:
        if (!v42)
        {
LABEL_41:

          if (!v44) {
            goto LABEL_43;
          }
          goto LABEL_42;
        }
LABEL_40:

        goto LABEL_41;
      }
LABEL_20:
      if (!v9 || (id v16 = v9[10]) == 0)
      {
        v39 = v6;
        v43 = 0;
        v35 = 0;
        int v38 = 0;
        int v42 = 1;
        goto LABEL_30;
      }
      v35 = v16;
      if (self) {
        objc_super v3 = self->_propertyKey;
      }
      else {
        objc_super v3 = 0;
      }
      v43 = 0;
      int v42 = 1;
      goto LABEL_25;
    }
  }
  objc_super v3 = [(CNFavoritesEntry *)self bundleIdentifier];
  [v9 bundleIdentifier];
  v45 = long long v46 = v3;
  if (-[NSString isEqual:](v3, "isEqual:"))
  {
    int v44 = 1;
    if (!self) {
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  uint64_t v14 = 0;
LABEL_42:

LABEL_43:
  if (!v13) {

  }
  if (v12)
  {
  }
  if (v11)
  {

    if (!v14) {
      goto LABEL_63;
    }
  }
  else
  {

    if ((v14 & 1) == 0)
    {
LABEL_63:
      BOOL v31 = 0;
      goto LABEL_64;
    }
  }
  if (!self || (uint64_t v24 = self->_label) == 0)
  {
    if (!v9) {
      goto LABEL_66;
    }
    id v28 = v9[9];
    if (!v28) {
      goto LABEL_66;
    }
    uint64_t v14 = (uint64_t)v28;
    if (self) {
      v26 = self->_label;
    }
    else {
      v26 = 0;
    }
    v25 = 0;
    int v27 = 1;
    goto LABEL_60;
  }
  v25 = v24;
  v26 = self->_label;
  int v27 = 0;
  if (v9)
  {
LABEL_60:
    id v29 = v9[9];
    goto LABEL_61;
  }
  id v29 = 0;
LABEL_61:
  int v30 = [(NSString *)v26 isEqual:v29];

  if (v27)
  {

    if ((v30 & 1) == 0) {
      goto LABEL_63;
    }
  }
  else
  {

    if (!v30) {
      goto LABEL_63;
    }
  }
LABEL_66:
  if (self && self->_label)
  {
    int v33 = [(CNFavoritesEntry *)self abUid];
    BOOL v31 = v33 == [v9 abUid];
  }
  else
  {
    BOOL v31 = 1;
  }
LABEL_64:

  return v31;
}

- (CNFavoritesEntry)initWithDictionaryRepresentation:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)CNFavoritesEntry;
  id v8 = [(CNFavoritesEntry *)&v35 init];
  if (v8)
  {
    id v9 = [v6 objectForKey:@"Property"];
    if (v9)
    {
      if (initWithDictionaryRepresentation_store__cn_once_token_2 != -1) {
        dispatch_once(&initWithDictionaryRepresentation_store__cn_once_token_2, &__block_literal_global_81_2);
      }
      id v10 = (id)initWithDictionaryRepresentation_store__cn_once_object_2;
      uint64_t v11 = [v6 objectForKey:@"Property"];
      uint64_t v12 = [v10 objectForKeyedSubscript:v11];

      propertyKey = v8->_propertyKey;
      v8->_propertyKey = (NSString *)v12;
    }
    if (!v8->_propertyKey)
    {
      NSLog(&cfstr_Cnfavoritesent_1.isa, [v9 intValue]);
      objc_storeStrong((id *)&v8->_propertyKey, @"emailAddresses");
    }
    uint64_t v14 = [v6 objectForKey:@"Value"];
    [(CNFavoritesEntry *)v8 setValue:v14];

    uint64_t v15 = [v6 objectForKey:@"Label"];
    label = v8->_label;
    v8->_label = (NSString *)v15;

    id v17 = [v6 objectForKey:@"Name"];
    objc_setProperty_nonatomic_copy(v8, v18, v17, 96);

    int v19 = [v6 objectForKey:@"ABUid"];
    -[CNFavoritesEntry setAbUid:](v8, "setAbUid:", [v19 intValue]);

    id v20 = [v6 objectForKey:@"ABIdentifier"];
    -[CNFavoritesEntry setAbIdentifier:](v8, "setAbIdentifier:", [v20 intValue]);

    uint64_t v21 = [v6 objectForKey:@"ABDatabaseUUID"];
    abDatabaseUUID = v8->_abDatabaseUUID;
    v8->_abDatabaseUUID = (NSString *)v21;

    objc_storeStrong((id *)&v8->_contactStore, a4);
    uint64_t v23 = [v6 objectForKey:@"EntryType"];
    uint64_t v24 = v23;
    if (v23) {
      v8->_type = (int)[v23 intValue];
    }
    v25 = [v6 objectForKey:@"ActionType"];
    v26 = [v6 objectForKey:@"BundleIdentifier"];
    if (!v25)
    {
      id v33 = v26;
      id v34 = 0;
      -[CNFavoritesEntry _convertFromEntryType:toActionType:bundleIdentifier:](v8, [(CNFavoritesEntry *)v8 type], &v34, &v33);
      v25 = (NSString *)v34;
      id v27 = v33;

      v26 = v27;
    }
    actionType = v8->_actionType;
    v8->_actionType = v25;
    id v29 = v25;

    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v26;

    BOOL v31 = [v6 objectForKey:@"ActionChannel"];
    [(CNFavoritesEntry *)v8 setActionChannel:v31];
  }
  return v8;
}

void __59__CNFavoritesEntry_initWithDictionaryRepresentation_store___block_invoke()
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v0 = [NSNumber numberWithInt:*MEMORY[0x1E4F49CC8]];
  v7[0] = v0;
  v8[0] = @"phoneNumbers";
  v1 = [NSNumber numberWithInt:*MEMORY[0x1E4F49AC0]];
  v7[1] = v1;
  v8[1] = @"emailAddresses";
  id v2 = [NSNumber numberWithInt:*MEMORY[0x1E4F49B48]];
  v7[2] = v2;
  v8[2] = @"instantMessageAddresses";
  objc_super v3 = [NSNumber numberWithInt:*MEMORY[0x1E4F49D30]];
  v7[3] = v3;
  v8[3] = @"socialProfiles";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];
  uint64_t v5 = [v4 copy];
  id v6 = (void *)initWithDictionaryRepresentation_store__cn_once_object_2;
  initWithDictionaryRepresentation_store__cn_once_object_2 = v5;
}

- (id)dictionaryRepresentation
{
  unsigned int v23 = 0;
  objc_super v3 = +[CN contactPropertiesByKey];
  id v4 = v3;
  if (self) {
    propertyKey = self->_propertyKey;
  }
  else {
    propertyKey = 0;
  }
  id v6 = [v3 objectForKeyedSubscript:propertyKey];
  char v7 = [v6 abPropertyID:&v23];

  if ((v7 & 1) == 0) {
    NSLog(&cfstr_Cnfavoritesent_2.isa);
  }
  id v8 = (void *)MEMORY[0x1E4F1CA60];
  id v9 = objc_msgSend(NSNumber, "numberWithInt:", -[CNFavoritesEntry abUid](self, "abUid"));
  id v10 = objc_msgSend(NSNumber, "numberWithInt:", -[CNFavoritesEntry abIdentifier](self, "abIdentifier"));
  uint64_t v11 = [NSNumber numberWithInt:v23];
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithInt:", -[CNFavoritesEntry type](self, "type"));
  uint64_t v13 = [(CNFavoritesEntry *)self actionType];
  uint64_t v14 = [(CNFavoritesEntry *)self bundleIdentifier];
  uint64_t v15 = objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, @"ABUid", v10, @"ABIdentifier", v11, @"Property", v12, @"EntryType", v13, @"ActionType", v14, @"BundleIdentifier", 0);

  id v16 = [(CNFavoritesEntry *)self value];

  if (v16)
  {
    id v17 = [(CNFavoritesEntry *)self value];
    [v15 setObject:v17 forKey:@"Value"];
  }
  if (self && self->_label) {
    [v15 setObject:self->_label forKey:@"Label"];
  }
  SEL v18 = [(CNFavoritesEntry *)self name];

  if (v18)
  {
    int v19 = [(CNFavoritesEntry *)self name];
    [v15 setObject:v19 forKey:@"Name"];
  }
  if (self && self->_abDatabaseUUID) {
    [v15 setObject:self->_abDatabaseUUID forKey:@"ABDatabaseUUID"];
  }
  id v20 = [(CNFavoritesEntry *)self actionChannel];

  if (v20)
  {
    uint64_t v21 = [(CNFavoritesEntry *)self actionChannel];
    [v15 setObject:v21 forKey:@"ActionChannel"];
  }

  return v15;
}

- (void)dictionaryRepresentation:(id *)a3 isDirty:(BOOL *)a4
{
  *a3 = [(CNFavoritesEntry *)self dictionaryRepresentation];
  *a4 = [(CNFavoritesEntry *)self dirty];

  [(CNFavoritesEntry *)self setDirty:0];
}

+ (BOOL)favoritesEntryValueForLabeledValueValue:(void *)a3 propertyKey:(void *)a4 isEqualToValue:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a2;
  self;
  id v9 = +[CNFavoritesEntry favoritesEntryValueForLabeledValueValue:propertyKey:]((uint64_t)CNFavoritesEntry, v8, v6);

  if ([v9 isEqualToString:v7])
  {
    BOOL v10 = 1;
  }
  else if ([v6 isEqualToString:@"phoneNumbers"])
  {
    BOOL v10 = CNFavoritesPhoneNumbersEqual(v9, v7) != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)rematch
{
  v172[5] = *MEMORY[0x1E4F143B8];
  if (self) {
    contactStore = self->_contactStore;
  }
  else {
    contactStore = 0;
  }
  id v4 = contactStore;
  v131 = [(CNContactStore *)v4 identifierWithError:0];

  if (v131)
  {
    if (self) {
      abDatabaseUUID = self->_abDatabaseUUID;
    }
    else {
      abDatabaseUUID = 0;
    }
    id v6 = abDatabaseUUID;
    int v126 = ![(NSString *)v6 isEqualToString:v131];
  }
  else
  {
    int v126 = 0;
  }
  v172[0] = @"phoneNumbers";
  v172[1] = @"emailAddresses";
  v172[2] = @"socialProfiles";
  v172[3] = @"instantMessageAddresses";
  id v7 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
  v172[4] = v7;
  v125 = [MEMORY[0x1E4F1C978] arrayWithObjects:v172 count:5];

  int v8 = [(CNFavoritesEntry *)self abUid];
  char v9 = v126;
  if (v8 < 0) {
    char v9 = 1;
  }
  if (v9) {
    goto LABEL_34;
  }
  BOOL v10 = self ? self->_contactStore : 0;
  uint64_t v11 = v10;
  BOOL v12 = v11 == 0;

  if (v12
    || (!self ? (uint64_t v13 = 0) : (uint64_t v13 = self->_contactStore),
        uint64_t v14 = v13,
        fetchContactMatchingLegacyIdentifier(v14, [(CNFavoritesEntry *)self abUid], v125),
        v129 = objc_claimAutoreleasedReturnValue(),
        v14,
        !v129))
  {
LABEL_34:
    id v32 = 0;
    goto LABEL_35;
  }
  if (self) {
    propertyKey = self->_propertyKey;
  }
  else {
    propertyKey = 0;
  }
  id v16 = propertyKey;
  id v17 = [v129 valueForKey:v16];

  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  SEL v18 = v17;
  uint64_t v19 = [(CNContactStore *)v18 countByEnumeratingWithState:&v136 objects:v171 count:16];
  if (v19)
  {
    id v20 = 0;
    uint64_t v21 = *(void *)v137;
LABEL_21:
    uint64_t v22 = 0;
    while (1)
    {
      if (*(void *)v137 != v21) {
        objc_enumerationMutation(v18);
      }
      unsigned int v23 = *(void **)(*((void *)&v136 + 1) + 8 * v22);
      uint64_t v24 = [v23 label];
      v25 = self ? self->_label : 0;
      v26 = v25;
      BOOL v27 = [v24 localizedCaseInsensitiveCompare:v26] == 0;

      if (v27)
      {
        id v28 = v23;

        int v29 = [v28 iOSLegacyIdentifier];
        id v20 = v28;
        if (v29 == [(CNFavoritesEntry *)self abIdentifier]) {
          break;
        }
      }
      if (v19 == ++v22)
      {
        uint64_t v30 = [(CNContactStore *)v18 countByEnumeratingWithState:&v136 objects:v171 count:16];
        uint64_t v19 = v30;
        id v28 = v20;
        if (v30) {
          goto LABEL_21;
        }
        break;
      }
    }

    if (v28)
    {
      id v31 = v129;
LABEL_83:

      id v32 = v31;
      goto LABEL_84;
    }
  }
  else
  {
  }
  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  obj = v18;
  uint64_t v53 = [(CNContactStore *)obj countByEnumeratingWithState:&v132 objects:v170 count:16];
  if (!v53)
  {

    id v32 = v129;
    goto LABEL_35;
  }
  v54 = 0;
  uint64_t v55 = *(void *)v133;
LABEL_51:
  uint64_t v56 = 0;
  while (1)
  {
    if (*(void *)v133 != v55) {
      objc_enumerationMutation(obj);
    }
    v57 = *(void **)(*((void *)&v132 + 1) + 8 * v56);
    v58 = [v57 value];
    v59 = self ? self->_propertyKey : 0;
    v60 = v59;
    v61 = [(CNFavoritesEntry *)self value];
    BOOL v62 = +[CNFavoritesEntry favoritesEntryValueForLabeledValueValue:propertyKey:isEqualToValue:]((uint64_t)CNFavoritesEntry, v58, v60, v61);

    if (v62)
    {
      id v28 = v57;

      int v63 = [v28 iOSLegacyIdentifier];
      v54 = v28;
      if (v63 == [(CNFavoritesEntry *)self abIdentifier]) {
        break;
      }
    }
    if (v53 == ++v56)
    {
      uint64_t v64 = [(CNContactStore *)obj countByEnumeratingWithState:&v132 objects:v170 count:16];
      uint64_t v53 = v64;
      id v28 = v54;
      if (v64) {
        goto LABEL_51;
      }
      break;
    }
  }

  id v32 = v129;
  if (!v28)
  {
LABEL_35:
    id v33 = v32;
    if (self) {
      id v34 = self->_contactStore;
    }
    else {
      id v34 = 0;
    }
    objc_super v35 = v34;
    BOOL v36 = v35 == 0;

    if (v36)
    {
      id v28 = 0;
      id v32 = v33;
      goto LABEL_84;
    }
    if (self) {
      v37 = self->_contactStore;
    }
    else {
      v37 = 0;
    }
    SEL v18 = v37;
    int v38 = self;
    p_isa = (id *)&v38->super.isa;
    uint64_t v164 = 0;
    v165 = &v164;
    uint64_t v166 = 0x3032000000;
    v167 = __Block_byref_object_copy__29;
    v168 = __Block_byref_object_dispose__29;
    id v169 = 0;
    uint64_t v158 = 0;
    v159 = &v158;
    uint64_t v160 = 0x3032000000;
    v161 = __Block_byref_object_copy__29;
    v162 = __Block_byref_object_dispose__29;
    id v163 = 0;
    uint64_t v152 = 0;
    v153 = &v152;
    uint64_t v154 = 0x3032000000;
    v155 = __Block_byref_object_copy__29;
    v156 = __Block_byref_object_dispose__29;
    id v157 = 0;
    uint64_t v146 = 0;
    v147 = &v146;
    uint64_t v148 = 0x3032000000;
    v149 = __Block_byref_object_copy__29;
    v150 = __Block_byref_object_dispose__29;
    id v151 = 0;
    if (!self
      || ([(CNFavoritesEntry *)v38 value],
          id v40 = objc_claimAutoreleasedReturnValue(),
          BOOL v41 = v40 == 0,
          v40,
          v41))
    {
      id v50 = 0;
      id v31 = 0;
LABEL_82:
      _Block_object_dispose(&v146, 8);

      _Block_object_dispose(&v152, 8);
      _Block_object_dispose(&v158, 8);

      _Block_object_dispose(&v164, 8);
      id v28 = v50;

      goto LABEL_83;
    }
    int v42 = [CNContactFetchRequest alloc];
    id v43 = p_isa[10];
    int v44 = +[CNFavoritesEntry descriptorsForRequiredKeysForPropertyKey:v43];
    v45 = [(CNContactFetchRequest *)v42 initWithKeysToFetch:v44];

    [(CNContactFetchRequest *)v45 setUnifyResults:0];
    id v46 = p_isa[10];
    LODWORD(v44) = [v46 isEqualToString:@"phoneNumbers"];

    if (v44)
    {
      long long v47 = [p_isa value];
      long long v48 = +[CNPhoneNumber phoneNumberWithStringValue:v47];
      long long v49 = +[CNContact predicateForContactsMatchingPhoneNumber:v48];
      [(CNContactFetchRequest *)v45 setPredicate:v49];
    }
    else
    {
      id v51 = p_isa[10];
      int v52 = [v51 isEqualToString:@"emailAddresses"];

      if (v52)
      {
        long long v47 = [p_isa value];
        long long v48 = +[CNContact predicateForContactsMatchingEmailAddress:v47];
        [(CNContactFetchRequest *)v45 setPredicate:v48];
      }
      else
      {
        id v65 = p_isa[10];
        int v66 = [v65 isEqualToString:@"socialProfiles"];

        if (v66)
        {
          v67 = [p_isa value];
          long long v47 = +[CNFavoritesEntry socialProfileForFavoritesEntryValue:]((uint64_t)CNFavoritesEntry, v67);

          long long v48 = +[CNContact predicateForContactsMatchingSocialProfile:v47];
          [(CNContactFetchRequest *)v45 setPredicate:v48];
        }
        else
        {
          id v68 = p_isa[10];
          int v69 = [v68 isEqualToString:@"instantMessageAddresses"];

          if (!v69) {
            goto LABEL_70;
          }
          v70 = [p_isa value];
          long long v47 = +[CNFavoritesEntry instantMessageAddressForFavoritesEntryValue:]((uint64_t)CNFavoritesEntry, v70);

          long long v48 = +[CNContact predicateForContactsMatchingInstantMessageAddress:v47];
          [(CNContactFetchRequest *)v45 setPredicate:v48];
        }
      }
    }

LABEL_70:
    v71 = [(CNContactFetchRequest *)v45 predicate];
    BOOL v72 = v71 == 0;

    if (v72)
    {
      id v50 = 0;
      id v31 = 0;
LABEL_81:

      goto LABEL_82;
    }
    v140[0] = MEMORY[0x1E4F143A8];
    v140[1] = 3221225472;
    v140[2] = ___findBestCandidateForFavorite_block_invoke;
    v140[3] = &unk_1E56B3BA8;
    v142 = &v152;
    v141 = p_isa;
    v143 = &v146;
    v144 = &v164;
    v145 = &v158;
    [(CNContactStore *)v18 enumerateNonUnifiedContactsWithFetchRequest:v45 error:0 usingBlock:v140];
    v73 = (void *)v147[5];
    v74 = (void *)v165[5];
    if (v73)
    {
      if (v73 == v74) {
        v75 = (void *)v159[5];
      }
      else {
        v75 = 0;
      }
      id v77 = v75;
      v78 = v147;
    }
    else
    {
      if (v74)
      {
        id v31 = v74;
        v76 = (void *)v159[5];
        id v77 = v76;
LABEL_80:
        id v79 = v76;
        id v50 = v77;

        goto LABEL_81;
      }
      id v77 = 0;
      v78 = v153;
    }
    v76 = (void *)v78[5];
    id v31 = v76;
    goto LABEL_80;
  }
LABEL_84:
  if (!v32)
  {
    v81 = 0;
    id obja = 0;
    id v82 = 0;
    v83 = 0;
    goto LABEL_143;
  }
  v130 = v32;
  int v121 = [v32 iOSLegacyIdentifier];
  int v120 = [(CNFavoritesEntry *)self abUid];
  if (v28)
  {
    int v80 = [v28 iOSLegacyIdentifier];
    BOOL v122 = v80 != [(CNFavoritesEntry *)self abIdentifier];
  }
  else
  {
    BOOL v122 = 0;
  }
  v123 = [(CNFavoritesEntry *)self name];
  v124 = +[CNContactFormatter stringFromContact:v130 style:0];
  if ([v124 isEqualToString:v123]) {
    id obja = 0;
  }
  else {
    id obja = v124;
  }
  if (self) {
    v84 = self->_propertyKey;
  }
  else {
    v84 = 0;
  }
  v85 = v84;
  BOOL v86 = [(NSString *)v85 isEqualToString:@"phoneNumbers"];

  if (v86)
  {
    v87 = [v28 value];
    v88 = [v87 stringValue];

    goto LABEL_114;
  }
  if (self) {
    v89 = self->_propertyKey;
  }
  else {
    v89 = 0;
  }
  v90 = v89;
  BOOL v91 = [(NSString *)v90 isEqualToString:@"emailAddresses"];

  if (v91)
  {
    v88 = [v28 value];
    goto LABEL_114;
  }
  if (self) {
    v92 = self->_propertyKey;
  }
  else {
    v92 = 0;
  }
  v93 = v92;
  BOOL v94 = [(NSString *)v93 isEqualToString:@"socialProfiles"];

  if (v94)
  {
    objc_opt_class();
    id v95 = [v28 value];
    if (objc_opt_isKindOfClass()) {
      v96 = v95;
    }
    else {
      v96 = 0;
    }
LABEL_106:
    id v97 = v96;

    v88 = +[CNFavoritesEntry valueStringFromSocialProfile:]((uint64_t)CNFavoritesEntry, v97);

    goto LABEL_114;
  }
  if (self) {
    v98 = self->_propertyKey;
  }
  else {
    v98 = 0;
  }
  v99 = v98;
  BOOL v100 = [(NSString *)v99 isEqualToString:@"instantMessageAddresses"];

  if (v100)
  {
    objc_opt_class();
    id v95 = [v28 value];
    if (objc_opt_isKindOfClass()) {
      v96 = v95;
    }
    else {
      v96 = 0;
    }
    goto LABEL_106;
  }
  v88 = 0;
LABEL_114:
  v101 = [(CNFavoritesEntry *)self value];
  char v102 = [v88 isEqualToString:v101];

  if (v102) {
    id v82 = 0;
  }
  else {
    id v82 = v88;
  }
  v103 = [v28 label];
  uint64_t v104 = *MEMORY[0x1E4F5A298];
  int v105 = (*(uint64_t (**)(void, void *))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], v103);
  if (v105)
  {
    v106 = self ? self->_label : 0;
    v101 = v106;
    if ((*(unsigned int (**)(uint64_t, NSString *))(v104 + 16))(v104, v101))
    {

LABEL_127:
      v81 = 0;
      goto LABEL_129;
    }
  }
  v107 = [v28 label];
  if (self) {
    label = self->_label;
  }
  else {
    label = 0;
  }
  v109 = label;
  char v110 = [v107 isEqualToString:v109];

  if (v105) {
  if (v110)
  }
    goto LABEL_127;
  v81 = [v28 label];
LABEL_129:
  if (((v126 | v122) & 1) != 0 || obja || v121 != v120 || v82 || v81)
  {
    v83 = objc_alloc_init(CNFavoritesLookupChangeRecord);
    if (v122) {
      uint64_t v111 = [v28 iOSLegacyIdentifier];
    }
    else {
      uint64_t v111 = 0xFFFFFFFFLL;
    }
    [(CNFavoritesLookupChangeRecord *)v83 setIdentifier:v111];
    if (v121 == v120) {
      uint64_t v112 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v112 = [v130 iOSLegacyIdentifier];
    }
    [(CNFavoritesLookupChangeRecord *)v83 setUid:v112];
    [(CNFavoritesLookupChangeRecord *)v83 setValue:v82];
    [(CNFavoritesLookupChangeRecord *)v83 setName:obja];
    [(CNFavoritesLookupChangeRecord *)v83 setLabel:v81];
    [(CNFavoritesLookupChangeRecord *)v83 setAbDatabaseUUID:v131];
  }
  else
  {
    v83 = 0;
  }

  id v32 = v130;
LABEL_143:
  v113 = v32;
  BOOL v114 = v32 == 0;
  v115 = v83;
  v116 = (void *)MEMORY[0x1E4F5A490];
  v117 = [NSNumber numberWithBool:v114];
  v118 = [v116 pairWithFirst:v115 second:v117];

  return v118;
}

- (BOOL)rematchWithContacts
{
  objc_super v3 = [(CNFavoritesEntry *)self rematch];
  id v4 = [v3 second];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    [(CNFavoritesEntry *)self resetContactMatch];
  }
  else
  {
    id v6 = [v3 first];
    [(CNFavoritesEntry *)self applyChangeRecord:v6];
  }
  BOOL v7 = [(CNFavoritesEntry *)self dirty];

  return v7;
}

- (BOOL)rematchWithGeminiManager:(id)a3
{
  id v4 = a3;
  int v5 = [(CNFavoritesEntry *)self actionType];
  if ([v5 isEqualToString:@"AudioCallActionType"]) {
    goto LABEL_6;
  }
  id v6 = [(CNFavoritesEntry *)self actionType];
  if ([v6 isEqualToString:@"MessageActionType"])
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  BOOL v7 = [(CNFavoritesEntry *)self actionType];
  if ([v7 isEqualToString:@"TTYCallActionType"])
  {

    goto LABEL_5;
  }
  uint64_t v15 = [(CNFavoritesEntry *)self actionType];
  char v16 = [v15 isEqualToString:@"TTYRelayCallActionType"];

  if ((v16 & 1) == 0)
  {
    BOOL v13 = 0;
    goto LABEL_10;
  }
LABEL_7:
  int v8 = [(CNFavoritesEntry *)self contactProperty];
  char v9 = [v8 contact];
  BOOL v10 = [v4 bestSenderIdentityForContact:v9 error:0];

  uint64_t v11 = +[CNGeminiManager channelStringFromSenderIdentity:v10];
  BOOL v12 = [(CNFavoritesEntry *)self actionChannel];

  if (v12 != v11)
  {
    [(CNFavoritesEntry *)self setActionChannel:v11];
    [(CNFavoritesEntry *)self setDirty:1];
  }
  BOOL v13 = [(CNFavoritesEntry *)self dirty];

LABEL_10:
  return v13;
}

- (void)resetContactMatch
{
  if (self && (objc_super v3 = self->_label) != 0
    || ([(CNFavoritesEntry *)self name], (objc_super v3 = (NSString *)objc_claimAutoreleasedReturnValue()) != 0)
    || ([(CNFavoritesEntry *)self abUid] & 0x80000000) == 0)
  {
  }
  else if ([(CNFavoritesEntry *)self abIdentifier] < 0)
  {
    return;
  }
  int v4 = [(CNFavoritesEntry *)self abUid];
  if ((v4 & 0x80000000) == 0) {
    [(CNFavoritesEntry *)self setAbUid:0xFFFFFFFFLL];
  }
  if ([(CNFavoritesEntry *)self abIdentifier] < 0)
  {
    BOOL v5 = v4 >= 0;
    if (!self)
    {
LABEL_13:
      if (!v5) {
        return;
      }
      goto LABEL_14;
    }
  }
  else
  {
    [(CNFavoritesEntry *)self setAbIdentifier:0xFFFFFFFFLL];
    BOOL v5 = 1;
    if (!self) {
      goto LABEL_13;
    }
  }
  if (!self->_abDatabaseUUID) {
    goto LABEL_13;
  }
  -[CNChangesNotifierProxy setCoalescingTimer:]((uint64_t)self, 0);
LABEL_14:
  [(CNFavoritesEntry *)self setDirty:1];

  -[CNFavoritesEntry setContact:]((uint64_t)self, 0);
}

- (void)applyChangeRecord:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v16 = v4;
    if (([v4 identifier] & 0x80000000) == 0) {
      -[CNFavoritesEntry setAbIdentifier:](self, "setAbIdentifier:", [v16 identifier]);
    }
    if (([v16 uid] & 0x80000000) == 0)
    {
      [(CNFavoritesEntry *)self setOldAbUid:self->_abUid];
      -[CNFavoritesEntry setAbUid:](self, "setAbUid:", [v16 uid]);
    }
    BOOL v5 = [v16 value];

    if (v5)
    {
      id v6 = [v16 value];
      [(CNFavoritesEntry *)self setValue:v6];
    }
    BOOL v7 = [v16 name];

    if (v7)
    {
      int v8 = [v16 name];
      name = self->_name;
      self->_name = v8;

      objc_setProperty_nonatomic_copy(self, v10, self->_name, 96);
    }
    uint64_t v11 = [v16 label];

    if (v11)
    {
      BOOL v12 = [v16 label];
      label = self->_label;
      self->_label = v12;
    }
    if ((self->_abUid & 0x80000000) == 0)
    {
      uint64_t v14 = [v16 abDatabaseUUID];
      abDatabaseUUID = self->_abDatabaseUUID;
      self->_abDatabaseUUID = v14;
    }
    [(CNFavoritesEntry *)self setDirty:1];
    id v4 = v16;
  }
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSString)actionType
{
  return self->_actionType;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (int)abUid
{
  return self->_abUid;
}

- (void)setAbUid:(int)a3
{
  self->_abUid = a3;
}

- (int)abIdentifier
{
  return self->_abIdentifier;
}

- (void)setAbIdentifier:(int)a3
{
  self->_abIdentifier = a3;
}

- (NSString)actionChannel
{
  return self->_actionChannel;
}

- (void)setActionChannel:(id)a3
{
}

- (int)oldAbUid
{
  return self->_oldAbUid;
}

- (void)setOldAbUid:(int)a3
{
  self->_oldAbUid = a3;
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionChannel, 0);
  objc_storeStrong((id *)&self->_labeledValueIdentifier, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_originalName, 0);
  objc_storeStrong((id *)&self->_abDatabaseUUID, 0);
  objc_storeStrong((id *)&self->_propertyKey, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end