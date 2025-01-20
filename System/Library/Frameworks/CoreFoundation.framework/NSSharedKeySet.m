@interface NSSharedKeySet
+ (BOOL)supportsSecureCoding;
+ (NSSharedKeySet)keySetWithKeys:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSSharedKeySet)init;
- (NSSharedKeySet)initWithCoder:(id)a3;
- (NSSharedKeySet)initWithKeys:(id *)a3 count:(unint64_t)a4;
- (NSSharedKeySet)subSharedKeySet;
- (char)g;
- (id)allKeys;
- (id)debugDescription;
- (id)keyAtIndex:(unint64_t)a3;
- (id)keys;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexForKey:(id)a3;
- (unint64_t)keySetCount;
- (unint64_t)maximumIndex;
- (unsigned)M;
- (unsigned)factor;
- (unsigned)numKey;
- (unsigned)seeds;
- (unsigned)select;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)rankTable;
- (void)setFactor:(unsigned int)a3;
- (void)setG:(char *)a3;
- (void)setKeys:(id *)a3;
- (void)setM:(unsigned int)a3;
- (void)setNumKey:(unsigned int)a3;
- (void)setRankTable:(void *)a3;
- (void)setSeeds:(unsigned int *)a3;
- (void)setSelect:(unsigned __int8)a3;
- (void)setSubSharedKeySet:(id)a3;
@end

@implementation NSSharedKeySet

- (unint64_t)indexForKey:(id)a3
{
  uint64_t v32 = *(void *)off_1ECE0A5B0;
  if (self->_numKey)
  {
    v4 = self;
    unint64_t v5 = [a3 hash];
    int v6 = v5;
    unsigned int v7 = 0;
    unint64_t v8 = HIDWORD(v5);
    do
    {
      unint64_t numKey = v4->_numKey;
      if (!numKey) {
        goto LABEL_24;
      }
      seeds = v4->_seeds;
      unsigned int factor = v4->_factor;
      if (v4->_algorithmType == 1)
      {
        int v15 = *seeds - 559038729;
        int v14 = v15 + seeds[1];
        int v13 = v15 + v8;
      }
      else
      {
        if (v4->_algorithmType) {
          __break(1u);
        }
        unsigned int v12 = seeds[1];
        int v13 = *seeds - 559038733;
        int v14 = v13 + v12;
        int v15 = v13;
      }
      HIDWORD(v16) = v13;
      LODWORD(v16) = v13;
      int v17 = (v14 ^ v13) - (v16 >> 18);
      HIDWORD(v16) = v17;
      LODWORD(v16) = v17;
      int v18 = ((v15 + v6) ^ v17) - (v16 >> 21);
      HIDWORD(v16) = v18;
      LODWORD(v16) = v18;
      int v19 = (v18 ^ v13) - (v16 >> 7);
      HIDWORD(v16) = v19;
      LODWORD(v16) = v19;
      int v20 = (v19 ^ v17) - (v16 >> 16);
      HIDWORD(v16) = v20;
      LODWORD(v16) = v20;
      HIDWORD(v16) = (v20 ^ v18) - (v16 >> 28);
      LODWORD(v16) = HIDWORD(v16);
      HIDWORD(v16) = (HIDWORD(v16) ^ v19) - (v16 >> 18);
      LODWORD(v16) = HIDWORD(v16);
      unint64_t v21 = 2 * (((HIDWORD(v16) ^ v20) - (v16 >> 8)) % factor);
      int v22 = HIDWORD(v16) % factor;
      unsigned int v23 = (2 * (HIDWORD(v16) % factor)) | 1;
      unint64_t v31 = __PAIR64__(v23, v21);
      unsigned int M = v4->_M;
      if (v21 >= M || v23 >= M) {
        goto LABEL_24;
      }
      uint64_t v26 = *((unsigned int *)&v31
            + (((v4->_g[(unint64_t)(2 * v22) >> 3] >> (v23 & 7)) ^ (v4->_g[v21 >> 3] >> (v21 & 6))) & 1));
      if (v26 >= M) {
        goto LABEL_24;
      }
      int select = v4->_select;
      if (select == 2)
      {
        unint64_t v28 = *((unsigned int *)v4->_rankTable + v26);
      }
      else if (select == 1)
      {
        unint64_t v28 = *((unsigned __int16 *)v4->_rankTable + v26);
      }
      else
      {
        if (v4->_select) {
          goto LABEL_24;
        }
        unint64_t v28 = *((unsigned __int8 *)v4->_rankTable + v26);
      }
      if (v28 < numKey)
      {
        id v29 = v4->_keys[v28];
        if (v29)
        {
          if (v29 == a3 || (objc_msgSend(a3, "isEqual:", v31, v32) & 1) != 0) {
            return v28 + v7;
          }
          LODWORD(numKey) = v4->_numKey;
        }
      }
LABEL_24:
      v7 += numKey;
      v4 = v4->_subSharedKeySet;
    }
    while (v4);
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t v9 = [(NSSharedKeySet *)self count];
  unint64_t var0 = a3->var0;
  if (a3->var0 == v9) {
    return 0;
  }
  unint64_t v11 = 0;
  if (a5)
  {
    unint64_t v12 = v9;
    if (var0 < v9)
    {
      unint64_t v11 = 0;
      do
      {
        unint64_t v13 = var0 + v11;
        a4[v11] = [(NSSharedKeySet *)self keyAtIndex:var0 + v11];
        ++v11;
      }
      while (v11 < a5 && v13 + 1 < v12);
      var0 += v11;
    }
  }
  a3->unint64_t var0 = var0;
  a3->var1 = a4;
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_8;
  return v11;
}

- (id)keyAtIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || *((_DWORD *)self + 10) == 0 || self == 0) {
    return 0;
  }
  while (1)
  {
    unint64_t v5 = *((unsigned int *)self + 10);
    BOOL v6 = a3 >= v5;
    unint64_t v7 = a3 - v5;
    if (!v6) {
      break;
    }
    self = (id)*((void *)self + 8);
    a3 = v7;
    if (!self) {
      return self;
    }
  }
  return *(id *)(*((void *)self + 7) + 8 * a3);
}

