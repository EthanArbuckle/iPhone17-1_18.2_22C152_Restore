@interface NSData(NSURLExtras)
- (__CFString)_web_guessedMIMEType;
- (__CFString)_web_guessedMIMETypeForXML;
- (uint64_t)_web_guessedMIMETypeForExtension:()NSURLExtras;
- (void)_replaceCString:()NSURLExtras withCString:;
- (void)_web_parseRFC822HeaderFields;
@end

@implementation NSData(NSURLExtras)

- (__CFString)_web_guessedMIMETypeForXML
{
  uint64_t v2 = [a1 length];
  uint64_t v3 = [a1 bytes];
  uint64_t v4 = 1024;
  if (v2 < 1024) {
    uint64_t v4 = v2;
  }
  if (v4 >= 7)
  {
    v5 = (char *)v3;
    char v6 = 0;
    int64_t v7 = v4 - 6;
    v8 = @"application/rss+xml";
    while (1)
    {
      v9 = (const char *)memchr(v5, 60, v7);
      if (!v9) {
        return 0;
      }
      v10 = v9;
      if (v6) {
        break;
      }
      if (!strncasecmp_l(v9, "<rdf", 4uLL, 0)) {
        goto LABEL_15;
      }
      if (!strncasecmp_l(v10, "<rss", 4uLL, 0)) {
        return v8;
      }
      if (!strncasecmp_l(v10, "<feed", 5uLL, 0)) {
        return @"application/atom+xml";
      }
      if (strncasecmp_l(v10, "<?", 2uLL, 0) && strncasecmp_l(v10, "<!", 2uLL, 0)) {
        return 0;
      }
      char v6 = 0;
LABEL_16:
      v11 = &v5[v7];
      v5 = (char *)(v10 + 1);
      int64_t v7 = v11 - (v10 + 1);
      if (v7 <= 0) {
        return 0;
      }
    }
    if (!strncasecmp_l(v9, "<channel", 8uLL, 0)) {
      return v8;
    }
LABEL_15:
    char v6 = 1;
    goto LABEL_16;
  }
  return 0;
}

- (__CFString)_web_guessedMIMEType
{
  uint64_t v2 = (__CFString *)objc_msgSend(a1, "_web_guessedMIMETypeForXML");
  if ([(__CFString *)v2 length]) {
    return v2;
  }
  uint64_t v4 = [a1 length];
  uint64_t v5 = [a1 bytes];
  char v6 = (const char *)v5;
  if (v4 >= 1024) {
    uint64_t v7 = 1024;
  }
  else {
    uint64_t v7 = v4;
  }
  if (v7 >= 7)
  {
    uint64_t v2 = @"text/html";
    int64_t v8 = v7 - 6;
    v9 = (char *)v5;
    do
    {
      v10 = (const char *)memchr(v9, 60, v8);
      if (!v10) {
        break;
      }
      v11 = v10;
      if (!strncasecmp_l(v10, "<html>", 6uLL, 0)
        || !strncasecmp_l(v11, "<a ", 3uLL, 0)
        || !strncasecmp_l(v11, "<script", 7uLL, 0)
        || !strncasecmp_l(v11, "<title>", 7uLL, 0))
      {
        return v2;
      }
      v12 = &v9[v8];
      v9 = (char *)(v11 + 1);
      int64_t v8 = v12 - (v11 + 1);
    }
    while (v8 > 0);
  }
  int64_t v13 = v7 - 8;
  if (v13 >= 1)
  {
    v14 = (char *)v6;
    uint64_t v2 = @"text/html";
    do
    {
      unint64_t v15 = (unint64_t)memchr(v14, 116, v13);
      v16 = (const char *)memchr(v14, 84, v13);
      if (!(v15 | (unint64_t)v16)) {
        break;
      }
      if (v15 >= (unint64_t)v16) {
        v17 = v16;
      }
      else {
        v17 = (const char *)v15;
      }
      if (!v16) {
        v17 = (const char *)v15;
      }
      if (v15) {
        v18 = v17;
      }
      else {
        v18 = v16;
      }
      if (!strncasecmp_l(v18, "text/html", 9uLL, 0)) {
        return v2;
      }
      v19 = &v14[v13];
      v14 = (char *)(v18 + 1);
      int64_t v13 = v19 - (v18 + 1);
    }
    while (v13 > 0);
  }
  if (v4 >= 11)
  {
    if (!strncmp(v6, "BEGIN:VCARD", 0xBuLL)) {
      return @"text/vcard";
    }
    if ((unint64_t)v4 >= 0xF && !strncmp(v6, "BEGIN:VCALENDAR", 0xFuLL)) {
      return @"text/calendar";
    }
    goto LABEL_33;
  }
  if (v4 >= 1)
  {
LABEL_33:
    uint64_t v20 = 0;
    uint64_t v2 = @"text/plain";
    while (1)
    {
      if ((v6[v20] - 127) <= 0xA0u)
      {
        unsigned int v21 = v6[v20];
        BOOL v22 = v21 > 0xD;
        int v23 = (1 << v21) & 0x2600;
        if (v22 || v23 == 0) {
          break;
        }
      }
      if (v4 == ++v20) {
        return v2;
      }
    }
    goto LABEL_43;
  }
  uint64_t v20 = 0;
LABEL_43:
  if (v20 == v4) {
    return @"text/plain";
  }
  if (v4 >= 4 && !strncmp(v6, "\xFF\xD8\xFF\xE0mage/jpeg", 4uLL)) {
    return &stru_1ECA60128;
  }
  return 0;
}

