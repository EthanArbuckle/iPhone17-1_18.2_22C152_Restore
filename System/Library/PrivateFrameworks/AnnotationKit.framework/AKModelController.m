@interface AKModelController
- (AKModelController)init;
- (BOOL)populateFromArchivedPageModelControllers:(id)a3;
- (NSArray)pageModelControllers;
- (id)allSelectedAnnotations;
- (id)archivedPageModelControllers;
- (id)pageModelControllerForAnnotation:(id)a3;
- (id)pageModelControllerForPage:(unint64_t)a3;
- (void)deleteAllSelectedAnnotations;
- (void)deselectAllAnnotations;
- (void)insertObject:(id)a3 inPageModelControllersAtIndex:(unint64_t)a4;
- (void)insertPageModelControllers:(id)a3 atIndexes:(id)a4;
- (void)removeObjectFromPageModelControllersAtIndex:(unint64_t)a3;
- (void)removePageModelControllersAtIndexes:(id)a3;
- (void)replaceObjectInPageModelControllersAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)replacePageModelControllersAtIndexes:(id)a3 withPageModelControllers:(id)a4;
@end

@implementation AKModelController

- (AKModelController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKModelController;
  v2 = [(AKModelController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[AKSparseMutableControllerArray array];
    mutablePageModelControllers = v2->_mutablePageModelControllers;
    v2->_mutablePageModelControllers = (AKSparseMutableControllerArray *)v3;
  }
  return v2;
}

- (NSArray)pageModelControllers
{
  return (NSArray *)self->_mutablePageModelControllers;
}

- (void)insertObject:(id)a3 inPageModelControllersAtIndex:(unint64_t)a4
{
}

- (void)insertPageModelControllers:(id)a3 atIndexes:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(AKSparseMutableControllerArray *)self->_mutablePageModelControllers containsObject:v6])
  {
    uint64_t v8 = [v7 firstIndex];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          -[AKModelController insertObject:inPageModelControllersAtIndex:](self, "insertObject:inPageModelControllersAtIndex:", *(void *)(*((void *)&v14 + 1) + 8 * v13), v8, (void)v14);
          uint64_t v8 = [v7 indexGreaterThanIndex:v8];
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
  else
  {
    [(AKSparseMutableControllerArray *)self->_mutablePageModelControllers insertObjects:v6 atIndexes:v7];
  }
}

- (void)removeObjectFromPageModelControllersAtIndex:(unint64_t)a3
{
}

- (void)removePageModelControllersAtIndexes:(id)a3
{
}

- (void)replaceObjectInPageModelControllersAtIndex:(unint64_t)a3 withObject:(id)a4
{
}

- (void)replacePageModelControllersAtIndexes:(id)a3 withPageModelControllers:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(AKSparseMutableControllerArray *)self->_mutablePageModelControllers containsObject:v7])
  {
    uint64_t v8 = [v6 firstIndex];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          -[AKModelController replaceObjectInPageModelControllersAtIndex:withObject:](self, "replaceObjectInPageModelControllersAtIndex:withObject:", v8, *(void *)(*((void *)&v14 + 1) + 8 * v13), (void)v14);
          uint64_t v8 = [v6 indexGreaterThanIndex:v8];
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
  else
  {
    [(AKSparseMutableControllerArray *)self->_mutablePageModelControllers replaceObjectsAtIndexes:v6 withObjects:v7];
  }
}

- (id)pageModelControllerForPage:(unint64_t)a3
{
  v4 = [(AKModelController *)self pageModelControllers];
  v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (id)pageModelControllerForAnnotation:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(AKModelController *)self pageModelControllers];
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 containsAnnotation:v4])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)allSelectedAnnotations
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(AKModelController *)self pageModelControllers];
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v9 = [v8 annotations];
        uint64_t v10 = [v8 selectedAnnotations];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = sub_237679118;
        v16[3] = &unk_264CDB678;
        id v17 = v10;
        id v11 = v10;
        long long v12 = [v9 indexesOfObjectsPassingTest:v16];
        long long v13 = [v9 objectsAtIndexes:v12];
        [v3 addObjectsFromArray:v13];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void)deleteAllSelectedAnnotations
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [(AKModelController *)self pageModelControllers];
  uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v7 = [v6 annotations];
        uint64_t v8 = [v6 selectedAnnotations];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = sub_2376792E8;
        v13[3] = &unk_264CDB678;
        id v14 = v8;
        id v9 = v8;
        uint64_t v10 = [v7 indexesOfObjectsPassingTest:v13];
        id v11 = [v6 mutableArrayValueForKey:@"annotations"];
        [v11 removeObjectsAtIndexes:v10];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
}