- (unint64_t)count
{
  for (unint64_t i = 0; self; self = self->_subSharedKeySet)
    i += self->_numKey;
  return i;
}

- (void)dealloc
{
  uint64_t v12 = *(void *)off_1ECE0A5B0;
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
  keys = self->_keys;
  if (keys)
  {
    uint64_t numKey = self->_numKey;
    if (numKey)
    {
      uint64_t v8 = 8 * numKey - 8;
      do
      {
        uint64_t v9 = *(uint64_t *)((char *)self->_keys + v8);
        if (v9 >= 1) {

        }
        v8 -= 8;
      }
      while (v8 != -8);
      keys = self->_keys;
    }
    free(keys);
  }
  subSharedKeySet = self->_subSharedKeySet;
  if ((uint64_t)subSharedKeySet >= 1) {

  }
  v11.receiver = self;
  v11.super_class = (Class)NSSharedKeySet;
  [(NSSharedKeySet *)&v11 dealloc];
}

+ (NSSharedKeySet)keySetWithKeys:(id)a3
{
  uint64_t v23 = *(void *)off_1ECE0A5B0;
  if (!a3)
  {
    uint64_t v20 = __CFExceptionProem((objc_class *)a1, a2);
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: keys cannot be nil", v20);
    goto LABEL_12;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v16 = __CFExceptionProem((objc_class *)a1, a2);
    uint64_t v21 = objc_opt_class();
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: keys must be a kind of NSArray instead of '%@'", v16, v21);
LABEL_12:
    int v17 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0];
    objc_exception_throw(v17);
  }
  unint64_t v6 = [a3 count];
  unint64_t v8 = v6;
  if (v6 >> 60)
  {
    CFStringRef v18 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v6);
    int v19 = +[NSException exceptionWithName:@"NSGenericException" reason:v18 userInfo:0];
    CFRelease(v18);
    objc_exception_throw(v19);
  }
  if (v6 <= 1) {
    unint64_t v6 = 1;
  }
  unint64_t v9 = MEMORY[0x1F4188790](v6, v7);
  objc_super v11 = (char *)&v22 - v10;
  size_t v22 = 0;
  if (v8 >= 0x101)
  {
    objc_super v11 = (char *)_CFCreateArrayStorage(v9, 0, &v22);
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v12 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v11, 0, v8, v22, v23);
  unint64_t v13 = (NSSharedKeySet *)(id)[objc_alloc((Class)a1) initWithKeys:v11 count:v8];
  free(v12);
  return v13;
}

