@interface _NSSharedKeySetS
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (_NSSharedKeySetS)init;
- (uint64_t)allKeys;
- (uint64_t)keyAtIndex:(uint64_t)a1;
- (unint64_t)hash;
- (unint64_t)indexForBytes:(char *)a3 length:(unint64_t)a4;
- (unint64_t)indexForKey:(unsigned __int16 *)a3 length:(unint64_t)a4;
- (void)dealloc;
- (void)initWithConfiguration:(void *)a1;
@end

@implementation _NSSharedKeySetS

- (_NSSharedKeySetS)init
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    v2.receiver = self;
    v2.super_class = (Class)_NSSharedKeySetS;
    self = [(_NSSharedKeySetS *)&v2 init];
    if (self) {
      self->_numKey = 0;
    }
  }
  return self;
}

- (void)initWithConfiguration:(void *)a1
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)_NSSharedKeySetS;
  id v3 = objc_msgSendSuper2(&v8, sel_init);
  v4 = v3;
  if (v3)
  {
    *((_DWORD *)v3 + 12) = 0;
    if (a2)
    {
      *((unsigned char *)v3 + 16) = *(unsigned char *)a2;
      *((void *)v3 + 4) = *(void *)(a2 + 8);
      *((_DWORD *)v3 + 10) = *(_DWORD *)(a2 + 16);
      *((_DWORD *)v3 + 11) = *(_DWORD *)(a2 + 20);
      *((_DWORD *)v3 + 12) = *(_DWORD *)(a2 + 24);
      *((void *)v3 + 7) = *(void *)(a2 + 32);
      *((void *)v3 + 1) = *(void *)(a2 + 40);
      *((void *)v3 + 3) = *(void *)(a2 + 48);
      *((void *)v3 + 8) = *(void *)(a2 + 56);
      *((void *)v3 + 9) = *(void *)(a2 + 64);
      *((void *)v3 + 10) = *(void *)(a2 + 72);
      *((void *)v3 + 11) = *(void *)(a2 + 80);
      *((_DWORD *)v3 + 26) = *(_DWORD *)(a2 + 88);
      *((_DWORD *)v3 + 27) = *(_DWORD *)(a2 + 92);
      if (*(void *)(a2 + 96))
      {
        id v5 = (id)-[_NSSharedKeySetS initWithConfiguration:]([_NSSharedKeySetS alloc], *(void *)(a2 + 96));
        objc_setProperty_atomic(v4, v6, v5, 96);
      }
    }
  }
  return v4;
}

- (BOOL)isEmpty
{
  return self->_numKey == 0;
}

- (uint64_t)allKeys
{
  if (!a1) {
    return 0;
  }
  if (a1[12])
  {
    LODWORD(v2) = 0;
    id v3 = a1;
    do
    {
      uint64_t v2 = (v3[12] + v2);
      id v3 = (_DWORD *)*((void *)v3 + 12);
    }
    while (v3);
    v4 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v2];
    unsigned int v5 = 0;
    uint64_t v6 = (a1[26] << (a1[27] == 0));
    unsigned int v7 = v2 - 1;
    do
    {
      objc_super v8 = (void *)MEMORY[0x1E4F1C9B8];
      if (a1[27])
      {
        if (a1[12])
        {
          unint64_t v9 = v5;
          v10 = a1;
          while (1)
          {
            unint64_t v11 = v10[12];
            BOOL v12 = v9 >= v11;
            unint64_t v13 = v9 - v11;
            if (!v12) {
              break;
            }
            v10 = (_DWORD *)*((void *)v10 + 12);
            unint64_t v9 = v13;
            if (!v10) {
              goto LABEL_12;
            }
          }
          uint64_t v14 = *((void *)v10 + 11) + 3 * v9;
        }
        else
        {
LABEL_12:
          uint64_t v14 = 0;
        }
      }
      else
      {
        uint64_t v14 = -[_NSSharedKeySetS keyAtIndex:]((uint64_t)a1, v5);
      }
      objc_msgSend(v4, "addObject:", objc_msgSend(v8, "dataWithBytes:length:", v14, v6));
      ++v5;
    }
    while (v5 <= v7);
    return (uint64_t)v4;
  }
  v16 = (void *)MEMORY[0x1E4F1C978];

  return [v16 array];
}

