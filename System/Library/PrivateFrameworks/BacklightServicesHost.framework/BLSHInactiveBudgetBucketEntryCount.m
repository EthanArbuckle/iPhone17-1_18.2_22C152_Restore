@interface BLSHInactiveBudgetBucketEntryCount
- (BLSHInactiveBudgetBucketEntryCount)init;
- (BOOL)countSpecifier:(id)a3 hasSecondsBudget:(BOOL)a4 isCoalesceAllowed:(BOOL)a5;
- (BOOL)isSecondsFidelity;
- (NSDate)lastEntryFinalDate;
- (NSDate)lastEntryInitialDate;
- (double)timeIntervalFromLastEntryToDate:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)count;
@end

@implementation BLSHInactiveBudgetBucketEntryCount

- (BLSHInactiveBudgetBucketEntryCount)init
{
  v6.receiver = self;
  v6.super_class = (Class)BLSHInactiveBudgetBucketEntryCount;
  v2 = [(BLSHInactiveBudgetBucketEntryCount *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF910] distantPast];
    lastEntryFinalDate = v2->_lastEntryFinalDate;
    v2->_lastEntryFinalDate = v3;

    objc_storeStrong((id *)&v2->_lastEntryInitialDate, v3);
  }
  return v2;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendInt:self->_count withName:@"count"];
  v5 = [(NSDate *)self->_lastEntryInitialDate bls_shortLoggingString];
  [v3 appendString:v5 withName:@"lastEntry"];

  if (![(NSDate *)self->_lastEntryInitialDate isEqualToDate:self->_lastEntryFinalDate])
  {
    objc_super v6 = [(NSDate *)self->_lastEntryFinalDate bls_shortLoggingString];
    [v3 appendString:v6 withName:@"lastEntryEnd"];
  }
  id v7 = (id)[v3 appendBool:self->_secondsFidelity withName:@"isSecondsFidelity" ifEqualTo:1];
  v8 = [v3 build];

  return v8;
}

- (BOOL)countSpecifier:(id)a3 hasSecondsBudget:(BOOL)a4 isCoalesceAllowed:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = [v8 date];
  uint64_t v10 = [v8 fidelity];

  if (v10 < 2)
  {
    if (v5
      && ([v9 timeIntervalSinceDate:self->_lastEntryInitialDate],
          double v15 = fabs(v14),
          [MEMORY[0x263F29A18] animationCoalesceThreshold],
          v15 < v16))
    {
      v17 = [v9 earlierDate:self->_lastEntryInitialDate];
      lastEntryInitialDate = self->_lastEntryInitialDate;
      self->_lastEntryInitialDate = v17;

      v19 = [v9 laterDate:self->_lastEntryFinalDate];
      lastEntryFinalDate = self->_lastEntryFinalDate;
      self->_lastEntryFinalDate = v19;

      LOBYTE(v6) = 1;
    }
    else if (v6 || self->_count <= 2)
    {
      if ([(NSDate *)self->_lastEntryFinalDate compare:v9] == NSOrderedAscending)
      {
        objc_storeStrong((id *)&self->_lastEntryFinalDate, v9);
        objc_storeStrong((id *)&self->_lastEntryInitialDate, v9);
      }
      int count = self->_count;
      self->_int count = count + 1;
      LOBYTE(v6) = 1;
      if (count >= 3) {
        self->_secondsFidelity = 1;
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else if (v6)
  {
    v12 = self->_lastEntryFinalDate;
    p_lastEntryFinalDate = &self->_lastEntryFinalDate;
    LOBYTE(v6) = 1;
    *((unsigned char *)p_lastEntryFinalDate - 16) = 1;
    v13 = [v9 laterDate:v12];

    objc_storeStrong((id *)p_lastEntryFinalDate, v13);
    objc_storeStrong((id *)p_lastEntryFinalDate - 1, v13);
    ++*((_DWORD *)p_lastEntryFinalDate - 3);
    v9 = v13;
  }

  return v6;
}

- (double)timeIntervalFromLastEntryToDate:(id)a3
{
  [a3 timeIntervalSinceDate:self->_lastEntryFinalDate];
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(BLSHInactiveBudgetBucketEntryCount);
  objc_storeStrong((id *)&v4->_lastEntryInitialDate, self->_lastEntryInitialDate);
  objc_storeStrong((id *)&v4->_lastEntryFinalDate, self->_lastEntryFinalDate);
  v4->_int count = self->_count;
  v4->_secondsFidelity = self->_secondsFidelity;
  return v4;
}

- (int)count
{
  return self->_count;
}

- (BOOL)isSecondsFidelity
{
  return self->_secondsFidelity;
}

- (NSDate)lastEntryInitialDate
{
  return self->_lastEntryInitialDate;
}

- (NSDate)lastEntryFinalDate
{
  return self->_lastEntryFinalDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEntryFinalDate, 0);

  objc_storeStrong((id *)&self->_lastEntryInitialDate, 0);
}

@end