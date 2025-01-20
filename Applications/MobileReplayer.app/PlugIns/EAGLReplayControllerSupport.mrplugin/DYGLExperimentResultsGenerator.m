@interface DYGLExperimentResultsGenerator
- (void)begin;
- (void)end;
- (void)onGraphicsFunctionEnd;
- (void)onPlatformFunctionEnd;
- (void)startTiming;
- (void)stopTiming;
@end

@implementation DYGLExperimentResultsGenerator

- (void)startTiming
{
  v3 = [(DYGLExperimentResultsGenerator *)self functionPlayer];
  v4 = [(DYGLExperimentResultsGenerator *)self experiment];
  unsigned int v5 = [v4 enableExperimentFinish];

  if (v5) {
    [v3 gliContext];
  }
  v6.receiver = self;
  v6.super_class = (Class)DYGLExperimentResultsGenerator;
  [(DYGLExperimentResultsGenerator *)&v6 startTiming];
}

- (void)stopTiming
{
  v3 = [(DYGLExperimentResultsGenerator *)self functionPlayer];
  v4 = [(DYGLExperimentResultsGenerator *)self experiment];
  unsigned int v5 = [v4 enableExperimentFinish];

  if (v5) {
    [v3 gliContext];
  }
  v6.receiver = self;
  v6.super_class = (Class)DYGLExperimentResultsGenerator;
  [(DYGLExperimentResultsGenerator *)&v6 stopTiming];
}

- (void)begin
{
  v18.receiver = self;
  v18.super_class = (Class)DYGLExperimentResultsGenerator;
  [(DYGLExperimentResultsGenerator *)&v18 begin];
  v2 = (NSMutableArray *)objc_opt_new();
  overrides = self->_overrides;
  self->_overrides = v2;

  v4 = [(DYGLExperimentResultsGenerator *)self functionPlayer];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unsigned int v5 = [(DYGLExperimentResultsGenerator *)self experiment];
  objc_super v6 = [v5 overrideTypeStrings];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    uint64_t v9 = kDYFunctionPlayerOverrideDisablePresentKey;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 isEqualToString:v9])
        {
          DYDisableBufferSwaps();
          v12 = 0;
        }
        else
        {
          v12 = [[DYEAGLFunctionPlayerOverride alloc] initWithFunctionPlayer:v4 overrideKey:v11];
          if (v12) {
            [(NSMutableArray *)self->_overrides addObject:v12];
          }
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)end
{
  overrides = self->_overrides;
  self->_overrides = 0;

  v4.receiver = self;
  v4.super_class = (Class)DYGLExperimentResultsGenerator;
  [(DYGLExperimentResultsGenerator *)&v4 end];
}

- (void)onGraphicsFunctionEnd
{
  v3 = [(DYGLExperimentResultsGenerator *)self experiment];
  unsigned __int8 v4 = [v3 profilingFlags];

  if ((v4 & 0x40) != 0)
  {
    unsigned int v5 = [(DYGLExperimentResultsGenerator *)self functionPlayer];
    objc_super v6 = [v5 context];
    [v5 ctxID];
    [v5 currentFileFunctionIndex];
    DYAddPerFunctionProfilingData();
  }
  v7.receiver = self;
  v7.super_class = (Class)DYGLExperimentResultsGenerator;
  [(DYGLExperimentResultsGenerator *)&v7 onGraphicsFunctionEnd];
}

- (void)onPlatformFunctionEnd
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = self->_overrides;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    do
    {
      objc_super v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v6) onPlatformFunctionEnd];
        objc_super v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  objc_super v7 = [(DYGLExperimentResultsGenerator *)self experiment];
  BOOL v8 = ((unint64_t)[v7 profilingFlags] & 0x40) == 0;

  if (!v8)
  {
    uint64_t v9 = [(DYGLExperimentResultsGenerator *)self functionPlayer];
    unsigned int v10 = [(DYGLExperimentResultsGenerator *)self prevFileFunctionIndex];
    if (v10 != [v9 currentFileFunctionIndex])
    {
      v11 = [v9 context];
      [v9 ctxID];
      [v9 currentFileFunctionIndex];
      DYAddPerFunctionProfilingData();
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)DYGLExperimentResultsGenerator;
  [(DYGLExperimentResultsGenerator *)&v12 onPlatformFunctionEnd];
}

- (void).cxx_destruct
{
}

@end