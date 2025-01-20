@interface ACZeroingString
+ (BOOL)supportsSecureCoding;
+ (Class)classForKeyedUnarchiver;
+ (id)_emptyString;
- (ACZeroingString)initWithBytes:(const void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5;
- (ACZeroingString)initWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4;
- (ACZeroingString)initWithCoder:(id)a3;
- (ACZeroingString)initWithString:(id)a3;
- (ACZeroingString)initWithUTF8String:(const char *)a3;
- (BOOL)_allowsDirectEncoding;
- (Class)classForKeyedArchiver;
- (id)_compatibleCopy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)replacementObjectForCoder:(id)a3;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (unsigned)characters;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation ACZeroingString

+ (id)_emptyString
{
  v2 = (void *)[objc_alloc((Class)a1) initWithString:&stru_1EFA0AB58];

  return v2;
}

- (ACZeroingString)initWithString:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"ACZeroingString.m", 78, @"Invalid parameter not satisfying: %@", @"string" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)ACZeroingString;
  v6 = [(ACZeroingString *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 length];
    v6->_length = v7;
    if (v7 < 0)
    {
      id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Failed to allocate backing character buffer" userInfo:0];
      objc_exception_throw(v11);
    }
    v8 = (unsigned __int16 *)malloc_type_malloc(2 * v7, 0x36F200F0uLL);
    v6->_characters = v8;
    objc_msgSend(v5, "getCharacters:range:", v8, 0, v6->_length);
  }

  return v6;
}

- (ACZeroingString)initWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  if (a4)
  {
    if (!a3)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, self, @"ACZeroingString.m", 96, @"Invalid parameter not satisfying: %@", @"characters" object file lineNumber description];
    }
    v17.receiver = self;
    v17.super_class = (Class)ACZeroingString;
    uint64_t v7 = [(ACZeroingString *)&v17 init];
    v8 = v7;
    if (v7)
    {
      v7->_length = a4;
      if ((a4 & 0x8000000000000000) != 0)
      {
        id v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Failed to allocate backing character buffer" userInfo:0];
        objc_exception_throw(v16);
      }
      size_t v9 = 2 * a4;
      v10 = (unsigned __int16 *)malloc_type_malloc(v9, 0x93FA923DuLL);
      v8->_characters = v10;
      memcpy(v10, a3, v9);
    }
    id v11 = v8;
    self = v11;
  }
  else
  {
    id v11 = [(id)objc_opt_class() _emptyString];
  }
  objc_super v12 = v11;

  return v12;
}

- (ACZeroingString)initWithBytes:(const void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5
{
  if (!a4)
  {
    v21 = [(id)objc_opt_class() _emptyString];
    goto LABEL_21;
  }
  if (a3)
  {
    if (a5) {
      goto LABEL_4;
    }
  }
  else
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"ACZeroingString.m", 114, @"Invalid parameter not satisfying: %@", @"bytes" object file lineNumber description];

    if (a5) {
      goto LABEL_4;
    }
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"ACZeroingString.m", 115, @"Invalid parameter not satisfying: %@", @"encoding" object file lineNumber description];

LABEL_4:
  v27.receiver = self;
  v27.super_class = (Class)ACZeroingString;
  v10 = [(ACZeroingString *)&v27 init];
  if (v10)
  {
    CFStringEncoding v11 = CFStringConvertNSStringEncodingToEncoding(a5);
    if (CFStringIsEncodingAvailable(v11))
    {
      CFStringRef v12 = CFStringCreateWithBytesNoCopy(0, (const UInt8 *)a3, a4, v11, 1u, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
      if (v12)
      {
        CFStringRef v13 = v12;
        CFIndex Length = CFStringGetLength(v12);
        BOOL v15 = Length < 0;
        if (Length >= 0) {
          CFIndex v16 = Length;
        }
        else {
          CFIndex v16 = -Length;
        }
        if (!(2 * v16)) {
          BOOL v15 = 0;
        }
        if ((v16 & 0x8000000000000000) == 0 && !v15)
        {
          CFIndex v17 = Length;
          size_t v18 = Length >= 0 ? 2 * v16 : -2 * v16;
          v19 = (UniChar *)malloc_type_malloc(v18, 0xCCE6701AuLL);
          if (v19)
          {
            v20 = v19;
            v28.location = 0;
            v28.length = v17;
            CFStringGetCharacters(v13, v28, v19);
            v10->_length = v17;
            CFRelease(v13);
            v10->_characters = v20;
            goto LABEL_19;
          }
        }
        CFRelease(v13);
      }
    }
    id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Failed to allocate backing character buffer" userInfo:0];
    objc_exception_throw(v24);
  }
LABEL_19:
  v21 = v10;
  self = v21;
LABEL_21:
  v22 = v21;

  return v22;
}

- (ACZeroingString)initWithUTF8String:(const char *)a3
{
  if (!a3)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"ACZeroingString.m", 124, @"Invalid parameter not satisfying: %@", @"cString" object file lineNumber description];
  }
  size_t v5 = strlen(a3);

  return [(ACZeroingString *)self initWithBytes:a3 length:v5 encoding:4];
}