- (NSSharedKeySet)initWithKeys:(id *)a3 count:(unint64_t)a4
{
  uint64_t v140 = *(void *)off_1ECE0A5B0;
  v133.receiver = self;
  v133.super_class = (Class)NSSharedKeySet;
  unint64_t v6 = [(NSSharedKeySet *)&v133 init];
  unint64_t v8 = v6;
  if (!v6) {
    return v8;
  }
  if (!a4)
  {
    v6->_uint64_t numKey = 0;
    return v8;
  }
  if (a4 >> 60)
  {
    CFStringRef v120 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", a4);
    v121 = +[NSException exceptionWithName:@"NSGenericException" reason:v120 userInfo:0];
    CFRelease(v120);
    objc_exception_throw(v121);
  }
  uint64_t v9 = MEMORY[0x1F4188790](v6, v7);
  v129 = (id *)((char *)&v123 - v11);
  size_t v132 = 0;
  uint64_t v126 = v12;
  if (a4 > 0x100)
  {
    v128 = (id *)_CFCreateArrayStorage(a4, 0, &v132);
    MEMORY[0x1F4188790](v128, v15);
    unint64_t v13 = (char *)&v122;
    size_t v131 = 0;
    int v14 = (char *)_CFCreateArrayStorage(a4, 0, &v131);
    v129 = v128;
  }
  else
  {
    MEMORY[0x1F4188790](v9, v10);
    unint64_t v13 = (char *)&v123 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
    v128 = 0;
    int v14 = 0;
    size_t v131 = 0;
  }
  v127 = v14;
  if (a4 >= 0x101) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = v13;
  }
  v130 = (uint64_t *)malloc_type_malloc(8 * a4, 0x100004000313F17uLL);
  if (a4 < 2)
  {
    id *v129 = *a3;
    uint64_t v39 = [*a3 hash];
    uint64_t v27 = 0;
    uint64_t *v130 = v39;
    size_t v31 = 1;
  }
  else
  {
    int v17 = [[NSSet alloc] initWithObjects:a3 count:a4];
    size_t v18 = [(NSSet *)v17 count];
    int v19 = v16;
    uint64_t v20 = (uint64_t *)malloc_type_malloc(16 * v18, 0x1080040FC6463CFuLL);
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    uint64_t v21 = [(NSSet *)v17 countByEnumeratingWithState:&v135 objects:v134 count:16];
    if (v21)
    {
      int v22 = 0;
      uint64_t v23 = *(void *)v136;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v136 != v23) {
            objc_enumerationMutation(v17);
          }
          v25 = *(void **)(*((void *)&v135 + 1) + 8 * i);
          uint64_t v26 = (v22 + i);
          v20[2 * v26] = (uint64_t)v25;
          v20[2 * v26 + 1] = [v25 hash];
        }
        uint64_t v21 = [(NSSet *)v17 countByEnumeratingWithState:&v135 objects:v134 count:16];
        v22 += i;
      }
      while (v21);
    }

    qsort(v20, v18, 0x10uLL, (int (__cdecl *)(const void *, const void *))compareHashesAscending);
    id *v129 = (id)*v20;
    uint64_t *v130 = v20[1];
    uint64_t v16 = v19;
    uint64_t v27 = 0;
    if (v18 < 2)
    {
      size_t v31 = 1;
    }
    else
    {
      unint64_t v28 = v20 + 1;
      unsigned int v29 = 2;
      uint64_t v30 = 1;
      size_t v31 = 1;
      do
      {
        uint64_t v32 = &v20[2 * v30];
        uint64_t v35 = v32[1];
        v33 = v32 + 1;
        uint64_t v34 = v35;
        uint64_t v36 = *v28;
        v28 += 2;
        v37 = (void *)v20[2 * v30];
        if (v34 == v36)
        {
          *(void *)&v19[8 * v27++] = v37;
        }
        else
        {
          v129[v31] = v37;
          v130[v31++] = *v33;
        }
        uint64_t v30 = v29;
        BOOL v38 = v18 > v29++;
      }
      while (v38);
    }
    free(v20);
  }
  v8->_uint64_t numKey = v31;
  v8->_algorithmType = 1;
  unsigned int v40 = vcvtpd_u64_f64((double)v31 * 2.125) >> 1;
  unsigned int v41 = (v40 + 1) | 1;
  if (v40 - 3 > 0xFFFFFFFD)
  {
LABEL_39:
    unsigned int v44 = v41;
  }
  else
  {
    do
    {
      if (-1431655765 * v41 >= 0x55555556)
      {
        if (v41 < 0x19) {
          goto LABEL_39;
        }
        int v42 = 11;
        while (v41 % (v42 - 6) && v41 % (v42 - 4))
        {
          unsigned int v43 = v42 * v42;
          v42 += 6;
          if (v43 > v41) {
            goto LABEL_39;
          }
        }
      }
      unsigned int v44 = v41 + 2;
      BOOL v38 = v41 > 1;
      v41 += 2;
    }
    while (v38);
  }
  v8->_unint64_t M = 2 * v44;
  v8->_unsigned int factor = v44;
  v124 = v16;
  uint64_t v125 = v27;
  if (2 * v44 > 0xFE)
  {
    if (2 * v44 > 0xFFFE) {
      char v45 = 2;
    }
    else {
      char v45 = 1;
    }
    v8->_int select = v45;
  }
  else
  {
    v8->_int select = 0;
  }
  int v46 = 0;
  v8->_seeds = (unsigned int *)malloc_type_calloc(2uLL, 4uLL, 0x100004052888210uLL);
  double v47 = 2.125;
  while (1)
  {
    arc4random_buf(v8->_seeds, 4uLL);
    arc4random_buf(v8->_seeds + 1, 4uLL);
    if (v46)
    {
      double v47 = v47 + 0.125;
      LODWORD(v48) = v8->_numKey;
      unsigned int v49 = vcvtpd_u64_f64(v47 * (double)v48) >> 1;
      unsigned int v50 = (v49 + 1) | 1;
      if (v49 - 3 > 0xFFFFFFFD)
      {
LABEL_58:
        unsigned int v53 = v50;
      }
      else
      {
        do
        {
          if (-1431655765 * v50 >= 0x55555556)
          {
            if (v50 < 0x19) {
              goto LABEL_58;
            }
            int v51 = 11;
            while (v50 % (v51 - 6) && v50 % (v51 - 4))
            {
              unsigned int v52 = v51 * v51;
              v51 += 6;
              if (v52 > v50) {
                goto LABEL_58;
              }
            }
          }
          unsigned int v53 = v50 + 2;
          BOOL v38 = v50 > 1;
          v50 += 2;
        }
        while (v38);
      }
      unsigned int v54 = 2 * v53;
      v8->_unint64_t M = 2 * v53;
      v8->_unsigned int factor = v53;
      if (2 * v53 < 0xFFFF) {
        char v55 = 1;
      }
      else {
        char v55 = 2;
      }
      if (v54 >= 0xFF) {
        char v56 = v55;
      }
      else {
        char v56 = 0;
      }
      v8->_int select = v56;
    }
    v57 = [[__NSSKGraph alloc] initWithNumberOfVertices:v8->_M numberOfEdges:v31];
    v58 = v130;
    uint64_t v59 = v31;
    if (v31)
    {
      do
      {
        uint64_t v60 = *v58++;
        seeds = v8->_seeds;
        int v62 = *seeds - 559038729;
        HIDWORD(v63) = v62 + HIDWORD(v60);
        LODWORD(v63) = v62 + HIDWORD(v60);
        LODWORD(seeds) = ((v62 + seeds[1]) ^ (v62 + HIDWORD(v60))) - (v63 >> 18);
        HIDWORD(v63) = seeds;
        LODWORD(v63) = seeds;
        int v64 = (seeds ^ (v62 + v60)) - (v63 >> 21);
        HIDWORD(v63) = v64;
        LODWORD(v63) = v64;
        HIDWORD(v63) = (v64 ^ (v62 + HIDWORD(v60))) - (v63 >> 7);
        int v65 = HIDWORD(v63);
        LODWORD(v63) = HIDWORD(v63);
        LODWORD(seeds) = (HIDWORD(v63) ^ seeds) - (v63 >> 16);
        HIDWORD(v63) = seeds;
        LODWORD(v63) = seeds;
        HIDWORD(v63) = (seeds ^ v64) - (v63 >> 28);
        LODWORD(v63) = HIDWORD(v63);
        HIDWORD(v63) = (HIDWORD(v63) ^ v65) - (v63 >> 18);
        LODWORD(v63) = HIDWORD(v63);
        [(__NSSKGraph *)v57 addEdgeWithH1:2 * (((HIDWORD(v63) ^ seeds) - (v63 >> 8)) % v8->_factor) withH2:(2 * (HIDWORD(v63) % v8->_factor)) | 1];
        --v59;
      }
      while (v59);
    }
    v66 = [(__NSSKGraph *)v57 isAcyclic];
    if ([(__NSSKGraph *)v57 isEmpty]) {
      break;
    }
    free(v66);

    if (++v46 == 1000)
    {
      v57 = 0;
      goto LABEL_86;
    }
  }
  if (!v66)
  {
LABEL_86:

    unint64_t v8 = 0;
    v57 = 0;
LABEL_134:

    free(v130);
    free(v127);
    free(v128);
    return v8;
  }
  uint64_t v67 = [(__NSSKGraph *)v57 numOfEdges];
  v68 = malloc_type_calloc(v8->_M, 1uLL, 0x100004077774924uLL);
  memset(v68, 2, v8->_M);
  for (; v67; --v67)
  {
    v69 = v66[v67 - 1];
    unint64_t var2 = v69->var2;
    if (v69->var1[0] == var2) {
      char v71 = *((unsigned char *)v68 + LODWORD(v69->var1[1]));
    }
    else {
      char v71 = 1 - *((unsigned char *)v68 + v69->var1[0]);
    }
    *((unsigned char *)v68 + var2) = v71 & 1;
  }
  v8->_g = (char *)v68;
  unint64_t M = v8->_M;
  int select = v8->_select;
  if (select == 2)
  {
    v78 = malloc_type_calloc(v8->_M, 4uLL, 0x100004052888210uLL);
    v75 = v78;
    if (!M) {
      goto LABEL_105;
    }
    uint64_t v79 = 0;
    int v80 = 0;
    do
    {
      v78[v79] = v80;
      if (*((unsigned char *)v68 + v79) != 2) {
        ++v80;
      }
      ++v79;
    }
    while (M != v79);
  }
  else if (select == 1)
  {
    v81 = malloc_type_calloc(v8->_M, 2uLL, 0x1000040BDFB0063uLL);
    v75 = v81;
    if (!M) {
      goto LABEL_105;
    }
    uint64_t v82 = 0;
    __int16 v83 = 0;
    do
    {
      v81[v82] = v83;
      if (*((unsigned char *)v68 + v82) != 2) {
        ++v83;
      }
      ++v82;
    }
    while (M != v82);
  }
  else if (v8->_select)
  {
    v75 = 0;
  }
  else
  {
    v74 = malloc_type_calloc(v8->_M, 1uLL, 0x100004077774924uLL);
    v75 = v74;
    if (!M) {
      goto LABEL_105;
    }
    uint64_t v76 = 0;
    char v77 = 0;
    do
    {
      v74[v76] = v77;
      if (*((unsigned char *)v68 + v76) != 2) {
        ++v77;
      }
      ++v76;
    }
    while (M != v76);
  }
  if (M)
  {
    unsigned int v84 = M - 1;
    do
    {
      uint64_t v85 = v84;
      if (*((unsigned char *)v68 + v84) == 2) {
        *((unsigned char *)v68 + v84) = 0;
      }
      --v84;
    }
    while (v85);
  }
