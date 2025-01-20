@interface SRDiscoveredDevice
- (BOOL)inUseBannerShown;
- (BOOL)isNearby;
- (BOOL)mutedSpeakerForRemotePhoneCall;
- (BOOL)nearbyPaired;
- (BOOL)nearbyiCloudSignIn;
- (BOOL)routeToWxAfterUnhide;
- (BOOL)userConnectedState;
- (NSData)nearbyLastRouteHost;
- (NSString)btAddress;
- (NSString)inUseBannerBackoffReason;
- (NSString)nearbyName;
- (SFDevice)nearbyWxDevice;
- (int)nearbyInEar;
- (int)nearbyPrevInEar;
- (int64_t)nearbyStreamState;
- (unint64_t)inUseBannerBackoffTick;
- (unsigned)connectionState;
- (unsigned)nearbyConnectedSourceCount;
- (unsigned)nearbyOutOfCaseTime;
- (unsigned)nearbyProductID;
- (void)_setBtAddress:(id)a3;
- (void)_setConnectionState:(unsigned __int8)a3;
- (void)_setInUseBannerBackoffReason:(id)a3;
- (void)_setInUseBannerBackoffTick:(unint64_t)a3;
- (void)_setInUseBannerShown:(BOOL)a3;
- (void)_setIsNearby:(BOOL)a3;
- (void)_setMutedSpeakerForRemotePhoneCall:(BOOL)a3;
- (void)_setNearbyConnectedSourceCount:(unsigned __int8)a3;
- (void)_setNearbyInEar:(int)a3;
- (void)_setNearbyLastRouteHost:(id)a3;
- (void)_setNearbyName:(id)a3;
- (void)_setNearbyOutOfCaseTime:(unsigned __int8)a3;
- (void)_setNearbyPaired:(BOOL)a3;
- (void)_setNearbyPrevInEar:(int)a3;
- (void)_setNearbyProductID:(unsigned int)a3;
- (void)_setNearbyStreamState:(int64_t)a3;
- (void)_setNearbyWxDevice:(id)a3;
- (void)_setNearbyiCloudSignIn:(BOOL)a3;
- (void)_setRouteToWxAfterUnhide:(BOOL)a3;
- (void)_setUserConnectedState:(BOOL)a3;
@end

@implementation SRDiscoveredDevice

