@interface WFCalendarEventContentItem
+ (BOOL)hasLibrary;
+ (id)coercions;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)dateByApplyingComponents:(id)a3 toDateComponents:(id)a4;
+ (id)icsCoercionHandler;
+ (id)itemWithEKEvent:(id)a3 fromEventStore:(id)a4;
+ (id)linkEntityCoercionHandler;
+ (id)localizedFilterDescriptionWithContext:(id)a3;
+ (id)localizedPluralFilterDescriptionWithContext:(id)a3;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)mapItemCoercionHandler;
+ (id)mapsLinkCoercionHandler;
+ (id)ownedTypes;
+ (id)participantsCoercionHandler;
+ (id)placemarkCoercionHandler;
+ (id)propertyBuilders;
+ (id)streetAddressCoercionHandler;
+ (id)stringConversionBehavior;
+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6;
- (BOOL)getListAltText:(id)a3;
- (BOOL)getListSubtitle:(id)a3;
- (EKEvent)event;
- (EKEventStore)eventStore;
- (NSString)location;
- (id)attachments;
- (id)changeTransaction;
- (id)color;
- (id)defaultSourceForRepresentation:(id)a3;
- (id)isCanceled;
- (id)myStatus;
- (id)structuredLocation;
- (void)copyStateToItem:(id)a3;
- (void)getMapItemRepresentationIfPresent:(id)a3;
- (void)setEventStore:(id)a3;
@end

@implementation WFCalendarEventContentItem

+ (id)localizedPluralFilterDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Calendar Events", @"Calendar Events");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedFilterDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Calendar Event", @"Calendar Event");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Calendar events");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Calendar events", @"Calendar events");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Calendar event", @"Calendar event");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"Location";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClassName:@"EKEvent" frameworkName:@"EventKit" location:0];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)linkEntityCoercionHandler
{
  return +[WFCoercionHandler block:&__block_literal_global_335];
}

id __55__WFCalendarEventContentItem_linkEntityCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F52040];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 event];

  v6 = [v5 recurrenceIdentifier];
  v7 = [v6 identifierString];
  v8 = (void *)[v4 initWithTypeIdentifier:@"EventEntity" instanceIdentifier:v7];

  v9 = (void *)[objc_alloc(MEMORY[0x263F52038]) initWithIdentifier:v8];
  return v9;
}

+ (id)participantsCoercionHandler
{
  return +[WFCoercionHandler block:&__block_literal_global_329 availabilityCheck:&__block_literal_global_333];
}

BOOL __57__WFCalendarEventContentItem_participantsCoercionHandler__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 event];
  id v3 = [v2 attendees];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

id __57__WFCalendarEventContentItem_participantsCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 event];
  id v3 = [v2 attendees];
  BOOL v4 = objc_msgSend(v3, "if_map:", &__block_literal_global_331);

  return v4;
}

WFParticipant *__57__WFCalendarEventContentItem_participantsCoercionHandler__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[WFParticipant alloc] initWithEKParticipant:v2];

  return v3;
}

+ (id)icsCoercionHandler
{
  return +[WFCoercionHandler block:&__block_literal_global_326];
}

id __48__WFCalendarEventContentItem_icsCoercionHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a2;
  v5 = [a3 requestedType];
  v6 = [v4 event];
  v14[0] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  v8 = +[WFVCalendarFormatter ICSFromCalendarItems:v7];
  v9 = [v8 dataUsingEncoding:4];

  v10 = [v4 name];

  v11 = +[WFFileRepresentation proposedFilenameForFile:v10 ofType:v5];

  v12 = +[WFFileRepresentation fileWithData:v9 ofType:v5 proposedFilename:v11];

  return v12;
}

+ (id)mapsLinkCoercionHandler
{
  return +[WFCoercionHandler block:&__block_literal_global_314 availabilityCheck:&__block_literal_global_324];
}

BOOL __53__WFCalendarEventContentItem_mapsLinkCoercionHandler__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 location];
  BOOL v3 = v2 != 0;

  return v3;
}

id __53__WFCalendarEventContentItem_mapsLinkCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = objc_alloc_init(DCMutableMapsLink);
  id v4 = [v2 location];
  [(DCMutableMapsLink *)v3 setSearchQuery:v4];

  v5 = NSString;
  v6 = WFLocalizedString(@"Open %@ in Maps");
  v7 = [v2 location];

  v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);
  v9 = +[WFObjectRepresentation object:v3 named:v8];

  return v9;
}

+ (id)streetAddressCoercionHandler
{
  return +[WFCoercionHandler asynchronousBlock:&__block_literal_global_309 availabilityCheck:&__block_literal_global_311];
}

BOOL __58__WFCalendarEventContentItem_streetAddressCoercionHandler__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 location];
  BOOL v3 = +[WFStreetAddress stringContainsStreetAddresses:v2];

  return v3;
}

void __58__WFCalendarEventContentItem_streetAddressCoercionHandler__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__WFCalendarEventContentItem_streetAddressCoercionHandler__block_invoke_2;
  v9[3] = &unk_2642869A8;
  id v10 = v5;
  id v11 = v6;
  id v7 = v5;
  id v8 = v6;
  [v7 getMapItemRepresentationIfPresent:v9];
}

