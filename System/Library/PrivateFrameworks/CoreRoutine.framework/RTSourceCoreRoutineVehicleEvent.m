@interface RTSourceCoreRoutineVehicleEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (RTSourceCoreRoutineVehicleEvent)initWithCoder:(id)a3;
- (RTSourceCoreRoutineVehicleEvent)initWithVehicleEvent:(id)a3;
- (RTVehicleEvent)vehicleEvent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTSourceCoreRoutineVehicleEvent

- (RTSourceCoreRoutineVehicleEvent)initWithVehicleEvent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTSourceCoreRoutineVehicleEvent;
  v6 = [(RTSourceCoreRoutineVehicleEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_vehicleEvent, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTSourceCoreRoutineVehicleEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTSourceCoreRoutineVehicleEvent;
  id v5 = [(RTSourceCoreRoutine *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vehicleEvent"];
    vehicleEvent = v5->_vehicleEvent;
    v5->_vehicleEvent = (RTVehicleEvent *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTSourceCoreRoutineVehicleEvent;
  id v4 = a3;
  [(RTSourceCoreRoutine *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_vehicleEvent, @"vehicleEvent", v5.receiver, v5.super_class);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  vehicleEvent = self->_vehicleEvent;
  return (id)[v4 initWithVehicleEvent:vehicleEvent];
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RTSourceCoreRoutineVehicleEvent;
  if ([(RTSource *)&v12 isEqual:v5])
  {
    id v6 = v5;
    v7 = [(RTSourceCoreRoutineVehicleEvent *)self vehicleEvent];
    if (v7 || ([v6 vehicleEvent], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = [(RTSourceCoreRoutineVehicleEvent *)self vehicleEvent];
      objc_super v9 = [v6 vehicleEvent];
      char v10 = [v8 isEqual:v9];

      if (v7)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      char v10 = 1;
    }

    goto LABEL_9;
  }
  char v10 = 0;
LABEL_10:

  return v10;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)RTSourceCoreRoutineVehicleEvent;
  unint64_t v3 = [(RTSource *)&v7 hash];
  id v4 = [(RTSourceCoreRoutineVehicleEvent *)self vehicleEvent];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  id v6 = [(RTSourceCoreRoutineVehicleEvent *)self vehicleEvent];
  objc_super v7 = [v3 stringWithFormat:@"%@, vehicleEvent, %@", v5, v6];

  return v7;
}

- (RTVehicleEvent)vehicleEvent
{
  return self->_vehicleEvent;
}

- (void).cxx_destruct
{
}

@end