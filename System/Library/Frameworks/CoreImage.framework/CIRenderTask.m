@interface CIRenderTask
+ (CIRenderTask)rendertaskWithInternalTask:(void *)a3;
- (CIRenderInfo)waitUntilCompletedAndReturnError:(NSError *)error;
- (CIRenderTask)init;
- (CIRenderTask)initWithInternalTask:(void *)a3;
- (id)_pdfDataRepresentation;
- (void)dealloc;
- (void)init;
- (void)internalRepresentation;
@end

@implementation CIRenderTask

- (CIRenderTask)initWithInternalTask:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CIRenderTask;
  v4 = [(CIRenderTask *)&v6 init];
  if (v4) {
    v4->_priv = (void *)CI::Object::ref((uint64_t)a3);
  }
  return v4;
}

- (void)internalRepresentation
{
  return self->_priv;
}

- (void)dealloc
{
  priv = (CI::Object *)self->_priv;
  if (priv)
  {
    CI::Object::unref(priv);
    self->_priv = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CIRenderTask;
  [(CIRenderTask *)&v4 dealloc];
}

- (CIRenderInfo)waitUntilCompletedAndReturnError:(NSError *)error
{
  v21[2] = *MEMORY[0x1E4F143B8];
  priv = self->_priv;
  if (priv[16])
  {
    if (error) {
      *error = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CIRenderTaskWaitUntilCompleted" code:1 userInfo:&unk_1EE4AB248];
    }
    v5 = ci_logger_api();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CIRenderTask waitUntilCompletedAndReturnError:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
    return 0;
  }
  uint64_t v14 = (*(uint64_t (**)(void, SEL))(*(void *)priv[3] + 272))(priv[3], a2);
  CFTypeRef v15 = CI::RenderTask::waitUntilCompleted((uint64_t)priv, v14);
  if (v15)
  {
    v16 = (void *)v15;
    if (error)
    {
      uint64_t v17 = *MEMORY[0x1E4F28A50];
      v20[0] = @"CINonLocalizedDescriptionKey";
      v20[1] = v17;
      v21[0] = @"Unexpected error in the backing renderer.";
      v21[1] = v15;
      *error = (NSError *)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CIRenderTaskWaitUntilCompleted", 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
    }
    v18 = ci_logger_api();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CIRenderTask waitUntilCompletedAndReturnError:](v16);
    }

    return 0;
  }

  return +[CIRenderInfo renderInfoWithCompletedTask:self];
}

- (CIRenderTask)init
{
  v3 = ci_logger_api();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    [(CIRenderTask *)v3 init];
  }

  return 0;
}

+ (CIRenderTask)rendertaskWithInternalTask:(void *)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithInternalTask:a3];

  return (CIRenderTask *)v3;
}

- (id)_pdfDataRepresentation
{
  v2 = (void *)CI::RenderTask::quicklookDataForRenderTask((CI::RenderTask *)self->_priv);

  return v2;
}

- (void)init
{
}

- (void)waitUntilCompletedAndReturnError:(void *)a1 .cold.1(void *a1)
{
  [a1 description];
  OUTLINED_FUNCTION_1_0(&dword_193671000, v1, v2, "%{public}s Unexpected error in the backing renderer: %{public}@.", v3, v4, v5, v6, 2u);
}

- (void)waitUntilCompletedAndReturnError:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end