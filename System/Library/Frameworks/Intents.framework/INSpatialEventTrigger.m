@interface INSpatialEventTrigger
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (CLPlacemark)placemark;
- (INSpatialEvent)event;
- (INSpatialEventTrigger)init;
- (INSpatialEventTrigger)initWithCoder:(id)a3;
- (INSpatialEventTrigger)initWithMobileSpace:(int64_t)a3 event:(int64_t)a4;
- (INSpatialEventTrigger)initWithPlacemark:(CLPlacemark *)placemark event:(INSpatialEvent)event;
- (INSpatialEventTrigger)initWithPlacemark:(id)a3 event:(int64_t)a4 suggestedValues:(id)a5 mobileSpace:(int64_t)a6;
- (NSArray)suggestedValues;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)mobileSpace;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INSpatialEventTrigger

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  v6 = [(INSpatialEventTrigger *)self placemark];
  v7 = objc_msgSend(v6, "_intents_readableTitleWithLocalizer:", v5);

  INSpatialEvent v8 = [(INSpatialEventTrigger *)self event];
  if (v8)
  {
    if (v8 == INSpatialEventDepart)
    {
      id v9 = [NSString alloc];
      v10 = @"Leaving: %@";
    }
    else
    {
      if (v8 != INSpatialEventArrive) {
        goto LABEL_8;
      }
      id v9 = [NSString alloc];
      v10 = @"Arriving: %@";
    }
    v11 = INLocalizedStringWithLocalizer(v10, v10, v5);
    v12 = [v5 locale];
    self = (INSpatialEventTrigger *)objc_msgSend(v9, "initWithFormat:locale:", v11, v12, v7);
  }
  else
  {
    self = v7;
  }
LABEL_8:

  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedValues, 0);

  objc_storeStrong((id *)&self->_placemark, 0);
}

- (int64_t)mobileSpace
{
  return self->_mobileSpace;
}

- (NSArray)suggestedValues
{
  return self->_suggestedValues;
}

- (INSpatialEvent)event
{
  return self->_event;
}

- (CLPlacemark)placemark
{
  return self->_placemark;
}

- (id)_dictionaryRepresentation
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v11[0] = @"placemark";
  placemark = self->_placemark;
  v4 = placemark;
  if (!placemark)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"event";
  id v5 = [NSNumber numberWithInteger:self->_event];
  v12[1] = v5;
  v11[2] = @"suggestedValues";
  suggestedValues = self->_suggestedValues;
  v7 = suggestedValues;
  if (!suggestedValues)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v7;
  v11[3] = @"mobileSpace";
  INSpatialEvent v8 = [NSNumber numberWithInteger:self->_mobileSpace];
  v12[3] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];

  if (!suggestedValues) {
  if (!placemark)
  }

  return v9;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  id v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INSpatialEventTrigger;
  v6 = [(INSpatialEventTrigger *)&v11 description];
  v7 = [(INSpatialEventTrigger *)self _dictionaryRepresentation];
  INSpatialEvent v8 = [v7 descriptionAtIndent:a3];
  id v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INSpatialEventTrigger *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  INSpatialEvent v8 = [v6 encodeObject:self->_placemark];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"placemark");

  int64_t event = self->_event;
  v10 = @"unknown";
  if (event == 2) {
    v10 = @"depart";
  }
  if (event == 1) {
    objc_super v11 = @"arrive";
  }
  else {
    objc_super v11 = v10;
  }
  v12 = v11;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"event");

  v13 = [v6 encodeObject:self->_suggestedValues];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"suggestedValues");
  if (self->_mobileSpace == 1) {
    v14 = @"car";
  }
  else {
    v14 = @"unknown";
  }
  v15 = v14;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, @"mobileSpace");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  placemark = self->_placemark;
  id v5 = a3;
  [v5 encodeObject:placemark forKey:@"placemark"];
  [v5 encodeInteger:self->_event forKey:@"event"];
  [v5 encodeObject:self->_suggestedValues forKey:@"suggestedValues"];
  [v5 encodeInteger:self->_mobileSpace forKey:@"mobileSpace"];
}

