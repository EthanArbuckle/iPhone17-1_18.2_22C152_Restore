@interface NSItemProvider(UTType)
- (id)loadDataRepresentationForContentType:()UTType completionHandler:;
- (id)loadFileRepresentationForContentType:()UTType openInPlace:completionHandler:;
- (id)registeredContentTypes;
- (id)registeredContentTypesConformingToContentType:()UTType;
- (id)registeredContentTypesForOpenInPlace;
- (void)initWithContentsOfURL:()UTType contentType:openInPlace:coordinated:visibility:;
- (void)registerDataRepresentationForContentType:()UTType visibility:loadHandler:;
- (void)registerFileRepresentationForContentType:()UTType visibility:openInPlace:loadHandler:;
@end

@implementation NSItemProvider(UTType)

- (void)initWithContentsOfURL:()UTType contentType:openInPlace:coordinated:visibility:
{
  id v11 = a3;
  id v12 = a4;
  v13 = (void *)[a1 init];
  if (v13)
  {
    if (v12)
    {
      v14 = _typeIdentifierFromUTType(v12);
    }
    else
    {
      v14 = 0;
    }
    if (![v14 length])
    {
      id v25 = 0;
      if ([v11 getResourceValue:&v25 forKey:*MEMORY[0x1E4F1C538] error:0])
      {
        uint64_t v15 = [v25 identifier];

        v14 = (void *)v15;
      }
    }
    if (![v14 length])
    {
      v16 = [v11 pathExtension];
      if ([v16 length])
      {
        v17 = +[UTType typeWithFilenameExtension:v16];
        v18 = v17;
        if (v17)
        {
          uint64_t v19 = [v17 identifier];

          v14 = (void *)v19;
        }
      }
    }
    if (![v14 length])
    {
      uint64_t v20 = [(_UTConstantType *)&off_1EB2090D0 identifier];

      v14 = (void *)v20;
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __95__NSItemProvider_UTType__initWithContentsOfURL_contentType_openInPlace_coordinated_visibility___block_invoke;
    v22[3] = &unk_1E583EE40;
    id v23 = v11;
    char v24 = a5;
    [v13 registerFileRepresentationForTypeIdentifier:v14 fileOptions:a5 visibility:a7 loadHandler:v22];
  }
  return v13;
}

- (void)registerDataRepresentationForContentType:()UTType visibility:loadHandler:
{
  id v8 = a5;
  _typeIdentifierFromUTType(a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [a1 registerDataRepresentationForTypeIdentifier:v9 visibility:a4 loadHandler:v8];
}

- (void)registerFileRepresentationForContentType:()UTType visibility:openInPlace:loadHandler:
{
  id v10 = a6;
  _typeIdentifierFromUTType(a3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [a1 registerFileRepresentationForTypeIdentifier:v11 fileOptions:a5 visibility:a4 loadHandler:v10];
}

- (id)registeredContentTypes
{
  v1 = [a1 registeredTypeIdentifiers];
  v2 = _utTypesFromTypeIdentifiers(v1);

  return v2;
}

- (id)registeredContentTypesForOpenInPlace
{
  v1 = [a1 registeredTypeIdentifiersWithFileOptions:1];
  v2 = _utTypesFromTypeIdentifiers(v1);

  return v2;
}

- (id)registeredContentTypesConformingToContentType:()UTType
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 registeredContentTypes];
  v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "conformsToType:", v4, (void)v14)) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)loadDataRepresentationForContentType:()UTType completionHandler:
{
  id v6 = a4;
  id v7 = _typeIdentifierFromUTType(a3);
  uint64_t v8 = [a1 loadDataRepresentationForTypeIdentifier:v7 completionHandler:v6];

  return v8;
}

- (id)loadFileRepresentationForContentType:()UTType openInPlace:completionHandler:
{
  id v8 = a5;
  uint64_t v9 = _typeIdentifierFromUTType(a3);
  if (a4)
  {
    uint64_t v10 = [a1 loadInPlaceFileRepresentationForTypeIdentifier:v9 completionHandler:v8];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __93__NSItemProvider_UTType__loadFileRepresentationForContentType_openInPlace_completionHandler___block_invoke;
    v12[3] = &unk_1E583EE68;
    id v13 = v8;
    uint64_t v10 = [a1 loadFileRepresentationForTypeIdentifier:v9 completionHandler:v12];
  }

  return v10;
}

@end