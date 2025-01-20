@interface CRKConcreteFileSystemPrimitives
+ (BOOL)isNoSuchFileError:(id)a3;
- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)fileExistsAtURL:(id)a3;
- (BOOL)makeDirectoryAtURL:(id)a3 error:(id *)a4;
- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4;
- (BOOL)setResources:(id)a3 onURL:(id)a4 error:(id *)a5;
- (BOOL)startAccessingBookmarkURL:(id)a3;
- (BOOL)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (CRKConcreteFileSystemPrimitives)init;
- (NSFileManager)fileManager;
- (NSOperationQueue)accessQueue;
- (NSURL)temporaryDirectoryURL;
- (id)URLFromBookmarkData:(id)a3 error:(id *)a4;
- (id)URLsForResourcesWithExtension:(id)a3 inBundle:(id)a4;
- (id)bookmarkDataForURL:(id)a3 error:(id *)a4;
- (id)contentsOfDirectoryAtURL:(id)a3 error:(id *)a4;
- (id)dataWithContentsOfURL:(id)a3 error:(id *)a4;
- (id)dispatchSourceForFileDescriptor:(id)a3 options:(unint64_t)a4;
- (id)emptyDirectoryNode;
- (id)nodeForURL:(id)a3 error:(id *)a4;
- (id)openURL:(id)a3 options:(int)a4 error:(id *)a5;
- (id)promisedResourceValuesForKeys:(id)a3 fromURL:(id)a4 error:(id *)a5;
- (id)resourceValuesForKeys:(id)a3 fromURL:(id)a4 error:(id *)a5;
- (id)resourcesDirectoryURLForBundle:(id)a3;
- (void)coordinateCopyWithActionPairs:(id)a3 completion:(id)a4;
- (void)coordinateMoveWithActionPairs:(id)a3 completion:(id)a4;
- (void)removeCoordinatedItemsAtURLs:(id)a3 completion:(id)a4;
- (void)stopAccessingBookmarkURL:(id)a3;
@end

@implementation CRKConcreteFileSystemPrimitives

- (CRKConcreteFileSystemPrimitives)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRKConcreteFileSystemPrimitives;
  v2 = [(CRKConcreteFileSystemPrimitives *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
    fileManager = v2->_fileManager;
    v2->_fileManager = (NSFileManager *)v3;

    uint64_t v5 = objc_opt_new();
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (NSOperationQueue *)v5;
  }
  return v2;
}

- (NSURL)temporaryDirectoryURL
{
  v2 = NSURL;
  uint64_t v3 = NSTemporaryDirectory();
  v4 = [v2 fileURLWithPath:v3 isDirectory:1];

  return (NSURL *)v4;
}

- (BOOL)fileExistsAtURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRKConcreteFileSystemPrimitives *)self fileManager];
  v6 = [v4 path];

  LOBYTE(v4) = [v5 fileExistsAtPath:v6];
  return (char)v4;
}

- (id)dataWithContentsOfURL:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x263EFF8F8] dataWithContentsOfURL:a3 options:0 error:a4];
}

- (id)contentsOfDirectoryAtURL:(id)a3 error:(id *)a4
{
  uint64_t v5 = (void *)MEMORY[0x263F08850];
  id v6 = a3;
  v7 = [v5 defaultManager];
  objc_super v8 = [v7 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:2 error:a4];

  return v8;
}

- (id)resourceValuesForKeys:(id)a3 fromURL:(id)a4 error:(id *)a5
{
  uint64_t v5 = [a4 resourceValuesForKeys:a3 error:a5];
  if (v5) {
    id v6 = [[CRKURLResources alloc] initWithResources:v5];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)promisedResourceValuesForKeys:(id)a3 fromURL:(id)a4 error:(id *)a5
{
  uint64_t v5 = [a4 promisedItemResourceValuesForKeys:a3 error:a5];
  if (v5) {
    id v6 = [[CRKURLResources alloc] initWithResources:v5];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)openURL:(id)a3 options:(int)a4 error:(id *)a5
{
  id v7 = [a3 path];
  uint64_t v8 = open((const char *)[v7 fileSystemRepresentation], a4);

  if ((v8 & 0x80000000) != 0)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x263F087E8], "crk_errorWithPOSIXCode:", *__error());
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      *a5 = v10;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = [[CRKConcreteFileDescriptor alloc] initWithRawValue:v8];
  }

  return v9;
}

