@interface HSResponseDataParser
+ (id)_parseAuthorizedAccountTokenWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseBrowseListingWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseBulkCloudArtworkInfoResponseWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseBulkCloudLyricsInfoResponseWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseCloudArtworkInfoResponseWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseCloudLyricsInfoResponseWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseControlInterfacesResponseWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseControlPromptResponseWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseDeletedIDListingWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseDictionaryCollectionWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseEditCommandResponseWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseErrorResponseWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseItemIDArrayWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseItemsResponseWithBytes:(const char *)a3 length:(unint64_t)a4 usingHandler:(id)a5;
+ (id)_parseListingCollectionWithBytes:(const char *)a3 length:(unint64_t)a4 usingHandler:(id)a5;
+ (id)_parseListingItemWithBytes:(const char *)a3 length:(unsigned int)a4 usingHandler:(id)a5;
+ (id)_parseLoginResponseWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parsePlayStatusResponseWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseResponseCode:(unsigned int)a3 bytes:(const char *)a4 length:(unint64_t)a5 usingHandler:(id)a6;
+ (id)_parseUpdateResponseWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseUpdateTypeWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)enumerateRawItemsInResponseData:(id)a3 usingHandler:(id)a4;
+ (id)parseErrorInResponseData:(id)a3;
+ (id)parseResponseData:(id)a3;
+ (unint64_t)_parseItemPropertyCountWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (unint64_t)parseItemWithBytes:(const char *)a3 length:(unint64_t)a4 valuesOut:(id *)a5 valuesCapacity:(unint64_t)a6;
+ (void)enumerateDeletedItemsInResponseData:(id)a3 usingHandler:(id)a4;
+ (void)enumerateItemsInResponseData:(id)a3 usingHandler:(id)a4;
+ (void)parseItemWithBytes:(const char *)a3 length:(unint64_t)a4 usingHandler:(id)a5;
@end

@implementation HSResponseDataParser

+ (id)_parseListingItemWithBytes:(const char *)a3 length:(unsigned int)a4 usingHandler:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (v7)
  {
    (*((void (**)(id, const char *, void))v7 + 2))(v7, a3, a4);
    v9 = 0;
  }
  else
  {
    v9 = [MEMORY[0x263EFF9A0] dictionary];
    while (a4)
    {
      unsigned int v10 = *(_DWORD *)a3;
      unsigned int v11 = *((_DWORD *)a3 + 1);
      v12 = (unsigned __int8 *)(a3 + 8);
      unsigned int v13 = bswap32(v11);
      v19 = 0;
      id v20 = 0;
      ParseItemPropertyCode(bswap32(v10), v12, v13, &v20, &v19);
      id v14 = v20;
      v15 = v19;
      v16 = v15;
      if (v14) {
        BOOL v17 = v15 == 0;
      }
      else {
        BOOL v17 = 1;
      }
      if (!v17) {
        [v9 setObject:v14 forKey:v15];
      }
      a3 = (const char *)&v12[v13];
      a4 = a4 - 8 - v13;
    }
  }

  return v9;
}

+ (id)_parseErrorResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  for (i = [MEMORY[0x263EFF9A0] dictionary];
  {
    int v7 = *(unsigned __int8 *)a3;
    unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    int v9 = *((unsigned __int8 *)a3 + 3);
    unsigned int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
    uint64_t v11 = bswap32(*((_DWORD *)a3 + 1));
    v12 = a3 + 8;
    switch(v10)
    {
      case 0x61655243u:
        unsigned int v13 = [NSNumber numberWithUnsignedInt:bswap32(*((_DWORD *)a3 + 2))];
        id v14 = i;
        v15 = v13;
        v16 = &unk_26C5EF658;
        break;
      case 0x6D737473u:
        unsigned int v13 = [[NSString alloc] initWithBytes:a3 + 8 length:v11 encoding:4];
        id v14 = i;
        v15 = v13;
        v16 = &unk_26C5EF640;
        break;
      case 0x6D737474u:
        unsigned int v13 = [NSNumber numberWithUnsignedInt:bswap32(*((_DWORD *)a3 + 2))];
        id v14 = i;
        v15 = v13;
        v16 = &unk_26C5EF628;
        break;
      default:
        unsigned int v13 = os_log_create("com.apple.amp.HomeSharing", "Library");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v18[0] = 67109888;
          v18[1] = v7;
          __int16 v19 = 1024;
          unsigned int v20 = HIWORD(v8);
          __int16 v21 = 1024;
          unsigned int v22 = v10 >> 8;
          __int16 v23 = 1024;
          int v24 = v9;
          _os_log_impl(&dword_2152C7000, v13, OS_LOG_TYPE_DEBUG, "Unhandled code in play status response: %c%c%c%c", (uint8_t *)v18, 0x1Au);
        }
        goto LABEL_9;
    }
    [v14 setObject:v15 forKey:v16];
LABEL_9:

    a3 = &v12[v11];
  }
  return i;
}

