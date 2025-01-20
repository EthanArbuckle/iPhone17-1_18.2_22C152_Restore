@interface NSString(CoreDAVExtensions)
+ (__CFString)CDVStringWithNumberOfSpaces:()CoreDAVExtensions;
+ (id)CDVPreconditionHeaderValueWithCTag:()CoreDAVExtensions pathTag:;
+ (id)CDVStringWithNameSpace:()CoreDAVExtensions andName:;
+ (uint64_t)CDVPreconditionHeaderValueWithCTag:()CoreDAVExtensions;
- (BOOL)CDVIsHTTPStatusLineWithStatusCode:()CoreDAVExtensions;
- (__CFString)CDVStringByXMLQuoting;
- (__CFString)CDVStringByXMLUnquoting;
- (id)CDVStringByAppendingSlashIfNeeded;
- (id)CDVStringByRemovingTerminatingSlashIfNeeded;
- (uint64_t)CDVStringByAddingPercentEscapesForHREF;
- (uint64_t)CDVStringByAddingPercentEscapesForHREFIncludingPercent;
- (uint64_t)CDVStringByAddingPercentEscapesForUserOrPassword;
- (uint64_t)initWithCDVNameSpace:()CoreDAVExtensions andName:;
@end

@implementation NSString(CoreDAVExtensions)

- (uint64_t)initWithCDVNameSpace:()CoreDAVExtensions andName:
{
  v4 = &stru_26C4B7900;
  if (a3) {
    v5 = a3;
  }
  else {
    v5 = &stru_26C4B7900;
  }
  if (a4) {
    v4 = a4;
  }
  return [a1 initWithFormat:@"%@:%@", v5, v4];
}

+ (id)CDVStringWithNameSpace:()CoreDAVExtensions andName:
{
  v5 = (objc_class *)NSString;
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithCDVNameSpace:v7 andName:v6];

  return v8;
}

- (uint64_t)CDVStringByAddingPercentEscapesForHREF
{
  if (CDVStringByAddingPercentEscapesForHREF_onceToken != -1) {
    dispatch_once(&CDVStringByAddingPercentEscapesForHREF_onceToken, &__block_literal_global_1);
  }
  uint64_t v2 = CDVStringByAddingPercentEscapesForHREF_allowedCharacterSet;
  return [a1 stringByAddingPercentEncodingWithAllowedCharacters:v2];
}

- (uint64_t)CDVStringByAddingPercentEscapesForHREFIncludingPercent
{
  if (CDVStringByAddingPercentEscapesForHREFIncludingPercent_onceToken != -1) {
    dispatch_once(&CDVStringByAddingPercentEscapesForHREFIncludingPercent_onceToken, &__block_literal_global_23);
  }
  uint64_t v2 = CDVStringByAddingPercentEscapesForHREFIncludingPercent_allowedCharacterSet;
  return [a1 stringByAddingPercentEncodingWithAllowedCharacters:v2];
}

- (id)CDVStringByAppendingSlashIfNeeded
{
  if ([a1 hasSuffix:@"/"])
  {
    id v2 = a1;
  }
  else
  {
    id v2 = [a1 stringByAppendingString:@"/"];
  }
  return v2;
}

- (id)CDVStringByRemovingTerminatingSlashIfNeeded
{
  if ([a1 hasSuffix:@"/"])
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - 1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v2 = a1;
  }
  return v2;
}

+ (__CFString)CDVStringWithNumberOfSpaces:()CoreDAVExtensions
{
  if (a3 < 0xD)
  {
    if (a3 - 1 > 0xB) {
      id v6 = &stru_26C4B7900;
    }
    else {
      id v6 = off_2641E00A0[a3 - 1];
    }
  }
  else
  {
    v4 = malloc_type_malloc(a3 + 1, 0x100004077774924uLL);
    if (v4)
    {
      v5 = v4;
      memset(v4, 32, a3);
      v5[a3] = 0;
      id v6 = [NSString stringWithCString:v5 encoding:1];
      free(v5);
    }
    else
    {
      id v6 = 0;
    }
  }
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = &stru_26C4B7900;
  }
  v8 = v7;

  return v8;
}

- (BOOL)CDVIsHTTPStatusLineWithStatusCode:()CoreDAVExtensions
{
  uint64_t v4 = CDVHTTPStatusCodeFromStatusLine(a1);
  return v4 && v4 == a3;
}

