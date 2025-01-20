@interface HalogenWrapper
- (BOOL)accessoryConnectedWhileWet;
- (BOOL)attachDelayTimerRunning;
- (BOOL)didConfidentNotify;
- (BOOL)didHighConfidentNotify;
- (BOOL)didNotify;
- (BOOL)didWetDuration;
- (BOOL)didWetTooLong;
- (BOOL)isBlacklistedAccessoryConnected;
- (BOOL)isDebugAccessoryConnected;
- (BOOL)isHeadsetConnected;
- (BOOL)isMeasurementActive;
- (BOOL)isMeasurementEnabled;
- (BOOL)isPowerAssertionHeld;
- (BOOL)isReceptacleEmpty;
- (BOOL)isTapToRadarPending;
- (BOOL)isTimestampValid;
- (BOOL)isWet;
- (BOOL)justAttachedCase;
- (BOOL)justDetached;
- (BOOL)wasTapToRadarShown;
- (HalogenMeasurement)halogenMeasurement;
- (HalogenWrapper)init;
- (NSCondition)cond;
- (NSData)connectedAccessoryPDigitalID;
- (NSData)eventBasedPDigitalID;
- (OS_dispatch_queue)halogenMeasurementDispatchQueue;
- (OS_dispatch_queue)halogenTtrDispatchQueue;
- (OS_dispatch_source)timer;
- (int)connectedAccessoryOrientation;
- (int)eventBasedOrientation;
- (int)pinID;
- (int)portID;
- (unint64_t)connectedAccessoryDigitalID;
- (unint64_t)dryCnt;
- (unint64_t)dryPollingIntervalNs;
- (unint64_t)eventBasedDigitalID;
- (unint64_t)firstDryTimestamp;
- (unint64_t)ldcmArbiterRetryNs;
- (unint64_t)ldcmStartMeasurementsDelayNs;
- (unint64_t)ldcmStartMeasurementsRetryNs;
- (unint64_t)minDryReadings;
- (unint64_t)wetAccessoryAttachTimestamp;
- (unint64_t)wetDryTransitionTimestamp;
- (unint64_t)wetPollingIntervalNs;
- (unsigned)service;
- (unsigned)sleepAssertionID;
- (void)dealloc;
- (void)setAccessoryConnectedWhileWet:(BOOL)a3;
- (void)setAttachDelayTimerRunning:(BOOL)a3;
- (void)setCond:(id)a3;
- (void)setConnectedAccessoryDigitalID:(unint64_t)a3;
- (void)setConnectedAccessoryOrientation:(int)a3;
- (void)setConnectedAccessoryPDigitalID:(id)a3;
- (void)setDidConfidentNotify:(BOOL)a3;
- (void)setDidHighConfidentNotify:(BOOL)a3;
- (void)setDidNotify:(BOOL)a3;
- (void)setDidWetDuration:(BOOL)a3;
- (void)setDidWetTooLong:(BOOL)a3;
- (void)setDryCnt:(unint64_t)a3;
- (void)setDryPollingIntervalNs:(unint64_t)a3;
- (void)setEventBasedDigitalID:(unint64_t)a3;
- (void)setEventBasedOrientation:(int)a3;
- (void)setEventBasedPDigitalID:(id)a3;
- (void)setFirstDryTimestamp:(unint64_t)a3;
- (void)setHalogenMeasurement:(id)a3;
- (void)setHalogenMeasurementDispatchQueue:(id)a3;
- (void)setHalogenTtrDispatchQueue:(id)a3;
- (void)setIsBlacklistedAccessoryConnected:(BOOL)a3;
- (void)setIsDebugAccessoryConnected:(BOOL)a3;
- (void)setIsHeadsetConnected:(BOOL)a3;
- (void)setIsMeasurementActive:(BOOL)a3;
- (void)setIsMeasurementEnabled:(BOOL)a3;
- (void)setIsPowerAssertionHeld:(BOOL)a3;
- (void)setIsReceptacleEmpty:(BOOL)a3;
- (void)setIsTapToRadarPending:(BOOL)a3;
- (void)setIsTimestampValid:(BOOL)a3;
- (void)setIsWet:(BOOL)a3;
- (void)setJustAttachedCase:(BOOL)a3;
- (void)setJustDetached:(BOOL)a3;
- (void)setLdcmArbiterRetryNs:(unint64_t)a3;
- (void)setLdcmStartMeasurementsDelayNs:(unint64_t)a3;
- (void)setLdcmStartMeasurementsRetryNs:(unint64_t)a3;
- (void)setMinDryReadings:(unint64_t)a3;
- (void)setPinID:(int)a3;
- (void)setPortID:(int)a3;
- (void)setService:(unsigned int)a3;
- (void)setSleepAssertionID:(unsigned int)a3;
- (void)setTimer:(id)a3;
- (void)setWasTapToRadarShown:(BOOL)a3;
- (void)setWetAccessoryAttachTimestamp:(unint64_t)a3;
- (void)setWetDryTransitionTimestamp:(unint64_t)a3;
- (void)setWetPollingIntervalNs:(unint64_t)a3;
@end

