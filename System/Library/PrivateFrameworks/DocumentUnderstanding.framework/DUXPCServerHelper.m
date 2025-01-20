@interface DUXPCServerHelper
+ (BOOL)checkForAndLogTrueBooleanEntitlement:(id)a3 connection:(id)a4 serviceName:(id)a5;
+ (BOOL)checkForAndLogTrueCStringEntitlement:(const char *)a3 connection:(id)a4;
+ (BOOL)shouldAcceptConnection:(id)a3 serviceName:(id)a4 whitelistedServerInterface:(id)a5 requestHandler:(id)a6 validateConnection:(id)a7 setupClientProxy:(id)a8 interruptionHandler:(id)a9 invalidationHandler:(id)a10;
+ (void)logFalseEntitlement:(id)a3 serviceName:(id)a4 processName:(id)a5;
@end

@implementation DUXPCServerHelper

+ (void)logFalseEntitlement:(id)a3 serviceName:(id)a4 processName:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v14 = objc_msgSend_length(v9, v10, v11, v12, v13);
  v15 = du_xpc_log_handle();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
  if (v14)
  {
    if (v16)
    {
      int v26 = 138412802;
      *(void *)v27 = v9;
      *(_WORD *)&v27[8] = 2112;
      *(void *)&v27[10] = v8;
      *(_WORD *)&v27[18] = 2112;
      *(void *)&v27[20] = v7;
      _os_log_error_impl(&dword_2367AD000, v15, OS_LOG_TYPE_ERROR, "Connection from %@ to %@ is missing entitlement: %@", (uint8_t *)&v26, 0x20u);
    }
  }
  else if (v16)
  {
    v21 = objc_msgSend_processInfo(MEMORY[0x263F08AB0], v17, v18, v19, v20);
    int v26 = 67109634;
    *(_DWORD *)v27 = objc_msgSend_processIdentifier(v21, v22, v23, v24, v25);
    *(_WORD *)&v27[4] = 2112;
    *(void *)&v27[6] = v8;
    *(_WORD *)&v27[14] = 2112;
    *(void *)&v27[16] = v7;
    _os_log_error_impl(&dword_2367AD000, v15, OS_LOG_TYPE_ERROR, "Connection from %d to %@ failed entitlement check %@.", (uint8_t *)&v26, 0x1Cu);
  }
}

+ (BOOL)checkForAndLogTrueCStringEntitlement:(const char *)a3 connection:(id)a4
{
  v6 = (void *)xpc_connection_copy_entitlement_value();
  uint64_t v11 = v6;
  if (v6 && xpc_BOOL_get_value(v6))
  {
    BOOL v12 = 1;
  }
  else
  {
    uint64_t v13 = objc_msgSend_processInfo(MEMORY[0x263F08AB0], v7, v8, v9, v10);
    uint64_t v18 = objc_msgSend_processName(v13, v14, v15, v16, v17);

    id v19 = [NSString alloc];
    v22 = objc_msgSend_initWithCString_encoding_(v19, v20, (uint64_t)a3, 4, v21);
    objc_msgSend_logFalseEntitlement_serviceName_processName_(a1, v23, (uint64_t)v22, (uint64_t)v22, (uint64_t)v18);

    BOOL v12 = 0;
  }

  return v12;
}

+ (BOOL)checkForAndLogTrueBooleanEntitlement:(id)a3 connection:(id)a4 serviceName:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char hasTrueBooleanEntitlement_connection_logHandle = objc_msgSend_hasTrueBooleanEntitlement_connection_logHandle_(MEMORY[0x263F61EC0], v11, (uint64_t)v8, (uint64_t)v9, &_os_log_internal);
  if ((hasTrueBooleanEntitlement_connection_logHandle & 1) == 0)
  {
    int __errnum = 0;
    int v17 = objc_msgSend_processIdentifier(v9, v12, v13, v14, v15);
    id v19 = sub_236970E9C(v17, &__errnum);
    if (__errnum)
    {
      uint64_t v20 = du_xpc_log_handle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v26 = objc_msgSend_processIdentifier(v9, v21, v22, v23, v24);
        v27 = strerror(__errnum);
        *(_DWORD *)buf = 67109634;
        int v30 = v26;
        __int16 v31 = 2112;
        id v32 = v10;
        __int16 v33 = 2080;
        v34 = v27;
        _os_log_error_impl(&dword_2367AD000, v20, OS_LOG_TYPE_ERROR, "Connection from %d to %@ failed entitlement check (proc_name error: %s).", buf, 0x1Cu);
      }
    }
    else
    {
      objc_msgSend_logFalseEntitlement_serviceName_processName_(a1, v18, (uint64_t)v8, (uint64_t)v10, (uint64_t)v19);
    }
  }
  return hasTrueBooleanEntitlement_connection_logHandle;
}

