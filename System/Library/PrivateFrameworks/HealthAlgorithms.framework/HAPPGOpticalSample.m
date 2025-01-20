@interface HAPPGOpticalSample
- (BOOL)noiseIsUnreliable;
- (BOOL)saturated;
- (HAPPGOpticalSample)initWithPPGProcessorOutputSignal:(const void *)a3;
- (NSNumber)backgroundNoise;
- (NSNumber)estimatedDeviceNoiseOffset;
- (NSNumber)estimatedDevicePinkNoise;
- (NSNumber)estimatedDeviceWhiteNoise;
- (NSNumber)normalizedReflectance;
- (float)effectiveWavelength;
- (int64_t)timestamp;
- (unsigned)emitter;
- (unsigned)hardwareSetting;
- (unsigned)nominalWavelength;
- (unsigned)photodiodes;
- (unsigned)samplingFrequency;
@end

@implementation HAPPGOpticalSample

- (HAPPGOpticalSample)initWithPPGProcessorOutputSignal:(const void *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)HAPPGOpticalSample;
  v4 = [(HAPPGOpticalSample *)&v17 init];
  v4->_emitter = *((unsigned char *)a3 + 8);
  v4->_photodiodes = *((unsigned char *)a3 + 9);
  v4->_hardwareSetting = *((unsigned char *)a3 + 10);
  v4->_samplingFrequency = *((_WORD *)a3 + 6);
  v4->_timestamp = *(void *)a3;
  v4->_nominalWavelength = *((_WORD *)a3 + 7);
  v4->_effectiveWavelength = *((float *)a3 + 4);
  if (*((unsigned char *)a3 + 24))
  {
    LODWORD(v5) = *((_DWORD *)a3 + 5);
    uint64_t v6 = [NSNumber numberWithFloat:v5];
    normalizedReflectance = v4->_normalizedReflectance;
    v4->_normalizedReflectance = (NSNumber *)v6;
  }
  if (*((unsigned char *)a3 + 36))
  {
    LODWORD(v5) = *((_DWORD *)a3 + 8);
    uint64_t v8 = [NSNumber numberWithFloat:v5];
    estimatedDeviceWhiteNoise = v4->_estimatedDeviceWhiteNoise;
    v4->_estimatedDeviceWhiteNoise = (NSNumber *)v8;
  }
  if (*((unsigned char *)a3 + 44))
  {
    LODWORD(v5) = *((_DWORD *)a3 + 10);
    uint64_t v10 = [NSNumber numberWithFloat:v5];
    estimatedDevicePinkNoise = v4->_estimatedDevicePinkNoise;
    v4->_estimatedDevicePinkNoise = (NSNumber *)v10;
  }
  if (*((unsigned char *)a3 + 52))
  {
    LODWORD(v5) = *((_DWORD *)a3 + 12);
    uint64_t v12 = [NSNumber numberWithFloat:v5];
    backgroundNoise = v4->_backgroundNoise;
    v4->_backgroundNoise = (NSNumber *)v12;
  }
  if (*((unsigned char *)a3 + 60))
  {
    LODWORD(v5) = *((_DWORD *)a3 + 14);
    uint64_t v14 = [NSNumber numberWithFloat:v5];
    estimatedDeviceNoiseOffset = v4->_estimatedDeviceNoiseOffset;
    v4->_estimatedDeviceNoiseOffset = (NSNumber *)v14;
  }
  v4->_saturated = *((unsigned char *)a3 + 28);
  v4->_noiseIsUnreliable = *((unsigned char *)a3 + 29);
  return v4;
}

- (unsigned)emitter
{
  return self->_emitter;
}

- (unsigned)photodiodes
{
  return self->_photodiodes;
}

- (unsigned)hardwareSetting
{
  return self->_hardwareSetting;
}

- (unsigned)nominalWavelength
{
  return self->_nominalWavelength;
}

- (float)effectiveWavelength
{
  return self->_effectiveWavelength;
}

- (unsigned)samplingFrequency
{
  return self->_samplingFrequency;
}

- (int64_t)timestamp
{
  return self->_timestamp;
}

- (NSNumber)normalizedReflectance
{
  return self->_normalizedReflectance;
}

- (NSNumber)estimatedDeviceWhiteNoise
{
  return self->_estimatedDeviceWhiteNoise;
}

- (NSNumber)estimatedDevicePinkNoise
{
  return self->_estimatedDevicePinkNoise;
}

- (NSNumber)backgroundNoise
{
  return self->_backgroundNoise;
}

- (NSNumber)estimatedDeviceNoiseOffset
{
  return self->_estimatedDeviceNoiseOffset;
}

- (BOOL)saturated
{
  return self->_saturated;
}

- (BOOL)noiseIsUnreliable
{
  return self->_noiseIsUnreliable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimatedDeviceNoiseOffset, 0);
  objc_storeStrong((id *)&self->_backgroundNoise, 0);
  objc_storeStrong((id *)&self->_estimatedDevicePinkNoise, 0);
  objc_storeStrong((id *)&self->_estimatedDeviceWhiteNoise, 0);
  objc_storeStrong((id *)&self->_normalizedReflectance, 0);
}

@end