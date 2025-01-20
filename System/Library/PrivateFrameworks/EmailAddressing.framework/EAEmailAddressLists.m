@interface EAEmailAddressLists
+ (id)addressDisplayStringWithMaxNumberOfAddresses:(unint64_t)a3 fromAddressList:(id)a4;
+ (id)addressListFromAddressString:(id)a3;
+ (id)addressListFromHeaderValue:(id)a3;
+ (id)addressStringFromAddressList:(id)a3;
+ (id)componentsSeparatedByCharactersRespectingQuotesAndParens:(id)a3 forString:(id)a4;
+ (id)componentsSeparatedByCommaRespectingQuotesAndParensForString:(id)a3;
+ (id)displayNameFromAddressList:(id)a3;
+ (id)rawAddressListFromFullAddressList:(id)a3;
@end

@implementation EAEmailAddressLists

+ (id)addressListFromHeaderValue:(id)a3
{
  uint64_t v113 = *MEMORY[0x263EF8340];
  theString = (__CFString *)a3;
  unint64_t v3 = [(__CFString *)theString length];
  if ((uint64_t)v3 >= 1)
  {
    id v86 = [MEMORY[0x263EFF980] array];
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v98 = 0u;
    CFStringRef v105 = theString;
    uint64_t v108 = 0;
    int64_t v109 = v3;
    CharactersPtr = CFStringGetCharactersPtr(theString);
    if (CharactersPtr) {
      CStringPtr = 0;
    }
    else {
      CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
    }
    unint64_t v6 = 0;
    int v90 = 0;
    uint64_t v91 = 0;
    UniChar v92 = 0;
    uint64_t v7 = 0;
    uint64_t v110 = 0;
    uint64_t v111 = 0;
    v107 = CStringPtr;
    v85 = &buffer[1];
    while (1)
    {
      UniChar v8 = v92;
      int64_t v9 = v109;
      if (v109 <= v7)
      {
        UniChar v12 = 0;
      }
      else
      {
        v10 = (UniChar *)CharactersPtr;
        if (CharactersPtr)
        {
          uint64_t v11 = v108 + v7;
LABEL_13:
          UniChar v12 = v10[v11];
          goto LABEL_15;
        }
        if (!v107)
        {
          uint64_t v49 = v110;
          if (v111 <= v7 || v110 > v7)
          {
            uint64_t v51 = v7 - 4;
            if ((unint64_t)v7 < 4) {
              uint64_t v51 = 0;
            }
            if (v51 + 64 < v109) {
              int64_t v9 = v51 + 64;
            }
            uint64_t v110 = v51;
            uint64_t v111 = v9;
            v116.location = v108 + v51;
            v116.length = v9 - v51;
            CFStringGetCharacters(v105, v116, buffer);
            uint64_t v49 = v110;
          }
          uint64_t v11 = v7 - v49;
          v10 = buffer;
          goto LABEL_13;
        }
        UniChar v12 = v107[v108 + v7];
      }
LABEL_15:
      int v13 = v12;
      UniChar v92 = v12;
      if (((1 << v12) & 0x100000600) != 0) {
        unint64_t v14 = v6 + 1;
      }
      else {
        unint64_t v14 = v6;
      }
      if (v13 > 0x20) {
        unint64_t v14 = v6;
      }
      if (v7 == v6) {
        unint64_t v6 = v14;
      }
      if (v13 <= 40)
      {
        uint64_t v20 = v91;
        int v21 = v90;
        int v22 = v90 ^ (v91 == 0);
        uint64_t v23 = v91 + ((v90 & 1) == 0);
        if (v13 != 40) {
          uint64_t v23 = v91;
        }
        BOOL v24 = v13 == 34;
        char v19 = 0;
        if (!v24) {
          uint64_t v20 = v23;
        }
        uint64_t v91 = v20;
        if (v24) {
          int v21 = v22;
        }
        int v90 = v21;
      }
      else
      {
        switch(v13)
        {
          case ')':
            char v19 = 0;
            uint64_t v25 = v91 - 1;
            if (!v91) {
              uint64_t v25 = 0;
            }
            uint64_t v91 = v25;
            break;
          case ',':
            uint64_t v26 = v91;
            char v19 = (v90 | (v91 != 0)) ^ 1;
            if (!(v90 & 1 | (v91 != 0))) {
              uint64_t v26 = 0;
            }
            uint64_t v91 = v26;
            break;
          case '\\':
            uint64_t v15 = v91;
            int v16 = v90;
            if (v7 + 1 >= v3) {
              uint64_t v17 = v7;
            }
            else {
              uint64_t v17 = v7 + 1;
            }
            BOOL v18 = (v90 & 1 | (v91 != 0)) == 0;
            if (v90 & 1 | (v91 != 0)) {
              uint64_t v7 = v17;
            }
            char v19 = 0;
            if (!(v90 & 1 | (v91 != 0))) {
              uint64_t v15 = 0;
            }
            uint64_t v91 = v15;
            if (v18) {
              int v16 = 0;
            }
            int v90 = v16;
            break;
          default:
            char v19 = 0;
            break;
        }
      }
      unint64_t v27 = v7 + 1;
      if ((v19 & 1) != 0 || v27 == v3)
      {
        unint64_t v28 = v3;
        if (v19)
        {
          unint64_t v28 = v7;
          if (v8 != 62)
          {
            unint64_t v29 = v7 + 1;
            if (v27 < v3)
            {
              unint64_t v29 = v7 + 1;
              if (v7 >= -1)
              {
                uint64_t v30 = ~v7;
                uint64_t v31 = v7 + 65;
                unint64_t v29 = v7 + 1;
                uint64_t v32 = v7;
                while (1)
                {
                  int64_t v33 = v32 + 1;
                  uint64_t v34 = v29 >= 4 ? 4 : v29;
                  int64_t v35 = v109;
                  if (v109 <= v33) {
                    break;
                  }
                  if (CharactersPtr)
                  {
                    UniChar v36 = CharactersPtr[v32 + 1 + v108];
                  }
                  else if (v107)
                  {
                    UniChar v36 = v107[v108 + 1 + v32];
                  }
                  else
                  {
                    uint64_t v37 = v110;
                    BOOL v38 = v111 > v33 && v110 <= v33;
                    if (!v38)
                    {
                      uint64_t v39 = -v34;
                      uint64_t v40 = v34 + v30;
                      int64_t v41 = v31 - v34;
                      uint64_t v42 = v32 + v39;
                      uint64_t v43 = v42 + 1;
                      int64_t v44 = v42 + 65;
                      if (v44 >= v109) {
                        int64_t v44 = v109;
                      }
                      uint64_t v110 = v43;
                      uint64_t v111 = v44;
                      if (v109 >= v41) {
                        int64_t v35 = v41;
                      }
                      v115.length = v35 + v40;
                      v115.location = v43 + v108;
                      CFStringGetCharacters(v105, v115, buffer);
                      uint64_t v37 = v110;
                    }
                    UniChar v36 = v85[v32 - v37];
                  }
                  BOOL v38 = v36 > 0x20u;
                  uint64_t v45 = (1 << v36) & 0x100000600;
                  if (v38 || v45 == 0)
                  {
                    unint64_t v29 = v32 + 1;
                    break;
                  }
                  ++v29;
                  uint64_t v47 = v32 + 1;
                  unint64_t v48 = v32 + 2;
                  --v30;
                  ++v31;
                  ++v32;
                  if (v48 >= v3)
                  {
                    unint64_t v29 = v47 + 1;
                    break;
                  }
                }
                unint64_t v27 = v7 + 1;
              }
            }
            if (addressListFromHeaderValue__onceToken != -1) {
              dispatch_once(&addressListFromHeaderValue__onceToken, &__block_literal_global_0);
            }
            if (v3 - v29 >= 6) {
              uint64_t v52 = 6;
            }
            else {
              uint64_t v52 = v3 - v29;
            }
            v53 = -[__CFString substringWithRange:](theString, "substringWithRange:", v29, v52, v85);
            v54 = [v53 lowercaseString];

            unint64_t v88 = v27;
            long long v95 = 0u;
            long long v96 = 0u;
            long long v93 = 0u;
            long long v94 = 0u;
            id v55 = (id)addressListFromHeaderValue__nameExtensions;
            uint64_t v56 = [v55 countByEnumeratingWithState:&v93 objects:v112 count:16];
            if (v56)
            {
              uint64_t v57 = *(void *)v94;
              do
              {
                uint64_t v58 = 0;
                do
                {
                  if (*(void *)v94 != v57) {
                    objc_enumerationMutation(v55);
                  }
                  v59 = *(void **)(*((void *)&v93 + 1) + 8 * v58);
                  if (![v54 hasPrefix:v59]) {
                    goto LABEL_118;
                  }
                  int64_t v60 = [v59 length] + v29;
                  if (v60 >= v3) {
                    goto LABEL_118;
                  }
                  int64_t v61 = v109;
                  if (v109 <= v60) {
                    goto LABEL_118;
                  }
                  v62 = (UniChar *)CharactersPtr;
                  if (CharactersPtr)
                  {
                    int64_t v63 = v108 + v60;
LABEL_110:
                    UniChar v64 = v62[v63];
                    goto LABEL_113;
                  }
                  if (!v107)
                  {
                    uint64_t v67 = v110;
                    if (v111 <= v60 || v110 > v60)
                    {
                      int64_t v69 = v60 - 4;
                      if ((unint64_t)v60 < 4) {
                        int64_t v69 = 0;
                      }
                      if (v69 + 64 < v109) {
                        int64_t v61 = v69 + 64;
                      }
                      uint64_t v110 = v69;
                      uint64_t v111 = v61;
                      v117.location = v108 + v69;
                      v117.length = v61 - v69;
                      CFStringGetCharacters(v105, v117, buffer);
                      uint64_t v67 = v110;
                    }
                    int64_t v63 = v60 - v67;
                    v62 = buffer;
                    goto LABEL_110;
                  }
                  UniChar v64 = v107[v108 + v60];
LABEL_113:
                  BOOL v38 = v64 > 0x2Cu;
                  uint64_t v65 = (1 << v64) & 0x100100000600;
                  if (!v38 && v65 != 0)
                  {
                    uint64_t v7 = v60;
                    goto LABEL_159;
                  }
LABEL_118:
                  ++v58;
                }
                while (v56 != v58);
                uint64_t v70 = [v55 countByEnumeratingWithState:&v93 objects:v112 count:16];
                uint64_t v56 = v70;
              }
              while (v70);
            }

            unint64_t v27 = v88;
            unint64_t v28 = v7;
          }
        }
        if (v6 >= v28)
        {
          unint64_t v6 = v27;
        }
        else
        {
          unint64_t v89 = v27;
          uint64_t v71 = -(uint64_t)v28;
          unint64_t v72 = v28 + 64;
          while (1)
          {
            int64_t v73 = v28 - 1;
            uint64_t v74 = v28 >= 5 ? 5 : v28;
            if (v73 < 0) {
              break;
            }
            int64_t v75 = v109;
            if (v109 <= v73) {
              break;
            }
            if (CharactersPtr)
            {
              UniChar v76 = CharactersPtr[v28 - 1 + v108];
            }
            else if (v107)
            {
              UniChar v76 = v107[v108 - 1 + v28];
            }
            else
            {
              if (v111 <= v73 || (uint64_t v77 = v110, v110 > v73))
              {
                uint64_t v78 = -v74;
                uint64_t v79 = v74 + v71;
                int64_t v80 = v72 - v74;
                uint64_t v81 = v28 + v78;
                int64_t v82 = v81 + 64;
                if (v81 + 64 >= v109) {
                  int64_t v82 = v109;
                }
                uint64_t v110 = v81;
                uint64_t v111 = v82;
                if (v109 >= v80) {
                  int64_t v75 = v80;
                }
                v118.length = v75 + v79;
                v118.location = v81 + v108;
                CFStringGetCharacters(v105, v118, buffer);
                uint64_t v77 = v110;
              }
              UniChar v76 = buffer[v28 - 1 - v77];
            }
            BOOL v38 = v76 > 0x20u;
            uint64_t v83 = (1 << v76) & 0x100000600;
            if (v38 || v83 == 0) {
              break;
            }
            ++v71;
            --v72;
            --v28;
            if (v6 >= v73)
            {
              unint64_t v6 = v89;
              goto LABEL_160;
            }
          }
          v54 = -[__CFString substringWithRange:](theString, "substringWithRange:", v6, v28 - v6, v85);
          +[EAEmailAddressParser idnaDecodedAddressForAddress:v54];
          unint64_t v6 = v89;
          id v55 = (id)objc_claimAutoreleasedReturnValue();
          [v86 addObject:v55];
LABEL_159:
        }
      }
LABEL_160:
      if (++v7 >= v3) {
        goto LABEL_5;
      }
    }
  }
  id v86 = (id)MEMORY[0x263EFFA68];
LABEL_5:

  return v86;
}

