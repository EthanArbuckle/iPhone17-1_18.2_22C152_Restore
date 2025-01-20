void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_19C756578(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id BSServiceXPCLog()
{
  if (BSServiceXPCLog_onceToken != -1) {
    dispatch_once(&BSServiceXPCLog_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)BSServiceXPCLog___logObj;

  return v0;
}

void sub_19C7572D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *a10, id *a11)
{
  if (v13)
  {
  }
  _Unwind_Resume(a1);
}

void sub_19C75756C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C757754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C757E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_19C758338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_19C7584A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7588FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void BSXPCServiceConnectionExecuteCallOut(os_unfair_lock_s *a1, void *a2, uint64_t a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v5 = a2;
  if (!a3)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"block"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSXPCServiceConnectionExecuteCallOut(BSXPCServiceConnection *const __strong _Nonnull, __strong id _Nullable, const __strong dispatch_block_t _Nonnull)");
      *(_DWORD *)buf = 138544130;
      v33 = v17;
      __int16 v34 = 2114;
      v35 = @"BSXPCServiceConnection.m";
      __int16 v36 = 1024;
      int v37 = 1293;
      __int16 v38 = 2114;
      v39 = v16;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C758BACLL);
  }
  if (!v5)
  {
    uint64_t v6 = -[BSXPCServiceConnection _eventHandler](a1);
    v7 = (void *)v6;
    v8 = v6 ? *(void **)(v6 + 136) : 0;
    v9 = v8;
    v10 = v9;
    v11 = v9 ? v9 : a1;
    v30 = v11;

    v5 = v30;
    if (!v30)
    {
      v18 = NSString;
      v19 = -[BSXPCServiceConnection _eventHandler](a1);
      uint64_t v20 = -[BSXPCServiceConnection _eventHandler](a1);
      v21 = (void *)v20;
      if (v20) {
        v22 = *(void **)(v20 + 136);
      }
      else {
        v22 = 0;
      }
      id v23 = v22;
      v24 = [v18 stringWithFormat:@"failure to find context to execute call out : param=%@ connection=%@ eventHandler=%@ (%@)", 0, a1, v19, v23];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v25 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSXPCServiceConnectionExecuteCallOut(BSXPCServiceConnection *const __strong _Nonnull, __strong id _Nullable, const __strong dispatch_block_t _Nonnull)");
        *(_DWORD *)buf = 138544130;
        v33 = v25;
        __int16 v34 = 2114;
        v35 = @"BSXPCServiceConnection.m";
        __int16 v36 = 1024;
        int v37 = 1299;
        __int16 v38 = 2114;
        v39 = v24;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      [v24 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C758CBCLL);
    }
  }
  v31 = v5;
  v12 = [MEMORY[0x1E4F29060] currentThread];
  v13 = [v12 threadDictionary];

  if (!v13)
  {
    v26 = NSString;
    v27 = [MEMORY[0x1E4F29060] currentThread];
    v28 = [v26 stringWithFormat:@"missing thread-local storage on %@", v27];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v29 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSXPCServiceConnectionExecuteCallOut(BSXPCServiceConnection *const __strong _Nonnull, __strong id _Nullable, const __strong dispatch_block_t _Nonnull)");
      *(_DWORD *)buf = 138544130;
      v33 = v29;
      __int16 v34 = 2114;
      v35 = @"BSXPCServiceConnection.m";
      __int16 v36 = 1024;
      int v37 = 1302;
      __int16 v38 = 2114;
      v39 = v28;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C758DA0);
  }
  v14 = [v13 objectForKey:@"BSXPCCurrentContext"];
  v15 = (void *)MEMORY[0x19F3998C0]([v13 setObject:v31 forKey:@"BSXPCCurrentContext"]);
  (*(void (**)(uint64_t))(a3 + 16))(a3);
  if (v14) {
    [v13 setObject:v14 forKey:@"BSXPCCurrentContext"];
  }
  else {
    [v13 removeObjectForKey:@"BSXPCCurrentContext"];
  }
}

void sub_19C758DB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  _Unwind_Resume(a1);
}

void sub_19C7591D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C759474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C75994C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C759B90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C759C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C75A7C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C75ABE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_19C75ADE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C75AF88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C75B4E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C75B7C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _Unwind_Exception *exception_object, id a16)
{
  _Unwind_Resume(a1);
}

