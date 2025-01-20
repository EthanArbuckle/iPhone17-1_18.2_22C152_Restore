@interface CKAggregateAcknowledgmentChatItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation CKAggregateAcknowledgmentChatItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKAggregateAcknowledgmentChatItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAggregateAcknowledgmentChatItem", @"acknowledgments", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAggregateAcknowledgmentChatItem", @"includesMultiple", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAggregateAcknowledgmentChatItem", @"includesFromMe", "B", 0);
}

- (id)accessibilityLabel
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  char v27 = 0;
  objc_opt_class();
  id v3 = [(CKAggregateAcknowledgmentChatItemAccessibility *)self safeValueForKey:@"acknowledgments"];
  v4 = __UIAccessibilityCastAsClass();

  if (![v4 count])
  {
    v13 = 0;
    goto LABEL_26;
  }
  if (![(CKAggregateAcknowledgmentChatItemAccessibility *)self safeBoolForKey:@"includesMultiple"])
  {
    v8 = [v4 lastObject];
    if ([v8 safeBoolForKey:@"isFromMe"])
    {
      v12 = 0;
      v7 = 0;
      goto LABEL_10;
    }
    v7 = [v8 accessibilityLabel];
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  v5 = NSString;
  v6 = accessibilityLocalizedString(@"multiple.reactions.description");
  v7 = objc_msgSend(v5, "localizedStringWithFormat:", v6, objc_msgSend(v4, "count"));

  v8 = [v4 lastObject];
  if ([v8 safeBoolForKey:@"isFromMe"]) {
    goto LABEL_9;
  }
  v9 = NSString;
  v10 = accessibilityLocalizedString(@"acknowledgment.latest.format");
  v11 = [v8 accessibilityLabel];
  v12 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v11);

LABEL_10:
  if ([(CKAggregateAcknowledgmentChatItemAccessibility *)self safeBoolForKey:@"includesFromMe"])
  {
    if ([(CKAggregateAcknowledgmentChatItemAccessibility *)self safeBoolForKey:@"includesMultiple"])
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      v14 = [v4 reverseObjectEnumerator];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v24 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            if ([v19 safeBoolForKey:@"isFromMe"])
            {
              id v20 = v19;
              goto LABEL_24;
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
      id v20 = 0;
LABEL_24:
    }
    else
    {
      id v20 = [v4 firstObject];
    }
  }
  else
  {
    id v20 = 0;
  }
  v22 = [v20 accessibilityLabel];
  v13 = __AXStringForVariables();

LABEL_26:

  return v13;
}

@end