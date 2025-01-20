@interface IMFileCopier
- (BOOL)didErrorOccur;
- (BOOL)inProgress;
- (BOOL)wasCancelled;
- (IMFileCopier)initWithInputURL:(id)a3 outputURL:(id)a4 identifier:(id)a5 operation:(unint64_t)a6 completionBlock:(id)a7 queue:(id)a8;
- (IMFileCopier)initWithInputURL:(id)a3 outputURL:(id)a4 identifier:(id)a5 operation:(unint64_t)a6 delegate:(id)a7;
- (IMFileCopierDelegate)delegate;
- (NSURL)inputURL;
- (NSURL)outputURL;
- (OS_dispatch_queue)_queue;
- (id)_callback;
- (id)_temporaryCopierPath;
- (id)identifier;
- (unint64_t)operation;
- (void)_BOMCopier;
- (void)_fillOutputURLFromInputURL;
- (void)_main_copierFinishedWithResult:(id)a3;
- (void)_worker_doCopy;
- (void)cancel;
- (void)cleanup;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setInProgress:(BOOL)a3;
- (void)setOperation:(unint64_t)a3;
- (void)set_BOMCopier:(void *)a3;
- (void)set_callback:(id)a3;
- (void)set_queue:(id)a3;
- (void)start;
@end

@implementation IMFileCopier

- (IMFileCopier)initWithInputURL:(id)a3 outputURL:(id)a4 identifier:(id)a5 operation:(unint64_t)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (IMFileCopierDelegate *)a7;
  v31.receiver = self;
  v31.super_class = (Class)IMFileCopier;
  v19 = [(IMFileCopier *)&v31 init];
  if (v19)
  {
    uint64_t v20 = objc_msgSend_copy(v12, v16, v17, v18);
    inputURL = v19->_inputURL;
    v19->_inputURL = (NSURL *)v20;

    uint64_t v25 = objc_msgSend_copy(v13, v22, v23, v24);
    outputURL = v19->_outputURL;
    v19->_outputURL = (NSURL *)v25;

    objc_storeStrong(&v19->_identifier, a5);
    if (!v19->_outputURL) {
      objc_msgSend__fillOutputURLFromInputURL(v19, v27, v28, v29);
    }
    v19->_operation = a6;
    v19->_delegate = v15;
  }

  return v19;
}

- (IMFileCopier)initWithInputURL:(id)a3 outputURL:(id)a4 identifier:(id)a5 operation:(unint64_t)a6 completionBlock:(id)a7 queue:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v40.receiver = self;
  v40.super_class = (Class)IMFileCopier;
  v22 = [(IMFileCopier *)&v40 init];
  if (v22)
  {
    uint64_t v23 = objc_msgSend_copy(v14, v19, v20, v21);
    inputURL = v22->_inputURL;
    v22->_inputURL = (NSURL *)v23;

    uint64_t v28 = objc_msgSend_copy(v15, v25, v26, v27);
    outputURL = v22->_outputURL;
    v22->_outputURL = (NSURL *)v28;

    objc_storeStrong(&v22->_identifier, a5);
    if (!v22->_outputURL) {
      objc_msgSend__fillOutputURLFromInputURL(v22, v30, v31, v32);
    }
    v22->_operation = a6;
    uint64_t v33 = objc_msgSend_copy(v17, v30, v31, v32);
    id callback = v22->_callback;
    v22->_id callback = (id)v33;

    if (v18)
    {
      v35 = (OS_dispatch_queue *)v18;
      queue = v22->_queue;
      v22->_queue = v35;
    }
    else
    {
      v37 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v38 = MEMORY[0x1E4F14428];
      queue = v22->_queue;
      v22->_queue = v37;
    }
  }
  return v22;
}

- (void)dealloc
{
  if (self->_BOMCopier)
  {
    if (self->_inProgress)
    {
      if (qword_1E92DB598 != -1) {
        dispatch_once(&qword_1E92DB598, &unk_1EE22FB78);
      }
      off_1E92DB590(self->_BOMCopier);
    }
    if (qword_1E92DAE60 != -1) {
      dispatch_once(&qword_1E92DAE60, &unk_1EE230C38);
    }
    off_1E92DAF40(self->_BOMCopier);
  }
  v3.receiver = self;
  v3.super_class = (Class)IMFileCopier;
  [(IMFileCopier *)&v3 dealloc];
}

- (id)_temporaryCopierPath
{
  v2 = IMTemporaryPath();
  v5 = objc_msgSend_stringByAppendingPathComponent_(v2, v3, @"IMFileCopier", v4);

  return v5;
}

