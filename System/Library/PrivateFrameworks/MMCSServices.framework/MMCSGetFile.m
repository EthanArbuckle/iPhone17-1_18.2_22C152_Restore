@interface MMCSGetFile
- (id)completionBlock;
- (id)progressUpdateBlock;
- (void)dealloc;
- (void)setCompletionBlock:(id)a3;
- (void)setProgress:(double)a3;
- (void)setProgressUpdateBlock:(id)a3;
@end

@implementation MMCSGetFile

- (void)dealloc
{
  objc_msgSend_setCompletionBlock_(self, a2, 0, v2, v3);
  objc_msgSend_setProgressUpdateBlock_(self, v5, 0, v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)MMCSGetFile;
  [(MMCSSimpleFile *)&v8 dealloc];
}

- (void)setProgress:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  if (a3 <= 1.0) {
    double v4 = a3;
  }
  else {
    double v4 = 1.0;
  }
  v12.receiver = self;
  v12.super_class = (Class)MMCSGetFile;
  [(MMCSSimpleFile *)&v12 progress];
  if (v4 != v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)MMCSGetFile;
    [(MMCSSimpleFile *)&v11 setProgress:v4];
    uint64_t updated = objc_msgSend_progressUpdateBlock(self, v6, v7, v8, v9);
    if (updated) {
      (*(void (**)(uint64_t, MMCSGetFile *, double))(updated + 16))(updated, self, v4);
    }
  }
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)progressUpdateBlock
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setProgressUpdateBlock:(id)a3
{
}

@end