@interface DNDSUntilExitRegionStore
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
- (BOOL)isEqual:(id)a3;
- (CLRegion)currentRegion;
- (DNDSUntilExitRegionStore)init;
- (NSArray)activeLifetimeAssertionUUIDs;
- (NSNumber)hasActiveLifetimes;
- (NSNumber)regionEntered;
- (id)_initWithActiveLifetimeAssertionUUIDs:(id)a3 currentRegion:(id)a4 regionEntered:(id)a5;
- (id)_initWithStore:(id)a3;
- (id)description;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation DNDSUntilExitRegionStore

- (DNDSUntilExitRegionStore)init
{
  return (DNDSUntilExitRegionStore *)[(DNDSUntilExitRegionStore *)self _initWithStore:0];
}

- (id)_initWithStore:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DNDSUntilExitRegionStore;
  v5 = [(DNDSUntilExitRegionStore *)&v23 init];
  if (v5)
  {
    v6 = [v4 activeLifetimeAssertionUUIDs];
    uint64_t v7 = [v6 copy];
    v8 = (void *)v7;
    if (v7) {
      v9 = (void *)v7;
    }
    else {
      v9 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v5->_activeLifetimeAssertionUUIDs, v9);

    v10 = [v4 hasActiveLifetimes];
    v11 = (void *)[v10 copy];
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(NSNumber, "numberWithBool:", -[NSArray count](v5->_activeLifetimeAssertionUUIDs, "count") != 0);
      v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    hasActiveLifetimes = v5->_hasActiveLifetimes;
    v5->_hasActiveLifetimes = v13;

    v15 = [v4 currentRegion];
    uint64_t v16 = [v15 copy];
    currentRegion = v5->_currentRegion;
    v5->_currentRegion = (CLRegion *)v16;

    v18 = [v4 regionEntered];
    uint64_t v19 = [v18 copy];
    v20 = (void *)v19;
    if (v19) {
      v21 = (void *)v19;
    }
    else {
      v21 = (void *)MEMORY[0x1E4F1CC28];
    }
    objc_storeStrong((id *)&v5->_regionEntered, v21);
  }
  return v5;
}

- (id)_initWithActiveLifetimeAssertionUUIDs:(id)a3 currentRegion:(id)a4 regionEntered:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DNDSUntilExitRegionStore;
  v12 = [(DNDSUntilExitRegionStore *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_activeLifetimeAssertionUUIDs, a3);
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "count") != 0);
    hasActiveLifetimes = v13->_hasActiveLifetimes;
    v13->_hasActiveLifetimes = (NSNumber *)v14;

    objc_storeStrong((id *)&v13->_currentRegion, a4);
    objc_storeStrong((id *)&v13->_regionEntered, a5);
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(DNDSUntilExitRegionStore *)self activeLifetimeAssertionUUIDs];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDSUntilExitRegionStore *)self currentRegion];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(DNDSUntilExitRegionStore *)self hasActiveLifetimes];
  uint64_t v8 = [v7 hash];
  id v9 = [(DNDSUntilExitRegionStore *)self regionEntered];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DNDSUntilExitRegionStore *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(DNDSUntilExitRegionStore *)self activeLifetimeAssertionUUIDs];
      uint64_t v7 = [(DNDSUntilExitRegionStore *)v5 activeLifetimeAssertionUUIDs];
      if (v6 != v7)
      {
        uint64_t v8 = [(DNDSUntilExitRegionStore *)self activeLifetimeAssertionUUIDs];
        if (!v8)
        {
          char v13 = 0;
          goto LABEL_50;
        }
        id v9 = (void *)v8;
        unint64_t v10 = [(DNDSUntilExitRegionStore *)v5 activeLifetimeAssertionUUIDs];
        if (!v10)
        {
          char v13 = 0;
LABEL_49:

          goto LABEL_50;
        }
        id v11 = [(DNDSUntilExitRegionStore *)self activeLifetimeAssertionUUIDs];
        v12 = [(DNDSUntilExitRegionStore *)v5 activeLifetimeAssertionUUIDs];
        if (![v11 isEqual:v12])
        {
          char v13 = 0;
LABEL_48:

          goto LABEL_49;
        }
        v49 = v12;
        v50 = v11;
        v51 = v10;
        v52 = v9;
      }
      uint64_t v14 = [(DNDSUntilExitRegionStore *)self currentRegion];
      v15 = [(DNDSUntilExitRegionStore *)v5 currentRegion];
      if (v14 != v15)
      {
        uint64_t v16 = [(DNDSUntilExitRegionStore *)self currentRegion];
        if (v16)
        {
          objc_super v17 = (void *)v16;
          uint64_t v18 = [(DNDSUntilExitRegionStore *)v5 currentRegion];
          if (v18)
          {
            uint64_t v19 = (void *)v18;
            v48 = v14;
            v20 = [(DNDSUntilExitRegionStore *)self currentRegion];
            v21 = [(DNDSUntilExitRegionStore *)v5 currentRegion];
            if (([v20 isEqual:v21] & 1) == 0)
            {

              goto LABEL_38;
            }
            v43 = v20;
            v44 = v19;
            v45 = v17;
            uint64_t v14 = v21;
            goto LABEL_17;
          }
        }
        goto LABEL_38;
      }
      v48 = v14;
