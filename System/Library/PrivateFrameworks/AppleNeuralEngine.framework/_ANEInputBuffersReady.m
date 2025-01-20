@interface _ANEInputBuffersReady
+ (id)inputBuffersWithProcedureIndex:(unsigned int)a3 inputBufferInfoIndex:(id)a4 inputFreeValue:(id)a5 executionDelay:(unint64_t)a6;
+ (id)new;
- (BOOL)validate;
- (NSArray)inputBufferInfoIndex;
- (NSArray)inputFreeValue;
- (_ANEInputBuffersReady)init;
- (id)initInputsProcedureIndex:(unsigned int)a3 inputBufferInfoIndex:(id)a4 inputFreeValue:(id)a5 executionDelay:(unint64_t)a6;
- (unint64_t)executionDelay;
- (unsigned)procedureIndex;
- (void)validate;
@end

@implementation _ANEInputBuffersReady

+ (id)new
{
  return 0;
}

- (_ANEInputBuffersReady)init
{
  return 0;
}

- (id)initInputsProcedureIndex:(unsigned int)a3 inputBufferInfoIndex:(id)a4 inputFreeValue:(id)a5 executionDelay:(unint64_t)a6
{
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_ANEInputBuffersReady;
  v13 = [(_ANEInputBuffersReady *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_procedureIndex = a3;
    objc_storeStrong((id *)&v13->_inputBufferInfoIndex, a4);
    objc_storeStrong((id *)&v14->_inputFreeValue, a5);
    v14->_executionDelay = a6;
  }

  return v14;
}

+ (id)inputBuffersWithProcedureIndex:(unsigned int)a3 inputBufferInfoIndex:(id)a4 inputFreeValue:(id)a5 executionDelay:(unint64_t)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = a4;
  id v12 = (void *)[objc_alloc((Class)a1) initInputsProcedureIndex:v8 inputBufferInfoIndex:v11 inputFreeValue:v10 executionDelay:a6];

  return v12;
}

- (BOOL)validate
{
  v4 = [(_ANEInputBuffersReady *)self inputBufferInfoIndex];
  unint64_t v5 = [v4 count];

  if (v5 >= 0x100)
  {
    v6 = +[_ANELog common];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(_ANEInputBuffersReady *)a2 validate];
    }
LABEL_7:

    return 0;
  }
  v7 = [(_ANEInputBuffersReady *)self inputFreeValue];
  unint64_t v8 = [v7 count];

  if (v8 >= 0x100)
  {
    v6 = +[_ANELog common];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(_ANEInputBuffersReady *)a2 validate];
    }
    goto LABEL_7;
  }
  return 1;
}

- (unsigned)procedureIndex
{
  return self->_procedureIndex;
}

- (NSArray)inputBufferInfoIndex
{
  return self->_inputBufferInfoIndex;
}

- (NSArray)inputFreeValue
{
  return self->_inputFreeValue;
}

- (unint64_t)executionDelay
{
  return self->_executionDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputFreeValue, 0);
  objc_storeStrong((id *)&self->_inputBufferInfoIndex, 0);
}

- (void)validate
{
  v3 = NSStringFromSelector(a1);
  v4 = [a2 inputFreeValue];
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_4(&dword_1DB8AB000, v5, v6, "%@: inputFreeValue[%lu] count is greater than kANEMaxBuffers=%d", v7, v8, v9, v10, v11);
}

@end