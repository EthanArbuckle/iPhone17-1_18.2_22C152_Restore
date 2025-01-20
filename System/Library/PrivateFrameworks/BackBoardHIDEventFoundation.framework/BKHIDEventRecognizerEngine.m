@interface BKHIDEventRecognizerEngine
- (BKHIDEventRecognizerEngine)init;
- (NSMutableArray)blocks;
- (NSMutableArray)recognizers;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (void)addRecognizer:(id)a3 recognitionBlock:(id)a4;
- (void)removeRecognizer:(id)a3;
- (void)setBlocks:(id)a3;
- (void)setRecognizers:(id)a3;
@end

@implementation BKHIDEventRecognizerEngine

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = *a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSMutableArray *)self->_recognizers count])
  {
    v12 = (void *)[(NSMutableArray *)self->_recognizers copy];
    v13 = (void *)[(NSMutableArray *)self->_blocks copy];
  }
  else
  {
    v13 = 0;
    v12 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__BKHIDEventRecognizerEngine_processEvent_sender_dispatcher___block_invoke;
  v17[3] = &unk_1E68716E8;
  v20 = v10;
  id v14 = v13;
  id v18 = v14;
  v19 = &v21;
  [v12 enumerateObjectsUsingBlock:v17];
  int64_t v15 = v22[3];

  _Block_object_dispose(&v21, 8);
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocks, 0);

  objc_storeStrong((id *)&self->_recognizers, 0);
}

- (void)setBlocks:(id)a3
{
}

- (NSMutableArray)blocks
{
  return self->_blocks;
}

- (void)setRecognizers:(id)a3
{
}

- (NSMutableArray)recognizers
{
  return self->_recognizers;
}

void __61__BKHIDEventRecognizerEngine_processEvent_sender_dispatcher___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  char v6 = 0;
  if ([a2 processEvent:*(void *)(a1 + 48) shouldConsume:&v6] == 1)
  {
    v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    v5[2]();
  }
  if (v6) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)removeRecognizer:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = [(NSMutableArray *)self->_recognizers indexOfObject:v5];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_recognizers removeObjectAtIndex:v6];
    [(NSMutableArray *)self->_blocks removeObjectAtIndex:v6];
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)addRecognizer:(id)a3 recognitionBlock:(id)a4
{
  id v18 = a3;
  id v7 = a4;
  if (v18)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"BKHIDEventRecognizerEngine.m", 32, @"Invalid parameter not satisfying: %@", @"recognizer != nil" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"BKHIDEventRecognizerEngine.m", 33, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];

LABEL_3:
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  recognizers = self->_recognizers;
  if (!recognizers)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v11 = self->_recognizers;
    self->_recognizers = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    blocks = self->_blocks;
    self->_blocks = v12;

    recognizers = self->_recognizers;
  }
  [(NSMutableArray *)recognizers addObject:v18];
  id v14 = self->_blocks;
  int64_t v15 = (void *)MEMORY[0x1D25E04D0](v7);
  [(NSMutableArray *)v14 addObject:v15];

  os_unfair_lock_unlock(p_lock);
}

- (BKHIDEventRecognizerEngine)init
{
  v3.receiver = self;
  v3.super_class = (Class)BKHIDEventRecognizerEngine;
  result = [(BKHIDEventRecognizerEngine *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

@end