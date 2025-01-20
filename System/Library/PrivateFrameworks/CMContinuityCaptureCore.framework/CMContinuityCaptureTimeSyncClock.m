@interface CMContinuityCaptureTimeSyncClock
- (BOOL)isConnectedToPeer;
- (CMContinuityCaptureTimeSyncClock)initWithClock:(id)a3;
- (CMContinuityCaptureTimeSyncClock)initWithClockIdentifier:(unint64_t)a3;
- (NSString)clockDeviceUID;
- (unint64_t)clockIdentifier;
- (unint64_t)domainTimeForMachAbsoluteTime:(unint64_t)a3;
- (unint64_t)grandMasterIdentifier;
- (unint64_t)machAbsoluteTimeForDomainTime:(unint64_t)a3;
- (void)dealloc;
- (void)didBeginClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5;
- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4;
- (void)didEndClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5;
- (void)setClockDeviceUID:(id)a3;
- (void)setClockIdentifier:(unint64_t)a3;
- (void)setGrandMasterIdentifier:(unint64_t)a3;
@end

@implementation CMContinuityCaptureTimeSyncClock

- (CMContinuityCaptureTimeSyncClock)initWithClockIdentifier:(unint64_t)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x263F7F260]) initWithClockIdentifier:a3];
  v5 = [(CMContinuityCaptureTimeSyncClock *)self initWithClock:v4];

  return v5;
}

- (CMContinuityCaptureTimeSyncClock)initWithClock:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CMContinuityCaptureTimeSyncClock;
  v6 = [(CMContinuityCaptureTimeSyncClock *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ptpClock, a3);
    [(TSgPTPClock *)v7->_ptpClock addClient:v7];
    uint64_t v8 = [v5 clockIdentifier];
    uint64_t v9 = [MEMORY[0x263F7F258] timeSyncAudioClockDeviceUIDForClockIdentifier:v8];
    clockDeviceUID = v7->_clockDeviceUID;
    v7->_clockDeviceUID = (NSString *)v9;

    if (!v7->_ptpClock || !v7->_clockDeviceUID)
    {
      v12 = 0;
      goto LABEL_6;
    }
    unint64_t v11 = *MEMORY[0x263F7F280];
    v7->_clockIdentifier = v8;
    v7->_grandMasterIdentifier = v11;
  }
  v12 = v7;
LABEL_6:

  return v12;
}

- (void)dealloc
{
  [(TSgPTPClock *)self->_ptpClock removeClient:self];
  [(CMContinuityCaptureTimeSyncClock *)self stopEmittingHeartBeatSignposts];
  v3.receiver = self;
  v3.super_class = (Class)CMContinuityCaptureTimeSyncClock;
  [(CMContinuityCaptureTimeSyncClock *)&v3 dealloc];
}

- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543874;
    uint64_t v9 = self;
    __int16 v10 = 2048;
    uint64_t v11 = [v6 clockIdentifier];
    __int16 v12 = 1024;
    int v13 = a3;
    _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ clock %lld changed lock state to %d", (uint8_t *)&v8, 0x1Cu);
  }
}

- (void)didBeginClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a5;
  int v8 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543874;
    __int16 v10 = self;
    __int16 v11 = 2048;
    uint64_t v12 = [v7 clockIdentifier];
    __int16 v13 = 2048;
    unint64_t v14 = a3;
    _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ clock %lld will change grandmaster to %lld", (uint8_t *)&v9, 0x20u);
  }
}

- (void)didEndClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a5;
  int v8 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543874;
    __int16 v10 = self;
    __int16 v11 = 2048;
    uint64_t v12 = [v7 clockIdentifier];
    __int16 v13 = 2048;
    unint64_t v14 = a3;
    _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ clock %lld did change grandmaster to %lld", (uint8_t *)&v9, 0x20u);
  }
}

- (BOOL)isConnectedToPeer
{
  return [(TSgPTPClock *)self->_ptpClock lockState] != 0;
}

- (unint64_t)domainTimeForMachAbsoluteTime:(unint64_t)a3
{
  return [(TSgPTPClock *)self->_ptpClock convertFromMachAbsoluteToDomainTime:a3 grandmasterUsed:&self->_grandMasterIdentifier];
}

- (unint64_t)machAbsoluteTimeForDomainTime:(unint64_t)a3
{
  __int16 v4 = 0;
  return [(TSgPTPClock *)self->_ptpClock convertFromDomainToMachAbsoluteTime:a3 grandmasterUsed:&self->_grandMasterIdentifier portNumber:&v4];
}

- (unint64_t)clockIdentifier
{
  return self->_clockIdentifier;
}

- (void)setClockIdentifier:(unint64_t)a3
{
  self->_clockIdentifier = a3;
}

- (NSString)clockDeviceUID
{
  return self->_clockDeviceUID;
}

- (void)setClockDeviceUID:(id)a3
{
}

- (unint64_t)grandMasterIdentifier
{
  return self->_grandMasterIdentifier;
}

- (void)setGrandMasterIdentifier:(unint64_t)a3
{
  self->_grandMasterIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartBeatTimer, 0);
  objc_storeStrong((id *)&self->_clockDeviceUID, 0);
  objc_storeStrong((id *)&self->_ptpClock, 0);
}

@end