- (uint64_t)_web_guessedMIMETypeForExtension:()NSURLExtras
{
  uint64_t v4 = objc_msgSend(a1, "_web_guessedMIMEType");
  uint64_t v5 = v4;
  if (v4 && ![v4 isEqualToString:@"text/plain"] || !objc_msgSend(a3, "length")) {
    return (uint64_t)v5;
  }
  id v6 = +[NSURLFileTypeMappings sharedMappings];

  return [v6 MIMETypeForExtension:a3];
}

- (void)_web_parseRFC822HeaderFields
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = [a1 bytes];
  uint64_t v4 = [a1 length];
  if (v4 >= 1)
  {
    uint64_t v5 = v4;
    id v6 = 0;
LABEL_3:
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    while (1)
    {
      int v9 = *(unsigned __int8 *)(v3 + v8);
      if (v9 == 10) {
        break;
      }
      if (v9 == 13)
      {
        if (v5 - 1 == v8) {
          return v2;
        }
        v10 = (unsigned __int8 *)(v3 + v8);
        v11 = (unsigned char *)(v3 + v8 + 1);
        if (*v11 == 10) {
          v11 = (unsigned char *)(v3 + v8 + 2);
        }
        if (!v8) {
          return v2;
        }
LABEL_14:
        int v12 = *(unsigned __int8 *)v3;
        v43 = v11;
        if (v12 == 9 || v12 == 32)
        {
          if (v6)
          {
            uint64_t v13 = [v2 objectForKey:v6];
            v14 = (void *)[objc_allocWithZone((Class)NSString) initWithBytes:v3 length:v7 >> 32 encoding:CFStringConvertEncodingToNSStringEncoding(0x201u)];
            unint64_t v15 = [[NSString alloc] initWithFormat:@"%@%@", v13, v14];
            [v2 setObject:v15 forKey:v6];
          }
          goto LABEL_58;
        }
        uint64_t v16 = 0;
        do
        {
          uint64_t v17 = v16;
          v18 = (unsigned __int8 *)(v3 + v16++);
        }
        while (v18 != v10 && *v18 != 58);
        v19 = (unsigned __int8 *)(v3 + v16);
        if ((unsigned __int8 *)(v3 + v16 - 1) != v10)
        {
          uint64_t v20 = (__CFString *)[objc_allocWithZone((Class)NSString) initWithBytes:v3 length:v16 - 1 encoding:CFStringConvertEncodingToNSStringEncoding(0x201u)];
          unsigned int v21 = v20;
          theString = v20;
          uint64_t numChars = CFStringGetLength(v20);
          if (numChars < 1) {
            goto LABEL_44;
          }
          CFIndex v22 = 0;
          v44 = 0;
          chars = 0;
          int v23 = 0;
          int v24 = 0;
          v41 = v2;
          CFIndex v42 = numChars + 1;
          BOOL v25 = 1;
          while (1)
          {
            unsigned int CharacterAtIndex = CFStringGetCharacterAtIndex(theString, v22);
            UniChar v27 = CharacterAtIndex;
            if (v25 && CharacterAtIndex >= 0x61 && CharacterAtIndex <= 0x7A)
            {
              UniChar v27 = CharacterAtIndex - 32;
              if (v23) {
                goto LABEL_28;
              }
            }
            else
            {
              if (v25 || CharacterAtIndex < 0x41 || CharacterAtIndex > 0x5A) {
                goto LABEL_40;
              }
              UniChar v27 = CharacterAtIndex + 32;
              if (v23)
              {
LABEL_28:
                if (v24) {
                  goto LABEL_38;
                }
                v28 = v44;
                goto LABEL_36;
              }
            }
            v48.location = 0;
            v48.length = numChars;
            if (CFStringGetBytes(theString, v48, 0x201u, 0, 0, 0, 0, 0) != numChars)
            {
              v29 = (UniChar *)MEMORY[0x1853044A0](0, 2 * numChars, 0x1000040BDFB0063, 0);
              v49.location = 0;
              v49.length = numChars;
              chars = v29;
              CFStringGetCharacters(theString, v49, v29);
LABEL_38:
              chars[v22] = v27;
              int v24 = 1;
              goto LABEL_39;
            }
            v28 = (char *)MEMORY[0x1853044A0](0, v42, 1714459658, 0);
            CFStringGetCString(theString, v28, v42, 0x201u);
LABEL_36:
            int v24 = 0;
            v44 = v28;
            v28[v22] = v27;
LABEL_39:
            int v23 = 1;
LABEL_40:
            BOOL v25 = v27 == 45;
            if (numChars == ++v22)
            {
              uint64_t v2 = v41;
              if (v23)
              {
                if (v24) {
                  v30 = (NSString *)CFStringCreateWithCharacters(0, chars, numChars);
                }
                else {
                  v30 = [[NSString alloc] initWithCString:v44 encoding:CFStringConvertEncodingToNSStringEncoding(0x201u)];
                }
LABEL_46:
                id v6 = v30;
                if (v19 == v10)
                {
LABEL_54:
                  v34 = [[NSString alloc] initWithString:&stru_1ECA5C228];
                }
                else
                {
                  v31 = &v10[~v3 - v17];
                  while (1)
                  {
                    int v32 = *v19;
                    if (v32 != 32 && v32 != 9) {
                      break;
                    }
                    ++v19;
                    --v31;
                    if (v19 == v10) {
                      goto LABEL_54;
                    }
                  }
                  v34 = (NSString *)[objc_allocWithZone((Class)NSString) initWithBytes:v19 length:v31 encoding:CFStringConvertEncodingToNSStringEncoding(0x201u)];
                }
                v35 = v34;
                v36 = v34;
                uint64_t v37 = [v2 objectForKey:v6];
                if (v37)
                {
                  v35 = [[NSString alloc] initWithFormat:@"%@, %@", v37, v35];
                  v38 = v35;
                }
                [v2 setObject:v35 forKey:v6];
                break;
              }
LABEL_44:
              v30 = theString;
              goto LABEL_46;
            }
          }
        }
LABEL_58:
        uint64_t v39 = v5 + v3;
        uint64_t v3 = (uint64_t)v43;
        uint64_t v5 = v39 - (void)v43;
        if (v39 - (uint64_t)v43 <= 0) {
          return v2;
        }
        goto LABEL_3;
      }
      ++v8;
      v7 += 0x100000000;
      if (v5 == v8) {
        return v2;
      }
    }
    v10 = (unsigned __int8 *)(v3 + v8);
    v11 = (unsigned char *)(v3 + v8 + 1);
    if (v8) {
      goto LABEL_14;
    }
  }
  return v2;
}

