@interface FMMixParameters
- (BOOL)appendVolumeKeyframe:(id)a3;
- (BOOL)removeRedundantVolumeKeyFrames;
- (BOOL)volumeKeyframesAreValid;
- (FMMixParameters)init;
- (NSArray)volumeKeyFrames;
- (float)volumeValueAtTime:(int64_t)a3;
- (id)description;
- (id)lastVolumeKeyFrame;
- (void)insertVolumeKeyframe:(id)a3;
- (void)setVolumeKeyFrames:(id)a3;
@end

@implementation FMMixParameters

- (FMMixParameters)init
{
  v16.receiver = self;
  v16.super_class = (Class)FMMixParameters;
  v2 = [(FMMixParameters *)&v16 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    volumeKeyFrames = v2->_volumeKeyFrames;
    v2->_volumeKeyFrames = (NSMutableArray *)v3;

    v5 = v2->_volumeKeyFrames;
    v6 = [FMKeyFrame alloc];
    LODWORD(v7) = 1.0;
    v11 = objc_msgSend_initWithValue_atTime_(v6, v8, 0, v9, v10, v7);
    objc_msgSend_addObject_(v5, v12, (uint64_t)v11, v13, v14);
  }
  return v2;
}

- (id)description
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  objc_msgSend_volumeKeyFrames(self, a2, v2, v3, v4);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v6)
  {
    uint64_t v11 = v6;
    uint64_t v12 = *(void *)v29;
    uint64_t v13 = @"Keyframes: \n";
    uint64_t v14 = 1;
    do
    {
      uint64_t v15 = 0;
      objc_super v16 = v13;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(obj);
        }
        v17 = NSString;
        v18 = objc_msgSend_description(*(void **)(*((void *)&v28 + 1) + 8 * v15), v7, v8, v9, v10);
        v22 = objc_msgSend_stringWithFormat_(v17, v19, @"\n\t%d %@"), v20, v21, v14 + v15, v18);
        objc_msgSend_stringByAppendingString_(v16, v23, (uint64_t)v22, v24, v25);
        uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v15;
        objc_super v16 = v13;
      }
      while (v11 != v15);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v28, (uint64_t)v32, 16);
      uint64_t v14 = (v14 + v15);
    }
    while (v11);
  }
  else
  {
    uint64_t v13 = @"Keyframes: \n";
  }

  return v13;
}

- (float)volumeValueAtTime:(int64_t)a3
{
  uint64_t v15 = 0;
  objc_super v16 = (float *)&v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_217A58E10;
  v13[4] = sub_217A58E20;
  objc_msgSend_volumeKeyFrames(self, a2, a3, v3, v4);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  volumeKeyFrames = self->_volumeKeyFrames;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_217A58E28;
  v12[3] = &unk_2642B78F0;
  v12[5] = v13;
  v12[6] = a3;
  v12[4] = &v15;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(volumeKeyFrames, v8, 2, (uint64_t)v12, v9);
  float v10 = v16[6];
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (id)lastVolumeKeyFrame
{
  return (id)objc_msgSend_lastObject(self->_volumeKeyFrames, a2, v2, v3, v4);
}

- (BOOL)appendVolumeKeyframe:(id)a3
{
  id v4 = a3;
  uint64_t v13 = objc_msgSend_lastVolumeKeyFrame(self, v5, v6, v7, v8);
  if (v13
    && (uint64_t v14 = objc_msgSend_sampleTime(v4, v9, v10, v11, v12), v14 < objc_msgSend_sampleTime(v13, v15, v16, v17, v18)))
  {
    BOOL v19 = 0;
  }
  else
  {
    uint64_t v20 = objc_msgSend_sampleTime(v4, v9, v10, v11, v12);
    if (v20 == objc_msgSend_sampleTime(v13, v21, v22, v23, v24))
    {
      objc_msgSend_value(v4, v25, v26, v27, v28);
      objc_msgSend_setValue_(v13, v29, v30, v31, v32);
    }
    else
    {
      objc_msgSend_addObject_(self->_volumeKeyFrames, v25, (uint64_t)v4, v27, v28);
    }
    BOOL v19 = 1;
  }

  return v19;
}

- (void)insertVolumeKeyframe:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  volumeKeyFrames = self->_volumeKeyFrames;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_217A5911C;
  v9[3] = &unk_2642B7918;
  id v6 = v4;
  id v10 = v6;
  objc_copyWeak(&v11, &location);
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(volumeKeyFrames, v7, 2, (uint64_t)v9, v8);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (BOOL)volumeKeyframesAreValid
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = -1;
  volumeKeyFrames = self->_volumeKeyFrames;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_217A592E0;
  v7[3] = &unk_2642B7940;
  v7[4] = v8;
  v7[5] = &v9;
  objc_msgSend_enumerateObjectsUsingBlock_(volumeKeyFrames, a2, (uint64_t)v7, v2, v3);
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (BOOL)removeRedundantVolumeKeyFrames
{
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = sub_217A58E10;
  v34 = sub_217A58E20;
  id v35 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  int v29 = -1082130432;
  id v6 = objc_msgSend_volumeKeyFrames(self, a2, v2, v3, v4);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = sub_217A5950C;
  v27[3] = &unk_2642B7968;
  v27[4] = self;
  v27[5] = v28;
  v27[6] = &v30;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v6, v7, 2, (uint64_t)v27, v8);

  if (v31[5])
  {
    uint64_t v13 = (void *)MEMORY[0x263EFF980];
    uint64_t v14 = objc_msgSend_volumeKeyFrames(self, v9, v10, v11, v12);
    uint64_t v18 = objc_msgSend_arrayWithArray_(v13, v15, (uint64_t)v14, v16, v17);

    objc_msgSend_removeObjectsInArray_(v18, v19, v31[5], v20, v21);
    objc_msgSend_setVolumeKeyFrames_(self, v22, (uint64_t)v18, v23, v24);

    BOOL v25 = v31[5] != 0;
  }
  else
  {
    BOOL v25 = 0;
  }
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);

  return v25;
}

- (NSArray)volumeKeyFrames
{
  return &self->_volumeKeyFrames->super;
}

- (void)setVolumeKeyFrames:(id)a3
{
}

- (void).cxx_destruct
{
}

@end