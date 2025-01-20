@interface IDSServerMaterialExchangeController
- (IDSServerMaterialExchangeController)initWithDelegate:(id)a3;
- (IDSServerMaterialExchangeDelegate)delegate;
- (NSString)sessionID;
- (id)_buildMaterialInfoForDesiredMaterialDataNoSignature:(id)a3 materialType:(int)a4 materialID:(id)a5 sessionID:(id)a6;
- (id)_buildMaterialInfoForDesiredMaterialDataRequireSignature:(id)a3 materialType:(int)a4 materialID:(id)a5 sessionID:(id)a6;
- (id)buildMaterialInfoForDesiredMaterialData:(id)a3 materialType:(int)a4 materialID:(id)a5 sessionID:(id)a6 requireSign:(BOOL)a7;
- (id)currentlySentMaterials;
- (id)desiredMaterials;
- (id)materialProtosForDesiredMaterials:(id)a3 failures:(id)a4;
- (id)pendingMaterials;
- (void)invalidateMaterialsInArray:(id)a3;
- (void)invalidateMaterialsInSet:(id)a3;
- (void)markMaterialsInArrayAsSent:(id)a3;
- (void)markMaterialsInSetAsSent:(id)a3;
- (void)setDesiredMaterialsForSession:(id)a3 materials:(id)a4 signer:(id)a5;
- (void)setNeedsUpdate;
- (void)update;
@end

@implementation IDSServerMaterialExchangeController

- (IDSServerMaterialExchangeController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IDSServerMaterialExchangeController;
  v7 = [(IDSServerMaterialExchangeController *)&v16 init];
  if (v7)
  {
    v9 = objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v5, v6, v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "ServerMaterialExchangeController initialized", v15, 2u);
    }

    v7->_needsUpdate = 0;
    objc_storeWeak((id *)&v7->_delegate, v4);
    sessionID = v7->_sessionID;
    v7->_sessionID = 0;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    currentlySentMaterials = v7->_currentlySentMaterials;
    v7->_currentlySentMaterials = v11;

    v7->_lock._os_unfair_lock_opaque = 0;
    v13 = v7;
  }

  return v7;
}

- (id)currentlySentMaterials
{
  return self->_currentlySentMaterials;
}

- (id)desiredMaterials
{
  return self->_desiredMaterials;
}

- (void)setDesiredMaterialsForSession:(id)a3 materials:(id)a4 signer:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id obj = a3;
  id v8 = a3;
  id v9 = a4;
  id v53 = a5;
  os_unfair_lock_lock(&self->_lock);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v10 = (NSSet *)v9;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v54, v12, v62, 16);
  if (v13)
  {
    uint64_t v17 = v13;
    uint64_t v18 = *(void *)v55;
    v19 = &stru_1EEFDAD58;
    do
    {
      uint64_t v20 = 0;
      v21 = v19;
      do
      {
        if (*(void *)v55 != v18) {
          objc_enumerationMutation(v10);
        }
        uint64_t v22 = objc_msgSend_type(*(void **)(*((void *)&v54 + 1) + 8 * v20), v14, v15, v16);
        objc_msgSend_stringByAppendingFormat_(v21, v23, @" <%d>", v24, v22, obj);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v20;
        v21 = v19;
      }
      while (v17 != v20);
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v14, (uint64_t)&v54, v16, v62, 16);
    }
    while (v17);
  }
  else
  {
    v19 = &stru_1EEFDAD58;
  }

  objc_msgSend_count(v10, v25, v26, v27);
  id v28 = v8;
  v29 = v19;
  cut_dispatch_log_queue();
  if ((objc_msgSend_isEqual_(v28, v30, (uint64_t)self->_sessionID, v31) & 1) == 0)
  {
    v35 = objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v32, v33, v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      sessionID = self->_sessionID;
      *(_DWORD *)buf = 138412546;
      v59 = sessionID;
      __int16 v60 = 2112;
      id v61 = v28;
      _os_log_impl(&dword_19D9BE000, v35, OS_LOG_TYPE_DEFAULT, "setDesiredMaterialsForSession: session ID was %@; now %@",
        buf,
        0x16u);
    }

    objc_msgSend_set(MEMORY[0x1E4F1CA80], v37, v38, v39);
    v40 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    currentlySentMaterials = self->_currentlySentMaterials;
    self->_currentlySentMaterials = v40;

    objc_storeStrong((id *)&self->_sessionID, obj);
  }
  desiredMaterials = self->_desiredMaterials;
  self->_desiredMaterials = v10;
  v43 = v10;

  v47 = objc_msgSend_copy(v53, v44, v45, v46);
  id signDataBlock = self->_signDataBlock;
  self->_id signDataBlock = v47;

  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend_setNeedsUpdate(self, v49, v50, v51);
}

