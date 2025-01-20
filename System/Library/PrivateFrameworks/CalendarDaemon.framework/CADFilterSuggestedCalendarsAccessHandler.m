@interface CADFilterSuggestedCalendarsAccessHandler
- (CADFilterSuggestedCalendarsAccessHandler)initWithDatabaseDataProvider:(id)a3 permissionValidator:(id)a4;
- (CADPermissionValidator)permissionValidator;
- (void)gatherRestrictedCalendarRowIDs:(id)a3 forAction:(unint64_t)a4 inDatabase:(CalDatabase *)a5;
@end

@implementation CADFilterSuggestedCalendarsAccessHandler

- (void)gatherRestrictedCalendarRowIDs:(id)a3 forAction:(unint64_t)a4 inDatabase:(CalDatabase *)a5
{
  id v14 = a3;
  v7 = [(CADFilterSuggestedCalendarsAccessHandler *)self permissionValidator];
  if ([v7 canModifySuggestedEventCalendar])
  {
    BOOL v8 = +[CADFeatureSet isSuggestionsEnabled];

    if (v8) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  v9 = [(CADAccountAccessHandler *)self dataProvider];
  uint64_t v10 = [v9 suggestionsCalendarRowIDInDatabase:a5];
  if ((int)v10 >= 1)
  {
    v11 = [MEMORY[0x1E4F28ED0] numberWithInt:v10];
    [v14 addObject:v11];
  }
  uint64_t v12 = [v9 naturalLanguageSuggestionsCalendarRowIDInDatabase:a5];
  if ((int)v12 >= 1)
  {
    v13 = [MEMORY[0x1E4F28ED0] numberWithInt:v12];
    [v14 addObject:v13];
  }
LABEL_10:
}

- (CADPermissionValidator)permissionValidator
{
  return self->_permissionValidator;
}

- (CADFilterSuggestedCalendarsAccessHandler)initWithDatabaseDataProvider:(id)a3 permissionValidator:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CADFilterSuggestedCalendarsAccessHandler;
  BOOL v8 = [(CADAccountAccessHandler *)&v11 initWithDatabaseDataProvider:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_permissionValidator, a4);
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end