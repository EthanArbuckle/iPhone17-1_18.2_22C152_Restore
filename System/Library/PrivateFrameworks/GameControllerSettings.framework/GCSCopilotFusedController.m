@interface GCSCopilotFusedController
+ (BOOL)supportsSecureCoding;
+ (id)archivalClasses;
- (GCSCopilotFusedController)initWithCoder:(id)a3;
- (GCSCopilotFusedController)initWithFusedControllerIdentifier:(id)a3 pilotIdentifier:(id)a4 copilotIdentifier:(id)a5;
- (GCSCopilotFusedController)initWithJSONObject:(id)a3;
- (GCSJSONObject)jsonObject;
- (NSDate)modifiedDate;
- (NSString)copilotIdentifier;
- (NSString)fusedControllerIdentifier;
- (NSString)pilotIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCSCopilotFusedController

- (GCSCopilotFusedController)initWithFusedControllerIdentifier:(id)a3 pilotIdentifier:(id)a4 copilotIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)GCSCopilotFusedController;
  v11 = [(GCSCopilotFusedController *)&v21 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    fusedControllerIdentifier = v11->_fusedControllerIdentifier;
    v11->_fusedControllerIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    pilotIdentifier = v11->_pilotIdentifier;
    v11->_pilotIdentifier = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    copilotIdentifier = v11->_copilotIdentifier;
    v11->_copilotIdentifier = (NSString *)v16;

    uint64_t v18 = +[NSDate date];
    modifiedDate = v11->_modifiedDate;
    v11->_modifiedDate = (NSDate *)v18;
  }
  return v11;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<GCSCopilotFusedController '%@' '%@' + '%@'>", self->_fusedControllerIdentifier, self->_pilotIdentifier, self->_copilotIdentifier];
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (NSString)fusedControllerIdentifier
{
  return self->_fusedControllerIdentifier;
}

- (NSString)pilotIdentifier
{
  return self->_pilotIdentifier;
}

- (NSString)copilotIdentifier
{
  return self->_copilotIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_copilotIdentifier, 0);
  objc_storeStrong((id *)&self->_pilotIdentifier, 0);
  objc_storeStrong((id *)&self->_fusedControllerIdentifier, 0);
  objc_storeStrong((id *)&self->_modifiedDate, 0);
}

+ (id)archivalClasses
{
  uint64_t v2 = objc_opt_class();
  return +[NSSet setWithObjects:](&off_26D32CB10, "setWithObjects:", v2, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSCopilotFusedController)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GCSCopilotFusedController;
  v5 = [(GCSCopilotFusedController *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fusedControllerIdentifier"];
    fusedControllerIdentifier = v5->_fusedControllerIdentifier;
    v5->_fusedControllerIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_pilotIdentifier"];
    pilotIdentifier = v5->_pilotIdentifier;
    v5->_pilotIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_copilotIdentifier"];
    copilotIdentifier = v5->_copilotIdentifier;
    v5->_copilotIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_modifiedDate"];
    modifiedDate = v5->_modifiedDate;
    v5->_modifiedDate = (NSDate *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  fusedControllerIdentifier = self->_fusedControllerIdentifier;
  id v5 = a3;
  [v5 encodeObject:fusedControllerIdentifier forKey:@"_fusedControllerIdentifier"];
  [v5 encodeObject:self->_pilotIdentifier forKey:@"_pilotIdentifier"];
  [v5 encodeObject:self->_copilotIdentifier forKey:@"_copilotIdentifier"];
  [v5 encodeObject:self->_modifiedDate forKey:@"_modifiedDate"];
}

- (GCSCopilotFusedController)initWithJSONObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v19.receiver = self;
    v19.super_class = (Class)GCSCopilotFusedController;
    uint64_t v6 = [(GCSCopilotFusedController *)&v19 init];
    if (v6)
    {
      uint64_t v7 = objc_msgSend(v5, "_gcs_stringForJSONKey:", @"fusedControllerIdentifier");
      fusedControllerIdentifier = v6->_fusedControllerIdentifier;
      v6->_fusedControllerIdentifier = (NSString *)v7;

      uint64_t v9 = objc_msgSend(v5, "_gcs_stringForJSONKey:", @"pilotIdentifier");
      pilotIdentifier = v6->_pilotIdentifier;
      v6->_pilotIdentifier = (NSString *)v9;

      uint64_t v11 = objc_msgSend(v5, "_gcs_stringForJSONKey:", @"copilotIdentifier");
      copilotIdentifier = v6->_copilotIdentifier;
      v6->_copilotIdentifier = (NSString *)v11;

      v13 = objc_msgSend(v5, "_gcs_dateForJSONKey:", @"modifiedDate");
      uint64_t v14 = v13;
      if (v13)
      {
        objc_super v15 = v13;
      }
      else
      {
        objc_super v15 = +[NSDate date];
      }
      modifiedDate = v6->_modifiedDate;
      v6->_modifiedDate = v15;
    }
    self = v6;

    uint64_t v16 = self;
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (GCSJSONObject)jsonObject
{
  long long v3 = *(_OWORD *)&self->_fusedControllerIdentifier;
  v9[0] = @"fusedControllerIdentifier";
  v9[1] = @"pilotIdentifier";
  long long v10 = v3;
  v9[2] = @"copilotIdentifier";
  copilotIdentifier = self->_copilotIdentifier;
  id v4 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:v9 count:3];
  id v5 = +[NSMutableDictionary dictionaryWithDictionary:v4];

  modifiedDate = self->_modifiedDate;
  if (modifiedDate)
  {
    uint64_t v7 = [(NSDate *)modifiedDate jsonObject];
    [v5 setObject:v7 forKeyedSubscript:@"modifiedDate"];
  }
  return (GCSJSONObject *)v5;
}

@end