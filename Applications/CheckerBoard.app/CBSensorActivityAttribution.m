@interface CBSensorActivityAttribution
- (BOOL)isEqual:(id)a3;
- (BOOL)usedRecently;
- (CBSensorActivityAttribution)initWithDataAccessAttribution:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)sensor;
- (unint64_t)hash;
@end

@implementation CBSensorActivityAttribution

- (CBSensorActivityAttribution)initWithDataAccessAttribution:(id)a3
{
  id v4 = a3;
  id v5 = [v4 dataAccessType];
  if (v5 == (id)2)
  {
    v8 = [v4 locationAttribution];
    v6 = [v8 activityAttribution];

    uint64_t v7 = 2;
  }
  else if (v5 == (id)1)
  {
    v9 = [v4 cameraCaptureAttribution];
    v6 = [v9 activityAttribution];

    uint64_t v7 = 0;
  }
  else if (v5)
  {
    uint64_t v7 = 0;
    v6 = 0;
  }
  else
  {
    v6 = [v4 audioRecordingActivityAttribution];
    uint64_t v7 = 1;
  }
  v13.receiver = self;
  v13.super_class = (Class)CBSensorActivityAttribution;
  v10 = [(CBActivityAttribution *)&v13 initWithSTActivityAttribution:v6];
  v11 = v10;
  if (v10)
  {
    v10->_sensor = v7;
    v10->_usedRecently = [v4 isRecent];
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  int64_t v6 = [(CBSensorActivityAttribution *)self sensor];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000EFCC;
  v12[3] = &unk_100079800;
  id v7 = v4;
  id v13 = v7;
  id v8 = [v5 appendInteger:v6 counterpart:v12];
  if ([v5 isEqual])
  {
    v11.receiver = self;
    v11.super_class = (Class)CBSensorActivityAttribution;
    BOOL v9 = [(CBActivityAttribution *)&v11 isEqual:v7];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = +[BSHashBuilder builder];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000F09C;
  v8[3] = &unk_100079828;
  v8[4] = self;
  [v3 appendHashingBlocks:v8];
  id v5 = [v3 appendInteger:[self sensor]];
  id v6 = [v3 hash];

  return (unint64_t)v6;
}

- (id)succinctDescription
{
  v2 = [(CBSensorActivityAttribution *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v7.receiver = self;
  v7.super_class = (Class)CBSensorActivityAttribution;
  v3 = [(CBActivityAttribution *)&v7 succinctDescriptionBuilder];
  id v4 = sub_10000ED70([(CBSensorActivityAttribution *)self sensor]);
  id v5 = [v3 appendObject:v4 withName:@"sensor"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(CBSensorActivityAttribution *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CBSensorActivityAttribution;
  id v4 = a3;
  [(CBActivityAttribution *)&v11 descriptionBuilderWithMultilinePrefix:v4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000F2E4;
  v8[3] = &unk_1000795E0;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v5;
  v10 = self;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v8];

  id v6 = v5;
  return v6;
}

- (int64_t)sensor
{
  return self->_sensor;
}

- (BOOL)usedRecently
{
  return self->_usedRecently;
}

@end