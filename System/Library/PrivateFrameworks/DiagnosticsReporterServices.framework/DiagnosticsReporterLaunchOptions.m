@interface DiagnosticsReporterLaunchOptions
- (NSArray)files_to_attach;
- (NSString)log_path;
- (NSString)panic_string;
- (void)setFiles_to_attach:(id)a3;
- (void)setLog_path:(id)a3;
- (void)setPanic_string:(id)a3;
@end

@implementation DiagnosticsReporterLaunchOptions

- (NSArray)files_to_attach
{
  return self->_files_to_attach;
}

- (void)setFiles_to_attach:(id)a3
{
}

- (NSString)log_path
{
  return self->_log_path;
}

- (void)setLog_path:(id)a3
{
}

- (NSString)panic_string
{
  return self->_panic_string;
}

- (void)setPanic_string:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panic_string, 0);
  objc_storeStrong((id *)&self->_log_path, 0);

  objc_storeStrong((id *)&self->_files_to_attach, 0);
}

@end