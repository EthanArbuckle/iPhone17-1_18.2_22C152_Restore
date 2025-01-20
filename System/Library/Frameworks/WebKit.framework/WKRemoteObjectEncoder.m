@interface WKRemoteObjectEncoder
- (BOOL)allowsKeyedCoding;
- (BOOL)requiresSecureCoding;
- (WKRemoteObjectEncoder)init;
- (id).cxx_construct;
- (void)encodeBool:(BOOL)a3 forKey:(id)a4;
- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5;
- (void)encodeDouble:(double)a3 forKey:(id)a4;
- (void)encodeFloat:(float)a3 forKey:(id)a4;
- (void)encodeInt32:(int)a3 forKey:(id)a4;
- (void)encodeInt64:(int64_t)a3 forKey:(id)a4;
- (void)encodeInt:(int)a3 forKey:(id)a4;
- (void)encodeObject:(id)a3 forKey:(id)a4;
- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4;
- (void)rootObjectDictionary;
@end

@implementation WKRemoteObjectEncoder

- (WKRemoteObjectEncoder)init
{
  v6.receiver = self;
  v6.super_class = (Class)WKRemoteObjectEncoder;
  v2 = [(WKRemoteObjectEncoder *)&v6 init];
  if (v2)
  {
    v3 = (WebKit *)API::Object::newObject(0x18uLL, 9);
    *(void *)v3 = &unk_1EE9D1E28;
    WebKit::InitializeWebKit2(v3);
    *(void *)v3 = &unk_1EE9D1E00;
    *((void *)v3 + 2) = 0;
    m_ptr = v2->_rootDictionary.m_ptr;
    v2->_rootDictionary.m_ptr = (Dictionary *)v3;
    if (m_ptr)
    {
      CFRelease(*((CFTypeRef *)m_ptr + 1));
      v3 = (WebKit *)v2->_rootDictionary.m_ptr;
    }
    v2->_currentDictionary = v3;
  }
  return v2;
}

- (void)rootObjectDictionary
{
  return self->_rootDictionary.m_ptr;
}

- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4
{
  int v6 = *a3;
  if (v6 <= 82)
  {
    switch(*a3)
    {
      case '@':
        v8 = *(NSError **)a4;
        goto LABEL_5;
      case 'A':
      case 'D':
      case 'E':
      case 'F':
      case 'G':
      case 'H':
        goto LABEL_18;
      case 'B':
        uint64_t v7 = [NSNumber numberWithBool:*(unsigned __int8 *)a4];
        goto LABEL_4;
      case 'C':
        uint64_t v7 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)a4];
        goto LABEL_4;
      case 'I':
        uint64_t v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)a4];
        goto LABEL_4;
      default:
        if (v6 == 76)
        {
          uint64_t v7 = [NSNumber numberWithUnsignedLong:*(void *)a4];
          goto LABEL_4;
        }
        if (v6 == 81)
        {
          uint64_t v7 = [NSNumber numberWithUnsignedLongLong:*(void *)a4];
          goto LABEL_4;
        }
LABEL_18:
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Unsupported type '%s'", a3);
        break;
    }
  }
  else
  {
    switch(*a3)
    {
      case 'c':
        uint64_t v7 = [NSNumber numberWithChar:*(char *)a4];
        break;
      case 'd':
        uint64_t v7 = [NSNumber numberWithDouble:*(double *)a4];
        break;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_18;
      case 'f':
        LODWORD(v4) = *(_DWORD *)a4;
        uint64_t v7 = [NSNumber numberWithFloat:v4];
        break;
      case 'i':
        uint64_t v7 = [NSNumber numberWithInt:*(unsigned int *)a4];
        break;
      case 'l':
        uint64_t v7 = [NSNumber numberWithLong:*(void *)a4];
        break;
      case 'q':
        uint64_t v7 = [NSNumber numberWithLongLong:*(void *)a4];
        break;
      case 's':
        uint64_t v7 = [NSNumber numberWithShort:*(__int16 *)a4];
        break;
      default:
        if (v6 != 83) {
          goto LABEL_18;
        }
        uint64_t v7 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)a4];
        break;
    }
LABEL_4:
    v8 = (NSError *)v7;
