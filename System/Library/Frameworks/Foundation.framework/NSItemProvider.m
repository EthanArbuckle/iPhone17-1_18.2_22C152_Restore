@interface NSItemProvider
+ (BOOL)supportsSecureCoding;
- (BOOL)_hasRepresentationConformingToType:(id)a3;
- (BOOL)_hasRepresentationOfType:(id)a3;
- (BOOL)canLoadObjectOfClass:(id)aClass;
- (BOOL)hasItemConformingToTypeIdentifier:(NSString *)typeIdentifier;
- (BOOL)hasRepresentationConformingToTypeIdentifier:(NSString *)typeIdentifier fileOptions:(NSItemProviderFileOptions)fileOptions;
- (NSArray)_representations;
- (NSArray)registeredTypeIdentifiers;
- (NSArray)registeredTypeIdentifiersWithFileOptions:(NSItemProviderFileOptions)fileOptions;
- (NSDictionary)userInfo;
- (NSItemProvider)init;
- (NSItemProvider)initWithCoder:(id)a3;
- (NSItemProvider)initWithContentsOfURL:(NSURL *)fileURL;
- (NSItemProvider)initWithItem:(id)item typeIdentifier:(NSString *)typeIdentifier;
- (NSItemProvider)initWithObject:(id)object;
- (NSItemProviderDataTransferDelegate)dataTransferDelegate;
- (NSItemProviderLoadHandler)previewImageHandler;
- (NSMutableDictionary)_preferredRepresentationByType;
- (NSMutableDictionary)_representationByType;
- (NSMutableOrderedSet)_typeOrder;
- (NSProgress)loadDataRepresentationForTypeIdentifier:(NSString *)typeIdentifier completionHandler:(void *)completionHandler;
- (NSProgress)loadFileRepresentationForTypeIdentifier:(NSString *)typeIdentifier completionHandler:(void *)completionHandler;
- (NSProgress)loadInPlaceFileRepresentationForTypeIdentifier:(NSString *)typeIdentifier completionHandler:(void *)completionHandler;
- (NSProgress)loadObjectOfClass:(id)aClass completionHandler:(void *)completionHandler;
- (NSString)_sanitizedSuggestedName;
- (NSString)suggestedName;
- (NSUUID)_UUID;
- (_NSItemProviderLoading)_loadOperator;
- (id)_availableTypes;
- (id)_availableTypesWithFilterBlock:(id)a3;
- (id)_loadObjectOfClass:(Class)a3 options:(id)a4 completionHandler:(id)a5;
- (id)_metadataValueForKey:(id)a3;
- (id)_objectOfClass:(Class)a3 data:(id)a4 typeIdentifier:(id)a5 error:(id *)a6;
- (id)_readableTypeIdentifiersForItemProviderForClass:(Class)a3;
- (id)_representationConformingToType:(id)a3;
- (id)_representationForType:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)representations;
- (void)_addRepresentationType:(id)a3 preferredRepresentation:(int64_t)a4 loader:(id)a5;
- (void)_addRepresentationType:(id)a3 preferredRepresentation:(int64_t)a4 visibility:(int64_t)a5 loader:(id)a6;
- (void)_addRepresentationType_v2:(id)a3 preferredRepresentation:(int64_t)a4 loader:(id)a5;
- (void)_commonInitGenerateUUID:(BOOL)a3;
- (void)_loadItemOfClass:(Class)a3 forTypeIdentifier:(id)a4 options:(id)a5 coerceForCoding:(BOOL)a6 completionHandler:(id)a7;
- (void)_loadItemOfClass:(Class)a3 withLoadHandler:(id)a4 options:(id)a5 coerceForCoding:(BOOL)a6 completionHandler:(id)a7;
- (void)_loadPreviewImageOfClass:(Class)a3 options:(id)a4 coerceForCoding:(BOOL)a5 completionHandler:(id)a6;
- (void)_setItemRepresentation:(id)a3;
- (void)_setMetadataValue:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)loadItemForTypeIdentifier:(NSString *)typeIdentifier options:(NSDictionary *)options completionHandler:(NSItemProviderCompletionHandler)completionHandler;
- (void)loadPreviewImageWithOptions:(NSDictionary *)options completionHandler:(NSItemProviderCompletionHandler)completionHandler;
- (void)registerDataRepresentationForTypeIdentifier:(NSString *)typeIdentifier visibility:(NSItemProviderRepresentationVisibility)visibility loadHandler:(void *)loadHandler;
- (void)registerFileRepresentationForTypeIdentifier:(NSString *)typeIdentifier fileOptions:(NSItemProviderFileOptions)fileOptions visibility:(NSItemProviderRepresentationVisibility)visibility loadHandler:(void *)loadHandler;
- (void)registerItemForTypeIdentifier:(NSString *)typeIdentifier loadHandler:(NSItemProviderLoadHandler)loadHandler;
- (void)registerObject:(id)object visibility:(NSItemProviderRepresentationVisibility)visibility;
- (void)registerObjectOfClass:(id)aClass visibility:(NSItemProviderRepresentationVisibility)visibility loadHandler:(void *)loadHandler;
- (void)setDataTransferDelegate:(id)a3;
- (void)setPreviewImageHandler:(NSItemProviderLoadHandler)previewImageHandler;
- (void)setSuggestedName:(NSString *)suggestedName;
- (void)setUserInfo:(id)a3;
- (void)set_loadOperator:(id)a3;
- (void)set_preferredRepresentationByType:(id)a3;
- (void)set_representationByType:(id)a3;
- (void)set_typeOrder:(id)a3;
@end

@implementation NSItemProvider

- (void)_commonInitGenerateUUID:(BOOL)a3
{
  BOOL v3 = a3;
  self->_typeOrder = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
  self->_representationByType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  self->_preferredRepresentationByType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  self->_metadata = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v3) {
    self->_UUID = objc_alloc_init(NSUUID);
  }
}

- (NSItemProvider)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)NSItemProvider;
  v2 = [(NSItemProvider *)&v5 init];
  BOOL v3 = v2;
  if (v2) {
    [(NSItemProvider *)v2 _commonInitGenerateUUID:1];
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSItemProvider;
  [(NSItemProvider *)&v3 dealloc];
}

- (id)_availableTypes
{
  v2 = objc_msgSend((id)-[NSMutableOrderedSet array](self->_typeOrder, "array"), "copy");

  return v2;
}

- (BOOL)_hasRepresentationOfType:(id)a3
{
  uint64_t v4 = [(NSItemProvider *)self _typeOrder];

  return [(NSMutableOrderedSet *)v4 containsObject:a3];
}

- (BOOL)_hasRepresentationConformingToType:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(NSItemProvider *)self _typeOrder];
  uint64_t v5 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (((uint64_t (*)(uint64_t, uint64_t))off_1EB1E8100)(*(void *)(*((void *)&v11 + 1) + 8 * v8), (uint64_t)a3))
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
      uint64_t v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return v5;
}

- (id)_availableTypesWithFilterBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = [(NSItemProvider *)self _availableTypes];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [(NSItemProvider *)self _representationConformingToType:v11];
        if (v12 && (*((unsigned int (**)(id, id))a3 + 2))(a3, v12)) {
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v8);
  }
  return v6;
}

- (void)_addRepresentationType:(id)a3 preferredRepresentation:(int64_t)a4 visibility:(int64_t)a5 loader:(id)a6
{
  uint64_t v8 = [[NSItemProviderRepresentation alloc] initWithType_v2:a3 preferredRepresentation:a4 loader:a6];
  [(NSItemProviderRepresentation *)v8 setVisibility:a5];
  [(NSItemProvider *)self _setItemRepresentation:v8];
}

- (void)_addRepresentationType_v2:(id)a3 preferredRepresentation:(int64_t)a4 loader:(id)a5
{
}

- (void)_addRepresentationType:(id)a3 preferredRepresentation:(int64_t)a4 loader:(id)a5
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__NSItemProvider__addRepresentationType_preferredRepresentation_loader___block_invoke;
  v5[3] = &unk_1E51F9B78;
  v5[4] = a5;
  [(NSItemProvider *)self _addRepresentationType_v2:a3 preferredRepresentation:a4 loader:v5];
}

uint64_t __72__NSItemProvider__addRepresentationType_preferredRepresentation_loader___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v8[5] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__NSItemProvider__addRepresentationType_preferredRepresentation_loader___block_invoke_2;
  v8[3] = &unk_1E51F9B50;
  v8[4] = a3;
  return (*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, v8, a4, a5, a6);
}

uint64_t __72__NSItemProvider__addRepresentationType_preferredRepresentation_loader___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = +[NSItemRepresentationLoadResult resultWithData:a2 urlWrapper:a3 cleanupHandler:a5 error:a4];
  uint64_t v7 = *(uint64_t (**)(uint64_t, NSItemRepresentationLoadResult *))(v5 + 16);

  return v7(v5, v6);
}

- (id)representations
{
  return (id)[(NSMutableDictionary *)self->_representationByType allValues];
}

- (id)_representationConformingToType:(id)a3
{
  id result = (id)_bestMatchType((uint64_t)a3, (void *)[(NSMutableOrderedSet *)[(NSItemProvider *)self _typeOrder] array], (uint64_t)&__block_literal_global_317);
  if (result)
  {
    return [(NSItemProvider *)self _representationForType:result];
  }
  return result;
}

- (void)_setItemRepresentation:(id)a3
{
  uint64_t v5 = [a3 typeIdentifier];
  [(NSMutableOrderedSet *)self->_typeOrder addObject:v5];
  [(NSMutableDictionary *)self->_representationByType setObject:a3 forKeyedSubscript:v5];
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_preferredRepresentationByType objectForKeyedSubscript:v5];
  if (v6)
  {
    uint64_t v7 = [v6 unsignedIntegerValue];
    [a3 setPreferredRepresentation:v7];
  }
  else
  {
    uint64_t v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 preferredRepresentation]);
    preferredRepresentationByType = self->_preferredRepresentationByType;
    [(NSMutableDictionary *)preferredRepresentationByType setObject:v8 forKeyedSubscript:v5];
  }
}

- (id)_representationForType:(id)a3
{
  uint64_t v4 = [(NSItemProvider *)self _representationByType];

  return (id)[(NSMutableDictionary *)v4 objectForKeyedSubscript:a3];
}

- (id)_metadataValueForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:a3];
}

- (void)_setMetadataValue:(id)a3 forKey:(id)a4
{
  metadata = self->_metadata;
  if (a3) {
    [(NSMutableDictionary *)metadata setObject:a3 forKeyedSubscript:a4];
  }
  else {
    [(NSMutableDictionary *)metadata removeObjectForKey:a4];
  }
}

- (NSString)suggestedName
{
  v2 = self->_suggestedName;

  return v2;
}

- (void)setSuggestedName:(NSString *)suggestedName
{
  objc_sync_enter(self);
  uint64_t v5 = self->_suggestedName;
  if (v5 != suggestedName)
  {
    self->_suggestedName = (NSString *)[(NSString *)suggestedName copy];

    self->_sanitizedSuggestedName = 0;
  }

  objc_sync_exit(self);
}

