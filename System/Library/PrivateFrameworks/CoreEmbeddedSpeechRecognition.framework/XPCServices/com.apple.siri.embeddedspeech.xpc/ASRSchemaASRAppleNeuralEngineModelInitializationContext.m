@interface ASRSchemaASRAppleNeuralEngineModelInitializationContext
- (NSNumber)timestampInTicks;
- (NSString)fileName;
- (void)setFileName:(id)a3;
- (void)setTimestampInTicks:(id)a3;
@end

@implementation ASRSchemaASRAppleNeuralEngineModelInitializationContext

- (NSString)fileName
{
  return (NSString *)objc_getAssociatedObject(self, &off_10005D750);
}

- (void)setFileName:(id)a3
{
}

- (NSNumber)timestampInTicks
{
  return (NSNumber *)objc_getAssociatedObject(self, &off_10005D748);
}

- (void)setTimestampInTicks:(id)a3
{
}

@end