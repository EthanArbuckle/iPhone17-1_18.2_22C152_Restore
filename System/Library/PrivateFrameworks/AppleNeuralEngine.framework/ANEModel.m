@interface ANEModel
@end

@implementation ANEModel

void __44___ANEModel_procedureInfoForProcedureIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  id v14 = v6;
  if (objc_opt_isKindOfClass()) {
    v7 = v14;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  v9 = [v8 objectForKeyedSubscript:kANEFModelProcedureIDKey[0]];
  objc_opt_class();
  id v10 = v9;
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    int v13 = *(_DWORD *)(a1 + 40);
    if (v13 == [v12 unsignedIntegerValue])
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v7);
      *a4 = 1;
    }
  }
}

@end