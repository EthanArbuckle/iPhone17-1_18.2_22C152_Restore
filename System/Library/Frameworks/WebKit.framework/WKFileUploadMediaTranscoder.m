@interface WKFileUploadMediaTranscoder
- (WKFileUploadMediaTranscoder)initWithItems:(id)a3 videoCount:(unint64_t)a4 completionHandler:(void *)a5;
- (id).cxx_construct;
- (id)_temporaryDirectoryCreateIfNecessary;
- (uint64_t)_processItemAtIndex:;
- (void)_dismissProgress;
- (void)_finishedProcessing;
- (void)_processItemAtIndex:;
- (void)_processItemAtIndex:(unint64_t)a3;
- (void)_updateProgress:(id)a3;
- (void)start;
@end

@implementation WKFileUploadMediaTranscoder

- (WKFileUploadMediaTranscoder)initWithItems:(id)a3 videoCount:(unint64_t)a4 completionHandler:(void *)a5
{
  v13.receiver = self;
  v13.super_class = (Class)WKFileUploadMediaTranscoder;
  v8 = [(WKFileUploadMediaTranscoder *)&v13 init];
  if (v8)
  {
    if (a3) {
      CFRetain(a3);
    }
    m_ptr = v8->_items.m_ptr;
    v8->_items.m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    v8->_processedVideoCount = 0;
    v10 = *(void **)a5;
    *(void *)a5 = 0;
    value = v8->_completionHandler.m_callableWrapper.__ptr_.__value_;
    v8->_completionHandler.m_callableWrapper.__ptr_.__value_ = v10;
    v8->_videoCount = a4;
    if (value) {
      (*(void (**)(void *))(*(void *)value + 8))(value);
    }
  }
  return v8;
}

- (void)start
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[3] cancelExport];
    [v2 _dismissProgress];
    CFRelease(v2);
  }
}

- (void)_processItemAtIndex:(unint64_t)a3
{
  if ([self->_progressController.m_ptr isCancelled]) {
    return;
  }
  if ([self->_items.m_ptr count] > a3)
  {
    v5 = (void *)[self->_items.m_ptr objectAtIndex:a3];
    if ([v5 isVideo])
    {
LABEL_7:
      id v6 = [(WKFileUploadMediaTranscoder *)self _temporaryDirectoryCreateIfNecessary];
      if (v6)
      {
        v7 = v6;
        v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "fileURL"), "lastPathComponent"), "stringByDeletingPathExtension");
        uint64_t v9 = objc_msgSend(v7, "stringByAppendingPathComponent:", objc_msgSend(v8, "stringByAppendingPathExtension:", objc_msgSend((id)objc_msgSend((id)*MEMORY[0x1E4F44490], "preferredFilenameExtension"), "uppercaseString")));
        uint64_t v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9 isDirectory:0];
        v11 = (const void *)objc_msgSend(objc_alloc((Class)((uint64_t (*)(void))*MEMORY[0x1E4FB6290])()), "initWithURL:options:", objc_msgSend(v5, "fileURL"), 0);
        id v12 = objc_alloc((Class)((uint64_t (*)(void))*MEMORY[0x1E4FB6360])());
        objc_super v13 = (void *)[v12 initWithAsset:v11 presetName:PAL::get_AVFoundation_AVAssetExportPresetHighestQuality((PAL *)v12)];
        m_ptr = self->_exportSession.m_ptr;
        self->_exportSession.m_ptr = v13;
        if (m_ptr)
        {
          CFRelease(m_ptr);
          objc_super v13 = self->_exportSession.m_ptr;
        }
        objc_msgSend(self->_exportSession.m_ptr, "setOutputFileType:", PAL::get_AVFoundation_AVFileTypeQuickTimeMovie((PAL *)objc_msgSend(v13, "setOutputURL:", v10)));
        v15 = self->_exportSession.m_ptr;
        id v17 = 0;
        objc_initWeak(&v17, self);
        unint64_t v18 = a3;
        id to = 0;
        objc_moveWeak(&to, &v17);
        unint64_t v20 = v18;
        v16 = malloc_type_malloc(0x30uLL, 0x10E00401A191054uLL);
        *(void *)v16 = MEMORY[0x1E4F14398];
        *((void *)v16 + 1) = 50331650;
        *((void *)v16 + 2) = WTF::BlockPtr<void ()(void)>::fromCallable<-[WKFileUploadMediaTranscoder _processItemAtIndex:]::$_4>(-[WKFileUploadMediaTranscoder _processItemAtIndex:]::$_4)::{lambda(void *)#1}::__invoke;
        *((void *)v16 + 3) = &WTF::BlockPtr<void ()(void)>::fromCallable<-[WKFileUploadMediaTranscoder _processItemAtIndex:]::$_4>(-[WKFileUploadMediaTranscoder _processItemAtIndex:]::$_4)::descriptor;
        *((void *)v16 + 4) = 0;
        objc_moveWeak((id *)v16 + 4, &to);
        *((void *)v16 + 5) = v20;
        objc_destroyWeak(&to);
        [v15 exportAsynchronouslyWithCompletionHandler:v16];
        _Block_release(v16);
        objc_destroyWeak(&v17);
        if (v11) {
          CFRelease(v11);
        }
        return;
      }
    }
    else
    {
      while (++a3 != [self->_items.m_ptr count])
      {
        v5 = (void *)[self->_items.m_ptr objectAtIndex:a3];
        if ([v5 isVideo]) {
          goto LABEL_7;
        }
      }
    }
  }

  [(WKFileUploadMediaTranscoder *)self _finishedProcessing];
}

