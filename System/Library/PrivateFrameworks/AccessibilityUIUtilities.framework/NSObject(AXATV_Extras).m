@interface NSObject(AXATV_Extras)
- (id)_accessibilityBadgeTextForTextElement:()AXATV_Extras;
- (id)_atvAccessibilityITMLAccessibilityContentWithElement:()AXATV_Extras;
- (id)_atvaccessibilityAncestorHasAXID:()AXATV_Extras;
- (id)_atvaccessibilityClosestElementAbove:()AXATV_Extras;
- (id)_atvaccessibilityGeometricNearestHeader;
- (id)_atvaccessibilityITMLAccessibilityContent;
- (id)_atvaccessibilityITMLClass;
@end

@implementation NSObject(AXATV_Extras)

- (id)_atvaccessibilityGeometricNearestHeader
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    v2 = [a1 _accessibilityAncestorIsKindOf:objc_opt_class()];
    v3 = __UIAccessibilityCastAsClass();

    v4 = [v3 _accessibilityFindUnsortedSubviewDescendantsPassingTest:&__block_literal_global_13];
    v5 = [a1 _atvaccessibilityClosestElementAbove:v4];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_atvaccessibilityClosestElementAbove:()AXATV_Extras
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [a1 accessibilityFrame];
  double v6 = v5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "accessibilityFrame", (void)v20);
        if (v14 >= 0.0 && v14 <= v6)
        {
          if (v10)
          {
            double v16 = v14;
            [v10 accessibilityFrame];
            if (v16 > v17)
            {
              id v18 = v13;

              id v10 = v18;
            }
          }
          else
          {
            id v10 = v13;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_atvaccessibilityAncestorHasAXID:()AXATV_Extras
{
  id v4 = a3;
  id v5 = a1;
  if (v5)
  {
    while (1)
    {
      double v6 = [v5 accessibilityIdentifier];
      if ([v4 containsObject:v6]) {
        break;
      }
      uint64_t v7 = [v5 accessibilityContainer];

      id v5 = (id)v7;
      if (!v7) {
        goto LABEL_6;
      }
    }
    id v5 = v5;
  }
LABEL_6:

  return v5;
}

- (id)_atvAccessibilityITMLAccessibilityContentWithElement:()AXATV_Extras
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  [v29 children];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v40 = 0;
        v41 = &v40;
        uint64_t v42 = 0x2050000000;
        uint64_t v9 = (void *)getIKViewElementClass_softClass_0;
        uint64_t v43 = getIKViewElementClass_softClass_0;
        if (!getIKViewElementClass_softClass_0)
        {
          uint64_t v35 = MEMORY[0x1E4F143A8];
          uint64_t v36 = 3221225472;
          v37 = __getIKViewElementClass_block_invoke_0;
          v38 = &unk_1E649BF00;
          v39 = &v40;
          __getIKViewElementClass_block_invoke_0((uint64_t)&v35);
          uint64_t v9 = (void *)v41[3];
        }
        id v10 = v9;
        _Block_object_dispose(&v40, 8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v8;
          v12 = [v11 accessibilityText];
          if (v12) {
            goto LABEL_10;
          }
          uint64_t v40 = 0;
          v41 = &v40;
          uint64_t v42 = 0x2050000000;
          double v14 = (void *)getIKImageElementClass_softClass;
          uint64_t v43 = getIKImageElementClass_softClass;
          if (!getIKImageElementClass_softClass)
          {
            uint64_t v35 = MEMORY[0x1E4F143A8];
            uint64_t v36 = 3221225472;
            v37 = __getIKImageElementClass_block_invoke;
            v38 = &unk_1E649BF00;
            v39 = &v40;
            __getIKImageElementClass_block_invoke((uint64_t)&v35);
            double v14 = (void *)v41[3];
          }
          id v15 = v14;
          _Block_object_dispose(&v40, 8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_16;
          }
          double v16 = +[AXATVUtils sharedInstance];
          double v17 = [v11 url];
          v12 = [v16 accessibilityLabelForResourceURL:v17];

          if (v12)
          {
LABEL_10:
            if ((objc_msgSend(v4, "containsString:", v12, v27) & 1) == 0)
            {
              v27 = v12;
              v28 = @"__AXStringForVariablesSentinel";
              uint64_t v13 = __AXStringForVariables();
              goto LABEL_22;
            }
          }
          else
          {
LABEL_16:
            uint64_t v18 = objc_msgSend(v11, "tv_elementType", v27, v28);
            if (v18 == 43)
            {
              v12 = 0;
            }
            else
            {
              if (v18 == 39)
              {
                v19 = [v11 attributes];
                long long v20 = [v19 objectForKeyedSubscript:@"value"];
                [v20 floatValue];

                long long v21 = +[AXATVUtils sharedInstance];
                uint64_t v22 = [v21 atvaccessibilityLocalizedString:@"tv.progress.format"];

                long long v23 = NSString;
                v24 = AXFormatFloatWithPercentage();
                uint64_t v25 = objc_msgSend(v23, "stringWithFormat:", v22, v24);

                v27 = v25;
                v28 = @"__AXStringForVariablesSentinel";
                uint64_t v13 = __AXStringForVariables();
              }
              else
              {
                uint64_t v22 = [a1 _atvAccessibilityITMLAccessibilityContentWithElement:v11];
                v27 = (void *)v22;
                v28 = @"__AXStringForVariablesSentinel";
                uint64_t v13 = __AXStringForVariables();
              }
              v12 = 0;
              id v4 = (void *)v22;
LABEL_22:

              id v4 = (void *)v13;
            }
          }

          continue;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v5);
  }

  return v4;
}

