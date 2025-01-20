@interface NSSortDescriptor
+ (BOOL)supportsSecureCoding;
+ (NSSortDescriptor)sortDescriptorWithKey:(NSString *)key ascending:(BOOL)ascending;
+ (NSSortDescriptor)sortDescriptorWithKey:(NSString *)key ascending:(BOOL)ascending comparator:(NSComparator)cmptr;
+ (NSSortDescriptor)sortDescriptorWithKey:(NSString *)key ascending:(BOOL)ascending selector:(SEL)selector;
+ (NSSortDescriptor)sortDescriptorWithKey:(id)a3;
+ (NSSortDescriptor)sortDescriptorWithKey:(id)a3 ascending:(BOOL)a4 reverseNullOrder:(BOOL)a5;
+ (id)_defaultSelectorName;
+ (void)initialize;
- (BOOL)_isEqualToSortDescriptor:(id)a3;
- (BOOL)ascending;
- (BOOL)isEqual:(id)a3;
- (BOOL)reverseNullOrder;
- (NSComparator)comparator;
- (NSComparisonResult)compareObject:(id)object1 toObject:(id)object2;
- (NSSortDescriptor)initWithCoder:(NSCoder *)coder;
- (NSSortDescriptor)initWithKey:(NSString *)key ascending:(BOOL)ascending;
- (NSSortDescriptor)initWithKey:(NSString *)key ascending:(BOOL)ascending comparator:(NSComparator)cmptr;
- (NSSortDescriptor)initWithKey:(NSString *)key ascending:(BOOL)ascending selector:(SEL)selector;
- (NSSortDescriptor)initWithKey:(id)a3;
- (NSSortDescriptor)initWithKey:(id)a3 ascending:(BOOL)a4 reverseNullOrder:(BOOL)a5;
- (NSSortDescriptor)initWithKey:(id)a3 ascending:(BOOL)a4 reverseNullOrder:(BOOL)a5 selector:(SEL)a6;
- (NSString)key;
- (SEL)selector;
- (id)_selectorName;
- (id)description;
- (id)replacementObjectForPortCoder:(id)a3;
- (id)reversedSortDescriptor;
- (void)_disallowEvaluation;
- (void)_setAscending:(BOOL)a3;
- (void)_setKey:(id)a3;
- (void)_setSelectorName:(id)a3;
- (void)allowEvaluation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setReverseNullOrder:(BOOL)a3;
@end

@implementation NSSortDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_isEqualToSortDescriptor:(id)a3
{
  int v5 = [(NSSortDescriptor *)self ascending];
  if (v5 == [a3 ascending]
    && (int v6 = [(NSSortDescriptor *)self reverseNullOrder],
        v6 == [a3 reverseNullOrder]))
  {
    v10 = [(NSSortDescriptor *)self key];
    BOOL v7 = v10 == (NSString *)[a3 key]
      || -[NSString isEqualToString:](-[NSSortDescriptor key](self, "key"), "isEqualToString:", [a3 key]);
  }
  else
  {
    BOOL v7 = 0;
  }
  if ((self->_sortDescriptorFlags & 2) != 0) {
    char v8 = self->_selectorOrBlock == (id)*((void *)a3 + 4);
  }
  else {
    char v8 = objc_msgSend(-[NSSortDescriptor _selectorName](self, "_selectorName"), "isEqualToString:", objc_msgSend(a3, "_selectorName"));
  }
  return v7 & v8;
}

