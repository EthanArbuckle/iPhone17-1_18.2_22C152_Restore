@interface MDMClientConcreteDataProvider
- (id)mdmDictionary;
@end

@implementation MDMClientConcreteDataProvider

- (id)mdmDictionary
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  v3 = MDMFilePath();
  v4 = [v2 DMCDictionaryFromFile:v3];

  return v4;
}

@end