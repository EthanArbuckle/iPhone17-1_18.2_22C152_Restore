@interface CSStingrayRecord
+ (id)parseFromAccountInfoPlist:(id)a3 error:(id *)a4;
- (BOOL)containsiCloudIdentity;
- (BOOL)hasBackupKeybagDigest;
- (BOOL)hasBackupKeybagSHA256;
- (BOOL)hasClientMetadata;
- (BOOL)hasContainsiCloudIdentity;
- (BOOL)hasMetadataHash;
- (BOOL)hasTimestamp;
- (BOOL)hasTriggerUpdate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)triggerUpdate;
- (CSStingrayRecordClientMetadata)clientMetadata;
- (NSData)backupKeybagDigest;
- (NSData)backupKeybagSHA256;
- (NSData)metadataHash;
- (NSString)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)expandMetadataHash:(id *)a3;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBackupKeybagDigest:(id)a3;
- (void)setBackupKeybagSHA256:(id)a3;
- (void)setClientMetadata:(id)a3;
- (void)setContainsiCloudIdentity:(BOOL)a3;
- (void)setHasContainsiCloudIdentity:(BOOL)a3;
- (void)setHasTriggerUpdate:(BOOL)a3;
- (void)setMetadataHash:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setTriggerUpdate:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSStingrayRecord

+ (id)parseFromAccountInfoPlist:(id)a3 error:(id *)a4
{
  uint64_t v190 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v7 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"label");
  char isEqualToString = objc_msgSend_isEqualToString_(@"com.apple.protectedcloudstorage.record", v8, (uint64_t)v7);
  if ((objc_msgSend_isEqualToString_(@"com.apple.protectedcloudstorage.guitarfish.record", v10, (uint64_t)v7) & 1) != 0
    || (isEqualToString & 1) != 0)
  {
    v185 = v7;
    v13 = objc_msgSend_objectForKeyedSubscript_(v5, v11, @"metadata");
    v15 = objc_msgSend_objectForKeyedSubscript_(v13, v14, @"ClientMetadata");
    v16 = objc_alloc_init(CSStingrayRecord);
    v17 = objc_alloc_init(CSStingrayRecordClientMetadata);
    objc_msgSend_setClientMetadata_(v16, v18, (uint64_t)v17);

    uint64_t v19 = sub_21812B0C0(v5, @"SecureBackupTriggerUpdate");
    objc_msgSend_setTriggerUpdate_(v16, v20, v19);
    v22 = objc_msgSend_objectForKeyedSubscript_(v5, v21, @"recordStatus");
    uint64_t v24 = objc_msgSend_isEqualToString_(v22, v23, @"valid");
    objc_msgSend_setContainsiCloudIdentity_(v16, v25, v24);

    v27 = objc_msgSend_objectForKeyedSubscript_(v13, v26, @"BackupKeybagSHA256");
    objc_msgSend_setBackupKeybagSHA256_(v16, v28, (uint64_t)v27);

    v30 = objc_msgSend_objectForKeyedSubscript_(v13, v29, @"BackupKeybagDigest");
    objc_msgSend_setBackupKeybagDigest_(v16, v31, (uint64_t)v30);

    objc_msgSend_setMetadataHash_(v16, v32, 0);
    if (v13)
    {
      id v34 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v36 = objc_msgSend_objectForKeyedSubscript_(v5, v35, @"encodedMetadata");
      objc_msgSend_setObject_forKeyedSubscript_(v34, v37, (uint64_t)v36, @"encodedMetadata");

      v39 = objc_msgSend_objectForKeyedSubscript_(v13, v38, @"BackupKeybagSHA256");
      objc_msgSend_setObject_forKeyedSubscript_(v34, v40, (uint64_t)v39, @"BackupKeybagSHA256");

      v42 = objc_msgSend_objectForKeyedSubscript_(v13, v41, @"BackupKeybagDigest");
      objc_msgSend_setObject_forKeyedSubscript_(v34, v43, (uint64_t)v42, @"BackupKeybagDigest");

      v45 = objc_msgSend_objectForKeyedSubscript_(v13, v44, @"SecureBackupBackOffDate");
      objc_msgSend_setObject_forKeyedSubscript_(v34, v46, (uint64_t)v45, @"SecureBackupBackOffDate");

      v48 = objc_msgSend_objectForKeyedSubscript_(v13, v47, @"com.apple.securebackup.timestamp");
      objc_msgSend_setObject_forKeyedSubscript_(v34, v49, (uint64_t)v48, @"com.apple.securebackup.timestamp");

      uint64_t v51 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x263F08910], v50, (uint64_t)v34, 1, a4);
      if (!v51)
      {
        v183 = CloudServicesLog();
        if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR)) {
          sub_21813ED48(v183);
        }

        v12 = 0;
        goto LABEL_27;
      }
      v53 = (void *)v51;
      objc_msgSend_setMetadataHash_(v16, v52, v51);
    }
    v54 = objc_msgSend_objectForKeyedSubscript_(v13, v33, @"com.apple.securebackup.timestamp");
    objc_msgSend_setTimestamp_(v16, v55, (uint64_t)v54);

    v57 = objc_msgSend_objectForKeyedSubscript_(v15, v56, @"SecureBackupiCloudIdentityPublicData");
    v60 = objc_msgSend_clientMetadata(v16, v58, v59);
    objc_msgSend_setIcloudIdentityPublicData_(v60, v61, (uint64_t)v57);

    uint64_t v62 = sub_21812B174(v15, @"IdMSPasswordGeneration");
    v65 = objc_msgSend_clientMetadata(v16, v63, v64);
    objc_msgSend_setPasswordGeneration_(v65, v66, v62);

    uint64_t v67 = sub_21812B174(v15, @"IdMSPasswordVerifierIterations");
    v70 = objc_msgSend_clientMetadata(v16, v68, v69);
    objc_msgSend_setPasswordIterations_(v70, v71, v67);

    v73 = objc_msgSend_objectForKeyedSubscript_(v15, v72, @"IdMSPasswordVerifierProto");
    v76 = objc_msgSend_clientMetadata(v16, v74, v75);
    objc_msgSend_setPasswordProtocol_(v76, v77, (uint64_t)v73);

    v78 = objc_alloc_init(CSStingrayRecordClientMetadataICloudDataProtection);
    v81 = objc_msgSend_clientMetadata(v16, v79, v80);
    objc_msgSend_setIcdp_(v81, v82, (uint64_t)v78);

    v84 = objc_msgSend_objectForKeyedSubscript_(v15, v83, @"SecureBackupiCloudDataProtection");
    uint64_t v85 = sub_21812B0C0(v84, @"kPCSMetadataiCDP");
    v88 = objc_msgSend_clientMetadata(v16, v86, v87);
    v91 = objc_msgSend_icdp(v88, v89, v90);
    objc_msgSend_setIcdp_(v91, v92, v85);

    uint64_t v93 = sub_21812B0C0(v84, @"kPCSMetadataiCDPArmed");
    v96 = objc_msgSend_clientMetadata(v16, v94, v95);
    v99 = objc_msgSend_icdp(v96, v97, v98);
    objc_msgSend_setIcdpArmed_(v99, v100, v93);

    uint64_t v101 = sub_21812B0C0(v84, @"kPCSMetadataiCDPWalrus");
    v104 = objc_msgSend_clientMetadata(v16, v102, v103);
    v107 = objc_msgSend_icdp(v104, v105, v106);
    objc_msgSend_setIcdpWalrus_(v107, v108, v101);

    uint64_t v109 = sub_21812B0C0(v84, @"kPCSMetadataiCDPDrop");
    v112 = objc_msgSend_clientMetadata(v16, v110, v111);
    v115 = objc_msgSend_icdp(v112, v113, v114);
    objc_msgSend_setIcdpDrop_(v115, v116, v109);

    v118 = objc_msgSend_objectForKeyedSubscript_(v84, v117, @"kPCSMetadataEscrowedKeys");
    v121 = objc_msgSend_clientMetadata(v16, v119, v120);
    v124 = objc_msgSend_icdp(v121, v122, v123);
    objc_msgSend_setEscrowedKeys_(v124, v125, (uint64_t)v118);

    uint64_t v126 = sub_21812B0C0(v84, @"kPCSMetadataiCDPGuitarfish");
    v129 = objc_msgSend_clientMetadata(v16, v127, v128);
    v132 = objc_msgSend_icdp(v129, v130, v131);
    objc_msgSend_setIcdpGF_(v132, v133, v126);

    v135 = objc_msgSend_objectForKeyedSubscript_(v84, v134, @"SecureBackupWrappedKeys");
    v138 = objc_msgSend_clientMetadata(v16, v136, v137);
    v141 = objc_msgSend_icdp(v138, v139, v140);
    objc_msgSend_setWrappedKeys_(v141, v142, (uint64_t)v135);

    v144 = objc_msgSend_objectForKeyedSubscript_(v84, v143, @"DerivedDBRSeedAESPID");
    v147 = objc_msgSend_clientMetadata(v16, v145, v146);
    v150 = objc_msgSend_icdp(v147, v148, v149);
    objc_msgSend_setDerivedTokenID_(v150, v151, (uint64_t)v144);

    v154 = objc_msgSend_objectForKeyedSubscript_(v15, v152, @"SecureBackupKeyRegistry");
    if (v154)
    {
      id v187 = 0;
      v155 = objc_msgSend_parseFromKeyRegistryPlist_error_(CSStingrayRecordClientMetadataKeyRegistry, v153, (uint64_t)v154, &v187);
      id v156 = v187;
      v159 = objc_msgSend_clientMetadata(v16, v157, v158);
      objc_msgSend_setKeyRegistry_(v159, v160, (uint64_t)v155);

      v163 = objc_msgSend_clientMetadata(v16, v161, v162);
      v166 = objc_msgSend_keyRegistry(v163, v164, v165);

      if (!v166 || v156)
      {
        v167 = CloudServicesLog();
        if (os_log_type_enabled(v167, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v189 = v156;
          _os_log_impl(&dword_218118000, v167, OS_LOG_TYPE_DEFAULT, "failed to parse key registry: %@", buf, 0xCu);
        }
      }
    }
    v169 = objc_msgSend_objectForKeyedSubscript_(v15, v153, @"SecureBackupStableMetadata");
    if (v169)
    {
      id v186 = 0;
      v170 = objc_msgSend_parseFromStableMetadataPlist_error_(CSStingrayRecordClientMetadataStableMetadata, v168, (uint64_t)v169, &v186);
      id v171 = v186;
      v174 = objc_msgSend_clientMetadata(v16, v172, v173);
      objc_msgSend_setStableMetadata_(v174, v175, (uint64_t)v170);

      v178 = objc_msgSend_clientMetadata(v16, v176, v177);
      v181 = objc_msgSend_stableMetadata(v178, v179, v180);

      if (!v181 || v171)
      {
        v182 = CloudServicesLog();
        if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v189 = v171;
          _os_log_impl(&dword_218118000, v182, OS_LOG_TYPE_DEFAULT, "failed to parse stable metadata: %@", buf, 0xCu);
        }
      }
    }

    v12 = v16;