LABEL_105:
  v86 = (char *)malloc_type_calloc((M >> 3) + 1, 1uLL, 0x100004077774924uLL);
  v87 = v86;
  if ((M & 0xFFFFFFF8) == 0)
  {
    LODWORD(v88) = 0;
    unsigned int v92 = M - 2;
    char v93 = *((unsigned char *)v68 + (M - 1)) != 0;
LABEL_113:
    uint64_t v94 = v92;
    do
    {
      char v93 = (*((unsigned char *)v68 + v94) != 0) | (2 * v93);
      if (!v94) {
        break;
      }
      --v92;
      --v94;
    }
    while (v92 >= v88);
    goto LABEL_116;
  }
  unint64_t v88 = 0;
  uint64_t v89 = 6;
  do
  {
    char v90 = 2 * (*((unsigned char *)v68 + (v88 | 7)) != 0);
    unint64_t v91 = v89;
    do
      char v90 = 2 * (v90 | (*((unsigned char *)v68 + v91--) != 0));
    while (v91 >= (v88 | 1));
    v86[v88 >> 3] = v90 | (*((unsigned char *)v68 + v88) != 0);
    v88 += 8;
    v89 += 8;
  }
  while (v88 < (M & 0xFFFFFFF8));
  unsigned int v92 = M - 2;
  char v93 = *((unsigned char *)v68 + (M - 1)) != 0;
  if ((int)M - 2 >= v88) {
    goto LABEL_113;
  }
