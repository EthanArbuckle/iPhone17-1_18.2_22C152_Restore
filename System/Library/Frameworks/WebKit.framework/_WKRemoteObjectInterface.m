@interface _WKRemoteObjectInterface
+ (id)remoteObjectInterfaceWithProtocol:(id)a3;
- (CFTypeRef)debugDescription;
- (NSString)identifier;
- (Protocol)protocol;
- (_WKRemoteObjectInterface)initWithProtocol:(id)a3 identifier:(id)a4;
- (const)_allowedArgumentClassesForReplyBlockOfSelector:(SEL)a3;
- (const)_allowedArgumentClassesForSelector:(SEL)a3;
- (id).cxx_construct;
- (id)_invocationForReplyBlockOfSelector:(SEL)a3;
- (id)_invocationForSelector:(SEL)a3;
- (id)classesForSelector:(SEL)a3 argumentIndex:(unint64_t)a4;
- (id)classesForSelector:(SEL)a3 argumentIndex:(unint64_t)a4 ofReply:(BOOL)a5;
- (id)debugDescription;
- (void)setClasses:(id)a3 forSelector:(SEL)a4 argumentIndex:(unint64_t)a5;
- (void)setClasses:(id)a3 forSelector:(SEL)a4 argumentIndex:(unint64_t)a5 ofReply:(BOOL)a6;
@end

@implementation _WKRemoteObjectInterface

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

+ (id)remoteObjectInterfaceWithProtocol:(id)a3
{
  v3 = (const void *)[objc_alloc((Class)a1) initWithProtocol:a3 identifier:NSStringFromProtocol((Protocol *)a3)];
  v4 = (void *)CFMakeCollectable(v3);

  return v4;
}

- (_WKRemoteObjectInterface)initWithProtocol:(id)a3 identifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)_WKRemoteObjectInterface;
  v6 = [(_WKRemoteObjectInterface *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_protocol = (Protocol *)a3;
    uint64_t v8 = [a4 copy];
    m_ptr = v7->_identifier.m_ptr;
    v7->_identifier.m_ptr = (void *)v8;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    initializeMethods(v7, v7->_protocol);
  }
  return v7;
}

- (void)setClasses:(id)a3 forSelector:(SEL)a4 argumentIndex:(unint64_t)a5 ofReply:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v11 = [a3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v21;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(a3);
        }
        uint64_t v19 = *(void *)(*((void *)&v20 + 1) + 8 * v13);
        WTF::HashTable<void const*,void const*,WTF::IdentityExtractor,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<void const*>>::add(&v24, &v19, (uint64_t)&v18);
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [a3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v11);
  }
  v14 = (uint64_t *)classesForSelectorArgument((_WKRemoteObjectInterface *)self->_methods.m_impl.var0.m_table, (objc_selector *)a4, a5, v6);
  uint64_t v16 = v24;
  uint64_t v24 = 0;
  uint64_t v17 = *v14;
  uint64_t *v14 = v16;
  if (v17) {
    WTF::fastFree((WTF *)(v17 - 16), v15);
  }
  if (v24) {
    WTF::fastFree((WTF *)(v24 - 16), v15);
  }
}

