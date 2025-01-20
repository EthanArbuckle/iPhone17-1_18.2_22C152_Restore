@interface IDSGroupEncryptionKeyManager
- (BOOL)recvKeyMaterial:(id)a3;
- (BOOL)useCurrentEncryptionkeyWithHandler:(id)a3;
- (BOOL)useDecryptingKeyForKeyIndex:(id)a3 handler:(id)a4;
- (IDSGroupEncryptionKeyManager)initWithEncryptionContext:(id)a3 encryptionKeySize:(unint64_t)a4;
- (void)enumerateDecryptingKeysAndSaltsUsingBlock:(id)a3;
- (void)invalidateKeyMaterialByKeyIndexes:(id)a3;
- (void)purgeOldKeyMaterial;
- (void)receiveMembershipChangedInformation:(unsigned __int8)a3;
@end

@implementation IDSGroupEncryptionKeyManager

- (IDSGroupEncryptionKeyManager)initWithEncryptionContext:(id)a3 encryptionKeySize:(unint64_t)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)IDSGroupEncryptionKeyManager;
  v9 = [(IDSGroupEncryptionKeyManager *)&v38 init];
  if (v9)
  {
    v11 = objc_msgSend_RealTimeEncryptionController(IDSFoundationLog, v7, v8, v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v40 = a4;
      _os_log_impl(&dword_19D9BE000, v11, OS_LOG_TYPE_DEFAULT, "IDSGroupEncryptionKeyManager created with encryptionKeySize %ld", buf, 0xCu);
    }

    v9->_lock._os_unfair_lock_opaque = 0;
    uint64_t v15 = objc_msgSend_copy(v6, v12, v13, v14);
    encryptionContext = v9->_encryptionContext;
    v9->_encryptionContext = (NSMutableData *)v15;

    v9->_encryptionKeySize = a4;
    uint64_t v20 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v17, v18, v19);
    previousEncryptingKeys = v9->_previousEncryptingKeys;
    v9->_previousEncryptingKeys = (NSMutableArray *)v20;

    uint64_t v25 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v22, v23, v24);
    previousEncryptingKeyIndexes = v9->_previousEncryptingKeyIndexes;
    v9->_previousEncryptingKeyIndexes = (NSMutableArray *)v25;

    uint64_t v30 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v27, v28, v29);
    previousEncryptingKeySalts = v9->_previousEncryptingKeySalts;
    v9->_previousEncryptingKeySalts = (NSMutableArray *)v30;

    uint64_t v35 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v32, v33, v34);
    currentDecryptingKeysAndSalts = v9->_currentDecryptingKeysAndSalts;
    v9->_currentDecryptingKeysAndSalts = (NSMutableDictionary *)v35;
  }
  return v9;
}