- (INSpatialEventTrigger)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placemark"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"event"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  INSpatialEvent v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  id v9 = [v7 setWithArray:v8];
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"suggestedValues"];

  uint64_t v11 = [v4 decodeIntegerForKey:@"mobileSpace"];
  v12 = [(INSpatialEventTrigger *)self initWithPlacemark:v5 event:v6 suggestedValues:v10 mobileSpace:v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INSpatialEventTrigger *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      placemark = self->_placemark;
      BOOL v8 = (placemark == v5->_placemark || -[CLPlacemark isEqual:](placemark, "isEqual:"))
        && self->_event == v5->_event
        && ((suggestedValues = self->_suggestedValues, suggestedValues == v5->_suggestedValues)
         || -[NSArray isEqual:](suggestedValues, "isEqual:"))
        && self->_mobileSpace == v5->_mobileSpace;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(CLPlacemark *)self->_placemark hash];
  id v4 = [NSNumber numberWithInteger:self->_event];
  uint64_t v5 = [v4 hash];
  uint64_t v6 = v5 ^ v3 ^ [(NSArray *)self->_suggestedValues hash];
  v7 = [NSNumber numberWithInteger:self->_mobileSpace];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (INSpatialEventTrigger)initWithMobileSpace:(int64_t)a3 event:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)INSpatialEventTrigger;
  result = [(INSpatialEventTrigger *)&v7 init];
  if (result)
  {
    result->_int64_t event = a4;
    result->_mobileSpace = a3;
  }
  return result;
}

- (INSpatialEventTrigger)initWithPlacemark:(id)a3 event:(int64_t)a4 suggestedValues:(id)a5 mobileSpace:(int64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)INSpatialEventTrigger;
  v12 = [(INSpatialEventTrigger *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    placemark = v12->_placemark;
    v12->_placemark = (CLPlacemark *)v13;

    v12->_int64_t event = a4;
    uint64_t v15 = [v11 copy];
    suggestedValues = v12->_suggestedValues;
    v12->_suggestedValues = (NSArray *)v15;

    v12->_mobileSpace = a6;
  }

  return v12;
}

- (INSpatialEventTrigger)initWithPlacemark:(CLPlacemark *)placemark event:(INSpatialEvent)event
{
  uint64_t v6 = placemark;
  v11.receiver = self;
  v11.super_class = (Class)INSpatialEventTrigger;
  objc_super v7 = [(INSpatialEventTrigger *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [(CLPlacemark *)v6 copy];
    id v9 = v7->_placemark;
    v7->_placemark = (CLPlacemark *)v8;

    v7->_int64_t event = event;
  }

  return v7;
}

- (INSpatialEventTrigger)init
{
  v3.receiver = self;
  v3.super_class = (Class)INSpatialEventTrigger;
  return [(INSpatialEventTrigger *)&v3 init];
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    id v10 = [v8 objectForKeyedSubscript:@"placemark"];
    objc_super v11 = [v7 decodeObjectOfClass:v9 from:v10];

    v12 = [v8 objectForKeyedSubscript:@"event"];
    uint64_t v13 = INSpatialEventWithString(v12);

    uint64_t v14 = objc_opt_class();
    uint64_t v15 = [v8 objectForKeyedSubscript:@"suggestedValues"];
    v16 = [v7 decodeObjectsOfClass:v14 from:v15];

    v17 = [v8 objectForKeyedSubscript:@"mobileSpace"];
    uint64_t v18 = [v17 isEqualToString:@"car"];

    v19 = (void *)[objc_alloc((Class)a1) initWithPlacemark:v11 event:v13 suggestedValues:v16 mobileSpace:v18];
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end