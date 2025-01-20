@interface BSXPCServiceConnectionProxy
+ (uint64_t)concreteArgumentsForArguments:(uint64_t)a1;
+ (uint64_t)decodeArguments:(uint64_t)a3 outArgs:(void *)a4 fromMessage:(void *)a5 forConnection:;
+ (uint64_t)encodeArguments:(uint64_t)a1 inArgs:(void *)a2 toMessage:(uint64_t)a3 forConnection:(void *)a4;
+ (void)invokeMethod:(uint64_t)a3 onTarget:(void *)a4 withMessage:(void *)a5 forConnection:(uint64_t)a6 completion:;
+ (void)proxyForConnection:(void *)a3 handshake:(void *)a4 withProtocol:(int)a5 activationGeneration:(void *)a6 activeXPCConnection:(void *)a7 xpcConnectionTargetQueue:(void *)a8 replyQueue:(void *)a9 target:(void *)a10 attributes:(void *)a11 assertionProvider:;
- (void)_decrementInFlightMessageCounter;
- (void)dealloc;
@end

@implementation BSXPCServiceConnectionProxy

id __71__BSXPCServiceConnectionProxy_createImplementationOfProtocol_forClass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, uint64_t a11)
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v112 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  v125[0] = a3;
  v125[1] = a4;
  v125[2] = a5;
  v125[3] = a6;
  v125[4] = a7;
  v125[5] = a8;
  long long v126 = a9;
  uint64_t v127 = a10;
  uint64_t v128 = a11;
  v19 = *(__CFString **)(a2 + 8);
  if (!v19) {
    goto LABEL_124;
  }
  for (i = v19[5].data; ; i = 0)
  {
    v21 = *(void **)(a1 + 32);
    if (v21)
    {
      v22 = (void *)v125[[v21 argumentIndex]];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v90 = NSString;
        if (i) {
          uint64_t v91 = *((void *)i + 1);
        }
        else {
          uint64_t v91 = 0;
        }
        uint64_t v92 = *(void *)(a1 + 40);
        v93 = (objc_class *)objc_opt_class();
        v94 = (void *)[v90 stringWithFormat:@"%@ <%@:%p> Reply block argument was not a block, but a %@", v91, v92, a2, NSStringFromClass(v93)];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v95 = NSStringFromSelector(*(SEL *)(a1 + 96));
          v96 = (objc_class *)objc_opt_class();
          v97 = NSStringFromClass(v96);
          v98 = *(void (**)(uint64_t, uint64_t))(a1 + 48);
          *(_DWORD *)buf = 138544642;
          *(void *)&buf[4] = v95;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v97;
          *(_WORD *)&buf[22] = 2048;
          v130 = v98;
          *(_WORD *)v131 = 2114;
          *(void *)&v131[2] = @"BSXPCServiceConnectionProxy.m";
          *(_WORD *)&v131[10] = 1024;
          *(_DWORD *)&v131[12] = 391;
          *(_WORD *)&v131[16] = 2114;
          *(void *)&v131[18] = v94;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v94 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C75638CLL);
      }
      id v23 = (id)[v22 copy];
      v24 = *(__CFString **)(a2 + 8);
    }
    else
    {
      id v23 = 0;
      v24 = v19;
    }
    id v109 = v23;
    if ([(__CFString *)v24 _isInvalidated])
    {
      v25 = (os_unfair_lock_s *)(a2 + 88);
      os_unfair_lock_lock((os_unfair_lock_t)(a2 + 88));
    }
    else
    {
      uint64_t v26 = *(void *)(a2 + 32);
      v25 = (os_unfair_lock_s *)(a2 + 88);
      os_unfair_lock_lock((os_unfair_lock_t)(a2 + 88));
      if (v26)
      {
        v27 = *(void **)(a2 + 16);
        os_unfair_lock_unlock((os_unfair_lock_t)(a2 + 88));
        v28 = *(void **)(a2 + 32);
        int v111 = 1;
        goto LABEL_12;
      }
    }
    os_unfair_lock_unlock(v25);
    v27 = 0;
    int v111 = 0;
    v28 = 0;