void __58__WFCalendarEventContentItem_streetAddressCoercionHandler__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    v9 = [v5 placemark];
    id v10 = +[WFStreetAddress streetAddressWithPlacemark:v9 label:0];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v10, 0);
  }
  else
  {
    if (v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_6;
    }
    id v11 = [*(id *)(a1 + 32) location];
    id v12 = 0;
    v9 = +[WFStreetAddress streetAddressesInString:v11 error:&v12];
    id v7 = v12;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

LABEL_6:
}

+ (id)placemarkCoercionHandler
{
  return +[WFCoercionHandler asynchronousBlock:&__block_literal_global_304 availabilityCheck:&__block_literal_global_307];
}

BOOL __54__WFCalendarEventContentItem_placemarkCoercionHandler__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 structuredLocation];
  id v4 = [v3 mapKitHandle];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [v2 location];
    if (+[WFStreetAddress stringContainsStreetAddresses:v6])
    {
      id v7 = [v3 geoLocation];
      BOOL v5 = v7 != 0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  return v5;
}

void __54__WFCalendarEventContentItem_placemarkCoercionHandler__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__WFCalendarEventContentItem_placemarkCoercionHandler__block_invoke_2;
  v9[3] = &unk_2642869A8;
  id v10 = v5;
  id v11 = v6;
  id v7 = v5;
  id v8 = v6;
  [v7 getMapItemRepresentationIfPresent:v9];
}

void __54__WFCalendarEventContentItem_placemarkCoercionHandler__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  if (v5 | v6)
  {
    id v7 = (id)v6;
    uint64_t v8 = *(void *)(a1 + 40);
    v9 = [(id)v5 placemark];
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v7);
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) location];
    id v26 = 0;
    id v11 = +[WFStreetAddress streetAddressesInString:v10 error:&v26];
    id v7 = v26;

    id v12 = [*(id *)(a1 + 32) structuredLocation];
    v13 = [v12 geoLocation];

    uint64_t v14 = [v11 count];
    uint64_t v15 = *(void *)(a1 + 40);
    if (v14 && v13)
    {
      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x2050000000;
      v16 = (void *)getMKPlacemarkClass_softClass_4687;
      uint64_t v31 = getMKPlacemarkClass_softClass_4687;
      if (!getMKPlacemarkClass_softClass_4687)
      {
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __getMKPlacemarkClass_block_invoke_4688;
        v27[3] = &unk_26428AC60;
        v27[4] = &v28;
        __getMKPlacemarkClass_block_invoke_4688((uint64_t)v27);
        v16 = (void *)v29[3];
      }
      v17 = v16;
      _Block_object_dispose(&v28, 8);
      id v18 = [v17 alloc];
      [v13 coordinate];
      double v20 = v19;
      double v22 = v21;
      v23 = [v11 firstObject];
      v24 = [v23 postalAddress];
      v25 = objc_msgSend(v18, "initWithCoordinate:postalAddress:", v24, v20, v22);
      (*(void (**)(uint64_t, void *, void))(v15 + 16))(v15, v25, 0);
    }
    else
    {
      (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0, v7);
    }
  }
}

+ (id)mapItemCoercionHandler
{
  return +[WFCoercionHandler asynchronousBlock:&__block_literal_global_298 availabilityCheck:&__block_literal_global_301];
}

BOOL __52__WFCalendarEventContentItem_mapItemCoercionHandler__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 structuredLocation];
  BOOL v3 = [v2 mapKitHandle];
  BOOL v4 = v3 != 0;

  return v4;
}

void __52__WFCalendarEventContentItem_mapItemCoercionHandler__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  id MKMapItemClass_4696 = getMKMapItemClass_4696();
  id v9 = [v6 structuredLocation];

  uint64_t v8 = [v9 mapKitHandle];
  [MKMapItemClass_4696 _mapItemFromHandle:v8 completionHandler:v5];
}

