@interface IDSStallDetector
+ (id)detectorWithName:(id)a3;
+ (id)newDetectorWithName:(id)a3 stallDetectedBlock:(id)a4 stallWarningBlock:(id)a5;
+ (void)removeDetectorWithName:(id)a3;
- (BOOL)byteMovementCheckForEvent:(id)a3;
- (BOOL)consumeTimeCheckForEvent:(id)a3 produceTime:(unint64_t)a4 consumeTime:(unint64_t)a5;
- (BOOL)verboseLogging;
- (double)byteMovementDelayThreshold;
- (unint64_t)consumeDelayThreshold;
- (void)consumeBytes:(int)a3;
- (void)forceTriggerStallDetectedBlockWithEventName:(id)a3;
- (void)produceBytes:(int)a3;
- (void)reset;
- (void)setByteMovementDelayThreshold:(double)a3;
- (void)setConsumeDelayThreshold:(unint64_t)a3;
- (void)setVerboseLogging:(BOOL)a3;
@end

@implementation IDSStallDetector

+ (id)newDetectorWithName:(id)a3 stallDetectedBlock:(id)a4 stallWarningBlock:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1E944F978);
  v13 = (void *)qword_1E944F980;
  if (!qword_1E944F980)
  {
    uint64_t v14 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v10, v11, v12);
    v15 = (void *)qword_1E944F980;
    qword_1E944F980 = v14;

    v13 = (void *)qword_1E944F980;
    if (!qword_1E944F980) {
      goto LABEL_4;
    }
  }
  v16 = objc_msgSend_objectForKey_(v13, v10, (uint64_t)v7, v12);

  if (!v16)
  {
    v18 = objc_alloc_init(IDSStallDetector);
    v17 = v18;
    if (v18)
    {
      v18->_lock._os_unfair_lock_opaque = 0;
      uint64_t v22 = objc_msgSend_copy(v8, v19, v20, v21);
      id stallDetectedBlock = v17->_stallDetectedBlock;
      v17->_id stallDetectedBlock = (id)v22;

      uint64_t v27 = objc_msgSend_copy(v9, v24, v25, v26);
      id stallWarningBlock = v17->_stallWarningBlock;
      v17->_id stallWarningBlock = (id)v27;

      uint64_t v32 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v29, v30, v31);
      bytesHistory = v17->_bytesHistory;
      v17->_bytesHistory = (NSMutableArray *)v32;

      uint64_t v37 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v34, v35, v36);
      bytesTimestamps = v17->_bytesTimestamps;
      v17->_bytesTimestamps = (NSMutableArray *)v37;

      objc_msgSend_setObject_forKey_((void *)qword_1E944F980, v39, (uint64_t)v17, v40, v7);
      v41 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v55 = v7;
        __int16 v56 = 2048;
        uint64_t v57 = objc_msgSend_count((void *)qword_1E944F980, v42, v43, v44);
        _os_log_impl(&dword_19D9BE000, v41, OS_LOG_TYPE_DEFAULT, "Created new detector %@ (total %lu)", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v53 = objc_msgSend_count((void *)qword_1E944F980, v45, v46, v47);
          _IDSLogTransport(@"StallDetection", @"IDS", @"Created new detector %@ (total %lu)");
          if (_IDSShouldLog())
          {
            objc_msgSend_count((void *)qword_1E944F980, v48, v49, v50, v7, v53);
            _IDSLogV(0, @"IDSFoundation", @"StallDetection", @"Created new detector %@ (total %lu)");
          }
        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1E944F978);
      v51 = v17;
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1E944F978);
    }
  }
  else
  {
LABEL_4:
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1E944F978);
    v17 = 0;
  }

  return v17;
}

+ (id)detectorWithName:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1E944F978);
  v6 = objc_msgSend_objectForKey_((void *)qword_1E944F980, v4, (uint64_t)v3, v5);

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1E944F978);
  return v6;
}

+ (void)removeDetectorWithName:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1E944F978);
  objc_msgSend_objectForKey_((void *)qword_1E944F980, v4, (uint64_t)v3, v5);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_((void *)qword_1E944F980, v6, (uint64_t)v3, v7);

  objc_msgSend_reset(v11, v8, v9, v10);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1E944F978);
}

- (unint64_t)consumeDelayThreshold
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t consumeDelayThreshold = self->_consumeDelayThreshold;
  os_unfair_lock_unlock(p_lock);
  return consumeDelayThreshold;
}

- (void)setConsumeDelayThreshold:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t consumeDelayThreshold = a3;
  os_unfair_lock_unlock(p_lock);
}

- (double)byteMovementDelayThreshold
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double byteMovementDelayThreshold = self->_byteMovementDelayThreshold;
  os_unfair_lock_unlock(p_lock);
  return byteMovementDelayThreshold;
}

