@interface NSFilePresenterManagedProxy
- (BOOL)_presenterRespondsToSelector:(SEL)a3;
- (NSFileAccessProcessManager)processManager;
- (NSFilePresenterManagedProxy)initWithXPCProxy:(id)a3;
- (id)errorHandler;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (unint64_t)filePresenterResponses;
- (void)_safelySendMessageWithSelector:(SEL)a3 withErrorCompletionHandler:(id)a4 sender:(id)a5;
- (void)accommodateDeletionOfSubitemAtURL:(id)a3 completionHandler:(id)a4;
- (void)collectDebuggingInformationWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)reacquireFromWritingClaimForID:(id)a3 completionHandler:(id)a4;
- (void)relinquishToReadingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 completionHandler:(id)a6;
- (void)relinquishToWritingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 subitemURL:(id)a6 completionHandler:(id)a7;
- (void)saveChangesWithCompletionHandler:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setFilePresenterResponses:(unint64_t)a3;
- (void)setProcessManager:(id)a3;
@end

@implementation NSFilePresenterManagedProxy

- (void)setFilePresenterResponses:(unint64_t)a3
{
  self->_filePresenterResponses = a3;
}

- (NSFilePresenterManagedProxy)initWithXPCProxy:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSFilePresenterManagedProxy;
  v4 = [(NSFilePresenterManagedProxy *)&v6 init];
  if (v4)
  {
    v4->_xpcProxy = (NSFilePresenterXPCInterface *)a3;
    v4->_nonboostingXPCProxy = (NSFilePresenterXPCInterface *)(id)[a3 _unboostingRemoteObjectProxy];
  }
  return v4;
}

- (void)setProcessManager:(id)a3
{
}

- (BOOL)_presenterRespondsToSelector:(SEL)a3
{
  if (qword_1EB1EC7A0 != -1) {
    dispatch_once(&qword_1EB1EC7A0, &__block_literal_global_329);
  }
  objc_super v6 = (void *)[(id)_MergedGlobals_3_1 objectForKey:NSStringFromSelector(a3)];
  if (!v6) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSFileReactorProxy.m", 1273, @"Unexpected message in -[_NSFilePresenterManagedProxy _remoteObjectRespondsToMessage:]: %@", NSStringFromSelector(a3));
  }
  uint64_t v7 = [v6 unsignedLongLongValue];
  return !v7 || (self->_filePresenterResponses & v7) != 0;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFilePresenterManagedProxy;
  [(NSFilePresenterManagedProxy *)&v3 dealloc];
}

- (void)_safelySendMessageWithSelector:(SEL)a3 withErrorCompletionHandler:(id)a4 sender:(id)a5
{
  v13[7] = *MEMORY[0x1E4F143B8];
  if ([(NSFilePresenterManagedProxy *)self _presenterRespondsToSelector:a3])
  {
    if (a4 && (processManager = self->_processManager) != 0)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __96__NSFilePresenterManagedProxy__safelySendMessageWithSelector_withErrorCompletionHandler_sender___block_invoke;
      v13[3] = &unk_1E51FDCF8;
      v13[4] = self;
      v13[5] = a5;
      v13[6] = a4;
      [(NSFileAccessProcessManager *)processManager safelySendMessageWithReplyUsingBlock:v13];
    }
    else
    {
      xpcProxy = self->_xpcProxy;
      if (self->_errorHandler)
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __96__NSFilePresenterManagedProxy__safelySendMessageWithSelector_withErrorCompletionHandler_sender___block_invoke_4;
        v12[3] = &unk_1E51F7FF8;
        v12[4] = self;
        xpcProxy = (NSFilePresenterXPCInterface *)[(NSFilePresenterXPCInterface *)xpcProxy remoteObjectProxyWithErrorHandler:v12];
      }
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __96__NSFilePresenterManagedProxy__safelySendMessageWithSelector_withErrorCompletionHandler_sender___block_invoke_5;
      v11[3] = &unk_1E51F7F08;
      v11[4] = a4;
      (*((void (**)(id, NSFilePresenterXPCInterface *, void *))a5 + 2))(a5, xpcProxy, v11);
    }
  }
  else if (a4)
  {
    v9 = (void (*)(id, void))*((void *)a4 + 2);
    v9(a4, 0);
  }
}

