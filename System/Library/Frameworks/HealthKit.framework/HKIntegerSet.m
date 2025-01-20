@interface HKIntegerSet
+ (BOOL)supportsSecureCoding;
- (BOOL)containsInteger:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (HKIntegerSet)init;
- (HKIntegerSet)initWithArray:(id)a3;
- (HKIntegerSet)initWithCapacity:(unint64_t)a3;
- (HKIntegerSet)initWithCoder:(id)a3;
- (HKIntegerSet)initWithIndex:(int64_t)a3;
- (HKIntegerSet)initWithSet:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateIntegersUsingBlock:(id)a3;
@end

@implementation HKIntegerSet

- (HKIntegerSet)initWithCapacity:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HKIntegerSet;
  v4 = [(HKIntegerSet *)&v9 init];
  if (v4
    && (memset(&v8, 0, sizeof(v8)),
        CFMutableSetRef v5 = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, &v8),
        (v4->_set = v5) == 0))
  {
    v6 = 0;
  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (void)dealloc
{
  set = self->_set;
  if (set) {
    CFRelease(set);
  }
  v4.receiver = self;
  v4.super_class = (Class)HKIntegerSet;
  [(HKIntegerSet *)&v4 dealloc];
}

- (HKIntegerSet)init
{
  return [(HKIntegerSet *)self initWithCapacity:0];
}

- (HKIntegerSet)initWithIndex:(int64_t)a3
{
  objc_super v4 = [(HKIntegerSet *)self initWithCapacity:1];
  CFMutableSetRef v5 = v4;
  if (v4) {
    CFSetAddValue(v4->_set, (const void *)a3);
  }
  return v5;
}

- (HKIntegerSet)initWithSet:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFMutableSetRef v5 = -[HKIntegerSet initWithCapacity:](self, "initWithCapacity:", [v4 count]);
  if (v5)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          CFSetAddValue(v5->_set, (const void *)objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10++), "integerValue", (void)v12));
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (HKIntegerSet)initWithArray:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFMutableSetRef v5 = -[HKIntegerSet initWithCapacity:](self, "initWithCapacity:", [v4 count]);
  if (v5)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          CFSetAddValue(v5->_set, (const void *)objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10++), "integerValue", (void)v12));
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (id)description
{
  if (!self->_set)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v12 = NSStringFromSelector(a2);
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKIntegerSet.m", 94, @"_set is nil", v12);
  }
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[HKIntegerSet count](self, "count"));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __27__HKIntegerSet_description__block_invoke;
  v14[3] = &unk_1E58C4DF8;
  id v15 = v3;
  id v4 = v3;
  [(HKIntegerSet *)self enumerateIntegersUsingBlock:v14];
  v13.receiver = self;
  v13.super_class = (Class)HKIntegerSet;
  CFMutableSetRef v5 = [(HKIntegerSet *)&v13 description];
  unint64_t v6 = [(HKIntegerSet *)self count];
  uint64_t v7 = [v4 componentsJoinedByString:@", "];
  uint64_t v8 = [v5 stringByAppendingFormat:@" count %d: [%@]", v6, v7];

  return v8;
}

void __27__HKIntegerSet_description__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(NSString, "stringWithFormat:", @"%ld", a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (void)enumerateIntegersUsingBlock:(id)a3
{
  id v5 = a3;
  set = self->_set;
  id v9 = v5;
  if (!set)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = NSStringFromSelector(a2);
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKIntegerSet.m", 105, @"_set is nil", v8);

    id v5 = v9;
    set = self->_set;
  }
  CFSetApplyFunction(set, (CFSetApplierFunction)HKIntegerSetEnumerateEntry, v5);
}

- (BOOL)containsInteger:(int64_t)a3
{
  set = self->_set;
  if (!set)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = NSStringFromSelector(a2);
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKIntegerSet.m", 111, @"_set is nil", v9);

    set = self->_set;
  }
  return CFSetContainsValue(set, (const void *)a3) != 0;
}