- (NSString)_sanitizedSuggestedName
{
  objc_sync_enter(self);
  sanitizedSuggestedName = self->_sanitizedSuggestedName;
  if (sanitizedSuggestedName)
  {
    uint64_t v4 = sanitizedSuggestedName;
  }
  else
  {
    suggestedName = self->_suggestedName;
    if (suggestedName)
    {
      uint64_t v4 = _NSIPSanitizedFilename(suggestedName);
      self->_sanitizedSuggestedName = v4;
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  objc_sync_exit(self);
  return v4;
}

- (NSArray)registeredTypeIdentifiersWithFileOptions:(NSItemProviderFileOptions)fileOptions
{
  if (fileOptions) {
    return (NSArray *)[(NSItemProvider *)self _availableTypesWithFilterBlock:&__block_literal_global_42];
  }
  else {
    return (NSArray *)[(NSItemProvider *)self _availableTypes];
  }
}

BOOL __59__NSItemProvider_registeredTypeIdentifiersWithFileOptions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 preferredRepresentation] == 2;
}

- (NSArray)registeredTypeIdentifiers
{
  return [(NSItemProvider *)self registeredTypeIdentifiersWithFileOptions:0];
}

- (BOOL)hasRepresentationConformingToTypeIdentifier:(NSString *)typeIdentifier fileOptions:(NSItemProviderFileOptions)fileOptions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (fileOptions)
  {
    id v7 = [(NSItemProvider *)self _availableTypes];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = [v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = [(NSItemProvider *)self _representationConformingToType:*(void *)(*((void *)&v15 + 1) + 8 * v10)];
          if ([v11 preferredRepresentation] == 2)
          {
            uint64_t v12 = [v11 typeIdentifier];
            if (((uint64_t (*)(uint64_t, uint64_t))off_1EB1E8100)(v12, (uint64_t)typeIdentifier))
            {
              LOBYTE(v6) = 1;
              return v6;
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v6 = [v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
        uint64_t v8 = v6;
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    LOBYTE(v6) = -[NSItemProvider _hasRepresentationConformingToType:](self, "_hasRepresentationConformingToType:");
  }
  return v6;
}

- (void)registerDataRepresentationForTypeIdentifier:(NSString *)typeIdentifier visibility:(NSItemProviderRepresentationVisibility)visibility loadHandler:(void *)loadHandler
{
  v7[5] = *MEMORY[0x1E4F143B8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__NSItemProvider_registerDataRepresentationForTypeIdentifier_visibility_loadHandler___block_invoke;
  v7[3] = &unk_1E51F9B78;
  v7[4] = loadHandler;
  [(NSItemProvider *)self _addRepresentationType:typeIdentifier preferredRepresentation:0 visibility:visibility loader:v7];
  [(NSMutableDictionary *)self->_preferredRepresentationByType setObject:&off_1ECAB55D0 forKeyedSubscript:typeIdentifier];
}

uint64_t __85__NSItemProvider_registerDataRepresentationForTypeIdentifier_visibility_loadHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v8[5] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__NSItemProvider_registerDataRepresentationForTypeIdentifier_visibility_loadHandler___block_invoke_2;
  v8[3] = &unk_1E51F9BC0;
  v8[4] = a3;
  return (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, v8, a3, a4, a5, a6);
}

uint64_t __85__NSItemProvider_registerDataRepresentationForTypeIdentifier_visibility_loadHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = +[NSItemRepresentationLoadResult resultWithData:a2 urlWrapper:0 cleanupHandler:0 error:a3];
  uint64_t v5 = *(uint64_t (**)(uint64_t, NSItemRepresentationLoadResult *))(v3 + 16);

  return v5(v3, v4);
}

- (void)registerFileRepresentationForTypeIdentifier:(NSString *)typeIdentifier fileOptions:(NSItemProviderFileOptions)fileOptions visibility:(NSItemProviderRepresentationVisibility)visibility loadHandler:(void *)loadHandler
{
  if (fileOptions) {
    uint64_t v8 = &off_1ECAB55E8;
  }
  else {
    uint64_t v8 = &off_1ECAB5600;
  }
  LOBYTE(v9) = fileOptions == 0;
  -[NSItemProvider _addRepresentationType:preferredRepresentation:visibility:loader:](self, "_addRepresentationType:preferredRepresentation:visibility:loader:", MEMORY[0x1E4F143A8], 3221225472, __97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke, &unk_1E51F9C60, typeIdentifier, loadHandler, v9, *MEMORY[0x1E4F143B8]);
  [(NSMutableDictionary *)self->_preferredRepresentationByType setObject:v8 forKeyedSubscript:typeIdentifier];
}

uint64_t __97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_2;
  v5[3] = &unk_1E51F9C38;
  char v6 = *(unsigned char *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  v5[5] = a3;
  return (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v5);
}

void __97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_2(uint64_t a1, void *a2, int a3, NSError *a4)
{
  uint64_t v4 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3052000000;
  v29 = __Block_byref_object_copy__13;
  v30 = __Block_byref_object_dispose__13;
  uint64_t v31 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__36;
  v24 = __Block_byref_object_dispose__37;
  uint64_t v25 = 0;
  char v6 = a4;
  if (!a2) {
    goto LABEL_17;
  }
  char v6 = a4;
  if (a4) {
    goto LABEL_17;
  }
  if (![a2 isFileURL])
  {
    uint64_t v10 = _NSOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = a2;
      _os_log_error_impl(&dword_181795000, v10, OS_LOG_TYPE_ERROR, "URL %@ is not a file:// URL.", (uint8_t *)&buf, 0xCu);
    }
    RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(a1 + 32), 0);
    goto LABEL_16;
  }
  if (softLinkFPIsFileProviderBookmark((uint64_t)a2, 0))
  {
    uint64_t v9 = [[NSSecurityScopedURLWrapper alloc] initWithURL:a2 readonly:*(unsigned __int8 *)(a1 + 48)];
    char v6 = 0;
    v27[5] = (uint64_t)v9;
    goto LABEL_17;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = (uint64_t)__97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_39;
  v19[3] = (uint64_t)&unk_1E51F9BE8;
  v19[4] = *(void *)(a1 + 32);
  v19[5] = (uint64_t)&v26;
  v19[6] = (uint64_t)&v20;
  if (!a3)
  {
    RepresentationError = __97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_39(v19, a2);
LABEL_16:
    char v6 = RepresentationError;
    goto LABEL_17;
  }
  int v12 = [a2 startAccessingSecurityScopedResource];
  long long v13 = [[NSFileCoordinator alloc] initWithFilePresenter:0];
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3052000000;
  v39 = __Block_byref_object_copy__13;
  v40 = __Block_byref_object_dispose__13;
  uint64_t v41 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  v43 = ___synchronousCoordinatedRead_block_invoke;
  v44 = &unk_1E51FA228;
  v45 = v19;
  v46 = &v36;
  v47 = &v32;
  [(NSFileCoordinator *)v13 coordinateReadingItemAtURL:a2 options:1 error:&v41 byAccessor:&buf];
  if (v12) {
    [a2 stopAccessingSecurityScopedResource];
  }

  char v6 = (NSError *)v37[5];
  if (*((unsigned char *)v33 + 24)) {
    char v6 = v6;
  }
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
LABEL_17:
  if (!(v27[5] | (unint64_t)v6)) {
    char v6 = _NSIPCannotLoadRepresentationError(*(void *)(a1 + 32), 0);
  }
  if (v6)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    long long v16 = __97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_43;
    long long v17 = &unk_1E51F9C10;
    uint64_t v18 = *(void *)(a1 + 32);
    if (v4)
    {
      if (![(NSString *)[(NSError *)v4 domain] isEqualToString:@"NSItemProviderErrorDomain"])uint64_t v4 = v16((uint64_t)&v14, (uint64_t)v4); {
    }
      }
  }
  (*(void (**)(void, NSItemRepresentationLoadResult *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), +[NSItemRepresentationLoadResult resultWithData:urlWrapper:cleanupHandler:error:](NSItemRepresentationLoadResult, "resultWithData:urlWrapper:cleanupHandler:error:", 0, v27[5], v21[5], v4, v14, v15));

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
}

NSError *__97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_39(uint64_t *a1, void *a2)
{
  v7[1] = *(NSError **)MEMORY[0x1E4F143B8];
  v7[0] = 0;
  char v6 = 0;
  uint64_t v3 = _NSIPCloneURLToTemporaryFolder(a2, a1[4], 0, &v6, v7);
  if (!v3) {
    return _NSIPCannotLoadRepresentationError(a1[4], 0);
  }
  *(void *)(*(void *)(a1[5] + 8) + 40) = [[NSSecurityScopedURLWrapper alloc] initWithURL:v3 readonly:1];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_2_40;
  v5[3] = &unk_1E51F71D0;
  v5[4] = v6;
  *(void *)(*(void *)(a1[6] + 8) + 40) = [v5 copy];
  return v7[0];
}

uint64_t __97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_2_40(uint64_t a1)
{
  v2 = +[NSFileManager defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);

  return [(NSFileManager *)v2 removeItemAtURL:v3 error:0];
}

NSError *__97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_43(uint64_t a1, uint64_t a2)
{
  return _NSIPCannotLoadRepresentationError(*(void *)(a1 + 32), a2);
}

- (NSProgress)loadDataRepresentationForTypeIdentifier:(NSString *)typeIdentifier completionHandler:(void *)completionHandler
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_alloc_init(_NSIPCallbackSerialization);
  objc_initWeak(&location, v7);
  id v8 = [(NSItemProvider *)self _representationConformingToType:typeIdentifier];
  if (!v8)
  {
    uint64_t v10 = _NSOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v20 = typeIdentifier;
      _os_log_error_impl(&dword_181795000, v10, OS_LOG_TYPE_ERROR, "Cannot find representation conforming to type %@", buf, 0xCu);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_52;
    block[3] = &unk_1E51F9D00;
    block[4] = v7;
    objc_copyWeak(&v15, &location);
    block[6] = typeIdentifier;
    block[7] = completionHandler;
    block[5] = self;
    _NSIPDispatchAsyncCallback(block);
    objc_destroyWeak(&v15);
    goto LABEL_7;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_1E51F9CD8;
  v16[4] = typeIdentifier;
  v16[5] = v7;
  objc_copyWeak(&v17, &location);
  v16[6] = self;
  v16[7] = completionHandler;
  uint64_t v9 = (NSProgress *)objc_msgSend(v8, "loadDataWithOptions_v2:completionHandler:", 0, v16);
  objc_destroyWeak(&v17);
  if (!v9)
  {
LABEL_7:
    uint64_t v9 = +[NSProgress discreteProgressWithTotalUnitCount:100];
    [(NSProgress *)v9 setCompletedUnitCount:[(NSProgress *)v9 totalUnitCount]];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_3_54;
  v12[3] = &unk_1E51F9D28;
  objc_copyWeak(&v13, &location);
  v12[4] = self;
  v12[5] = v9;
  -[_NSIPCallbackSerialization sendBeginBlock:]((uint64_t)v7, (uint64_t)v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v9;
}

void __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[a2 error];
  uint64_t v5 = (uint64_t)v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    uint64_t v10 = __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_2;
    id v11 = &unk_1E51F9C10;
    uint64_t v12 = *(void *)(a1 + 32);
    if ((objc_msgSend((id)objc_msgSend(v4, "domain"), "isEqualToString:", @"NSItemProviderErrorDomain") & 1) == 0) {
      uint64_t v5 = (uint64_t)v10((uint64_t)v9, v5);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_3;
  v7[3] = &unk_1E51F9CB0;
  v7[4] = *(void *)(a1 + 40);
  objc_copyWeak(&v8, (id *)(a1 + 64));
  uint64_t v6 = *(void *)(a1 + 56);
  v7[5] = *(void *)(a1 + 48);
  void v7[6] = a2;
  v7[7] = v5;
  v7[8] = v6;
  _NSIPDispatchAsyncCallback(v7);
  objc_destroyWeak(&v8);
}

NSError *__76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return _NSIPCannotLoadRepresentationError(*(void *)(a1 + 32), a2);
}

void __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  v5[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_4;
  v4[3] = &unk_1E51F9C88;
  objc_copyWeak(v5, (id *)(a1 + 72));
  v4[4] = *(void *)(a1 + 40);
  -[_NSIPCallbackSerialization sendEndBlock:](v2, (uint64_t)v4);
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, [*(id *)(a1 + 48) data], *(void *)(a1 + 56));
  }
  objc_destroyWeak(v5);
}