- (id)description
{
  unint64_t sortDescriptorFlags = self->_sortDescriptorFlags;
  if (self->_key) {
    key = self->_key;
  }
  else {
    key = (NSString *)&stru_1ECA5C228;
  }
  if ([(NSSortDescriptor *)self ascending]) {
    int v5 = @"ascending";
  }
  else {
    int v5 = @"descending";
  }
  BOOL v6 = [(NSSortDescriptor *)self reverseNullOrder];
  if ((sortDescriptorFlags & 2) != 0)
  {
    if (v6)
    {
      BOOL v8 = [(NSSortDescriptor *)self ascending];
      v9 = @"NULLS FIRST";
      if (v8) {
        v9 = @"NULLS LAST";
      }
    }
    else
    {
      v9 = @"NO";
    }
    return +[NSString stringWithFormat:@"(%@, %@, %@, BLOCK(%p))", key, v5, v9, self->_selectorOrBlock];
  }
  else
  {
    if (v6)
    {
      if ([(NSSortDescriptor *)self ascending]) {
        BOOL v7 = @"NULLS LAST";
      }
      else {
        BOOL v7 = @"NULLS FIRST";
      }
    }
    else
    {
      BOOL v7 = @"NO";
    }
    return +[NSString stringWithFormat:@"(%@, %@, %@, %@)", key, v5, v7, [(NSSortDescriptor *)self _selectorName]];
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((self->_sortDescriptorFlags & 2) != 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSSortDescriptor using Blocks cannot be encoded." userInfo:0]);
  }
  BOOL v5 = [(NSSortDescriptor *)self ascending];
  BOOL v11 = v5;
  BOOL v6 = [(NSSortDescriptor *)self reverseNullOrder];
  id v7 = [(NSSortDescriptor *)self _selectorName];
  int v8 = [a3 allowsKeyedCoding];
  key = self->_key;
  if (v8)
  {
    if (key) {
      [a3 encodeObject:key forKey:@"NSKey"];
    }
    [a3 encodeBool:v5 forKey:@"NSAscending"];
    if (v7) {
      [a3 encodeObject:v7 forKey:@"NSSelector"];
    }
    [a3 encodeBool:v6 forKey:@"NSReverseNullOrder"];
  }
  else
  {
    [a3 encodeObject:key];
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "c", &v11);
    if (v6)
    {
      v10 = _NSOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_181795000, v10, OS_LOG_TYPE_ERROR, "NSCoding is deprecated, and does not support NSSortDescriptor's reverseNullOrder property.  Please use keyed archiving instead.", buf, 2u);
      }
    }
    [a3 encodeObject:v7];
  }
}

- (id)_selectorName
{
  if ((self->_sortDescriptorFlags & 2) != 0) {
    return 0;
  }
  selector = self->_selector;
  if (selector) {
    return NSStringFromSelector(selector);
  }
  else {
    return self->_selectorOrBlock;
  }
}

+ (NSSortDescriptor)sortDescriptorWithKey:(NSString *)key ascending:(BOOL)ascending
{
  return (NSSortDescriptor *)[a1 sortDescriptorWithKey:key ascending:ascending selector:sel_compare_];
}

- (void)allowEvaluation
{
  self->_sortDescriptorFlags &= ~4uLL;
}

- (id)reversedSortDescriptor
{
  unint64_t sortDescriptorFlags = self->_sortDescriptorFlags;
  v4 = objc_opt_class();
  BOOL v5 = [(NSSortDescriptor *)self key];
  uint64_t v6 = [(NSSortDescriptor *)self ascending] ^ 1;
  if ((sortDescriptorFlags & 2) != 0)
  {
    NSComparator v9 = [(NSSortDescriptor *)self comparator];
    return (id)[v4 sortDescriptorWithKey:v5 ascending:v6 comparator:v9];
  }
  else
  {
    id v7 = [(NSSortDescriptor *)self selector];
    return (id)[v4 sortDescriptorWithKey:v5 ascending:v6 selector:v7];
  }
}

- (NSString)key
{
  v2 = self->_key;

  return v2;
}

- (NSComparisonResult)compareObject:(id)object1 toObject:(id)object2
{
  if ((self->_sortDescriptorFlags & 4) != 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Sort descriptor was decoded from a secure archive and local evaluation is not enabled." userInfo:0]);
  }
  id v7 = [(NSSortDescriptor *)self selector];
  id v8 = (id)[MEMORY[0x1E4F1CA98] null];
  if (self->_key)
  {
    object1 = (id)objc_msgSend(object1, "valueForKeyPath:");
    if (self->_key) {
      object2 = (id)objc_msgSend(object2, "valueForKeyPath:");
    }
  }
  if (object1 == v8) {
    object1 = 0;
  }
  if (object1)
  {
    if ((self->_sortDescriptorFlags & 2) != 0)
    {
      id v7 = 0;
      id selectorOrBlock = self->_selectorOrBlock;
    }
    else
    {
      NSComparator v9 = (objc_class *)objc_opt_class();
      id selectorOrBlock = class_getMethodImplementation(v9, v7);
    }
  }
  else
  {
    id v7 = sel_compare_;
    id selectorOrBlock = _NSNullCompare;
  }
  if (object2 == v8) {
    object2 = 0;
  }
  int v11 = [(NSSortDescriptor *)self ascending];
  int v12 = [(NSSortDescriptor *)self reverseNullOrder];

  return _NSCompareObject((uint64_t)object1, (uint64_t)object2, (uint64_t)selectorOrBlock, (uint64_t)v7, v11, v12);
}

