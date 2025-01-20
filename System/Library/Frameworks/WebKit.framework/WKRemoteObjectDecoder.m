@interface WKRemoteObjectDecoder
- (BOOL)allowsKeyedCoding;
- (BOOL)containsValueForKey:(id)a3;
- (BOOL)decodeBoolForKey:(id)a3;
- (BOOL)requiresSecureCoding;
- (WKRemoteObjectDecoder)initWithInterface:(id)a3 rootObjectDictionary:(const void *)a4 replyToSelector:(SEL)a5;
- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4;
- (double)decodeDoubleForKey:(id)a3;
- (float)decodeFloatForKey:(id)a3;
- (id).cxx_construct;
- (id)allowedClasses;
- (id)decodeObjectForKey:(id)a3;
- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4;
- (int)decodeInt32ForKey:(id)a3;
- (int)decodeIntForKey:(id)a3;
- (int64_t)decodeInt64ForKey:(id)a3;
- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4;
@end

@implementation WKRemoteObjectDecoder

- (WKRemoteObjectDecoder)initWithInterface:(id)a3 rootObjectDictionary:(const void *)a4 replyToSelector:(SEL)a5
{
  v17.receiver = self;
  v17.super_class = (Class)WKRemoteObjectDecoder;
  v8 = [(WKRemoteObjectDecoder *)&v17 init];
  v9 = v8;
  if (v8)
  {
    WTF::RetainPtr<NSURLSession>::operator=((const void **)&v8->_interface.m_ptr, a3);
    v9->_uint64_t rootDictionary = a4;
    v9->_currentDictionary = a4;
    if (a5) {
      SEL v10 = a5;
    }
    else {
      SEL v10 = 0;
    }
    v9->_replyToSelector = v10;
    uint64_t rootDictionary = (uint64_t)v9->_rootDictionary;
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    v9->_objectStream = API::Dictionary::get<API::Array>(rootDictionary, &v16, v12);
    v14 = v16;
    v16 = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2) {
        WTF::StringImpl::destroy(v14, v13);
      }
      else {
        *(_DWORD *)v14 -= 2;
      }
    }
  }
  return v9;
}

- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  int v6 = *a3;
  if (v6 > 80)
  {
    switch(*a3)
    {
      case 'c':
        v15[0] = objc_opt_class();
        WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
        char v7 = objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "charValue");
        goto LABEL_15;
      case 'd':
        v15[0] = objc_opt_class();
        WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
        objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "doubleValue");
        *(void *)a4 = v12;
        goto LABEL_28;
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
        goto LABEL_17;
      case 'f':
        v15[0] = objc_opt_class();
        WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
        objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "floatValue");
        *(_DWORD *)a4 = v13;
        goto LABEL_28;
      case 'i':
        v15[0] = objc_opt_class();
        WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
        int v11 = objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "intValue");
        goto LABEL_21;
      case 'l':
        v15[0] = objc_opt_class();
        WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
        uint64_t v9 = objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "longValue");
        goto LABEL_27;
      case 'q':
        v15[0] = objc_opt_class();
        WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
        uint64_t v9 = objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "longLongValue");
        goto LABEL_27;
      case 's':
        v15[0] = objc_opt_class();
        WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
        __int16 v10 = objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "shortValue");
        goto LABEL_25;
      default:
        if (v6 == 81)
        {
          v15[0] = objc_opt_class();
          WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
          uint64_t v9 = objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "unsignedLongLongValue");
          goto LABEL_27;
        }
        if (v6 != 83) {
          goto LABEL_17;
        }
        v15[0] = objc_opt_class();
        WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
        __int16 v10 = objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "unsignedShortValue");
LABEL_25:
        *(_WORD *)a4 = v10;
        break;
    }
    goto LABEL_28;
  }
  if (v6 > 72)
  {
    if (v6 == 73)
    {
      v15[0] = objc_opt_class();
      WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
      int v11 = objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "unsignedIntValue");
LABEL_21:
      *(_DWORD *)a4 = v11;
      goto LABEL_28;
    }
    if (v6 == 76)
    {
      v15[0] = objc_opt_class();
      WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
      uint64_t v9 = objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "unsignedLongValue");