- (void)_finishedProcessing
{
  [(WKFileUploadMediaTranscoder *)self _dismissProgress];
  value = self->_completionHandler.m_callableWrapper.__ptr_.__value_;
  self->_completionHandler.m_callableWrapper.__ptr_.__value_ = 0;
  if (value)
  {
    (*(void (**)(void *, void *))(*(void *)value + 16))(value, self->_items.m_ptr);
    v4 = *(void (**)(void *))(*(void *)value + 8);
    v4(value);
  }
}

- (void)_dismissProgress
{
  [self->_progressTimer.m_ptr invalidate];
  m_ptr = self->_progressController.m_ptr;

  [m_ptr hideAnimated:0 allowDelay:0];
}

- (void)_updateProgress:(id)a3
{
  objc_msgSend(self->_exportSession.m_ptr, "progress", a3);
  m_ptr = self->_progressController.m_ptr;
  double v6 = (float)((float)(v5 + (float)self->_processedVideoCount) / (float)self->_videoCount);

  [m_ptr setFractionCompleted:v6];
}

- (id)_temporaryDirectoryCreateIfNecessary
{
  if (self->_temporaryDirectoryPath.m_ptr)
  {
    char v8 = 0;
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:isDirectory:", self->_temporaryDirectoryPath.m_ptr, &v8)&& v8 != 0)
    {
      return self->_temporaryDirectoryPath.m_ptr;
    }
  }
  TemporaryDirectory = (void *)WTF::FileSystemImpl::createTemporaryDirectory((WTF::FileSystemImpl *)@"WKVideoUpload", (NSString *)a2);
  float v5 = TemporaryDirectory;
  if (TemporaryDirectory) {
    CFRetain(TemporaryDirectory);
  }
  m_ptr = self->_temporaryDirectoryPath.m_ptr;
  self->_temporaryDirectoryPath.m_ptr = v5;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    return self->_temporaryDirectoryPath.m_ptr;
  }
  return v5;
}

- (void).cxx_destruct
{
  value = self->_completionHandler.m_callableWrapper.__ptr_.__value_;
  self->_completionHandler.m_callableWrapper.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void *, SEL))(*(void *)value + 8))(value, a2);
  }
  m_ptr = self->_temporaryDirectoryPath.m_ptr;
  self->_temporaryDirectoryPath.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  float v5 = self->_items.m_ptr;
  self->_items.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  double v6 = self->_exportSession.m_ptr;
  self->_exportSession.m_ptr = 0;
  if (v6) {
    CFRelease(v6);
  }
  v7 = self->_progressController.m_ptr;
  self->_progressController.m_ptr = 0;
  if (v7) {
    CFRelease(v7);
  }
  char v8 = self->_progressTimer.m_ptr;
  self->_progressTimer.m_ptr = 0;
  if (v8)
  {
    CFRelease(v8);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void)_processItemAtIndex:
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 8));
  if (!WeakRetained) {
    return;
  }
  v3 = WeakRetained;
  uint64_t v4 = [WeakRetained[3] status];
  if (v4 == 3)
  {
    objc_msgSend((id)objc_msgSend(v3[4], "objectAtIndex:", *(void *)(a1 + 16)), "setFileURL:", objc_msgSend(v3[3], "outputURL"));
LABEL_7:
    id v5 = v3[3];
    v3[3] = 0;
    if (v5) {
      CFRelease(v5);
    }
    v3[8] = (char *)v3[8] + 1;
    [v3 _processItemAtIndex:*(void *)(a1 + 16) + 1];
    goto LABEL_10;
  }
  if (v4 != 5) {
    goto LABEL_7;
  }
LABEL_10:

  CFRelease(v3);
}

- (uint64_t)_processItemAtIndex:
{
  *a1 = &unk_1EE9D4DB0;
  objc_destroyWeak(a1 + 1);

  return WTF::fastFree((WTF *)a1, v2);
}

@end