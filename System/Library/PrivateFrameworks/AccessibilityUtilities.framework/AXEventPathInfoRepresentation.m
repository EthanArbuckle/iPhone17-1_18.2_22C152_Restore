@interface AXEventPathInfoRepresentation
+ (BOOL)supportsSecureCoding;
+ (id)representationWithPathInfo:(id *)a3;
- (AXEventPathInfoRepresentation)initWithCoder:(id)a3;
- (BOOL)shouldSetTouchFlag;
- (CGPoint)pathLocation;
- (NSString)description;
- (double)pathZValue;
- (float)altitude;
- (float)azimuth;
- (float)barrelPressure;
- (float)orbValue;
- (float)pathDensity;
- (float)pathMajorRadius;
- (float)pathMajorRadiusTolerance;
- (float)pathMinorRadius;
- (float)pathPressure;
- (float)pathQuality;
- (float)pathTwist;
- (float)roll;
- (id)accessibilityEventRepresentationTabularDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)didUpdateMask;
- (unsigned)pathEventMask;
- (unsigned)pathIdentity;
- (unsigned)pathIndex;
- (unsigned)pathProximity;
- (unsigned)pathWindowContextID;
- (unsigned)phaseBits;
- (unsigned)transducerType;
- (unsigned)willUpdateMask;
- (void)encodeWithCoder:(id)a3;
- (void)pathWindow;
- (void)setAltitude:(float)a3;
- (void)setAzimuth:(float)a3;
- (void)setBarrelPressure:(float)a3;
- (void)setDidUpdateMask:(unsigned int)a3;
- (void)setOrbValue:(float)a3;
- (void)setPathDensity:(float)a3;
- (void)setPathEventMask:(unsigned int)a3;
- (void)setPathIdentity:(unsigned __int8)a3;
- (void)setPathIndex:(unsigned __int8)a3;
- (void)setPathLocation:(CGPoint)a3;
- (void)setPathMajorRadius:(float)a3;
- (void)setPathMajorRadiusTolerance:(float)a3;
- (void)setPathMinorRadius:(float)a3;
- (void)setPathPressure:(float)a3;
- (void)setPathProximity:(unsigned __int8)a3;
- (void)setPathQuality:(float)a3;
- (void)setPathTwist:(float)a3;
- (void)setPathWindow:(void *)a3;
- (void)setPathWindowContextID:(unsigned int)a3;
- (void)setPathZValue:(double)a3;
- (void)setPhaseBits:(unsigned __int16)a3;
- (void)setRoll:(float)a3;
- (void)setShouldSetTouchFlag:(BOOL)a3;
- (void)setTransducerType:(unsigned int)a3;
- (void)setWillUpdateMask:(unsigned int)a3;
- (void)writeToPathInfo:(id *)a3;
@end

@implementation AXEventPathInfoRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)representationWithPathInfo:(id *)a3
{
  v4 = objc_alloc_init(AXEventPathInfoRepresentation);
  [(AXEventPathInfoRepresentation *)v4 setPathIndex:a3->var0];
  [(AXEventPathInfoRepresentation *)v4 setPathIdentity:a3->var1];
  [(AXEventPathInfoRepresentation *)v4 setPathProximity:a3->var2];
  *(float *)&double v5 = a3->var3;
  [(AXEventPathInfoRepresentation *)v4 setPathPressure:v5];
  *(float *)&double v6 = a3->var4;
  [(AXEventPathInfoRepresentation *)v4 setPathMajorRadius:v6];
  -[AXEventPathInfoRepresentation setPathLocation:](v4, "setPathLocation:", a3->var5.x, a3->var5.y);
  [(AXEventPathInfoRepresentation *)v4 setPathWindowContextID:a3->var6];
  [(AXEventPathInfoRepresentation *)v4 setPathWindow:a3->var7];

  return v4;
}

