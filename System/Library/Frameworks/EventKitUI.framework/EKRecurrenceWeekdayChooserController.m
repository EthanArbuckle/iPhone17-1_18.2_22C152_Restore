@interface EKRecurrenceWeekdayChooserController
- (EKRecurrenceWeekdayChooserController)initWithDate:(id)a3;
- (NSArray)daysOfTheWeek;
- (NSMutableArray)cells;
- (double)heightForRow:(int64_t)a3;
- (id)cellForRow:(int64_t)a3;
- (int)_dayMask;
- (int)dayOfWeekForRow:(int64_t)a3;
- (int64_t)frequency;
- (int64_t)numberOfRows;
- (void)_setCell:(id)a3 selected:(BOOL)a4;
- (void)rowTapped:(int64_t)a3;
- (void)setCells:(id)a3;
- (void)setDaysOfTheWeek:(id)a3;
- (void)updateFromRecurrenceRule:(id)a3;
- (void)updateRecurrenceRuleBuilder:(id)a3;
@end

@implementation EKRecurrenceWeekdayChooserController

- (EKRecurrenceWeekdayChooserController)initWithDate:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)EKRecurrenceWeekdayChooserController;
  v3 = [(EKRecurrenceChooserController *)&v15 initWithDate:a3];
  v4 = v3;
  if (v3)
  {
    [(EKRecurrenceWeekdayChooserController *)v3 setDaysOfTheWeek:MEMORY[0x1E4F1CBF0]];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:7];
    selectedDays = v4->_selectedDays;
    v4->_selectedDays = (NSMutableArray *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:7];
    cells = v4->_cells;
    v4->_cells = (NSMutableArray *)v7;

    uint64_t v9 = 0;
    v10 = 0;
    do
    {
      v11 = v10;
      [(EKRecurrenceWeekdayChooserController *)v4 dayOfWeekForRow:v9];
      v10 = [[EKUITableViewCell alloc] initWithStyle:0 reuseIdentifier:0];

      v12 = CUIKStringForDayOfWeek();
      v13 = [(EKUITableViewCell *)v10 textLabel];
      [v13 setText:v12];

      [(NSMutableArray *)v4->_cells addObject:v10];
      ++v9;
    }
    while (v9 != 7);
  }
  return v4;
}

- (void)setDaysOfTheWeek:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (NSArray *)a3;
  if (self->_daysOfTheWeek != v5)
  {
    objc_storeStrong((id *)&self->_daysOfTheWeek, a3);
    [(NSMutableArray *)self->_selectedDays removeAllObjects];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v6 = v5;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          selectedDays = self->_selectedDays;
          v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dayOfTheWeek", (void)v13) - 1);
          [(NSMutableArray *)selectedDays addObject:v12];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (int)dayOfWeekForRow:(int64_t)a3
{
  unsigned int v3 = CUIKZeroIndexedWeekStart() + a3;
  if (v3 <= 6) {
    return v3;
  }
  else {
    return v3 - 7;
  }
}

- (int64_t)frequency
{
  return 1;
}

- (int64_t)numberOfRows
{
  return 7;
}

- (double)heightForRow:(int64_t)a3
{
  return *MEMORY[0x1E4FB2F28];
}

- (id)cellForRow:(int64_t)a3
{
  uint64_t v5 = -[NSMutableArray objectAtIndexedSubscript:](self->_cells, "objectAtIndexedSubscript:");
  uint64_t v6 = [(EKRecurrenceWeekdayChooserController *)self dayOfWeekForRow:a3];
  selectedDays = self->_selectedDays;
  uint64_t v8 = [NSNumber numberWithUnsignedInt:v6];
  [(EKRecurrenceWeekdayChooserController *)self _setCell:v5 selected:[(NSMutableArray *)selectedDays containsObject:v8]];

  return v5;
}

- (void)rowTapped:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = -[EKRecurrenceWeekdayChooserController dayOfWeekForRow:](self, "dayOfWeekForRow:");
  selectedDays = self->_selectedDays;
  uint64_t v7 = [NSNumber numberWithUnsignedInt:v5];
  int v8 = [(NSMutableArray *)selectedDays containsObject:v7];

  if ([(NSMutableArray *)self->_selectedDays count] != 1 || (v8 & 1) == 0)
  {
    uint64_t v9 = self->_selectedDays;
    v10 = [NSNumber numberWithUnsignedInt:v5];
    if (v8) {
      [(NSMutableArray *)v9 removeObject:v10];
    }
    else {
      [(NSMutableArray *)v9 addObject:v10];
    }

    v11 = [(EKRecurrenceWeekdayChooserController *)self cellForRow:a3];
    [(EKRecurrenceWeekdayChooserController *)self _setCell:v11 selected:v8 ^ 1u];

    v12 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v13 = self->_selectedDays;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = objc_msgSend(MEMORY[0x1E4F255D8], "dayOfWeek:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "integerValue", (void)v19) + 1);
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }

    [(EKRecurrenceWeekdayChooserController *)self setDaysOfTheWeek:v12];
    [(EKRecurrenceChooserController *)self notifyDelegate];
  }
}

- (void)updateRecurrenceRuleBuilder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setDays:", -[EKRecurrenceWeekdayChooserController _dayMask](self, "_dayMask"));
}

- (void)updateFromRecurrenceRule:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 daysOfTheWeek];

  if (v5)
  {
    uint64_t v6 = [v4 daysOfTheWeek];
    [(EKRecurrenceWeekdayChooserController *)self setDaysOfTheWeek:v6];
  }
  else
  {
    uint64_t v6 = [(EKRecurrenceChooserController *)self startDateComponents:512];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F255D8], "dayOfWeek:", objc_msgSend(v6, "weekday"));
    v9[0] = v7;
    int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [(EKRecurrenceWeekdayChooserController *)self setDaysOfTheWeek:v8];
  }
}

- (void)_setCell:(id)a3 selected:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 0;
  }
  [a3 setAccessoryType:v5];
}

- (int)_dayMask
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(EKRecurrenceWeekdayChooserController *)self daysOfTheWeek];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= +[EKRecurrenceChooserController dayFromNumber:](EKRecurrenceChooserController, "dayFromNumber:", [*(id *)(*((void *)&v9 + 1) + 8 * i) dayOfTheWeek]);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (NSMutableArray)cells
{
  return self->_cells;
}

- (void)setCells:(id)a3
{
}

- (NSArray)daysOfTheWeek
{
  return self->_daysOfTheWeek;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daysOfTheWeek, 0);
  objc_storeStrong((id *)&self->_cells, 0);

  objc_storeStrong((id *)&self->_selectedDays, 0);
}

@end