+ (id)_parsePlayStatusResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v6 = [MEMORY[0x263EFF9A0] dictionary];
  if (a4)
  {
    while (1)
    {
      int v7 = *(unsigned __int8 *)a3;
      unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      int v9 = *((unsigned __int8 *)a3 + 3);
      int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
      uint64_t v11 = bswap32(*((_DWORD *)a3 + 1));
      v12 = (unsigned __int8 *)(a3 + 8);
      if (v10 <= 1667330931) {
        break;
      }
      if (v10 <= 1667584372)
      {
        if (v10 > 1667331698)
        {
          if (v10 > 1667583312)
          {
            if (v10 != 1667583313)
            {
              if (v10 == 1667583569)
              {
                unsigned int v13 = [NSNumber numberWithUnsignedInt:bswap32(*((_DWORD *)a3 + 2))];
                id v14 = v6;
                v15 = v13;
                v16 = &unk_26C5EF4C0;
                goto LABEL_77;
              }
              goto LABEL_62;
            }
            unsigned int v13 = [NSNumber numberWithUnsignedChar:*v12];
            id v14 = v6;
            v15 = v13;
            v16 = &unk_26C5EF4A8;
          }
          else
          {
            if (v10 != 1667331699)
            {
              if (v10 == 1667581779)
              {
                unsigned int v13 = [NSNumber numberWithUnsignedChar:*v12];
                id v14 = v6;
                v15 = v13;
                v16 = &unk_26C5EF5E0;
                goto LABEL_77;
              }
              goto LABEL_62;
            }
            unsigned int v13 = [NSNumber numberWithUnsignedChar:*v12];
            id v14 = v6;
            v15 = v13;
            v16 = &unk_26C5EF400;
          }
        }
        else if (v10 > 1667331682)
        {
          if (v10 != 1667331683)
          {
            if (v10 == 1667331685)
            {
              unsigned int v13 = [NSNumber numberWithUnsignedChar:*v12];
              id v14 = v6;
              v15 = v13;
              v16 = &unk_26C5EF478;
              goto LABEL_77;
            }
            goto LABEL_62;
          }
          unsigned int v13 = [NSNumber numberWithUnsignedChar:*v12];
          id v14 = v6;
          v15 = v13;
          v16 = &unk_26C5EF418;
        }
        else
        {
          if (v10 != 1667330932)
          {
            if (v10 == 1667330933)
            {
              unsigned int v13 = [NSNumber numberWithUnsignedChar:*v12];
              id v14 = v6;
              v15 = v13;
              v16 = &unk_26C5EF5C8;
              goto LABEL_77;
            }
            goto LABEL_62;
          }
          unsigned int v13 = [NSNumber numberWithUnsignedInt:bswap32(*((_DWORD *)a3 + 2))];
          id v14 = v6;
          v15 = v13;
          v16 = &unk_26C5EF5B0;
        }
        goto LABEL_77;
      }
      if (v10 <= 1668113011)
      {
        if (v10 > 1668113004)
        {
          if (v10 != 1668113005)
          {
            if (v10 == 1668113011)
            {
              unsigned int v13 = [[NSString alloc] initWithBytes:a3 + 8 length:v11 encoding:4];
              id v14 = v6;
              v15 = v13;
              v16 = &unk_26C5EF508;
              goto LABEL_77;
            }
            goto LABEL_62;
          }
          unsigned int v13 = [[NSString alloc] initWithBytes:a3 + 8 length:v11 encoding:4];
          id v14 = v6;
          v15 = v13;
          v16 = &unk_26C5EF538;
        }
        else
        {
          if (v10 != 1667584373)
          {
            if (v10 == 1668112996)
            {
              unsigned int v13 = [[NSString alloc] initWithBytes:a3 + 8 length:v11 encoding:4];
              id v14 = v6;
              v15 = v13;
              v16 = &unk_26C5EF4F0;
              goto LABEL_77;
            }
            goto LABEL_62;
          }
          unsigned int v13 = [NSNumber numberWithUnsignedChar:*v12];
          id v14 = v6;
          v15 = v13;
          v16 = &unk_26C5EF490;
        }
        goto LABEL_77;
      }
      if (v10 <= 1668117361)
      {
        if (v10 != 1668113012)
        {
          if (v10 == 1668115819)
          {
            unsigned int v13 = [NSNumber numberWithUnsignedInt:bswap32(*((_DWORD *)a3 + 2))];
            id v14 = v6;
            v15 = v13;
            v16 = &unk_26C5EF568;
            goto LABEL_77;
          }
          goto LABEL_62;
        }
        unsigned int v13 = [[NSString alloc] initWithBytes:a3 + 8 length:v11 encoding:4];
        id v14 = v6;
        v15 = v13;
        v16 = &unk_26C5EF520;
LABEL_77:
        [v14 setObject:v15 forKey:v16];
        goto LABEL_78;
      }
      if (v10 != 1836282996)
      {
        if (v10 == 1668117362)
        {
          unsigned int v13 = [NSNumber numberWithUnsignedInt:bswap32(*((_DWORD *)a3 + 2))];
          id v14 = v6;
          v15 = v13;
          v16 = &unk_26C5EF340;
          goto LABEL_77;
        }
LABEL_62:
        unsigned int v13 = os_log_create("com.apple.amp.HomeSharing", "Library");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v18[0] = 67109888;
          v18[1] = v7;
          __int16 v19 = 1024;
          unsigned int v20 = HIWORD(v8);
          __int16 v21 = 1024;
          unsigned int v22 = v10 >> 8;
          __int16 v23 = 1024;
          int v24 = v9;
          _os_log_impl(&dword_2152C7000, v13, OS_LOG_TYPE_DEBUG, "Unhandled code in play status response: %c%c%c%c", (uint8_t *)v18, 0x1Au);
        }
LABEL_78:
      }
      a3 = (const char *)&v12[v11];
      a4 = a4 - 8 - v11;
      if (!a4) {
        goto LABEL_80;
      }
    }
    if (v10 <= 1667329643)
    {
      if (v10 <= 1667327588)
      {
        switch(v10)
        {
          case 1634951529:
            unsigned int v13 = [NSNumber numberWithUnsignedLongLong:(((unint64_t)*((unsigned __int8 *)a3 + 8) << 56) | ((unint64_t)*((unsigned __int8 *)a3 + 9) << 48) | ((unint64_t)*((unsigned __int8 *)a3 + 10) << 40) | ((unint64_t)*((unsigned __int8 *)a3 + 11) << 32) | ((unint64_t)*((unsigned __int8 *)a3 + 12) << 24) | ((unint64_t)*((unsigned __int8 *)a3 + 13) << 16) | ((unint64_t)*((unsigned __int8 *)a3 + 14) << 8))+ *((unsigned __int8 *)a3 + 15)];
            id v14 = v6;
            v15 = v13;
            v16 = &unk_26C5EF4D8;
            break;
          case 1667326322:
            unsigned int v13 = [NSNumber numberWithUnsignedInt:bswap32(*((_DWORD *)a3 + 2))];
            id v14 = v6;
            v15 = v13;
            v16 = &unk_26C5EF448;
            break;
          case 1667326323:
            unsigned int v13 = [NSNumber numberWithUnsignedInt:bswap32(*((_DWORD *)a3 + 2))];
            id v14 = v6;
            v15 = v13;
            v16 = &unk_26C5EF430;
            goto LABEL_77;
          default:
            goto LABEL_62;
        }
      }
      else if (v10 > 1667329632)
      {
        if (v10 != 1667329633)
        {
          if (v10 == 1667329639)
          {
            unsigned int v13 = [[NSString alloc] initWithBytes:a3 + 8 length:v11 encoding:4];
            id v14 = v6;
            v15 = v13;
            v16 = &unk_26C5EF550;
            goto LABEL_77;
          }
          goto LABEL_62;
        }
        unsigned int v13 = [[NSString alloc] initWithBytes:a3 + 8 length:v11 encoding:4];
        id v14 = v6;
        v15 = v13;
        v16 = &unk_26C5EF370;
      }
      else
      {
        if (v10 != 1667327589)
        {
          if (v10 == 1667327603)
          {
            unsigned int v13 = [NSNumber numberWithUnsignedChar:*v12];
            id v14 = v6;
            v15 = v13;
            v16 = &unk_26C5EF3E8;
            goto LABEL_77;
          }
          goto LABEL_62;
        }
        unsigned int v13 = [NSNumber numberWithUnsignedChar:*v12];
        id v14 = v6;
        v15 = v13;
        v16 = &unk_26C5EF460;
      }
    }
    else if (v10 > 1667330162)
    {
      if (v10 > 1667330914)
      {
        if (v10 != 1667330915)
        {
          if (v10 == 1667330920)
          {
            unsigned int v13 = [NSNumber numberWithUnsignedChar:*v12];
            id v14 = v6;
            v15 = v13;
            v16 = &unk_26C5EF3B8;
            goto LABEL_77;
          }
          goto LABEL_62;
        }
        unsigned int v13 = [NSNumber numberWithUnsignedChar:*v12];
        id v14 = v6;
        v15 = v13;
        v16 = &unk_26C5EF580;
      }
      else
      {
        if (v10 != 1667330163)
        {
          if (v10 == 1667330672)
          {
            unsigned int v13 = [NSNumber numberWithUnsignedChar:*v12];
            id v14 = v6;
            v15 = v13;
            v16 = &unk_26C5EF3D0;
            goto LABEL_77;
          }
          goto LABEL_62;
        }
        unsigned int v13 = [NSNumber numberWithUnsignedChar:*v12];
        id v14 = v6;
        v15 = v13;
        v16 = &unk_26C5EF3A0;
      }
    }
    else
    {
      switch(v10)
      {
        case 1667329644:
          unsigned int v13 = [[NSString alloc] initWithBytes:a3 + 8 length:v11 encoding:4];
          id v14 = v6;
          v15 = v13;
          v16 = &unk_26C5EF388;
          goto LABEL_77;
        case 1667329645:
        case 1667329647:
        case 1667329649:
        case 1667329650:
        case 1667329651:
          goto LABEL_62;
        case 1667329646:
          unsigned int v13 = [[NSString alloc] initWithBytes:a3 + 8 length:v11 encoding:4];
          id v14 = v6;
          v15 = v13;
          v16 = &unk_26C5EF358;
          goto LABEL_77;
        case 1667329648:
          unsigned int v13 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a3 + 8 length:v11];
          id v14 = v6;
          v15 = v13;
          v16 = &unk_26C5EF5F8;
          goto LABEL_77;
        case 1667329652:
          unsigned int v13 = [NSNumber numberWithUnsignedInt:bswap32(*((_DWORD *)a3 + 2))];
          id v14 = v6;
          v15 = v13;
          v16 = &unk_26C5EF598;
          goto LABEL_77;
        default:
          if (v10 != 1667330156) {
            goto LABEL_62;
          }
          unsigned int v13 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a3 + 8 length:v11];
          id v14 = v6;
          v15 = v13;
          v16 = &unk_26C5EF610;
          break;
      }
    }
    goto LABEL_77;
  }