LABEL_12:
    v29 = +[BSXPCServiceConnectionMessage messageWithXPCConnection:targetQueue:handshake:activationGeneration:delegate:]((uint64_t)BSXPCServiceConnectionMessage, v28, *(void **)(a2 + 40), v27, *(_DWORD *)(a2 + 96), v19);
    -[BSXPCServiceConnectionMessage setReplyQueue:]((uint64_t)v29, *(void **)(a2 + 48));
    if (v29) {
      v29[60] = *(unsigned char *)(a1 + 104);
    }
    if ([i isChild])
    {
      if (i)
      {
        -[BSXPCServiceConnectionMessage setChildIdentifier:](v29, *((void *)i + 4));
        BOOL v30 = i[24] != 0;
      }
      else
      {
        -[BSXPCServiceConnectionMessage setChildIdentifier:](v29, 0);
        BOOL v30 = 0;
      }
      -[BSXPCServiceConnectionMessage setChildIdentifierIsRemotelyDefined:](v29, (const char *)v30);
    }
    v108 = i;
    v110 = v27;
    lock = v25;
    -[BSXPCServiceConnectionMessage setSelectorName:](v29, *(void **)(a1 + 56));
    v113 = (os_unfair_lock_s *)v19;
    +[BSXPCServiceConnectionProxy encodeArguments:inArgs:toMessage:forConnection:]((uint64_t)BSXPCServiceConnectionProxy, *(void **)(a1 + 64), (uint64_t)v125, v29);
    v31 = BSServiceXPCLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v33 = BSServiceXPCLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        if (i) {
          uint64_t v80 = *((void *)i + 1);
        }
        else {
          uint64_t v80 = 0;
        }
        uint64_t v81 = *(void *)(a1 + 40);
        if (*(unsigned char *)(a1 + 105)) {
          v19 = @"async";
        }
        else {
          v19 = @"sync";
        }
        uint64_t v82 = [*(id *)(a1 + 72) name];
        uint64_t v83 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138544642;
        *(void *)&buf[4] = v80;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v81;
        *(_WORD *)&buf[22] = 2048;
        v130 = (void (*)(uint64_t, uint64_t))a2;
        *(_WORD *)v131 = 2114;
        *(void *)&v131[2] = v19;
        *(_WORD *)&v131[10] = 2114;
        *(void *)&v131[12] = v82;
        *(_WORD *)&v131[20] = 2114;
        *(void *)&v131[22] = v83;
        _os_log_debug_impl(&dword_19C754000, v33, OS_LOG_TYPE_DEBUG, "%{public}@ <%{public}@:%p> Sending %{public}@ -[<%{public}@> %{public}@]", buf, 0x3Eu);
      }
      if ([*(id *)(a1 + 64) count])
      {
        uint64_t v34 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "firstObject"), "argumentIndex");
        if (v34 <= objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "lastObject"), "argumentIndex"))
        {
          do
          {
            v51 = (void *)v125[v34];
            if (([v51 isNSString] & 1) != 0 || objc_msgSend(v51, "isNSNumber"))
            {
              v52 = BSServiceXPCLog();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
              {
                if (v108) {
                  uint64_t v53 = *((void *)v108 + 1);
                }
                else {
                  uint64_t v53 = 0;
                }
                v19 = *(__CFString **)(a1 + 40);
                v54 = (objc_class *)objc_opt_class();
                uint64_t v55 = [NSStringFromClass(v54) classForCoder];
                uint64_t v56 = [v51 description];
                *(_DWORD *)buf = 138544898;
                *(void *)&buf[4] = v53;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v19;
                *(_WORD *)&buf[22] = 2048;
                v130 = (void (*)(uint64_t, uint64_t))a2;
                *(_WORD *)v131 = 1024;
                *(_DWORD *)&v131[2] = v34;
                *(_WORD *)&v131[6] = 2114;
                *(void *)&v131[8] = v55;
                *(_WORD *)&v131[16] = 2048;
                *(void *)&v131[18] = v51;
                *(_WORD *)&v131[26] = 2114;
                *(void *)&v131[28] = v56;
                v57 = v52;
                v58 = "%{public}@ <%{public}@:%p> [%d] <%{public}@: %p; \"%{public}@\">";
                uint32_t v59 = 68;
LABEL_56:
                _os_log_debug_impl(&dword_19C754000, v57, OS_LOG_TYPE_DEBUG, v58, buf, v59);
              }
            }
            else
            {
              v60 = BSServiceXPCLog();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
              {
                if (v108) {
                  v19 = (__CFString *)*((void *)v108 + 1);
                }
                else {
                  v19 = 0;
                }
                uint64_t v61 = *(void *)(a1 + 40);
                v62 = (objc_class *)objc_opt_class();
                uint64_t v63 = [NSStringFromClass(v62) classForCoder];
                *(_DWORD *)buf = 138544642;
                *(void *)&buf[4] = v19;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v61;
                *(_WORD *)&buf[22] = 2048;
                v130 = (void (*)(uint64_t, uint64_t))a2;
                *(_WORD *)v131 = 1024;
                *(_DWORD *)&v131[2] = v34;
                *(_WORD *)&v131[6] = 2114;
                *(void *)&v131[8] = v63;
                *(_WORD *)&v131[16] = 2048;
                *(void *)&v131[18] = v51;
                v57 = v60;
                v58 = "%{public}@ <%{public}@:%p> [%d] <%{public}@: %p>";
                uint32_t v59 = 58;
                goto LABEL_56;
              }
            }
            ++v34;
          }
          while (v34 - 1 < objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "lastObject"), "argumentIndex"));
        }
      }
    }
    if (!v111 || !*(void *)(a2 + 56) || !*(void *)(a2 + 64))
    {
      int v43 = 0;
      goto LABEL_33;
    }
    v35 = lock;
    os_unfair_lock_lock(lock);
    int v36 = *(_DWORD *)(a2 + 92);
    if (v36) {
      break;
    }
    uint64_t v67 = *(void *)(a2 + 72);
    if (v67)
    {
      id v68 = (id)(*(uint64_t (**)(uint64_t, void, void, void))(v67 + 16))(v67, *(void *)(a1 + 40), *(void *)(a2 + 56), *(void *)(a2 + 64));
    }
    else
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3052000000;
      v130 = __Block_byref_object_copy_;
      *(void *)v131 = __Block_byref_object_dispose_;
      v73 = (objc_class *)_MergedGlobals_2;
      *(void *)&v131[8] = _MergedGlobals_2;
      if (!_MergedGlobals_2)
      {
        id v120 = (id)MEMORY[0x1E4F143A8];
        uint64_t v121 = 3221225472;
        uint64_t v122 = (uint64_t)__getRBSAssertionClass_block_invoke_0;
        v123 = &unk_1E58FC048;
        v124 = buf;
        __getRBSAssertionClass_block_invoke_0((uint64_t)&v120);
        v73 = *(objc_class **)(*(void *)&buf[8] + 40);
      }
      _Block_object_dispose(buf, 8);
      id v68 = (id)[[v73 alloc] initWithExplanation:*(void *)(a1 + 40) target:*(void *)(a2 + 56) attributes:*(void *)(a2 + 64)];
    }
    id v74 = v68;
    if (!v68)
    {
      v99 = v108;
      if (v108) {
        v99 = (char *)*((void *)v108 + 1);
      }
      v100 = (void *)[NSString stringWithFormat:@"%@ <%@:%p> failed to create assertion with attributes=%@", v99, *(void *)(a1 + 40), a2, *(void *)(a2 + 64)];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v101 = NSStringFromSelector(*(SEL *)(a1 + 96));
        v102 = (objc_class *)objc_opt_class();
        v103 = NSStringFromClass(v102);
        v104 = *(void (**)(uint64_t, uint64_t))(a1 + 48);
        *(_DWORD *)buf = 138544642;
        *(void *)&buf[4] = v101;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v103;
        *(_WORD *)&buf[22] = 2048;
        v130 = v104;
        *(_WORD *)v131 = 2114;
        *(void *)&v131[2] = @"BSXPCServiceConnectionProxy.m";
        *(_WORD *)&v131[10] = 1024;
        *(_DWORD *)&v131[12] = 447;
        *(_WORD *)&v131[16] = 2114;
        *(void *)&v131[18] = v100;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v100 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C756484);
    }
    v119[0] = 0;
    if ([v68 acquireWithError:v119]) {
      goto LABEL_92;
    }
    v75 = (void *)[v119[0] domain];
    id v120 = 0;
    uint64_t v121 = (uint64_t)&v120;
    uint64_t v122 = 0x2020000000;
    v76 = (void *)qword_1EB27F7C8;
    v123 = (void *)qword_1EB27F7C8;
    if (!qword_1EB27F7C8)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getRBSAssertionErrorDomainSymbolLoc_block_invoke;
      v130 = (void (*)(uint64_t, uint64_t))&unk_1E58FC048;
      *(void *)v131 = &v120;
      v77 = RunningBoardServicesLibrary_0();
      v78 = dlsym(v77, "RBSAssertionErrorDomain");
      *(void *)(*(void *)(*(void *)v131 + 8) + 24) = v78;
      qword_1EB27F7C8 = *(void *)(*(void *)(*(void *)v131 + 8) + 24);
      v76 = *(void **)(v121 + 24);
    }
    _Block_object_dispose(&v120, 8);
    if (v76)
    {
      if ([v75 isEqualToString:*v76] && objc_msgSend(v119[0], "code") == 4)
      {
        v118[0] = MEMORY[0x1E4F143A8];
        v118[1] = 3221225472;
        v118[2] = __71__BSXPCServiceConnectionProxy_createImplementationOfProtocol_forClass___block_invoke_136;
        v118[3] = &unk_1E58FBFA8;
        uint64_t v105 = *(void *)(a1 + 40);
        uint64_t v106 = *(void *)(a1 + 48);
        v118[4] = v108;
        v118[5] = v105;
        v118[6] = a2;
        v118[7] = v119[0];
        uint64_t v107 = *(void *)(a1 + 96);
        v118[8] = v106;
        v118[9] = v107;
        __71__BSXPCServiceConnectionProxy_createImplementationOfProtocol_forClass___block_invoke_136((uint64_t)v118);
      }
      v79 = BSServiceXPCErrorsLog();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        v87 = v108;
        if (v108) {
          v87 = (char *)*((void *)v108 + 1);
        }
        uint64_t v88 = *(void *)(a1 + 40);
        uint64_t v89 = *(void *)(a2 + 64);
        *(_DWORD *)buf = 138544386;
        *(void *)&buf[4] = v87;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v88;
        *(_WORD *)&buf[22] = 2048;
        v130 = (void (*)(uint64_t, uint64_t))a2;
        *(_WORD *)v131 = 2114;
        *(id *)&v131[2] = v119[0];
        *(_WORD *)&v131[10] = 2114;
        *(void *)&v131[12] = v89;
        _os_log_error_impl(&dword_19C754000, v79, OS_LOG_TYPE_ERROR, "%{public}@ <%{public}@:%p> failed to acquire assertion : error=%{public}@ attributes=%{public}@", buf, 0x34u);
      }
LABEL_92:
      *(void *)(a2 + 80) = v74;
      int v36 = *(_DWORD *)(a2 + 92);
      v35 = lock;
      goto LABEL_93;
    }
    a2 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend((id)a2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "NSString *getRBSAssertionErrorDomain(void)"), @"BSXPCServiceConnectionProxy.m", 30, @"%s", dlerror());
    __break(1u);
LABEL_124:
    ;
  }
  if (v36 == -1)
  {
    v37 = v108;
    if (v108) {
      v37 = (char *)*((void *)v108 + 1);
    }
    v38 = (void *)[NSString stringWithFormat:@"%@ <%@:%p> message tracking overflow", v37, *(void *)(a1 + 40), a2];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v39 = NSStringFromSelector(*(SEL *)(a1 + 96));
      v40 = (objc_class *)objc_opt_class();
      v41 = NSStringFromClass(v40);
      v42 = *(void (**)(uint64_t, uint64_t))(a1 + 48);
      *(_DWORD *)buf = 138544642;
      *(void *)&buf[4] = v39;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v41;
      *(_WORD *)&buf[22] = 2048;
      v130 = v42;
      *(_WORD *)v131 = 2114;
      *(void *)&v131[2] = @"BSXPCServiceConnectionProxy.m";
      *(_WORD *)&v131[10] = 1024;
      *(_DWORD *)&v131[12] = 439;
      *(_WORD *)&v131[16] = 2114;
      *(void *)&v131[18] = v38;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v38 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C755A18);
  }
LABEL_93:
  *(_DWORD *)(a2 + 92) = v36 + 1;
  os_unfair_lock_unlock(v35);
  int v43 = 1;