- (void)_setBtAddress:(id)a3
{
  id v7 = a3;
  btAddress = self->_btAddress;
  p_btAddress = &self->_btAddress;
  if (![(NSString *)btAddress isEqualToString:v7])
  {
    if (gLogCategory_SRDiscoveredDevice <= 30
      && (gLogCategory_SRDiscoveredDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_storeStrong((id *)p_btAddress, a3);
  }

  MEMORY[0x270F9A758]();
}

- (void)_setConnectionState:(unsigned __int8)a3
{
  if (self->_connectionState != a3)
  {
    if (gLogCategory_SRDiscoveredDevice <= 30
      && (gLogCategory_SRDiscoveredDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_connectionState = a3;
  }
}

- (void)_setIsNearby:(BOOL)a3
{
  if (self->_isNearby != a3)
  {
    if (gLogCategory_SRDiscoveredDevice <= 30
      && (gLogCategory_SRDiscoveredDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_isNearby = a3;
  }
}

- (void)_setInUseBannerBackoffTick:(unint64_t)a3
{
  if (self->_inUseBannerBackoffTick != a3)
  {
    if (gLogCategory_SRDiscoveredDevice <= 30
      && (gLogCategory_SRDiscoveredDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_inUseBannerBackoffTick = a3;
  }
}

- (void)_setInUseBannerBackoffReason:(id)a3
{
  if (![(NSString *)self->_inUseBannerBackoffReason isEqualToString:a3])
  {
    if (gLogCategory_SRDiscoveredDevice <= 30
      && (gLogCategory_SRDiscoveredDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_inUseBannerBackoffReason, a3);
  }

  MEMORY[0x270F9A758]();
}

- (void)_setInUseBannerShown:(BOOL)a3
{
  if (self->_inUseBannerShown != a3)
  {
    if (gLogCategory_SRDiscoveredDevice <= 30
      && (gLogCategory_SRDiscoveredDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_inUseBannerShown = a3;
  }
}

- (void)_setMutedSpeakerForRemotePhoneCall:(BOOL)a3
{
  if (self->_mutedSpeakerForRemotePhoneCall != a3)
  {
    if (gLogCategory_SRDiscoveredDevice <= 30
      && (gLogCategory_SRDiscoveredDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_mutedSpeakerForRemotePhoneCall = a3;
  }
}

- (void)_setNearbyiCloudSignIn:(BOOL)a3
{
  if (self->_nearbyiCloudSignIn != a3)
  {
    if (gLogCategory_SRDiscoveredDevice <= 30
      && (gLogCategory_SRDiscoveredDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_nearbyiCloudSignIn = a3;
  }
}

- (void)_setNearbyInEar:(int)a3
{
  if (gLogCategory_SRDiscoveredDevice <= 30
    && (gLogCategory_SRDiscoveredDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_nearbyInEar = a3;
}

- (void)_setNearbyLastRouteHost:(id)a3
{
  if (!a3 && !-[NSData isEqualToData:](self->_nearbyLastRouteHost, "isEqualToData:"))
  {
    if (gLogCategory_SRDiscoveredDevice <= 30
      && (gLogCategory_SRDiscoveredDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    nearbyLastRouteHost = self->_nearbyLastRouteHost;
    self->_nearbyLastRouteHost = 0;
  }
}

- (void)_setNearbyName:(id)a3
{
  if (![(NSString *)self->_nearbyName isEqualToString:a3])
  {
    if (gLogCategory_SRDiscoveredDevice <= 30
      && (gLogCategory_SRDiscoveredDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_nearbyName, a3);
  }

  MEMORY[0x270F9A758]();
}

- (void)_setNearbyOutOfCaseTime:(unsigned __int8)a3
{
  if (self->_nearbyOutOfCaseTime != a3)
  {
    if (gLogCategory_SRDiscoveredDevice <= 30
      && (gLogCategory_SRDiscoveredDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_nearbyOutOfCaseTime = a3;
  }
}

- (void)_setNearbyPaired:(BOOL)a3
{
  if (self->_nearbyPaired != a3)
  {
    if (gLogCategory_SRDiscoveredDevice <= 30
      && (gLogCategory_SRDiscoveredDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_nearbyPaired = a3;
  }
}

- (void)_setNearbyProductID:(unsigned int)a3
{
  if (self->_nearbyProductID != a3)
  {
    if (gLogCategory_SRDiscoveredDevice <= 30
      && (gLogCategory_SRDiscoveredDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_nearbyProductID = a3;
  }
}

- (void)_setNearbyPrevInEar:(int)a3
{
  if (gLogCategory_SRDiscoveredDevice <= 30
    && (gLogCategory_SRDiscoveredDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_nearbyPrevInEar = a3;
}

- (void)_setNearbyConnectedSourceCount:(unsigned __int8)a3
{
  if (self->_nearbyConnectedSourceCount != a3)
  {
    if (gLogCategory_SRDiscoveredDevice <= 30
      && (gLogCategory_SRDiscoveredDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_nearbyConnectedSourceCount = a3;
  }
}

- (void)_setNearbyStreamState:(int64_t)a3
{
  if (self->_nearbyStreamState != a3)
  {
    if (gLogCategory_SRDiscoveredDevice <= 30
      && (gLogCategory_SRDiscoveredDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_nearbyStreamState = a3;
  }
}

- (void)_setNearbyWxDevice:(id)a3
{
  v5 = (SFDevice *)a3;
  nearbyWxDevice = self->_nearbyWxDevice;
  p_nearbyWxDevice = &self->_nearbyWxDevice;
  if (nearbyWxDevice != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_nearbyWxDevice, a3);
    v5 = v8;
  }
}

- (void)_setRouteToWxAfterUnhide:(BOOL)a3
{
  if (self->_routeToWxAfterUnhide != a3)
  {
    if (gLogCategory_SRDiscoveredDevice <= 30
      && (gLogCategory_SRDiscoveredDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_routeToWxAfterUnhide = a3;
  }
}

- (void)_setUserConnectedState:(BOOL)a3
{
  if (self->_userConnectedState != a3)
  {
    if (gLogCategory_SRDiscoveredDevice <= 30
      && (gLogCategory_SRDiscoveredDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_userConnectedState = a3;
  }
}

- (NSString)btAddress
{
  return self->_btAddress;
}

- (unsigned)connectionState
{
  return self->_connectionState;
}

- (BOOL)isNearby
{
  return self->_isNearby;
}

- (unint64_t)inUseBannerBackoffTick
{
  return self->_inUseBannerBackoffTick;
}

- (NSString)inUseBannerBackoffReason
{
  return self->_inUseBannerBackoffReason;
}

- (BOOL)inUseBannerShown
{
  return self->_inUseBannerShown;
}

- (BOOL)mutedSpeakerForRemotePhoneCall
{
  return self->_mutedSpeakerForRemotePhoneCall;
}

- (BOOL)nearbyiCloudSignIn
{
  return self->_nearbyiCloudSignIn;
}

- (int)nearbyInEar
{
  return self->_nearbyInEar;
}

- (NSData)nearbyLastRouteHost
{
  return self->_nearbyLastRouteHost;
}

- (NSString)nearbyName
{
  return self->_nearbyName;
}

- (unsigned)nearbyOutOfCaseTime
{
  return self->_nearbyOutOfCaseTime;
}

- (int)nearbyPrevInEar
{
  return self->_nearbyPrevInEar;
}

- (BOOL)nearbyPaired
{
  return self->_nearbyPaired;
}

- (unsigned)nearbyProductID
{
  return self->_nearbyProductID;
}

- (unsigned)nearbyConnectedSourceCount
{
  return self->_nearbyConnectedSourceCount;
}

- (int64_t)nearbyStreamState
{
  return self->_nearbyStreamState;
}

- (SFDevice)nearbyWxDevice
{
  return self->_nearbyWxDevice;
}

- (BOOL)routeToWxAfterUnhide
{
  return self->_routeToWxAfterUnhide;
}

- (BOOL)userConnectedState
{
  return self->_userConnectedState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyWxDevice, 0);
  objc_storeStrong((id *)&self->_nearbyName, 0);
  objc_storeStrong((id *)&self->_nearbyLastRouteHost, 0);
  objc_storeStrong((id *)&self->_inUseBannerBackoffReason, 0);

  objc_storeStrong((id *)&self->_btAddress, 0);
}

@end