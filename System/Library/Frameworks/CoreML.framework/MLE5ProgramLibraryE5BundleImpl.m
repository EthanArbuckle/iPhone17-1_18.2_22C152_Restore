@interface MLE5ProgramLibraryE5BundleImpl
- (MLE5ProgramLibraryE5BundleImpl)initWithE5BundleAtURL:(id)a3 configuration:(id)a4;
- (MLModelConfiguration)configuration;
- (NSString)modelDisplayName;
- (NSString)serializedMILText;
- (NSURL)e5BundleURL;
- (e5rt_program_library)createProgramLibraryHandleWithRespecialization:(BOOL)a3 error:(id *)a4;
@end

@implementation MLE5ProgramLibraryE5BundleImpl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_e5BundleURL, 0);
}

- (MLModelConfiguration)configuration
{
  return self->_configuration;
}

- (NSURL)e5BundleURL
{
  return self->_e5BundleURL;
}

- (NSString)serializedMILText
{
  return 0;
}

- (NSString)modelDisplayName
{
  v2 = [(MLE5ProgramLibraryE5BundleImpl *)self configuration];
  v3 = [v2 modelDisplayName];

  return (NSString *)v3;
}

- (e5rt_program_library)createProgramLibraryHandleWithRespecialization:(BOOL)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = [(MLE5ProgramLibraryE5BundleImpl *)self e5BundleURL];
  uint64_t v6 = [v5 fileSystemRepresentation];

  uint64_t v7 = e5rt_program_library_create();
  if (!v7) {
    return 0;
  }
  v8 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t last_error_message = e5rt_get_last_error_message();
    __int16 v13 = 1024;
    int v14 = v7;
    _os_log_error_impl(&dword_19E58B000, v8, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
  }

  if (a4)
  {
    v9 = +[MLModelErrorUtils genericErrorWithFormat:@"E5RT: %s (%d)", e5rt_get_last_error_message(), v7];
    *a4 = +[MLModelErrorUtils errorWithCode:3, v9, @"Unable to load a specialized model at %s", v6 underlyingError format];
  }
  return 0;
}

- (MLE5ProgramLibraryE5BundleImpl)initWithE5BundleAtURL:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MLE5ProgramLibraryE5BundleImpl;
  v9 = [(MLE5ProgramLibraryE5BundleImpl *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_e5BundleURL, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
  }

  return v10;
}

@end