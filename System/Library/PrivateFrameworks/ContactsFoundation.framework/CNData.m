@interface CNData
+ (id)dataWithContentsOfFileURL:(id)a3;
+ (id)dataWithContentsOfURL:(id)a3;
+ (id)dataWithContentsOfURL:(id)a3 sessionFactory:(id)a4;
+ (id)observableWithContentsOfURL:(id)a3;
+ (id)observableWithContentsOfURL:(id)a3 sessionFactory:(id)a4;
+ (id)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5;
+ (id)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5 fileManager:(id)a6;
+ (unint64_t)NSDataWritingOptionsFromCNDataWritingOptions:(unint64_t)a3;
- (CNData)dataWithContentsOfURL:(id)a3;
- (CNData)init;
- (CNData)initWithFileManager:(id)a3;
- (CNData)initWithFileManager:(id)a3 urlSessionFactory:(id)a4;
- (CNFileManager)fileManager;
- (CNURLSessionFactory)sessionFactory;
- (id)observableWithContentsOfURL:(id)a3;
- (id)synchronousDataWithContentsOfURL:(id)a3;
- (id)synchronousDataWithContentsOfURL:(id)a3 timeout:(double)a4;
- (id)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5;
@end

@implementation CNData

- (CNData)init
{
  v3 = objc_alloc_init(CNFileManager);
  v4 = [(CNData *)self initWithFileManager:v3];

  return v4;
}

- (CNData)initWithFileManager:(id)a3
{
  id v4 = a3;
  v5 = +[CNURLSessionFactory defaultFactory];
  v6 = [(CNData *)self initWithFileManager:v4 urlSessionFactory:v5];

  return v6;
}

- (CNData)initWithFileManager:(id)a3 urlSessionFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNData;
  v9 = [(CNData *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileManager, a3);
    objc_storeStrong((id *)&v10->_sessionFactory, a4);
    v11 = v10;
  }

  return v10;
}

+ (id)dataWithContentsOfURL:(id)a3
{
  id v4 = a3;
  v5 = +[CNURLSessionFactory defaultFactory];
  v6 = [a1 dataWithContentsOfURL:v4 sessionFactory:v5];

  return v6;
}

+ (id)dataWithContentsOfFileURL:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__CNData_dataWithContentsOfFileURL___block_invoke;
  v7[3] = &unk_1E569FB38;
  id v8 = v3;
  id v4 = v3;
  v5 = +[CNFuture futureWithBlock:v7];

  return v5;
}

uint64_t __36__CNData_dataWithContentsOfFileURL___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:*(void *)(a1 + 32) options:0 error:a2];
}

+ (id)dataWithContentsOfURL:(id)a3 sessionFactory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isFileURL])
  {
    id v8 = [a1 dataWithContentsOfFileURL:v6];
  }
  else
  {
    v9 = objc_alloc_init(CNPromise);
    v10 = [v7 defaultSessionConfiguration];
    v11 = [v7 sessionWithConfiguration:v10 delegate:0 delegateQueue:0];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __47__CNData_dataWithContentsOfURL_sessionFactory___block_invoke;
    v28[3] = &unk_1E569FB60;
    v29 = v9;
    v12 = v9;
    objc_super v13 = [v11 dataTaskWithURL:v6 completionHandler:v28];
    [v13 resume];
    v14 = [(CNPromise *)v12 future];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __47__CNData_dataWithContentsOfURL_sessionFactory___block_invoke_2;
    v25[3] = &unk_1E569FB88;
    id v26 = v13;
    id v15 = v11;
    id v27 = v15;
    id v16 = v13;
    [v14 addFailureBlock:v25];

    v17 = [(CNPromise *)v12 future];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __47__CNData_dataWithContentsOfURL_sessionFactory___block_invoke_3;
    v23 = &unk_1E569FBB0;
    id v24 = v15;
    id v18 = v15;
    [v17 addSuccessBlock:&v20];

    id v8 = [(CNPromise *)v12 future];
  }

  return v8;
}