- (id)dispatchSourceForFileDescriptor:(id)a3 options:(unint64_t)a4
{
  int v5 = [a3 rawValue];
  dispatch_source_t v6 = dispatch_source_create(MEMORY[0x263EF8410], v5, a4, MEMORY[0x263EF83A0]);

  return v6;
}

- (BOOL)makeDirectoryAtURL:(id)a3 error:(id *)a4
{
  int v5 = (void *)MEMORY[0x263F08850];
  id v6 = a3;
  id v7 = [v5 defaultManager];
  LOBYTE(a4) = [v7 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:a4];

  return (char)a4;
}

- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4
{
  int v5 = (void *)MEMORY[0x263F08850];
  id v6 = a3;
  id v7 = [v5 defaultManager];
  id v11 = 0;
  char v8 = [v7 removeItemAtURL:v6 error:&v11];

  id v9 = v11;
  if ((v8 & 1) != 0 || ([(id)objc_opt_class() isNoSuchFileError:v9] & 1) == 0)
  {
    if (a4) {
      *a4 = v9;
    }
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7 = (void *)MEMORY[0x263F08850];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 defaultManager];
  LOBYTE(a5) = [v10 moveItemAtURL:v9 toURL:v8 error:a5];

  return (char)a5;
}

- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7 = (void *)MEMORY[0x263F08850];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 defaultManager];
  LOBYTE(a5) = [v10 copyItemAtURL:v9 toURL:v8 error:a5];

  return (char)a5;
}

- (BOOL)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  return [a3 writeToURL:a4 options:a5 error:a6];
}

- (BOOL)setResources:(id)a3 onURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = [a3 underlyingResources];
  LOBYTE(a5) = [v7 setResourceValues:v8 error:a5];

  return (char)a5;
}

- (void)coordinateMoveWithActionPairs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x263F08830]) initWithFilePresenter:0];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __76__CRKConcreteFileSystemPrimitives_coordinateMoveWithActionPairs_completion___block_invoke;
  v25[3] = &unk_2646F34B0;
  id v26 = v7;
  id v9 = v7;
  id v10 = (void *)MEMORY[0x22A620AF0](v25);
  id v11 = objc_msgSend(v6, "crk_mapUsingBlock:", &__block_literal_global_64);
  v12 = objc_msgSend(v6, "crk_mapUsingBlock:", &__block_literal_global_12_2);
  v13 = [v11 arrayByAddingObjectsFromArray:v12];
  v14 = [(CRKConcreteFileSystemPrimitives *)self accessQueue];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __76__CRKConcreteFileSystemPrimitives_coordinateMoveWithActionPairs_completion___block_invoke_5;
  v19[3] = &unk_2646F4C50;
  id v23 = v6;
  id v24 = v10;
  id v20 = v11;
  id v21 = v12;
  v22 = self;
  id v15 = v6;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [v8 coordinateAccessWithIntents:v13 queue:v14 byAccessor:v19];
}

void __76__CRKConcreteFileSystemPrimitives_coordinateMoveWithActionPairs_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__CRKConcreteFileSystemPrimitives_coordinateMoveWithActionPairs_completion___block_invoke_2;
  v6[3] = &unk_2646F3488;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __76__CRKConcreteFileSystemPrimitives_coordinateMoveWithActionPairs_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

id __76__CRKConcreteFileSystemPrimitives_coordinateMoveWithActionPairs_completion___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08820];
  id v3 = [a2 sourceURL];
  id v4 = [v2 writingIntentWithURL:v3 options:2];

  return v4;
}

id __76__CRKConcreteFileSystemPrimitives_coordinateMoveWithActionPairs_completion___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08820];
  id v3 = [a2 destinationURL];
  id v4 = [v2 writingIntentWithURL:v3 options:8];

  return v4;
}

