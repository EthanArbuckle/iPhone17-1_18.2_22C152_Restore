@interface NSPathStore2
+ (id)pathStoreWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4;
+ (id)pathWithComponents:(id)a3;
- (BOOL)isAbsolutePath;
- (BOOL)isEqualToString:(id)a3;
- (const)_fastCharacterContents;
- (id)_stringByResolvingSymlinksInPathUsingCache:(BOOL)a3;
- (id)_stringByStandardizingPathUsingCache:(BOOL)a3;
- (id)lastPathComponent;
- (id)pathComponents;
- (id)pathExtension;
- (id)stringByAbbreviatingWithTildeInPath;
- (id)stringByAppendingPathComponent:(id)a3;
- (id)stringByAppendingPathExtension:(id)a3;
- (id)stringByDeletingLastPathComponent;
- (id)stringByDeletingPathExtension;
- (id)stringByExpandingTildeInPath;
- (id)stringByResolvingSymlinksInPath;
- (id)stringByStandardizingPath;
- (unint64_t)hash;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation NSPathStore2

- (unint64_t)length
{
  return (unint64_t)self->_lengthAndRefCount >> 20;
}

- (unint64_t)hash
{
  return CFStringHashCharacters();
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  if (a4.location + a4.length >= ((unint64_t)self->_lengthAndRefCount >> 20) + 1)
  {
    v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: index (%lu) beyond bounds (%d)", _NSMethodExceptionProem((objc_class *)self, a2), a4.location + a4.length, (self->_lengthAndRefCount >> 20) + 1), 0 reason userInfo];
    objc_exception_throw(v4);
  }
  if (a4.length)
  {
    memmove(a3, &self->_characters[a4.location], 2 * a4.length);
  }
}

- (id)_stringByResolvingSymlinksInPathUsingCache:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v16 = (unint64_t)self->_lengthAndRefCount >> 20;
  characters = self->_characters;
  __memmove_chk();
  _NSExpandTildeInPath((uint64_t)v17, &v16);
  _NSResolveSymlinksInPathUsingCache(v17, (uint64_t *)&v16, v3);
  _NSStandardizePathUsingCache(v17, (uint64_t *)&v16, v3);
  unint64_t v7 = (unint64_t)v4->_lengthAndRefCount >> 20;
  if (v7 >= v16) {
    unint64_t v8 = v16;
  }
  else {
    unint64_t v8 = (unint64_t)v4->_lengthAndRefCount >> 20;
  }
  if (v8)
  {
    v9 = v17;
    while (1)
    {
      unsigned int v11 = *characters++;
      unsigned int v10 = v11;
      unsigned int v12 = *v9++;
      BOOL v13 = v10 >= v12;
      BOOL v14 = v10 == v12;
      if (v10 > v12) {
        uint64_t v6 = 1;
      }
      if (!v13) {
        uint64_t v6 = -1;
      }
      if (!v14) {
        break;
      }
      if (!--v8) {
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    uint64_t v6 = v16 < v7;
    if (v16 > v7) {
      return +[NSPathStore2 pathStoreWithCharacters:v17 length:v16];
    }
  }
  if (v6) {
    return +[NSPathStore2 pathStoreWithCharacters:v17 length:v16];
  }
  return v4;
}

- (BOOL)isEqualToString:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (self == a3) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  uint64_t v4 = (uint64_t)self;
  if (object_getClass(a3) == (Class)NSPathStore2)
  {
    unsigned int v9 = *(_DWORD *)(v4 + 8) >> 20;
    unsigned int v10 = *((_DWORD *)a3 + 2) >> 20;
    if (v9 >= v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = v9;
    }
    if (v11)
    {
      unsigned int v12 = (unsigned __int16 *)(v4 + 12);
      BOOL v13 = (unsigned __int16 *)((char *)a3 + 12);
      while (1)
      {
        unsigned int v15 = *v12++;
        unsigned int v14 = v15;
        unsigned int v16 = *v13++;
        BOOL v17 = v14 >= v16;
        BOOL v18 = v14 == v16;
        uint64_t v19 = v14 > v16 ? 1 : v4;
        uint64_t v4 = v17 ? v19 : -1;
        if (!v18) {
          break;
        }
        if (!--v11) {
          goto LABEL_22;
        }
      }
    }
    else
    {
LABEL_22:
      BOOL v17 = v9 >= v10;
      BOOL v20 = v9 > v10;
      if (v17) {
        uint64_t v4 = v20;
      }
      else {
        uint64_t v4 = -1;
      }
    }
  }
  else
  {
    uint64_t v5 = [a3 length];
    unint64_t v6 = v5;
    if (v5 >= 1041) {
      unint64_t v7 = (unsigned __int16 *)malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
    }
    else {
      unint64_t v7 = (unsigned __int16 *)v33;
    }
    objc_msgSend(a3, "getCharacters:range:", v7, 0, v6);
    unint64_t v21 = (unint64_t)*(unsigned int *)(v4 + 8) >> 20;
    if (v21 >= v6) {
      unint64_t v22 = v6;
    }
    else {
      unint64_t v22 = (unint64_t)*(unsigned int *)(v4 + 8) >> 20;
    }
    if (v22)
    {
      v23 = (unsigned __int16 *)(v4 + 12);
      v24 = v7;
      while (1)
      {
        unsigned int v26 = *v23++;
        unsigned int v25 = v26;
        unsigned int v27 = *v24++;
        BOOL v28 = v25 >= v27;
        BOOL v29 = v25 == v27;
        uint64_t v30 = v25 > v27 ? 1 : v4;
        uint64_t v4 = v28 ? v30 : -1;
        if (!v29) {
          break;
        }
        if (!--v22) {
          goto LABEL_40;
        }
      }
    }
    else
    {
LABEL_40:
      BOOL v31 = v6 > v21;
      BOOL v32 = v6 < v21;
      if (v31) {
        uint64_t v4 = -1;
      }
      else {
        uint64_t v4 = v32;
      }
    }
    if (v7 != (unsigned __int16 *)v33) {
      free(v7);
    }
  }
  return v4 == 0;
}