@implementation HalogenWrapper

- (HalogenWrapper)init
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)HalogenWrapper;
  v2 = [(HalogenWrapper *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v2->_halogenMeasurement = 0;
    dispatch_queue_t v4 = dispatch_queue_create("HalogenMeasurementDispatchQueue", 0);
    v3->_halogenMeasurementDispatchQueue = (OS_dispatch_queue *)v4;
    if (!v4)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[HalogenWrapper init]";
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s Failed to create HalogenMeasurementDispatchQueue\n", buf, 0xCu);
      }
      v3 = 0;
    }
    dispatch_queue_t v5 = dispatch_queue_create("HalogenTtrDispatchQueue", 0);
    v3->_halogenTtrDispatchQueue = (OS_dispatch_queue *)v5;
    if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[HalogenWrapper init]";
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s Failed to create HalogenTtrDispatchQueue\n", buf, 0xCu);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Halogen Parameters: \n", buf, 2u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(id)gUserLdcmParams wetPollingIntervalSec];
      *(_DWORD *)buf = 134217984;
      v18 = (const char *)v6;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  wetPollingIntervalSec = %lld \n", buf, 0xCu);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(id)gUserLdcmParams dryPollingIntervalSec];
      *(_DWORD *)buf = 134217984;
      v18 = (const char *)v7;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  dryPollingIntervalSec = %lld \n", buf, 0xCu);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(id)gUserLdcmParams ldcmArbiterRetrySec];
      *(_DWORD *)buf = 134217984;
      v18 = (const char *)v8;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  ldcmArbiterRetrySec = %lld \n", buf, 0xCu);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(id)gUserLdcmParams ldcmStartMeasurementsDelayMs];
      *(_DWORD *)buf = 134217984;
      v18 = (const char *)v9;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  ldcmStartMeasurementsDelayMs = %lld \n", buf, 0xCu);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(id)gUserLdcmParams ldcmStartMeasurementsRetryMs];
      *(_DWORD *)buf = 134217984;
      v18 = (const char *)v10;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  ldcmStartMeasurementsRetryMs = %lld \n", buf, 0xCu);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(id)gUserLdcmParams minDryReadings];
      *(_DWORD *)buf = 134217984;
      v18 = (const char *)v11;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  minDryReadings = %lld \n", buf, 0xCu);
    }
    v3->_wetPollingIntervalNs = 1000000000 * [(id)gUserLdcmParams wetPollingIntervalSec];
    v3->_dryPollingIntervalNs = 1000000000 * [(id)gUserLdcmParams dryPollingIntervalSec];
    v3->_ldcmArbiterRetryNs = 1000000000 * [(id)gUserLdcmParams ldcmArbiterRetrySec];
    v3->_ldcmStartMeasurementsDelayNs = 1000000 * [(id)gUserLdcmParams ldcmStartMeasurementsDelayMs];
    v3->_ldcmStartMeasurementsRetryNs = 1000000 * [(id)gUserLdcmParams ldcmStartMeasurementsRetryMs];
    v3->_minDryReadings = [(id)gUserLdcmParams minDryReadings];
    *(void *)&v3->_didNotify = 0;
    v3->_isBlacklistedAccessoryConnected = 0;
    v3->_isReceptacleEmpty = 1;
    v3->_isMeasurementEnabled = 0;
    *(_WORD *)&v3->_justDetached = 0;
    v3->_isPowerAssertionHeld = 0;
    v3->_attachDelayTimerRunning = 0;
    v12 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v3->_halogenMeasurementDispatchQueue);
    v3->_timer = (OS_dispatch_source *)v12;
    if (v12)
    {
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __22__HalogenWrapper_init__block_invoke;
      handler[3] = &unk_1E6B6D5A0;
      handler[4] = v3;
      dispatch_source_set_event_handler(v12, handler);
      dispatch_source_set_timer((dispatch_source_t)v3->_timer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_resume((dispatch_object_t)v3->_timer);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[HalogenWrapper init]";
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s Failed to create Halogen Timer\n", buf, 0xCu);
      }
      v3 = 0;
    }
    v13 = (NSCondition *)objc_alloc_init(MEMORY[0x1E4F28BB0]);
    v3->_cond = v13;
    if (!v13)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[HalogenWrapper init]";
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s Failed to create NSCondition\n", buf, 0xCu);
      }
      return 0;
    }
  }
  return v3;
}

