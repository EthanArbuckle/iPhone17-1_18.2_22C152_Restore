@interface SecExpConcrete_sec_experiment
- (BOOL)experimentIsAllowedForProcess;
- (BOOL)isSamplingDisabled;
- (BOOL)isSamplingDisabledWithDefault:(BOOL)a3;
- (SecExpConcrete_sec_experiment)initWithInnerExperiment:(id)a3;
- (SecExpConcrete_sec_experiment)initWithName:(const char *)a3;
- (const)identifier;
- (const)name;
- (id)copyExperimentConfiguration;
@end

@implementation SecExpConcrete_sec_experiment

- (void).cxx_destruct
{
}

- (id)copyExperimentConfiguration
{
  return [(SecExperiment *)self->innerExperiment copyExperimentConfiguration];
}

- (BOOL)isSamplingDisabled
{
  return [(SecExperiment *)self->innerExperiment isSamplingDisabled];
}

- (BOOL)isSamplingDisabledWithDefault:(BOOL)a3
{
  return [(SecExperiment *)self->innerExperiment isSamplingDisabledWithDefault:a3];
}

- (BOOL)experimentIsAllowedForProcess
{
  return [(SecExperiment *)self->innerExperiment experimentIsAllowedForProcess];
}

- (const)identifier
{
  id v2 = [(SecExperiment *)self->innerExperiment identifier];
  v3 = (const char *)[v2 UTF8String];

  return v3;
}

- (const)name
{
  id v2 = [(SecExperiment *)self->innerExperiment name];
  v3 = (const char *)[v2 UTF8String];

  return v3;
}

- (SecExpConcrete_sec_experiment)initWithInnerExperiment:(id)a3
{
  id v5 = a3;
  if (v5
    && (v9.receiver = self,
        v9.super_class = (Class)SecExpConcrete_sec_experiment,
        v6 = [(SecExpConcrete_sec_experiment *)&v9 init],
        (self = v6) != 0))
  {
    objc_storeStrong((id *)&v6->innerExperiment, a3);
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (SecExpConcrete_sec_experiment)initWithName:(const char *)a3
{
  v3 = (SecExpConcrete_sec_experiment *)a3;
  if (a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)SecExpConcrete_sec_experiment;
    self = [(SecExpConcrete_sec_experiment *)&v8 init];
    if (self)
    {
      v4 = self;
      id v5 = [[SecExperiment alloc] initWithName:v3];
      innerExperiment = v4->innerExperiment;
      v4->innerExperiment = v5;

      self = v4;
      v3 = self;
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

@end