- (BOOL)ascending
{
  return self->_sortDescriptorFlags & 1;
}

- (BOOL)reverseNullOrder
{
  return (LOBYTE(self->_sortDescriptorFlags) >> 3) & 1;
}

- (SEL)selector
{
  if ((self->_sortDescriptorFlags & 2) != 0) {
    return 0;
  }
  p_selector = &self->_selector;
  selector = self->_selector;
  if (selector) {
    return selector;
  }
  id selectorOrBlock = (NSString *)self->_selectorOrBlock;
  if (selectorOrBlock)
  {
    SEL v5 = NSSelectorFromString(selectorOrBlock);
    if (v5) {
      selector = v5;
    }
    else {
      selector = 0;
    }
    SEL *p_selector = selector;
  }
  if (selector) {
    return selector;
  }
  else {
    return 0;
  }
}

- (NSComparator)comparator
{
  if ((self->_sortDescriptorFlags & 2) != 0) {
    return self->_selectorOrBlock;
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSSortDescriptor;
  [(NSSortDescriptor *)&v3 dealloc];
}

- (NSSortDescriptor)initWithCoder:(NSCoder *)coder
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v14 = 0;
  if (![(NSCoder *)coder allowsKeyedCoding])
  {
    id v5 = [(NSCoder *)coder decodeObject];
    -[NSCoder decodeValuesOfObjCTypes:](coder, "decodeValuesOfObjCTypes:", "c", &v14);
    id v8 = [(NSCoder *)coder decodeObject];
    BOOL v7 = 0;
    BOOL v9 = 0;
    BOOL v6 = v14;
    goto LABEL_8;
  }
  id v5 = [(NSCoder *)coder decodeObjectOfClass:objc_opt_class() forKey:@"NSKey"];
  if (v5)
  {
    if (_NSIsNSString()) {
      goto LABEL_4;
    }
LABEL_15:

    int v12 = @"Sort descriptor key is not a string";
LABEL_18:
    [(NSCoder *)coder failWithError:+[NSError _readCorruptErrorWithFormat:v12]];
    return 0;
  }
  if ([(NSCoder *)coder error]) {
    goto LABEL_15;
  }
LABEL_4:
  BOOL v6 = [(NSCoder *)coder decodeBoolForKey:@"NSAscending"];
  BOOL v14 = v6;
  BOOL v7 = [(NSCoder *)coder decodeBoolForKey:@"NSReverseNullOrder"];
  id v8 = [(NSCoder *)coder decodeObjectOfClass:objc_opt_class() forKey:@"NSSelector"];
  if (!v8)
  {
    if (![(NSCoder *)coder error]) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
  if ((_NSIsNSString() & 1) == 0)
  {
LABEL_17:

    int v12 = @"Sort descriptor selector name is not a string";
    goto LABEL_18;
  }
LABEL_6:
  BOOL v9 = [(NSCoder *)coder requiresSecureCoding];
LABEL_8:
  v10 = [(NSSortDescriptor *)self initWithKey:v5 ascending:v6];
  int v11 = v10;
  if (v8) {
    [(NSSortDescriptor *)v10 _setSelectorName:v8];
  }
  if (v9) {
    [(NSSortDescriptor *)v11 _disallowEvaluation];
  }
  if (v7) {
    [(NSSortDescriptor *)v11 setReverseNullOrder:1];
  }
  return v11;
}

+ (NSSortDescriptor)sortDescriptorWithKey:(NSString *)key ascending:(BOOL)ascending selector:(SEL)selector
{
  id v5 = (void *)[objc_alloc((Class)a1) initWithKey:key ascending:ascending selector:selector];

  return (NSSortDescriptor *)v5;
}

- (NSSortDescriptor)initWithKey:(NSString *)key ascending:(BOOL)ascending selector:(SEL)selector
{
  return [(NSSortDescriptor *)self initWithKey:key ascending:ascending reverseNullOrder:0 selector:selector];
}

- (NSSortDescriptor)initWithKey:(id)a3 ascending:(BOOL)a4 reverseNullOrder:(BOOL)a5 selector:(SEL)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)NSSortDescriptor;
  v10 = [(NSSortDescriptor *)&v15 init];
  if (v10)
  {
    uint64_t v11 = [a3 length];
    if (v11) {
      uint64_t v11 = [a3 copy];
    }
    uint64_t v12 = 8;
    if (!v7) {
      uint64_t v12 = 0;
    }
    v10->_sortDescriptorFlags |= v12 | v8;
    v10->_key = (NSString *)v11;
    if (a6) {
      SEL v13 = a6;
    }
    else {
      SEL v13 = sel_compare_;
    }
    v10->_selector = v13;
    v10->_id selectorOrBlock = 0;
  }
  return v10;
}