LABEL_17:
      v22 = [(DNDSUntilExitRegionStore *)self hasActiveLifetimes];
      v47 = [(DNDSUntilExitRegionStore *)v5 hasActiveLifetimes];
      if (v22 == v47)
      {
        v46 = v22;
        goto LABEL_25;
      }
      uint64_t v23 = [(DNDSUntilExitRegionStore *)self hasActiveLifetimes];
      if (v23)
      {
        v24 = (void *)v23;
        v25 = [(DNDSUntilExitRegionStore *)v5 hasActiveLifetimes];
        if (v25)
        {
          v40 = v14;
          v42 = v25;
          v26 = [(DNDSUntilExitRegionStore *)self hasActiveLifetimes];
          v27 = [(DNDSUntilExitRegionStore *)v5 hasActiveLifetimes];
          if ([v26 isEqual:v27])
          {
            v37 = v27;
            v38 = v26;
            v39 = v24;
            v46 = v22;
            uint64_t v14 = v40;
LABEL_25:
            v28 = [(DNDSUntilExitRegionStore *)self regionEntered];
            uint64_t v29 = [(DNDSUntilExitRegionStore *)v5 regionEntered];
            if (v28 == (void *)v29)
            {

              char v13 = 1;
            }
            else
            {
              v30 = (void *)v29;
              uint64_t v31 = [(DNDSUntilExitRegionStore *)self regionEntered];
              if (v31)
              {
                v41 = (void *)v31;
                v32 = [(DNDSUntilExitRegionStore *)v5 regionEntered];
                if (v32)
                {
                  v36 = v32;
                  v35 = [(DNDSUntilExitRegionStore *)self regionEntered];
                  v33 = [(DNDSUntilExitRegionStore *)v5 regionEntered];
                  char v13 = [v35 isEqual:v33];

                  v32 = v36;
                }
                else
                {
                  char v13 = 0;
                }
              }
              else
              {

                char v13 = 0;
              }
            }
            if (v46 != v47)
            {
            }
            if (v48 != v15)
            {
            }
LABEL_47:
            unint64_t v10 = v51;
            id v9 = v52;
            id v11 = v50;
            v12 = v49;
            if (v6 != v7) {
              goto LABEL_48;
            }
LABEL_50:

            goto LABEL_51;
          }

          uint64_t v14 = v40;
          v25 = v42;
        }
      }
      if (v48 != v15)
      {
      }
LABEL_38:
      char v13 = 0;
      goto LABEL_47;
    }
    char v13 = 0;
  }