uint64_t __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_4(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  uint64_t v4 = *(void *)(a1 + 32);
  if (Weak) {
    uint64_t v5 = Weak[3];
  }
  else {
    uint64_t v5 = 0;
  }

  return [v3 itemProvider:v4 finishedDataTransferTransactionUUID:v5];
}

void __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_52(uint64_t a1)
{
  v6[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  id v5[2] = __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_2_53;
  v5[3] = &unk_1E51F9C88;
  objc_copyWeak(v6, (id *)(a1 + 64));
  v5[4] = *(void *)(a1 + 40);
  -[_NSIPCallbackSerialization sendEndBlock:](v2, (uint64_t)v5);
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3)
  {
    RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(a1 + 48), 0);
    (*(void (**)(uint64_t, void, NSError *))(v3 + 16))(v3, 0, RepresentationError);
  }
  objc_destroyWeak(v6);
}

uint64_t __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_2_53(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  uint64_t v4 = *(void *)(a1 + 32);
  if (Weak) {
    uint64_t v5 = Weak[3];
  }
  else {
    uint64_t v5 = 0;
  }

  return [v3 itemProvider:v4 finishedDataTransferTransactionUUID:v5];
}

uint64_t __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_3_54(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 48));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  uint64_t v4 = *(void *)(a1 + 32);
  if (Weak) {
    uint64_t v5 = Weak[3];
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v3 itemProvider:v4 beganDataTransferTransactionUUID:v5 progress:v6];
}

- (NSProgress)loadFileRepresentationForTypeIdentifier:(NSString *)typeIdentifier completionHandler:(void *)completionHandler
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_alloc_init(_NSIPCallbackSerialization);
  objc_initWeak(&location, v7);
  id v8 = [(NSItemProvider *)self _representationConformingToType:typeIdentifier];
  if (!v8)
  {
    uint64_t v10 = _NSOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v20 = typeIdentifier;
      _os_log_error_impl(&dword_181795000, v10, OS_LOG_TYPE_ERROR, "No appropriate representation found for type %@", buf, 0xCu);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_57;
    block[3] = &unk_1E51F9D00;
    block[4] = v7;
    objc_copyWeak(&v15, &location);
    block[6] = typeIdentifier;
    block[7] = completionHandler;
    block[5] = self;
    _NSIPDispatchAsyncCallback(block);
    objc_destroyWeak(&v15);
    goto LABEL_7;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_1E51F9F50;
  v16[4] = typeIdentifier;
  v16[5] = v7;
  objc_copyWeak(&v17, &location);
  v16[7] = v8;
  void v16[8] = completionHandler;
  v16[6] = self;
  uint64_t v9 = (NSProgress *)objc_msgSend(v8, "loadFileCopyWithOptions_v2:completionHandler:", 0, v16);
  objc_destroyWeak(&v17);
  if (!v9)
  {
LABEL_7:
    uint64_t v9 = +[NSProgress discreteProgressWithTotalUnitCount:100];
    [(NSProgress *)v9 setCompletedUnitCount:[(NSProgress *)v9 totalUnitCount]];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_3_59;
  v12[3] = &unk_1E51F9D28;
  objc_copyWeak(&v13, &location);
  v12[4] = self;
  v12[5] = v9;
  -[_NSIPCallbackSerialization sendBeginBlock:]((uint64_t)v7, (uint64_t)v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v9;
}

void __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[a2 error];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v24 = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2;
    uint64_t v25 = &unk_1E51F9C10;
    uint64_t v26 = *(void *)(a1 + 32);
    if ((objc_msgSend((id)objc_msgSend(v4, "domain"), "isEqualToString:", @"NSItemProviderErrorDomain") & 1) == 0) {
      uint64_t v5 = (uint64_t)v24((uint64_t)v23, v5);
    }
    uint64_t v6 = _NSOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v12;
      __int16 v28 = 2112;
      uint64_t v29 = v5;
      _os_log_error_impl(&dword_181795000, v6, OS_LOG_TYPE_ERROR, "Error copying file type %@. Error: %@", buf, 0x16u);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_55;
    block[3] = &unk_1E51F9D00;
    block[4] = *(void *)(a1 + 40);
    objc_copyWeak(&v22, (id *)(a1 + 72));
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 64);
    block[6] = v5;
    block[7] = v8;
    block[5] = v7;
    _NSIPDispatchAsyncCallback(block);
    objc_destroyWeak(&v22);
  }
  else
  {
    *(void *)long long buf = 0;
    uint64_t v20 = 0;
    uint64_t v9 = _NSIPCloneURLToTemporaryFolder(objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url"), objc_msgSend(*(id *)(a1 + 56), "typeIdentifier"), objc_msgSend(*(id *)(a1 + 48), "_sanitizedSuggestedName"), &v20, (NSError **)buf);
    uint64_t v10 = *(void *)buf;
    if (*(void *)buf)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      long long v16 = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_3;
      id v17 = &unk_1E51F9D50;
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = *(void *)buf;
      if ((objc_msgSend((id)objc_msgSend(*(id *)buf, "domain"), "isEqualToString:", @"NSItemProviderErrorDomain") & 1) == 0) {
        uint64_t v10 = ((uint64_t (*)(void *, uint64_t))v16)(v15, v10);
      }
      *(void *)long long buf = v10;
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_4;
    v13[3] = &unk_1E51F9D78;
    v13[4] = *(void *)(a1 + 40);
    objc_copyWeak(&v14, (id *)(a1 + 72));
    uint64_t v11 = *(void *)(a1 + 64);
    v13[5] = *(void *)(a1 + 48);
    v13[6] = v9;
    v13[7] = *(void *)buf;
    v13[8] = v20;
    v13[9] = v11;
    _NSIPDispatchAsyncCallback(v13);
    objc_destroyWeak(&v14);
  }
}

NSError *__76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return _NSIPCannotLoadRepresentationError(*(void *)(a1 + 32), a2);
}

void __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_55(uint64_t a1)
{
  v5[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_56;
  v4[3] = &unk_1E51F9C88;
  objc_copyWeak(v5, (id *)(a1 + 64));
  v4[4] = *(void *)(a1 + 40);
  -[_NSIPCallbackSerialization sendEndBlock:](v2, (uint64_t)v4);
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, 0, *(void *)(a1 + 48));
  }
  objc_destroyWeak(v5);
}

uint64_t __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_56(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  uint64_t v4 = *(void *)(a1 + 32);
  if (Weak) {
    uint64_t v5 = Weak[3];
  }
  else {
    uint64_t v5 = 0;
  }

  return [v3 itemProvider:v4 finishedDataTransferTransactionUUID:v5];
}

NSError *__76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return _NSIPCannotLoadRepresentationError(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_4(uint64_t a1)
{
  v5[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_5;
  v4[3] = &unk_1E51F9C88;
  objc_copyWeak(v5, (id *)(a1 + 80));
  v4[4] = *(void *)(a1 + 40);
  -[_NSIPCallbackSerialization sendEndBlock:](v2, (uint64_t)v4);
  uint64_t v3 = *(void *)(a1 + 72);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  if (*(void *)(a1 + 64)) {
    [+[NSFileManager defaultManager] removeItemAtURL:*(void *)(a1 + 64) error:0];
  }
  objc_destroyWeak(v5);
}

uint64_t __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_5(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  uint64_t v4 = *(void *)(a1 + 32);
  if (Weak) {
    uint64_t v5 = Weak[3];
  }
  else {
    uint64_t v5 = 0;
  }

  return [v3 itemProvider:v4 finishedDataTransferTransactionUUID:v5];
}

void __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_57(uint64_t a1)
{
  v6[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  id v5[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_58;
  v5[3] = &unk_1E51F9C88;
  objc_copyWeak(v6, (id *)(a1 + 64));
  v5[4] = *(void *)(a1 + 40);
  -[_NSIPCallbackSerialization sendEndBlock:](v2, (uint64_t)v5);
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3)
  {
    RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(a1 + 48), 0);
    (*(void (**)(uint64_t, void, NSError *))(v3 + 16))(v3, 0, RepresentationError);
  }
  objc_destroyWeak(v6);
}

uint64_t __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_58(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  uint64_t v4 = *(void *)(a1 + 32);
  if (Weak) {
    uint64_t v5 = Weak[3];
  }
  else {
    uint64_t v5 = 0;
  }

  return [v3 itemProvider:v4 finishedDataTransferTransactionUUID:v5];
}

uint64_t __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_3_59(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 48));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  uint64_t v4 = *(void *)(a1 + 32);
  if (Weak) {
    uint64_t v5 = Weak[3];
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v3 itemProvider:v4 beganDataTransferTransactionUUID:v5 progress:v6];
}

- (NSProgress)loadInPlaceFileRepresentationForTypeIdentifier:(NSString *)typeIdentifier completionHandler:(void *)completionHandler
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_alloc_init(_NSIPCallbackSerialization);
  objc_initWeak(&location, v7);
  uint64_t v8 = +[NSProgress discreteProgressWithTotalUnitCount:100];
  id v9 = [(NSItemProvider *)self _representationConformingToType:typeIdentifier];
  if (v9)
  {
    uint64_t v10 = +[NSProgress progressWithTotalUnitCount:100];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke;
    v21[3] = &unk_1E51F9DE8;
    v21[4] = self;
    v21[5] = v9;
    v21[6] = typeIdentifier;
    v21[7] = v7;
    uint64_t v11 = &v22;
    objc_copyWeak(&v22, &location);
    v21[8] = v10;
    v21[9] = completionHandler;
    uint64_t v12 = objc_msgSend(v9, "loadOpenInPlaceWithOptions_v2:completionHandler:", 0, v21);
    if (v12) {
      [(NSProgress *)v8 addChild:v12 withPendingUnitCount:50];
    }
    else {
      [(NSProgress *)v8 setCompletedUnitCount:50];
    }
    [(NSProgress *)v8 addChild:v10 withPendingUnitCount:50];
  }
  else
  {
    [(NSProgress *)v8 setCompletedUnitCount:[(NSProgress *)v8 totalUnitCount]];
    RepresentationError = _NSIPCannotLoadRepresentationError((uint64_t)typeIdentifier, 0);
    id v14 = _NSOSLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v25 = typeIdentifier;
      _os_log_error_impl(&dword_181795000, v14, OS_LOG_TYPE_ERROR, "Could not find suitable representation of type %@.", buf, 0xCu);
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_66;
    v19[3] = &unk_1E51F9C88;
    uint64_t v11 = &v20;
    objc_copyWeak(&v20, &location);
    v19[4] = self;
    -[_NSIPCallbackSerialization sendEndBlock:]((uint64_t)v7, (uint64_t)v19);
    if (completionHandler)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_67;
      block[3] = &unk_1E51F7EE0;
      block[4] = RepresentationError;
      block[5] = completionHandler;
      _NSIPDispatchAsyncCallback(block);
    }
  }
  objc_destroyWeak(v11);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_3_68;
  v16[3] = &unk_1E51F9D28;
  objc_copyWeak(&v17, &location);
  v16[4] = self;
  v16[5] = v8;
  -[_NSIPCallbackSerialization sendBeginBlock:]((uint64_t)v7, (uint64_t)v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  return v8;
}