- (const)_fastCharacterContents
{
  return self->_characters;
}

- (id)stringByAppendingPathExtension:(id)a3
{
  uint64_t v4 = self;
  v33[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    BOOL v31 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v31);
  }
  uint64_t v6 = [a3 length];
  if (v6)
  {
    unint64_t v7 = v6;
    v32[1] = v32;
    unint64_t v8 = (unint64_t)v4->_lengthAndRefCount >> 20;
    unint64_t v9 = v6 + v8 + 1;
    unint64_t v10 = MEMORY[0x1F4188790](v6);
    unsigned int v12 = (_WORD *)((char *)v32 - v11);
    if (v10 > 0x100)
    {
      BOOL v13 = malloc_type_malloc(2 * v10, 0x1000040BDFB0063uLL);
      unsigned int v12 = v13;
    }
    else
    {
      bzero((char *)v32 - v11, 2 * v10);
    }
    MEMORY[0x1F4188790](v13);
    BOOL v18 = (char *)v32 - v17;
    if (v9 > 0x100) {
      BOOL v18 = (char *)malloc_type_malloc(2 * v16, 0x1000040BDFB0063uLL);
    }
    else {
      bzero((char *)v32 - v17, 2 * v16);
    }
    objc_msgSend(a3, "getCharacters:range:", v12, 0, v7);
    characters = v4->_characters;
    memmove(v18, v4->_characters, 2 * v8);
    v33[0] = v8;
    if (_NSAppendPathExtension((unsigned __int16 *)v18, v33, v9, v12, v7))
    {
      _NSTransmutePathSlashes(v18, v33);
      unint64_t v21 = v33[0];
      if (v33[0] >= 2 && *(_WORD *)&v18[2 * v33[0] - 2] == 47)
      {
        while (v21 > 2)
        {
          uint64_t v20 = *(unsigned __int16 *)&v18[2 * v21-- - 4];
          if (v20 != 47) {
            goto LABEL_21;
          }
        }
        unint64_t v21 = 1;
      }
LABEL_21:
      unint64_t v23 = (unint64_t)v4->_lengthAndRefCount >> 20;
      if (v23 >= v21) {
        unint64_t v24 = v21;
      }
      else {
        unint64_t v24 = (unint64_t)v4->_lengthAndRefCount >> 20;
      }
      if (v24)
      {
        unsigned int v25 = v18;
        while (1)
        {
          unsigned int v27 = *characters++;
          unsigned int v26 = v27;
          unsigned int v28 = *(unsigned __int16 *)v25;
          v25 += 2;
          BOOL v29 = v26 >= v28;
          BOOL v30 = v26 == v28;
          if (v26 > v28) {
            uint64_t v20 = 1;
          }
          if (!v29) {
            uint64_t v20 = -1;
          }
          if (!v30) {
            break;
          }
          if (!--v24) {
            goto LABEL_33;
          }
        }
      }
      else
      {
LABEL_33:
        uint64_t v20 = v21 < v23;
        if (v21 > v23)
        {
LABEL_35:
          uint64_t v4 = +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v18);
          goto LABEL_36;
        }
      }
      if (v20) {
        goto LABEL_35;
      }
    }
    else
    {
      unint64_t v22 = _NSMethodExceptionProem((objc_class *)v4, a2);
      NSLog((NSString *)@"%@: cannot append extension '%@' to path '%@'", v22, a3, v4);
      uint64_t v4 = 0;
    }
