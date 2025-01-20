@interface PKSelectionStatisticsSession
- (NSDictionary)selectionActionDictionary;
- (NSDictionary)selectionGestureDictionary;
- (NSString)lastActionTaken;
- (NSString)lastSignificantActionTaken;
- (PKSelectionStatisticsSession)init;
- (double)timeSpentSelecting;
- (int64_t)lastContentType;
- (int64_t)lastSelectionType;
- (int64_t)numberOfTimesSelectionWasClearedInASession;
- (int64_t)selectionGestureCount;
- (void)logGesture:(int64_t)a3 selectionType:(int64_t)a4 contentType:(int64_t)a5;
- (void)logSelectionAction:(int64_t)a3;
- (void)setLastActionTaken:(id)a3;
- (void)setLastContentType:(int64_t)a3;
- (void)setLastSelectionType:(int64_t)a3;
- (void)setLastSignificantActionTaken:(id)a3;
- (void)setNumberOfTimesSelectionWasClearedInASession:(int64_t)a3;
- (void)setSelectionGestureCount:(int64_t)a3;
- (void)setTimeSpentSelecting:(double)a3;
@end

@implementation PKSelectionStatisticsSession

- (PKSelectionStatisticsSession)init
{
  v10.receiver = self;
  v10.super_class = (Class)PKSelectionStatisticsSession;
  v2 = [(PKSelectionStatisticsSession *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    startTime = v2->_startTime;
    v2->_startTime = (NSDate *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    selectionActions = v2->_selectionActions;
    v2->_selectionActions = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    selectionGestures = v2->_selectionGestures;
    v2->_selectionGestures = (NSMutableArray *)v7;
  }
  return v2;
}

- (void)logGesture:(int64_t)a3 selectionType:(int64_t)a4 contentType:(int64_t)a5
{
  ++self->_selectionGestureCount;
  self->_lastSelectionType = a4;
  self->_lastContentType = a5;
  if ((unint64_t)(a3 - 1) > 5) {
    uint64_t v5 = @"none";
  }
  else {
    uint64_t v5 = off_1E64CB398[a3 - 1];
  }
  [(NSMutableArray *)self->_selectionGestures addObject:v5];
}

- (void)logSelectionAction:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 9) {
    uint64_t v3 = @"selectionActionTypeNone";
  }
  else {
    uint64_t v3 = off_1E64CB348[a3 - 1];
  }
  [(NSMutableArray *)self->_selectionActions addObject:v3];
}

- (double)timeSpentSelecting
{
  [(NSDate *)self->_startTime timeIntervalSinceNow];
  return -v2;
}

- (NSDictionary)selectionGestureDictionary
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = self->_selectionGestures;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        objc_super v10 = objc_msgSend(v3, "valueForKey:", v9, (void)v15);

        if (v10)
        {
          v11 = [v3 valueForKey:v9];
          uint64_t v12 = (int)[v11 intValue];

          v13 = [NSNumber numberWithInteger:v12 + 1];
          [v3 setObject:v13 forKey:v9];
        }
        else
        {
          [v3 setObject:&unk_1F200E9A0 forKey:v9];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (NSDictionary)selectionActionDictionary
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = self->_selectionActions;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        objc_super v10 = objc_msgSend(v3, "valueForKey:", v9, (void)v15);

        if (v10)
        {
          v11 = [v3 valueForKey:v9];
          uint64_t v12 = (int)[v11 intValue];

          v13 = [NSNumber numberWithInteger:v12 + 1];
          [v3 setObject:v13 forKey:v9];
        }
        else
        {
          [v3 setObject:&unk_1F200E9A0 forKey:v9];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (int64_t)numberOfTimesSelectionWasClearedInASession
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v2 = self->_selectionActions;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isEqual:", @"selectionActionTypeNone", (void)v9);
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (NSString)lastActionTaken
{
  if ([(NSMutableArray *)self->_selectionActions count])
  {
    uint64_t v3 = [(NSMutableArray *)self->_selectionActions lastObject];
  }
  else
  {
    uint64_t v3 = @"selectionActionTypeNone";
  }

  return (NSString *)v3;
}

- (NSString)lastSignificantActionTaken
{
  uint64_t v3 = [(NSMutableArray *)self->_selectionActions count];
  uint64_t v4 = @"selectionActionTypeNone";
  while (--v3 >= 0)
  {
    int64_t v5 = [(NSMutableArray *)self->_selectionActions objectAtIndexedSubscript:v3];
    char v6 = [v5 isEqual:@"selectionActionTypeNone"];

    if ((v6 & 1) == 0)
    {
      uint64_t v4 = [(NSMutableArray *)self->_selectionActions objectAtIndexedSubscript:v3];
      break;
    }
  }

  return (NSString *)v4;
}

- (void)setTimeSpentSelecting:(double)a3
{
  self->_timeSpentSelecting = a3;
}

- (void)setNumberOfTimesSelectionWasClearedInASession:(int64_t)a3
{
  self->_numberOfTimesSelectionWasClearedInASession = a3;
}

- (int64_t)selectionGestureCount
{
  return self->_selectionGestureCount;
}

- (void)setSelectionGestureCount:(int64_t)a3
{
  self->_selectionGestureCount = a3;
}

- (void)setLastActionTaken:(id)a3
{
}

- (void)setLastSignificantActionTaken:(id)a3
{
}

- (int64_t)lastSelectionType
{
  return self->_lastSelectionType;
}

- (void)setLastSelectionType:(int64_t)a3
{
  self->_lastSelectionType = a3;
}

- (int64_t)lastContentType
{
  return self->_lastContentType;
}

- (void)setLastContentType:(int64_t)a3
{
  self->_lastContentType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSignificantActionTaken, 0);
  objc_storeStrong((id *)&self->_lastActionTaken, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_selectionActions, 0);

  objc_storeStrong((id *)&self->_selectionGestures, 0);
}

@end