void __vetProtocol(void *a1)
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v84 = a1;
  uint64_t v120 = 0;
  v121 = &v120;
  uint64_t v122 = 0x3032000000;
  v123 = __Block_byref_object_copy__1;
  v124 = __Block_byref_object_dispose__1;
  id v125 = 0;
  v118[0] = 0;
  v118[1] = v118;
  v118[2] = 0x2020000000;
  char v119 = 0;
  v117[0] = MEMORY[0x1E4F143A8];
  v117[1] = 3221225472;
  v117[2] = ____vetProtocol_block_invoke;
  v117[3] = &unk_1E58FC658;
  v117[4] = &v120;
  v117[5] = v118;
  uint64_t v1 = (void (**)(void, void, void, void))MEMORY[0x19F399B00](v117);
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  obuint64_t j = [v84 methods];
  uint64_t v87 = [obj countByEnumeratingWithState:&v113 objects:v139 count:16];
  if (v87)
  {
    uint64_t v86 = *(void *)v114;
    do
    {
      uint64_t v88 = 0;
      do
      {
        if (*(void *)v114 != v86) {
          objc_enumerationMutation(obj);
        }
        v2 = *(void **)(*((void *)&v113 + 1) + 8 * v88);
        v3 = [v2 arguments];
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        id v92 = v3;
        uint64_t v4 = [v92 countByEnumeratingWithState:&v109 objects:v138 count:16];
        if (v4)
        {
          uint64_t v5 = *(void *)v110;
          do
          {
            uint64_t v6 = 0;
            do
            {
              if (*(void *)v110 != v5) {
                objc_enumerationMutation(v92);
              }
              v7 = *(void **)(*((void *)&v109 + 1) + 8 * v6);
              if ([v7 size] != 8) {
                ((void (**)(void, void *, void *, __CFString *))v1)[2](v1, v2, v7, @"protocol methods and blocks may only accept pointer-sized arguments");
              }
              if ([v7 argumentIndex] >= 10) {
                ((void (**)(void, void *, void *, __CFString *))v1)[2](v1, v2, v7, @"argument index is out of bounds");
              }
              int v8 = [v7 type];
              if ((v8 & 0xFFFFFFFD) == 0x64) {
                ((void (**)(void, void *, void *, __CFString *))v1)[2](v1, v2, v7, @"floating point arguments are not allowed");
              }
              if (v8 > 0x5Du)
              {
                if (v8 == 94) {
                  goto LABEL_36;
                }
                if (v8 != 123 && v8 != 98) {
                  goto LABEL_27;
                }
              }
              else if (v8 != 40)
              {
                if (v8 == 64) {
                  goto LABEL_28;
                }
                if (v8 != 91) {
                  goto LABEL_27;
                }
              }
              ((void (**)(void, void *, void *, __CFString *))v1)[2](v1, v2, v7, @"c structs and bitfields unions, etc, are not allowed");
              if (v8 != 64)
              {
                if (v8 == 94) {
                  goto LABEL_36;
                }
LABEL_27:
                ((void (**)(void, void *, void *, __CFString *))v1)[2](v1, v2, v7, @"only objects and pointers are allowed");
                if (v8 != 64) {
                  goto LABEL_36;
                }
              }
LABEL_28:
              if (([v7 isXPCObject] & 1) == 0 && (objc_msgSend(v7, "isBlock") & 1) == 0)
              {
                v9 = (void *)[v7 objectClass];
                if (([v9 isSubclassOfClass:objc_opt_class()] & 1) != 0
                  || ([v9 isSubclassOfClass:objc_opt_class()] & 1) != 0
                  || [v9 isSubclassOfClass:objc_opt_class()])
                {
                  v10 = [v7 objectContainedClasses];
                  uint64_t v11 = [v10 firstObject];

                  if (!v11
                    || (__disallowedValueClasses(),
                        v12 = objc_claimAutoreleasedReturnValue(),
                        int v13 = [v12 containsObject:v11],
                        v12,
                        v13))
                  {
                    ((void (**)(void, void *, void *, __CFString *))v1)[2](v1, v2, v7, @"collections must specify a valid value class");
                  }
                }
                else if ([v9 isSubclassOfClass:objc_opt_class()])
                {
                  v14 = [v7 objectContainedClasses];
                  if ([v14 count])
                  {
                    uint64_t v15 = [v14 firstObject];
                    if (v15 != objc_opt_class()) {
                      ((void (**)(void, void *, void *, __CFString *))v1)[2](v1, v2, v7, @"dictionary keys must be of type NSString");
                    }
                    v16 = __disallowedValueClasses();
                    int v17 = objc_msgSend(v16, "containsObject:", objc_msgSend(v14, "lastObject"));

                    if (v17) {
                      ((void (**)(void, void *, void *, __CFString *))v1)[2](v1, v2, v7, @"dictionary value must be a concrete, non-collection type");
                    }
                    if ([v14 count] != 2) {
                      ((void (**)(void, void *, void *, __CFString *))v1)[2](v1, v2, v7, @"dictionaries must specify both their key and value classes");
                    }
                  }
                }
                else if (!v9 || v9 == objc_opt_class())
                {
                  ((void (**)(void, void *, void *, __CFString *))v1)[2](v1, v2, v7, @"parameter objects must be concrete types");
                }
              }
LABEL_36:
              ++v6;
            }
            while (v4 != v6);
            uint64_t v18 = [v92 countByEnumeratingWithState:&v109 objects:v138 count:16];
            uint64_t v4 = v18;
          }
          while (v18);
        }

        v89 = [v2 returnValue];
        v19 = [v92 lastObject];
        if ([v19 isPointer])
        {
          id v91 = [v92 lastObject];
        }
        else
        {
          id v91 = 0;
        }

        uint64_t v20 = [v92 lastObject];
        if ([v20 isBlock])
        {
          id v21 = [v92 lastObject];
        }
        else
        {
          id v21 = 0;
        }

        if [v89 isVoid] && (objc_msgSend(v89, "isOneWay"))
        {
          long long v99 = 0u;
          long long v100 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          id v22 = v92;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v97 objects:v135 count:16];
          if (v23)
          {
            uint64_t v24 = *(void *)v98;
            do
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v98 != v24) {
                  objc_enumerationMutation(v22);
                }
                id v26 = *(id *)(*((void *)&v97 + 1) + 8 * i);
                int v27 = [v26 isBlock];
                if (v26 == v21) {
                  int v28 = 0;
                }
                else {
                  int v28 = v27;
                }
                if (v28 == 1) {
                  ((void (**)(void, void *, id, __CFString *))v1)[2](v1, v2, v26, @"methods may only contain one block parameter, and it must be the last");
                }
                if ([v26 isPointer]) {
                  ((void (**)(void, void *, id, __CFString *))v1)[2](v1, v2, v26, @"Async method cannot contain an out-parameter");
                }
              }
              uint64_t v23 = [v22 countByEnumeratingWithState:&v97 objects:v135 count:16];
            }
            while (v23);
          }
        }
        else
        {
          if ([v89 isVoid])
          {
            long long v107 = 0u;
            long long v108 = 0u;
            long long v105 = 0u;
            long long v106 = 0u;
            id v29 = v92;
            uint64_t v30 = [v29 countByEnumeratingWithState:&v105 objects:v137 count:16];
            if (v30)
            {
              uint64_t v31 = *(void *)v106;
              do
              {
                for (uint64_t j = 0; j != v30; ++j)
                {
                  if (*(void *)v106 != v31) {
                    objc_enumerationMutation(v29);
                  }
                  id v33 = *(id *)(*((void *)&v105 + 1) + 8 * j);
                  int v34 = [v33 isBlock];
                  if (v33 == v21) {
                    int v35 = 0;
                  }
                  else {
                    int v35 = v34;
                  }
                  if (v35 == 1) {
                    ((void (**)(void, void *, id, __CFString *))v1)[2](v1, v2, v33, @"a reply block may only be the last argument of a method");
                  }
                  int v36 = [v33 isPointer];
                  if (v33 == v91) {
                    int v37 = 0;
                  }
                  else {
                    int v37 = v36;
                  }
                  if (v37 == 1) {
                    ((void (**)(void, void *, id, __CFString *))v1)[2](v1, v2, v33, @"an NSError out-param may only be the last argument of a method");
                  }
                }
                uint64_t v30 = [v29 countByEnumeratingWithState:&v105 objects:v137 count:16];
              }
              while (v30);
            }
          }
          else
          {
            if ([v89 isObject] && (objc_msgSend(v89, "isBlock") & 1) == 0)
            {
              if (([v89 isXPCObject] & 1) == 0)
              {
                __int16 v38 = (void *)[v89 objectClass];
                if (([v38 isSubclassOfClass:objc_opt_class()] & 1) != 0
                  || ([v38 isSubclassOfClass:objc_opt_class()] & 1) != 0
                  || [v38 isSubclassOfClass:objc_opt_class()])
                {
                  v39 = [v89 objectContainedClasses];
                  uint64_t v40 = [v39 firstObject];

                  if (!v40
                    || (__disallowedValueClasses(),
                        v41 = objc_claimAutoreleasedReturnValue(),
                        int v42 = [v41 containsObject:v40],
                        v41,
                        v42))
                  {
                    ((void (**)(void, void *, void, __CFString *))v1)[2](v1, v2, 0, @"collections must specify a valid value class");
                  }
                }
                else if ([v38 isSubclassOfClass:objc_opt_class()])
                {
                  v69 = [v89 objectContainedClasses];
                  if ([v69 count])
                  {
                    uint64_t v70 = [v69 firstObject];
                    if (v70 != objc_opt_class()) {
                      ((void (**)(void, void *, void, __CFString *))v1)[2](v1, v2, 0, @"dictionary keys must be of type NSString");
                    }
                    v71 = __disallowedValueClasses();
                    int v72 = objc_msgSend(v71, "containsObject:", objc_msgSend(v69, "lastObject"));

                    if (v72) {
                      ((void (**)(void, void *, void, __CFString *))v1)[2](v1, v2, 0, @"dictionary value must be a concrete, non-collection type");
                    }
                    if ([v69 count] != 2) {
                      ((void (**)(void, void *, void, __CFString *))v1)[2](v1, v2, 0, @"dictionaries must specify both their key and value classes");
                    }
                  }
                }
                else if (!v38 || v38 == objc_opt_class())
                {
                  ((void (**)(void, void *, void, __CFString *))v1)[2](v1, v2, 0, @"returned objects must be concrete types");
                }
              }
            }
            else if (([v89 isBoolean] & 1) == 0)
            {
              ((void (**)(void, void *, void, __CFString *))v1)[2](v1, v2, 0, @"synchronous method has invalid return type");
            }
            long long v103 = 0u;
            long long v104 = 0u;
            long long v101 = 0u;
            long long v102 = 0u;
            id v43 = v92;
            uint64_t v44 = [v43 countByEnumeratingWithState:&v101 objects:v136 count:16];
            if (v44)
            {
              uint64_t v45 = *(void *)v102;
              do
              {
                for (uint64_t k = 0; k != v44; ++k)
                {
                  if (*(void *)v102 != v45) {
                    objc_enumerationMutation(v43);
                  }
                  v47 = *(void **)(*((void *)&v101 + 1) + 8 * k);
                  if ([v47 isBlock]) {
                    ((void (**)(void, void *, void *, __CFString *))v1)[2](v1, v2, v47, @"a method with a return value may not also provide a block");
                  }
                }
                uint64_t v44 = [v43 countByEnumeratingWithState:&v101 objects:v136 count:16];
              }
              while (v44);
            }
          }

          if ([v89 hasQualifier:82]) {
            ((void (**)(void, void *, void, __CFString *))v1)[2](v1, v2, 0, @"a synchronous method may not opt in to batching");
          }
        }
        char v48 = [v89 isVoid];
        if (v21) {
          char v49 = v48;
        }
        else {
          char v49 = 1;
        }
        if ((v49 & 1) == 0) {
          ((void (**)(void, void *, void, __CFString *))v1)[2](v1, v2, 0, @"Method cannot have both a sync and async return value");
        }
        if (v91)
        {
          if ([v89 isVoid] && objc_msgSend(v89, "isOneWay")) {
            ((void (**)(void, void *, void, __CFString *))v1)[2](v1, v2, 0, @"Asynchronous message cannot contain an out-parameter");
          }
          if ([v91 isObjectNonnull]) {
            ((void (**)(void, void *, void, __CFString *))v1)[2](v1, v2, 0, @"NSError out parameter cannot be nonnull");
          }
        }
        if (v21)
        {
          v50 = [v21 blockArguments];
          long long v95 = 0u;
          long long v96 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          id v51 = v50;
          uint64_t v52 = [v51 countByEnumeratingWithState:&v93 objects:v134 count:16];
          if (v52)
          {
            uint64_t v53 = *(void *)v94;
            do
            {
              uint64_t v54 = 0;
              do
              {
                if (*(void *)v94 != v53) {
                  objc_enumerationMutation(v51);
                }
                v55 = *(void **)(*((void *)&v93 + 1) + 8 * v54);
                int v56 = [v55 isObject];
                v57 = @"Arguments of reply block must be objects";
                if (v56
                  && (char v58 = [v55 isBlock],
                      v57 = @"Arguments of reply block cannot be blocks",
                      (v58 & 1) == 0))
                {
                  if (([v55 isXPCObject] & 1) == 0)
                  {
                    v59 = (void *)[v55 objectClass];
                    if (([v59 isSubclassOfClass:objc_opt_class()] & 1) != 0
                      || ([v59 isSubclassOfClass:objc_opt_class()] & 1) != 0
                      || [v59 isSubclassOfClass:objc_opt_class()])
                    {
                      v60 = [v55 objectContainedClasses];
                      uint64_t v61 = [v60 firstObject];

                      if (!v61
                        || (__disallowedValueClasses(),
                            v62 = objc_claimAutoreleasedReturnValue(),
                            int v63 = [v62 containsObject:v61],
                            v62,
                            v63))
                      {
                        ((void (**)(void, void *, id, __CFString *))v1)[2](v1, v2, v21, @"collections must specify a valid value class");
                      }
                    }
                    else if ([v59 isSubclassOfClass:objc_opt_class()])
                    {
                      v90 = [v55 objectContainedClasses];
                      if ([v90 count])
                      {
                        uint64_t v64 = [v90 firstObject];
                        if (v64 != objc_opt_class()) {
                          ((void (**)(void, void *, id, __CFString *))v1)[2](v1, v2, v21, @"dictionary keys must be of type NSString");
                        }
                        v65 = __disallowedValueClasses();
                        int v66 = objc_msgSend(v65, "containsObject:", objc_msgSend(v90, "lastObject"));

                        if (v66) {
                          ((void (**)(void, void *, id, __CFString *))v1)[2](v1, v2, v21, @"dictionary value must be a concrete, non-collection type");
                        }
                        if ([v90 count] != 2) {
                          ((void (**)(void, void *, id, __CFString *))v1)[2](v1, v2, v21, @"dictionaries must specify both their key and value classes");
                        }
                      }
                    }
                    else if (!v59 || v59 == objc_opt_class())
                    {
                      ((void (**)(void, void *, id, __CFString *))v1)[2](v1, v2, v21, @"Arguments of reply block must be concrete types");
                    }
                  }
                }
                else
                {
                  ((void (**)(void, void *, id, __CFString *))v1)[2](v1, v2, v21, v57);
                }
                ++v54;
              }
              while (v52 != v54);
              uint64_t v67 = [v51 countByEnumeratingWithState:&v93 objects:v134 count:16];
              uint64_t v52 = v67;
            }
            while (v67);
          }

          if (![v51 count] || (unint64_t)objc_msgSend(v51, "count") >= 0xB) {
            ((void (**)(void, void *, id, __CFString *))v1)[2](v1, v2, v21, @"Reply block contains an invalid number of arguments");
          }
          v68 = [v51 lastObject];
          if ((objc_msgSend((id)objc_msgSend(v68, "objectClass"), "isSubclassOfClass:", objc_opt_class()) & 1) == 0) {
            ((void (**)(void, void *, id, __CFString *))v1)[2](v1, v2, v21, @"Reply block signature does not contain required NSError as last parameter");
          }
          if ([v68 isObjectNonnull]) {
            ((void (**)(void, void *, id, __CFString *))v1)[2](v1, v2, v21, @"It does not make sense to declare an error parameter as nonnull");
          }
          if ([v89 hasQualifier:82] && objc_msgSend(v51, "count") != 1) {
            ((void (**)(void, void *, id, __CFString *))v1)[2](v1, v2, v21, @"a batchable method may only accept blocks with a single NSError parameter");
          }
        }
        ++v88;
      }
      while (v88 != v87);
      uint64_t v73 = [obj countByEnumeratingWithState:&v113 objects:v139 count:16];
      uint64_t v87 = v73;
    }
    while (v73);
  }

  if ([(id)v121[5] count])
  {
    v74 = MEMORY[0x1E4F14500];
    id v75 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
      id v76 = [v84 name];
      v77 = (__CFString *)v121[5];
      *(_DWORD *)buf = 138412546;
      id v127 = v76;
      __int16 v128 = 2112;
      v129 = v77;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Non-conforming methods on protocol '%@':%@", buf, 0x16u);
    }
    v78 = NSString;
    v79 = [v84 name];
    v80 = [v78 stringWithFormat:@"Non-conforming methods on protocol '%@':%@", v79, v121[5]];

    v81 = MEMORY[0x1E4F14500];
    id v82 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
    {
      v83 = [NSString stringWithUTF8String:"void __vetProtocol(BSObjCProtocol *__strong)"];
      *(_DWORD *)buf = 138544130;
      id v127 = v83;
      __int16 v128 = 2114;
      v129 = @"BSServiceInterface.m";
      __int16 v130 = 1024;
      int v131 = 274;
      __int16 v132 = 2114;
      v133 = v80;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v80 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C75CDD8);
  }

  _Block_object_dispose(v118, 8);
  _Block_object_dispose(&v120, 8);
}