- (void)writeToPathInfo:(id *)a3
{
  a3->var0 = [(AXEventPathInfoRepresentation *)self pathIndex];
  a3->var1 = [(AXEventPathInfoRepresentation *)self pathIdentity];
  a3->var2 = [(AXEventPathInfoRepresentation *)self pathProximity];
  [(AXEventPathInfoRepresentation *)self pathPressure];
  a3->var3 = v5;
  [(AXEventPathInfoRepresentation *)self pathMajorRadius];
  a3->var4 = v6;
  [(AXEventPathInfoRepresentation *)self pathLocation];
  a3->var5.x = v7;
  a3->var5.y = v8;
  a3->var6 = [(AXEventPathInfoRepresentation *)self pathWindowContextID];
  a3->var7 = [(AXEventPathInfoRepresentation *)self pathWindow];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(AXEventPathInfoRepresentation);
  [(AXEventPathInfoRepresentation *)v4 setPathIdentity:[(AXEventPathInfoRepresentation *)self pathIdentity]];
  [(AXEventPathInfoRepresentation *)v4 setPathIndex:[(AXEventPathInfoRepresentation *)self pathIndex]];
  [(AXEventPathInfoRepresentation *)v4 setPathProximity:[(AXEventPathInfoRepresentation *)self pathProximity]];
  [(AXEventPathInfoRepresentation *)self pathPressure];
  -[AXEventPathInfoRepresentation setPathPressure:](v4, "setPathPressure:");
  [(AXEventPathInfoRepresentation *)self pathMajorRadius];
  -[AXEventPathInfoRepresentation setPathMajorRadius:](v4, "setPathMajorRadius:");
  [(AXEventPathInfoRepresentation *)self pathMajorRadiusTolerance];
  -[AXEventPathInfoRepresentation setPathMajorRadiusTolerance:](v4, "setPathMajorRadiusTolerance:");
  [(AXEventPathInfoRepresentation *)self pathLocation];
  -[AXEventPathInfoRepresentation setPathLocation:](v4, "setPathLocation:");
  [(AXEventPathInfoRepresentation *)self pathZValue];
  -[AXEventPathInfoRepresentation setPathZValue:](v4, "setPathZValue:");
  [(AXEventPathInfoRepresentation *)v4 setPathWindow:[(AXEventPathInfoRepresentation *)self pathWindow]];
  [(AXEventPathInfoRepresentation *)v4 setPathWindowContextID:[(AXEventPathInfoRepresentation *)self pathWindowContextID]];
  [(AXEventPathInfoRepresentation *)self pathTwist];
  -[AXEventPathInfoRepresentation setPathTwist:](v4, "setPathTwist:");
  [(AXEventPathInfoRepresentation *)self pathMinorRadius];
  -[AXEventPathInfoRepresentation setPathMinorRadius:](v4, "setPathMinorRadius:");
  [(AXEventPathInfoRepresentation *)self pathQuality];
  -[AXEventPathInfoRepresentation setPathQuality:](v4, "setPathQuality:");
  [(AXEventPathInfoRepresentation *)self pathDensity];
  -[AXEventPathInfoRepresentation setPathDensity:](v4, "setPathDensity:");
  [(AXEventPathInfoRepresentation *)v4 setPathEventMask:[(AXEventPathInfoRepresentation *)self pathEventMask]];
  [(AXEventPathInfoRepresentation *)self orbValue];
  -[AXEventPathInfoRepresentation setOrbValue:](v4, "setOrbValue:");
  [(AXEventPathInfoRepresentation *)v4 setTransducerType:[(AXEventPathInfoRepresentation *)self transducerType]];
  [(AXEventPathInfoRepresentation *)self altitude];
  -[AXEventPathInfoRepresentation setAltitude:](v4, "setAltitude:");
  [(AXEventPathInfoRepresentation *)self azimuth];
  -[AXEventPathInfoRepresentation setAzimuth:](v4, "setAzimuth:");
  [(AXEventPathInfoRepresentation *)self barrelPressure];
  -[AXEventPathInfoRepresentation setBarrelPressure:](v4, "setBarrelPressure:");
  [(AXEventPathInfoRepresentation *)self roll];
  -[AXEventPathInfoRepresentation setRoll:](v4, "setRoll:");
  [(AXEventPathInfoRepresentation *)v4 setWillUpdateMask:[(AXEventPathInfoRepresentation *)self willUpdateMask]];
  [(AXEventPathInfoRepresentation *)v4 setDidUpdateMask:[(AXEventPathInfoRepresentation *)self didUpdateMask]];
  [(AXEventPathInfoRepresentation *)v4 setPhaseBits:[(AXEventPathInfoRepresentation *)self phaseBits]];
  return v4;
}

