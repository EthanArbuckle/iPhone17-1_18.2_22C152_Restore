@interface DOCEnumerationProperties
- (DOCEnumerationProperties)initWithConfiguration:(id)a3 tags:(id)a4;
- (DOCEnumerationProperties)initWithHostIdentifier:(id)a3 maximumNumberOfItems:(int64_t)a4 allowedContentTypes:(id)a5 excludedContentTypes:(id)a6 tags:(id)a7;
- (NSArray)allowedContentTypes;
- (NSArray)excludedContentTypes;
- (NSArray)tagIdentifiers;
- (NSNumber)maximumNumberOfItems;
- (NSString)hostIdentifier;
- (void)setAllowedContentTypes:(id)a3;
- (void)setExcludedContentTypes:(id)a3;
- (void)setHostIdentifier:(id)a3;
- (void)setMaximumNumberOfItems:(id)a3;
- (void)setTagIdentifiers:(id)a3;
@end

@implementation DOCEnumerationProperties

- (DOCEnumerationProperties)initWithConfiguration:(id)a3 tags:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 hostIdentifier];
  uint64_t v9 = [v7 maximumNumberOfItemsToFetch];
  v10 = [v7 documentContentTypes];
  v11 = [v7 excludedDocumentContentTypes];

  v12 = [(DOCEnumerationProperties *)self initWithHostIdentifier:v8 maximumNumberOfItems:v9 allowedContentTypes:v10 excludedContentTypes:v11 tags:v6];
  return v12;
}

- (DOCEnumerationProperties)initWithHostIdentifier:(id)a3 maximumNumberOfItems:(int64_t)a4 allowedContentTypes:(id)a5 excludedContentTypes:(id)a6 tags:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)DOCEnumerationProperties;
  v16 = [(DOCEnumerationProperties *)&v21 init];
  v17 = v16;
  if (v16)
  {
    [(DOCEnumerationProperties *)v16 setHostIdentifier:v12];
    v18 = [NSNumber numberWithInteger:a4];
    [(DOCEnumerationProperties *)v17 setMaximumNumberOfItems:v18];

    [(DOCEnumerationProperties *)v17 setAllowedContentTypes:v13];
    [(DOCEnumerationProperties *)v17 setExcludedContentTypes:v14];
    [(DOCEnumerationProperties *)v17 setTagIdentifiers:v15];
    v19 = v17;
  }

  return v17;
}

- (void)setMaximumNumberOfItems:(id)a3
{
}

- (void)setHostIdentifier:(id)a3
{
}

- (void)setAllowedContentTypes:(id)a3
{
}

- (void)setTagIdentifiers:(id)a3
{
}

- (void)setExcludedContentTypes:(id)a3
{
}

- (NSNumber)maximumNumberOfItems
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)hostIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)excludedContentTypes
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)allowedContentTypes
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
  objc_storeStrong((id *)&self->_allowedContentTypes, 0);
  objc_storeStrong((id *)&self->_excludedContentTypes, 0);
  objc_storeStrong((id *)&self->_tagIdentifiers, 0);
  objc_storeStrong((id *)&self->_maximumNumberOfItems, 0);
}

- (NSArray)tagIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

@end