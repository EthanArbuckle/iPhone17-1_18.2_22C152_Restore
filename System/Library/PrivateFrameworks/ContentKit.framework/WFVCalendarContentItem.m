@interface WFVCalendarContentItem
+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)stringConversionBehavior;
- (BOOL)canGenerateRepresentationForType:(id)a3;
- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5;
@end

@implementation WFVCalendarContentItem

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;
  v7 = [v6 string];
  if ([v7 isEqualToString:@"EKEvent"])
  {
  }
  else
  {
    id v8 = v4;
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v9 = v8;
      }
      else {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
    }
    id v10 = v9;

    v11 = [v10 string];

    LODWORD(v10) = [v11 isEqualToString:@"REMReminder"];
    if (!v10)
    {
      v21.receiver = self;
      v21.super_class = (Class)WFVCalendarContentItem;
      unsigned __int8 v19 = [(WFGenericFileContentItem *)&v21 canGenerateRepresentationForType:v8];
      goto LABEL_16;
    }
  }
  v12 = [MEMORY[0x263F852B8] typeWithString:@"com.apple.ical.ics"];
  v13 = [(WFContentItem *)self fileRepresentationForType:v12];

  id v14 = [NSString alloc];
  v15 = [v13 data];
  v16 = (void *)[v14 initWithData:v15 encoding:4];

  v17 = +[WFVCalendarFormatter calendarItemsFromICS:v16];
  v18 = objc_msgSend(v17, "objectsMatchingClass:", objc_msgSend(v4, "objectClass"));

  unsigned __int8 v19 = [v18 count] != 0;
LABEL_16:

  return v19;
}

- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v7 = NSStringFromClass(a3);
  if ([@"EKEvent" isEqualToString:v7])
  {
  }
  else
  {
    id v8 = NSStringFromClass(a3);
    int v9 = [@"REMReminder" isEqualToString:v8];

    if (!v9)
    {
      v16 = 0;
      goto LABEL_15;
    }
  }
  id v10 = [MEMORY[0x263F852B8] typeWithString:@"com.apple.ical.ics"];
  v11 = [(WFContentItem *)self fileRepresentationForType:v10];

  id v12 = [NSString alloc];
  v13 = [v11 data];
  id v14 = (void *)[v12 initWithData:v13 encoding:4];

  v15 = +[WFVCalendarFormatter calendarItemsFromICS:v14];
  v16 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          v23 = +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v22, (void)v25);
          [v16 addObject:v23];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v19);
  }

LABEL_15:
  return v16;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d iCalendar items");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"iCalendar items", @"iCalendar items");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"iCalendar item", @"iCalendar item");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClassName:@"EKEvent" frameworkName:@"EventKit" location:0];
  id v4 = +[WFObjectType typeWithClassName:@"REMReminder" frameworkName:@"ReminderKit" location:1];
  v5 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);

  return v5;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F852B8] typeWithString:@"com.apple.ical.ics"];
  id v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)stringConversionBehavior
{
  v2 = [a1 propertyForName:@"Name"];
  id v3 = +[WFContentItemStringConversionBehavior accessingProperty:v2];

  return v3;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;
  v7 = [v6 string];
  if ([v7 isEqualToString:@"EKEvent"])
  {
  }
  else
  {
    id v8 = v4;
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v9 = v8;
      }
      else {
        int v9 = 0;
      }
    }
    else
    {
      int v9 = 0;
    }
    id v10 = v9;

    v11 = [v10 string];

    LOBYTE(v10) = [v11 isEqualToString:@"REMReminder"];
    if ((v10 & 1) == 0)
    {
      v14.receiver = a1;
      v14.super_class = (Class)&OBJC_METACLASS___WFVCalendarContentItem;
      unsigned __int8 v12 = objc_msgSendSuper2(&v14, sel_supportedTypeMustBeDeterminedByInstance_, v8);
      goto LABEL_16;
    }
  }
  unsigned __int8 v12 = 1;
LABEL_16:

  return v12;
}

@end