@interface IMPipelineComponent
+ (id)pipelineFromComponents:(id)a3;
- (IMPipelineComponent)nextComponent;
- (id)bindTo:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
- (id)runWithInput:(id)a3;
- (void)setNextComponent:(id)a3;
@end

@implementation IMPipelineComponent

- (id)bindTo:(id)a3
{
  return self;
}

- (id)runIndividuallyWithInput:(id)a3
{
  return 0;
}

- (id)runWithInput:(id)a3
{
  nextComponent = self->_nextComponent;
  v5 = [(IMPipelineComponent *)self runIndividuallyWithInput:a3];
  v6 = v5;
  if (nextComponent)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_226F9E4B8;
    v9[3] = &unk_2647F6DC0;
    v9[4] = self;
    uint64_t v7 = [v5 then:v9];

    v6 = (void *)v7;
  }
  return v6;
}

+ (id)pipelineFromComponents:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] != 1)
    {
      unint64_t v4 = 0;
      do
      {
        v5 = [v3 objectAtIndexedSubscript:v4];
        v6 = [v3 objectAtIndexedSubscript:++v4];
        id v7 = (id)[v5 bindTo:v6];
      }
      while ([v3 count] - 1 > v4);
    }
    v8 = [v3 objectAtIndexedSubscript:0];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (IMPipelineComponent)nextComponent
{
  return self->_nextComponent;
}

- (void)setNextComponent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end