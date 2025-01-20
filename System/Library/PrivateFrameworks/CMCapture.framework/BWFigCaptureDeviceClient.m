@interface BWFigCaptureDeviceClient
- (BOOL)canShareRegistrationWithClientPID:(int)a3 deviceAvailabilityChangedHandler:(id)a4;
- (BOOL)canStealFromClientsWithSamePriority;
- (BOOL)clientIsAVFlashlight;
- (BOOL)deviceSharingWithAVFlashlightAllowed;
- (BOOL)deviceSharingWithOtherClientsAllowed;
- (BOOL)isEqual:(id)a3;
- (BWFigCaptureDeviceClient)initWithPID:(int)a3 clientApplicationID:(id)a4 clientDescription:(id)a5 clientPriority:(int)a6 canStealFromClientsWithSamePriority:(BOOL)a7 deviceSharingWithOtherClientsAllowed:(BOOL)a8 deviceSharingWithAVFlashlightAllowed:(BOOL)a9 clientIsAVFlashlight:(BOOL)a10 deviceAvailabilityChangedHandler:(id)a11;
- (NSString)applicationID;
- (NSString)clientDescription;
- (id)debugDescription;
- (id)description;
- (id)deviceAvailabilityChangedHandler;
- (int)clientID;
- (int)clientPriority;
- (int)pid;
- (void)dealloc;
- (void)setDeviceAvailabilityChangedHandler:(id)a3;
@end

@implementation BWFigCaptureDeviceClient

- (int)clientPriority
{
  return self->_clientPriority;
}

- (BOOL)canStealFromClientsWithSamePriority
{
  return self->_canStealFromClientsWithSamePriority;
}

- (int)clientID
{
  return self->_clientID;
}

- (BWFigCaptureDeviceClient)initWithPID:(int)a3 clientApplicationID:(id)a4 clientDescription:(id)a5 clientPriority:(int)a6 canStealFromClientsWithSamePriority:(BOOL)a7 deviceSharingWithOtherClientsAllowed:(BOOL)a8 deviceSharingWithAVFlashlightAllowed:(BOOL)a9 clientIsAVFlashlight:(BOOL)a10 deviceAvailabilityChangedHandler:(id)a11
{
  v21.receiver = self;
  v21.super_class = (Class)BWFigCaptureDeviceClient;
  v17 = [(BWFigCaptureDeviceClient *)&v21 init];
  v18 = v17;
  if (v17)
  {
    int v19 = sNextClientID++;
    v17->_clientID = v19;
    v17->_pid = a3;
    v17->_applicationID = (NSString *)[a4 copy];
    v18->_clientDescription = (NSString *)[a5 copy];
    v18->_clientPriority = a6;
    v18->_canStealFromClientsWithSamePriority = a7;
    v18->_deviceSharingWithOtherClientsAllowed = a8;
    v18->_deviceSharingWithAVFlashlightAllowed = a9;
    v18->_clientIsAVFlashlight = a10;
    v18->_deviceAvailabilityChangedHandler = (id)[a11 copy];
  }
  return v18;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWFigCaptureDeviceClient;
  [(BWFigCaptureDeviceClient *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  int v4 = [(BWFigCaptureDeviceClient *)self clientID];
  return v4 == [a3 clientID];
}

- (id)debugDescription
{
  uint64_t clientPriority = self->_clientPriority;
  if (clientPriority > 4) {
    objc_super v3 = 0;
  }
  else {
    objc_super v3 = off_1E5C291C0[clientPriority];
  }
  return (id)[NSString stringWithFormat:@"clientID: %d, pid: %d, clientApplicationID: %@, clientDescription: %@, clientPriority: %@, canStealFromClientsWithSamePriority: %d, deviceSharingWithOtherClientsAllowed: %d, deviceSharingWithAVFlashlightAllowed: %d, clientIsAVFlashlight: %d, handler: %p", self->_clientID, self->_pid, self->_applicationID, self->_clientDescription, v3, self->_canStealFromClientsWithSamePriority, self->_deviceSharingWithOtherClientsAllowed, self->_deviceSharingWithAVFlashlightAllowed, self->_clientIsAVFlashlight, self->_deviceAvailabilityChangedHandler];
}

- (id)description
{
  objc_super v3 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[BWFigCaptureDeviceClient debugDescription](self, "debugDescription")];
}

- (BOOL)canShareRegistrationWithClientPID:(int)a3 deviceAvailabilityChangedHandler:(id)a4
{
  if (self->_pid != a3) {
    return 0;
  }
  if (!self->_deviceSharingWithOtherClientsAllowed) {
    return 0;
  }
  BOOL v4 = 1;
  if (a4)
  {
    if (self->_deviceAvailabilityChangedHandler) {
      return 0;
    }
  }
  return v4;
}

- (int)pid
{
  return self->_pid;
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (NSString)clientDescription
{
  return self->_clientDescription;
}

- (BOOL)deviceSharingWithOtherClientsAllowed
{
  return self->_deviceSharingWithOtherClientsAllowed;
}

- (BOOL)deviceSharingWithAVFlashlightAllowed
{
  return self->_deviceSharingWithAVFlashlightAllowed;
}

- (BOOL)clientIsAVFlashlight
{
  return self->_clientIsAVFlashlight;
}

- (id)deviceAvailabilityChangedHandler
{
  return self->_deviceAvailabilityChangedHandler;
}

- (void)setDeviceAvailabilityChangedHandler:(id)a3
{
}

@end