void __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NSError *)[a2 error];
  uint64_t v18 = 0;
  uint64_t v19 = v4;
  if (objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url") && !v4)
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
    if (([a2 wasOpenedInPlace] & 1) == 0) {
      uint64_t v5 = _NSIPCloneURLToTemporaryFolder(objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url"), objc_msgSend(*(id *)(a1 + 40), "typeIdentifier"), objc_msgSend(*(id *)(a1 + 32), "_sanitizedSuggestedName"), &v18, &v19);
    }
    char v6 = [a2 wasOpenedInPlace];
    if (!v19) {
      goto LABEL_13;
    }
LABEL_11:
    uint64_t v7 = _NSOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v21 = v10;
      __int16 v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_181795000, v7, OS_LOG_TYPE_ERROR, "Failed to open in place representation of type %@. Error: %@", buf, 0x16u);
    }
    goto LABEL_13;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  id v15 = __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2;
  long long v16 = &unk_1E51F9C10;
  uint64_t v17 = *(void *)(a1 + 48);
  if (v4
    && ![(NSString *)[(NSError *)v4 domain] isEqualToString:@"NSItemProviderErrorDomain"])
  {
    uint64_t v4 = v15((uint64_t)v14, (uint64_t)v4);
  }
  uint64_t v5 = 0;
  char v6 = 0;
  uint64_t v19 = v4;
  if (v4) {
    goto LABEL_11;
  }
LABEL_13:
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_61;
  v11[3] = &unk_1E51F9DC0;
  v11[4] = *(void *)(a1 + 56);
  objc_copyWeak(&v12, (id *)(a1 + 80));
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 72);
  v11[5] = *(void *)(a1 + 32);
  v11[6] = v8;
  char v13 = v6;
  v11[7] = v5;
  v11[8] = v19;
  v11[9] = v18;
  v11[10] = v9;
  _NSIPDispatchAsyncCallback(v11);
  objc_destroyWeak(&v12);
}

NSError *__83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return _NSIPCannotLoadRepresentationError(*(void *)(a1 + 32), a2);
}

void __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_61(uint64_t a1)
{
  v6[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  id v5[2] = __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_62;
  v5[3] = &unk_1E51F9C88;
  objc_copyWeak(v6, (id *)(a1 + 88));
  v5[4] = *(void *)(a1 + 40);
  -[_NSIPCallbackSerialization sendEndBlock:](v2, (uint64_t)v5);
  objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "totalUnitCount"));
  uint64_t v3 = *(void *)(a1 + 80);
  if (v3) {
    (*(void (**)(uint64_t, void, void, void))(v3 + 16))(v3, *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 96), *(void *)(a1 + 64));
  }
  uint64_t v4 = *(void *)(a1 + 72);
  if (v4) {
    _NSIPCoordinatedDelete(v4, (uint64_t)&__block_literal_global_65);
  }
  objc_destroyWeak(v6);
}

uint64_t __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_62(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  uint64_t v4 = *(void *)(a1 + 32);
  if (Weak) {
    uint64_t v5 = Weak[3];
  }
  else {
    uint64_t v5 = 0;
  }

  return [v3 itemProvider:v4 finishedDataTransferTransactionUUID:v5];
}

void __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 && !a3)
  {
    uint64_t v4 = +[NSFileManager defaultManager];
    [(NSFileManager *)v4 removeItemAtURL:a2 error:0];
  }
}

uint64_t __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_66(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  uint64_t v4 = *(void *)(a1 + 32);
  if (Weak) {
    uint64_t v5 = Weak[3];
  }
  else {
    uint64_t v5 = 0;
  }

  return [v3 itemProvider:v4 finishedDataTransferTransactionUUID:v5];
}

uint64_t __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_67(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

uint64_t __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_3_68(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 48));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  uint64_t v4 = *(void *)(a1 + 32);
  if (Weak) {
    uint64_t v5 = Weak[3];
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v3 itemProvider:v4 beganDataTransferTransactionUUID:v5 progress:v6];
}

- (NSItemProvider)initWithObject:(id)object
{
  uint64_t v4 = [(NSItemProvider *)self init];
  uint64_t v5 = v4;
  if (v4) {
    [(NSItemProvider *)v4 registerObject:object visibility:0];
  }
  return v5;
}

- (void)registerObject:(id)object visibility:(NSItemProviderRepresentationVisibility)visibility
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  char v7 = objc_opt_respondsToSelector();
  uint64_t v8 = object;
  if ((v7 & 1) == 0) {
    uint64_t v8 = objc_opt_class();
  }
  uint64_t v9 = (void *)[v8 writableTypeIdentifiersForItemProvider];
  char v24 = objc_opt_respondsToSelector();
  char v10 = objc_opt_respondsToSelector();
  objc_opt_class();
  char v23 = objc_opt_respondsToSelector();
  objc_opt_class();
  char v22 = objc_opt_respondsToSelector();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    uint64_t v21 = v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        if (!-[NSItemProvider _hasRepresentationOfType:](self, "_hasRepresentationOfType:", v15, v21))
        {
          long long v16 = object;
          if (v24)
          {
LABEL_12:
            NSItemProviderRepresentationVisibility v18 = [v16 itemProviderVisibilityForRepresentationWithTypeIdentifier:v15];
            if (v18 <= visibility) {
              NSItemProviderRepresentationVisibility v17 = visibility;
            }
            else {
              NSItemProviderRepresentationVisibility v17 = v18;
            }
          }
          else
          {
            NSItemProviderRepresentationVisibility v17 = visibility;
            if (v23)
            {
              long long v16 = objc_opt_class();
              goto LABEL_12;
            }
          }
          uint64_t v19 = object;
          if (v10)
          {
LABEL_18:
            uint64_t v20 = [v19 _preferredRepresentationForItemProviderWritableTypeIdentifier:v15];
            if (v20)
            {
              v25[0] = MEMORY[0x1E4F143A8];
              v25[1] = 3221225472;
              v26[0] = __44__NSItemProvider_registerObject_visibility___block_invoke_3;
              v26[1] = &unk_1E51F9E38;
              v26[2] = object;
              v26[3] = v15;
              [(NSItemProvider *)self registerFileRepresentationForTypeIdentifier:v15 fileOptions:v20 == 2 visibility:v17 loadHandler:v25];
              continue;
            }
          }
          else if (v22)
          {
            uint64_t v19 = objc_opt_class();
            goto LABEL_18;
          }
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __44__NSItemProvider_registerObject_visibility___block_invoke;
          v27[3] = &unk_1E51F9E10;
          v27[4] = object;
          v27[5] = v15;
          [(NSItemProvider *)self registerDataRepresentationForTypeIdentifier:v15 visibility:v17 loadHandler:v27];
          continue;
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v29 objects:v28 count:16];
    }
    while (v12);
  }
  if (objc_opt_respondsToSelector()) {
    [(NSItemProvider *)self _NSItemProviderDidRegisterObject:object];
  }
}

uint64_t __44__NSItemProvider_registerObject_visibility___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  char v7 = __44__NSItemProvider_registerObject_visibility___block_invoke_2;
  uint64_t v8 = &unk_1E51F9E60;
  uint64_t v9 = v2;
  uint64_t v10 = a2;
  return objc_msgSend(v3, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:");
}

uint64_t __44__NSItemProvider_registerObject_visibility___block_invoke_2(uint64_t a1, uint64_t a2, NSError *RepresentationError)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (!a2 || RepresentationError)
  {
    RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(a1 + 32), (uint64_t)RepresentationError);
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, NSError *))(v3 + 16);
    uint64_t v5 = v3;
    a2 = 0;
  }
  else
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, NSError *))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 40);
  }

  return v4(v5, a2, RepresentationError);
}

uint64_t __44__NSItemProvider_registerObject_visibility___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  char v7 = __44__NSItemProvider_registerObject_visibility___block_invoke_4;
  uint64_t v8 = &unk_1E51F9ED8;
  uint64_t v9 = v2;
  uint64_t v10 = a2;
  return objc_msgSend(v3, "_loadFileRepresentationOfTypeIdentifier:forItemProviderCompletionHandler:");
}

uint64_t __44__NSItemProvider_registerObject_visibility___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, NSError *RepresentationError)
{
  uint64_t v4 = a3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (!a2 || RepresentationError)
  {
    RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(a1 + 32), (uint64_t)RepresentationError);
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, NSError *))(v5 + 16);
    uint64_t v7 = v5;
    a2 = 0;
    a3 = v4;
  }
  else
  {
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, NSError *))(v5 + 16);
    uint64_t v7 = *(void *)(a1 + 40);
  }

  return v6(v7, a2, a3, RepresentationError);
}

- (void)registerObjectOfClass:(id)aClass visibility:(NSItemProviderRepresentationVisibility)visibility loadHandler:(void *)loadHandler
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = (void *)[aClass writableTypeIdentifiersForItemProvider];
    char v22 = objc_opt_respondsToSelector();
    id v9 = aClass;
    char v10 = objc_opt_respondsToSelector();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v11 = [v8 countByEnumeratingWithState:&v31 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v32;
      uint64_t v20 = v25;
      uint64_t v21 = v27;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(v8);
          }
          uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          if (!-[NSItemProvider _hasRepresentationOfType:](self, "_hasRepresentationOfType:", v15, v20, v21))
          {
            NSItemProviderRepresentationVisibility v16 = visibility;
            if (v22)
            {
              NSItemProviderRepresentationVisibility v17 = [v9 itemProviderVisibilityForRepresentationWithTypeIdentifier:v15];
              if (v17 <= visibility) {
                NSItemProviderRepresentationVisibility v16 = visibility;
              }
              else {
                NSItemProviderRepresentationVisibility v16 = v17;
              }
            }
            if ((v10 & 1) != 0
              && (uint64_t v18 = [v9 _preferredRepresentationForItemProviderWritableTypeIdentifier:v15]) != 0)
            {
              v24[0] = MEMORY[0x1E4F143A8];
              v24[1] = 3221225472;
              v25[0] = __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_4;
              v25[1] = &unk_1E51F9F28;
              void v25[2] = v15;
              v25[3] = loadHandler;
              [(NSItemProvider *)self registerFileRepresentationForTypeIdentifier:v15 fileOptions:v18 == 2 visibility:v16 loadHandler:v24];
            }
            else
            {
              v26[0] = MEMORY[0x1E4F143A8];
              v26[1] = 3221225472;
              v27[0] = __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke;
              v27[1] = &unk_1E51F9EB0;
              v27[2] = v15;
              v27[3] = loadHandler;
              [(NSItemProvider *)self registerDataRepresentationForTypeIdentifier:v15 visibility:v16 loadHandler:v26];
            }
          }
        }
        uint64_t v12 = [v8 countByEnumeratingWithState:&v31 objects:v30 count:16];
      }
      while (v12);
    }
  }
  else
  {
    uint64_t v19 = _NSOSLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      long long v29 = NSStringFromClass((Class)aClass);
      _os_log_error_impl(&dword_181795000, v19, OS_LOG_TYPE_ERROR, "Ignoring registration of class %@ because it does not conform to the NSItemProviderWriting protocol.", buf, 0xCu);
    }
  }
}

