@interface CNPropertyGroupBirthdayItem
+ (id)_dateForGroup:(id)a3;
+ (id)calendarForLabel:(id)a3;
+ (id)initialValueForLabel:(id)a3 group:(id)a4;
- (id)displayLabel;
- (id)labeledValueToCurateFromSuggestion;
- (void)updateLabeledValueWithLabel:(id)a3;
@end

@implementation CNPropertyGroupBirthdayItem

- (id)labeledValueToCurateFromSuggestion
{
  v2 = [(CNPropertyGroupItem *)self labeledValue];
  v3 = [v2 value];

  v4 = [(id)objc_opt_class() calendarForLabel:@"_systemCalendar"];
  [v3 setCalendar:v4];

  v5 = [MEMORY[0x1E4F1BA20] entryWithIdentifier:@"_systemCalendar" label:@"_systemCalendar" value:v3];

  return v5;
}

- (void)updateLabeledValueWithLabel:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CNPropertyGroupBirthdayItem;
  [(CNPropertyGroupItem *)&v15 updateLabeledValueWithLabel:v4];
  if ([(CNPropertyGroupItem *)self modified])
  {
    v5 = [(CNPropertyGroupItem *)self property];
    int v6 = [v5 isEqualToString:@"birthdays"];

    if (v6)
    {
      v7 = [(CNPropertyGroupItem *)self labeledValue];
      v8 = [v7 value];

      if ([v8 month] == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v8, "day") == 0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = [(id)objc_opt_class() emptyValueForLabel:v4];
      }
      else
      {
        v10 = [(id)objc_opt_class() calendarForLabel:v4];
        v11 = (void *)[v10 copy];
        v12 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
        [v11 setTimeZone:v12];

        if (+[CNUIDate isYearlessComponents:v8])
        {
          v13 = [MEMORY[0x1E4F1C9C8] date];
          v9 = +[CNUIDate yearlessComponentsFromDate:v13 calendar:v10];

          [v9 setCalendar:v11];
        }
        else
        {
          v14 = +[CNUIDate dateFromComponents:v8 destinationCalendar:v10];
          v9 = +[CNUIDate componentsFromDate:v14 sourceCalendar:v11 destinationCalendar:v11];
        }
        v8 = v10;
      }

      [(CNPropertyGroupItem *)self updateLabeledValueWithValue:v9];
    }
  }
}

- (id)displayLabel
{
  v3 = [(CNPropertyGroupItem *)self property];
  int v4 = [v3 isEqualToString:@"birthdays"];

  if (v4)
  {
    v5 = [(CNPropertyGroupItem *)self labeledValue];
    int v6 = [v5 value];

    v7 = [v6 calendar];
    if (v7
      && ([(CNPropertyGroupItem *)self labeledValue],
          v8 = objc_claimAutoreleasedReturnValue(),
          [v8 label],
          v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 isEqual:@"_systemCalendar"],
          v9,
          v8,
          !v10))
    {
      v12 = CNContactsUIBundle();
      v13 = NSString;
      v14 = [v6 calendar];
      objc_super v15 = [v14 calendarIdentifier];
      v16 = [v13 stringWithFormat:@"BIRTHDAY_LABEL_FORMAT-%@", v15];
      v11 = [v12 localizedStringForKey:v16 value:&stru_1ED8AC728 table:@"Localized"];
    }
    else
    {
      v11 = [MEMORY[0x1E4F1BA20] localizedStringForLabel:*MEMORY[0x1E4F1AD90]];
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)CNPropertyGroupBirthdayItem;
    v11 = [(CNPropertyGroupItem *)&v18 displayLabel];
  }

  return v11;
}

+ (id)_dateForGroup:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  if (v3)
  {
    v5 = [v3 editingItems];
    int v6 = [v5 firstObject];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ([v6 labeledValue],
          v7 = objc_claimAutoreleasedReturnValue(),
          [v7 value],
          v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          !v8))
    {
      v9 = [v4 propertyItems];
      uint64_t v10 = [v9 firstObject];

      int v6 = (void *)v10;
    }
    v11 = [v6 labeledValue];
    v12 = [v11 value];
    v13 = (void *)[v12 copy];

    v14 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [v13 setTimeZone:v14];

    objc_super v15 = 0;
    if (!+[CNUIDate isYearlessComponents:v13])
    {
      objc_super v15 = [v13 date];
    }
  }
  else
  {
    objc_super v15 = 0;
  }

  return v15;
}

+ (id)initialValueForLabel:(id)a3 group:(id)a4
{
  id v6 = a4;
  v7 = [a1 calendarForLabel:a3];
  v8 = (void *)[v7 copy];
  v9 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v8 setTimeZone:v9];

  uint64_t v10 = [a1 _dateForGroup:v6];

  if (v10)
  {
    v11 = +[CNUIDate componentsFromDate:v10 sourceCalendar:v8 destinationCalendar:v8];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    v11 = +[CNUIDate yearlessComponentsFromDate:v10 calendar:v7];
    [v11 setCalendar:v8];
  }

  return v11;
}

+ (id)calendarForLabel:(id)a3
{
  return (id)[MEMORY[0x1E4F1B8F8] calendarForBirthdayLabel:a3];
}

@end