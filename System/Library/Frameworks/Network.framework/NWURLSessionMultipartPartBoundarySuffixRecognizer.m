@interface NWURLSessionMultipartPartBoundarySuffixRecognizer
- (NWURLSessionMultipartPartBoundarySuffixRecognizer)init;
- (void)dealloc;
@end

@implementation NWURLSessionMultipartPartBoundarySuffixRecognizer

- (void)dealloc
{
  if (self)
  {
    buffer = self->_buffer;
    if (buffer)
    {
      free(buffer);
      self->_buffer = 0;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NWURLSessionMultipartPartBoundarySuffixRecognizer;
  [(NWURLSessionMultipartPartBoundarySuffixRecognizer *)&v4 dealloc];
}

- (NWURLSessionMultipartPartBoundarySuffixRecognizer)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NWURLSessionMultipartPartBoundarySuffixRecognizer;
  v2 = [(NWURLSessionMultipartPartBoundarySuffixRecognizer *)&v8 init];
  v3 = v2;
  if (!v2) {
    return v3;
  }
  v2->_nextState = 4;
  v2->_bytesConsumed = 0;
  objc_super v4 = (char *)malloc_type_malloc(2uLL, 0xF2B69DE5uLL);
  if (v4)
  {
LABEL_3:
    v3->_buffer = v4;
    v3->_count = 0;
    return v3;
  }
  v6 = __nwlog_obj();
  os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  int v9 = 136446466;
  v10 = "strict_malloc";
  __int16 v11 = 2048;
  uint64_t v12 = 2;
  v7 = (void *)_os_log_send_and_compose_impl();

  result = (NWURLSessionMultipartPartBoundarySuffixRecognizer *)__nwlog_abort((uint64_t)v7);
  if (!result)
  {
    free(v7);
    goto LABEL_3;
  }
  __break(1u);
  return result;
}

@end