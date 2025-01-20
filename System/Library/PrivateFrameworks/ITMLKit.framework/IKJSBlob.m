@interface IKJSBlob
- (IKJSBlob)initWithData:(id)a3;
- (NSData)data;
@end

@implementation IKJSBlob

- (IKJSBlob)initWithData:(id)a3
{
  id v5 = a3;
  v6 = +[IKAppContext currentAppContext];
  v9.receiver = self;
  v9.super_class = (Class)IKJSBlob;
  v7 = [(IKJSObject *)&v9 initWithAppContext:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_data, a3);
  }

  return v7;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
}

@end