LABEL_80:
  return v6;
}

+ (id)_parseItemIDArrayWithBytes:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  for (i = [MEMORY[0x263EFF980] array];
  {
    int v7 = *(unsigned __int8 *)a3;
    unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    int v9 = *((unsigned __int8 *)a3 + 3);
    unsigned int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
    unsigned int v11 = *((_DWORD *)a3 + 1);
    if (v10 == 1835624804)
    {
      v12 = [NSNumber numberWithUnsignedInt:bswap32(*((_DWORD *)a3 + 2))];
      [i addObject:v12];
    }
    else
    {
      v12 = os_log_create("com.apple.amp.HomeSharing", "Library");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v15[0] = 67109888;
        v15[1] = v7;
        __int16 v16 = 1024;
        unsigned int v17 = HIWORD(v8);
        __int16 v18 = 1024;
        unsigned int v19 = v10 >> 8;
        __int16 v20 = 1024;
        int v21 = v9;
        _os_log_impl(&dword_2152C7000, v12, OS_LOG_TYPE_DEBUG, "Unhandled code in item ID array response: %c%c%c%c", (uint8_t *)v15, 0x1Au);
      }
    }
    uint64_t v13 = bswap32(v11);

    a3 += v13 + 8;
  }
  return i;
}

+ (id)_parseBrowseListingWithBytes:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  for (i = [MEMORY[0x263EFF980] array];
  {
    int v7 = *(unsigned __int8 *)a3;
    unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    int v9 = *((unsigned __int8 *)a3 + 3);
    unsigned int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
    uint64_t v11 = bswap32(*((_DWORD *)a3 + 1));
    v12 = a3 + 8;
    if (v10 == 1835821428)
    {
      uint64_t v13 = [[NSString alloc] initWithBytes:v12 length:v11 encoding:4];
      [i addObject:v13];
    }
    else
    {
      uint64_t v13 = os_log_create("com.apple.amp.HomeSharing", "Library");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v15[0] = 67109888;
        v15[1] = v7;
        __int16 v16 = 1024;
        unsigned int v17 = HIWORD(v8);
        __int16 v18 = 1024;
        unsigned int v19 = v10 >> 8;
        __int16 v20 = 1024;
        int v21 = v9;
        _os_log_impl(&dword_2152C7000, v13, OS_LOG_TYPE_DEBUG, "Unhandled code in browse listing response: %c%c%c%c", (uint8_t *)v15, 0x1Au);
      }
    }

    a3 = &v12[v11];
  }
  return i;
}

+ (id)_parseListingCollectionWithBytes:(const char *)a3 length:(unint64_t)a4 usingHandler:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a5;
  if (v8)
  {
    id v20 = 0;
    if (!a4) {
      goto LABEL_16;
    }
  }
  else
  {
    id v20 = [MEMORY[0x263EFF980] array];
    if (!a4) {
      goto LABEL_16;
    }
  }
  do
  {
    int v9 = *(unsigned __int8 *)a3;
    unsigned int v10 = (v9 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    int v11 = *((unsigned __int8 *)a3 + 3);
    unsigned int v12 = v11 | (*((unsigned __int8 *)a3 + 2) << 8) | v10;
    uint64_t v13 = bswap32(*((_DWORD *)a3 + 1));
    id v14 = a3 + 8;
    if (v12 == 1634025828 || v12 == 1835821428 || v12 == 1634036070)
    {
      unsigned int v17 = [a1 _parseListingItemWithBytes:v14 length:v13 usingHandler:v8];
      if (!v8) {
        [v20 addObject:v17];
      }
    }
    else
    {
      unsigned int v17 = os_log_create("com.apple.amp.HomeSharing", "Library");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109888;
        int v22 = v9;
        __int16 v23 = 1024;
        unsigned int v24 = HIWORD(v10);
        __int16 v25 = 1024;
        unsigned int v26 = v12 >> 8;
        __int16 v27 = 1024;
        int v28 = v11;
        _os_log_impl(&dword_2152C7000, v17, OS_LOG_TYPE_DEBUG, "Unhandled code in listing collection response: %c%c%c%c", buf, 0x1Au);
      }
    }

    a3 = &v14[v13];
    a4 = a4 - 8 - v13;
  }
  while (a4);
LABEL_16:

  return v20;
}

+ (id)_parseItemsResponseWithBytes:(const char *)a3 length:(unint64_t)a4 usingHandler:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v34 = a5;
  id v8 = 0;
  if (a4)
  {
    *(void *)&long long v7 = 67109120;
    long long v33 = v7;
    while (1)
    {
      int v9 = *(unsigned __int8 *)a3;
      unsigned int v10 = (v9 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      int v11 = *((unsigned __int8 *)a3 + 3);
      int v12 = v11 | (*((unsigned __int8 *)a3 + 2) << 8) | v10;
      unsigned int v13 = *((_DWORD *)a3 + 1);
      unint64_t v14 = a4 - 8;
      if (v12 > 1836213102)
      {
        if (v12 > 1836409963)
        {
          BOOL v17 = v12 == 1836409964 || v12 == 1836413810;
          int v18 = 1836414073;
        }
        else
        {
          if (v12 == 1836213103)
          {
            int v26 = *((unsigned __int8 *)a3 + 8);
            int v27 = *((unsigned __int8 *)a3 + 9);
            int v28 = *((unsigned __int8 *)a3 + 10);
            int v29 = *((unsigned __int8 *)a3 + 11);
            id v20 = os_log_create("com.apple.amp.HomeSharing", "Library");
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v33;
              int v37 = (v26 << 24) | (v27 << 16) | (v28 << 8) | v29;
              int v22 = v20;
              os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
              unsigned int v24 = "Returned count: %d";
              goto LABEL_36;
            }
            goto LABEL_38;
          }
          BOOL v17 = v12 == 1836282996;
          int v18 = 1836344175;
        }
        if (v17 || v12 == v18) {
          goto LABEL_39;
        }
        goto LABEL_30;
      }
      if (v12 <= 1633838957) {
        break;
      }
      if (v12 == 1633838958) {
        goto LABEL_20;
      }
      if (v12 != 1634025810)
      {
        if (v12 == 1835819884)
        {
          uint64_t v19 = [a1 _parseListingCollectionWithBytes:a3 + 8 length:a4 - 8 usingHandler:v34];
LABEL_21:
          id v20 = v8;
          id v8 = v19;
          goto LABEL_38;
        }
        goto LABEL_30;
      }
      id v20 = os_log_create("com.apple.amp.HomeSharing", "Library");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v30 = bswap32(*((_DWORD *)a3 + 2));
        *(_DWORD *)buf = v33;
        int v37 = v30;
        int v22 = v20;
        os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
        unsigned int v24 = "Authorized DSIDs revision code: %d";
LABEL_36:
        uint32_t v25 = 8;
LABEL_37:
        _os_log_impl(&dword_2152C7000, v22, v23, v24, buf, v25);
      }
LABEL_38:

LABEL_39:
      uint64_t v31 = bswap32(v13);
      a3 += v31 + 8;
      a4 = v14 - v31;
      if (v14 == v31) {
        goto LABEL_40;
      }
    }
    if (v12 == 1633837420 || v12 == 1633837426 || v12 == 1633837936)
    {
LABEL_20:
      uint64_t v19 = objc_msgSend(a1, "_parseBrowseListingWithBytes:length:", a3 + 8, a4 - 8, v33);
      goto LABEL_21;
    }
