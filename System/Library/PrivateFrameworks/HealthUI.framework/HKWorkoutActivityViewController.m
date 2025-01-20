@interface HKWorkoutActivityViewController
- (HKDisplayTypeController)displayTypeController;
- (HKHealthStore)healthStore;
- (HKUnitPreferenceController)unitPreferenceController;
- (HKWorkout)workout;
- (HKWorkoutActivity)activity;
- (HKWorkoutActivityViewController)initWithWorkout:(id)a3 activity:(id)a4 displayTypeController:(id)a5 unitController:(id)a6 healthStore:(id)a7;
- (NSMutableArray)sections;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)defaultPredicateForSampleType:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)unitController;
- (id)viewControllerForSampleSelected:(id)a3;
- (id)viewControllerForSampleType:(id)a3 subSamplePredicate:(id)a4 title:(id)a5;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addSectionIfNotNil:(id)a3;
- (void)_loadSections;
- (void)finishedAggregateQuery;
- (void)setActivity:(id)a3;
- (void)setDisplayTypeController:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setSections:(id)a3;
- (void)setUnitPreferenceController:(id)a3;
- (void)setWorkout:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation HKWorkoutActivityViewController

- (HKWorkoutActivityViewController)initWithWorkout:(id)a3 activity:(id)a4 displayTypeController:(id)a5 unitController:(id)a6 healthStore:(id)a7
{
  id v27 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)HKWorkoutActivityViewController;
  v17 = [(HKTableViewController *)&v28 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_workout, a3);
    objc_storeStrong((id *)&v18->_activity, a4);
    objc_storeStrong((id *)&v18->_displayTypeController, a5);
    objc_storeStrong((id *)&v18->_unitPreferenceController, a6);
    objc_storeStrong((id *)&v18->_healthStore, a7);
    v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v20 = (void *)MEMORY[0x1E4F2B718];
    v21 = [v13 workoutConfiguration];
    v22 = objc_msgSend(v20, "_stringFromWorkoutActivityType:", objc_msgSend(v21, "activityType"));
    v23 = [v19 localizedStringForKey:v22 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

    [(HKWorkoutActivityViewController *)v18 setTitle:v23];
    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sections = v18->_sections;
    v18->_sections = v24;

    [(HKWorkoutActivityViewController *)v18 _loadSections];
  }

  return v18;
}

- (void)_addSectionIfNotNil:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self->_sections, "addObject:");
  }
}

- (void)finishedAggregateQuery
{
  id v2 = [(HKWorkoutActivityViewController *)self tableView];
  [v2 reloadData];
}

- (id)defaultPredicateForSampleType:(id)a3
{
  return 0;
}

- (id)viewControllerForSampleType:(id)a3 subSamplePredicate:(id)a4 title:(id)a5
{
  return 0;
}

- (id)viewControllerForSampleSelected:(id)a3
{
  id v4 = a3;
  v5 = [[HKDataMetadataViewController alloc] initWithSample:v4 usingInsetStyling:1 profileName:0 delegate:self];

  return v5;
}

- (id)unitController
{
  return self->_unitPreferenceController;
}

- (void)_loadSections
{
  [(NSMutableArray *)self->_sections removeAllObjects];
  v3 = [[HKDataMetadataDetailSection alloc] initWithWorkoutActivity:self->_activity displayTypeController:self->_displayTypeController unitController:self->_unitPreferenceController];
  [(HKWorkoutActivityViewController *)self _addSectionIfNotNil:v3];

  id v4 = [HKDataMetadataSubsampleSection alloc];
  v5 = [(HKDataMetadataSubsampleSection *)v4 initWithSample:self->_workout workoutActivity:self->_activity subSampleTypes:MEMORY[0x1E4F1CBF0] showOnlyExertion:1 healthStore:self->_healthStore displayTypeController:self->_displayTypeController unitController:self->_unitPreferenceController subsampleDelegate:self];
  [(HKWorkoutActivityViewController *)self _addSectionIfNotNil:v5];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSMutableArray *)self->_sections count];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = [(NSMutableArray *)self->_sections objectAtIndex:a4];
  v5 = [v4 sectionTitle];

  return v5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(NSMutableArray *)self->_sections objectAtIndex:a4];
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

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", [v6 section]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 row];

  v8 = [(HKWorkoutActivityViewController *)self navigationController];
  [v9 selectCellForIndex:v7 navigationController:v8 animated:1];
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (HKWorkout)workout
{
  return self->_workout;
}

- (void)setWorkout:(id)a3
{
}

- (HKWorkoutActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (void)setDisplayTypeController:(id)a3
{
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (void)setUnitPreferenceController:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_workout, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end