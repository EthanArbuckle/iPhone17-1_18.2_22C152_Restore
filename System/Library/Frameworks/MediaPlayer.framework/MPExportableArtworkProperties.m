@interface MPExportableArtworkProperties
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (ICStoreArtworkInfo)artworkInfo;
- (MPExportableArtworkProperties)initWithJSONRepresentation:(id)a3;
- (NSArray)artworkTemplateItems;
- (NSString)resolvedURLString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)jsonRepresentation;
- (int64_t)mediaLibraryArtworkType;
- (unint64_t)mediaType;
- (void)setArtworkTemplateItems:(id)a3;
- (void)setMediaLibraryArtworkType:(int64_t)a3;
- (void)setMediaType:(unint64_t)a3;
- (void)setResolvedURLString:(id)a3;
@end

@implementation MPExportableArtworkProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkTemplateItems, 0);

  objc_storeStrong((id *)&self->_resolvedURLString, 0);
}

- (void)setMediaLibraryArtworkType:(int64_t)a3
{
  self->_mediaLibraryArtworkType = a3;
}

- (int64_t)mediaLibraryArtworkType
{
  return self->_mediaLibraryArtworkType;
}

- (void)setMediaType:(unint64_t)a3
{
  self->_mediaType = a3;
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (void)setArtworkTemplateItems:(id)a3
{
}

- (NSArray)artworkTemplateItems
{
  return self->_artworkTemplateItems;
}

- (void)setResolvedURLString:(id)a3
{
}

- (NSString)resolvedURLString
{
  return self->_resolvedURLString;
}

- (id)jsonRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_artworkTemplateItems count])
  {
    v3 = [(NSArray *)self->_artworkTemplateItems firstObject];
  }
  else if ([(NSString *)self->_resolvedURLString length])
  {
    resolvedURLString = self->_resolvedURLString;
    v6 = @"url";
    v7[0] = resolvedURLString;
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v3;
}

- (ICStoreArtworkInfo)artworkInfo
{
  v3 = [(MPExportableArtworkProperties *)self artworkTemplateItems];
  unint64_t v4 = [v3 count];

  if (v4 >= 2)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB8728]);
    v6 = [(MPExportableArtworkProperties *)self artworkTemplateItems];
    v7 = (void *)[v5 initWithArtworkResponseArray:v6];
LABEL_8:

    goto LABEL_9;
  }
  v8 = [(MPExportableArtworkProperties *)self artworkTemplateItems];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4FB8728]);
    v6 = [(MPExportableArtworkProperties *)self artworkTemplateItems];
    v11 = [v6 firstObject];
    uint64_t v12 = [v10 initWithArtworkResponseDictionary:v11];
LABEL_7:
    v7 = (void *)v12;

    goto LABEL_8;
  }
  v13 = [(MPExportableArtworkProperties *)self resolvedURLString];
  uint64_t v14 = [v13 length];

  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x1E4FB8728]);
    v16 = (void *)MEMORY[0x1E4F1CB10];
    v6 = [(MPExportableArtworkProperties *)self resolvedURLString];
    v11 = [v16 URLWithString:v6];
    uint64_t v12 = [v15 initWithArtworkURL:v11];
    goto LABEL_7;
  }
  v7 = 0;
LABEL_9:

  return (ICStoreArtworkInfo *)v7;
}

- (BOOL)isValid
{
  return [(NSArray *)self->_artworkTemplateItems count]
      || [(NSString *)self->_resolvedURLString length] != 0;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p resolvedURL:%@ artworkTemplateItems:%@ mediaType:%ld artworkType:%ld>", v5, self, self->_resolvedURLString, self->_artworkTemplateItems, self->_mediaType, self->_mediaLibraryArtworkType];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (MPExportableArtworkProperties *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      BOOL v6 = [(NSString *)self->_resolvedURLString isEqualToString:v5->_resolvedURLString]
        && [(NSArray *)self->_artworkTemplateItems isEqual:v5->_artworkTemplateItems]
        && self->_mediaType == v5->_mediaType
        && self->_mediaLibraryArtworkType == v5->_mediaLibraryArtworkType;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_alloc_init(MPExportableArtworkProperties);
  id v5 = [(MPExportableArtworkProperties *)self resolvedURLString];
  [(MPExportableArtworkProperties *)v4 setResolvedURLString:v5];

  BOOL v6 = [(MPExportableArtworkProperties *)self artworkTemplateItems];
  [(MPExportableArtworkProperties *)v4 setArtworkTemplateItems:v6];

  [(MPExportableArtworkProperties *)v4 setMediaType:[(MPExportableArtworkProperties *)self mediaType]];
  [(MPExportableArtworkProperties *)v4 setMediaLibraryArtworkType:[(MPExportableArtworkProperties *)self mediaLibraryArtworkType]];
  return v4;
}

- (MPExportableArtworkProperties)initWithJSONRepresentation:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPExportableArtworkProperties;
  id v5 = [(MPExportableArtworkProperties *)&v13 init];
  if (v5)
  {
    if (_NSIsNSDictionary())
    {
      id v6 = v4;
      v7 = [v6 objectForKeyedSubscript:@"url"];
      if ([v7 length])
      {
        if ([v7 containsString:@"{"]
          && [v7 containsString:@"}"])
        {
          v14[0] = v6;
          uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
          artworkTemplateItems = v5->_artworkTemplateItems;
          v5->_artworkTemplateItems = (NSArray *)v8;
        }
        else
        {
          id v10 = v7;
          artworkTemplateItems = (NSArray *)v5->_resolvedURLString;
          v5->_resolvedURLString = v10;
        }

        goto LABEL_9;
      }
    }
    v11 = 0;
    goto LABEL_12;
  }
LABEL_9:
  v11 = v5;
LABEL_12:

  return v11;
}

@end