+ (id)coercions
{
  v38[11] = *MEMORY[0x263EF8340];
  v37 = +[WFObjectType typeWithClassName:@"CLPlacemark" frameworkName:@"CoreLocation" location:0];
  v36 = [a1 placemarkCoercionHandler];
  v35 = +[WFCoercion coercionToType:v37 handler:v36];
  v38[0] = v35;
  uint64_t v3 = objc_opt_class();
  v34 = [a1 streetAddressCoercionHandler];
  v33 = +[WFCoercion coercionToClass:v3 handler:v34];
  v38[1] = v33;
  uint64_t v4 = objc_opt_class();
  v32 = +[WFCoercionHandler keyPath:@"event.startDate"];
  uint64_t v31 = +[WFCoercion coercionToClass:v4 handler:v32];
  v38[2] = v31;
  uint64_t v5 = objc_opt_class();
  uint64_t v30 = +[WFCoercionHandler keyPath:@"event.URL" unavailableIfNilOrEmpty:1];
  v29 = +[WFCoercion coercionToClass:v5 handler:v30];
  v38[3] = v29;
  uint64_t v6 = objc_opt_class();
  uint64_t v28 = +[WFCoercionHandler keyPath:@"color" unavailableIfNilOrEmpty:1];
  v27 = +[WFCoercion coercionToClass:v6 handler:v28];
  v38[4] = v27;
  uint64_t v7 = objc_opt_class();
  id v26 = [a1 mapsLinkCoercionHandler];
  v25 = +[WFCoercion coercionToClass:v7 handler:v26];
  v38[5] = v25;
  v24 = [MEMORY[0x263F852B8] typeWithString:@"com.apple.ical.ics"];
  v23 = [a1 icsCoercionHandler];
  double v22 = +[WFCoercion coercionToType:v24 handler:v23];
  v38[6] = v22;
  uint64_t v8 = objc_opt_class();
  double v21 = [a1 participantsCoercionHandler];
  id v9 = +[WFCoercion coercionToClass:v8 handler:v21];
  v38[7] = v9;
  id v10 = +[WFObjectType typeWithClassName:@"MKMapItem" frameworkName:@"MapKit" location:2];
  id v11 = [a1 mapItemCoercionHandler];
  id v12 = +[WFCoercion coercionToType:v10 handler:v11];
  v38[8] = v12;
  v13 = +[WFObjectType typeWithClassName:@"CLLocation" frameworkName:@"CoreLocation" location:0];
  uint64_t v14 = +[WFCoercionHandler keyPath:@"structuredLocation.geoLocation" unavailableIfNilOrEmpty:1];
  uint64_t v15 = +[WFCoercion coercionToType:v13 handler:v14];
  v38[9] = v15;
  v16 = +[WFObjectType typeWithClassName:@"LNEntity" frameworkName:@"LinkMetadata" location:1];
  v17 = [a1 linkEntityCoercionHandler];
  id v18 = +[WFCoercion coercionToType:v16 handler:v17];
  v38[10] = v18;
  id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:11];

  return v20;
}

+ (id)dateByApplyingComponents:(id)a3 toDateComponents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 year] == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v5;
  }
  objc_msgSend(v6, "setYear:", objc_msgSend(v7, "year"));
  if ([v5 month] == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = v5;
  }
  objc_msgSend(v6, "setMonth:", objc_msgSend(v8, "month"));
  if ([v5 weekOfYear] == 0x7FFFFFFFFFFFFFFFLL) {
    id v9 = v6;
  }
  else {
    id v9 = v5;
  }
  objc_msgSend(v6, "setWeekOfYear:", objc_msgSend(v9, "weekOfYear"));
  if ([v5 day] == 0x7FFFFFFFFFFFFFFFLL) {
    id v10 = v6;
  }
  else {
    id v10 = v5;
  }
  objc_msgSend(v6, "setDay:", objc_msgSend(v10, "day"));
  if ([v5 hour] == 0x7FFFFFFFFFFFFFFFLL) {
    id v11 = v6;
  }
  else {
    id v11 = v5;
  }
  objc_msgSend(v6, "setHour:", objc_msgSend(v11, "hour"));
  if ([v5 minute] == 0x7FFFFFFFFFFFFFFFLL) {
    id v12 = v6;
  }
  else {
    id v12 = v5;
  }
  objc_msgSend(v6, "setMinute:", objc_msgSend(v12, "minute"));
  if ([v5 second] == 0x7FFFFFFFFFFFFFFFLL) {
    v13 = v6;
  }
  else {
    v13 = v5;
  }
  objc_msgSend(v6, "setSecond:", objc_msgSend(v13, "second"));
  uint64_t v14 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v15 = [v14 dateFromComponents:v6];

  return v15;
}

+ (id)stringConversionBehavior
{
  id v2 = [a1 propertyForName:@"Title"];
  uint64_t v3 = +[WFContentItemStringConversionBehavior accessingProperty:v2];

  return v3;
}

+ (BOOL)hasLibrary
{
  return 1;
}

+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![v11 count])
  {
    uint64_t v14 = [v10 predicate];
    uint64_t v15 = +[WFCalendarEventFiltering itemsToQueryForPredicate:v14];

    id v11 = (id)v15;
  }
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___WFCalendarEventContentItem;
  objc_msgSendSuper2(&v16, sel_runQuery_withItems_permissionRequestor_completionHandler_, v10, v11, v12, v13);
}

