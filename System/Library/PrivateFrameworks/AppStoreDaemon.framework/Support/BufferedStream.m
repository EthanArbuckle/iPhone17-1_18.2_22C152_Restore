@interface BufferedStream
- (void)dealloc;
@end

@implementation BufferedStream

- (void)dealloc
{
  if (self->_fd)
  {
    v3 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "(BufferedStream) Cleaning up mapped file", buf, 2u);
    }

    munmap(self->_buffer, self->_bufferLength);
    self->_buffer = 0;
    ftruncate(self->_fd, 0);
    close(self->_fd);
    if (unlink([(NSString *)self->_path fileSystemRepresentation]))
    {
      v4 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v6 = *__error();
        *(_DWORD *)buf = 67109120;
        int v9 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "(BufferedStream) Unable to unlink buffer file: %{darwin.errno}d", buf, 8u);
      }
    }
  }
  if (self->_buffer)
  {
    v5 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "(BufferedStream) Freeing memory buffer", buf, 2u);
    }

    free(self->_buffer);
    self->_buffer = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)BufferedStream;
  [(BufferedStream *)&v7 dealloc];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_streamReader);
  objc_destroyWeak((id *)&self->_streamWriter);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end