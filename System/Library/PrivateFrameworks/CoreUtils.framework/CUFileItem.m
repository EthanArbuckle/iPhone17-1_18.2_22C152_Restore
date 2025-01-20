@interface CUFileItem
- (CUFileItem)initWithDictionary:(id)a3 error:(id *)a4;
- (NSString)name;
- (id)description;
- (int)type;
- (int64_t)size;
- (unsigned)flags;
- (void)encodeWithDictionary:(id)a3;
- (void)setName:(id)a3;
- (void)setSize:(int64_t)a3;
- (void)setType:(int)a3;
@end

@implementation CUFileItem

- (void).cxx_destruct
{
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (int64_t)size
{
  return self->_size;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)flags
{
  return self->_flags;
}

- (id)description
{
  return NSPrintF((uint64_t)"CUFileItem: Name '%@'", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self->_name);
}

- (void)encodeWithDictionary:(id)a3
{
  id v8 = a3;
  if (self->_flags)
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    [v8 setObject:v4 forKeyedSubscript:&unk_1EDD44098];
  }
  name = self->_name;
  if (name) {
    [v8 setObject:name forKeyedSubscript:&unk_1EDD440B0];
  }
  if (self->_size)
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithLongLong:");
    [v8 setObject:v6 forKeyedSubscript:&unk_1EDD440C8];
  }
  if (self->_type)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:");
    [v8 setObject:v7 forKeyedSubscript:&unk_1EDD440E0];
  }
}

- (CUFileItem)initWithDictionary:(id)a3 error:(id *)a4
{
  CFDictionaryRef v6 = (const __CFDictionary *)a3;
  v12 = [(CUFileItem *)self init];
  if (v12)
  {
    int v21 = 0;
    unsigned int Int64Ranged = CFDictionaryGetInt64Ranged(v6, &unk_1EDD44098, 0, 0xFFFFFFFFLL, &v21);
    if (!v21) {
      v12->_flags = Int64Ranged;
    }
    CFTypeID TypeID = CFStringGetTypeID();
    v15 = CFDictionaryGetTypedValue(v6, &unk_1EDD440B0, TypeID, 0);
    if (v15) {
      objc_storeStrong((id *)&v12->_name, v15);
    }

    unint64_t Int64 = CFDictionaryGetInt64(v6, &unk_1EDD440C8, &v21);
    if (!v21) {
      v12->_size = Int64;
    }
    int v17 = CFDictionaryGetInt64Ranged(v6, &unk_1EDD440E0, 0xFFFFFFFF80000000, 0x7FFFFFFFLL, &v21);
    if (!v21) {
      v12->_type = v17;
    }
    v18 = v12;
  }
  else if (a4)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960596, (uint64_t)"Init failed", v7, v8, v9, v10, v11, v20);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

@end