@interface ASFriendListSection
- (ASFriendListSection)initWithDate:(id)a3 andRows:(id)a4;
- (BOOL)containsFriendListRow:(id)a3;
- (NSArray)rows;
- (NSDate)endDate;
- (NSDate)startDate;
- (void)setRows:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation ASFriendListSection

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSArray)rows
{
  return self->_rows;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (ASFriendListSection)initWithDate:(id)a3 andRows:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ASFriendListSection;
  v8 = [(ASFriendListSection *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(ASFriendListSection *)v8 setStartDate:v6];
    [(ASFriendListSection *)v9 setRows:v7];
  }

  return v9;
}

- (void)setStartDate:(id)a3
{
}

- (void)setRows:(id)a3
{
}

- (BOOL)containsFriendListRow:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(ASFriendListSection *)self rows];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([v4 isEqual:*(void *)(*((void *)&v10 + 1) + 8 * i)])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSDate)endDate
{
  if (self->_startDate)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v3 setDay:1];
    [v3 setSecond:-1];
    id v4 = [MEMORY[0x263EFF8F0] currentCalendar];
    v5 = [v4 dateByAddingComponents:v3 toDate:self->_startDate options:0];
  }
  else
  {
    v5 = 0;
  }
  return (NSDate *)v5;
}

@end