@interface IKDOMParser
- (IKDOMParser)init;
- (id)parseFromString:(id)a3 :(id)a4;
@end

@implementation IKDOMParser

- (IKDOMParser)init
{
  v3 = +[IKAppContext currentAppContext];
  v6.receiver = self;
  v6.super_class = (Class)IKDOMParser;
  v4 = [(IKJSObject *)&v6 initWithAppContext:v3];

  return v4;
}

- (id)parseFromString:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 length]
    || [v7 length]
    && ([v7 isEqualToString:@"text/xml"] & 1) == 0
    && ![v7 isEqualToString:@"application/xml"])
  {
    v12 = @"Invalid parameters";
    goto LABEL_9;
  }
  v8 = [IKDOMDocument alloc];
  v9 = [(IKJSObject *)self appContext];
  id v17 = 0;
  v10 = [(IKDOMDocument *)v8 initWithAppContext:v9 xmlStr:v6 error:&v17];
  id v11 = v17;

  if (!v10 || v11)
  {

    v12 = [v11 description];

LABEL_9:
    v13 = [(IKJSObject *)self appContext];
    v14 = [(IKJSObject *)self appContext];
    v15 = +[IKDOMException exceptionWithAppContext:v14 code:12];
    [v13 setException:v15 withErrorMessage:v12];

    v10 = 0;
  }

  return v10;
}

@end