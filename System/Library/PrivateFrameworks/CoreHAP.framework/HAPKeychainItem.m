@interface HAPKeychainItem
+ (BOOL)isQueryResultValid:(__CFDictionary *)a3 shouldIncludeData:(BOOL)a4;
- (BOOL)isInvisible;
- (BOOL)isSyncable;
- (BOOL)matchesPublicKeyData:(id)a3;
- (HAPKeychainItem)initWithQueryResult:(__CFDictionary *)a3 shouldIncludeData:(BOOL)a4;
- (NSData)genericData;
- (NSData)valueData;
- (NSDate)creationDate;
- (NSNumber)type;
- (NSString)accessGroup;
- (NSString)account;
- (NSString)itemDescription;
- (NSString)label;
- (NSString)viewHint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)platformReference;
- (void)setAccessGroup:(id)a3;
- (void)setAccount:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setGenericData:(id)a3;
- (void)setItemDescription:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPlatformReference:(void *)a3;
- (void)setSyncable:(BOOL)a3;
- (void)setType:(id)a3;
- (void)setValueData:(id)a3;
- (void)setViewHint:(id)a3;
@end

@implementation HAPKeychainItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genericData, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_viewHint, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_valueData, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_accessGroup, 0);
}

- (NSData)valueData
{
  return self->_valueData;
}

- (NSData)genericData
{
  return self->_genericData;
}

- (BOOL)isSyncable
{
  return self->_syncable;
}

- (HAPKeychainItem)initWithQueryResult:(__CFDictionary *)a3 shouldIncludeData:(BOOL)a4
{
  BOOL v4 = a4;
  v37.receiver = self;
  v37.super_class = (Class)HAPKeychainItem;
  v6 = [(HAPKeychainItem *)&v37 init];
  if (v6)
  {
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F3B550]);
    CFStringRef Copy = CFStringCreateCopy(0, Value);
    accessGroup = v6->_accessGroup;
    v6->_accessGroup = &Copy->isa;

    unsigned int valuePtr = 0;
    CFNumberRef v10 = (const __CFNumber *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F3B8C0]);
    CFNumberGetValue(v10, kCFNumberIntType, &valuePtr);
    uint64_t v11 = [NSNumber numberWithInt:valuePtr];
    type = v6->_type;
    v6->_type = (NSNumber *)v11;

    CFStringRef v13 = (const __CFString *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F3B788]);
    CFStringRef v14 = CFStringCreateCopy(0, v13);
    label = v6->_label;
    v6->_label = &v14->isa;

    CFStringRef v16 = (const __CFString *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F3B678]);
    CFStringRef v17 = CFStringCreateCopy(0, v16);
    itemDescription = v6->_itemDescription;
    v6->_itemDescription = &v17->isa;

    CFBooleanRef v19 = (const __CFBoolean *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F3B878]);
    if (v19) {
      v6->_syncable = CFBooleanGetValue(v19) != 0;
    }
    CFBooleanRef v20 = (const __CFBoolean *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F3B698]);
    if (v20) {
      v6->_invisible = CFBooleanGetValue(v20) != 0;
    }
    CFStringRef v21 = (const __CFString *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F3B5C0]);
    CFStringRef v22 = CFStringCreateCopy(0, v21);
    account = v6->_account;
    v6->_account = &v22->isa;

    v24 = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F3BD40]);
    v6->_platformReference = (void *)CFRetain(v24);
    if (v4)
    {
      CFDataRef v25 = (const __CFData *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F3BD38]);
      CFDataRef v26 = CFDataCreateCopy(0, v25);
      valueData = v6->_valueData;
      v6->_valueData = (NSData *)v26;
    }
    CFDataGetTypeID();
    TypedCFStringRef Value = (const __CFData *)CFDictionaryGetTypedValue();
    if (TypedValue)
    {
      CFDataRef v29 = CFDataCreateCopy(0, TypedValue);
      genericData = v6->_genericData;
      v6->_genericData = (NSData *)v29;
    }
    CFStringRef v31 = (const __CFString *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F3B870]);
    if (v31)
    {
      CFStringRef v32 = CFStringCreateCopy(0, v31);
      viewHint = v6->_viewHint;
      v6->_viewHint = &v32->isa;
    }
    CFDateGetTypeID();
    v34 = (void *)CFDictionaryGetTypedValue();
    if (v34) {
      objc_storeStrong((id *)&v6->_creationDate, v34);
    }
  }
  return v6;
}

