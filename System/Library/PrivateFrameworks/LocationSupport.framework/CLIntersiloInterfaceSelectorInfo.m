@interface CLIntersiloInterfaceSelectorInfo
- (CLIntersiloInterfaceSelectorInfo)initWithSelector:(SEL)a3 andMethodSignature:(id)a4;
- (NSMethodSignature)sig;
- (NSString)typeStr;
- (SEL)sel;
- (id)description;
- (int)lastArgBlockIndex;
- (int)returnAddressIndex;
@end

@implementation CLIntersiloInterfaceSelectorInfo

- (NSMethodSignature)sig
{
  return self->_sig;
}

- (int)lastArgBlockIndex
{
  return self->_lastArgBlockIndex;
}

- (int)returnAddressIndex
{
  return self->_returnAddressIndex;
}

- (CLIntersiloInterfaceSelectorInfo)initWithSelector:(SEL)a3 andMethodSignature:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  int v8 = [v7 numberOfArguments];
  if (v8 < 32)
  {
    v50.receiver = self;
    v50.super_class = (Class)CLIntersiloInterfaceSelectorInfo;
    v9 = [(CLIntersiloInterfaceSelectorInfo *)&v50 init];
    v10 = v9;
    if (!v9)
    {
LABEL_28:

      return v10;
    }
    if (a3) {
      SEL v11 = a3;
    }
    else {
      SEL v11 = 0;
    }
    v9->_sel = v11;
    p_sel = &v9->_sel;
    p_sig = (id *)&v9->_sig;
    objc_storeStrong((id *)&v9->_sig, a4);
    if (*p_sel) {
      v14 = *p_sel;
    }
    else {
      v14 = 0;
    }
    v15 = NSStringFromSelector(v14);
    if ([*p_sig methodReturnLength])
    {
      if ([v15 hasPrefix:@"syncget"])
      {
        if (v8 < 3) {
          goto LABEL_27;
        }
        goto LABEL_22;
      }
      v40 = sub_1A4551420();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        uint64_t v41 = [v15 UTF8String];
        *(_DWORD *)buf = 68289795;
        int v52 = 0;
        __int16 v53 = 2082;
        v54 = &unk_1A45670B7;
        __int16 v55 = 2081;
        v56 = (const char *)v41;
        __int16 v57 = 2082;
        v58 = "assert";
        __int16 v59 = 2081;
        v60 = "0 == returnValueSize";
        _os_log_impl(&dword_1A4540000, v40, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Methods returning non-void must begin 'syncget...'\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }

      v42 = sub_1A4551420();
      if (os_signpost_enabled(v42))
      {
        uint64_t v43 = [v15 UTF8String];
        *(_DWORD *)buf = 68289795;
        int v52 = 0;
        __int16 v53 = 2082;
        v54 = &unk_1A45670B7;
        __int16 v55 = 2081;
        v56 = (const char *)v43;
        __int16 v57 = 2082;
        v58 = "assert";
        __int16 v59 = 2081;
        v60 = "0 == returnValueSize";
        _os_signpost_emit_with_name_impl(&dword_1A4540000, v42, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Methods returning non-void must begin 'syncget...'", "{\"msg%{public}.0s\":\"Methods returning non-void must begin 'syncget...'\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }

      v33 = sub_1A4551420();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        uint64_t v44 = [v15 UTF8String];
        *(_DWORD *)buf = 68289795;
        int v52 = 0;
        __int16 v53 = 2082;
        v54 = &unk_1A45670B7;
        __int16 v55 = 2081;
        v56 = (const char *)v44;
        __int16 v57 = 2082;
        v58 = "assert";
        __int16 v59 = 2081;
        v60 = "0 == returnValueSize";
        _os_log_impl(&dword_1A4540000, v33, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Methods returning non-void must begin 'syncget...'\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }
    }
    else if ([v15 hasPrefix:@"syncget"])
    {
      v45 = sub_1A4551420();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        uint64_t v46 = [v15 UTF8String];
        *(_DWORD *)buf = 68289795;
        int v52 = 0;
        __int16 v53 = 2082;
        v54 = &unk_1A45670B7;
        __int16 v55 = 2081;
        v56 = (const char *)v46;
        __int16 v57 = 2082;
        v58 = "assert";
        __int16 v59 = 2081;
        v60 = "0 != returnValueSize";
        _os_log_impl(&dword_1A4540000, v45, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Methods beginning 'syncget...' must return non-void\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }

      v47 = sub_1A4551420();
      if (os_signpost_enabled(v47))
      {
        uint64_t v48 = [v15 UTF8String];
        *(_DWORD *)buf = 68289795;
        int v52 = 0;
        __int16 v53 = 2082;
        v54 = &unk_1A45670B7;
        __int16 v55 = 2081;
        v56 = (const char *)v48;
        __int16 v57 = 2082;
        v58 = "assert";
        __int16 v59 = 2081;
        v60 = "0 != returnValueSize";
        _os_signpost_emit_with_name_impl(&dword_1A4540000, v47, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Methods beginning 'syncget...' must return non-void", "{\"msg%{public}.0s\":\"Methods beginning 'syncget...' must return non-void\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }

      v33 = sub_1A4551420();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        uint64_t v49 = [v15 UTF8String];
        *(_DWORD *)buf = 68289795;
        int v52 = 0;
        __int16 v53 = 2082;
        v54 = &unk_1A45670B7;
        __int16 v55 = 2081;
        v56 = (const char *)v49;
        __int16 v57 = 2082;
        v58 = "assert";
        __int16 v59 = 2081;
        v60 = "0 != returnValueSize";
        _os_log_impl(&dword_1A4540000, v33, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Methods beginning 'syncget...' must return non-void\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }
    }
    else
    {
      if (v8 < 3)
      {
LABEL_27:
        v21 = v10;

        goto LABEL_28;
      }
      if ([v15 hasSuffixInsensitive:@"doAsync:"])
      {
LABEL_22:
        uint64_t v19 = v8;
        uint64_t v20 = 2;
        while (1)
        {
          if (!strcmp("R@", (const char *)[*p_sig getArgumentTypeAtIndex:v20]))
          {
            if (v10->_returnAddressIndex)
            {
              v23 = sub_1A4551420();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 68289539;
                int v52 = 0;
                __int16 v53 = 2082;
                v54 = &unk_1A45670B7;
                __int16 v55 = 2082;
                v56 = "assert";
                __int16 v57 = 2081;
                v58 = "0 == _returnAddressIndex";
                _os_log_impl(&dword_1A4540000, v23, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
              }

              v24 = sub_1A4551420();
              if (os_signpost_enabled(v24))
              {
                *(_DWORD *)buf = 68289539;
                int v52 = 0;
                __int16 v53 = 2082;
                v54 = &unk_1A45670B7;
                __int16 v55 = 2082;
                v56 = "assert";
                __int16 v57 = 2081;
                v58 = "0 == _returnAddressIndex";
                _os_signpost_emit_with_name_impl(&dword_1A4540000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
              }

              v25 = sub_1A4551420();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 68289539;
                int v52 = 0;
                __int16 v53 = 2082;
                v54 = &unk_1A45670B7;
                __int16 v55 = 2082;
                v56 = "assert";
                __int16 v57 = 2081;
                v58 = "0 == _returnAddressIndex";
                _os_log_impl(&dword_1A4540000, v25, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
              }

              result = (CLIntersiloInterfaceSelectorInfo *)abort_report_np();
              goto LABEL_71;
            }
            v10->_returnAddressIndex = v20;
          }
          if (v19 == ++v20) {
            goto LABEL_27;
          }
        }
      }
      uint64_t v16 = [v15 rangeOfString:@"withReply:" options:1];
      int v17 = strcmp((const char *)[*p_sig getArgumentTypeAtIndex:(v8 - 1)], "@?");
      if (!v17) {
        v10->_lastArgBlockIndex = v8 - 1;
      }
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v10->_lastArgBlockIndex = -v10->_lastArgBlockIndex;
        goto LABEL_22;
      }
      uint64_t v18 = [v15 length];
      if (v16 == v18 - [@"withReply:" length])
      {
        if (!v17) {
          goto LABEL_22;
        }
        v35 = sub_1A4551420();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          uint64_t v36 = [v15 UTF8String];
          *(_DWORD *)buf = 68289795;
          int v52 = 0;
          __int16 v53 = 2082;
          v54 = &unk_1A45670B7;
          __int16 v55 = 2081;
          v56 = (const char *)v36;
          __int16 v57 = 2082;
          v58 = "assert";
          __int16 v59 = 2081;
          v60 = "isLastArgBlockType";
          _os_log_impl(&dword_1A4540000, v35, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"withReply: argument name should only take block type argument\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
        }

        v37 = sub_1A4551420();
        if (os_signpost_enabled(v37))
        {
          uint64_t v38 = [v15 UTF8String];
          *(_DWORD *)buf = 68289795;
          int v52 = 0;
          __int16 v53 = 2082;
          v54 = &unk_1A45670B7;
          __int16 v55 = 2081;
          v56 = (const char *)v38;
          __int16 v57 = 2082;
          v58 = "assert";
          __int16 v59 = 2081;
          v60 = "isLastArgBlockType";
          _os_signpost_emit_with_name_impl(&dword_1A4540000, v37, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "withReply: argument name should only take block type argument", "{\"msg%{public}.0s\":\"withReply: argument name should only take block type argument\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
        }

        v33 = sub_1A4551420();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          uint64_t v39 = [v15 UTF8String];
          *(_DWORD *)buf = 68289795;
          int v52 = 0;
          __int16 v53 = 2082;
          v54 = &unk_1A45670B7;
          __int16 v55 = 2081;
          v56 = (const char *)v39;
          __int16 v57 = 2082;
          v58 = "assert";
          __int16 v59 = 2081;
          v60 = "isLastArgBlockType";
          _os_log_impl(&dword_1A4540000, v33, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"withReply: argument name should only take block type argument\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
        }
      }
      else
      {
        v29 = sub_1A4551420();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          uint64_t v30 = [v15 UTF8String];
          *(_DWORD *)buf = 68289795;
          int v52 = 0;
          __int16 v53 = 2082;
          v54 = &unk_1A45670B7;
          __int16 v55 = 2081;
          v56 = (const char *)v30;
          __int16 v57 = 2082;
          v58 = "assert";
          __int16 v59 = 2081;
          v60 = "subStringRange.location == (selStr.length - subString.length)";
          _os_log_impl(&dword_1A4540000, v29, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"withReply: can only be used at the end of a method name\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
        }

        v31 = sub_1A4551420();
        if (os_signpost_enabled(v31))
        {
          uint64_t v32 = [v15 UTF8String];
          *(_DWORD *)buf = 68289795;
          int v52 = 0;
          __int16 v53 = 2082;
          v54 = &unk_1A45670B7;
          __int16 v55 = 2081;
          v56 = (const char *)v32;
          __int16 v57 = 2082;
          v58 = "assert";
          __int16 v59 = 2081;
          v60 = "subStringRange.location == (selStr.length - subString.length)";
          _os_signpost_emit_with_name_impl(&dword_1A4540000, v31, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "withReply: can only be used at the end of a method name", "{\"msg%{public}.0s\":\"withReply: can only be used at the end of a method name\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
        }

        v33 = sub_1A4551420();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          uint64_t v34 = [v15 UTF8String];
          *(_DWORD *)buf = 68289795;
          int v52 = 0;
          __int16 v53 = 2082;
          v54 = &unk_1A45670B7;
          __int16 v55 = 2081;
          v56 = (const char *)v34;
          __int16 v57 = 2082;
          v58 = "assert";
          __int16 v59 = 2081;
          v60 = "subStringRange.location == (selStr.length - subString.length)";
          _os_log_impl(&dword_1A4540000, v33, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"withReply: can only be used at the end of a method name\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
        }
      }
    }

    result = (CLIntersiloInterfaceSelectorInfo *)abort_report_np();
    goto LABEL_71;
  }
  v26 = sub_1A4551420();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 68289539;
    int v52 = 0;
    __int16 v53 = 2082;
    v54 = &unk_1A45670B7;
    __int16 v55 = 2082;
    v56 = "assert";
    __int16 v57 = 2081;
    v58 = "32 > numArguments";
    _os_log_impl(&dword_1A4540000, v26, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Too many arguments to selector in IntersiloInterface\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  v27 = sub_1A4551420();
  if (os_signpost_enabled(v27))
  {
    *(_DWORD *)buf = 68289539;
    int v52 = 0;
    __int16 v53 = 2082;
    v54 = &unk_1A45670B7;
    __int16 v55 = 2082;
    v56 = "assert";
    __int16 v57 = 2081;
    v58 = "32 > numArguments";
    _os_signpost_emit_with_name_impl(&dword_1A4540000, v27, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Too many arguments to selector in IntersiloInterface", "{\"msg%{public}.0s\":\"Too many arguments to selector in IntersiloInterface\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  v28 = sub_1A4551420();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289539;
    int v52 = 0;
    __int16 v53 = 2082;
    v54 = &unk_1A45670B7;
    __int16 v55 = 2082;
    v56 = "assert";
    __int16 v57 = 2081;
    v58 = "32 > numArguments";
    _os_log_impl(&dword_1A4540000, v28, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Too many arguments to selector in IntersiloInterface\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  result = (CLIntersiloInterfaceSelectorInfo *)abort_report_np();
LABEL_71:
  __break(1u);
  return result;
}

- (NSString)typeStr
{
  return (NSString *)MEMORY[0x1F4181798](self->_sig, sel__cTypeString);
}

- (id)description
{
  v2 = [(CLIntersiloInterfaceSelectorInfo *)self sel];
  return NSStringFromSelector(v2);
}

- (SEL)sel
{
  if (self->_sel) {
    return self->_sel;
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
}

@end