@interface AFCoreAnalyticsDeviceContextPayload
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFCoreAnalyticsDeviceContextPayload)init;
- (AFCoreAnalyticsDeviceContextPayload)initWithBuilder:(id)a3;
- (AFCoreAnalyticsDeviceContextPayload)initWithCoder:(id)a3;
- (AFCoreAnalyticsDeviceContextPayload)initWithDictionaryRepresentation:(id)a3;
- (AFCoreAnalyticsDeviceContextPayload)initWithNearbyProductType:(id)a3 proximity:(id)a4 alarmFiring:(id)a5 timerFiring:(id)a6 playbackState:(id)a7 playbackRecency:(id)a8 homeAnnouncementState:(id)a9 homeAnnouncementRecency:(id)a10 nearbyDevicesRequestIdentifier:(id)a11 targetedResult:(id)a12 contextIdentifier:(id)a13;
- (BOOL)isEqual:(id)a3;
- (NSNumber)alarmFiring;
- (NSNumber)homeAnnouncementRecency;
- (NSNumber)playbackRecency;
- (NSNumber)timerFiring;
- (NSString)contextIdentifier;
- (NSString)description;
- (NSString)homeAnnouncementState;
- (NSString)nearbyDevicesRequestIdentifier;
- (NSString)nearbyProductType;
- (NSString)playbackState;
- (NSString)proximity;
- (NSString)targetedResult;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFCoreAnalyticsDeviceContextPayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_targetedResult, 0);
  objc_storeStrong((id *)&self->_nearbyDevicesRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_homeAnnouncementRecency, 0);
  objc_storeStrong((id *)&self->_homeAnnouncementState, 0);
  objc_storeStrong((id *)&self->_playbackRecency, 0);
  objc_storeStrong((id *)&self->_playbackState, 0);
  objc_storeStrong((id *)&self->_timerFiring, 0);
  objc_storeStrong((id *)&self->_alarmFiring, 0);
  objc_storeStrong((id *)&self->_proximity, 0);
  objc_storeStrong((id *)&self->_nearbyProductType, 0);
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (NSString)targetedResult
{
  return self->_targetedResult;
}

- (NSString)nearbyDevicesRequestIdentifier
{
  return self->_nearbyDevicesRequestIdentifier;
}

- (NSNumber)homeAnnouncementRecency
{
  return self->_homeAnnouncementRecency;
}

- (NSString)homeAnnouncementState
{
  return self->_homeAnnouncementState;
}

- (NSNumber)playbackRecency
{
  return self->_playbackRecency;
}

- (NSString)playbackState
{
  return self->_playbackState;
}

- (NSNumber)timerFiring
{
  return self->_timerFiring;
}

- (NSNumber)alarmFiring
{
  return self->_alarmFiring;
}

- (NSString)proximity
{
  return self->_proximity;
}

- (NSString)nearbyProductType
{
  return self->_nearbyProductType;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  nearbyProductType = self->_nearbyProductType;
  if (nearbyProductType) {
    [v3 setObject:nearbyProductType forKey:@"nearbyProductType"];
  }
  proximity = self->_proximity;
  if (proximity) {
    [v4 setObject:proximity forKey:@"proximity"];
  }
  alarmFiring = self->_alarmFiring;
  if (alarmFiring) {
    [v4 setObject:alarmFiring forKey:@"alarmFiring"];
  }
  timerFiring = self->_timerFiring;
  if (timerFiring) {
    [v4 setObject:timerFiring forKey:@"timerFiring"];
  }
  playbackState = self->_playbackState;
  if (playbackState) {
    [v4 setObject:playbackState forKey:@"playbackState"];
  }
  playbackRecency = self->_playbackRecency;
  if (playbackRecency) {
    [v4 setObject:playbackRecency forKey:@"playbackRecency"];
  }
  homeAnnouncementState = self->_homeAnnouncementState;
  if (homeAnnouncementState) {
    [v4 setObject:homeAnnouncementState forKey:@"homeAnnouncementState"];
  }
  homeAnnouncementRecency = self->_homeAnnouncementRecency;
  if (homeAnnouncementRecency) {
    [v4 setObject:homeAnnouncementRecency forKey:@"homeAnnouncementRecency"];
  }
  nearbyDevicesRequestIdentifier = self->_nearbyDevicesRequestIdentifier;
  if (nearbyDevicesRequestIdentifier) {
    [v4 setObject:nearbyDevicesRequestIdentifier forKey:@"nearbyDevicesRequestIdentifier"];
  }
  targetedResult = self->_targetedResult;
  if (targetedResult) {
    [v4 setObject:targetedResult forKey:@"targetedResult"];
  }
  contextIdentifier = self->_contextIdentifier;
  if (contextIdentifier) {
    [v4 setObject:contextIdentifier forKey:@"contextIdentifier"];
  }
  v16 = (void *)[v4 copy];

  return v16;
}

