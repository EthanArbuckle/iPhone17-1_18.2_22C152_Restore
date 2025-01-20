@interface CUIKTextProviderUtils
+ (BOOL)designatorRequiresWhitespace;
+ (BOOL)dropLeftRedundantDesignator;
+ (BOOL)smallCapsAllowed;
+ (id)timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:(id)a3 designatorRequiresWhitespace:(BOOL)a4;
@end

@implementation CUIKTextProviderUtils

+ (BOOL)smallCapsAllowed
{
  v2 = CUIKBundle();
  v3 = [v2 localizedStringForKey:@"SMALL_CAPS_FONT_ALLOWED" value:@"1" table:0];

  LOBYTE(v2) = [v3 isEqualToString:@"1"];
  return (char)v2;
}

+ (BOOL)dropLeftRedundantDesignator
{
  v2 = CUIKBundle();
  v3 = [v2 localizedStringForKey:@"INTERVAL_DROP_LEFTMOST_REDUNDANT_DESIGNATOR" value:@"1" table:0];

  LOBYTE(v2) = [v3 isEqualToString:@"1"];
  return (char)v2;
}

+ (BOOL)designatorRequiresWhitespace
{
  v2 = CUIKBundle();
  v3 = [v2 localizedStringForKey:@"DESIGNATOR_REQUIRES_WHITESPACE" value:@"0" table:0];

  LOBYTE(v2) = [v3 isEqualToString:@"1"];
  return (char)v2;
}

+ (id)timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:(id)a3 designatorRequiresWhitespace:(BOOL)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [MEMORY[0x1E4F28C10] _componentsFromFormatString:v5];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    BOOL v36 = a4;
    id v37 = v5;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v41;
    uint64_t v11 = *MEMORY[0x1E4F1C380];
    uint64_t v12 = *MEMORY[0x1E4F1C390];
LABEL_3:
    uint64_t v13 = 0;
    uint64_t v38 = v9;
    uint64_t v39 = v9 + v8;
    while (1)
    {
      if (*(void *)v41 != v10) {
        objc_enumerationMutation(v6);
      }
      v14 = *(void **)(*((void *)&v40 + 1) + 8 * v13);
      v15 = [v14 objectForKeyedSubscript:v11];
      if (([v15 BOOLValue] & 1) == 0)
      {
        v16 = [v14 objectForKeyedSubscript:v12];
        char v17 = [v16 hasPrefix:@"a"];

        if (v17) {
          break;
        }
      }

      if (v8 == ++v13)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v40 objects:v44 count:16];
        uint64_t v9 = v39;
        if (v8) {
          goto LABEL_3;
        }
        id v18 = v6;
        id v5 = v37;
        goto LABEL_35;
      }
    }

    uint64_t v19 = v38;
    if ((v38 ^ 0x7FFFFFFFFFFFFFFFLL) == v13) {
      goto LABEL_29;
    }
    if (v36)
    {
      BOOL v20 = 0;
    }
    else
    {
      if (v38 + v13)
      {
        v21 = [v6 objectAtIndexedSubscript:v38 + v13 - 1];
        v22 = [v21 objectForKeyedSubscript:v11];
        if ([v22 BOOLValue])
        {
          v23 = [v21 objectForKeyedSubscript:v12];
          v24 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
          v25 = [v23 stringByTrimmingCharactersInSet:v24];

          BOOL v20 = [v25 length] == 0;
          uint64_t v19 = v38;
        }
        else
        {
          BOOL v20 = 0;
        }
      }
      else
      {
        BOOL v20 = 0;
      }
      if (v38 + v13 < (unint64_t)([v6 count] - 1))
      {
        v26 = [v6 objectAtIndexedSubscript:v19 + v13 + 1];
        v27 = [v26 objectForKeyedSubscript:v11];
        if ([v27 BOOLValue])
        {
          v28 = [v26 objectForKeyedSubscript:v12];
          v29 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
          v30 = [v28 stringByTrimmingCharactersInSet:v29];

          BOOL v31 = [v30 length] == 0;
          uint64_t v19 = v38;
        }
        else
        {
          BOOL v31 = 0;
        }

        if (v20) {
          goto LABEL_30;
        }
        goto LABEL_28;
      }
    }
    BOOL v31 = 0;
    if (v20) {
      goto LABEL_30;
    }
LABEL_28:
    if (v31)
    {
LABEL_30:
      v32 = (void *)[v6 mutableCopy];
      v33 = v32;
      if (v31) {
        [v32 removeObjectAtIndex:v19 + v13 + 1];
      }
      if (v20) {
        [v33 removeObjectAtIndex:v19 + v13 - 1];
      }
      id v18 = v33;

      id v5 = [MEMORY[0x1E4F28C10] _formatStringFromComponents:v18];

      id v6 = v37;
      goto LABEL_35;
    }
LABEL_29:
    id v5 = v37;
    goto LABEL_36;
  }
  id v18 = v6;
LABEL_35:

  id v6 = v18;
LABEL_36:
  id v34 = v5;

  return v34;
}

@end