LABEL_33:
  if (*(unsigned char *)(a1 + 105))
  {
    if (v109)
    {
      v44 = v116;
      v116[0] = MEMORY[0x1E4F143A8];
      v116[1] = 3221225472;
      v116[2] = __71__BSXPCServiceConnectionProxy_createImplementationOfProtocol_forClass___block_invoke_140;
      v116[3] = &unk_1E58FBFD0;
      char v117 = v43;
      uint64_t v45 = *(void *)(a1 + 32);
      v116[4] = a2;
      v116[5] = v45;
      v116[6] = v113;
      v116[7] = v109;
      if (!v29) {
        goto LABEL_43;
      }
    }
    else
    {
      if (!v43) {
        goto LABEL_43;
      }
      v44 = newValue;
      newValue[0] = MEMORY[0x1E4F143A8];
      newValue[1] = 3221225472;
      newValue[2] = __71__BSXPCServiceConnectionProxy_createImplementationOfProtocol_forClass___block_invoke_2;
      newValue[3] = &unk_1E58FBFF8;
      newValue[4] = a2;
      if (!v29) {
        goto LABEL_43;
      }
    }
    objc_setProperty_nonatomic_copy(v29, v32, v44, 80);
LABEL_43:
    [v29 send];
    int v48 = 0;
    v49 = 0;
    unint64_t v50 = 0;
    goto LABEL_105;
  }
  v46 = *(void **)(a1 + 80);
  if (v46)
  {
    v47 = (void *)v125[[v46 argumentIndex]];
    if (v47) {
      void *v47 = 0;
    }
  }
  else
  {
    v47 = 0;
  }
  id v120 = 0;
  v64 = (void *)[v29 sendSynchronouslyWithError:&v120];
  if (v43) {
    -[BSXPCServiceConnectionProxy _decrementInFlightMessageCounter](a2);
  }
  if ([*(id *)(a1 + 88) isVoid])
  {
    if (v109)
    {
      uint64_t v65 = *(void *)(a1 + 32);
      uint64_t v66 = [v64 message];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ____BSXPCServiceConnection_IS_INVOKING_A_MESSAGE_REPLY_BLOCK___block_invoke;
      v130 = (void (*)(uint64_t, uint64_t))&unk_1E58FC088;
      *(void *)v131 = v65;
      *(void *)&v131[8] = v66;
      *(void *)&v131[16] = v120;
      *(void *)&v131[24] = v113;
      *(void *)&v131[32] = v109;
      BSXPCServiceConnectionExecuteCallOut(v113, 0, (uint64_t)buf);
    }
  }
  else if (v64)
  {
    if ([*(id *)(a1 + 88) isBoolean])
    {
      int v48 = 0;
      unint64_t v50 = [v64 decodeBoolForKey:@"BSXPCReturnValue"];
      if (!v47) {
        goto LABEL_103;
      }
      goto LABEL_76;
    }
    if ([*(id *)(a1 + 88) isObject])
    {
      v69 = (void *)[*(id *)(a1 + 88) objectClass];
      v70 = (void *)[*(id *)(a1 + 88) objectContainedClasses];
      if ([v70 count])
      {
        if ([v69 isSubclassOfClass:objc_opt_class()]) {
          v71 = objc_msgSend(v64, "decodeDictionaryOfClass:forKey:", objc_msgSend(v70, "objectAtIndex:", 1), @"BSXPCReturnValue");
        }
        else {
          v71 = objc_msgSend(v64, "decodeCollectionOfClass:containingClass:forKey:", v69, objc_msgSend(v70, "firstObject"), @"BSXPCReturnValue");
        }
      }
      else
      {
        v71 = (void *)[v64 decodeObjectOfClass:v69 forKey:@"BSXPCReturnValue"];
      }
      unint64_t v50 = (unint64_t)v71;
      id v84 = v71;
      int v48 = 1;
      if (!v47) {
        goto LABEL_103;
      }
      goto LABEL_76;
    }
  }
  int v48 = 0;
  unint64_t v50 = 0;
  if (!v47) {
    goto LABEL_103;
  }
LABEL_76:
  if (!v120)
  {
    if (v64)
    {
      id v72 = (id)[v64 decodeObjectOfClass:objc_opt_class() forKey:@"BSXPCReturnError"];
      goto LABEL_80;
    }
LABEL_103:
    v49 = 0;
    goto LABEL_104;
  }
  id v72 = v120;
LABEL_80:
  v49 = v72;
  void *v47 = v72;
LABEL_104:
  [v64 invalidate];
LABEL_105:
  [v29 invalidate];
  if (v110)
  {
    os_unfair_lock_lock(lock);

    *(void *)(a2 + 16) = 0;
    os_unfair_lock_unlock(lock);
  }
  [v112 drain];
  id v85 = v49;
  if (v48) {
    return (id)v50;
  }
  return (id)v50;
}

void __186__BSXPCServiceConnectionProxy_proxyForConnection_handshake_withProtocol_activationGeneration_activeXPCConnection_xpcConnectionTargetQueue_replyQueue_target_attributes_assertionProvider___block_invoke(uint64_t a1, objc_class *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  uint64_t v26 = self;
  cls = a2;
  v27 = NSStringFromClass(a2);
  v29 = v3;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = (id)[v3 methods];
  uint64_t v4 = [obj countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v9 = [v8 name];
        v10 = (void *)[v8 returnValue];
        v11 = (void *)[v8 arguments];
        uint64_t v12 = +[BSXPCServiceConnectionProxy concreteArgumentsForArguments:]((uint64_t)BSXPCServiceConnectionProxy, v11);
        v13 = (void *)[v11 lastObject];
        if ([v13 isPointer]) {
          v14 = v13;
        }
        else {
          v14 = 0;
        }
        if (![v13 isBlock]) {
          v13 = 0;
        }
        int v15 = [v10 isOneWay];
        if (v15 && (int v15 = [v10 isVoid]) != 0)
        {
          LOBYTE(v15) = [v10 hasQualifier:82];
          char v16 = 1;
        }
        else
        {
          char v16 = 0;
        }
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __71__BSXPCServiceConnectionProxy_createImplementationOfProtocol_forClass___block_invoke;
        block[3] = &unk_1E58FC020;
        block[4] = v13;
        block[5] = v27;
        block[11] = v10;
        block[12] = sel_createImplementationOfProtocol_forClass_;
        char v31 = v15;
        block[6] = v26;
        block[7] = v9;
        block[8] = v12;
        block[9] = v29;
        char v32 = v16;
        block[10] = v14;
        v17 = imp_implementationWithBlock(block);
        v18 = NSSelectorFromString((NSString *)[v8 name]);
        if (!class_addMethod(cls, v18, v17, (const char *)objc_msgSend((id)objc_msgSend(v8, "encoding"), "UTF8String")))
        {
          v21 = (void *)[NSString stringWithFormat:@"unable to register method \"%@\" on class \"%@\", objc_msgSend(v8, "name""), v27];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v22 = NSStringFromSelector(sel_createImplementationOfProtocol_forClass_);
            id v23 = (objc_class *)objc_opt_class();
            v24 = NSStringFromClass(v23);
            *(_DWORD *)buf = 138544642;
            uint64_t v38 = (uint64_t)v22;
            __int16 v39 = 2114;
            v40 = v24;
            __int16 v41 = 2048;
            uint64_t v42 = v26;
            __int16 v43 = 2114;
            v44 = @"BSXPCServiceConnectionProxy.m";
            __int16 v45 = 1024;
            int v46 = 571;
            __int16 v47 = 2114;
            int v48 = v21;
            _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          [v21 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19C75BC78);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v33 objects:v49 count:16];
    }
    while (v5);
  }
  if (!class_addProtocol(cls, (Protocol *)[v29 protocol]))
  {
    v19 = BSServiceXPCErrorsLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [v29 name];
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = v20;
      __int16 v39 = 2114;
      v40 = v27;
      _os_log_error_impl(&dword_19C754000, v19, OS_LOG_TYPE_ERROR, "[BSXPCServiceConnectionProxy] Error adding protocol %{public}@ to class %{public}@", buf, 0x16u);
    }
  }
}

+ (uint64_t)encodeArguments:(uint64_t)a1 inArgs:(void *)a2 toMessage:(uint64_t)a3 forConnection:(void *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = self;
  if ((unint64_t)[a2 count] > 0xA)
  {
    id v23 = (void *)[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[arguments count] <= 10"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v24 = NSStringFromSelector(sel_encodeArguments_inArgs_toMessage_forConnection_);
      v25 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      v27 = v24;
      __int16 v28 = 2114;
      v29 = NSStringFromClass(v25);
      __int16 v30 = 2048;
      uint64_t v31 = v7;
      __int16 v32 = 2114;
      long long v33 = @"BSXPCServiceConnectionProxy.m";
      __int16 v34 = 1024;
      int v35 = 724;
      __int16 v36 = 2114;
      v37 = v23;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C75D44CLL);
  }
  if ([a2 count])
  {
    unint64_t v8 = 0;
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    while (1)
    {
      v10 = (void *)[a2 objectAtIndex:v8];
      int v11 = [v10 type];
      if (v11 > 80) {
        break;
      }
      if (v11 == 35)
      {
        char v16 = *(objc_class **)(a3 + 8 * v8);
        if (v16)
        {
          v17 = NSStringFromClass(v16);
          if (v8 > 9) {
            v18 = 0;
          }
          else {
            v18 = off_1E58FC0A8[v8];
          }
          [a4 encodeObject:v17 forKey:v18];
        }
        goto LABEL_36;
      }
      if (v11 != 64) {
        goto LABEL_15;
      }
      uint64_t v12 = *(__CFString **)(a3 + 8 * v8);
      if (!v12)
      {
        if ([v10 isObjectNonnull]) {
          [MEMORY[0x1E4F1CA00] raise:v9, @"Parameter %ld expected nonnull %@", objc_msgSend(v10, "argumentIndex"), NSStringFromClass((Class)objc_msgSend(v10, "objectClass")) format];
        }
        goto LABEL_36;
      }
      v13 = (objc_class *)[v10 objectClass];
      if ([(objc_class *)v13 isSubclassOfClass:objc_opt_class()])
      {
        if (v8 >= 0xA) {
          v14 = 0;
        }
        else {
          v14 = off_1E58FC0A8[v8];
        }
        uint64_t v12 = @"local";
      }
      else
      {
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v20 = (void *)MEMORY[0x1E4F1CA00];
          v21 = NSStringFromClass(v13);
          [v20 raise:v9, @"Expected %@, but received %@", v21, NSStringFromClass((Class)-[__CFString classForCoder](v12, "classForCoder")) format];
          goto LABEL_36;
        }
        v14 = @"1";
        switch(v8)
        {
          case 0uLL:
            break;
          case 1uLL:
            v14 = @"2";
            break;
          case 2uLL:
            v14 = @"3";
            break;
          case 3uLL:
            v14 = @"4";
            break;
          case 4uLL:
            v14 = @"5";
            break;
          case 5uLL:
            v14 = @"6";
            break;
          case 6uLL:
            v14 = @"7";
            break;
          case 7uLL:
            v14 = @"8";
            break;
          case 8uLL:
            v14 = @"9";
            break;
          case 9uLL:
            v14 = @"10";
            break;
          default:
            v14 = 0;
            break;
        }
      }
      [a4 encodeObject:v12 forKey:v14];
LABEL_36:
      if (++v8 >= [a2 count]) {
        return [a4 _finishCoding];
      }
    }
    if (v11 == 81)
    {
      if (v8 > 9) {
        v19 = 0;
      }
      else {
        v19 = off_1E58FC0A8[v8];
      }
      [a4 encodeUInt64:*(void *)(a3 + 8 * v8) forKey:v19];
      goto LABEL_36;
    }
    if (v11 == 113)
    {
      if (v8 > 9) {
        int v15 = 0;
      }
      else {
        int v15 = off_1E58FC0A8[v8];
      }
      [a4 encodeInt64:*(void *)(a3 + 8 * v8) forKey:v15];
      goto LABEL_36;
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v9, @"Unsupported ObjectiveC type: %c", (int)objc_msgSend(v10, "type"));
    goto LABEL_36;
  }
  return [a4 _finishCoding];
}