- (AFCoreAnalyticsDeviceContextPayload)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"nearbyProductType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v30 = v6;
    }
    else {
      id v30 = 0;
    }

    v8 = [v5 objectForKey:@"proximity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v29 = v8;
    }
    else {
      id v29 = 0;
    }

    v9 = [v5 objectForKey:@"alarmFiring"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v28 = v9;
    }
    else {
      id v28 = 0;
    }

    v10 = [v5 objectForKey:@"timerFiring"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v27 = v10;
    }
    else {
      id v27 = 0;
    }

    v11 = [v5 objectForKey:@"playbackState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v26 = v11;
    }
    else {
      id v26 = 0;
    }

    v12 = [v5 objectForKey:@"playbackRecency"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    v14 = [v5 objectForKey:@"homeAnnouncementState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    v16 = [v5 objectForKey:@"homeAnnouncementRecency"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }

    v18 = [v5 objectForKey:@"nearbyDevicesRequestIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }

    v20 = [v5 objectForKey:@"targetedResult"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }

    v22 = [v5 objectForKey:@"contextIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }

    v25 = [(AFCoreAnalyticsDeviceContextPayload *)self initWithNearbyProductType:v30 proximity:v29 alarmFiring:v28 timerFiring:v27 playbackState:v26 playbackRecency:v13 homeAnnouncementState:v15 homeAnnouncementRecency:v17 nearbyDevicesRequestIdentifier:v19 targetedResult:v21 contextIdentifier:v23];
    self = v25;

    v7 = v25;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  nearbyProductType = self->_nearbyProductType;
  id v5 = a3;
  [v5 encodeObject:nearbyProductType forKey:@"AFCoreAnalyticsDeviceContextPayload::nearbyProductType"];
  [v5 encodeObject:self->_proximity forKey:@"AFCoreAnalyticsDeviceContextPayload::proximity"];
  [v5 encodeObject:self->_alarmFiring forKey:@"AFCoreAnalyticsDeviceContextPayload::alarmFiring"];
  [v5 encodeObject:self->_timerFiring forKey:@"AFCoreAnalyticsDeviceContextPayload::timerFiring"];
  [v5 encodeObject:self->_playbackState forKey:@"AFCoreAnalyticsDeviceContextPayload::playbackState"];
  [v5 encodeObject:self->_playbackRecency forKey:@"AFCoreAnalyticsDeviceContextPayload::playbackRecency"];
  [v5 encodeObject:self->_homeAnnouncementState forKey:@"AFCoreAnalyticsDeviceContextPayload::homeAnnouncementState"];
  [v5 encodeObject:self->_homeAnnouncementRecency forKey:@"AFCoreAnalyticsDeviceContextPayload::homeAnnouncementRecency"];
  [v5 encodeObject:self->_nearbyDevicesRequestIdentifier forKey:@"AFCoreAnalyticsDeviceContextPayload::nearbyDevicesRequestIdentifier"];
  [v5 encodeObject:self->_targetedResult forKey:@"AFCoreAnalyticsDeviceContextPayload::targetedResult"];
  [v5 encodeObject:self->_contextIdentifier forKey:@"AFCoreAnalyticsDeviceContextPayload::contextIdentifier"];
}

- (AFCoreAnalyticsDeviceContextPayload)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCoreAnalyticsDeviceContextPayload::nearbyProductType"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCoreAnalyticsDeviceContextPayload::proximity"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCoreAnalyticsDeviceContextPayload::alarmFiring"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCoreAnalyticsDeviceContextPayload::timerFiring"];
  id v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCoreAnalyticsDeviceContextPayload::playbackState"];
  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCoreAnalyticsDeviceContextPayload::playbackRecency"];
  id v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCoreAnalyticsDeviceContextPayload::homeAnnouncementState"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCoreAnalyticsDeviceContextPayload::homeAnnouncementRecency"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCoreAnalyticsDeviceContextPayload::nearbyDevicesRequestIdentifier"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCoreAnalyticsDeviceContextPayload::targetedResult"];
  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCoreAnalyticsDeviceContextPayload::contextIdentifier"];

  v16 = [(AFCoreAnalyticsDeviceContextPayload *)self initWithNearbyProductType:v4 proximity:v5 alarmFiring:v6 timerFiring:v7 playbackState:v17 playbackRecency:v14 homeAnnouncementState:v13 homeAnnouncementRecency:v8 nearbyDevicesRequestIdentifier:v9 targetedResult:v10 contextIdentifier:v11];
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFCoreAnalyticsDeviceContextPayload *)a3;
  if (self == v4)
  {
    BOOL v30 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(AFCoreAnalyticsDeviceContextPayload *)v5 nearbyProductType];
      nearbyProductType = self->_nearbyProductType;
      if (nearbyProductType == v6 || [(NSString *)nearbyProductType isEqual:v6])
      {
        v8 = [(AFCoreAnalyticsDeviceContextPayload *)v5 proximity];
        proximity = self->_proximity;
        if (proximity == v8 || [(NSString *)proximity isEqual:v8])
        {
          v10 = [(AFCoreAnalyticsDeviceContextPayload *)v5 alarmFiring];
          alarmFiring = self->_alarmFiring;
          if (alarmFiring == v10 || [(NSNumber *)alarmFiring isEqual:v10])
          {
            v12 = [(AFCoreAnalyticsDeviceContextPayload *)v5 timerFiring];
            timerFiring = self->_timerFiring;
            if (timerFiring == v12 || [(NSNumber *)timerFiring isEqual:v12])
            {
              v14 = [(AFCoreAnalyticsDeviceContextPayload *)v5 playbackState];
              playbackState = self->_playbackState;
              if (playbackState == v14 || [(NSString *)playbackState isEqual:v14])
              {
                v16 = [(AFCoreAnalyticsDeviceContextPayload *)v5 playbackRecency];
                playbackRecency = self->_playbackRecency;
                if (playbackRecency == v16 || [(NSNumber *)playbackRecency isEqual:v16])
                {
                  v18 = [(AFCoreAnalyticsDeviceContextPayload *)v5 homeAnnouncementState];
                  homeAnnouncementState = self->_homeAnnouncementState;
                  if (homeAnnouncementState == v18
                    || [(NSString *)homeAnnouncementState isEqual:v18])
                  {
                    v34 = v18;
                    v20 = [(AFCoreAnalyticsDeviceContextPayload *)v5 homeAnnouncementRecency];
                    homeAnnouncementRecency = self->_homeAnnouncementRecency;
                    if (homeAnnouncementRecency == v20
                      || [(NSNumber *)homeAnnouncementRecency isEqual:v20])
                    {
                      v33 = v20;
                      v22 = [(AFCoreAnalyticsDeviceContextPayload *)v5 nearbyDevicesRequestIdentifier];
                      nearbyDevicesRequestIdentifier = self->_nearbyDevicesRequestIdentifier;
                      if (nearbyDevicesRequestIdentifier == v22
                        || [(NSString *)nearbyDevicesRequestIdentifier isEqual:v22])
                      {
                        v32 = v22;
                        v24 = [(AFCoreAnalyticsDeviceContextPayload *)v5 targetedResult];
                        targetedResult = self->_targetedResult;
                        if (targetedResult == v24
                          || [(NSString *)targetedResult isEqual:v24])
                        {
                          id v26 = [(AFCoreAnalyticsDeviceContextPayload *)v5 contextIdentifier];
                          contextIdentifier = self->_contextIdentifier;
                          BOOL v30 = 1;
                          if (contextIdentifier != v26)
                          {
                            id v28 = v26;
                            int v29 = [(NSString *)contextIdentifier isEqual:v26];
                            id v26 = v28;
                            if (!v29) {
                              BOOL v30 = 0;
                            }
                          }
                        }
                        else
                        {
                          BOOL v30 = 0;
                        }

                        v22 = v32;
                      }
                      else
                      {
                        BOOL v30 = 0;
                      }

                      v20 = v33;
                    }
                    else
                    {
                      BOOL v30 = 0;
                    }

                    v18 = v34;
                  }
                  else
                  {
                    BOOL v30 = 0;
                  }
                }
                else
                {
                  BOOL v30 = 0;
                }
              }
              else
              {
                BOOL v30 = 0;
              }
            }
            else
            {
              BOOL v30 = 0;
            }
          }
          else
          {
            BOOL v30 = 0;
          }
        }
        else
        {
          BOOL v30 = 0;
        }
      }
      else
      {
        BOOL v30 = 0;
      }
    }
    else
    {
      BOOL v30 = 0;
    }
  }

  return v30;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_nearbyProductType hash];
  NSUInteger v4 = [(NSString *)self->_proximity hash] ^ v3;
  uint64_t v5 = [(NSNumber *)self->_alarmFiring hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSNumber *)self->_timerFiring hash];
  NSUInteger v7 = [(NSString *)self->_playbackState hash];
  uint64_t v8 = v7 ^ [(NSNumber *)self->_playbackRecency hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_homeAnnouncementState hash];
  uint64_t v10 = [(NSNumber *)self->_homeAnnouncementRecency hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_nearbyDevicesRequestIdentifier hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_targetedResult hash];
  return v9 ^ v12 ^ [(NSString *)self->_contextIdentifier hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFCoreAnalyticsDeviceContextPayload;
  uint64_t v5 = [(AFCoreAnalyticsDeviceContextPayload *)&v8 description];
  uint64_t v6 = (void *)[v4 initWithFormat:@"%@ {nearbyProductType = %@, proximity = %@, alarmFiring = %@, timerFiring = %@, playbackState = %@, playbackRecency = %@, homeAnnouncementState = %@, homeAnnouncementRecency = %@, nearbyDevicesRequestIdentifier = %@, targetedResult = %@, contextIdentifier = %@}", v5, self->_nearbyProductType, self->_proximity, self->_alarmFiring, self->_timerFiring, self->_playbackState, self->_playbackRecency, self->_homeAnnouncementState, self->_homeAnnouncementRecency, self->_nearbyDevicesRequestIdentifier, self->_targetedResult, self->_contextIdentifier];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(AFCoreAnalyticsDeviceContextPayload *)self _descriptionWithIndent:0];
}

