@interface NSObject(StorageDictionaryProvider)
+ (id)_musicKit_modelObjectStorageDictionaryForGenericModelObject:()StorageDictionaryProvider;
+ (id)_musicKit_modelObjectStorageDictionaryForPlaylistEntry:()StorageDictionaryProvider;
+ (id)_musicKit_modelObjectStorageDictionaryForStoreBrowseContentItem:()StorageDictionaryProvider;
- (id)_musicKit_modelObjectRawStorageDictionary;
- (id)musicKit_modelObjectStorageDictionary;
@end

@implementation NSObject(StorageDictionaryProvider)

+ (id)_musicKit_modelObjectStorageDictionaryForStoreBrowseContentItem:()StorageDictionaryProvider
{
  id v3 = a3;
  int64_t v4 = +[MusicKit_SoftLinking_MPModelGenericObject rawValueForType:](MusicKit_SoftLinking_MPModelGenericObject, "rawValueForType:", +[MusicKit_SoftLinking_MPModelStoreBrowseContentItem _genericObjectTypeForItemType:](MusicKit_SoftLinking_MPModelStoreBrowseContentItem, "_genericObjectTypeForItemType:", [v3 itemType]));
  v5 = [v3 innerObject];

  v6 = objc_msgSend(v5, "_musicKit_modelObjectRawStorageDictionary");
  v7 = (void *)[v6 mutableCopy];
  v8 = [NSNumber numberWithInteger:v4];
  [v7 setObject:v8 forKey:@"MusicKit_LegacyModelProperty_GenericType"];

  return v7;
}

- (id)_musicKit_modelObjectRawStorageDictionary
{
  getMPModelObjectClass();
  if (objc_opt_isKindOfClass())
  {
    v2 = [a1 valueForKey:@"_storage"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)musicKit_modelObjectStorageDictionary
{
  getMPModelObjectClass();
  if (objc_opt_isKindOfClass())
  {
    id v2 = a1;
    getMPModelGenericObjectClass();
    if (objc_opt_isKindOfClass())
    {
      id v3 = v2;
      uint64_t v4 = objc_msgSend((id)objc_opt_class(), "_musicKit_modelObjectStorageDictionaryForGenericModelObject:", v3);
    }
    else
    {
      uint64_t v16 = 0;
      v17 = &v16;
      uint64_t v18 = 0x2050000000;
      v6 = (void *)getMPModelStoreBrowseContentItemClass_softClass;
      uint64_t v19 = getMPModelStoreBrowseContentItemClass_softClass;
      if (!getMPModelStoreBrowseContentItemClass_softClass)
      {
        uint64_t v11 = MEMORY[0x263EF8330];
        uint64_t v12 = 3221225472;
        v13 = __getMPModelStoreBrowseContentItemClass_block_invoke;
        v14 = &unk_26443F950;
        v15 = &v16;
        __getMPModelStoreBrowseContentItemClass_block_invoke((uint64_t)&v11);
        v6 = (void *)v17[3];
      }
      id v7 = v6;
      _Block_object_dispose(&v16, 8);
      if (objc_opt_isKindOfClass())
      {
        id v3 = v2;
        uint64_t v4 = objc_msgSend((id)objc_opt_class(), "_musicKit_modelObjectStorageDictionaryForStoreBrowseContentItem:", v3);
      }
      else
      {
        uint64_t v16 = 0;
        v17 = &v16;
        uint64_t v18 = 0x2050000000;
        v8 = (void *)getMPModelPlaylistEntryClass_softClass;
        uint64_t v19 = getMPModelPlaylistEntryClass_softClass;
        if (!getMPModelPlaylistEntryClass_softClass)
        {
          uint64_t v11 = MEMORY[0x263EF8330];
          uint64_t v12 = 3221225472;
          v13 = __getMPModelPlaylistEntryClass_block_invoke;
          v14 = &unk_26443F950;
          v15 = &v16;
          __getMPModelPlaylistEntryClass_block_invoke((uint64_t)&v11);
          v8 = (void *)v17[3];
        }
        id v9 = v8;
        _Block_object_dispose(&v16, 8);
        if (objc_opt_isKindOfClass())
        {
          id v3 = v2;
          objc_msgSend((id)objc_opt_class(), "_musicKit_modelObjectStorageDictionaryForPlaylistEntry:", v3);
        }
        else
        {
          objc_msgSend(v2, "_musicKit_innerModelObject");
          id v3 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "_musicKit_modelObjectRawStorageDictionary");
        uint64_t v4 = };
      }
    }
    v5 = (void *)v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_musicKit_modelObjectStorageDictionaryForGenericModelObject:()StorageDictionaryProvider
{
  id v3 = a3;
  uint64_t v4 = [v3 type];
  v5 = objc_msgSend(v3, "_musicKit_innerModelObject");

  v6 = objc_msgSend(v5, "_musicKit_modelObjectRawStorageDictionary");
  id v7 = (void *)[v6 mutableCopy];
  v8 = [NSNumber numberWithInteger:v4];
  [v7 setObject:v8 forKey:@"MusicKit_LegacyModelProperty_GenericType"];

  return v7;
}

+ (id)_musicKit_modelObjectStorageDictionaryForPlaylistEntry:()StorageDictionaryProvider
{
  id v3 = a3;
  uint64_t v4 = [v3 type];
  v5 = objc_msgSend(v3, "_musicKit_modelObjectRawStorageDictionary");

  v6 = (void *)[v5 mutableCopy];
  id v7 = [NSNumber numberWithInteger:v4];
  [v6 setObject:v7 forKey:@"MusicKit_LegacyModelPlaylistEntryType"];

  return v6;
}

@end