@interface CWFXPCProxy
- (BOOL)isSynchronous;
- (id)__copyReplyBlockFromInvocation:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)target;
- (void)forwardInvocation:(id)a3;
- (void)setSynchronous:(BOOL)a3;
- (void)setTarget:(id)a3;
@end

@implementation CWFXPCProxy

- (id)__copyReplyBlockFromInvocation:(id)a3
{
  id v3 = a3;
  v8 = objc_msgSend_methodSignature(v3, v4, v5, v6, v7);
  unint64_t v13 = objc_msgSend_numberOfArguments(v8, v9, v10, v11, v12);
  if (v13 >= 3
    && (unint64_t v14 = v13,
        id v15 = v8,
        uint64_t v16 = v14 - 1,
        ArgumentTypeAtIndex = (const char *)objc_msgSend_getArgumentTypeAtIndex_(v15, v17, v16, v18, v19),
        !strcmp(ArgumentTypeAtIndex, "@?")))
  {
    v29 = 0;
    objc_msgSend_getArgument_atIndex_(v3, v21, (uint64_t)&v29, v16, v22);
    v27 = objc_msgSend_copy(v29, v23, v24, v25, v26);
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_isSynchronous(self, v5, v6, v7, v8))
  {
    unint64_t v13 = objc_msgSend___copyReplyBlockFromInvocation_(self, v9, (uint64_t)v4, v11, v12);
    if (v13)
    {
      dispatch_block_t v14 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1F0DA3EB0);
      _Block_signature(v13);
      id v51 = v13;
      v52 = v14;
      id v15 = v14;
      *(void *)v53 = __NSMakeSpecialForwardingCaptureBlock();
      v20 = objc_msgSend_methodSignature(v4, v16, v17, v18, v19);
      uint64_t v25 = objc_msgSend_numberOfArguments(v20, v21, v22, v23, v24);
      objc_msgSend_setArgument_atIndex_(v4, v26, (uint64_t)v53, v25 - 1, v27);

      v32 = objc_msgSend_target(self, v28, v29, v30, v31);
      objc_msgSend_setTarget_(v4, v33, (uint64_t)v32, v34, v35);

      objc_msgSend_invoke(v4, v36, v37, v38, v39);
      dispatch_block_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      v48 = CWFGetOSLog();
      if (v48)
      {
        v49 = CWFGetOSLog();
      }
      else
      {
        v49 = MEMORY[0x1E4F14500];
        id v50 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v53 = 136446978;
        *(void *)&v53[4] = "-[CWFXPCProxy forwardInvocation:]";
        __int16 v54 = 2082;
        v55 = "CWFXPCProxy.m";
        __int16 v56 = 1024;
        int v57 = 81;
        __int16 v58 = 2114;
        id v59 = v4;
        _os_log_send_and_compose_impl();
      }
    }
  }
  else
  {
    v40 = objc_msgSend_target(self, v9, v10, v11, v12);
    objc_msgSend_setTarget_(v4, v41, (uint64_t)v40, v42, v43);

    objc_msgSend_invoke(v4, v44, v45, v46, v47);
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  uint64_t v6 = objc_msgSend_target(self, a2, (uint64_t)a3, v3, v4);
  uint64_t v10 = objc_msgSend_methodSignatureForSelector_(v6, v7, (uint64_t)a3, v8, v9);

  return v10;
}

- (BOOL)isSynchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (void).cxx_destruct
{
}

@end