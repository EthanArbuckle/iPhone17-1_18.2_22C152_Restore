@interface EMFocus
- (BOOL)isEqual:(id)a3;
- (BOOL)isFocusedIdentifier:(id)a3;
- (EMFocus)initWithFocusedAccountIdentifiers:(id)a3;
- (NSSet)focusedAccountIdentifiers;
- (NSString)ef_publicDescription;
@end

@implementation EMFocus

- (EMFocus)initWithFocusedAccountIdentifiers:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMFocus;
  v6 = [(EMFocus *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_focusedAccountIdentifiers, a3);
  }

  return v7;
}

- (BOOL)isFocusedIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(EMFocus *)self focusedAccountIdentifiers];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 focusedAccountIdentifiers];
    char v6 = [(EMFocus *)self focusedAccountIdentifiers];
    char v7 = [v5 isEqualToSet:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)ef_publicDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(EMFocus *)self focusedAccountIdentifiers];
  char v6 = [v3 stringWithFormat:@"<%@: %p>\n\tFocusedAccountIdentifiers: %@", v4, self, v5];

  return (NSString *)v6;
}

- (NSSet)focusedAccountIdentifiers
{
  return self->_focusedAccountIdentifiers;
}

- (void).cxx_destruct
{
}

@end