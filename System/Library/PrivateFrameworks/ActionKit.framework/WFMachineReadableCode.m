@interface WFMachineReadableCode
+ (BOOL)supportsSecureCoding;
+ (id)objectWithWFSerializedRepresentation:(id)a3;
- (NSString)errorCorrectionLevel;
- (NSString)stringValue;
- (NSString)type;
- (WFMachineReadableCode)initWithCoder:(id)a3;
- (WFMachineReadableCode)initWithMachineReadableCodeObject:(id)a3;
- (WFMachineReadableCode)initWithType:(id)a3 stringValue:(id)a4 errorCorrectionLevel:(id)a5;
- (id)wfSerializedRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFMachineReadableCode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCorrectionLevel, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (NSString)errorCorrectionLevel
{
  return self->_errorCorrectionLevel;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSString)type
{
  return self->_type;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFMachineReadableCode *)self type];
  [v4 encodeObject:v5 forKey:@"type"];

  v6 = [(WFMachineReadableCode *)self stringValue];
  [v4 encodeObject:v6 forKey:@"stringValue"];

  id v7 = [(WFMachineReadableCode *)self errorCorrectionLevel];
  [v4 encodeObject:v7 forKey:@"errorCorrectionLevel"];
}

- (WFMachineReadableCode)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stringValue"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"errorCorrectionLevel"];

  v8 = [(WFMachineReadableCode *)self initWithType:v5 stringValue:v6 errorCorrectionLevel:v7];
  return v8;
}

- (id)wfSerializedRepresentation
{
  v10[1] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  id v4 = [(WFMachineReadableCode *)self type];
  [v3 setValue:v4 forKey:@"type"];

  v5 = [(WFMachineReadableCode *)self stringValue];
  [v3 setValue:v5 forKey:@"stringValue"];

  v6 = [(WFMachineReadableCode *)self errorCorrectionLevel];
  [v3 setValue:v6 forKey:@"errorCorrectionLevel"];

  v9 = @"link.contentkit.machinereadablecode";
  v10[0] = v3;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

  return v7;
}

- (WFMachineReadableCode)initWithMachineReadableCodeObject:(id)a3
{
  id v4 = a3;
  v5 = [v4 type];
  v6 = [v4 stringValue];

  id v7 = [(WFMachineReadableCode *)self initWithType:v5 stringValue:v6 errorCorrectionLevel:0];
  return v7;
}

- (WFMachineReadableCode)initWithType:(id)a3 stringValue:(id)a4 errorCorrectionLevel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WFMachineReadableCode;
  v11 = [(WFMachineReadableCode *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    type = v11->_type;
    v11->_type = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    stringValue = v11->_stringValue;
    v11->_stringValue = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    errorCorrectionLevel = v11->_errorCorrectionLevel;
    v11->_errorCorrectionLevel = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v3 = a3;
  id v4 = [v3 wfObjectOfClass:objc_opt_class() forKey:@"link.contentkit.machinereadablecode"];

  v5 = [v4 objectForKey:@"type"];
  v6 = [v4 objectForKey:@"stringValue"];
  id v7 = [v4 objectForKey:@"errorCorrectionLevel"];
  if (v5) {
    id v8 = [[WFMachineReadableCode alloc] initWithType:v5 stringValue:v6 errorCorrectionLevel:v7];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

@end