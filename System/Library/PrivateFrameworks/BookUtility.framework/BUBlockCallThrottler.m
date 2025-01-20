@interface BUBlockCallThrottler
- (BOOL)_runBlock:(id)a3 throttle:(BOOL)a4;
- (BOOL)runBlockThrottled:(id)a3;
- (BOOL)running;
- (BUBlockCallThrottler)init;
- (NSDate)lastBlockCallDate;
- (double)minimumTimeBetweenCalls;
- (void)runBlock:(id)a3;
- (void)setLastBlockCallDate:(id)a3;
- (void)setMinimumTimeBetweenCalls:(double)a3;
- (void)setRunning:(BOOL)a3;
@end

@implementation BUBlockCallThrottler

- (BUBlockCallThrottler)init
{
  v3.receiver = self;
  v3.super_class = (Class)BUBlockCallThrottler;
  result = [(BUBlockCallThrottler *)&v3 init];
  if (result) {
    result->_minimumTimeBetweenCalls = 2.0;
  }
  return result;
}

- (void)runBlock:(id)a3
{
}

- (BOOL)runBlockThrottled:(id)a3
{
  return MEMORY[0x270F9A6D0](self, sel__runBlock_throttle_, a3);
}

- (BOOL)_runBlock:(id)a3 throttle:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (void (**)(id, void *))a3;
  v9 = objc_msgSend_date(MEMORY[0x263EFF910], v7, v8);
  objc_msgSend_minimumTimeBetweenCalls(self, v10, v11);
  double v13 = v12;
  v16 = objc_msgSend_lastBlockCallDate(self, v14, v15);

  if (v16)
  {
    v19 = objc_msgSend_lastBlockCallDate(self, v17, v18);
    objc_msgSend_timeIntervalSinceDate_(v9, v20, (uint64_t)v19);
    double v22 = v21;
  }
  else
  {
    double v22 = v13 + 1.0;
  }
  if ((objc_msgSend_running(self, v17, v18) & 1) != 0
    || v4 && (objc_msgSend_minimumTimeBetweenCalls(self, v23, v24), v22 < v25))
  {
    v26 = objc_msgSend_date(MEMORY[0x263EFF910], v23, v24);
    objc_msgSend_setLastBlockCallDate_(self, v27, (uint64_t)v26);
  }
  else if (v6)
  {
    BOOL v28 = 1;
    objc_msgSend_setRunning_(self, v23, 1);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = sub_21E1E869C;
    v30[3] = &unk_26449D948;
    v30[4] = self;
    v6[2](v6, v30);
    goto LABEL_11;
  }
  BOOL v28 = 0;
LABEL_11:

  return v28;
}

- (double)minimumTimeBetweenCalls
{
  return self->_minimumTimeBetweenCalls;
}

- (void)setMinimumTimeBetweenCalls:(double)a3
{
  self->_minimumTimeBetweenCalls = a3;
}

- (NSDate)lastBlockCallDate
{
  return self->_lastBlockCallDate;
}

- (void)setLastBlockCallDate:(id)a3
{
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (void).cxx_destruct
{
}

@end