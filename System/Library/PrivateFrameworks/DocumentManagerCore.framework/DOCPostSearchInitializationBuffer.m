@interface DOCPostSearchInitializationBuffer
- (DOCPostSearchInitializationBuffer)init;
@end

@implementation DOCPostSearchInitializationBuffer

- (DOCPostSearchInitializationBuffer)init
{
  v3 = [MEMORY[0x263F08C38] UUID];
  v4 = [v3 UUIDString];
  v7.receiver = self;
  v7.super_class = (Class)DOCPostSearchInitializationBuffer;
  v5 = [(DOCOperationBuffer *)&v7 initWithLabel:v4];

  return v5;
}

@end