- (void)dealloc
{
  platformReference = self->_platformReference;
  if (platformReference)
  {
    CFRelease(platformReference);
    self->_platformReference = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)HAPKeychainItem;
  [(HAPKeychainItem *)&v4 dealloc];
}

+ (BOOL)isQueryResultValid:(__CFDictionary *)a3 shouldIncludeData:(BOOL)a4
{
  BOOL v4 = a4;
  CFStringRef Value = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F3B550]);
  if (Value)
  {
    CFTypeID v7 = CFGetTypeID(Value);
    if (v7 != CFStringGetTypeID()) {
      goto LABEL_17;
    }
    CFStringRef Value = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F3B8C0]);
    if (!Value) {
      return (char)Value;
    }
    CFTypeID v8 = CFGetTypeID(Value);
    if (v8 != CFNumberGetTypeID()) {
      goto LABEL_17;
    }
    CFStringRef Value = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F3B788]);
    if (!Value) {
      return (char)Value;
    }
    CFTypeID v9 = CFGetTypeID(Value);
    if (v9 != CFStringGetTypeID()) {
      goto LABEL_17;
    }
    CFStringRef Value = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F3B678]);
    if (!Value) {
      return (char)Value;
    }
    CFTypeID v10 = CFGetTypeID(Value);
    if (v10 != CFStringGetTypeID()) {
      goto LABEL_17;
    }
    CFStringRef Value = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F3B5C0]);
    if (!Value) {
      return (char)Value;
    }
    CFTypeID v11 = CFGetTypeID(Value);
    if (v11 != CFStringGetTypeID()) {
      goto LABEL_17;
    }
    CFStringRef Value = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F3BD40]);
    if (Value)
    {
      if (!v4)
      {
LABEL_15:
        LOBYTE(Value) = 1;
        return (char)Value;
      }
      CFStringRef Value = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F3BD38]);
      if (Value)
      {
        CFTypeID v12 = CFGetTypeID(Value);
        if (v12 == CFDataGetTypeID()) {
          goto LABEL_15;
        }
LABEL_17:
        LOBYTE(Value) = 0;
      }
    }
  }
  return (char)Value;
}

- (void)setPlatformReference:(void *)a3
{
  self->_platformReference = a3;
}

- (void)platformReference
{
  return self->_platformReference;
}

- (BOOL)isInvisible
{
  return self->_invisible;
}

- (void)setGenericData:(id)a3
{
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setViewHint:(id)a3
{
}

- (NSString)viewHint
{
  return self->_viewHint;
}

- (void)setSyncable:(BOOL)a3
{
  self->_syncable = a3;
}

- (void)setItemDescription:(id)a3
{
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setValueData:(id)a3
{
}

- (void)setAccount:(id)a3
{
}

- (NSString)account
{
  return self->_account;
}

- (void)setType:(id)a3
{
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setAccessGroup:(id)a3
{
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (BOOL)matchesPublicKeyData:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (![a3 bytes]) {
    return 0;
  }
  DataToHexCStringEx();
  BOOL v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v8 length:64];
  v5 = [(HAPKeychainItem *)self valueData];
  char v6 = [v4 isEqual:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(HAPKeychainItem *)self accessGroup];
  char v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(HAPKeychainItem *)self type];
  CFTypeID v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(HAPKeychainItem *)self account];
  CFTypeID v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(HAPKeychainItem *)self valueData];
  CFTypeID v12 = (void *)v4[5];
  v4[5] = v11;

  *((unsigned char *)v4 + 8) = [(HAPKeychainItem *)self isSyncable];
  uint64_t v13 = [(HAPKeychainItem *)self viewHint];
  CFStringRef v14 = (void *)v4[8];
  v4[8] = v13;

  uint64_t v15 = [(HAPKeychainItem *)self label];
  CFStringRef v16 = (void *)v4[6];
  v4[6] = v15;

  uint64_t v17 = [(HAPKeychainItem *)self itemDescription];
  v18 = (void *)v4[7];
  v4[7] = v17;

  uint64_t v19 = [(HAPKeychainItem *)self creationDate];
  CFBooleanRef v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(HAPKeychainItem *)self genericData];
  CFStringRef v22 = (void *)v4[10];
  v4[10] = v21;

  return v4;
}

