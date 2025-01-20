@interface KSXMLElementContentsProxy
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)ks_prepareWithTarget:(id)a3 XMLWriter:(id)a4;
@end

@implementation KSXMLElementContentsProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_XMLWriter, 0);
  objc_storeStrong(&self->_target, 0);
}

- (void)forwardInvocation:(id)a3
{
  v10 = self->_XMLWriter;
  unint64_t elementsCount = self->_elementsCount;
  [a3 invokeWithTarget:self->_target];
  id target = self->_target;
  self->_id target = 0;

  if ([(KSXMLWriter *)v10 openElementsCount] != elementsCount)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"KSXMLWriter.m" lineNumber:685 description:@"Writing element contents did not end the same number of sub-elements as it started"];
  }
  [(KSXMLWriter *)v10 endElement];
  XMLWriter = self->_XMLWriter;
  self->_XMLWriter = 0;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[self->_target methodSignatureForSelector:a3];
}

- (void)ks_prepareWithTarget:(id)a3 XMLWriter:(id)a4
{
  id v7 = a3;
  v8 = (KSXMLWriter *)a4;
  if (!v8)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"KSXMLWriter.m", 663, @"Invalid parameter not satisfying: %@", @"writer" object file lineNumber description];
  }
  id target = self->_target;
  self->_id target = v7;
  id v10 = v7;

  XMLWriter = self->_XMLWriter;
  self->_XMLWriter = v8;
  v12 = v8;

  unint64_t v13 = [(KSXMLWriter *)v12 openElementsCount];
  self->_unint64_t elementsCount = v13;
}

@end