- (NSString)identifier
{
  return (NSString *)self->_identifier.m_ptr;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  BOOL v6 = objc_msgSend(v3, "initWithFormat:", @"<%@: %p; protocol = \"%@\"; identifier = \"%@\"\n",
                 v5,
                 self,
                 self->_identifier.m_ptr,
                 NSStringFromProtocol(self->_protocol));
  m_tableForLLDB = self->_methods.m_impl.var0.m_tableForLLDB;
  if (!m_tableForLLDB)
  {
    m_table = 0;
    LODWORD(v8) = 0;
    goto LABEL_9;
  }
  uint64_t v8 = *(m_tableForLLDB - 1);
  v9 = (SEL *)&m_tableForLLDB[14 * v8];
  if (!*(m_tableForLLDB - 3))
  {
    m_table = (SEL *)&m_tableForLLDB[14 * v8];
LABEL_9:
    v9 = (SEL *)&m_tableForLLDB[14 * v8];
    goto LABEL_10;
  }
  m_table = (SEL *)self->_methods.m_impl.var0.m_table;
  if (v8)
  {
    uint64_t v11 = 56 * v8;
    m_table = (SEL *)self->_methods.m_impl.var0.m_table;
    while ((unint64_t)(*m_table + 1) <= 1)
    {
      m_table += 7;
      v11 -= 56;
      if (!v11)
      {
        m_table = v9;
        break;
      }
    }
  }
LABEL_10:
  if (m_tableForLLDB) {
    uint64_t v12 = (SEL *)&m_tableForLLDB[14 * *(m_tableForLLDB - 1)];
  }
  else {
    uint64_t v12 = 0;
  }
  while (m_table != v12)
  {
    Name = sel_getName(*m_table);
    [v6 appendFormat:@" selector = %s\n  argument classes = %@\n", Name, -[_WKRemoteObjectInterface debugDescription]::$_0::operator()<WTF::Vector<WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>((uint64_t)(m_table + 1))];
    v14 = (char *)m_table[6];
    if (v14) {
      [v6 appendFormat:@"  reply block = (argument '%@') %@\n", objc_msgSend((id)objc_msgSend(v14, "methodSignature"), "_typeString"), -[_WKRemoteObjectInterface debugDescription]::$_0::operator()<WTF::Vector<WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>((uint64_t)(m_table + 4))];
    }
    v15 = m_table + 7;
    m_table = v9;
    if (v15 != v9)
    {
      m_table = v15;
      while ((unint64_t)(*m_table + 1) <= 1)
      {
        m_table += 7;
        if (m_table == v9)
        {
          m_table = v9;
          break;
        }
      }
    }
  }
  [v6 appendString:@">\n"];
  return (id)(id)CFMakeCollectable(v6);
}

- (CFTypeRef)debugDescription
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"["];
  uint64_t v3 = *(unsigned int *)(a1 + 12);
  if (!v3)
  {
LABEL_33:
    [v2 appendString:@"]"];
    return (id)CFMakeCollectable(v2);
  }
  char v4 = 0;
  v5 = *(uint64_t ***)a1;
  BOOL v6 = &v5[v3];
  while (1)
  {
    if (v4) {
      [v2 appendString:@", "];
    }
    CFTypeRef result = (CFTypeRef)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"{"];
    uint64_t v8 = (void *)result;
    if (!*v5 || (uint64_t v9 = *((unsigned int *)*v5 - 3), !v9))
    {
      v10 = 0;
      goto LABEL_10;
    }
    if (v9 >> 29) {
      break;
    }
    v10 = (WTF *)WTF::fastMalloc((WTF *)(8 * v9));
LABEL_10:
    uint64_t v11 = WTF::HashTable<void const*,void const*,WTF::IdentityExtractor,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<void const*>>::begin(v5);
    uint64_t v13 = *v5;
    if (*v5) {
      v13 += *((unsigned int *)v13 - 1);
    }
    if (v13 == v11)
    {
      unsigned int v14 = 0;
    }
    else
    {
      unsigned int v14 = 0;
      do
      {
        uint64_t v15 = *v11++;
        *((void *)v10 + v14) = v15;
        while (v11 != v12)
        {
          if ((unint64_t)(*v11 + 1) > 1) {
            goto LABEL_19;
          }
          ++v11;
        }
        uint64_t v11 = v12;
LABEL_19:
        ++v14;
      }
      while (v11 != v13);
    }
    uint64_t v16 = v14;
    unint64_t v17 = 126 - 2 * __clz(v14);
    if (v14) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = 0;
    }
    _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZZZ44___WKRemoteObjectInterface_debugDescription_ENK3__0clIN3WTF6VectorINS4_7HashSetIPKvNS4_11DefaultHashIS8_EENS4_10HashTraitsIS8_EENS4_15HashTableTraitsEEELm0ENS4_15CrashOnOverflowELm16ENS4_10FastMallocEEEEEDaRT_ENKUlSK_E_clISE_EESI_SK_EUlS8_S8_E_PS8_Lb0EEEvT1_SQ_T0_NS_15iterator_traitsISQ_E15difference_typeEb((uint64_t)v10, (objc_class **)v10 + v14, v18, 1);
    if (v16)
    {
      char v19 = 0;
      uint64_t v20 = 8 * v16;
      long long v21 = (Class *)v10;
      do
      {
        if (v19) {
          [v8 appendString:@", "];
        }
        objc_msgSend(v8, "appendFormat:", @"%s", class_getName(*v21++));
        char v19 = 1;
        v20 -= 8;
      }
      while (v20);
    }
    [v8 appendString:@"}"];
    CFTypeRef v23 = (id)CFMakeCollectable(v8);
    if (v10) {
      WTF::fastFree(v10, v22);
    }
    [v2 appendString:v23];
    ++v5;
    char v4 = 1;
    if (v5 == v6) {
      goto LABEL_33;
    }
  }
  __break(0xC471u);
  return result;
}

