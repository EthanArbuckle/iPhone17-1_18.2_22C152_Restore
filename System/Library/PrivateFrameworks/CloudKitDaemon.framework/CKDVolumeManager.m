@interface CKDVolumeManager
+ (id)deviceIDForVolumeUUID:(id)a3;
+ (id)volumeForDeviceID:(id)a3;
+ (id)volumeForVolumeUUID:(id)a3;
+ (id)volumeUUIDForDeviceID:(id)a3;
+ (void)_rebuildVolumes;
+ (void)initialize;
@end

@implementation CKDVolumeManager

+ (void)initialize
{
  if (!qword_1EBBCFC40)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.cloudd.volumeManager", v4);
    v3 = (void *)qword_1EBBCFC40;
    qword_1EBBCFC40 = (uint64_t)v2;
  }
}

+ (void)_rebuildVolumes
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1EBBCFC40);
  v4 = objc_msgSend_mountedVolumes(CKDVolume, v2, v3);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = (void *)qword_1EBBCFC48;
  qword_1EBBCFC48 = (uint64_t)v5;

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8 = (void *)qword_1EBBCFC50;
  qword_1EBBCFC50 = (uint64_t)v7;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v4;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v26, v30, 16);
  if (v11)
  {
    uint64_t v14 = v11;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v9);
        }
        v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v18 = (void *)qword_1EBBCFC48;
        v19 = objc_msgSend_volumeUUID(v17, v12, v13, (void)v26);
        objc_msgSend_setObject_forKey_(v18, v20, (uint64_t)v17, v19);

        if ((objc_msgSend_isRootVolume(v17, v21, v22) & 1) == 0)
        {
          v23 = (void *)qword_1EBBCFC50;
          v24 = objc_msgSend_deviceID(v17, v12, v13);
          objc_msgSend_setObject_forKey_(v23, v25, (uint64_t)v17, v24);
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v26, v30, 16);
    }
    while (v14);
  }
}

+ (id)volumeForVolumeUUID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_1C4E23D74;
  v17 = sub_1C4E23D84;
  id v18 = 0;
  id v5 = qword_1EBBCFC40;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E23D8C;
  block[3] = &unk_1E64F2CD0;
  uint64_t v11 = &v13;
  id v12 = a1;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

+ (id)volumeForDeviceID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_1C4E23D74;
  v17 = sub_1C4E23D84;
  id v18 = 0;
  id v5 = qword_1EBBCFC40;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E23F04;
  block[3] = &unk_1E64F2CD0;
  uint64_t v11 = &v13;
  id v12 = a1;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

+ (id)deviceIDForVolumeUUID:(id)a3
{
  uint64_t v3 = objc_msgSend_volumeForVolumeUUID_(a1, a2, (uint64_t)a3);
  id v6 = objc_msgSend_deviceID(v3, v4, v5);

  return v6;
}

+ (id)volumeUUIDForDeviceID:(id)a3
{
  uint64_t v3 = objc_msgSend_volumeForDeviceID_(a1, a2, (uint64_t)a3);
  id v6 = objc_msgSend_volumeUUID(v3, v4, v5);

  return v6;
}

@end