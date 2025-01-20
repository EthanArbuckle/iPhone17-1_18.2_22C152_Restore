@interface INReportIncidentIntent
+ (BOOL)supportsSecureCoding;
- (CLPlacemark)userLocation;
- (INReportIncidentIntent)initWithIncidentType:(id)a3 startTime:(id)a4 additionalDetails:(id)a5 isClear:(id)a6;
- (INReportIncidentIntent)initWithIncidentType:(id)a3 startTime:(id)a4 isClear:(id)a5 userLocation:(id)a6 additionalDetails:(id)a7;
- (NSNumber)isClear;
- (NSNumber)startTime;
- (NSString)additionalDetails;
- (NSString)incidentType;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAdditionalDetails:(id)a3;
- (void)setIncidentType:(id)a3;
- (void)setIsClear:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setUserLocation:(id)a3;
@end

@implementation INReportIncidentIntent

- (INReportIncidentIntent)initWithIncidentType:(id)a3 startTime:(id)a4 additionalDetails:(id)a5 isClear:(id)a6
{
  return [(INReportIncidentIntent *)self initWithIncidentType:0 startTime:a4 isClear:a6 userLocation:0 additionalDetails:a5];
}

- (id)verb
{
  return @"ReportIncident";
}

- (id)domain
{
  return @"Geo";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INReportIncidentIntent *)self _typedBackingStore];
  id v13 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 userLocation];
  v10 = INIntentSlotValueRedactedLocationFromLocation(v9, a3, v13);
  [v8 setUserLocation:v10];

  v11 = [v7 additionalDetails];
  v12 = INIntentSlotValueRedactedStringFromString(v11, a3, v13);

  [v8 setAdditionalDetails:v12];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v17[5] = *MEMORY[0x1E4F143B8];
  v16[0] = @"incidentType";
  uint64_t v3 = [(INReportIncidentIntent *)self incidentType];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v3;
  v16[1] = @"startTime";
  v5 = [(INReportIncidentIntent *)self startTime];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v6;
  v16[2] = @"isClear";
  v7 = [(INReportIncidentIntent *)self isClear];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[2] = v8;
  v16[3] = @"userLocation";
  v9 = [(INReportIncidentIntent *)self userLocation];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[3] = v10;
  v16[4] = @"additionalDetails";
  v11 = [(INReportIncidentIntent *)self additionalDetails];
  v12 = v11;
  if (!v11)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[4] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
  if (!v11) {

  }
  if (!v9) {
  if (!v7)
  }

  if (!v5) {
  if (!v4)
  }

  return v13;
}

- (void)setAdditionalDetails:(id)a3
{
  id v4 = a3;
  id v6 = [(INReportIncidentIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToString(v4);

  [v6 setAdditionalDetails:v5];
}

- (NSString)additionalDetails
{
  v2 = [(INReportIncidentIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 additionalDetails];
  id v4 = INIntentSlotValueTransformFromString(v3);

  return (NSString *)v4;
}

- (void)setUserLocation:(id)a3
{
  id v4 = a3;
  id v6 = [(INReportIncidentIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToLocation(v4);

  [v6 setUserLocation:v5];
}

- (CLPlacemark)userLocation
{
  v2 = [(INReportIncidentIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 userLocation];
  id v4 = INIntentSlotValueTransformFromLocation(v3);

  return (CLPlacemark *)v4;
}

- (void)setIsClear:(id)a3
{
  id v5 = a3;
  id v4 = [(INReportIncidentIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setIsClear:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasIsClear:0];
  }
}

- (NSNumber)isClear
{
  uint64_t v3 = [(INReportIncidentIntent *)self _typedBackingStore];
  if ([v3 hasIsClear])
  {
    id v4 = NSNumber;
    id v5 = [(INReportIncidentIntent *)self _typedBackingStore];
    id v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "isClear"));
  }
  else
  {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setStartTime:(id)a3
{
  id v5 = a3;
  id v4 = [(INReportIncidentIntent *)self _typedBackingStore];
  if (v5)
  {
    [v5 doubleValue];
    objc_msgSend(v4, "setStartTime:");
  }
  else
  {
    [v4 setHasStartTime:0];
  }
}

- (NSNumber)startTime
{
  uint64_t v3 = [(INReportIncidentIntent *)self _typedBackingStore];
  if ([v3 hasStartTime])
  {
    id v4 = NSNumber;
    id v5 = [(INReportIncidentIntent *)self _typedBackingStore];
    [v5 startTime];
    id v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setIncidentType:(id)a3
{
  id v4 = a3;
  id v6 = [(INReportIncidentIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToSupportedTrafficIncidentType(v4);

  [v6 setIncidentType:v5];
}

- (NSString)incidentType
{
  v2 = [(INReportIncidentIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 incidentType];
  id v4 = INIntentSlotValueTransformFromSupportedTrafficIncidentType(v3);

  return (NSString *)v4;
}

- (INReportIncidentIntent)initWithIncidentType:(id)a3 startTime:(id)a4 isClear:(id)a5 userLocation:(id)a6 additionalDetails:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)INReportIncidentIntent;
  v17 = [(INIntent *)&v20 init];
  v18 = v17;
  if (v17)
  {
    [(INReportIncidentIntent *)v17 setIncidentType:v12];
    [(INReportIncidentIntent *)v18 setStartTime:v13];
    [(INReportIncidentIntent *)v18 setIsClear:v14];
    [(INReportIncidentIntent *)v18 setUserLocation:v15];
    [(INReportIncidentIntent *)v18 setAdditionalDetails:v16];
  }

  return v18;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INReportIncidentIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INReportIncidentIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end