- (id)classesForSelector:(SEL)a3 argumentIndex:(unint64_t)a4 ofReply:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v10 = (void **)classesForSelectorArgument((_WKRemoteObjectInterface *)self->_methods.m_impl.var0.m_table, (objc_selector *)a3, a4, v5);
  uint64_t v11 = WTF::HashTable<void const*,void const*,WTF::IdentityExtractor,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<void const*>>::begin(v10);
  uint64_t v12 = v11;
  unsigned int v14 = v13;
  if (*v10) {
    uint64_t v15 = (uint64_t)&(*v10)[*((unsigned int *)*v10 - 1)];
  }
  else {
    uint64_t v15 = 0;
  }
  if ((void *)v15 != v11)
  {
    do
    {
      [v9 addObject:*v12];
      while (++v12 != v14)
      {
        if ((unint64_t)(*v12 + 1) > 1) {
          goto LABEL_10;
        }
      }
      uint64_t v12 = v14;
LABEL_10:
      ;
    }
    while (v12 != (void *)v15);
  }
  uint64_t v16 = (void *)CFMakeCollectable(v9);

  return v16;
}

- (id)classesForSelector:(SEL)a3 argumentIndex:(unint64_t)a4
{
  return [(_WKRemoteObjectInterface *)self classesForSelector:a3 argumentIndex:a4 ofReply:0];
}

- (void)setClasses:(id)a3 forSelector:(SEL)a4 argumentIndex:(unint64_t)a5
{
}

- (id)_invocationForSelector:(SEL)a3
{
  m_table = (char *)self->_methods.m_impl.var0.m_table;
  char v4 = WTF::HashTable<objc_selector *,WTF::KeyValuePair<objc_selector *,MethodInfo>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<objc_selector *,MethodInfo>>,WTF::DefaultHash<objc_selector *>,WTF::HashMap<objc_selector *,MethodInfo,WTF::DefaultHash<objc_selector *>,WTF::HashTraits<objc_selector *>,WTF::HashTraits<MethodInfo>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<objc_selector *>>::find<WTF::IdentityHashTranslator<WTF::HashMap<objc_selector *,MethodInfo,WTF::DefaultHash<objc_selector *>,WTF::HashTraits<objc_selector *>,WTF::HashTraits<MethodInfo>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<objc_selector *>>,objc_selector *>((uint64_t)m_table, (uint64_t)a3);
  if (m_table) {
    BOOL v5 = (uint64_t *)&m_table[56 * *((unsigned int *)m_table - 1)];
  }
  else {
    BOOL v5 = 0;
  }
  if (v5 == v4) {
    return 0;
  }
  BOOL v6 = (void *)CFMakeCollectable((CFTypeRef)[(id)v4[3] copy]);

  return v6;
}