NSProgress *__63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[NSProgress discreteProgressWithTotalUnitCount:100];
  uint64_t v5 = +[NSProgress discreteProgressWithTotalUnitCount:100];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_2;
  uint64_t v15 = &unk_1E51F9E88;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  NSItemProviderRepresentationVisibility v16 = v5;
  uint64_t v17 = v7;
  uint64_t v18 = v4;
  uint64_t v19 = a2;
  uint64_t v8 = (*(uint64_t (**)(void))(v6 + 16))();
  if (v8)
  {
    uint64_t v9 = v8;
    char v10 = v4;
  }
  else
  {
    char v10 = v4;
    uint64_t v9 = (uint64_t)v5;
  }
  [(NSProgress *)v10 addChild:v9 withPendingUnitCount:20];
  return v4;
}

uint64_t __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void v16[6] = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  uint64_t v6 = +[NSProgress discreteProgressWithTotalUnitCount:100];
  uint64_t v7 = v6;
  if (!a2 || a3)
  {
    [(NSProgress *)v6 setCompletedUnitCount:[(NSProgress *)v6 totalUnitCount]];
    uint64_t v13 = *(void *)(a1 + 56);
    RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(a1 + 40), a3);
    (*(void (**)(uint64_t, void, NSError *))(v13 + 16))(v13, 0, RepresentationError);
    goto LABEL_6;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_3;
  v16[3] = &unk_1E51F9E60;
  uint64_t v9 = *(void *)(a1 + 56);
  v16[4] = v6;
  v16[5] = v9;
  uint64_t v10 = [a2 loadDataWithTypeIdentifier:v8 forItemProviderCompletionHandler:v16];
  if (!v10)
  {
LABEL_6:
    uint64_t v12 = *(void **)(a1 + 48);
    uint64_t v11 = (uint64_t)v7;
    return [v12 addChild:v11 withPendingUnitCount:80];
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void **)(a1 + 48);
  return [v12 addChild:v11 withPendingUnitCount:80];
}

uint64_t __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

NSProgress *__63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[NSProgress discreteProgressWithTotalUnitCount:100];
  uint64_t v5 = +[NSProgress discreteProgressWithTotalUnitCount:100];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_5;
  uint64_t v15 = &unk_1E51F9F00;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  NSItemProviderRepresentationVisibility v16 = v5;
  uint64_t v17 = v7;
  uint64_t v18 = v4;
  uint64_t v19 = a2;
  uint64_t v8 = (*(uint64_t (**)(void))(v6 + 16))();
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = v4;
  }
  else
  {
    uint64_t v10 = v4;
    uint64_t v9 = (uint64_t)v5;
  }
  [(NSProgress *)v10 addChild:v9 withPendingUnitCount:20];
  return v4;
}

uint64_t __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  void v16[6] = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  uint64_t v6 = +[NSProgress discreteProgressWithTotalUnitCount:100];
  uint64_t v7 = v6;
  if (!a2 || a3)
  {
    [(NSProgress *)v6 setCompletedUnitCount:[(NSProgress *)v6 totalUnitCount]];
    uint64_t v13 = *(void *)(a1 + 56);
    RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(a1 + 40), a3);
    (*(void (**)(uint64_t, void, void, NSError *))(v13 + 16))(v13, 0, 0, RepresentationError);
    goto LABEL_6;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_6;
  v16[3] = &unk_1E51F9ED8;
  uint64_t v9 = *(void *)(a1 + 56);
  v16[4] = v6;
  v16[5] = v9;
  uint64_t v10 = [a2 _loadFileRepresentationOfTypeIdentifier:v8 forItemProviderCompletionHandler:v16];
  if (!v10)
  {
LABEL_6:
    uint64_t v12 = *(void **)(a1 + 48);
    uint64_t v11 = (uint64_t)v7;
    return [v12 addChild:v11 withPendingUnitCount:80];
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void **)(a1 + 48);
  return [v12 addChild:v11 withPendingUnitCount:80];
}

uint64_t __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (BOOL)canLoadObjectOfClass:(id)aClass
{
  return _bestMatchConformingToTypes([(NSItemProvider *)self _readableTypeIdentifiersForItemProviderForClass:aClass], [(NSItemProvider *)self _availableTypes]) != 0;
}

- (NSProgress)loadObjectOfClass:(id)aClass completionHandler:(void *)completionHandler
{
  return (NSProgress *)[(NSItemProvider *)self _loadObjectOfClass:aClass options:0 completionHandler:completionHandler];
}

- (id)_objectOfClass:(Class)a3 data:(id)a4 typeIdentifier:(id)a5 error:(id *)a6
{
  return (id)[(objc_class *)a3 objectWithItemProviderData:a4 typeIdentifier:a5 error:a6];
}

- (id)_readableTypeIdentifiersForItemProviderForClass:(Class)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return (id)MEMORY[0x1E4F1CBF0];
  }

  return (id)[(objc_class *)a3 readableTypeIdentifiersForItemProvider];
}

- (id)_loadObjectOfClass:(Class)a3 options:(id)a4 completionHandler:(id)a5
{
  location[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v9 = objc_alloc_init(_NSIPCallbackSerialization);
  objc_initWeak(location, v9);
  id v10 = [(NSItemProvider *)self _readableTypeIdentifiersForItemProviderForClass:a3];
  uint64_t matched = _bestMatchConformingToTypes(v10, [(NSItemProvider *)self _availableTypes]);
  uint64_t v12 = matched;
  if (!matched)
  {
    uint64_t v17 = _NSIPUnavailableCoercionError(0, a3, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_7;
    block[3] = &unk_1E51F9D00;
    block[4] = v9;
    uint64_t v18 = &v24;
    objc_copyWeak(&v24, location);
    void block[6] = v17;
    block[7] = a5;
    block[5] = self;
    _NSIPDispatchAsyncCallback(block);
LABEL_11:
    objc_destroyWeak(v18);
LABEL_12:
    uint64_t v19 = +[NSProgress discreteProgressWithTotalUnitCount:100];
    [(NSProgress *)v19 setCompletedUnitCount:[(NSProgress *)v19 totalUnitCount]];
    goto LABEL_13;
  }
  uint64_t v13 = _bestMatchType(matched, v10, (uint64_t)&__block_literal_global_319);
  id v14 = [(NSItemProvider *)self _representationConformingToType:v12];
  if (!v14)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    void v25[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_5_90;
    v25[3] = &unk_1E51F9D00;
    void v25[4] = v9;
    uint64_t v18 = &v26;
    objc_copyWeak(&v26, location);
    v25[6] = a3;
    v25[7] = a5;
    v25[5] = self;
    _NSIPDispatchAsyncCallback(v25);
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(objc_class *)a3 _preferredRepresentationForItemProviderReadableTypeIdentifier:v12])
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_5;
    v27[3] = &unk_1E51F9F50;
    void v27[4] = a3;
    v27[5] = v13;
    void v27[6] = v9;
    uint64_t v15 = &v28;
    objc_copyWeak(&v28, location);
    v27[7] = self;
    v27[8] = a5;
    uint64_t v16 = objc_msgSend(v14, "loadOpenInPlaceWithOptions_v2:completionHandler:", a4, v27);
  }
  else
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke;
    v29[3] = &unk_1E51F9F50;
    v29[4] = self;
    v29[5] = a3;
    v29[6] = v13;
    v29[7] = v9;
    uint64_t v15 = &v30;
    objc_copyWeak(&v30, location);
    v29[8] = a5;
    uint64_t v16 = objc_msgSend(v14, "loadDataWithOptions_v2:completionHandler:", a4, v29);
  }
  uint64_t v19 = (NSProgress *)v16;
  objc_destroyWeak(v15);
  if (!v19) {
    goto LABEL_12;
  }
LABEL_13:
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_9;
  v21[3] = &unk_1E51F9D28;
  objc_copyWeak(&v22, location);
  v21[4] = self;
  v21[5] = v19;
  -[_NSIPCallbackSerialization sendBeginBlock:]((uint64_t)v9, (uint64_t)v21);

  objc_destroyWeak(&v22);
  objc_destroyWeak(location);
  return v19;
}

void __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = (id)[a2 error];
  id v22 = v4;
  if (![a2 data] || v4)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    uint64_t v13 = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_2;
    id v14 = &unk_1E51F9D50;
    uint64_t v15 = *(void *)(a1 + 40);
    id v16 = v4;
    if (!v4
      || (objc_msgSend((id)objc_msgSend(v4, "domain"), "isEqualToString:", @"NSItemProviderErrorDomain") & 1) != 0)
    {
      goto LABEL_13;
    }
    uint64_t v7 = ((uint64_t (*)(void *, id))v13)(v12, v4);
LABEL_12:
    id v4 = (id)v7;
LABEL_13:
    uint64_t v5 = 0;
    id v22 = v4;
    goto LABEL_14;
  }
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_objectOfClass:data:typeIdentifier:error:", *(void *)(a1 + 40), objc_msgSend(a2, "data"), *(void *)(a1 + 48), &v22);
  if (!v5)
  {
    uint64_t v6 = _NSOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = NSStringFromClass(*(Class *)(a1 + 40));
      *(_DWORD *)long long buf = 138412546;
      id v24 = v9;
      __int16 v25 = 2112;
      id v26 = v22;
      _os_log_error_impl(&dword_181795000, v6, OS_LOG_TYPE_ERROR, "Could not instantiate class %@. Error: %@", buf, 0x16u);
    }
    id v4 = v22;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    uint64_t v18 = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_85;
    uint64_t v19 = &unk_1E51F9D50;
    uint64_t v20 = *(void *)(a1 + 40);
    id v21 = v22;
    if (!v22
      || (objc_msgSend((id)objc_msgSend(v22, "domain"), "isEqualToString:", @"NSItemProviderErrorDomain") & 1) != 0)
    {
      goto LABEL_13;
    }
    uint64_t v7 = ((uint64_t (*)(void *, id))v18)(v17, v4);
    goto LABEL_12;
  }
LABEL_14:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_3;
  block[3] = &unk_1E51F9CB0;
  block[4] = *(void *)(a1 + 56);
  objc_copyWeak(&v11, (id *)(a1 + 72));
  uint64_t v8 = *(void *)(a1 + 64);
  block[5] = *(void *)(a1 + 32);
  void block[6] = v5;
  block[7] = v22;
  void block[8] = v8;
  _NSIPDispatchAsyncCallback(block);
  objc_destroyWeak(&v11);
}

NSError *__63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_85(uint64_t a1)
{
  return _NSIPUnavailableCoercionError(0, *(objc_class **)(a1 + 32), *(void *)(a1 + 40));
}