LABEL_27:
      *(void *)a4 = v9;
      goto LABEL_28;
    }
    goto LABEL_17;
  }
  if (v6 == 66)
  {
    v15[0] = objc_opt_class();
    WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
    char v7 = objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "BOOLValue");
    goto LABEL_15;
  }
  if (v6 != 67)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F28498], @"Unsupported type '%s'", a3);
    return;
  }
  v15[0] = objc_opt_class();
  WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
  char v7 = objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "unsignedCharValue");
LABEL_15:
  *(unsigned char *)a4 = v7;
LABEL_28:
  if (v14) {
    WTF::fastFree((WTF *)(v14 - 16), v8);
  }
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (BOOL)containsValueForKey:(id)a3
{
  id v3 = a3;
  currentDictionary = self->_currentDictionary;
  if ([a3 length] && objc_msgSend(v3, "characterAtIndex:", 0) == 36) {
    id v3 = (id)[@"$" stringByAppendingString:v3];
  }
  MEMORY[0x19972EAD0](&v16, v3);
  uint64_t v7 = currentDictionary[2];
  v8 = v16;
  if (v7)
  {
    int v9 = *(_DWORD *)(v7 - 8);
    unsigned int v10 = *((_DWORD *)v16 + 4);
    if (v10 >= 0x100) {
      unsigned int v11 = v10 >> 8;
    }
    else {
      unsigned int v11 = WTF::StringImpl::hashSlowCase(v16);
    }
    for (i = 0; ; unsigned int v11 = i + v13)
    {
      int v13 = v11 & v9;
      uint64_t v14 = *(WTF **)(v7 + 16 * (v11 & v9));
      if (!v14)
      {
        LOBYTE(v7) = 0;
        goto LABEL_13;
      }
      if (v14 != (WTF *)-1 && (WTF::equal(v14, v16, v6) & 1) != 0) {
        break;
      }
      ++i;
    }
    LOBYTE(v7) = 1;
LABEL_13:
    v8 = v16;
  }
  v16 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v5);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  return v7;
}

- (id)decodeObjectForKey:(id)a3
{
  return [(WKRemoteObjectDecoder *)self decodeObjectOfClasses:0 forKey:a3];
}

- (BOOL)decodeBoolForKey:(id)a3
{
  id v3 = a3;
  currentDictionary = self->_currentDictionary;
  if ([a3 length] && objc_msgSend(v3, "characterAtIndex:", 0) == 36) {
    id v3 = (id)[@"$" stringByAppendingString:v3];
  }
  MEMORY[0x19972EAD0](&v12, v3);
  int v6 = API::Dictionary::get<API::Boolean>((uint64_t)currentDictionary, &v12, v5);
  v8 = v6;
  if (v6) {
    CFRetain(v6[1]);
  }
  int v9 = v12;
  uint64_t v12 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v7);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  if (!v8) {
    return 0;
  }
  BOOL v10 = *((unsigned char *)v8 + 16) != 0;
  CFRelease(v8[1]);
  return v10;
}

- (int)decodeIntForKey:(id)a3
{
  id v3 = a3;
  currentDictionary = self->_currentDictionary;
  if ([a3 length] && objc_msgSend(v3, "characterAtIndex:", 0) == 36) {
    id v3 = (id)[@"$" stringByAppendingString:v3];
  }
  MEMORY[0x19972EAD0](&v12, v3);
  int v6 = API::Dictionary::get<API::UInt64>((uint64_t)currentDictionary, &v12, v5);
  v8 = v6;
  if (v6) {
    CFRetain(v6[1]);
  }
  int v9 = v12;
  uint64_t v12 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
    {
      WTF::StringImpl::destroy(v9, v7);
      if (v8) {
        goto LABEL_10;
      }
      return 0;
    }
    *(_DWORD *)v9 -= 2;
  }
  if (!v8) {
    return 0;
  }
LABEL_10:
  int v10 = *((_DWORD *)v8 + 4);
  CFRelease(v8[1]);
  return v10;
}

