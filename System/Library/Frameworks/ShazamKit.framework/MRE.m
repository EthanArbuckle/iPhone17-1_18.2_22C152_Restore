@interface MRE
- (BOOL)ConvertException:(const exception *)a3 toError:(id *)a4;
- (BOOL)ConvertSystemError:(const system_error *)a3 toError:(id *)a4;
- (BOOL)FillUnknownError:(id *)a3;
- (MRE)initWithMREInstance:(void *)a3 error:(id *)a4;
- (MRE)initWithSignatures:(id)a3 density:(int64_t)a4 algorithm:(int64_t)a5 error:(id *)a6;
- (id)search:(id)a3 error:(id *)a4;
- (uint64_t)search:error:;
- (void)dealloc;
- (void)mreInstance;
- (void)search:error:;
- (void)setMreInstance:(void *)a3;
@end

@implementation MRE

- (void)dealloc
{
  mreInstance = (uint64_t *)self->_mreInstance;
  if (mreInstance)
  {
    uint64_t v4 = *mreInstance;
    uint64_t *mreInstance = 0;
    if (v4) {
      (*(void (**)(uint64_t, SEL))(*(void *)v4 + 8))(v4, a2);
    }
    MEMORY[0x22A61F420](mreInstance, 0x20C4093837F09);
  }
  v5.receiver = self;
  v5.super_class = (Class)MRE;
  [(MRE *)&v5 dealloc];
}

- (MRE)initWithMREInstance:(void *)a3 error:(id *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MRE;
  objc_super v5 = [(MRE *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MRE *)v5 setMreInstance:a3];
  }
  return v6;
}

- (MRE)initWithSignatures:(id)a3 density:(int64_t)a4 algorithm:(int64_t)a5 error:(id *)a6
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  operator new();
}

- (id)search:(id)a3 error:(id *)a4
{
  v12[4] = *MEMORY[0x263EF8340];
  id v10 = 0;
  v9[0] = gsl::make_span<shazam::spectral_peak_compact_t const>((gsl::details *)[a3 bytes], (gsl::details *)objc_msgSend(a3, "length"));
  v9[1] = v5;
  shazam::make_vector<shazam::basic_signature<(shazam::signature_density)24>,gsl::span<char const,18446744073709551615ul> const&>(v9, v8);
  {
    LODWORD(-[MRE search:error:]::config) = 2;
    BYTE4(-[MRE search:error:]::config) = 0;
    BYTE8(-[MRE search:error:]::config) = 0;
    BYTE12(-[MRE search:error:]::config) = 0;
    byte_268099000 = 0;
    dword_268099004 = 1065353216;
    word_268099008 = 0;
    dword_26809900C = 0;
    LOBYTE(qword_268099010) = 0;
    HIDWORD(qword_268099010) = 0;
  }
  {
    unk_268099028 = -[MRE search:error:]::config;
    unk_268099038 = *(_OWORD *)&byte_268099000;
    qword_268099048 = qword_268099010;
    -[MRE search:error:]::configProvider = (uint64_t)&unk_26D7D9FB8;
    __cxa_atexit((void (*)(void *))ConstQueryConfigProvider::~ConstQueryConfigProvider, &-[MRE search:error:]::configProvider, &dword_224B4B000);
  }
  uint64_t v6 = *(void *)[(MRE *)self mreInstance];
  v12[0] = &unk_26D7DA148;
  v12[1] = &v10;
  v12[3] = v12;
  (*(void (**)(uint64_t, void *, void, uint64_t, uint64_t *, void *))(*(void *)v6 + 16))(v6, v8, 0, 1, &-[MRE search:error:]::configProvider, v12);
  std::__function::__value_func<void ()(SearchResponse const&)>::~__value_func[abi:ne180100](v12);
  v11 = (void **)v8;
  std::vector<shazam::basic_signature<(shazam::signature_density)24>>::__destroy_vector::operator()[abi:ne180100](&v11);
  id result = v10;
  if (v10) {
    return (id)[v10 copy];
  }
  return result;
}

- (BOOL)ConvertSystemError:(const system_error *)a3 toError:(id *)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  if (a4)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithCString:encoding:", (*((uint64_t (**)(const system_error *, SEL))a3->var0 + 2))(a3, a2), objc_msgSend(NSString, "defaultCStringEncoding"));
    uint64_t var0 = a3->var2.var0;
    uint64_t v9 = *MEMORY[0x263F08320];
    v10[0] = v6;
    *a4 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.shazam.sigvalidation", var0, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
  }
  return a4 != 0;
}

- (BOOL)ConvertException:(const exception *)a3 toError:(id *)a4
{
  v8[1] = *MEMORY[0x263EF8340];
  if (a4)
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithCString:encoding:", (*((uint64_t (**)(const exception *, SEL))a3->var0 + 2))(a3, a2), objc_msgSend(NSString, "defaultCStringEncoding"));
    uint64_t v7 = *MEMORY[0x263F08320];
    v8[0] = v5;
    *a4 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.shazam.mre", -100, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
  }
  return a4 != 0;
}

- (BOOL)FillUnknownError:(id *)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v5 = *MEMORY[0x263F08320];
    v6[0] = @"Something unexpected happened.";
    *a3 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.shazam.mre", -200, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
  }
  return a3 != 0;
}

- (void)mreInstance
{
  return self->_mreInstance;
}

- (void)setMreInstance:(void *)a3
{
  self->_mreInstance = a3;
}

- (void)search:error:
{
}

- (uint64_t)search:error:
{
    return a1 + 8;
  else {
    return 0;
  }
}

@end