- (void)setNeedsUpdate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL needsUpdate = self->_needsUpdate;
  id v8 = objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v5, v6, v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (needsUpdate)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v8, OS_LOG_TYPE_DEFAULT, "setNeedsUpdate: update cycle already scheduled", buf, 2u);
    }
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v8, OS_LOG_TYPE_DEFAULT, "setNeedsUpdate: scheduling new update cycle", buf, 2u);
    }

    self->_BOOL needsUpdate = 1;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_19DB6A300;
    v10[3] = &unk_1E5973568;
    v10[4] = self;
    IDSTransportThreadAddBlock(v10);
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)buildMaterialInfoForDesiredMaterialData:(id)a3 materialType:(int)a4 materialID:(id)a5 sessionID:(id)a6 requireSign:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v10 = *(void *)&a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  uint64_t v18 = objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v15, v16, v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v34 = 1024;
    v19 = @"NO";
    int v32 = 138413314;
    id v33 = v13;
    if (v7) {
      v19 = @"YES";
    }
    int v35 = v10;
    __int16 v36 = 2112;
    id v37 = v14;
    __int16 v38 = 2112;
    double v39 = v19;
    __int16 v40 = 2112;
    id v41 = v12;
    _os_log_impl(&dword_19D9BE000, v18, OS_LOG_TYPE_DEFAULT, "buildMaterialInfoForDesiredMaterialData: materialID: %@ type: %d, sessionID %@, requireSign: %@, data: %@", (uint8_t *)&v32, 0x30u);
  }

  int v20 = IMGetDomainBoolForKey();
  if (v10 == 12 && v20)
  {
    double v24 = objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v21, v22, v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      v25 = "buildMaterialInfoForDesiredMaterialData: AVC datablob, dont build the material, return";
LABEL_13:
      _os_log_impl(&dword_19D9BE000, v24, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v32, 2u);
    }
  }
  else
  {
    int v26 = IMGetDomainBoolForKey();
    if (v10 != 13 || !v26)
    {
      if (v7) {
        objc_msgSend__buildMaterialInfoForDesiredMaterialDataRequireSignature_materialType_materialID_sessionID_(self, v27, (uint64_t)v12, v29, v10, v13, v14);
      }
      else {
      v30 = objc_msgSend__buildMaterialInfoForDesiredMaterialDataNoSignature_materialType_materialID_sessionID_(self, v27, (uint64_t)v12, v29, v10, v13, v14);
      }
      goto LABEL_19;
    }
    double v24 = objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v27, v28, v29);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      v25 = "buildMaterialInfoForDesiredMaterialData: MKM, dont build the material, return";
      goto LABEL_13;
    }
  }

  v30 = 0;
LABEL_19:

  return v30;
}

- (id)_buildMaterialInfoForDesiredMaterialDataNoSignature:(id)a3 materialType:(int)a4 materialID:(id)a5 sessionID:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v15 = objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v12, v13, v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412802;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v11;
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_impl(&dword_19D9BE000, v15, OS_LOG_TYPE_DEFAULT, "_buildMaterialInfoForDesiredMaterialDataNoSignature: materialID: %@, sessionID %@, materialData: %@", (uint8_t *)&v24, 0x20u);
  }

  uint64_t v16 = objc_alloc_init(IDSQRProtoMaterialInfo);
  objc_msgSend_setMaterialId_(v16, v17, (uint64_t)v10, v18);
  objc_msgSend_setMaterialContent_(v16, v19, (uint64_t)v9, v20);
  objc_msgSend_setMaterialType_(v16, v21, v8, v22);

  return v16;
}

- (id)_buildMaterialInfoForDesiredMaterialDataRequireSignature:(id)a3 materialType:(int)a4 materialID:(id)a5 sessionID:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v16 = objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v13, v14, v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v51 = v11;
    __int16 v52 = 2112;
    id v53 = v12;
    __int16 v54 = 1024;
    int v55 = v8;
    __int16 v56 = 2112;
    id v57 = v10;
    _os_log_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_DEFAULT, "_buildMaterialInfoForDesiredMaterialDataRequireSignature: materialID: %@ sessionID %@, type: %d, materialData: %@", buf, 0x26u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v18 = (void (**)(void *, NSObject *, id *))_Block_copy(self->_signDataBlock);
  os_unfair_lock_unlock(p_lock);
  if (v18)
  {
    double v22 = (void *)MEMORY[0x1E4F1CA58];
    double v23 = objc_msgSend_dataUsingEncoding_(v12, v19, 4, v21);
    __int16 v26 = objc_msgSend_dataWithData_(v22, v24, (uint64_t)v23, v25);

    objc_msgSend_appendData_(v26, v27, (uint64_t)v10, v28);
    id v47 = 0;
    id v29 = v18[2](v18, v26, &v47);
    id v30 = v47;
    __int16 v34 = v30;
    if (!v29 || v30)
    {
      uint64_t v42 = objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v31, v32, v33);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_19DB82AD4((uint64_t)v34, v42);
      }
      int v35 = 0;
    }
    else
    {
      int v35 = objc_alloc_init(IDSQRProtoMaterialInfo);
      objc_msgSend_setMaterialId_(v35, v36, (uint64_t)v11, v37);
      objc_msgSend_setMaterialType_(v35, v38, v8, v39);
      v48[0] = @"payload";
      v48[1] = @"sessionID";
      v49[0] = v10;
      v49[1] = v12;
      v48[2] = @"signature";
      v49[2] = v29;
      uint64_t v42 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v40, (uint64_t)v49, v41, v48, 3);
      v43 = JWEncodeDictionary();
      objc_msgSend_setMaterialContent_(v35, v44, (uint64_t)v43, v45);
    }
  }
  else
  {
    __int16 v26 = objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v19, v20, v21);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_19DB82A90(v26);
    }
    int v35 = 0;
  }

  return v35;
}