+ (uint64_t)decodeArguments:(uint64_t)a3 outArgs:(void *)a4 fromMessage:(void *)a5 forConnection:
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = self;
  if ((unint64_t)[a2 count] >= 0xB)
  {
    uint64_t v41 = v9;
    uint64_t v42 = (void *)[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[arguments count] <= 10"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v43 = NSStringFromSelector(sel_decodeArguments_outArgs_fromMessage_forConnection_);
      v44 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      v54 = v43;
      __int16 v55 = 2114;
      uint64_t v56 = NSStringFromClass(v44);
      __int16 v57 = 2048;
      uint64_t v58 = v41;
      __int16 v59 = 2114;
      v60 = @"BSXPCServiceConnectionProxy.m";
      __int16 v61 = 1024;
      int v62 = 784;
      __int16 v63 = 2114;
      v64 = v42;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v42 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C75DBD0);
  }
  uint64_t v48 = v9;
  uint64_t v50 = a2;
  v10 = (void *)+[BSXPCServiceConnectionProxy concreteArgumentsForArguments:]((uint64_t)BSXPCServiceConnectionProxy, a2);
  int v11 = (void *)[v10 lastObject];
  uint64_t v12 = [v11 objectClass];
  uint64_t v13 = objc_opt_class();
  char v14 = [a4 containsValueForKey:@"BSXPCReturnError"];
  if ((v14 & 1) == 0 && v12 == v13)
  {
    unint64_t v15 = [v11 argumentIndex];
    if (v15 > 9) {
      char v16 = 0;
    }
    else {
      char v16 = off_1E58FC0A8[v15];
    }
    char v14 = [a4 containsValueForKey:v16];
  }
  uint64_t v51 = v13;
  v49 = v11;
  v52 = a5;
  if ([v10 count])
  {
    unint64_t v17 = 0;
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    do
    {
      v19 = (void *)[v10 objectAtIndex:v17];
      if (v17 != [v19 argumentIndex])
      {
        uint64_t v38 = (void *)[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[argument argumentIndex] == idx"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          __int16 v39 = NSStringFromSelector(sel_decodeArguments_outArgs_fromMessage_forConnection_);
          v40 = (objc_class *)objc_opt_class();
          *(_DWORD *)buf = 138544642;
          v54 = v39;
          __int16 v55 = 2114;
          uint64_t v56 = NSStringFromClass(v40);
          __int16 v57 = 2048;
          uint64_t v58 = v48;
          __int16 v59 = 2114;
          v60 = @"BSXPCServiceConnectionProxy.m";
          __int16 v61 = 1024;
          int v62 = 797;
          __int16 v63 = 2114;
          v64 = v38;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v38 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C75DAF0);
      }
      int v20 = [v19 type];
      if (v20 > 80)
      {
        if (v20 == 81)
        {
          if (v17 > 9) {
            v24 = 0;
          }
          else {
            v24 = off_1E58FC0A8[v17];
          }
          Class v25 = (Class)[a4 decodeUInt64ForKey:v24];
          goto LABEL_32;
        }
        if (v20 == 113)
        {
          if (v17 > 9) {
            v22 = 0;
          }
          else {
            v22 = off_1E58FC0A8[v17];
          }
          Class v25 = (Class)[a4 decodeInt64ForKey:v22];
          goto LABEL_32;
        }
      }
      else
      {
        if (v20 == 35)
        {
          if (v17 > 9) {
            id v23 = 0;
          }
          else {
            id v23 = off_1E58FC0A8[v17];
          }
          Class v25 = NSClassFromString((NSString *)[a4 decodeStringForKey:v23]);
LABEL_32:
          *(void *)(a3 + 8 * v17) = v25;
          goto LABEL_33;
        }
        if (v20 == 64)
        {
          if ([v19 isXPCObject])
          {
            if (v17 > 9) {
              v21 = 0;
            }
            else {
              v21 = off_1E58FC0A8[v17];
            }
            id v27 = (id)[a4 _implicitDecodeXPCObjectForKey:v21];
          }
          else
          {
            uint64_t v26 = (void *)[v19 objectClass];
            if ([v26 isSubclassOfClass:objc_opt_class()])
            {
              id v27 = v52;
            }
            else
            {
              v29 = (void *)[v19 objectContainedClasses];
              if ([v29 count])
              {
                if ([v26 isSubclassOfClass:objc_opt_class()])
                {
                  uint64_t v30 = [v29 objectAtIndex:1];
                  if (v17 > 9) {
                    uint64_t v31 = 0;
                  }
                  else {
                    uint64_t v31 = off_1E58FC0A8[v17];
                  }
                  id v27 = (id)[a4 decodeDictionaryOfClass:v30 forKey:v31];
                }
                else
                {
                  uint64_t v33 = [v29 firstObject];
                  if (v17 > 9) {
                    __int16 v34 = 0;
                  }
                  else {
                    __int16 v34 = off_1E58FC0A8[v17];
                  }
                  id v27 = (id)[a4 decodeCollectionOfClass:v26 containingClass:v33 forKey:v34];
                }
              }
              else
              {
                if (v17 > 9) {
                  __int16 v32 = 0;
                }
                else {
                  __int16 v32 = off_1E58FC0A8[v17];
                }
                id v27 = (id)[a4 decodeObjectOfClass:v26 forKey:v32];
              }
            }
          }
          *(void *)(a3 + 8 * v17) = v27;
          if (v27) {
            char v28 = 1;
          }
          else {
            char v28 = v14;
          }
          if ((v28 & 1) == 0 && [v19 isObjectNonnull]) {
            objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v18, @"Decoded nil for nonnull parameter %ld; expected %@",
          }
              v17,
              NSStringFromClass((Class)[v19 objectClass]));
          goto LABEL_33;
        }
      }
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v18, @"Decoding value of type %c not implemented or supported", (int)objc_msgSend(v19, "type"));
LABEL_33:
      ++v17;
    }
    while (v17 < [v10 count]);
  }
  uint64_t result = [a4 containsValueForKey:@"BSXPCReturnError"];
  if (result)
  {
    uint64_t result = [a4 decodeObjectOfClass:objc_opt_class() forKey:@"BSXPCReturnError"];
    if (result)
    {
      if (v12 == v51)
      {
        uint64_t v36 = result;
        uint64_t v37 = objc_msgSend((id)objc_msgSend(v50, "lastObject"), "argumentIndex");
        if (v37 != [v10 count] - 1)
        {
          __int16 v45 = (void *)[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[arguments lastObject] argumentIndex] == ([concreteArguments count] - 1)"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            int v46 = NSStringFromSelector(sel_decodeArguments_outArgs_fromMessage_forConnection_);
            __int16 v47 = (objc_class *)objc_opt_class();
            *(_DWORD *)buf = 138544642;
            v54 = v46;
            __int16 v55 = 2114;
            uint64_t v56 = NSStringFromClass(v47);
            __int16 v57 = 2048;
            uint64_t v58 = v48;
            __int16 v59 = 2114;
            v60 = @"BSXPCServiceConnectionProxy.m";
            __int16 v61 = 1024;
            int v62 = 855;
            __int16 v63 = 2114;
            v64 = v45;
            _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          [v45 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19C75DCB0);
        }
        uint64_t result = [v49 argumentIndex];
        *(void *)(a3 + 8 * result) = v36;
      }
    }
  }
  return result;
}

+ (uint64_t)concreteArgumentsForArguments:(uint64_t)a1
{
  self;
  v3 = (void *)[a2 lastObject];
  int v4 = [v3 isPointer];
  int v5 = [v3 isBlock];
  if (!v3 || !(v4 | v5)) {
    return (uint64_t)a2;
  }
  uint64_t v6 = [a2 count] - 1;

  return objc_msgSend(a2, "subarrayWithRange:", 0, v6);
}

