@interface AUExtensionInstanceProxy
- (void)auInstance;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAuInstance:(void *)a3;
@end

@implementation AUExtensionInstanceProxy

- (void)setAuInstance:(void *)a3
{
  self->_auInstance = a3;
}

- (void)auInstance
{
  return self->_auInstance;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
}

@end