@interface _ARDisplayLinkHelper
- (_ARDisplayLinkHelper)initWithDisplayLink:(id)a3;
- (void)callback:(id)a3;
@end

@implementation _ARDisplayLinkHelper

- (_ARDisplayLinkHelper)initWithDisplayLink:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_ARDisplayLinkHelper;
  v5 = [(_ARDisplayLinkHelper *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_displayLink, v4);
  }

  return v6;
}

- (void)callback:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayLink);
  [WeakRetained displayLinkCallback];
}

- (void).cxx_destruct
{
}

@end