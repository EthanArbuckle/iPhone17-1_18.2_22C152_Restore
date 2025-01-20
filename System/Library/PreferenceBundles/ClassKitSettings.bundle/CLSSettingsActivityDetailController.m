@interface CLSSettingsActivityDetailController
- (CLSActivity)userActivity;
- (NSMutableDictionary)activityItemsByID;
- (double)progressValueWithActivity:(id)a3;
- (id)activityWithID:(id)a3;
- (id)allActivityItemsOfActivity:(id)a3;
- (id)binaryValue:(id)a3;
- (id)createSpecifiersWithActivityItem:(id)a3;
- (id)percentageNumberFormatter;
- (id)percentageStringWithProgress:(double)a3;
- (id)progressValueString:(id)a3;
- (id)quantityValue:(id)a3;
- (id)scoreValue:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)timeSpentFormatter;
- (id)timeValue:(id)a3;
- (void)setActivityItemsByID:(id)a3;
- (void)setUserActivity:(id)a3;
@end

@implementation CLSSettingsActivityDetailController

- (id)specifiers
{
  v2 = self;
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = [(CLSSettingsActivityDetailController *)v2 specifier];
    v7 = [v6 propertyForKey:@"CLSSettingsSpecifierActivityID"];

    v8 = [(CLSSettingsActivityDetailController *)v2 activityWithID:v7];
    [(CLSSettingsActivityDetailController *)v2 setUserActivity:v8];

    v9 = [(CLSSettingsActivityDetailController *)v2 userActivity];

    if (v9)
    {
      v10 = [(CLSSettingsActivityDetailController *)v2 activityItemsByID];
      [v10 removeAllObjects];

      v51 = v7;
      v50 = +[PSSpecifier groupSpecifierWithID:v7];
      objc_msgSend(v5, "addObject:");
      v11 = [(CLSSettingsActivityDetailController *)v2 userActivity];
      [(CLSSettingsActivityDetailController *)v2 progressValueWithActivity:v11];
      double v13 = v12;

      if (v13 > 0.00000011920929)
      {
        v14 = +[NSBundle bundleForClass:objc_opt_class()];
        v15 = [v14 localizedStringForKey:@"Progress" value:&stru_C6A8 table:@"ClassKitSettings"];
        v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:v2 set:0 get:"progressValueString:" detail:0 cell:4 edit:0];

        [v5 addObject:v16];
      }
      v17 = +[NSBundle bundleForClass:objc_opt_class()];
      v18 = [v17 localizedStringForKey:@"Time" value:&stru_C6A8 table:@"ClassKitSettings"];
      uint64_t v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:v2 set:0 get:"timeValue:" detail:0 cell:4 edit:0];

      v49 = (void *)v19;
      [v5 addObject:v19];
      v20 = [(CLSSettingsActivityDetailController *)v2 userActivity];
      v21 = [(CLSSettingsActivityDetailController *)v2 allActivityItemsOfActivity:v20];

      v22 = [(CLSSettingsActivityDetailController *)v2 userActivity];
      v55 = [v22 primaryActivityItemIdentifier];

      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id obj = v21;
      id v23 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
      if (v23)
      {
        id v24 = v23;
        v56 = 0;
        uint64_t v25 = *(void *)v66;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v66 != v25) {
              objc_enumerationMutation(obj);
            }
            v27 = *(void **)(*((void *)&v65 + 1) + 8 * i);
            v28 = [(CLSSettingsActivityDetailController *)v2 activityItemsByID];
            v29 = [v27 objectID];
            [v28 setObject:v27 forKeyedSubscript:v29];

            v30 = [v27 identifier];
            LODWORD(v29) = [v55 isEqualToString:v30];

            if (v29)
            {
              id v31 = v27;

              v56 = v31;
            }
          }
          id v24 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
        }
        while (v24);
      }
      else
      {
        v56 = 0;
      }

      if ([obj count])
      {
        uint64_t v48 = v3;
        v47 = +[PSSpecifier groupSpecifierWithID:@"ACTIVITY_ITEMS"];
        objc_msgSend(v5, "addObject:");
        if (v56)
        {
          v32 = -[CLSSettingsActivityDetailController createSpecifiersWithActivityItem:](v2, "createSpecifiersWithActivityItem:");
          [v5 addObjectsFromArray:v32];
        }
        v33 = [(CLSSettingsActivityDetailController *)v2 userActivity];
        v34 = [v33 additionalActivityItems];

        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v52 = v34;
        id v35 = [v52 countByEnumeratingWithState:&v61 objects:v70 count:16];
        if (v35)
        {
          id v36 = v35;
          uint64_t v54 = *(void *)v62;
          uint64_t v37 = PSCellClassKey;
          do
          {
            for (j = 0; j != v36; j = (char *)j + 1)
            {
              if (*(void *)v62 != v54) {
                objc_enumerationMutation(v52);
              }
              v39 = v2;
              v40 = [(CLSSettingsActivityDetailController *)v2 createSpecifiersWithActivityItem:*(void *)(*((void *)&v61 + 1) + 8 * (void)j)];
              long long v57 = 0u;
              long long v58 = 0u;
              long long v59 = 0u;
              long long v60 = 0u;
              id v41 = [v40 countByEnumeratingWithState:&v57 objects:v69 count:16];
              if (v41)
              {
                id v42 = v41;
                uint64_t v43 = *(void *)v58;
                do
                {
                  for (k = 0; k != v42; k = (char *)k + 1)
                  {
                    if (*(void *)v58 != v43) {
                      objc_enumerationMutation(v40);
                    }
                    [*(id *)(*((void *)&v57 + 1) + 8 * (void)k) setProperty:objc_opt_class() forKey:v37];
                  }
                  id v42 = [v40 countByEnumeratingWithState:&v57 objects:v69 count:16];
                }
                while (v42);
              }
              [v5 addObjectsFromArray:v40];

              v2 = v39;
            }
            id v36 = [v52 countByEnumeratingWithState:&v61 objects:v70 count:16];
          }
          while (v36);
        }

        uint64_t v3 = v48;
      }

      v7 = v51;
    }
    v45 = *(void **)&v2->PSListController_opaque[v3];
    *(void *)&v2->PSListController_opaque[v3] = v5;

    v4 = *(void **)&v2->PSListController_opaque[v3];
  }

  return v4;
}

- (id)createSpecifiersWithActivityItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = &selRef_scoreValue_;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = &selRef_quantityValue_;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_8;
      }
      v6 = &selRef_binaryValue_;
    }
  }
  v7 = *v6;
  v8 = [v4 title];
  v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:v7 detail:0 cell:4 edit:0];

  v10 = [v4 objectID];
  [v9 setProperty:v10 forKey:@"CLSSettingsActivityItemIDKey"];

  [v5 addObject:v9];
LABEL_8:

  return v5;
}

- (NSMutableDictionary)activityItemsByID
{
  activityItemsByID = self->_activityItemsByID;
  if (!activityItemsByID)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v5 = self->_activityItemsByID;
    self->_activityItemsByID = v4;

    activityItemsByID = self->_activityItemsByID;
  }

  return activityItemsByID;
}

- (id)activityWithID:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v12 = 0;
    double v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = sub_7830;
    v16 = sub_7840;
    id v17 = 0;
    id v4 = +[NSPredicate predicateWithFormat:@"objectID = %@", v3];
    id v11 = 0;
    id v5 = +[CLSQuery queryWithObjectType:objc_opt_class() predicate:v4 error:&v11];
    id v6 = v11;
    v7 = +[CLSDataStore shared];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_7848;
    v10[3] = &unk_C548;
    v10[4] = &v12;
    [v7 awaitExecuteQuery:v5 completion:v10];

    id v8 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)allActivityItemsOfActivity:(id)a3
{
  id v3 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_7830;
  id v31 = sub_7840;
  id v32 = objc_alloc_init((Class)NSMutableArray);
  if (v3)
  {
    id v4 = [v3 objectID];
    id v5 = +[NSPredicate predicateWithFormat:@"parentObjectID = %@", v4];

    id v6 = +[NSSortDescriptor sortDescriptorWithKey:@"dateCreated" ascending:1];
    id v26 = 0;
    v7 = +[CLSQuery queryWithObjectType:objc_opt_class() predicate:v5 error:&v26];
    id v8 = v26;
    id v35 = v6;
    v9 = +[NSArray arrayWithObjects:&v35 count:1];
    [v7 setSortDescriptors:v9];

    v10 = +[CLSDataStore shared];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_7CC4;
    v25[3] = &unk_C548;
    v25[4] = &v27;
    [v10 awaitExecuteQuery:v7 completion:v25];

    id v24 = v8;
    id v11 = +[CLSQuery queryWithObjectType:objc_opt_class() predicate:v5 error:&v24];
    id v12 = v24;

    v34 = v6;
    double v13 = +[NSArray arrayWithObjects:&v34 count:1];
    [v11 setSortDescriptors:v13];

    uint64_t v14 = +[CLSDataStore shared];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_7CE0;
    v23[3] = &unk_C548;
    v23[4] = &v27;
    [v14 awaitExecuteQuery:v11 completion:v23];

    id v22 = v12;
    v15 = +[CLSQuery queryWithObjectType:objc_opt_class() predicate:v5 error:&v22];
    id v16 = v22;

    v33 = v6;
    id v17 = +[NSArray arrayWithObjects:&v33 count:1];
    [v15 setSortDescriptors:v17];

    v18 = +[CLSDataStore shared];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_7CFC;
    v21[3] = &unk_C548;
    v21[4] = &v27;
    [v18 awaitExecuteQuery:v15 completion:v21];
  }
  id v19 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v19;
}