void __50__EAEmailAddressLists_addressListFromHeaderValue___block_invoke()
{
  v0 = (void *)addressListFromHeaderValue__nameExtensions;
  addressListFromHeaderValue__nameExtensions = (uint64_t)&unk_26C55CF68;
}

+ (id)componentsSeparatedByCommaRespectingQuotesAndParensForString:(id)a3
{
  id v4 = a3;
  if (!componentsSeparatedByCommaRespectingQuotesAndParensForString__addressCharacterSet)
  {
    v5 = objc_msgSend([NSString alloc], "initWithFormat:", @",%C%C%C", 10, 13, 65532);
    uint64_t v6 = [MEMORY[0x263F08708] characterSetWithCharactersInString:v5];
    uint64_t v7 = (void *)componentsSeparatedByCommaRespectingQuotesAndParensForString__addressCharacterSet;
    componentsSeparatedByCommaRespectingQuotesAndParensForString__addressCharacterSet = v6;
  }
  UniChar v8 = objc_msgSend(a1, "componentsSeparatedByCharactersRespectingQuotesAndParens:forString:");

  return v8;
}

+ (id)componentsSeparatedByCharactersRespectingQuotesAndParens:(id)a3 forString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v20 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = (unsigned __int16 *)NSZoneMalloc(0, 2 * [v6 length]);
  [v6 getCharacters:v7];
  uint64_t v8 = [v6 length];
  int64_t v9 = &v7[v8];
  if (v8 >= 1)
  {
    char v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    int v13 = v7;
    unint64_t v14 = v7;
    while (1)
    {
      unsigned int v15 = *v13;
      if (v15 > 0x28)
      {
        if (v15 == 41)
        {
          if (v12) {
            --v12;
          }
          else {
            uint64_t v12 = 0;
          }
          goto LABEL_16;
        }
        if (v15 == 92)
        {
          char v16 = v10 | (v12 != 0);
          if (!(v10 & 1 | (v12 != 0))) {
            uint64_t v12 = 0;
          }
          v13 += v16 & 1;
          goto LABEL_16;
        }
      }
      else
      {
        if (v15 == 34)
        {
          v10 ^= v12 == 0;
          goto LABEL_16;
        }
        if (v15 == 40)
        {
          v12 += (v10 & 1) == 0;
          goto LABEL_16;
        }
      }
      if (!(v10 & 1 | ((objc_msgSend(v5, "characterIsMember:") & 1) == 0)) && !v12)
      {
        uint64_t v17 = objc_msgSend(v6, "substringWithRange:", v14 - v7, v13 - v14);

        if ([v17 length]) {
          [v20 addObject:v17];
        }
        uint64_t v12 = 0;
        char v10 = 0;
        unint64_t v14 = v13 + 1;
        goto LABEL_17;
      }
LABEL_16:
      uint64_t v17 = v11;
LABEL_17:
      ++v13;
      uint64_t v11 = v17;
      if (v13 >= v9) {
        goto LABEL_25;
      }
    }
  }
  uint64_t v17 = 0;
  unint64_t v14 = v7;
