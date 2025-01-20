@interface _CopyfileCallbackCtx
- (BOOL)doArchive;
- (BOOL)doUnarchive;
- (NSProgress)progress;
- (_CopyfileCallbackCtx)initWithPath:(const char *)a3 error:(id *)a4;
- (unint64_t)generationSize;
- (void)setDoArchive:(BOOL)a3;
- (void)setDoUnarchive:(BOOL)a3;
- (void)setGenerationSize:(unint64_t)a3;
@end

@implementation _CopyfileCallbackCtx

- (_CopyfileCallbackCtx)initWithPath:(const char *)a3 error:(id *)a4
{
  v16.receiver = self;
  v16.super_class = (Class)_CopyfileCallbackCtx;
  v6 = [(_CopyfileCallbackCtx *)&v16 init];
  if (!v6) {
    goto LABEL_6;
  }
  v7 = +[NSProgress currentProgress];

  if (v7)
  {
    uint64_t v8 = sub_10000E0AC((char *)a3, a4);
    if ((v8 & 0x8000000000000000) == 0)
    {
      uint64_t v9 = +[NSProgress progressWithTotalUnitCount:v8];
      progress = v6->_progress;
      v6->_progress = (NSProgress *)v9;

      [(NSProgress *)v6->_progress setUserInfoObject:NSProgressFileOperationKindCopying forKey:NSProgressFileOperationKindKey];
      v11 = v6->_progress;
      v12 = +[NSString gs_stringWithFileSystemRepresentation:a3];
      v13 = +[NSURL fileURLWithPath:v12];
      [(NSProgress *)v11 setUserInfoObject:v13 forKey:NSProgressFileURLKey];

      [(NSProgress *)v6->_progress setCancellable:1];
      [(NSProgress *)v6->_progress setKind:NSProgressKindFile];
      goto LABEL_5;
    }
LABEL_6:
    v14 = 0;
    goto LABEL_7;
  }
LABEL_5:
  v14 = v6;
LABEL_7:

  return v14;
}

- (BOOL)doArchive
{
  return self->_doArchive;
}

- (void)setDoArchive:(BOOL)a3
{
  self->_doArchive = a3;
}

- (BOOL)doUnarchive
{
  return self->_doUnarchive;
}

- (void)setDoUnarchive:(BOOL)a3
{
  self->_doUnarchive = a3;
}

- (unint64_t)generationSize
{
  return self->_generationSize;
}

- (void)setGenerationSize:(unint64_t)a3
{
  self->_generationSize = a3;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
}

@end