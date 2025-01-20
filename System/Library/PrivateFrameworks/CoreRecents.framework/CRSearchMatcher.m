@interface CRSearchMatcher
- (BOOL)matches:(id)a3;
- (BOOL)matches:(id)a3 matchType:(int)a4;
- (BOOL)matchesASCIIString:(const char *)a3 matchType:(int)a4;
- (BOOL)matchesUTF8String:(const char *)a3;
- (BOOL)matchesUTF8String:(const char *)a3 matchType:(int)a4;
- (CRSearchMatcher)initWithSearchString:(id)a3;
- (CRSearchMatcher)initWithSearchString:(id)a3 andLocale:(id)a4;
- (CRSearchMatcher)initWithSearchString:(id)a3 andLocale:(id)a4 andOptions:(int)a5;
- (CRSearchMatcher)initWithSearchString:(id)a3 options:(int)a4;
- (void)dealloc;
@end

@implementation CRSearchMatcher

- (BOOL)matchesASCIIString:(const char *)a3 matchType:(int)a4
{
  v7 = [(NSData *)self->_wholeSearchStringData bytes];
  NSUInteger v8 = [(NSData *)self->_wholeSearchStringData length];
  int options = self->_options;
  v10 = &strncasecmp;
  if ((options & 2) == 0) {
    v10 = &_strncmp;
  }
  v23 = v10;
  if ((options & 2) != 0) {
    v11 = (uint64_t (*)(const char *, id))&strcasestr;
  }
  else {
    v11 = (uint64_t (*)(const char *, id))&strstr;
  }
  if (a4 == 4)
  {
    NSUInteger v12 = v8;
    if (strlen(a3) == v8)
    {
      LOBYTE(v13) = ((unsigned int (*)(const char *, const void *, NSUInteger))v23)(a3, v7, v12) == 0;
      return v13;
    }
LABEL_19:
    LOBYTE(v13) = 0;
    return v13;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obj = self->_asciiComponents;
  id v14 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v14) {
    goto LABEL_19;
  }
  uint64_t v15 = *(void *)v31;
LABEL_11:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v31 != v15) {
      objc_enumerationMutation(obj);
    }
    v17 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
    id v18 = [v17 bytes];
    uint64_t v13 = v11(a3, v18);
    if (!v13) {
      return v13;
    }
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    v19 = (char *)[v17 length];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100019530;
    v24[3] = &unk_10002D490;
    int v25 = a4;
    v24[6] = v23;
    v24[7] = v18;
    v24[4] = &v26;
    v24[5] = v19 - 1;
    sub_10001939C((uint64_t)a3, (uint64_t)v24);
    int v20 = *((unsigned __int8 *)v27 + 24);
    _Block_object_dispose(&v26, 8);
    if (!v20) {
      goto LABEL_19;
    }
    if (v14 == (id)++v16)
    {
      id v14 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      LOBYTE(v13) = 1;
      if (v14) {
        goto LABEL_11;
      }
      return v13;
    }
  }
}

- (BOOL)matchesUTF8String:(const char *)a3
{
  return [(CRSearchMatcher *)self matchesUTF8String:a3 matchType:5];
}

