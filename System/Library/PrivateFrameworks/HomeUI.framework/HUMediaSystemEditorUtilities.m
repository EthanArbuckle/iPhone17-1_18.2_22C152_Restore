@interface HUMediaSystemEditorUtilities
+ (BOOL)wouldPairingAccessoriesNecessitateConfiguration:(id)a3;
@end

@implementation HUMediaSystemEditorUtilities

+ (BOOL)wouldPairingAccessoriesNecessitateConfiguration:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "na_any:", &__block_literal_global_214))
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v5 = [v3 anyObject];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __80__HUMediaSystemEditorUtilities_wouldPairingAccessoriesNecessitateConfiguration___block_invoke_2;
    v10[3] = &unk_1E63869C8;
    id v6 = v5;
    id v11 = v6;
    if (objc_msgSend(v3, "na_all:", v10))
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __80__HUMediaSystemEditorUtilities_wouldPairingAccessoriesNecessitateConfiguration___block_invoke_3;
      v8[3] = &unk_1E63869C8;
      id v9 = v6;
      int v4 = objc_msgSend(v3, "na_all:", v8) ^ 1;
    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

uint64_t __80__HUMediaSystemEditorUtilities_wouldPairingAccessoriesNecessitateConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_needsSoftwareUpdateToSupportBeingAddedToMediaSystem");
}

BOOL __80__HUMediaSystemEditorUtilities_wouldPairingAccessoriesNecessitateConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  int v4 = [v2 remoteLoginHandler];
  v5 = [v4 loggedInAccount];
  id v6 = [v5 username];
  v7 = [v3 remoteLoginHandler];

  v8 = [v7 loggedInAccount];
  id v9 = [v8 username];
  BOOL v10 = [v6 compare:v9 options:1] == 0;

  return v10;
}

uint64_t __80__HUMediaSystemEditorUtilities_wouldPairingAccessoriesNecessitateConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 room];
  int v4 = [*(id *)(a1 + 32) room];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

@end