+ (id)propertyBuilders
{
  v107[20] = *MEMORY[0x263EF8340];
  v104 = WFLocalizedContentPropertyNameMarker(@"Start Date");
  v103 = +[WFContentPropertyBuilder keyPath:@"event.startDate" name:v104 class:objc_opt_class()];
  v102 = [v103 timeUnits:8444];
  v106[0] = MEMORY[0x263EF8330];
  v106[1] = 3221225472;
  v106[2] = __46__WFCalendarEventContentItem_propertyBuilders__block_invoke;
  v106[3] = &__block_descriptor_48_e74_v24__0__WFCalendarEventContentItemChangeTransaction_8__NSDateComponents_16l;
  v106[4] = 8444;
  v106[5] = a1;
  v101 = [v102 setterBlock:v106];
  v100 = [v101 removable:0];
  v107[0] = v100;
  v99 = WFLocalizedContentPropertyNameMarker(@"End Date");
  v98 = +[WFContentPropertyBuilder keyPath:@"event.endDate" name:v99 class:objc_opt_class()];
  v97 = [v98 timeUnits:8444];
  v105[0] = MEMORY[0x263EF8330];
  v105[1] = 3221225472;
  v105[2] = __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_2;
  v105[3] = &__block_descriptor_48_e56_v24__0__WFCalendarEventContentItemChangeTransaction_8_16l;
  v105[4] = 8444;
  v105[5] = a1;
  v96 = [v97 setterBlock:v105];
  v95 = [v96 removable:0];
  v107[1] = v95;
  v93 = WFLocalizedContentPropertyNameMarker(@"Is All Day");
  v94 = [NSNumber numberWithBool:1];
  v92 = +[WFContentPropertyBuilder keyPath:@"event.allDay" name:v93 class:objc_opt_class()];
  v91 = WFLocalizedContentPropertyNameMarker(@"Is Not All Day");
  v90 = [v92 negativeName:v91];
  v89 = WFLocalizedString(@"Event");
  v88 = [v90 singularItemName:v89];
  v87 = [v88 setterBlock:&__block_literal_global_4744];
  v107[2] = v87;
  v86 = WFLocalizedContentPropertyNameMarker(@"Calendar");
  v85 = +[WFContentPropertyBuilder keyPath:@"event.calendar.title" name:v86 class:objc_opt_class()];
  v84 = [v85 possibleValuesGetter:&__block_literal_global_103];
  v107[3] = v84;
  v83 = WFLocalizedContentPropertyNameMarker(@"Location");
  v82 = +[WFContentPropertyBuilder keyPath:@"location" name:v83 class:objc_opt_class()];
  v81 = [v82 sortable:0];
  v80 = [v81 setterBlock:&__block_literal_global_124];
  v107[4] = v80;
  v78 = WFLocalizedContentPropertyNameMarker(@"Has Alarms");
  v79 = [NSNumber numberWithBool:1];
  v77 = +[WFContentPropertyBuilder keyPath:@"event.hasAlarms" name:v78 class:objc_opt_class()];
  v76 = WFLocalizedContentPropertyNameMarker(@"Has No Alarms");
  v75 = [v77 negativeName:v76];
  v74 = WFLocalizedString(@"Event");
  v73 = [v75 singularItemName:v74];
  v107[5] = v73;
  v72 = WFLocalizedContentPropertyNameMarker(@"Duration");
  v71 = +[WFContentPropertyBuilder block:&__block_literal_global_136 name:v72 class:objc_opt_class()];
  v70 = [v71 timeUnits:240];
  v69 = [v70 setterBlock:&__block_literal_global_142];
  v68 = [v69 removable:0];
  v107[6] = v68;
  v66 = WFLocalizedContentPropertyNameMarker(@"Canceled");
  v67 = [NSNumber numberWithBool:1];
  v65 = +[WFContentPropertyBuilder keyPath:@"isCanceled" name:v66 class:objc_opt_class()];
  v64 = WFLocalizedContentPropertyNameMarker(@"Is Canceled");
  v63 = [v65 displayName:v64];
  v62 = WFLocalizedContentPropertyNameMarker(@"Is Not Canceled");
  v61 = [v63 negativeName:v62];
  v107[7] = v61;
  v60 = WFLocalizedContentPropertyNameMarker(@"My Status");
  v59 = +[WFContentPropertyBuilder keyPath:@"myStatus" name:v60 class:objc_opt_class()];
  v58 = +[WFEKParticipantContentItem possibleStatuses];
  v57 = [v59 possibleValues:v58];
  v56 = [v57 setterBlock:&__block_literal_global_163];
  v107[8] = v56;
  v55 = WFLocalizedContentPropertyNameMarker(@"Organizer");
  v54 = +[WFContentPropertyBuilder block:&__block_literal_global_166_4758 name:v55 class:objc_opt_class()];
  v107[9] = v54;
  v52 = WFLocalizedContentPropertyNameMarker(@"Organizer Is Me");
  v53 = [NSNumber numberWithBool:1];
  v51 = +[WFContentPropertyBuilder block:&__block_literal_global_172 name:v52 class:objc_opt_class()];
  v50 = WFLocalizedContentPropertyNameMarker(@"Organizer Is Not Me");
  v49 = [v51 negativeName:v50];
  v107[10] = v49;
  v48 = WFLocalizedContentPropertyNameMarker(@"Attendees");
  v47 = +[WFContentPropertyBuilder block:&__block_literal_global_180 name:v48 class:objc_opt_class()];
  v46 = [v47 multipleValues:1];
  v45 = [v46 setterBlock:&__block_literal_global_189];
  v107[11] = v45;
  v44 = WFLocalizedContentPropertyNameMarker(@"Number of Attendees");
  v43 = +[WFContentPropertyBuilder block:&__block_literal_global_192 name:v44 class:objc_opt_class()];
  v107[12] = v43;
  v42 = WFLocalizedContentPropertyNameMarker(@"URL");
  v41 = +[WFContentPropertyBuilder keyPath:@"event.URL" name:v42 class:objc_opt_class()];
  v40 = [v41 filterable:0];
  v39 = [v40 sortable:0];
  v38 = [v39 setterBlock:&__block_literal_global_205];
  v37 = [v38 canLowercaseName:0];
  v107[13] = v37;
  v36 = WFLocalizedContentPropertyNameMarker(@"Title");
  v35 = +[WFContentPropertyBuilder keyPath:@"event.title" name:v36 class:objc_opt_class()];
  v34 = [v35 setterBlock:&__block_literal_global_213];
  v33 = [v34 removable:0];
  v107[14] = v33;
  v32 = WFLocalizedContentPropertyNameMarker(@"Notes");
  uint64_t v31 = +[WFContentPropertyBuilder keyPath:@"event.notes" name:v32 class:objc_opt_class()];
  uint64_t v30 = [v31 sortable:0];
  v29 = [v30 appendable:1];
  uint64_t v28 = [v29 setterBlock:&__block_literal_global_224];
  v107[15] = v28;
  v27 = WFLocalizedContentPropertyNameMarker(@"Attachments");
  id v26 = +[WFContentPropertyBuilder keyPath:@"attachments" name:v27 class:objc_opt_class()];
  v25 = [v26 sortable:0];
  v24 = [v25 removable:0];
  v23 = [v24 multipleValues:1];
  double v22 = WFLocalizedContentPropertyNameMarker(@"Attachment");
  double v21 = [v23 singularItemName:v22];
  id v20 = [v21 setterBlock:&__block_literal_global_236];
  v107[16] = v20;
  double v19 = WFLocalizedContentPropertyNameMarker(@"Last Modified Date");
  id v18 = +[WFContentPropertyBuilder keyPath:@"event.lastModifiedDate" name:v19 class:objc_opt_class()];
  v17 = [v18 tense:1];
  objc_super v16 = [v17 timeUnits:8444];
  uint64_t v15 = [v16 userInfo:@"WFFileModificationDate"];
  v107[17] = v15;
  uint64_t v3 = WFLocalizedContentPropertyNameMarker(@"Creation Date");
  uint64_t v4 = +[WFContentPropertyBuilder keyPath:@"event.creationDate" name:v3 class:objc_opt_class()];
  id v5 = [v4 tense:1];
  id v6 = [v5 timeUnits:8444];
  uint64_t v7 = [v6 userInfo:@"WFFileCreationDate"];
  v107[18] = v7;
  uint64_t v8 = WFLocalizedContentPropertyNameMarker(@"File Size");
  id v9 = +[WFContentPropertyBuilder block:&__block_literal_global_250 name:v8 class:objc_opt_class()];
  id v10 = [v9 userInfo:@"WFFileSizeProperty"];
  id v11 = [v10 filterable:0];
  id v12 = [v11 sortable:0];
  v107[19] = v12;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v107 count:20];

  return v14;
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [MEMORY[0x263EFF8F0] currentCalendar];
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = [v18 mutableEvent];
      id v9 = [v8 startDate];
      id v10 = [v6 components:v7 fromDate:v9];

      id v11 = [*(id *)(a1 + 40) dateByApplyingComponents:v5 toDateComponents:v10];
    }
    else
    {
      id v10 = v5;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v12 = v10;
      }
      else {
        id v12 = 0;
      }
      id v11 = v12;
    }
    id v13 = v11;

    id v14 = [v18 mutableEvent];
    [v14 duration];
    uint64_t v15 = objc_msgSend(v13, "dateByAddingTimeInterval:");
    objc_super v16 = [v18 mutableEvent];
    [v16 setEndDate:v15];

    v17 = [v18 mutableEvent];
    [v17 setStartDate:v13];
  }
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v15 = a3;
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [v5 mutableEvent];
    id v9 = [v8 endDate];
    id v10 = [v6 components:v7 fromDate:v9];

    id v11 = [*(id *)(a1 + 40) dateByApplyingComponents:v15 toDateComponents:v10];
  }
  else
  {
    id v10 = v15;
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v12 = v10;
      }
      else {
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
    id v11 = v12;
  }
  id v13 = v11;

  id v14 = [v5 mutableEvent];

  [v14 setEndDate:v13];
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_21(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_22;
  v7[3] = &unk_26428A288;
  id v8 = v5;
  id v6 = v5;
  [a2 getPreferredFileSize:v7];
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_22(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [[WFFileSize alloc] initWithByteCount:a2];
  (*(void (**)(uint64_t, WFFileSize *))(v2 + 16))(v2, v3);
}

uint64_t __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_20(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateAttachments:");
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  uint64_t v4 = a3;
  id v5 = [v12 mode];
  int v6 = [v5 isEqual:@"Append"];

  if (v6)
  {
    uint64_t v7 = [v12 mutableEvent];
    id v8 = [v7 notes];
    id v9 = [(__CFString *)v8 stringByAppendingAsNewLine:v4];

    id v10 = [v12 mutableEvent];
    [v10 setNotes:v9];

    uint64_t v4 = v8;
  }
  else
  {
    if (v4) {
      id v11 = v4;
    }
    else {
      id v11 = &stru_26C71CE08;
    }
    uint64_t v7 = [v12 mutableEvent];
    [v7 setNotes:v11];
  }
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_18(uint64_t a1, void *a2, __CFString *a3)
{
  if (a3) {
    uint64_t v4 = a3;
  }
  else {
    uint64_t v4 = &stru_26C71CE08;
  }
  id v5 = a3;
  id v6 = [a2 mutableEvent];
  [v6 setTitle:v4];
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 mutableEvent];
  [v5 setURL:v4];
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_16(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  id v6 = NSNumber;
  uint64_t v7 = a4;
  id v10 = [a2 event];
  id v8 = [v10 attendees];
  id v9 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  ((void (**)(void, void *))a4)[2](v7, v9);
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v4 = a2;
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_15;
  v67[3] = &unk_264286900;
  id v5 = v4;
  id v68 = v5;
  id v6 = objc_msgSend(a3, "if_compactMap:", v67);
  uint64_t v7 = [v5 mode];
  int v8 = [v7 isEqualToString:@"Append"];

  if (v8)
  {
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v63 objects:v73 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v64 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v63 + 1) + 8 * i);
          id v15 = [v5 mutableEvent];
          [v15 addAttendee:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v63 objects:v73 count:16];
      }
      while (v11);
    }
  }
  else
  {
    objc_super v16 = [v5 mode];
    int v17 = [v16 isEqualToString:@"Remove"];

    if (v17)
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v9 = v6;
      uint64_t v18 = [v9 countByEnumeratingWithState:&v59 objects:v72 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v60;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v60 != v20) {
              objc_enumerationMutation(v9);
            }
            uint64_t v22 = *(void *)(*((void *)&v59 + 1) + 8 * j);
            v23 = [v5 mutableEvent];
            [v23 removeAttendee:v22];
          }
          uint64_t v19 = [v9 countByEnumeratingWithState:&v59 objects:v72 count:16];
        }
        while (v19);
      }
    }
    else
    {
      v24 = [v5 mode];
      int v25 = [v24 isEqualToString:@"RemoveAll"];

      if (v25)
      {
        long long v57 = 0uLL;
        long long v58 = 0uLL;
        long long v55 = 0uLL;
        long long v56 = 0uLL;
        id v26 = [v5 mutableEvent];
        id v9 = [v26 attendees];

        uint64_t v27 = [v9 countByEnumeratingWithState:&v55 objects:v71 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v56;
          do
          {
            for (uint64_t k = 0; k != v28; ++k)
            {
              if (*(void *)v56 != v29) {
                objc_enumerationMutation(v9);
              }
              uint64_t v31 = *(void *)(*((void *)&v55 + 1) + 8 * k);
              v32 = [v5 mutableEvent];
              [v32 removeAttendee:v31];
            }
            uint64_t v28 = [v9 countByEnumeratingWithState:&v55 objects:v71 count:16];
          }
          while (v28);
        }
      }
      else
      {
        long long v53 = 0uLL;
        long long v54 = 0uLL;
        long long v51 = 0uLL;
        long long v52 = 0uLL;
        v33 = [v5 mutableEvent];
        v34 = [v33 attendees];

        uint64_t v35 = [v34 countByEnumeratingWithState:&v51 objects:v70 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v52;
          do
          {
            for (uint64_t m = 0; m != v36; ++m)
            {
              if (*(void *)v52 != v37) {
                objc_enumerationMutation(v34);
              }
              uint64_t v39 = *(void *)(*((void *)&v51 + 1) + 8 * m);
              v40 = [v5 mutableEvent];
              [v40 removeAttendee:v39];
            }
            uint64_t v36 = [v34 countByEnumeratingWithState:&v51 objects:v70 count:16];
          }
          while (v36);
        }

        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v9 = v6;
        uint64_t v41 = [v9 countByEnumeratingWithState:&v47 objects:v69 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v48;
          do
          {
            for (uint64_t n = 0; n != v42; ++n)
            {
              if (*(void *)v48 != v43) {
                objc_enumerationMutation(v9);
              }
              uint64_t v45 = *(void *)(*((void *)&v47 + 1) + 8 * n);
              v46 = objc_msgSend(v5, "mutableEvent", (void)v47);
              [v46 addAttendee:v45];
            }
            uint64_t v42 = [v9 countByEnumeratingWithState:&v47 objects:v69 count:16];
          }
          while (v42);
        }
      }
    }
  }
}

