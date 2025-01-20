@interface _AUParameterTreeObserver
- (id)callback;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCallback:(id)a3;
@end

@implementation _AUParameterTreeObserver

- (void).cxx_destruct
{
}

- (void)setCallback:(id)a3
{
}

- (id)callback
{
  return self->_callback;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_AUParameterTreeObserver;
  [(_AUParameterTreeObserver *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
}

@end