LABEL_27:

    v7 = v185;
    goto LABEL_28;
  }
  if (a4)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v11, @"SecureBackupErrorDomain", 24, 0);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_28:

  return v12;
}

- (id)expandMetadataHash:(id *)a3
{
  id v5 = (void *)MEMORY[0x263F08928];
  uint64_t v6 = objc_opt_class();
  v9 = objc_msgSend_metadataHash(self, v7, v8);
  v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v5, v10, v6, v9, a3);

  return v11;
}

- (BOOL)hasClientMetadata
{
  return self->_clientMetadata != 0;
}

- (void)setTriggerUpdate:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_triggerUpdate = a3;
}

- (void)setHasTriggerUpdate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTriggerUpdate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setContainsiCloudIdentity:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_containsiCloudIdentity = a3;
}

- (void)setHasContainsiCloudIdentity:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContainsiCloudIdentity
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasBackupKeybagDigest
{
  return self->_backupKeybagDigest != 0;
}

- (BOOL)hasMetadataHash
{
  return self->_metadataHash != 0;
}

- (BOOL)hasTimestamp
{
  return self->_timestamp != 0;
}

- (BOOL)hasBackupKeybagSHA256
{
  return self->_backupKeybagSHA256 != 0;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CSStingrayRecord;
  v4 = [(CSStingrayRecord *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  clientMetadata = self->_clientMetadata;
  if (clientMetadata)
  {
    uint64_t v8 = objc_msgSend_dictionaryRepresentation(clientMetadata, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"clientMetadata");
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v11 = objc_msgSend_numberWithBool_(NSNumber, v4, self->_triggerUpdate);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"triggerUpdate");

    char has = (char)self->_has;
  }
  if (has)
  {
    v13 = objc_msgSend_numberWithBool_(NSNumber, v4, self->_containsiCloudIdentity);
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, @"containsiCloudIdentity");
  }
  backupKeybagDigest = self->_backupKeybagDigest;
  if (backupKeybagDigest) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)backupKeybagDigest, @"backupKeybagDigest");
  }
  metadataHash = self->_metadataHash;
  if (metadataHash) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)metadataHash, @"metadataHash");
  }
  timestamp = self->_timestamp;
  if (timestamp) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)timestamp, @"timestamp");
  }
  backupKeybagSHA256 = self->_backupKeybagSHA256;
  if (backupKeybagSHA256) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)backupKeybagSHA256, @"backupKeybagSHA256");
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CSStingrayRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_clientMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_backupKeybagDigest)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_metadataHash)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_timestamp)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_backupKeybagSHA256)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  clientMetadata = self->_clientMetadata;
  v12 = v4;
  if (clientMetadata)
  {
    objc_msgSend_setClientMetadata_(v4, v5, (uint64_t)clientMetadata);
    id v4 = v12;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[49] = self->_triggerUpdate;
    v4[52] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[48] = self->_containsiCloudIdentity;
    v4[52] |= 1u;
  }
  backupKeybagDigest = self->_backupKeybagDigest;
  if (backupKeybagDigest)
  {
    objc_msgSend_setBackupKeybagDigest_(v12, v5, (uint64_t)backupKeybagDigest);
    id v4 = v12;
  }
  metadataHash = self->_metadataHash;
  if (metadataHash)
  {
    objc_msgSend_setMetadataHash_(v12, v5, (uint64_t)metadataHash);
    id v4 = v12;
  }
  timestamp = self->_timestamp;
  if (timestamp)
  {
    objc_msgSend_setTimestamp_(v12, v5, (uint64_t)timestamp);
    id v4 = v12;
  }
  backupKeybagSHA256 = self->_backupKeybagSHA256;
  if (backupKeybagSHA256)
  {
    objc_msgSend_setBackupKeybagSHA256_(v12, v5, (uint64_t)backupKeybagSHA256);
    id v4 = v12;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_clientMetadata, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v12;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v10 + 49) = self->_triggerUpdate;
    *(unsigned char *)(v10 + 52) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(unsigned char *)(v10 + 48) = self->_containsiCloudIdentity;
    *(unsigned char *)(v10 + 52) |= 1u;
  }
  uint64_t v16 = objc_msgSend_copyWithZone_(self->_backupKeybagDigest, v14, (uint64_t)a3);
  v17 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v16;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_metadataHash, v18, (uint64_t)a3);
  v20 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v19;

  uint64_t v22 = objc_msgSend_copyWithZone_(self->_timestamp, v21, (uint64_t)a3);
  v23 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v22;

  uint64_t v25 = objc_msgSend_copyWithZone_(self->_backupKeybagSHA256, v24, (uint64_t)a3);
  v26 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v25;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_28;
  }
  clientMetadata = self->_clientMetadata;
  uint64_t v9 = v4[3];
  if ((unint64_t)clientMetadata | v9)
  {
    if (!objc_msgSend_isEqual_(clientMetadata, v7, v9)) {
      goto LABEL_28;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0) {
      goto LABEL_28;
    }
    if (self->_triggerUpdate)
    {
      if (!*((unsigned char *)v4 + 49)) {
        goto LABEL_28;
      }
    }
    else if (*((unsigned char *)v4 + 49))
    {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_28;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 52))
    {
      if (self->_containsiCloudIdentity)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_28;
        }
        goto LABEL_20;
      }
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_20;
      }
    }
