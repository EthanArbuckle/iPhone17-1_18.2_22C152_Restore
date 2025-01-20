@interface AVSerializedMostlySynchronousReentrantBlockScheduler
+ (void)initialize;
- (AVSerializedMostlySynchronousReentrantBlockScheduler)init;
- (void)dealloc;
- (void)scheduleBlock:(id)a3;
@end

@implementation AVSerializedMostlySynchronousReentrantBlockScheduler

- (AVSerializedMostlySynchronousReentrantBlockScheduler)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVSerializedMostlySynchronousReentrantBlockScheduler;
  v2 = [(AVSerializedMostlySynchronousReentrantBlockScheduler *)&v5 init];
  if (v2)
  {
    v2->_ivarAccessLock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v2->_blocks = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    v2->_blockSerializationLock = (OpaqueFigReentrantMutex *)FigReentrantMutexCreate();
    v3 = v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)scheduleBlock:(id)a3
{
  MEMORY[0x199715030](self->_ivarAccessLock, a2);
  objc_super v5 = (void *)[a3 copy];
  v6 = [(NSArray *)self->_blocks arrayByAddingObject:v5];

  self->_blocks = (NSArray *)[(NSArray *)v6 copy];
  LODWORD(v6) = FigReentrantMutexTryLock();

  MEMORY[0x199715040](self->_ivarAccessLock);
  if (v6)
  {
    MEMORY[0x199715030](self->_ivarAccessLock);
    if ([(NSArray *)self->_blocks count])
    {
      while (1)
      {
        id v7 = objc_alloc(MEMORY[0x1E4F28F20]);
        uint64_t v8 = [MEMORY[0x1E4F28D60] indexSet];
        v9 = objc_msgSend(v7, "initWithInsertIndexes:insertedObjects:removeIndexes:removedObjects:", v8, 0, objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", 0), 0);
        v10 = (void (**)(void))objc_msgSend(-[NSArray firstObject](self->_blocks, "firstObject"), "copy");
        v11 = [(NSArray *)self->_blocks arrayByApplyingDifference:v9];

        self->_blocks = (NSArray *)[(NSArray *)v11 copy];
        MEMORY[0x199715040](self->_ivarAccessLock);
        if (!v10) {
          break;
        }
        v10[2](v10);

        MEMORY[0x199715030](self->_ivarAccessLock);
        if (![(NSArray *)self->_blocks count]) {
          goto LABEL_5;
        }
      }
    }
    else
    {
LABEL_5:
      MEMORY[0x199714DF0](self->_blockSerializationLock);
      MEMORY[0x199715040](self->_ivarAccessLock);
    }
  }
  else if (dword_1EB2D3A20)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (void)dealloc
{
  FigSimpleMutexDestroy();
  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)AVSerializedMostlySynchronousReentrantBlockScheduler;
  [(AVSerializedMostlySynchronousReentrantBlockScheduler *)&v3 dealloc];
}

@end