void sub_19C75CDE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose(&STACK[0x230], 8);

  _Unwind_Resume(a1);
}

void sub_19C75DCB8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, long long buf, int a20,__int16 a21,__int16 a22,uint64_t a23,long long a24)
{
  if (a2 == 1)
  {
    id v25 = objc_begin_catch(a1);
    id v26 = BSServiceXPCErrorsLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      if (a18 && (uint64_t v27 = *(void *)(a18 + 176)) != 0) {
        uint64_t v28 = *(void *)(v27 + 8);
      }
      else {
        uint64_t v28 = 0;
      }
      uint64_t v29 = [v24 argumentName];
      uint64_t v30 = [v24 argumentIndex];
      uint64_t v31 = [v25 description];
      LODWORD(buf) = 138544130;
      *(void *)((char *)&buf + 4) = v28;
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = v29;
      a22 = 2048;
      a23 = v30;
      LOWORD(a24) = 2112;
      *(void *)((char *)&a24 + 2) = v31;
      _os_log_error_impl(&dword_19C754000, v26, OS_LOG_TYPE_ERROR, "%{public}@ Exception thrown while decoding argument \"%@\" (index %ld): %@", (uint8_t *)&buf, 0x2Au);
    }
    objc_exception_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_19C75F494(_Unwind_Exception *a1)
{
}

void sub_19C75F798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id __disallowedValueClasses()
{
  if (qword_1EB27F818 != -1) {
    dispatch_once(&qword_1EB27F818, &__block_literal_global_258);
  }
  v0 = (void *)qword_1EB27F810;

  return v0;
}

void sub_19C75FB28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7600E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C760704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_19C760968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C761048(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C761710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_19C761FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_19C762258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_19C762488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C762834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,void *a21)
{
  _Unwind_Resume(a1);
}

id BSServiceLog()
{
  if (BSServiceLog_onceToken != -1) {
    dispatch_once(&BSServiceLog_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)BSServiceLog___logObj;

  return v0;
}

void sub_19C762DD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C762EB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C763158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSServiceXPCErrorsLog()
{
  if (BSServiceXPCErrorsLog_onceToken != -1) {
    dispatch_once(&BSServiceXPCErrorsLog_onceToken, &__block_literal_global_16);
  }
  v0 = (void *)BSServiceXPCErrorsLog___logObj;

  return v0;
}

void *__getRBSServiceInitializeSymbolLoc_block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!qword_1EB27F858)
  {
    v5[1] = (void *)MEMORY[0x1E4F143A8];
    v5[2] = (void *)3221225472;
    v5[3] = __RunningBoardServicesLibraryCore_block_invoke_2;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E58FC888;
    uint64_t v7 = 0;
    qword_1EB27F858 = _sl_dlopen();
  }
  v2 = (void *)qword_1EB27F858;
  if (!qword_1EB27F858)
  {
    a1 = [MEMORY[0x1E4F28B00] currentHandler];
    v2 = [NSString stringWithUTF8String:"void *RunningBoardServicesLibrary(void)"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, @"BSServiceManager.m", 27, @"%s", v5[0]);

    __break(1u);
    goto LABEL_7;
  }
  v3 = v5[0];
  if (v5[0]) {
LABEL_7:
  }
    free(v3);
  result = dlsym(v2, "RBSServiceInitialize");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  off_1EB27F850 = *(_UNKNOWN **)(*(void *)(a1[4] + 8) + 24);
  return result;
}