+ (void)invokeMethod:(uint64_t)a3 onTarget:(void *)a4 withMessage:(void *)a5 forConnection:(uint64_t)a6 completion:
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  uint64_t v79 = self;
  NSClassFromString(&cfstr_Bsobjcmethod.isa);
  if (!a2)
  {
    __int16 v39 = (void *)[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v40 = NSStringFromSelector(sel_invokeMethod_onTarget_withMessage_forConnection_completion_);
      uint64_t v41 = (objc_class *)objc_opt_class();
      LODWORD(v87[0]) = 138544642;
      *(void *)((char *)v87 + 4) = v40;
      WORD2(v87[1]) = 2114;
      *(void *)((char *)&v87[1] + 6) = NSStringFromClass(v41);
      HIWORD(v87[2]) = 2048;
      v87[3] = v79;
      LOWORD(v88) = 2114;
      *(void *)((char *)&v88 + 2) = @"BSXPCServiceConnectionProxy.m";
      WORD5(v88) = 1024;
      HIDWORD(v88) = 171;
      LOWORD(v89) = 2114;
      *(void *)((char *)&v89 + 2) = v39;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)v87, 0x3Au);
    }
    [v39 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C75E948);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v42 = (void *)[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSObjCMethodClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v43 = NSStringFromSelector(sel_invokeMethod_onTarget_withMessage_forConnection_completion_);
      v44 = (objc_class *)objc_opt_class();
      LODWORD(v87[0]) = 138544642;
      *(void *)((char *)v87 + 4) = v43;
      WORD2(v87[1]) = 2114;
      *(void *)((char *)&v87[1] + 6) = NSStringFromClass(v44);
      HIWORD(v87[2]) = 2048;
      v87[3] = v79;
      LOWORD(v88) = 2114;
      *(void *)((char *)&v88 + 2) = @"BSXPCServiceConnectionProxy.m";
      WORD5(v88) = 1024;
      HIDWORD(v88) = 171;
      LOWORD(v89) = 2114;
      *(void *)((char *)&v89 + 2) = v42;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)v87, 0x3Au);
    }
    [v42 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C75EA2CLL);
  }
  if (!a3)
  {
    __int16 v45 = (void *)[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"target"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v46 = NSStringFromSelector(sel_invokeMethod_onTarget_withMessage_forConnection_completion_);
      __int16 v47 = (objc_class *)objc_opt_class();
      LODWORD(v87[0]) = 138544642;
      *(void *)((char *)v87 + 4) = v46;
      WORD2(v87[1]) = 2114;
      *(void *)((char *)&v87[1] + 6) = NSStringFromClass(v47);
      HIWORD(v87[2]) = 2048;
      v87[3] = v79;
      LOWORD(v88) = 2114;
      *(void *)((char *)&v88 + 2) = @"BSXPCServiceConnectionProxy.m";
      WORD5(v88) = 1024;
      HIDWORD(v88) = 172;
      LOWORD(v89) = 2114;
      *(void *)((char *)&v89 + 2) = v45;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)v87, 0x3Au);
    }
    [v45 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C75EB10);
  }
  NSClassFromString(&cfstr_Bsxpcserviceco_2.isa);
  if (!a4)
  {
    uint64_t v48 = (void *)[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v49 = NSStringFromSelector(sel_invokeMethod_onTarget_withMessage_forConnection_completion_);
      uint64_t v50 = (objc_class *)objc_opt_class();
      LODWORD(v87[0]) = 138544642;
      *(void *)((char *)v87 + 4) = v49;
      WORD2(v87[1]) = 2114;
      *(void *)((char *)&v87[1] + 6) = NSStringFromClass(v50);
      HIWORD(v87[2]) = 2048;
      v87[3] = v79;
      LOWORD(v88) = 2114;
      *(void *)((char *)&v88 + 2) = @"BSXPCServiceConnectionProxy.m";
      WORD5(v88) = 1024;
      HIDWORD(v88) = 173;
      LOWORD(v89) = 2114;
      *(void *)((char *)&v89 + 2) = v48;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)v87, 0x3Au);
    }
    [v48 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C75EBF4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v51 = (void *)[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSXPCServiceConnectionMessageClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v52 = NSStringFromSelector(sel_invokeMethod_onTarget_withMessage_forConnection_completion_);
      uint64_t v53 = (objc_class *)objc_opt_class();
      LODWORD(v87[0]) = 138544642;
      *(void *)((char *)v87 + 4) = v52;
      WORD2(v87[1]) = 2114;
      *(void *)((char *)&v87[1] + 6) = NSStringFromClass(v53);
      HIWORD(v87[2]) = 2048;
      v87[3] = v79;
      LOWORD(v88) = 2114;
      *(void *)((char *)&v88 + 2) = @"BSXPCServiceConnectionProxy.m";
      WORD5(v88) = 1024;
      HIDWORD(v88) = 173;
      LOWORD(v89) = 2114;
      *(void *)((char *)&v89 + 2) = v51;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)v87, 0x3Au);
    }
    [v51 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C75ECD8);
  }
  NSClassFromString(&cfstr_Bsxpcserviceco.isa);
  if (!a5)
  {
    v54 = (void *)[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v55 = NSStringFromSelector(sel_invokeMethod_onTarget_withMessage_forConnection_completion_);
      uint64_t v56 = (objc_class *)objc_opt_class();
      LODWORD(v87[0]) = 138544642;
      *(void *)((char *)v87 + 4) = v55;
      WORD2(v87[1]) = 2114;
      *(void *)((char *)&v87[1] + 6) = NSStringFromClass(v56);
      HIWORD(v87[2]) = 2048;
      v87[3] = v79;
      LOWORD(v88) = 2114;
      *(void *)((char *)&v88 + 2) = @"BSXPCServiceConnectionProxy.m";
      WORD5(v88) = 1024;
      HIDWORD(v88) = 174;
      LOWORD(v89) = 2114;
      *(void *)((char *)&v89 + 2) = v54;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)v87, 0x3Au);
    }
    [v54 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C75EDBCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v57 = (void *)[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSXPCServiceConnectionClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v58 = NSStringFromSelector(sel_invokeMethod_onTarget_withMessage_forConnection_completion_);
      __int16 v59 = (objc_class *)objc_opt_class();
      LODWORD(v87[0]) = 138544642;
      *(void *)((char *)v87 + 4) = v58;
      WORD2(v87[1]) = 2114;
      *(void *)((char *)&v87[1] + 6) = NSStringFromClass(v59);
      HIWORD(v87[2]) = 2048;
      v87[3] = v79;
      LOWORD(v88) = 2114;
      *(void *)((char *)&v88 + 2) = @"BSXPCServiceConnectionProxy.m";
      WORD5(v88) = 1024;
      HIDWORD(v88) = 174;
      LOWORD(v89) = 2114;
      *(void *)((char *)&v89 + 2) = v57;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)v87, 0x3Au);
    }
    [v57 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C75EEA0);
  }
  int v11 = BSServiceXPCLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v29 = a5[22];
    if (v29) {
      uint64_t v30 = *(void *)(v29 + 8);
    }
    else {
      uint64_t v30 = 0;
    }
    uint64_t v31 = (objc_class *)objc_opt_class();
    LODWORD(v87[0]) = 138543874;
    *(void *)((char *)v87 + 4) = v30;
    WORD2(v87[1]) = 2112;
    *(void *)((char *)&v87[1] + 6) = NSStringFromClass(v31);
    HIWORD(v87[2]) = 2112;
    v87[3] = [a2 name];
    _os_log_debug_impl(&dword_19C754000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ Invoking -[%@ %@]", (uint8_t *)v87, 0x20u);
  }
  long long v89 = 0u;
  long long v90 = 0u;
  long long v88 = 0u;
  memset(v87, 0, sizeof(v87));
  +[BSXPCServiceConnectionProxy decodeArguments:outArgs:fromMessage:forConnection:]((uint64_t)BSXPCServiceConnectionProxy, (void *)[a2 arguments], (uint64_t)v87, a4, a5);
  uint64_t v12 = (void *)[a4 createReply];
  id v84 = 0;
  int v13 = objc_msgSend((id)objc_msgSend(a2, "returnValue"), "type");
  char v16 = (objc_class *)objc_opt_class();
  if (class_getInstanceMethod(v16, (SEL)[a2 selector]))
  {
    unint64_t v17 = (void *)[a2 lastArgument];
    if (([v17 isBlock] & 1) != 0 || objc_msgSend(v17, "isPointer"))
    {
      unint64_t v18 = [v17 argumentIndex];
      unint64_t v19 = v18;
      if (v18 >= 0xA)
      {
        id v68 = (void *)[NSString stringWithFormat:@"reply parameter argument is out of bounds"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v69 = NSStringFromSelector(sel_invokeMethod_onTarget_withMessage_forConnection_completion_);
          v70 = (objc_class *)objc_opt_class();
          v71 = NSStringFromClass(v70);
          *(_DWORD *)buf = 138544642;
          uint64_t v92 = v69;
          __int16 v93 = 2114;
          uint64_t v94 = (uint64_t)v71;
          __int16 v95 = 2048;
          uint64_t v96 = v79;
          __int16 v97 = 2114;
          v98 = @"BSXPCServiceConnectionProxy.m";
          __int16 v99 = 1024;
          int v100 = 209;
          __int16 v101 = 2114;
          v102 = v68;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v68 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C75F138);
      }
      if (v87[v18])
      {
        id v72 = (void *)[NSString stringWithFormat:@"reply parameter argument slot is not empty"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v73 = NSStringFromSelector(sel_invokeMethod_onTarget_withMessage_forConnection_completion_);
          id v74 = (objc_class *)objc_opt_class();
          v75 = NSStringFromClass(v74);
          *(_DWORD *)buf = 138544642;
          uint64_t v92 = v73;
          __int16 v93 = 2114;
          uint64_t v94 = (uint64_t)v75;
          __int16 v95 = 2048;
          uint64_t v96 = v79;
          __int16 v97 = 2114;
          v98 = @"BSXPCServiceConnectionProxy.m";
          __int16 v99 = 1024;
          int v100 = 210;
          __int16 v101 = 2114;
          v102 = v72;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v72 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C75F210);
      }
      if ([v17 isBlock])
      {
        uint64_t v20 = [v17 blockArguments];
        v21 = (void **)v83;
        v83[0] = MEMORY[0x1E4F143A8];
        v83[1] = 3221225472;
        v83[2] = __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke;
        v83[3] = &unk_1E58FBF30;
        v83[4] = v12;
        v83[5] = v20;
        v83[6] = a5;
        v83[7] = a2;
        v83[10] = sel_invokeMethod_onTarget_withMessage_forConnection_completion_;
        v83[8] = v79;
        v83[9] = a6;
        uint64_t v12 = 0;
        a6 = 0;
      }
      else
      {
        v21 = &v84;
      }
      v87[v19] = v21;
    }
    unint64_t v27 = objc_msgSend((id)objc_msgSend(a2, "arguments"), "count");
    uint64_t v28 = self;
    if (v27 >= 0xB)
    {
      v60 = (void *)[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"count <= BSOBJC_MAX_ARGS"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        __int16 v61 = NSStringFromSelector(sel_invokeMethod_onTarget_withArguments_count_returnValue_);
        int v62 = (objc_class *)objc_opt_class();
        __int16 v63 = NSStringFromClass(v62);
        *(_DWORD *)buf = 138544642;
        uint64_t v92 = v61;
        __int16 v93 = 2114;
        uint64_t v94 = (uint64_t)v63;
        __int16 v95 = 2048;
        uint64_t v96 = v28;
        __int16 v97 = 2114;
        v98 = @"BSXPCServiceConnectionProxy.m";
        __int16 v99 = 1024;
        int v100 = 590;
        __int16 v101 = 2114;
        v102 = v60;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v60 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C75EF80);
    }
    NSClassFromString(&cfstr_Nsobject.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v64 = (void *)[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSObjectClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v65 = NSStringFromSelector(sel_invokeMethod_onTarget_withArguments_count_returnValue_);
        uint64_t v66 = (objc_class *)objc_opt_class();
        uint64_t v67 = NSStringFromClass(v66);
        *(_DWORD *)buf = 138544642;
        uint64_t v92 = v65;
        __int16 v93 = 2114;
        uint64_t v94 = (uint64_t)v67;
        __int16 v95 = 2048;
        uint64_t v96 = v28;
        __int16 v97 = 2114;
        v98 = @"BSXPCServiceConnectionProxy.m";
        __int16 v99 = 1024;
        int v100 = 591;
        __int16 v101 = 2114;
        v102 = v64;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v64 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C75F060);
    }
    switch(v27)
    {
      case 0uLL:
        switch(v13)
        {
          case '@':
            goto LABEL_84;
          case 'B':
            goto LABEL_82;
          case 'v':
            goto LABEL_63;
        }
        int v76 = 601;
        goto LABEL_165;
      case 1uLL:
        switch(v13)
        {
          case '@':
            goto LABEL_84;
          case 'B':
            goto LABEL_82;
          case 'v':
            goto LABEL_63;
        }
        int v76 = 607;
        goto LABEL_165;
      case 2uLL:
        switch(v13)
        {
          case '@':
            goto LABEL_84;
          case 'B':
            goto LABEL_82;
          case 'v':
            goto LABEL_63;
        }
        int v76 = 613;
        goto LABEL_165;
      case 3uLL:
        switch(v13)
        {
          case '@':
            goto LABEL_84;
          case 'B':
            goto LABEL_82;
          case 'v':
            goto LABEL_63;
        }
        int v76 = 619;
        goto LABEL_165;
      case 4uLL:
        switch(v13)
        {
          case '@':
            goto LABEL_84;
          case 'B':
            goto LABEL_82;
          case 'v':
            goto LABEL_63;
        }
        int v76 = 625;
        goto LABEL_165;
      case 5uLL:
        switch(v13)
        {
          case '@':
            goto LABEL_84;
          case 'B':
            goto LABEL_82;
          case 'v':
            goto LABEL_63;
        }
        int v76 = 631;
        goto LABEL_165;
      case 6uLL:
        if (v13 != 64)
        {
          if (v13 != 66)
          {
            if (v13 == 118)
            {
LABEL_63:
              method_invoke();
              goto LABEL_72;
            }
            int v76 = 637;
LABEL_165:
            __assert_rtn("+[BSXPCServiceConnectionProxy invokeMethod:onTarget:withArguments:count:returnValue:]", "BSXPCServiceConnectionProxy.m", v76, "false");
          }
LABEL_82:
          method_invoke();
          goto LABEL_90;
        }
LABEL_84:
        method_invoke();
        break;
      case 7uLL:
        if (v13 != 64)
        {
          if (v13 == 66)
          {
            *(void *)&long long v77 = v89;
            method_invoke();
            goto LABEL_90;
          }
          if (v13 != 118)
          {
            int v76 = 643;
            goto LABEL_165;
          }
          *(void *)&long long v77 = v89;
          method_invoke();
          goto LABEL_72;
        }
        *(void *)&long long v77 = v89;
        method_invoke();
        break;
      case 8uLL:
        if (v13 != 64)
        {
          if (v13 != 66)
          {
            if (v13 == 118)
            {
              long long v77 = v89;
              method_invoke();
              goto LABEL_72;
            }
            int v76 = 649;
            goto LABEL_165;
          }
          long long v77 = v89;
          method_invoke();
          goto LABEL_90;
        }
        long long v77 = v89;
        method_invoke();
        break;
      case 9uLL:
        if (v13 != 64)
        {
          if (v13 == 66)
          {
            *(void *)&long long v78 = v90;
            long long v77 = v89;
            method_invoke();
            goto LABEL_90;
          }
          if (v13 != 118)
          {
            int v76 = 655;
            goto LABEL_165;
          }
          *(void *)&long long v78 = v90;
          long long v77 = v89;
          method_invoke();
LABEL_72:
          uint64_t v15 = 0;
LABEL_95:
          uint64_t v14 = 0;
          goto LABEL_96;
        }
        *(void *)&long long v78 = v90;
        long long v77 = v89;
        method_invoke();
        break;
      case 0xAuLL:
        if (v13 != 64)
        {
          if (v13 != 66)
          {
            if (v13 == 118)
            {
              long long v78 = v90;
              long long v77 = v89;
              method_invoke();
              goto LABEL_72;
            }
            int v76 = 661;
            goto LABEL_165;
          }
          long long v78 = v90;
          long long v77 = v89;
          method_invoke();
LABEL_90:
          uint64_t v14 = v32;
          uint64_t v15 = 0;
LABEL_96:
          id v22 = 0;
          goto LABEL_97;
        }
        long long v78 = v90;
        long long v77 = v89;
        method_invoke();
        break;
      default:
        goto LABEL_72;
    }
    uint64_t v15 = v33;
    goto LABEL_95;
  }
  id v85 = @"BSServiceInterfaceMethod";
  v86[0] = [a2 name];
  id v22 = BSServiceConnectionErrorCreateWithInfo(3uLL, @"No method on target found for selector", (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:&v85 count:1]);
  id v23 = BSServiceXPCErrorsLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = (objc_class *)objc_opt_class();
    Class v25 = NSStringFromClass(v24);
    uint64_t v26 = [a2 name];
    *(_DWORD *)buf = 138412546;
    uint64_t v92 = v25;
    __int16 v93 = 2112;
    uint64_t v94 = v26;
    _os_log_error_impl(&dword_19C754000, v23, OS_LOG_TYPE_ERROR, "[BSXPCServiceConnectionProxy] Error: No method found on object %@ for @selector(%@)", buf, 0x16u);
  }
  uint64_t v14 = 0;
  uint64_t v15 = 0;
