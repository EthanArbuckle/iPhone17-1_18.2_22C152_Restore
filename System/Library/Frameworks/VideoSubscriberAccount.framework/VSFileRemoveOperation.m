@interface VSFileRemoveOperation
- (NSError)error;
- (NSURL)fileURL;
- (void)executionDidBegin;
- (void)setError:(id)a3;
- (void)setFileURL:(id)a3;
@end

@implementation VSFileRemoveOperation

- (void)executionDidBegin
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Error removing item: %@", (uint8_t *)&v2, 0xCu);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end