id __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_15(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2050000000;
  id v4 = (void *)getEKAttendeeClass_softClass;
  uint64_t v19 = getEKAttendeeClass_softClass;
  if (!getEKAttendeeClass_softClass)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __getEKAttendeeClass_block_invoke;
    v15[3] = &unk_26428AC60;
    v15[4] = &v16;
    __getEKAttendeeClass_block_invoke((uint64_t)v15);
    id v4 = (void *)v17[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v16, 8);
  id v6 = [v3 emailAddress];
  uint64_t v7 = [v3 URL];
  int v8 = [v5 attendeeWithName:0 emailAddress:v6 phoneNumber:0 url:v7];

  objc_msgSend(v8, "setParticipantRole:", objc_msgSend(v3, "role"));
  objc_msgSend(v8, "setParticipantStatus:", objc_msgSend(v3, "status"));
  objc_msgSend(v8, "setParticipantType:", objc_msgSend(v3, "type"));
  id v9 = [*(id *)(a1 + 32) mutableEvent];
  uint64_t v10 = [*(id *)(a1 + 32) mutableEvent];
  uint64_t v11 = [v10 calendar];
  if ([v9 isValidAttendee:v8 forCalendar:v11]) {
    uint64_t v12 = v8;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  return v13;
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_12(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = [a2 event];
  uint64_t v7 = [v6 attendees];
  objc_msgSend(v7, "if_map:", &__block_literal_global_183);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  v5[2](v5, v8);
}

WFParticipant *__46__WFCalendarEventContentItem_propertyBuilders__block_invoke_13(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[WFParticipant alloc] initWithEKParticipant:v2];

  return v3;
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_11(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  uint64_t v7 = [v6 event];
  id v8 = [v7 organizer];
  unsigned int v9 = [v8 isCurrentUser];

  uint64_t v10 = [v6 event];
  uint64_t v11 = [v10 attendeesNotIncludingOrganizer];

  uint64_t v12 = [v6 event];

  id v13 = [v12 calendar];
  uint64_t v14 = [v13 sharingStatus];

  if (v14 | v11) {
    uint64_t v15 = v9;
  }
  else {
    uint64_t v15 = 1;
  }
  id v16 = [NSNumber numberWithInt:v15];
  v5[2](v5, v16);
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_10(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a4;
  id v5 = [a2 event];
  id v6 = [v5 organizer];

  if (v6)
  {
    uint64_t v7 = [[WFParticipant alloc] initWithEKParticipant:v6];
    v8[2](v8, v7);
  }
  else
  {
    v8[2](v8, 0);
  }
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v5 isEqualToString:@"Accepted"])
  {
    uint64_t v6 = 2;
  }
  else if ([v5 isEqualToString:@"Completed"])
  {
    uint64_t v6 = 6;
  }
  else if ([v5 isEqualToString:@"Declined"])
  {
    uint64_t v6 = 3;
  }
  else if ([v5 isEqualToString:@"Delegated"])
  {
    uint64_t v6 = 5;
  }
  else if ([v5 isEqualToString:@"In Process"])
  {
    uint64_t v6 = 7;
  }
  else if ([v5 isEqualToString:@"Pending"])
  {
    uint64_t v6 = 1;
  }
  else if ([v5 isEqualToString:@"Tentative"])
  {
    uint64_t v6 = 4;
  }
  else
  {
    uint64_t v6 = 0;
  }

  id v8 = [v4 mutableEvent];

  uint64_t v7 = [v8 selfAttendee];
  [v7 setParticipantStatus:v6];
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v11 = [v5 mutableEvent];
  uint64_t v6 = [v11 startDate];
  [v4 doubleValue];
  double v8 = v7;

  unsigned int v9 = [v6 dateByAddingTimeInterval:v8];
  uint64_t v10 = [v5 mutableEvent];

  [v10 setEndDate:v9];
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  uint64_t v6 = a4;
  id v7 = a2;
  double v8 = [WFTimeInterval alloc];
  id v13 = [v7 event];
  unsigned int v9 = [v13 endDate];
  uint64_t v10 = [v7 event];

  id v11 = [v10 startDate];
  [v9 timeIntervalSinceDate:v11];
  uint64_t v12 = -[WFTimeInterval initWithTimeInterval:](v8, "initWithTimeInterval:");
  ((void (**)(void, WFTimeInterval *))a4)[2](v6, v12);
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 mutableEvent];
  [v5 setLocation:v4];
}