- (id)_invocationForReplyBlockOfSelector:(SEL)a3
{
  m_table = (char *)self->_methods.m_impl.var0.m_table;
  char v4 = WTF::HashTable<objc_selector *,WTF::KeyValuePair<objc_selector *,MethodInfo>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<objc_selector *,MethodInfo>>,WTF::DefaultHash<objc_selector *>,WTF::HashMap<objc_selector *,MethodInfo,WTF::DefaultHash<objc_selector *>,WTF::HashTraits<objc_selector *>,WTF::HashTraits<MethodInfo>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<objc_selector *>>::find<WTF::IdentityHashTranslator<WTF::HashMap<objc_selector *,MethodInfo,WTF::DefaultHash<objc_selector *>,WTF::HashTraits<objc_selector *>,WTF::HashTraits<MethodInfo>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<objc_selector *>>,objc_selector *>((uint64_t)m_table, (uint64_t)a3);
  if (m_table) {
    BOOL v5 = (uint64_t *)&m_table[56 * *((unsigned int *)m_table - 1)];
  }
  else {
    BOOL v5 = 0;
  }
  if (v5 == v4) {
    return 0;
  }
  BOOL v6 = (void *)CFMakeCollectable((CFTypeRef)[(id)v4[6] copy]);

  return v6;
}

- (const)_allowedArgumentClassesForSelector:(SEL)a3
{
  return WTF::HashTable<objc_selector *,WTF::KeyValuePair<objc_selector *,MethodInfo>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<objc_selector *,MethodInfo>>,WTF::DefaultHash<objc_selector *>,WTF::HashMap<objc_selector *,MethodInfo,WTF::DefaultHash<objc_selector *>,WTF::HashTraits<objc_selector *>,WTF::HashTraits<MethodInfo>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<objc_selector *>>::find<WTF::IdentityHashTranslator<WTF::HashMap<objc_selector *,MethodInfo,WTF::DefaultHash<objc_selector *>,WTF::HashTraits<objc_selector *>,WTF::HashTraits<MethodInfo>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<objc_selector *>>,objc_selector *>((uint64_t)self->_methods.m_impl.var0.m_table, (uint64_t)a3)+ 1;
}

- (const)_allowedArgumentClassesForReplyBlockOfSelector:(SEL)a3
{
  return WTF::HashTable<objc_selector *,WTF::KeyValuePair<objc_selector *,MethodInfo>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<objc_selector *,MethodInfo>>,WTF::DefaultHash<objc_selector *>,WTF::HashMap<objc_selector *,MethodInfo,WTF::DefaultHash<objc_selector *>,WTF::HashTraits<objc_selector *>,WTF::HashTraits<MethodInfo>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<objc_selector *>>::find<WTF::IdentityHashTranslator<WTF::HashMap<objc_selector *,MethodInfo,WTF::DefaultHash<objc_selector *>,WTF::HashTraits<objc_selector *>,WTF::HashTraits<MethodInfo>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<objc_selector *>>,objc_selector *>((uint64_t)self->_methods.m_impl.var0.m_table, (uint64_t)a3)+ 4;
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (void).cxx_destruct
{
  m_tableForLLDB = self->_methods.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    uint64_t v4 = *(m_tableForLLDB - 1);
    if (v4)
    {
      BOOL v5 = (char *)(m_tableForLLDB + 6);
      do
      {
        if (*((void *)v5 - 3) != -1)
        {
          BOOL v6 = (const void *)*((void *)v5 + 3);
          *((void *)v5 + 3) = 0;
          if (v6) {
            CFRelease(v6);
          }
          WTF::Vector<WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)(v5 + 8), (void *)a2);
          uint64_t v8 = *(const void **)v5;
          *(void *)BOOL v5 = 0;
          if (v8) {
            CFRelease(v8);
          }
          WTF::Vector<WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)(v5 - 16), v7);
        }
        v5 += 56;
        --v4;
      }
      while (v4);
    }
    WTF::fastFree((WTF *)(m_tableForLLDB - 4), (void *)a2);
  }
  m_ptr = self->_identifier.m_ptr;
  self->_identifier.m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

@end