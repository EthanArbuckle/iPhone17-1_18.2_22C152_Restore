@interface AFLocationSnapshot
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFLocationSnapshot)init;
- (AFLocationSnapshot)initWithBuilder:(id)a3;
- (AFLocationSnapshot)initWithCoder:(id)a3;
- (AFLocationSnapshot)initWithDictionaryRepresentation:(id)a3;
- (AFLocationSnapshot)initWithLatitude:(id)a3 longitude:(id)a4 altitude:(id)a5 direction:(id)a6 speed:(id)a7 verticalAccuracy:(id)a8 horizontalAccuracy:(id)a9 preciseLocationEnabled:(BOOL)a10 accessState:(int64_t)a11;
- (AFLocationSnapshot)initWithSerializedBackingStore:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)preciseLocationEnabled;
- (NSNumber)altitude;
- (NSNumber)direction;
- (NSNumber)horizontalAccuracy;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSNumber)speed;
- (NSNumber)verticalAccuracy;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)ace_setRequestOrigin;
- (id)ad_shortDescription;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)accessState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFLocationSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalAccuracy, 0);
  objc_storeStrong((id *)&self->_verticalAccuracy, 0);
  objc_storeStrong((id *)&self->_speed, 0);
  objc_storeStrong((id *)&self->_direction, 0);
  objc_storeStrong((id *)&self->_altitude, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
}

- (int64_t)accessState
{
  return self->_accessState;
}

- (BOOL)preciseLocationEnabled
{
  return self->_preciseLocationEnabled;
}

- (NSNumber)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (NSNumber)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (NSNumber)speed
{
  return self->_speed;
}

- (NSNumber)direction
{
  return self->_direction;
}

- (NSNumber)altitude
{
  return self->_altitude;
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  latitude = self->_latitude;
  if (latitude) {
    [v3 setObject:latitude forKey:@"latitude"];
  }
  longitude = self->_longitude;
  if (longitude) {
    [v4 setObject:longitude forKey:@"longitude"];
  }
  altitude = self->_altitude;
  if (altitude) {
    [v4 setObject:altitude forKey:@"altitude"];
  }
  direction = self->_direction;
  if (direction) {
    [v4 setObject:direction forKey:@"direction"];
  }
  speed = self->_speed;
  if (speed) {
    [v4 setObject:speed forKey:@"speed"];
  }
  verticalAccuracy = self->_verticalAccuracy;
  if (verticalAccuracy) {
    [v4 setObject:verticalAccuracy forKey:@"verticalAccuracy"];
  }
  horizontalAccuracy = self->_horizontalAccuracy;
  if (horizontalAccuracy) {
    [v4 setObject:horizontalAccuracy forKey:@"horizontalAccuracy"];
  }
  v12 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_preciseLocationEnabled];
  [v4 setObject:v12 forKey:@"preciseLocationEnabled"];

  unint64_t accessState = self->_accessState;
  if (accessState > 3) {
    v14 = @"(unknown)";
  }
  else {
    v14 = off_1E5924A50[accessState];
  }
  v15 = v14;
  [v4 setObject:v15 forKey:@"accessState"];

  v16 = (void *)[v4 copy];
  return v16;
}

