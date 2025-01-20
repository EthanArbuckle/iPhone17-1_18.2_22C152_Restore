@interface BMStreamDatastoreOutOfProcessWriter
- (BMStreamDatastoreOutOfProcessWriter)initWithStream:(id)a3 user:(unsigned int)a4;
- (BMStreamDatastoreOutOfProcessWriter)initWithStream:(id)a3 user:(unsigned int)a4 eventDataClass:(Class)a5;
- (BOOL)isDataAccessible;
- (BOOL)writeEventWithEventBody:(id)a3 timestamp:(double)a4 outEventSize:(unint64_t *)a5;
@end

@implementation BMStreamDatastoreOutOfProcessWriter

- (BMStreamDatastoreOutOfProcessWriter)initWithStream:(id)a3 user:(unsigned int)a4
{
  return [(BMStreamDatastoreOutOfProcessWriter *)self initWithStream:a3 user:*(void *)&a4 eventDataClass:0];
}

- (BMStreamDatastoreOutOfProcessWriter)initWithStream:(id)a3 user:(unsigned int)a4 eventDataClass:(Class)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BMStreamDatastoreOutOfProcessWriter;
  v9 = [(BMStreamDatastoreOutOfProcessWriter *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_class = a5;
    v9->_user = a4;
    uint64_t v11 = [v8 copy];
    streamIdentifier = v10->_streamIdentifier;
    v10->_streamIdentifier = (NSString *)v11;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (BOOL)writeEventWithEventBody:(id)a3 timestamp:(double)a4 outEventSize:(unint64_t *)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x1AD11E210]();
  v10 = [v8 serialize];
  uint64_t v11 = [v8 dataVersion];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  Class v13 = self->_class;
  if (v13)
  {
    if (([(objc_class *)v13 isEqual:objc_opt_class()] & 1) == 0)
    {
      objc_super v14 = __biome_log_for_category();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[BMStreamDatastoreOutOfProcessWriter writeEventWithEventBody:timestamp:outEventSize:](v14);
      }
      BOOL v15 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    self->_class = (Class)objc_opt_class();
  }
  writeService = self->_writeService;
  if (!writeService)
  {
    v17 = [BMWriteService alloc];
    v18 = [(BMWriteService *)v17 initWithUseCase:*MEMORY[0x1E4F4FB20]];
    v19 = self->_writeService;
    self->_writeService = v18;

    writeService = self->_writeService;
  }
  streamIdentifier = self->_streamIdentifier;
  uint64_t user = self->_user;
  id v24 = 0;
  BOOL v15 = [(BMWriteService *)writeService writeData:v10 version:v11 timestamp:streamIdentifier toStream:user asUser:&v24 error:a4];
  objc_super v14 = v24;
  if (v15)
  {
    if (a5) {
      *a5 = [v10 length];
    }
  }
  else
  {
    v22 = __biome_log_for_category();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[BMStreamDatastoreOutOfProcessWriter writeEventWithEventBody:timestamp:outEventSize:]((uint64_t)v14, v22);
    }
  }
LABEL_15:

  os_unfair_lock_unlock(p_lock);

  return v15;
}

- (BOOL)isDataAccessible
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeService, 0);
  objc_storeStrong((id *)&self->_streamIdentifier, 0);
}

- (void)writeEventWithEventBody:(uint64_t)a1 timestamp:(NSObject *)a2 outEventSize:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AD076000, a2, OS_LOG_TYPE_ERROR, "Out of process write failed with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)writeEventWithEventBody:(os_log_t)log timestamp:outEventSize:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AD076000, log, OS_LOG_TYPE_ERROR, "Out of process write failed, wrong class", v1, 2u);
}

@end