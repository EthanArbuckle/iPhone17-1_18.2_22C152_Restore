@interface MIOParserContext
- (MIOParserContext)initWithModelSpecificationFileURL:(id)a3;
- (NSURL)modelSpecificationFileURL;
@end

@implementation MIOParserContext

- (MIOParserContext)initWithModelSpecificationFileURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MIOParserContext;
  v5 = [(MIOParserContext *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    modelSpecificationFileURL = v5->_modelSpecificationFileURL;
    v5->_modelSpecificationFileURL = (NSURL *)v6;
  }
  return v5;
}

- (NSURL)modelSpecificationFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end