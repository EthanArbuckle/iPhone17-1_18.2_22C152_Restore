@interface EKPersistentLocation
+ (Class)alternateUniverseClass;
+ (Class)meltedClass;
+ (id)defaultPropertiesToLoad;
+ (id)relations;
- (id)address;
- (id)alarmOwner;
- (id)calendarItemOwner;
- (id)contactLabel;
- (id)copyWithZone:(_NSZone *)a3;
- (id)derivedFrom;
- (id)description;
- (id)latitude;
- (id)longitude;
- (id)mapKitHandle;
- (id)radius;
- (id)referenceFrame;
- (id)routing;
- (id)semanticIdentifier;
- (id)title;
- (int)entityType;
- (void)setAddress:(id)a3;
- (void)setAlarmOwner:(id)a3;
- (void)setCalendarItemOwner:(id)a3;
- (void)setContactLabel:(id)a3;
- (void)setDerivedFrom:(id)a3;
- (void)setLatitude:(id)a3;
- (void)setLongitude:(id)a3;
- (void)setMapKitHandle:(id)a3;
- (void)setRadius:(id)a3;
- (void)setReferenceFrame:(id)a3;
- (void)setRouting:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation EKPersistentLocation

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken_3 != -1) {
    dispatch_once(&defaultPropertiesToLoad_onceToken_3, &__block_literal_global_25);
  }
  v2 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_3;

  return v2;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (id)title
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F570D0]];
}

- (id)address
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57078]];
}

- (id)longitude
{
  return [(EKPersistentObject *)self primitiveNumberValueForKey:*MEMORY[0x1E4F570A8]];
}

- (id)latitude
{
  return [(EKPersistentObject *)self primitiveNumberValueForKey:*MEMORY[0x1E4F570A0]];
}

+ (id)relations
{
  if (relations_onceToken_6 != -1) {
    dispatch_once(&relations_onceToken_6, &__block_literal_global_3_0);
  }
  v2 = (void *)relations_relations_6;

  return v2;
}

- (id)referenceFrame
{
  return [(EKPersistentObject *)self primitiveNumberValueForKey:*MEMORY[0x1E4F570C0]];
}

- (id)radius
{
  return [(EKPersistentObject *)self primitiveNumberValueForKey:*MEMORY[0x1E4F570B8]];
}

- (id)mapKitHandle
{
  return [(EKPersistentObject *)self primitiveDataValueForKey:*MEMORY[0x1E4F570B0]];
}

- (int)entityType
{
  return 14;
}

void __33__EKPersistentLocation_relations__block_invoke()
{
  uint64_t v0 = *MEMORY[0x1E4F56D10];
  v1 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F56D10], *MEMORY[0x1E4F56BC0], *MEMORY[0x1E4F56D30], *MEMORY[0x1E4F56BE8], 0);
  id v8 = +[EKRelation relationWithEntityName:@"CalendarItem" toMany:0 inversePropertyNames:v1 ownsRelated:0];

  [v8 setInversePropertyIsApplicable:&__block_literal_global_11];
  id v2 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v3 = *MEMORY[0x1E4F57088];
  v4 = [MEMORY[0x1E4F1CAD0] setWithObject:v0];
  v5 = +[EKRelation relationWithEntityName:@"Alarm" toMany:0 inversePropertyNames:v4 ownsRelated:0];
  uint64_t v6 = objc_msgSend(v2, "initWithObjectsAndKeys:", v8, v3, v5, *MEMORY[0x1E4F57080], 0);
  v7 = (void *)relations_relations_6;
  relations_relations_6 = v6;
}

void __47__EKPersistentLocation_defaultPropertiesToLoad__block_invoke()
{
  v5[7] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F57078];
  v5[0] = *MEMORY[0x1E4F570D0];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F570A8];
  v5[2] = *MEMORY[0x1E4F570A0];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F570B0];
  v5[4] = *MEMORY[0x1E4F57090];
  v5[5] = v2;
  v5[6] = *MEMORY[0x1E4F570C8];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:7];
  v4 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_3;
  defaultPropertiesToLoad_defaultPropertiesToLoad_3 = v3;
}

