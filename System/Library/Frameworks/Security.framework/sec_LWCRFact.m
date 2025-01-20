@interface sec_LWCRFact
+ (id)BOOLFact:(BOOL)a3;
+ (id)dataFact:(id)a3;
+ (id)entitlementsFact:(id)a3;
+ (id)integerFact:(id)a3;
+ (id)stringFact:(id)a3;
- (id).cxx_construct;
- (void)bindName:(const char *)a3 withLength:(unint64_t)a4;
- (void)dealloc;
@end

@implementation sec_LWCRFact

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->dataFactStorage, 0);

  objc_storeStrong((id *)&self->stringFactStorage, 0);
}

- (void)bindName:(const char *)a3 withLength:(unint64_t)a4
{
  self->fact.name.data = (char *)a3;
  self->fact.name.length = a4;
}

- (void)dealloc
{
  if (self->fact.type == 1) {
    CEReleaseManagedContext();
  }
  v3.receiver = self;
  v3.super_class = (Class)sec_LWCRFact;
  [(sec_LWCRFact *)&v3 dealloc];
}

+ (id)dataFact:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(sec_LWCRFact);
  v4->fact.type = 6;
  uint64_t v5 = [v3 copy];
  dataFactStorage = v4->dataFactStorage;
  v4->dataFactStorage = (NSData *)v5;

  v4->fact.value.integer = (int64_t)[(NSData *)v4->dataFactStorage bytes];
  v4->fact.value.string.length = [(NSData *)v4->dataFactStorage length];

  return v4;
}

+ (id)entitlementsFact:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(sec_LWCRFact);
  v4->fact.type = 1;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v18 = 0;
  uint64_t v5 = serializeDict(v3, (char **)__p);
  v6 = (uint64_t *)MEMORY[0x1E4FB9E58];
  v7 = __p[0];
  if (v5 != *MEMORY[0x1E4FB9E58] || (uint64_t v5 = CESizeSerialization(), v5 != *v6))
  {
    v8 = 0;
    if (!v7) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  id v15 = [MEMORY[0x1E4F1CA58] dataWithLength:0];
  [v15 bytes];
  id v16 = v15;
  [v16 bytes];
  uint64_t v5 = CESerializeWithOptions();
  if (v5 == *v6)
  {
    v8 = (NSData *)v16;
    uint64_t v5 = *v6;
  }
  else
  {
    v8 = 0;
  }

  if (v7) {
LABEL_4:
  }
    operator delete(v7);
LABEL_5:
  if (v5 == *v6)
  {
    dataFactStorage = v4->dataFactStorage;
    v4->dataFactStorage = v8;

    CFDataRef v11 = (const __CFData *)v4->dataFactStorage;
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v18 = 0;
    CFDataGetBytePtr(v11);
    CFDataGetLength(v11);
    uint64_t v12 = CEValidate();
    uint64_t v13 = *v6;
    if (v12 == *v6)
    {
      uint64_t v12 = CEAcquireManagedContext();
      uint64_t v13 = *v6;
    }
    if (v12 == v13) {
      v9 = v4;
    }
    else {
      v9 = 0;
    }
    if (v12 == v13) {
      v4 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)stringFact:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(sec_LWCRFact);
  v4->fact.type = 4;
  uint64_t v5 = [v3 copy];
  stringFactStorage = v4->stringFactStorage;
  v4->stringFactStorage = (NSString *)v5;

  v4->fact.value.integer = (int64_t)[(NSString *)v4->stringFactStorage UTF8String];
  v4->fact.value.string.length = strlen([(NSString *)v4->stringFactStorage UTF8String]);

  return v4;
}

+ (id)integerFact:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(sec_LWCRFact);
  v4->fact.type = 3;
  v4->fact.value.integer = [v3 longLongValue];

  return v4;
}

+ (id)BOOLFact:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = objc_alloc_init(sec_LWCRFact);
  v4->fact.type = 5;
  v4->fact.value.integer = v3;

  return v4;
}

@end