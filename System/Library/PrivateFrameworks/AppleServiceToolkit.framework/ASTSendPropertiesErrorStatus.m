@interface ASTSendPropertiesErrorStatus
- (id)reasonForCode:(id)a3;
@end

@implementation ASTSendPropertiesErrorStatus

- (id)reasonForCode:(id)a3
{
  v9[3] = *MEMORY[0x263EF8340];
  v8[0] = &unk_26F0B5898;
  v8[1] = &unk_26F0B58B0;
  v9[0] = @"One or more of the properties requested were not valid. Other properties requested were processed.";
  v9[1] = @"One or more of the properties requested were not valid. Other properties requested were NOT processed.";
  v8[2] = &unk_26F0B58C8;
  v9[2] = @"The client does not support the send properties query.";
  v3 = NSDictionary;
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v9 forKeys:v8 count:3];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

@end