- (unint64_t)count
{
  set = self->_set;
  if (!set)
  {
    unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = NSStringFromSelector(a2);
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKIntegerSet.m", 117, @"_set is nil", v7);

    set = self->_set;
  }

  return CFSetGetCount(set);
}

- (unint64_t)hash
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __20__HKIntegerSet_hash__block_invoke;
  v4[3] = &unk_1E58BEF70;
  v4[4] = &v5;
  [(HKIntegerSet *)self enumerateIntegersUsingBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __20__HKIntegerSet_hash__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) ^= a2;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 count];
    if (v6 == [(HKIntegerSet *)self count])
    {
      uint64_t v12 = 0;
      objc_super v13 = &v12;
      uint64_t v14 = 0x2020000000;
      char v15 = 1;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __24__HKIntegerSet_isEqual___block_invoke;
      v9[3] = &unk_1E58C8098;
      id v10 = v5;
      v11 = &v12;
      [(HKIntegerSet *)self enumerateIntegersUsingBlock:v9];
      BOOL v7 = *((unsigned char *)v13 + 24) != 0;

      _Block_object_dispose(&v12, 8);
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __24__HKIntegerSet_isEqual___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) containsInteger:a2];
  if ((result & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  set = self->_set;
  if (!set)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    id v9 = NSStringFromSelector(a2);
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKIntegerSet.m", 155, @"_set is nil", v9);

    set = self->_set;
  }
  id v5 = [[HKIntegerSet alloc] initWithCapacity:CFSetGetCount(set)];
  if (v5) {
    CopySet(self, v5);
  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  set = self->_set;
  if (!set)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    id v9 = NSStringFromSelector(a2);
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKIntegerSet.m", 169, @"_set is nil", v9);

    set = self->_set;
  }
  id v5 = [[HKMutableIntegerSet alloc] initWithCapacity:CFSetGetCount(set)];
  if (v5) {
    CopySet(self, v5);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  if (!self->_set)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = NSStringFromSelector(a2);
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKIntegerSet.m", 190, @"_set is nil", v12);
  }
  size_t v5 = [(HKIntegerSet *)self count];
  uint64_t v6 = (const void **)malloc_type_calloc(v5, 8uLL, 0x100004000313F17uLL);
  if (v6)
  {
    BOOL v7 = v6;
    uint64_t v8 = v13;
    if (!v5) {
      goto LABEL_8;
    }
    CFSetGetValues(self->_set, v7);
    [v13 encodeArrayOfObjCType:"q" count:v5 at:v7];
    free(v7);
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v10 = NSStringFromSelector(a2);
    [v9 handleFailureInMethod:a2, self, @"HKIntegerSet.m", 195, @"%@ falled to allocate space to encode %d items", v10, v5 object file lineNumber description];

    size_t v5 = 0;
  }
  [v13 encodeInteger:v5 forKey:@"count"];
  uint64_t v8 = v13;
LABEL_8:
}

- (HKIntegerSet)initWithCoder:(id)a3
{
  id v5 = a3;
  size_t v6 = [v5 decodeIntegerForKey:@"count"];
  BOOL v7 = [(HKIntegerSet *)self initWithCapacity:v6];
  if (!v7) {
    goto LABEL_9;
  }
  if (v6)
  {
    uint64_t v8 = (const void **)malloc_type_calloc(v6, 8uLL, 0x100004000313F17uLL);
    if (v8)
    {
      id v9 = v8;
      [v5 decodeArrayOfObjCType:"q" count:v6 at:v8];
      for (uint64_t i = 0; i != v6; ++i)
        CFSetAddValue(v7->_set, v9[i]);
      free(v9);
      goto LABEL_7;
    }
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = NSStringFromSelector(a2);
    [v12 handleFailureInMethod:a2, v7, @"HKIntegerSet.m", 228, @"%@ falled to allocate space to decode %d items", v13, v6 object file lineNumber description];

LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
LABEL_7:
  v11 = v7;
LABEL_10:

  return v11;
}

@end