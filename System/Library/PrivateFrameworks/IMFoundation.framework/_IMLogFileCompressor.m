@interface _IMLogFileCompressor
+ (id)sharedInstance;
- (_IMLogFileCompressor)init;
- (void)compressPath:(id)a3 toPath:(id)a4;
- (void)fileCopierDidFinish:(id)a3;
@end

@implementation _IMLogFileCompressor

+ (id)sharedInstance
{
  if (qword_1EB273D00 != -1) {
    dispatch_once(&qword_1EB273D00, &unk_1EE22FCD8);
  }
  v2 = (void *)qword_1EB273C60;
  return v2;
}

- (_IMLogFileCompressor)init
{
  v6.receiver = self;
  v6.super_class = (Class)_IMLogFileCompressor;
  v2 = [(_IMLogFileCompressor *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    archivers = v2->_archivers;
    v2->_archivers = v3;
  }
  return v2;
}

- (void)compressPath:(id)a3 toPath:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    v8 = [IMFileCopier alloc];
    v11 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v9, (uint64_t)v7, v10);
    v14 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v12, (uint64_t)v6, v13);

    id v21 = (id)objc_msgSend_initWithInputURL_outputURL_identifier_operation_delegate_(v8, v15, (uint64_t)v11, (uint64_t)v14, v7, 2, self);
    objc_msgSend_addObject_(self->_archivers, v16, (uint64_t)v21, v17);
    objc_msgSend_start(v21, v18, v19, v20);
  }
}

- (void)fileCopierDidFinish:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28CB8];
  id v18 = a3;
  v8 = objc_msgSend_defaultManager(v4, v5, v6, v7);
  v12 = objc_msgSend_identifier(v18, v9, v10, v11);
  objc_msgSend_removeItemAtPath_error_(v8, v13, (uint64_t)v12, 0);

  objc_msgSend_setDelegate_(v18, v14, 0, v15);
  objc_msgSend_removeObject_(self->_archivers, v16, (uint64_t)v18, v17);
}

- (void).cxx_destruct
{
}

@end