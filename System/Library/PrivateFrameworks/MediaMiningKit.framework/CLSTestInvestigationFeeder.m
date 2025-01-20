@interface CLSTestInvestigationFeeder
+ (void)initialize;
- (CLSTestInvestigationFeeder)initWithItems:(id)a3;
- (id)allItems;
- (id)approximateLocation;
- (id)itemAtIndex:(unint64_t)a3;
- (id)localEndDate;
- (id)localEndDateComponents;
- (id)localStartDate;
- (id)localStartDateComponents;
- (id)universalEndDate;
- (id)universalStartDate;
- (unint64_t)numberOfItems;
- (void)enumerateItemsUsingBlock:(id)a3;
- (void)enumerateItemsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
@end

@implementation CLSTestInvestigationFeeder

- (void).cxx_destruct
{
}

- (void)enumerateItemsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
}

- (void)enumerateItemsUsingBlock:(id)a3
{
}

- (id)itemAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_items objectAtIndex:a3];
}

- (id)allItems
{
  return self->_items;
}

- (id)approximateLocation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_items;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "clsLocation", (void)v10);
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (id)universalEndDate
{
  v2 = [(NSArray *)self->_items lastObject];
  uint64_t v3 = objc_msgSend(v2, "cls_universalDate");

  return v3;
}

- (id)universalStartDate
{
  v2 = [(NSArray *)self->_items firstObject];
  uint64_t v3 = objc_msgSend(v2, "cls_universalDate");

  return v3;
}

- (id)localEndDate
{
  v2 = [(NSArray *)self->_items lastObject];
  uint64_t v3 = objc_msgSend(v2, "cls_localDate");

  return v3;
}

- (id)localStartDate
{
  v2 = [(NSArray *)self->_items firstObject];
  uint64_t v3 = objc_msgSend(v2, "cls_localDate");

  return v3;
}

- (id)localEndDateComponents
{
  v2 = [(NSArray *)self->_items lastObject];
  uint64_t v3 = objc_msgSend(v2, "cls_localDateComponents");

  return v3;
}

- (id)localStartDateComponents
{
  v2 = [(NSArray *)self->_items firstObject];
  uint64_t v3 = objc_msgSend(v2, "cls_localDateComponents");

  return v3;
}

- (unint64_t)numberOfItems
{
  return [(NSArray *)self->_items count];
}

- (CLSTestInvestigationFeeder)initWithItems:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSTestInvestigationFeeder;
  uint64_t v5 = [(CLSInvestigationFeeder *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 sortedArrayUsingComparator:&__block_literal_global_3524];
    items = v5->_items;
    v5->_items = (NSArray *)v6;
  }
  return v5;
}

uint64_t __44__CLSTestInvestigationFeeder_initWithItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a2, "cls_universalDate");
  uint64_t v6 = objc_msgSend(v4, "cls_universalDate");

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sCurationModel = [objc_alloc(MEMORY[0x1E4F8E770]) initForTesting];
    MEMORY[0x1F41817F8]();
  }
}

@end