uint64_t __22__HalogenWrapper_init__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  return performEisMeasurement(*(void **)(a1 + 32));
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_timer);
  dispatch_release((dispatch_object_t)self->_halogenMeasurementDispatchQueue);

  v3.receiver = self;
  v3.super_class = (Class)HalogenWrapper;
  [(HalogenWrapper *)&v3 dealloc];
}

- (OS_dispatch_queue)halogenMeasurementDispatchQueue
{
  return self->_halogenMeasurementDispatchQueue;
}

- (void)setHalogenMeasurementDispatchQueue:(id)a3
{
  self->_halogenMeasurementDispatchQueue = (OS_dispatch_queue *)a3;
}

- (OS_dispatch_queue)halogenTtrDispatchQueue
{
  return self->_halogenTtrDispatchQueue;
}

- (void)setHalogenTtrDispatchQueue:(id)a3
{
  self->_halogenTtrDispatchQueue = (OS_dispatch_queue *)a3;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  self->_timer = (OS_dispatch_source *)a3;
}

- (BOOL)attachDelayTimerRunning
{
  return self->_attachDelayTimerRunning;
}

- (void)setAttachDelayTimerRunning:(BOOL)a3
{
  self->_attachDelayTimerRunning = a3;
}

- (unint64_t)wetPollingIntervalNs
{
  return self->_wetPollingIntervalNs;
}

- (void)setWetPollingIntervalNs:(unint64_t)a3
{
  self->_wetPollingIntervalNs = a3;
}

- (unint64_t)dryPollingIntervalNs
{
  return self->_dryPollingIntervalNs;
}

- (void)setDryPollingIntervalNs:(unint64_t)a3
{
  self->_dryPollingIntervalNs = a3;
}

- (unint64_t)ldcmArbiterRetryNs
{
  return self->_ldcmArbiterRetryNs;
}

- (void)setLdcmArbiterRetryNs:(unint64_t)a3
{
  self->_ldcmArbiterRetryNs = a3;
}

- (unint64_t)ldcmStartMeasurementsDelayNs
{
  return self->_ldcmStartMeasurementsDelayNs;
}

