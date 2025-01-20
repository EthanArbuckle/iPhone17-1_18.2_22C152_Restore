@interface MPModelPlayEvent
+ (MPModelPlayEvent)playEventWithModelObject:(id)a3 featureName:(id)a4;
+ (id)__album_KEY;
+ (id)__artist_KEY;
+ (id)__datePlayed_KEY;
+ (id)__featureName_KEY;
+ (id)__group_KEY;
+ (id)__playlist_KEY;
+ (id)__radioStation_KEY;
+ (void)__MPModelPropertyPlayEventDatePlayed__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlayEventFeatureName__MAPPING_MISSING__;
+ (void)__MPModelRelationshipPlayEventAlbum__MAPPING_MISSING__;
+ (void)__MPModelRelationshipPlayEventArtist__MAPPING_MISSING__;
+ (void)__MPModelRelationshipPlayEventGroup__MAPPING_MISSING__;
+ (void)__MPModelRelationshipPlayEventPlaylist__MAPPING_MISSING__;
+ (void)__MPModelRelationshipPlayEventRadioStation__MAPPING_MISSING__;
- (NSString)title;
- (id)contentItemCollectionInfo;
- (id)genericObjectRepresentation;
- (int64_t)itemType;
@end

@implementation MPModelPlayEvent

+ (id)__radioStation_KEY
{
  return @"MPModelRelationshipPlayEventRadioStation";
}

+ (id)__playlist_KEY
{
  return @"MPModelRelationshipPlayEventPlaylist";
}

+ (id)__group_KEY
{
  return @"MPModelRelationshipPlayEventGroup";
}

+ (id)__featureName_KEY
{
  return @"MPModelPropertyPlayEventFeatureName";
}

+ (id)__datePlayed_KEY
{
  return @"MPModelPropertyPlayEventDatePlayed";
}

+ (id)__artist_KEY
{
  return @"MPModelRelationshipPlayEventArtist";
}

+ (id)__album_KEY
{
  return @"MPModelRelationshipPlayEventAlbum";
}

void __28__MPModelPlayEvent_itemType__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) album];

  if (v2)
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = [*(id *)(a1 + 32) artist];

    if (v4)
    {
      uint64_t v3 = 2;
    }
    else
    {
      v5 = [*(id *)(a1 + 32) playlist];

      if (v5)
      {
        uint64_t v3 = 3;
      }
      else
      {
        v6 = [*(id *)(a1 + 32) radioStation];

        if (v6)
        {
          uint64_t v3 = 4;
        }
        else
        {
          v7 = [*(id *)(a1 + 32) group];

          if (!v7) {
            return;
          }
          uint64_t v3 = 5;
        }
      }
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

void __47__MPModelPlayEvent_genericObjectRepresentation__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) album];
  id v18 = (id)v2;
  if (v2)
  {
    uint64_t v3 = +[MPModelGenericObject genericObjectWithModelObject:v2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else
  {
    v5 = [*(id *)(a1 + 32) artist];
    if (v5)
    {
      uint64_t v6 = +[MPModelGenericObject genericObjectWithModelObject:v5];
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
    else
    {
      v8 = [*(id *)(a1 + 32) playlist];
      if (v8)
      {
        uint64_t v9 = +[MPModelGenericObject genericObjectWithModelObject:v8];
        uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
        v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;
      }
      else
      {
        v11 = [*(id *)(a1 + 32) radioStation];
        if (v11)
        {
          uint64_t v12 = +[MPModelGenericObject genericObjectWithModelObject:v11];
          uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
          v14 = *(void **)(v13 + 40);
          *(void *)(v13 + 40) = v12;
        }
        else
        {
          v14 = [*(id *)(a1 + 32) group];
          if (v14)
          {
            uint64_t v15 = +[MPModelGenericObject genericObjectWithModelObject:v14];
            uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
            v17 = *(void **)(v16 + 40);
            *(void *)(v16 + 40) = v15;
          }
        }
      }
    }
  }
}

- (int64_t)itemType
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__MPModelPlayEvent_itemType__block_invoke;
  v4[3] = &unk_1E57F9F20;
  v4[4] = self;
  v4[5] = &v5;
  +[MPModelObject performWithoutEnforcement:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)contentItemCollectionInfo
{
  switch([(MPModelPlayEvent *)self itemType])
  {
    case 1:
      uint64_t v3 = [(MPModelPlayEvent *)self album];
      goto LABEL_7;
    case 2:
      uint64_t v3 = [(MPModelPlayEvent *)self artist];
      goto LABEL_7;
    case 3:
      uint64_t v3 = [(MPModelPlayEvent *)self playlist];
      goto LABEL_7;
    case 4:
      uint64_t v3 = [(MPModelPlayEvent *)self radioStation];
LABEL_7:
      uint64_t v5 = v3;
      uint64_t v4 = [v3 contentItemCollectionInfo];

      break;
    default:
      uint64_t v4 = 0;
      break;
  }

  return v4;
}

+ (MPModelPlayEvent)playEventWithModelObject:(id)a3 featureName:(id)a4
{
  uint64_t v5 = (uint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [(id)v5 identifiers];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __57__MPModelPlayEvent_playEventWithModelObject_featureName___block_invoke;
      v17[3] = &unk_1E57EEC80;
      uint64_t v9 = &v18;
      id v18 = (id)v6;
      uint64_t v7 = (MPModelPlayEvent *)[(id)v5 copyWithIdentifiers:v8 block:v17];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [(id)v5 flattenedGenericObject];
        uint64_t v11 = [v10 anyObject];

        uint64_t v5 = v11;
      }
      uint64_t v12 = [MPModelPlayEvent alloc];
      uint64_t v8 = +[MPIdentifierSet emptyIdentifierSet];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __57__MPModelPlayEvent_playEventWithModelObject_featureName___block_invoke_2;
      v14[3] = &unk_1E57EECA8;
      uint64_t v9 = (id *)&v15;
      uint64_t v15 = v5;
      id v16 = (id)v6;
      uint64_t v5 = (uint64_t)(id)v5;
      uint64_t v7 = [(MPModelObject *)v12 initWithIdentifiers:v8 block:v14];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __57__MPModelPlayEvent_playEventWithModelObject_featureName___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 setRadioStation:*(void *)(a1 + 32)];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 setAlbum:*(void *)(a1 + 32)];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v3 setPlaylist:*(void *)(a1 + 32)];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v3 setArtist:*(void *)(a1 + 32)];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v3 setGroup:*(void *)(a1 + 32)];
          }
        }
      }
    }
  }
  [v3 setFeatureName:*(void *)(a1 + 40)];
}

