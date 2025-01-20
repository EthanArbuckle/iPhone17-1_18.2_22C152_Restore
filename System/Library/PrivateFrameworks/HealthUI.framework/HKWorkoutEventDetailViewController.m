@interface HKWorkoutEventDetailViewController
- (HKWorkoutEvent)event;
- (HKWorkoutEventDetailViewController)initWithEvent:(id)a3;
- (NSMutableArray)sections;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addSectionIfNotNil:(id)a3;
- (void)_loadSections;
- (void)setEvent:(id)a3;
- (void)setSections:(id)a3;
@end

@implementation HKWorkoutEventDetailViewController

- (HKWorkoutEventDetailViewController)initWithEvent:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKWorkoutEventDetailViewController;
  v6 = [(HKTableViewController *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_event, a3);
    v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    [(HKWorkoutEvent *)v7->_event type];
    v9 = _HKWorkoutEventTypeName();
    v10 = [v8 localizedStringForKey:v9 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [(HKWorkoutEventDetailViewController *)v7 setTitle:v10];

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sections = v7->_sections;
    v7->_sections = v11;

    [(HKWorkoutEventDetailViewController *)v7 _loadSections];
  }

  return v7;
}

- (void)_addSectionIfNotNil:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self->_sections, "addObject:");
  }
}

- (void)_loadSections
{
  [(NSMutableArray *)self->_sections removeAllObjects];
  v3 = [[HKDataMetadataDetailSection alloc] initWithWorkoutEvent:self->_event];
  [(HKWorkoutEventDetailViewController *)self _addSectionIfNotNil:v3];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSMutableArray *)self->_sections count];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v4 = [(NSMutableArray *)self->_sections objectAtIndex:a4];
  id v5 = [v4 sectionTitle];

  return v5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(NSMutableArray *)self->_sections objectAtIndex:a4];
  int64_t v5 = [v4 numberOfRowsInSection];

  return v5;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 50.0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", [v6 section]);
  uint64_t v9 = [v6 row];

  v10 = [v8 cellForIndex:v9 tableView:v7];

  return v10;
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (HKWorkoutEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end