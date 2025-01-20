@interface DTKPKDebugCodes
+ (id)codesFromURL:(id)a3 error:(id *)a4;
+ (id)localKDebugCodes:(id *)a3;
+ (void)initialize;
- (DTKPKDebugCodes)initWithCodeMapping:(id)a3;
- (DTKPKDebugCodes)initWithCodes:(id)a3;
- (NSSet)allKDebugCodes;
- (id)kdebugCodeWithNameForValue:(unsigned int)a3;
@end

@implementation DTKPKDebugCodes

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    dispatch_semaphore_t v2 = dispatch_semaphore_create(1);
    v3 = (void *)qword_2687080A8;
    qword_2687080A8 = (uint64_t)v2;

    v4 = (void *)qword_2687080B0;
    qword_2687080B0 = 0;

    DTKPSetupLogging();
  }
}

+ (id)localKDebugCodes:(id *)a3
{
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_2687080A8, 0xFFFFFFFFFFFFFFFFLL);
  if ((byte_2687080B8 & 1) == 0)
  {
    byte_2687080B8 = 1;
    v4 = (void *)[objc_alloc(NSURL) initFileURLWithPath:@"/usr/share/misc/trace.codes"];
    v5 = sub_230902888(v4, a3);
    v6 = [[DTKPKDebugCodes alloc] initWithCodes:v5];
    v7 = (void *)qword_2687080B0;
    qword_2687080B0 = (uint64_t)v6;
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_2687080A8);
  v8 = (void *)qword_2687080B0;
  return v8;
}

+ (id)codesFromURL:(id)a3 error:(id *)a4
{
  v4 = sub_230902888(a3, a4);
  v5 = [[DTKPKDebugCodes alloc] initWithCodes:v4];

  return v5;
}

- (DTKPKDebugCodes)initWithCodeMapping:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DTKPKDebugCodes;
  v5 = [(DTKPKDebugCodes *)&v20 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    codeMap = v5->_codeMap;
    v5->_codeMap = (XRIntKeyedDictionary *)v6;

    v8 = objc_opt_new();
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = sub_230902C38;
    v17 = &unk_264B90288;
    v9 = v5;
    v18 = v9;
    id v19 = v8;
    id v10 = v8;
    [v4 enumerateObjectsAndIntegerKeys:&v14];
    uint64_t v11 = [v10 copyWithZone:v14];
    allKDebugCodes = v9->_allKDebugCodes;
    v9->_allKDebugCodes = (NSSet *)v11;
  }
  return v5;
}

- (DTKPKDebugCodes)initWithCodes:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DTKPKDebugCodes;
  v5 = [(DTKPKDebugCodes *)&v13 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    codeMap = v5->_codeMap;
    v5->_codeMap = (XRIntKeyedDictionary *)v6;

    uint64_t v8 = [v4 copy];
    allKDebugCodes = v5->_allKDebugCodes;
    v5->_allKDebugCodes = (NSSet *)v8;

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_230902DB4;
    v11[3] = &unk_264B902B0;
    v12 = v5;
    [v4 enumerateObjectsUsingBlock:v11];
  }
  return v5;
}

- (id)kdebugCodeWithNameForValue:(unsigned int)a3
{
  return (id)[(XRIntKeyedDictionary *)self->_codeMap objectForIntegerKey:a3 & 0xFFFFFFFC];
}

- (NSSet)allKDebugCodes
{
  return self->_allKDebugCodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allKDebugCodes, 0);
  objc_storeStrong((id *)&self->_codeMap, 0);
}

@end