@interface DYGPUTimelineInfo
+ (BOOL)supportsSecureCoding;
- (DYGPUTimelineInfo)init;
- (DYGPUTimelineInfo)initWithCoder:(id)a3;
- (NSArray)derivedCounterNames;
- (NSData)activeCoreInfoMasksPerPeriodicSample;
- (NSData)activeShadersPerPeriodicSample;
- (NSData)derivedCounters;
- (NSData)encoderTimelineInfos;
- (NSData)metalFXTimelineInfo;
- (NSData)numActiveShadersPerPeriodicSample;
- (NSData)timestamps;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)numPeriodicSamples;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateActiveShadersForAllSamples:(id)a3;
- (void)enumerateActiveShadersForSampleAtIndex:(unsigned int)a3 withBlock:(id)a4;
- (void)setActiveCoreInfoMasksPerPeriodicSample:(id)a3;
- (void)setActiveShadersPerPeriodicSample:(id)a3;
- (void)setDerivedCounterNames:(id)a3;
- (void)setDerivedCounters:(id)a3;
- (void)setEncoderTimelineInfos:(id)a3;
- (void)setMetalFXTimelineInfo:(id)a3;
- (void)setNumActiveShadersPerPeriodicSample:(id)a3;
- (void)setNumPeriodicSamples:(unsigned int)a3;
- (void)setTimestamps:(id)a3;
@end

@implementation DYGPUTimelineInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalFXTimelineInfo, 0);
  objc_storeStrong((id *)&self->_encoderTimelineInfos, 0);
  objc_storeStrong((id *)&self->_numActiveShadersPerPeriodicSample, 0);
  objc_storeStrong((id *)&self->_activeCoreInfoMasksPerPeriodicSample, 0);
  objc_storeStrong((id *)&self->_activeShadersPerPeriodicSample, 0);
  objc_storeStrong((id *)&self->_derivedCounterNames, 0);
  objc_storeStrong((id *)&self->_derivedCounters, 0);

  objc_storeStrong((id *)&self->_timestamps, 0);
}

- (void)setMetalFXTimelineInfo:(id)a3
{
}

- (NSData)metalFXTimelineInfo
{
  return self->_metalFXTimelineInfo;
}

- (void)setEncoderTimelineInfos:(id)a3
{
}

- (NSData)encoderTimelineInfos
{
  return self->_encoderTimelineInfos;
}

- (void)setNumActiveShadersPerPeriodicSample:(id)a3
{
}

- (NSData)numActiveShadersPerPeriodicSample
{
  return self->_numActiveShadersPerPeriodicSample;
}

- (void)setActiveCoreInfoMasksPerPeriodicSample:(id)a3
{
}

- (NSData)activeCoreInfoMasksPerPeriodicSample
{
  return self->_activeCoreInfoMasksPerPeriodicSample;
}

- (void)setActiveShadersPerPeriodicSample:(id)a3
{
}

- (NSData)activeShadersPerPeriodicSample
{
  return self->_activeShadersPerPeriodicSample;
}

- (void)setDerivedCounterNames:(id)a3
{
}

- (NSArray)derivedCounterNames
{
  return self->_derivedCounterNames;
}

- (void)setDerivedCounters:(id)a3
{
}

- (NSData)derivedCounters
{
  return self->_derivedCounters;
}

- (void)setTimestamps:(id)a3
{
}

- (NSData)timestamps
{
  return self->_timestamps;
}

- (void)setNumPeriodicSamples:(unsigned int)a3
{
  self->_numPeriodicSamples = a3;
}

- (unsigned)numPeriodicSamples
{
  return self->_numPeriodicSamples;
}