- (AFLocationSnapshot)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"latitude"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v27 = v6;
    }
    else {
      id v27 = 0;
    }

    v8 = [v5 objectForKey:@"longitude"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v26 = v8;
    }
    else {
      id v26 = 0;
    }

    v9 = [v5 objectForKey:@"altitude"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    v11 = [v5 objectForKey:@"direction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    v13 = [v5 objectForKey:@"speed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    v15 = [v5 objectForKey:@"verticalAccuracy"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }

    v17 = [v5 objectForKey:@"horizontalAccuracy"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }

    v19 = [v5 objectForKey:@"preciseLocationEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }

    char v21 = [v20 BOOLValue];
    v22 = [v5 objectForKey:@"accessState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v23 = AFLocationAccessStateGetFromName(v22);
    }
    else {
      uint64_t v23 = 0;
    }

    LOBYTE(v25) = v21;
    self = [(AFLocationSnapshot *)self initWithLatitude:v27 longitude:v26 altitude:v10 direction:v12 speed:v14 verticalAccuracy:v16 horizontalAccuracy:v18 preciseLocationEnabled:v25 accessState:v23];

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  latitude = self->_latitude;
  id v5 = a3;
  [v5 encodeObject:latitude forKey:@"AFLocationSnapshot::latitude"];
  [v5 encodeObject:self->_longitude forKey:@"AFLocationSnapshot::longitude"];
  [v5 encodeObject:self->_altitude forKey:@"AFLocationSnapshot::altitude"];
  [v5 encodeObject:self->_direction forKey:@"AFLocationSnapshot::direction"];
  [v5 encodeObject:self->_speed forKey:@"AFLocationSnapshot::speed"];
  [v5 encodeObject:self->_verticalAccuracy forKey:@"AFLocationSnapshot::verticalAccuracy"];
  [v5 encodeObject:self->_horizontalAccuracy forKey:@"AFLocationSnapshot::horizontalAccuracy"];
  v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_preciseLocationEnabled];
  [v5 encodeObject:v6 forKey:@"AFLocationSnapshot::preciseLocationEnabled"];

  id v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_accessState];
  [v5 encodeObject:v7 forKey:@"AFLocationSnapshot::accessState"];
}

