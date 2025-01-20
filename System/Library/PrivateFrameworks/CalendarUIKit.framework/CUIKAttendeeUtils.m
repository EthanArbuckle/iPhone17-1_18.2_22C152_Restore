@interface CUIKAttendeeUtils
+ (id)_contactForIdentity:(id)a3 keys:(id)a4;
+ (id)_displayStringForIdentityWithDecomposedName:(id)a3 useAddressAsFallback:(BOOL)a4 contactIdentifier:(id *)a5 outFirstName:(id *)a6 outLastName:(id *)a7 outDepartment:(id *)a8 useShortName:(BOOL)a9;
+ (id)_filteredAttendeeName:(id)a3 parenthesizedPart:(id *)a4;
+ (id)contactForIdentity:(id)a3 keys:(id)a4 provider:(id)a5;
+ (id)displayShortStringForIdentityWithDecomposedName:(id)a3 useAddressAsFallback:(BOOL)a4 contactIdentifier:(id *)a5 outFirstName:(id *)a6 outLastName:(id *)a7 outDepartment:(id *)a8;
+ (id)displayStringForIdentity:(id)a3 useAddressAsFallback:(BOOL)a4 contactIdentifier:(id *)a5;
+ (id)displayStringForIdentityWithDecomposedName:(id)a3 useAddressAsFallback:(BOOL)a4 contactIdentifier:(id *)a5 outFirstName:(id *)a6 outLastName:(id *)a7 outDepartment:(id *)a8;
+ (id)sortEKParticipantsIgnoringNonHumans:(id)a3 event:(id)a4;
+ (id)sortEKParticipantsIgnoringNonHumans:(id)a3 event:(id)a4 includeOrganizer:(BOOL)a5;
+ (id)sortedEKParticipantsForSortingIgnoringNonHumans:(id)a3 event:(id)a4;
+ (id)sortedEKParticipantsForSortingIgnoringNonHumans:(id)a3 event:(id)a4 includeOrganizer:(BOOL)a5;
@end

@implementation CUIKAttendeeUtils

+ (id)contactForIdentity:(id)a3 keys:(id)a4 provider:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [v9 phoneNumber];
  v11 = [v9 emailAddress];

  if (!v10)
  {
    if (!v11)
    {
      v16 = 0;
      v14 = 0;
      goto LABEL_9;
    }
    v14 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v11];
    if (v14) {
      goto LABEL_3;
    }
LABEL_7:
    v16 = 0;
    goto LABEL_9;
  }
  v12 = (void *)MEMORY[0x1E4F1B8F8];
  v13 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v10];
  v14 = [v12 predicateForContactsMatchingPhoneNumber:v13];

  if (!v14) {
    goto LABEL_7;
  }
LABEL_3:
  v15 = [v8 unifiedContactsMatchingPredicate:v14 keysToFetch:v7];
  v16 = v15;
  if (v15)
  {
    v17 = [v15 firstObject];
    goto LABEL_10;
  }
LABEL_9:
  v17 = 0;
LABEL_10:

  return v17;
}

+ (id)_contactForIdentity:(id)a3 keys:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F576B0];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 defaultProvider];
  v10 = [a1 contactForIdentity:v8 keys:v7 provider:v9];

  return v10;
}

