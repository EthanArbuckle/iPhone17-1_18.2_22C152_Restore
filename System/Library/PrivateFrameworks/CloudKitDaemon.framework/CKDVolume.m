@interface CKDVolume
+ (id)mountedVolumes;
+ (id)volumeForPath:(const char *)a3;
- (BOOL)isRootVolume;
- (CKDVolume)initWithVolumeUUID:(id)a3 deviceID:(id)a4 mountToPath:(id)a5;
- (NSNumber)deviceID;
- (NSString)mountPath;
- (NSUUID)volumeUUID;
- (id)CKPropertiesDescription;
- (id)description;
@end

@implementation CKDVolume

+ (id)volumeForPath:(const char *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  memset(v26, 0, 496);
  long long v19 = xmmword_1C50808F8;
  uint64_t v20 = 0;
  if (getattrlist(a3, &v19, &v25, 0x420uLL, 0))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v4 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      v16 = v4;
      v17 = __error();
      v18 = strerror(*v17);
      *(_DWORD *)buf = 136446466;
      v22 = a3;
      __int16 v23 = 2082;
      v24 = v18;
      _os_log_debug_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_DEBUG, "getattrlist() failed for path %{public}s - %{public}s", buf, 0x16u);
    }
    v5 = 0;
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F29128]);
    v8 = objc_msgSend_initWithUUIDBytes_(v6, v7, (uint64_t)v26);
    v10 = objc_msgSend_stringWithUTF8String_(NSString, v9, (uint64_t)&v25 + SDWORD2(v25) + 8);
    v11 = [CKDVolume alloc];
    v13 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v12, DWORD1(v25));
    v5 = objc_msgSend_initWithVolumeUUID_deviceID_mountToPath_(v11, v14, (uint64_t)v8, v13, v10);
  }
  return v5;
}

+ (id)mountedVolumes
{
  v13 = 0;
  int v3 = getmntinfo_r_np(&v13, 2);
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v7 = objc_msgSend_initWithCapacity_(v4, v5, v3);
  if (v3 >= 1)
  {
    unint64_t v8 = 0;
    uint64_t v9 = 2168 * v3;
    do
    {
      v11 = objc_msgSend_volumeForPath_(a1, v6, (uint64_t)v13[v8 / 0x878].f_mntonname);
      if (v11) {
        objc_msgSend_addObject_(v7, v10, (uint64_t)v11);
      }

      v8 += 2168;
    }
    while (v9 != v8);
  }
  if (v13) {
    free(v13);
  }
  return v7;
}

- (CKDVolume)initWithVolumeUUID:(id)a3 deviceID:(id)a4 mountToPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9 || !v10) {
    __assert_rtn("-[CKDVolume initWithVolumeUUID:deviceID:mountToPath:]", "CKDVolume.m", 63, "volumeUUID && deviceID && \"volumeUUID && deviceID\"");
  }
  v12 = v11;
  v16.receiver = self;
  v16.super_class = (Class)CKDVolume;
  v13 = [(CKDVolume *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_volumeUUID, a3);
    objc_storeStrong((id *)&v14->_deviceID, a4);
    objc_storeStrong((id *)&v14->_mountPath, a5);
  }

  return v14;
}

- (BOOL)isRootVolume
{
  return objc_msgSend_isEqualToString_(self->_mountPath, a2, @"/");
}

- (id)CKPropertiesDescription
{
  id v4 = NSString;
  v5 = objc_msgSend_volumeUUID(self, a2, v2);
  unint64_t v8 = objc_msgSend_UUIDString(v5, v6, v7);
  id v11 = objc_msgSend_deviceID(self, v9, v10);
  v14 = objc_msgSend_mountPath(self, v12, v13);
  objc_super v16 = objc_msgSend_stringWithFormat_(v4, v15, @"volumeUUID=%@, deviceID=%@, mountPath=%@", v8, v11, v14);

  return v16;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDVolume *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (NSUUID)volumeUUID
{
  return self->_volumeUUID;
}

- (NSNumber)deviceID
{
  return self->_deviceID;
}

- (NSString)mountPath
{
  return self->_mountPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mountPath, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_volumeUUID, 0);
}

@end