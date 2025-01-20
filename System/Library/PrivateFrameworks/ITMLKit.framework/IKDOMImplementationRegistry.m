@interface IKDOMImplementationRegistry
- (id)getDOMImplementation:(id)a3;
@end

@implementation IKDOMImplementationRegistry

- (id)getDOMImplementation:(id)a3
{
  v4 = [IKDOMImplementation alloc];
  v5 = [(IKJSObject *)self appContext];
  v6 = [(IKJSObject *)v4 initWithAppContext:v5];

  return v6;
}

@end