- (NSSortDescriptor)initWithKey:(NSString *)key ascending:(BOOL)ascending
{
  return [(NSSortDescriptor *)self initWithKey:key ascending:ascending selector:sel_compare_];
}

- (void)_setSelectorName:(id)a3
{
  if ((self->_sortDescriptorFlags & 2) == 0)
  {
    id selectorOrBlock = self->_selectorOrBlock;
    if (selectorOrBlock != a3)
    {

      BOOL v6 = (void *)[a3 copy];
      self->_selector = 0;
      self->_id selectorOrBlock = v6;
    }
  }
}

- (void)_disallowEvaluation
{
  self->_sortDescriptorFlags |= 4uLL;
}

+ (NSSortDescriptor)sortDescriptorWithKey:(NSString *)key ascending:(BOOL)ascending comparator:(NSComparator)cmptr
{
  id v5 = (void *)[objc_alloc((Class)a1) initWithKey:key ascending:ascending comparator:cmptr];

  return (NSSortDescriptor *)v5;
}

- (NSSortDescriptor)initWithKey:(NSString *)key ascending:(BOOL)ascending comparator:(NSComparator)cmptr
{
  BOOL v6 = ascending;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)NSSortDescriptor;
  BOOL v8 = [(NSSortDescriptor *)&v11 init];
  if (v8)
  {
    uint64_t v9 = [(NSString *)key length];
    if (v9) {
      uint64_t v9 = [(NSString *)key copy];
    }
    v8->_sortDescriptorFlags |= v6 | 2;
    v8->_key = (NSString *)v9;
    v8->_selector = 0;
    v8->_id selectorOrBlock = (id)[cmptr copy];
  }
  return v8;
}

+ (void)initialize
{
  if (NSSortDescriptor == a1) {
    _NSInternalCompareObject = (uint64_t)class_getMethodImplementation((Class)a1, sel_compareObject_toObject_);
  }
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(NSSortDescriptor *)self _isEqualToSortDescriptor:a3];
}

+ (NSSortDescriptor)sortDescriptorWithKey:(id)a3
{
  return (NSSortDescriptor *)[a1 sortDescriptorWithKey:a3 ascending:1];
}

+ (NSSortDescriptor)sortDescriptorWithKey:(id)a3 ascending:(BOOL)a4 reverseNullOrder:(BOOL)a5
{
  id v5 = (void *)[objc_alloc((Class)a1) initWithKey:a3 ascending:a4 reverseNullOrder:a5];

  return (NSSortDescriptor *)v5;
}

+ (id)_defaultSelectorName
{
  return @"compare:";
}

- (NSSortDescriptor)initWithKey:(id)a3
{
  return [(NSSortDescriptor *)self initWithKey:a3 ascending:1];
}

- (NSSortDescriptor)initWithKey:(id)a3 ascending:(BOOL)a4 reverseNullOrder:(BOOL)a5
{
  return [(NSSortDescriptor *)self initWithKey:a3 ascending:a4 reverseNullOrder:a5 selector:0];
}

- (void)_setKey:(id)a3
{
  key = self->_key;
  if (key != a3)
  {

    self->_key = (NSString *)[a3 copy];
  }
}

- (void)_setAscending:(BOOL)a3
{
  self->_sortDescriptorFlags |= a3;
}

- (void)setReverseNullOrder:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_sortDescriptorFlags |= v3;
}

- (id)replacementObjectForPortCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([a3 isByref])
  {
    v6.receiver = self;
    v6.super_class = (Class)NSSortDescriptor;
    return [(NSSortDescriptor *)&v6 replacementObjectForPortCoder:a3];
  }
  return self;
}

@end