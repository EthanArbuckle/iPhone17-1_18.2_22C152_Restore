@interface _AFDeleteSiriHistoryContextMutation
- (BOOL)isDirty;
- (_AFDeleteSiriHistoryContextMutation)initWithBase:(id)a3;
- (id)getErrorBody;
- (id)getErrorButtonText;
- (id)getErrorTitle;
- (id)getSuccessBody;
- (id)getSuccessButtonText;
- (id)getSuccessTitle;
- (void)setErrorBody:(id)a3;
- (void)setErrorButtonText:(id)a3;
- (void)setErrorTitle:(id)a3;
- (void)setSuccessBody:(id)a3;
- (void)setSuccessButtonText:(id)a3;
- (void)setSuccessTitle:(id)a3;
@end

@implementation _AFDeleteSiriHistoryContextMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorButtonText, 0);
  objc_storeStrong((id *)&self->_errorBody, 0);
  objc_storeStrong((id *)&self->_errorTitle, 0);
  objc_storeStrong((id *)&self->_successButtonText, 0);
  objc_storeStrong((id *)&self->_successBody, 0);
  objc_storeStrong((id *)&self->_successTitle, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setErrorButtonText:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x41u;
}

- (id)getErrorButtonText
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_errorButtonText;
  }
  else
  {
    v2 = [(AFDeleteSiriHistoryContext *)self->_base errorButtonText];
  }
  return v2;
}

- (void)setErrorBody:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x21u;
}

- (id)getErrorBody
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_errorBody;
  }
  else
  {
    v2 = [(AFDeleteSiriHistoryContext *)self->_base errorBody];
  }
  return v2;
}

- (void)setErrorTitle:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (id)getErrorTitle
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_errorTitle;
  }
  else
  {
    v2 = [(AFDeleteSiriHistoryContext *)self->_base errorTitle];
  }
  return v2;
}

- (void)setSuccessButtonText:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getSuccessButtonText
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_successButtonText;
  }
  else
  {
    v2 = [(AFDeleteSiriHistoryContext *)self->_base successButtonText];
  }
  return v2;
}

- (void)setSuccessBody:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getSuccessBody
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_successBody;
  }
  else
  {
    v2 = [(AFDeleteSiriHistoryContext *)self->_base successBody];
  }
  return v2;
}

- (void)setSuccessTitle:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getSuccessTitle
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_successTitle;
  }
  else
  {
    v2 = [(AFDeleteSiriHistoryContext *)self->_base successTitle];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFDeleteSiriHistoryContextMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFDeleteSiriHistoryContextMutation;
  v6 = [(_AFDeleteSiriHistoryContextMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end