LABEL_30:
    id v20 = os_log_create("com.apple.amp.HomeSharing", "Library");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109888;
      int v37 = v9;
      __int16 v38 = 1024;
      unsigned int v39 = HIWORD(v10);
      __int16 v40 = 1024;
      unsigned int v41 = v12 >> 8;
      __int16 v42 = 1024;
      int v43 = v11;
      int v22 = v20;
      os_log_type_t v23 = OS_LOG_TYPE_DEBUG;
      unsigned int v24 = "Unhandled code in items response: %c%c%c%c";
      uint32_t v25 = 26;
      goto LABEL_37;
    }
    goto LABEL_38;
  }
LABEL_40:

  return v8;
}

+ (id)_parseUpdateTypeWithBytes:(const char *)a3 length:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v4 = a4;
    v6 = 0;
    while (1)
    {
      unsigned int v7 = bswap32(*(_DWORD *)a3);
      uint64_t v8 = bswap32(*((_DWORD *)a3 + 1));
      int v9 = (unsigned __int8 *)(a3 + 8);
      if (v7 == 1836414073)
      {
        uint64_t v11 = [NSNumber numberWithUnsignedChar:*v9];

        v6 = (void *)v11;
      }
      else if (v7 == 1633968755 || v7 == 1634759535)
      {
        id v12 = [a1 _parseUpdateTypeWithBytes:a3 + 8 length:v8];
        goto LABEL_15;
      }
      a3 = (const char *)&v9[v8];
      unint64_t v4 = v4 - 8 - v8;
      if (!v4) {
        goto LABEL_14;
      }
    }
  }
  v6 = 0;
LABEL_14:
  id v12 = v6;
  v6 = v12;
LABEL_15:
  unsigned int v13 = v12;

  return v13;
}

+ (id)_parseEditCommandResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v6 = [MEMORY[0x263EFF9A0] dictionary];
  if (a4)
  {
    while (1)
    {
      int v7 = *(unsigned __int8 *)a3;
      unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      int v9 = *((unsigned __int8 *)a3 + 3);
      unsigned int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
      unsigned int v11 = *((_DWORD *)a3 + 1);
      if (v10 == 1835624804) {
        break;
      }
      if (v10 != 1836282996)
      {
        if (v10 == 1836413810)
        {
          id v12 = [NSNumber numberWithUnsignedInt:bswap32(*((_DWORD *)a3 + 2))];
          unsigned int v13 = v6;
          unint64_t v14 = v12;
          v15 = @"dmap.serverrevision";
          goto LABEL_7;
        }
        id v12 = os_log_create("com.apple.amp.HomeSharing", "Library");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v18[0] = 67109888;
          v18[1] = v7;
          __int16 v19 = 1024;
          unsigned int v20 = HIWORD(v8);
          __int16 v21 = 1024;
          unsigned int v22 = v10 >> 8;
          __int16 v23 = 1024;
          int v24 = v9;
          _os_log_impl(&dword_2152C7000, v12, OS_LOG_TYPE_DEBUG, "Unhandled code in editing command response: %c%c%c%c", (uint8_t *)v18, 0x1Au);
        }
LABEL_10:
      }
      uint64_t v16 = bswap32(v11);
      a3 += v16 + 8;
      a4 = a4 - 8 - v16;
      if (!a4) {
        goto LABEL_12;
      }
    }
    id v12 = [NSNumber numberWithUnsignedInt:bswap32(*((_DWORD *)a3 + 2))];
    unsigned int v13 = v6;
    unint64_t v14 = v12;
    v15 = @"dmap.itemid";
LABEL_7:
    [v13 setObject:v14 forKey:v15];
    goto LABEL_10;
  }
LABEL_12:
  return v6;
}

+ (id)_parseDictionaryCollectionWithBytes:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v17 = [MEMORY[0x263EFF9A0] dictionary];
  if (a4 >= 9)
  {
    v6 = 0;
    int v7 = 0;
    while (1)
    {
      int v8 = *(unsigned __int8 *)a3;
      unsigned int v9 = (v8 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      int v10 = *((unsigned __int8 *)a3 + 3);
      int v11 = v10 | (*((unsigned __int8 *)a3 + 2) << 8) | v9;
      uint64_t v12 = bswap32(*((_DWORD *)a3 + 1));
      unsigned int v13 = a3 + 8;
      if (v11 > 1835297656)
      {
        if (v11 != 1835300460)
        {
          if (v11 != 1835297657)
          {
LABEL_16:
            unint64_t v14 = os_log_create("com.apple.amp.HomeSharing", "Library");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109888;
              int v19 = v8;
              __int16 v20 = 1024;
              unsigned int v21 = HIWORD(v9);
              __int16 v22 = 1024;
              unsigned int v23 = v11 >> 8;
              __int16 v24 = 1024;
              int v25 = v10;
              _os_log_impl(&dword_2152C7000, v14, OS_LOG_TYPE_DEBUG, "Unhandled code in dictionary collection: %c%c%c%c", buf, 0x1Au);
            }
            goto LABEL_11;
          }
LABEL_9:
          unint64_t v14 = v7;
          int v7 = [[NSString alloc] initWithBytes:v13 length:v12 encoding:4];
          goto LABEL_11;
        }
      }
      else
      {
        if (v11 == 1668113253) {
          goto LABEL_9;
        }
        if (v11 != 1668113270) {
          goto LABEL_16;
        }
      }
      unint64_t v14 = v6;
      v6 = [[NSString alloc] initWithBytes:v13 length:v12 encoding:4];
LABEL_11:

      if (v7 && v6)
      {
        [v17 setObject:v6 forKey:v7];

        int v7 = 0;
        v6 = 0;
      }
      a3 = &v13[v12];
      a4 = a4 - 8 - v12;
      if (a4 <= 8) {
        goto LABEL_19;
      }
    }
  }
  int v7 = 0;
  v6 = 0;
LABEL_19:
  id v15 = v17;

  return v15;
}

+ (id)_parseDeletedIDListingWithBytes:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v6 = [MEMORY[0x263EFF980] array];
  if (a4 >= 9)
  {
    do
    {
      int v7 = *(unsigned __int8 *)a3;
      unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      int v9 = *((unsigned __int8 *)a3 + 3);
      unsigned int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
      unsigned int v11 = *((_DWORD *)a3 + 1);
      if (v10 == 1835625572)
      {
        uint64_t v12 = [NSNumber numberWithUnsignedLongLong:(((unint64_t)*((unsigned __int8 *)a3 + 8) << 56) | ((unint64_t)*((unsigned __int8 *)a3 + 9) << 48) | ((unint64_t)*((unsigned __int8 *)a3 + 10) << 40) | ((unint64_t)*((unsigned __int8 *)a3 + 11) << 32) | ((unint64_t)*((unsigned __int8 *)a3 + 12) << 24) | ((unint64_t)*((unsigned __int8 *)a3 + 13) << 16) | ((unint64_t)*((unsigned __int8 *)a3 + 14) << 8))+ *((unsigned __int8 *)a3 + 15)];
      }
      else
      {
        if (v10 != 1835624804)
        {
          unsigned int v13 = os_log_create("com.apple.amp.HomeSharing", "Library");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            v16[0] = 67109888;
            v16[1] = v7;
            __int16 v17 = 1024;
            unsigned int v18 = HIWORD(v8);
            __int16 v19 = 1024;
            unsigned int v20 = v10 >> 8;
            __int16 v21 = 1024;
            int v22 = v9;
            _os_log_impl(&dword_2152C7000, v13, OS_LOG_TYPE_DEBUG, "Unhandled code in deleted item ID listing response: %c%c%c%c", (uint8_t *)v16, 0x1Au);
          }
          goto LABEL_7;
        }
        uint64_t v12 = [NSNumber numberWithUnsignedInt:bswap32(*((_DWORD *)a3 + 2))];
      }
      unsigned int v13 = v12;
      [v6 addObject:v12];
LABEL_7:
      uint64_t v14 = bswap32(v11);

      a3 += v14 + 8;
      a4 = a4 - 8 - v14;
    }
    while (a4 > 8);
  }
  return v6;
}

