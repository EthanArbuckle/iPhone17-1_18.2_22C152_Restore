@interface NSDocumentSerializer
- (unint64_t)serializePListValueIn:(id)a3 key:(id)a4 value:(id)a5;
@end

@implementation NSDocumentSerializer

- (unint64_t)serializePListValueIn:(id)a3 key:(id)a4 value:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([a4 isEqual:@"."])
  {
    uint64_t v9 = [a5 serializeToData];
    return [(NSAKSerializer *)self serializeObject:v9];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)NSDocumentSerializer;
    return [(NSAKSerializer *)&v11 serializePListValueIn:a3 key:a4 value:a5];
  }
}

@end