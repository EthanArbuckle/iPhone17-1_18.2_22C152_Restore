@interface NSKeyValueObservationInfo
- (BOOL)containsOnlyInternalObservationHelpers;
- (BOOL)isEqual:(id)a3;
- (id)_copyByAddingObservance:(id)a3;
- (id)_initWithObservances:(id *)a3 count:(unint64_t)a4 hashValue:(unint64_t)a5;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation NSKeyValueObservationInfo

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueObservationInfo;
  [(NSKeyValueObservationInfo *)&v3 dealloc];
}

- (id)_copyByAddingObservance:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v5 = objc_alloc_init(NSKeyValueObservationInfo);
  NSUInteger v6 = [(NSArray *)self->_observances count];
  unint64_t v7 = v6;
  if (a3)
  {
    int v8 = *((unsigned char *)a3 + 40) & 0x20;
    uint64_t v9 = 8;
    if ((*((unsigned char *)a3 + 40) & 0x20) == 0) {
      uint64_t v9 = 32;
    }
    uint64_t v10 = *(void *)((char *)a3 + v9);
  }
  else
  {
    uint64_t v10 = 0;
    int v8 = MEMORY[0x28] & 0x20;
  }
  long long v11 = *((_OWORD *)a3 + 1);
  if (v8) {
    uint64_t v12 = *((void *)a3 + 4);
  }
  else {
    uint64_t v12 = 0;
  }
  LODWORD(v13) = 0;
  unint64_t cachedHash = self->_cachedHash;
  uint64_t v31 = v10;
  long long v32 = v11;
  uint64_t v33 = v12;
  v15 = (unsigned __int8 *)&v31 + 3;
  for (unint64_t i = 36; i > 7; i -= 4)
  {
    unsigned int v17 = *(v15 - 3) + 16 * v13;
    unsigned int v18 = *(v15 - 2) + 16 * (v17 ^ (16 * (v17 >> 28)));
    unsigned int v19 = *(v15 - 1) + 16 * (v18 ^ (16 * (v18 >> 28)));
    int v20 = *v15;
    v15 += 4;
    int v21 = v20 + 16 * (v19 ^ (16 * (v19 >> 28)));
    unint64_t v13 = (v21 ^ ((v21 & 0xF0000000) >> 24)) & ~(v21 & 0xF0000000);
  }
  v5->_unint64_t cachedHash = ((v13 << (v6 & 0x3F)) | (v13 >> (v6 & 0x3F))) ^ cachedHash;
  NSUInteger v22 = v6 + 1;
  if ((v6 + 1) >> 60)
  {
    CFStringRef v29 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v6 + 1, v31, v32, v33, v34);
    v30 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v29 userInfo:0];
    CFRelease(v29);
    objc_exception_throw(v30);
  }
  uint64_t v31 = 0;
  uint64_t v23 = _CFCreateArrayStorage();
  -[NSArray getObjects:range:](self->_observances, "getObjects:range:", v23, 0, v7);
  *(void *)(v23 + 8 * v7) = a3;
  if (v7 <= 0x7FFFFFFFFFFFFFFELL)
  {
    v24 = (id *)v23;
    NSUInteger v25 = v22;
    do
    {
      id v26 = *v24++;
      --v25;
    }
    while (v25);
  }
  v5->_observances = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) _initByAdoptingBuffer:v23 count:v22 size:v22];
  LOBYTE(v27) = self->_cachedIsShareable;
  if ((_BYTE)v27) {
    int v27 = (*((unsigned __int8 *)a3 + 40) >> 6) & 1;
  }
  v5->_cachedIsShareable = v27;
  return v5;
}

- (id)_initWithObservances:(id *)a3 count:(unint64_t)a4 hashValue:(unint64_t)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)NSKeyValueObservationInfo;
  int v8 = [(NSKeyValueObservationInfo *)&v25 init];
  if (!v8) {
    return v8;
  }
  v8->_observances = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:a3 count:a4];
  v8->_unint64_t cachedHash = a5;
  v8->_cachedIsShareable = 1;
  if (!a5)
  {
    if (!a4) {
      return v8;
    }
    unint64_t v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      long long v11 = a3[v10];
      if (v11)
      {
        if ((v11[40] & 0x20) != 0) {
          uint64_t v12 = 8;
        }
        else {
          uint64_t v12 = 32;
        }
        uint64_t v13 = *(void *)&v11[v12];
        if ((v11[40] & 0x20) != 0)
        {
LABEL_15:
          uint64_t v14 = *((void *)v11 + 4);
          goto LABEL_18;
        }
      }
      else
      {
        uint64_t v13 = 0;
        if ((MEMORY[0x28] & 0x20) != 0) {
          goto LABEL_15;
        }
      }
      uint64_t v14 = 0;
LABEL_18:
      LODWORD(v15) = 0;
      long long v16 = *((_OWORD *)v11 + 1);
      uint64_t v26 = v13;
      long long v27 = v16;
      uint64_t v28 = v14;
      unsigned int v17 = (unsigned __int8 *)&v26 + 3;
      for (unint64_t i = 36; i > 7; i -= 4)
      {
        unsigned int v19 = *(v17 - 3) + 16 * v15;
        unsigned int v20 = *(v17 - 2) + 16 * (v19 ^ (16 * (v19 >> 28)));
        unsigned int v21 = *(v17 - 1) + 16 * (v20 ^ (16 * (v20 >> 28)));
        int v22 = *v17;
        v17 += 4;
        int v23 = v22 + 16 * (v21 ^ (16 * (v21 >> 28)));
        unint64_t v15 = (v23 ^ ((v23 & 0xF0000000) >> 24)) & ~(v23 & 0xF0000000);
      }
      v9 ^= (v15 << (v10 & 0x3F)) | (v15 >> (v10 & 0x3F));
      v8->_unint64_t cachedHash = v9;
      if ((v11[40] & 0x40) == 0) {
        v8->_cachedIsShareable = 0;
      }
      if (++v10 == a4) {
        return v8;
      }
    }
  }
  for (; a4; --a4)
  {
    if ((*((unsigned char *)*a3 + 40) & 0x40) == 0) {
      v8->_cachedIsShareable = 0;
    }
    ++a3;
  }
  return v8;
}

