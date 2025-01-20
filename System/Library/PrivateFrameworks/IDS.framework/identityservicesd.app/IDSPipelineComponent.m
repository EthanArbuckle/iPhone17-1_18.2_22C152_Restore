@interface IDSPipelineComponent
+ (id)pipelineFromComponents:(id)a3;
- (IDSPipelineComponent)nextComponent;
- (id)bindTo:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
- (id)runWithInput:(id)a3;
- (void)setNextComponent:(id)a3;
@end

@implementation IDSPipelineComponent

- (id)bindTo:(id)a3
{
  return self;
}

- (id)runIndividuallyWithInput:(id)a3
{
  v5 = +[NSAssertionHandler currentHandler];
  [v5 handleFailureInMethod:a2 object:self file:@"IDSPipelineComponent.m" lineNumber:20 description:@"Subclasses must implement runIndividuallyWithInput"];

  return 0;
}

- (id)runWithInput:(id)a3
{
  nextComponent = self->_nextComponent;
  v5 = [(IDSPipelineComponent *)self runIndividuallyWithInput:a3];
  v6 = v5;
  if (nextComponent)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1003C7ECC;
    v9[3] = &unk_10098B308;
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
    if ([v3 count] != (id)1)
    {
      v4 = 0;
      do
      {
        v5 = [v3 objectAtIndexedSubscript:v4];
        v6 = [v3 objectAtIndexedSubscript:++v4];
        id v7 = [v5 bindTo:v6];
      }
      while ((char *)[v3 count] - 1 > v4);
    }
    v8 = [v3 objectAtIndexedSubscript:0];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (IDSPipelineComponent)nextComponent
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