+ (id)_displayStringForIdentityWithDecomposedName:(id)a3 useAddressAsFallback:(BOOL)a4 contactIdentifier:(id *)a5 outFirstName:(id *)a6 outLastName:(id *)a7 outDepartment:(id *)a8 useShortName:(BOOL)a9
{
  BOOL v41 = a4;
  v47[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  v13 = (void *)EKWeakLinkClass();
  v14 = v13;
  if (a9) {
    uint64_t v15 = 1000;
  }
  else {
    uint64_t v15 = 0;
  }
  v16 = [v13 descriptorForRequiredKeysForStyle:v15];
  v47[0] = v16;
  v17 = EKWeakLinkStringConstant();
  v47[1] = v17;
  v18 = EKWeakLinkStringConstant();
  v47[2] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:3];
  v20 = [a1 _contactForIdentity:v12 keys:v19];

  v21 = a6;
  if (v20)
  {
    v22 = [v14 stringFromContact:v20 style:v15];
    if (a6)
    {
      *a6 = [v20 givenName];
    }
    if (a7)
    {
      *a7 = [v20 familyName];
    }
    if (a5)
    {
      *a5 = [v20 identifier];
    }
    if (v22)
    {
LABEL_31:
      v32 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      v33 = [v22 stringByTrimmingCharactersInSet:v32];
      int v34 = [v33 isEqual:&stru_1F187C430];

      if (!v34 || !v41) {
        goto LABEL_42;
      }
      goto LABEL_35;
    }
  }
  v22 = [v12 name];
  v23 = [v12 firstName];
  v24 = [v12 lastName];
  if (![v22 length])
  {
LABEL_17:
    id v27 = 0;
    goto LABEL_19;
  }
  if (![v23 length] || !objc_msgSend(v24, "length"))
  {
    if (([v22 cal_isPhoneNumber] & 1) == 0)
    {
      id v43 = v24;
      v44[0] = v23;
      CUIKDecomposedAttendeeName((uint64_t)v22, (uint64_t)v44, (uint64_t)&v43);
      id v28 = v44[0];

      id v29 = v43;
      id v27 = 0;
      v24 = v29;
      v21 = a6;
      v23 = v28;
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  id v45 = 0;
  id v46 = 0;
  v44[1] = 0;
  CUIKDecomposedAttendeeName((uint64_t)v22, (uint64_t)&v46, (uint64_t)&v45);
  id v25 = v46;
  id v26 = v45;

  id v27 = 0;
  v21 = a6;
LABEL_19:
  if ([v23 length] && objc_msgSend(v24, "length"))
  {
    id v30 = objc_alloc_init((Class)EKWeakLinkClass());
    [v30 setGivenName:v23];
    [v30 setFamilyName:v24];
    if ([v27 length]) {
      [v30 setDepartmentName:v27];
    }
    uint64_t v31 = [(id)EKWeakLinkClass() stringFromContact:v30 style:v15];

    if (v21) {
      id *v21 = v23;
    }
    if (a7) {
      *a7 = v24;
    }
    if (a8) {
      *a8 = v27;
    }

    v22 = v31;
  }

  if (v22) {
    goto LABEL_31;
  }
  if (!v41) {
    goto LABEL_42;
  }
LABEL_35:
  v35 = [v12 emailAddress];
  v36 = [v12 phoneNumber];
  if ([v35 length])
  {
    v37 = v22;
    v22 = v35;
  }
  else if ([v36 length])
  {
    v37 = +[CUIKPhoneNumberDescriptionGenerator sharedGenerator];
    uint64_t v38 = [v37 formattedStringForPhoneNumber:v36];

    v22 = v38;
  }
  else
  {
    v37 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      +[CUIKAttendeeUtils _displayStringForIdentityWithDecomposedName:useAddressAsFallback:contactIdentifier:outFirstName:outLastName:outDepartment:useShortName:]((uint64_t)v12, v37);
    }
  }

LABEL_42:

  return v22;
}

+ (id)_filteredAttendeeName:(id)a3 parenthesizedPart:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v5, "rangeOfString:", @"(");
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = v6;
    uint64_t v9 = objc_msgSend(v5, "rangeOfString:options:range:", @""), 0, v8, objc_msgSend(v5, "length") - v8);
    id v10 = v5;
    v11 = v10;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = v10;
    }
    else
    {
      uint64_t v12 = [v10 length];
      v13 = [v11 substringToIndex:v8];
      if (v9 + 1 == v12)
      {
        v14 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        id v7 = [v13 stringByTrimmingCharactersInSet:v14];
        uint64_t v15 = v11;
      }
      else
      {
        v14 = [v11 substringFromIndex:v9];
        uint64_t v15 = [v13 stringByAppendingString:@" "];
        id v7 = [v15 stringByAppendingString:v14];
      }
      if (a4 && v9 + ~v8)
      {
        objc_msgSend(v11, "substringWithRange:", v8 + 1, v9 + ~v8);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v7;
}

+ (id)displayStringForIdentity:(id)a3 useAddressAsFallback:(BOOL)a4 contactIdentifier:(id *)a5
{
  return (id)[a1 displayStringForIdentityWithDecomposedName:a3 useAddressAsFallback:a4 contactIdentifier:a5 outFirstName:0 outLastName:0 outDepartment:0];
}

+ (id)displayShortStringForIdentityWithDecomposedName:(id)a3 useAddressAsFallback:(BOOL)a4 contactIdentifier:(id *)a5 outFirstName:(id *)a6 outLastName:(id *)a7 outDepartment:(id *)a8
{
  LOBYTE(v9) = 1;
  return (id)[a1 _displayStringForIdentityWithDecomposedName:a3 useAddressAsFallback:a4 contactIdentifier:a5 outFirstName:a6 outLastName:a7 outDepartment:a8 useShortName:v9];
}

+ (id)displayStringForIdentityWithDecomposedName:(id)a3 useAddressAsFallback:(BOOL)a4 contactIdentifier:(id *)a5 outFirstName:(id *)a6 outLastName:(id *)a7 outDepartment:(id *)a8
{
  LOBYTE(v9) = 0;
  return (id)[a1 _displayStringForIdentityWithDecomposedName:a3 useAddressAsFallback:a4 contactIdentifier:a5 outFirstName:a6 outLastName:a7 outDepartment:a8 useShortName:v9];
}

+ (id)sortedEKParticipantsForSortingIgnoringNonHumans:(id)a3 event:(id)a4 includeOrganizer:(BOOL)a5
{
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __92__CUIKAttendeeUtils_sortedEKParticipantsForSortingIgnoringNonHumans_event_includeOrganizer___block_invoke;
  v19 = &unk_1E636AD48;
  BOOL v21 = a5;
  id v9 = v7;
  id v20 = v9;
  id v10 = a3;
  v11 = [v8 predicateWithBlock:&v16];
  uint64_t v12 = objc_msgSend(v10, "filteredArrayUsingPredicate:", v11, v16, v17, v18, v19);

  if ([v12 count])
  {
    v13 = [MEMORY[0x1E4F255C0] participantsForSortingWithEKParticipants:v12];
    v14 = (void *)[v13 mutableCopy];
  }
  else
  {
    v14 = 0;
  }
  [v14 sortUsingSelector:sel_compare_];

  return v14;
}

uint64_t __92__CUIKAttendeeUtils_sortedEKParticipantsForSortingIgnoringNonHumans_event_includeOrganizer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 participantType];
  id v5 = [v3 name];
  if ([v5 length])
  {
    BOOL v6 = 0;
  }
  else
  {
    id v7 = [v3 URL];
    uint64_t v8 = [v7 resourceSpecifier];
    BOOL v6 = [v8 length] == 0;
  }
  if (*(unsigned char *)(a1 + 40))
  {
    int v9 = (v4 & 0xFFFFFFFFFFFFFFFELL) == 2 || v6;
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) organizer];
    char v11 = [v3 isEqualToParticipant:v10];
    int v12 = (v4 & 0xFFFFFFFFFFFFFFFELL) == 2 || v6;
    if (v11) {
      int v9 = 1;
    }
    else {
      int v9 = v12;
    }
  }
  return v9 ^ 1u;
}

+ (id)sortedEKParticipantsForSortingIgnoringNonHumans:(id)a3 event:(id)a4
{
  return (id)[a1 sortedEKParticipantsForSortingIgnoringNonHumans:a3 event:a4 includeOrganizer:0];
}

+ (id)sortEKParticipantsIgnoringNonHumans:(id)a3 event:(id)a4 includeOrganizer:(BOOL)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 sortedEKParticipantsForSortingIgnoringNonHumans:a3 event:a4 includeOrganizer:a5];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "participant", (void)v14);
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)sortEKParticipantsIgnoringNonHumans:(id)a3 event:(id)a4
{
  return (id)[a1 sortEKParticipantsIgnoringNonHumans:a3 event:a4 includeOrganizer:0];
}

+ (void)_displayStringForIdentityWithDecomposedName:(uint64_t)a1 useAddressAsFallback:(NSObject *)a2 contactIdentifier:outFirstName:outLastName:outDepartment:useShortName:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_ERROR, "Unable to get fallback for display string. Identity: %@.", (uint8_t *)&v2, 0xCu);
}

@end