- (uint64_t)keyAtIndex:(uint64_t)a1
{
  uint64_t v2 = 0;
  if (a1 && a2 != 0x7FFFFFFFFFFFFFFFLL && *(_DWORD *)(a1 + 48))
  {
    while (1)
    {
      unint64_t v3 = *(unsigned int *)(a1 + 48);
      BOOL v4 = a2 >= v3;
      unint64_t v5 = a2 - v3;
      if (!v4) {
        break;
      }
      a1 = *(void *)(a1 + 96);
      a2 = v5;
      if (!a1) {
        return 0;
      }
    }
    int v7 = *(_DWORD *)(a1 + 104);
    switch(v7)
    {
      case 3:
        return *(void *)(a1 + 80) + 6 * a2;
      case 2:
        return *(void *)(a1 + 72) + 4 * a2;
      case 1:
        return *(void *)(a1 + 64) + 2 * a2;
      default:
        return 0;
    }
  }
  return v2;
}

- (unint64_t)indexForKey:(unsigned __int16 *)a3 length:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t keyLen = self->_keyLen;
  if (keyLen != a4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v5 = self;
  if (!self->_numKey) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int v7 = a3;
  int v8 = a4;
  if (a4 >= 4)
  {
    int v8 = a4;
    int v7 = a3;
    do
    {
      int v8 = 67503105 * v8 + 16974593 * *v7 + 66049 * v7[1] + 257 * v7[2] + v7[3];
      v7 += 4;
    }
    while (v7 < &a3[a4 & 0xFFFFFFFC]);
  }
  while (v7 < &a3[a4])
  {
    int v9 = *v7++;
    int v8 = 257 * v8 + v9;
  }
  if (!self) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unsigned int v10 = 0;
  int v11 = (v8 << a4) + v8;
  unsigned int M = self->_M;
  size_t v13 = 2 * a4;
  while (1)
  {
    seeds = v5->_seeds;
    unsigned int factor = v5->_factor;
    int v16 = *seeds - 559038733;
    HIDWORD(v17) = v16;
    LODWORD(v17) = v16;
    LODWORD(seeds) = ((v16 + seeds[1]) ^ v16) - (v17 >> 18);
    HIDWORD(v17) = seeds;
    LODWORD(v17) = seeds;
    int v18 = (seeds ^ (v11 + v16)) - (v17 >> 21);
    HIDWORD(v17) = v18;
    LODWORD(v17) = v18;
    int v19 = (v18 ^ v16) - (v17 >> 7);
    HIDWORD(v17) = v19;
    LODWORD(v17) = v19;
    LODWORD(seeds) = (v19 ^ seeds) - (v17 >> 16);
    HIDWORD(v17) = seeds;
    LODWORD(v17) = seeds;
    HIDWORD(v17) = (seeds ^ v18) - (v17 >> 28);
    LODWORD(v17) = HIDWORD(v17);
    HIDWORD(v17) = (HIDWORD(v17) ^ v19) - (v17 >> 18);
    LODWORD(v17) = HIDWORD(v17);
    unint64_t v20 = 2 * (((HIDWORD(v17) ^ seeds) - (v17 >> 8)) % factor);
    int v21 = HIDWORD(v17) % factor;
    unsigned int v22 = (2 * (HIDWORD(v17) % factor)) | 1;
    v29[0] = v20;
    v29[1] = v22;
    if (v20 >= M || v22 >= M) {
      goto LABEL_33;
    }
    uint64_t v24 = v29[((v5->_g[(unint64_t)(2 * v21) >> 3] >> (v22 & 7)) ^ (v5->_g[v20 >> 3] >> (v20 & 6))) & 1];
    if (v24 >= M) {
      goto LABEL_33;
    }
    int select = v5->_select;
    if (select == 2)
    {
      unint64_t v26 = *((unsigned int *)v5->_rankTable + v24);
    }
    else if (select == 1)
    {
      unint64_t v26 = *((unsigned __int16 *)v5->_rankTable + v24);
    }
    else
    {
      if (v5->_select) {
        goto LABEL_33;
      }
      unint64_t v26 = *((unsigned __int8 *)v5->_rankTable + v24);
    }
    if (v26 >= v5->_numKey) {
      goto LABEL_33;
    }
    if (keyLen == 3)
    {
      v27 = v5->_keys3[v26];
      if (v27) {
        goto LABEL_31;
      }
      goto LABEL_33;
    }
    if (keyLen != 2) {
      break;
    }
    v27 = v5->_keys2[v26];
    if (v27) {
      goto LABEL_31;
    }
LABEL_33:
    v10 += v5->_numKey;
    unint64_t v5 = v5->_subSharedKeySet;
    if (!v5) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  if (keyLen != 1) {
    goto LABEL_33;
  }
  v27 = v5->_keys1[v26];
  if (!v27) {
    goto LABEL_33;
  }
LABEL_31:
  if (v27 != a3 && memcmp(a3, v27, v13)) {
    goto LABEL_33;
  }
  return v26 + v10;
}

- (unint64_t)indexForBytes:(char *)a3 length:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (self->_keyLen != a4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  BOOL v4 = self;
  if (!self->_numKey) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int v7 = a3;
  int v8 = (unsigned __int8 *)a3;
  int v9 = a4;
  if (a4 >= 4)
  {
    int v7 = a3;
    int v9 = a4;
    int v8 = (unsigned __int8 *)a3;
    do
    {
      int v9 = 67503105 * v9 + 16974593 * *v8 + 66049 * v8[1] + (v8[2] | (v8[2] << 8)) + v8[3];
      v8 += 4;
      v7 += 4;
    }
    while (v8 < (unsigned __int8 *)&a3[a4 & 0xFFFFFFFC]);
  }
  if (v8 < (unsigned __int8 *)&a3[a4])
  {
    unsigned int v10 = (char *)(&a3[a4] - v7);
    do
    {
      int v11 = *v8++;
      int v9 = 257 * v9 + v11;
      --v10;
    }
    while (v10);
  }
  if (!self) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unsigned int v12 = 0;
  int v13 = (v9 << a4) + v9;
  while (1)
  {
    seeds = v4->_seeds;
    unsigned int factor = v4->_factor;
    int v16 = *seeds - 559038733;
    HIDWORD(v17) = v16;
    LODWORD(v17) = v16;
    LODWORD(seeds) = ((v16 + seeds[1]) ^ v16) - (v17 >> 18);
    HIDWORD(v17) = seeds;
    LODWORD(v17) = seeds;
    int v18 = (seeds ^ (v13 + v16)) - (v17 >> 21);
    HIDWORD(v17) = v18;
    LODWORD(v17) = v18;
    int v19 = (v18 ^ v16) - (v17 >> 7);
    HIDWORD(v17) = v19;
    LODWORD(v17) = v19;
    LODWORD(seeds) = (v19 ^ seeds) - (v17 >> 16);
    HIDWORD(v17) = seeds;
    LODWORD(v17) = seeds;
    HIDWORD(v17) = (seeds ^ v18) - (v17 >> 28);
    LODWORD(v17) = HIDWORD(v17);
    HIDWORD(v17) = (HIDWORD(v17) ^ v19) - (v17 >> 18);
    LODWORD(v17) = HIDWORD(v17);
    unint64_t v20 = 2 * (((HIDWORD(v17) ^ seeds) - (v17 >> 8)) % factor);
    int v21 = HIDWORD(v17) % factor;
    v29[0] = v20;
    v29[1] = (2 * v21) | 1;
    uint64_t v22 = v29[((v4->_g[(unint64_t)(2 * v21) >> 3] >> ((2 * v21) & 6 | 1)) ^ (v4->_g[v20 >> 3] >> (v20 & 6))) & 1];
    int select = v4->_select;
    if (!v4->_select)
    {
      unint64_t v24 = *((unsigned __int8 *)v4->_rankTable + v22);
      goto LABEL_17;
    }
    if (select == 1) {
      break;
    }
    if (select == 2)
    {
      unint64_t v24 = *((unsigned int *)v4->_rankTable + v22);
      goto LABEL_17;
    }
    LODWORD(numKey) = v4->_numKey;
LABEL_23:
    v12 += numKey;
    BOOL v4 = v4->_subSharedKeySet;
    if (!v4) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  unint64_t v24 = *((unsigned __int16 *)v4->_rankTable + v22);
LABEL_17:
  unint64_t numKey = v4->_numKey;
  if (v24 >= numKey) {
    goto LABEL_23;
  }
  ckeys = v4->_ckeys;
  if (!ckeys) {
    goto LABEL_23;
  }
  v27 = (char *)ckeys[v24];
  if (v27 != a3)
  {
    if (memcmp(a3, v27, a4)) {
      goto LABEL_23;
    }
  }
  return v24 + v12;
}

- (unint64_t)hash
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = 0;
  if (self)
  {
    unint64_t v3 = self;
    do
    {
      v2 += v3->_numKey;
      unint64_t v3 = v3->_subSharedKeySet;
    }
    while (v3);
  }
  size_t v4 = v2;
  unint64_t v5 = (void *)-[_NSSharedKeySetS allKeys](self);
  uint64_t v6 = malloc_type_calloc(v2, 8uLL, 0x100004000313F17uLL);
  bzero(v6, 8 * v2);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v5);
        }
        *((void *)v6 + (v9 + i)) = [*(id *)(*((void *)&v19 + 1) + 8 * i) hash];
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v19 objects:v18 count:16];
      v9 += i;
    }
    while (v8);
  }
  qsort(v6, v4, 8uLL, (int (__cdecl *)(const void *, const void *))_hash_compare);
  if (v4)
  {
    uint64_t v12 = 1;
    int v13 = (uint64_t *)v6;
    size_t v14 = v4;
    do
    {
      uint64_t v15 = *v13++;
      uint64_t v12 = v15 - v12 + 32 * v12;
      --v14;
    }
    while (v14);
    uint64_t v16 = 31 * v12;
  }
  else
  {
    uint64_t v16 = 31;
  }
  free(v6);
  return v16 + v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (self == a3)
  {
    LOBYTE(v21) = 1;
    return (char)v21;
  }
  if (!a3) {
    goto LABEL_51;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_51;
  }
  int v5 = 0;
  if (self)
  {
    uint64_t v6 = self;
    do
    {
      v5 += v6->_numKey;
      uint64_t v6 = v6->_subSharedKeySet;
    }
    while (v6);
  }
  int v7 = 0;
  uint64_t v8 = a3;
  do
  {
    v7 += v8[12];
    uint64_t v8 = (_DWORD *)*((void *)v8 + 12);
  }
  while (v8);
  if (self)
  {
    if (self->_keyLen != *((_DWORD *)a3 + 26) || v5 != v7) {
      goto LABEL_51;
    }
    int v10 = 0;
    int v11 = self;
    do
    {
      ++v10;
      int v11 = v11->_subSharedKeySet;
    }
    while (v11);
  }
  else
  {
    int v10 = 0;
    LOBYTE(v21) = 0;
    if (*((_DWORD *)a3 + 26)) {
      BOOL v37 = 0;
    }
    else {
      BOOL v37 = v5 == v7;
    }
    if (!v37) {
      return (char)v21;
    }
  }
  uint64_t v12 = a3;
  do
  {
    uint64_t v12 = (void *)v12[12];
    --v10;
  }
  while (v12);
  if (v10) {
    goto LABEL_51;
  }
  if (self)
  {
    int v13 = 0;
    size_t v14 = self;
    do
    {
      v13 += v14->_numKey;
      size_t v14 = v14->_subSharedKeySet;
    }
    while (v14);
    uint64_t v15 = self;
    do
    {
      LODWORD(v14) = v15->_numKey + v14;
      uint64_t v15 = v15->_subSharedKeySet;
    }
    while (v15);
    if (v13 != v14) {
      goto LABEL_51;
    }
    unsigned int v16 = v13 - 1;
  }
  else
  {
    unsigned int v16 = 0;
  }
  unint64_t v17 = (void *)-[_NSSharedKeySetS allKeys](self);
  int v18 = (void *)-[_NSSharedKeySetS allKeys](a3);
  uint64_t v19 = [v17 count];
  if (v19 != [v18 count])
  {
LABEL_51:
    LOBYTE(v21) = 0;
    return (char)v21;
  }
  size_t v20 = 2 * self->_keyLen;
  long long v21 = malloc_type_malloc(v20, 0xBFC4D599uLL);
  if (v21)
  {
    long long v22 = v21;
    id obj = v18;
    unsigned int v39 = v16;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v23 = [v17 countByEnumeratingWithState:&v48 objects:v47 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      int v25 = 0;
      uint64_t v26 = *(void *)v49;
LABEL_31:
      uint64_t v27 = 0;
      int v40 = v25 + v24;
      while (1)
      {
        if (*(void *)v49 != v26) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v48 + 1) + 8 * v27) getBytes:v22 length:v20];
        if ([a3 indexForKey:v22 length:self->_keyLen] == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_50;
        }
        if (v24 == ++v27)
        {
          uint64_t v24 = [v17 countByEnumeratingWithState:&v48 objects:v47 count:16];
          int v25 = v40;
          if (v24) {
            goto LABEL_31;
          }
          goto LABEL_40;
        }
      }
    }
    int v25 = 0;
