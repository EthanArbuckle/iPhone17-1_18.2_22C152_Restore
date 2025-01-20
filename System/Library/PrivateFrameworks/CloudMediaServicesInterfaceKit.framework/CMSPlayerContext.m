@interface CMSPlayerContext
+ (id)instanceFromCMSCoded:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualContext:(id)a3;
- (BOOL)offsetIsValid;
- (CMSPlayerContext)playerContextWithUpdatedOffset:(int64_t)a3;
- (CMSPlayerContext)playerContextWithUpdatedSpeed:(float)a3;
- (CMSPlayerContext)playerContextWithUpdatedSpeed:(float)a3 offset:(int64_t)a4;
- (NSString)activityIdentifier;
- (NSString)contentIdentifier;
- (NSString)description;
- (NSString)queueIdentifier;
- (float)playbackSpeed;
- (id)cmsCoded;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForActivity:(id)a3 queue:(id)a4 content:(id)a5 speed:(float)a6;
- (id)initForActivity:(id)a3 queue:(id)a4 content:(id)a5 speed:(float)a6 offset:(int64_t)a7;
- (int64_t)offsetInMillis;
- (unint64_t)hash;
@end

@implementation CMSPlayerContext

- (id)initForActivity:(id)a3 queue:(id)a4 content:(id)a5 speed:(float)a6
{
  return -[CMSPlayerContext initForActivity:queue:content:speed:offset:](self, "initForActivity:queue:content:speed:offset:", a3, a4, a5, 0x8000000000000000);
}

- (id)initForActivity:(id)a3 queue:(id)a4 content:(id)a5 speed:(float)a6 offset:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CMSPlayerContext;
  v16 = [(CMSPlayerContext *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_activityIdentifier, a3);
    objc_storeStrong((id *)&v17->_queueIdentifier, a4);
    objc_storeStrong((id *)&v17->_contentIdentifier, a5);
    v17->_playbackSpeed = a6;
    v17->_offsetInMillis = a7;
  }

  return v17;
}

- (BOOL)offsetIsValid
{
  return self->_offsetInMillis != 0x8000000000000000;
}

- (CMSPlayerContext)playerContextWithUpdatedSpeed:(float)a3
{
  v5 = [CMSPlayerContext alloc];
  *(float *)&double v6 = a3;
  id v7 = [(CMSPlayerContext *)v5 initForActivity:self->_activityIdentifier queue:self->_queueIdentifier content:self->_contentIdentifier speed:self->_offsetInMillis offset:v6];
  return (CMSPlayerContext *)v7;
}

- (CMSPlayerContext)playerContextWithUpdatedSpeed:(float)a3 offset:(int64_t)a4
{
  id v7 = [CMSPlayerContext alloc];
  *(float *)&double v8 = a3;
  id v9 = [(CMSPlayerContext *)v7 initForActivity:self->_activityIdentifier queue:self->_queueIdentifier content:self->_contentIdentifier speed:a4 offset:v8];
  return (CMSPlayerContext *)v9;
}

- (CMSPlayerContext)playerContextWithUpdatedOffset:(int64_t)a3
{
  v5 = [CMSPlayerContext alloc];
  *(float *)&double v6 = self->_playbackSpeed;
  id v7 = [(CMSPlayerContext *)v5 initForActivity:self->_activityIdentifier queue:self->_queueIdentifier content:self->_contentIdentifier speed:a3 offset:v6];
  return (CMSPlayerContext *)v7;
}