- (id)percentageStringWithProgress:(double)a3
{
  id v4 = [(CLSSettingsActivityDetailController *)self percentageNumberFormatter];
  id v5 = +[NSNumber numberWithDouble:a3];
  id v6 = [v4 stringFromNumber:v5];

  return v6;
}

- (id)percentageNumberFormatter
{
  if (qword_10BE0 != -1) {
    dispatch_once(&qword_10BE0, &stru_C568);
  }
  v2 = (void *)qword_10BD8;

  return v2;
}

- (id)timeSpentFormatter
{
  if (qword_10BF0 != -1) {
    dispatch_once(&qword_10BF0, &stru_C588);
  }
  v2 = (void *)qword_10BE8;

  return v2;
}

- (double)progressValueWithActivity:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  [a3 progress];
  if (result < 0.00000011920929) {
    return 0.0;
  }
  return result;
}

- (id)progressValueString:(id)a3
{
  id v4 = [(CLSSettingsActivityDetailController *)self userActivity];
  [(CLSSettingsActivityDetailController *)self progressValueWithActivity:v4];
  double v6 = v5;

  return [(CLSSettingsActivityDetailController *)self percentageStringWithProgress:v6];
}

- (id)timeValue:(id)a3
{
  id v4 = [(CLSSettingsActivityDetailController *)self userActivity];

  if (v4)
  {
    double v5 = [(CLSSettingsActivityDetailController *)self userActivity];
    [v5 duration];
    double v7 = v6;

    if (v7 < 0.00000011920929) {
      double v7 = 0.0;
    }
    id v8 = [(CLSSettingsActivityDetailController *)self timeSpentFormatter];
    v9 = [v8 stringFromTimeInterval:v7];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)scoreValue:(id)a3
{
  id v4 = a3;
  double v5 = [(CLSSettingsActivityDetailController *)self userActivity];

  if (v5)
  {
    double v6 = [v4 propertyForKey:@"CLSSettingsActivityItemIDKey"];
    if (v6)
    {
      double v7 = [(CLSSettingsActivityDetailController *)self activityItemsByID];
      id v8 = [v7 objectForKeyedSubscript:v6];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;
        [v9 maxScore];
        if (v10 >= 0.00000011920929)
        {
          [v9 score];
          double v14 = v13;
          [v9 maxScore];
          id v12 = [(CLSSettingsActivityDetailController *)self percentageStringWithProgress:v14 / v15];
        }
        else
        {
          [v9 score];
          id v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          id v12 = [v11 stringValue];
        }
      }
      else
      {
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)quantityValue:(id)a3
{
  id v4 = a3;
  double v5 = [(CLSSettingsActivityDetailController *)self userActivity];

  if (v5)
  {
    double v6 = [v4 propertyForKey:@"CLSSettingsActivityItemIDKey"];
    if (v6)
    {
      double v7 = [(CLSSettingsActivityDetailController *)self activityItemsByID];
      id v8 = [v7 objectForKeyedSubscript:v6];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v8 quantity];
        id v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        double v10 = [v9 stringValue];
      }
      else
      {
        double v10 = 0;
      }
    }
    else
    {
      double v10 = 0;
    }
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (id)binaryValue:(id)a3
{
  id v4 = a3;
  double v5 = [(CLSSettingsActivityDetailController *)self userActivity];

  if (v5)
  {
    double v6 = [v4 propertyForKey:@"CLSSettingsActivityItemIDKey"];
    if (v6)
    {
      double v7 = [(CLSSettingsActivityDetailController *)self activityItemsByID];
      id v8 = [v7 objectForKeyedSubscript:v6];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;
        switch((unint64_t)[v9 valueType])
        {
          case 0uLL:
            unsigned __int8 v10 = [v9 value];
            id v11 = +[NSBundle bundleForClass:objc_opt_class()];
            if (v10) {
              CFStringRef v12 = @"True";
            }
            else {
              CFStringRef v12 = @"False";
            }
            goto LABEL_21;
          case 1uLL:
            unsigned __int8 v16 = [v9 value];
            id v11 = +[NSBundle bundleForClass:objc_opt_class()];
            if (v16) {
              CFStringRef v12 = @"Pass";
            }
            else {
              CFStringRef v12 = @"Not Yet";
            }
            goto LABEL_21;
          case 2uLL:
            unsigned __int8 v14 = [v9 value];
            id v11 = +[NSBundle bundleForClass:objc_opt_class()];
            if (v14) {
              CFStringRef v12 = @"Yes";
            }
            else {
              CFStringRef v12 = @"No";
            }
            goto LABEL_21;
          case 3uLL:
            unsigned __int8 v15 = [v9 value];
            id v11 = +[NSBundle bundleForClass:objc_opt_class()];
            if (v15) {
              CFStringRef v12 = @"Correct";
            }
            else {
              CFStringRef v12 = @"Incorrect";
            }
LABEL_21:
            double v13 = [v11 localizedStringForKey:v12 value:&stru_C6A8 table:@"ClassKitSettings"];

            break;
          default:
            double v13 = 0;
            break;
        }
      }
      else
      {
        double v13 = 0;
      }
    }
    else
    {
      double v13 = 0;
    }
  }
  else
  {
    double v13 = 0;
  }

  return v13;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CLSSettingsActivityDetailController;
  id v4 = [(CLSSettingsActivityDetailController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  double v5 = [v4 textLabel];
  [v5 setNumberOfLines:0];

  return v4;
}

- (CLSActivity)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(id)a3
{
}

- (void)setActivityItemsByID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityItemsByID, 0);

  objc_storeStrong((id *)&self->_userActivity, 0);
}

@end