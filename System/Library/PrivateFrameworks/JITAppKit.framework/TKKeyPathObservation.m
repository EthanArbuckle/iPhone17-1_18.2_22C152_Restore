@interface TKKeyPathObservation
- (NSObject)object;
- (NSString)keyPath;
- (void)setKeyPath:(id)a3;
- (void)setObject:(id)a3;
@end

@implementation TKKeyPathObservation

- (NSObject)object
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);
  return WeakRetained;
}

- (void)setObject:(id)a3
{
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)setKeyPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end