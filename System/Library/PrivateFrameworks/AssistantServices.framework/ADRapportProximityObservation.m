@interface ADRapportProximityObservation
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADRapportProximityObservation)init;
- (ADRapportProximityObservation)initWithBuilder:(id)a3;
- (ADRapportProximityObservation)initWithCoder:(id)a3;
- (ADRapportProximityObservation)initWithDeviceIDPair:(id)a3 proximity:(int)a4 observationDate:(id)a5;
- (ADRapportProximityObservation)initWithDictionaryRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)observationDate;
- (NSSet)deviceIDPair;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (int)proximity;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADRapportProximityObservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationDate, 0);
  objc_storeStrong((id *)&self->_deviceIDPair, 0);
}

- (NSDate)observationDate
{
  return self->_observationDate;
}

- (int)proximity
{
  return self->_proximity;
}

- (NSSet)deviceIDPair
{
  return self->_deviceIDPair;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  if (self->_deviceIDPair)
  {
    id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSSet count](self->_deviceIDPair, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v5 = self->_deviceIDPair;
    id v6 = [(NSSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v4, "addObject:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        }
        id v7 = [(NSSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    id v10 = [v4 copy];
    [v3 setObject:v10 forKey:@"deviceIDPair"];
  }
  v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_proximity, (void)v15);
  [v3 setObject:v11 forKey:@"proximity"];

  observationDate = self->_observationDate;
  if (observationDate) {
    [v3 setObject:observationDate forKey:@"observationDate"];
  }
  id v13 = [v3 copy];

  return v13;
}

- (ADRapportProximityObservation)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKey:@"deviceIDPair"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v8 = v6;
      id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v24;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v24 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(id *)(*((void *)&v23 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v14 = v13;

              if (v14) {
                objc_msgSend(v7, "addObject:", v14, (void)v23);
              }
            }
            else
            {

              id v14 = 0;
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v10);
      }

      id v15 = [objc_alloc((Class)NSSet) initWithArray:v7];
    }
    else
    {
      id v15 = 0;
    }

    long long v17 = [v5 objectForKey:@"proximity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }

    id v19 = [v18 intValue];
    v20 = [v5 objectForKey:@"observationDate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }

    self = [(ADRapportProximityObservation *)self initWithDeviceIDPair:v15 proximity:v19 observationDate:v21];
    long long v16 = self;
  }
  else
  {
    long long v16 = 0;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  deviceIDPair = self->_deviceIDPair;
  id v6 = a3;
  [v6 encodeObject:deviceIDPair forKey:@"ADRapportProximityObservation::deviceIDPair"];
  v5 = +[NSNumber numberWithInt:self->_proximity];
  [v6 encodeObject:v5 forKey:@"ADRapportProximityObservation::proximity"];

  [v6 encodeObject:self->_observationDate forKey:@"ADRapportProximityObservation::observationDate"];
}

- (ADRapportProximityObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
  id v7 = [v4 decodeObjectOfClasses:v6 forKey:@"ADRapportProximityObservation::deviceIDPair"];

  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADRapportProximityObservation::proximity"];
  id v9 = [v8 intValue];

  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADRapportProximityObservation::observationDate"];

  uint64_t v11 = [(ADRapportProximityObservation *)self initWithDeviceIDPair:v7 proximity:v9 observationDate:v10];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADRapportProximityObservation *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int proximity = self->_proximity;
      if (proximity == [(ADRapportProximityObservation *)v5 proximity])
      {
        id v7 = [(ADRapportProximityObservation *)v5 deviceIDPair];
        deviceIDPair = self->_deviceIDPair;
        if (deviceIDPair == v7 || [(NSSet *)deviceIDPair isEqual:v7])
        {
          id v9 = [(ADRapportProximityObservation *)v5 observationDate];
          observationDate = self->_observationDate;
          BOOL v11 = observationDate == v9 || [(NSDate *)observationDate isEqual:v9];
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSSet *)self->_deviceIDPair hash];
  id v4 = +[NSNumber numberWithInt:self->_proximity];
  unint64_t v5 = (unint64_t)[v4 hash];
  unint64_t v6 = v5 ^ v3 ^ (unint64_t)[(NSDate *)self->_observationDate hash];

  return v6;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)ADRapportProximityObservation;
  unint64_t v5 = [(ADRapportProximityObservation *)&v8 description];
  id v6 = [v4 initWithFormat:@"%@ {deviceIDPair = %@, proximity = %d, observationDate = %@}", v5, self->_deviceIDPair, self->_proximity, self->_observationDate];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(ADRapportProximityObservation *)self _descriptionWithIndent:0];
}

- (ADRapportProximityObservation)initWithDeviceIDPair:(id)a3 proximity:(int)a4 observationDate:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10034DE64;
  v11[3] = &unk_10050D350;
  int v14 = a4;
  id v12 = a3;
  id v13 = a5;
  id v7 = v13;
  id v8 = v12;
  id v9 = [(ADRapportProximityObservation *)self initWithBuilder:v11];

  return v9;
}

- (ADRapportProximityObservation)init
{
  return [(ADRapportProximityObservation *)self initWithBuilder:0];
}

- (ADRapportProximityObservation)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _ADRapportProximityObservationMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)ADRapportProximityObservation;
  unint64_t v5 = [(ADRapportProximityObservation *)&v15 init];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_ADRapportProximityObservationMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_ADRapportProximityObservationMutation *)v7 isDirty])
    {
      id v8 = [(_ADRapportProximityObservationMutation *)v7 getDeviceIDPair];
      id v9 = (NSSet *)[v8 copy];
      deviceIDPair = v6->_deviceIDPair;
      v6->_deviceIDPair = v9;

      v6->_int proximity = [(_ADRapportProximityObservationMutation *)v7 getProximity];
      BOOL v11 = [(_ADRapportProximityObservationMutation *)v7 getObservationDate];
      id v12 = (NSDate *)[v11 copy];
      observationDate = v6->_observationDate;
      v6->_observationDate = v12;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _ADRapportProximityObservationMutation *))a3;
  if (v4)
  {
    unint64_t v5 = [[_ADRapportProximityObservationMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADRapportProximityObservationMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(ADRapportProximityObservation);
      id v7 = [(_ADRapportProximityObservationMutation *)v5 getDeviceIDPair];
      id v8 = (NSSet *)[v7 copy];
      deviceIDPair = v6->_deviceIDPair;
      v6->_deviceIDPair = v8;

      v6->_int proximity = [(_ADRapportProximityObservationMutation *)v5 getProximity];
      id v10 = [(_ADRapportProximityObservationMutation *)v5 getObservationDate];
      BOOL v11 = (NSDate *)[v10 copy];
      observationDate = v6->_observationDate;
      v6->_observationDate = v11;
    }
    else
    {
      id v6 = (ADRapportProximityObservation *)[(ADRapportProximityObservation *)self copy];
    }
  }
  else
  {
    id v6 = (ADRapportProximityObservation *)[(ADRapportProximityObservation *)self copy];
  }

  return v6;
}

@end