uint64_t __96__NSFilePresenterManagedProxy__safelySendMessageWithSelector_withErrorCompletionHandler_sender___block_invoke(uint64_t a1, uint64_t a2)
{
  v6[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __96__NSFilePresenterManagedProxy__safelySendMessageWithSelector_withErrorCompletionHandler_sender___block_invoke_2;
  v6[3] = &unk_1E51FDC30;
  v6[4] = v3;
  v6[5] = a2;
  [v4 remoteObjectProxyWithErrorHandler:v6];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __96__NSFilePresenterManagedProxy__safelySendMessageWithSelector_withErrorCompletionHandler_sender___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __96__NSFilePresenterManagedProxy__safelySendMessageWithSelector_withErrorCompletionHandler_sender___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __96__NSFilePresenterManagedProxy__safelySendMessageWithSelector_withErrorCompletionHandler_sender___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __96__NSFilePresenterManagedProxy__safelySendMessageWithSelector_withErrorCompletionHandler_sender___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)relinquishToReadingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 completionHandler:(id)a6
{
  void v6[7] = *MEMORY[0x1E4F143B8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __98__NSFilePresenterManagedProxy_relinquishToReadingClaimWithID_options_purposeID_completionHandler___block_invoke;
  v6[3] = &unk_1E51FDD20;
  v6[5] = a5;
  v6[6] = a4;
  v6[4] = a3;
  [(NSFilePresenterManagedProxy *)self _safelySendMessageWithSelector:a2 withErrorCompletionHandler:a6 sender:v6];
}

uint64_t __98__NSFilePresenterManagedProxy_relinquishToReadingClaimWithID_options_purposeID_completionHandler___block_invoke(void *a1, void *a2, uint64_t a3)
{
  return [a2 relinquishToReadingClaimWithID:a1[4] options:a1[6] purposeID:a1[5] completionHandler:a3];
}

- (void)relinquishToWritingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 subitemURL:(id)a6 completionHandler:(id)a7
{
  v7[8] = *MEMORY[0x1E4F143B8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __109__NSFilePresenterManagedProxy_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke;
  v7[3] = &unk_1E51FDD48;
  v7[4] = a3;
  v7[5] = a5;
  v7[6] = a6;
  v7[7] = a4;
  [(NSFilePresenterManagedProxy *)self _safelySendMessageWithSelector:a2 withErrorCompletionHandler:a7 sender:v7];
}

uint64_t __109__NSFilePresenterManagedProxy_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke(void *a1, void *a2, uint64_t a3)
{
  return [a2 relinquishToWritingClaimWithID:a1[4] options:a1[7] purposeID:a1[5] subitemURL:a1[6] completionHandler:a3];
}

- (void)reacquireFromWritingClaimForID:(id)a3 completionHandler:(id)a4
{
}

uint64_t __80__NSFilePresenterManagedProxy_reacquireFromWritingClaimForID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__NSFilePresenterManagedProxy_reacquireFromWritingClaimForID_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__NSFilePresenterManagedProxy_reacquireFromWritingClaimForID_completionHandler___block_invoke_3;
  v5[3] = &unk_1E51F8650;
  v5[4] = a3;
  return [a2 reacquireFromWritingClaimForID:v3 completionHandler:v5];
}

uint64_t __80__NSFilePresenterManagedProxy_reacquireFromWritingClaimForID_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveChangesWithCompletionHandler:(id)a3
{
}

uint64_t __64__NSFilePresenterManagedProxy_saveChangesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "saveChangesWithCompletionHandler:");
}

- (void)accommodateDeletionOfSubitemAtURL:(id)a3 completionHandler:(id)a4
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__NSFilePresenterManagedProxy_accommodateDeletionOfSubitemAtURL_completionHandler___block_invoke;
  v4[3] = &unk_1E51FDD70;
  v4[4] = a3;
  [(NSFilePresenterManagedProxy *)self _safelySendMessageWithSelector:a2 withErrorCompletionHandler:a4 sender:v4];
}

uint64_t __83__NSFilePresenterManagedProxy_accommodateDeletionOfSubitemAtURL_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 accommodateDeletionOfSubitemAtURL:*(void *)(a1 + 32) completionHandler:a3];
}

- (void)collectDebuggingInformationWithCompletionHandler:(id)a3
{
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[(NSFilePresenterXPCInterface *)self->_xpcProxy methodSignatureForSelector:a3];
}

- (void)forwardInvocation:(id)a3
{
  if ([a3 _hasBlockArgument]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"NSFileReactorProxy.m" lineNumber:1401 description:@"NSFilePresenter messages with reply blocks need their own special override on NSFilePresenterManagedProxy"];
  }
  if (-[NSFilePresenterManagedProxy _presenterRespondsToSelector:](self, "_presenterRespondsToSelector:", [a3 selector]))
  {
    nonboostingXPCProxy = self->_nonboostingXPCProxy;
    [(NSFilePresenterXPCInterface *)nonboostingXPCProxy forwardInvocation:a3];
  }
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithXPCProxy:self->_xpcProxy];
  [v5 setErrorHandler:a3];
  objc_msgSend(v5, "setFilePresenterResponses:", -[NSFilePresenterManagedProxy filePresenterResponses](self, "filePresenterResponses"));
  objc_msgSend(v5, "setProcessManager:", -[NSFilePresenterManagedProxy processManager](self, "processManager"));

  return v5;
}

- (unint64_t)filePresenterResponses
{
  return self->_filePresenterResponses;
}

- (NSFileAccessProcessManager)processManager
{
  return (NSFileAccessProcessManager *)objc_getProperty(self, a2, 32, 1);
}

- (id)errorHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setErrorHandler:(id)a3
{
}

@end