- (void)enumerateActiveShadersForSampleAtIndex:(unsigned int)a3 withBlock:(id)a4
{
  v6 = (void (**)(id, NSUInteger, char *, uint64_t, char *))a4;
  v7 = [(NSData *)self->_activeShadersPerPeriodicSample bytes];
  NSUInteger v8 = [(NSData *)self->_activeShadersPerPeriodicSample length];
  v9 = [(NSData *)self->_activeCoreInfoMasksPerPeriodicSample bytes];
  NSUInteger v10 = [(NSData *)self->_activeCoreInfoMasksPerPeriodicSample length];
  v11 = [(NSData *)self->_numActiveShadersPerPeriodicSample bytes];
  if (a3 < [(NSData *)self->_numActiveShadersPerPeriodicSample length] >> 3)
  {
    char v21 = 0;
    v12 = (unsigned int *)&v11[8 * a3];
    unsigned int v13 = *v12;
    if (*v12)
    {
      uint64_t v14 = 0;
      NSUInteger v15 = v8 >> 3;
      do
      {
        NSUInteger v16 = v14 + v12[1];
        BOOL v18 = v10 < 8 || v10 >> 3 > v16;
        if (v15 > v16 && v18)
        {
          if (v10 >= 8) {
            v20 = &v9[8 * v16];
          }
          else {
            v20 = 0;
          }
          v6[2](v6, (NSUInteger)v7 + 8 * v16, v20, v14, &v21);
          if (v21) {
            break;
          }
          unsigned int v13 = *v12;
        }
        uint64_t v14 = (v14 + 1);
      }
      while (v14 < v13);
    }
  }
}

- (void)enumerateActiveShadersForAllSamples:(id)a3
{
  v4 = (void (**)(id, NSUInteger, char *, uint64_t, uint64_t, char *))a3;
  char v21 = [(NSData *)self->_activeShadersPerPeriodicSample bytes];
  NSUInteger v5 = [(NSData *)self->_activeShadersPerPeriodicSample length];
  v6 = [(NSData *)self->_activeCoreInfoMasksPerPeriodicSample bytes];
  NSUInteger v7 = [(NSData *)self->_activeCoreInfoMasksPerPeriodicSample length];
  v20 = [(NSData *)self->_numActiveShadersPerPeriodicSample bytes];
  NSUInteger v8 = [(NSData *)self->_numActiveShadersPerPeriodicSample length];
  char v22 = 0;
  if (v8 >= 8)
  {
    uint64_t v9 = 0;
    NSUInteger v10 = v5 >> 3;
    NSUInteger v19 = v8 >> 3;
    do
    {
      v11 = (unsigned int *)&v20[8 * v9];
      unsigned int v12 = *v11;
      if (*v11)
      {
        uint64_t v13 = 0;
        do
        {
          NSUInteger v14 = v13 + v11[1];
          BOOL v16 = v7 < 8 || v7 >> 3 > v14;
          if (v10 > v14 && v16)
          {
            if (v7 >= 8) {
              BOOL v18 = &v6[8 * v14];
            }
            else {
              BOOL v18 = 0;
            }
            v4[2](v4, (NSUInteger)v21 + 8 * v14, v18, v9, v13, &v22);
            if (v22) {
              goto LABEL_2;
            }
            unsigned int v12 = *v11;
          }
          uint64_t v13 = (v13 + 1);
        }
        while (v13 < v12);
      }
      ++v9;
    }
    while (v9 != v19);
  }
LABEL_2:
}

- (DYGPUTimelineInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)DYGPUTimelineInfo;
  v2 = [(DYGPUTimelineInfo *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt:self->_numPeriodicSamples forKey:@"numPeriodicSamples"];
  [v4 encodeObject:self->_timestamps forKey:@"timestamps"];
  [v4 encodeObject:self->_derivedCounters forKey:@"derivedCounters"];
  [v4 encodeObject:self->_derivedCounterNames forKey:@"derivedCounterNames"];
  [v4 encodeObject:self->_activeShadersPerPeriodicSample forKey:@"activeShadersPerPeriodicSample"];
  [v4 encodeObject:self->_activeCoreInfoMasksPerPeriodicSample forKey:@"activeCoreInfoMasksPerPeriodicSample"];
  [v4 encodeObject:self->_numActiveShadersPerPeriodicSample forKey:@"numActiveShadersPerPeriodicSample"];
  [v4 encodeObject:self->_encoderTimelineInfos forKey:@"encoderTimelineInfos"];
  [v4 encodeObject:self->_metalFXTimelineInfo forKey:@"metalFXTimelineInfo"];
}