LABEL_116:
  v86[M >> 3] = v93;
  free(v68);
  v8->_g = v87;
  v8->_rankTable = v75;
  result = (NSSharedKeySet *)malloc_type_calloc(v31, 8uLL, 0x80040B8603338uLL);
  v8->_keys = (id *)&result->super.isa;
  uint64_t v96 = v125;
  if (!v31)
  {
LABEL_129:
    if (v96)
    {
      id v118 = objc_alloc((Class)objc_opt_class());
      uint64_t v119 = [v118 initWithKeys:v124 count:v96];
      if (v119)
      {
        v8->_subSharedKeySet = (NSSharedKeySet *)v119;
      }
      else
      {

        unint64_t v8 = 0;
      }
    }
    free(v66);
    goto LABEL_134;
  }
  uint64_t v97 = 0;
  unsigned int v98 = 1;
  while (1)
  {
    v99 = v8->_seeds;
    unsigned int factor = v8->_factor;
    rankTable = (unsigned int *)v8->_rankTable;
    g = v8->_g;
    int v103 = v8->_select;
    uint64_t v104 = v130[v97];
    if (v8->_algorithmType == 1)
    {
      int v108 = *v99 - 559038729;
      int v107 = v108 + v99[1];
      int v106 = v108 + HIDWORD(v104);
    }
    else
    {
      if (v8->_algorithmType) {
        break;
      }
      unsigned int v105 = v99[1];
      int v106 = *v99 - 559038733;
      int v107 = v106 + v105;
      int v108 = v106;
    }
    HIDWORD(v109) = v106;
    LODWORD(v109) = v106;
    int v110 = (v107 ^ v106) - (v109 >> 18);
    HIDWORD(v109) = v110;
    LODWORD(v109) = v110;
    int v111 = ((v108 + v104) ^ v110) - (v109 >> 21);
    HIDWORD(v109) = v111;
    LODWORD(v109) = v111;
    int v112 = (v111 ^ v106) - (v109 >> 7);
    HIDWORD(v109) = v112;
    LODWORD(v109) = v112;
    int v113 = (v112 ^ v110) - (v109 >> 16);
    HIDWORD(v109) = v113;
    LODWORD(v109) = v113;
    HIDWORD(v109) = (v113 ^ v111) - (v109 >> 28);
    LODWORD(v109) = HIDWORD(v109);
    HIDWORD(v109) = (HIDWORD(v109) ^ v112) - (v109 >> 18);
    LODWORD(v109) = HIDWORD(v109);
    unint64_t v114 = 2 * (((HIDWORD(v109) ^ v113) - (v109 >> 8)) % factor);
    int v115 = HIDWORD(v109) % factor;
    v139[0] = v114;
    v139[1] = (2 * v115) | 1;
    uint64_t v116 = v139[((g[(unint64_t)(2 * v115) >> 3] >> ((2 * v115) & 6 | 1)) ^ (g[v114 >> 3] >> (v114 & 6))) & 1];
    if (v103 == 2)
    {
      uint64_t v117 = rankTable[v116];
      goto LABEL_128;
    }
    if (v103 == 1)
    {
      uint64_t v117 = *((unsigned __int16 *)rankTable + v116);
      goto LABEL_128;
    }
    if (v103) {
      break;
    }
    uint64_t v117 = *((unsigned __int8 *)rankTable + v116);
LABEL_128:
    result = (NSSharedKeySet *)[v129[v97] copyWithZone:0];
    v8->_keys[v117] = result;
    uint64_t v97 = v98;
    BOOL v38 = v31 > v98++;
    if (!v38) {
      goto LABEL_129;
    }
  }
  __break(1u);
  return result;
}

- (BOOL)isEmpty
{
  return self->_numKey == 0;
}

