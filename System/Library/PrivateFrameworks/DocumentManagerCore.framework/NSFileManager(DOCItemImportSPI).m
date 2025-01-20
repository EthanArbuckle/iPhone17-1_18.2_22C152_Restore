@interface NSFileManager(DOCItemImportSPI)
- (id)_doc_importItemAtURL:()DOCItemImportSPI toDestination:error:;
- (uint64_t)_doc_destinationLocationExists:()DOCItemImportSPI;
@end

@implementation NSFileManager(DOCItemImportSPI)

- (id)_doc_importItemAtURL:()DOCItemImportSPI toDestination:error:
{
  id v9 = a3;
  if (!v9)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"DOCDownloadImportManager.m", 196, @"Invalid parameter not satisfying: %@", @"srcURL" object file lineNumber description];
  }
  if ((unint64_t)(a4 - 1) > 1)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"DOCDownloadImportManager.m", 207, @"Unexpected _DOCFileDestination %ld", a4);
    v11 = 0;
  }
  else
  {
    v10 = objc_opt_new();
    v11 = [v10 _moveItemAtURL:v9 toNamedLocation:a4 error:a5];
  }

  return v11;
}

- (uint64_t)_doc_destinationLocationExists:()DOCItemImportSPI
{
  if ((unint64_t)(a3 - 1) > 1)
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"DOCDownloadImportManager.m", 222, @"Unexpected _DOCFileDestination %ld", a3);
    uint64_t v5 = 0;
  }
  else
  {
    v4 = objc_opt_new();
    uint64_t v5 = objc_msgSend(v4, "_doc_destinationLocationExists:", a3);
  }

  return v5;
}

@end