LABEL_51:

  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DNDSUntilExitRegionStore *)self activeLifetimeAssertionUUIDs];
  uint64_t v6 = [(DNDSUntilExitRegionStore *)self hasActiveLifetimes];
  uint64_t v7 = [(DNDSUntilExitRegionStore *)self currentRegion];
  uint64_t v8 = [(DNDSUntilExitRegionStore *)self regionEntered];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; activeAssertionUUIDs: %@; hasActiveLifetimes: %@; currentRegion: %@; regionEntered: %@>",
    v4,
    self,
    v5,
    v6,
    v7,
  id v9 = v8);

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDSMutableUntilExitRegionStore alloc];
  return [(DNDSUntilExitRegionStore *)v4 _initWithStore:self];
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"activeLifetimeAssertionUUIDs", objc_opt_class());
  uint64_t v7 = objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_306);
  uint64_t v8 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"currentRegion", objc_opt_class());
  if (v8)
  {
    id v9 = objc_msgSend(v8, "bs_safeObjectForKey:ofType:", @"regionIdentifier", objc_opt_class());
    unint64_t v10 = objc_msgSend(v8, "bs_safeObjectForKey:ofType:", @"regionCenterLatitude", objc_opt_class());
    [v10 doubleValue];
    CLLocationDegrees v12 = v11;

    char v13 = objc_msgSend(v8, "bs_safeObjectForKey:ofType:", @"regionCenterLongitude", objc_opt_class());
    [v13 doubleValue];
    CLLocationDegrees v15 = v14;

    CLLocationCoordinate2D v16 = CLLocationCoordinate2DMake(v12, v15);
    objc_super v17 = objc_msgSend(v8, "bs_safeObjectForKey:ofType:", @"regionRadius", objc_opt_class());
    [v17 doubleValue];
    double v19 = v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E5A8]), "initWithCenter:radius:identifier:", v9, v16.latitude, v16.longitude, v19);
  }
  else
  {
    v20 = 0;
  }
  v21 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"regionEntered", objc_opt_class());
  v22 = (void *)[objc_alloc((Class)a1) _initWithActiveLifetimeAssertionUUIDs:v7 currentRegion:v20 regionEntered:v21];

  return v22;
}

id __68__DNDSUntilExitRegionStore_newWithDictionaryRepresentation_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  v18[4] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  id v5 = [(NSArray *)self->_activeLifetimeAssertionUUIDs bs_mapNoNulls:&__block_literal_global_329];
  currentRegion = self->_currentRegion;
  if (currentRegion)
  {
    uint64_t v7 = [(CLRegion *)currentRegion identifier];
    [(CLRegion *)self->_currentRegion center];
    double v9 = v8;
    double v11 = v10;
    [(CLRegion *)self->_currentRegion radius];
    v18[0] = v7;
    v17[0] = @"regionIdentifier";
    v17[1] = @"regionRadius";
    CLLocationDegrees v12 = objc_msgSend(NSNumber, "numberWithDouble:");
    v18[1] = v12;
    v17[2] = @"regionCenterLatitude";
    char v13 = [NSNumber numberWithDouble:v9];
    v18[2] = v13;
    v17[3] = @"regionCenterLongitude";
    double v14 = [NSNumber numberWithDouble:v11];
    v18[3] = v14;
    CLLocationDegrees v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

    [v4 setObject:v5 forKey:@"activeLifetimeAssertionUUIDs"];
    if (v15)
    {
      [v4 setObject:v15 forKey:@"currentRegion"];
    }
  }
  else
  {
    [v4 setObject:v5 forKey:@"activeLifetimeAssertionUUIDs"];
  }
  [v4 setObject:self->_regionEntered forKey:@"regionEntered"];

  return v4;
}

uint64_t __64__DNDSUntilExitRegionStore_dictionaryRepresentationWithContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (NSArray)activeLifetimeAssertionUUIDs
{
  return self->_activeLifetimeAssertionUUIDs;
}

- (CLRegion)currentRegion
{
  return self->_currentRegion;
}

- (NSNumber)hasActiveLifetimes
{
  return self->_hasActiveLifetimes;
}

- (NSNumber)regionEntered
{
  return self->_regionEntered;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionEntered, 0);
  objc_storeStrong((id *)&self->_hasActiveLifetimes, 0);
  objc_storeStrong((id *)&self->_currentRegion, 0);
  objc_storeStrong((id *)&self->_activeLifetimeAssertionUUIDs, 0);
}

@end