NSError *__63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return _NSIPUnavailableCoercionError(0, *(objc_class **)(a1 + 32), *(void *)(a1 + 40));
}

void __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_3(uint64_t a1)
{
  v5[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_4;
  v4[3] = &unk_1E51F9C88;
  objc_copyWeak(v5, (id *)(a1 + 72));
  v4[4] = *(void *)(a1 + 40);
  -[_NSIPCallbackSerialization sendEndBlock:](v2, (uint64_t)v4);
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  objc_destroyWeak(v5);
}

uint64_t __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_4(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  uint64_t v4 = *(void *)(a1 + 32);
  if (Weak) {
    uint64_t v5 = Weak[3];
  }
  else {
    uint64_t v5 = 0;
  }

  return [v3 itemProvider:v4 finishedDataTransferTransactionUUID:v5];
}

void __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[a2 error];
  if (objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url") && !objc_msgSend(a2, "error"))
  {
    uint64_t v6 = (Class *)(a1 + 32);
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "_objectWithItemProviderFileURL:typeIdentifier:isInPlace:error:", objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url"), *(void *)(a1 + 40), objc_msgSend(a2, "wasOpenedInPlace"), 0);
    if (v9)
    {
      uint64_t v7 = v9;
      goto LABEL_8;
    }
    id v10 = _NSOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = NSStringFromClass(*v6);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v4;
      _os_log_error_impl(&dword_181795000, v10, OS_LOG_TYPE_ERROR, "Could not instantiate class %@. Error: %@", buf, 0x16u);
    }
    uint64_t v5 = v15;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_86;
    v15[3] = &unk_1E51F9D50;
  }
  else
  {
    uint64_t v5 = v14;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_2_87;
    v14[3] = &unk_1E51F9D50;
    uint64_t v6 = (Class *)(a1 + 32);
  }
  v5[4] = *v6;
  void v5[5] = v4;
  if (v4
    && (objc_msgSend((id)objc_msgSend(v4, "domain"), "isEqualToString:", @"NSItemProviderErrorDomain") & 1) == 0)
  {
    uint64_t v4 = (void *)((uint64_t (*)(void *, void *))v5[2])(v5, v4);
  }
  uint64_t v7 = 0;
LABEL_8:
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_3_88;
  v12[3] = &unk_1E51F9CB0;
  v12[4] = *(void *)(a1 + 48);
  objc_copyWeak(&v13, (id *)(a1 + 72));
  uint64_t v8 = *(void *)(a1 + 64);
  v12[5] = *(void *)(a1 + 56);
  void v12[6] = v7;
  v12[7] = v4;
  v12[8] = v8;
  _NSIPDispatchAsyncCallback(v12);
  objc_destroyWeak(&v13);
}

NSError *__63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_86(uint64_t a1)
{
  return _NSIPUnavailableCoercionError(0, *(objc_class **)(a1 + 32), *(void *)(a1 + 40));
}

NSError *__63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_2_87(uint64_t a1)
{
  return _NSIPUnavailableCoercionError(0, *(objc_class **)(a1 + 32), *(void *)(a1 + 40));
}

void __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_3_88(uint64_t a1)
{
  v5[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_4_89;
  v4[3] = &unk_1E51F9C88;
  objc_copyWeak(v5, (id *)(a1 + 72));
  v4[4] = *(void *)(a1 + 40);
  -[_NSIPCallbackSerialization sendEndBlock:](v2, (uint64_t)v4);
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  objc_destroyWeak(v5);
}

uint64_t __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_4_89(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  uint64_t v4 = *(void *)(a1 + 32);
  if (Weak) {
    uint64_t v5 = Weak[3];
  }
  else {
    uint64_t v5 = 0;
  }

  return [v3 itemProvider:v4 finishedDataTransferTransactionUUID:v5];
}

void __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_5_90(uint64_t a1)
{
  v6[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  id v5[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_6;
  v5[3] = &unk_1E51F9C88;
  objc_copyWeak(v6, (id *)(a1 + 64));
  v5[4] = *(void *)(a1 + 40);
  -[_NSIPCallbackSerialization sendEndBlock:](v2, (uint64_t)v5);
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3)
  {
    uint64_t v4 = _NSIPUnavailableCoercionError(0, *(objc_class **)(a1 + 48), 0);
    (*(void (**)(uint64_t, void, NSError *))(v3 + 16))(v3, 0, v4);
  }
  objc_destroyWeak(v6);
}

uint64_t __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_6(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  uint64_t v4 = *(void *)(a1 + 32);
  if (Weak) {
    uint64_t v5 = Weak[3];
  }
  else {
    uint64_t v5 = 0;
  }

  return [v3 itemProvider:v4 finishedDataTransferTransactionUUID:v5];
}

void __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_7(uint64_t a1)
{
  v5[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_8;
  v4[3] = &unk_1E51F9C88;
  objc_copyWeak(v5, (id *)(a1 + 64));
  v4[4] = *(void *)(a1 + 40);
  -[_NSIPCallbackSerialization sendEndBlock:](v2, (uint64_t)v4);
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, 0, *(void *)(a1 + 48));
  }
  objc_destroyWeak(v5);
}

uint64_t __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_8(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  uint64_t v4 = *(void *)(a1 + 32);
  if (Weak) {
    uint64_t v5 = Weak[3];
  }
  else {
    uint64_t v5 = 0;
  }

  return [v3 itemProvider:v4 finishedDataTransferTransactionUUID:v5];
}

uint64_t __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_9(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 48));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  uint64_t v4 = *(void *)(a1 + 32);
  if (Weak) {
    uint64_t v5 = Weak[3];
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v3 itemProvider:v4 beganDataTransferTransactionUUID:v5 progress:v6];
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSItemProvider;
  return +[NSString stringWithFormat:@"%@ {types = %@}", [(NSItemProvider *)&v3 description], [(NSItemProvider *)self registeredTypeIdentifiers]];
}

- (BOOL)hasItemConformingToTypeIdentifier:(NSString *)typeIdentifier
{
  return [(NSItemProvider *)self hasRepresentationConformingToTypeIdentifier:typeIdentifier fileOptions:0];
}

- (NSItemProvider)initWithItem:(id)item typeIdentifier:(NSString *)typeIdentifier
{
  v9[5] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(NSItemProvider *)self init];
  uint64_t v7 = v6;
  if (item && v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __46__NSItemProvider_initWithItem_typeIdentifier___block_invoke;
    v9[3] = &unk_1E51F9F78;
    v9[4] = item;
    [(NSItemProvider *)v6 registerItemForTypeIdentifier:typeIdentifier loadHandler:v9];
  }
  return v7;
}

uint64_t __46__NSItemProvider_initWithItem_typeIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), 0);
}

- (NSItemProvider)initWithContentsOfURL:(NSURL *)fileURL
{
  v9[5] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(NSItemProvider *)self init];
  if (v4)
  {
    if ([(NSURL *)fileURL isFileURL])
    {
      uint64_t v5 = [(NSURL *)fileURL pathExtension];
      uint64_t v6 = _MergedGlobals_85();
      id v7 = (id)((uint64_t (*)(uint64_t, uint64_t, uint64_t))off_1EB1E8108)(v6, (uint64_t)v5, 0);
      if (!v7) {
        id v7 = (id)off_1EB1E80F0();
      }
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      void v9[2] = __40__NSItemProvider_initWithContentsOfURL___block_invoke;
      v9[3] = &unk_1E51F9FA0;
      v9[4] = fileURL;
      [(NSItemProvider *)v4 registerDataRepresentationForTypeIdentifier:v7 visibility:0 loadHandler:v9];
    }
    [(NSItemProvider *)v4 registerObject:fileURL visibility:0];
  }
  return v4;
}

uint64_t __40__NSItemProvider_initWithContentsOfURL___block_invoke(uint64_t a1, uint64_t a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  uint64_t v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:*(void *)(a1 + 32) options:1 error:v5];
  (*(void (**)(uint64_t, uint64_t, void))(a2 + 16))(a2, v3, v5[0]);
  return 0;
}

- (void)registerItemForTypeIdentifier:(NSString *)typeIdentifier loadHandler:(NSItemProviderLoadHandler)loadHandler
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__NSItemProvider_registerItemForTypeIdentifier_loadHandler___block_invoke;
  v4[3] = &unk_1E51F9FF0;
  v4[4] = typeIdentifier;
  void v4[5] = loadHandler;
  [(NSItemProvider *)self _addRepresentationType_v2:typeIdentifier preferredRepresentation:0 loader:v4];
}

uint64_t __60__NSItemProvider_registerItemForTypeIdentifier_loadHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 objectForKeyedSubscript:@"com.apple.Foundation.NSItemProviderExpectedClass"];
  if (v4)
  {
    uint64_t v5 = (NSString *)v4;
    uint64_t v6 = (void *)[a2 mutableCopy];
    [v6 removeObjectForKey:@"com.apple.Foundation.NSItemProviderExpectedClass"];
    v6;
    NSClassFromString(v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return 0;
}

id __60__NSItemProvider_registerItemForTypeIdentifier_loadHandler___block_invoke_2(uint64_t a1, void *a2, NSError *RepresentationError)
{
  v14[5] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = off_1EB1E80F8();
    if (((uint64_t (*)(uint64_t, uint64_t))off_1EB1E8100)(v6, v7))
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __60__NSItemProvider_registerItemForTypeIdentifier_loadHandler___block_invoke_3;
      v14[3] = &unk_1E51F9BC0;
      uint64_t v8 = *(void *)(a1 + 32);
      v14[4] = *(void *)(a1 + 40);
      return (id)[a2 loadDataWithTypeIdentifier:v8 forItemProviderCompletionHandler:v14];
    }
    id v11 = [[NSSecurityScopedURLWrapper alloc] initWithURL:a2 readonly:0];
    id v10 = 0;
  }
  else
  {
    if (!_NSIsNSData())
    {
      uint64_t v12 = +[NSKeyedArchiver archivedDataWithRootObject:a2 requiringSecureCoding:1 error:0];
      if (!v12)
      {
        RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(a1 + 32), 0);
        uint64_t v12 = 0;
      }
      -[NSItemRepresentationLoadResult setArchivedObjectClass:](+[NSItemRepresentationLoadResult resultWithData:urlWrapper:cleanupHandler:error:](NSItemRepresentationLoadResult, "resultWithData:urlWrapper:cleanupHandler:error:", v12, 0, 0, RepresentationError), "setArchivedObjectClass:", [a2 classForCoder]);
      id v13 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
      goto LABEL_11;
    }
    id v10 = a2;
    id v11 = 0;
  }
  +[NSItemRepresentationLoadResult resultWithData:v10 urlWrapper:v11 cleanupHandler:0 error:0];
  id v13 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_11:

  return (id)v13();
}

uint64_t __60__NSItemProvider_registerItemForTypeIdentifier_loadHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [+[NSItemRepresentationLoadResult resultWithData:a2 urlWrapper:0 cleanupHandler:0 error:a3] setArchivedObjectClass:objc_opt_class()];
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

