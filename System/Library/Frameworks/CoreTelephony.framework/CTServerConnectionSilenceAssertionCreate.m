@interface CTServerConnectionSilenceAssertionCreate
@end

@implementation CTServerConnectionSilenceAssertionCreate

void ___CTServerConnectionSilenceAssertionCreate_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  uint64_t v3 = MEMORY[0x1E4F14590];
  if (object)
  {
    xpc_object_t v4 = object;
    xpc_retain(object);
    xpc_object_t v23 = v4;
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t v23 = v4;
    if (!v4)
    {
LABEL_5:
      xpc_object_t v5 = xpc_null_create();
      xpc_object_t v23 = v5;
      goto LABEL_7;
    }
  }
  if (MEMORY[0x1853203E0](v4) != v3) {
    goto LABEL_5;
  }
  xpc_retain(v4);
  xpc_object_t v5 = v4;
LABEL_7:
  xpc_release(v4);
  if (MEMORY[0x1853203E0](v5) != v3)
  {
    v6 = 0;
    uint64_t v7 = 0x500000002;
LABEL_9:
    uint64_t v24 = v7;
LABEL_10:
    uint64_t v8 = 0;
    goto LABEL_11;
  }
  if (!xpc_dictionary_get_value(v5, "kPosixError"))
  {
    if (!xpc_dictionary_get_value(v23, "error"))
    {
      v6 = *(void **)(a1 + 40);
      _CTServerConnectionSetTargetQueue(v6, *(NSObject **)(a1 + 48));
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 0x40000000;
      v22[2] = ___CTServerConnectionSilenceAssertionCreate_block_invoke_62;
      v22[3] = &unk_1E5267188;
      uint64_t v18 = *(void *)(a1 + 48);
      v22[4] = *(void *)(a1 + 32);
      v22[5] = v18;
      _CTServerConnectionRegisterBlockForNotification((uint64_t)v6, @"kCTConnectionInvalidatedNotification", (uint64_t)v22);
      goto LABEL_10;
    }
    v17 = CTLogRadioModule();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18444A000, v17, OS_LOG_TYPE_DEFAULT, "error key set in reply", buf, 2u);
    }
    CFRelease(*(CFTypeRef *)(a1 + 40));
    v6 = 0;
    uint64_t v7 = 0x100000001;
    goto LABEL_9;
  }
  LODWORD(v24) = 1;
  *(void *)buf = &v23;
  *(void *)&buf[8] = "kPosixError";
  xpc::dict::object_proxy::operator xpc::object((uint64_t)buf, __p);
  HIDWORD(v24) = xpc::dyn_cast_or_default((xpc *)__p, 0);
  xpc_release(__p[0]);
  if (!operator==(&v24, kCTErrorOperationBlockedTemp))
  {
    v6 = 0;
    goto LABEL_10;
  }
  *(void *)buf = &v23;
  *(void *)&buf[8] = "kBarringEndTime";
  xpc::dict::object_proxy::operator xpc::object((uint64_t)buf, __p);
  xpc::dyn_cast_or_default((xpc *)__p, v12, 0.0);
  uint64_t v8 = v13;
  xpc_release(__p[0]);
  v6 = 0;
LABEL_11:
  v9 = CTLogRadioModule();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (*(void *)(a1 + 56))
    {
      memset(buf, 0, sizeof(buf));
      ctu::cf::assign();
      *(_OWORD *)__p = *(_OWORD *)buf;
      uint64_t v21 = *(void *)&buf[16];
      v10 = __p;
      if ((buf[23] & 0x80u) != 0) {
        v10 = (void **)__p[0];
      }
      v11 = "false";
      if (v6) {
        v11 = "true";
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v11;
      _os_log_impl(&dword_18444A000, v9, OS_LOG_TYPE_DEFAULT, "Calling _CTServerConnectionSilenceAssertionCreate() for name = %s assertion = %s", buf, 0x16u);
      if (SHIBYTE(v21) < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      v14 = "true";
      if (!v6) {
        v14 = "false";
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v14;
      _os_log_impl(&dword_18444A000, v9, OS_LOG_TYPE_DEFAULT, "Calling _CTServerConnectionSilenceAssertionCreate() for name = %s assertion = %s", buf, 0x16u);
    }
  }
  v15 = *(NSObject **)(a1 + 48);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 0x40000000;
  v19[2] = ___CTServerConnectionSilenceAssertionCreate_block_invoke_70;
  v19[3] = &unk_1E5260B78;
  uint64_t v16 = *(void *)(a1 + 32);
  v19[7] = v24;
  v19[4] = v16;
  v19[5] = v6;
  v19[6] = v8;
  dispatch_async(v15, v19);
  if (!operator==(kCTErrorNoError, &v24)) {
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
  xpc_release(v23);
}

void ___CTServerConnectionSilenceAssertionCreate_block_invoke_62(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___CTServerConnectionSilenceAssertionCreate_block_invoke_2;
  block[3] = &unk_1E5267160;
  v1 = *(NSObject **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v1, block);
}

uint64_t ___CTServerConnectionSilenceAssertionCreate_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
}

uint64_t ___CTServerConnectionSilenceAssertionCreate_block_invoke_70(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 56), *(void *)(a1 + 40), *(double *)(a1 + 48));
}

@end