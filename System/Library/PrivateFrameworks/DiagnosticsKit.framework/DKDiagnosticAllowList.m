@interface DKDiagnosticAllowList
- (BOOL)containsIdentifier:(id)a3;
- (DKDiagnosticAllowList)initWithIdentifiers:(id)a3 contactMessage:(id)a4;
- (NSArray)allowList;
- (NSString)contactMessage;
- (void)setAllowList:(id)a3;
@end

@implementation DKDiagnosticAllowList

- (DKDiagnosticAllowList)initWithIdentifiers:(id)a3 contactMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DKDiagnosticAllowList;
  v8 = [(DKDiagnosticAllowList *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    contactMessage = v8->_contactMessage;
    v8->_contactMessage = (NSString *)v9;

    uint64_t v11 = [v6 copy];
    allowList = v8->_allowList;
    v8->_allowList = (NSArray *)v11;
  }
  return v8;
}

- (BOOL)containsIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(DKDiagnosticAllowList *)self allowList];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (NSString)contactMessage
{
  return self->_contactMessage;
}

- (NSArray)allowList
{
  return self->_allowList;
}

- (void)setAllowList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowList, 0);
  objc_storeStrong((id *)&self->_contactMessage, 0);
}

@end