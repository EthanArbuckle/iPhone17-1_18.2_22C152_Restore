@interface HIDEvent(HIDAmbientLightSensorEventPrivate)
- (BOOL)ambientLightDisplayBrightnessChanged;
- (uint64_t)ambientLightColorComponent0;
- (uint64_t)ambientLightColorComponent1;
- (uint64_t)ambientLightColorComponent2;
- (uint64_t)ambientLightColorSpace;
- (uint64_t)ambientLightSensorColorTemperature;
- (uint64_t)ambientLightSensorIlluminance;
- (uint64_t)ambientLightSensorLevel;
- (uint64_t)ambientLightSensorRawChannel0;
- (uint64_t)ambientLightSensorRawChannel1;
- (uint64_t)ambientLightSensorRawChannel2;
- (uint64_t)ambientLightSensorRawChannel3;
- (uint64_t)setAmbientLightColorComponent0:()HIDAmbientLightSensorEventPrivate;
- (uint64_t)setAmbientLightColorComponent1:()HIDAmbientLightSensorEventPrivate;
- (uint64_t)setAmbientLightColorComponent2:()HIDAmbientLightSensorEventPrivate;
- (uint64_t)setAmbientLightColorSpace:()HIDAmbientLightSensorEventPrivate;
- (uint64_t)setAmbientLightDisplayBrightnessChanged:()HIDAmbientLightSensorEventPrivate;
- (uint64_t)setAmbientLightSensorColorTemperature:()HIDAmbientLightSensorEventPrivate;
- (uint64_t)setAmbientLightSensorIlluminance:()HIDAmbientLightSensorEventPrivate;
- (uint64_t)setAmbientLightSensorLevel:()HIDAmbientLightSensorEventPrivate;
- (uint64_t)setAmbientLightSensorRawChannel0:()HIDAmbientLightSensorEventPrivate;
- (uint64_t)setAmbientLightSensorRawChannel1:()HIDAmbientLightSensorEventPrivate;
- (uint64_t)setAmbientLightSensorRawChannel2:()HIDAmbientLightSensorEventPrivate;
- (uint64_t)setAmbientLightSensorRawChannel3:()HIDAmbientLightSensorEventPrivate;
@end

@implementation HIDEvent(HIDAmbientLightSensorEventPrivate)

- (uint64_t)ambientLightColorComponent0
{
  return MEMORY[0x1F40E89F8](a1, 786439);
}

- (uint64_t)setAmbientLightColorComponent0:()HIDAmbientLightSensorEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 786439);
}

- (uint64_t)ambientLightColorComponent1
{
  return MEMORY[0x1F40E89F8](a1, 786440);
}

- (uint64_t)setAmbientLightColorComponent1:()HIDAmbientLightSensorEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 786440);
}

- (uint64_t)ambientLightColorComponent2
{
  return MEMORY[0x1F40E89F8](a1, 786441);
}

- (uint64_t)setAmbientLightColorComponent2:()HIDAmbientLightSensorEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 786441);
}

- (uint64_t)ambientLightColorSpace
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setAmbientLightColorSpace:()HIDAmbientLightSensorEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 786438);
}

- (BOOL)ambientLightDisplayBrightnessChanged
{
  return IOHIDEventGetIntegerValue() != 0;
}

- (uint64_t)setAmbientLightDisplayBrightnessChanged:()HIDAmbientLightSensorEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 786437);
}

- (uint64_t)ambientLightSensorColorTemperature
{
  return MEMORY[0x1F40E89F8](a1, 786442);
}

- (uint64_t)setAmbientLightSensorColorTemperature:()HIDAmbientLightSensorEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 786442);
}

- (uint64_t)ambientLightSensorIlluminance
{
  return MEMORY[0x1F40E89F8](a1, 786443);
}

- (uint64_t)setAmbientLightSensorIlluminance:()HIDAmbientLightSensorEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 786443);
}

- (uint64_t)ambientLightSensorLevel
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setAmbientLightSensorLevel:()HIDAmbientLightSensorEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 786432);
}

- (uint64_t)ambientLightSensorRawChannel0
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setAmbientLightSensorRawChannel0:()HIDAmbientLightSensorEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 786433);
}

- (uint64_t)ambientLightSensorRawChannel1
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setAmbientLightSensorRawChannel1:()HIDAmbientLightSensorEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 786434);
}

- (uint64_t)ambientLightSensorRawChannel2
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setAmbientLightSensorRawChannel2:()HIDAmbientLightSensorEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 786435);
}

- (uint64_t)ambientLightSensorRawChannel3
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setAmbientLightSensorRawChannel3:()HIDAmbientLightSensorEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 786436);
}

@end