- (DYGPUTimelineInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)DYGPUTimelineInfo;
  NSUInteger v5 = [(DYGPUTimelineInfo *)&v41 init];
  if (v5)
  {
    v5->_numPeriodicSamples = [v4 decodeIntForKey:@"numPeriodicSamples"];
    uint64_t v6 = objc_opt_class();
    NSUInteger v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"timestamps"];
    timestamps = v5->_timestamps;
    v5->_timestamps = (NSData *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"derivedCounters"];
    derivedCounters = v5->_derivedCounters;
    v5->_derivedCounters = (NSData *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    BOOL v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"derivedCounterNames"];
    derivedCounterNames = v5->_derivedCounterNames;
    v5->_derivedCounterNames = (NSArray *)v17;

    uint64_t v19 = objc_opt_class();
    v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"activeShadersPerPeriodicSample"];
    activeShadersPerPeriodicSample = v5->_activeShadersPerPeriodicSample;
    v5->_activeShadersPerPeriodicSample = (NSData *)v21;

    uint64_t v23 = objc_opt_class();
    v24 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"activeCoreInfoMasksPerPeriodicSample"];
    activeCoreInfoMasksPerPeriodicSample = v5->_activeCoreInfoMasksPerPeriodicSample;
    v5->_activeCoreInfoMasksPerPeriodicSample = (NSData *)v25;

    uint64_t v27 = objc_opt_class();
    v28 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"numActiveShadersPerPeriodicSample"];
    numActiveShadersPerPeriodicSample = v5->_numActiveShadersPerPeriodicSample;
    v5->_numActiveShadersPerPeriodicSample = (NSData *)v29;

    uint64_t v31 = objc_opt_class();
    v32 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v31, objc_opt_class(), 0);
    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"encoderTimelineInfos"];
    encoderTimelineInfos = v5->_encoderTimelineInfos;
    v5->_encoderTimelineInfos = (NSData *)v33;

    uint64_t v35 = objc_opt_class();
    v36 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v35, objc_opt_class(), 0);
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"metalFXTimelineInfo"];
    metalFXTimelineInfo = v5->_metalFXTimelineInfo;
    v5->_metalFXTimelineInfo = (NSData *)v37;

    v39 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  [v4 setNumPeriodicSamples:[self numPeriodicSamples]];
  NSUInteger v5 = [(DYGPUTimelineInfo *)self timestamps];
  id v6 = [v5 copy];
  [v4 setTimestamps:v6];

  NSUInteger v7 = [(DYGPUTimelineInfo *)self derivedCounters];
  id v8 = [v7 copy];
  [v4 setDerivedCounters:v8];

  uint64_t v9 = [(DYGPUTimelineInfo *)self derivedCounterNames];
  id v10 = [v9 copy];
  [v4 setDerivedCounterNames:v10];

  v11 = [(DYGPUTimelineInfo *)self activeShadersPerPeriodicSample];
  id v12 = [v11 copy];
  [v4 setActiveShadersPerPeriodicSample:v12];

  uint64_t v13 = [(DYGPUTimelineInfo *)self numActiveShadersPerPeriodicSample];
  id v14 = [v13 copy];
  [v4 setNumActiveShadersPerPeriodicSample:v14];

  uint64_t v15 = [(DYGPUTimelineInfo *)self encoderTimelineInfos];
  id v16 = [v15 copy];
  [v4 setEncoderTimelineInfos:v16];

  uint64_t v17 = [(DYGPUTimelineInfo *)self metalFXTimelineInfo];
  id v18 = [v17 copy];
  [v4 setMetalFXTimelineInfo:v18];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end