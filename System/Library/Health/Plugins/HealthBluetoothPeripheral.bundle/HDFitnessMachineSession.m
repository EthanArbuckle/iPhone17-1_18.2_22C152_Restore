@interface HDFitnessMachineSession
+ (id)serviceFromRecoveryConfiguration:(id)a3;
- (BOOL)dataTransferPermitted;
- (BOOL)dataTransferRequirementsComplete;
- (BOOL)waitingOnActivityType;
- (BOOL)waitingOnBluetoothConnection;
- (BOOL)waitingOnInitialMachineData;
- (BOOL)waitingOnInitialMachineStatus;
- (BOOL)waitingOnMFA;
- (HDEnhancedFTMSData)initialEnhancedFTMSData;
- (HDFitnessMachineDataCharacteristicBase)initialMachineData;
- (HDFitnessMachineSession)init;
- (HDFitnessMachineSession)initWithNFCSessionIDData:(id)a3;
- (HDFitnessMachineSession)initWithRecoveryConfiguration:(id)a3;
- (HDFitnessMachineSessionRecoveryConfiguration)recoveryConfiguration;
- (HDFitnessMachineStatus)initialMachineStatus;
- (HDHealthServiceOOBInfo)oobInfo;
- (HKHealthService)healthService;
- (NSArray)nfcConnectionHandoverData;
- (NSData)nfcSessionIDData;
- (NSDate)machinePreferredUntilDate;
- (NSDate)machineStartDate;
- (NSDate)machineStateUpdateDate;
- (NSString)nfcSessionID;
- (NSUUID)fitnessMachineSessionUUID;
- (_HKFitnessMachine)fitnessMachine;
- (int64_t)serviceStatus;
- (unint64_t)connectionState;
- (unint64_t)healthServiceSessionIdentifier;
- (unint64_t)machineState;
- (void)markActivityTypeProvided;
- (void)markBluetoothConnectionComplete;
- (void)markDataTransferPermitted;
- (void)markMFAAuthenticated;
- (void)setConnectionState:(unint64_t)a3;
- (void)setFitnessMachine:(id)a3;
- (void)setFitnessMachineName:(id)a3 type:(unint64_t)a4 identifier:(id)a5;
- (void)setHealthService:(id)a3;
- (void)setHealthServiceSessionIdentifier:(unint64_t)a3;
- (void)setInitialEnhancedFTMSData:(id)a3;
- (void)setInitialMachineData:(id)a3;
- (void)setInitialMachineStatus:(id)a3;
- (void)setMachinePreferredUntilDate:(id)a3;
- (void)setMachineStartDate:(id)a3;
- (void)setMachineState:(unint64_t)a3;
- (void)setMachineStateUpdateDate:(id)a3;
- (void)setOobInfo:(id)a3;
- (void)setServiceStatus:(int64_t)a3;
- (void)setWaitingOnInitialMachineData:(BOOL)a3;
- (void)setWaitingOnInitialMachineStatus:(BOOL)a3;
@end

@implementation HDFitnessMachineSession

