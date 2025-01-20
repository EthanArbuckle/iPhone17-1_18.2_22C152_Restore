@interface CNContactDiffOptions
- (BOOL)ignoreUnavailableKeys;
- (CNContactDiffOptions)init;
- (NSArray)ignoredKeys;
- (void)setIgnoreUnavailableKeys:(BOOL)a3;
- (void)setIgnoredKeys:(id)a3;
@end

@implementation CNContactDiffOptions

- (CNContactDiffOptions)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNContactDiffOptions;
  v2 = [(CNContactDiffOptions *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_ignoreUnavailableKeys = 0;
    ignoredKeys = v2->_ignoredKeys;
    v2->_ignoredKeys = (NSArray *)MEMORY[0x1E4F1CBF0];

    v5 = v3;
  }

  return v3;
}

- (BOOL)ignoreUnavailableKeys
{
  return self->_ignoreUnavailableKeys;
}

- (void)setIgnoreUnavailableKeys:(BOOL)a3
{
  self->_ignoreUnavailableKeys = a3;
}

- (NSArray)ignoredKeys
{
  return self->_ignoredKeys;
}

- (void)setIgnoredKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end