+ (id)_parseControlPromptResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v6 = [MEMORY[0x263EFF9A0] dictionary];
  if (a4)
  {
    while (1)
    {
      int v7 = *(unsigned __int8 *)a3;
      unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      int v9 = *((unsigned __int8 *)a3 + 3);
      unsigned int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
      uint64_t v11 = bswap32(*((_DWORD *)a3 + 1));
      uint64_t v12 = a3 + 8;
      if (v10 == 1835295596) {
        break;
      }
      if (v10 != 1836282996)
      {
        if (v10 == 1835624804)
        {
          unsigned int v13 = [NSNumber numberWithUnsignedInt:bswap32(*((_DWORD *)a3 + 2))];
          [v6 setObject:v13 forKey:@"dmap.itemid"];
        }
        else
        {
          unsigned int v13 = os_log_create("com.apple.amp.HomeSharing", "Library");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109888;
            int v17 = v7;
            __int16 v18 = 1024;
            unsigned int v19 = HIWORD(v8);
            __int16 v20 = 1024;
            unsigned int v21 = v10 >> 8;
            __int16 v22 = 1024;
            int v23 = v9;
            _os_log_impl(&dword_2152C7000, v13, OS_LOG_TYPE_DEBUG, "Unhandled code in control prompt response: %c%c%c%c", buf, 0x1Au);
          }
        }
LABEL_10:
      }
      a3 = &v12[v11];
      a4 = a4 - 8 - v11;
      if (!a4) {
        goto LABEL_12;
      }
    }
    unsigned int v13 = [a1 _parseDictionaryCollectionWithBytes:a3 + 8 length:v11];
    if (v13) {
      [v6 addEntriesFromDictionary:v13];
    }
    goto LABEL_10;
  }
LABEL_12:
  return v6;
}

+ (id)_parseControlInterfacesResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unint64_t v4 = 0;
  if (a4)
  {
    while (1)
    {
      int v5 = *(unsigned __int8 *)a3;
      unsigned int v6 = (v5 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      int v7 = *((unsigned __int8 *)a3 + 3);
      int v8 = v7 | (*((unsigned __int8 *)a3 + 2) << 8) | v6;
      unsigned int v9 = *((_DWORD *)a3 + 1);
      unsigned int v10 = a3 + 8;
      unint64_t v11 = a4 - 8;
      if (v8 > 1836282995) {
        break;
      }
      if (v8 == 1835819884)
      {
        [a1 _parseListingCollectionWithBytes:a3 + 8 length:a4 - 8 usingHandler:0];
        v4 = unsigned int v13 = v4;
        goto LABEL_13;
      }
      if (v8 != 1836213103) {
        goto LABEL_10;
      }
LABEL_14:
      uint64_t v14 = bswap32(v9);
      a3 = &v10[v14];
      a4 = v11 - v14;
      if (v11 == v14) {
        goto LABEL_15;
      }
    }
    if (v8 == 1836282996 || v8 == 1836344175) {
      goto LABEL_14;
    }
LABEL_10:
    unsigned int v13 = os_log_create("com.apple.amp.HomeSharing", "Library");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109888;
      int v18 = v5;
      __int16 v19 = 1024;
      unsigned int v20 = HIWORD(v6);
      __int16 v21 = 1024;
      unsigned int v22 = v8 >> 8;
      __int16 v23 = 1024;
      int v24 = v7;
      _os_log_impl(&dword_2152C7000, v13, OS_LOG_TYPE_DEBUG, "Unhandled code in control interfaces response: %c%c%c%c", buf, 0x1Au);
    }
LABEL_13:

    goto LABEL_14;
  }
LABEL_15:
  return v4;
}

+ (id)_parseCloudLyricsInfoResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  for (id i = [MEMORY[0x263EFF9A0] dictionary];
  {
    int v7 = *(unsigned __int8 *)a3;
    unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    int v9 = *((unsigned __int8 *)a3 + 3);
    unsigned int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
    uint64_t v11 = bswap32(*((_DWORD *)a3 + 1));
    uint64_t v12 = a3 + 8;
    if (v10 != 1836282996)
    {
      if (v10 == 1835295596)
      {
        unsigned int v13 = [a1 _parseDictionaryCollectionWithBytes:v12 length:v11];
        if (v13) {
          [i addEntriesFromDictionary:v13];
        }
      }
      else
      {
        unsigned int v13 = os_log_create("com.apple.amp.HomeSharing", "Library");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109888;
          int v17 = v7;
          __int16 v18 = 1024;
          unsigned int v19 = HIWORD(v8);
          __int16 v20 = 1024;
          unsigned int v21 = v10 >> 8;
          __int16 v22 = 1024;
          int v23 = v9;
          _os_log_impl(&dword_2152C7000, v13, OS_LOG_TYPE_DEBUG, "Unhandled code in cloud artwork info response: %c%c%c%c", buf, 0x1Au);
        }
      }
    }
    a3 = &v12[v11];
  }
  return i;
}

+ (id)_parseCloudArtworkInfoResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  for (id i = [MEMORY[0x263EFF9A0] dictionary];
  {
    int v7 = *(unsigned __int8 *)a3;
    unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    int v9 = *((unsigned __int8 *)a3 + 3);
    unsigned int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
    uint64_t v11 = bswap32(*((_DWORD *)a3 + 1));
    uint64_t v12 = a3 + 8;
    if (v10 != 1836282996)
    {
      if (v10 == 1835295596)
      {
        unsigned int v13 = [a1 _parseDictionaryCollectionWithBytes:v12 length:v11];
        if (v13) {
          [i addEntriesFromDictionary:v13];
        }
      }
      else
      {
        unsigned int v13 = os_log_create("com.apple.amp.HomeSharing", "Library");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109888;
          int v17 = v7;
          __int16 v18 = 1024;
          unsigned int v19 = HIWORD(v8);
          __int16 v20 = 1024;
          unsigned int v21 = v10 >> 8;
          __int16 v22 = 1024;
          int v23 = v9;
          _os_log_impl(&dword_2152C7000, v13, OS_LOG_TYPE_DEBUG, "Unhandled code in cloud artwork info response: %c%c%c%c", buf, 0x1Au);
        }
      }
    }
    a3 = &v12[v11];
  }
  return i;
}

+ (id)_parseBulkCloudLyricsInfoResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unint64_t v4 = 0;
  if (a4)
  {
    do
    {
      int v5 = *(unsigned __int8 *)a3;
      unsigned int v6 = (v5 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      int v7 = *((unsigned __int8 *)a3 + 3);
      unsigned int v8 = v7 | (*((unsigned __int8 *)a3 + 2) << 8) | v6;
      unsigned int v9 = *((_DWORD *)a3 + 1);
      unsigned int v10 = a3 + 8;
      unint64_t v11 = a4 - 8;
      if (v8 != 1836282996)
      {
        if (v8 == 1835819884)
        {
          [a1 _parseListingCollectionWithBytes:a3 + 8 length:a4 - 8 usingHandler:0];
          v4 = uint64_t v12 = v4;
        }
        else
        {
          uint64_t v12 = os_log_create("com.apple.amp.HomeSharing", "Library");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109888;
            int v17 = v5;
            __int16 v18 = 1024;
            unsigned int v19 = HIWORD(v6);
            __int16 v20 = 1024;
            unsigned int v21 = v8 >> 8;
            __int16 v22 = 1024;
            int v23 = v7;
            _os_log_impl(&dword_2152C7000, v12, OS_LOG_TYPE_DEBUG, "Unhandled code in bulk cloud lyrics info response: %c%c%c%c", buf, 0x1Au);
          }
        }
      }
      uint64_t v13 = bswap32(v9);
      a3 = &v10[v13];
      a4 = v11 - v13;
    }
    while (v11 != v13);
  }
  return v4;
}