LABEL_97:
  if (v12)
  {
    if (v13 == 66)
    {
      [v12 encodeBool:v14 forKey:@"BSXPCReturnValue"];
    }
    else if (v13 == 64)
    {
      __int16 v34 = objc_msgSend(a2, "returnValue", v14);
      uint64_t v35 = [v34 objectClass];
      if (v15)
      {
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v82[0] = MEMORY[0x1E4F143A8];
          v82[1] = 3221225472;
          v82[2] = __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_81;
          v82[3] = &unk_1E58FBF58;
          v82[4] = v15;
          v82[5] = a2;
          v82[6] = v35;
          v82[7] = v79;
          v82[8] = sel_invokeMethod_onTarget_withMessage_forConnection_completion_;
          __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_81((uint64_t)v82);
        }
        [v12 encodeObject:v15 forKey:@"BSXPCReturnValue"];
      }
      else if ([v34 isObjectNonnull])
      {
        v81[0] = MEMORY[0x1E4F143A8];
        v81[1] = 3221225472;
        v81[2] = __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_85;
        v81[3] = &unk_1E58FBF08;
        v81[4] = a2;
        v81[5] = v35;
        v81[6] = v79;
        v81[7] = sel_invokeMethod_onTarget_withMessage_forConnection_completion_;
        __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_85((uint64_t)v81);
      }
    }
    if (v84)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v37 = v84;
      if ((isKindOfClass & 1) == 0)
      {
        v80[0] = MEMORY[0x1E4F143A8];
        v80[1] = 3221225472;
        v80[2] = __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_90;
        v80[3] = &unk_1E58FBF08;
        v80[4] = v84;
        v80[5] = a2;
        v80[6] = v79;
        v80[7] = sel_invokeMethod_onTarget_withMessage_forConnection_completion_;
        __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_90((uint64_t)v80);
      }
    }
    else
    {
      uint64_t v37 = 0;
    }
    if (v37) {
      id v38 = v37;
    }
    else {
      id v38 = v22;
    }
    if (v38) {
      [v12 encodeObject:v38 forKey:@"BSXPCReturnError"];
    }
    objc_msgSend(v12, "send", v77, v78);
    [v12 invalidate];
  }
  if (a6) {
    (*(void (**)(uint64_t))(a6 + 16))(a6);
  }
}

