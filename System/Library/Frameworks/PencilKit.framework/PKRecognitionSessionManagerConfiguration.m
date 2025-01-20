@interface PKRecognitionSessionManagerConfiguration
+ (PKRecognitionSessionManagerConfiguration)backgroundIndexingConfiguration;
+ (PKRecognitionSessionManagerConfiguration)interactiveCanvasConfiguration;
- (PKRecognitionSessionManagerConfiguration)init;
@end

@implementation PKRecognitionSessionManagerConfiguration

- (PKRecognitionSessionManagerConfiguration)init
{
  v11.receiver = self;
  v11.super_class = (Class)PKRecognitionSessionManagerConfiguration;
  v2 = [(PKRecognitionSessionManagerConfiguration *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_sessionCaching = 0;
    v4 = [MEMORY[0x1E4F28B50] mainBundle];
    v5 = [v4 bundleIdentifier];
    char v6 = [v5 isEqualToString:@"com.apple.mobilenotes"];

    if ((v6 & 1) != 0
      || ([MEMORY[0x1E4F28B50] mainBundle],
          v7 = objc_claimAutoreleasedReturnValue(),
          [v7 bundleIdentifier],
          v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 hasPrefix:@"com.apple.PaperKit.extension"],
          v8,
          v7,
          v9))
    {
      v3->_sessionCaching = 1;
    }
    v3->_smartSelectionQuery = 1;
  }
  return v3;
}

+ (PKRecognitionSessionManagerConfiguration)interactiveCanvasConfiguration
{
  self;
  v0 = objc_alloc_init(PKRecognitionSessionManagerConfiguration);
  if (v0) {
    v0->_smartSelectionQuery = 1;
  }

  return v0;
}

+ (PKRecognitionSessionManagerConfiguration)backgroundIndexingConfiguration
{
  self;
  v0 = objc_alloc_init(PKRecognitionSessionManagerConfiguration);
  if (v0) {
    v0->_smartSelectionQuery = 0;
  }

  return v0;
}

@end