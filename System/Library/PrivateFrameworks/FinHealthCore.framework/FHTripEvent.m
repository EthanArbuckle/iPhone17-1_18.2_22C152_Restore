@interface FHTripEvent
- (FHTripEvent)initWithPPTripEvent:(id)a3;
- (NSArray)tripParts;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)title;
- (id)description;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTripParts:(id)a3;
@end

@implementation FHTripEvent

- (FHTripEvent)initWithPPTripEvent:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FHTripEvent;
  v5 = [(FHTripEvent *)&v22 init];
  if (v5)
  {
    v6 = [v4 title];
    [(FHTripEvent *)v5 setTitle:v6];

    v7 = [v4 startDate];
    [(FHTripEvent *)v5 setStartDate:v7];

    v8 = [v4 endDate];
    [(FHTripEvent *)v5 setEndDate:v8];

    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v10 = objc_msgSend(v4, "tripParts", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [[FHTripPart alloc] initWithPPTripPart:*(void *)(*((void *)&v18 + 1) + 8 * v14)];
          [v9 addObject:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v12);
    }

    v16 = (void *)[v9 copy];
    [(FHTripEvent *)v5 setTripParts:v16];
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%@'; ", @"title", self->_title];
  [v3 appendFormat:@"%@: '%@'; ", @"startDate", self->_startDate];
  [v3 appendFormat:@"%@: '%@'; ", @"endDate", self->_endDate];
  [v3 appendFormat:@"%@: '%@'; ", @"tripParts", self->_tripParts];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSArray)tripParts
{
  return self->_tripParts;
}

- (void)setTripParts:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_tripParts, 0);
}

@end