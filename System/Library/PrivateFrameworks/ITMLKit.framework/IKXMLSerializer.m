@interface IKXMLSerializer
- (IKXMLSerializer)init;
- (id)serializeToString:(id)a3;
@end

@implementation IKXMLSerializer

- (IKXMLSerializer)init
{
  v3 = +[IKAppContext currentAppContext];
  v6.receiver = self;
  v6.super_class = (Class)IKXMLSerializer;
  v4 = [(IKJSObject *)&v6 initWithAppContext:v3];

  return v4;
}

- (id)serializeToString:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v9 = @"Invalid parameters";
    goto LABEL_6;
  }
  id v14 = 0;
  objc_super v6 = [v4 toStringWithError:&v14];
  id v7 = v14;
  v8 = v7;
  if (!v6 || v7)
  {

    v9 = [v8 description];

LABEL_6:
    v10 = [(IKJSObject *)self appContext];
    v11 = [(IKJSObject *)self appContext];
    v12 = +[IKDOMException exceptionWithAppContext:v11 code:11];
    [v10 setException:v12 withErrorMessage:v9];

    objc_super v6 = 0;
  }

  return v6;
}

@end