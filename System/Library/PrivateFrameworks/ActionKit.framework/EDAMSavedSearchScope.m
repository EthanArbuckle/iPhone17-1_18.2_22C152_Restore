@interface EDAMSavedSearchScope
+ (id)structFields;
+ (id)structName;
- (NSNumber)includeAccount;
- (NSNumber)includeBusinessLinkedNotebooks;
- (NSNumber)includePersonalLinkedNotebooks;
- (void)setIncludeAccount:(id)a3;
- (void)setIncludeBusinessLinkedNotebooks:(id)a3;
- (void)setIncludePersonalLinkedNotebooks:(id)a3;
@end

@implementation EDAMSavedSearchScope

+ (id)structFields
{
  v9[3] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1948;
  if (!structFields_structFields_1948)
  {
    v3 = +[FATField fieldWithIndex:1 type:2 optional:1 name:@"includeAccount"];
    v4 = +[FATField fieldWithIndex:2, 2, 1, @"includePersonalLinkedNotebooks", v3 type optional name];
    v9[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:2 optional:1 name:@"includeBusinessLinkedNotebooks"];
    v9[2] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
    v7 = (void *)structFields_structFields_1948;
    structFields_structFields_1948 = v6;

    v2 = (void *)structFields_structFields_1948;
  }
  return v2;
}

+ (id)structName
{
  return @"SavedSearchScope";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_includeBusinessLinkedNotebooks, 0);
  objc_storeStrong((id *)&self->_includePersonalLinkedNotebooks, 0);
  objc_storeStrong((id *)&self->_includeAccount, 0);
}

- (void)setIncludeBusinessLinkedNotebooks:(id)a3
{
}

- (NSNumber)includeBusinessLinkedNotebooks
{
  return self->_includeBusinessLinkedNotebooks;
}

- (void)setIncludePersonalLinkedNotebooks:(id)a3
{
}

- (NSNumber)includePersonalLinkedNotebooks
{
  return self->_includePersonalLinkedNotebooks;
}

- (void)setIncludeAccount:(id)a3
{
}

- (NSNumber)includeAccount
{
  return self->_includeAccount;
}

@end