LABEL_36:
    if (v7 >= 0x101) {
      free(v12);
    }
    if (v9 >= 0x101) {
      free(v18);
    }
    return v4;
  }
  id v14 = [(NSPathStore2 *)v4 copy];

  return v14;
}

- (id)lastPathComponent
{
  unint64_t v2 = *((unsigned int *)self + 2);
  if (v2 >= 0x200000)
  {
    uint64_t v3 = 0;
    unint64_t v4 = v2 >> 20;
    uint64_t v5 = (char *)self + 2 * v4 + 12;
    unint64_t v6 = v4 - 1;
    while (v6 != v3)
    {
      int v7 = *((unsigned __int16 *)v5 - 2);
      v5 -= 2;
      ++v3;
      if (v7 == 47) {
        return +[NSPathStore2 pathStoreWithCharacters:v5 length:v3];
      }
    }
  }
  return self;
}

+ (id)pathWithComponents:(id)a3
{
  v46 = (objc_class *)a1;
  v47 = a2;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (!a3 || (_NSIsNSArray() & 1) == 0)
  {
    v38 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: components argument is not an array", _NSMethodExceptionProem(v46, v47)), 0 reason userInfo];
    objc_exception_throw(v38);
  }
  if (![a3 count]) {
    return &stru_1ECA5C228;
  }
  unint64_t v4 = [a3 count];
  unint64_t v5 = v4;
  if (v4 >> 60)
  {
    CFStringRef v39 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v4);
    v40 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v39 userInfo:0];
    CFRelease(v39);
    objc_exception_throw(v40);
  }
  if (v4 <= 1) {
    unint64_t v4 = 1;
  }
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  unint64_t v8 = (char *)&v41 - v7;
  v49[1] = 0;
  size_t v9 = 8 * v6;
  v44 = &v41;
  id v42 = a3;
  if (v5 >= 0x101)
  {
    unint64_t v8 = (char *)_CFCreateArrayStorage();
    unint64_t v10 = (char *)malloc_type_malloc(v9, 0x100004000313F17uLL);
    v49[0] = 0;
    v45 = v8;
  }
  else
  {
    MEMORY[0x1F4188790](v6);
    unint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v10, v9);
    v49[0] = 0;
    if (!v5)
    {
      int v17 = 0;
      v45 = 0;
      unint64_t v14 = 0;
      goto LABEL_17;
    }
    v45 = 0;
  }
  uint64_t v13 = 0;
  unint64_t v14 = 0;
  uint64_t v15 = 0;
  do
  {
    uint64_t v16 = (void *)[a3 objectAtIndexedSubscript:v13];
    *(void *)&v8[8 * v13] = v16;
    uint64_t v11 = [v16 length];
    *(void *)&v10[8 * v13] = v11;
    if ((uint64_t)v14 <= v11) {
      unint64_t v14 = v11;
    }
    v15 += v11;
    ++v13;
  }
  while (v5 != v13);
  int v17 = 1;