void sub_19C763DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_19C763EEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C763FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_19C764630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76479C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C764824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C7651DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76571C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76581C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C766D54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7673EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C767724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C767990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C767A5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C767CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  a11.super_class = (Class)BSXPCServiceConnectionActivationMessage;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_19C767D04(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_19C767D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ____handleEvent_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 56) copy];
    uint64_t v4 = *(void **)(a2 + 168);
    *(void *)(a2 + 168) = v3;
  }
}

void sub_19C767EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_19C767FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_19C768080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_19C768224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C768498(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C768678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C768A70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C768BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C768C68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C768F98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7691AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C769270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C7693E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C769548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7695B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C769A8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C769D74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C769F44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76A1FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_19C76A438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_19C76A5CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19C76A8EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76AA1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76AB0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76AF38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76B27C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76B36C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76B880(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76B9DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76BA98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76BB30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76BD44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76C1E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getRBSTargetClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getRBSTargetClass_softClass;
  uint64_t v7 = getRBSTargetClass_softClass;
  if (!getRBSTargetClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getRBSTargetClass_block_invoke;
    v3[3] = &unk_1E58FBE80;
    v3[4] = &v4;
    __getRBSTargetClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_19C76C348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C76C928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __getRBSTargetClass_block_invoke(uint64_t a1)
{
  RunningBoardServicesLibrary_2();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("RBSTarget");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRBSTargetClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getRBSTargetClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BSXPCServiceConnection.m", 34, @"Unable to find class %s", "RBSTarget");

    __break(1u);
  }
}

void sub_19C76CAD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void RunningBoardServicesLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!RunningBoardServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __RunningBoardServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E58FBEA0;
    uint64_t v5 = 0;
    RunningBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!RunningBoardServicesLibraryCore_frameworkLibrary)
  {
    id v1 = [MEMORY[0x1E4F28B00] currentHandler];
    v2 = [NSString stringWithUTF8String:"void *RunningBoardServicesLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"BSServiceConnectionEndpointInjector.m", 27, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

void sub_19C76CC48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void *RunningBoardServicesLibrary_0()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!RunningBoardServicesLibraryCore_frameworkLibrary_0)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __RunningBoardServicesLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E58FC068;
    uint64_t v6 = 0;
    RunningBoardServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  v0 = (void *)RunningBoardServicesLibraryCore_frameworkLibrary_0;
  if (!RunningBoardServicesLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"void *RunningBoardServicesLibrary(void)"];
    id v1 = objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"BSXPCServiceConnectionProxy.m", 28, @"%s", v4[0]);
    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void *RunningBoardServicesLibrary_1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!RunningBoardServicesLibraryCore_frameworkLibrary_1)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __RunningBoardServicesLibraryCore_block_invoke_1;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E58FC258;
    uint64_t v6 = 0;
    RunningBoardServicesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  v0 = (void *)RunningBoardServicesLibraryCore_frameworkLibrary_1;
  if (!RunningBoardServicesLibraryCore_frameworkLibrary_1)
  {
    v0 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"void *RunningBoardServicesLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"BSNSXPCTransport.m", 29, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_19C76CF08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void RunningBoardServicesLibrary_2()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!RunningBoardServicesLibraryCore_frameworkLibrary_2)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __RunningBoardServicesLibraryCore_block_invoke_4;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E58FCDA8;
    uint64_t v5 = 0;
    RunningBoardServicesLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  if (!RunningBoardServicesLibraryCore_frameworkLibrary_2)
  {
    id v1 = [MEMORY[0x1E4F28B00] currentHandler];
    v2 = [NSString stringWithUTF8String:"void *RunningBoardServicesLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"BSXPCServiceConnection.m", 32, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

void sub_19C76D084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_19C76D238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76D678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76D718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76D8BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76DBE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id __emptyProtocol()
{
  if (qword_1EB27F828 != -1) {
    dispatch_once(&qword_1EB27F828, &__block_literal_global_262);
  }
  v0 = (void *)qword_1EB27F820;

  return v0;
}

void sub_19C76DDFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76E0FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76E474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76E828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76E9EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76EBD0(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_19C76EDBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76F050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _Unwind_Exception *exception_object, id a16)
{
  _Unwind_Resume(a1);
}

void sub_19C76F53C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10)
{
  _Unwind_Resume(a1);
}

void sub_19C76F6F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76F79C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76F95C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C76FA34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76FB28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C76FD38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object, objc_super a13)
{
  a13.super_class = (Class)BSServiceConnection;
  [(_Unwind_Exception *)&a13 dealloc];
  _Unwind_Resume(a1);
}

void sub_19C76FD80(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_19C770738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C770C3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C770E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id BSServiceConnectionErrorCreate(unint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  if (!(v5 | v6))
  {
    v10 = [NSString stringWithFormat:@"must provide underlyingXPCError or reason"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "NSError * _Nonnull BSServiceConnectionErrorCreate(BSServiceConnectionErrorCode, xpc_object_t  _Nullable __strong, NSString * _Nullable __strong)");
      *(_DWORD *)buf = 138544130;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      int v17 = @"BSServiceConnectionErrors.m";
      __int16 v18 = 1024;
      int v19 = 31;
      __int16 v20 = 2114;
      id v21 = v10;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C7710B0);
  }
  uint64_t v7 = (void *)v6;
  if (v5)
  {
    if (MEMORY[0x19F399FF0](v5) != MEMORY[0x1E4F145A8])
    {
      v12 = [NSString stringWithFormat:@"underlyingXPCError must be of type XPC_TYPE_ERROR"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v13 = objc_msgSend(NSString, "stringWithUTF8String:", "NSError * _Nonnull BSServiceConnectionErrorCreate(BSServiceConnectionErrorCode, xpc_object_t  _Nullable __strong, NSString * _Nullable __strong)");
        *(_DWORD *)buf = 138544130;
        uint64_t v15 = v13;
        __int16 v16 = 2114;
        int v17 = @"BSServiceConnectionErrors.m";
        __int16 v18 = 1024;
        int v19 = 32;
        __int16 v20 = 2114;
        id v21 = v12;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C771178);
    }
    if (!v7)
    {
      uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string((xpc_object_t)v5, (const char *)*MEMORY[0x1E4F14530]));
    }
  }
  uint64_t v8 = BSServiceConnectionErrorCreateWithInfo(a1, v7, 0);

  return v8;
}

