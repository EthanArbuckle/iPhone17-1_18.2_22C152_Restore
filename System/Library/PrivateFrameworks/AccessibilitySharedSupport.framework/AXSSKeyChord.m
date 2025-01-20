@interface AXSSKeyChord
+ (BOOL)supportsSecureCoding;
+ (id)keyChordWithKeys:(id)a3;
+ (id)keyChordWithString:(id)a3;
+ (id)keyFromKeyCode:(unint64_t)a3 unicodeCharacter:(id)a4;
+ (id)nullKeyChord;
- (AXSSKeyChord)initWithCoder:(id)a3;
- (BOOL)containsModifier;
- (BOOL)isArrowKeyChord;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToKeyChord:(id)a3;
- (BOOL)isFunctionKeyChord;
- (BOOL)isNull;
- (BOOL)isTextInputChord;
- (BOOL)isTextInputTabChord;
- (NSArray)keys;
- (NSString)displayValue;
- (id)_displayValueWithSortedModifiers:(id)a3 isUSKeyboard:(BOOL)a4;
- (id)_initWithKeys:(id)a3;
- (id)_normalizeKeys:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)displayValueWithStyle:(int64_t)a3;
- (id)displayValueWithStyle:(int64_t)a3 isUSKeyboard:(BOOL)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setKeys:(id)a3;
@end

@implementation AXSSKeyChord

+ (id)keyChordWithKeys:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithKeys:v4];

  return v5;
}

+ (id)keyChordWithString:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isEqualToString:@"_"];
  id v6 = objc_alloc((Class)a1);
  v7 = v6;
  if (v5)
  {
    v8 = (void *)[v6 _initWithKeys:&unk_1F0C66FA8];
  }
  else
  {
    v9 = [v4 componentsSeparatedByString:@"_"];
    v8 = (void *)[v7 _initWithKeys:v9];
  }

  return v8;
}

+ (id)nullKeyChord
{
  id v2 = objc_alloc((Class)a1);
  v3 = (void *)[v2 _initWithKeys:MEMORY[0x1E4F1CBF0]];

  return v3;
}

+ (id)keyFromKeyCode:(unint64_t)a3 unicodeCharacter:(id)a4
{
  id v5 = a4;
  if (a3 - 40 > 0x30) {
    id v6 = 0;
  }
  else {
    id v6 = off_1E606CBA8[a3 - 40];
  }
  if ([(__CFString *)v6 length]
    || (id v6 = (__CFString *)v5, [(__CFString *)v6 length] == 1))
  {
    v7 = v6;
    id v6 = v7;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_initWithKeys:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXSSKeyChord;
  id v5 = [(AXSSKeyChord *)&v9 init];
  id v6 = v5;
  if (v5)
  {
    v7 = [(AXSSKeyChord *)v5 _normalizeKeys:v4];
    [(AXSSKeyChord *)v6 setKeys:v7];
  }
  return v6;
}

- (id)_normalizeKeys:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28B88] uppercaseLetterCharacterSet];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(__CFString **)(*((void *)&v19 + 1) + 8 * i);
        if ([(__CFString *)v11 length] == 1
          && objc_msgSend(v4, "characterIsMember:", -[__CFString characterAtIndex:](v11, "characterAtIndex:", 0)))
        {
          v12 = [(__CFString *)v11 lowercaseString];
          [v5 addObject:v12];

          if ([v5 containsObject:@"⇧"]) {
            continue;
          }
          v13 = v5;
          v14 = @"⇧";
        }
        else
        {
          v13 = v5;
          v14 = v11;
        }
        [v13 addObject:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  v15 = [v5 sortedArrayUsingSelector:sel_compare_];
  v16 = [v15 reverseObjectEnumerator];
  v17 = [v16 allObjects];

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXSSKeyChord)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"keys"];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v14 = 0;
          goto LABEL_11;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  self = (AXSSKeyChord *)[(AXSSKeyChord *)self _initWithKeys:v9];
  v14 = self;
LABEL_11:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSSKeyChord *)self keys];
  [v4 encodeObject:v5 forKey:@"keys"];
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(AXSSKeyChord *)self keys];
  uint64_t v7 = [v6 componentsJoinedByString:@", "];
  uint64_t v8 = [v3 stringWithFormat:@"%@<%p>: keys:[%@]", v5, self, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(AXSSKeyChord *)self isEqualToKeyChord:v4];

  return v5;
}

