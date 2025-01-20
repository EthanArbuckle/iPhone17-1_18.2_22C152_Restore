@interface GTMTLReplayActivityHarvestResourceObject
- (GTMTLReplayActivityHarvestResourceObject)initWithAttributes:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)jsonObject;
- (id)summary;
- (void)outputToLog:(id)a3;
@end

@implementation GTMTLReplayActivityHarvestResourceObject

- (void).cxx_destruct
{
}

- (void)outputToLog:(id)a3
{
  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    activityType = self->super._activityType;
    attributes = self->_attributes;
    int v7 = 138543618;
    v8 = activityType;
    __int16 v9 = 2114;
    v10 = attributes;
    _os_log_impl(&def_1C1270, (os_log_t)a3, OS_LOG_TYPE_INFO, "%{public}@:\t%{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (id)jsonObject
{
  activityType = self->super._activityType;
  v9[0] = @"activityType";
  v9[1] = @"attributes";
  attributes = self->_attributes;
  v10[0] = activityType;
  v10[1] = attributes;
  v9[2] = @"activityStartTime";
  v5 = +[NSNumber numberWithDouble:*(double *)&time_scale * (double)self->super._activityStartTime];
  v10[2] = v5;
  v9[3] = @"activityEndTime";
  v6 = +[NSNumber numberWithDouble:*(double *)&time_scale * (double)self->super._activityEndTime];
  v10[3] = v6;
  int v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (id)summary
{
  v2 = [(NSDictionary *)self->_attributes objectForKeyedSubscript:@"type"];
  if (!v2)
  {
    CFStringRef v3 = @"a";
    goto LABEL_9;
  }
  objc_opt_class();
  CFStringRef v3 = @"a";
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_9:
    v6 = @"resource";
    goto LABEL_19;
  }
  v4 = (int *)[v2 unsignedLongLongValue];
  if ((uint64_t)v4 <= 21)
  {
    if (v4 == (int *)((char *)&def_1C1270 + 1))
    {
      v5 = "Texture";
      goto LABEL_17;
    }
    if (v4 == (int *)((char *)&def_1C1270 + 2))
    {
      v5 = "Buffer";
      goto LABEL_17;
    }
  }
  else
  {
    if (v4 == (int *)((char *)&dword_14 + 2))
    {
      v5 = "Threadgroup buffer";
      goto LABEL_17;
    }
    if (v4 == &dword_18)
    {
      v5 = "Indirect command buffer";
      goto LABEL_17;
    }
    if (v4 == (int *)((char *)&stru_20.cmdsize + 3))
    {
      v5 = "Rasterization rate map";
      goto LABEL_17;
    }
  }
  v5 = "Resource";
LABEL_17:
  v6 = +[NSString stringWithUTF8String:v5];
  if (v4 == &dword_18) {
    CFStringRef v3 = @"an";
  }
LABEL_19:
  int v7 = +[NSString stringWithFormat:@"Harvesting %@ %@", v3, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GTMTLReplayActivityHarvestResourceObject;
  v4 = [(GTMTLReplayActivity *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4) {
    objc_storeStrong(v4 + 5, self->_attributes);
  }
  return v5;
}

- (GTMTLReplayActivityHarvestResourceObject)initWithAttributes:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GTMTLReplayActivityHarvestResourceObject;
  v6 = [(GTMTLReplayActivity *)&v9 initWithType:@"harvestResourceObject"];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_attributes, a3);
  }

  return v7;
}

@end