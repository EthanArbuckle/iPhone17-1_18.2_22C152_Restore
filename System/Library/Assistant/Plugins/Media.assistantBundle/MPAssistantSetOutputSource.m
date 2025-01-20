@interface MPAssistantSetOutputSource
- (id)_perform;
- (id)_validate;
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantSetOutputSource

- (id)_validate
{
  return 0;
}

- (id)_perform
{
  return 0;
}

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = [(MPAssistantSetOutputSource *)self _validate];
  if (!v5)
  {
    v5 = [(MPAssistantSetOutputSource *)self _perform];
  }
  id v7 = v5;
  v6 = [v5 dictionary];
  v4[2](v4, v6);
}

@end