- (void)loadItemForTypeIdentifier:(NSString *)typeIdentifier options:(NSDictionary *)options completionHandler:(NSItemProviderCompletionHandler)completionHandler
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  Class aClass = 0;
  if (!_NSIPGetExpectedClassFromCompletionBlock(completionHandler, &aClass, 0))
  {
    uint64_t v9 = _NSOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_181795000, v9, OS_LOG_TYPE_ERROR, "Cannot figure out the expected value class in an NSItemProvider completion handler. Falling back to returning the default class.", buf, 2u);
    }
  }
  id v10 = options;
  Class v11 = aClass;
  if (aClass)
  {
    if (options) {
      uint64_t v12 = (NSDictionary *)[(NSDictionary *)options mutableCopy];
    }
    else {
      uint64_t v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    id v13 = v12;
    [(NSDictionary *)v12 setObject:NSStringFromClass(aClass) forKeyedSubscript:@"com.apple.Foundation.NSItemProviderExpectedClass"];

    Class v11 = aClass;
    id v10 = v13;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __70__NSItemProvider_loadItemForTypeIdentifier_options_completionHandler___block_invoke;
  v14[3] = &unk_1E51FA018;
  v14[4] = self;
  v14[5] = v11;
  void v14[6] = typeIdentifier;
  v14[7] = v10;
  v14[8] = completionHandler;
  _asyncDispatchBlockWithOptions(options, v14);
}

void __70__NSItemProvider_loadItemForTypeIdentifier_options_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadItemOfClass:*(void *)(a1 + 40) forTypeIdentifier:*(void *)(a1 + 48) options:*(void *)(a1 + 56) coerceForCoding:0 completionHandler:*(void *)(a1 + 64)];
  uint64_t v2 = *(void **)(a1 + 56);
}

- (void)_loadItemOfClass:(Class)a3 forTypeIdentifier:(id)a4 options:(id)a5 coerceForCoding:(BOOL)a6 completionHandler:(id)a7
{
  v31[6] = *MEMORY[0x1E4F143B8];
  if ([(NSItemProvider *)self hasItemConformingToTypeIdentifier:a4])
  {
    uint64_t v12 = objc_opt_class();
    if ([(objc_class *)a3 isSubclassOfClass:v12])
    {
      uint64_t v13 = off_1EB1E80F8();
      if (((uint64_t (*)(uint64_t, uint64_t))off_1EB1E8100)((uint64_t)a4, v13))
      {
        uint64_t v14 = objc_opt_class();
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke;
        v31[3] = &unk_1E51FA040;
        v31[4] = a4;
        v31[5] = a7;
        [(NSItemProvider *)self _loadObjectOfClass:v14 options:a5 completionHandler:v31];
      }
      else
      {
        id v22 = [(NSItemProvider *)self _representationConformingToType:a4];
        if (v22)
        {
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_4;
          v30[3] = &unk_1E51FA068;
          v30[5] = a3;
          v30[6] = a7;
          v30[4] = v12;
          objc_msgSend(v22, "loadWithOptions_v2:completionHandler:", a5, v30);
        }
        else if (a7)
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_7;
          block[3] = &unk_1E51F7EE0;
          block[4] = a3;
          block[5] = a7;
          _NSIPDispatchAsyncCallback(block);
        }
      }
    }
    else
    {
      id v17 = [(NSItemProvider *)self _representationConformingToType:a4];
      if (v17)
      {
        __int16 v18 = v17;
        uint64_t v19 = objc_alloc_init(_NSIPCallbackSerialization);
        objc_initWeak(&location, v19);
        id v20 = [(NSItemProvider *)self _readableTypeIdentifiersForItemProviderForClass:a3];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        void v26[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_8;
        v26[3] = &unk_1E51FA0E0;
        void v26[4] = a4;
        v26[5] = a3;
        v26[6] = v20;
        v26[7] = v18;
        v26[8] = v19;
        objc_copyWeak(&v27, &location);
        v26[9] = self;
        v26[10] = a7;
        uint64_t v21 = objc_msgSend(v18, "loadWithOptions_v2:completionHandler:", a5, v26);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        void v24[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_14;
        v24[3] = &unk_1E51F9D28;
        objc_copyWeak(&v25, &location);
        v24[4] = self;
        v24[5] = v21;
        -[_NSIPCallbackSerialization sendBeginBlock:]((uint64_t)v19, (uint64_t)v24);

        objc_destroyWeak(&v25);
        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }
      else
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        void v23[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_15;
        v23[3] = &unk_1E51F7EE0;
        v23[4] = a4;
        v23[5] = a7;
        _NSIPDispatchAsyncCallback(v23);
      }
    }
  }
  else
  {
    RepresentationError = _NSIPCannotLoadRepresentationError((uint64_t)a4, 0);
    if (a7)
    {
      id v16 = (void (*)(id, void, NSError *))*((void *)a7 + 2);
      v16(a7, 0, RepresentationError);
    }
  }
}

void __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (uint64_t)a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    uint64_t v9 = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_2;
    id v10 = &unk_1E51F9C10;
    uint64_t v11 = *(void *)(a1 + 32);
    if ((objc_msgSend((id)objc_msgSend(a3, "domain"), "isEqualToString:", @"NSItemProviderErrorDomain") & 1) == 0) {
      uint64_t v3 = (uint64_t)v9((uint64_t)v8, v3);
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_3;
    block[3] = &unk_1E51F7DF0;
    block[5] = v3;
    void block[6] = v6;
    block[4] = a2;
    _NSIPDispatchAsyncCallback(block);
  }
}

NSError *__95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return _NSIPCannotLoadRepresentationError(*(void *)(a1 + 32), a2);
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_4(void *a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v12[0] = 0;
  if ([a2 urlWrapper])
  {
    id v4 = (id)objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
  }
  else
  {
    uint64_t v5 = (void *)[a2 archivedObjectClass];
    if (![v5 isSubclassOfClass:a1[4]])
    {
      uint64_t v7 = a1[6];
      if (!v7) {
        return;
      }
      uint64_t v9 = 0;
      goto LABEL_11;
    }
    id v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v5, [a2 data], v12);
  }
  id v6 = v4;
  uint64_t v7 = a1[6];
  if (!v7) {
    return;
  }
  if (!v4)
  {
    uint64_t v9 = v12[0];
LABEL_11:
    uint64_t v8 = block;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_6;
    block[3] = &unk_1E51F7DF0;
    block[5] = v9;
    void block[6] = v7;
    block[4] = a1[5];
    goto LABEL_12;
  }
  uint64_t v8 = v11;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_5;
  v11[3] = &unk_1E51F7EE0;
  v11[4] = v6;
  v11[5] = v7;
LABEL_12:
  _NSIPDispatchAsyncCallback(v8);
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_6(uint64_t *a1)
{
  uint64_t v1 = a1[6];
  uint64_t v2 = _NSIPUnexpectedValueClassError(a1[4], a1[5]);
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, NSError *))(v1 + 16);

  return v3(v1, 0, v2);
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = _NSIPUnexpectedValueClassError(*(void *)(a1 + 32), 0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, NSError *))(v1 + 16);

  return v3(v1, 0, v2);
}

void __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a2 error];
  v27[0] = v4;
  uint64_t v5 = [a2 cleanupHandler];
  if (v4)
  {
    uint64_t v6 = 0;
LABEL_3:
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    uint64_t v19 = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_11;
    id v20 = &unk_1E51F9C10;
    uint64_t v21 = *(void *)(a1 + 32);
    if ((objc_msgSend((id)objc_msgSend((id)v4, "domain"), "isEqualToString:", @"NSItemProviderErrorDomain") & 1) == 0) {
      uint64_t v4 = (uint64_t)v19((uint64_t)v18, v4);
    }
    v27[0] = v4;
    goto LABEL_6;
  }
  if ([a2 data])
  {
    uint64_t v8 = [a2 archivedObjectClass];
    if (v8)
    {
      uint64_t v9 = v8;
      id v10 = -[NSKeyedUnarchiver initForReadingFromData:error:]([NSKeyedUnarchiver alloc], "initForReadingFromData:error:", [a2 data], 0);
      [(NSKeyedUnarchiver *)v10 setRequiresSecureCoding:0];
      uint64_t v6 = [(NSKeyedUnarchiver *)v10 decodeObjectOfClass:v9 forKey:@"root"];

      if (v6) {
        goto LABEL_15;
      }
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "objectWithItemProviderData:typeIdentifier:error:", objc_msgSend(a2, "data"), *(void *)(a1 + 32), 0);
      if (v6) {
        goto LABEL_15;
      }
    }
    uint64_t v11 = [a2 data];
  }
  else
  {
    if (![a2 urlWrapper])
    {
      RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(a1 + 32), 0);
LABEL_22:
      uint64_t v4 = (uint64_t)RepresentationError;
      uint64_t v6 = 0;
      v27[0] = RepresentationError;
      goto LABEL_35;
    }
    uint64_t v11 = objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
  }
  uint64_t v6 = v11;
  if (!v11)
  {
    uint64_t v4 = 0;
    goto LABEL_35;
  }
LABEL_15:
  if (!*(void *)(a1 + 40) || (objc_opt_isKindOfClass() & 1) != 0) {
    goto LABEL_6;
  }
  id v12 = +[_NSItemProviderTypeCoercion typeCoercionForValue:v6 targetClass:*(void *)(a1 + 40)];
  if (v12)
  {
    uint64_t v6 = [v12 coerceValueError:v27];
    uint64_t v4 = v27[0];
    if (v6 | v27[0]) {
      goto LABEL_35;
    }
    RepresentationError = _NSIPUnexpectedValueClassError(*(void *)(a1 + 40), 0);
    goto LABEL_22;
  }
  if (qword_1EB1ED020 != -1) {
    dispatch_once(&qword_1EB1ED020, &__block_literal_global_108);
  }
  if (_MergedGlobals_7_0 && (objc_msgSend(*(id *)(a1 + 40), "isSubclassOfClass:") & 1) != 0
    || qword_1EB1ED018 && (objc_msgSend(*(id *)(a1 + 40), "isSubclassOfClass:") & 1) != 0
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_10;
    v22[3] = &unk_1E51FA090;
    uint64_t v14 = *(void **)(a1 + 48);
    v22[4] = *(void *)(a1 + 56);
    v22[5] = &v23;
    [v14 enumerateObjectsUsingBlock:v22];
    if (*((unsigned char *)v24 + 24)) {
      uint64_t v6 = objc_msgSend(*(id *)(a1 + 40), "objectWithItemProviderData:typeIdentifier:error:", objc_msgSend(a2, "data"), objc_msgSend(*(id *)(a1 + 56), "typeIdentifier"), v27);
    }
    else {
      uint64_t v6 = 0;
    }
    _Block_object_dispose(&v23, 8);
    uint64_t v4 = v27[0];
  }
LABEL_35:
  if (!(v6 | v4))
  {
    uint64_t v15 = (objc_class *)objc_opt_class();
    uint64_t v4 = (uint64_t)_NSIPUnavailableCoercionError(v15, *(objc_class **)(a1 + 40), 0);
    v27[0] = v4;
  }
  if (v4) {
    goto LABEL_3;
  }
LABEL_6:
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_12;
  v16[3] = &unk_1E51FA0B8;
  v16[4] = *(void *)(a1 + 64);
  objc_copyWeak(&v17, (id *)(a1 + 88));
  uint64_t v7 = *(void *)(a1 + 80);
  v16[5] = *(void *)(a1 + 72);
  void v16[6] = v6;
  void v16[7] = v27[0];
  void v16[8] = v7;
  void v16[9] = v5;
  _NSIPDispatchAsyncCallback(v16);
  objc_destroyWeak(&v17);
}

