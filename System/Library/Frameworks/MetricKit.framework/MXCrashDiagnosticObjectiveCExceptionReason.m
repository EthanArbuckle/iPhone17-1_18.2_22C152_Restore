@interface MXCrashDiagnosticObjectiveCExceptionReason
+ (BOOL)supportsSecureCoding;
- (MXCrashDiagnosticObjectiveCExceptionReason)initWithCoder:(id)a3;
- (MXCrashDiagnosticObjectiveCExceptionReason)initWithComposedMessage:(id)a3 formatString:(id)a4 arguments:(id)a5 type:(id)a6 className:(id)a7 exceptionName:(id)a8;
- (NSArray)arguments;
- (NSData)JSONRepresentation;
- (NSString)className;
- (NSString)composedMessage;
- (NSString)exceptionName;
- (NSString)exceptionType;
- (NSString)formatString;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
- (void)setArguments:(id)a3;
- (void)setClassName:(id)a3;
- (void)setComposedMessage:(id)a3;
- (void)setExceptionName:(id)a3;
- (void)setExceptionType:(id)a3;
- (void)setFormatString:(id)a3;
@end

@implementation MXCrashDiagnosticObjectiveCExceptionReason

- (MXCrashDiagnosticObjectiveCExceptionReason)initWithComposedMessage:(id)a3 formatString:(id)a4 arguments:(id)a5 type:(id)a6 className:(id)a7 exceptionName:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)MXCrashDiagnosticObjectiveCExceptionReason;
  v18 = [(MXCrashDiagnosticObjectiveCExceptionReason *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_composedMessage, a3);
    objc_storeStrong((id *)&v19->_formatString, a4);
    objc_storeStrong((id *)&v19->_arguments, a5);
    objc_storeStrong((id *)&v19->_exceptionType, a6);
    objc_storeStrong((id *)&v19->_className, a7);
    objc_storeStrong((id *)&v19->_exceptionName, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  composedMessage = self->_composedMessage;
  id v5 = a3;
  [v5 encodeObject:composedMessage forKey:@"composedMessage"];
  [v5 encodeObject:self->_formatString forKey:@"formatString"];
  [v5 encodeObject:self->_arguments forKey:@"arguments"];
  [v5 encodeObject:self->_exceptionType forKey:@"exceptionType"];
  [v5 encodeObject:self->_className forKey:@"className"];
  [v5 encodeObject:self->_exceptionName forKey:@"exceptionName"];
}

- (MXCrashDiagnosticObjectiveCExceptionReason)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MXCrashDiagnosticObjectiveCExceptionReason;
  id v5 = [(MXCrashDiagnosticObjectiveCExceptionReason *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"composedMessage"];
    composedMessage = v5->_composedMessage;
    v5->_composedMessage = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"formatString"];
    formatString = v5->_formatString;
    v5->_formatString = (NSString *)v8;

    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"arguments"];
    arguments = v5->_arguments;
    v5->_arguments = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"exceptionType"];
    exceptionType = v5->_exceptionType;
    v5->_exceptionType = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"className"];
    className = v5->_className;
    v5->_className = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"exceptionName"];
    exceptionName = v5->_exceptionName;
    v5->_exceptionName = (NSString *)v19;
  }
  return v5;
}

- (id)toDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = v3;
  composedMessage = self->_composedMessage;
  if (composedMessage) {
    [v3 setObject:composedMessage forKey:@"composedMessage"];
  }
  formatString = self->_formatString;
  if (formatString) {
    [v4 setObject:formatString forKey:@"formatString"];
  }
  arguments = self->_arguments;
  if (arguments) {
    [v4 setObject:arguments forKey:@"arguments"];
  }
  exceptionType = self->_exceptionType;
  if (exceptionType) {
    [v4 setObject:exceptionType forKey:@"exceptionType"];
  }
  className = self->_className;
  if (className) {
    [v4 setObject:className forKey:@"className"];
  }
  exceptionName = self->_exceptionName;
  if (exceptionName) {
    [v4 setObject:exceptionName forKey:@"exceptionName"];
  }

  return v4;
}

- (NSData)JSONRepresentation
{
  v2 = [(MXCrashDiagnosticObjectiveCExceptionReason *)self toDictionary];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    id v5 = 0;
    id v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:1 error:&v5];
  }
  else
  {
    id v3 = 0;
  }

  return (NSData *)v3;
}

- (NSString)composedMessage
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setComposedMessage:(id)a3
{
}

- (NSString)formatString
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFormatString:(id)a3
{
}

- (NSArray)arguments
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setArguments:(id)a3
{
}

- (NSString)exceptionType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExceptionType:(id)a3
{
}

- (NSString)className
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setClassName:(id)a3
{
}

- (NSString)exceptionName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExceptionName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exceptionName, 0);
  objc_storeStrong((id *)&self->_className, 0);
  objc_storeStrong((id *)&self->_exceptionType, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_formatString, 0);

  objc_storeStrong((id *)&self->_composedMessage, 0);
}

@end