- (BOOL)isEqualToKeyChord:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AXSSKeyChord *)self keys];
  uint64_t v6 = [v4 keys];

  LOBYTE(v4) = [v5 isEqualToArray:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  id v2 = [(AXSSKeyChord *)self keys];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v3 = [(AXSSKeyChord *)self keys];
  id v4 = +[AXSSKeyChord keyChordWithKeys:v3];

  return v4;
}

- (BOOL)isFunctionKeyChord
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  cachedIsFunctionKey = self->_cachedIsFunctionKey;
  if (cachedIsFunctionKey)
  {
    return [(NSNumber *)cachedIsFunctionKey BOOLValue];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    BOOL v5 = [(AXSSKeyChord *)self keys];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (([v10 isEqualToString:@"Fn"] & 1) != 0
            || ([&unk_1F0C66FC0 containsObject:v10] & 1) != 0)
          {
            uint64_t v12 = self->_cachedIsFunctionKey;
            self->_cachedIsFunctionKey = (NSNumber *)MEMORY[0x1E4F1CC38];

            return 1;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    uint64_t v11 = self->_cachedIsFunctionKey;
    self->_cachedIsFunctionKey = (NSNumber *)MEMORY[0x1E4F1CC28];

    return 0;
  }
}

- (BOOL)containsModifier
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  cachedContainsModifier = self->_cachedContainsModifier;
  if (cachedContainsModifier)
  {
    return [(NSNumber *)cachedContainsModifier BOOLValue];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v5 = [(AXSSKeyChord *)self keys];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          if ([&unk_1F0C66FD8 containsObject:*(void *)(*((void *)&v12 + 1) + 8 * v9)])
          {
            uint64_t v11 = self->_cachedContainsModifier;
            self->_cachedContainsModifier = (NSNumber *)MEMORY[0x1E4F1CC38];

            return 1;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    uint64_t v10 = self->_cachedContainsModifier;
    self->_cachedContainsModifier = (NSNumber *)MEMORY[0x1E4F1CC28];

    return 0;
  }
}

- (BOOL)isTextInputChord
{
  if (isTextInputChord_onceToken != -1) {
    dispatch_once(&isTextInputChord_onceToken, &__block_literal_global_1);
  }
  if ([(AXSSKeyChord *)self isTextInputTabChord]
    || [(AXSSKeyChord *)self isArrowKeyChord]
    || [(AXSSKeyChord *)self isEqualToKeyChord:isTextInputChord_spaceChord])
  {
    return 1;
  }
  uint64_t v4 = isTextInputChord_returnChord;

  return [(AXSSKeyChord *)self isEqualToKeyChord:v4];
}

uint64_t __32__AXSSKeyChord_isTextInputChord__block_invoke()
{
  uint64_t v0 = +[AXSSKeyChord keyChordWithKeys:&unk_1F0C66FF0];
  v1 = (void *)isTextInputChord_spaceChord;
  isTextInputChord_spaceChord = v0;

  isTextInputChord_returnChord = +[AXSSKeyChord keyChordWithKeys:&unk_1F0C67008];

  return MEMORY[0x1F41817F8]();
}

- (BOOL)isArrowKeyChord
{
  id v2 = [(AXSSKeyChord *)self keys];
  unint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_175);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

uint64_t __31__AXSSKeyChord_isArrowKeyChord__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 isEqualToString:@"↑"] & 1) != 0
    || ([v2 isEqualToString:@"↓"] & 1) != 0
    || ([v2 isEqualToString:@"←"] & 1) != 0)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = [v2 isEqualToString:@"→"];
  }

  return v3;
}

- (BOOL)isTextInputTabChord
{
  if (isTextInputTabChord_onceToken != -1) {
    dispatch_once(&isTextInputTabChord_onceToken, &__block_literal_global_177);
  }
  if ([(AXSSKeyChord *)self isEqualToKeyChord:isTextInputTabChord_tabChord]) {
    return 1;
  }
  uint64_t v4 = isTextInputTabChord_shiftTabChord;

  return [(AXSSKeyChord *)self isEqualToKeyChord:v4];
}