- (AFLocationSnapshot)initWithCoder:(id)a3
{
  id v3 = a3;
  v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFLocationSnapshot::latitude"];
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFLocationSnapshot::longitude"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFLocationSnapshot::altitude"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFLocationSnapshot::direction"];
  id v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFLocationSnapshot::speed"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFLocationSnapshot::verticalAccuracy"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFLocationSnapshot::horizontalAccuracy"];
  id v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFLocationSnapshot::preciseLocationEnabled"];
  char v11 = [v10 BOOLValue];

  id v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFLocationSnapshot::accessState"];

  uint64_t v13 = [v12 integerValue];
  LOBYTE(v16) = v11;
  id v14 = [(AFLocationSnapshot *)self initWithLatitude:v17 longitude:v4 altitude:v5 direction:v6 speed:v7 verticalAccuracy:v8 horizontalAccuracy:v9 preciseLocationEnabled:v16 accessState:v13];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFLocationSnapshot *)a3;
  if (self == v4)
  {
    BOOL v22 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      BOOL preciseLocationEnabled = self->_preciseLocationEnabled;
      if (preciseLocationEnabled == [(AFLocationSnapshot *)v5 preciseLocationEnabled]
        && (int64_t accessState = self->_accessState, accessState == [(AFLocationSnapshot *)v5 accessState]))
      {
        v8 = [(AFLocationSnapshot *)v5 latitude];
        latitude = self->_latitude;
        if (latitude == v8 || [(NSNumber *)latitude isEqual:v8])
        {
          id v10 = [(AFLocationSnapshot *)v5 longitude];
          longitude = self->_longitude;
          if (longitude == v10 || [(NSNumber *)longitude isEqual:v10])
          {
            id v12 = [(AFLocationSnapshot *)v5 altitude];
            altitude = self->_altitude;
            if (altitude == v12 || [(NSNumber *)altitude isEqual:v12])
            {
              id v14 = [(AFLocationSnapshot *)v5 direction];
              direction = self->_direction;
              if (direction == v14 || [(NSNumber *)direction isEqual:v14])
              {
                uint64_t v16 = [(AFLocationSnapshot *)v5 speed];
                speed = self->_speed;
                if (speed == v16 || [(NSNumber *)speed isEqual:v16])
                {
                  id v18 = [(AFLocationSnapshot *)v5 verticalAccuracy];
                  verticalAccuracy = self->_verticalAccuracy;
                  if (verticalAccuracy == v18 || [(NSNumber *)verticalAccuracy isEqual:v18])
                  {
                    id v20 = [(AFLocationSnapshot *)v5 horizontalAccuracy];
                    horizontalAccuracy = self->_horizontalAccuracy;
                    BOOL v22 = horizontalAccuracy == v20
                       || [(NSNumber *)horizontalAccuracy isEqual:v20];
                  }
                  else
                  {
                    BOOL v22 = 0;
                  }
                }
                else
                {
                  BOOL v22 = 0;
                }
              }
              else
              {
                BOOL v22 = 0;
              }
            }
            else
            {
              BOOL v22 = 0;
            }
          }
          else
          {
            BOOL v22 = 0;
          }
        }
        else
        {
          BOOL v22 = 0;
        }
      }
      else
      {
        BOOL v22 = 0;
      }
    }
    else
    {
      BOOL v22 = 0;
    }
  }

  return v22;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_latitude hash];
  uint64_t v4 = [(NSNumber *)self->_longitude hash] ^ v3;
  uint64_t v5 = [(NSNumber *)self->_altitude hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSNumber *)self->_direction hash];
  uint64_t v7 = [(NSNumber *)self->_speed hash];
  uint64_t v8 = v7 ^ [(NSNumber *)self->_verticalAccuracy hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSNumber *)self->_horizontalAccuracy hash];
  id v10 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_preciseLocationEnabled];
  uint64_t v11 = [v10 hash];
  id v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_accessState];
  unint64_t v13 = v9 ^ v11 ^ [v12 hash];

  return v13;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v18 = [NSString alloc];
  v19.receiver = self;
  v19.super_class = (Class)AFLocationSnapshot;
  uint64_t v4 = [(AFLocationSnapshot *)&v19 description];
  latitude = self->_latitude;
  longitude = self->_longitude;
  altitude = self->_altitude;
  direction = self->_direction;
  speed = self->_speed;
  verticalAccuracy = self->_verticalAccuracy;
  horizontalAccuracy = self->_horizontalAccuracy;
  unint64_t accessState = self->_accessState;
  if (accessState > 3) {
    unint64_t v13 = @"(unknown)";
  }
  else {
    unint64_t v13 = off_1E5924A50[accessState];
  }
  if (self->_preciseLocationEnabled) {
    id v14 = @"YES";
  }
  else {
    id v14 = @"NO";
  }
  v15 = v13;
  v16 = (void *)[v18 initWithFormat:@"%@ {latitude = %@, longitude = %@, altitude = %@, direction = %@, speed = %@, verticalAccuracy = %@, horizontalAccuracy = %@, preciseLocationEnabled = %@, unint64_t accessState = %@}", v4, latitude, longitude, altitude, direction, speed, verticalAccuracy, horizontalAccuracy, v14, v15];

  return v16;
}

- (NSString)description
{
  return (NSString *)[(AFLocationSnapshot *)self _descriptionWithIndent:0];
}

- (AFLocationSnapshot)initWithLatitude:(id)a3 longitude:(id)a4 altitude:(id)a5 direction:(id)a6 speed:(id)a7 verticalAccuracy:(id)a8 horizontalAccuracy:(id)a9 preciseLocationEnabled:(BOOL)a10 accessState:(int64_t)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __145__AFLocationSnapshot_initWithLatitude_longitude_altitude_direction_speed_verticalAccuracy_horizontalAccuracy_preciseLocationEnabled_accessState___block_invoke;
  v33[3] = &unk_1E5928990;
  id v34 = v16;
  id v35 = v17;
  id v36 = v18;
  id v37 = v19;
  id v38 = v20;
  id v39 = v21;
  BOOL v42 = a10;
  id v40 = v22;
  int64_t v41 = a11;
  id v23 = v22;
  id v24 = v21;
  id v25 = v20;
  id v26 = v19;
  id v27 = v18;
  id v28 = v17;
  id v29 = v16;
  v30 = [(AFLocationSnapshot *)self initWithBuilder:v33];

  return v30;
}

