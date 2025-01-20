@interface CSSafetyOneArgumentCompletionBlock
- (CSSafetyOneArgumentCompletionBlock)initWithDefaultValue:(id)a3 completionBlock:(id)a4;
- (void)dealloc;
- (void)invokeWithValue:(id)a3;
@end

@implementation CSSafetyOneArgumentCompletionBlock

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong(&self->_defaultValue, 0);
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSSafetyOneArgumentCompletionBlock dealloc]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  [(CSSafetyOneArgumentCompletionBlock *)self invokeWithValue:self->_defaultValue];
  v4.receiver = self;
  v4.super_class = (Class)CSSafetyOneArgumentCompletionBlock;
  [(CSSafetyOneArgumentCompletionBlock *)&v4 dealloc];
}

- (void)invokeWithValue:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_isDirty)
  {
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315395;
      uint64_t v7 = "-[CSSafetyOneArgumentCompletionBlock invokeWithValue:]";
      __int16 v8 = 2113;
      id v9 = v4;
      _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s invoking with value %{private}@", (uint8_t *)&v6, 0x16u);
    }
    self->_isDirty = 1;
    (*((void (**)(void))self->_block + 2))();
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (CSSafetyOneArgumentCompletionBlock)initWithDefaultValue:(id)a3 completionBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSSafetyOneArgumentCompletionBlock;
  id v9 = [(CSSafetyOneArgumentCompletionBlock *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    uint64_t v11 = MEMORY[0x1BA9E7570](v8);
    id block = v10->_block;
    v10->_id block = (id)v11;

    objc_storeStrong(&v10->_defaultValue, a3);
  }

  return v10;
}

@end