void sub_19C771180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

id BSServiceConnectionErrorCreateWithInfo(unint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    v12 = [NSString stringWithFormat:@"must provide reason"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v13 = objc_msgSend(NSString, "stringWithUTF8String:", "NSError * _Nonnull BSServiceConnectionErrorCreateWithInfo(BSServiceConnectionErrorCode, NSString *__strong _Nonnull, NSDictionary * _Nullable __strong)");
      int v14 = 138544130;
      uint64_t v15 = v13;
      __int16 v16 = 2114;
      int v17 = @"BSServiceConnectionErrors.m";
      __int16 v18 = 1024;
      int v19 = 42;
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v14, 0x26u);
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C7713B4);
  }
  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v8 = v7;
  if (v6) {
    [v7 addEntriesFromDictionary:v6];
  }
  if (a1 > 4) {
    v9 = @"(unknown)";
  }
  else {
    v9 = off_1E58FCE48[a1];
  }
  [v8 setObject:v9 forKey:*MEMORY[0x1E4F4F610]];
  [v8 setObject:v5 forKey:*MEMORY[0x1E4F28588]];
  v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BSServiceConnectionErrorDomain" code:a1 userInfo:v8];

  return v10;
}

void sub_19C7713BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C771604(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C771870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C771B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)BSXPCServiceConnection;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_19C771BE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C771DB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C772198(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __BSServiceEndpointGrantNamespace_block_invoke()
{
  v0 = (void *)qword_1EB27F838;
  qword_1EB27F838 = @"com.apple.boardservices.endpoint-injection";
}

void sub_19C772374(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77264C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSServiceXPCBatchLog()
{
  if (BSServiceXPCBatchLog_onceToken != -1) {
    dispatch_once(&BSServiceXPCBatchLog_onceToken, &__block_literal_global_13);
  }
  v0 = (void *)BSServiceXPCBatchLog___logObj;

  return v0;
}

void ____emptyProtocol_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EED50540];
  id v1 = (void *)qword_1EB27F820;
  qword_1EB27F820 = v0;
}

void sub_19C772CE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C772FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C773274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id __protocolsToRemove()
{
  if (qword_1EB27F808 != -1) {
    dispatch_once(&qword_1EB27F808, &__block_literal_global_3);
  }
  uint64_t v0 = (void *)_MergedGlobals_6;

  return v0;
}

void sub_19C773F08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, void *a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  _Unwind_Resume(a1);
}

void sub_19C774254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSServiceConnectionEndpointTargetDescriptionForServiceLookup(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = NSString;
  if (v4)
  {
    uint64_t v6 = getpid();
    uint64_t v7 = __escaped(v3);
    uint64_t v8 = [v4 UUIDString];
    v9 = [v5 stringWithFormat:@"XPCService:%i:%@:%@", v6, v7, v8];
  }
  else
  {
    uint64_t v10 = getpid();
    uint64_t v7 = __escaped(v3);
    v9 = [v5 stringWithFormat:@"XPCService:%i:%@", v10, v7];
  }

  return v9;
}

void sub_19C77438C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77463C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id *__decodedEndpoint(void *a1, void *a2, void *a3, char a4, int a5, void *a6, void *a7, void *a8, void *a9)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  __int16 v16 = a1;
  id v17 = a2;
  id v18 = a3;
  int v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if (v17)
  {
    if (v20)
    {
      uint64_t v23 = v16;
      if (!v16) {
        uint64_t v23 = [BSServiceConnectionEndpoint alloc];
      }
      uint64_t v24 = -[BSServiceConnectionEndpoint _initWithEndpoint:oneshot:isNonLaunching:targetPID:targetDescription:service:instance:](v23, v17, v18, a4, a5, v19, v20, v21);
      if (!v16) {

      }
      goto LABEL_13;
    }
    id v25 = BSServiceInjectionLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = @"<null>";
      int v29 = 138413570;
      if (v19) {
        uint64_t v28 = v19;
      }
      id v30 = v22;
      __int16 v31 = 2112;
      id v32 = v17;
      __int16 v33 = 2112;
      id v34 = v18;
      __int16 v35 = 2112;
      int v36 = v28;
      __int16 v37 = 2112;
      id v38 = 0;
      __int16 v39 = 2112;
      id v40 = v21;
      _os_log_error_impl(&dword_19C754000, v25, OS_LOG_TYPE_ERROR, "BSServiceConnectionEndpoint: Unable to decode endpoint from %@ : endpoint=%@ oneshot=%@ (%@) service=%@ instance=%@", (uint8_t *)&v29, 0x3Eu);
    }
LABEL_12:

    uint64_t v24 = 0;
    goto LABEL_13;
  }
  if (v19)
  {
    id v25 = BSServiceInjectionLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v29 = 138413570;
      id v30 = v22;
      __int16 v31 = 2112;
      id v32 = 0;
      __int16 v33 = 2112;
      id v34 = v18;
      __int16 v35 = 2112;
      int v36 = v19;
      __int16 v37 = 2112;
      id v38 = v20;
      __int16 v39 = 2112;
      id v40 = v21;
      _os_log_error_impl(&dword_19C754000, v25, OS_LOG_TYPE_ERROR, "BSServiceConnectionEndpoint: Unable to decode endpoint from %@ : endpoint=%@ oneshot=%@ (%@) service=%@ instance=%@", (uint8_t *)&v29, 0x3Eu);
    }
    goto LABEL_12;
  }
  uint64_t v27 = v16;
  if (!v16) {
    uint64_t v27 = [BSServiceConnectionEndpoint alloc];
  }
  uint64_t v24 = -[BSServiceConnectionEndpoint _initForNullEndpointWithService:instance:]((id *)v27, v20, v21);
  if (!v16) {

  }
LABEL_13:

  return v24;
}

void sub_19C774954(_Unwind_Exception *a1)
{
  if (!v1) {

  }
  _Unwind_Resume(a1);
}

void sub_19C774AB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C775334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