- (BOOL)recvKeyMaterial:(id)a3
{
  uint64_t v185 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_keySalt(v4, v5, v6, v7);
  id v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_bytes(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_keySalt(v4, v12, v13, v14);
  objc_msgSend_length(v15, v16, v17, v18);
  objc_msgSend_bytes(self->_encryptionContext, v19, v20, v21);
  objc_msgSend_length(self->_encryptionContext, v22, v23, v24);
  int Hkdf = CCKDFParametersCreateHkdf();

  double v29 = objc_msgSend_RealTimeEncryptionController(IDSFoundationLog, v26, v27, v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_keySalt(v4, v30, v31, v32);
    id v33 = objc_claimAutoreleasedReturnValue();
    uint64_t v37 = objc_msgSend_bytes(v33, v34, v35, v36);
    uint64_t v41 = objc_msgSend_keySalt(v4, v38, v39, v40);
    uint64_t v45 = objc_msgSend_length(v41, v42, v43, v44);
    uint64_t v49 = objc_msgSend_bytes(self->_encryptionContext, v46, v47, v48);
    uint64_t v53 = objc_msgSend_length(self->_encryptionContext, v50, v51, v52);
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)v174 = Hkdf;
    *(_WORD *)&v174[4] = 2048;
    *(void *)&v174[6] = v37;
    __int16 v175 = 2048;
    uint64_t v176 = v45;
    __int16 v177 = 2048;
    uint64_t v178 = v49;
    __int16 v179 = 2048;
    uint64_t v180 = v53;
    __int16 v181 = 2112;
    unint64_t v182 = (unint64_t)v4;
    _os_log_impl(&dword_19D9BE000, v29, OS_LOG_TYPE_DEFAULT, "IDSGroupEncryptionKeyManager CCKDFParametersCreateHkdf returned %d with salt %p saltLength %lu context %p contextLength %lu key %@", buf, 0x3Au);
  }
  if (Hkdf != -4302)
  {
    if (Hkdf)
    {
      if (Hkdf == -4300)
      {
        v57 = objc_msgSend_RealTimeEncryptionController(IDSFoundationLog, v54, v55, v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v58 = "IDSGroupEncryptionKeyManager CCKDFParametersCreateHkdf failed: bad params";
LABEL_10:
          v59 = v57;
          uint32_t v60 = 2;
LABEL_20:
          _os_log_impl(&dword_19D9BE000, v59, OS_LOG_TYPE_DEFAULT, v58, buf, v60);
          goto LABEL_21;
        }
      }
      else
      {
        v57 = objc_msgSend_RealTimeEncryptionController(IDSFoundationLog, v54, v55, v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)v174 = Hkdf;
          v58 = "IDSGroupEncryptionKeyManager CCKDFParametersCreateHkdf failed: %ld";
          v59 = v57;
          uint32_t v60 = 12;
          goto LABEL_20;
        }
      }
      goto LABEL_21;
    }
    v61 = objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v54, self->_encryptionKeySize, v56);
    objc_msgSend_keyMaterial(v4, v62, v63, v64);
    id v65 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_bytes(v65, v66, v67, v68);
    v72 = objc_msgSend_keyMaterial(v4, v69, v70, v71);
    objc_msgSend_length(v72, v73, v74, v75);
    v57 = v61;
    objc_msgSend_mutableBytes(v57, v76, v77, v78);
    int v79 = CCDeriveKey();

    v83 = objc_msgSend_RealTimeEncryptionController(IDSFoundationLog, v80, v81, v82);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_keyMaterial(v4, v84, v85, v86);
      id v171 = objc_claimAutoreleasedReturnValue();
      uint64_t v170 = objc_msgSend_bytes(v171, v87, v88, v89);
      v93 = objc_msgSend_keyMaterial(v4, v90, v91, v92);
      uint64_t v97 = objc_msgSend_length(v93, v94, v95, v96);
      v98 = v57;
      uint64_t v102 = objc_msgSend_mutableBytes(v98, v99, v100, v101);
      unint64_t encryptionKeySize = self->_encryptionKeySize;
      v107 = objc_msgSend_keyIndex(v4, v104, v105, v106);
      *(_DWORD *)buf = 67110658;
      *(_DWORD *)v174 = v79;
      *(_WORD *)&v174[4] = 2048;
      *(void *)&v174[6] = 0;
      __int16 v175 = 2048;
      uint64_t v176 = v170;
      __int16 v177 = 2048;
      uint64_t v178 = v97;
      __int16 v179 = 2048;
      uint64_t v180 = v102;
      __int16 v181 = 2048;
      unint64_t v182 = encryptionKeySize;
      __int16 v183 = 2112;
      v184 = v107;
      _os_log_impl(&dword_19D9BE000, v83, OS_LOG_TYPE_DEFAULT, "IDSGroupEncryptionKeyManager CCDeriveKey returned %d with params %p key %p keyLength %lu derivedKey %p derivedKeyLength %ld keyID %@", buf, 0x44u);
    }
    CCKDFParametersDestroy();
    if (v79 <= -4301)
    {
      if (v79 == -4305)
      {
        v111 = objc_msgSend_RealTimeEncryptionController(IDSFoundationLog, v108, v109, v110);
        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v112 = "IDSGroupEncryptionKeyManager CCDeriveKey failed: unimplemented";
          goto LABEL_28;
        }
        goto LABEL_41;
      }
      if (v79 == -4302)
      {
        v111 = objc_msgSend_RealTimeEncryptionController(IDSFoundationLog, v108, v109, v110);
        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v112 = "IDSGroupEncryptionKeyManager CCDeriveKey failed: memory failure";
LABEL_28:
          v114 = v111;
          uint32_t v115 = 2;
LABEL_39:
          _os_log_impl(&dword_19D9BE000, v114, OS_LOG_TYPE_DEFAULT, v112, buf, v115);
          goto LABEL_41;
        }
        goto LABEL_41;
      }
      goto LABEL_37;
    }
    if (v79)
    {
      if (v79 == -4300)
      {
        v111 = objc_msgSend_RealTimeEncryptionController(IDSFoundationLog, v108, v109, v110);
        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v112 = "IDSGroupEncryptionKeyManager CCDeriveKey failed: bad params";
          goto LABEL_28;
        }
LABEL_41:
        BOOL v113 = 0;
LABEL_42:

        goto LABEL_43;
      }