- (id)mutableCopy
{
  return [(HAPKeychainItem *)self mutableCopyWithZone:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  BOOL v4 = objc_alloc_init(HAPMutableKeychainItem);
  uint64_t v5 = [(HAPKeychainItem *)self accessGroup];
  [(HAPKeychainItem *)v4 setAccessGroup:v5];

  char v6 = [(HAPKeychainItem *)self type];
  [(HAPKeychainItem *)v4 setType:v6];

  uint64_t v7 = [(HAPKeychainItem *)self account];
  [(HAPKeychainItem *)v4 setAccount:v7];

  CFTypeID v8 = [(HAPKeychainItem *)self valueData];
  [(HAPKeychainItem *)v4 setValueData:v8];

  [(HAPKeychainItem *)v4 setSyncable:[(HAPKeychainItem *)self isSyncable]];
  uint64_t v9 = [(HAPKeychainItem *)self viewHint];
  [(HAPKeychainItem *)v4 setViewHint:v9];

  CFTypeID v10 = [(HAPKeychainItem *)self label];
  [(HAPKeychainItem *)v4 setLabel:v10];

  uint64_t v11 = [(HAPKeychainItem *)self itemDescription];
  [(HAPKeychainItem *)v4 setItemDescription:v11];

  CFTypeID v12 = [(HAPKeychainItem *)self creationDate];
  [(HAPKeychainItem *)v4 setCreationDate:v12];

  uint64_t v13 = [(HAPKeychainItem *)self genericData];
  [(HAPKeychainItem *)v4 setGenericData:v13];

  return v4;
}

- (id)description
{
  v3 = objc_opt_class();
  BOOL v4 = [(HAPKeychainItem *)self genericData];
  v23 = [v3 getDictionaryFromGenericData:v4];

  CFBooleanRef v20 = NSString;
  uint64_t v22 = [(HAPKeychainItem *)self accessGroup];
  uint64_t v21 = [(HAPKeychainItem *)self type];
  uint64_t v19 = KeyTypeDescription(v21);
  uint64_t v5 = [(HAPKeychainItem *)self account];
  if ([(HAPKeychainItem *)self isSyncable]) {
    char v6 = @"Yes";
  }
  else {
    char v6 = @"No";
  }
  uint64_t v7 = [(HAPKeychainItem *)self valueData];
  CFTypeID v8 = CUPrintNSObjectMasked();
  if ([(HAPKeychainItem *)self isInvisible]) {
    uint64_t v9 = @"Yes";
  }
  else {
    uint64_t v9 = @"No";
  }
  CFTypeID v10 = [(HAPKeychainItem *)self viewHint];
  if (v10) {
    uint64_t v11 = @", viewHint: ";
  }
  else {
    uint64_t v11 = &stru_1F2C4E778;
  }
  CFTypeID v12 = [(HAPKeychainItem *)self viewHint];
  if (v12)
  {
    uint64_t v13 = [(HAPKeychainItem *)self viewHint];
    uint64_t v17 = v6;
    CFStringRef v14 = (void *)v22;
    uint64_t v15 = [v20 stringWithFormat:@"agrp: %@, type: %s, acct: %@, sync: %@, hash: %@, invisible: %@%@%@, dictionary:%@", v22, v19, v5, v17, v8, v9, v11, v13, v23];
  }
  else
  {
    v18 = v6;
    CFStringRef v14 = (void *)v22;
    uint64_t v15 = [v20 stringWithFormat:@"agrp: %@, type: %s, acct: %@, sync: %@, hash: %@, invisible: %@%@%@, dictionary:%@", v22, v19, v5, v18, v8, v9, v11, &stru_1F2C4E778, v23];
  }

  return v15;
}

@end