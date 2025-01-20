@interface _FPCopyFileStatus
- (BOOL)rootWasCopied;
- (BOOL)shouldCopyAppleDouble;
- (NSMutableDictionary)lastBytesCopiedByFile;
- (NSProgress)progress;
- (_FPCopyFileStatus)init;
- (int)copyError;
- (void)beginCopyingFile:(id)a3 state:(_copyfile_state *)a4;
- (void)finishCopyingFile:(id)a3 state:(_copyfile_state *)a4;
- (void)setCopyError:(int)a3;
- (void)setLastBytesCopiedByFile:(id)a3;
- (void)setProgress:(id)a3;
- (void)setRootWasCopied:(BOOL)a3;
- (void)setShouldCopyAppleDouble:(BOOL)a3;
- (void)updateCopyingFile:(id)a3 state:(_copyfile_state *)a4;
@end

@implementation _FPCopyFileStatus

- (_FPCopyFileStatus)init
{
  v6.receiver = self;
  v6.super_class = (Class)_FPCopyFileStatus;
  v2 = [(_FPCopyFileStatus *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    lastBytesCopiedByFile = v2->_lastBytesCopiedByFile;
    v2->_lastBytesCopiedByFile = (NSMutableDictionary *)v3;

    *(_WORD *)&v2->_shouldCopyAppleDouble = 1;
  }
  return v2;
}

- (void)beginCopyingFile:(id)a3 state:(_copyfile_state *)a4
{
  id v6 = a3;
  copyfile_state_set(a4, 6u, copyfile_status_cb);
  copyfile_state_set(a4, 7u, self);
  [(_FPCopyFileStatus *)self updateCopyingFile:v6 state:a4];
}

- (void)updateCopyingFile:(id)a3 state:(_copyfile_state *)a4
{
  id v6 = a3;
  v7 = [(NSMutableDictionary *)self->_lastBytesCopiedByFile objectForKey:v6];
  uint64_t v8 = [v7 unsignedLongLongValue];

  uint64_t dst = 0;
  copyfile_state_get(a4, 8u, &dst);
  if (v8 != dst)
  {
    int64_t v9 = [(NSProgress *)self->_progress completedUnitCount];
    [(NSProgress *)self->_progress setCompletedUnitCount:v9 - v8 + dst];
    v10 = [NSNumber numberWithUnsignedLong:dst];
    [(NSMutableDictionary *)self->_lastBytesCopiedByFile setObject:v10 forKeyedSubscript:v6];
  }
}

- (void)finishCopyingFile:(id)a3 state:(_copyfile_state *)a4
{
  id v6 = a3;
  [(_FPCopyFileStatus *)self updateCopyingFile:v6 state:a4];
  [(NSMutableDictionary *)self->_lastBytesCopiedByFile removeObjectForKey:v6];
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProgress:(id)a3
{
}

- (NSMutableDictionary)lastBytesCopiedByFile
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastBytesCopiedByFile:(id)a3
{
}

- (BOOL)shouldCopyAppleDouble
{
  return self->_shouldCopyAppleDouble;
}

- (void)setShouldCopyAppleDouble:(BOOL)a3
{
  self->_shouldCopyAppleDouble = a3;
}

- (int)copyError
{
  return self->_copyError;
}

- (void)setCopyError:(int)a3
{
  self->_copyError = a3;
}

- (BOOL)rootWasCopied
{
  return self->_rootWasCopied;
}

- (void)setRootWasCopied:(BOOL)a3
{
  self->_rootWasCopied = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastBytesCopiedByFile, 0);

  objc_storeStrong((id *)&self->_progress, 0);
}

@end