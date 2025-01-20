@interface BLSAlwaysOnFrameSpecifier
+ (id)loggingStringForPresentationInterval:(id)a3;
+ (id)shortLoggingStringForPresentationInterval:(id)a3;
- (BLSAlwaysOnFrameSpecifier)initWithTimelineEntrySpecifiers:(id)a3 presentationInterval:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)entrySpecifiers;
- (NSDateInterval)presentationInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)correctedSpecifierWithNextSpecifier:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)entrySpecifierForTimelineIdentifier:(id)a3;
- (int64_t)compare:(id)a3;
- (int64_t)grantedFidelity;
- (int64_t)requestedFidelity;
- (unint64_t)hash;
- (void)constrainEntriesToUpdateFidelity:(uint64_t)a1;
- (void)setGrantedFidelity:(int64_t)a3;
@end

@implementation BLSAlwaysOnFrameSpecifier

- (BLSAlwaysOnFrameSpecifier)initWithTimelineEntrySpecifiers:(id)a3 presentationInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BLSAlwaysOnFrameSpecifier;
  v8 = [(BLSAlwaysOnFrameSpecifier *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    uint64_t v10 = [v6 copy];
    entrySpecifiers = v9->_entrySpecifiers;
    v9->_entrySpecifiers = (NSArray *)v10;

    uint64_t v12 = [v7 copy];
    presentationInterval = v9->_presentationInterval;
    v9->_presentationInterval = (NSDateInterval *)v12;

    v9->_grantedFidelity = -1;
  }

  return v9;
}

- (id)entrySpecifierForTimelineIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self->_entrySpecifiers;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__BLSAlwaysOnFrameSpecifier_entrySpecifierForTimelineIdentifier___block_invoke;
  v10[3] = &unk_1E6106FD0;
  id v6 = v4;
  id v11 = v6;
  uint64_t v7 = [(NSArray *)v5 indexOfObjectPassingTest:v10];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v8 = [(NSArray *)v5 objectAtIndex:v7];
  }

  return v8;
}

uint64_t __65__BLSAlwaysOnFrameSpecifier_entrySpecifierForTimelineIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 timelineEntry];
  uint64_t v7 = [v6 timelineIdentifier];
  uint64_t v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8) {
    *a4 = 1;
  }
  return v8;
}

- (int64_t)compare:(id)a3
{
  presentationInterval = self->_presentationInterval;
  id v4 = [a3 presentationInterval];
  int64_t v5 = [(NSDateInterval *)presentationInterval compare:v4];

  return v5;
}

+ (id)loggingStringForPresentationInterval:(id)a3
{
  return (id)objc_msgSend(a3, "bls_loggingString");
}

+ (id)shortLoggingStringForPresentationInterval:(id)a3
{
  return (id)objc_msgSend(a3, "bls_shortLoggingString");
}

- (int64_t)requestedFidelity
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_entrySpecifiers;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "requestedFidelity", (void)v10);
        if (v8 > v5) {
          int64_t v5 = v8;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (int64_t)grantedFidelity
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t grantedFidelity = self->_grantedFidelity;
  os_unfair_lock_unlock(p_lock);
  return grantedFidelity;
}

- (void)setGrantedFidelity:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_int64_t grantedFidelity = a3;
  os_unfair_lock_unlock(p_lock);

  -[BLSAlwaysOnFrameSpecifier constrainEntriesToUpdateFidelity:]((uint64_t)self, a3);
}

- (void)constrainEntriesToUpdateFidelity:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = *(id *)(a1 + 24);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          uint64_t v9 = objc_msgSend(v8, "requestedFidelity", (void)v11);
          if (v9 >= a2) {
            uint64_t v10 = a2;
          }
          else {
            uint64_t v10 = v9;
          }
          [v8 setGrantedFidelity:v10];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
  }
}

- (id)correctedSpecifierWithNextSpecifier:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v36 = self;
  uint64_t v5 = self->_entrySpecifiers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      uint64_t v9 = 0;
      uint64_t v37 = v7;
      do
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v38 + 1) + 8 * v9);
        if (objc_msgSend(v10, "requestedFidelity", v36) == -1)
        {
          long long v11 = [v10 timelineEntry];
          long long v12 = [v11 timelineIdentifier];
          long long v13 = [v4 entrySpecifierForTimelineIdentifier:v12];

          long long v14 = [v13 timelineEntry];
          if ([v11 isEqual:v14])
          {
            uint64_t v15 = [v13 requestedFidelity];
          }
          else
          {
            [v14 presentationTime];
            uint64_t v16 = v8;
            v17 = v5;
            v19 = id v18 = v4;
            v20 = [v11 presentationTime];
            [v19 timeIntervalSinceDate:v20];
            double v22 = v21;

            id v4 = v18;
            uint64_t v5 = v17;
            uint64_t v8 = v16;
            uint64_t v7 = v37;
            int64_t v23 = +[BLSFidelityThreshold fidelityForUpdateInterval:v22];
            if (v23 == 3) {
              uint64_t v15 = 2;
            }
            else {
              uint64_t v15 = v23;
            }
          }
          [v10 setRequestedFidelity:v15];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v7);
  }

  v24 = [(BLSAlwaysOnFrameSpecifier *)v36 presentationInterval];
  v25 = [v4 presentationInterval];
  v26 = [v25 startDate];

  v27 = [v24 endDate];
  char v28 = [v27 isEqualToDate:v26];

  if (v28)
  {
    v29 = 0;
  }
  else
  {
    v30 = [BLSAlwaysOnFrameSpecifier alloc];
    v31 = [(BLSAlwaysOnFrameSpecifier *)v36 entrySpecifiers];
    id v32 = objc_alloc(MEMORY[0x1E4F28C18]);
    v33 = [v24 startDate];
    v34 = (void *)[v32 initWithStartDate:v33 endDate:v26];
    v29 = [(BLSAlwaysOnFrameSpecifier *)v30 initWithTimelineEntrySpecifiers:v31 presentationInterval:v34];
  }

  return v29;
}