LABEL_17:
  MEMORY[0x1F4188790](v11);
  uint64_t v20 = (unsigned __int16 *)((char *)&v41 - v19);
  unint64_t v48 = v21;
  if (v21 >= 0x101)
  {
    unint64_t v22 = (unsigned __int16 *)malloc_type_malloc(2 * v18, 0x1000040BDFB0063uLL);
    uint64_t v20 = v22;
  }
  else
  {
    bzero((char *)&v41 - v19, 2 * v18);
  }
  MEMORY[0x1F4188790](v22);
  unsigned int v25 = (char *)&v41 - v24;
  v43 = &v41;
  if (v14 >= 0x101)
  {
    unsigned int v25 = (char *)malloc_type_malloc(2 * v23, 0x1000040BDFB0063uLL);
    if (!v17) {
      goto LABEL_36;
    }
  }
  else
  {
    bzero((char *)&v41 - v24, 2 * v23);
    if (!v17) {
      goto LABEL_36;
    }
  }
  uint64_t v26 = 0;
  do
  {
    objc_msgSend(*(id *)&v8[8 * v26], "getCharacters:range:", v25, 0, *(void *)&v10[8 * v26]);
    if (*(void *)&v10[8 * v26] + v49[0] >= 1019)
    {
      _NSTransmutePathSlashes(v20, v49);
      unint64_t v27 = v49[0];
      if (v49[0] >= 2)
      {
        for (int i = v20[v49[0] - 1]; i == 47; int i = v20[v27-- - 2])
        {
          if (v27 <= 2)
          {
            unint64_t v27 = 1;
            break;
          }
        }
        v49[0] = v27;
      }
    }
    if ((_NSAppendPathComponent(v20, v49, v48, v25, *(void *)&v10[8 * v26]) & 1) == 0)
    {
      BOOL v29 = _NSMethodExceptionProem(v46, v47);
      NSLog((NSString *)@"%@: cannot append path '%@' to path '%@'", v29, *(void *)&v8[8 * v26], +[NSString stringWithCharacters:v20 length:v49[0]]);
    }
    ++v26;
  }
  while (v26 != v5);
LABEL_36:
  if (v14 >= 0x101) {
    free(v25);
  }
  _NSTransmutePathSlashes(v20, v49);
  uint64_t v30 = v49[0];
  if (v49[0] < 2) {
    goto LABEL_45;
  }
  if (v20[v49[0] - 1] == 47)
  {
    do
    {
      if ((unint64_t)v30 <= 2)
      {
        uint64_t v32 = 0;
        uint64_t v30 = 1;
        v49[0] = 1;
        goto LABEL_50;
      }
      int v31 = v20[v30-- - 2];
    }
    while (v31 == 47);
    v49[0] = v30;
    if (v30 < 2) {
      goto LABEL_45;
    }
  }
  if (*v20 == 92) {
    uint64_t v32 = 2 * (v20[1] == 92);
  }
  else {
LABEL_45:
  }
    uint64_t v32 = 0;
  if (v32 < v30)
  {
LABEL_50:
    if (!v20[v32])
    {
LABEL_54:
      uint64_t v34 = _NSOSLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        id v36 = v42;
        uint64_t v37 = [v42 valueForKey:@"length"];
        *(_DWORD *)buf = 138478083;
        id v51 = v36;
        __int16 v52 = 2112;
        uint64_t v53 = v37;
        _os_log_fault_impl(&dword_181795000, v34, OS_LOG_TYPE_FAULT, "Creating path from components (%{private}@, lengths: %@) resulted in an embedded NUL character", buf, 0x16u);
      }
      id v12 = 0;
      goto LABEL_57;
    }
    while (v30 - 1 != v32)
    {
      if (!v20[++v32])
      {
        if (v32 >= v30) {
          break;
        }
        goto LABEL_54;
      }
    }
  }
  id v12 = +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v20);