LABEL_28:
    char isEqual = 0;
    goto LABEL_29;
  }
  if (*((unsigned char *)v4 + 52)) {
    goto LABEL_28;
  }
LABEL_20:
  backupKeybagDigest = self->_backupKeybagDigest;
  uint64_t v11 = v4[1];
  if ((unint64_t)backupKeybagDigest | v11 && !objc_msgSend_isEqual_(backupKeybagDigest, v7, v11)) {
    goto LABEL_28;
  }
  metadataHash = self->_metadataHash;
  uint64_t v13 = v4[4];
  if ((unint64_t)metadataHash | v13)
  {
    if (!objc_msgSend_isEqual_(metadataHash, v7, v13)) {
      goto LABEL_28;
    }
  }
  timestamp = self->_timestamp;
  uint64_t v15 = v4[5];
  if ((unint64_t)timestamp | v15)
  {
    if (!objc_msgSend_isEqual_(timestamp, v7, v15)) {
      goto LABEL_28;
    }
  }
  backupKeybagSHA256 = self->_backupKeybagSHA256;
  uint64_t v17 = v4[2];
  if ((unint64_t)backupKeybagSHA256 | v17) {
    char isEqual = objc_msgSend_isEqual_(backupKeybagSHA256, v7, v17);
  }
  else {
    char isEqual = 1;
  }