+ (BOOL)shouldAcceptConnection:(id)a3 serviceName:(id)a4 whitelistedServerInterface:(id)a5 requestHandler:(id)a6 validateConnection:(id)a7 setupClientProxy:(id)a8 interruptionHandler:(id)a9 invalidationHandler:(id)a10
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v68 = a5;
  id v69 = a6;
  int v17 = (uint64_t (**)(id, id, void *))a7;
  id v67 = a8;
  id v70 = a9;
  id v18 = a10;
  int v81 = 0;
  int v23 = objc_msgSend_processIdentifier(v15, v19, v20, v21, v22);
  uint64_t v24 = sub_236970E9C(v23, &v81);
  if (objc_msgSend_length(v24, v25, v26, v27, v28))
  {
    v29 = du_xpc_log_handle();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v34 = objc_msgSend_processIdentifier(v15, v30, v31, v32, v33);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v16;
    __int16 v83 = 2112;
    v84 = v24;
    __int16 v85 = 2048;
    v86 = (char *)v34;
    uint64_t v35 = "New connection to %@ from %@ (%lu).";
LABEL_7:
    v44 = v29;
    uint32_t v45 = 32;
LABEL_8:
    _os_log_impl(&dword_2367AD000, v44, OS_LOG_TYPE_DEFAULT, v35, buf, v45);
    goto LABEL_9;
  }
  int v36 = v81;
  v29 = du_xpc_log_handle();
  BOOL v37 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
  if (v36)
  {
    if (!v37) {
      goto LABEL_9;
    }
    int v42 = objc_msgSend_processIdentifier(v15, v38, v39, v40, v41);
    v43 = strerror(v81);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v16;
    __int16 v83 = 2048;
    v84 = (void *)v42;
    __int16 v85 = 2080;
    v86 = v43;
    uint64_t v35 = "New connection to %@ from unknown process (%lu) (proc_name error: %s).";
    goto LABEL_7;
  }
  if (v37)
  {
    int v66 = objc_msgSend_processIdentifier(v15, v38, v39, v40, v41);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v16;
    __int16 v83 = 2048;
    v84 = (void *)v66;
    uint64_t v35 = "New connection to %@ from unknown process (%lu).";
    v44 = v29;
    uint32_t v45 = 22;
    goto LABEL_8;
  }
LABEL_9:

  int v49 = v17[2](v17, v15, v24);
  if (v49)
  {
    objc_msgSend_setExportedInterface_(v15, v46, (uint64_t)v68, v47, v48);
    objc_msgSend_setExportedObject_(v15, v50, (uint64_t)v69, v51, v52);
    *(void *)buf = 0;
    objc_initWeak((id *)buf, v15);
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    v76[2] = sub_236971390;
    v76[3] = &unk_264CB4440;
    objc_copyWeak(&v80, (id *)buf);
    id v53 = v16;
    id v77 = v53;
    id v54 = v24;
    id v78 = v54;
    id v79 = v70;
    objc_msgSend_setInterruptionHandler_(v15, v55, (uint64_t)v76, v56, v57);
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = sub_236971494;
    v71[3] = &unk_264CB4440;
    objc_copyWeak(&v75, (id *)buf);
    id v72 = v53;
    id v73 = v54;
    id v74 = v18;
    objc_msgSend_setInvalidationHandler_(v15, v58, (uint64_t)v71, v59, v60);
    objc_msgSend_resume(v15, v61, v62, v63, v64);

    objc_destroyWeak(&v75);
    objc_destroyWeak(&v80);
    objc_destroyWeak((id *)buf);
  }

  return v49;
}

@end