- (id)genericObjectRepresentation
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__6178;
  uint64_t v9 = __Block_byref_object_dispose__6179;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__MPModelPlayEvent_genericObjectRepresentation__block_invoke;
  v4[3] = &unk_1E57F9F20;
  v4[4] = self;
  v4[5] = &v5;
  +[MPModelObject performWithoutEnforcement:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __57__MPModelPlayEvent_playEventWithModelObject_featureName___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFeatureName:*(void *)(a1 + 32)];
}

+ (void)__MPModelRelationshipPlayEventGroup__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlayEvent.m" lineNumber:26 description:@"Translator was missing mapping for MPModelRelationshipPlayEventGroup"];
}

+ (void)__MPModelRelationshipPlayEventRadioStation__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlayEvent.m" lineNumber:25 description:@"Translator was missing mapping for MPModelRelationshipPlayEventRadioStation"];
}

+ (void)__MPModelRelationshipPlayEventPlaylist__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlayEvent.m" lineNumber:24 description:@"Translator was missing mapping for MPModelRelationshipPlayEventPlaylist"];
}

+ (void)__MPModelRelationshipPlayEventArtist__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlayEvent.m" lineNumber:23 description:@"Translator was missing mapping for MPModelRelationshipPlayEventArtist"];
}

+ (void)__MPModelRelationshipPlayEventAlbum__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlayEvent.m" lineNumber:22 description:@"Translator was missing mapping for MPModelRelationshipPlayEventAlbum"];
}

+ (void)__MPModelPropertyPlayEventFeatureName__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlayEvent.m" lineNumber:21 description:@"Translator was missing mapping for MPModelPropertyPlayEventFeatureName"];
}

+ (void)__MPModelPropertyPlayEventDatePlayed__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlayEvent.m" lineNumber:20 description:@"Translator was missing mapping for MPModelPropertyPlayEventDatePlayed"];
}

- (NSString)title
{
  switch([(MPModelPlayEvent *)self itemType])
  {
    case 1:
      id v3 = [(MPModelPlayEvent *)self album];
      goto LABEL_9;
    case 2:
      uint64_t v5 = [(MPModelPlayEvent *)self artist];
      goto LABEL_7;
    case 3:
      uint64_t v5 = [(MPModelPlayEvent *)self playlist];
      goto LABEL_7;
    case 4:
      uint64_t v5 = [(MPModelPlayEvent *)self radioStation];
LABEL_7:
      unint64_t v6 = v5;
      uint64_t v7 = [v5 name];
      goto LABEL_10;
    case 5:
      id v3 = [(MPModelPlayEvent *)self group];
LABEL_9:
      unint64_t v6 = v3;
      uint64_t v7 = [v3 title];
LABEL_10:
      id v4 = (void *)v7;

      break;
    default:
      id v4 = 0;
      break;
  }

  return (NSString *)v4;
}

@end