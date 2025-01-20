@interface SGQuickResponsesRecords
- (NSArray)replyRecords;
- (SGQuickResponsesRecords)initWithReplyRecords:(id)a3 totalOpportunities:(double)a4 totalDisplayed:(double)a5 totalSelected:(double)a6 totalMatched:(double)a7 totalUnmatched:(double)a8;
- (double)totalDisplayed;
- (double)totalMatched;
- (double)totalOpportunities;
- (double)totalSelected;
- (double)totalUnmatched;
@end

@implementation SGQuickResponsesRecords

- (void).cxx_destruct
{
}

- (double)totalUnmatched
{
  return self->_totalUnmatched;
}

- (double)totalMatched
{
  return self->_totalMatched;
}

- (double)totalSelected
{
  return self->_totalSelected;
}

- (double)totalDisplayed
{
  return self->_totalDisplayed;
}

- (double)totalOpportunities
{
  return self->_totalOpportunities;
}

- (NSArray)replyRecords
{
  return self->_replyRecords;
}

- (SGQuickResponsesRecords)initWithReplyRecords:(id)a3 totalOpportunities:(double)a4 totalDisplayed:(double)a5 totalSelected:(double)a6 totalMatched:(double)a7 totalUnmatched:(double)a8
{
  id v16 = a3;
  if (a4 < 0.0)
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SGQuickResponsesStore.m", 1294, @"Invalid parameter not satisfying: %@", @"totalOpportunities >= 0" object file lineNumber description];
  }
  if (a5 < 0.0)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SGQuickResponsesStore.m", 1295, @"Invalid parameter not satisfying: %@", @"totalDisplayed >= 0" object file lineNumber description];
  }
  if (a6 < 0.0)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SGQuickResponsesStore.m", 1296, @"Invalid parameter not satisfying: %@", @"totalSelected >= 0" object file lineNumber description];
  }
  if (a7 < 0.0)
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SGQuickResponsesStore.m", 1297, @"Invalid parameter not satisfying: %@", @"totalMatched >= 0" object file lineNumber description];
  }
  if (a8 < 0.0)
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SGQuickResponsesStore.m", 1298, @"Invalid parameter not satisfying: %@", @"totalUnmatched >= 0" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)SGQuickResponsesRecords;
  v17 = [(SGQuickResponsesRecords *)&v25 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_replyRecords, a3);
    v18->_totalOpportunities = a4;
    v18->_totalDisplayed = a5;
    v18->_totalSelected = a6;
    v18->_totalMatched = a7;
    v18->_totalUnmatched = a8;
  }

  return v18;
}

@end