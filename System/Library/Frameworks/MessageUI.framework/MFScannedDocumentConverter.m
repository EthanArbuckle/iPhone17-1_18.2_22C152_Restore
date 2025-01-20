@interface MFScannedDocumentConverter
+ (OS_os_log)log;
- (MFScannedDocumentConverter)init;
- (id)_pdfConverterFromScannedDocument:(id)a3;
- (id)pdfDocumentFromScannedDocument:(id)a3;
@end

@implementation MFScannedDocumentConverter

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__MFScannedDocumentConverter_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_11 != -1) {
    dispatch_once(&log_onceToken_11, block);
  }
  v2 = (void *)log_log_11;

  return (OS_os_log *)v2;
}

void __33__MFScannedDocumentConverter_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.messageui", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_11;
  log_log_11 = (uint64_t)v1;
}

- (MFScannedDocumentConverter)init
{
  v7.receiver = self;
  v7.super_class = (Class)MFScannedDocumentConverter;
  v2 = [(MFScannedDocumentConverter *)&v7 init];
  if (v2)
  {
    id v3 = dispatch_get_global_queue(25, 0);
    dispatch_queue_t v4 = dispatch_queue_create_with_target_V2("com.apple.messageui.scannedDocumentConverter", 0, v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (id)pdfDocumentFromScannedDocument:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F60E18] promise];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MFScannedDocumentConverter_pdfDocumentFromScannedDocument___block_invoke;
  block[3] = &unk_1E5F79770;
  block[4] = self;
  id v7 = v4;
  id v13 = v7;
  id v8 = v5;
  id v14 = v8;
  dispatch_async(queue, block);
  v9 = [v8 future];
  v10 = [v9 map:&__block_literal_global_32];

  return v10;
}

void __61__MFScannedDocumentConverter_pdfDocumentFromScannedDocument___block_invoke(id *a1)
{
  id v4 = [a1[4] _pdfConverterFromScannedDocument:a1[5]];
  unint64_t v2 = [v4 pageCount];
  if (v2 >= [a1[5] pageCount])
  {
    [a1[6] finishWithResult:v4];
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MFScannedDocumentErrorDomain" code:10 userInfo:0];
    [a1[6] finishWithError:v3];
  }
}

id __61__MFScannedDocumentConverter_pdfDocumentFromScannedDocument___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 dataRepresentation];

  return v2;
}

- (id)_pdfConverterFromScannedDocument:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F38DA0]);
  for (unint64_t i = 0; i < [v3 pageCount]; ++i)
  {
    v6 = [v3 imageOfPageAtIndex:i];
    if (v6)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F38DB0]) initWithImage:v6];
      objc_msgSend(v4, "insertPage:atIndex:", v7, objc_msgSend(v4, "pageCount"));
    }
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end