id __escaped(void *a1)
{
  id v1 = a1;
  v2 = [MEMORY[0x1E4F28B88] URLHostAllowedCharacterSet];
  id v3 = [v1 stringByAddingPercentEncodingWithAllowedCharacters:v2];

  if ([v3 isEqualToString:v1]) {
    id v4 = v1;
  }
  else {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

void sub_19C7754F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __BSServiceXPCLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BoardServices", "XPC");
  id v1 = (void *)BSServiceXPCLog___logObj;
  BSServiceXPCLog___logObuint64_t j = (uint64_t)v0;
}

void __BSServiceLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BoardServices", "Common");
  id v1 = (void *)BSServiceLog___logObj;
  BSServiceLog___logObuint64_t j = (uint64_t)v0;
}

void __BSServiceInjectionLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BoardServices", "Injection");
  id v1 = (void *)BSServiceInjectionLog___logObj;
  BSServiceInjectionLog___logObuint64_t j = (uint64_t)v0;
}

void __BSServiceXPCBatchLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BoardServices", "XPCBatch");
  id v1 = (void *)BSServiceXPCBatchLog___logObj;
  BSServiceXPCBatchLog___logObuint64_t j = (uint64_t)v0;
}

void sub_19C7761E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7766EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  _Unwind_Resume(a1);
}

id BSServiceEndpointGrantNamespace()
{
  if (qword_1EB27F840 != -1) {
    dispatch_once(&qword_1EB27F840, &__block_literal_global_5);
  }
  os_log_t v0 = (void *)qword_1EB27F838;

  return v0;
}

id getRBSHereditaryGrantClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getRBSHereditaryGrantClass_softClass;
  uint64_t v7 = getRBSHereditaryGrantClass_softClass;
  if (!getRBSHereditaryGrantClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getRBSHereditaryGrantClass_block_invoke;
    v3[3] = &unk_1E58FBE80;
    v3[4] = &v4;
    __getRBSHereditaryGrantClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_19C776898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getRBSHereditaryGrantClass_block_invoke(uint64_t a1)
{
  RunningBoardServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("RBSHereditaryGrant");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRBSHereditaryGrantClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getRBSHereditaryGrantClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BSServiceConnectionEndpointInjector.m", 30, @"Unable to find class %s", "RBSHereditaryGrant");

    __break(1u);
  }
}

void sub_19C776978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __getRBSAssertionClass_block_invoke(uint64_t a1)
{
  RunningBoardServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("RBSAssertion");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1EB27F7B8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getRBSAssertionClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BSServiceConnectionEndpointInjector.m", 28, @"Unable to find class %s", "RBSAssertion");

    __break(1u);
  }
}

void sub_19C776A5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class __getRBSAssertionClass_block_invoke_0(uint64_t a1)
{
  RunningBoardServicesLibrary_0();
  Class result = objc_getClass("RBSAssertion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    _MergedGlobals_2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  else
  {
    id v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    Class result = (Class)objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getRBSAssertionClass(void)_block_invoke"), @"BSXPCServiceConnectionProxy.m", 29, @"Unable to find class %s", "RBSAssertion");
    __break(1u);
  }
  return result;
}

void __getRBSAssertionClass_block_invoke_1(uint64_t a1)
{
  RunningBoardServicesLibrary_1();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("RBSAssertion");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    _MergedGlobals_3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getRBSAssertionClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BSNSXPCTransport.m", 30, @"Unable to find class %s", "RBSAssertion");

    __break(1u);
  }
}

void sub_19C776BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C776E88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77709C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C777264(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C777A4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C777FFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C778228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Block_object_dispose((const void *)(v20 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_19C7782C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C778628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7787E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_19C7788E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C778CBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C779164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSServiceInjectionLog()
{
  if (BSServiceInjectionLog_onceToken != -1) {
    dispatch_once(&BSServiceInjectionLog_onceToken, &__block_literal_global_7);
  }
  os_log_t v0 = (void *)BSServiceInjectionLog___logObj;

  return v0;
}

void sub_19C779718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  _Unwind_Resume(a1);
}

void sub_19C779BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19C779E00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C779FBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77A178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77A334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77A4F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77A6AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77A9A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ____disallowedValueClasses_block_invoke()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:7];
  uint64_t v2 = objc_msgSend(v0, "initWithArray:", v1, v4, v5, v6, v7, v8, v9);
  id v3 = (void *)qword_1EB27F810;
  qword_1EB27F810 = v2;
}

void sub_19C77AAD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ____protocolsToRemove_block_invoke()
{
  v2[8] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EED4B818;
  v2[1] = &unk_1EED4DB40;
  v2[2] = &unk_1EED4C6B0;
  v2[3] = &unk_1EED4A580;
  v2[4] = &unk_1EED4BB20;
  v2[5] = &unk_1EED4BBE8;
  v2[6] = &unk_1EED4DC40;
  v2[7] = &unk_1EED4DCD8;
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:8];
  id v1 = (void *)_MergedGlobals_6;
  _MergedGlobals_6 = v0;
}

void sub_19C77AFEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77B8F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77BE0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_19C77BFD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77C46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19C77C9B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_19C77CBA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C77CD1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_19C77CF1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77D0E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77D290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  a11.super_class = (Class)BSServiceConnectionEndpointInjector;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_19C77D2D8(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_19C77D510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77DACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_19C77DF94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77E250(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77E424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  _Unwind_Resume(a1);
}

void sub_19C77E4AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)BSNSXPCTransport;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_19C77E6BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77E84C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_19C77E934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77EA28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C77ECB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77EE88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77F478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77F828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77F9CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77FB94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77FD50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C77FF0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C780060(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __getRBSEndowmentGrantClass_block_invoke(uint64_t a1)
{
  RunningBoardServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("RBSEndowmentGrant");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    _MergedGlobals_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getRBSEndowmentGrantClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BSServiceConnectionEndpointInjector.m", 29, @"Unable to find class %s", "RBSEndowmentGrant");

    __break(1u);
  }
}

void sub_19C780138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __RunningBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  RunningBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void BSSetServiceFeatureFlagResolver()
{
  uint64_t v0 = MEMORY[0x19F399B00]();
  id v1 = (void *)__explicitResolver;
  __explicitResolver = v0;
}

void sub_19C7802A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7803C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __RunningBoardServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  RunningBoardServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getRBSAssertionErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = RunningBoardServicesLibrary_0();
  uint64_t result = dlsym(v2, "RBSAssertionErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1EB27F7C8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19C78146C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78168C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7817D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id getRBSConstraintsAttributeClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getRBSConstraintsAttributeClass_softClass;
  uint64_t v7 = getRBSConstraintsAttributeClass_softClass;
  if (!getRBSConstraintsAttributeClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getRBSConstraintsAttributeClass_block_invoke;
    v3[3] = &unk_1E58FBE80;
    v3[4] = &v4;
    __getRBSConstraintsAttributeClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_19C7818C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C781A78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  _Unwind_Resume(a1);
}

void sub_19C781B54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C781BE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C781DF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C781E5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C781EA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C781EEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __RunningBoardServicesLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  RunningBoardServicesLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void *__getRBSAssertionErrorDomainSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = RunningBoardServicesLibrary_1();
  uint64_t result = dlsym(v2, "RBSAssertionErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1EB27F7D8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __getRBSConstraintsAttributeClass_block_invoke(uint64_t a1)
{
  RunningBoardServicesLibrary_1();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("RBSConstraintsAttribute");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRBSConstraintsAttributeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getRBSConstraintsAttributeClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BSNSXPCTransport.m", 31, @"Unable to find class %s", "RBSConstraintsAttribute");

    __break(1u);
  }
}

void sub_19C782088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C782204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C782478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _Unwind_Exception *exception_object, id a16)
{
  _Unwind_Resume(a1);
}

