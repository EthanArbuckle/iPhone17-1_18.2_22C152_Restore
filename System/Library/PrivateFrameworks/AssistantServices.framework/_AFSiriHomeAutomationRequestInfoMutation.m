@interface _AFSiriHomeAutomationRequestInfoMutation
- (_AFSiriHomeAutomationRequestInfoMutation)init;
- (_AFSiriHomeAutomationRequestInfoMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setContext:(id)a3;
@end

@implementation _AFSiriHomeAutomationRequestInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (baseModel)
  {
    if (*(unsigned char *)&self->_mutationFlags)
    {
      if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
      {
        v6 = self->_context;
      }
      else
      {
        v6 = [(AFSiriHomeAutomationRequestInfo *)baseModel context];
      }
      v7 = v6;
      v5 = [[AFSiriHomeAutomationRequestInfo alloc] initWithContext:v6];

      goto LABEL_10;
    }
    v4 = (AFSiriHomeAutomationRequestInfo *)[(AFSiriHomeAutomationRequestInfo *)baseModel copy];
  }
  else
  {
    v4 = [[AFSiriHomeAutomationRequestInfo alloc] initWithContext:self->_context];
  }
  v5 = v4;
LABEL_10:
  return v5;
}

- (void)setContext:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_AFSiriHomeAutomationRequestInfoMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSiriHomeAutomationRequestInfoMutation;
  v6 = [(_AFSiriHomeAutomationRequestInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_AFSiriHomeAutomationRequestInfoMutation)init
{
  return [(_AFSiriHomeAutomationRequestInfoMutation *)self initWithBaseModel:0];
}

@end