- (void)_fillOutputURLFromInputURL
{
  v5 = objc_msgSend_inputURL(self, a2, v2, v3);
  v9 = objc_msgSend_path(v5, v6, v7, v8);
  id v13 = objc_msgSend_lastPathComponent(v9, v10, v11, v12);

  id v17 = objc_msgSend_invalidCharactersForFileTransferName(MEMORY[0x1E4F28B88], v14, v15, v16);
  objc_msgSend_stringByRemovingCharactersFromSet_(v13, v18, (uint64_t)v17, v19);
  v55 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_length(v55, v20, v21, v22))
  {
    uint64_t v25 = v55;
  }
  else
  {

    uint64_t v25 = @"Archive";
  }
  v56 = v25;
  uint64_t v26 = objc_msgSend_stringByAppendingPathExtension_(v25, v23, @"zip", v24);
  v30 = objc_msgSend__temporaryCopierPath(self, v27, v28, v29);
  uint64_t v34 = objc_msgSend_stringGUID(NSString, v31, v32, v33);
  v37 = objc_msgSend_stringByAppendingPathComponent_(v30, v35, v34, v36);

  v41 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v38, v39, v40);
  LOBYTE(v34) = objc_msgSend_fileExistsAtPath_(v41, v42, (uint64_t)v37, v43);

  if ((v34 & 1) == 0)
  {
    v47 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v44, v45, v46);
    objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v47, v48, (uint64_t)v37, 1, 0, 0);
  }
  v49 = objc_msgSend_stringByAppendingPathComponent_(v37, v44, (uint64_t)v26, v46);

  id v50 = objc_alloc(MEMORY[0x1E4F1CB10]);
  inited = (NSURL *)objc_msgSend_initFileURLWithPath_(v50, v51, (uint64_t)v49, v52);
  outputURL = self->_outputURL;
  self->_outputURL = inited;
}

- (void)start
{
  if (!self->_inProgress)
  {
    v5 = objc_msgSend_delegate(self, a2, v2, v3);
    objc_msgSend_fileCopierDidStart_(v5, v6, (uint64_t)self, v7);

    self->_inProgress = 1;
    uint64_t v8 = MEMORY[0x1E4F29060];
    MEMORY[0x1F4181798](v8, sel_detachNewThreadSelector_toTarget_withObject_, sel__worker_doCopy, self);
  }
}

- (void)cancel
{
  if (!self->_shouldCancel)
  {
    self->_shouldCancel = 1;
    if (self->_BOMCopier)
    {
      if (self->_inProgress)
      {
        if (qword_1E92DB5A8 != -1)
        {
          uint64_t v4 = self;
          dispatch_once(&qword_1E92DB5A8, &unk_1EE2307F8);
          self = v4;
        }
        uint64_t v2 = (void (*)(void *))off_1E92DB5A0;
        BOMCopier = self->_BOMCopier;
        v2(BOMCopier);
      }
    }
  }
}

- (void)cleanup
{
  if (self->_inProgress)
  {
    ((void (*)(IMFileCopier *, char *))MEMORY[0x1F4181798])(self, sel_cancel);
  }
  else
  {
    objc_msgSend_path(self->_outputURL, a2, v2, v3);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = objc_msgSend__temporaryCopierPath(self, v5, v6, v7);
    int hasPrefix = objc_msgSend_hasPrefix_(v17, v9, (uint64_t)v8, v10);

    if (hasPrefix)
    {
      uint64_t v15 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v12, v13, v14);
      objc_msgSend_removeItemAtPath_error_(v15, v16, (uint64_t)v17, 0);
    }
  }
}

- (void)_main_copierFinishedWithResult:(id)a3
{
  char v5 = objc_msgSend_BOOLValue(a3, a2, (uint64_t)a3, v3);
  BOOL shouldCancel = self->_shouldCancel;
  char v10 = v5 ^ 1;
  if (self->_shouldCancel) {
    char v10 = 0;
  }
  self->_didErrorOccur = v10;
  self->_inProgress = 0;
  if (shouldCancel) {
    objc_msgSend_cleanup(self, v6, v7, v8);
  }
  uint64_t v11 = objc_msgSend_delegate(self, v6, v7, v8);
  objc_msgSend_fileCopierDidFinish_(v11, v12, (uint64_t)self, v13);

  if (self->_callback)
  {
    queue = self->_queue;
    if (queue)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1918BCAC8;
      block[3] = &unk_1E5723270;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }
}

