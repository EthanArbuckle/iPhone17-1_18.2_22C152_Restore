@interface MessageBodyDOMQuoteSubparser
- (ECMessageBodyElement_Private)_lastUnindentedAttributionHint;
- (ECMessageBodyElement_Private)_lastUnindentedElement;
- (void)dealloc;
- (void)messageBodyParser:(id)a3 foundMessageBodyElement:(id)a4;
- (void)set_lastUnindentedAttributionHint:(id)a3;
- (void)set_lastUnindentedElement:(id)a3;
@end

@implementation MessageBodyDOMQuoteSubparser

- (void)messageBodyParser:(id)a3 foundMessageBodyElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[JSContext currentContext];
  v9 = +[JSValue valueWithObject:self inContext:v8];
  v12[0] = v6;
  v12[1] = v7;
  v10 = +[NSArray arrayWithObjects:v12 count:2];
  id v11 = [v9 invokeMethod:@"messageBodyParserFoundMessageBodyElement" withArguments:v10];
}

- (void)dealloc
{
  [(ECMessageBodyElement_Private *)self->_lastUnindentedElement releaseExternally];
  [(ECMessageBodyElement_Private *)self->_lastUnindentedAttributionHint releaseExternally];
  v3.receiver = self;
  v3.super_class = (Class)MessageBodyDOMQuoteSubparser;
  [(MessageBodyDOMQuoteSubparser *)&v3 dealloc];
}

- (ECMessageBodyElement_Private)_lastUnindentedElement
{
  return (ECMessageBodyElement_Private *)objc_getProperty(self, a2, 24, 1);
}

- (void)set_lastUnindentedElement:(id)a3
{
}

- (ECMessageBodyElement_Private)_lastUnindentedAttributionHint
{
  return (ECMessageBodyElement_Private *)objc_getProperty(self, a2, 32, 1);
}

- (void)set_lastUnindentedAttributionHint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUnindentedAttributionHint, 0);

  objc_storeStrong((id *)&self->_lastUnindentedElement, 0);
}

@end