@interface SGRawDUEventProcessor
- (id)getSchemaCreatorForEvent:(id)a3;
- (id)getSchemaCreatorForEventString:(id)a3;
@end

@implementation SGRawDUEventProcessor

- (id)getSchemaCreatorForEventString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3
    && (([v3 isEqualToString:*MEMORY[0x1E4F5F978]] & 1) != 0
     || ([v4 isEqualToString:*MEMORY[0x1E4F5F980]] & 1) != 0
     || ([v4 containsString:@"car"] & 1) != 0
     || ([v4 isEqualToString:*MEMORY[0x1E4F5F988]] & 1) != 0
     || ([v4 containsString:@"flight"] & 1) != 0
     || ([v4 isEqualToString:*MEMORY[0x1E4F5F990]] & 1) != 0
     || ([v4 containsString:@"hotel"] & 1) != 0
     || ([v4 isEqualToString:*MEMORY[0x1E4F5F998]] & 1) != 0
     || ([v4 containsString:@"social"] & 1) != 0
     || ([v4 isEqualToString:*MEMORY[0x1E4F5F9A0]] & 1) != 0
     || ([v4 containsString:@"food"] & 1) != 0
     || ([v4 isEqualToString:*MEMORY[0x1E4F5F9A8]] & 1) != 0
     || ([v4 isEqualToString:@"ticket"] & 1) != 0
     || ([v4 isEqualToString:@"movie"] & 1) != 0
     || ([v4 isEqualToString:*MEMORY[0x1E4F5F9B0]] & 1) != 0
     || [&unk_1F2536A70 containsObject:v4]))
  {
    v5 = objc_opt_new();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)getSchemaCreatorForEvent:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F5F8B0]];
  if (v4)
  {
    v5 = [(SGRawDUEventProcessor *)self getSchemaCreatorForEventString:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end