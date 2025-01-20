@interface IMXMLReparserContext
- (IMXMLReparserContext)initWithContent:(id)a3 attributesToPreserve:(id)a4 attributesToMerge:(id)a5;
- (NSArray)attributesToPreserve;
- (NSDictionary)attributesToMerge;
- (NSError)error;
- (NSString)_inContent;
- (NSString)outContent;
- (void)_setOutContent:(id)a3 error:(id)a4;
- (void)dealloc;
@end

@implementation IMXMLReparserContext

- (IMXMLReparserContext)initWithContent:(id)a3 attributesToPreserve:(id)a4 attributesToMerge:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)IMXMLReparserContext;
  v8 = [(IMXMLReparserContext *)&v10 init];
  if (v8)
  {
    v8->_inContent = (NSString *)a3;
    v8->_attributesToPreserve = (NSArray *)a4;
    v8->_attributesToMerge = (NSDictionary *)a5;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMXMLReparserContext;
  [(IMXMLReparserContext *)&v3 dealloc];
}

- (void)_setOutContent:(id)a3 error:(id)a4
{
  outContent = self->_outContent;
  if (outContent != a3)
  {

    self->_outContent = (NSString *)a3;
  }
  error = self->_error;
  if (error != a4)
  {

    self->_error = (NSError *)a4;
  }
}

- (NSString)_inContent
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributesToPreserve
{
  return self->_attributesToPreserve;
}

- (NSDictionary)attributesToMerge
{
  return self->_attributesToMerge;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)outContent
{
  return self->_outContent;
}

@end