LABEL_5:
    encodeToObjectStream(self, v8);
  }
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v4 = a4;
  currentDictionary = (uint64_t *)self->_currentDictionary;
  if ([a4 length] && objc_msgSend(v4, "characterAtIndex:", 0) == 36) {
    id v4 = (id)[@"$" stringByAppendingString:v4];
  }
  MEMORY[0x19972EAD0](&v13, v4);
  createEncodedObject(&v11, self, (NSError *)a3);
  v12 = v11;
  WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>(currentDictionary + 2, &v13, (uint64_t *)&v12, (uint64_t)v14);
  uint64_t v9 = (uint64_t)v12;
  v12 = 0;
  if (v9) {
    CFRelease(*(CFTypeRef *)(v9 + 8));
  }
  v10 = v13;
  v13 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v8);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
}

- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5
{
  id v5 = a5;
  currentDictionary = (uint64_t *)self->_currentDictionary;
  if ([a5 length] && objc_msgSend(v5, "characterAtIndex:", 0) == 36) {
    id v5 = (id)[@"$" stringByAppendingString:v5];
  }
  MEMORY[0x19972EAD0](&v16, v5);
  API::Data::create((WTF *)a4, a3, &v14);
  uint64_t v9 = v14;
  v14 = 0;
  v15 = v9;
  WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>(currentDictionary + 2, &v16, (uint64_t *)&v15, (uint64_t)v17);
  uint64_t v11 = (uint64_t)v15;
  v15 = 0;
  if (v11) {
    CFRelease(*(CFTypeRef *)(v11 + 8));
  }
  v12 = v14;
  v14 = 0;
  if (v12) {
    CFRelease(*((CFTypeRef *)v12 + 1));
  }
  v13 = v16;
  v16 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v10);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  id v4 = a4;
  currentDictionary = (uint64_t *)self->_currentDictionary;
  if ([a4 length] && objc_msgSend(v4, "characterAtIndex:", 0) == 36) {
    id v4 = (id)[@"$" stringByAppendingString:v4];
  }
  MEMORY[0x19972EAD0](&v12, v4);
  uint64_t v7 = (WebKit *)API::Object::newObject(0x18uLL, 32);
  *((unsigned char *)v7 + 16) = a3;
  *(void *)uint64_t v7 = &unk_1EE9D1E28;
  WebKit::InitializeWebKit2(v7);
  *(void *)uint64_t v7 = &unk_1EE9B3ED0;
  uint64_t v11 = v7;
  WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>(currentDictionary + 2, &v12, (uint64_t *)&v11, (uint64_t)v13);
  uint64_t v9 = (uint64_t)v11;
  uint64_t v11 = 0;
  if (v9) {
    CFRelease(*(CFTypeRef *)(v9 + 8));
  }
  v10 = v12;
  v12 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v8);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  id v4 = a4;
  currentDictionary = (uint64_t *)self->_currentDictionary;
  if ([a4 length] && objc_msgSend(v4, "characterAtIndex:", 0) == 36) {
    id v4 = (id)[@"$" stringByAppendingString:v4];
  }
  MEMORY[0x19972EAD0](&v14, v4);
  API::UInt64::create((API::UInt64 *)a3, &v12);
  uint64_t v7 = v12;
  v12 = 0;
  v13 = v7;
  WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>(currentDictionary + 2, &v14, (uint64_t *)&v13, (uint64_t)v15);
  uint64_t v9 = (uint64_t)v13;
  v13 = 0;
  if (v9) {
    CFRelease(*(CFTypeRef *)(v9 + 8));
  }
  v10 = v12;
  v12 = 0;
  if (v10) {
    CFRelease(*((CFTypeRef *)v10 + 1));
  }
  uint64_t v11 = v14;
  v14 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v8);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  id v4 = a4;
  currentDictionary = (uint64_t *)self->_currentDictionary;
  if ([a4 length] && objc_msgSend(v4, "characterAtIndex:", 0) == 36) {
    id v4 = (id)[@"$" stringByAppendingString:v4];
  }
  MEMORY[0x19972EAD0](&v12, v4);
  uint64_t v7 = (WebKit *)API::Object::newObject(0x18uLL, 34);
  *((void *)v7 + 2) = a3;
  *(void *)uint64_t v7 = &unk_1EE9D1E28;
  WebKit::InitializeWebKit2(v7);
  *(void *)uint64_t v7 = &unk_1EE9B3EF8;
  uint64_t v11 = v7;
  WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>(currentDictionary + 2, &v12, (uint64_t *)&v11, (uint64_t)v13);
  uint64_t v9 = (uint64_t)v11;
  uint64_t v11 = 0;
  if (v9) {
    CFRelease(*(CFTypeRef *)(v9 + 8));
  }
  v10 = v12;
  v12 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v8);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  id v4 = a4;
  currentDictionary = (uint64_t *)self->_currentDictionary;
  if ([a4 length] && objc_msgSend(v4, "characterAtIndex:", 0) == 36) {
    id v4 = (id)[@"$" stringByAppendingString:v4];
  }
  MEMORY[0x19972EAD0](&v12, v4);
  uint64_t v7 = (WebKit *)API::Object::newObject(0x18uLL, 34);
  *((void *)v7 + 2) = a3;
  *(void *)uint64_t v7 = &unk_1EE9D1E28;
  WebKit::InitializeWebKit2(v7);
  *(void *)uint64_t v7 = &unk_1EE9B3EF8;
  uint64_t v11 = v7;
  WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>(currentDictionary + 2, &v12, (uint64_t *)&v11, (uint64_t)v13);
  uint64_t v9 = (uint64_t)v11;
  uint64_t v11 = 0;
  if (v9) {
    CFRelease(*(CFTypeRef *)(v9 + 8));
  }
  v10 = v12;
  v12 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v8);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  id v4 = a4;
  currentDictionary = (uint64_t *)self->_currentDictionary;
  if ([a4 length] && objc_msgSend(v4, "characterAtIndex:", 0) == 36) {
    id v4 = (id)[@"$" stringByAppendingString:v4];
  }
  MEMORY[0x19972EAD0](&v12, v4);
  uint64_t v7 = (double *)API::Object::newObject(0x18uLL, 33);
  v7[2] = a3;
  *(void *)uint64_t v7 = &unk_1EE9D1E28;
  WebKit::InitializeWebKit2((WebKit *)v7);
  *(void *)uint64_t v7 = &unk_1EE9B5380;
  uint64_t v11 = v7;
  WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>(currentDictionary + 2, &v12, (uint64_t *)&v11, (uint64_t)v13);
  uint64_t v9 = (uint64_t)v11;
  uint64_t v11 = 0;
  if (v9) {
    CFRelease(*(CFTypeRef *)(v9 + 8));
  }
  v10 = v12;
  v12 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v8);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  id v4 = a4;
  currentDictionary = (uint64_t *)self->_currentDictionary;
  if ([a4 length] && objc_msgSend(v4, "characterAtIndex:", 0) == 36) {
    id v4 = (id)[@"$" stringByAppendingString:v4];
  }
  MEMORY[0x19972EAD0](&v12, v4);
  uint64_t v7 = (double *)API::Object::newObject(0x18uLL, 33);
  v7[2] = a3;
  *(void *)uint64_t v7 = &unk_1EE9D1E28;
  WebKit::InitializeWebKit2((WebKit *)v7);
  *(void *)uint64_t v7 = &unk_1EE9B5380;
  uint64_t v11 = v7;
  WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>(currentDictionary + 2, &v12, (uint64_t *)&v11, (uint64_t)v13);
  uint64_t v9 = (uint64_t)v11;
  uint64_t v11 = 0;
  if (v9) {
    CFRelease(*(CFTypeRef *)(v9 + 8));
  }
  v10 = v12;
  v12 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v8);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
}

- (BOOL)requiresSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  m_table = self->_objectsBeingEncoded.m_impl.var0.m_table;
  if (m_table) {
    WTF::fastFree((WTF *)(m_table - 2), (void *)a2);
  }
  m_ptr = self->_rootDictionary.m_ptr;
  self->_rootDictionary.m_ptr = 0;
  if (m_ptr)
  {
    id v5 = (const void *)*((void *)m_ptr + 1);
    CFRelease(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end