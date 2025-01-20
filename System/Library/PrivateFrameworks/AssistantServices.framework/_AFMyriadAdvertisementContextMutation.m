@interface _AFMyriadAdvertisementContextMutation
- (BOOL)isDirty;
- (_AFMyriadAdvertisementContextMutation)initWithBase:(id)a3;
- (double)getContextFetchDelay;
- (id)getContextData;
- (unint64_t)getGeneration;
- (void)setContextData:(id)a3;
- (void)setContextFetchDelay:(double)a3;
- (void)setGeneration:(unint64_t)a3;
@end

@implementation _AFMyriadAdvertisementContextMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextData, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setContextFetchDelay:(double)a3
{
  self->_contextFetchDelay = a3;
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (double)getContextFetchDelay
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
    return self->_contextFetchDelay;
  }
  [(AFMyriadAdvertisementContext *)self->_base contextFetchDelay];
  return result;
}

- (void)setContextData:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getContextData
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_contextData;
  }
  else
  {
    v2 = [(AFMyriadAdvertisementContext *)self->_base contextData];
  }
  return v2;
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (unint64_t)getGeneration
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_generation;
  }
  else {
    return [(AFMyriadAdvertisementContext *)self->_base generation];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFMyriadAdvertisementContextMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFMyriadAdvertisementContextMutation;
  v6 = [(_AFMyriadAdvertisementContextMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end