@interface BatteryDrainInputs
- (BOOL)autoBrightnessOff;
- (BOOL)disableUSBCharging;
- (BOOL)drainAudio;
- (BOOL)drainCPU;
- (BOOL)drainDisplay;
- (BOOL)drainGPU;
- (BOOL)isAccessoryDetectorActive;
- (BOOL)lowPowerModeOff;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateAndInitializeSpecifications:(id)a3;
- (NSArray)accessoryDetectorModelNumbers;
- (NSNumber)audioVolume;
- (NSNumber)cpuDrainIterationDelay;
- (NSNumber)cpuDrainMatrixLength;
- (NSNumber)displayBrightness;
- (NSNumber)gpuDrainIterationDelay;
- (NSNumber)targetBatteryPercentage;
- (NSString)audioFilename;
- (void)setAudioFilename:(id)a3;
- (void)setAudioVolume:(id)a3;
- (void)setAutoBrightnessOff:(BOOL)a3;
- (void)setCpuDrainIterationDelay:(id)a3;
- (void)setCpuDrainMatrixLength:(id)a3;
- (void)setDisableUSBCharging:(BOOL)a3;
- (void)setDisplayBrightness:(id)a3;
- (void)setDrainAudio:(BOOL)a3;
- (void)setDrainCPU:(BOOL)a3;
- (void)setDrainDisplay:(BOOL)a3;
- (void)setDrainGPU:(BOOL)a3;
- (void)setGpuDrainIterationDelay:(id)a3;
- (void)setLowPowerModeOff:(BOOL)a3;
- (void)setTargetBatteryPercentage:(id)a3;
@end

@implementation BatteryDrainInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  char v18 = 0;
  id v4 = a3;
  [self setDrainAudio:[v4 dk_BOOLFromRequiredKey:@"drainAudio" failed:&v18]];
  [self setDrainDisplay:[v4 dk_BOOLFromRequiredKey:@"drainDisplay" failed:&v18]];
  [self setDrainCPU:[v4 dk_BOOLFromRequiredKey:@"drainCPU" failed:&v18]];
  -[BatteryDrainInputs setDrainGPU:[v4 dk_BOOLFromRequiredKey:@"drainGPU" failed:&v18]];
  v5 = [v4 dk_stringFromKey:@"audioFilename" maxLength:1024 defaultValue:&stru_100014B88 failed:&v18];
  [(BatteryDrainInputs *)self setAudioFilename:v5];

  v6 = [v4 dk_numberFromKey:@"audioVolume" lowerBound:&off_100014E80 upperBound:&off_100014E90 defaultValue:&off_100014E90 failed:&v18];
  [(BatteryDrainInputs *)self setAudioVolume:v6];

  v7 = [v4 dk_numberFromKey:@"displayBrightness" lowerBound:&off_100014E80 upperBound:&off_100014E90 defaultValue:&off_100014E90 failed:&v18];
  [(BatteryDrainInputs *)self setDisplayBrightness:v7];

  -[BatteryDrainInputs setAutoBrightnessOff:[v4 dk_BOOLFromRequiredKey:@"autoBrightnessOff" failed:&v18]];
  [self setLowPowerModeOff:[v4 dk_BOOLFromRequiredKey:@"lowPowerModeOff" failed:&v18]];
  v8 = [v4 dk_numberFromKey:@"drainCPUIterationDelay" lowerBound:&off_100014E08 upperBound:&off_100014E20 defaultValue:&off_100014E08 failed:&v18];
  [(BatteryDrainInputs *)self setCpuDrainIterationDelay:v8];

  v9 = [v4 dk_numberFromKey:@"drainGPUIterationDelay" lowerBound:&off_100014E08 upperBound:&off_100014E20 defaultValue:&off_100014E08 failed:&v18];
  [(BatteryDrainInputs *)self setGpuDrainIterationDelay:v9];

  v10 = [v4 dk_numberFromKey:@"targetBatteryPercentage" lowerBound:&off_100014E80 upperBound:&off_100014EA0 defaultValue:&off_100014E80 failed:&v18];
  [(BatteryDrainInputs *)self setTargetBatteryPercentage:v10];

  [self setDisableUSBCharging:[v4 dk_BOOLFromKey:@"disableUSBCharging" defaultValue:0 failed:&v18]];
  v11 = [v4 dk_dictionaryFromRequiredKey:@"interruptDetectors" failed:&v18];

  v12 = [v11 dk_dictionaryFromRequiredKey:@"accessory" failed:&v18];
  self->_accessoryDetectorActive = [v12 dk_BOOLFromKey:@"active" defaultValue:0 failed:&v18];
  if (!v18 && [(BatteryDrainInputs *)self isAccessoryDetectorActive])
  {
    v13 = +[NSSet setWithObject:objc_opt_class()];
    [v12 dk_arrayFromRequiredKey:@"modelNumbers" types:v13 maxLength:50 failed:&v18 validator:&stru_100014518];
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    accessoryDetectorModelNumbers = self->_accessoryDetectorModelNumbers;
    self->_accessoryDetectorModelNumbers = v14;
  }
  BOOL v16 = v18 == 0;

  return v16;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  char v6 = 0;
  id v4 = [a3 dk_numberFromKey:@"drainCPUMatrixLength" lowerBound:&off_100014E38 upperBound:&off_100014E50 defaultValue:&off_100014E68 failed:&v6];
  [(BatteryDrainInputs *)self setCpuDrainMatrixLength:v4];

  return v6 == 0;
}

