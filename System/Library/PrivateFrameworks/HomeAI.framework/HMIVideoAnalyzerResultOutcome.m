@interface HMIVideoAnalyzerResultOutcome
+ (BOOL)supportsSecureCoding;
+ (HMIVideoAnalyzerResultOutcome)skipped;
+ (HMIVideoAnalyzerResultOutcome)success;
- (BOOL)isSkipped;
- (BOOL)isSuccess;
- (HMIVideoAnalyzerResultOutcome)initWithCode:(unint64_t)a3 analysisFPS:(double)a4 message:(id)a5;
- (HMIVideoAnalyzerResultOutcome)initWithCoder:(id)a3;
- (NSString)message;
- (double)analysisFPS;
- (id)description;
- (unint64_t)code;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMIVideoAnalyzerResultOutcome

- (HMIVideoAnalyzerResultOutcome)initWithCode:(unint64_t)a3 analysisFPS:(double)a4 message:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMIVideoAnalyzerResultOutcome;
  v10 = [(HMIVideoAnalyzerResultOutcome *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_code = a3;
    v10->_analysisFPS = a4;
    objc_storeStrong((id *)&v10->_message, a5);
  }

  return v11;
}

- (BOOL)isSkipped
{
  return [(HMIVideoAnalyzerResultOutcome *)self code] == 0;
}

- (BOOL)isSuccess
{
  return [(HMIVideoAnalyzerResultOutcome *)self code] == 1;
}

+ (HMIVideoAnalyzerResultOutcome)success
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__HMIVideoAnalyzerResultOutcome_success__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (success_onceToken != -1) {
    dispatch_once(&success_onceToken, block);
  }
  v2 = (void *)success_outcome;
  return (HMIVideoAnalyzerResultOutcome *)v2;
}

uint64_t __40__HMIVideoAnalyzerResultOutcome_success__block_invoke(uint64_t a1)
{
  success_outcome = [objc_alloc(*(Class *)(a1 + 32)) initWithCode:1 analysisFPS:0 message:1.0];
  return MEMORY[0x270F9A758]();
}

+ (HMIVideoAnalyzerResultOutcome)skipped
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__HMIVideoAnalyzerResultOutcome_skipped__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (skipped_onceToken != -1) {
    dispatch_once(&skipped_onceToken, block);
  }
  v2 = (void *)skipped_outcome;
  return (HMIVideoAnalyzerResultOutcome *)v2;
}

uint64_t __40__HMIVideoAnalyzerResultOutcome_skipped__block_invoke(uint64_t a1)
{
  skipped_outcome = [objc_alloc(*(Class *)(a1 + 32)) initWithCode:0 analysisFPS:@"Unknown reason." message:0.0];
  return MEMORY[0x270F9A758]();
}

- (id)description
{
  unint64_t v3 = [(HMIVideoAnalyzerResultOutcome *)self code];
  v4 = @"Unknown";
  if (!v3) {
    v4 = @"Skipped";
  }
  if (v3 == 1) {
    v5 = @"Success";
  }
  else {
    v5 = v4;
  }
  v6 = [(HMIVideoAnalyzerResultOutcome *)self message];

  v7 = NSString;
  [(HMIVideoAnalyzerResultOutcome *)self analysisFPS];
  uint64_t v9 = v8;
  if (v6)
  {
    v10 = [(HMIVideoAnalyzerResultOutcome *)self message];
    v11 = [v7 stringWithFormat:@"{code: %@, analysisFPS: %f, message: \"%@\"}", v5, v9, v10];
  }
  else
  {
    v11 = [v7 stringWithFormat:@"{code: %@, analysisFPS: %f}", v5, v8];
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIVideoAnalyzerResultOutcome)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_code);
  uint64_t v6 = [v4 decodeIntegerForKey:v5];

  v7 = NSStringFromSelector(sel_analysisFPS);
  [v4 decodeDoubleForKey:v7];
  double v9 = v8;

  uint64_t v10 = objc_opt_class();
  v11 = NSStringFromSelector(sel_message);
  v12 = [v4 decodeObjectOfClass:v10 forKey:v11];

  objc_super v13 = [(HMIVideoAnalyzerResultOutcome *)self initWithCode:v6 analysisFPS:v12 message:v9];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HMIVideoAnalyzerResultOutcome *)self code];
  uint64_t v6 = NSStringFromSelector(sel_code);
  [v4 encodeInteger:v5 forKey:v6];

  [(HMIVideoAnalyzerResultOutcome *)self analysisFPS];
  double v8 = v7;
  double v9 = NSStringFromSelector(sel_analysisFPS);
  [v4 encodeDouble:v9 forKey:v8];

  id v11 = [(HMIVideoAnalyzerResultOutcome *)self message];
  uint64_t v10 = NSStringFromSelector(sel_message);
  [v4 encodeObject:v11 forKey:v10];
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (double)analysisFPS
{
  return self->_analysisFPS;
}

- (unint64_t)code
{
  return self->_code;
}

- (void).cxx_destruct
{
}

@end