- (AXEventPathInfoRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)AXEventPathInfoRepresentation;
  float v5 = [(AXEventPathInfoRepresentation *)&v23 init];
  if (v5)
  {
    v5->_pathIndex = [v4 decodeInt32ForKey:@"pathIndex"];
    v5->_pathIdentity = [v4 decodeInt32ForKey:@"pathIdentity"];
    v5->_pathProximity = [v4 decodeInt32ForKey:@"pathProximity"];
    [v4 decodeFloatForKey:@"pathPressure"];
    v5->_pathPressure = v6;
    [v4 decodeFloatForKey:@"pathMajorRadius"];
    v5->_pathMajorRadius = v7;
    [v4 decodeFloatForKey:@"pathMajorRadiusTolerance"];
    v5->_pathMajorRadiusTolerance = v8;
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pathLocation"];
    v10 = (const char *)[v9 objCType];
    if (v10 && !strcmp(v10, "{CGPoint=dd}")) {
      [v9 getValue:&v5->_pathLocation size:16];
    }
    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pathZValue"];
    v12 = (const char *)[v11 objCType];
    if (v12 && !strcmp(v12, "d")) {
      [v11 getValue:&v5->_pathZValue size:8];
    }
    v5->_pathWindowContextID = [v4 decodeInt32ForKey:@"pathWindowContextID"];
    v5->_pathWindow = (void *)[v4 decodeInt64ForKey:@"pathWindow"];
    [v4 decodeFloatForKey:@"pathTwist"];
    v5->_pathTwist = v13;
    [v4 decodeFloatForKey:@"pathMinorRadius"];
    v5->_pathMinorRadius = v14;
    [v4 decodeFloatForKey:@"pathQuality"];
    v5->_pathQuality = v15;
    [v4 decodeFloatForKey:@"pathDensity"];
    v5->_pathDensity = v16;
    v5->_pathEventMask = [v4 decodeInt32ForKey:@"pathEventMask"];
    [v4 decodeFloatForKey:@"orbValue"];
    v5->_orbValue = v17;
    v5->_transducerType = [v4 decodeIntegerForKey:@"transducerType"];
    [v4 decodeFloatForKey:@"altitude"];
    v5->_altitude = v18;
    [v4 decodeFloatForKey:@"azimuth"];
    v5->_azimuth = v19;
    [v4 decodeFloatForKey:@"roll"];
    v5->_roll = v20;
    [v4 decodeFloatForKey:@"barrelPressure"];
    v5->_barrelPressure = v21;
    v5->_willUpdateMask = [v4 decodeInt32ForKey:@"willUpdateMask"];
    v5->_didUpdateMask = [v4 decodeInt32ForKey:@"didUpdateMask"];
    v5->_phaseBits = [v4 decodeInt32ForKey:@"phaseBits"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t pathIndex = self->_pathIndex;
  id v19 = a3;
  [v19 encodeInt32:pathIndex forKey:@"pathIndex"];
  [v19 encodeInt32:self->_pathIdentity forKey:@"pathIdentity"];
  [v19 encodeInt32:self->_pathProximity forKey:@"pathProximity"];
  *(float *)&double v5 = self->_pathPressure;
  [v19 encodeFloat:@"pathPressure" forKey:v5];
  *(float *)&double v6 = self->_pathMajorRadius;
  [v19 encodeFloat:@"pathMajorRadius" forKey:v6];
  *(float *)&double v7 = self->_pathMajorRadiusTolerance;
  [v19 encodeFloat:@"pathMajorRadiusTolerance" forKey:v7];
  float v8 = [MEMORY[0x1E4F29238] valueWithBytes:&self->_pathLocation objCType:"{CGPoint=dd}"];
  [v19 encodeObject:v8 forKey:@"pathLocation"];

  id v9 = [MEMORY[0x1E4F29238] valueWithBytes:&self->_pathZValue objCType:"d"];
  [v19 encodeObject:v9 forKey:@"pathZValue"];

  [v19 encodeInt32:self->_pathWindowContextID forKey:@"pathWindowContextID"];
  [v19 encodeInt64:self->_pathWindow forKey:@"pathWindow"];
  *(float *)&double v10 = self->_pathTwist;
  [v19 encodeFloat:@"pathTwist" forKey:v10];
  *(float *)&double v11 = self->_pathMinorRadius;
  [v19 encodeFloat:@"pathMinorRadius" forKey:v11];
  *(float *)&double v12 = self->_pathQuality;
  [v19 encodeFloat:@"pathQuality" forKey:v12];
  *(float *)&double v13 = self->_pathDensity;
  [v19 encodeFloat:@"pathDensity" forKey:v13];
  [v19 encodeInt32:self->_pathEventMask forKey:@"pathEventMask"];
  *(float *)&double v14 = self->_orbValue;
  [v19 encodeFloat:@"orbValue" forKey:v14];
  [v19 encodeInteger:self->_transducerType forKey:@"transducerType"];
  *(float *)&double v15 = self->_altitude;
  [v19 encodeFloat:@"altitude" forKey:v15];
  *(float *)&double v16 = self->_azimuth;
  [v19 encodeFloat:@"azimuth" forKey:v16];
  *(float *)&double v17 = self->_barrelPressure;
  [v19 encodeFloat:@"barrelPressure" forKey:v17];
  *(float *)&double v18 = self->_roll;
  [v19 encodeFloat:@"roll" forKey:v18];
  [v19 encodeInt32:self->_willUpdateMask forKey:@"willUpdateMask"];
  [v19 encodeInt32:self->_didUpdateMask forKey:@"didUpdateMask"];
  [v19 encodeInt32:self->_phaseBits forKey:@"phaseBits"];
}

- (id)accessibilityEventRepresentationTabularDescription
{
  return (id)objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"      Path Index:        %i\n      Identity:          %i\n      Proximity:         %i\n      Pressure:          %f\n      Major Radius:      %f\n      Location:          x: %f y: %f z: %f\n      Window Context ID: %u\n      Window:            %p\n", self->_pathIndex, self->_pathIdentity, self->_pathProximity, self->_pathPressure, self->_pathMajorRadius, *(void *)&self->_pathLocation.x, *(void *)&self->_pathLocation.y, *(void *)&self->_pathZValue, self->_pathWindowContextID, self->_pathWindow);
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)AXEventPathInfoRepresentation;
  v3 = [(AXEventPathInfoRepresentation *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" - pathIndex %i, pathIdentity %i, pathProximity %i, pathPressure %f, pathMajorRadius %f, pathLocation.x %f, pathLocation.y %f, pathLocation.z %f, pathWindowContextID %u, pathWindow %p", self->_pathIndex, self->_pathIdentity, self->_pathProximity, self->_pathPressure, self->_pathMajorRadius, *(void *)&self->_pathLocation.x, *(void *)&self->_pathLocation.y, *(void *)&self->_pathZValue, self->_pathWindowContextID, self->_pathWindow];

  return (NSString *)v4;
}

