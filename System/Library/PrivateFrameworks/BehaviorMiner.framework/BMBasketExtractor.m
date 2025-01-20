@interface BMBasketExtractor
- (BMBasketExtractor)initWithSamplingInterval:(double)a3;
- (BOOL)shouldStop;
- (double)samplingInterval;
- (id)extractBasketsFromEvents:(id)a3 itemTypes:(id)a4;
- (id)extractBasketsFromEvents:(id)a3 withTemporalFeatures:(BOOL)a4;
- (id)extractDatedBasketsFromEvents:(id)a3 itemTypes:(id)a4;
- (id)extractTemporalItemsFromDate:(id)a3;
- (id)slotForHourOfDay:(id)a3;
- (id)slotForHourOfDay:(id)a3 slotDuration:(id)a4;
- (void)setShouldStop:(BOOL)a3;
- (void)terminateEarly;
@end

@implementation BMBasketExtractor

- (BMBasketExtractor)initWithSamplingInterval:(double)a3
{
  if (a3 >= 0.0)
  {
    v7.receiver = self;
    v7.super_class = (Class)BMBasketExtractor;
    v5 = [(BMBasketExtractor *)&v7 init];
    if (v5)
    {
      v5->_samplingInterval = a3;
      v5->_shouldStop = 0;
    }
    self = v5;
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)terminateEarly
{
}

- (id)slotForHourOfDay:(id)a3
{
  return [(BMBasketExtractor *)self slotForHourOfDay:a3 slotDuration:&unk_26D1C7E38];
}

- (id)slotForHourOfDay:(id)a3 slotDuration:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 integerValue];
  uint64_t v7 = [v5 integerValue];

  v8 = NSNumber;

  return (id)[v8 numberWithUnsignedInteger:v6 / v7];
}

- (id)extractTemporalItemsFromDate:(id)a3
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)extractBasketsFromEvents:(id)a3 withTemporalFeatures:(BOOL)a4
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)extractBasketsFromEvents:(id)a3 itemTypes:(id)a4
{
  v4 = [(BMBasketExtractor *)self extractDatedBasketsFromEvents:a3 itemTypes:a4];
  id v5 = [v4 valueForKey:@"basket"];

  return v5;
}

- (id)extractDatedBasketsFromEvents:(id)a3 itemTypes:(id)a4
{
  v84[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![v6 count])
  {
    id v66 = (id)MEMORY[0x263EFFA68];
    goto LABEL_39;
  }
  v8 = [MEMORY[0x263EFF980] array];
  v69 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"startDate" ascending:1];
  v84[0] = v69;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:1];
  id v70 = v6;
  v10 = [v6 sortedArrayUsingDescriptors:v9];

  v11 = [v10 objectAtIndexedSubscript:0];
  v12 = [v11 startDate];

  v74 = self;
  v13 = self;
  v14 = v10;
  [(BMBasketExtractor *)v13 samplingInterval];
  v78 = objc_msgSend(v12, "dateByAddingTimeInterval:");
  [MEMORY[0x263EFF8F0] currentCalendar];
  v73 = id v72 = v7;
  unint64_t v15 = 0x263EFF000uLL;
  v71 = v8;
  v68 = v10;
  while (1)
  {
    v16 = [*(id *)(v15 + 2496) set];
    id v17 = v12;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v18 = v14;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v79 objects:v83 count:16];
    if (v19) {
      break;
    }
    char v77 = 0;
    v12 = v17;
LABEL_30:

    if ([v16 count])
    {
      v64 = BMTemporalItemsForDate(v17, v73, v7);
      if ([v64 count]) {
        [v16 unionSet:v64];
      }
      v65 = [[BMDatedBasket alloc] initWithBasket:v16 Date:v17];
      [v8 addObject:v65];
    }
    unint64_t v15 = 0x263EFF000;
    if (v77)
    {
      id v66 = v8;
      id v17 = v12;
      goto LABEL_37;
    }
  }
  uint64_t v20 = v19;
  char v77 = 0;
  v75 = v16;
  uint64_t v76 = *(void *)v80;
  v21 = v74;
LABEL_5:
  uint64_t v22 = 0;
  while (1)
  {
    if (*(void *)v80 != v76) {
      objc_enumerationMutation(v18);
    }
    v23 = *(void **)(*((void *)&v79 + 1) + 8 * v22);
    if ([(BMBasketExtractor *)v21 shouldStop]) {
      break;
    }
    v24 = [v23 startDate];
    [v24 timeIntervalSince1970];
    double v26 = v25;
    [v17 timeIntervalSince1970];
    if (v26 >= v27)
    {
      v28 = [v23 startDate];
      [v28 timeIntervalSince1970];
      double v30 = v29;
      [v78 timeIntervalSince1970];
      double v32 = v31;

      v16 = v75;
      if (v30 < v32) {
        goto LABEL_22;
      }
    }
    else
    {
    }
    v33 = [v23 endDate];
    [v33 timeIntervalSince1970];
    double v35 = v34;
    [v17 timeIntervalSince1970];
    if (v35 <= v36) {
      goto LABEL_15;
    }
    v37 = [v23 endDate];
    [v37 timeIntervalSince1970];
    double v39 = v38;
    [v78 timeIntervalSince1970];
    if (v39 > v40)
    {

      v16 = v75;
LABEL_15:

      goto LABEL_16;
    }
    v55 = [v23 startDate];
    v56 = [v23 endDate];
    char v57 = [v55 isEqualToDate:v56];

    v21 = v74;
    v16 = v75;
    if ((v57 & 1) == 0)
    {
LABEL_22:
      v58 = [v23 item];
      [v16 addObject:v58];

      goto LABEL_23;
    }
LABEL_16:
    v41 = [v23 startDate];
    [v41 timeIntervalSince1970];
    double v43 = v42;
    [v17 timeIntervalSince1970];
    if (v43 <= v44)
    {
      v45 = [v23 endDate];
      [v45 timeIntervalSince1970];
      double v47 = v46;
      [v78 timeIntervalSince1970];
      double v49 = v48;

      if (v47 >= v49) {
        goto LABEL_22;
      }
    }
    else
    {
    }
    v50 = [v23 startDate];
    [v50 timeIntervalSince1970];
    double v52 = v51;
    [v78 timeIntervalSince1970];
    double v54 = v53;

    if (v52 >= v54)
    {
      v12 = [v23 startDate];

      [(BMBasketExtractor *)v21 samplingInterval];
      uint64_t v63 = objc_msgSend(v12, "dateByAddingTimeInterval:");

      v78 = (void *)v63;
LABEL_29:
      v8 = v71;
      id v7 = v72;
      v14 = v68;
      goto LABEL_30;
    }
LABEL_23:
    v59 = objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v18, "count") - 1);
    int v60 = [v23 isEqual:v59];

    if (v60)
    {
      v61 = [v23 item];
      char v62 = [v16 containsObject:v61];

      v77 |= v62;
    }
    if (v20 == ++v22)
    {
      uint64_t v20 = [v18 countByEnumeratingWithState:&v79 objects:v83 count:16];
      if (v20) {
        goto LABEL_5;
      }
      v12 = v17;
      goto LABEL_29;
    }
  }

  id v66 = (id)MEMORY[0x263EFFA68];
  v8 = v71;
  id v7 = v72;
LABEL_37:

  id v6 = v70;
LABEL_39:

  return v66;
}

- (double)samplingInterval
{
  return self->_samplingInterval;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

@end