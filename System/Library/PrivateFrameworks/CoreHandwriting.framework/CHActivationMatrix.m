@interface CHActivationMatrix
- (BOOL)unlikelyHasLatinContents;
- (CHActivationMatrix)initWithActivations:(id)a3;
- (CVNLPActivationMatrix)activations;
- (void)setActivations:(id)a3;
- (void)setUnlikelyHasLatinContents:(BOOL)a3;
@end

@implementation CHActivationMatrix

- (CHActivationMatrix)initWithActivations:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHActivationMatrix;
  v6 = [(CHActivationMatrix *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activations, a3);
    v7->_unlikelyHasLatinContents = 0;
  }

  return v7;
}

- (CVNLPActivationMatrix)activations
{
  return self->_activations;
}

- (void)setActivations:(id)a3
{
}

- (BOOL)unlikelyHasLatinContents
{
  return self->_unlikelyHasLatinContents;
}

- (void)setUnlikelyHasLatinContents:(BOOL)a3
{
  self->_unlikelyHasLatinContents = a3;
}

- (void).cxx_destruct
{
}

@end