LABEL_37:
      v111 = objc_msgSend_RealTimeEncryptionController(IDSFoundationLog, v108, v109, v110);
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v174 = v79;
        v112 = "IDSGroupEncryptionKeyManager CCDeriveKey failed: %ld";
        v114 = v111;
        uint32_t v115 = 12;
        goto LABEL_39;
      }
      goto LABEL_41;
    }
    if (objc_msgSend_isGeneratedLocally(v4, v108, v109, v110))
    {
      p_currentEncryptingKey = (uint64_t *)&self->_currentEncryptingKey;
      if (!self->_currentEncryptingKey)
      {
LABEL_34:
        objc_storeStrong((id *)&self->_currentEncryptingKey, v57);
        v127 = objc_msgSend_keyIndex(v4, v124, v125, v126);
        v131 = (NSUUID *)objc_msgSend_copy(v127, v128, v129, v130);
        currentEncryptingKeyIndex = self->_currentEncryptingKeyIndex;
        self->_currentEncryptingKeyIndex = v131;

        v136 = objc_msgSend_keySalt(v4, v133, v134, v135);
        v140 = (NSData *)objc_msgSend_copy(v136, v137, v138, v139);
        currentEncryptingKeySalt = self->_currentEncryptingKeySalt;
        self->_currentEncryptingKeySalt = v140;

        self->_unsigned int currentEncryptingKeyGeneration = objc_msgSend_generationCounter(v4, v142, v143, v144);
        v111 = objc_msgSend_RealTimeEncryptionController(IDSFoundationLog, v145, v146, v147);
        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
        {
          v148 = self->_currentEncryptingKeyIndex;
          unsigned int currentEncryptingKeyGeneration = self->_currentEncryptingKeyGeneration;
          *(_DWORD *)buf = 138412546;
          *(void *)v174 = v148;
          *(_WORD *)&v174[8] = 1024;
          *(_DWORD *)&v174[10] = currentEncryptingKeyGeneration;
          _os_log_impl(&dword_19D9BE000, v111, OS_LOG_TYPE_DEFAULT, "IDSGroupEncryptionKeyManager New EncryptionKey:%@, generation counter: %u", buf, 0x12u);
        }
        BOOL v113 = 1;
        goto LABEL_42;
      }
      if (objc_msgSend_generationCounter(v4, v116, v117, v118) > self->_currentEncryptingKeyGeneration)
      {
        if (*p_currentEncryptingKey)
        {
          objc_msgSend_insertObject_atIndex_(self->_previousEncryptingKeys, v116, *p_currentEncryptingKey, v118, 0);
          objc_msgSend_insertObject_atIndex_(self->_previousEncryptingKeyIndexes, v120, (uint64_t)self->_currentEncryptingKeyIndex, v121, 0);
          objc_msgSend_insertObject_atIndex_(self->_previousEncryptingKeySalts, v122, (uint64_t)self->_currentEncryptingKeySalt, v123, 0);
        }
        goto LABEL_34;
      }
    }
    currentDecryptingKeysAndSalts = self->_currentDecryptingKeysAndSalts;
    v151 = (void *)MEMORY[0x1E4F6C3A8];
    v111 = objc_msgSend_keySalt(v4, v116, v117, v118);
    v155 = objc_msgSend_copy(v111, v152, v153, v154);
    v158 = objc_msgSend_pairWithFirst_second_(v151, v156, (uint64_t)v57, v157, v155);
    v162 = objc_msgSend_keyIndex(v4, v159, v160, v161);
    v166 = objc_msgSend_copy(v162, v163, v164, v165);
    objc_msgSend_setObject_forKey_(currentDecryptingKeysAndSalts, v167, (uint64_t)v158, v168, v166);

    goto LABEL_41;
  }
  v57 = objc_msgSend_RealTimeEncryptionController(IDSFoundationLog, v54, v55, v56);
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v58 = "IDSGroupEncryptionKeyManager CCKDFParametersCreateHkdf failed: memory failure";
    goto LABEL_10;
  }
LABEL_21:
  BOOL v113 = 0;
LABEL_43:

  os_unfair_lock_unlock(lock);
  return v113;
}

- (void)receiveMembershipChangedInformation:(unsigned __int8)a3
{
  int v3 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v3 != 3)
  {
    currentEncryptingKey = self->_currentEncryptingKey;
    if (currentEncryptingKey)
    {
      objc_msgSend_insertObject_atIndex_(self->_previousEncryptingKeys, v6, (uint64_t)currentEncryptingKey, v7, 0);
      v9 = self->_currentEncryptingKey;
      self->_currentEncryptingKey = 0;

      objc_msgSend_insertObject_atIndex_(self->_previousEncryptingKeyIndexes, v10, (uint64_t)self->_currentEncryptingKeyIndex, v11, 0);
      currentEncryptingKeyIndex = self->_currentEncryptingKeyIndex;
      self->_currentEncryptingKeyIndex = 0;

      objc_msgSend_insertObject_atIndex_(self->_previousEncryptingKeySalts, v13, (uint64_t)self->_currentEncryptingKeySalt, v14, 0);
      currentEncryptingKeySalt = self->_currentEncryptingKeySalt;
      self->_currentEncryptingKeySalt = 0;

      self->_unsigned int currentEncryptingKeyGeneration = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)purgeOldKeyMaterial
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_removeAllObjects(self->_previousEncryptingKeys, v4, v5, v6);
  objc_msgSend_removeAllObjects(self->_previousEncryptingKeyIndexes, v7, v8, v9);
  os_unfair_lock_unlock(p_lock);
}

