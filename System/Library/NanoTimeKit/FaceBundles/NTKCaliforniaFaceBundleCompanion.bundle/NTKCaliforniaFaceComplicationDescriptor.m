@interface NTKCaliforniaFaceComplicationDescriptor
- (BOOL)complicationExistenceInvalidatesSnapshot;
- (id)complicationSlotDescriptors;
- (id)localizedNameForComplicationSlot:(id)a3;
- (id)orderedComplicationSlots;
- (id)richComplicationSlotsForDevice:(id)a3;
@end

@implementation NTKCaliforniaFaceComplicationDescriptor

- (id)complicationSlotDescriptors
{
  v14.receiver = self;
  v14.super_class = (Class)NTKCaliforniaFaceComplicationDescriptor;
  v2 = [(NTKCaliforniaFaceComplicationDescriptor *)&v14 complicationSlotDescriptors];
  id v3 = [v2 mutableCopy];

  v4 = NTKAllSignatureCircularTypes();
  v5 = NTKAllSimpleTextComplicationTypes();
  v6 = NTKAllUtilityLargeComplicationTypes();
  v7 = NTKComplicationTypeRankedListWithDefaultTypes();
  v8 = NTKComplicationTypeRankedListWithDefaultTypes();
  v15[0] = NTKComplicationSlotBezel;
  v9 = NTKComplicationSlotDescriptor();
  v16[0] = v9;
  v15[1] = NTKComplicationSlotSubdialTop;
  v10 = NTKComplicationSlotDescriptor();
  v16[1] = v10;
  v15[2] = NTKComplicationSlotSubdialBottom;
  v11 = NTKComplicationSlotDescriptor();
  v16[2] = v11;
  v12 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

  [v3 addEntriesFromDictionary:v12];

  return v3;
}

- (id)orderedComplicationSlots
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCaliforniaFaceComplicationDescriptor;
  v2 = [(NTKCaliforniaFaceComplicationDescriptor *)&v6 orderedComplicationSlots];
  v7[0] = NTKComplicationSlotBezel;
  v7[1] = NTKComplicationSlotSubdialTop;
  v7[2] = NTKComplicationSlotSubdialBottom;
  id v3 = +[NSArray arrayWithObjects:v7 count:3];
  v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

- (id)localizedNameForComplicationSlot:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:NTKComplicationSlotBezel])
  {
    uint64_t v5 = NTKClockFaceLocalizedString();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKCaliforniaFaceComplicationDescriptor;
    uint64_t v5 = [(NTKCaliforniaFaceComplicationDescriptor *)&v8 localizedNameForComplicationSlot:v4];
  }
  objc_super v6 = (void *)v5;

  return v6;
}

- (BOOL)complicationExistenceInvalidatesSnapshot
{
  return 1;
}

- (id)richComplicationSlotsForDevice:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCaliforniaFaceComplicationDescriptor;
  id v3 = [(NTKCaliforniaFaceComplicationDescriptor *)&v6 richComplicationSlotsForDevice:a3];
  id v4 = [v3 arrayByAddingObject:NTKComplicationSlotSubdialBottom];

  return v4;
}

@end