Class __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_9()
{
  _MergedGlobals_7_0 = (uint64_t)objc_getClass("UIImage");
  Class result = objc_getClass("NSImage");
  qword_1EB1ED018 = (uint64_t)result;
  return result;
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) typeIdentifier];
  uint64_t result = off_1EB1E8100(v6);
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

NSError *__95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_11(uint64_t a1, uint64_t a2)
{
  return _NSIPCannotLoadRepresentationError(*(void *)(a1 + 32), a2);
}

void __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_12(uint64_t a1)
{
  v6[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_13;
  v5[3] = &unk_1E51F9C88;
  objc_copyWeak(v6, (id *)(a1 + 80));
  v5[4] = *(void *)(a1 + 40);
  -[_NSIPCallbackSerialization sendEndBlock:](v2, (uint64_t)v5);
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  uint64_t v4 = *(void *)(a1 + 72);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  objc_destroyWeak(v6);
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_13(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  uint64_t v4 = *(void *)(a1 + 32);
  if (Weak) {
    uint64_t v5 = Weak[3];
  }
  else {
    uint64_t v5 = 0;
  }

  return [v3 itemProvider:v4 finishedDataTransferTransactionUUID:v5];
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_14(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 48));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  uint64_t v4 = *(void *)(a1 + 32);
  if (Weak) {
    uint64_t v5 = Weak[3];
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v3 itemProvider:v4 beganDataTransferTransactionUUID:v5 progress:v6];
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_15(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1)
  {
    RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(result + 32), 0);
    uint64_t v3 = *(uint64_t (**)(uint64_t, void, NSError *))(v1 + 16);
    return v3(v1, 0, RepresentationError);
  }
  return result;
}

- (void)_loadPreviewImageOfClass:(Class)a3 options:(id)a4 coerceForCoding:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  id v6[2] = __85__NSItemProvider__loadPreviewImageOfClass_options_coerceForCoding_completionHandler___block_invoke;
  v6[3] = &unk_1E51FA108;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a6;
  BOOL v7 = a5;
  _asyncDispatchBlockWithOptions(a4, v6);
}

uint64_t __85__NSItemProvider__loadPreviewImageOfClass_options_coerceForCoding_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2[1])
  {
    uint64_t v3 = a1[5];
    return objc_msgSend(v2, "_loadItemOfClass:withLoadHandler:options:coerceForCoding:completionHandler:", v3);
  }
  else
  {
    _NSIPCannotLoadPreviewError(0);
    uint64_t v5 = *(uint64_t (**)(void))(a1[7] + 16);
    return v5();
  }
}

- (void)_loadItemOfClass:(Class)a3 withLoadHandler:(id)a4 options:(id)a5 coerceForCoding:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93__NSItemProvider__loadItemOfClass_withLoadHandler_options_coerceForCoding_completionHandler___block_invoke;
  v7[3] = &unk_1E51FA130;
  v7[4] = a3;
  v7[5] = a7;
  BOOL v8 = a6;
  (*((void (**)(id, void *, Class, id))a4 + 2))(a4, v7, a3, a5);
}

uint64_t __93__NSItemProvider__loadItemOfClass_withLoadHandler_options_coerceForCoding_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v4();
  }
  else
  {
    v9[0] = 0;
    if (a2)
    {
      if (*(void *)(a1 + 32))
      {
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v7 = +[_NSItemProviderTypeCoercion typeCoercionForValue:a2 targetClass:*(void *)(a1 + 32)];
          BOOL v8 = v7;
          if ((!*(unsigned char *)(a1 + 48) || [v7 shouldCoerceForCoding])
            && ![v8 coerceValueError:v9]
            && !v9[0])
          {
            v9[0] = _NSIPUnexpectedValueClassError(*(void *)(a1 + 32), 0);
          }
        }
      }
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setUserInfo:", (id)-[NSDictionary copy](self->_userInfo, "copy"));
  objc_msgSend(v4, "setPreviewImageHandler:", (id)objc_msgSend(self->_previewImageHandler, "copy"));
  objc_msgSend(v4, "set_loadOperator:", self->_loadOperator);
  objc_msgSend(v4, "set_representationByType:", (id)-[NSMutableDictionary mutableCopy](-[NSItemProvider _representationByType](self, "_representationByType"), "mutableCopy"));
  objc_msgSend(v4, "set_typeOrder:", (id)-[NSMutableOrderedSet mutableCopy](-[NSItemProvider _typeOrder](self, "_typeOrder"), "mutableCopy"));
  objc_msgSend(v4, "set_preferredRepresentationByType:", (id)-[NSMutableDictionary mutableCopy](-[NSItemProvider _preferredRepresentationByType](self, "_preferredRepresentationByType"), "mutableCopy"));

  v4[2] = (id)[(NSMutableDictionary *)self->_metadata mutableCopy];
  v4[9] = (id)[(NSString *)self->_suggestedName copy];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSItemProvider)initWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"This object may only be decoded by an NSXPCCoder." userInfo:0]);
  }
  uint64_t v5 = [(NSItemProvider *)self init];
  if (v5)
  {
    if (_os_feature_enabled_impl())
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v7 = [&unk_1ECAB6728 countByEnumeratingWithState:&v25 objects:v24 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v26;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v26 != v9) {
              objc_enumerationMutation(&unk_1ECAB6728);
            }
            Class v11 = NSClassFromString(*(NSString **)(*((void *)&v25 + 1) + 8 * v10));
            if (v11) {
              [v6 addObject:v11];
            }
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [&unk_1ECAB6728 countByEnumeratingWithState:&v25 objects:v24 count:16];
        }
        while (v8);
      }
      uint64_t v12 = [a3 decodeObjectOfClasses:v6 forKey:@"loadOperator"];
    }
    else
    {
      uint64_t v12 = [a3 decodeObjectForKey:@"loadOperator"];
    }
    uint64_t v13 = (void *)v12;
    uint64_t v14 = (void *)[a3 decodePropertyListForKey:@"typeIdentifiers"];
    if (v13)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __32__NSItemProvider_initWithCoder___block_invoke;
      v21[3] = &unk_1E51FA180;
      v21[4] = v5;
      v21[5] = v13;
      [v14 enumerateObjectsUsingBlock:v21];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __32__NSItemProvider_initWithCoder___block_invoke_3;
      v20[3] = &unk_1E51F9F78;
      v20[4] = v13;
      v5->_previewImageHandler = (id)[v20 copy];
    }
    else
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __32__NSItemProvider_initWithCoder___block_invoke_4;
      v19[3] = &unk_1E51FA1C8;
      v19[4] = v5;
      [v14 enumerateObjectsUsingBlock:v19];
    }
    v5->_loadOperator = (_NSItemProviderLoading *)v13;
    uint64_t v15 = [a3 decodePropertyListForKey:@"metadata"];
    if (v15) {
      [(NSMutableDictionary *)v5->_metadata setDictionary:v15];
    }
    -[NSItemProvider setUserInfo:](v5, "setUserInfo:", [a3 decodePropertyListForKey:@"userInfo"]);
    id v16 = (void *)[a3 decodeObjectOfClass:self forKey:@"suggestedName"];
    if (v16 && (self, (objc_opt_isKindOfClass() & 1) == 0))
    {

      id v17 = +[NSString stringWithFormat:@"Unexpected class '%@' for key '%@'", objc_opt_class(), @"suggestedName"];
      id v22 = @"NSLocalizedDescription";
      uint64_t v23 = v17;
      objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1)));
      return 0;
    }
    else
    {
      v5->_suggestedName = (NSString *)[v16 copy];
    }
  }
  return v5;
}

uint64_t __32__NSItemProvider_initWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__NSItemProvider_initWithCoder___block_invoke_2;
  v4[3] = &unk_1E51FA158;
  uint64_t v2 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  void v4[5] = a2;
  return [v2 registerItemForTypeIdentifier:a2 loadHandler:v4];
}

uint64_t __32__NSItemProvider_initWithCoder___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) loadItemForTypeIdentifier:*(void *)(a1 + 40) completionHandler:a2 expectedValueClass:a3 options:a4];
}

uint64_t __32__NSItemProvider_initWithCoder___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) loadPreviewImageWithCompletionHandler:a2 expectedValueClass:a3 options:a4];
}

uint64_t __32__NSItemProvider_initWithCoder___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) registerItemForTypeIdentifier:a2 loadHandler:&__block_literal_global_127];
}

uint64_t __32__NSItemProvider_initWithCoder___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, 0, 0);
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"This object may only be encoded by an NSXPCCoder." userInfo:0]);
  }
  uint64_t v5 = [(NSItemProvider *)self registeredTypeIdentifiers];
  if (v5) {
    [a3 encodeObject:v5 forKey:@"typeIdentifiers"];
  }
  userInfo = self->_userInfo;
  if (userInfo) {
    [a3 encodeObject:userInfo forKey:@"userInfo"];
  }
  loadOperator = self->_loadOperator;
  if (loadOperator) {
    [a3 encodeObject:loadOperator forKey:@"loadOperator"];
  }
  metadata = self->_metadata;
  if (metadata) {
    [a3 encodeObject:metadata forKey:@"metadata"];
  }
  if (self->_suggestedName)
  {
    objc_msgSend(a3, "encodeObject:forKey:");
  }
}

- (_NSItemProviderLoading)_loadOperator
{
  return (_NSItemProviderLoading *)objc_getProperty(self, a2, 24, 1);
}

- (void)set_loadOperator:(id)a3
{
}

- (NSMutableDictionary)_representationByType
{
  return self->_representationByType;
}

- (void)set_representationByType:(id)a3
{
}

- (NSMutableOrderedSet)_typeOrder
{
  return self->_typeOrder;
}

- (void)set_typeOrder:(id)a3
{
}

- (NSArray)_representations
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableDictionary)_preferredRepresentationByType
{
  return self->_preferredRepresentationByType;
}

- (void)set_preferredRepresentationByType:(id)a3
{
}

- (NSUUID)_UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUserInfo:(id)a3
{
}

- (NSItemProviderDataTransferDelegate)dataTransferDelegate
{
  return (NSItemProviderDataTransferDelegate *)objc_loadWeak((id *)&self->_dataTransferDelegate);
}

- (void)setDataTransferDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (NSItemProviderLoadHandler)previewImageHandler
{
  return self->_previewImageHandler;
}

- (void)setPreviewImageHandler:(NSItemProviderLoadHandler)previewImageHandler
{
  id v3 = self->_previewImageHandler;
  if (v3 != previewImageHandler)
  {

    self->_previewImageHandler = (id)[previewImageHandler copy];
  }
}

- (void)loadPreviewImageWithOptions:(NSDictionary *)options completionHandler:(NSItemProviderCompletionHandler)completionHandler
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  if (!_NSIPGetExpectedClassFromCompletionBlock(completionHandler, &v8, 0))
  {
    uint64_t v7 = _NSOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_181795000, v7, OS_LOG_TYPE_ERROR, "Cannot derive expected value class from a NSItemProvider preview completion handler.", buf, 2u);
    }
  }
  [(NSItemProvider *)self _loadPreviewImageOfClass:v8 options:options coerceForCoding:0 completionHandler:completionHandler];
}

@end