- (id)description
{
  id v3 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__BLSAlwaysOnFrameSpecifier_description__block_invoke;
  v11[3] = &unk_1E6106FA8;
  id v4 = v3;
  id v12 = v4;
  long long v13 = self;
  [v4 appendProem:0 block:v11];
  entrySpecifiers = self->_entrySpecifiers;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__BLSAlwaysOnFrameSpecifier_description__block_invoke_2;
  v9[3] = &unk_1E6106FF8;
  id v10 = v4;
  id v6 = v4;
  [v6 appendCollection:entrySpecifiers withName:0 itemBlock:v9];
  uint64_t v7 = [v6 description];

  return v7;
}

void __40__BLSAlwaysOnFrameSpecifier_description__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "bls_shortLoggingString");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = (id)[v1 appendObject:v3 withName:0];
}

void __40__BLSAlwaysOnFrameSpecifier_description__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__BLSAlwaysOnFrameSpecifier_description__block_invoke_3;
  v6[3] = &unk_1E6106F58;
  id v7 = v3;
  id v5 = v3;
  [v4 appendCustomFormatWithName:0 block:v6];
}

void __40__BLSAlwaysOnFrameSpecifier_description__block_invoke_3(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [*(id *)(a1 + 32) timelineEntry];
  id v4 = [v3 presentationTime];
  id v5 = objc_msgSend(v4, "bls_shortLoggingString");
  [v13 appendString:v5];

  [v13 appendString:@" "];
  if ([v3 isAnimated])
  {
    [*(id *)(a1 + 32) percentComplete];
    objc_msgSend(v13, "appendFormat:", @"%.2lf%% ", v6);
  }
  [*(id *)(a1 + 32) appendFidelityToTarget:v13];
  [v13 appendString:@" "];
  uint64_t v7 = [v3 timelineIdentifier];
  uint64_t v8 = (void *)v7;
  uint64_t v9 = @"0x0";
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  id v10 = v9;

  long long v11 = [(__CFString *)v10 description];

  [v13 appendString:v11];
  [v13 appendString:@" "];
  if ([*(id *)(a1 + 32) didChange]) {
    id v12 = @"∆";
  }
  else {
    id v12 = @"-";
  }
  [v13 appendString:v12];
}

- (id)debugDescription
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(NSDateInterval *)self->_presentationInterval bls_loggingString];
  [v3 appendString:v4 withName:@"presentation interval"];

  id v5 = NSStringFromBLSUpdateFidelity([(BLSAlwaysOnFrameSpecifier *)self grantedFidelity]);
  id v6 = (id)[v3 appendObject:v5 withName:@"grantedFidelity"];

  uint64_t v7 = NSStringFromBLSUpdateFidelity([(BLSAlwaysOnFrameSpecifier *)self requestedFidelity]);
  id v8 = (id)[v3 appendObject:v7 withName:@"requestedFidelity"];

  [v3 appendArraySection:self->_entrySpecifiers withName:@"entries" skipIfEmpty:1 objectTransformer:&__block_literal_global];
  uint64_t v9 = [v3 build];

  return v9;
}

uint64_t __45__BLSAlwaysOnFrameSpecifier_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  return [a2 debugDescription];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    presentationInterval = self->_presentationInterval;
    id v6 = [v4 presentationInterval];
    if ([(NSDateInterval *)presentationInterval isEqual:v6])
    {
      entrySpecifiers = self->_entrySpecifiers;
      id v8 = [v4 entrySpecifiers];
      BOOL v9 = [(NSArray *)entrySpecifiers isEqualToArray:v8];
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
  uint64_t v3 = [(NSDateInterval *)self->_presentationInterval hash];
  return [(NSArray *)self->_entrySpecifiers hash] ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [BLSAlwaysOnFrameSpecifier alloc];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_entrySpecifiers copyItems:1];
  id v6 = [(BLSAlwaysOnFrameSpecifier *)v4 initWithTimelineEntrySpecifiers:v5 presentationInterval:self->_presentationInterval];

  return v6;
}

- (NSArray)entrySpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSDateInterval)presentationInterval
{
  return (NSDateInterval *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationInterval, 0);

  objc_storeStrong((id *)&self->_entrySpecifiers, 0);
}

@end