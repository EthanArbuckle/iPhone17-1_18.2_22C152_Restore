@interface CTXPCDeviceIdentifierMessage
+ (id)allowedClassesForArguments;
- (CTDeviceIdentifier)deviceID;
- (CTXPCDeviceIdentifierMessage)initWithDeviceID:(id)a3;
@end

@implementation CTXPCDeviceIdentifierMessage

- (CTXPCDeviceIdentifierMessage)initWithDeviceID:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11 = @"deviceID";
    v12[0] = v4;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v9.receiver = self;
    v9.super_class = (Class)CTXPCDeviceIdentifierMessage;
    v7 = [(CTXPCMessage *)&v9 initWithNamedArguments:v6];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CTXPCDeviceIdentifierMessage;
    v7 = [(CTXPCMessage *)&v10 init];
  }

  return v7;
}

- (CTDeviceIdentifier)deviceID
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKeyedSubscript:@"deviceID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CTDeviceIdentifier *)v4;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCDeviceIdentifierMessage;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  id v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

@end