- (uint64_t)CDVStringByAddingPercentEscapesForUserOrPassword
{
  if (CDVStringByAddingPercentEscapesForUserOrPassword_onceToken != -1) {
    dispatch_once(&CDVStringByAddingPercentEscapesForUserOrPassword_onceToken, &__block_literal_global_64);
  }
  uint64_t v2 = CDVStringByAddingPercentEscapesForUserOrPassword_allowedCharacterSet;
  return [a1 stringByAddingPercentEncodingWithAllowedCharacters:v2];
}

- (__CFString)CDVStringByXMLQuoting
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  uint64_t v4 = CFCharacterSetCreateMutable(v2);
  CFIndex Length = CFStringGetLength(a1);
  CFCharacterSetAddCharactersInString(v4, @"&<>'\"");
  CFStringRef theString = a1;
  uint64_t v27 = 0;
  CFIndex v28 = Length;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  v25 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  }
  memset(v23, 0, sizeof(v23));
  int64_t v29 = 0;
  int64_t v30 = 0;
  v26 = CStringPtr;
  if (Length >= 1)
  {
    int64_t v8 = 0;
    CFIndex v9 = 0;
    while (1)
    {
      CFIndex v10 = v28;
      if (v28 <= v8)
      {
        UniChar v13 = 0;
      }
      else
      {
        v11 = v25;
        if (v25)
        {
          int64_t v12 = v27 + v8;
LABEL_8:
          UniChar v13 = v11[v12];
          goto LABEL_10;
        }
        if (!v26)
        {
          int64_t v17 = v29;
          if (v30 <= v8 || v29 > v8)
          {
            int64_t v19 = v8 - 4;
            if ((unint64_t)v8 < 4) {
              int64_t v19 = 0;
            }
            if (v19 + 64 < v28) {
              CFIndex v10 = v19 + 64;
            }
            int64_t v29 = v19;
            int64_t v30 = v10;
            v32.location = v27 + v19;
            v32.length = v10 - v19;
            CFStringGetCharacters(theString, v32, (UniChar *)v23);
            int64_t v17 = v29;
          }
          int64_t v12 = v8 - v17;
          v11 = (const UniChar *)v23;
          goto LABEL_8;
        }
        UniChar v13 = v26[v27 + v8];
      }
LABEL_10:
      int v14 = v13;
      if (CFCharacterSetIsCharacterMember(v4, v13))
      {
        v33.length = v8 - v9;
        v33.location = v9;
        CFStringRef v15 = CFStringCreateWithSubstring(v2, a1, v33);
        CFStringAppend(Mutable, v15);
        CFRelease(v15);
        if (v14 <= 38)
        {
          if (v14 == 34)
          {
            CFStringRef v16 = @"&quot;";
          }
          else
          {
            CFStringRef v16 = @"&amp;";
            if (v14 != 38) {
              goto LABEL_26;
            }
          }
        }
        else
        {
          switch(v14)
          {
            case '\'':
              CFStringRef v16 = @"&apos;";
              break;
            case '>':
              CFStringRef v16 = @"&gt;";
              break;
            case '<':
              CFStringRef v16 = @"&lt;";
              break;
            default:
LABEL_26:
              CFIndex v9 = ++v8;
              goto LABEL_27;
          }
        }
        CFStringAppend(Mutable, v16);
        goto LABEL_26;
      }
      ++v8;
LABEL_27:
      if (v8 == Length) {
        goto LABEL_40;
      }
    }
  }
  CFIndex v9 = 0;
  CFIndex Length = 0;
LABEL_40:
  v34.length = Length - v9;
  v34.location = v9;
  CFStringRef v20 = CFStringCreateWithSubstring(v2, a1, v34);
  if (v20)
  {
    CFStringRef v21 = v20;
    CFStringAppend(Mutable, v20);
    CFRelease(v21);
  }
  CFRelease(v4);
  return Mutable;
}

