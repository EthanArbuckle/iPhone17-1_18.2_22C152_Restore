@interface ONOXPathFunctionResult
- (BOOL)BOOLValue;
- (NSNumber)numberValue;
- (NSString)stringValue;
- (_xmlXPathObject)xmlXPath;
- (double)numericValue;
- (void)dealloc;
- (void)setXmlXPath:(_xmlXPathObject *)a3;
@end

@implementation ONOXPathFunctionResult

- (void)setXmlXPath:(_xmlXPathObject *)a3
{
  self->_xmlXPath = a3;
}

- (_xmlXPathObject)xmlXPath
{
  return self->_xmlXPath;
}

- (NSString)stringValue
{
  v3 = [(ONOXPathFunctionResult *)self xmlXPath];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithCString:encoding:", (void)-[ONOXPathFunctionResult xmlXPath](self, "xmlXPath")[32], 4);
    v3 = (_xmlXPathObject *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSNumber)numberValue
{
  v3 = [(ONOXPathFunctionResult *)self xmlXPath];
  if (v3)
  {
    objc_msgSend(NSNumber, "numberWithDouble:", (double)-[ONOXPathFunctionResult xmlXPath](self, "xmlXPath")[24]);
    v3 = (_xmlXPathObject *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)v3;
}

- (double)numericValue
{
  return (double)[(ONOXPathFunctionResult *)self xmlXPath][24];
}

- (BOOL)BOOLValue
{
  return [(ONOXPathFunctionResult *)self xmlXPath][16] > 0;
}

- (void)dealloc
{
  xmlXPath = self->_xmlXPath;
  if (xmlXPath) {
    xmlXPathFreeObject(xmlXPath);
  }
  v4.receiver = self;
  v4.super_class = (Class)ONOXPathFunctionResult;
  [(ONOXPathFunctionResult *)&v4 dealloc];
}

@end