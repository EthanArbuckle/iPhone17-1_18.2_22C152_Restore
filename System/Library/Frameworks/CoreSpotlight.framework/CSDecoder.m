@interface CSDecoder
+ (id)decodeURLPreservingSecurityScope:(id)a3;
- ($917DE44C1CB612B85CED1B4C2573F471)obj;
- (CSDecoder)initWithData:(id)a3;
- (CSDecoder)initWithData:(id)a3 obj:(id *)a4;
- (NSData)data;
- (__CFAllocator)contentDeallocator;
- (id)backingStore;
- (id)debugDescription;
- (id)decode;
- (id)decodeObject:(id *)a3;
- (id)decodeObjectNoCopy:(id *)a3;
- (id)description;
- (void)dealloc;
- (void)setBackingStore:(id)a3;
@end

@implementation CSDecoder

- (id)decodeObject:(id *)a3
{
  $917DE44C1CB612B85CED1B4C2573F471 v5 = *a3;
  v3 = _CSDecodeObject((long long *)&v5, 0);

  return v3;
}

- (CSDecoder)initWithData:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSDecoder;
  $917DE44C1CB612B85CED1B4C2573F471 v5 = [(CSDecoder *)&v13 init];
  if (v5)
  {
    id v6 = v4;
    v7 = (unsigned __int16 *)[v6 bytes];
    unint64_t v8 = [v6 length];
    if (v8 >= 0xA && *v7 == 47838 && *(_DWORD *)(v7 + 1) == 256 && v8 == *(_DWORD *)(v7 + 3))
    {
      id v9 = v6;
      [v9 bytes];
      [v9 length];
      _MDPlistGetRootPlistObjectFromBytes();
      *(_OWORD *)&v5->_obj.containerBytes = v11;
      v5->_obj.reference = v12;
      objc_storeStrong((id *)&v5->_data, v9);
    }
    else
    {

      $917DE44C1CB612B85CED1B4C2573F471 v5 = 0;
    }
  }

  return v5;
}

- (id)decode
{
  [(CSDecoder *)self obj];
  v2 = _CSDecodeObject(&v4, 0);

  return v2;
}

- ($917DE44C1CB612B85CED1B4C2573F471)obj
{
  *($C7C160116BA828B4EE75DF30F571EBFF *)retstr = *($C7C160116BA828B4EE75DF30F571EBFF *)((char *)self + 32);
  return self;
}

- (void)setBackingStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backingStore, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (void)dealloc
{
  contentDeallocator = self->_contentDeallocator;
  if (contentDeallocator) {
    CFRelease(contentDeallocator);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSDecoder;
  [(CSDecoder *)&v4 dealloc];
}

- (id)backingStore
{
  return self->_backingStore;
}

- (id)decodeObjectNoCopy:(id *)a3
{
  $917DE44C1CB612B85CED1B4C2573F471 v5 = *a3;
  v3 = _CSDecodeObject((long long *)&v5, self);

  return v3;
}

- (CSDecoder)initWithData:(id)a3 obj:(id *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSDecoder;
  unint64_t v8 = [(CSDecoder *)&v11 init];
  if (v8)
  {
    if ([v7 length])
    {
      objc_storeStrong((id *)&v8->_data, a3);
      long long v9 = *(_OWORD *)&a4->var0;
      v8->_obj.reference = ($37FF168C8709F524D812460C59637AB1)a4->var2;
      *(_OWORD *)&v8->_obj.containerBytes = v9;
    }
    else
    {

      unint64_t v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  v2 = NSString;
  $C7C160116BA828B4EE75DF30F571EBFF obj = self->_obj;
  v3 = CSDecodeObject((uint64_t)&obj);
  objc_super v4 = [v2 stringWithFormat:@"<%@>", v3];

  return v4;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  $C7C160116BA828B4EE75DF30F571EBFF obj = self->_obj;
  $917DE44C1CB612B85CED1B4C2573F471 v5 = CSDecodeObject((uint64_t)&obj);
  id v6 = [v3 stringWithFormat:@"<%@:%p %@>", v4, self, v5];

  return v6;
}

+ (id)decodeURLPreservingSecurityScope:(id)a3
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28DC0];
    $917DE44C1CB612B85CED1B4C2573F471 v5 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
    id v7 = [v5 setWithArray:v6];
    id v16 = 0;
    unint64_t v8 = [v4 unarchivedObjectOfClasses:v7 fromData:v3 error:&v16];
    id v9 = v16;

    uint64_t v10 = [v8 objectForKeyedSubscript:@"path"];
    objc_super v11 = (void *)v10;
    if (v8 && v10)
    {
      $37FF168C8709F524D812460C59637AB1 v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
      objc_super v13 = [v8 objectForKeyedSubscript:@"ss"];
      if (v13)
      {
        MEMORY[0x192F98F90](v12, v13);
      }
      else
      {
        v14 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v11;
          _os_log_impl(&dword_18D0E3000, v14, OS_LOG_TYPE_INFO, "no ss attached to URL for path %@", buf, 0xCu);
        }
      }
    }
    else
    {
      objc_super v13 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[CSDecoder decodeURLPreservingSecurityScope:]((uint64_t)v9, v13);
      }
      $37FF168C8709F524D812460C59637AB1 v12 = 0;
    }
  }
  else
  {
    $37FF168C8709F524D812460C59637AB1 v12 = 0;
  }

  return v12;
}

- (NSData)data
{
  return self->_data;
}

- (__CFAllocator)contentDeallocator
{
  return self->_contentDeallocator;
}

+ (void)decodeURLPreservingSecurityScope:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_ERROR, "urlWrapper unarchive failed: %@", (uint8_t *)&v2, 0xCu);
}

@end