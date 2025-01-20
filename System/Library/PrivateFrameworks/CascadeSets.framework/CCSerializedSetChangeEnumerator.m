@interface CCSerializedSetChangeEnumerator
- (BOOL)beginWithBookmark:(id)a3 error:(id *)a4;
- (BOOL)hasNext;
- (BOOL)isBookmarkUpToDate:(id)a3;
- (BOOL)reset:(id *)a3;
- (CCSerializedSetChangeEnumerator)initWithSetMessage:(id)a3;
- (id)_nextWithError:(id *)a3;
- (id)itemInstanceCount:(id *)a3;
- (id)next;
- (id)nextBookmark;
- (id)sharedItemCount:(id *)a3;
- (void)next;
@end

@implementation CCSerializedSetChangeEnumerator

- (CCSerializedSetChangeEnumerator)initWithSetMessage:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCSerializedSetChangeEnumerator;
  v6 = [(CCSerializedSetChangeEnumerator *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_setMessage, a3);
    uint64_t v8 = [(CCSerializedSetMessage *)v7->_setMessage items];
    items = v7->_items;
    v7->_items = (NSArray *)v8;
  }
  return v7;
}

- (BOOL)beginWithBookmark:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v8 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v18 = *MEMORY[0x263F08320];
      v9 = NSString;
      v10 = (objc_class *)objc_opt_class();
      objc_super v11 = NSStringFromClass(v10);
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      v14 = [v9 stringWithFormat:@"The provided bookmark was of class %@, but we expected %@", v11, v13];
      v19[0] = v14;
      v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
      v16 = (void *)[v8 initWithDomain:@"com.apple.CascadeSets.Set" code:2 userInfo:v15];
      CCSetError(a4, v16);

      BOOL v7 = 0;
      goto LABEL_7;
    }
    self->_index = [v6 unsignedIntegerValue];
  }
  else
  {
    self->_index = 0;
  }
  BOOL v7 = 1;
LABEL_7:

  return v7;
}

- (BOOL)reset:(id *)a3
{
  self->_index = 0;
  return 1;
}

- (BOOL)hasNext
{
  unint64_t index = self->_index;
  return index < [(NSArray *)self->_items count];
}

