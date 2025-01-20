@interface TKSEPClientToken
+ (BOOL)handlesTokenID:(id)a3;
+ (id)builtinTokenIDs;
- (TKSEPClientToken)initWithTokenID:(id)a3 serverEndpoint:(id)a4 targetUID:(id)a5;
@end

@implementation TKSEPClientToken

+ (BOOL)handlesTokenID:(id)a3
{
  id v3 = a3;
  v4 = [[TKTokenID alloc] initWithTokenID:v3];

  v5 = [(TKTokenID *)v4 classID];
  char v6 = [v5 isEqualToString:*MEMORY[0x1E4F3B8A8]];

  return v6;
}

+ (id)builtinTokenIDs
{
  if (builtinTokenIDs_onceToken != -1) {
    dispatch_once(&builtinTokenIDs_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)builtinTokenIDs_tokenIDs;

  return v2;
}

void __35__TKSEPClientToken_builtinTokenIDs__block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (+[TKSEPKey hasSEP])
  {
    uint64_t v0 = *MEMORY[0x1E4F3B898];
    uint64_t v7 = *MEMORY[0x1E4F3B8A8];
    uint64_t v8 = v0;
    v1 = (void *)MEMORY[0x1E4F1C978];
    v2 = &v7;
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v6 = *MEMORY[0x1E4F3B898];
    v1 = (void *)MEMORY[0x1E4F1C978];
    v2 = &v6;
    uint64_t v3 = 1;
  }
  uint64_t v4 = objc_msgSend(v1, "arrayWithObjects:count:", v2, v3, v6, v7, v8);
  v5 = (void *)builtinTokenIDs_tokenIDs;
  builtinTokenIDs_tokenIDs = v4;
}

- (TKSEPClientToken)initWithTokenID:(id)a3 serverEndpoint:(id)a4 targetUID:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)TKSEPClientToken;
  return (TKSEPClientToken *)-[TKClientToken _initWithTokenID:](&v6, sel__initWithTokenID_, a3, a4, a5);
}

@end