LABEL_25:
  if (v14 < v9)
  {
    BOOL v18 = objc_msgSend(v6, "substringWithRange:", v14 - v7, v9 - v14);

    uint64_t v17 = v18;
    if ([v18 length]) {
      [v20 addObject:v18];
    }
  }
  NSZoneFree(0, v7);

  return v20;
}

+ (id)addressListFromAddressString:(id)a3
{
  unint64_t v3 = [a3 componentsSeparatedByString:@", "];
  return v3;
}

+ (id)addressStringFromAddressList:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v26 = a3;
  unint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v26, "count"));
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v26;
  uint64_t v4 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v42;
    unint64_t v27 = v3;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v42 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = (__CFString *)*(id *)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v8 = +[EAEmailAddressParser displayNameFromAddress:v7];
        if (([v8 isEqualToString:v7] & 1) == 0
          && [v8 rangeOfString:@","] != 0x7FFFFFFFFFFFFFFFLL)
        {
          CFIndex Length = CFStringGetLength(v7);
          long long v38 = 0u;
          long long v36 = 0u;
          theString[1] = 0;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          *(_OWORD *)buffer = 0u;
          theString[0] = v7;
          uint64_t v40 = 0;
          long long v39 = (unint64_t)Length;
          theString[1] = (CFStringRef)CFStringGetCharactersPtr(v7);
          if (theString[1]) {
            CStringPtr = 0;
          }
          else {
            CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
          }
          *(void *)&long long v38 = CStringPtr;
          *((void *)&v39 + 1) = 0;
          uint64_t v40 = 0;
          if (Length >= 1)
          {
            uint64_t v11 = 0;
            uint64_t v12 = 0;
            char v13 = 0;
            unint64_t v14 = v7;
            while (1)
            {
              if ((v11 & 0x8000000000000000) == 0)
              {
                uint64_t v15 = v39;
                if ((uint64_t)v39 > v11) {
                  break;
                }
              }
LABEL_38:
              if (++v11 >= Length) {
                goto LABEL_49;
              }
            }
            char v16 = (UniChar *)theString[1];
            if (theString[1])
            {
              uint64_t v17 = *((void *)&v38 + 1) + v11;
              goto LABEL_17;
            }
            if ((void)v38)
            {
              UniChar v18 = *(char *)(v38 + *((void *)&v38 + 1) + v11);
            }
            else
            {
              if (v40 <= v11 || (uint64_t v22 = *((void *)&v39 + 1), *((uint64_t *)&v39 + 1) > v11))
              {
                uint64_t v23 = v11 - 4;
                if ((unint64_t)v11 < 4) {
                  uint64_t v23 = 0;
                }
                if (v23 + 64 < (uint64_t)v39) {
                  uint64_t v15 = v23 + 64;
                }
                *((void *)&v39 + 1) = v23;
                uint64_t v40 = v15;
                v48.location = *((void *)&v38 + 1) + v23;
                v48.length = v15 - v23;
                CFStringGetCharacters(theString[0], v48, buffer);
                uint64_t v22 = *((void *)&v39 + 1);
              }
              uint64_t v17 = v11 - v22;
              char v16 = buffer;
LABEL_17:
              UniChar v18 = v16[v17];
            }
            if (v18 <= 0x28u)
            {
              if (v18 == 34)
              {
                v13 ^= v12 == 0;
              }
              else if (v18 == 40)
              {
                v12 += (v13 & 1) == 0;
              }
            }
            else
            {
              switch(v18)
              {
                case ')':
                  if (v12) {
                    --v12;
                  }
                  else {
                    uint64_t v12 = 0;
                  }
                  break;
                case ',':
                  if (!(v13 & 1 | (v12 != 0)))
                  {
                    id v20 = +[EAEmailAddressParser rawAddressFromFullAddress:v7];
                    if (!v20) {
                      id v20 = v7;
                    }
                    uint64_t v21 = +[EAEmailAddressGenerator formattedAddressWithName:email:useQuotes:](EAEmailAddressGenerator, "formattedAddressWithName:email:useQuotes:", v8, v20, 1, v26);

                    char v13 = 0;
                    uint64_t v12 = 0;
                    unint64_t v14 = (__CFString *)v21;
                    uint64_t v11 = Length;
                  }
                  break;
                case '\\':
                  char v19 = v13 | (v12 != 0);
                  if (!(v13 & 1 | (v12 != 0))) {
                    uint64_t v12 = 0;
                  }
                  v11 += v19 & 1;
                  break;
              }
            }
            goto LABEL_38;
          }
          unint64_t v14 = v7;
LABEL_49:
          uint64_t v7 = v14;
          unint64_t v3 = v27;
        }
        objc_msgSend(v3, "addObject:", v7, v26);
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v4);
  }

  BOOL v24 = [v3 componentsJoinedByString:@", "];

  return v24;
}

