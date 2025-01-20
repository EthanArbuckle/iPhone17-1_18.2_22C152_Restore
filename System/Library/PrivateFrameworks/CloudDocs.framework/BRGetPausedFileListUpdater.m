@interface BRGetPausedFileListUpdater
+ (BOOL)supportsSecureCoding;
- (BRGetPausedFileListUpdater)initWithCallback:(id)a3;
- (BRGetPausedFileListUpdater)initWithCoder:(id)a3;
- (void)updatePausedFileURL:(id)a3 reply:(id)a4;
@end

@implementation BRGetPausedFileListUpdater

- (BRGetPausedFileListUpdater)initWithCallback:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRGetPausedFileListUpdater;
  v5 = [(BRGetPausedFileListUpdater *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x19F3C48D0](v4);
    id callback = v5->_callback;
    v5->_id callback = (id)v6;
  }
  return v5;
}

- (void)updatePausedFileURL:(id)a3 reply:(id)a4
{
  id callback = (void (**)(id, id, id))self->_callback;
  if (callback) {
    callback[2](callback, a3, a4);
  }
}

- (BRGetPausedFileListUpdater)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BRGetPausedFileListUpdater;
  return [(BRGetPausedFileListUpdater *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

@end