- (void)setByteMovementDelayThreshold:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_double byteMovementDelayThreshold = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)consumeTimeCheckForEvent:(id)a3 produceTime:(unint64_t)a4 consumeTime:(unint64_t)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!self->_consumeDelayThreshold) {
    goto LABEL_18;
  }
  BOOL v9 = 0;
  if (a4 && a5)
  {
    if (self->_verboseLogging)
    {
      double v10 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        id v18 = v8;
        __int16 v19 = 2048;
        unint64_t v20 = a4;
        __int16 v21 = 2048;
        unint64_t v22 = a5;
        __int16 v23 = 2048;
        unint64_t v24 = a4 - a5;
        _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "Checking time for %@: %llu ~ %llu = %llu", buf, 0x2Au);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"StallDetection", @"Checking time for %@: %llu ~ %llu = %llu");
      }
    }
    unint64_t v11 = a4 - a5;
    if (v11 > 0x3FFFFFFFFFFFFFFELL) {
      goto LABEL_18;
    }
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    unint64_t consumeDelayThreshold = self->_consumeDelayThreshold;
    if (v11 <= consumeDelayThreshold)
    {
      if (v11 <= consumeDelayThreshold >> 1)
      {
        os_unfair_lock_unlock(&self->_lock);
        goto LABEL_18;
      }
      uint64_t v14 = 24;
    }
    else
    {
      uint64_t v14 = 16;
    }
    v15 = (void (**)(void *, id))_Block_copy(*(const void **)((char *)&self->super.isa + v14));
    os_unfair_lock_unlock(p_lock);
    if (v15)
    {
      v15[2](v15, v8);

      BOOL v9 = 1;
      goto LABEL_19;
    }
LABEL_18:
    BOOL v9 = 0;
  }
LABEL_19:

  return v9;
}

- (BOOL)byteMovementCheckForEvent:(id)a3
{
  id v4 = a3;
  if (self->_byteMovementDelayThreshold == 0.0) {
    goto LABEL_10;
  }
  double v5 = ids_monotonic_time();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!objc_msgSend_count(self->_bytesTimestamps, v7, v8, v9)) {
    goto LABEL_9;
  }
  double v12 = objc_msgSend_objectAtIndexedSubscript_(self->_bytesTimestamps, v10, 0, v11);
  objc_msgSend_doubleValue(v12, v13, v14, v15);
  double v17 = v16;

  double byteMovementDelayThreshold = self->_byteMovementDelayThreshold;
  if (v5 - v17 > byteMovementDelayThreshold)
  {
    uint64_t v19 = 16;
    goto LABEL_7;
  }
  if (v5 - v17 <= byteMovementDelayThreshold * 0.5)
  {
LABEL_9:
    os_unfair_lock_unlock(&self->_lock);
LABEL_10:
    LOBYTE(v20) = 0;
    goto LABEL_11;
  }
  uint64_t v19 = 24;
LABEL_7:
  unint64_t v20 = (void (**)(void *, id))_Block_copy(*(const void **)((char *)&self->super.isa + v19));
  os_unfair_lock_unlock(p_lock);
  if (v20)
  {
    v20[2](v20, v4);

    LOBYTE(v20) = 1;
  }
LABEL_11:

  return (char)v20;
}

- (void)produceBytes:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v5 = ids_monotonic_time();
  os_unfair_lock_lock(&self->_lock);
  bytesHistory = self->_bytesHistory;
  double v9 = objc_msgSend_numberWithInt_(NSNumber, v7, v3, v8);
  objc_msgSend_addObject_(bytesHistory, v10, (uint64_t)v9, v11);

  bytesTimestamps = self->_bytesTimestamps;
  double v15 = objc_msgSend_numberWithDouble_(NSNumber, v13, v14, v5);
  objc_msgSend_addObject_(bytesTimestamps, v16, (uint64_t)v15, v17);

  os_unfair_lock_unlock(&self->_lock);
  if (self->_verboseLogging)
  {
    id v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v20 = v3;
      __int16 v21 = 2048;
      double v22 = v5;
      _os_log_impl(&dword_19D9BE000, v18, OS_LOG_TYPE_DEFAULT, "Producing bytes %d at time %f", buf, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"StallDetection", @"Producing bytes %d at time %f");
      }
    }
  }
}

- (void)consumeBytes:(int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (a3 >= 1)
  {
    while (objc_msgSend_count(self->_bytesHistory, v6, v7, v8))
    {
      double v11 = objc_msgSend_objectAtIndexedSubscript_(self->_bytesHistory, v9, 0, v10);
      int v15 = objc_msgSend_intValue(v11, v12, v13, v14);

      if (v15 > a3)
      {
        __int16 v21 = objc_msgSend_numberWithInt_(NSNumber, v16, (v15 - a3), v17);
        objc_msgSend_setObject_atIndexedSubscript_(self->_bytesHistory, v22, (uint64_t)v21, v23, 0);

        break;
      }
      objc_msgSend_removeObjectAtIndex_(self->_bytesHistory, v16, 0, v17);
      objc_msgSend_removeObjectAtIndex_(self->_bytesTimestamps, v18, 0, v19);
      BOOL v20 = __OFSUB__(a3, v15);
      a3 -= v15;
      if ((a3 < 0) ^ v20 | (a3 == 0)) {
        break;
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)reset
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_removeAllObjects(self->_bytesHistory, v4, v5, v6);
  objc_msgSend_removeAllObjects(self->_bytesTimestamps, v7, v8, v9);
  os_unfair_lock_unlock(p_lock);
}

- (void)forceTriggerStallDetectedBlockWithEventName:(id)a3
{
  id v6 = a3;
  id v4 = _Block_copy(self->_stallDetectedBlock);
  uint64_t v5 = v4;
  if (v4) {
    (*((void (**)(void *, id))v4 + 2))(v4, v6);
  }
}

- (BOOL)verboseLogging
{
  return self->_verboseLogging;
}

- (void)setVerboseLogging:(BOOL)a3
{
  self->_verboseLogging = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bytesTimestamps, 0);
  objc_storeStrong((id *)&self->_bytesHistory, 0);
  objc_storeStrong(&self->_stallWarningBlock, 0);
  objc_storeStrong(&self->_stallDetectedBlock, 0);
}

@end