+ (void)proxyForConnection:(void *)a3 handshake:(void *)a4 withProtocol:(int)a5 activationGeneration:(void *)a6 activeXPCConnection:(void *)a7 xpcConnectionTargetQueue:(void *)a8 replyQueue:(void *)a9 target:(void *)a10 attributes:(void *)a11 assertionProvider:
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = self;
  NSClassFromString(&cfstr_Bsxpcserviceco.isa);
  if (!a2)
  {
    uint64_t v32 = (void *)[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = NSStringFromSelector(sel_proxyForConnection_handshake_withProtocol_activationGeneration_activeXPCConnection_xpcConnectionTargetQueue_replyQueue_target_attributes_assertionProvider_);
      __int16 v34 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      __int16 v55 = v33;
      __int16 v56 = 2114;
      __int16 v57 = NSStringFromClass(v34);
      __int16 v58 = 2048;
      uint64_t v59 = v18;
      __int16 v60 = 2114;
      __int16 v61 = @"BSXPCServiceConnectionProxy.m";
      __int16 v62 = 1024;
      int v63 = 132;
      __int16 v64 = 2114;
      uint64_t v65 = v32;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C763664);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v35 = (void *)[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSXPCServiceConnectionClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = NSStringFromSelector(sel_proxyForConnection_handshake_withProtocol_activationGeneration_activeXPCConnection_xpcConnectionTargetQueue_replyQueue_target_attributes_assertionProvider_);
      uint64_t v37 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      __int16 v55 = v36;
      __int16 v56 = 2114;
      __int16 v57 = NSStringFromClass(v37);
      __int16 v58 = 2048;
      uint64_t v59 = v18;
      __int16 v60 = 2114;
      __int16 v61 = @"BSXPCServiceConnectionProxy.m";
      __int16 v62 = 1024;
      int v63 = 132;
      __int16 v64 = 2114;
      uint64_t v65 = v35;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v35 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C763740);
  }
  NSClassFromString(&cfstr_Bsobjcprotocol.isa);
  if (!a4)
  {
    id v38 = (void *)[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v39 = NSStringFromSelector(sel_proxyForConnection_handshake_withProtocol_activationGeneration_activeXPCConnection_xpcConnectionTargetQueue_replyQueue_target_attributes_assertionProvider_);
      v40 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      __int16 v55 = v39;
      __int16 v56 = 2114;
      __int16 v57 = NSStringFromClass(v40);
      __int16 v58 = 2048;
      uint64_t v59 = v18;
      __int16 v60 = 2114;
      __int16 v61 = @"BSXPCServiceConnectionProxy.m";
      __int16 v62 = 1024;
      int v63 = 133;
      __int16 v64 = 2114;
      uint64_t v65 = v38;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v38 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76381CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v41 = (void *)[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSObjCProtocolClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = NSStringFromSelector(sel_proxyForConnection_handshake_withProtocol_activationGeneration_activeXPCConnection_xpcConnectionTargetQueue_replyQueue_target_attributes_assertionProvider_);
      __int16 v43 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      __int16 v55 = v42;
      __int16 v56 = 2114;
      __int16 v57 = NSStringFromClass(v43);
      __int16 v58 = 2048;
      uint64_t v59 = v18;
      __int16 v60 = 2114;
      __int16 v61 = @"BSXPCServiceConnectionProxy.m";
      __int16 v62 = 1024;
      int v63 = 133;
      __int16 v64 = 2114;
      uint64_t v65 = v41;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v41 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C7638F8);
  }
  if (!objc_msgSend((id)objc_msgSend(a4, "methods"), "count"))
  {
    v44 = (void *)[NSString stringWithFormat:@"remoteProtocol has no methods"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v45 = NSStringFromSelector(sel_proxyForConnection_handshake_withProtocol_activationGeneration_activeXPCConnection_xpcConnectionTargetQueue_replyQueue_target_attributes_assertionProvider_);
      int v46 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      __int16 v55 = v45;
      __int16 v56 = 2114;
      __int16 v57 = NSStringFromClass(v46);
      __int16 v58 = 2048;
      uint64_t v59 = v18;
      __int16 v60 = 2114;
      __int16 v61 = @"BSXPCServiceConnectionProxy.m";
      __int16 v62 = 1024;
      int v63 = 134;
      __int16 v64 = 2114;
      uint64_t v65 = v44;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v44 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C7639C8);
  }
  if (!a8)
  {
    __int16 v47 = (void *)[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"replyQueue"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v48 = NSStringFromSelector(sel_proxyForConnection_handshake_withProtocol_activationGeneration_activeXPCConnection_xpcConnectionTargetQueue_replyQueue_target_attributes_assertionProvider_);
      v49 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      __int16 v55 = v48;
      __int16 v56 = 2114;
      __int16 v57 = NSStringFromClass(v49);
      __int16 v58 = 2048;
      uint64_t v59 = v18;
      __int16 v60 = 2114;
      __int16 v61 = @"BSXPCServiceConnectionProxy.m";
      __int16 v62 = 1024;
      int v63 = 135;
      __int16 v64 = 2114;
      uint64_t v65 = v47;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v47 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C763AA4);
  }
  if (a3 && ![a10 count])
  {
    uint64_t v50 = (void *)[NSString stringWithFormat:@"handshake is only supported if there are launching attributes"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v51 = NSStringFromSelector(sel_proxyForConnection_handshake_withProtocol_activationGeneration_activeXPCConnection_xpcConnectionTargetQueue_replyQueue_target_attributes_assertionProvider_);
      v52 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      __int16 v55 = v51;
      __int16 v56 = 2114;
      __int16 v57 = NSStringFromClass(v52);
      __int16 v58 = 2048;
      uint64_t v59 = v18;
      __int16 v60 = 2114;
      __int16 v61 = @"BSXPCServiceConnectionProxy.m";
      __int16 v62 = 1024;
      int v63 = 136;
      __int16 v64 = 2114;
      uint64_t v65 = v50;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v50 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C763B74);
  }
  int v19 = a5;
  uint64_t v53 = a6;
  uint64_t v20 = [a4 name];
  uint64_t v21 = [a10 count];
  id v22 = BSServiceXPCLog();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    v24 = a7;
    if (v23)
    {
      uint64_t v25 = a2[22];
      if (v25) {
        uint64_t v25 = *(void *)(v25 + 8);
      }
      *(_DWORD *)buf = 138543874;
      __int16 v55 = (NSString *)v25;
      __int16 v56 = 2114;
      __int16 v57 = (NSString *)v20;
      __int16 v58 = 2114;
      uint64_t v59 = (uint64_t)a10;
      uint64_t v26 = "%{public}@ Remote proxy: <%{public}@> with %{public}@";
      unint64_t v27 = v22;
      uint32_t v28 = 32;
LABEL_18:
      _os_log_impl(&dword_19C754000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
    }
  }
  else
  {
    v24 = a7;
    if (v23)
    {
      uint64_t v29 = a2[22];
      if (v29) {
        uint64_t v29 = *(void *)(v29 + 8);
      }
      *(_DWORD *)buf = 138543618;
      __int16 v55 = (NSString *)v29;
      __int16 v56 = 2114;
      __int16 v57 = (NSString *)v20;
      uint64_t v26 = "%{public}@ Remote proxy: <%{public}@>";
      unint64_t v27 = v22;
      uint32_t v28 = 22;
      goto LABEL_18;
    }
  }
  [NSString stringWithFormat:@"BSXPCServiceConnectionProxy<%@>", v20];
  objc_opt_class();
  uint64_t v30 = objc_alloc_init((Class)BSObjCClassCreate());
  v30[1] = a2;
  v30[2] = a3;
  v30[3] = a4;
  *((_DWORD *)v30 + 24) = v19;
  v30[4] = v53;
  v30[5] = v24;
  v30[6] = a8;
  v30[7] = [a9 copy];
  v30[8] = [a10 copy];
  v30[9] = [a11 copy];
  *((_DWORD *)v30 + 22) = 0;
  return v30;
}

void __71__BSXPCServiceConnectionProxy_createImplementationOfProtocol_forClass___block_invoke_140(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 64)) {
    -[BSXPCServiceConnectionProxy _decrementInFlightMessageCounter](*(void *)(a1 + 32));
  }
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = [a2 message];
  uint64_t v9 = *(os_unfair_lock_s **)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ____BSXPCServiceConnection_IS_INVOKING_A_MESSAGE_REPLY_BLOCK___block_invoke;
  v10[3] = &unk_1E58FC088;
  v10[7] = v9;
  v10[8] = v6;
  v10[4] = v7;
  v10[5] = v8;
  v10[6] = a3;
  BSXPCServiceConnectionExecuteCallOut(v9, 0, (uint64_t)v10);
}