void __145__AFLocationSnapshot_initWithLatitude_longitude_altitude_direction_speed_verticalAccuracy_horizontalAccuracy_preciseLocationEnabled_accessState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setLatitude:v3];
  [v4 setLongitude:*(void *)(a1 + 40)];
  [v4 setAltitude:*(void *)(a1 + 48)];
  [v4 setDirection:*(void *)(a1 + 56)];
  [v4 setSpeed:*(void *)(a1 + 64)];
  [v4 setVerticalAccuracy:*(void *)(a1 + 72)];
  [v4 setHorizontalAccuracy:*(void *)(a1 + 80)];
  [v4 setPreciseLocationEnabled:*(unsigned __int8 *)(a1 + 96)];
  [v4 setAccessState:*(void *)(a1 + 88)];
}

- (AFLocationSnapshot)init
{
  return [(AFLocationSnapshot *)self initWithBuilder:0];
}

- (AFLocationSnapshot)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFLocationSnapshotMutation *))a3;
  v30.receiver = self;
  v30.super_class = (Class)AFLocationSnapshot;
  uint64_t v5 = [(AFLocationSnapshot *)&v30 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [[_AFLocationSnapshotMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFLocationSnapshotMutation *)v7 isDirty])
    {
      uint64_t v8 = [(_AFLocationSnapshotMutation *)v7 getLatitude];
      uint64_t v9 = [v8 copy];
      latitude = v6->_latitude;
      v6->_latitude = (NSNumber *)v9;

      uint64_t v11 = [(_AFLocationSnapshotMutation *)v7 getLongitude];
      uint64_t v12 = [v11 copy];
      longitude = v6->_longitude;
      v6->_longitude = (NSNumber *)v12;

      id v14 = [(_AFLocationSnapshotMutation *)v7 getAltitude];
      uint64_t v15 = [v14 copy];
      altitude = v6->_altitude;
      v6->_altitude = (NSNumber *)v15;

      id v17 = [(_AFLocationSnapshotMutation *)v7 getDirection];
      uint64_t v18 = [v17 copy];
      direction = v6->_direction;
      v6->_direction = (NSNumber *)v18;

      id v20 = [(_AFLocationSnapshotMutation *)v7 getSpeed];
      uint64_t v21 = [v20 copy];
      speed = v6->_speed;
      v6->_speed = (NSNumber *)v21;

      id v23 = [(_AFLocationSnapshotMutation *)v7 getVerticalAccuracy];
      uint64_t v24 = [v23 copy];
      verticalAccuracy = v6->_verticalAccuracy;
      v6->_verticalAccuracy = (NSNumber *)v24;

      id v26 = [(_AFLocationSnapshotMutation *)v7 getHorizontalAccuracy];
      uint64_t v27 = [v26 copy];
      horizontalAccuracy = v6->_horizontalAccuracy;
      v6->_horizontalAccuracy = (NSNumber *)v27;

      v6->_BOOL preciseLocationEnabled = [(_AFLocationSnapshotMutation *)v7 getPreciseLocationEnabled];
      v6->_unint64_t accessState = [(_AFLocationSnapshotMutation *)v7 getAccessState];
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
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFLocationSnapshotMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFLocationSnapshotMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFLocationSnapshotMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFLocationSnapshot);
      uint64_t v7 = [(_AFLocationSnapshotMutation *)v5 getLatitude];
      uint64_t v8 = [v7 copy];
      latitude = v6->_latitude;
      v6->_latitude = (NSNumber *)v8;

      id v10 = [(_AFLocationSnapshotMutation *)v5 getLongitude];
      uint64_t v11 = [v10 copy];
      longitude = v6->_longitude;
      v6->_longitude = (NSNumber *)v11;

      unint64_t v13 = [(_AFLocationSnapshotMutation *)v5 getAltitude];
      uint64_t v14 = [v13 copy];
      altitude = v6->_altitude;
      v6->_altitude = (NSNumber *)v14;

      id v16 = [(_AFLocationSnapshotMutation *)v5 getDirection];
      uint64_t v17 = [v16 copy];
      direction = v6->_direction;
      v6->_direction = (NSNumber *)v17;

      id v19 = [(_AFLocationSnapshotMutation *)v5 getSpeed];
      uint64_t v20 = [v19 copy];
      speed = v6->_speed;
      v6->_speed = (NSNumber *)v20;

      id v22 = [(_AFLocationSnapshotMutation *)v5 getVerticalAccuracy];
      uint64_t v23 = [v22 copy];
      verticalAccuracy = v6->_verticalAccuracy;
      v6->_verticalAccuracy = (NSNumber *)v23;

      id v25 = [(_AFLocationSnapshotMutation *)v5 getHorizontalAccuracy];
      uint64_t v26 = [v25 copy];
      horizontalAccuracy = v6->_horizontalAccuracy;
      v6->_horizontalAccuracy = (NSNumber *)v26;

      v6->_BOOL preciseLocationEnabled = [(_AFLocationSnapshotMutation *)v5 getPreciseLocationEnabled];
      v6->_unint64_t accessState = [(_AFLocationSnapshotMutation *)v5 getAccessState];
    }
    else
    {
      uint64_t v6 = (AFLocationSnapshot *)[(AFLocationSnapshot *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFLocationSnapshot *)[(AFLocationSnapshot *)self copy];
  }

  return v6;
}

