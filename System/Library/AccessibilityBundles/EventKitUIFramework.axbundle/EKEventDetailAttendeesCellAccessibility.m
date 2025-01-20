@interface EKEventDetailAttendeesCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axStringForParticipants:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation EKEventDetailAttendeesCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKEventDetailAttendeesCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"EKEventDetailAttendeesListView" hasInstanceVariable:@"_inviteeNames" withType:"NSMutableArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKEventDetailAttendeesCell", @"_attendeesListView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKEventDetailAttendeesListView", @"groupsNames", "B", 0);
  [v3 validateClass:@"EKEventDetailAttendeesCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"EKEventDetailAttendeesCell" hasInstanceVariable:@"_countLabel" withType:"UILabel"];
}

- (id)_axStringForParticipants:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v4)
  {
    v6 = 0;
    goto LABEL_21;
  }
  uint64_t v5 = v4;
  v6 = 0;
  uint64_t v7 = *(void *)v20;
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v20 != v7) {
        objc_enumerationMutation(v3);
      }
      v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v9 name];
LABEL_10:
        v11 = (void *)v10;
        uint64_t v12 = __UIAXStringForVariables();

        v6 = (void *)v12;
        goto LABEL_11;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v9 string];
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [v9 displayString];
        v17 = [v13 string];
        v14 = __UIAXStringForVariables();

        if (objc_msgSend(v9, "isOptionalParticipant", v17, @"__AXStringForVariablesSentinel"))
        {
          v18 = accessibilityLocalizedString(@"optional.attendee");
          v6 = __UIAXStringForVariables();
        }
        else
        {
          v6 = v14;
        }
      }
      else
      {
        _AXAssert();
      }
LABEL_11:
      ++v8;
    }
    while (v5 != v8);
    uint64_t v15 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    uint64_t v5 = v15;
  }
  while (v15);
LABEL_21:

  return v6;
}

- (id)accessibilityLabel
{
  id v3 = [(EKEventDetailAttendeesCellAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  uint64_t v4 = [v3 accessibilityLabel];
  uint64_t v5 = [(EKEventDetailAttendeesCellAccessibility *)self safeUIViewForKey:@"_countLabel"];
  uint64_t v8 = [v5 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (id)accessibilityValue
{
  id v3 = [(EKEventDetailAttendeesCellAccessibility *)self safeValueForKey:@"_attendeesListView"];
  uint64_t v4 = [v3 safeValueForKey:@"groupsNames"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    LOBYTE(v41) = 0;
    v6 = [v3 safeValueForKey:@"_inviteeNames"];
    uint64_t v7 = __UIAccessibilitySafeClass();

    char v47 = 0;
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy_;
    v45 = __Block_byref_object_dispose_;
    id v46 = 0;
    id v8 = v7;
    AXPerformSafeBlock();
    id v9 = (id)v42[5];

    _Block_object_dispose(&v41, 8);
    uint64_t v10 = __UIAccessibilitySafeClass();

    if (v47) {
      goto LABEL_24;
    }
    if ([v10 count])
    {
      v11 = MobileCalAXLocalizedString(@"invite.attending");
      uint64_t v12 = [(EKEventDetailAttendeesCellAccessibility *)self _axStringForParticipants:v10];
      v13 = __UIAXStringForVariables();

      v14 = __UIAXStringForVariables();
    }
    else
    {
      v14 = 0;
    }
    char v47 = 0;
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy_;
    v45 = __Block_byref_object_dispose_;
    id v46 = 0;
    id v19 = v8;
    AXPerformSafeBlock();
    id v20 = (id)v42[5];

    _Block_object_dispose(&v41, 8);
    long long v21 = __UIAccessibilitySafeClass();

    if (v47) {
      goto LABEL_24;
    }
    if ([v21 count])
    {
      long long v22 = MobileCalAXLocalizedString(@"invite.tentative");
      v23 = [(EKEventDetailAttendeesCellAccessibility *)self _axStringForParticipants:v21];
      uint64_t v24 = __UIAXStringForVariables();

      uint64_t v25 = __UIAXStringForVariables();

      v14 = (void *)v25;
    }
    char v47 = 0;
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy_;
    v45 = __Block_byref_object_dispose_;
    id v46 = 0;
    id v26 = v19;
    AXPerformSafeBlock();
    id v27 = (id)v42[5];

    _Block_object_dispose(&v41, 8);
    v28 = __UIAccessibilitySafeClass();

    if (v47) {
      goto LABEL_24;
    }
    if ([v28 count])
    {
      v29 = MobileCalAXLocalizedString(@"invite.declined");
      v30 = [(EKEventDetailAttendeesCellAccessibility *)self _axStringForParticipants:v28];
      v31 = __UIAXStringForVariables();

      uint64_t v32 = __UIAXStringForVariables();

      v14 = (void *)v32;
    }
    char v47 = 0;
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy_;
    v45 = __Block_byref_object_dispose_;
    id v46 = 0;
    id v33 = v26;
    AXPerformSafeBlock();
    id v34 = (id)v42[5];

    _Block_object_dispose(&v41, 8);
    v35 = __UIAccessibilitySafeClass();

    if (v47) {
LABEL_24:
    }
      abort();
    if ([v35 count])
    {
      v36 = MobileCalAXLocalizedString(@"invite.pending");
      v37 = [(EKEventDetailAttendeesCellAccessibility *)self _axStringForParticipants:v35];
      v38 = __UIAXStringForVariables();

      uint64_t v39 = __UIAXStringForVariables();

      v14 = (void *)v39;
    }
  }
  else
  {
    uint64_t v15 = [v3 safeValueForKey:@"_ungrouped"];
    if ([v15 count])
    {
      v16 = accessibilityLocalizedString(@"invited.status");
      v17 = [(EKEventDetailAttendeesCellAccessibility *)self _axStringForParticipants:v15];
      v18 = __UIAXStringForVariables();

      v14 = __UIAXStringForVariables();
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

uint64_t __61__EKEventDetailAttendeesCellAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) objectAtIndex:0];

  return MEMORY[0x270F9A758]();
}

uint64_t __61__EKEventDetailAttendeesCellAccessibility_accessibilityValue__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) objectAtIndex:1];

  return MEMORY[0x270F9A758]();
}

uint64_t __61__EKEventDetailAttendeesCellAccessibility_accessibilityValue__block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) objectAtIndex:2];

  return MEMORY[0x270F9A758]();
}

uint64_t __61__EKEventDetailAttendeesCellAccessibility_accessibilityValue__block_invoke_4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) objectAtIndex:3];

  return MEMORY[0x270F9A758]();
}

@end