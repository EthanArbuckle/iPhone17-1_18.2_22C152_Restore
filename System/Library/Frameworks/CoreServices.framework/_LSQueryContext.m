@interface _LSQueryContext
+ (BOOL)simulateLimitedMappingForXCTests;
+ (id)defaultContext;
+ (void)setSimulateLimitedMappingForXCTests:(BOOL)a3;
- (_LSQueryContext)init;
- (_LSQueryResolving)_resolver;
- (id)_init;
- (id)_resolveQueries:(id)a3 XPCConnection:(id)a4 error:(id *)a5;
- (id)debugDescription;
- (id)resolveQueries:(id)a3 error:(id *)a4;
- (void)enumerateResolvedResultsOfQuery:(id)a3 withBlock:(id)a4;
@end

@implementation _LSQueryContext

- (void)enumerateResolvedResultsOfQuery:(id)a3 withBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(void, void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"LSQueryContext.mm", 87, @"Invalid parameter not satisfying: %@", @"query != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"LSQueryContext.mm", 88, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];

LABEL_3:
  v10 = [(_LSQueryContext *)self _resolver];
  v11 = v10;
  if (v10)
  {
    [v10 _enumerateResolvedResultsOfQuery:v7 XPCConnection:0 withBlock:v9];
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"LSQueryContext.mm" lineNumber:91 description:@"Could not get query resolver"];

    char v16 = 0;
    v15 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -4, (uint64_t)"-[_LSQueryContext(QueryResolution) enumerateResolvedResultsOfQuery:withBlock:]", 99, 0);
    ((void (**)(void, void, void *, char *))v9)[2](v9, 0, v15, &v16);
  }
}

- (_LSQueryResolving)_resolver
{
  return (_LSQueryResolving *)self->_resolver;
}

+ (id)defaultContext
{
  if (+[_LSQueryContext defaultContext]::once != -1) {
    dispatch_once(&+[_LSQueryContext defaultContext]::once, &__block_literal_global_65);
  }
  v2 = (void *)+[_LSQueryContext defaultContext]::result;

  return v2;
}

+ (BOOL)simulateLimitedMappingForXCTests
{
  LODWORD(v2) = [(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure];
  if (v2)
  {
    v2 = getenv("LS_SIMULATE_LIMITED_MAPPING_FOR_XCTESTS");
    if (v2) {
      LOBYTE(v2) = atoi(v2) != 0;
    }
  }
  return (char)v2;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)_LSQueryContext;
  v2 = [(_LSQueryContext *)&v6 init];
  if (v2)
  {
    if (_LSCurrentProcessMayMapDatabase()) {
      v3 = objc_alloc_init(_LSLocalQueryResolver);
    }
    else {
      v3 = objc_alloc_init(_LSXPCQueryResolver);
    }
    id resolver = v2->_resolver;
    v2->_id resolver = v3;
  }
  return v2;
}

- (_LSQueryContext)init
{
}

- (id)debugDescription
{
  v3 = [(_LSQueryContext *)self _resolver];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v5 = @"no";
  if (isKindOfClass) {
    v5 = @"yes";
  }
  objc_super v6 = v5;

  id v7 = NSString;
  id v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = [v7 stringWithFormat:@"<%@ %p> { XPC: %@ }", v9, self, v6];

  return v10;
}

- (void).cxx_destruct
{
}

- (id)resolveQueries:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"LSQueryContext.mm", 108, @"Invalid parameter not satisfying: %@", @"queries != nil" object file lineNumber description];
  }
  id v13 = 0;
  id v8 = [(_LSQueryContext *)self _resolveQueries:v7 XPCConnection:0 error:&v13];
  id v9 = v13;
  v10 = v9;
  if (a4 && !v8) {
    *a4 = v9;
  }

  return v8;
}

- (id)_resolveQueries:(id)a3 XPCConnection:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = [(_LSQueryContext *)self _resolver];
  if (v11)
  {
    if (!v9) {
      goto LABEL_7;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"LSQueryContext.mm" lineNumber:160 description:@"Could not get query resolver"];

    if (!v9) {
      goto LABEL_7;
    }
  }
  if ([v9 count])
  {
    id v17 = 0;
    v12 = [v11 _resolveQueries:v9 XPCConnection:v10 error:&v17];
    id v13 = v17;
    if (!a5) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v18 = *MEMORY[0x1E4F28228];
  v19[0] = @"invalid input parameters";
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSQueryContext(Internal) _resolveQueries:XPCConnection:error:]", 168, v15);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if (!a5) {
    goto LABEL_10;
  }
LABEL_8:
  if (!v12) {
    *a5 = v13;
  }
LABEL_10:

  return v12;
}

+ (void)setSimulateLimitedMappingForXCTests:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    if (v3) {
      v4 = "1";
    }
    else {
      v4 = "0";
    }
    setenv("LS_SIMULATE_LIMITED_MAPPING_FOR_XCTESTS", v4, 1);
  }
}

@end