void __47__CNData_dataWithContentsOfURL_sessionFactory___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    [*(id *)(a1 + 32) finishWithError:a4];
  }
  else
  {
    objc_opt_class();
    id v9 = v8;
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;

    if (v11 && (uint64_t v12 = [v11 statusCode], v12 >= 400))
    {
      uint64_t v13 = v12;
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F281F8];
      v20[0] = @"status code";
      id v16 = [NSNumber numberWithInteger:v12];
      v20[1] = @"description";
      v21[0] = v16;
      v17 = [MEMORY[0x1E4F28D20] localizedStringForStatusCode:v13];
      v21[1] = v17;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
      v19 = [v14 errorWithDomain:v15 code:256 userInfo:v18];

      [*(id *)(a1 + 32) finishWithError:v19];
    }
    else
    {
      [*(id *)(a1 + 32) finishWithResult:v7];
    }
  }
}

uint64_t __47__CNData_dataWithContentsOfURL_sessionFactory___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (+[CNFoundationError isCanceledError:a2]) {
    [*(id *)(a1 + 32) cancel];
  }
  id v3 = *(void **)(a1 + 40);

  return [v3 invalidateAndCancel];
}

uint64_t __47__CNData_dataWithContentsOfURL_sessionFactory___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateAndCancel];
}

- (id)synchronousDataWithContentsOfURL:(id)a3
{
  id v3 = [(CNData *)self dataWithContentsOfURL:a3];
  id v4 = +[CNResult resultWithFuture:v3];

  return v4;
}

- (id)synchronousDataWithContentsOfURL:(id)a3 timeout:(double)a4
{
  v5 = [(CNData *)self dataWithContentsOfURL:a3];
  id v6 = +[CNResult resultWithFuture:v5 timeout:a4];

  return v6;
}

- (CNData)dataWithContentsOfURL:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  id v6 = [(CNData *)self sessionFactory];
  id v7 = [v5 dataWithContentsOfURL:v4 sessionFactory:v6];

  return (CNData *)v7;
}

+ (id)observableWithContentsOfURL:(id)a3
{
  id v4 = a3;
  v5 = +[CNURLSessionFactory defaultFactory];
  id v6 = [a1 observableWithContentsOfURL:v4 sessionFactory:v5];

  return v6;
}

+ (id)observableWithContentsOfURL:(id)a3 sessionFactory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__2;
  v17[4] = __Block_byref_object_dispose__2;
  id v18 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__CNData_observableWithContentsOfURL_sessionFactory___block_invoke;
  v13[3] = &unk_1E569FC00;
  id v7 = v6;
  id v14 = v7;
  id v16 = v17;
  id v8 = v5;
  id v15 = v8;
  id v9 = +[CNObservable observableWithBlock:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__CNData_observableWithContentsOfURL_sessionFactory___block_invoke_5;
  v12[3] = &unk_1E569FC28;
  v12[4] = v17;
  v10 = [v9 doOnTerminate:v12];

  _Block_object_dispose(v17, 8);

  return v10;
}

id __53__CNData_observableWithContentsOfURL_sessionFactory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(_CNDataURLSessionTaskAdapter);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __53__CNData_observableWithContentsOfURL_sessionFactory___block_invoke_2;
  v19[3] = &unk_1E569FBB0;
  id v5 = v3;
  id v20 = v5;
  [(_CNDataURLSessionTaskAdapter *)v4 setOnDataReceived:v19];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __53__CNData_observableWithContentsOfURL_sessionFactory___block_invoke_3;
  v17[3] = &unk_1E569FBD8;
  id v18 = v5;
  id v6 = v5;
  [(_CNDataURLSessionTaskAdapter *)v4 setOnCompletion:v17];
  id v7 = [*(id *)(a1 + 32) defaultSessionConfiguration];
  uint64_t v8 = [*(id *)(a1 + 32) sessionWithConfiguration:v7 delegate:v4 delegateQueue:0];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) dataTaskWithURL:*(void *)(a1 + 40)];
  [v11 resume];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__CNData_observableWithContentsOfURL_sessionFactory___block_invoke_4;
  v15[3] = &unk_1E569F9D8;
  id v16 = v11;
  id v12 = v11;
  uint64_t v13 = +[CNCancelationToken tokenWithCancelationBlock:v15];

  return v13;
}

