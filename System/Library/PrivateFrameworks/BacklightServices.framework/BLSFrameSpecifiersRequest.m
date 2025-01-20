@interface BLSFrameSpecifiersRequest
- (BLSFrameSpecifiersRequest)initWithDateInterval:(id)a3 previousPresentationDate:(id)a4 shouldReset:(BOOL)a5 completion:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldReset;
- (NSDate)previousPresentationDate;
- (NSDateInterval)dateInterval;
- (id)description;
- (unint64_t)hash;
- (void)completeWithDateSpecifiers:(id)a3;
@end

@implementation BLSFrameSpecifiersRequest

- (BLSFrameSpecifiersRequest)initWithDateInterval:(id)a3 previousPresentationDate:(id)a4 shouldReset:(BOOL)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BLSFrameSpecifiersRequest;
  v14 = [(BLSFrameSpecifiersRequest *)&v19 init];
  v15 = v14;
  if (v14)
  {
    v14->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v14->_dateInterval, a3);
    objc_storeStrong((id *)&v15->_previousPresentationDate, a4);
    v15->_shouldReset = a5;
    uint64_t v16 = MEMORY[0x1BA99C630](v13);
    id completion = v15->_completion;
    v15->_id completion = (id)v16;
  }
  return v15;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(NSDateInterval *)self->_dateInterval bls_shortLoggingString];
  id v5 = (id)[v3 appendObject:v4 withName:@"interval"];

  v6 = [(NSDate *)self->_previousPresentationDate bls_shortLoggingString];
  id v7 = (id)[v3 appendObject:v6 withName:@"previous"];

  id v8 = (id)[v3 appendBool:self->_shouldReset withName:@"reset"];
  v9 = [v3 build];

  return v9;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_dateInterval];
  id v5 = (id)[v3 appendObject:self->_previousPresentationDate];
  id v6 = (id)[v3 appendBool:self->_shouldReset];
  unint64_t v7 = [v3 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  dateInterval = self->_dateInterval;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __37__BLSFrameSpecifiersRequest_isEqual___block_invoke;
  v20[3] = &unk_1E61073D8;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendObject:dateInterval counterpart:v20];
  previousPresentationDate = self->_previousPresentationDate;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __37__BLSFrameSpecifiersRequest_isEqual___block_invoke_2;
  v18[3] = &unk_1E61073D8;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendObject:previousPresentationDate counterpart:v18];
  uint64_t shouldReset = self->_shouldReset;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __37__BLSFrameSpecifiersRequest_isEqual___block_invoke_3;
  v16[3] = &unk_1E6107880;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendBool:shouldReset counterpart:v16];
  LOBYTE(shouldReset) = [v5 isEqual];

  return shouldReset;
}

uint64_t __37__BLSFrameSpecifiersRequest_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dateInterval];
}

uint64_t __37__BLSFrameSpecifiersRequest_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) previousPresentationDate];
}

uint64_t __37__BLSFrameSpecifiersRequest_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) shouldReset];
}

- (void)completeWithDateSpecifiers:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_completed = self->_lock_completed;
  self->_BOOL lock_completed = 1;
  id v6 = (void (**)(void, void))MEMORY[0x1BA99C630](self->_completion);
  id completion = self->_completion;
  self->_id completion = 0;

  os_unfair_lock_unlock(&self->_lock);
  if (lock_completed)
  {
    id v8 = bls_scenes_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BLSFrameSpecifiersRequest completeWithDateSpecifiers:]((uint64_t)self, v8);
    }
  }
  else if (v6)
  {
    ((void (**)(void, id))v6)[2](v6, v4);
  }
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSDate)previousPresentationDate
{
  return self->_previousPresentationDate;
}

- (BOOL)shouldReset
{
  return self->_shouldReset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousPresentationDate, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);

  objc_storeStrong(&self->_completion, 0);
}

- (void)completeWithDateSpecifiers:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B55DE000, a2, OS_LOG_TYPE_ERROR, "completeWithDateSpecifiers should only be called once for request:%@", (uint8_t *)&v2, 0xCu);
}

@end