- (NSSharedKeySet)init
{
  return [(NSSharedKeySet *)self initWithKeys:0 count:0];
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v10 = __CFExceptionProem((objc_class *)self, a2);
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: this object can only be encoded by a keyed coder", v10);
    uint64_t v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0];
    objc_exception_throw(v12);
  }
  [a3 encodeInt64:self->_numKey forKey:@"NS.numKey"];
  if (self->_numKey)
  {
    [a3 encodeInt32:self->_select forKey:@"NS.select"];
    [a3 encodeInt64:self->_factor forKey:@"NS.factor"];
    [a3 encodeInt64:*self->_seeds forKey:@"NS.seed0"];
    [a3 encodeInt64:self->_seeds[1] forKey:@"NS.seed1"];
    [a3 encodeInt64:self->_M forKey:@"NS.M"];
    int select = self->_select;
    if (select == 2)
    {
      rankTable = self->_rankTable;
      uint64_t M = 4 * self->_M;
    }
    else if (select == 1)
    {
      rankTable = self->_rankTable;
      uint64_t M = 2 * self->_M;
    }
    else
    {
      if (self->_select)
      {
LABEL_11:
        [a3 encodeBytes:self->_g length:((unint64_t)self->_M >> 3) + 1 forKey:@"NS.g"];
        [a3 encodeObject:self->_subSharedKeySet forKey:@"NS.subskset"];
        objc_msgSend(a3, "encodeObject:forKey:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", self->_keys, self->_numKey), @"NS.keys");
        uint64_t v9 = self->_algorithmType & 1;
        [a3 encodeInteger:v9 forKey:@"NS.algorithmType"];
        return;
      }
      rankTable = self->_rankTable;
      uint64_t M = self->_M;
    }
    [a3 encodeBytes:rankTable length:M forKey:@"NS.rankTable"];
    goto LABEL_11;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSSharedKeySet)initWithCoder:(id)a3
{
  uint64_t v56 = *(void *)off_1ECE0A5B0;
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v49 = __CFExceptionProem((objc_class *)self, a2);
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: this object can only be decoded by a keyed coder", v49);
    goto LABEL_8;
  }
  objc_getClass("NSKeyedUnarchiver");
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    id v7 = a3;
  }
  else {
    id v7 = 0;
  }
  uint64_t v8 = [a3 decodeInt64ForKey:@"NS.numKey"];
  if (v8 >= 0x7FFFFFFF)
  {
    uint64_t v48 = __CFExceptionProem((objc_class *)self, a2);
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: extreme number of keys", v48);
LABEL_8:
    uint64_t v10 = _CFAutoreleasePoolAddObject(0, (uint64_t)v9);

    [a3 failWithError:__archiveIsCorrupt_0(v10)];
    return 0;
  }
  uint64_t v12 = v8;
  if (!v8) {
    return self;
  }
  if (isKindOfClass)
  {
    uint64_t v13 = objc_opt_new();
    if (!v13)
    {
      uint64_t v50 = __CFExceptionProem((objc_class *)self, a2);
      CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: unable to unarchive - memory failure", v50);
      goto LABEL_8;
    }
    int v14 = (void *)v13;
    [a3 replaceObject:self withObject:v13];
  }
  else
  {
    int v14 = 0;
  }
  uint64_t v15 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.subskset"];
  if (v15)
  {
    uint64_t v16 = objc_opt_class();
    if (v16 != objc_opt_class())
    {
      uint64_t v17 = __CFExceptionProem((objc_class *)self, a2);
      uint64_t v18 = objc_opt_class();
      CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: unexpected shared key set class: %@", v17, v18);
      uint64_t v20 = _CFAutoreleasePoolAddObject(0, (uint64_t)v19);

      [a3 failWithError:__archiveIsCorrupt_0(v20)];
      goto LABEL_21;
    }
    self->_subSharedKeySet = (NSSharedKeySet *)v15;
    if (v15 >= 1) {
      id v25 = (id)v15;
    }
LABEL_28:
    int v24 = 1;
    if (!v14) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  if (![a3 error])
  {
    self->_subSharedKeySet = 0;
    goto LABEL_28;
  }
  uint64_t v21 = __CFExceptionProem((objc_class *)self, a2);
  CFStringRef v22 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: unable to unarchive - invalid class", v21);
  uint64_t v23 = _CFAutoreleasePoolAddObject(0, (uint64_t)v22);

  [a3 failWithError:__archiveIsCorrupt_0(v23)];
LABEL_21:
  int v24 = 0;
  if (v14)
  {
LABEL_29:
    [v7 replaceObject:v14 withObject:self];
  }
LABEL_30:
  if (!v24) {
    return 0;
  }
  Class v26 = objc_lookUpClass("NSArray");
  objc_lookUpClass("NSDictionary");
  block = off_1ECE0A5A0;
  uint64_t v52 = 3221225472;
  unsigned int v53 = __32__NSSharedKeySet_initWithCoder___block_invoke;
  unsigned int v54 = &unk_1ECDB0298;
  Class v55 = v26;
  if (initWithCoder__onceToken_0 != -1) {
    dispatch_once(&initWithCoder__onceToken_0, &block);
  }
  uint64_t v27 = (void *)[a3 allowedClasses];
  unint64_t v28 = objc_msgSend((id)objc_msgSend(v27, "setByAddingObjectsFromSet:", initWithCoder__oPlistClasses_0), "mutableCopy");
  [v28 removeObject:objc_opt_class()];
  unsigned int v29 = (void *)[a3 decodeObjectOfClasses:v28 forKey:@"NS.keys"];

  if (!v29 && [a3 error])
  {
    uint64_t v38 = __CFExceptionProem((objc_class *)self, a2);
    CFStringRef v39 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: unable to unarchive - invalid class", v38);
    uint64_t v40 = _CFAutoreleasePoolAddObject(0, (uint64_t)v39);

    [a3 failWithError:__archiveIsCorrupt_0(v40)];
    return 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v30 = objc_opt_class();
    CFStringRef v31 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"unexpected mutable keys (%@)", v30);
    uint64_t v32 = _CFAutoreleasePoolAddObject(0, (uint64_t)v31);

    [a3 failWithError:__archiveIsCorrupt_0(v32)];
    return 0;
  }
  if ((_NSIsNSArray((uint64_t)v29) & 1) == 0)
  {
    uint64_t v41 = objc_opt_class();
    CFStringRef v42 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"unexpected keys (%@)", v41);
    uint64_t v43 = _CFAutoreleasePoolAddObject(0, (uint64_t)v42);

    [a3 failWithError:__archiveIsCorrupt_0(v43)];
    return 0;
  }
  uint64_t v33 = [v29 count];
  if (v33 != v12)
  {
    uint64_t v44 = [v29 count];
    CFStringRef v45 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"key count mismatch %lu vs %u", v44, v12, block, v52, v53, v54, v55);
    uint64_t v46 = _CFAutoreleasePoolAddObject(0, (uint64_t)v45);

    [a3 failWithError:__archiveIsCorrupt_0(v46)];
    return 0;
  }
  uint64_t v34 = v33 - 1;
  while (v34 != -1)
  {
    [v29 objectAtIndexedSubscript:v34];
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      --v34;
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        continue;
      }
    }
    uint64_t v35 = objc_opt_class();
    CFStringRef v36 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"unexpected recursive keys (%@)", v35);
    uint64_t v37 = _CFAutoreleasePoolAddObject(0, (uint64_t)v36);

    [a3 failWithError:__archiveIsCorrupt_0(v37)];
    return 0;
  }
  double v47 = +[NSArray arrayWithArray:v29];
  [(NSMutableArray *)v47 addObjectsFromArray:[(NSSharedKeySet *)self->_subSharedKeySet allKeys]];

  return +[NSSharedKeySet keySetWithKeys:v47];
}

NSSet *__32__NSSharedKeySet_initWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  Class v2 = objc_lookUpClass("NSString");
  Class v3 = objc_lookUpClass("NSNumber");
  Class v4 = objc_lookUpClass("NSDate");
  unint64_t v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, objc_lookUpClass("NSURL"), 0);
  initWithCoder__oPlistClasses_0 = (uint64_t)v5;

  return v5;
}

