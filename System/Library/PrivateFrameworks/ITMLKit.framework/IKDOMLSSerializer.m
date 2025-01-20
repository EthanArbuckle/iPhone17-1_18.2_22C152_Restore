@interface IKDOMLSSerializer
- (id)writeToString:(id)a3;
@end

@implementation IKDOMLSSerializer

- (id)writeToString:(id)a3
{
  id v11 = 0;
  v4 = [a3 toStringWithError:&v11];
  id v5 = v11;
  if (v5)
  {
    v6 = [(IKJSObject *)self appContext];
    v7 = [(IKJSObject *)self appContext];
    v8 = +[IKDOMLSException exceptionWithAppContext:v7 code:82];
    v9 = [v5 description];
    [v6 setException:v8 withErrorMessage:v9];
  }
  return v4;
}

@end