void __76__CRKConcreteFileSystemPrimitives_coordinateMoveWithActionPairs_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  v20[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
  else
  {
    id v4 = objc_opt_new();
    if ([*(id *)(a1 + 32) count])
    {
      unint64_t v5 = 0;
      do
      {
        id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v5];
        id v7 = [v6 URL];

        id v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v5];
        id v9 = [v8 URL];

        id v10 = *(void **)(a1 + 48);
        id v18 = 0;
        char v11 = [v10 moveItemAtURL:v7 toURL:v9 error:&v18];
        id v12 = v18;
        if ((v11 & 1) == 0)
        {
          v13 = [*(id *)(a1 + 56) objectAtIndexedSubscript:v5];
          v14 = [v13 sourceURL];

          [v4 setObject:v12 forKeyedSubscript:v14];
        }

        ++v5;
      }
      while (v5 < [*(id *)(a1 + 32) count]);
    }
    if ([v4 count])
    {
      v19 = @"CRKPartialErrorsByItemIdentifier";
      id v15 = (void *)[v4 copy];
      v20[0] = v15;
      id v16 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      id v17 = CRKErrorWithCodeAndUserInfo(29, v16);

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
}

- (void)coordinateCopyWithActionPairs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x263F08830]) initWithFilePresenter:0];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __76__CRKConcreteFileSystemPrimitives_coordinateCopyWithActionPairs_completion___block_invoke;
  v25[3] = &unk_2646F34B0;
  id v26 = v7;
  id v9 = v7;
  id v10 = (void *)MEMORY[0x22A620AF0](v25);
  char v11 = objc_msgSend(v6, "crk_mapUsingBlock:", &__block_literal_global_17);
  id v12 = objc_msgSend(v6, "crk_mapUsingBlock:", &__block_literal_global_19);
  v13 = [v11 arrayByAddingObjectsFromArray:v12];
  v14 = [(CRKConcreteFileSystemPrimitives *)self accessQueue];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __76__CRKConcreteFileSystemPrimitives_coordinateCopyWithActionPairs_completion___block_invoke_5;
  v19[3] = &unk_2646F4C50;
  id v23 = v6;
  id v24 = v10;
  id v20 = v11;
  id v21 = v12;
  v22 = self;
  id v15 = v6;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [v8 coordinateAccessWithIntents:v13 queue:v14 byAccessor:v19];
}

void __76__CRKConcreteFileSystemPrimitives_coordinateCopyWithActionPairs_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__CRKConcreteFileSystemPrimitives_coordinateCopyWithActionPairs_completion___block_invoke_2;
  v6[3] = &unk_2646F3488;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __76__CRKConcreteFileSystemPrimitives_coordinateCopyWithActionPairs_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

id __76__CRKConcreteFileSystemPrimitives_coordinateCopyWithActionPairs_completion___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08820];
  id v3 = [a2 sourceURL];
  id v4 = [v2 readingIntentWithURL:v3 options:1];

  return v4;
}

id __76__CRKConcreteFileSystemPrimitives_coordinateCopyWithActionPairs_completion___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08820];
  id v3 = [a2 destinationURL];
  id v4 = [v2 writingIntentWithURL:v3 options:8];

  return v4;
}

void __76__CRKConcreteFileSystemPrimitives_coordinateCopyWithActionPairs_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  v20[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
  else
  {
    id v4 = objc_opt_new();
    if ([*(id *)(a1 + 32) count])
    {
      unint64_t v5 = 0;
      do
      {
        id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v5];
        id v7 = [v6 URL];

        id v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v5];
        id v9 = [v8 URL];

        id v10 = *(void **)(a1 + 48);
        id v18 = 0;
        char v11 = [v10 copyItemAtURL:v7 toURL:v9 error:&v18];
        id v12 = v18;
        if ((v11 & 1) == 0)
        {
          v13 = [*(id *)(a1 + 56) objectAtIndexedSubscript:v5];
          v14 = [v13 sourceURL];

          [v4 setObject:v12 forKeyedSubscript:v14];
        }

        ++v5;
      }
      while (v5 < [*(id *)(a1 + 32) count]);
    }
    if ([v4 count])
    {
      v19 = @"CRKPartialErrorsByItemIdentifier";
      id v15 = (void *)[v4 copy];
      v20[0] = v15;
      id v16 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      id v17 = CRKErrorWithCodeAndUserInfo(29, v16);

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
}