- (int)decodeInt32ForKey:(id)a3
{
  id v3 = a3;
  currentDictionary = self->_currentDictionary;
  if ([a3 length] && objc_msgSend(v3, "characterAtIndex:", 0) == 36) {
    id v3 = (id)[@"$" stringByAppendingString:v3];
  }
  MEMORY[0x19972EAD0](&v12, v3);
  int v6 = API::Dictionary::get<API::UInt64>((uint64_t)currentDictionary, &v12, v5);
  v8 = v6;
  if (v6) {
    CFRetain(v6[1]);
  }
  int v9 = v12;
  uint64_t v12 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
    {
      WTF::StringImpl::destroy(v9, v7);
      if (v8) {
        goto LABEL_10;
      }
      return 0;
    }
    *(_DWORD *)v9 -= 2;
  }
  if (!v8) {
    return 0;
  }
LABEL_10:
  int v10 = *((_DWORD *)v8 + 4);
  CFRelease(v8[1]);
  return v10;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  id v3 = a3;
  currentDictionary = self->_currentDictionary;
  if ([a3 length] && objc_msgSend(v3, "characterAtIndex:", 0) == 36) {
    id v3 = (id)[@"$" stringByAppendingString:v3];
  }
  MEMORY[0x19972EAD0](&v12, v3);
  int v6 = API::Dictionary::get<API::UInt64>((uint64_t)currentDictionary, &v12, v5);
  v8 = v6;
  if (v6) {
    CFRetain(v6[1]);
  }
  int v9 = v12;
  uint64_t v12 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v7);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  if (!v8) {
    return 0;
  }
  int64_t v10 = (int64_t)v8[2];
  CFRelease(v8[1]);
  return v10;
}

- (float)decodeFloatForKey:(id)a3
{
  id v3 = a3;
  currentDictionary = self->_currentDictionary;
  if ([a3 length] && objc_msgSend(v3, "characterAtIndex:", 0) == 36) {
    id v3 = (id)[@"$" stringByAppendingString:v3];
  }
  MEMORY[0x19972EAD0](&v12, v3);
  int v6 = API::Dictionary::get<API::Double>((uint64_t)currentDictionary, &v12, v5);
  v8 = v6;
  if (v6) {
    CFRetain(v6[1]);
  }
  int v9 = v12;
  uint64_t v12 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
    {
      WTF::StringImpl::destroy(v9, v7);
      if (v8) {
        goto LABEL_10;
      }
      return 0.0;
    }
    *(_DWORD *)v9 -= 2;
  }
  if (!v8) {
    return 0.0;
  }
LABEL_10:
  float v10 = *((double *)v8 + 2);
  CFRelease(v8[1]);
  return v10;
}

- (double)decodeDoubleForKey:(id)a3
{
  id v3 = a3;
  currentDictionary = self->_currentDictionary;
  if ([a3 length] && objc_msgSend(v3, "characterAtIndex:", 0) == 36) {
    id v3 = (id)[@"$" stringByAppendingString:v3];
  }
  MEMORY[0x19972EAD0](&v12, v3);
  int v6 = API::Dictionary::get<API::Double>((uint64_t)currentDictionary, &v12, v5);
  v8 = v6;
  if (v6) {
    CFRetain(v6[1]);
  }
  int v9 = v12;
  uint64_t v12 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
    {
      WTF::StringImpl::destroy(v9, v7);
      if (v8) {
        goto LABEL_10;
      }
      return 0.0;
    }
    *(_DWORD *)v9 -= 2;
  }
  if (!v8) {
    return 0.0;
  }
LABEL_10:
  double v10 = *((double *)v8 + 2);
  CFRelease(v8[1]);
  return v10;
}

- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4
{
  id v5 = a3;
  currentDictionary = (uint64_t *)self->_currentDictionary;
  if ([a3 length] && objc_msgSend(v5, "characterAtIndex:", 0) == 36) {
    id v5 = (id)[@"$" stringByAppendingString:v5];
  }
  MEMORY[0x19972EAD0](&v17, v5);
  v8 = WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::String>>,WTF::String>(currentDictionary + 2, &v17, v7);
  double v10 = v8;
  if (v8)
  {
    CFRetain(*((CFTypeRef *)v8 + 1));
    int v11 = (*(uint64_t (**)(WTF *))(*(void *)v10 + 16))(v10);
    CFRelease(*((CFTypeRef *)v10 + 1));
    if (v11 == 8)
    {
      CFRetain(*((CFTypeRef *)v10 + 1));
      int v12 = 0;
      goto LABEL_9;
    }
    double v10 = 0;
  }
  int v12 = 1;
LABEL_9:
  int v13 = v17;
  objc_super v17 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
    {
      WTF::StringImpl::destroy(v13, v9);
      if (v12) {
        goto LABEL_13;
      }
      goto LABEL_15;
    }
    *(_DWORD *)v13 -= 2;
  }
  if (v12)
  {
LABEL_13:
    uint64_t v14 = 0;
    *a4 = 0;
    return v14;
  }
LABEL_15:
  unint64_t v15 = *((void *)v10 + 3);
  if (v15) {
    uint64_t v14 = (const char *)*((void *)v10 + 2);
  }
  else {
    uint64_t v14 = 0;
  }
  *a4 = v15;
  CFRelease(*((CFTypeRef *)v10 + 1));
  return v14;
}

- (BOOL)requiresSecureCoding
{
  return 1;
}

- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v27 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v22 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        WTF::HashTable<void const*,void const*,WTF::IdentityExtractor,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<void const*>>::add(&v27, &v22, (uint64_t)v21);
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }
  currentDictionary = (uint64_t *)self->_currentDictionary;
  if ([a4 length] && objc_msgSend(a4, "characterAtIndex:", 0) == 36) {
    a4 = (id)[@"$" stringByAppendingString:a4];
  }
  MEMORY[0x19972EAD0](v21, a4);
  int v12 = WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::String>>,WTF::String>(currentDictionary + 2, v21, v11);
  uint64_t v14 = (CFTypeRef *)v12;
  if (v12)
  {
    CFRetain(*((CFTypeRef *)v12 + 1));
    int v15 = (*((uint64_t (**)(CFTypeRef *))*v14 + 2))(v14);
    CFRelease(v14[1]);
    if (v15 == 9)
    {
      CFRetain(v14[1]);
      char v16 = 0;
      goto LABEL_14;
    }
    uint64_t v14 = 0;
  }
  char v16 = 1;
LABEL_14:
  objc_super v17 = v21[0];
  v21[0] = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy(v17, v13);
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  CFTypeRef v19 = decodeObject(self, v14, &v27);
  if ((v16 & 1) == 0) {
    CFRelease(v14[1]);
  }
  if (v27) {
    WTF::fastFree((WTF *)(v27 - 16), v18);
  }
  return (id)v19;
}

- (id)allowedClasses
{
  if (self->_allowedClasses)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    allowedClasses = (void **)self->_allowedClasses;
    id v5 = WTF::HashTable<void const*,void const*,WTF::IdentityExtractor,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<void const*>>::begin(allowedClasses);
    int v6 = v5;
    uint64_t v8 = v7;
    if (*allowedClasses) {
      uint64_t v9 = (uint64_t)&(*allowedClasses)[*((unsigned int *)*allowedClasses - 1)];
    }
    else {
      uint64_t v9 = 0;
    }
    if ((void *)v9 != v5)
    {
      do
      {
        [v3 addObject:*v6];
        while (++v6 != v8)
        {
          if ((unint64_t)(*v6 + 1) > 1) {
            goto LABEL_14;
          }
        }
        int v6 = v8;
LABEL_14:
        ;
      }
      while (v6 != (void *)v9);
    }
    int v12 = (void *)CFMakeCollectable(v3);
    return v12;
  }
  else
  {
    double v10 = (void *)MEMORY[0x1E4F1CAD0];
    return (id)[v10 set];
  }
}

- (void).cxx_destruct
{
  m_ptr = self->_interface.m_ptr;
  self->_interface.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end