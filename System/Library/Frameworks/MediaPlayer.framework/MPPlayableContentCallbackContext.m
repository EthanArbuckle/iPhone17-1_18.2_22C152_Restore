@interface MPPlayableContentCallbackContext
- (BOOL)serviced;
- (MPPlayableContentCallbackContext)initWithIndexPath:(id)a3;
- (NSIndexPath)indexPath;
- (void)setServiced:(BOOL)a3;
@end

@implementation MPPlayableContentCallbackContext

- (void).cxx_destruct
{
}

- (void)setServiced:(BOOL)a3
{
  self->_serviced = a3;
}

- (BOOL)serviced
{
  return self->_serviced;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (MPPlayableContentCallbackContext)initWithIndexPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPPlayableContentCallbackContext;
  v6 = [(MPPlayableContentCallbackContext *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_indexPath, a3);
    v7->_serviced = 0;
  }

  return v7;
}

@end