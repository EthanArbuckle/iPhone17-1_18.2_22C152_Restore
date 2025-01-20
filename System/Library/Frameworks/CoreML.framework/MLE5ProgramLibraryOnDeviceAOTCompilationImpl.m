@interface MLE5ProgramLibraryOnDeviceAOTCompilationImpl
- (MLE5ProgramLibraryOnDeviceAOTCompilationImpl)initWithIRProgram:(void *)a3 container:(id)a4 configuration:(id)a5 deallocator:(id)a6;
- (MLE5ProgramLibraryOnDeviceAOTCompilationImpl)initWithMILTextAtURL:(id)a3 container:(id)a4 configuration:(id)a5;
- (MLE5ProgramLibraryOnDeviceAOTCompilationImpl)initWithMILTextAtURL:(id)a3 irProgram:(void *)a4 deallocator:(id)a5 container:(id)a6 configuration:(id)a7;
- (MLModelConfiguration)configuration;
- (MLProgramE5Container)container;
- (NSString)modelDisplayName;
- (NSString)serializedMILText;
- (e5rt_program_library)createProgramLibraryHandleWithRespecialization:(BOOL)a3 error:(id *)a4;
- (id).cxx_construct;
- (uint64_t)initWithMILTextAtURL:(uint64_t)a1 irProgram:(uint64_t)a2 deallocator:container:configuration:;
- (void)dealloc;
- (void)initWithMILTextAtURL:(std::__shared_weak_count *)a1 irProgram:deallocator:container:configuration:;
- (void)setSerializedMILText:(id)a3;
@end

@implementation MLE5ProgramLibraryOnDeviceAOTCompilationImpl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedMILText, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_deallocator, 0);
  cntrl = self->_irProgram.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }

  objc_storeStrong((id *)&self->_milTextURL, 0);
}

- (NSString)modelDisplayName
{
  v2 = [(MLE5ProgramLibraryOnDeviceAOTCompilationImpl *)self configuration];
  v3 = [v2 modelDisplayName];

  return (NSString *)v3;
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (e5rt_program_library)createProgramLibraryHandleWithRespecialization:(BOOL)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  __p[0] = 0;
  uint64_t v5 = e5rt_e5_compiler_create();
  if (v5)
  {
    v6 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      buf[0] = 136315394;
      *(void *)&buf[1] = e5rt_get_last_error_message();
      __int16 v12 = 1024;
      int v13 = v5;
      _os_log_error_impl(&dword_19E58B000, v6, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", (uint8_t *)buf, 0x12u);
    }

    if (a4)
    {
      v7 = +[MLModelErrorUtils genericErrorWithFormat:@"E5RT: %s (%d)", e5rt_get_last_error_message(), v5];
      *a4 = +[MLModelErrorUtils errorWithCode:0 underlyingError:v7 format:@"Unable to create the model specializer. It can be a system level issues such as out-of-memory and file I/O errors "];
    }
    v9 = 0;
  }
  else
  {
    v9 = __p[0];
  }
  std::unique_ptr<e5rt_e5_compiler,MLE5ObjectDeleter<e5rt_e5_compiler>>::reset[abi:ne180100]((uint64_t *)&v9);
  kdebug_trace();
  return 0;
}

- (MLModelConfiguration)configuration
{
  return self->_configuration;
}

- (MLProgramE5Container)container
{
  return self->_container;
}

- (void)setSerializedMILText:(id)a3
{
}

- (NSString)serializedMILText
{
  return self->_serializedMILText;
}

- (void)dealloc
{
  deallocator = (void (**)(id, IRProgram *))self->_deallocator;
  if (deallocator) {
    deallocator[2](deallocator, self->_irProgram.__ptr_);
  }
  v4.receiver = self;
  v4.super_class = (Class)MLE5ProgramLibraryOnDeviceAOTCompilationImpl;
  [(MLE5ProgramLibraryOnDeviceAOTCompilationImpl *)&v4 dealloc];
}

- (MLE5ProgramLibraryOnDeviceAOTCompilationImpl)initWithMILTextAtURL:(id)a3 irProgram:(void *)a4 deallocator:(id)a5 container:(id)a6 configuration:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)MLE5ProgramLibraryOnDeviceAOTCompilationImpl;
  v17 = [(MLE5ProgramLibraryOnDeviceAOTCompilationImpl *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_milTextURL, a3);
    if (a4) {
      operator new();
    }
    objc_storeStrong((id *)&v18->_container, a6);
    objc_storeStrong((id *)&v18->_configuration, a7);
  }

  return v18;
}

- (MLE5ProgramLibraryOnDeviceAOTCompilationImpl)initWithMILTextAtURL:(id)a3 container:(id)a4 configuration:(id)a5
{
  return [(MLE5ProgramLibraryOnDeviceAOTCompilationImpl *)self initWithMILTextAtURL:a3 irProgram:0 deallocator:0 container:a4 configuration:a5];
}

- (MLE5ProgramLibraryOnDeviceAOTCompilationImpl)initWithIRProgram:(void *)a3 container:(id)a4 configuration:(id)a5 deallocator:(id)a6
{
  return [(MLE5ProgramLibraryOnDeviceAOTCompilationImpl *)self initWithMILTextAtURL:0 irProgram:a3 deallocator:a6 container:a4 configuration:a5];
}

- (uint64_t)initWithMILTextAtURL:(uint64_t)a1 irProgram:(uint64_t)a2 deallocator:container:configuration:
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"Z115-[MLE5ProgramLibraryOnDeviceAOTCompilationImpl initWithMILTextAtURL:irProgram:deallocator:container:configuration:]E3$_0"))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

- (void)initWithMILTextAtURL:(std::__shared_weak_count *)a1 irProgram:deallocator:container:configuration:
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x19F3C1920);
}

@end