uint64_t __35__AXSSKeyChord_isTextInputTabChord__block_invoke()
{
  uint64_t v0 = +[AXSSKeyChord keyChordWithKeys:&unk_1F0C67020];
  v1 = (void *)isTextInputTabChord_tabChord;
  isTextInputTabChord_tabChord = v0;

  isTextInputTabChord_shiftTabChord = +[AXSSKeyChord keyChordWithKeys:&unk_1F0C67038];

  return MEMORY[0x1F41817F8]();
}

- (BOOL)isNull
{
  id v2 = [(AXSSKeyChord *)self keys];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (NSString)displayValue
{
  return (NSString *)[(AXSSKeyChord *)self displayValueWithStyle:0];
}

- (id)displayValueWithStyle:(int64_t)a3
{
  return [(AXSSKeyChord *)self displayValueWithStyle:a3 isUSKeyboard:1];
}

- (id)displayValueWithStyle:(int64_t)a3 isUSKeyboard:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 1)
  {
    uint64_t v6 = [(AXSSKeyChord *)self keys];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__AXSSKeyChord_displayValueWithStyle_isUSKeyboard___block_invoke;
    v11[3] = &unk_1E606CB38;
    id v12 = &unk_1F0C67050;
    uint64_t v7 = [v6 indexOfObjectPassingTest:v11];

    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v8 = &unk_1F0C67068;
    }
    else {
      uint64_t v8 = &unk_1F0C67050;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [(AXSSKeyChord *)self _displayValueWithSortedModifiers:v8 isUSKeyboard:v4];

  return v9;
}

uint64_t __51__AXSSKeyChord_displayValueWithStyle_isUSKeyboard___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (id)_displayValueWithSortedModifiers:(id)a3 isUSKeyboard:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [(AXSSKeyChord *)self keys];
  if (v6)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__AXSSKeyChord__displayValueWithSortedModifiers_isUSKeyboard___block_invoke;
    v17[3] = &unk_1E606CB60;
    id v18 = v6;
    uint64_t v8 = [v7 sortedArrayWithOptions:16 usingComparator:v17];

    uint64_t v7 = (void *)v8;
  }
  uint64_t v9 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__AXSSKeyChord__displayValueWithSortedModifiers_isUSKeyboard___block_invoke_2;
  v14[3] = &unk_1E606CB88;
  BOOL v16 = a4;
  id v15 = v9;
  id v10 = v9;
  uint64_t v11 = objc_msgSend(v7, "ax_mappedArrayUsingBlock:", v14);
  id v12 = [v11 componentsJoinedByString:@" "];

  return v12;
}

uint64_t __62__AXSSKeyChord__displayValueWithSortedModifiers_isUSKeyboard___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [v5 indexOfObject:a2];
  unint64_t v8 = [*(id *)(a1 + 32) indexOfObject:v6];

  if (v7 == v8) {
    return 0;
  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    return 1;
  }
  if (v7 < v8) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = 1;
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    return -1;
  }
  else {
    return v10;
  }
}

id __62__AXSSKeyChord__displayValueWithSortedModifiers_isUSKeyboard___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = objc_msgSend(v3, "axss_keyChordKeyDisplayValueForUSKeyboard:", *(unsigned __int8 *)(a1 + 40));
  if (v4)
  {
    id v5 = v4;
    if ([v4 length] == 1
      && objc_msgSend(*(id *)(a1 + 32), "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", 0)))
    {
      uint64_t v6 = [v5 uppercaseStringWithLocale:0];

      id v5 = (id)v6;
    }
  }
  else
  {
    unint64_t v7 = FKALogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __62__AXSSKeyChord__displayValueWithSortedModifiers_isUSKeyboard___block_invoke_2_cold_1((uint64_t)v3, v7);
    }

    id v5 = v3;
  }

  return v5;
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_cachedContainsModifier, 0);

  objc_storeStrong((id *)&self->_cachedIsFunctionKey, 0);
}

void __62__AXSSKeyChord__displayValueWithSortedModifiers_isUSKeyboard___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_ERROR, "Error getting value from key %@", (uint8_t *)&v2, 0xCu);
}

@end