- (BOOL)isEqualContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 activityIdentifier];
  double v6 = (void *)v5;
  if (v5 | (uint64_t)self->_activityIdentifier && !objc_msgSend((id)v5, "isEqualToString:"))
  {
    char v13 = 0;
  }
  else
  {
    id v7 = [v4 contentIdentifier];
    double v8 = v7;
    if (self->_contentIdentifier) {
      contentIdentifier = (__CFString *)self->_contentIdentifier;
    }
    else {
      contentIdentifier = &stru_26DE5AB78;
    }
    if ([v7 isEqualToString:contentIdentifier])
    {
      v10 = [v4 queueIdentifier];
      v11 = v10;
      if (self->_queueIdentifier) {
        queueIdentifier = (__CFString *)self->_queueIdentifier;
      }
      else {
        queueIdentifier = &stru_26DE5AB78;
      }
      char v13 = [v10 isEqualToString:queueIdentifier];
    }
    else
    {
      char v13 = 0;
    }
  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 activityIdentifier];
  double v6 = (void *)v5;
  if (v5 | (uint64_t)self->_activityIdentifier && !objc_msgSend((id)v5, "isEqualToString:"))
  {
    BOOL v14 = 0;
  }
  else
  {
    id v7 = [v4 contentIdentifier];
    double v8 = v7;
    if (self->_contentIdentifier) {
      contentIdentifier = (__CFString *)self->_contentIdentifier;
    }
    else {
      contentIdentifier = &stru_26DE5AB78;
    }
    if ([v7 isEqualToString:contentIdentifier])
    {
      v10 = [v4 queueIdentifier];
      v11 = v10;
      if (self->_queueIdentifier) {
        queueIdentifier = (__CFString *)self->_queueIdentifier;
      }
      else {
        queueIdentifier = &stru_26DE5AB78;
      }
      BOOL v14 = [v10 isEqualToString:queueIdentifier]
         && ([v4 playbackSpeed], vabds_f32(v13, self->_playbackSpeed) < 0.000001)
         && [v4 offsetInMillis] == self->_offsetInMillis;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_activityIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_queueIdentifier hash] + v3;
  return v4
       + [(NSString *)self->_contentIdentifier hash]
       + self->_offsetInMillis
       + (unint64_t)(fabsf(self->_playbackSpeed) * 1000000.0);
}

- (id)cmsCoded
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  [v3 cmsSetOptionalObject:self->_activityIdentifier forKey:@"activityIdentifier"];
  [v3 cmsSetOptionalObject:self->_queueIdentifier forKey:@"queueIdentifier"];
  [v3 cmsSetOptionalObject:self->_contentIdentifier forKey:@"contentIdentifier"];
  if (self->_playbackSpeed != 1.0)
  {
    NSUInteger v4 = objc_msgSend(NSNumber, "numberWithFloat:");
    [v3 setObject:v4 forKey:@"playbackSpeed"];
  }
  if ([(CMSPlayerContext *)self offsetIsValid])
  {
    uint64_t v5 = [NSNumber numberWithInteger:self->_offsetInMillis];
    [v3 setObject:v5 forKey:@"offsetInMillis"];
  }
  return v3;
}

+ (id)instanceFromCMSCoded:(id)a3
{
  NSUInteger v4 = cmsSafeDictionary(a3);
  uint64_t v5 = v4;
  if (v4)
  {
    double v6 = [v4 cmsOptionalStringForKey:@"contentIdentifier"];
    if (v6)
    {
      uint64_t v7 = [v5 cmsOptionalStringForKey:@"queueIdentifier"];
      if (v7) {
        double v8 = (__CFString *)v7;
      }
      else {
        double v8 = &stru_26DE5AB78;
      }
      id v9 = [v5 cmsOptionalStringForKey:@"activityIdentifier"];
      [v5 cmsDoubleForKey:@"playbackSpeed" withDefault:1.0];
      float v11 = v10;
      uint64_t v12 = [v5 cmsUnsignedForKey:@"offsetInMillis" withDefault:0x8000000000000000];
      id v13 = objc_alloc((Class)a1);
      *(float *)&double v14 = v11;
      id v15 = (void *)[v13 initForActivity:v9 queue:v8 content:v6 speed:v12 offset:v14];
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = +[CMSPlayerContext allocWithZone:a3];
  activityIdentifier = self->_activityIdentifier;
  queueIdentifier = self->_queueIdentifier;
  *(float *)&double v7 = self->_playbackSpeed;
  contentIdentifier = self->_contentIdentifier;
  int64_t offsetInMillis = self->_offsetInMillis;
  return [(CMSPlayerContext *)v4 initForActivity:activityIdentifier queue:queueIdentifier content:contentIdentifier speed:offsetInMillis offset:v7];
}

- (NSString)description
{
  NSUInteger v3 = NSString;
  NSUInteger v4 = [(CMSPlayerContext *)self cmsCoded];
  uint64_t v5 = [v4 description];
  double v6 = [v3 stringWithFormat:@"CMSPlayerContext @%p:%@", self, v5];

  return (NSString *)v6;
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (NSString)queueIdentifier
{
  return self->_queueIdentifier;
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

- (float)playbackSpeed
{
  return self->_playbackSpeed;
}

- (int64_t)offsetInMillis
{
  return self->_offsetInMillis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_queueIdentifier, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
}

@end