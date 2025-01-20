@interface MTCCTimer
- (BOOL)isEqual:(id)a3;
- (MTCCTimer)editingTimer;
- (MTCCTimer)initWithMTTimer:(id)a3;
- (MTCCTimer)initWithState:(unint64_t)a3 duration:(double)a4;
- (NSDate)fireDate;
- (NSString)timerLabel;
- (NSUUID)timerID;
- (double)duration;
- (double)remainingTime;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)state;
- (void)setDuration:(double)a3;
- (void)setEditingTimer:(id)a3;
- (void)setFireDate:(id)a3;
- (void)setRemainingTime:(double)a3;
- (void)setState:(unint64_t)a3;
- (void)setTimerID:(id)a3;
- (void)setTimerLabel:(id)a3;
@end

@implementation MTCCTimer

- (void)setFireDate:(id)a3
{
}

- (MTCCTimer)initWithMTTimer:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_state(v4, v5, v6);
  objc_msgSend_duration(v4, v8, v9);
  v13 = (MTCCTimer *)objc_msgSend_initWithState_duration_(self, v10, v7);
  if (v13)
  {
    v14 = objc_msgSend_timerID(v4, v11, v12);
    objc_msgSend_setTimerID_(v13, v15, (uint64_t)v14);

    v18 = objc_msgSend_fireDate(v4, v16, v17);
    objc_msgSend_setFireDate_(v13, v19, (uint64_t)v18);

    objc_msgSend_remainingTime(v4, v20, v21);
    objc_msgSend_setRemainingTime_(v13, v22, v23);
    v26 = objc_msgSend_title(v4, v24, v25);
    v29 = objc_msgSend_copy(v26, v27, v28);
    objc_msgSend_setTimerLabel_(v13, v30, (uint64_t)v29);
  }
  return v13;
}

- (MTCCTimer)initWithState:(unint64_t)a3 duration:(double)a4
{
  v14.receiver = self;
  v14.super_class = (Class)MTCCTimer;
  uint64_t v6 = [(MTCCTimer *)&v14 init];
  v8 = v6;
  if (v6)
  {
    objc_msgSend_setState_(v6, v7, a3);
    objc_msgSend_setDuration_(v8, v9, v10, a4);
    objc_msgSend_setRemainingTime_(v8, v11, v12, a4);
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MTCCTimer *)a3;
  v5 = v4;
  if (self == v4)
  {
    char isEqual = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    uint64_t v6 = v5;
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    v8 = v7;

    uint64_t v11 = objc_msgSend_state(self, v9, v10);
    if (v11 == objc_msgSend_state(v8, v12, v13)
      && (objc_msgSend_duration(self, v14, v15), double v17 = v16, objc_msgSend_duration(v8, v18, v19), v17 == v22)
      && (objc_msgSend_remainingTime(self, v20, v21), double v24 = v23, objc_msgSend_remainingTime(v8, v25, v26), v24 == v29))
    {
      v30 = objc_msgSend_timerID(self, v27, v28);
      v33 = objc_msgSend_timerID(v8, v31, v32);
      if (objc_msgSend_isEqual_(v30, v34, (uint64_t)v33))
      {
        v37 = objc_msgSend_fireDate(self, v35, v36);
        v40 = objc_msgSend_fireDate(v8, v38, v39);
        char isEqual = objc_msgSend_isEqual_(v37, v41, (uint64_t)v40);
      }
      else
      {
        char isEqual = 0;
      }
    }
    else
    {
      char isEqual = 0;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  objc_msgSend_duration(self, a2, v2);
  double v5 = v4;
  objc_msgSend_remainingTime(self, v6, v7);
  double v9 = v8;
  objc_super v14 = objc_msgSend_timerID(self, v10, v11);
  if (v14)
  {
    uint64_t v15 = objc_msgSend_timerID(self, v12, v13);
    uint64_t v18 = objc_msgSend_hash(v15, v16, v17);
  }
  else
  {
    uint64_t v18 = 0;
  }

  double v23 = objc_msgSend_fireDate(self, v19, v20);
  if (v23)
  {
    double v24 = objc_msgSend_fireDate(self, v21, v22);
    uint64_t v27 = objc_msgSend_hash(v24, v25, v26);
  }
  else
  {
    uint64_t v27 = 0;
  }
  unint64_t v28 = (unint64_t)(v9 + (double)(31 * (unint64_t)(v5 + 31.0)));
  unint64_t v29 = v27 - (v18 - v28 + 32 * v28) + 32 * (v18 - v28 + 32 * v28);

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = objc_opt_new();
  uint64_t v7 = objc_msgSend_state(self, v5, v6);
  objc_msgSend_setState_(v4, v8, v7);
  objc_msgSend_duration(self, v9, v10);
  objc_msgSend_setDuration_(v4, v11, v12);
  uint64_t v15 = objc_msgSend_fireDate(self, v13, v14);
  objc_msgSend_setFireDate_(v4, v16, (uint64_t)v15);

  objc_msgSend_remainingTime(self, v17, v18);
  objc_msgSend_setRemainingTime_(v4, v19, v20);
  double v23 = objc_msgSend_timerLabel(self, v21, v22);
  uint64_t v26 = objc_msgSend_copy(v23, v24, v25);
  objc_msgSend_setTimerLabel_(v4, v27, (uint64_t)v26);

  v30 = objc_msgSend_timerID(self, v28, v29);
  objc_msgSend_setTimerID_(v4, v31, (uint64_t)v30);

  v34 = objc_msgSend_editingTimer(self, v32, v33);
  objc_msgSend_setEditingTimer_(v4, v35, (uint64_t)v34);

  return v4;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)remainingTime
{
  return self->_remainingTime;
}

- (void)setRemainingTime:(double)a3
{
  self->_remainingTime = a3;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (NSUUID)timerID
{
  return self->_timerID;
}

- (void)setTimerID:(id)a3
{
}

- (NSString)timerLabel
{
  return self->_timerLabel;
}

- (void)setTimerLabel:(id)a3
{
}

- (MTCCTimer)editingTimer
{
  return self->_editingTimer;
}

- (void)setEditingTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingTimer, 0);
  objc_storeStrong((id *)&self->_timerLabel, 0);
  objc_storeStrong((id *)&self->_timerID, 0);

  objc_storeStrong((id *)&self->_fireDate, 0);
}

@end