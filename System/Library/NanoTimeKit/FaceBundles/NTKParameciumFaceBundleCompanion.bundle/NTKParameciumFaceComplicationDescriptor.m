@interface NTKParameciumFaceComplicationDescriptor
- (BOOL)complicationExistenceInvalidatesSnapshot;
- (id)complicationSlotDescriptors;
- (id)localizedNameForComplicationSlot:(id)a3;
- (id)orderedComplicationSlots;
- (id)richComplicationSlotsForDevice:(id)a3;
@end

@implementation NTKParameciumFaceComplicationDescriptor

- (id)complicationSlotDescriptors
{
  v8.receiver = self;
  v8.super_class = (Class)NTKParameciumFaceComplicationDescriptor;
  v2 = [(NTKParameciumFaceComplicationDescriptor *)&v8 complicationSlotDescriptors];
  id v3 = [v2 mutableCopy];

  v4 = +[NSMutableIndexSet indexSet];
  [v4 addIndex:57];
  [v4 addIndex:14];
  [v4 addIndex:1];
  uint64_t v9 = NTKComplicationSlotSubdialTop;
  v5 = NTKComplicationSlotDescriptor();
  v10 = v5;
  v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

  [v3 addEntriesFromDictionary:v6];

  return v3;
}

- (id)orderedComplicationSlots
{
  v6.receiver = self;
  v6.super_class = (Class)NTKParameciumFaceComplicationDescriptor;
  v2 = [(NTKParameciumFaceComplicationDescriptor *)&v6 orderedComplicationSlots];
  uint64_t v7 = NTKComplicationSlotSubdialTop;
  id v3 = +[NSArray arrayWithObjects:&v7 count:1];
  v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

- (id)localizedNameForComplicationSlot:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKParameciumFaceComplicationDescriptor;
  id v3 = [(NTKParameciumFaceComplicationDescriptor *)&v5 localizedNameForComplicationSlot:a3];

  return v3;
}

- (BOOL)complicationExistenceInvalidatesSnapshot
{
  return 1;
}

- (id)richComplicationSlotsForDevice:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKParameciumFaceComplicationDescriptor;
  id v3 = [(NTKParameciumFaceComplicationDescriptor *)&v5 richComplicationSlotsForDevice:a3];

  return v3;
}

@end