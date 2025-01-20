void sub_3C40(id a1)
{
  dword_8190 = [(id)MGCopyAnswerWithError() hash];
}

uint64_t CPSharedResourcesDirectory()
{
  return _CPSharedResourcesDirectory();
}

uint64_t MGCopyAnswerWithError()
{
  return _MGCopyAnswerWithError();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_imageCount(void *a1, const char *a2, ...)
{
  return [a1 imageCount];
}

id objc_msgSend_purge(void *a1, const char *a2, ...)
{
  return [a1 purge];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}
8190];
    self->_store = result;
  }
  return result;
}

- (float)estimatedDuration
{
  unsigned int v3 = [(CPBitmapStore *)[(KeyboardUIMigrator *)self store] version];
  if (qword_8188 != -1) {
    dispatch_once(&qword_8188, &stru_4070);
  }
  if (v3 == dword_8190) {
    return 0.012;
  }
  float v5 = (double)(unint64_t)[(CPBitmapStore *)[(KeyboardUIMigrator *)self store] imageCount]
     * 0.2;
  return v5 + 0.012;
}

- (BOOL)performMigration
{
  unsigned int v3 = [(CPBitmapStore *)[(KeyboardUIMigrator *)self store] version];
  if (qword_8188 != -1) {
    dispatch_once(&qword_8188, &stru_4070);
  }
  if (v3 != dword_8190) {
    [(CPBitmapStore *)[(KeyboardUIMigrator *)self store] purge];
  }
  return 1;
}

- (id)dataClassName
{
  return @"KeyboardUIMigrator";
}

@end