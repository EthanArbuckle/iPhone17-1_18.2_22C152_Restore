@interface NSString(BRCAdditions)
- (id)br_decodeIndexStringToIndexSet;
- (id)br_libnotifyPerPersonaNotificationName:()BRCAdditions;
- (id)br_stringByBackslashEscapingCharactersInString:()BRCAdditions;
- (id)br_stringByJSONEscaping;
- (uint64_t)br_isBoostableItemIdentifier;
- (uint64_t)br_libnotifyPerUserNotificationName;
@end

@implementation NSString(BRCAdditions)

- (id)br_stringByBackslashEscapingCharactersInString:()BRCAdditions
{
  id v4 = a3;
  if ([v4 length] && objc_msgSend(v4, "rangeOfString:", @"\\"") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = brc_bread_crumbs((uint64_t)"-[NSString(BRCAdditions) br_stringByBackslashEscapingCharactersInString:]", 31);
    v15 = brc_default_log(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[NSString(BRCAdditions) br_stringByBackslashEscapingCharactersInString:]((uint64_t)v14, v15);
    }
  }
  id v5 = a1;
  v6 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:v4];
  uint64_t v7 = [v5 rangeOfCharacterFromSet:v6];
  if (v8)
  {
    uint64_t v9 = v7;
    uint64_t v10 = v8;
    v11 = [MEMORY[0x1E4F28E78] stringWithString:v5];
    do
    {
      [v11 insertString:@"\\"" atIndex:v9];
      if (v9 + v10 + 1 >= (unint64_t)[v11 length]) {
        break;
      }
      uint64_t v9 = objc_msgSend(v11, "rangeOfCharacterFromSet:options:range:", v6, 0);
      uint64_t v10 = v12;
    }
    while (v12);
  }
  else
  {
    v11 = v5;
  }

  return v11;
}

- (uint64_t)br_libnotifyPerUserNotificationName
{
  return [NSString stringWithFormat:@"user.uid.%d.%@", getuid(), a1];
}

- (id)br_libnotifyPerPersonaNotificationName:()BRCAdditions
{
  if (a3)
  {
    v3 = [NSString stringWithFormat:@"%@_%@", a1, a3];
  }
  else
  {
    v3 = (void *)[a1 copy];
  }

  return v3;
}

- (id)br_decodeIndexStringToIndexSet
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [a1 componentsSeparatedByString:@","];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    v22 = v2;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v24 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v23 + 1) + 8 * v7);
      uint64_t v9 = [v8 componentsSeparatedByString:@":"];
      if ([v9 count] == 2)
      {
        uint64_t v10 = [v9 objectAtIndexedSubscript:0];
        uint64_t v11 = [v10 longLongValue];

        uint64_t v12 = [v9 objectAtIndexedSubscript:1];
        uint64_t v13 = [v12 longLongValue];

        uint64_t v14 = v13 - v11;
        if (v13 < v11 || (v13 | v11) < 0)
        {
          v18 = brc_bread_crumbs((uint64_t)"-[NSString(BRCAdditions) br_decodeIndexStringToIndexSet]", 77);
          v19 = brc_default_log(1);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v28 = v8;
            __int16 v29 = 2112;
            v30 = v18;
            _os_log_impl(&dword_19ED3F000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Invalid range components %@%@", buf, 0x16u);
          }
          id v2 = v22;
          goto LABEL_24;
        }
        id v2 = v22;
        objc_msgSend(v22, "addIndexesInRange:", v11, v14 + 1);
      }
      else
      {
        if ([v9 count] != 1)
        {
          v18 = brc_bread_crumbs((uint64_t)"-[NSString(BRCAdditions) br_decodeIndexStringToIndexSet]", 94);
          v19 = brc_default_log(1);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v28 = v8;
            __int16 v29 = 2112;
            v30 = v18;
            v20 = "[WARNING] Invalid string range %@%@";
            goto LABEL_23;
          }
LABEL_24:

          id v17 = 0;
          goto LABEL_25;
        }
        v15 = [v9 objectAtIndexedSubscript:0];
        uint64_t v16 = [v15 longLongValue];

        if (v16 < 0)
        {
          v18 = brc_bread_crumbs((uint64_t)"-[NSString(BRCAdditions) br_decodeIndexStringToIndexSet]", 88);
          v19 = brc_default_log(1);
          id v2 = v22;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v28 = v8;
            __int16 v29 = 2112;
            v30 = v18;
            v20 = "[WARNING] Invalid string value %@%@";
LABEL_23:
            _os_log_impl(&dword_19ED3F000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x16u);
          }
          goto LABEL_24;
        }
        id v2 = v22;
        [v22 addIndex:v16];
      }

      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v17 = v2;
LABEL_25:

  return v17;
}

- (uint64_t)br_isBoostableItemIdentifier
{
  if (([a1 isEqualToString:*MEMORY[0x1E4F25C68]] & 1) != 0
    || ([a1 isEqualToString:*MEMORY[0x1E4F25C98]] & 1) != 0)
  {
    return 0;
  }
  else
  {
    return [a1 isEqualToString:*MEMORY[0x1E4F25CA0]] ^ 1;
  }
}

- (id)br_stringByJSONEscaping
{
  v1 = objc_msgSend(a1, "br_stringByBackslashEscapingCharactersInString:", @"\\\"");
  id v2 = (void *)[v1 mutableCopy];

  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"\n", @"\\n", 1, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"\r", @"\\r", 1, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"\t", @"\\t", 1, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"\b", @"\\b", 1, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"\f", @"\\f", 1, 0, objc_msgSend(v2, "length"));

  return v2;
}

- (void)br_stringByBackslashEscapingCharactersInString:()BRCAdditions .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: charactersToEscape.length == 0 || [charactersToEscape rangeOfString:@\"\\\\\"].location != NSNotFound%@", (uint8_t *)&v2, 0xCu);
}

@end