- (void)_replaceCString:()NSURLExtras withCString:
{
  size_t v7 = strlen(__s);
  size_t v18 = strlen(a4);
  uint64_t v8 = (char *)[a1 bytes];
  int64_t v9 = [a1 length];
  char v10 = *__s;
  v11 = memchr(v8, *__s, v9);
  if (v11)
  {
    uint64_t v17 = a1;
    int64_t v12 = 0;
    uint64_t v13 = 0;
    do
    {
      int64_t v14 = v11 - v8;
      int64_t v15 = v11 - v8 + v7;
      if (v15 > v9) {
        break;
      }
      if (!memcmp(v11, __s, v7))
      {
        if (!v13) {
          uint64_t v13 = (void *)[MEMORY[0x1E4F1CA58] data];
        }
        objc_msgSend(v13, "appendBytes:length:", &v8[v12], v14 - v12, v17);
        [v13 appendBytes:a4 length:v18];
        char v10 = *__s;
        int64_t v12 = v15;
      }
      else
      {
        int64_t v15 = v14 + 1;
      }
      v11 = memchr(&v8[v15], v10, v9 - v15);
    }
    while (v11);
    a1 = v17;
    if (v13)
    {
      if (v9 > v12) {
        [v13 appendBytes:&v8[v12] length:v9 - v12];
      }
      return v13;
    }
  }
  return a1;
}

@end