- (id)_atvaccessibilityITMLAccessibilityContent
{
  if (objc_opt_respondsToSelector())
  {
    v2 = [a1 performSelector:sel_tv_AccessibilityText];
  }
  else
  {
    v2 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    id v3 = objc_msgSend(a1, "tv_associatedIKViewElement");
    if (v2) {
      goto LABEL_10;
    }
  }
  else
  {
    id v3 = 0;
    if (v2) {
      goto LABEL_10;
    }
  }
  v2 = [v3 accessibilityText];
  if (!v2)
  {
    v2 = [a1 _atvAccessibilityITMLAccessibilityContentWithElement:v3];
  }
LABEL_10:
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2050000000;
  id v4 = (void *)getIKTextElementClass_softClass;
  uint64_t v13 = getIKTextElementClass_softClass;
  if (!getIKTextElementClass_softClass)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getIKTextElementClass_block_invoke;
    v9[3] = &unk_1E649BF00;
    v9[4] = &v10;
    __getIKTextElementClass_block_invoke((uint64_t)v9);
    id v4 = (void *)v11[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v10, 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [a1 _accessibilityBadgeTextForTextElement:v3];
    uint64_t v6 = __AXStringForVariables();

    v2 = (void *)v6;
  }

  return v2;
}

- (id)_atvaccessibilityITMLClass
{
  if (objc_opt_respondsToSelector())
  {
    v2 = objc_msgSend(a1, "tv_associatedIKViewElement");
    id v3 = [v2 attributes];
  }
  else
  {
    id v3 = 0;
  }
  id v4 = [v3 objectForKey:@"class"];

  return v4;
}

- (id)_accessibilityBadgeTextForTextElement:()AXATV_Extras
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [a3 badges];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = @"badge";
    uint64_t v7 = @"accessibilityText";
    uint64_t v8 = *(void *)v25;
    do
    {
      uint64_t v9 = 0;
      uint64_t v22 = v4;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v9), "safeValueForKey:", v6, v20, v21);
        id v11 = [v10 safeValueForKey:v7];
        if ([v11 length])
        {
          long long v20 = v11;
          long long v21 = @"__AXStringForVariablesSentinel";
          __AXStringForVariables();
          id v5 = v12 = v5;
        }
        else
        {
          uint64_t v12 = [v10 safeValueForKey:@"url"];
          uint64_t v13 = +[AXATVUtils sharedInstance];
          [v13 accessibilityLabelForResourceURL:v12];
          uint64_t v14 = v8;
          id v15 = v7;
          v17 = double v16 = v6;

          long long v20 = v17;
          long long v21 = @"__AXStringForVariablesSentinel";
          uint64_t v18 = __AXStringForVariables();

          uint64_t v6 = v16;
          uint64_t v7 = v15;
          uint64_t v8 = v14;
          uint64_t v4 = v22;
          id v5 = (void *)v18;
        }

        ++v9;
      }
      while (v4 != v9);
      uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end