- (unsigned)pathIndex
{
  return self->_pathIndex;
}

- (void)setPathIndex:(unsigned __int8)a3
{
  self->_uint64_t pathIndex = a3;
}

- (unsigned)pathIdentity
{
  return self->_pathIdentity;
}

- (void)setPathIdentity:(unsigned __int8)a3
{
  self->_pathIdentity = a3;
}

- (CGPoint)pathLocation
{
  double x = self->_pathLocation.x;
  double y = self->_pathLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPathLocation:(CGPoint)a3
{
  self->_pathLocation = a3;
}

- (double)pathZValue
{
  return self->_pathZValue;
}

- (void)setPathZValue:(double)a3
{
  self->_pathZValue = a3;
}

- (unsigned)pathWindowContextID
{
  return self->_pathWindowContextID;
}

- (void)setPathWindowContextID:(unsigned int)a3
{
  self->_pathWindowContextID = a3;
}

- (unsigned)pathProximity
{
  return self->_pathProximity;
}

- (void)setPathProximity:(unsigned __int8)a3
{
  self->_pathProximitdouble y = a3;
}

- (float)pathPressure
{
  return self->_pathPressure;
}

- (void)setPathPressure:(float)a3
{
  self->_pathPressure = a3;
}

- (float)pathMajorRadius
{
  return self->_pathMajorRadius;
}

- (void)setPathMajorRadius:(float)a3
{
  self->_pathMajorRadius = a3;
}

- (float)pathMinorRadius
{
  return self->_pathMinorRadius;
}

- (void)setPathMinorRadius:(float)a3
{
  self->_pathMinorRadius = a3;
}

- (float)pathMajorRadiusTolerance
{
  return self->_pathMajorRadiusTolerance;
}

- (void)setPathMajorRadiusTolerance:(float)a3
{
  self->_pathMajorRadiusTolerance = a3;
}

- (float)pathTwist
{
  return self->_pathTwist;
}

- (void)setPathTwist:(float)a3
{
  self->_pathTwist = a3;
}

- (float)pathQuality
{
  return self->_pathQuality;
}

- (void)setPathQuality:(float)a3
{
  self->_pathQualitdouble y = a3;
}

- (float)pathDensity
{
  return self->_pathDensity;
}

- (void)setPathDensity:(float)a3
{
  self->_pathDensitdouble y = a3;
}

- (unsigned)pathEventMask
{
  return self->_pathEventMask;
}

- (void)setPathEventMask:(unsigned int)a3
{
  self->_pathEventMask = a3;
}

- (float)orbValue
{
  return self->_orbValue;
}

- (void)setOrbValue:(float)a3
{
  self->_orbValue = a3;
}

- (unsigned)transducerType
{
  return self->_transducerType;
}

- (void)setTransducerType:(unsigned int)a3
{
  self->_transducerType = a3;
}

- (float)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(float)a3
{
  self->_altitude = a3;
}

- (float)azimuth
{
  return self->_azimuth;
}

- (void)setAzimuth:(float)a3
{
  self->_azimuth = a3;
}

- (float)barrelPressure
{
  return self->_barrelPressure;
}

- (void)setBarrelPressure:(float)a3
{
  self->_barrelPressure = a3;
}

- (float)roll
{
  return self->_roll;
}

- (void)setRoll:(float)a3
{
  self->_roll = a3;
}

- (unsigned)willUpdateMask
{
  return self->_willUpdateMask;
}

- (void)setWillUpdateMask:(unsigned int)a3
{
  self->_willUpdateMask = a3;
}

- (unsigned)didUpdateMask
{
  return self->_didUpdateMask;
}

- (void)setDidUpdateMask:(unsigned int)a3
{
  self->_didUpdateMask = a3;
}

- (unsigned)phaseBits
{
  return self->_phaseBits;
}

- (void)setPhaseBits:(unsigned __int16)a3
{
  self->_phaseBits = a3;
}

- (BOOL)shouldSetTouchFlag
{
  return self->_shouldSetTouchFlag;
}

- (void)setShouldSetTouchFlag:(BOOL)a3
{
  self->_shouldSetTouchFlag = a3;
}

- (void)pathWindow
{
  return self->_pathWindow;
}

- (void)setPathWindow:(void *)a3
{
  self->_pathWindow = a3;
}

@end