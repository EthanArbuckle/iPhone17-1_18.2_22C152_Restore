@interface LSPlugInQueryWithIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isBindingMapValid;
- (BOOL)isEqual:(id)a3;
- (LSPlugInQueryWithIdentifier)initWithCoder:(id)a3;
- (id)_identifier;
- (id)_initWithIdentifier:(id)a3 inMap:(int)a4;
- (unint64_t)hash;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSPlugInQueryWithIdentifier

- (void).cxx_destruct
{
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  if (*(void *)&self->_bindingMap && [(LSPlugInQueryWithIdentifier *)self isBindingMapValid])
  {
    id v14 = 0;
    v15 = 0;
    int inited = _LSContextInitReturningError(&v15, &v14);
    id v9 = v14;
    if (inited)
    {
      v10 = [MEMORY[0x1E4F1CA80] set];
      _LSDatabaseGetStringForCFString(v15, *(const __CFString **)&self->_bindingMap, 0);
      uint64_t v12 = MEMORY[0x1E4F143A8];
      id v13 = v10;
      _LSDatabaseEnumeratingBindingMap();
      -[LSPlugInQuery sort:pluginIDs:andYield:context:](self, "sort:pluginIDs:andYield:context:", 1, v13, v7, &v15, v12, 3221225472, __65__LSPlugInQueryWithIdentifier__enumerateWithXPCConnection_block___block_invoke, &unk_1E52300B0);
      _LSContextDestroy(&v15);
    }
    else
    {
      v7[2](v7, 0, v9);
    }
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4F28228];
    v17[0] = @"invalid bundleIdentifier";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v11 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[LSPlugInQueryWithIdentifier _enumerateWithXPCConnection:block:]", 52, v9);
    v7[2](v7, 0, v11);
  }
}

- (BOOL)isBindingMapValid
{
  return (*((_DWORD *)&self->super.super._legacy + 1) - 9) < 3;
}

void __65__LSPlugInQueryWithIdentifier__enumerateWithXPCConnection_block___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

- (id)_initWithIdentifier:(id)a3 inMap:(int)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LSPlugInQueryWithIdentifier;
  v7 = [(LSPlugInQuery *)&v12 _init];
  v8 = v7;
  if (v7)
  {
    v7[3] = a4;
    uint64_t v9 = [v6 copy];
    v10 = (void *)v8[2];
    v8[2] = v9;
  }
  if (!_LSCurrentProcessMayMapDatabase() && pluginQueryFault_onceToken_0 != -1) {
    dispatch_once(&pluginQueryFault_onceToken_0, &__block_literal_global_60);
  }

  return v8;
}

- (id)_identifier
{
  return *(id *)&self->_bindingMap;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSPlugInQueryWithIdentifier;
  if ([(LSPlugInQuery *)&v9 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = *(void **)&self->_bindingMap;
    id v6 = [v4 _identifier];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [*(id *)&self->_bindingMap hash];
  v5.receiver = self;
  v5.super_class = (Class)LSPlugInQueryWithIdentifier;
  return [(LSPlugInQuery *)&v5 hash] ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(void *)&self->_bindingMap;
  id v5 = a3;
  [v5 encodeObject:v4 forKey:@"identifier"];
  [v5 encodeInt32:*((unsigned int *)&self->super.super._legacy + 1) forKey:@"bindingMap"];
}

- (LSPlugInQueryWithIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"identifier");
  uint64_t v6 = [v4 decodeInt32ForKey:@"bindingMap"];

  char v7 = [(LSPlugInQueryWithIdentifier *)self _initWithIdentifier:v5 inMap:v6];
  return v7;
}

@end