- (__CFString)CDVStringByXMLUnquoting
{
  CFStringRef v1 = a1;
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v76 = 0u;
  CFIndex Length = CFStringGetLength(a1);
  Mutable = CFDictionaryCreateMutable(v2, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, @"amp", @"&");
  CFDictionaryAddValue(Mutable, @"quot", @"\"");
  CFDictionaryAddValue(Mutable, @"lt", @"<");
  CFDictionaryAddValue(Mutable, @"gt", @">");
  CFDictionaryRef theDict = Mutable;
  CFDictionaryAddValue(Mutable, @"apos", @"'");
  CFStringRef v83 = v1;
  uint64_t v86 = 0;
  CFIndex v87 = Length - 1;
  CharactersPtr = CFStringGetCharactersPtr(v1);
  CStringPtr = 0;
  v84 = (UniChar *)CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
  }
  v85 = CStringPtr;
  CFIndex v88 = 0;
  CFIndex v89 = 0;
  CFMutableStringRef v7 = CFStringCreateMutable(v2, 0);
  int64_t v8 = v7;
  if (Length >= 1)
  {
    CFIndex v9 = 0;
    CFIndex v10 = 0;
    v72 = v7;
    CFAllocatorRef v70 = v2;
    CFStringRef v71 = v1;
    while (1)
    {
      if (v10 < 0 || (CFIndex v11 = v87, v87 <= v10))
      {
        int64_t v15 = v10 + 1;
        goto LABEL_11;
      }
      int64_t v12 = v84;
      if (v84)
      {
        CFIndex v13 = v86 + v10;
      }
      else
      {
        if (v85)
        {
          UniChar v14 = v85[v86 + v10];
          goto LABEL_15;
        }
        if (v89 <= v10 || (CFIndex v22 = v88, v88 > v10))
        {
          CFIndex v23 = v10 - 4;
          if ((unint64_t)v10 < 4) {
            CFIndex v23 = 0;
          }
          if (v23 + 64 < v87) {
            CFIndex v11 = v23 + 64;
          }
          CFIndex v88 = v23;
          CFIndex v89 = v11;
          v91.location = v86 + v23;
          v91.length = v11 - v23;
          CFStringGetCharacters(v83, v91, buffer);
          CFIndex v22 = v88;
        }
        CFIndex v13 = v10 - v22;
        int64_t v12 = buffer;
      }
      UniChar v14 = v12[v13];
LABEL_15:
      CFIndex v16 = v10 + 1;
      if (v14 == 38)
      {
        if (v10 > v9)
        {
          v97.location = v9;
          v97.length = v10 - v9;
          CFStringRef v17 = CFStringCreateWithSubstring(v2, v1, v97);
          CFStringAppend(v8, v17);
          CFRelease(v17);
        }
        CFIndex v18 = v87;
        if (v87 <= v16)
        {
          UniChar v21 = 0;
          int64_t v15 = v10 + 2;
        }
        else
        {
          int64_t v19 = v84;
          if (v84)
          {
            CFIndex v20 = v86 + v16;
            goto LABEL_21;
          }
          if (v85)
          {
            UniChar v21 = v85[v86 + v16];
          }
          else
          {
            if (v89 <= v16 || (CFIndex v39 = v88, v88 > v16))
            {
              CFIndex v40 = v10 - 3;
              if ((unint64_t)v10 < 3) {
                CFIndex v40 = 0;
              }
              if (v40 + 64 < v87) {
                CFIndex v18 = v40 + 64;
              }
              CFIndex v88 = v40;
              CFIndex v89 = v18;
              v93.location = v86 + v40;
              v93.length = v18 - v40;
              CFStringGetCharacters(v83, v93, buffer);
              CFIndex v39 = v88;
            }
            CFIndex v20 = v16 - v39;
            int64_t v19 = buffer;
LABEL_21:
            UniChar v21 = v19[v20];
          }
          int64_t v15 = v10 + 2;
          if (v21 == 35)
          {
            CFIndex v24 = v87;
            if (v87 <= v15)
            {
              char v38 = 0;
              UniChar v21 = 0;
              int64_t v15 = v10 + 3;
            }
            else
            {
              v25 = v84;
              if (v84)
              {
                int64_t v26 = v86 + v15;
                goto LABEL_38;
              }
              if (v85)
              {
                UniChar v21 = v85[v86 + v15];
              }
              else
              {
                if (v89 <= v15 || (CFIndex v64 = v88, v88 > v15))
                {
                  CFIndex v65 = v10 - 2;
                  if ((unint64_t)v10 < 2) {
                    CFIndex v65 = 0;
                  }
                  if (v65 + 64 < v87) {
                    CFIndex v24 = v65 + 64;
                  }
                  CFIndex v88 = v65;
                  CFIndex v89 = v24;
                  v95.location = v86 + v65;
                  v95.length = v24 - v65;
                  CFStringGetCharacters(v83, v95, buffer);
                  CFIndex v64 = v88;
                }
                int64_t v26 = v15 - v64;
                v25 = buffer;
LABEL_38:
                UniChar v21 = v25[v26];
              }
              int64_t v15 = v10 + 3;
              if (v21 == 120)
              {
                CFIndex v41 = v87;
                if (v87 <= v15)
                {
                  UniChar v21 = 0;
                }
                else
                {
                  v42 = v84;
                  if (v84)
                  {
                    int64_t v43 = v86 + v15;
                    goto LABEL_80;
                  }
                  if (v85)
                  {
                    UniChar v21 = v85[v86 + v15];
                  }
                  else
                  {
                    if (v89 <= v15 || (CFIndex v66 = v88, v88 > v15))
                    {
                      CFIndex v67 = v10 - 1;
                      if (!v10) {
                        CFIndex v67 = 0;
                      }
                      if (v67 + 64 < v87) {
                        CFIndex v41 = v67 + 64;
                      }
                      CFIndex v88 = v67;
                      CFIndex v89 = v41;
                      v96.location = v86 + v67;
                      v96.length = v41 - v67;
                      CFStringGetCharacters(v83, v96, buffer);
                      CFIndex v66 = v88;
                    }
                    int64_t v43 = v15 - v66;
                    v42 = buffer;
LABEL_80:
                    UniChar v21 = v42[v43];
                  }
                }
                int64_t v15 = v10 + 4;
                int v44 = 16;
                char v38 = 1;
LABEL_85:
                unsigned int v27 = 0;
                if (Length <= v15) {
                  int64_t v45 = v15;
                }
                else {
                  int64_t v45 = Length;
                }
                int64_t v46 = -v15;
                for (int64_t i = v15 + 64; ; ++i)
                {
                  if ((unint64_t)v15 >= 4) {
                    uint64_t v48 = 4;
                  }
                  else {
                    uint64_t v48 = v15;
                  }
                  if ((unsigned __int16)(v21 - 48) > 9u)
                  {
                    char v50 = v38 ^ 1;
                    if ((unsigned __int16)(v21 - 97) > 5u) {
                      char v51 = 1;
                    }
                    else {
                      char v51 = v38 ^ 1;
                    }
                    if (v51)
                    {
                      if ((unsigned __int16)(v21 - 65) > 5u) {
                        char v50 = 1;
                      }
                      if (v50)
                      {
                        CFAllocatorRef v2 = v70;
                        CFStringRef v1 = v71;
                        CFIndex v16 = v10 + 1;
                        int64_t v8 = v72;
                        goto LABEL_40;
                      }
                      int v49 = 16 * v27 - 55;
                    }
                    else
                    {
                      int v49 = 16 * v27 - 87;
                    }
                  }
                  else
                  {
                    int v49 = v27 * v44 - 48;
                  }
                  unsigned int v27 = v49 + v21;
                  if (v45 == v15)
                  {
                    int64_t v15 = v45;
                    CFAllocatorRef v2 = v70;
                    CFStringRef v1 = v71;
                    CFIndex v16 = v10 + 1;
                    int64_t v8 = v72;
                    goto LABEL_121;
                  }
                  if (v15 < 0 || (CFIndex v52 = v87, v87 <= v15))
                  {
                    UniChar v21 = 0;
                  }
                  else if (v84)
                  {
                    UniChar v21 = v84[v15 + v86];
                  }
                  else if (v85)
                  {
                    UniChar v21 = v85[v86 + v15];
                  }
                  else
                  {
                    if (v89 <= v15 || (CFIndex v53 = v88, v88 > v15))
                    {
                      uint64_t v54 = v48 + v46;
                      CFIndex v55 = i - v48;
                      int64_t v56 = v15 - v48;
                      int64_t v57 = v56 + 64;
                      if (v56 + 64 >= v87) {
                        int64_t v57 = v87;
                      }
                      CFIndex v88 = v56;
                      CFIndex v89 = v57;
                      if (v87 >= v55) {
                        CFIndex v52 = v55;
                      }
                      v94.length = v52 + v54;
                      v94.location = v56 + v86;
                      CFStringGetCharacters(v83, v94, buffer);
                      CFIndex v53 = v88;
                    }
                    UniChar v21 = buffer[v15 - v53];
                  }
                  ++v15;
                  --v46;
                }
              }
              char v38 = 0;
            }
            int v44 = 10;
            goto LABEL_85;
          }
        }
        unsigned int v27 = 0xFFFF;
LABEL_40:
        if (v21 != 59 && v15 < Length)
        {
          int64_t v28 = -v15;
          int64_t v29 = v15 + 64;
          do
          {
            if ((unint64_t)v15 >= 4) {
              uint64_t v30 = 4;
            }
            else {
              uint64_t v30 = v15;
            }
            if (v15 < 0 || (CFIndex v31 = v87, v87 <= v15))
            {
              UniChar v32 = 0;
            }
            else if (v84)
            {
              UniChar v32 = v84[v15 + v86];
            }
            else if (v85)
            {
              UniChar v32 = v85[v86 + v15];
            }
            else
            {
              if (v89 <= v15 || (CFIndex v33 = v88, v88 > v15))
              {
                uint64_t v34 = v30 + v28;
                CFIndex v35 = v29 - v30;
                int64_t v36 = v15 - v30;
                int64_t v37 = v36 + 64;
                if (v36 + 64 >= v87) {
                  int64_t v37 = v87;
                }
                CFIndex v88 = v36;
                CFIndex v89 = v37;
                if (v87 >= v35) {
                  CFIndex v31 = v35;
                }
                v92.length = v31 + v34;
                v92.location = v36 + v86;
                CFStringGetCharacters(v83, v92, buffer);
                CFIndex v33 = v88;
              }
              UniChar v32 = buffer[v15 - v33];
            }
            ++v15;
            if (v32 == 59) {
              break;
            }
            --v28;
            ++v29;
          }
          while (v15 < Length);
          int64_t v8 = v72;
        }
LABEL_121:
        if (v27 == 0xFFFF)
        {
          v98.length = v15 - v10 - 2;
          v98.location = v16;
          CFStringRef v58 = CFStringCreateWithSubstring(v2, v1, v98);
          CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, v58);
          if (Value)
          {
            CFStringRef v60 = Value;
            v61 = v8;
          }
          else
          {
            CFRelease(v58);
            v99.location = v10;
            v99.length = v15 - v10;
            CFStringRef v58 = CFStringCreateWithSubstring(v2, v1, v99);
            v61 = v8;
            CFStringRef v60 = v58;
          }
          CFStringAppend(v61, v60);
          CFRelease(v58);
        }
        else
        {
          if (v27 < 0x10000)
          {
            chars[0] = v27;
            v62 = v8;
            CFIndex v63 = 1;
          }
          else
          {
            chars[0] = ((v27 + 67043328) >> 10) - 10240;
            chars[1] = v27 & 0x3FF | 0xDC00;
            v62 = v8;
            CFIndex v63 = 2;
          }
          CFStringAppendCharacters(v62, chars, v63);
        }
        CFIndex v9 = v15;
        goto LABEL_11;
      }
      int64_t v15 = v10 + 1;
LABEL_11:
      CFIndex v10 = v15;
      if (v15 >= Length) {
        goto LABEL_151;
      }
    }
  }
  int64_t v15 = 0;
  CFIndex v9 = 0;
LABEL_151:
  if (v9 < Length)
  {
    v100.length = v15 - v9;
    v100.location = v9;
    CFStringRef v68 = CFStringCreateWithSubstring(v2, v1, v100);
    CFStringAppend(v8, v68);
    CFRelease(v68);
  }
  CFRelease(theDict);
  return v8;
}

+ (id)CDVPreconditionHeaderValueWithCTag:()CoreDAVExtensions pathTag:
{
  id v5 = a4;
  id v6 = [a3 CDVStringByAddingPercentEscapesForHREF];
  if (v5) {
    [NSString stringWithFormat:@"<%@> (<%@ctag/%@>)", v5, @"http://calendarserver.org/ns/", v6];
  }
  else {
  CFMutableStringRef v7 = [NSString stringWithFormat:@"(<%@ctag/%@>)", @"http://calendarserver.org/ns/", v6, v9];
  }

  return v7;
}

+ (uint64_t)CDVPreconditionHeaderValueWithCTag:()CoreDAVExtensions
{
  return [NSString CDVPreconditionHeaderValueWithCTag:a3 pathTag:0];
}

@end