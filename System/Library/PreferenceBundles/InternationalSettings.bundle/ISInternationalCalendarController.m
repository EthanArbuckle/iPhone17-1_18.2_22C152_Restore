@interface ISInternationalCalendarController
- (ISInternationalCalendarController)init;
- (ISInternationalLocaleRepresentation)localeRepresentation;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)setLocaleRepresentation:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation ISInternationalCalendarController

- (ISInternationalCalendarController)init
{
  v5.receiver = self;
  v5.super_class = (Class)ISInternationalCalendarController;
  v2 = [(ISInternationalCalendarController *)&v5 init];
  if (v2)
  {
    v3 = +[ISInternationalLocaleRepresentation sharedInstance];
    [(ISInternationalCalendarController *)v2 setLocaleRepresentation:v3];
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    objc_super v5 = [(ISInternationalCalendarController *)self loadSpecifiersFromPlistName:@"InternationalCalendar" target:self];
    id v6 = [v5 mutableCopy];

    if ([UIApp userInterfaceLayoutDirection] != (char *)&dword_0 + 1)
    {
      v7 = +[NSMutableIndexSet indexSet];
      objc_msgSend(v7, "addIndex:", objc_msgSend(v6, "indexOfSpecifierWithID:", @"CALENDAR_DIRECTIONALITY_GROUP"));
      objc_msgSend(v7, "addIndex:", objc_msgSend(v6, "indexOfSpecifierWithID:", @"CALENDAR_DIRECTIONALITY_LEFT_TO_RIGHT_CELL_ID"));
      objc_msgSend(v7, "addIndex:", objc_msgSend(v6, "indexOfSpecifierWithID:", @"CALENDAR_DIRECTIONALITY_RIGHT_TO_LEFT_CELL_ID"));
      [v6 removeObjectsAtIndexes:v7];
    }
    v8 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v6;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)ISInternationalCalendarController;
  id v6 = a4;
  v7 = [(ISInternationalCalendarController *)&v16 tableView:a3 cellForRowAtIndexPath:v6];
  v8 = objc_msgSend(v7, "specifier", v16.receiver, v16.super_class);
  v9 = [v8 propertyForKey:PSValueKey];

  v10 = (char *)[v6 section];
  if (v10 == (unsigned char *)&dword_0 + 1)
  {
    v11 = [(ISInternationalCalendarController *)self localeRepresentation];
    v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 calendarDirectionality]);
    id v13 = [v9 isEqualToNumber:v12];
    goto LABEL_5;
  }
  if (!v10)
  {
    v11 = [(ISInternationalCalendarController *)self localeRepresentation];
    v12 = [v11 calendarIdentifier];
    id v13 = [v9 isEqualToString:v12];
LABEL_5:
    id v14 = v13;

    goto LABEL_7;
  }
  id v14 = 0;
LABEL_7:
  [v7 setChecked:v14];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 cellForRowAtIndexPath:v6];
  v9 = [v8 specifier];
  v10 = [v9 propertyForKey:PSValueKey];

  v11 = (char *)[v6 section];
  if (v11 == (unsigned char *)&dword_0 + 1)
  {
    id v13 = [v10 unsignedIntegerValue];
    v12 = [(ISInternationalCalendarController *)self localeRepresentation];
    [v12 setCalendarDirectionality:v13];
    goto LABEL_5;
  }
  if (!v11)
  {
    v12 = [(ISInternationalCalendarController *)self localeRepresentation];
    [v12 setCalendarIdentifier:v10];
LABEL_5:
  }
  v14.receiver = self;
  v14.super_class = (Class)ISInternationalCalendarController;
  [(ISInternationalCalendarController *)&v14 tableView:v7 didSelectRowAtIndexPath:v6];
  [v7 reloadData];
}

- (ISInternationalLocaleRepresentation)localeRepresentation
{
  return (ISInternationalLocaleRepresentation *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLocaleRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end