void sub_19C782688(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78283C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *NSStringFromBSServiceDomainStartType(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(%lu)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E58FC448[a1];
  }

  return v1;
}

void sub_19C782A08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C782B18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C782D84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C782E70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C78308C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C783140(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_19C783340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78344C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C78353C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_19C7835B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C783618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C783674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7836F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C783840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19C783A08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C783A94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C783BE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C783C68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C783DC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C783E90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C784084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7842DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C784388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78465C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C784A44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_19C784B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C784D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C784E24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C784F38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C786440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_19C786E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void _dedupeOptions(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v29 = a1;
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v11 = v7;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v47 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v35 != v13) {
                objc_enumerationMutation(v11);
              }
              _dedupeOptions(v10, *(void *)(*((void *)&v34 + 1) + 8 * i), 0, v9);
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v47 count:16];
          }
          while (v12);
        }

        uint64_t v15 = [v10 copy];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v25 = [NSString stringWithFormat:@"option value of key %@ was of an unexpected type : %@", v8, v7];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            id v26 = objc_msgSend(NSString, "stringWithUTF8String:", "void _dedupeOptions(__strong id, __strong id, NSString *__strong, id (^__strong)(__strong id<NSCopying>))");
            *(_DWORD *)buf = 138544130;
            __int16 v39 = v26;
            __int16 v40 = 2114;
            uint64_t v41 = @"BSServicesConfiguration.m";
            __int16 v42 = 1024;
            int v43 = 134;
            __int16 v44 = 2114;
            uint64_t v45 = v25;
            _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
          }
          [v25 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19C7873F8);
        }
        uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v16 = v7;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v46 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v31;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v31 != v18) {
                objc_enumerationMutation(v16);
              }
              uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 8 * j);
              id v21 = [v16 objectForKey:v20];
              _dedupeOptions(v10, v21, v20, v9);
            }
            uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v46 count:16];
          }
          while (v17);
        }

        uint64_t v15 = [v10 copy];
      }
      id v22 = (void *)v15;

      id v7 = v22;
    }
  }
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v27 = [NSString stringWithFormat:@"dictionary key \"%@\" is not a string", v8];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = objc_msgSend(NSString, "stringWithUTF8String:", "void _dedupeOptions(__strong id, __strong id, NSString *__strong, id (^__strong)(__strong id<NSCopying>))");
        *(_DWORD *)buf = 138544130;
        __int16 v39 = v28;
        __int16 v40 = 2114;
        uint64_t v41 = @"BSServicesConfiguration.m";
        __int16 v42 = 1024;
        int v43 = 138;
        __int16 v44 = 2114;
        uint64_t v45 = v27;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      [v27 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C7874C4);
    }
    uint64_t v23 = v9[2](v9, v7);
    uint64_t v24 = v9[2](v9, v8);
    [v29 setObject:v23 forKey:v24];
  }
  else
  {
    uint64_t v23 = v9[2](v9, v7);
    [v29 addObject:v23];
  }
}

void sub_19C7874CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_19C787A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_19C787B38(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_19C787F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_19C788384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C788474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7884E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7885B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_19C78863C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C7887C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C788850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C7888F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7889B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C788A20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C788B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_19C788CF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C788FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ____vetProtocol_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v17 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v9)
  {
    uint64_t v10 = objc_opt_new();
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  uint64_t v13 = NSString;
  int v14 = [v17 name];
  if (v7)
  {
    uint64_t v15 = [v7 argumentName];
    id v16 = [v13 stringWithFormat:@"%@ %@: %@", v14, v15, v8];
    [v9 addObject:v16];
  }
  else
  {
    uint64_t v15 = [v13 stringWithFormat:@"%@: %@", v14, v8];
    [v9 addObject:v15];
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

void sub_19C7891AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

id BSServiceBootstrapLog()
{
  if (BSServiceBootstrapLog_onceToken != -1) {
    dispatch_once(&BSServiceBootstrapLog_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)BSServiceBootstrapLog___logObj;

  return v0;
}

void __BSServiceBootstrapLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BoardServices", "Bootstrap");
  id v1 = (void *)BSServiceBootstrapLog___logObj;
  BSServiceBootstrapLog___logObuint64_t j = (uint64_t)v0;
}

void __BSServiceXPCErrorsLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BoardServices", "XPCErrors");
  id v1 = (void *)BSServiceXPCErrorsLog___logObj;
  BSServiceXPCErrorsLog___logObuint64_t j = (uint64_t)v0;
}

void sub_19C7893FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7894A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C78952C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7897DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,void *a33)
{
  _Unwind_Resume(a1);
}

void sub_19C789918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C7899D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C789F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,void *a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,void *a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41,void *a42)
{
  _Unwind_Resume(a1);
}

void sub_19C78A194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78A310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78A4B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78A598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78A61C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78A830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78AA6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78AB18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C78B21C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_19C78B628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78BCC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78BE70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C78BF50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C78C1A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78C308(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78C674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

uint64_t __RunningBoardServicesLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  qword_1EB27F858 = result;
  return result;
}

void sub_19C78C950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78CA64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78CB78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78CC54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78CCF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78CF70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C78D0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_19C78D1BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78D36C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_19C78D4DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78D69C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C78E224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

id __xpcInstance()
{
  if (qword_1EB27F868 != -1) {
    dispatch_once(&qword_1EB27F868, &__block_literal_global_208);
  }
  os_log_t v0 = (void *)_MergedGlobals_8;

  return v0;
}

void sub_19C78E5CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_19C78E7A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_19C78E9B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_19C78EA08()
{
}

void sub_19C78F94C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  _Unwind_Resume(a1);
}

void sub_19C790158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  _Unwind_Resume(a1);
}

void sub_19C790290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_19C790534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C790848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19C7909B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C790B1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C790BB0(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_19C790CA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C790E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_19C790FF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7911DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ____xpcInstance_block_invoke()
{
  os_log_t v0 = getenv("LaunchInstanceID");
  if (v0)
  {
    id v1 = v0;
    id v2 = objc_alloc(MEMORY[0x1E4F29128]);
    id v5 = [NSString stringWithUTF8String:v1];
    uint64_t v3 = objc_msgSend(v2, "initWithUUIDString:");
    uint64_t v4 = (void *)_MergedGlobals_8;
    _MergedGlobals_8 = v3;
  }
}

void sub_19C791310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

Class __getRBSProcessIdentityClass_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  if (!qword_1EB27F878)
  {
    v7[1] = (void *)MEMORY[0x1E4F143A8];
    v7[2] = (void *)3221225472;
    v7[3] = __RunningBoardServicesLibraryCore_block_invoke_3;
    v7[4] = &__block_descriptor_40_e5_v8__0l;
    v7[5] = v7;
    long long v8 = xmmword_1E58FCA90;
    uint64_t v9 = 0;
    qword_1EB27F878 = _sl_dlopen();
  }
  if (!qword_1EB27F878)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *RunningBoardServicesLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"BSServiceDomain.m", 30, @"%s", v7[0]);

    goto LABEL_10;
  }
  if (v7[0]) {
    free(v7[0]);
  }
  Class result = objc_getClass("RBSProcessIdentity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"Class getRBSProcessIdentityClass(void)_block_invoke"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"BSServiceDomain.m", 31, @"Unable to find class %s", "RBSProcessIdentity");

LABEL_10:
    __break(1u);
  }
  qword_1EB27F870 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19C791510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t __RunningBoardServicesLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  qword_1EB27F878 = result;
  return result;
}

void sub_19C7916EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7918CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C791AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  a11.super_class = (Class)BSXPCServiceConnectionListener;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_19C791B10(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_19C791E24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C79218C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7924F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C792A50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7931C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  _Unwind_Resume(a1);
}