- (BOOL)containsOnlyInternalObservationHelpers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  observances = self->_observances;
  uint64_t v3 = [(NSArray *)observances countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(observances);
        }
        if ((*(char *)(*(void *)(*((void *)&v9 + 1) + 8 * i) + 40) & 0x80000000) == 0) {
          return 0;
        }
      }
      uint64_t v4 = [(NSArray *)observances countByEnumeratingWithState:&v9 objects:v8 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (unint64_t)hash
{
  return self->_cachedHash;
}

- (BOOL)isEqual:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (a3 == self) {
    return 1;
  }
  NSUInteger v5 = [(NSArray *)self->_observances count];
  uint64_t v6 = [*((id *)a3 + 1) count];
  if (v6 != v5) {
    return 0;
  }
  unint64_t v7 = 8 * v5;
  if (8 * v5 > 0x80)
  {
    int v8 = malloc_type_malloc(8 * v5, 0x80040B8603338uLL);
    -[NSArray getObjects:range:](self->_observances, "getObjects:range:", v8, 0, v5);
    long long v9 = malloc_type_malloc(8 * v5, 0x80040B8603338uLL);
    objc_msgSend(*((id *)a3 + 1), "getObjects:range:", v9, 0, v5);
    if (!v5)
    {
      BOOL v10 = 1;
LABEL_16:
      free(v8);
      free(v9);
      return v10;
    }
    goto LABEL_9;
  }
  if (!v5)
  {
    -[NSArray getObjects:range:](self->_observances, "getObjects:range:", 0, 0, 0);
    objc_msgSend(*((id *)a3 + 1), "getObjects:range:", 0, 0, 0);
    return 1;
  }
  MEMORY[0x1F4188790](v6);
  int v8 = (void *)((char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v8, 8 * v5);
  uint64_t v11 = -[NSArray getObjects:range:](self->_observances, "getObjects:range:", v8, 0, v5);
  MEMORY[0x1F4188790](v11);
  long long v9 = v8;
  bzero(v8, 8 * v5);
  objc_msgSend(*((id *)a3 + 1), "getObjects:range:", v8, 0, v5);
LABEL_9:
  if (*v8 == *v9)
  {
    uint64_t v12 = 1;
    do
    {
      NSUInteger v13 = v12;
      if (v5 == v12) {
        break;
      }
      uint64_t v14 = v8[v12];
      uint64_t v15 = v9[v12++];
    }
    while (v14 == v15);
    BOOL v10 = v13 >= v5;
  }
  else
  {
    BOOL v10 = 0;
  }
  if (v7 >= 0x81) {
    goto LABEL_16;
  }
  return v10;
}

- (id)description
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[NSString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@ %p> (\n"), objc_opt_class(), self;
  NSUInteger v4 = [(NSArray *)self->_observances count];
  uint64_t v5 = v4;
  size_t v6 = 8 * v4;
  if (8 * v4 <= 0x80)
  {
    if (!v4)
    {
      _NSKeyValueObservationInfoGetObservances((uint64_t)self, 0, 0);
      [(NSMutableString *)v3 appendString:@""]);
      return v3;
    }
    MEMORY[0x1F4188790](v4);
    unint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v7, v6);
    _NSKeyValueObservationInfoGetObservances((uint64_t)self, (uint64_t)v7, v5);
  }
  else
  {
    unint64_t v7 = (char *)malloc_type_malloc(8 * v4, 0x80040B8603338uLL);
    _NSKeyValueObservationInfoGetObservances((uint64_t)self, (uint64_t)v7, v5);
    if (!v5)
    {
      [(NSMutableString *)v3 appendString:@""]);
LABEL_9:
      free(v7);
      return v3;
    }
  }
  uint64_t v8 = 0;
  do
  {
    -[NSMutableString appendString:](v3, "appendString:", [*(id *)&v7[8 * v8] description]);
    [(NSMutableString *)v3 appendString:@"\n"];
    ++v8;
  }
  while (v5 != v8);
  [(NSMutableString *)v3 appendString:@""]);
  if (v6 > 0x80) {
    goto LABEL_9;
  }
  return v3;
}

@end