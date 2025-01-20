@interface BLSAlwaysOnTimelineEntrySpecifier
- (BLSAlwaysOnTimelineEntry)previousTimelineEntry;
- (BLSAlwaysOnTimelineEntry)timelineEntry;
- (BLSAlwaysOnTimelineEntrySpecifier)initWithTimelineEntry:(id)a3 percentComplete:(double)a4 previousTimelineEntry:(id)a5 didChange:(BOOL)a6;
- (BOOL)didChange;
- (BOOL)isEqual:(id)a3;
- (double)percentComplete;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)grantedFidelity;
- (int64_t)requestedFidelity;
- (unint64_t)hash;
- (void)appendFidelityToTarget:(id)a3;
- (void)setDidChange:(BOOL)a3;
- (void)setGrantedFidelity:(int64_t)a3;
- (void)setRequestedFidelity:(int64_t)a3;
@end

@implementation BLSAlwaysOnTimelineEntrySpecifier

- (BLSAlwaysOnTimelineEntrySpecifier)initWithTimelineEntry:(id)a3 percentComplete:(double)a4 previousTimelineEntry:(id)a5 didChange:(BOOL)a6
{
  id v11 = a3;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BLSAlwaysOnTimelineEntrySpecifier;
  v13 = [(BLSAlwaysOnTimelineEntrySpecifier *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_lock._os_unfair_lock_opaque = 0;
    v13->_requestedFidelity = -1;
    v13->_grantedFidelity = -1;
    objc_storeStrong((id *)&v13->_timelineEntry, a3);
    v14->_percentComplete = a4;
    objc_storeStrong((id *)&v14->_previousTimelineEntry, a5);
    v14->_didChange = a6;
  }

  return v14;
}

- (int64_t)compare:(id)a3
{
  timelineEntry = self->_timelineEntry;
  v4 = [a3 timelineEntry];
  int64_t v5 = [(BLSAlwaysOnTimelineEntry *)timelineEntry compare:v4];

  return v5;
}

- (int64_t)requestedFidelity
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t requestedFidelity = self->_requestedFidelity;
  if (requestedFidelity == -1) {
    int64_t requestedFidelity = [(BLSAlwaysOnTimelineEntry *)self->_timelineEntry requestedFidelity];
  }
  os_unfair_lock_unlock(p_lock);
  return requestedFidelity;
}

- (void)setRequestedFidelity:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_int64_t requestedFidelity = a3;

  os_unfair_lock_unlock(p_lock);
}

- (id)description
{
  v3 = objc_opt_new();
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __48__BLSAlwaysOnTimelineEntrySpecifier_description__block_invoke;
  v10 = &unk_1E6106FA8;
  id v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  int64_t v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return v5;
}

void __48__BLSAlwaysOnTimelineEntrySpecifier_description__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) timelineEntry];
  v3 = [*(id *)(a1 + 32) previousTimelineEntry];
  uint64_t v4 = [v2 timelineIdentifier];
  int64_t v5 = (void *)v4;
  v6 = @"0x0";
  if (v4) {
    v6 = (__CFString *)v4;
  }
  uint64_t v7 = v6;

  id v8 = (id)[*(id *)(a1 + 40) appendObject:v7 withName:0];
  if ([v2 isAnimated])
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __48__BLSAlwaysOnTimelineEntrySpecifier_description__block_invoke_2;
    v21[3] = &unk_1E6106F58;
    v9 = *(void **)(a1 + 40);
    v21[4] = *(void *)(a1 + 32);
    [v9 appendCustomFormatWithName:0 block:v21];
  }
  v10 = *(void **)(a1 + 40);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __48__BLSAlwaysOnTimelineEntrySpecifier_description__block_invoke_3;
  v18[3] = &unk_1E6106F80;
  id v19 = v2;
  id v20 = v3;
  id v11 = v3;
  id v12 = v2;
  [v10 appendCustomFormatWithName:0 block:v18];
  v13 = *(void **)(a1 + 40);
  if ([*(id *)(a1 + 32) didChange]) {
    v14 = @"∆";
  }
  else {
    v14 = @"-";
  }
  id v15 = (id)[v13 appendObject:v14 withName:0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __48__BLSAlwaysOnTimelineEntrySpecifier_description__block_invoke_4;
  v17[3] = &unk_1E6106F58;
  objc_super v16 = *(void **)(a1 + 40);
  v17[4] = *(void *)(a1 + 32);
  [v16 appendCustomFormatWithName:0 block:v17];
}

uint64_t __48__BLSAlwaysOnTimelineEntrySpecifier_description__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", @"%.3lf%", *(void *)(*(void *)(a1 + 32) + 40));
}