- (void)removeCoordinatedItemsAtURLs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x263F08830];
  id v8 = a3;
  id v9 = (void *)[[v7 alloc] initWithFilePresenter:0];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  void v20[2] = __75__CRKConcreteFileSystemPrimitives_removeCoordinatedItemsAtURLs_completion___block_invoke;
  v20[3] = &unk_2646F34B0;
  id v21 = v6;
  id v10 = v6;
  char v11 = (void *)MEMORY[0x22A620AF0](v20);
  id v12 = objc_msgSend(v8, "crk_mapUsingBlock:", &__block_literal_global_22_0);

  v13 = [(CRKConcreteFileSystemPrimitives *)self accessQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __75__CRKConcreteFileSystemPrimitives_removeCoordinatedItemsAtURLs_completion___block_invoke_4;
  v16[3] = &unk_2646F3F10;
  id v18 = self;
  id v19 = v11;
  id v17 = v12;
  id v14 = v12;
  id v15 = v11;
  [v9 coordinateAccessWithIntents:v14 queue:v13 byAccessor:v16];
}

void __75__CRKConcreteFileSystemPrimitives_removeCoordinatedItemsAtURLs_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __75__CRKConcreteFileSystemPrimitives_removeCoordinatedItemsAtURLs_completion___block_invoke_2;
  v6[3] = &unk_2646F3488;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __75__CRKConcreteFileSystemPrimitives_removeCoordinatedItemsAtURLs_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __75__CRKConcreteFileSystemPrimitives_removeCoordinatedItemsAtURLs_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F08820] writingIntentWithURL:a2 options:1];
}

void __75__CRKConcreteFileSystemPrimitives_removeCoordinatedItemsAtURLs_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    id v4 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) URL];
          char v11 = *(void **)(a1 + 40);
          id v17 = 0;
          char v12 = [v11 removeItemAtURL:v10 error:&v17];
          id v13 = v17;
          if ((v12 & 1) == 0) {
            [v4 setObject:v13 forKeyedSubscript:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v7);
    }

    if ([v4 count])
    {
      v22 = @"CRKPartialErrorsByItemIdentifier";
      id v14 = (void *)[v4 copy];
      id v23 = v14;
      id v15 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      id v16 = CRKErrorWithCodeAndUserInfo(29, v15);

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (id)nodeForURL:(id)a3 error:(id *)a4
{
  id v5 = (objc_class *)MEMORY[0x263F08870];
  id v6 = a3;
  uint64_t v7 = (void *)[[v5 alloc] initWithURL:v6 options:0 error:a4];

  if (v7) {
    uint64_t v8 = [[CRKFileWrapperBackedFileSystemNode alloc] initWithFileWrapper:v7];
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)emptyDirectoryNode
{
  id v2 = objc_alloc(MEMORY[0x263F08870]);
  id v3 = (void *)[v2 initDirectoryWithFileWrappers:MEMORY[0x263EFFA78]];
  id v4 = [[CRKFileWrapperBackedFileSystemNode alloc] initWithFileWrapper:v3];

  return v4;
}

- (id)bookmarkDataForURL:(id)a3 error:(id *)a4
{
  return (id)[a3 bookmarkDataWithOptions:512 includingResourceValuesForKeys:MEMORY[0x263EFFA68] relativeToURL:0 error:a4];
}

- (id)URLFromBookmarkData:(id)a3 error:(id *)a4
{
  return (id)[NSURL URLByResolvingBookmarkData:a3 options:256 relativeToURL:0 bookmarkDataIsStale:0 error:a4];
}

- (BOOL)startAccessingBookmarkURL:(id)a3
{
  return [a3 startAccessingSecurityScopedResource];
}

- (void)stopAccessingBookmarkURL:(id)a3
{
}

- (id)resourcesDirectoryURLForBundle:(id)a3
{
  return (id)[a3 resourceURL];
}

- (id)URLsForResourcesWithExtension:(id)a3 inBundle:(id)a4
{
  return (id)[a4 URLsForResourcesWithExtension:a3 subdirectory:0];
}

+ (BOOL)isNoSuchFileError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x263F07F70]]) {
    BOOL v5 = [v3 code] == 4;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (NSOperationQueue)accessQueue
{
  return self->_accessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_fileManager, 0);
}

@end