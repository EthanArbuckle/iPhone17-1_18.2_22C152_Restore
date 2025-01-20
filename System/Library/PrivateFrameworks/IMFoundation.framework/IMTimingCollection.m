@interface IMTimingCollection
- (BOOL)hasKey:(id)a3;
- (IMTimingCollection)init;
- (double)totalTimeForKey:(id)a3;
- (id)description;
- (void)removeTimingForKey:(id)a3;
- (void)startTimingForKey:(id)a3;
- (void)stopTimingForKey:(id)a3;
@end

@implementation IMTimingCollection

- (IMTimingCollection)init
{
  v7.receiver = self;
  v7.super_class = (Class)IMTimingCollection;
  v2 = [(IMTimingCollection *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    timings = v3->_timings;
    v3->_timings = v4;
  }
  return v3;
}

- (void)startTimingForKey:(id)a3
{
  id v13 = a3;
  double v4 = IMTimeOfDay();
  os_unfair_lock_lock(&self->_lock);
  v10 = objc_msgSend_objectForKey_(self->_timings, v5, (uint64_t)v13, v6);
  if (!v10)
  {
    *(float *)&double v11 = v4;
    v10 = objc_msgSend_createTimingInstanceWithStartTime_(_IMTimingInstance, v7, v8, v9, v11);
    objc_msgSend_setObject_forKey_(self->_timings, v12, (uint64_t)v10, (uint64_t)v13);
  }
  objc_msgSend_startUsingTime_(v10, v7, v8, v9, v4);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)stopTimingForKey:(id)a3
{
  id v4 = a3;
  double v5 = IMTimeOfDay();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = objc_msgSend_objectForKey_(self->_timings, v7, (uint64_t)v4, v8);

  objc_msgSend_stopUsingTime_(v9, v10, v11, v12, v5);
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
}

- (double)totalTimeForKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v8 = objc_msgSend_objectForKey_(self->_timings, v6, (uint64_t)v5, v7);

  objc_msgSend_totalTime(v8, v9, v10, v11);
  double v13 = v12;
  os_unfair_lock_unlock(p_lock);

  return v13;
}

- (void)removeTimingForKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_removeObjectForKey_(self->_timings, v6, (uint64_t)v5, v7);

  os_unfair_lock_unlock(p_lock);
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = objc_msgSend_description(self->_timings, v4, v5, v6);
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (BOOL)hasKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v8 = objc_msgSend_objectForKey_(self->_timings, v6, (uint64_t)v5, v7);

  os_unfair_lock_unlock(p_lock);
  return v8 != 0;
}

@end