LABEL_57:
  if (v48 >= 0x101) {
    free(v20);
  }
  if (v5 >= 0x101) {
    free(v10);
  }
  free(v45);
  return v12;
}

- (id)stringByAppendingPathComponent:(id)a3
{
  uint64_t v3 = self;
  v36[260] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return v3;
  }
  unint64_t v6 = (unint64_t)self->_lengthAndRefCount >> 20;
  Class = (__objc2_class *)object_getClass(a3);
  if (Class == NSPathStore2)
  {
    BOOL v25 = 0;
    unint64_t v9 = (unint64_t)*((unsigned int *)a3 + 2) >> 20;
    unint64_t v10 = (char *)a3 + 12;
  }
  else
  {
    uint64_t v8 = [a3 length];
    unint64_t v9 = v8;
    unint64_t v10 = (char *)v36;
    if (v8 >= 1041) {
      unint64_t v10 = (char *)malloc_type_malloc(2 * v8, 0x1000040BDFB0063uLL);
    }
    BOOL v25 = v10 != (char *)v36;
    Class = (__objc2_class *)objc_msgSend(a3, "getCharacters:range:", v10, 0, v9);
  }
  uint64_t v26 = v24;
  uint64_t v27 = v6;
  unint64_t v11 = v6 + v9 + 1;
  MEMORY[0x1F4188790](Class);
  unint64_t v14 = &v24[-v13];
  if (v11 > 0x100) {
    unint64_t v14 = malloc_type_malloc(2 * v12, 0x1000040BDFB0063uLL);
  }
  else {
    bzero(&v24[-v13], 2 * v12);
  }
  memmove(v14, v3->_characters, 2 * v6);
  if ((_NSAppendPathComponent(v14, &v27, v6 + v9 + 1, v10, v9) & 1) == 0)
  {
    uint64_t v18 = _NSMethodExceptionProem((objc_class *)v3, a2);
    NSLog((NSString *)@"%@: cannot append path '%@' to path '%@'", v18, a3, v3);
    return 0;
  }
  _NSTransmutePathSlashes(v14, &v27);
  uint64_t v15 = v27;
  if (v27 < 2) {
    goto LABEL_19;
  }
  if (v14[v27 - 1] == 47)
  {
    do
    {
      if ((unint64_t)v15 <= 2)
      {
        uint64_t v17 = 0;
        uint64_t v15 = 1;
        uint64_t v27 = 1;
        goto LABEL_26;
      }
      int v16 = (unsigned __int16)v14[v15-- - 2];
    }
    while (v16 == 47);
    uint64_t v27 = v15;
    if (v15 < 2) {
      goto LABEL_19;
    }
  }
  if (*v14 == 92) {
    uint64_t v17 = 2 * (v14[1] == 92);
  }
  else {
LABEL_19:
  }
    uint64_t v17 = 0;
  if (v17 >= v15) {
    goto LABEL_21;
  }
LABEL_26:
  if (!v14[v17])
  {
LABEL_30:
    uint64_t v20 = _NSOSLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      uint64_t v22 = [a3 length];
      uint64_t v23 = [(NSPathStore2 *)v3 length];
      int v28 = 138478595;
      id v29 = a3;
      __int16 v30 = 2048;
      uint64_t v31 = v22;
      __int16 v32 = 2113;
      v33 = v3;
      __int16 v34 = 2048;
      uint64_t v35 = v23;
      _os_log_fault_impl(&dword_181795000, v20, OS_LOG_TYPE_FAULT, "Appending path component %{private}@ (length: %lu) to string %{private}@ (length: %lu) resulted in an embedded NUL character", (uint8_t *)&v28, 0x2Au);
    }
    return 0;
  }
  while (v15 - 1 != v17)
  {
    if (!v14[++v17])
    {
      if (v17 >= v15) {
        break;
      }
      goto LABEL_30;
    }
  }