id __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_4()
{
  v0 = WFGetWorkflowEventStore();
  v1 = [v0 calendarsForEntityType:0];
  id v2 = objc_msgSend(v1, "if_compactMap:", &__block_literal_global_106);

  return v2;
}

id __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 title];
  int v4 = [v3 isEqualToString:@"Found in Mail"];

  if (v4)
  {
    id v5 = @"Found in Mail";
LABEL_5:
    uint64_t v8 = WFLocalizedString(v5);
    goto LABEL_7;
  }
  uint64_t v6 = [v2 title];
  int v7 = [v6 isEqualToString:@"Birthdays"];

  if (v7)
  {
    id v5 = @"Birthdays";
    goto LABEL_5;
  }
  uint64_t v8 = [v2 title];
LABEL_7:
  unsigned int v9 = (void *)v8;

  return v9;
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3) {
    a3 = (void *)[a3 BOOLValue];
  }
  int v4 = [v5 mutableEvent];
  [v4 setAllDay:a3];
}

+ (id)itemWithEKEvent:(id)a3 fromEventStore:(id)a4
{
  id v6 = a4;
  int v7 = [a1 itemWithObject:a3 named:0];
  [v7 setEventStore:v6];

  return v7;
}

- (void).cxx_destruct
{
}

- (void)setEventStore:(id)a3
{
}

