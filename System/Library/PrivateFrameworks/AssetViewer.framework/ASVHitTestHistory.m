@interface ASVHitTestHistory
- (ASVHitTestHistory)initWithResultCapacity:(unint64_t)a3 decisionCapacity:(unint64_t)a4;
- (NSMutableArray)decisions;
- (NSMutableArray)results;
- (id)recentDecisionsForCount:(unint64_t)a3;
- (id)recentResultsForCount:(unint64_t)a3;
- (unint64_t)decisionCapacity;
- (unint64_t)resultCapacity;
- (void)addDecision:(id)a3;
- (void)addResult:(id)a3;
- (void)clearHistory;
- (void)reinitializeDecisionHistoryWithDecision:(id)a3;
@end

@implementation ASVHitTestHistory

- (ASVHitTestHistory)initWithResultCapacity:(unint64_t)a3 decisionCapacity:(unint64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)ASVHitTestHistory;
  v6 = [(ASVHitTestHistory *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_resultCapacity = a3;
    v6->_decisionCapacity = a4;
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    results = v7->_results;
    v7->_results = (NSMutableArray *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
    decisions = v7->_decisions;
    v7->_decisions = (NSMutableArray *)v10;
  }
  return v7;
}

- (void)addResult:(id)a3
{
  id v4 = a3;
  v5 = [(ASVHitTestHistory *)self results];
  [v5 addObject:v4];

  v6 = [(ASVHitTestHistory *)self results];
  unint64_t v7 = [v6 count];
  unint64_t v8 = [(ASVHitTestHistory *)self resultCapacity];

  if (v7 > v8)
  {
    id v9 = [(ASVHitTestHistory *)self results];
    [v9 removeObjectAtIndex:0];
  }
}

- (void)addDecision:(id)a3
{
  id v4 = a3;
  v5 = [(ASVHitTestHistory *)self decisions];
  [v5 addObject:v4];

  v6 = [(ASVHitTestHistory *)self decisions];
  unint64_t v7 = [v6 count];
  unint64_t v8 = [(ASVHitTestHistory *)self decisionCapacity];

  if (v7 > v8)
  {
    id v9 = [(ASVHitTestHistory *)self decisions];
    [v9 removeObjectAtIndex:0];
  }
}

- (id)recentResultsForCount:(unint64_t)a3
{
  v5 = [(ASVHitTestHistory *)self results];
  unint64_t v6 = [v5 count];

  if (v6 < a3) {
    a3 = v6;
  }
  if (a3)
  {
    unint64_t v7 = [(ASVHitTestHistory *)self results];
    unint64_t v8 = [v7 count] - a3;

    id v9 = [(ASVHitTestHistory *)self results];
    uint64_t v10 = objc_msgSend(v9, "subarrayWithRange:", v8, a3);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v10;
}

- (id)recentDecisionsForCount:(unint64_t)a3
{
  v5 = [(ASVHitTestHistory *)self decisions];
  uint64_t v6 = [v5 count];

  if (!v6) {
    goto LABEL_6;
  }
  unint64_t v7 = [(ASVHitTestHistory *)self decisions];
  unint64_t v8 = [v7 count] - 1;

  if (v8 < a3) {
    a3 = v8;
  }
  if (a3)
  {
    id v9 = [(ASVHitTestHistory *)self decisions];
    unint64_t v10 = [v9 count] - a3;

    v11 = [(ASVHitTestHistory *)self decisions];
    v12 = objc_msgSend(v11, "subarrayWithRange:", v10, a3);
  }
  else
  {
LABEL_6:
    v12 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v12;
}

- (void)clearHistory
{
  v3 = [(ASVHitTestHistory *)self results];
  [v3 removeAllObjects];

  id v4 = [(ASVHitTestHistory *)self decisions];
  [v4 removeAllObjects];
}

- (void)reinitializeDecisionHistoryWithDecision:(id)a3
{
  id v4 = a3;
  v5 = [(ASVHitTestHistory *)self decisions];
  [v5 removeAllObjects];

  id v6 = [(ASVHitTestHistory *)self decisions];
  [v6 addObject:v4];
}

- (unint64_t)resultCapacity
{
  return self->_resultCapacity;
}

- (NSMutableArray)results
{
  return self->_results;
}

- (unint64_t)decisionCapacity
{
  return self->_decisionCapacity;
}

- (NSMutableArray)decisions
{
  return self->_decisions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decisions, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end