void __48__BLSAlwaysOnTimelineEntrySpecifier_description__block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [*(id *)(a1 + 32) presentationTime];
  uint64_t v4 = objc_msgSend(v3, "bls_shortLoggingString");
  [v7 appendString:v4];

  if (*(void *)(a1 + 40))
  {
    [v7 appendString:@"<-"];
    int64_t v5 = [*(id *)(a1 + 40) presentationTime];
    v6 = objc_msgSend(v5, "bls_shortLoggingString");
    [v7 appendString:v6];
  }
}

uint64_t __48__BLSAlwaysOnTimelineEntrySpecifier_description__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFidelityToTarget:a2];
}

- (void)appendFidelityToTarget:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [(BLSAlwaysOnTimelineEntrySpecifier *)self requestedFidelity];
  uint64_t v5 = [(BLSAlwaysOnTimelineEntrySpecifier *)self grantedFidelity];
  if (v4 == v5)
  {
    v6 = NSStringAbbreviatedFromBLSUpdateFidelity(v4);
    [v11 appendString:v6];
  }
  else
  {
    if (v5 == -1)
    {
      v10 = NSStringAbbreviatedFromBLSUpdateFidelity(v4);
      [v11 appendString:v10];

      v9 = @"(r)";
    }
    else
    {
      id v7 = NSStringAbbreviatedFromBLSUpdateFidelity(v5);
      [v11 appendString:v7];

      objc_msgSend(v11, "appendString:", @"(r:");
      id v8 = NSStringAbbreviatedFromBLSUpdateFidelity(v4);
      [v11 appendString:v8];

      v9 = @"");
    }
    [v11 appendString:v9];
  }
}

- (id)debugDescription
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendDouble:@"percentComplete" withName:2 decimalPrecision:self->_percentComplete];
  id v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSAlwaysOnTimelineEntrySpecifier didChange](self, "didChange"), @"didChange");
  v6 = NSStringFromBLSUpdateFidelity([(BLSAlwaysOnTimelineEntrySpecifier *)self requestedFidelity]);
  id v7 = (id)[v3 appendObject:v6 withName:@"requestedFidelity"];

  id v8 = NSStringFromBLSUpdateFidelity([(BLSAlwaysOnTimelineEntrySpecifier *)self grantedFidelity]);
  id v9 = (id)[v3 appendObject:v8 withName:@"grantedFidelity"];

  v10 = [(BLSAlwaysOnTimelineEntry *)self->_timelineEntry debugDescription];
  id v11 = (id)[v3 appendObject:v10 withName:@"entry"];

  id v12 = [(BLSAlwaysOnTimelineEntry *)self->_previousTimelineEntry debugDescription];
  id v13 = (id)[v3 appendObject:v12 withName:@"previousEntry"];

  v14 = [v3 build];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    timelineEntry = self->_timelineEntry;
    v6 = [v4 timelineEntry];
    if ([(BLSAlwaysOnTimelineEntry *)timelineEntry isEqual:v6])
    {
      double percentComplete = self->_percentComplete;
      [v4 percentComplete];
      BOOL v9 = percentComplete == v8;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(BLSAlwaysOnTimelineEntry *)self->_timelineEntry hash];
  id v4 = [NSNumber numberWithDouble:self->_percentComplete];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [BLSAlwaysOnTimelineEntrySpecifier alloc];
  timelineEntry = self->_timelineEntry;
  double percentComplete = self->_percentComplete;
  previousTimelineEntry = self->_previousTimelineEntry;
  BOOL v8 = [(BLSAlwaysOnTimelineEntrySpecifier *)self didChange];

  return [(BLSAlwaysOnTimelineEntrySpecifier *)v4 initWithTimelineEntry:timelineEntry percentComplete:previousTimelineEntry previousTimelineEntry:v8 didChange:percentComplete];
}

- (BLSAlwaysOnTimelineEntry)timelineEntry
{
  return (BLSAlwaysOnTimelineEntry *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)grantedFidelity
{
  return self->_grantedFidelity;
}

- (void)setGrantedFidelity:(int64_t)a3
{
  self->_grantedFidelity = a3;
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (BLSAlwaysOnTimelineEntry)previousTimelineEntry
{
  return (BLSAlwaysOnTimelineEntry *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)didChange
{
  return self->_didChange;
}

- (void)setDidChange:(BOOL)a3
{
  self->_didChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousTimelineEntry, 0);

  objc_storeStrong((id *)&self->_timelineEntry, 0);
}

@end