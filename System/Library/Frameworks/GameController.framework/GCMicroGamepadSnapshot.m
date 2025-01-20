@interface GCMicroGamepadSnapshot
- (BOOL)supportsDpadTaps;
- (GCMicroGamepadSnapshot)init;
- (GCMicroGamepadSnapshot)initWithController:(GCController *)controller snapshotData:(NSData *)data;
- (GCMicroGamepadSnapshot)initWithSnapshotData:(NSData *)data;
- (NSData)snapshotData;
- (void)setSnapshotData:(NSData *)snapshotData;
@end

@implementation GCMicroGamepadSnapshot

- (NSData)snapshotData
{
  v2 = (void *)[(NSData *)self->snapshotData copy];

  return (NSData *)v2;
}

- (void)setSnapshotData:(NSData *)snapshotData
{
  v4 = snapshotData;
  memset(&snapshotDataa, 0, sizeof(snapshotDataa));
  if (GCMicroGamepadSnapshotDataFromNSData(&snapshotDataa, v4))
  {
    v5 = (NSData *)[(NSData *)v4 copy];
    v6 = self->snapshotData;
    self->snapshotData = v5;

    v7 = [(GCMicroGamepad *)self dpad];
    [(GCPhysicalInputProfile *)self setDpad:v7 x:snapshotDataa.dpadX y:snapshotDataa.dpadY];

    v8 = [(GCMicroGamepad *)self buttonA];
    [(GCPhysicalInputProfile *)self setButton:v8 value:snapshotDataa.buttonA];

    v9 = [(GCMicroGamepad *)self buttonX];
    [(GCPhysicalInputProfile *)self setButton:v9 value:snapshotDataa.buttonX];
  }
}

- (GCMicroGamepadSnapshot)init
{
  v3.receiver = self;
  v3.super_class = (Class)GCMicroGamepadSnapshot;
  return [(GCPhysicalInputProfile *)&v3 init];
}

- (GCMicroGamepadSnapshot)initWithSnapshotData:(NSData *)data
{
  return [(GCMicroGamepadSnapshot *)self initWithController:0 snapshotData:data];
}

- (GCMicroGamepadSnapshot)initWithController:(GCController *)controller snapshotData:(NSData *)data
{
  v6 = controller;
  v7 = data;
  memset(&snapshotData, 0, sizeof(snapshotData));
  if (GCMicroGamepadSnapshotDataFromNSData(&snapshotData, v7))
  {
    v12.receiver = self;
    v12.super_class = (Class)GCMicroGamepadSnapshot;
    v8 = [(GCPhysicalInputProfile *)&v12 initWithController:v6];
    v9 = v8;
    if (v8) {
      [(GCMicroGamepadSnapshot *)v8 setSnapshotData:v7];
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)supportsDpadTaps
{
  return 1;
}

- (void).cxx_destruct
{
}

@end