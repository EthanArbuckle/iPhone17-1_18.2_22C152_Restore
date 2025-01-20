@interface CRSystemHealthStatus
- (BOOL)getCurrentSystemHealthStatusForComponents:(unint64_t)a3 WithReply:(id)a4;
@end

@implementation CRSystemHealthStatus

- (BOOL)getCurrentSystemHealthStatusForComponents:(unint64_t)a3 WithReply:(id)a4
{
  v5 = (void (**)(id, void, uint64_t, uint64_t))a4;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = sub_1D966AF30;
  v46 = sub_1D966AF40;
  id v47 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_1D966AF30;
  v40 = sub_1D966AF40;
  id v41 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_1D966AF30;
  v34 = sub_1D966AF40;
  id v35 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  id v6 = objc_alloc(MEMORY[0x1E4F29268]);
  uint64_t v8 = objc_msgSend_initWithMachServiceName_options_(v6, v7, @"com.apple.mobilerepaird", 0);
  v9 = (void *)v43[5];
  v43[5] = v8;

  v12 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v10, (uint64_t)&unk_1F338FB50, v11);
  objc_msgSend_setRemoteObjectInterface_((void *)v43[5], v13, (uint64_t)v12, v14);

  objc_msgSend_resume((void *)v43[5], v15, v16, v17);
  v18 = (void *)v43[5];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1D966AF48;
  v25[3] = &unk_1E6B6F890;
  v25[4] = &v36;
  v21 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v18, v19, (uint64_t)v25, v20);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1D966AFBC;
  v24[3] = &unk_1E6B6F8B8;
  v24[4] = &v36;
  v24[5] = &v26;
  v24[6] = &v30;
  v24[7] = &v42;
  objc_msgSend_getCurrentSystemHealthStatusForComponentsInternal_WithReply_(v21, v22, a3, (uint64_t)v24);

  v5[2](v5, *((unsigned __int8 *)v27 + 24), v31[5], v37[5]);
  LOBYTE(a3) = *((unsigned char *)v27 + 24);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return a3;
}

@end