- (BOOL)drainAudio
{
  return self->_drainAudio;
}

- (void)setDrainAudio:(BOOL)a3
{
  self->_drainAudio = a3;
}

- (BOOL)drainDisplay
{
  return self->_drainDisplay;
}

- (void)setDrainDisplay:(BOOL)a3
{
  self->_drainDisplay = a3;
}

- (BOOL)autoBrightnessOff
{
  return self->_autoBrightnessOff;
}

- (void)setAutoBrightnessOff:(BOOL)a3
{
  self->_autoBrightnessOff = a3;
}

- (BOOL)drainCPU
{
  return self->_drainCPU;
}

- (void)setDrainCPU:(BOOL)a3
{
  self->_drainCPU = a3;
}

- (BOOL)drainGPU
{
  return self->_drainGPU;
}

- (void)setDrainGPU:(BOOL)a3
{
  self->_drainGPU = a3;
}

- (BOOL)lowPowerModeOff
{
  return self->_lowPowerModeOff;
}

- (void)setLowPowerModeOff:(BOOL)a3
{
  self->_lowPowerModeOff = a3;
}

- (BOOL)disableUSBCharging
{
  return self->_disableUSBCharging;
}

- (void)setDisableUSBCharging:(BOOL)a3
{
  self->_disableUSBCharging = a3;
}

- (NSNumber)cpuDrainMatrixLength
{
  return self->_cpuDrainMatrixLength;
}

- (void)setCpuDrainMatrixLength:(id)a3
{
}

- (NSNumber)cpuDrainIterationDelay
{
  return self->_cpuDrainIterationDelay;
}

- (void)setCpuDrainIterationDelay:(id)a3
{
}

- (NSNumber)gpuDrainIterationDelay
{
  return self->_gpuDrainIterationDelay;
}

- (void)setGpuDrainIterationDelay:(id)a3
{
}

- (NSNumber)targetBatteryPercentage
{
  return self->_targetBatteryPercentage;
}

- (void)setTargetBatteryPercentage:(id)a3
{
}

- (NSString)audioFilename
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioFilename);

  return (NSString *)WeakRetained;
}

- (void)setAudioFilename:(id)a3
{
}

- (NSNumber)audioVolume
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioVolume);

  return (NSNumber *)WeakRetained;
}

- (void)setAudioVolume:(id)a3
{
}

- (NSNumber)displayBrightness
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayBrightness);

  return (NSNumber *)WeakRetained;
}

- (void)setDisplayBrightness:(id)a3
{
}

- (NSArray)accessoryDetectorModelNumbers
{
  return self->_accessoryDetectorModelNumbers;
}

- (BOOL)isAccessoryDetectorActive
{
  return self->_accessoryDetectorActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryDetectorModelNumbers, 0);
  objc_destroyWeak((id *)&self->_displayBrightness);
  objc_destroyWeak((id *)&self->_audioVolume);
  objc_destroyWeak((id *)&self->_audioFilename);
  objc_storeStrong((id *)&self->_targetBatteryPercentage, 0);
  objc_storeStrong((id *)&self->_gpuDrainIterationDelay, 0);
  objc_storeStrong((id *)&self->_cpuDrainIterationDelay, 0);

  objc_storeStrong((id *)&self->_cpuDrainMatrixLength, 0);
}

@end