- (id)_nextWithError:(id *)a3
{
  v4 = self;
  uint64_t v56 = *MEMORY[0x263EF8340];
  if ([(CCSerializedSetChangeEnumerator *)self hasNext])
  {
    items = v4->_items;
    ++v4->_index;
    id v6 = -[NSArray objectAtIndexedSubscript:](items, "objectAtIndexedSubscript:");
    unint64_t v7 = 0x265279000uLL;
    unsigned __int16 v8 = [(CCSerializedSetMessage *)v4->_setMessage itemType];
    v9 = [v6 sharedItem];
    v10 = [v9 content];
    objc_super v11 = +[CCItemMessage contentMessageForItemType:v8 data:v10 error:a3];

    if (*a3)
    {
      v12 = 0;
    }
    else
    {
      v46 = a3;
      v13 = [CCSharedItem alloc];
      v14 = NSNumber;
      v15 = [v6 sharedItem];
      v16 = objc_msgSend(v14, "numberWithLongLong:", objc_msgSend(v15, "sharedIdentifier"));
      v47 = [(CCSharedItem *)v13 initWithSharedIdentifier:v16 content:v11];

      v17 = objc_opt_new();
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      v42 = v6;
      uint64_t v18 = [v6 localInstances];
      uint64_t v45 = [v18 countByEnumeratingWithState:&v51 objects:v55 count:16];
      if (v45)
      {
        id obj = v18;
        uint64_t v44 = *(void *)v52;
        while (2)
        {
          for (uint64_t i = 0; i != v45; ++i)
          {
            v20 = v11;
            if (*(void *)v52 != v44) {
              objc_enumerationMutation(obj);
            }
            v21 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            unint64_t v22 = v7;
            v23 = *(void **)(v7 + 2584);
            unsigned __int16 v24 = [(CCSerializedSetMessage *)v4->_setMessage itemType];
            v25 = [v21 metaContent];
            id v26 = [v23 metaContentMessageForItemType:v24 data:v25 error:v46];

            if (*v46)
            {
              v12 = 0;
              objc_super v11 = v20;
              v40 = v47;
              id v6 = v42;
              id v38 = obj;
              goto LABEL_15;
            }
            v27 = [CCItemInstance alloc];
            v28 = [(CCSharedItem *)v47 sharedIdentifier];
            v29 = v4;
            v30 = v17;
            v31 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v21, "instanceIdentifier"));
            objc_super v11 = v20;
            v32 = [(CCItemInstance *)v27 initWithSharedIdentifier:v28 instanceIdentifier:v31 content:v20 metaContent:v26];

            v17 = v30;
            v4 = v29;

            [v17 addObject:v32];
            unint64_t v7 = v22;
          }
          uint64_t v18 = obj;
          uint64_t v45 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
          if (v45) {
            continue;
          }
          break;
        }
      }

      v33 = objc_opt_new();
      [(CCSerializedSetMessage *)v4->_setMessage devices];
      v35 = v34 = v17;
      id v6 = v42;
      v36 = [v42 deviceIndexes];
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __50__CCSerializedSetChangeEnumerator__nextWithError___block_invoke;
      v48[3] = &unk_265279CC0;
      id v49 = v35;
      id v50 = v33;
      id v26 = v33;
      id v37 = v35;
      v17 = v34;
      id v38 = v37;
      [v36 enumerateUInt32ValuesWithBlock:v48];

      v39 = [CCSetChange alloc];
      v40 = v47;
      v12 = -[CCSetChange initWithSharedItem:sharedItemChangeType:allDevices:addedDevices:removedDevices:allLocalInstances:addedLocalInstances:removedLocalInstances:](v39, "initWithSharedItem:sharedItemChangeType:allDevices:addedDevices:removedDevices:allLocalInstances:addedLocalInstances:removedLocalInstances:", v47, 0, v26, v26, v17, MEMORY[0x263EFFA68]);

LABEL_15:
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __50__CCSerializedSetChangeEnumerator__nextWithError___block_invoke(uint64_t a1, unsigned int a2)
{
  id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  v3 = [CCDevice alloc];
  v4 = [v6 deviceIdentifier];
  id v5 = -[CCDevice initWithIdentifier:options:](v3, "initWithIdentifier:options:", v4, [v6 options]);

  [*(id *)(a1 + 40) addObject:v5];
}

- (id)next
{
  id v6 = 0;
  v2 = [(CCSerializedSetChangeEnumerator *)self _nextWithError:&v6];
  id v3 = v6;
  if (v3)
  {
    v4 = __biome_log_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(CCSerializedSetChangeEnumerator *)(uint64_t)v3 next];
    }
  }

  return v2;
}

- (id)nextBookmark
{
  return (id)[NSNumber numberWithUnsignedInteger:self->_index];
}

- (id)sharedItemCount:(id *)a3
{
  id v3 = NSNumber;
  uint64_t v4 = [(CCSerializedSetMessage *)self->_setMessage sharedItemCount];

  return (id)[v3 numberWithUnsignedInt:v4];
}

- (id)itemInstanceCount:(id *)a3
{
  id v3 = NSNumber;
  uint64_t v4 = [(CCSerializedSetMessage *)self->_setMessage localItemInstanceCount];

  return (id)[v3 numberWithUnsignedInt:v4];
}

- (BOOL)isBookmarkUpToDate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 unsignedIntegerValue];
    BOOL v6 = v5 == [(NSArray *)self->_items count];
  }
  else
  {
    unint64_t v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CCSerializedSetChangeEnumerator isBookmarkUpToDate:]((uint64_t)v4, v7);
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_setMessage, 0);
}

- (void)next
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_249B92000, a2, OS_LOG_TYPE_ERROR, "Error enumerating serialized set change: %@", (uint8_t *)&v2, 0xCu);
}

- (void)isBookmarkUpToDate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  BOOL v6 = v4;
  _os_log_error_impl(&dword_249B92000, a2, OS_LOG_TYPE_ERROR, "Unexpected bookmark class: %@", (uint8_t *)&v5, 0xCu);
}

@end