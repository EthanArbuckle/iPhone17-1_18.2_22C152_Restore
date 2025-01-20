@interface ASASelectorControl
- (NSArray)availableItems;
- (NSArray)currentItems;
- (id)coreAudioClassName;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (id)nameForItem:(unsigned int)a3;
- (unsigned)currentItem;
- (void)setCurrentItem:(unsigned int)a3;
- (void)setCurrentItems:(id)a3;
@end

@implementation ASASelectorControl

- (void)setCurrentItem:(unsigned int)a3
{
  unsigned int v4 = a3;
  if (![(ASAObject *)self setMainGlobalProperty:1935893353 withData:&v4 ofSize:4 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not set current item property\n", v3, 2u);
  }
}

- (unsigned)currentItem
{
  int v5 = 4;
  unsigned int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1935893353 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read current item property\n", v3, 2u);
  }
  return v4;
}

- (NSArray)currentItems
{
  unsigned int v3 = [(ASAObject *)self sizeOfMainGlobalProperty:1935893353 withQualifier:0 ofSize:0];
  unsigned int v15 = v3;
  if (v3 && (size_t v4 = v3, (v5 = (unsigned int *)malloc_type_malloc(v3, 0x3C76B422uLL)) != 0))
  {
    v6 = v5;
    bzero(v5, v4);
    if ([(ASAObject *)self getMainGlobalProperty:1935893353 withData:v6 ofSize:&v15 withQualifier:0 ofSize:0])
    {
      unint64_t v7 = v15;
      v8 = [MEMORY[0x263EFF980] array];
      if (v7 >= 4)
      {
        unint64_t v9 = v7 >> 2;
        v10 = v6;
        do
        {
          unsigned int v11 = *v10++;
          v12 = [NSNumber numberWithUnsignedInt:v11];
          [v8 addObject:v12];

          --v9;
        }
        while (v9);
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        v14[0] = 0;
        _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read current items property\n", (uint8_t *)v14, 2u);
      }
      v8 = 0;
    }
    free(v6);
  }
  else
  {
    v8 = 0;
  }
  return (NSArray *)v8;
}

- (NSArray)availableItems
{
  unsigned int v3 = [(ASAObject *)self sizeOfMainGlobalProperty:1935892841 withQualifier:0 ofSize:0];
  unsigned int v15 = v3;
  if (v3 && (size_t v4 = v3, (v5 = (unsigned int *)malloc_type_malloc(v3, 0x4805635BuLL)) != 0))
  {
    v6 = v5;
    bzero(v5, v4);
    if ([(ASAObject *)self getMainGlobalProperty:1935892841 withData:v6 ofSize:&v15 withQualifier:0 ofSize:0])
    {
      unint64_t v7 = v15;
      v8 = [MEMORY[0x263EFF980] array];
      if (v7 >= 4)
      {
        unint64_t v9 = v7 >> 2;
        v10 = v6;
        do
        {
          unsigned int v11 = *v10++;
          v12 = [NSNumber numberWithUnsignedInt:v11];
          [v8 addObject:v12];

          --v9;
        }
        while (v9);
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        v14[0] = 0;
        _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read available items property\n", (uint8_t *)v14, 2u);
      }
      v8 = 0;
    }
    free(v6);
  }
  else
  {
    v8 = 0;
  }
  return (NSArray *)v8;
}

- (id)nameForItem:(unsigned int)a3
{
  unsigned int v8 = a3;
  int v7 = 8;
  CFTypeRef cf = 0;
  if ([(ASAObject *)self getMainGlobalProperty:1935894894 withData:&cf ofSize:&v7 withQualifier:&v8 ofSize:4])
  {
    if (cf)
    {
      unsigned int v3 = objc_msgSend(NSString, "stringWithString:");
      CFRelease(cf);
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read name for item property\n", v5, 2u);
  }
  unsigned int v3 = 0;
LABEL_7:
  return v3;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)ASASelectorControl;
  int v7 = [(ASAControl *)&v33 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  [v7 appendFormat:@"%@|    Current Item: %u\n", v6, -[ASASelectorControl currentItem](self, "currentItem")];
  [v7 appendFormat:@"%@|    Current Items:\n", v6];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = [(ASASelectorControl *)self currentItems];
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v14 = -[ASASelectorControl nameForItem:](self, "nameForItem:", [v13 unsignedIntValue]);
        [v7 appendFormat:@"%@|        %u: %u \"%@\"\n", v6, v10 + i, objc_msgSend(v13, "unsignedIntValue"), v14];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      uint64_t v10 = (v10 + i);
    }
    while (v9);
  }

  [v7 appendFormat:@"%@|    Available Items:\n", v6];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obja = [(ASASelectorControl *)self availableItems];
  uint64_t v15 = [obja countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(obja);
        }
        v20 = *(void **)(*((void *)&v25 + 1) + 8 * j);
        v21 = -[ASASelectorControl nameForItem:](self, "nameForItem:", [v20 unsignedIntValue]);
        [v7 appendFormat:@"%@|        %u: %u \"%@\"\n", v6, v17 + j, objc_msgSend(v20, "unsignedIntValue"), v21];
      }
      uint64_t v16 = [obja countByEnumeratingWithState:&v25 objects:v34 count:16];
      uint64_t v17 = (v17 + j);
    }
    while (v16);
  }

  return v7;
}

- (id)coreAudioClassName
{
  int v2 = [(ASAObject *)self objectClass];
  unsigned int v3 = @"AudioSelectorControl";
  BOOL v4 = @"AudioDataSourceControl";
  if (v2 != 1685287523) {
    BOOL v4 = @"AudioSelectorControl";
  }
  if (v2 == 1751740518) {
    int v5 = @"AudioHighPassFilterControl";
  }
  else {
    int v5 = v4;
  }
  if (v2 == 1852601964) {
    id v6 = @"AudioLineLevelControl";
  }
  else {
    id v6 = v5;
  }
  if (v2 == 1684370292) {
    unsigned int v3 = @"AudioDataDestinationControl";
  }
  if (v2 == 1668047723) {
    unsigned int v3 = @"AudioClockSourceControl";
  }
  if (v2 <= 1685287522) {
    return v3;
  }
  else {
    return v6;
  }
}

- (void)setCurrentItems:(id)a3
{
  self->_currentItems = (NSArray *)a3;
}

@end