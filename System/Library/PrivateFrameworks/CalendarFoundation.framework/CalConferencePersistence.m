@interface CalConferencePersistence
+ (id)_htmlSerializedConference:(id)a3 serializationBlockTitle:(id)a4;
+ (id)_knownPersistenceFormats;
+ (id)deserializeConference:(id)a3;
+ (id)serializeConference:(id)a3 serializationBlockTitle:(id)a4;
+ (id)updateHTML:(id)a3 withEventNotes:(id)a4;
@end

@implementation CalConferencePersistence

+ (id)_knownPersistenceFormats
{
  if (_knownPersistenceFormats_onceToken != -1) {
    dispatch_once(&_knownPersistenceFormats_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)_knownPersistenceFormats_formats;

  return v2;
}

void __52__CalConferencePersistence__knownPersistenceFormats__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = objc_alloc_init(CalAppleConferenceFormat);
  v4[0] = v0;
  v1 = objc_alloc_init(CalGoogleConferenceFormat);
  v4[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  v3 = (void *)_knownPersistenceFormats_formats;
  _knownPersistenceFormats_formats = v2;
}

+ (id)serializeConference:(id)a3 serializationBlockTitle:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isWritable])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v8 = objc_msgSend(a1, "_knownPersistenceFormats", 0);
    v9 = (void *)[v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v12, "supportsSerializingConferenceWithSource:", objc_msgSend(v6, "source")))
          {
            v9 = [v12 serializeConference:v6 serializationBlockTitle:v7];
            goto LABEL_13;
          }
        }
        v9 = (void *)[v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)deserializeConference:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = objc_msgSend(a1, "_knownPersistenceFormats", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) deserializeConferences:v4];
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = [v5 firstObject];

  return v12;
}

+ (id)_htmlSerializedConference:(id)a3 serializationBlockTitle:(id)a4
{
  id v4 = NSString;
  v5 = [a1 serializeConference:a3 serializationBlockTitle:a4];
  id v6 = [v4 stringWithFormat:@"<pre>\n%@\n</pre>", v5];

  return v6;
}

+ (id)updateHTML:(id)a3 withEventNotes:(id)a4
{
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  if (!(v6 | v7))
  {
    id v16 = 0;
    goto LABEL_31;
  }
  uint64_t v8 = [(id)v6 CDVStringByXMLUnquoting];

  uint64_t v9 = [a1 deserializeConference:v7];
  uint64_t v10 = [v9 conference];
  v11 = [a1 deserializeConference:v8];
  v12 = [v11 conference];
  if (v10 && ![v10 isWritable] || v12 && (objc_msgSend(v12, "isWritable") & 1) == 0)
  {
    id v16 = v8;
  }
  else
  {
    v13 = (void *)[v8 mutableCopy];
    long long v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [MEMORY[0x1E4F28E78] string];
    }
    id v16 = v15;

    if (v10 && v12)
    {
      if (([v10 isEqual:v12] & 1) == 0)
      {
        uint64_t v17 = [v9 range];
        uint64_t v19 = objc_msgSend((id)v7, "substringWithRange:", v17, v18);
        v20 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        v21 = [v19 stringByTrimmingCharactersInSet:v20];

        v22 = [v21 stringByAppendingString:@"\n"];

        uint64_t v23 = [v11 range];
        objc_msgSend(v16, "replaceCharactersInRange:withString:", v23, v24, v22);
LABEL_29:
      }
    }
    else
    {
      if (v10 && !v12)
      {
        v25 = [v9 blockTitle];
        v22 = [a1 _htmlSerializedConference:v10 serializationBlockTitle:v25];

        uint64_t v26 = [v16 rangeOfString:@"</body>" options:1];
        if (v26 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v27 = [v16 rangeOfString:@"<body>" options:1];
          if (v27 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v26 = [v16 length];
          }
          else {
            uint64_t v26 = v27 + v28;
          }
        }
        [v16 insertString:v22 atIndex:v26];
        goto LABEL_29;
      }
      if (!v12 || v10) {
        goto LABEL_30;
      }
      uint64_t v29 = [v11 range];
      uint64_t v31 = v30;
      NSUInteger v32 = objc_msgSend(v16, "rangeOfString:options:range:", @"<pre>", 5, 0, v29);
      NSUInteger range1 = v33;
      uint64_t v45 = v31;
      NSUInteger v34 = objc_msgSend(v16, "rangeOfString:options:range:", @"</pre>", 1, v29 + v31, objc_msgSend(v16, "length") - (v29 + v31));
      if (v32 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v36.location = v34;
        if (v34 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v36.length = v35;
          v47.location = v32;
          v47.length = range1;
          NSRange v37 = NSUnionRange(v47, v36);
          NSUInteger v38 = v37.location + [@"<pre>" length];
          v39 = [v16 substringWithRange:v38, v37.length - (objc_msgSend(@"<pre>", "length") + objc_msgSend(@"</pre>", "length"))];
          v40 = objc_msgSend(v39, "stringByReplacingCharactersInRange:withString:", v29 - v38, v45, &stru_1EE0C39E0);

          v41 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
          v43 = [v40 stringByTrimmingCharactersInSet:v41];

          if (![v43 length])
          {
            objc_msgSend(v16, "replaceCharactersInRange:withString:", v37.location, v37.length, &stru_1EE0C39E0);

            goto LABEL_30;
          }
        }
      }
      objc_msgSend(v16, "replaceCharactersInRange:withString:", v29, v45, &stru_1EE0C39E0);
    }
  }
LABEL_30:

LABEL_31:

  return v16;
}

@end