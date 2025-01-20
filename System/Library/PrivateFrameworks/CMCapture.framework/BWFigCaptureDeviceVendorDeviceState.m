@interface BWFigCaptureDeviceVendorDeviceState
- (BOOL)inUseForPublishing;
- (BOOL)inUseForVibeMitigation;
- (BOOL)shutDownDueToSystemPressure;
- (BWFigCaptureDevice)device;
- (BWFigCaptureDeviceVendorDeviceState)initWithDevice:(id)a3;
- (NSArray)streamsRequiringControlControlledByOtherClients;
- (NSMutableArray)controlledStreams;
- (NSMutableArray)portTypesAllowingStreamControlLoss;
- (NSMutableArray)streamsControlledByOtherClients;
- (NSMutableArray)streamsInUse;
- (NSMutableArray)streamsToKeepControlled;
- (NSMutableDictionary)afDriverShortStatisticsByPortType;
- (NSMutableDictionary)tofAFEstimatorClientApplicationIDByPortType;
- (NSMutableDictionary)tofAFEstimatorResultsByPortType;
- (NSMutableDictionary)tofAFEstimatorResultsStreamingTimeByPortType;
- (NSMutableSet)portTypesToCheckForAFDriverShortStatistics;
- (NSMutableSet)portTypesToCheckForToFAFEstimator;
- (OS_dispatch_source)deviceCloseTimer;
- (id)debugDescription;
- (id)description;
- (int)deviceUsageCount;
- (void)dealloc;
- (void)setDeviceCloseTimer:(id)a3;
- (void)setDeviceUsageCount:(int)a3;
- (void)setInUseForPublishing:(BOOL)a3;
- (void)setInUseForVibeMitigation:(BOOL)a3;
- (void)setPortTypesAllowingStreamControlLoss:(id)a3;
- (void)setShutDownDueToSystemPressure:(BOOL)a3;
@end

@implementation BWFigCaptureDeviceVendorDeviceState

- (NSMutableSet)portTypesToCheckForToFAFEstimator
{
  return self->_portTypesToCheckForToFAFEstimator;
}

- (NSMutableSet)portTypesToCheckForAFDriverShortStatistics
{
  return self->_portTypesToCheckForAFDriverShortStatistics;
}

- (BWFigCaptureDeviceVendorDeviceState)initWithDevice:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWFigCaptureDeviceVendorDeviceState;
  v4 = [(BWFigCaptureDeviceVendorDeviceState *)&v6 init];
  if (v4)
  {
    v4->_device = (BWFigCaptureDevice *)a3;
    v4->_controlledStreams = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4->_streamsToKeepControlled = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4->_streamsInUse = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4->_streamsControlledByOtherClients = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4->_portTypesAllowingStreamControlLoss = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4->_portTypesToCheckForToFAFEstimator = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v4->_tofAFEstimatorResultsByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_tofAFEstimatorResultsStreamingTimeByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_tofAFEstimatorClientApplicationIDByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_portTypesToCheckForAFDriverShortStatistics = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v4->_afDriverShortStatisticsByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v4;
}

- (void)setDeviceCloseTimer:(id)a3
{
}

- (OS_dispatch_source)deviceCloseTimer
{
  return self->_deviceCloseTimer;
}

- (NSMutableArray)controlledStreams
{
  return self->_controlledStreams;
}

- (NSMutableArray)streamsInUse
{
  return self->_streamsInUse;
}

- (BWFigCaptureDevice)device
{
  return self->_device;
}

- (int)deviceUsageCount
{
  return self->_deviceUsageCount;
}

- (void)setDeviceUsageCount:(int)a3
{
  self->_deviceUsageCount = a3;
}

- (NSMutableArray)streamsControlledByOtherClients
{
  return self->_streamsControlledByOtherClients;
}

- (void)dealloc
{
  deviceCloseTimer = self->_deviceCloseTimer;
  if (deviceCloseTimer) {
    dispatch_release(deviceCloseTimer);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWFigCaptureDeviceVendorDeviceState;
  [(BWFigCaptureDeviceVendorDeviceState *)&v4 dealloc];
}

- (NSArray)streamsRequiringControlControlledByOtherClients
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  streamsControlledByOtherClients = self->_streamsControlledByOtherClients;
  uint64_t v5 = [(NSMutableArray *)streamsControlledByOtherClients countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(streamsControlledByOtherClients);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((-[NSMutableArray containsObject:](self->_portTypesAllowingStreamControlLoss, "containsObject:", [v9 portType]) & 1) == 0)-[NSArray addObject:](v3, "addObject:", v9); {
      }
        }
      uint64_t v6 = [(NSMutableArray *)streamsControlledByOtherClients countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"device: %@", -[BWFigCaptureDevice deviceID](self->_device, "deviceID")];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[BWFigCaptureDeviceVendorDeviceState debugDescription](self, "debugDescription")];
}

- (BOOL)inUseForPublishing
{
  return self->_inUseForPublishing;
}

- (void)setInUseForPublishing:(BOOL)a3
{
  self->_inUseForPublishing = a3;
}

- (BOOL)inUseForVibeMitigation
{
  return self->_inUseForVibeMitigation;
}

- (void)setInUseForVibeMitigation:(BOOL)a3
{
  self->_inUseForVibeMitigation = a3;
}

- (NSMutableArray)streamsToKeepControlled
{
  return self->_streamsToKeepControlled;
}

- (NSMutableArray)portTypesAllowingStreamControlLoss
{
  return self->_portTypesAllowingStreamControlLoss;
}

- (void)setPortTypesAllowingStreamControlLoss:(id)a3
{
}

- (NSMutableDictionary)tofAFEstimatorResultsByPortType
{
  return self->_tofAFEstimatorResultsByPortType;
}

- (NSMutableDictionary)tofAFEstimatorResultsStreamingTimeByPortType
{
  return self->_tofAFEstimatorResultsStreamingTimeByPortType;
}

- (NSMutableDictionary)tofAFEstimatorClientApplicationIDByPortType
{
  return self->_tofAFEstimatorClientApplicationIDByPortType;
}

- (NSMutableDictionary)afDriverShortStatisticsByPortType
{
  return self->_afDriverShortStatisticsByPortType;
}

- (BOOL)shutDownDueToSystemPressure
{
  return self->_shutDownDueToSystemPressure;
}

- (void)setShutDownDueToSystemPressure:(BOOL)a3
{
  self->_shutDownDueToSystemPressure = a3;
}

@end