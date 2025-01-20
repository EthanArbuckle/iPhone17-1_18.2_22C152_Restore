@interface CLIntersiloProxy
+ (Class)initiatorRepresentingClass;
+ (Class)recipientRepresentingClass;
+ (id)proxyForRecipientObject:(id)a3 inSilo:(id)a4 recipientName:(id)a5;
- (BOOL)offsiloHandleInvocation:(id)a3 selectorInfo:(id)a4 peer:(id)a5;
- (BOOL)respondsToSelector:(SEL)a3;
- (CLIntersiloProxy)init;
- (CLIntersiloProxy)initWithDelegateObject:(id)a3 delegateSilo:(id)a4;
- (CLIntersiloProxyDelegateProtocol)delegate;
- (CLSilo)delegateSilo;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)peer;
- (void)forwardInvocation:(id)a3;
- (void)registerDelegate:(id)a3 inSilo:(id)a4;
@end

@implementation CLIntersiloProxy

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(CLIntersiloProxy *)self peer];
  v7 = [v6 delegateSilo];
  v8 = [v7 identifier];
  v9 = [v3 stringWithFormat:@"<%@: peer silo:%@>", v5, v8];

  return v9;
}

- (BOOL)offsiloHandleInvocation:(id)a3 selectorInfo:(id)a4 peer:(id)a5
{
  return 1;
}

