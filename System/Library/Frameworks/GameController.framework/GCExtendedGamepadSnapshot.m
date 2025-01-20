@interface GCExtendedGamepadSnapshot
- (GCExtendedGamepadSnapshot)init;
- (GCExtendedGamepadSnapshot)initWithController:(GCController *)controller snapshotData:(NSData *)data;
- (GCExtendedGamepadSnapshot)initWithSnapshotData:(NSData *)data;
- (NSData)snapshotData;
- (void)setSnapshotData:(NSData *)snapshotData;
@end

@implementation GCExtendedGamepadSnapshot

- (NSData)snapshotData
{
  v2 = (void *)[(NSData *)self->snapshotData copy];

  return (NSData *)v2;
}

- (void)setSnapshotData:(NSData *)snapshotData
{
  v4 = snapshotData;
  memset(&v22, 0, sizeof(v22));
  if (GCExtendedGamepadSnapshotDataFromNSData(&v22, v4))
  {
    v5 = (NSData *)[(NSData *)v4 copy];
    v6 = self->snapshotData;
    self->snapshotData = v5;

    v7 = [(GCExtendedGamepad *)self dpad];
    [(GCPhysicalInputProfile *)self setDpad:v7 x:v22.dpadX y:v22.dpadY];

    v8 = [(GCExtendedGamepad *)self buttonA];
    [(GCPhysicalInputProfile *)self setButton:v8 value:v22.buttonA];

    v9 = [(GCExtendedGamepad *)self buttonB];
    [(GCPhysicalInputProfile *)self setButton:v9 value:v22.buttonB];

    v10 = [(GCExtendedGamepad *)self buttonX];
    [(GCPhysicalInputProfile *)self setButton:v10 value:v22.buttonX];

    v11 = [(GCExtendedGamepad *)self buttonY];
    [(GCPhysicalInputProfile *)self setButton:v11 value:v22.buttonY];

    v12 = [(GCExtendedGamepad *)self leftThumbstick];
    [(GCPhysicalInputProfile *)self setDpad:v12 x:v22.leftThumbstickX y:v22.leftThumbstickY];

    v13 = [(GCExtendedGamepad *)self rightThumbstick];
    [(GCPhysicalInputProfile *)self setDpad:v13 x:v22.rightThumbstickX y:v22.rightThumbstickY];

    v14 = [(GCExtendedGamepad *)self leftShoulder];
    [(GCPhysicalInputProfile *)self setButton:v14 value:v22.leftShoulder];

    v15 = [(GCExtendedGamepad *)self rightShoulder];
    [(GCPhysicalInputProfile *)self setButton:v15 value:v22.rightShoulder];

    v16 = [(GCExtendedGamepad *)self leftTrigger];
    [(GCPhysicalInputProfile *)self setButton:v16 value:v22.leftTrigger];

    v17 = [(GCExtendedGamepad *)self rightTrigger];
    [(GCPhysicalInputProfile *)self setButton:v17 value:v22.rightTrigger];

    if (v22.version >= 0x101u && v22.supportsClickableThumbsticks)
    {
      v18 = [(GCExtendedGamepad *)self rightThumbstickButton];
      if (v22.rightThumbstickButton) {
        double v19 = 1.0;
      }
      else {
        double v19 = 0.0;
      }
      [(GCPhysicalInputProfile *)self setButton:v18 value:v19];

      v20 = [(GCExtendedGamepad *)self leftThumbstickButton];
      if (v22.leftThumbstickButton) {
        double v21 = 1.0;
      }
      else {
        double v21 = 0.0;
      }
      [(GCPhysicalInputProfile *)self setButton:v20 value:v21];
    }
  }
}

- (GCExtendedGamepadSnapshot)init
{
  v3.receiver = self;
  v3.super_class = (Class)GCExtendedGamepadSnapshot;
  return [(GCPhysicalInputProfile *)&v3 init];
}

- (GCExtendedGamepadSnapshot)initWithSnapshotData:(NSData *)data
{
  return [(GCExtendedGamepadSnapshot *)self initWithController:0 snapshotData:data];
}

- (GCExtendedGamepadSnapshot)initWithController:(GCController *)controller snapshotData:(NSData *)data
{
  v6 = controller;
  v7 = data;
  v8 = v7;
  int v47 = 0;
  if (v7)
  {
    [(NSData *)v7 getBytes:&v47 length:4];
    if ((unsigned __int16)v47 > 0x100u)
    {
      memset(snapshotData, 0, 63);
      if (GCExtendedGamepadSnapshotDataFromNSData((GCExtendedGamepadSnapshotData *)snapshotData, v8))
      {
        int v9 = snapshotData[60];
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        memset(snapshotData, 0, sizeof(snapshotData));
        GCExtendedGamepadInitInfoMake(snapshotData);
        if (v9)
        {
          __int16 v45 = 257;
          __int16 v46 = 257;
        }
        goto LABEL_8;
      }
LABEL_13:
      v13 = 0;
      goto LABEL_14;
    }
  }
  memset(snapshotData, 0, 60);
  if (!GCExtendedGamepadSnapShotDataV100FromNSData((GCExtendedGamepadSnapShotDataV100 *)snapshotData, v8)) {
    goto LABEL_13;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  memset(snapshotData, 0, sizeof(snapshotData));
  GCExtendedGamepadInitInfoMake(snapshotData);
LABEL_8:
  v15.receiver = self;
  v15.super_class = (Class)GCExtendedGamepadSnapshot;
  v10 = [(GCExtendedGamepad *)&v15 initWithController:v6 initInfo:snapshotData];
  v11 = v10;
  if (v10) {
    [(GCExtendedGamepadSnapshot *)v10 setSnapshotData:v8];
  }
  self = v11;
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)&snapshotData[i]);
  v13 = self;
LABEL_14:

  return v13;
}

- (void).cxx_destruct
{
}

@end