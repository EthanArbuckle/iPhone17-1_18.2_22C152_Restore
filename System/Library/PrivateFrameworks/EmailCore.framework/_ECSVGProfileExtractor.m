@interface _ECSVGProfileExtractor
- (id)baseProfile;
- (id)initWithSVGData:(id *)a1;
- (id)namespace;
- (id)version;
- (void)_parseIfNeeded;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
@end

@implementation _ECSVGProfileExtractor

- (id)initWithSVGData:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)_ECSVGProfileExtractor;
    a1 = (id *)objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29250]) initWithData:v3];
      id v5 = a1[1];
      a1[1] = (id)v4;

      [a1[1] setShouldResolveExternalEntities:0];
      [a1[1] setDelegate:a1];
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
      id v7 = a1[6];
      a1[6] = (id)v6;
    }
  }

  return a1;
}

- (id)namespace
{
  if (a1)
  {
    v2 = a1;
    [a1 _parseIfNeeded];
    a1 = (id *)v2[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)version
{
  if (a1)
  {
    v2 = a1;
    [a1 _parseIfNeeded];
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)baseProfile
{
  if (a1)
  {
    v2 = a1;
    [a1 _parseIfNeeded];
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_parseIfNeeded
{
  [(NSConditionLock *)self->_parseLock lock];
  if (![(NSConditionLock *)self->_parseLock condition]) {
    [(NSXMLParser *)self->_parser parse];
  }
  parseLock = self->_parseLock;
  [(NSConditionLock *)parseLock unlockWithCondition:1];
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a7;
  if (objc_msgSend(v10, "ef_caseInsensitiveIsEqualToString:", @"svg"))
  {
    v12 = [v11 objectForKeyedSubscript:@"xmlns"];
    v13 = self->_namespace;
    self->_namespace = v12;

    v14 = [v11 objectForKeyedSubscript:@"version"];
    version = self->_version;
    self->_version = v14;

    v16 = [v11 objectForKeyedSubscript:@"baseProfile"];
    baseProfile = self->_baseProfile;
    self->_baseProfile = v16;
  }
  [v18 abortParsing];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parseLock, 0);
  objc_storeStrong((id *)&self->_baseProfile, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_namespace, 0);
  objc_storeStrong((id *)&self->_parser, 0);
}

@end