uint64_t __53__CNData_observableWithContentsOfURL_sessionFactory___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidReceiveResult:a2];
}

uint64_t __53__CNData_observableWithContentsOfURL_sessionFactory___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 observerDidFailWithError:a2];
  }
  else {
    return [v2 observerDidComplete];
  }
}

uint64_t __53__CNData_observableWithContentsOfURL_sessionFactory___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

uint64_t __53__CNData_observableWithContentsOfURL_sessionFactory___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) invalidateAndCancel];
}

- (id)observableWithContentsOfURL:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(CNData *)self sessionFactory];
  id v7 = [v5 observableWithContentsOfURL:v4 sessionFactory:v6];

  return v7;
}

+ (id)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(CNFileManager);
  id v11 = [a1 writeData:v9 toURL:v8 options:a5 fileManager:v10];

  return v11;
}

+ (id)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5 fileManager:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = v12;
  if (a5)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __46__CNData_writeData_toURL_options_fileManager___block_invoke;
    v24[3] = &unk_1E569FC50;
    id v25 = v12;
    id v26 = v11;
    id v14 = +[CNFuture futureWithBlock:v24];
  }
  else
  {
    id v14 = +[CNFuture futureWithResult:v11];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __46__CNData_writeData_toURL_options_fileManager___block_invoke_2;
  v19[3] = &unk_1E569FCA0;
  id v22 = a1;
  unint64_t v23 = a5;
  id v20 = v10;
  id v21 = v11;
  id v15 = v11;
  id v16 = v10;
  v17 = [v14 flatMap:v19];

  return v17;
}

id __46__CNData_writeData_toURL_options_fileManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) URLByDeletingLastPathComponent];
  id v5 = [v3 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0];

  id v6 = [v5 value];
  id v7 = [v5 error];
  id v8 = v6;
  id v9 = v8;
  if (a2 && !v8) {
    *a2 = v7;
  }

  return v9;
}

id __46__CNData_writeData_toURL_options_fileManager___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__CNData_writeData_toURL_options_fileManager___block_invoke_3;
  v5[3] = &unk_1E569FC78;
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = v2;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v3 = +[CNFuture futureWithBlock:v5];

  return v3;
}

id __46__CNData_writeData_toURL_options_fileManager___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (objc_msgSend(*(id *)(a1 + 32), "writeToURL:options:error:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "NSDataWritingOptionsFromCNDataWritingOptions:", *(void *)(a1 + 56)), a2))id v3 = *(void **)(a1 + 40); {
  else
  }
    id v3 = 0;

  return v3;
}

+ (unint64_t)NSDataWritingOptionsFromCNDataWritingOptions:(unint64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__CNData_NSDataWritingOptionsFromCNDataWritingOptions___block_invoke;
  v6[3] = &unk_1E569FCC8;
  v6[4] = &v7;
  v6[5] = a3;
  id v3 = (void (**)(void *, uint64_t, uint64_t))_Block_copy(v6);
  v3[2](v3, 1024, 1);
  v3[2](v3, 2048, 2);
  v3[2](v3, 4096, 0x10000000);
  v3[2](v3, 0x2000, 0x20000000);
  v3[2](v3, 0x4000, 805306368);
  v3[2](v3, 0x8000, 0x40000000);
  unint64_t v4 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __55__CNData_NSDataWritingOptionsFromCNDataWritingOptions___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if ((a2 & ~*(void *)(result + 40)) == 0) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) |= a3;
  }
  return result;
}

- (id)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_opt_class();
  id v11 = [(CNData *)self fileManager];
  id v12 = [v10 writeData:v9 toURL:v8 options:a5 fileManager:v11];

  return v12;
}

- (CNFileManager)fileManager
{
  return self->_fileManager;
}

- (CNURLSessionFactory)sessionFactory
{
  return self->_sessionFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionFactory, 0);

  objc_storeStrong((id *)&self->_fileManager, 0);
}

@end