- (void)setLdcmStartMeasurementsDelayNs:(unint64_t)a3
{
  self->_ldcmStartMeasurementsDelayNs = a3;
}

- (unint64_t)ldcmStartMeasurementsRetryNs
{
  return self->_ldcmStartMeasurementsRetryNs;
}

- (void)setLdcmStartMeasurementsRetryNs:(unint64_t)a3
{
  self->_ldcmStartMeasurementsRetryNs = a3;
}

- (unint64_t)minDryReadings
{
  return self->_minDryReadings;
}

- (void)setMinDryReadings:(unint64_t)a3
{
  self->_minDryReadings = a3;
}

- (unint64_t)dryCnt
{
  return self->_dryCnt;
}

- (void)setDryCnt:(unint64_t)a3
{
  self->_dryCnt = a3;
}

- (unint64_t)firstDryTimestamp
{
  return self->_firstDryTimestamp;
}

- (void)setFirstDryTimestamp:(unint64_t)a3
{
  self->_firstDryTimestamp = a3;
}

- (BOOL)isWet
{
  return self->_isWet;
}

- (void)setIsWet:(BOOL)a3
{
  self->_isWet = a3;
}

- (BOOL)wasTapToRadarShown
{
  return self->_wasTapToRadarShown;
}

- (void)setWasTapToRadarShown:(BOOL)a3
{
  self->_wasTapToRadarShown = a3;
}

- (BOOL)isTapToRadarPending
{
  return self->_isTapToRadarPending;
}

- (void)setIsTapToRadarPending:(BOOL)a3
{
  self->_isTapToRadarPending = a3;
}

- (BOOL)isReceptacleEmpty
{
  return self->_isReceptacleEmpty;
}

- (void)setIsReceptacleEmpty:(BOOL)a3
{
  self->_isReceptacleEmpty = a3;
}

- (unint64_t)wetDryTransitionTimestamp
{
  return self->_wetDryTransitionTimestamp;
}

- (void)setWetDryTransitionTimestamp:(unint64_t)a3
{
  self->_wetDryTransitionTimestamp = a3;
}

- (BOOL)isTimestampValid
{
  return self->_isTimestampValid;
}

- (void)setIsTimestampValid:(BOOL)a3
{
  self->_isTimestampValid = a3;
}

- (NSCondition)cond
{
  return self->_cond;
}

- (void)setCond:(id)a3
{
  self->_cond = (NSCondition *)a3;
}

- (BOOL)isMeasurementEnabled
{
  return self->_isMeasurementEnabled;
}

- (void)setIsMeasurementEnabled:(BOOL)a3
{
  self->_isMeasurementEnabled = a3;
}

- (BOOL)isMeasurementActive
{
  return self->_isMeasurementActive;
}

- (void)setIsMeasurementActive:(BOOL)a3
{
  self->_isMeasurementActive = a3;
}

- (HalogenMeasurement)halogenMeasurement
{
  return self->_halogenMeasurement;
}

- (void)setHalogenMeasurement:(id)a3
{
  self->_halogenMeasurement = (HalogenMeasurement *)a3;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_service = a3;
}

- (int)portID
{
  return self->_portID;
}

- (void)setPortID:(int)a3
{
  self->_portID = a3;
}

- (NSData)eventBasedPDigitalID
{
  return self->_eventBasedPDigitalID;
}

- (void)setEventBasedPDigitalID:(id)a3
{
  self->_eventBasedPDigitalID = (NSData *)a3;
}

- (unint64_t)eventBasedDigitalID
{
  return self->_eventBasedDigitalID;
}

- (void)setEventBasedDigitalID:(unint64_t)a3
{
  self->_eventBasedDigitalID = a3;
}

- (int)eventBasedOrientation
{
  return self->_eventBasedOrientation;
}

- (void)setEventBasedOrientation:(int)a3
{
  self->_eventBasedOrientation = a3;
}