+ (id)_parseBulkCloudArtworkInfoResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unint64_t v4 = 0;
  if (a4)
  {
    do
    {
      int v5 = *(unsigned __int8 *)a3;
      unsigned int v6 = (v5 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      int v7 = *((unsigned __int8 *)a3 + 3);
      unsigned int v8 = v7 | (*((unsigned __int8 *)a3 + 2) << 8) | v6;
      unsigned int v9 = *((_DWORD *)a3 + 1);
      unsigned int v10 = a3 + 8;
      unint64_t v11 = a4 - 8;
      if (v8 != 1836282996)
      {
        if (v8 == 1835819884)
        {
          [a1 _parseListingCollectionWithBytes:a3 + 8 length:a4 - 8 usingHandler:0];
          v4 = uint64_t v12 = v4;
        }
        else
        {
          uint64_t v12 = os_log_create("com.apple.amp.HomeSharing", "Library");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109888;
            int v17 = v5;
            __int16 v18 = 1024;
            unsigned int v19 = HIWORD(v6);
            __int16 v20 = 1024;
            unsigned int v21 = v8 >> 8;
            __int16 v22 = 1024;
            int v23 = v7;
            _os_log_impl(&dword_2152C7000, v12, OS_LOG_TYPE_DEBUG, "Unhandled code in bulk cloud artwork info response: %c%c%c%c", buf, 0x1Au);
          }
        }
      }
      uint64_t v13 = bswap32(v9);
      a3 = &v10[v13];
      a4 = v11 - v13;
    }
    while (v11 != v13);
  }
  return v4;
}

+ (id)_parseAuthorizedAccountTokenWithBytes:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unsigned int v6 = [MEMORY[0x263EFF9A0] dictionary];
  if (a4)
  {
    while (1)
    {
      int v7 = *(unsigned __int8 *)a3;
      unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      int v9 = *((unsigned __int8 *)a3 + 3);
      int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
      uint64_t v11 = bswap32(*((_DWORD *)a3 + 1));
      uint64_t v12 = a3 + 8;
      if (v10 <= 1634030674) {
        break;
      }
      if (v10 == 1634030675)
      {
        uint64_t v13 = [NSNumber numberWithUnsignedLongLong:bswap32(*((_DWORD *)a3 + 2))];
        uint64_t v14 = v6;
        id v15 = v13;
        uint64_t v16 = @"com.apple.itunes.drm-token-request-status";
LABEL_12:
        [v14 setObject:v15 forKey:v16];
        goto LABEL_13;
      }
      if (v10 != 1836282996) {
        goto LABEL_8;
      }
LABEL_14:
      a3 = &v12[v11];
      a4 = a4 - 8 - v11;
      if (!a4) {
        goto LABEL_15;
      }
    }
    if (v10 == 1634026578)
    {
      uint64_t v13 = [NSNumber numberWithUnsignedLongLong:(((unint64_t)*((unsigned __int8 *)a3 + 8) << 56) | ((unint64_t)*((unsigned __int8 *)a3 + 9) << 48) | ((unint64_t)*((unsigned __int8 *)a3 + 10) << 40) | ((unint64_t)*((unsigned __int8 *)a3 + 11) << 32) | ((unint64_t)*((unsigned __int8 *)a3 + 12) << 24) | ((unint64_t)*((unsigned __int8 *)a3 + 13) << 16) | ((unint64_t)*((unsigned __int8 *)a3 + 14) << 8))+ *((unsigned __int8 *)a3 + 15)];
      uint64_t v14 = v6;
      id v15 = v13;
      uint64_t v16 = @"com.apple.itunes.drm-user-id";
      goto LABEL_12;
    }
    if (v10 == 1634030660)
    {
      uint64_t v13 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 + 8 length:v11 freeWhenDone:0];
      uint64_t v14 = v6;
      id v15 = v13;
      uint64_t v16 = @"com.apple.itunes.drm-token-data";
      goto LABEL_12;
    }
LABEL_8:
    uint64_t v13 = os_log_create("com.apple.amp.HomeSharing", "Library");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v18[0] = 67109888;
      v18[1] = v7;
      __int16 v19 = 1024;
      unsigned int v20 = HIWORD(v8);
      __int16 v21 = 1024;
      unsigned int v22 = v10 >> 8;
      __int16 v23 = 1024;
      int v24 = v9;
      _os_log_impl(&dword_2152C7000, v13, OS_LOG_TYPE_DEBUG, "Unhandled code in authorized account token response: %c%c%c%c", (uint8_t *)v18, 0x1Au);
    }
LABEL_13:

    goto LABEL_14;
  }
LABEL_15:
  return v6;
}

+ (id)_parseUpdateResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (!a4) {
    goto LABEL_14;
  }
  unint64_t v4 = a4;
  uint64_t v6 = 0;
  do
  {
    int v7 = *(unsigned __int8 *)a3;
    unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    int v9 = *((unsigned __int8 *)a3 + 3);
    unsigned int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
    unsigned int v11 = *((_DWORD *)a3 + 1);
    if (v10 == 1836282996) {
      goto LABEL_11;
    }
    if (v10 == 1836413810)
    {
      uint64_t v6 = bswap32(*((_DWORD *)a3 + 2));
      uint64_t v12 = os_log_create("com.apple.amp.HomeSharing", "Library");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v21 = v6;
        uint64_t v13 = v12;
        os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
        id v15 = "Server revision number: %d";
        uint32_t v16 = 8;
LABEL_9:
        _os_log_impl(&dword_2152C7000, v13, v14, v15, buf, v16);
      }
    }
    else
    {
      uint64_t v12 = os_log_create("com.apple.amp.HomeSharing", "Library");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109888;
        int v21 = v7;
        __int16 v22 = 1024;
        unsigned int v23 = HIWORD(v8);
        __int16 v24 = 1024;
        unsigned int v25 = v10 >> 8;
        __int16 v26 = 1024;
        int v27 = v9;
        uint64_t v13 = v12;
        os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
        id v15 = "Unhandled code in update response: %c%c%c%c";
        uint32_t v16 = 26;
        goto LABEL_9;
      }
    }

LABEL_11:
    uint64_t v17 = bswap32(v11);
    a3 += v17 + 8;
    unint64_t v4 = v4 - 8 - v17;
  }
  while (v4);
  if (v6)
  {
    __int16 v18 = [NSNumber numberWithUnsignedInt:v6];
    goto LABEL_15;
  }
LABEL_14:
  __int16 v18 = 0;
LABEL_15:
  return v18;
}

+ (id)_parseLoginResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (!a4) {
    goto LABEL_14;
  }
  unint64_t v4 = a4;
  uint64_t v6 = 0;
  do
  {
    int v7 = *(unsigned __int8 *)a3;
    unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    int v9 = *((unsigned __int8 *)a3 + 3);
    unsigned int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
    unsigned int v11 = *((_DWORD *)a3 + 1);
    if (v10 == 1836282996) {
      goto LABEL_11;
    }
    if (v10 == 1835821412)
    {
      uint64_t v6 = bswap32(*((_DWORD *)a3 + 2));
      uint64_t v12 = os_log_create("com.apple.amp.HomeSharing", "Library");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)int v21 = v6;
        uint64_t v13 = v12;
        os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
        id v15 = "Login session ID: %lu";
        uint32_t v16 = 12;
LABEL_9:
        _os_log_impl(&dword_2152C7000, v13, v14, v15, buf, v16);
      }
    }
    else
    {
      uint64_t v12 = os_log_create("com.apple.amp.HomeSharing", "Library");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)int v21 = v7;
        *(_WORD *)&v21[4] = 1024;
        *(_DWORD *)&v21[6] = HIWORD(v8);
        __int16 v22 = 1024;
        unsigned int v23 = v10 >> 8;
        __int16 v24 = 1024;
        int v25 = v9;
        uint64_t v13 = v12;
        os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
        id v15 = "Unhandled code in login response: %c%c%c%c";
        uint32_t v16 = 26;
        goto LABEL_9;
      }
    }

