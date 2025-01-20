@interface AVMediaSelectionKeyValueOption
- (AVMediaSelectionKeyValueOption)initWithAsset:(id)a3 group:(id)a4 dictionary:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlayable;
- (id)_groupID;
- (id)_groupMediaType;
- (id)availableMetadataFormats;
- (id)commonMetadata;
- (id)dictionary;
- (id)group;
- (id)locale;
- (id)mediaType;
- (id)metadataForFormat:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation AVMediaSelectionKeyValueOption

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMediaSelectionKeyValueOption;
  [(AVMediaSelectionOption *)&v3 dealloc];
}

- (id)dictionary
{
  return self->_dictionary;
}

- (AVMediaSelectionKeyValueOption)initWithAsset:(id)a3 group:(id)a4 dictionary:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)AVMediaSelectionKeyValueOption;
  v7 = [(AVMediaSelectionOption *)&v10 initWithGroup:a4];
  v8 = v7;
  if (v7)
  {
    if (a4 && a5)
    {
      v7->_groupID = (id)[a4 _groupID];
      v8->_groupMediaType = (id)objc_msgSend((id)objc_msgSend(a4, "_groupMediaType"), "copy");
      v8->_optionMediaType = (NSString *)objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F34790]), "copy");
      v8->_dictionary = (NSDictionary *)[a5 copy];
      v8->_localizedMediaSelectionOptionDisplayNames = (NSDictionary *)objc_msgSend((id)objc_msgSend(a4, "_localizedMediaSelectionOptionDisplayNames"), "copy");
      v8->_weakReferenceToGroup = (AVWeakReference *)(id)[a4 _weakReference];
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [a3 _groupID];
  id groupID = self->_groupID;
  if (groupID)
  {
    if (([groupID isEqual:v5] & 1) == 0) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  uint64_t v8 = [a3 _groupMediaType];
  id groupMediaType = self->_groupMediaType;
  if (!groupMediaType)
  {
    if (!v8) {
      goto LABEL_10;
    }
    return 0;
  }
  if (([groupMediaType isEqual:v8] & 1) == 0) {
    return 0;
  }
LABEL_10:
  dictionary = self->_dictionary;
  uint64_t v11 = [a3 dictionary];
  return [(NSDictionary *)dictionary isEqual:v11];
}

- (unint64_t)hash
{
  uint64_t v3 = [self->_groupID hash];
  uint64_t v4 = [self->_groupMediaType hash] ^ v3;
  return v4 ^ [(NSDictionary *)self->_dictionary hash];
}

- (id)group
{
  return [(AVWeakReference *)self->_weakReferenceToGroup referencedObject];
}

- (id)_groupID
{
  return self->_groupID;
}

- (id)_groupMediaType
{
  return self->_groupMediaType;
}

- (id)mediaType
{
  return self->_optionMediaType;
}

- (BOOL)isPlayable
{
  return 1;
}

- (id)locale
{
  id result = [(NSDictionary *)self->_dictionary objectForKey:*MEMORY[0x1E4F34760]];
  if (result)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:result];
    return v3;
  }
  return result;
}

- (id)commonMetadata
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v19 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v3 = [(NSDictionary *)self->_dictionary objectForKey:*MEMORY[0x1E4F34798]];
  if (v3)
  {
    id v15 = v3;
    id v4 = [(NSDictionary *)self->_localizedMediaSelectionOptionDisplayNames objectForKey:v3];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    uint64_t v18 = *MEMORY[0x1E4F33028];
    uint64_t v17 = *MEMORY[0x1E4F33020];
    uint64_t v16 = *MEMORY[0x1E4F33060];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v21;
      uint64_t v8 = *MEMORY[0x1E4F33010];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v11 = [v4 objectForKey:v10];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v19, "addObject:", +[AVMetadataItem _metadataItemWithFigMetadataDictionary:](AVMetadataItem, "_metadataItemWithFigMetadataDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"mdta", v18, @"com.apple.quicktime.displayname", v17, v11, v16, v10, v8, 0)));
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }
    v12 = (void *)MEMORY[0x1E4F1C9E8];
    id v13 = [(AVMediaSelectionKeyValueOption *)self locale];
    objc_msgSend(v19, "addObject:", +[AVMetadataItem _metadataItemWithFigMetadataDictionary:](AVMetadataItem, "_metadataItemWithFigMetadataDictionary:", objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", @"m3u8", v18, @"NAME", v17, v15, v16, v13, *MEMORY[0x1E4F33038], 0)));
  }
  return v19;
}

- (id)availableMetadataFormats
{
  return (id)[MEMORY[0x1E4F1C978] array];
}

- (id)metadataForFormat:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "array", a3);
}

@end