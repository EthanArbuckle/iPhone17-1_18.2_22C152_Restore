@interface FPQueryEnumerationSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)allowSemanticSearchResults;
- (FPQueryEnumerationSettings)init;
- (NSArray)allowedFileTypes;
- (NSArray)allowedProviders;
- (NSArray)excludedFileTypes;
- (NSArray)excludedParentOIDs;
- (NSNumber)desiredNumberOfItems;
- (NSString)tagIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAllowSemanticSearchResults:(BOOL)a3;
- (void)setAllowedFileTypes:(id)a3;
- (void)setAllowedProviders:(id)a3;
- (void)setDesiredNumberOfItems:(id)a3;
- (void)setExcludedFileTypes:(id)a3;
- (void)setExcludedParentOIDs:(id)a3;
- (void)setTagIdentifier:(id)a3;
@end

@implementation FPQueryEnumerationSettings

- (NSArray)allowedFileTypes
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)allowedProviders
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)excludedFileTypes
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)excludedParentOIDs
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (NSNumber)desiredNumberOfItems
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)FPQueryEnumerationSettings;
  v4 = [(FPEnumerationSettings *)&v18 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_allowedProviders copy];
  v6 = (void *)v4[4];
  v4[4] = v5;

  uint64_t v7 = [(NSNumber *)self->_desiredNumberOfItems copy];
  v8 = (void *)v4[5];
  v4[5] = v7;

  uint64_t v9 = [(NSArray *)self->_excludedFileTypes copy];
  v10 = (void *)v4[6];
  v4[6] = v9;

  uint64_t v11 = [(NSArray *)self->_allowedFileTypes copy];
  v12 = (void *)v4[7];
  v4[7] = v11;

  uint64_t v13 = [(NSString *)self->_tagIdentifier copy];
  v14 = (void *)v4[8];
  v4[8] = v13;

  uint64_t v15 = [(NSArray *)self->_excludedParentOIDs copy];
  v16 = (void *)v4[9];
  v4[9] = v15;

  *((unsigned char *)v4 + 24) = self->_allowSemanticSearchResults;
  return v4;
}

- (FPQueryEnumerationSettings)init
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)FPQueryEnumerationSettings;
  v2 = [(FPEnumerationSettings *)&v7 init];
  if (v2)
  {
    v3 = [(id)*MEMORY[0x1E4F44408] identifier];
    v8[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    allowedFileTypes = v2->_allowedFileTypes;
    v2->_allowedFileTypes = (NSArray *)v4;
  }
  return v2;
}

- (void)setDesiredNumberOfItems:(id)a3
{
}

- (void)setExcludedParentOIDs:(id)a3
{
}

- (void)setExcludedFileTypes:(id)a3
{
}

- (void)setAllowedFileTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedParentOIDs, 0);
  objc_storeStrong((id *)&self->_tagIdentifier, 0);
  objc_storeStrong((id *)&self->_allowedFileTypes, 0);
  objc_storeStrong((id *)&self->_excludedFileTypes, 0);
  objc_storeStrong((id *)&self->_desiredNumberOfItems, 0);

  objc_storeStrong((id *)&self->_allowedProviders, 0);
}

- (BOOL)allowSemanticSearchResults
{
  return self->_allowSemanticSearchResults;
}

+ (BOOL)supportsSecureCoding
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"FPEnumerationSettings.m" lineNumber:180 description:@"UNREACHABLE: this shouldn't need to go over XPC"];

  return 0;
}

- (void)setAllowedProviders:(id)a3
{
}

- (NSString)tagIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTagIdentifier:(id)a3
{
}

- (void)setAllowSemanticSearchResults:(BOOL)a3
{
  self->_allowSemanticSearchResults = a3;
}

@end