BOOL __33__EKPersistentLocation_relations__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v7 primitiveRelationValueForKey:v6];
    BOOL v10 = v9 == v8;
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

+ (Class)alternateUniverseClass
{
  return (Class)objc_opt_class();
}

- (void)setTitle:(id)a3
{
}

- (void)setAddress:(id)a3
{
}

- (void)setLatitude:(id)a3
{
}

- (void)setLongitude:(id)a3
{
}

- (void)setReferenceFrame:(id)a3
{
}

- (void)setRadius:(id)a3
{
}

- (id)contactLabel
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57090]];
}

- (void)setContactLabel:(id)a3
{
}

- (void)setMapKitHandle:(id)a3
{
}

- (id)routing
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F570C8]];
}

- (void)setRouting:(id)a3
{
}

- (id)derivedFrom
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57098]];
}

- (void)setDerivedFrom:(id)a3
{
}

- (void)setCalendarItemOwner:(id)a3
{
}

- (id)calendarItemOwner
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F57088]];
}

- (void)setAlarmOwner:(id)a3
{
}

- (id)alarmOwner
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F57080]];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(EKPersistentLocation);
  v5 = [(EKPersistentLocation *)self title];
  [(EKPersistentLocation *)v4 setTitle:v5];

  id v6 = [(EKPersistentLocation *)self address];
  [(EKPersistentLocation *)v4 setAddress:v6];

  id v7 = [(EKPersistentLocation *)self latitude];
  [(EKPersistentLocation *)v4 setLatitude:v7];

  id v8 = [(EKPersistentLocation *)self longitude];
  [(EKPersistentLocation *)v4 setLongitude:v8];

  id v9 = [(EKPersistentLocation *)self contactLabel];
  [(EKPersistentLocation *)v4 setContactLabel:v9];

  BOOL v10 = [(EKPersistentLocation *)self mapKitHandle];
  [(EKPersistentLocation *)v4 setMapKitHandle:v10];

  v11 = [(EKPersistentLocation *)self radius];
  [(EKPersistentLocation *)v4 setRadius:v11];

  v12 = [(EKPersistentLocation *)self routing];
  [(EKPersistentLocation *)v4 setRouting:v12];

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(EKPersistentLocation *)self title];
  id v6 = [(EKPersistentLocation *)self address];
  id v7 = [(EKPersistentLocation *)self latitude];
  id v8 = [(EKPersistentLocation *)self longitude];
  id v9 = [(EKPersistentLocation *)self contactLabel];
  BOOL v10 = [(EKPersistentLocation *)self radius];
  v11 = [(EKPersistentLocation *)self routing];
  objc_msgSend(v3, "stringWithFormat:", @"%@ <%p> {title = %@; address = %@; lat = %@; long = %@; abID = %@; radius = %@, routing = %@}",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
  v12 = v11);

  return v12;
}

- (id)semanticIdentifier
{
  uint64_t v3 = [(EKPersistentLocation *)self title];
  uint64_t v4 = [(EKPersistentLocation *)self address];
  v5 = [(EKPersistentLocation *)self mapKitHandle];
  id v6 = [(EKPersistentLocation *)self contactLabel];
  id v7 = [(EKPersistentLocation *)self latitude];
  id v8 = [(EKPersistentLocation *)self longitude];
  id v9 = [(EKPersistentLocation *)self radius];
  BOOL v10 = +[EKStructuredLocationSemanticIdentifierGenerator semanticIdentifierForLocationWithTitle:v3 address:v4 mapKitHandle:v5 contactLabel:v6 latitude:v7 longitude:v8 radius:v9];

  return v10;
}

@end