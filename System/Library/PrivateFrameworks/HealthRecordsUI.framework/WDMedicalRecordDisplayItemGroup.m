@interface WDMedicalRecordDisplayItemGroup
+ (id)displayItemGroupWithDaySummary:(id)a3;
+ (id)displayItemGroupWithDisplayItems:(id)a3;
- (HKSource)source;
- (NSArray)items;
- (NSString)subtitle;
- (NSString)title;
- (WDMedicalRecordDaySummary)daySummary;
- (id)displayItemAtIndex:(int64_t)a3;
- (int64_t)numberOfDisplayItems;
- (void)setDaySummary:(id)a3;
- (void)setItems:(id)a3;
- (void)setSource:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation WDMedicalRecordDisplayItemGroup

+ (id)displayItemGroupWithDaySummary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(WDMedicalRecordDisplayItemGroup);
  [(WDMedicalRecordDisplayItemGroup *)v4 setDaySummary:v3];

  return v4;
}

+ (id)displayItemGroupWithDisplayItems:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(WDMedicalRecordDisplayItemGroup);
  v5 = (void *)[v3 copy];

  [(WDMedicalRecordDisplayItemGroup *)v4 setItems:v5];
  return v4;
}

- (id)displayItemAtIndex:(int64_t)a3
{
  v5 = [(WDMedicalRecordDisplayItemGroup *)self daySummary];

  if (v5)
  {
    v6 = [(WDMedicalRecordDisplayItemGroup *)self daySummary];
    [v6 displayItemAtIndex:a3];
  }
  else
  {
    v6 = [(WDMedicalRecordDisplayItemGroup *)self items];
    [v6 objectAtIndexedSubscript:a3];
  v7 = };

  return v7;
}

- (int64_t)numberOfDisplayItems
{
  id v3 = [(WDMedicalRecordDisplayItemGroup *)self daySummary];

  if (v3)
  {
    v4 = [(WDMedicalRecordDisplayItemGroup *)self daySummary];
    uint64_t v5 = [v4 numberOfDisplayItems];
  }
  else
  {
    v4 = [(WDMedicalRecordDisplayItemGroup *)self items];
    uint64_t v5 = [v4 count];
  }
  int64_t v6 = v5;

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (HKSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (WDMedicalRecordDaySummary)daySummary
{
  return self->_daySummary;
}

- (void)setDaySummary:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_daySummary, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end