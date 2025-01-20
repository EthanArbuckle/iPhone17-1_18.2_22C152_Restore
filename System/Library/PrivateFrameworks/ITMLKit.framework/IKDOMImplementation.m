@interface IKDOMImplementation
- (id)createDocument:(id)a3 :(id)a4;
- (id)createLSInput;
- (id)createLSParser:(int64_t)a3 :(id)a4;
- (id)createLSSerializer;
- (int64_t)asynchronousMode;
- (int64_t)synchronousMode;
@end

@implementation IKDOMImplementation

- (id)createDocument:(id)a3 :(id)a4
{
  id v5 = a4;
  v6 = [IKDOMDocument alloc];
  v7 = [(IKJSObject *)self appContext];
  v8 = [(IKDOMDocument *)v6 initWithAppContext:v7 qualifiedName:v5];

  return v8;
}

- (id)createLSSerializer
{
  v3 = [IKDOMLSSerializer alloc];
  v4 = [(IKJSObject *)self appContext];
  id v5 = [(IKJSObject *)v3 initWithAppContext:v4];

  return v5;
}

- (id)createLSParser:(int64_t)a3 :(id)a4
{
  id v5 = [IKDOMLSParser alloc];
  v6 = [(IKJSObject *)self appContext];
  v7 = [(IKJSObject *)v5 initWithAppContext:v6];

  return v7;
}

- (id)createLSInput
{
  v3 = [IKDOMLSInput alloc];
  v4 = [(IKJSObject *)self appContext];
  id v5 = [(IKJSObject *)v3 initWithAppContext:v4];

  return v5;
}

- (int64_t)synchronousMode
{
  return 1;
}

- (int64_t)asynchronousMode
{
  return 2;
}

@end