LABEL_11:
    uint64_t v17 = bswap32(v11);
    a3 += v17 + 8;
    unint64_t v4 = v4 - 8 - v17;
  }
  while (v4);
  if (v6)
  {
    __int16 v18 = [NSNumber numberWithUnsignedInteger:v6];
    goto LABEL_15;
  }
LABEL_14:
  __int16 v18 = 0;
LABEL_15:
  return v18;
}

+ (id)_parseResponseCode:(unsigned int)a3 bytes:(const char *)a4 length:(unint64_t)a5 usingHandler:(id)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v10 = a6;
  if ((int)a3 <= 1634757752)
  {
    if ((int)a3 > 1634026304)
    {
      if ((int)a3 <= 1634027330)
      {
        if (a3 == 1634026305)
        {
          uint64_t v11 = [a1 _parseCloudArtworkInfoResponseWithBytes:a4 length:a5];
          goto LABEL_34;
        }
        if (a3 == 1634026348)
        {
          uint64_t v11 = [a1 _parseCloudLyricsInfoResponseWithBytes:a4 length:a5];
          goto LABEL_34;
        }
      }
      else
      {
        switch(a3)
        {
          case 0x61654743u:
            goto LABEL_33;
          case 0x6165544Bu:
            uint64_t v11 = [a1 _parseAuthorizedAccountTokenWithBytes:a4 length:a5];
            goto LABEL_34;
          case 0x616A4C72u:
            uint64_t v11 = [a1 _parseBulkCloudLyricsInfoResponseWithBytes:a4 length:a5];
            goto LABEL_34;
        }
      }
      goto LABEL_46;
    }
    if ((int)a3 > 1634025792)
    {
      if (a3 != 1634025793 && a3 != 1634025813)
      {
        if (a3 == 1634026066)
        {
          uint64_t v11 = [a1 _parseBulkCloudArtworkInfoResponseWithBytes:a4 length:a5];
          goto LABEL_34;
        }
        goto LABEL_46;
      }
      goto LABEL_33;
    }
    if (a3 == 1633841775) {
      goto LABEL_33;
    }
    int v12 = 1633968755;
LABEL_32:
    if (a3 == v12) {
      goto LABEL_33;
    }
    goto LABEL_46;
  }
  if ((int)a3 <= 1668117363)
  {
    if ((int)a3 > 1635148897)
    {
      switch(a3)
      {
        case 0x61766462u:
          goto LABEL_33;
        case 0x63616369u:
          uint64_t v11 = [a1 _parseControlInterfacesResponseWithBytes:a4 length:a5];
          goto LABEL_34;
        case 0x636D6370u:
          uint64_t v11 = [a1 _parseControlPromptResponseWithBytes:a4 length:a5];
          goto LABEL_34;
      }
LABEL_46:
      id v15 = os_log_create("com.apple.amp.HomeSharing", "Library");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16[0] = 67109888;
        v16[1] = HIBYTE(a3);
        __int16 v17 = 1024;
        unsigned int v18 = HIWORD(a3);
        __int16 v19 = 1024;
        unsigned int v20 = a3 >> 8;
        __int16 v21 = 1024;
        int v22 = a3;
        _os_log_impl(&dword_2152C7000, v15, OS_LOG_TYPE_DEBUG, "Unhandled code in response: %c%c%c%c", (uint8_t *)v16, 0x1Au);
      }

      goto LABEL_49;
    }
    if (a3 == 1634757753) {
      goto LABEL_33;
    }
    int v12 = 1634759535;
    goto LABEL_32;
  }
  if ((int)a3 <= 1835364977)
  {
    if (a3 == 1668117364)
    {
      uint64_t v11 = [a1 _parsePlayStatusResponseWithBytes:a4 length:a5];
      goto LABEL_34;
    }
    if (a3 != 1835360880)
    {
      if (a3 == 1835361379)
      {
        uint64_t v11 = [a1 _parseEditCommandResponseWithBytes:a4 length:a5];
LABEL_34:
        uint64_t v13 = (void *)v11;
        goto LABEL_35;
      }
      goto LABEL_46;
    }
LABEL_33:
    uint64_t v11 = [a1 _parseItemsResponseWithBytes:a4 length:a5 usingHandler:v10];
    goto LABEL_34;
  }
  if (a3 != 1835364978)
  {
    if (a3 == 1836413028)
    {
      uint64_t v11 = [a1 _parseUpdateResponseWithBytes:a4 length:a5];
      goto LABEL_34;
    }
    if (a3 == 1835822951)
    {
      uint64_t v11 = [a1 _parseLoginResponseWithBytes:a4 length:a5];
      goto LABEL_34;
    }
    goto LABEL_46;
  }
LABEL_49:
  uint64_t v13 = 0;
LABEL_35:

  return v13;
}

+ (unint64_t)_parseItemPropertyCountWithBytes:(const char *)a3 length:(unint64_t)a4
{
  unint64_t result = 0;
  if (a4)
  {
    do
    {
      uint64_t v5 = bswap32(*((_DWORD *)a3 + 1));
      ++result;
      a3 += v5 + 8;
      uint64_t v6 = a4 - v5;
      a4 = v6 - 8;
    }
    while (v6 != 8);
  }
  return result;
}

+ (void)enumerateDeletedItemsInResponseData:(id)a3 usingHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    unint64_t v8 = [v6 length];
    if (v8 >= 9)
    {
      unint64_t v9 = v8;
      id v10 = (unsigned int *)[v6 bytes];
      unsigned int v11 = bswap32(*v10);
      if (v11 == 1634757753 || v11 == 1633968755)
      {
        unint64_t v13 = v9 - 8;
        if (v9 - 8 == bswap32(v10[1]))
        {
          if (v13 < 9)
          {
LABEL_13:
            __int16 v17 = 0;
          }
          else
          {
            os_log_type_t v14 = v10 + 2;
            while (1)
            {
              uint64_t v15 = bswap32(v14[1]);
              uint32_t v16 = v14 + 2;
              if (bswap32(*v14) == 1836409964) {
                break;
              }
              os_log_type_t v14 = (unsigned int *)((char *)v16 + v15);
              unint64_t v13 = v13 - v15 - 8;
              if (v13 <= 8) {
                goto LABEL_13;
              }
            }
            __int16 v17 = [a1 _parseDeletedIDListingWithBytes:v16 length:v15];
          }
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          _DWORD v18[2] = __73__HSResponseDataParser_enumerateDeletedItemsInResponseData_usingHandler___block_invoke;
          v18[3] = &unk_264239C38;
          id v19 = v7;
          [v17 enumerateObjectsUsingBlock:v18];
        }
      }
    }
  }
}

uint64_t __73__HSResponseDataParser_enumerateDeletedItemsInResponseData_usingHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)enumerateItemsInResponseData:(id)a3 usingHandler:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __66__HSResponseDataParser_enumerateItemsInResponseData_usingHandler___block_invoke;
    v9[3] = &unk_264239C10;
    id v11 = a1;
    id v10 = v6;
    id v8 = (id)[a1 enumerateRawItemsInResponseData:a3 usingHandler:v9];
  }
}

uint64_t __66__HSResponseDataParser_enumerateItemsInResponseData_usingHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 40) parseItemWithBytes:a2 length:a3 usingHandler:*(void *)(a1 + 32)];
}

+ (void)parseItemWithBytes:(const char *)a3 length:(unint64_t)a4 usingHandler:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a5)
  {
    id v8 = (void (**)(id, void *, unint64_t, char *))a5;
    unint64_t v9 = [a1 _parseItemPropertyCountWithBytes:a3 length:a4];
    unint64_t v10 = v9;
    if (v9 <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v9;
    }
    int v12 = &v13 - 4 * v11;
    [a1 parseItemWithBytes:a3 length:a4 valuesOut:v12 valuesCapacity:v9];
    HIBYTE(v13) = 0;
    v8[2](v8, v12, v10, (char *)&v13 + 7);
  }
}