- (void)invalidateKeyMaterialByKeyIndexes:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v4;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v30, v7, v34, 16);
  if (v9)
  {
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        if (objc_msgSend_isEqual_(self->_currentEncryptingKeyIndex, v8, v13, v10))
        {
          currentEncryptingKeyIndex = self->_currentEncryptingKeyIndex;
          self->_currentEncryptingKeyIndex = 0;

          currentEncryptingKey = self->_currentEncryptingKey;
          self->_currentEncryptingKey = 0;

          currentEncryptingKeySalt = self->_currentEncryptingKeySalt;
          self->_currentEncryptingKeySalt = 0;

          self->_unsigned int currentEncryptingKeyGeneration = 0;
        }
        else
        {
          uint64_t v26 = 0;
          uint64_t v27 = &v26;
          uint64_t v28 = 0x2020000000;
          uint64_t v29 = -1;
          previousEncryptingKeyIndexes = self->_previousEncryptingKeyIndexes;
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = sub_19DAC2074;
          v25[3] = &unk_1E5974A58;
          v25[4] = v13;
          v25[5] = &v26;
          objc_msgSend_enumerateObjectsUsingBlock_(previousEncryptingKeyIndexes, v14, (uint64_t)v25, v15);
          uint64_t v22 = v27[3];
          if (v22 == -1)
          {
            objc_msgSend_removeObjectForKey_(self->_currentDecryptingKeysAndSalts, v20, v13, v21);
          }
          else
          {
            objc_msgSend_removeObjectAtIndex_(self->_previousEncryptingKeyIndexes, v20, v22, v21);
            objc_msgSend_removeObjectAtIndex_(self->_previousEncryptingKeys, v23, v27[3], v24);
          }
          _Block_object_dispose(&v26, 8);
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v30, v10, v34, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)useCurrentEncryptionkeyWithHandler:(id)a3
{
  id v4 = (void (**)(id, id, NSData *, NSUUID *))a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  currentEncryptingKey = self->_currentEncryptingKey;
  if (currentEncryptingKey)
  {
    double v10 = currentEncryptingKey;
    uint64_t v11 = self->_currentEncryptingKeySalt;
    v12 = self->_currentEncryptingKeyIndex;
  }
  else
  {
    objc_msgSend_firstObject(self->_previousEncryptingKeys, v6, v7, v8);
    double v10 = (NSData *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(self->_previousEncryptingKeySalts, v13, v14, v15);
    uint64_t v11 = (NSData *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(self->_previousEncryptingKeyIndexes, v16, v17, v18);
    v12 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  }
  double v19 = v12;
  if (v10) {
    BOOL v20 = v12 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  BOOL v21 = v20 || v11 == 0;
  BOOL v22 = !v21;
  if (!v21) {
    v4[2](v4, v10, v11, v12);
  }

  os_unfair_lock_unlock(p_lock);
  return v22;
}

- (BOOL)useDecryptingKeyForKeyIndex:(id)a3 handler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void *, id))a4;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(self->_currentDecryptingKeysAndSalts, v9, (uint64_t)v6, v10);
  double v15 = v11;
  if (v11)
  {
    v16 = objc_msgSend_first(v11, v12, v13, v14);
    BOOL v20 = objc_msgSend_second(v15, v17, v18, v19);
    v7[2](v7, v16, v20, v6);
  }
  os_unfair_lock_unlock(p_lock);

  return v15 != 0;
}

- (void)enumerateDecryptingKeysAndSaltsUsingBlock:(id)a3
{
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  currentDecryptingKeysAndSalts = self->_currentDecryptingKeysAndSalts;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_19DAC2370;
  v10[3] = &unk_1E5974A80;
  id v7 = v4;
  id v11 = v7;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(currentDecryptingKeysAndSalts, v8, (uint64_t)v10, v9);

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDecryptingKeysAndSalts, 0);
  objc_storeStrong((id *)&self->_currentEncryptingKeySalt, 0);
  objc_storeStrong((id *)&self->_currentEncryptingKeyIndex, 0);
  objc_storeStrong((id *)&self->_currentEncryptingKey, 0);
  objc_storeStrong((id *)&self->_previousEncryptingKeySalts, 0);
  objc_storeStrong((id *)&self->_previousEncryptingKeyIndexes, 0);
  objc_storeStrong((id *)&self->_previousEncryptingKeys, 0);
  objc_storeStrong((id *)&self->_encryptionContext, 0);
}

@end