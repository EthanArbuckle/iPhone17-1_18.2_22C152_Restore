@interface CNContactFetchRequestEffectiveKeyExtender
+ (id)extendRequestedKeys:(id)a3 shouldUnifyResults:(BOOL)a4 sortOrder:(int64_t)a5;
@end

@implementation CNContactFetchRequestEffectiveKeyExtender

uint64_t __94__CNContactFetchRequestEffectiveKeyExtender_extendRequestedKeys_shouldUnifyResults_sortOrder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = v2;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
    }
    else
    {
      int v11 = [v3 conformsToProtocol:&unk_1EE097850];

      if (!v11)
      {
        uint64_t v7 = 0;
        goto LABEL_12;
      }
    }
    v4 = +[CN allImageDataPropertyKeys];
    v5 = objc_msgSend(v3, "_cn_requiredKeys");
    char v6 = [v4 intersectsKeyVector:v5];

    if (v6)
    {
      uint64_t v7 = 1;
    }
    else
    {
      v8 = +[CN allWallpaperPropertyKeys];
      v9 = objc_msgSend(v3, "_cn_requiredKeys");
      uint64_t v7 = [v8 intersectsKeyVector:v9];
    }
  }
  else
  {
    uint64_t v7 = 0;
    v4 = v2;
  }

LABEL_12:
  return v7;
}

+ (id)extendRequestedKeys:(id)a3 shouldUnifyResults:(BOOL)a4 sortOrder:(int64_t)a5
{
  BOOL v5 = a4;
  char v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  v8 = [v6 array];
  [v8 addObjectsFromArray:v7];
  v9 = +[CNContact alwaysFetchedKeys];
  v10 = [v9 allObjects];
  [v8 addObjectsFromArray:v10];

  int v11 = objc_msgSend(v7, "_cn_any:", &__block_literal_global_126);
  if (v5)
  {
    [v8 addObject:@"linkIdentifier"];
    [v8 addObject:@"preferredForName"];
    if (!v11) {
      goto LABEL_7;
    }
    [v8 addObject:@"sharedPhotoDisplayPreference"];
    v12 = &CNContactPreferredForImageKey;
    v13 = &CNContactisUsingSharedPhotoKey;
  }
  else
  {
    if (!v11) {
      goto LABEL_7;
    }
    v12 = &CNContactisUsingSharedPhotoKey;
    v13 = &CNContactSharedPhotoDisplayPreferenceKey;
  }
  [v8 addObject:*v13];
  [v8 addObject:*v12];
LABEL_7:

  return v8;
}

@end