LABEL_21:
  if (v25)
  {
    free(v10);
    uint64_t v15 = v27;
  }
  uint64_t v3 = +[NSPathStore2 pathStoreWithCharacters:v14 length:v15];
  if (v11 >= 0x101) {
    free(v14);
  }
  return v3;
}

+ (id)pathStoreWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  unint64_t v4 = a4;
  if (a4 > 0x400)
  {
    return +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:");
  }
  else
  {
    unint64_t v6 = (objc_class *)self;
    uint64_t v7 = NSAllocateObject(v6, 2 * v4, 0);
    uint64_t v8 = v7;
    if (v4)
    {
      memmove(v7 + 3, a3, 2 * v4);
      if (v4 != 1)
      {
        while (*((_WORD *)v8 + v4 + 5) == 47)
        {
          if (v4-- <= 2)
          {
            LODWORD(v4) = 1;
            break;
          }
        }
      }
    }
    v8[2] = v4 << 20;
    return v8;
  }
}

- (id)stringByDeletingLastPathComponent
{
  characters = self->_characters;
  unint64_t lengthAndRefCount = self->_lengthAndRefCount;
  unint64_t v4 = lengthAndRefCount >> 20;
  if (self->_lengthAndRefCount >> 20 == 1)
  {
    uint64_t v5 = *characters == 47;
  }
  else
  {
    if (lengthAndRefCount >= 0x100000)
    {
      while (1)
      {
        unint64_t v6 = v4 - 1;
        if (v4 == 1) {
          break;
        }
        int v7 = *((unsigned __int16 *)&self->_lengthAndRefCount + v4--);
        if (v7 == 47)
        {
          if (v6 == 1) {
            uint64_t v5 = 1;
          }
          else {
            uint64_t v5 = v6 - 1;
          }
          return +[NSPathStore2 pathStoreWithCharacters:characters length:v5];
        }
      }
    }
    uint64_t v5 = 0;
  }
  return +[NSPathStore2 pathStoreWithCharacters:characters length:v5];
}

- (id)pathExtension
{
  unint64_t v3 = (unint64_t)self->_lengthAndRefCount >> 20;
  uint64_t v4 = _NSStartOfPathExtension((uint64_t)self->_characters, v3);
  if (v4 < 1) {
    return &stru_1ECA5C228;
  }

  return -[NSString substringWithRange:](self, "substringWithRange:", v4 + 1, ~v4 + v3);
}

- (id)stringByDeletingPathExtension
{
  characters = self->_characters;
  unint64_t v3 = (unint64_t)self->_lengthAndRefCount >> 20;
  uint64_t v4 = _NSStartOfPathExtension((uint64_t)self->_characters, v3);
  if (v4 <= 0) {
    unint64_t v5 = v3;
  }
  else {
    unint64_t v5 = v4;
  }

  return +[NSPathStore2 pathStoreWithCharacters:characters length:v5];
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  if (a3 >= (unint64_t)self->_lengthAndRefCount >> 20)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: index (%lu) beyond bounds (%d)", _NSMethodExceptionProem((objc_class *)self, a2), a3, self->_lengthAndRefCount >> 20), 0 reason userInfo];
    objc_exception_throw(v4);
  }
  return self->_characters[a3];
}

- (BOOL)isAbsolutePath
{
  if (self->_lengthAndRefCount < 0x100000) {
    return 0;
  }
  int v3 = self->_characters[0];
  return v3 == 126 || v3 == 47;
}

- (id)stringByStandardizingPath
{
  return [(NSPathStore2 *)self _stringByStandardizingPathUsingCache:0];
}