- (id)ad_shortDescription
{
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal)
  {
    id v3 = NSString;
    id v4 = [(AFLocationSnapshot *)self latitude];
    [v4 doubleValue];
    uint64_t v6 = (int)v5;
    uint64_t v7 = [(AFLocationSnapshot *)self longitude];
    [v7 doubleValue];
    uint64_t v9 = (int)v8;
    id v10 = [(AFLocationSnapshot *)self horizontalAccuracy];
    [v10 doubleValue];
    [v3 stringWithFormat:@"([%d,%d], accuracy=%d)", v6, v9, (int)v11];
    uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v12 = @"(private)";
  }
  return v12;
}

- (AFLocationSnapshot)initWithSerializedBackingStore:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self = [(AFLocationSnapshot *)self initWithDictionaryRepresentation:v4];
    double v5 = self;
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (id)ace_setRequestOrigin
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F96A18]);
  id v4 = [(AFLocationSnapshot *)self latitude];
  [v4 doubleValue];
  objc_msgSend(v3, "setLatitude:");

  double v5 = [(AFLocationSnapshot *)self longitude];
  [v5 doubleValue];
  objc_msgSend(v3, "setLongitude:");

  uint64_t v6 = [(AFLocationSnapshot *)self altitude];
  [v6 doubleValue];
  objc_msgSend(v3, "setAltitude:");

  uint64_t v7 = [(AFLocationSnapshot *)self direction];
  [v7 doubleValue];
  objc_msgSend(v3, "setDirection:");

  double v8 = [(AFLocationSnapshot *)self speed];
  [v8 doubleValue];
  objc_msgSend(v3, "setSpeed:");

  uint64_t v9 = [(AFLocationSnapshot *)self verticalAccuracy];
  [v9 doubleValue];
  objc_msgSend(v3, "setVerticalAccuracy:");

  id v10 = [(AFLocationSnapshot *)self horizontalAccuracy];
  [v10 doubleValue];
  objc_msgSend(v3, "setHorizontalAccuracy:");

  double v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AFLocationSnapshot preciseLocationEnabled](self, "preciseLocationEnabled"));
  [v3 setPreciseLocationEnabled:v11];

  int64_t v12 = [(AFLocationSnapshot *)self accessState];
  unint64_t v13 = (void *)MEMORY[0x1E4F976A0];
  uint64_t v14 = (void *)MEMORY[0x1E4F97698];
  if (v12 != 3) {
    uint64_t v14 = (void *)MEMORY[0x1E4F976B0];
  }
  if (v12 != 2) {
    unint64_t v13 = v14;
  }
  [v3 setStatus:*v13];
  return v3;
}

@end