- (HDFitnessMachineSession)initWithNFCSessionIDData:(id)a3
{
  id v5 = a3;
  if ([v5 length] == &dword_8)
  {
    v6 = +[NSUUID UUID];
    v7 = sub_3E9BC((id *)&self->super.isa, v6);

    if (v7) {
      objc_storeStrong(v7 + 3, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (HDFitnessMachineSession)init
{
  if (SecRandomCopyBytes(kSecRandomDefault, 8uLL, &v6))
  {
    v3 = 0;
  }
  else
  {
    id v4 = [objc_alloc((Class)NSData) initWithBytes:&v6 length:8];
    self = [(HDFitnessMachineSession *)self initWithNFCSessionIDData:v4];

    v3 = self;
  }

  return v3;
}

- (HDFitnessMachineSession)initWithRecoveryConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [v4 sessionUUID];
  uint64_t v6 = (HDFitnessMachineSession *)sub_3E9BC((id *)&self->super.isa, v5);

  if (v6)
  {
    uint64_t v7 = [(id)objc_opt_class() serviceFromRecoveryConfiguration:v4];
    healthService = v6->_healthService;
    v6->_healthService = (HKHealthService *)v7;

    v9 = [v4 machineName];
    id v10 = [v4 machineType];
    v11 = [v4 machineUUID];
    [(HDFitnessMachineSession *)v6 setFitnessMachineName:v9 type:v10 identifier:v11];

    [(HDFitnessMachineSession *)v6 markDataTransferPermitted];
    -[_HKFitnessMachine _setActivityType:](v6->_fitnessMachine, "_setActivityType:", [v4 activityType]);
    [(HDFitnessMachineSession *)v6 markActivityTypeProvided];
    uint64_t v12 = [v4 machineStartDate];
    machineStartDate = v6->_machineStartDate;
    v6->_machineStartDate = (NSDate *)v12;

    uint64_t v14 = [v4 machinePreferredUntilDate];
    machinePreferredUntilDate = v6->_machinePreferredUntilDate;
    v6->_machinePreferredUntilDate = (NSDate *)v14;

    if (v6->_machineStartDate) {
      BOOL v16 = 0;
    }
    else {
      BOOL v16 = v6->_machinePreferredUntilDate == 0;
    }
    v6->_waitingOnInitialMachineStatus = v16;
    v6->_waitingOnInitialMachineData = v16;
    uint64_t v17 = [v4 nfcSessionIDData];
    nfcSessionIDData = v6->_nfcSessionIDData;
    v6->_nfcSessionIDData = (NSData *)v17;
  }
  return v6;
}

+ (id)serviceFromRecoveryConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)HKHealthService);
  id v5 = [v3 machineUUID];
  uint64_t v6 = [v3 machineName];

  id v7 = [v4 initWithType:1 identifier:v5 name:v6];

  return v7;
}

- (HDFitnessMachineSessionRecoveryConfiguration)recoveryConfiguration
{
  id v3 = [HDFitnessMachineSessionRecoveryConfiguration alloc];
  fitnessMachineSessionUUID = self->_fitnessMachineSessionUUID;
  id v5 = [(_HKFitnessMachine *)self->_fitnessMachine identifier];
  id v6 = [(_HKFitnessMachine *)self->_fitnessMachine type];
  id v7 = [(_HKFitnessMachine *)self->_fitnessMachine device];
  v8 = [v7 name];
  v9 = [(_HKFitnessMachine *)self->_fitnessMachine brand];
  id v10 = [(HDFitnessMachineSessionRecoveryConfiguration *)v3 initWithSessionUUID:fitnessMachineSessionUUID machineUUID:v5 machineType:v6 machineName:v8 machineBrand:v9 activityType:[(_HKFitnessMachine *)self->_fitnessMachine activityType] machineStartDate:self->_machineStartDate machinePreferredUntilDate:self->_machinePreferredUntilDate nfcSessionIDData:self->_nfcSessionIDData];

  return v10;
}

- (void)setFitnessMachineName:(id)a3 type:(unint64_t)a4 identifier:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)_HKFitnessMachine) initWithType:a4 identifier:v8];
  [(HDFitnessMachineSession *)self setFitnessMachine:v10];

  id v11 = objc_alloc((Class)HKDevice);
  uint64_t v12 = [v8 UUIDString];

  id v14 = [v11 initWithName:v9 manufacturer:0 model:0 hardwareVersion:0 firmwareVersion:0 softwareVersion:0 localIdentifier:v12 UDIDeviceIdentifier:0];
  v13 = [(HDFitnessMachineSession *)self fitnessMachine];
  [v13 _setDevice:v14];
}

- (BOOL)dataTransferRequirementsComplete
{
  if ([(HDFitnessMachineSession *)self waitingOnBluetoothConnection]
    || !self->_dataTransferPermitted)
  {
    return 0;
  }
  else
  {
    return ![(HDFitnessMachineSession *)self waitingOnActivityType];
  }
}

- (NSString)nfcSessionID
{
  return [(NSData *)self->_nfcSessionIDData base64EncodedStringWithOptions:0];
}

- (void)markBluetoothConnectionComplete
{
  self->_waitingOnBluetoothConnection = 0;
}

- (void)markDataTransferPermitted
{
  self->_dataTransferPermitted = 1;
}

- (void)markMFAAuthenticated
{
  self->_waitingOnMFA = 0;
}

- (void)markActivityTypeProvided
{
  self->_waitingOnActivityType = 0;
}