void sub_19C79393C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C794018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7941A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C794370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C794508(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7947A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C794A8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C794DA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C794F98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C795154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ____handleEvent_block_invoke_217(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = BSServiceXPCErrorsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_error_impl(&dword_19C754000, v2, OS_LOG_TYPE_ERROR, "%{public}@ Invalidating due to error %@", (uint8_t *)&v5, 0x16u);
  }
}

void sub_19C7954E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C795698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  a11.super_class = (Class)BSServiceQuality;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_19C7956E0(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_19C7957D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7958E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C795A24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C795BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  a11.super_class = (Class)BSServiceConnectionEndpointMonitor;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_19C795C30(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_19C7961F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C796304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C796468(_Unwind_Exception *a1)
{
  int v5 = v4;

  _Unwind_Resume(a1);
}

void sub_19C796638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7967FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  a11.super_class = (Class)BSServiceConnectionListener;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_19C796844(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_19C796F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_19C797618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C797844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C797B10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C797E2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C798148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C798324(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C79846C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7985D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_19C7986A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_19C7987FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C7989D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C798B90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C798C38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C798FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C799120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C79957C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C799654(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C799828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C799A3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __RunningBoardServicesLibraryCore_block_invoke_4()
{
  uint64_t result = _sl_dlopen();
  RunningBoardServicesLibraryCore_frameworkLibrary_2 = result;
  return result;
}

void __getRBSConstraintsAttributeClass_block_invoke_0(uint64_t a1)
{
  RunningBoardServicesLibrary_2();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("RBSConstraintsAttribute");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRBSConstraintsAttributeClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getRBSConstraintsAttributeClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BSXPCServiceConnection.m", 33, @"Unable to find class %s", "RBSConstraintsAttribute");

    __break(1u);
  }
}

void sub_19C799C4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C799D8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C799FF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C79A0A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C79A1B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_19C79A298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C79A300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C79A3B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C79A428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C79A4A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSServiceConnectionEndpointTargetDescriptionForMachName(void *a1)
{
  id v1 = __escaped(a1);

  return v1;
}

id BSServiceConnectionEndpointTargetDescriptionForServiceListener(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = NSString;
  if (v4)
  {
    uint64_t v6 = getpid();
    __int16 v7 = __escaped(v3);
    uint64_t v8 = [v4 UUIDString];
    uint64_t v9 = [v5 stringWithFormat:@"XPCServiceListener:%i:%@:%@", v6, v7, v8];
  }
  else
  {
    uint64_t v10 = getpid();
    __int16 v7 = __escaped(v3);
    uint64_t v9 = [v5 stringWithFormat:@"XPCServiceListener:%i:%@", v10, v7];
  }

  return v9;
}

void sub_19C79A6D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSServiceConnectionEndpointTargetDescriptionForAnonymousDomain(void *a1)
{
  id v1 = a1;
  id v2 = NSString;
  uint64_t v3 = getpid();
  id v4 = __escaped(v1);
  int v5 = [v2 stringWithFormat:@"%i:%@", v3, v4];

  return v5;
}

void sub_19C79A794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C79A8D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C79A980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C79AAA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C79AF38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C79B040(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C79B20C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_19C79B39C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C79B450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_19C79B4EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_19C79B57C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19C79C0FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19C79C730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_19C79C980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19C79CBB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, void *a13)
{
  if (a12) {
  _Unwind_Resume(a1);
  }
}

void sub_19C79CD58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class __getRBSServiceClass_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  if (!qword_1EB27F8A0)
  {
    v7[1] = (void *)MEMORY[0x1E4F143A8];
    v7[2] = (void *)3221225472;
    v7[3] = __RunningBoardServicesLibraryCore_block_invoke_5;
    v7[4] = &__block_descriptor_40_e5_v8__0l;
    v7[5] = v7;
    long long v8 = xmmword_1E58FCE20;
    uint64_t v9 = 0;
    qword_1EB27F8A0 = _sl_dlopen();
  }
  if (!qword_1EB27F8A0)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"void *RunningBoardServicesLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"BSServiceConnectionEndpoint.m", 31, @"%s", v7[0]);

    goto LABEL_10;
  }
  if (v7[0]) {
    free(v7[0]);
  }
  Class result = objc_getClass("RBSService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    int v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"Class getRBSServiceClass(void)_block_invoke"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"BSServiceConnectionEndpoint.m", 32, @"Unable to find class %s", "RBSService");

LABEL_10:
    __break(1u);
  }
  _MergedGlobals_10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19C79CF6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t __RunningBoardServicesLibraryCore_block_invoke_5()
{
  uint64_t result = _sl_dlopen();
  qword_1EB27F8A0 = result;
  return result;
}

__CFString *NSStringFromBSServiceConnectionErrorCode(unint64_t a1)
{
  if (a1 > 4) {
    return @"(unknown)";
  }
  else {
    return off_1E58FCE48[a1];
  }
}

uint64_t BSAtomicGetFlag()
{
  return MEMORY[0x1F410C148]();
}

uint64_t BSAtomicSetFlag()
{
  return MEMORY[0x1F410C150]();
}

uint64_t BSClearTokenVar()
{
  return MEMORY[0x1F410C198]();
}

uint64_t BSCreateDeserializedStringFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C1D8]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1F410C288]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1F410C2A0]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1F410C2E8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1F410C2F8]();
}

uint64_t BSObjCClassCreate()
{
  return MEMORY[0x1F410C498]();
}

uint64_t BSPIDForXPCConnection()
{
  return MEMORY[0x1F410C4B0]();
}

uint64_t BSSerializeStringToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C5C8]();
}

uint64_t BSStoreTokenFromMessageToVar()
{
  return MEMORY[0x1F410C640]();
}

uint64_t BSStoreTokenFromXPCConnectionToVar()
{
  return MEMORY[0x1F410C648]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1F40E7228]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1F410C6F0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1F41814C8](cls, name, imp, types);
}

BOOL class_addProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1F41814D8](cls, protocol);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x1F4181598](block);
}

void method_invoke(void)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1F40CD628]();
}

qos_class_t qos_class_main(void)
{
  return MEMORY[0x1F40CDBD0]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int unsetenv(const char *a1)
{
  return MEMORY[0x1F40CE5F8](a1);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEAA8](xarray, index);
}

uint64_t xpc_bs_main()
{
  return MEMORY[0x1F40CEB28]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBA8](name, targetq);
}

uint64_t xpc_connection_create_bs_service_listener()
{
  return MEMORY[0x1F40CEBB0]();
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBC0](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

uint64_t xpc_connection_get_bs_type()
{
  return MEMORY[0x1F40CEBF0]();
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x1F40CEBF8](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

uint64_t xpc_connection_send_notification()
{
  return MEMORY[0x1F40CEC70]();
}

uint64_t xpc_connection_set_bs_type()
{
  return MEMORY[0x1F40CEC80]();
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
}

uint64_t xpc_connection_set_oneshot_instance()
{
  return MEMORY[0x1F40CECC0]();
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

void xpc_connection_suspend(xpc_connection_t connection)
{
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CED00](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

uint64_t xpc_dictionary_expects_reply()
{
  return MEMORY[0x1F40CEE58]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1F40CEEE0](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

uint64_t xpc_endpoint_compare()
{
  return MEMORY[0x1F40CF008]();
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1F40CF018](connection);
}

uint64_t xpc_endpoint_create_bs_named()
{
  return MEMORY[0x1F40CF028]();
}

uint64_t xpc_endpoint_create_bs_service()
{
  return MEMORY[0x1F40CF030]();
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1F40CF040](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

size_t xpc_hash(xpc_object_t object)
{
  return MEMORY[0x1F40CF158](object);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1F40CF368](xuuid);
}