- (void)dealloc
{
  memset_s(self->_characters, 2 * self->_length, 0, 2 * self->_length);
  free(self->_characters);
  v3.receiver = self;
  v3.super_class = (Class)ACZeroingString;
  [(ACZeroingString *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACZeroingString)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ACZeroingString;
  size_t v5 = [(ACZeroingString *)&v18 init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AC.bytes"];
      uint64_t v7 = [v4 decodeIntegerForKey:@"AC.length"];
      if (v7 < 0)
      {
        id v17 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Failed to allocate backing character buffer" userInfo:0];
        objc_exception_throw(v17);
      }
      unint64_t v8 = v7;
      uint64_t v9 = 2 * v7;
      if (2 * v7 > (unint64_t)[v6 length])
      {
        v10 = _ACLogSystem();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[ACZeroingString initWithCoder:](v10);
        }
LABEL_16:

        BOOL v15 = 0;
        goto LABEL_17;
      }
      CFStringRef v13 = (unsigned __int16 *)malloc_type_malloc(v9, 0x138CB77AuLL);
      v5->_characters = v13;
      if (!v13)
      {
        v10 = _ACLogSystem();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[ACZeroingString initWithCoder:](v9, v10);
        }
        goto LABEL_16;
      }
      v14 = v13;
      v5->_length = v8;
      CFStringRef v12 = v6;
      memcpy(v14, (const void *)[(ACZeroingString *)v12 bytes], v9);
    }
    else
    {
      CFStringEncoding v11 = _ACLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[ACZeroingString initWithCoder:]((uint64_t)v4, v11);
      }

      CFStringRef v12 = v5;
      size_t v5 = 0;
    }
  }
  size_t v5 = v5;
  BOOL v15 = v5;
LABEL_17:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t length = self->_length;
  if ((length & 0x8000000000000000) != 0)
  {
    id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Failed to allocate backing character buffer" userInfo:0];
    objc_exception_throw(v14);
  }
  v6 = v4;
  NSUInteger v7 = 2 * length;
  vm_address_t v8 = ACAllocateMemoryPages(2 * length);
  uint64_t v9 = (void *)v8;
  characters = self->_characters;
  if (length >= 0x40000)
  {
    if (((NSPageSize() - 1) & ((unint64_t)characters | v8)) != 0)
    {
      vm_address_t v8 = (vm_address_t)v9;
      size_t v11 = 2 * length;
    }
    else
    {
      NSUInteger v13 = NSRoundDownToMultipleOfPageSize(v7);
      NSCopyMemoryPages(characters, v9, v13);
      characters = (unsigned __int16 *)((char *)characters + v13);
      vm_address_t v8 = (vm_address_t)v9 + v13;
      size_t v11 = v7 - v13;
      if (v7 == v13) {
        goto LABEL_7;
      }
    }
    goto LABEL_6;
  }
  size_t v11 = 2 * length;
  if (v7) {
LABEL_6:
  }
    memmove((void *)v8, characters, v11);
LABEL_7:
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __35__ACZeroingString_encodeWithCoder___block_invoke;
  v15[3] = &__block_descriptor_48_e5_v8__0l;
  v15[4] = v9;
  v15[5] = v7;
  dispatch_data_t v12 = dispatch_data_create(v9, v7, 0, v15);
  [v6 encodeObject:v12 forKey:@"AC.bytes"];
  [v6 encodeInteger:self->_length forKey:@"AC.length"];
}

uint64_t __35__ACZeroingString_encodeWithCoder___block_invoke(uint64_t a1)
{
  memset_s(*(void **)(a1 + 32), *(void *)(a1 + 40), 0, *(void *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return ACDeallocateMemoryPages(v2, v3);
}

- (Class)classForKeyedArchiver
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t length = self->_length;
  if ((length & 0x8000000000000000) != 0)
  {
    id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Failed to allocate backing character buffer" userInfo:0];
    objc_exception_throw(v10);
  }
  v6 = (void *)v4;
  size_t v7 = 2 * length;
  vm_address_t v8 = malloc_type_malloc(2 * length, 0xB5A1222AuLL);
  v6[1] = v8;
  v6[2] = self->_length;
  memcpy(v8, self->_characters, v7);
  return v6;
}

- (id)replacementObjectForCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = self;
  }
  else
  {
    v6 = [(ACZeroingString *)self _compatibleCopy];
  }

  return v6;
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

- (unint64_t)length
{
  return self->_length;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  if (self->_length <= a3)
  {
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:@"Index out of bounds" userInfo:0];
    objc_exception_throw(v4);
  }
  return self->_characters[a3];
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  if (self->_length < a4.location + a4.length)
  {
    id v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:@"Range out of bounds" userInfo:0];
    objc_exception_throw(v5);
  }
  id v4 = &self->_characters[a4.location];

  memcpy(a3, v4, 2 * a4.length);
}

- (id)_compatibleCopy
{
  uint64_t v2 = (void *)[NSString _newZStringWithCharacters:self->_characters length:self->_length];

  return v2;
}

- (unsigned)characters
{
  return self->_characters;
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A57C5000, log, OS_LOG_TYPE_ERROR, "\"ACZeroingString length mismatch\"", v1, 2u);
}

- (void)initWithCoder:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A57C5000, a2, OS_LOG_TYPE_ERROR, "\"ACZeroingString malloc failed to return %lu\"", (uint8_t *)&v2, 0xCu);
}

- (void)initWithCoder:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1A57C5000, a2, OS_LOG_TYPE_ERROR, "\"ACZeroingString is being used with a decoder of type %@, which is not allowed.\"", (uint8_t *)&v5, 0xCu);
}

@end