- (void)dealloc
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_lock_assertion)
  {
    connection = self->_connection;
    if (connection && (context = connection->_context) != 0) {
      proem = context->_proem;
    }
    else {
      proem = 0;
    }
    uint64_t v7 = (void *)[NSString stringWithFormat:@"%@ <%@:%p> dealloced before releasing its assertion : in-flight-messages=%u", proem, objc_opt_class(), self, self->_lock_messagesCount];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = NSStringFromSelector(a2);
      uint64_t v9 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      uint64_t v14 = NSStringFromClass(v9);
      __int16 v15 = 2048;
      char v16 = self;
      __int16 v17 = 2114;
      uint64_t v18 = @"BSXPCServiceConnectionProxy.m";
      __int16 v19 = 1024;
      int v20 = 328;
      __int16 v21 = 2114;
      id v22 = v7;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C771A60);
  }

  v10.receiver = self;
  v10.super_class = (Class)BSXPCServiceConnectionProxy;
  [(BSXPCServiceConnectionProxy *)&v10 dealloc];
}

uint64_t __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  __int16 v13 = *(void **)(a1 + 32);
  if (v13)
  {
    *(void *)buf = a2;
    *(void *)&buf[8] = a3;
    *(void *)&buf[16] = a4;
    *(void *)&long long v18 = a5;
    *((void *)&v18 + 1) = a6;
    uint64_t v19 = a7;
    uint64_t v20 = a8;
    uint64_t v21 = a9;
    uint64_t v22 = a10;
    uint64_t v23 = a11;
    +[BSXPCServiceConnectionProxy encodeArguments:inArgs:toMessage:forConnection:]((uint64_t)BSXPCServiceConnectionProxy, *(void **)(a1 + 40), (uint64_t)buf, v13);
    [*(id *)(a1 + 32) send];
    [*(id *)(a1 + 32) invalidate];
  }
  else if (a2)
  {
    char v16 = (void *)[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"arg1 == nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = [NSString stringWithUTF8String:"+[BSXPCServiceConnectionProxy invokeMethod:onTarget:withMessage:forConnection:completion:]_block_invoke"];
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"BSXPCServiceConnectionProxy.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v18) = 234;
      WORD2(v18) = 2114;
      *(void *)((char *)&v18 + 6) = v16;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C771F8CLL);
  }
  uint64_t result = *(void *)(a1 + 72);
  if (result)
  {
    __int16 v15 = *(uint64_t (**)(void))(result + 16);
    return v15();
  }
  return result;
}

- (void)_decrementInFlightMessageCounter
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 88);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    int v3 = *(_DWORD *)(a1 + 92);
    if (!v3)
    {
      uint64_t v5 = *(void *)(a1 + 8);
      if (v5 && (uint64_t v6 = *(void *)(v5 + 176)) != 0) {
        uint64_t v7 = *(void *)(v6 + 8);
      }
      else {
        uint64_t v7 = 0;
      }
      uint64_t v8 = (void *)[NSString stringWithFormat:@"%@ <%@:%p> unbalanced message tracking detected", v7, objc_opt_class(), a1];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = NSStringFromSelector(sel__decrementInFlightMessageCounter);
        objc_super v10 = (objc_class *)objc_opt_class();
        *(_DWORD *)buf = 138544642;
        uint64_t v12 = v9;
        __int16 v13 = 2114;
        uint64_t v14 = NSStringFromClass(v10);
        __int16 v15 = 2048;
        uint64_t v16 = a1;
        __int16 v17 = 2114;
        long long v18 = @"BSXPCServiceConnectionProxy.m";
        __int16 v19 = 1024;
        int v20 = 347;
        __int16 v21 = 2114;
        uint64_t v22 = v8;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v8 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C77F050);
    }
    int v4 = v3 - 1;
    *(_DWORD *)(a1 + 92) = v4;
    if (!v4)
    {
      [*(id *)(a1 + 80) invalidate];

      *(void *)(a1 + 80) = 0;
    }
    os_unfair_lock_unlock(v2);
  }
}

void __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_2(uint64_t a1)
{
  v2 = (void *)[NSString stringWithFormat:@"Error encoding reply block for %@: %@ -> %@", objc_msgSend(*(id *)(a1 + 32), "name"), objc_msgSend(*(id *)(a1 + 40), "description"), objc_msgSend(*(id *)(a1 + 40), "callStackSymbols")];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    uint64_t v6 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138544642;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    objc_super v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = @"BSXPCServiceConnectionProxy.m";
    __int16 v15 = 1024;
    int v16 = 226;
    __int16 v17 = 2114;
    long long v18 = v2;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v2 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

void __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_77(uint64_t a1)
{
  v2 = (void *)[NSString stringWithFormat:@"Error encoding return value from %@: %@ -> %@", objc_msgSend(*(id *)(a1 + 32), "name"), objc_msgSend(*(id *)(a1 + 40), "description"), objc_msgSend(*(id *)(a1 + 40), "callStackSymbols")];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    uint64_t v6 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138544642;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    objc_super v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = @"BSXPCServiceConnectionProxy.m";
    __int16 v15 = 1024;
    int v16 = 276;
    __int16 v17 = 2114;
    long long v18 = v2;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v2 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

void __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_81(uint64_t a1)
{
  v2 = NSString;
  int v3 = NSStringFromClass((Class)[*(id *)(a1 + 32) classForCoder]);
  int v4 = (void *)[v2 stringWithFormat:@"Return value %@ from %@ does not match expected type %@", v3, objc_msgSend(*(id *)(a1 + 40), "name"), NSStringFromClass(*(Class *)(a1 + 48))];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138544642;
    objc_super v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    int v16 = @"BSXPCServiceConnectionProxy.m";
    __int16 v17 = 1024;
    int v18 = 281;
    __int16 v19 = 2114;
    int v20 = v4;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

void __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_85(uint64_t a1)
{
  v2 = (void *)[NSString stringWithFormat:@"Return value from %@ is declared nonnull", objc_msgSend(*(id *)(a1 + 32), "name"), NSStringFromClass(*(Class *)(a1 + 40))];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    uint64_t v6 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138544642;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    objc_super v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = @"BSXPCServiceConnectionProxy.m";
    __int16 v15 = 1024;
    int v16 = 287;
    __int16 v17 = 2114;
    int v18 = v2;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v2 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

void __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_90(uint64_t a1)
{
  v2 = NSString;
  int v3 = (objc_class *)objc_opt_class();
  int v4 = (void *)[v2 stringWithFormat:@"Invalid out-parameter error (%@) from %@", NSStringFromClass(v3), objc_msgSend(*(id *)(a1 + 40), "name")];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138544642;
    objc_super v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    int v16 = @"BSXPCServiceConnectionProxy.m";
    __int16 v17 = 1024;
    int v18 = 297;
    __int16 v19 = 2114;
    int v20 = v4;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

void __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_97(uint64_t a1)
{
  v2 = (void *)[NSString stringWithFormat:@"Error encoding return error from %@: %@ -> %@", objc_msgSend(*(id *)(a1 + 32), "name"), objc_msgSend(*(id *)(a1 + 40), "description"), objc_msgSend(*(id *)(a1 + 40), "callStackSymbols")];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    uint64_t v6 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138544642;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    objc_super v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = @"BSXPCServiceConnectionProxy.m";
    __int16 v15 = 1024;
    int v16 = 306;
    __int16 v17 = 2114;
    int v18 = v2;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v2 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

void __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_101(uint64_t a1)
{
}

void __71__BSXPCServiceConnectionProxy_createImplementationOfProtocol_forClass___block_invoke_120(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 8);
  }
  else {
    uint64_t v3 = 0;
  }
  int v4 = (void *)[NSString stringWithFormat:@"%@ <%@:%p> Encoding of %@ in <%@> failed: %@ -> %@", v3, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), objc_msgSend(*(id *)(a1 + 64), "name"), objc_msgSend(*(id *)(a1 + 72), "description"), objc_msgSend(*(id *)(a1 + 72), "callStackSymbols")];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 88));
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = *(void *)(a1 + 80);
    *(_DWORD *)buf = 138544642;
    objc_super v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    int v16 = @"BSXPCServiceConnectionProxy.m";
    __int16 v17 = 1024;
    int v18 = 417;
    __int16 v19 = 2114;
    int v20 = v4;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
  JUMPOUT(0x19C780C58);
}

void __71__BSXPCServiceConnectionProxy_createImplementationOfProtocol_forClass___block_invoke_136(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v2 = *(void *)(v2 + 8);
  }
  uint64_t v3 = (void *)[NSString stringWithFormat:@"%@ <%@:%p> failed to acquire assertion : error=%@  attributes=%@", v2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(*(void *)(a1 + 48) + 64)];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v4 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    uint64_t v7 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 138544642;
    __int16 v9 = v4;
    __int16 v10 = 2114;
    __int16 v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    __int16 v15 = @"BSXPCServiceConnectionProxy.m";
    __int16 v16 = 1024;
    int v17 = 453;
    __int16 v18 = 2114;
    __int16 v19 = v3;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v3 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

void __71__BSXPCServiceConnectionProxy_createImplementationOfProtocol_forClass___block_invoke_2(uint64_t a1)
{
}

@end