- (NSData)connectedAccessoryPDigitalID
{
  return self->_connectedAccessoryPDigitalID;
}

- (void)setConnectedAccessoryPDigitalID:(id)a3
{
  self->_connectedAccessoryPDigitalID = (NSData *)a3;
}

- (unint64_t)connectedAccessoryDigitalID
{
  return self->_connectedAccessoryDigitalID;
}

- (void)setConnectedAccessoryDigitalID:(unint64_t)a3
{
  self->_connectedAccessoryDigitalID = a3;
}

- (int)connectedAccessoryOrientation
{
  return self->_connectedAccessoryOrientation;
}

- (void)setConnectedAccessoryOrientation:(int)a3
{
  self->_connectedAccessoryOrientation = a3;
}

- (int)pinID
{
  return self->_pinID;
}

- (void)setPinID:(int)a3
{
  self->_pinID = a3;
}

- (BOOL)didNotify
{
  return self->_didNotify;
}

- (void)setDidNotify:(BOOL)a3
{
  self->_didNotify = a3;
}

- (BOOL)didConfidentNotify
{
  return self->_didConfidentNotify;
}

- (void)setDidConfidentNotify:(BOOL)a3
{
  self->_didConfidentNotify = a3;
}

- (BOOL)didHighConfidentNotify
{
  return self->_didHighConfidentNotify;
}

- (void)setDidHighConfidentNotify:(BOOL)a3
{
  self->_didHighConfidentNotify = a3;
}

- (BOOL)didWetDuration
{
  return self->_didWetDuration;
}

- (void)setDidWetDuration:(BOOL)a3
{
  self->_didWetDuration = a3;
}

- (BOOL)accessoryConnectedWhileWet
{
  return self->_accessoryConnectedWhileWet;
}

- (void)setAccessoryConnectedWhileWet:(BOOL)a3
{
  self->_accessoryConnectedWhileWet = a3;
}

- (unint64_t)wetAccessoryAttachTimestamp
{
  return self->_wetAccessoryAttachTimestamp;
}

- (void)setWetAccessoryAttachTimestamp:(unint64_t)a3
{
  self->_wetAccessoryAttachTimestamp = a3;
}

- (BOOL)didWetTooLong
{
  return self->_didWetTooLong;
}

- (void)setDidWetTooLong:(BOOL)a3
{
  self->_didWetTooLong = a3;
}

- (BOOL)isHeadsetConnected
{
  return self->_isHeadsetConnected;
}

- (void)setIsHeadsetConnected:(BOOL)a3
{
  self->_isHeadsetConnected = a3;
}

- (BOOL)isDebugAccessoryConnected
{
  return self->_isDebugAccessoryConnected;
}

- (void)setIsDebugAccessoryConnected:(BOOL)a3
{
  self->_isDebugAccessoryConnected = a3;
}

- (BOOL)isBlacklistedAccessoryConnected
{
  return self->_isBlacklistedAccessoryConnected;
}

- (void)setIsBlacklistedAccessoryConnected:(BOOL)a3
{
  self->_isBlacklistedAccessoryConnected = a3;
}

- (BOOL)justDetached
{
  return self->_justDetached;
}

- (void)setJustDetached:(BOOL)a3
{
  self->_justDetached = a3;
}

- (BOOL)justAttachedCase
{
  return self->_justAttachedCase;
}

- (void)setJustAttachedCase:(BOOL)a3
{
  self->_justAttachedCase = a3;
}

- (BOOL)isPowerAssertionHeld
{
  return self->_isPowerAssertionHeld;
}

- (void)setIsPowerAssertionHeld:(BOOL)a3
{
  self->_isPowerAssertionHeld = a3;
}

- (unsigned)sleepAssertionID
{
  return self->_sleepAssertionID;
}

- (void)setSleepAssertionID:(unsigned int)a3
{
  self->_sleepAssertionID = a3;
}

@end