- (BOOL)matchesUTF8String:(const char *)a3 matchType:(int)a4
{
  if ((a4 & 0xFFFFFFFD) == 4 || a4 == 5) {
    int v7 = a4;
  }
  else {
    int v7 = 5;
  }
  if (!a3 || !self->_asciiComponents) {
    goto LABEL_14;
  }
  char v8 = 0;
  v9 = a3;
  do
  {
    int v11 = *v9++;
    int v10 = v11;
    if (!(_BYTE)v11) {
      char v8 = 1;
    }
  }
  while (v10 > 0);
  if ((v8 & 1) == 0)
  {
LABEL_14:
    if (v7 == 4)
    {
      wholeSearchStringData = self->_wholeSearchStringData;
      if (wholeSearchStringData)
      {
        uint64_t v13 = [(NSData *)wholeSearchStringData bytes];
        int32_t v14 = [(NSData *)self->_wholeSearchStringData length];
        uint64_t v15 = [(NSData *)self->_context bytes];
        return sub_10001A284(a3, v13, v14, 4, (uint64_t)v15);
      }
    }
    else
    {
      BOOL v17 = [(NSArray *)self->_components count] != 0;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      components = self->_components;
      id v19 = [(NSArray *)components countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (!v19) {
        return v17;
      }
      id v20 = v19;
      uint64_t v21 = *(void *)v24;
LABEL_21:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(components);
        }
        if (!sub_10001A284(a3, (char *)[*(id *)(*((void *)&v23 + 1) + 8 * v22) bytes], (int32_t)objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v22), "length"), v7, (uint64_t)-[NSData bytes](self->_context, "bytes")))break; {
        if (v20 == (id)++v22)
        }
        {
          id v20 = [(NSArray *)components countByEnumeratingWithState:&v23 objects:v27 count:16];
          BOOL v17 = 1;
          if (v20) {
            goto LABEL_21;
          }
          return v17;
        }
      }
    }
    return 0;
  }
  return -[CRSearchMatcher matchesASCIIString:matchType:](self, "matchesASCIIString:matchType:");
}

- (BOOL)matches:(id)a3
{
  id v4 = [a3 UTF8String];
  return [(CRSearchMatcher *)self matchesUTF8String:v4];
}

- (BOOL)matches:(id)a3 matchType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [a3 UTF8String];
  return [(CRSearchMatcher *)self matchesUTF8String:v6 matchType:v4];
}

- (CRSearchMatcher)initWithSearchString:(id)a3 andLocale:(id)a4 andOptions:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v29.receiver = self;
  v29.super_class = (Class)CRSearchMatcher;
  char v8 = [(CRSearchMatcher *)&v29 init];
  v9 = v8;
  if (v8)
  {
    v8->_int options = v5;
    v8->_components = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    int v10 = (char *)[a3 UTF8String];
    if ((v5 & 4) == 0)
    {
      uint64_t v11 = (uint64_t)v10;
      if (v10)
      {
        char v12 = 0;
        uint64_t v13 = v10;
        do
        {
          int v15 = *v13++;
          int v14 = v15;
          if (!(_BYTE)v15) {
            char v12 = 1;
          }
        }
        while (v14 > 0);
        if (v12)
        {
          v9->_asciiComponents = (NSArray *)objc_alloc_init((Class)NSMutableArray);
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_100019AFC;
          v28[3] = &unk_10002D4B8;
          v28[4] = v9;
          sub_10001939C(v11, (uint64_t)v28);
        }
      }
    }
    v9->_wholeSearchStringData = (NSData *)[a3 dataUsingEncoding:4];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v16 = objc_msgSend(a3, "componentsSeparatedByCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet", 0));
    id v17 = [v16 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if ([v21 length]) {
            -[NSArray addObject:](v9->_components, "addObject:", [v21 dataUsingEncoding:4]);
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v18);
    }
    uint64_t v22 = (const void *)sub_10001A760([a4 UTF8String], v5);
    v9->_context = (NSData *)[objc_alloc((Class)NSData) initWithBytesNoCopy:v22 length:malloc_size(v22) freeWhenDone:0];
  }
  return v9;
}

- (CRSearchMatcher)initWithSearchString:(id)a3
{
  return [(CRSearchMatcher *)self initWithSearchString:a3 andLocale:0 andOptions:3];
}

- (CRSearchMatcher)initWithSearchString:(id)a3 andLocale:(id)a4
{
  return [(CRSearchMatcher *)self initWithSearchString:a3 andLocale:a4 andOptions:3];
}

- (CRSearchMatcher)initWithSearchString:(id)a3 options:(int)a4
{
  return [(CRSearchMatcher *)self initWithSearchString:a3 andLocale:0 andOptions:*(void *)&a4];
}

- (void)dealloc
{
  v3 = [(NSData *)self->_context bytes];
  sub_10001A764(v3, v4);

  v5.receiver = self;
  v5.super_class = (Class)CRSearchMatcher;
  [(CRSearchMatcher *)&v5 dealloc];
}

@end