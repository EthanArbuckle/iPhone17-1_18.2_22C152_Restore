@interface SPRemoteInterfaceKeyedArchiverDelegate
- (BOOL)imageIsNamed;
- (id)archiver:(id)a3 willEncodeObject:(id)a4;
- (void)archiver:(id)a3 didEncodeObject:(id)a4;
- (void)setImageIsNamed:(BOOL)a3;
@end

@implementation SPRemoteInterfaceKeyedArchiverDelegate

- (id)archiver:(id)a3 willEncodeObject:(id)a4
{
  id v5 = a4;
  getUIImageClass();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    self->_imageIsNamed = [v6 _isNamed];
    [v6 _setNamed:0];
  }

  return v5;
}

- (void)archiver:(id)a3 didEncodeObject:(id)a4
{
  id v5 = a4;
  getUIImageClass();
  if (objc_opt_isKindOfClass()) {
    [v5 _setNamed:self->_imageIsNamed];
  }
}

- (BOOL)imageIsNamed
{
  return self->_imageIsNamed;
}

- (void)setImageIsNamed:(BOOL)a3
{
  self->_imageIsNamed = a3;
}

@end