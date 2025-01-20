@interface AVPairedDevice
+ (id)pairedDevicesConnectedToOutputDevice:(id)a3;
- (AVPairedDevice)initWithName:(id)a3 ID:(id)a4 modelID:(id)a5 playing:(BOOL)a6 productName:(id)a7;
- (BOOL)isPlaying;
- (NSString)modelID;
- (NSString)name;
- (NSString)pairedDeviceID;
- (NSString)productName;
- (void)dealloc;
@end

@implementation AVPairedDevice

+ (id)pairedDevicesConnectedToOutputDevice:(id)a3
{
  return (id)[a3 connectedPairedDevices];
}

- (AVPairedDevice)initWithName:(id)a3 ID:(id)a4 modelID:(id)a5 playing:(BOOL)a6 productName:(id)a7
{
  v16.receiver = self;
  v16.super_class = (Class)AVPairedDevice;
  v12 = [(AVPairedDevice *)&v16 init];
  if (v12 && (v13 = objc_alloc_init(AVPairedDeviceInternal), (v12->_ivars = v13) != 0))
  {
    v12->_ivars->name = (NSString *)[a3 copy];
    v12->_ivars->ID = (NSString *)[a4 copy];
    v12->_ivars->modelID = (NSString *)[a5 copy];
    v12->_ivars->playing = a6;
    v12->_ivars->productName = (NSString *)[a7 copy];
    v14 = v12;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  ivars = self->_ivars;
  if (ivars)
  {

    ivars = self->_ivars;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVPairedDevice;
  [(AVPairedDevice *)&v4 dealloc];
}

- (NSString)name
{
  return self->_ivars->name;
}

- (NSString)pairedDeviceID
{
  return self->_ivars->ID;
}

- (NSString)modelID
{
  return self->_ivars->modelID;
}

- (BOOL)isPlaying
{
  return self->_ivars->playing;
}

- (NSString)productName
{
  return self->_ivars->productName;
}

@end