- (void)_worker_doCopy
{
  uint64_t v3 = (void *)MEMORY[0x192FDE5A0](self, a2);
  if (qword_1E92DAE58 != -1) {
    dispatch_once(&qword_1E92DAE58, &unk_1EE230898);
  }
  if (qword_1E92DAF08 != -1) {
    dispatch_once(&qword_1E92DAF08, &unk_1EE2308D8);
  }
  if (qword_1E92DAF38 != -1) {
    dispatch_once(&qword_1E92DAF38, &unk_1EE2309D8);
  }
  if (qword_1E92DAF18 != -1) {
    dispatch_once(&qword_1E92DAF18, &unk_1EE230B18);
  }
  if (qword_1E92DAF20 != -1) {
    dispatch_once(&qword_1E92DAF20, &unk_1EE230B78);
  }
  if (qword_1E92DAF30 != -1) {
    dispatch_once(&qword_1E92DAF30, &unk_1EE230CD8);
  }
  if (qword_1E92DAF28 != -1) {
    dispatch_once(&qword_1E92DAF28, &unk_1EE230D58);
  }
  if (qword_1E92DAF10 != -1) {
    dispatch_once(&qword_1E92DAF10, &unk_1EE230D98);
  }
  if (qword_1E92DAF00 != -1) {
    dispatch_once(&qword_1E92DAF00, &unk_1EE230E58);
  }
  uint64_t v4 = (void *)off_1E92DAEC8();
  self->_BOMCopier = v4;
  if (!v4)
  {
    BOOL v13 = 0;
    goto LABEL_30;
  }
  off_1E92DAEF8(v4, self);
  off_1E92DAED0(self->_BOMCopier, sub_1918BD0D4);
  off_1E92DAEF0(self->_BOMCopier, sub_1918BD154);
  off_1E92DAEE8(self->_BOMCopier, sub_1918BD268);
  off_1E92DAED8(self->_BOMCopier, sub_1918BD36C);
  off_1E92DAEE0(self->_BOMCopier, sub_1918BD3FC);
  char v5 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v9 = v5;
  unint64_t operation = self->_operation;
  switch(operation)
  {
    case 0uLL:
      uint64_t v11 = (const void *)*MEMORY[0x1E4F1CFD0];
      CFDictionarySetValue(v5, @"createCPIO", (const void *)*MEMORY[0x1E4F1CFD0]);
      CFDictionarySetValue(v9, @"sequesterResources", v11);
      CFDictionarySetValue(v9, @"createPKZip", v11);
      CFDictionarySetValue(v9, @"keepParent", v11);
      uint64_t v12 = @"copyResources";
      goto LABEL_26;
    case 1uLL:
      uint64_t v14 = (const void *)*MEMORY[0x1E4F1CFD0];
      uint64_t v12 = @"extractPKZip";
      goto LABEL_28;
    case 2uLL:
      uint64_t v11 = (const void *)*MEMORY[0x1E4F1CFD0];
      CFDictionarySetValue(v5, @"createCPIO", (const void *)*MEMORY[0x1E4F1CFD0]);
      CFDictionarySetValue(v9, @"sequesterResources", v11);
      uint64_t v12 = @"createPKZip";
LABEL_26:
      char v5 = v9;
      uint64_t v14 = v11;
LABEL_28:
      CFDictionarySetValue(v5, v12, v14);
      break;
  }
  uint64_t v15 = objc_msgSend_inputURL(self, v6, v7, v8);
  objc_msgSend_path(v15, v16, v17, v18);
  id v19 = objc_claimAutoreleasedReturnValue();
  uint64_t v23 = objc_msgSend_fileSystemRepresentation(v19, v20, v21, v22);

  uint64_t v27 = objc_msgSend_outputURL(self, v24, v25, v26);
  objc_msgSend_path(v27, v28, v29, v30);
  id v31 = objc_claimAutoreleasedReturnValue();
  uint64_t v35 = objc_msgSend_fileSystemRepresentation(v31, v32, v33, v34);

  BOOL v13 = off_1E92DAEB8(self->_BOMCopier, v23, v35, v9) == 0;
  off_1E92DAEF8(self->_BOMCopier, 0);

LABEL_30:
  id v36 = objc_alloc(NSNumber);
  uint64_t v39 = objc_msgSend_initWithBool_(v36, v37, v13, v38);
  objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(self, v40, (uint64_t)sel__main_copierFinishedWithResult_, (uint64_t)v39, 0);
}

- (IMFileCopierDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (IMFileCopierDelegate *)a3;
}

- (NSURL)inputURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSURL)outputURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (id)identifier
{
  return objc_getProperty(self, a2, 40, 1);
}

- (BOOL)wasCancelled
{
  return self->_shouldCancel;
}

- (BOOL)didErrorOccur
{
  return self->_didErrorOccur;
}

- (BOOL)inProgress
{
  return self->_inProgress;
}

- (void)setInProgress:(BOOL)a3
{
  self->_inProgress = a3;
}

- (unint64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(unint64_t)a3
{
  self->_unint64_t operation = a3;
}

- (void)_BOMCopier
{
  return self->_BOMCopier;
}

- (void)set_BOMCopier:(void *)a3
{
  self->_BOMCopier = a3;
}

- (OS_dispatch_queue)_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)set_queue:(id)a3
{
}

- (id)_callback
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)set_callback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_identifier, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_inputURL, 0);
}

@end