LABEL_29:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_clientMetadata, a2, v2);
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = 2654435761 * self->_triggerUpdate;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0;
    goto LABEL_6;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = 2654435761 * self->_containsiCloudIdentity;
LABEL_6:
  uint64_t v9 = v7 ^ v4 ^ v8 ^ objc_msgSend_hash(self->_backupKeybagDigest, v5, v6);
  uint64_t v12 = objc_msgSend_hash(self->_metadataHash, v10, v11);
  uint64_t v15 = v12 ^ objc_msgSend_hash(self->_timestamp, v13, v14);
  return v9 ^ v15 ^ objc_msgSend_hash(self->_backupKeybagSHA256, v16, v17);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  clientMetadata = self->_clientMetadata;
  uint64_t v6 = *((void *)v4 + 3);
  id v12 = v4;
  if (clientMetadata)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(clientMetadata, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setClientMetadata_(self, (const char *)v4, v6);
  }
  id v4 = v12;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 52);
  if ((v7 & 2) != 0)
  {
    self->_triggerUpdate = *((unsigned char *)v4 + 49);
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 52);
  }
  if (v7)
  {
    self->_containsiCloudIdentity = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v8 = *((void *)v4 + 1);
  if (v8)
  {
    objc_msgSend_setBackupKeybagDigest_(self, (const char *)v4, v8);
    id v4 = v12;
  }
  uint64_t v9 = *((void *)v4 + 4);
  if (v9)
  {
    objc_msgSend_setMetadataHash_(self, (const char *)v4, v9);
    id v4 = v12;
  }
  uint64_t v10 = *((void *)v4 + 5);
  if (v10)
  {
    objc_msgSend_setTimestamp_(self, (const char *)v4, v10);
    id v4 = v12;
  }
  uint64_t v11 = *((void *)v4 + 2);
  if (v11) {
    objc_msgSend_setBackupKeybagSHA256_(self, (const char *)v4, v11);
  }

  MEMORY[0x270F9A758]();
}

- (CSStingrayRecordClientMetadata)clientMetadata
{
  return self->_clientMetadata;
}

- (void)setClientMetadata:(id)a3
{
}

- (BOOL)triggerUpdate
{
  return self->_triggerUpdate;
}

- (BOOL)containsiCloudIdentity
{
  return self->_containsiCloudIdentity;
}

- (NSData)backupKeybagDigest
{
  return self->_backupKeybagDigest;
}

- (void)setBackupKeybagDigest:(id)a3
{
}

- (NSData)metadataHash
{
  return self->_metadataHash;
}

- (void)setMetadataHash:(id)a3
{
}

- (NSString)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSData)backupKeybagSHA256
{
  return self->_backupKeybagSHA256;
}

- (void)setBackupKeybagSHA256:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_metadataHash, 0);
  objc_storeStrong((id *)&self->_clientMetadata, 0);
  objc_storeStrong((id *)&self->_backupKeybagSHA256, 0);

  objc_storeStrong((id *)&self->_backupKeybagDigest, 0);
}

@end