- (NSArray)nfcConnectionHandoverData
{
  oobInfo = self->_oobInfo;
  id v4 = self->_nfcSessionIDData;
  id v5 = [(HDHealthServiceOOBInfo *)oobInfo randomValue];
  id v6 = [(HDHealthServiceOOBInfo *)self->_oobInfo confirmationValue];
  id v7 = [(HDHealthServiceOOBInfo *)self->_oobInfo btAddress];
  id v8 = sub_3F0DC((uint64_t)self, v5, v6, v4, v7);

  return (NSArray *)v8;
}

- (NSUUID)fitnessMachineSessionUUID
{
  return self->_fitnessMachineSessionUUID;
}

- (NSData)nfcSessionIDData
{
  return self->_nfcSessionIDData;
}

- (unint64_t)healthServiceSessionIdentifier
{
  return self->_healthServiceSessionIdentifier;
}

- (void)setHealthServiceSessionIdentifier:(unint64_t)a3
{
  self->_healthServiceSessionIdentifier = a3;
}

- (HKHealthService)healthService
{
  return self->_healthService;
}

- (void)setHealthService:(id)a3
{
}

- (int64_t)serviceStatus
{
  return self->_serviceStatus;
}

- (void)setServiceStatus:(int64_t)a3
{
  self->_serviceStatus = a3;
}

- (_HKFitnessMachine)fitnessMachine
{
  return self->_fitnessMachine;
}

- (void)setFitnessMachine:(id)a3
{
}

- (HDHealthServiceOOBInfo)oobInfo
{
  return self->_oobInfo;
}

- (void)setOobInfo:(id)a3
{
}

- (BOOL)waitingOnInitialMachineStatus
{
  return self->_waitingOnInitialMachineStatus;
}

- (void)setWaitingOnInitialMachineStatus:(BOOL)a3
{
  self->_waitingOnInitialMachineStatus = a3;
}

- (HDFitnessMachineStatus)initialMachineStatus
{
  return self->_initialMachineStatus;
}

- (void)setInitialMachineStatus:(id)a3
{
}

- (BOOL)waitingOnInitialMachineData
{
  return self->_waitingOnInitialMachineData;
}

- (void)setWaitingOnInitialMachineData:(BOOL)a3
{
  self->_waitingOnInitialMachineData = a3;
}

- (HDFitnessMachineDataCharacteristicBase)initialMachineData
{
  return self->_initialMachineData;
}

- (void)setInitialMachineData:(id)a3
{
}

- (HDEnhancedFTMSData)initialEnhancedFTMSData
{
  return self->_initialEnhancedFTMSData;
}

- (void)setInitialEnhancedFTMSData:(id)a3
{
}

- (unint64_t)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(unint64_t)a3
{
  self->_connectionState = a3;
}

- (unint64_t)machineState
{
  return self->_machineState;
}

- (void)setMachineState:(unint64_t)a3
{
  self->_machineState = a3;
}

- (NSDate)machineStartDate
{
  return self->_machineStartDate;
}

- (void)setMachineStartDate:(id)a3
{
}

- (NSDate)machineStateUpdateDate
{
  return self->_machineStateUpdateDate;
}

- (void)setMachineStateUpdateDate:(id)a3
{
}

- (NSDate)machinePreferredUntilDate
{
  return self->_machinePreferredUntilDate;
}

- (void)setMachinePreferredUntilDate:(id)a3
{
}

- (BOOL)dataTransferPermitted
{
  return self->_dataTransferPermitted;
}

- (BOOL)waitingOnMFA
{
  return self->_waitingOnMFA;
}

- (BOOL)waitingOnBluetoothConnection
{
  return self->_waitingOnBluetoothConnection;
}

- (BOOL)waitingOnActivityType
{
  return self->_waitingOnActivityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oobDataArray, 0);
  objc_storeStrong((id *)&self->_machinePreferredUntilDate, 0);
  objc_storeStrong((id *)&self->_machineStateUpdateDate, 0);
  objc_storeStrong((id *)&self->_machineStartDate, 0);
  objc_storeStrong((id *)&self->_initialEnhancedFTMSData, 0);
  objc_storeStrong((id *)&self->_initialMachineData, 0);
  objc_storeStrong((id *)&self->_initialMachineStatus, 0);
  objc_storeStrong((id *)&self->_oobInfo, 0);
  objc_storeStrong((id *)&self->_fitnessMachine, 0);
  objc_storeStrong((id *)&self->_healthService, 0);
  objc_storeStrong((id *)&self->_nfcSessionIDData, 0);

  objc_storeStrong((id *)&self->_fitnessMachineSessionUUID, 0);
}

@end