- (id)_stringByStandardizingPathUsingCache:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v16 = (unint64_t)self->_lengthAndRefCount >> 20;
  characters = self->_characters;
  __memmove_chk();
  _NSExpandTildeInPath((uint64_t)v17, &v16);
  _NSStandardizePathUsingCache(v17, (uint64_t *)&v16, v3);
  unint64_t v7 = (unint64_t)v4->_lengthAndRefCount >> 20;
  if (v7 >= v16) {
    unint64_t v8 = v16;
  }
  else {
    unint64_t v8 = (unint64_t)v4->_lengthAndRefCount >> 20;
  }
  if (v8)
  {
    unint64_t v9 = v17;
    while (1)
    {
      unsigned int v11 = *characters++;
      unsigned int v10 = v11;
      unsigned int v12 = *v9++;
      BOOL v13 = v10 >= v12;
      BOOL v14 = v10 == v12;
      if (v10 > v12) {
        uint64_t v6 = 1;
      }
      if (!v13) {
        uint64_t v6 = -1;
      }
      if (!v14) {
        break;
      }
      if (!--v8) {
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    uint64_t v6 = v16 < v7;
    if (v16 > v7) {
      return +[NSPathStore2 pathStoreWithCharacters:v17 length:v16];
    }
  }
  if (v6) {
    return +[NSPathStore2 pathStoreWithCharacters:v17 length:v16];
  }
  return v4;
}

- (id)stringByResolvingSymlinksInPath
{
  return [(NSPathStore2 *)self _stringByResolvingSymlinksInPathUsingCache:0];
}

- (id)pathComponents
{
  return _NSPathComponents(self->_characters, (unint64_t)self->_lengthAndRefCount >> 20);
}

- (id)stringByExpandingTildeInPath
{
  unint64_t v2 = self;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t v14 = (unint64_t)self->_lengthAndRefCount >> 20;
  characters = self->_characters;
  __memmove_chk();
  _NSExpandTildeInPath((uint64_t)v15, &v14);
  unint64_t v5 = (unint64_t)v2->_lengthAndRefCount >> 20;
  if (v5 >= v14) {
    unint64_t v6 = v14;
  }
  else {
    unint64_t v6 = (unint64_t)v2->_lengthAndRefCount >> 20;
  }
  if (v6)
  {
    unint64_t v7 = (unsigned __int16 *)v15;
    while (1)
    {
      unsigned int v9 = *characters++;
      unsigned int v8 = v9;
      unsigned int v10 = *v7++;
      BOOL v11 = v8 >= v10;
      BOOL v12 = v8 == v10;
      if (v8 > v10) {
        uint64_t v4 = 1;
      }
      if (!v11) {
        uint64_t v4 = -1;
      }
      if (!v12) {
        break;
      }
      if (!--v6) {
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    uint64_t v4 = v14 < v5;
    if (v14 > v5) {
      return +[NSPathStore2 pathStoreWithCharacters:v15 length:v14];
    }
  }
  if (v4) {
    return +[NSPathStore2 pathStoreWithCharacters:v15 length:v14];
  }
  return v2;
}

- (id)stringByAbbreviatingWithTildeInPath
{
  unint64_t v2 = self;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t v14 = (unint64_t)self->_lengthAndRefCount >> 20;
  characters = self->_characters;
  __memmove_chk();
  _NSAbbreviatePathWithTilde(v15, (uint64_t *)&v14);
  unint64_t v5 = (unint64_t)v2->_lengthAndRefCount >> 20;
  if (v5 >= v14) {
    unint64_t v6 = v14;
  }
  else {
    unint64_t v6 = (unint64_t)v2->_lengthAndRefCount >> 20;
  }
  if (v6)
  {
    unint64_t v7 = v15;
    while (1)
    {
      unsigned int v9 = *characters++;
      unsigned int v8 = v9;
      unsigned int v10 = *v7++;
      BOOL v11 = v8 >= v10;
      BOOL v12 = v8 == v10;
      if (v8 > v10) {
        uint64_t v4 = 1;
      }
      if (!v11) {
        uint64_t v4 = -1;
      }
      if (!v12) {
        break;
      }
      if (!--v6) {
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    uint64_t v4 = v14 < v5;
    if (v14 > v5) {
      return +[NSPathStore2 pathStoreWithCharacters:v15 length:v14];
    }
  }
  if (v4) {
    return +[NSPathStore2 pathStoreWithCharacters:v15 length:v14];
  }
  return v2;
}

@end