+ (id)rawAddressListFromFullAddressList:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF980] arrayWithCapacity:v4];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v11 = +[EAEmailAddressParser rawAddressFromFullAddress:](EAEmailAddressParser, "rawAddressFromFullAddress:", v10, (void)v13);
          if (v11) {
            [v5 addObject:v11];
          }
          else {
            [v5 addObject:v10];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)displayNameFromAddressList:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        int64_t v9 = +[EAEmailAddressParser displayNameFromAddress:](EAEmailAddressParser, "displayNameFromAddress:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v4 addObject:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [v4 componentsJoinedByString:@", "];

  return v10;
}

+ (id)addressDisplayStringWithMaxNumberOfAddresses:(unint64_t)a3 fromAddressList:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 count];
  unint64_t v7 = v6;
  if (v6)
  {
    if (v6 == 1)
    {
      uint64_t v8 = [v5 objectAtIndexedSubscript:0];
    }
    else
    {
      int64_t v9 = [MEMORY[0x263F089D8] string];
      if (v7 >= a3) {
        unint64_t v10 = v7 - a3;
      }
      else {
        unint64_t v10 = 0;
      }
      id v11 = objc_alloc(MEMORY[0x263F088D0]);
      if (v7 <= a3) {
        unint64_t v12 = v7 - 1;
      }
      else {
        unint64_t v12 = a3;
      }
      long long v13 = objc_msgSend(v11, "initWithIndexesInRange:", 0, v12);
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      id v20 = __84__EAEmailAddressLists_addressDisplayStringWithMaxNumberOfAddresses_fromAddressList___block_invoke;
      uint64_t v21 = &unk_264218830;
      uint64_t v8 = v9;
      uint64_t v22 = v8;
      [v5 enumerateObjectsAtIndexes:v13 options:0 usingBlock:&v18];
      if (v7 <= a3)
      {
        long long v15 = _EFLocalizedString();
        long long v16 = [v5 objectAtIndexedSubscript:v7 - 1];
        -[__CFString appendFormat:](v8, "appendFormat:", v15, v16, v18, v19, v20, v21);
      }
      else
      {
        long long v14 = NSString;
        long long v15 = _EFLocalizedString();
        long long v16 = objc_msgSend(v14, "localizedStringWithFormat:", v15, v10, v18, v19, v20, v21);
        [(__CFString *)v8 appendString:v16];
      }
    }
  }
  else
  {
    uint64_t v8 = &stru_26C55BFE0;
  }

  return v8;
}

uint64_t __84__EAEmailAddressLists_addressDisplayStringWithMaxNumberOfAddresses_fromAddressList___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@, ", a2];
}

@end