- (void)deselectAllAnnotations
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = [(AKModelController *)self pageModelControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v8 = [v7 selectedAnnotations];
        uint64_t v9 = [v8 count];

        if (v9)
        {
          uint64_t v10 = [v7 mutableSetValueForKey:@"selectedAnnotations"];
          id v11 = [MEMORY[0x263EFFA08] set];
          [v10 setSet:v11];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

- (id)archivedPageModelControllers
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v4 = [(AKModelController *)self pageModelControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v23 + 1) + 8 * i) archivableRepresentation];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];
  id v11 = +[AKSecureSerializationHelper dataForSecureCodingCompliantObject:v10 withOptionalKey:qword_268923978];
  size_t v12 = [v11 length];
  long long v13 = (uint8_t *)malloc_type_calloc(v12, 1uLL, 0x100004077774924uLL);
  if (v13)
  {
    long long v14 = v13;
    id v11 = v11;
    size_t v15 = compression_encode_buffer(v14, v12, (const uint8_t *)[v11 bytes], v12, 0, COMPRESSION_LZMA);
    if (v15)
    {
      long long v16 = [MEMORY[0x263EFF8F8] dataWithBytes:v14 length:v15];
      v27[0] = qword_268923988;
      v27[1] = qword_268923990;
      v28[0] = v16;
      uint64_t v17 = [NSNumber numberWithUnsignedInteger:v12];
      v28[1] = v17;
      long long v18 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

      long long v19 = +[AKSecureSerializationHelper dataForSecureCodingCompliantObject:v18 withOptionalKey:qword_268923980];
      unint64_t v20 = [v19 length];
      if (v20 < [v11 length])
      {
        id v21 = v19;

        id v11 = v21;
      }
    }
    free(v14);
  }

  return v11;
}

- (BOOL)populateFromArchivedPageModelControllers:(id)a3
{
  v33[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x237E1DFC0]();
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v4 error:0];
  uint64_t v7 = v6;
  if (v6
    && (([v6 containsValueForKey:qword_268923980] & 1) != 0
     || ([v7 containsValueForKey:qword_268923978] & 1) != 0))
  {
    unint64_t v8 = 0x264CDA000uLL;
    unint64_t v9 = 0x263EFF000uLL;
    uint64_t v10 = v4;
    if (![v7 containsValueForKey:qword_268923980])
    {
LABEL_25:
      [v7 finishDecoding];

      if (v10)
      {
        id v21 = *(void **)(v8 + 1432);
        v32[0] = objc_opt_class();
        v32[1] = objc_opt_class();
        v32[2] = objc_opt_class();
        v22 = [*(id *)(v9 + 2240) arrayWithObjects:v32 count:3];
        long long v23 = [v21 secureCodingCompliantObjectForData:v10 ofClasses:v22 withOptionalKey:qword_268923978];

        if (v23)
        {
          long long v24 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v23, "count"));
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          v30[2] = sub_237679B98;
          v30[3] = &unk_264CDB228;
          id v31 = v24;
          id v25 = v24;
          [v23 enumerateObjectsUsingBlock:v30];
          long long v26 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v25, "count"));
          [(AKModelController *)self insertPageModelControllers:v25 atIndexes:v26];
        }
      }
      BOOL v20 = 1;
      goto LABEL_30;
    }
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v33[2] = objc_opt_class();
    v33[3] = objc_opt_class();
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
    size_t v12 = +[AKSecureSerializationHelper secureCodingCompliantObjectForData:v4 ofClasses:v11 withOptionalKey:qword_268923980];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v13 = 0;
      uint64_t v10 = 0;
      unint64_t v9 = 0x263EFF000;
      unint64_t v8 = 0x264CDA000;
LABEL_24:

      goto LABEL_25;
    }
    id v13 = [v12 objectForKeyedSubscript:qword_268923988];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v13 = 0;
    }
    unint64_t v8 = 0x264CDA000uLL;
    long long v14 = [v12 objectForKeyedSubscript:qword_268923990];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      size_t v15 = [v14 unsignedIntegerValue];

      uint64_t v10 = 0;
      if (!v13 || !v15) {
        goto LABEL_23;
      }
      size_t v16 = [v13 length];
      id v13 = v13;
      src_buffer = (uint8_t *)[v13 bytes];
      uint64_t v17 = (uint8_t *)malloc_type_calloc(v15, 1uLL, 0xF547F5F6uLL);
      if (v17)
      {
        v28 = v17;
        size_t v18 = compression_decode_buffer(v17, v15, src_buffer, v16, 0, COMPRESSION_LZMA);
        if (v18 && v18 == v15)
        {
          uint64_t v10 = [MEMORY[0x263EFF8F8] dataWithBytes:v28 length:v15];
        }
        else
        {
          NSLog(&cfstr_SDecompressing.isa, "-[AKModelController populateFromArchivedPageModelControllers:]", v16, v15, v18);
          uint64_t v10 = 0;
        }
        free(v28);
        goto LABEL_23;
      }
    }
    else
    {
    }
    uint64_t v10 = 0;
LABEL_23:
    unint64_t v9 = 0x263EFF000uLL;
    goto LABEL_24;
  }
  [v7 finishDecoding];

  long long v19 = os_log_create("com.apple.annotationkit", "Serialization");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_2376DA2E0(v19);
  }

  BOOL v20 = 0;
  uint64_t v10 = v4;
LABEL_30:

  return v20;
}

- (void).cxx_destruct
{
}

@end