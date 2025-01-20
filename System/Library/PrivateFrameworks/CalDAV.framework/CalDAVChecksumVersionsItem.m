@interface CalDAVChecksumVersionsItem
- (BOOL)supportsVersion:(id)a3;
- (CalDAVChecksumVersionsItem)init;
- (id)copyParseRules;
- (void)addVersionSupported:(id)a3;
@end

@implementation CalDAVChecksumVersionsItem

- (CalDAVChecksumVersionsItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"checksum-versions"];
}

- (void)addVersionSupported:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  if (!self->_versionStringsSupported)
  {
    v5 = (NSMutableSet *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:1];
    versionStringsSupported = self->_versionStringsSupported;
    self->_versionStringsSupported = v5;

    id v4 = v11;
  }
  v7 = NSString;
  v8 = [v4 nameSpace];
  v9 = [v11 name];
  v10 = [v7 CDVStringWithNameSpace:v8 andName:v9];

  [(NSMutableSet *)self->_versionStringsSupported addObject:v10];
}

- (BOOL)supportsVersion:(id)a3
{
  versionStringsSupported = self->_versionStringsSupported;
  id v4 = NSString;
  id v5 = a3;
  v6 = [v5 nameSpace];
  v7 = [v5 name];

  v8 = [v4 CDVStringWithNameSpace:v6 andName:v7];
  LOBYTE(versionStringsSupported) = [(NSMutableSet *)versionStringsSupported containsObject:v8];

  return (char)versionStringsSupported;
}

- (id)copyParseRules
{
  id v2 = objc_alloc(NSDictionary);
  uint64_t v3 = *MEMORY[0x263F34DA8];
  id v4 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:1 maximumNumber:0x7FFFFFFFLL nameSpace:*MEMORY[0x263F34DA8] elementName:@"checksum-v1" objectClass:objc_opt_class() setterMethod:sel_addVersionSupported_];
  id v5 = [NSString stringWithFormat:@"%@:%@", v3, @"checksum-v1"];
  v6 = objc_msgSend(v2, "initWithObjectsAndKeys:", v4, v5, 0);

  return v6;
}

- (void).cxx_destruct
{
}

@end