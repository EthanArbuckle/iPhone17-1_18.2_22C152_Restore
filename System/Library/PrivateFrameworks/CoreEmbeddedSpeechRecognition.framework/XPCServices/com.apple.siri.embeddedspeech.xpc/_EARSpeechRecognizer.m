@interface _EARSpeechRecognizer
- (NSString)modelRoot;
- (NSString)modelType;
- (void)setModelRoot:(id)a3;
- (void)setModelType:(id)a3;
@end

@implementation _EARSpeechRecognizer

- (NSString)modelRoot
{
  return (NSString *)objc_getAssociatedObject(self, &unk_10003B708);
}

- (void)setModelRoot:(id)a3
{
}

- (NSString)modelType
{
  return (NSString *)objc_getAssociatedObject(self, &unk_10003B700);
}

- (void)setModelType:(id)a3
{
}

@end