@interface _FPParentProgress
- (BOOL)isCancellable;
- (BOOL)isPausable;
- (FPProgressProxy)progressProxy;
- (void)dealloc;
- (void)setProgressProxy:(id)a3;
@end

@implementation _FPParentProgress

- (void)dealloc
{
  [(FPProgressProxy *)self->_progressProxy stopTrackingIfStarted];
  v3.receiver = self;
  v3.super_class = (Class)_FPParentProgress;
  [(_FPParentProgress *)&v3 dealloc];
}

- (BOOL)isCancellable
{
  return [(FPProgressProxy *)self->_progressProxy isCancellable];
}

- (BOOL)isPausable
{
  return [(FPProgressProxy *)self->_progressProxy isPausable];
}

- (void)setProgressProxy:(id)a3
{
  id v5 = a3;
  [(FPProgressProxy *)self->_progressProxy stopTrackingIfStarted];
  objc_storeStrong((id *)&self->_progressProxy, a3);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __38___FPParentProgress_setProgressProxy___block_invoke;
  v13[3] = &unk_1E5AF0FF0;
  id v6 = v5;
  id v14 = v6;
  [(_FPParentProgress *)self setCancellationHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38___FPParentProgress_setProgressProxy___block_invoke_2;
  v11[3] = &unk_1E5AF0FF0;
  id v7 = v6;
  id v12 = v7;
  [(_FPParentProgress *)self setPausingHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38___FPParentProgress_setProgressProxy___block_invoke_3;
  v9[3] = &unk_1E5AF0FF0;
  id v10 = v7;
  id v8 = v7;
  [(_FPParentProgress *)self setResumingHandler:v9];
}

- (FPProgressProxy)progressProxy
{
  return (FPProgressProxy *)objc_getProperty(self, a2, 120, 1);
}

- (void).cxx_destruct
{
}

@end