- (id)materialProtosForDesiredMaterials:(id)a3 failures:(id)a4
{
  id v6 = a4;
  BOOL v7 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_19DB6AAD0;
  v19[3] = &unk_1E5975C50;
  id v11 = v10;
  id v20 = v11;
  double v21 = self;
  id v22 = v6;
  id v12 = v9;
  id v23 = v12;
  id v13 = v6;
  objc_msgSend_enumerateObjectsUsingBlock_(v8, v14, (uint64_t)v19, v15);

  id v16 = v11;
  cut_dispatch_log_queue();
  id v17 = v12;

  return v17;
}

- (id)pendingMaterials
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v7 = objc_msgSend_desiredMaterials(self, v4, v5, v6);
  id v11 = objc_msgSend_mutableCopy(v7, v8, v9, v10);

  double v15 = objc_msgSend_currentlySentMaterials(self, v12, v13, v14);
  v19 = objc_msgSend_copy(v15, v16, v17, v18);

  os_unfair_lock_unlock(p_lock);
  objc_msgSend_minusSet_(v11, v20, (uint64_t)v19, v21);

  return v11;
}

- (void)update
{
  self->_BOOL needsUpdate = 0;
  uint64_t v5 = objc_msgSend_ServerMaterialExchange(IDSFoundationLog, a2, v2, v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "update: comparing desired and server materials", buf, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = objc_msgSend_desiredMaterials(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_mutableCopy(v9, v10, v11, v12);

  uint64_t v17 = objc_msgSend_currentlySentMaterials(self, v14, v15, v16);
  double v21 = objc_msgSend_copy(v17, v18, v19, v20);

  os_unfair_lock_unlock(&self->_lock);
  double v25 = objc_msgSend_pendingMaterials(self, v22, v23, v24);
  id v29 = objc_msgSend_description(v13, v26, v27, v28);
  double v33 = objc_msgSend_description(v21, v30, v31, v32);
  double v37 = objc_msgSend_description(v25, v34, v35, v36);
  id v38 = v29;
  v68 = v38;
  id v39 = v33;
  v69 = v39;
  id v40 = v37;
  cut_dispatch_log_queue();
  if (objc_msgSend_count(v25, v41, v42, v43))
  {
    v67 = v21;
    id v47 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v44, v45, v46);
    uint64_t v50 = objc_msgSend_materialProtosForDesiredMaterials_failures_(self, v48, (uint64_t)v25, v49, v47);
    id v66 = v38;
    if (objc_msgSend_count(v50, v51, v52, v53))
    {
      id v65 = v39;
      objc_msgSend_description(v50, v54, v55, v56);
      id v57 = (id)objc_claimAutoreleasedReturnValue();
      cut_dispatch_log_queue();
      uint64_t v58 = v13;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      int v62 = objc_msgSend_qrMaterialExchangePutMaterial_(WeakRetained, v60, (uint64_t)v50, v61);

      uint64_t v13 = v58;
      if (v62)
      {
        objc_msgSend_minusSet_(v58, v63, (uint64_t)v47, v64);
        os_unfair_lock_lock(&self->_lock);
        objc_storeStrong((id *)&self->_currentlySentMaterials, v58);
        os_unfair_lock_unlock(&self->_lock);
      }

      id v39 = v65;
    }
    else
    {
      id v57 = objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v54, v55, v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v57, OS_LOG_TYPE_DEFAULT, "update: no materials to send", buf, 2u);
      }
    }

    id v38 = v66;
    double v21 = v67;
  }
  else
  {
    id v47 = objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v44, v45, v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v47, OS_LOG_TYPE_DEFAULT, "update: nothing to send", buf, 2u);
    }
  }
}

- (void)invalidateMaterialsInSet:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_minusSet_(self->_currentlySentMaterials, v6, (uint64_t)v5, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)invalidateMaterialsInArray:(id)a3
{
  objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], a2, (uint64_t)a3, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidateMaterialsInSet_(self, v5, (uint64_t)v7, v6);
}

- (void)markMaterialsInSetAsSent:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_unionSet_(self->_currentlySentMaterials, v6, (uint64_t)v5, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)markMaterialsInArrayAsSent:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_addObjectsFromArray_(self->_currentlySentMaterials, v6, (uint64_t)v5, v7);

  os_unfair_lock_unlock(p_lock);
}

- (IDSServerMaterialExchangeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IDSServerMaterialExchangeDelegate *)WeakRetained;
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_signDataBlock, 0);
  objc_storeStrong((id *)&self->_desiredMaterials, 0);
  objc_storeStrong((id *)&self->_currentlySentMaterials, 0);
}

@end