- (unint64_t)maximumIndex
{
  return [(NSSharedKeySet *)self count] - 1;
}

- (id)allKeys
{
  v20[1] = *(void *)off_1ECE0A5B0;
  if (self->_numKey)
  {
    Class v2 = self;
    unint64_t v3 = [(NSSharedKeySet *)self count];
    if (v3 >> 60)
    {
      CFStringRef v18 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v3);
      CFStringRef v19 = +[NSException exceptionWithName:@"NSGenericException" reason:v18 userInfo:0];
      CFRelease(v18);
      objc_exception_throw(v19);
    }
    if (v3 <= 1) {
      unint64_t v3 = 1;
    }
    unint64_t v5 = MEMORY[0x1F4188790](v3, v4);
    id v7 = (char *)v20 - v6;
    v20[0] = 0;
    if (v8 >= 0x101)
    {
      id v7 = (char *)_CFCreateArrayStorage(v5, 0, v20);
      CFStringRef v9 = (id *)v7;
    }
    else
    {
      CFStringRef v9 = 0;
    }
    LODWORD(v11) = 0;
    do
    {
      memmove(&v7[8 * v11], v2->_keys, 8 * v2->_numKey);
      uint64_t v11 = (v2->_numKey + v11);
      Class v2 = v2->_subSharedKeySet;
    }
    while (v2);
    if (v9)
    {
      if (v11)
      {
        uint64_t v12 = v9;
        uint64_t v13 = v11;
        do
        {
          id v14 = *v12++;
          --v13;
        }
        while (v13);
      }
      uint64_t v15 = [NSArray alloc];
      uint64_t v16 = -[NSArray _initByAdoptingBuffer:count:size:](v15, "_initByAdoptingBuffer:count:size:", v9, v11, v11, v20[0]);
    }
    else
    {
      uint64_t v17 = [NSArray alloc];
      uint64_t v16 = -[NSArray initWithObjects:count:](v17, "initWithObjects:count:", v7, v11, v20[0]);
    }
    return v16;
  }
  else
  {
    return +[NSArray array];
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v35 = *(void *)off_1ECE0A5B0;
  if (self == a3) {
    return 1;
  }
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [(NSSharedKeySet *)self count];
      if (v5 == [a3 count])
      {
        unint64_t v6 = [(NSSharedKeySet *)self keySetCount];
        if (v6 == [a3 keySetCount])
        {
          id v7 = [(NSSharedKeySet *)self allKeys];
          unint64_t v8 = (void *)[a3 allKeys];
          uint64_t v9 = [v7 count];
          if (v9 == [v8 count])
          {
            long long v33 = 0u;
            long long v34 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            uint64_t v10 = [v7 countByEnumeratingWithState:&v31 objects:v30 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = 0;
              uint64_t v13 = *(void *)v32;
LABEL_9:
              uint64_t v14 = 0;
              v12 += v11;
              while (1)
              {
                if (*(void *)v32 != v13) {
                  objc_enumerationMutation(v7);
                }
                if ([a3 indexForKey:*(void *)(*((void *)&v31 + 1) + 8 * v14)] == 0x7FFFFFFFFFFFFFFFLL) {
                  break;
                }
                if (v11 == ++v14)
                {
                  uint64_t v11 = [v7 countByEnumeratingWithState:&v31 objects:v30 count:16];
                  if (v11) {
                    goto LABEL_9;
                  }
                  goto LABEL_18;
                }
              }
            }
            else
            {
              uint64_t v12 = 0;
LABEL_18:
              if (v12 == v5)
              {
                long long v28 = 0u;
                long long v29 = 0u;
                long long v26 = 0u;
                long long v27 = 0u;
                uint64_t v16 = [v8 countByEnumeratingWithState:&v26 objects:v25 count:16];
                if (v16)
                {
                  uint64_t v17 = v16;
                  uint64_t v18 = 0;
                  uint64_t v19 = *(void *)v27;
LABEL_21:
                  uint64_t v20 = 0;
                  v18 += v17;
                  while (1)
                  {
                    if (*(void *)v27 != v19) {
                      objc_enumerationMutation(v8);
                    }
                    if ([(NSSharedKeySet *)self indexForKey:*(void *)(*((void *)&v26 + 1) + 8 * v20)] == 0x7FFFFFFFFFFFFFFFLL)break; {
                    if (v17 == ++v20)
                    }
                    {
                      uint64_t v17 = [v8 countByEnumeratingWithState:&v26 objects:v25 count:16];
                      if (v17) {
                        goto LABEL_21;
                      }
                      goto LABEL_29;
                    }
                  }
                }
                else
                {
                  uint64_t v18 = 0;
LABEL_29:
                  if (v18 == v5)
                  {
                    unint64_t v21 = [(NSSharedKeySet *)self maximumIndex];
                    if (v21 == [a3 maximumIndex])
                    {
                      uint64_t v22 = 0;
                      while (1)
                      {
                        uint64_t v23 = (void *)[a3 keyAtIndex:v22];
                        if ((objc_msgSend(v23, "isEqual:", -[NSSharedKeySet keyAtIndex:](self, "keyAtIndex:", -[NSSharedKeySet indexForKey:](self, "indexForKey:", v23))) & 1) == 0)break; {
                        if (++v22 > v21)
                        }
                        {
                          BOOL v24 = [(NSSharedKeySet *)self isEmpty];
                          return v24 ^ [a3 isEmpty] ^ 1;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return 0;
}

- (unint64_t)keySetCount
{
  for (unint64_t i = 0; self; self = self->_subSharedKeySet)
    ++i;
  return i;
}

- (id)debugDescription
{
  uint64_t v22 = *(void *)off_1ECE0A5B0;
  unint64_t v3 = (void *)[(objc_class *)objc_lookUpClass("NSMutableString") string];
  [v3 appendFormat:@"<%@: %p>\n", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"  uint64_t numKey = %u\n", self->_numKey);
  objc_msgSend(v3, "appendFormat:", @"  uint64_t M = %u (should always be even)\n", self->_M);
  objc_msgSend(v3, "appendFormat:", @"  unsigned int factor = %u (should always be prime)\n", self->_factor);
  [v3 appendFormat:@"  keys = [\n"];
  if (self->_numKey)
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = self->_keys[v4];
      [v3 appendFormat:@"    <%@: %p>, 0x%lx\n", objc_opt_class(), v5, objc_msgSend(v5, "hash")];
      ++v4;
    }
    while (v4 < self->_numKey);
  }
  [v3 appendFormat:@"  ]\n"];
  objc_msgSend(v3, "appendFormat:", @"  seeds[0] = 0x%xu\n", *self->_seeds);
  objc_msgSend(v3, "appendFormat:", @"  seeds[1] = 0x%xu\n", self->_seeds[1]);
  int select = self->_select;
  if (self->_select)
  {
    if (select == 1)
    {
      id v7 = @"unsigned short";
    }
    else
    {
      id v7 = @"unknown";
      if (select == 2) {
        id v7 = @"unsigned int";
      }
    }
  }
  else
  {
    id v7 = @"unsigned char";
  }
  [v3 appendFormat:@"  ranktable = %p (int select = %u (%@)) [\n", self->_rankTable, self->_select, v7];
  int v8 = self->_select;
  if (self->_select)
  {
    if (v8 == 1)
    {
      if (self->_M)
      {
        unint64_t v11 = 0;
        do
        {
          objc_msgSend(v3, "appendFormat:", @"    %d - %u\n", v11, *((unsigned __int16 *)self->_rankTable + v11));
          ++v11;
        }
        while (v11 < self->_M);
      }
    }
    else if (v8 == 2 && self->_M)
    {
      unint64_t v9 = 0;
      do
      {
        objc_msgSend(v3, "appendFormat:", @"    %d - %u\n", v9, *((unsigned int *)self->_rankTable + v9));
        ++v9;
      }
      while (v9 < self->_M);
    }
  }
  else if (self->_M)
  {
    unint64_t v10 = 0;
    do
    {
      objc_msgSend(v3, "appendFormat:", @"    %d - %u\n", v10, *((unsigned __int8 *)self->_rankTable + v10));
      ++v10;
    }
    while (v10 < self->_M);
  }
  [v3 appendFormat:@"  ]\n"];
  if (self->_algorithmType) {
    uint64_t v12 = @"use_full_hash_64";
  }
  else {
    uint64_t v12 = @"clamp_hash_to_32";
  }
  [v3 appendFormat:@"  algorithmType: %@\n", v12];
  objc_msgSend(v3, "appendFormat:", @"  g = %p\n", self->_g);
  [v3 appendFormat:@"    packed bits (binary):\n      "];
  unint64_t v13 = 0;
  do
  {
    int8x16_t v14 = (int8x16_t)vdupq_n_s32(self->_g[v13]);
    v15.i64[0] = 0x31003100310031;
    v15.i64[1] = 0x31003100310031;
    v16.i64[0] = 0x30003000300030;
    v16.i64[1] = 0x30003000300030;
    int8x16_t v21 = vbslq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v14, (int8x16_t)xmmword_182EDED30)), (int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v14, (int8x16_t)xmmword_182EDED40))), v16, v15);
    [v3 appendFormat:@"%@ ", -[objc_class stringWithCharacters:length:](objc_lookUpClass("NSString"), "stringWithCharacters:length:", &v21, 8)];
  }
  while (v13++ < (unint64_t)self->_M >> 3);
  [v3 appendFormat:@"\n"];
  if (self->_subSharedKeySet)
  {
    Class v18 = objc_lookUpClass("NSMutableString");
    [v3 appendFormat:@"  subSharedKeySet = %@\n", -[objc_class stringWithFormat:](v18, "stringWithFormat:", @"<%@: %p>", objc_opt_class(), self->_subSharedKeySet)];
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", @"  subSharedKeySet = nil\n", v20);
  }
  return v3;
}

- (char)g
{
  return self->_g;
}

- (void)setG:(char *)a3
{
  self->_g = a3;
}

- (unsigned)select
{
  return self->_select;
}

- (void)setSelect:(unsigned __int8)a3
{
  self->_int select = a3;
}

- (void)rankTable
{
  return self->_rankTable;
}

- (void)setRankTable:(void *)a3
{
  self->_rankTable = a3;
}

- (unsigned)M
{
  return self->_M;
}

- (void)setM:(unsigned int)a3
{
  self->_uint64_t M = a3;
}

- (unsigned)factor
{
  return self->_factor;
}

- (void)setFactor:(unsigned int)a3
{
  self->_unsigned int factor = a3;
}

- (unsigned)numKey
{
  return self->_numKey;
}

- (void)setNumKey:(unsigned int)a3
{
  self->_uint64_t numKey = a3;
}

- (unsigned)seeds
{
  return self->_seeds;
}

- (void)setSeeds:(unsigned int *)a3
{
  self->_seeds = a3;
}

- (id)keys
{
  return self->_keys;
}

- (void)setKeys:(id *)a3
{
  self->_keys = a3;
}

- (NSSharedKeySet)subSharedKeySet
{
  return (NSSharedKeySet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSubSharedKeySet:(id)a3
{
}

@end