- (void)registerDelegate:(id)a3 inSilo:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id obj = a3;
  id v6 = a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = [MEMORY[0x1E4F1CA98] null];
  if (WeakRetained != v9)
  {

LABEL_7:
    v12 = sub_1A455FF60();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v17 = 0;
      __int16 v18 = 2082;
      v19 = &unk_1A45670B7;
      __int16 v20 = 2082;
      v21 = "assert";
      __int16 v22 = 2081;
      v23 = "_delegate == (id)[NSNull null] && !_delegateSilo";
      _os_log_impl(&dword_1A4540000, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Once registered, delegate may not be changed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v13 = sub_1A455FF60();
    if (os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 68289539;
      int v17 = 0;
      __int16 v18 = 2082;
      v19 = &unk_1A45670B7;
      __int16 v20 = 2082;
      v21 = "assert";
      __int16 v22 = 2081;
      v23 = "_delegate == (id)[NSNull null] && !_delegateSilo";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Once registered, delegate may not be changed", "{\"msg%{public}.0s\":\"Once registered, delegate may not be changed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v14 = sub_1A455FF60();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v17 = 0;
      __int16 v18 = 2082;
      v19 = &unk_1A45670B7;
      __int16 v20 = 2082;
      v21 = "assert";
      __int16 v22 = 2081;
      v23 = "_delegate == (id)[NSNull null] && !_delegateSilo";
      _os_log_impl(&dword_1A4540000, v14, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Once registered, delegate may not be changed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
    __break(1u);
  }
  p_delegateSilo = &self->_delegateSilo;
  id v11 = objc_loadWeakRetained((id *)p_delegateSilo);

  if (v11) {
    goto LABEL_7;
  }
  objc_storeWeak((id *)p_delegate, obj);
  objc_storeWeak((id *)p_delegateSilo, v6);
}

+ (id)proxyForRecipientObject:(id)a3 inSilo:(id)a4 recipientName:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc((Class)[a1 initiatorRepresentingClass]);
  id v12 = objc_alloc((Class)[a1 recipientRepresentingClass]);
  id v13 = v11;
  if ((id)[v13 initWithDelegateObject:v8 delegateSilo:v9 uninitializedPeer:v12] != v13)
  {
    __int16 v18 = sub_1A455FF60();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v24 = 0;
      __int16 v25 = 2082;
      v26 = &unk_1A45670B7;
      __int16 v27 = 2082;
      v28 = "assert";
      __int16 v29 = 2081;
      v30 = "postInit == initiatorProxy";
      _os_log_impl(&dword_1A4540000, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Intersilo proxy init changed self\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v19 = sub_1A455FF60();
    if (os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 68289539;
      int v24 = 0;
      __int16 v25 = 2082;
      v26 = &unk_1A45670B7;
      __int16 v27 = 2082;
      v28 = "assert";
      __int16 v29 = 2081;
      v30 = "postInit == initiatorProxy";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Intersilo proxy init changed self", "{\"msg%{public}.0s\":\"Intersilo proxy init changed self\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    __int16 v20 = sub_1A455FF60();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v24 = 0;
      __int16 v25 = 2082;
      v26 = &unk_1A45670B7;
      __int16 v27 = 2082;
      v28 = "assert";
      __int16 v29 = 2081;
      v30 = "postInit == initiatorProxy";
      _os_log_impl(&dword_1A4540000, v20, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Intersilo proxy init changed self\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_19:

    abort_report_np();
    __break(1u);
  }
  id v14 = v12;
  uint64_t v15 = [v14 initWithUninitializedPeer:v13];

  if ((id)v15 != v14)
  {
    v21 = sub_1A455FF60();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v24 = 0;
      __int16 v25 = 2082;
      v26 = &unk_1A45670B7;
      __int16 v27 = 2082;
      v28 = "assert";
      __int16 v29 = 2081;
      v30 = "postInit == recipientProxy";
      _os_log_impl(&dword_1A4540000, v21, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Intersilo proxy init changed self\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    __int16 v22 = sub_1A455FF60();
    if (os_signpost_enabled(v22))
    {
      *(_DWORD *)buf = 68289539;
      int v24 = 0;
      __int16 v25 = 2082;
      v26 = &unk_1A45670B7;
      __int16 v27 = 2082;
      v28 = "assert";
      __int16 v29 = 2081;
      v30 = "postInit == recipientProxy";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Intersilo proxy init changed self", "{\"msg%{public}.0s\":\"Intersilo proxy init changed self\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    __int16 v20 = sub_1A455FF60();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v24 = 0;
      __int16 v25 = 2082;
      v26 = &unk_1A45670B7;
      __int16 v27 = 2082;
      v28 = "assert";
      __int16 v29 = 2081;
      v30 = "postInit == recipientProxy";
      _os_log_impl(&dword_1A4540000, v20, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Intersilo proxy init changed self\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_19;
  }
  id v16 = v10;
  objc_msgSend(v13, "setDelegateEntityName:", objc_msgSend(v16, "UTF8String"));

  return v14;
}

- (CLIntersiloProxy)init
{
  v3 = [MEMORY[0x1E4F1CA98] null];
  objc_storeWeak((id *)&self->_delegate, v3);

  return self;
}

- (CLIntersiloProxy)initWithDelegateObject:(id)a3 delegateSilo:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  objc_storeWeak((id *)p_delegate, a3);
  objc_storeWeak((id *)&self->_delegateSilo, v7);

  return self;
}

+ (Class)recipientRepresentingClass
{
  return (Class)objc_opt_class();
}

+ (Class)initiatorRepresentingClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegateSilo);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v4 = +[CLIntersiloInterface sharedInterface];
  v5 = [v4 getInfoForSelector:a3];
  id v6 = [v5 sig];

  return v6;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 selector];
  id v6 = +[CLIntersiloInterface sharedInterface];
  v65 = [v6 getInfoForSelector:v5];

  v64 = [(CLIntersiloProxy *)self peer];
  if ([v4 argumentsRetained])
  {
    v50 = sub_1A455FF60();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
    {
      uint64_t buf = 68289539;
      __int16 v84 = 2082;
      v85 = &unk_1A45670B7;
      __int16 v86 = 2082;
      v87 = "assert";
      __int16 v88 = 2081;
      v89 = "![inv argumentsRetained]";
      _os_log_impl(&dword_1A4540000, v50, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Didn't expect the arguments to be retained before now\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
    }

    v51 = sub_1A455FF60();
    if (os_signpost_enabled(v51))
    {
      uint64_t buf = 68289539;
      __int16 v84 = 2082;
      v85 = &unk_1A45670B7;
      __int16 v86 = 2082;
      v87 = "assert";
      __int16 v88 = 2081;
      v89 = "![inv argumentsRetained]";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v51, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Didn't expect the arguments to be retained before now", "{\"msg%{public}.0s\":\"Didn't expect the arguments to be retained before now\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
    }

    v52 = sub_1A455FF60();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      uint64_t buf = 68289539;
      __int16 v84 = 2082;
      v85 = &unk_1A45670B7;
      __int16 v86 = 2082;
      v87 = "assert";
      __int16 v88 = 2081;
      v89 = "![inv argumentsRetained]";
      _os_log_impl(&dword_1A4540000, v52, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Didn't expect the arguments to be retained before now\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
    }

    abort_report_np();
LABEL_76:
    __break(1u);
  }
  id v82 = 0;
  if ([v65 lastArgBlockIndex])
  {
    int v7 = [v65 lastArgBlockIndex];
    if (v7 >= 0) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = -v7;
    }
    id v81 = 0;
    [v4 getArgument:&v81 atIndex:v8];
    cf = (void *)[v81 copy];
    int v9 = *(unsigned __int8 *)_Block_signature(cf);
    if ((v9 == 118) != (int)[v65 lastArgBlockIndex] < 1)
    {
      if (v9 == 118)
      {
LABEL_19:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        BOOL v18 = WeakRetained == 0;

        if (v18)
        {
          v56 = sub_1A455FF60();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
          {
            uint64_t buf = 68289539;
            __int16 v84 = 2082;
            v85 = &unk_1A45670B7;
            __int16 v86 = 2082;
            v87 = "assert";
            __int16 v88 = 2081;
            v89 = "_delegate";
            _os_log_impl(&dword_1A4540000, v56, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Delegate is necessary for reply delivery\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
          }

          v57 = sub_1A455FF60();
          if (os_signpost_enabled(v57))
          {
            uint64_t buf = 68289539;
            __int16 v84 = 2082;
            v85 = &unk_1A45670B7;
            __int16 v86 = 2082;
            v87 = "assert";
            __int16 v88 = 2081;
            v89 = "_delegate";
            _os_signpost_emit_with_name_impl(&dword_1A4540000, v57, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Delegate is necessary for reply delivery", "{\"msg%{public}.0s\":\"Delegate is necessary for reply delivery\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
          }

          v42 = sub_1A455FF60();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            uint64_t buf = 68289539;
            __int16 v84 = 2082;
            v85 = &unk_1A45670B7;
            __int16 v86 = 2082;
            v87 = "assert";
            __int16 v88 = 2081;
            v89 = "_delegate";
            _os_log_impl(&dword_1A4540000, v42, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Delegate is necessary for reply delivery\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
          }
          goto LABEL_75;
        }
        id v19 = objc_loadWeakRetained((id *)&self->_delegateSilo);
        BOOL v20 = v19 == 0;

        if (v20)
        {
          v58 = sub_1A455FF60();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
          {
            uint64_t buf = 68289539;
            __int16 v84 = 2082;
            v85 = &unk_1A45670B7;
            __int16 v86 = 2082;
            v87 = "assert";
            __int16 v88 = 2081;
            v89 = "_delegateSilo";
            _os_log_impl(&dword_1A4540000, v58, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Silo is necessary for reply delivery\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
          }

          v59 = sub_1A455FF60();
          if (os_signpost_enabled(v59))
          {
            uint64_t buf = 68289539;
            __int16 v84 = 2082;
            v85 = &unk_1A45670B7;
            __int16 v86 = 2082;
            v87 = "assert";
            __int16 v88 = 2081;
            v89 = "_delegateSilo";
            _os_signpost_emit_with_name_impl(&dword_1A4540000, v59, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Silo is necessary for reply delivery", "{\"msg%{public}.0s\":\"Silo is necessary for reply delivery\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
          }

          v42 = sub_1A455FF60();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            uint64_t buf = 68289539;
            __int16 v84 = 2082;
            v85 = &unk_1A45670B7;
            __int16 v86 = 2082;
            v87 = "assert";
            __int16 v88 = 2081;
            v89 = "_delegateSilo";
            _os_log_impl(&dword_1A4540000, v42, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Silo is necessary for reply delivery\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
          }
          goto LABEL_75;
        }
        id v61 = objc_loadWeakRetained((id *)&self->_delegate);
        id v62 = objc_loadWeakRetained((id *)&self->_delegateSilo);
        v21 = [v64 delegateSilo];
        __int16 v22 = (char *)operator new(0x30uLL);
        *((void *)v22 + 1) = 0;
        *((void *)v22 + 2) = 0;
        *(void *)__int16 v22 = &unk_1EF7F4A78;
        id v23 = v62;
        id v24 = v21;
        *((void *)v22 + 3) = 0;
        *((void *)v22 + 4) = 0;
        objc_storeStrong((id *)v22 + 3, v62);
        uint64_t v25 = v8;
        objc_storeStrong((id *)v22 + 4, v21);
        *((void *)v22 + 5) = CFRetain(cf);

        uint64_t v72 = MEMORY[0x1E4F143A8];
        uint64_t v73 = 3321888768;
        v74 = sub_1A45489E0;
        v75 = &unk_1EF7F4DC0;
        id v78 = cf;
        id v26 = v23;
        id v76 = v26;
        id v27 = v61;
        id v77 = v27;
        v79 = v22 + 24;
        v80 = v22;
        atomic_fetch_add_explicit((atomic_ullong *volatile)v22 + 1, 1uLL, memory_order_relaxed);
        v28 = (void *)__NSMakeSpecialForwardingCaptureBlock();
        id v82 = (id)[v28 copy];
        [v4 setArgument:&v82 atIndex:v25];

        if (v22) {
          sub_1A4547114((std::__shared_weak_count *)v22);
        }

        sub_1A4547114((std::__shared_weak_count *)v22);
      }
    }
    else
    {
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F5020);
      }
      id v10 = (id)qword_1EB30CE68;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        id v11 = [v65 description];
        uint64_t buf = 68289282;
        __int16 v84 = 2082;
        v85 = &unk_1A45670B7;
        __int16 v86 = 2114;
        v87 = v11;
        _os_log_impl(&dword_1A4540000, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"withReply: and void-returning block must be used in conjunction for correct reply handling\", \"selector\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
      }
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F5020);
      }
      id v12 = (id)qword_1EB30CE68;
      if (os_signpost_enabled(v12))
      {
        id v13 = [v65 description];
        uint64_t buf = 68289282;
        __int16 v84 = 2082;
        v85 = &unk_1A45670B7;
        __int16 v86 = 2114;
        v87 = v13;
        _os_signpost_emit_with_name_impl(&dword_1A4540000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "withReply: and void-returning block must be used in conjunction for correct reply handling", "{\"msg%{public}.0s\":\"withReply: and void-returning block must be used in conjunction for correct reply handling\", \"selector\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
      }
      id v14 = objc_loadWeakRetained((id *)&self->_delegate);
      if (v14)
      {
        id v15 = objc_loadWeakRetained((id *)&self->_delegateSilo);
        BOOL v16 = v15 != 0;

        if (v16 && v9 == 118) {
          goto LABEL_19;
        }
      }
    }
  }
  int v29 = [v65 returnAddressIndex];
  if (v29)
  {
    id v81 = 0;
    uint64_t v30 = v29;
    [v4 getArgument:&v81 atIndex:v29];
    id v31 = objc_loadWeakRetained((id *)&self->_delegate);
    v32 = v31;
    if (!v31 || (id v33 = v81, v81 == (id)CLISP_ME_TOKEN))
    {
    }
    else
    {
      id v34 = objc_loadWeakRetained((id *)&self->_delegate);
      BOOL v35 = v33 == v34;

      if (!v35)
      {
        id v36 = [MEMORY[0x1E4F1CA98] null];
        id v37 = objc_loadWeakRetained((id *)&self->_delegate);
        BOOL v38 = v36 == v37;

        v39 = sub_1A455FF60();
        BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_FAULT);
        if (v38)
        {
          if (v40)
          {
            uint64_t buf = 68289539;
            __int16 v84 = 2082;
            v85 = &unk_1A45670B7;
            __int16 v86 = 2082;
            v87 = "assert";
            __int16 v88 = 2081;
            v89 = "(id)[NSNull null] != _delegate";
            _os_log_impl(&dword_1A4540000, v39, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"A delegate must be set before sending messages with byref return address parameters\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
          }

          v60 = sub_1A455FF60();
          if (os_signpost_enabled(v60))
          {
            uint64_t buf = 68289539;
            __int16 v84 = 2082;
            v85 = &unk_1A45670B7;
            __int16 v86 = 2082;
            v87 = "assert";
            __int16 v88 = 2081;
            v89 = "(id)[NSNull null] != _delegate";
            _os_signpost_emit_with_name_impl(&dword_1A4540000, v60, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "A delegate must be set before sending messages with byref return address parameters", "{\"msg%{public}.0s\":\"A delegate must be set before sending messages with byref return address parameters\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
          }

          v42 = sub_1A455FF60();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            uint64_t buf = 68289539;
            __int16 v84 = 2082;
            v85 = &unk_1A45670B7;
            __int16 v86 = 2082;
            v87 = "assert";
            __int16 v88 = 2081;
            v89 = "(id)[NSNull null] != _delegate";
            _os_log_impl(&dword_1A4540000, v42, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"A delegate must be set before sending messages with byref return address parameters\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
          }
        }
        else
        {
          if (v40)
          {
            uint64_t buf = 68289539;
            __int16 v84 = 2082;
            v85 = &unk_1A45670B7;
            __int16 v86 = 2082;
            v87 = "assert";
            __int16 v88 = 2081;
            v89 = "__objc_no";
            _os_log_impl(&dword_1A4540000, v39, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"The object passed to byref return address parameters MUST BE the registered delegate\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
          }

          v41 = sub_1A455FF60();
          if (os_signpost_enabled(v41))
          {
            uint64_t buf = 68289539;
            __int16 v84 = 2082;
            v85 = &unk_1A45670B7;
            __int16 v86 = 2082;
            v87 = "assert";
            __int16 v88 = 2081;
            v89 = "__objc_no";
            _os_signpost_emit_with_name_impl(&dword_1A4540000, v41, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "The object passed to byref return address parameters MUST BE the registered delegate", "{\"msg%{public}.0s\":\"The object passed to byref return address parameters MUST BE the registered delegate\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
          }

          v42 = sub_1A455FF60();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            uint64_t buf = 68289539;
            __int16 v84 = 2082;
            v85 = &unk_1A45670B7;
            __int16 v86 = 2082;
            v87 = "assert";
            __int16 v88 = 2081;
            v89 = "__objc_no";
            _os_log_impl(&dword_1A4540000, v42, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"The object passed to byref return address parameters MUST BE the registered delegate\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
          }
        }
LABEL_75:

        abort_report_np();
        goto LABEL_76;
      }
    }
    id v81 = v64;
    [v4 setArgument:&v81 atIndex:v30];
  }
  if ([v4 argumentsRetained])
  {
    v53 = sub_1A455FF60();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
    {
      uint64_t buf = 68289539;
      __int16 v84 = 2082;
      v85 = &unk_1A45670B7;
      __int16 v86 = 2082;
      v87 = "assert";
      __int16 v88 = 2081;
      v89 = "![inv argumentsRetained]";
      _os_log_impl(&dword_1A4540000, v53, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Didn't expect the arguments to be retained before now\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
    }

    v54 = sub_1A455FF60();
    if (os_signpost_enabled(v54))
    {
      uint64_t buf = 68289539;
      __int16 v84 = 2082;
      v85 = &unk_1A45670B7;
      __int16 v86 = 2082;
      v87 = "assert";
      __int16 v88 = 2081;
      v89 = "![inv argumentsRetained]";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v54, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Didn't expect the arguments to be retained before now", "{\"msg%{public}.0s\":\"Didn't expect the arguments to be retained before now\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
    }

    v55 = sub_1A455FF60();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      uint64_t buf = 68289539;
      __int16 v84 = 2082;
      v85 = &unk_1A45670B7;
      __int16 v86 = 2082;
      v87 = "assert";
      __int16 v88 = 2081;
      v89 = "![inv argumentsRetained]";
      _os_log_impl(&dword_1A4540000, v55, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Didn't expect the arguments to be retained before now\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
    }

    abort_report_np();
    goto LABEL_76;
  }
  [v4 retainArguments];
  if (v82)
  {

    id v82 = 0;
  }
  v43 = [v64 delegateSilo];
  if (v43)
  {
    v44 = [v64 delegate];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A4542250;
    aBlock[3] = &unk_1E5B3EB98;
    id v45 = v44;
    id v67 = v45;
    v68 = self;
    id v69 = v4;
    id v46 = v65;
    id v70 = v46;
    id v71 = v64;
    v47 = _Block_copy(aBlock);
    v48 = [v46 sig];
    BOOL v49 = [v48 methodReturnLength] == 0;

    if (v49) {
      [v43 async:v47];
    }
    else {
      [(id)objc_opt_class() performSyncOnSilo:v43 invoker:v47];
    }
  }
}

- (CLSilo)delegateSilo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateSilo);
  return (CLSilo *)WeakRetained;
}

- (CLIntersiloProxyDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CLIntersiloProxyDelegateProtocol *)WeakRetained;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  id v4 = +[CLIntersiloInterface sharedInterface];
  LOBYTE(a3) = [v4 hasInfoForSelector:a3];

  return (char)a3;
}

- (id)peer
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1EB30CE70 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      id v10 = "assert";
      __int16 v11 = 2081;
      id v12 = "__objc_no";
      _os_log_impl(&dword_1A4540000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"-peer should never be invoked at this level...\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F5020);
      }
    }
    v3 = qword_1EB30CE68;
    if (os_signpost_enabled((os_log_t)qword_1EB30CE68))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      id v10 = "assert";
      __int16 v11 = 2081;
      id v12 = "__objc_no";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "-peer should never be invoked at this level...", "{\"msg%{public}.0s\":\"-peer should never be invoked at this level...\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F5020);
      }
    }
    id v4 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      id v10 = "assert";
      __int16 v11 = 2081;
      id v12 = "__objc_no";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"-peer should never be invoked at this level...\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EB30CE70, &unk_1EF7F5020);
  }
}

@end