+ (unint64_t)parseItemWithBytes:(const char *)a3 length:(unint64_t)a4 valuesOut:(id *)a5 valuesCapacity:(unint64_t)a6
{
  unint64_t result = 0;
  if (a4 && a6)
  {
    unint64_t result = 0;
    p_var2 = &a5->var2;
    while (1)
    {
      unsigned int v9 = *(_DWORD *)a3;
      unsigned int v10 = *((_DWORD *)a3 + 1);
      id v8 = a3 + 8;
      int v11 = bswap32(v9);
      unint64_t v12 = bswap32(v10);
      *((_DWORD *)p_var2 - 4) = v11;
      *(p_var2 - 1) = (unint64_t)v8;
      unint64_t *p_var2 = v12;
      int v13 = 2;
      if (v11 <= 1634358883) {
        break;
      }
      if (v11 > 1634953069)
      {
        if (v11 <= 1634956128)
        {
          if (v11 > 1634954338)
          {
            if (v11 == 1634954339) {
              goto LABEL_70;
            }
            unsigned __int16 v18 = 28789;
          }
          else
          {
            if (v11 == 1634953070) {
              goto LABEL_70;
            }
            unsigned __int16 v18 = 27513;
          }
LABEL_68:
          int v19 = v18 | 0x61730000;
          goto LABEL_69;
        }
        if (v11 > 1634956651)
        {
          if (v11 == 1634956652 || v11 == 1835366516) {
            goto LABEL_70;
          }
          int v19 = 1835626093;
          goto LABEL_69;
        }
        if ((v11 - 1634956129) <= 0x14 && ((1 << (v11 - 97)) & 0x142805) != 0) {
          goto LABEL_70;
        }
      }
      else
      {
        if (v11 <= 1634952044)
        {
          if ((v11 - 1634951521) <= 0x11 && ((1 << (v11 - 97)) & 0x20801) != 0 || v11 == 1634358884) {
            goto LABEL_70;
          }
          int v17 = 1634366060;
LABEL_59:
          if (v11 == v17) {
            goto LABEL_60;
          }
          goto LABEL_73;
        }
        if (v11 > 1634952307)
        {
          if (v11 > 1634952560)
          {
            if (v11 == 1634952561) {
              goto LABEL_70;
            }
            unsigned __int16 v18 = 26221;
          }
          else
          {
            if (v11 == 1634952308) {
              goto LABEL_70;
            }
            unsigned __int16 v18 = 25956;
          }
          goto LABEL_68;
        }
        if ((v11 - 1634952045) <= 7 && ((1 << (v11 - 109)) & 0x8B) != 0) {
          goto LABEL_70;
        }
      }
LABEL_73:
      int v13 = 1;
LABEL_70:
      *((_DWORD *)p_var2 + 2) = v13;
      ++result;
      a4 = a4 - 8 - v12;
      if (a4)
      {
        a3 = &v8[v12];
        p_var2 += 4;
        if (result < a6) {
          continue;
        }
      }
      return result;
    }
    if (v11 > 1634030159)
    {
      if (v11 > 1634036069)
      {
        if (v11 <= 1634354516)
        {
          if (v11 == 1634036070) {
            goto LABEL_60;
          }
          if (v11 == 1634037878) {
            goto LABEL_70;
          }
          int v19 = 1634169456;
        }
        else
        {
          if (v11 > 1634356832)
          {
            if (v11 == 1634356833) {
              goto LABEL_70;
            }
            unsigned __int16 v15 = 20565;
          }
          else
          {
            if (v11 == 1634354517) {
              goto LABEL_70;
            }
            unsigned __int16 v15 = 17779;
          }
          int v19 = v15 | 0x616A0000;
        }
        goto LABEL_69;
      }
      if (v11 <= 1634031683)
      {
        if (v11 == 1634030160 || v11 == 1634030192) {
          goto LABEL_70;
        }
        unsigned __int16 v16 = 21326;
        goto LABEL_54;
      }
      if (v11 == 1634031684 || v11 == 1634034544) {
        goto LABEL_70;
      }
      unsigned __int16 v14 = 26220;
    }
    else
    {
      if (v11 > 1634026829)
      {
        if (v11 > 1634029133)
        {
          if (v11 == 1634029134) {
            goto LABEL_70;
          }
          if (v11 == 1634029636)
          {
LABEL_60:
            int v13 = 3;
            goto LABEL_70;
          }
          unsigned __int16 v16 = 20580;
        }
        else
        {
          if (v11 == 1634026830) {
            goto LABEL_70;
          }
          if (v11 == 1634027347) {
            goto LABEL_60;
          }
          unsigned __int16 v16 = 19800;
        }
LABEL_54:
        int v19 = v16 | 0x61650000;
LABEL_69:
        if (v11 == v19) {
          goto LABEL_70;
        }
        goto LABEL_73;
      }
      if ((v11 - 1634026308) <= 0x31)
      {
        if (((1 << (v11 - 68)) & 0x3400000014000) != 0) {
          goto LABEL_70;
        }
        if (v11 == 1634026308) {
          goto LABEL_60;
        }
      }
      unsigned __int16 v14 = 17483;
    }
    int v17 = v14 | 0x61650000;
    goto LABEL_59;
  }
  return result;
}

+ (id)enumerateRawItemsInResponseData:(id)a3 usingHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 length];
  unint64_t v9 = v8 - 8;
  if (v8 >= 8)
  {
    unint64_t v10 = v8;
    int v11 = (unsigned int *)[v6 bytes];
    uint64_t v12 = bswap32(*v11);
    uint64_t v13 = bswap32(v11[1]);
    if (v9 == v13)
    {
      unsigned __int16 v14 = [a1 _parseResponseCode:v12 bytes:v11 + 2 length:v13 usingHandler:v7];
      goto LABEL_8;
    }
    unsigned __int16 v15 = os_log_create("com.apple.amp.HomeSharing", "Library");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17[0] = 67109632;
      v17[1] = v12;
      __int16 v18 = 2048;
      unint64_t v19 = v10;
      __int16 v20 = 2048;
      uint64_t v21 = v13;
      _os_log_impl(&dword_2152C7000, v15, OS_LOG_TYPE_ERROR, "Warning: Invalid response data (code: %08x, length: %lu, encodedLength: %lu)", (uint8_t *)v17, 0x1Cu);
    }
  }
  unsigned __int16 v14 = 0;
LABEL_8:

  return v14;
}

+ (id)parseResponseData:(id)a3
{
  return (id)[a1 enumerateRawItemsInResponseData:a3 usingHandler:0];
}

+ (id)parseErrorInResponseData:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [v4 length];
  unint64_t v6 = v5 - 8;
  if (v5 >= 8)
  {
    unint64_t v7 = v5;
    unint64_t v8 = (unsigned int *)[v4 bytes];
    unsigned int v9 = bswap32(*v8);
    uint64_t v10 = bswap32(v8[1]);
    if (v6 == v10)
    {
      if (v9 == 1835364978)
      {
        int v11 = [a1 _parseErrorResponseWithBytes:v8 + 2 length:v10];
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v12 = os_log_create("com.apple.amp.HomeSharing", "Library");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v14[0] = 67109632;
        v14[1] = v9;
        __int16 v15 = 2048;
        unint64_t v16 = v7;
        __int16 v17 = 2048;
        uint64_t v18 = v10;
        _os_log_impl(&dword_2152C7000, v12, OS_LOG_TYPE_ERROR, "Warning: Invalid response data (code: %08x, length: %lu, encodedLength: %lu)", (uint8_t *)v14, 0x1Cu);
      }
    }
  }
  int v11 = 0;
LABEL_9:

  return v11;
}

@end