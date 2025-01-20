@interface HIDEvent(HIDDigitizerEventPrivate)
- (uint64_t)digitizerAltitude;
- (uint64_t)digitizerAuxiliaryPressure;
- (uint64_t)digitizerAzimuth;
- (uint64_t)digitizerButtonMask;
- (uint64_t)digitizerChildEventMask;
- (uint64_t)digitizerCollection;
- (uint64_t)digitizerDensity;
- (uint64_t)digitizerDidUpdateMask;
- (uint64_t)digitizerEventMask;
- (uint64_t)digitizerGenerationCount;
- (uint64_t)digitizerIdentity;
- (uint64_t)digitizerIndex;
- (uint64_t)digitizerIrregularity;
- (uint64_t)digitizerIsDisplayIntegrated;
- (uint64_t)digitizerMajorRadius;
- (uint64_t)digitizerMinorRadius;
- (uint64_t)digitizerOrientationType;
- (uint64_t)digitizerPressure;
- (uint64_t)digitizerQuality;
- (uint64_t)digitizerQualityRadiiAccuracy;
- (uint64_t)digitizerRange;
- (uint64_t)digitizerRoll;
- (uint64_t)digitizerTiltX;
- (uint64_t)digitizerTiltY;
- (uint64_t)digitizerTouch;
- (uint64_t)digitizerTwist;
- (uint64_t)digitizerType;
- (uint64_t)digitizerWillUpdateMask;
- (uint64_t)digitizerX;
- (uint64_t)digitizerY;
- (uint64_t)digitizerZ;
- (uint64_t)setDigitizerAltitude:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerAuxiliaryPressure:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerAzimuth:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerButtonMask:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerChildEventMask:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerCollection:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerDensity:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerDidUpdateMask:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerEventMask:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerGenerationCount:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerIdentity:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerIndex:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerIrregularity:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerIsDisplayIntegrated:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerMajorRadius:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerMinorRadius:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerPressure:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerQuality:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerQualityRadiiAccuracy:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerRange:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerRoll:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerTiltX:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerTiltY:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerTouch:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerTwist:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerType:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerWillUpdateMask:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerX:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerY:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerZ:()HIDDigitizerEventPrivate;
@end

@implementation HIDEvent(HIDDigitizerEventPrivate)

- (uint64_t)digitizerAltitude
{
  return MEMORY[0x1F40E89F8](a1, 720911);
}

- (uint64_t)setDigitizerAltitude:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 720911);
}

- (uint64_t)digitizerAuxiliaryPressure
{
  return MEMORY[0x1F40E89F8](a1, 720907);
}

- (uint64_t)setDigitizerAuxiliaryPressure:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 720907);
}

- (uint64_t)digitizerAzimuth
{
  return MEMORY[0x1F40E89F8](a1, 720912);
}

- (uint64_t)setDigitizerAzimuth:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 720912);
}

- (uint64_t)digitizerButtonMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerButtonMask:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 720899);
}

- (uint64_t)digitizerChildEventMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerChildEventMask:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 720920);
}

- (uint64_t)digitizerCollection
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerCollection:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 720918);
}

- (uint64_t)digitizerDensity
{
  return MEMORY[0x1F40E89F8](a1, 720914);
}

- (uint64_t)setDigitizerDensity:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 720914);
}

- (uint64_t)digitizerDidUpdateMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerDidUpdateMask:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 720925);
}

- (uint64_t)digitizerEventMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerEventMask:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 720903);
}

- (uint64_t)digitizerGenerationCount
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerGenerationCount:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 720923);
}

- (uint64_t)digitizerIdentity
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerIdentity:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 720902);
}

- (uint64_t)digitizerIndex
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerIndex:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 720901);
}

- (uint64_t)digitizerIrregularity
{
  return MEMORY[0x1F40E89F8](a1, 720915);
}

- (uint64_t)setDigitizerIrregularity:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 720915);
}

- (uint64_t)digitizerIsDisplayIntegrated
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerIsDisplayIntegrated:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 720921);
}

- (uint64_t)digitizerMajorRadius
{
  return MEMORY[0x1F40E89F8](a1, 720916);
}

- (uint64_t)setDigitizerMajorRadius:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 720916);
}

- (uint64_t)digitizerMinorRadius
{
  return MEMORY[0x1F40E89F8](a1, 720917);
}

- (uint64_t)setDigitizerMinorRadius:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 720917);
}

- (uint64_t)digitizerOrientationType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)digitizerPressure
{
  return MEMORY[0x1F40E89F8](a1, 720906);
}

- (uint64_t)setDigitizerPressure:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 720906);
}

- (uint64_t)digitizerQuality
{
  return MEMORY[0x1F40E89F8](a1, 720913);
}

- (uint64_t)setDigitizerQuality:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 720913);
}

- (uint64_t)digitizerQualityRadiiAccuracy
{
  return MEMORY[0x1F40E89F8](a1, 720922);
}

- (uint64_t)setDigitizerQualityRadiiAccuracy:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 720922);
}

- (uint64_t)digitizerRange
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerRange:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 720904);
}

- (uint64_t)digitizerRoll
{
  return MEMORY[0x1F40E89F8](a1, 720919);
}

- (uint64_t)setDigitizerRoll:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 720919);
}

- (uint64_t)digitizerTiltX
{
  return MEMORY[0x1F40E89F8](a1, 720909);
}

- (uint64_t)setDigitizerTiltX:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 720909);
}

- (uint64_t)digitizerTiltY
{
  return MEMORY[0x1F40E89F8](a1, 720910);
}

- (uint64_t)setDigitizerTiltY:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 720910);
}

- (uint64_t)digitizerTouch
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerTouch:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 720905);
}

- (uint64_t)digitizerTwist
{
  return MEMORY[0x1F40E89F8](a1, 720908);
}

- (uint64_t)setDigitizerTwist:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 720908);
}

- (uint64_t)digitizerType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerType:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 720900);
}

- (uint64_t)digitizerWillUpdateMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerWillUpdateMask:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 720924);
}

- (uint64_t)digitizerX
{
  return MEMORY[0x1F40E89F8](a1, 720896);
}

- (uint64_t)setDigitizerX:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 720896);
}

- (uint64_t)digitizerY
{
  return MEMORY[0x1F40E89F8](a1, 720897);
}

- (uint64_t)setDigitizerY:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 720897);
}

- (uint64_t)digitizerZ
{
  return MEMORY[0x1F40E89F8](a1, 720898);
}

- (uint64_t)setDigitizerZ:()HIDDigitizerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 720898);
}

@end