LABEL_40:
    if (v25 != v5) {
      goto LABEL_50;
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v28 = [obj countByEnumeratingWithState:&v43 objects:v42 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      int v30 = 0;
      uint64_t v31 = *(void *)v44;
LABEL_43:
      uint64_t v32 = 0;
      v30 += v29;
      while (1)
      {
        if (*(void *)v44 != v31) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v43 + 1) + 8 * v32) getBytes:v22 length:v20];
        if ([(_NSSharedKeySetS *)self indexForKey:v22 length:self->_keyLen] == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        if (v29 == ++v32)
        {
          uint64_t v29 = [obj countByEnumeratingWithState:&v43 objects:v42 count:16];
          if (v29) {
            goto LABEL_43;
          }
          goto LABEL_54;
        }
      }
LABEL_50:
      free(v22);
      goto LABEL_51;
    }
    int v30 = 0;
LABEL_54:
    free(v22);
    if (v30 != v5) {
      goto LABEL_51;
    }
    unsigned int v33 = 0;
    do
    {
      v34 = (const void *)-[_NSSharedKeySetS keyAtIndex:]((uint64_t)a3, v33);
      v35 = (const void *)-[_NSSharedKeySetS keyAtIndex:]((uint64_t)self, [(_NSSharedKeySetS *)self indexForKey:v34 length:self->_keyLen]);
      if (v34 && v35)
      {
        if (memcmp(v34, v35, v20)) {
          goto LABEL_51;
        }
      }
      else if ((v34 != 0) != (v35 != 0))
      {
        goto LABEL_51;
      }
      ++v33;
    }
    while (v33 <= v39);
    BOOL v36 = [(_NSSharedKeySetS *)self isEmpty];
    LOBYTE(v21) = v36 ^ [a3 isEmpty] ^ 1;
  }
  return (char)v21;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  rankTable = self->_rankTable;
  if (rankTable) {
    free(rankTable);
  }
  g = self->_g;
  if (g) {
    free(g);
  }
  seeds = self->_seeds;
  if (seeds) {
    free(seeds);
  }
  self->_rankTable = 0;
  self->_g = 0;
  if (self->_type)
  {
    p_ckeys = &self->_ckeys;
    ckeys = self->_ckeys;
    if (ckeys) {
      goto LABEL_9;
    }
  }
  else
  {
    unsigned int keyLen = self->_keyLen;
    if (keyLen == 3)
    {
      p_ckeys = &self->_keys3;
      ckeys = self->_keys3;
      if (!ckeys) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    if (keyLen == 2)
    {
      p_ckeys = &self->_keys2;
      ckeys = self->_keys2;
      if (!ckeys) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    if (keyLen != 1) {
      goto LABEL_11;
    }
    p_ckeys = &self->_keys1;
    ckeys = self->_keys1;
    if (ckeys) {
LABEL_9:
    }
      free(ckeys);
  }
LABEL_10:
  void *p_ckeys = 0;
LABEL_11:

  v9.receiver = self;
  v9.super_class = (Class)_NSSharedKeySetS;
  [(_NSSharedKeySetS *)&v9 dealloc];
}

@end