- (id)defaultSourceForRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 wfType];
  int v6 = [v5 conformsToClass:getEKEventClass()];

  if (v6)
  {
    int v7 = [v4 object];

    uint64_t v8 = [v7 calendar];
    unsigned int v9 = [v8 source];
    uint64_t v10 = +[WFContentLocation locationWithCalendarSource:v9];
    id v11 = [(WFContentItem *)self cachingIdentifier];
    uint64_t v12 = +[WFContentAttributionSet attributionSetWithOrigin:v10 disclosureLevel:1 originalItemIdentifier:v11];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)WFCalendarEventContentItem;
    uint64_t v12 = [(WFContentItem *)&v14 defaultSourceForRepresentation:v4];
  }
  return v12;
}

- (void)getMapItemRepresentationIfPresent:(id)a3
{
  id v4 = a3;
  id v5 = [(WFCalendarEventContentItem *)self event];
  int v6 = [v5 structuredLocation];
  int v7 = [v6 mapKitHandle];

  if (v7)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __64__WFCalendarEventContentItem_getMapItemRepresentationIfPresent___block_invoke;
    v8[3] = &unk_26428A740;
    id v9 = v4;
    [(WFContentItem *)self getObjectRepresentation:v8 forClass:getMKMapItemClass_4696()];
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

uint64_t __64__WFCalendarEventContentItem_getMapItemRepresentationIfPresent___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (EKEvent)event
{
  id EKEventClass = getEKEventClass();
  return (EKEvent *)[(WFContentItem *)self objectForClass:EKEventClass];
}

- (EKEventStore)eventStore
{
  eventStore = self->_eventStore;
  if (eventStore)
  {
    id v3 = eventStore;
  }
  else
  {
    id v4 = [(WFCalendarEventContentItem *)self event];
    objc_getAssociatedObject(v4, &WFDeserializingEventStoreKey);
    id v3 = (EKEventStore *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)color
{
  id v2 = [(WFCalendarEventContentItem *)self event];
  id v3 = [v2 calendar];
  uint64_t v4 = [v3 CGColor];

  if (v4)
  {
    id v5 = [MEMORY[0x263F851A8] colorWithCGColor:v4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)attachments
{
  id v3 = [(WFCalendarEventContentItem *)self event];
  int v4 = [v3 hasAttachment];

  if (v4)
  {
    id v5 = [(WFCalendarEventContentItem *)self event];
    int v6 = [v5 attachments];
    int v7 = objc_msgSend(v6, "if_map:", &__block_literal_global_259);
  }
  else
  {
    int v7 = (void *)MEMORY[0x263EFFA68];
  }
  return v7;
}

id __41__WFCalendarEventContentItem_attachments__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 localURL];
  id v3 = +[WFFileRepresentation fileWithURL:v2 options:13];

  return v3;
}

- (id)structuredLocation
{
  id v2 = [(WFCalendarEventContentItem *)self event];
  id v3 = [v2 structuredLocation];

  return v3;
}

- (NSString)location
{
  id v2 = [(WFCalendarEventContentItem *)self event];
  id v3 = [v2 location];

  if ([v3 length]) {
    int v4 = v3;
  }
  else {
    int v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)isCanceled
{
  id v2 = NSNumber;
  id v3 = [(WFCalendarEventContentItem *)self event];
  int v4 = objc_msgSend(v2, "numberWithInt:", objc_msgSend(v3, "status") == 3);

  return v4;
}

- (id)myStatus
{
  id v2 = [(WFCalendarEventContentItem *)self event];
  id v3 = [v2 selfAttendee];

  if (v3)
  {
    int v4 = WFStatusPropertyValueForEKParticipantStatus([v3 participantStatus]);
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)copyStateToItem:(id)a3
{
}

- (id)changeTransaction
{
  id v3 = [WFCalendarEventContentItemChangeTransaction alloc];
  int v4 = [(WFCalendarEventContentItem *)self eventStore];
  id v5 = [(WFCalendarEventContentItemChangeTransaction *)v3 initWithContentItem:self eventStore:v4];

  return v5;
}

- (BOOL)getListAltText:(id)a3
{
  if (a3)
  {
    int v4 = (void (**)(id, void *))a3;
    id v5 = [(WFCalendarEventContentItem *)self event];
    int v6 = [v5 startDate];
    int v7 = objc_opt_new();
    [v7 setDateStyle:1];
    [v7 setTimeStyle:1];
    [v7 setDoesRelativeDateFormatting:1];
    if ([v5 isAllDay])
    {
      [v7 setTimeStyle:0];
    }
    else
    {
      uint64_t v8 = [MEMORY[0x263EFF8F0] currentCalendar];
      int v9 = [v8 isDateInToday:v6];

      if (v9) {
        [v7 setDateStyle:0];
      }
    }
    uint64_t v10 = [v7 stringFromDate:v6];
    v4[2](v4, v10);
  }
  return 1;
}

- (BOOL)getListSubtitle:(id)a3
{
  int v4 = (void (**)(id, void *))a3;
  id v5 = [(WFCalendarEventContentItem *)self event];
  int v6 = [v5 location];

  uint64_t v7 = [v6 length];
  uint64_t v8 = v7;
  if (v4 && v7) {
    v4[2](v4, v6);
  }

  return v8 != 0;
}

@end