- (AFCoreAnalyticsDeviceContextPayload)initWithNearbyProductType:(id)a3 proximity:(id)a4 alarmFiring:(id)a5 timerFiring:(id)a6 playbackState:(id)a7 playbackRecency:(id)a8 homeAnnouncementState:(id)a9 homeAnnouncementRecency:(id)a10 nearbyDevicesRequestIdentifier:(id)a11 targetedResult:(id)a12 contextIdentifier:(id)a13
{
  id v39 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = a12;
  id v27 = a13;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __239__AFCoreAnalyticsDeviceContextPayload_initWithNearbyProductType_proximity_alarmFiring_timerFiring_playbackState_playbackRecency_homeAnnouncementState_homeAnnouncementRecency_nearbyDevicesRequestIdentifier_targetedResult_contextIdentifier___block_invoke;
  v43[3] = &unk_1E5924468;
  id v44 = v39;
  id v45 = v18;
  id v46 = v19;
  id v47 = v20;
  id v48 = v21;
  id v49 = v22;
  id v50 = v23;
  id v51 = v24;
  id v52 = v25;
  id v53 = v26;
  id v54 = v27;
  id v41 = v27;
  id v40 = v26;
  id v28 = v25;
  id v29 = v24;
  id v30 = v23;
  id v31 = v22;
  id v32 = v21;
  id v33 = v20;
  id v34 = v19;
  id v35 = v18;
  id v36 = v39;
  v37 = [(AFCoreAnalyticsDeviceContextPayload *)self initWithBuilder:v43];

  return v37;
}

void __239__AFCoreAnalyticsDeviceContextPayload_initWithNearbyProductType_proximity_alarmFiring_timerFiring_playbackState_playbackRecency_homeAnnouncementState_homeAnnouncementRecency_nearbyDevicesRequestIdentifier_targetedResult_contextIdentifier___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setNearbyProductType:v3];
  [v4 setProximity:a1[5]];
  [v4 setAlarmFiring:a1[6]];
  [v4 setTimerFiring:a1[7]];
  [v4 setPlaybackState:a1[8]];
  [v4 setPlaybackRecency:a1[9]];
  [v4 setHomeAnnouncementState:a1[10]];
  [v4 setHomeAnnouncementRecency:a1[11]];
  [v4 setNearbyDevicesRequestIdentifier:a1[12]];
  [v4 setTargetedResult:a1[13]];
  [v4 setContextIdentifier:a1[14]];
}

- (AFCoreAnalyticsDeviceContextPayload)init
{
  return [(AFCoreAnalyticsDeviceContextPayload *)self initWithBuilder:0];
}

- (AFCoreAnalyticsDeviceContextPayload)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFCoreAnalyticsDeviceContextPayloadMutation *))a3;
  v42.receiver = self;
  v42.super_class = (Class)AFCoreAnalyticsDeviceContextPayload;
  uint64_t v5 = [(AFCoreAnalyticsDeviceContextPayload *)&v42 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    NSUInteger v7 = [[_AFCoreAnalyticsDeviceContextPayloadMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFCoreAnalyticsDeviceContextPayloadMutation *)v7 isDirty])
    {
      objc_super v8 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)v7 getNearbyProductType];
      uint64_t v9 = [v8 copy];
      nearbyProductType = v6->_nearbyProductType;
      v6->_nearbyProductType = (NSString *)v9;

      NSUInteger v11 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)v7 getProximity];
      uint64_t v12 = [v11 copy];
      proximity = v6->_proximity;
      v6->_proximity = (NSString *)v12;

      v14 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)v7 getAlarmFiring];
      uint64_t v15 = [v14 copy];
      alarmFiring = v6->_alarmFiring;
      v6->_alarmFiring = (NSNumber *)v15;

      id v17 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)v7 getTimerFiring];
      uint64_t v18 = [v17 copy];
      timerFiring = v6->_timerFiring;
      v6->_timerFiring = (NSNumber *)v18;

      id v20 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)v7 getPlaybackState];
      uint64_t v21 = [v20 copy];
      playbackState = v6->_playbackState;
      v6->_playbackState = (NSString *)v21;

      id v23 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)v7 getPlaybackRecency];
      uint64_t v24 = [v23 copy];
      playbackRecency = v6->_playbackRecency;
      v6->_playbackRecency = (NSNumber *)v24;

      id v26 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)v7 getHomeAnnouncementState];
      uint64_t v27 = [v26 copy];
      homeAnnouncementState = v6->_homeAnnouncementState;
      v6->_homeAnnouncementState = (NSString *)v27;

      id v29 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)v7 getHomeAnnouncementRecency];
      uint64_t v30 = [v29 copy];
      homeAnnouncementRecency = v6->_homeAnnouncementRecency;
      v6->_homeAnnouncementRecency = (NSNumber *)v30;

      id v32 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)v7 getNearbyDevicesRequestIdentifier];
      uint64_t v33 = [v32 copy];
      nearbyDevicesRequestIdentifier = v6->_nearbyDevicesRequestIdentifier;
      v6->_nearbyDevicesRequestIdentifier = (NSString *)v33;

      id v35 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)v7 getTargetedResult];
      uint64_t v36 = [v35 copy];
      targetedResult = v6->_targetedResult;
      v6->_targetedResult = (NSString *)v36;

      v38 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)v7 getContextIdentifier];
      uint64_t v39 = [v38 copy];
      contextIdentifier = v6->_contextIdentifier;
      v6->_contextIdentifier = (NSString *)v39;
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
  id v4 = (void (**)(id, _AFCoreAnalyticsDeviceContextPayloadMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFCoreAnalyticsDeviceContextPayloadMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFCoreAnalyticsDeviceContextPayloadMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFCoreAnalyticsDeviceContextPayload);
      NSUInteger v7 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)v5 getNearbyProductType];
      uint64_t v8 = [v7 copy];
      nearbyProductType = v6->_nearbyProductType;
      v6->_nearbyProductType = (NSString *)v8;

      uint64_t v10 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)v5 getProximity];
      uint64_t v11 = [v10 copy];
      proximity = v6->_proximity;
      v6->_proximity = (NSString *)v11;

      id v13 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)v5 getAlarmFiring];
      uint64_t v14 = [v13 copy];
      alarmFiring = v6->_alarmFiring;
      v6->_alarmFiring = (NSNumber *)v14;

      v16 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)v5 getTimerFiring];
      uint64_t v17 = [v16 copy];
      timerFiring = v6->_timerFiring;
      v6->_timerFiring = (NSNumber *)v17;

      id v19 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)v5 getPlaybackState];
      uint64_t v20 = [v19 copy];
      playbackState = v6->_playbackState;
      v6->_playbackState = (NSString *)v20;

      id v22 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)v5 getPlaybackRecency];
      uint64_t v23 = [v22 copy];
      playbackRecency = v6->_playbackRecency;
      v6->_playbackRecency = (NSNumber *)v23;

      id v25 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)v5 getHomeAnnouncementState];
      uint64_t v26 = [v25 copy];
      homeAnnouncementState = v6->_homeAnnouncementState;
      v6->_homeAnnouncementState = (NSString *)v26;

      id v28 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)v5 getHomeAnnouncementRecency];
      uint64_t v29 = [v28 copy];
      homeAnnouncementRecency = v6->_homeAnnouncementRecency;
      v6->_homeAnnouncementRecency = (NSNumber *)v29;

      id v31 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)v5 getNearbyDevicesRequestIdentifier];
      uint64_t v32 = [v31 copy];
      nearbyDevicesRequestIdentifier = v6->_nearbyDevicesRequestIdentifier;
      v6->_nearbyDevicesRequestIdentifier = (NSString *)v32;

      id v34 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)v5 getTargetedResult];
      uint64_t v35 = [v34 copy];
      targetedResult = v6->_targetedResult;
      v6->_targetedResult = (NSString *)v35;

      v37 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)v5 getContextIdentifier];
      uint64_t v38 = [v37 copy];
      contextIdentifier = v6->_contextIdentifier;
      v6->_contextIdentifier = (NSString *)v38;
    }
    else
    {
      uint64_t v6 = (AFCoreAnalyticsDeviceContextPayload *)[(AFCoreAnalyticsDeviceContextPayload *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFCoreAnalyticsDeviceContextPayload *)[(AFCoreAnalyticsDeviceContextPayload *)self copy];
  }

  return v6;
}

@end