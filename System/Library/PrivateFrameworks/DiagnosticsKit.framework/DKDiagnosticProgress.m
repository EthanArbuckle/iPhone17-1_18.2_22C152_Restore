@interface DKDiagnosticProgress
+ (BOOL)supportsSecureCoding;
- (BOOL)isIndeterminate;
- (DKDiagnosticProgress)initWithCoder:(id)a3;
- (DKDiagnosticProgress)initWithProgress:(id)a3;
- (NSNumber)estimatedTimeRemaining;
- (NSNumber)fractionCompleted;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DKDiagnosticProgress

- (DKDiagnosticProgress)initWithProgress:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DKDiagnosticProgress;
  v5 = [(DKDiagnosticProgress *)&v12 init];
  if (v5)
  {
    v6 = NSNumber;
    [v4 fractionCompleted];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
    fractionCompleted = v5->_fractionCompleted;
    v5->_fractionCompleted = (NSNumber *)v7;

    uint64_t v9 = [v4 estimatedTimeRemaining];
    estimatedTimeRemaining = v5->_estimatedTimeRemaining;
    v5->_estimatedTimeRemaining = (NSNumber *)v9;

    v5->_isIndeterminate = [v4 isIndeterminate];
    [(DKDiagnosticProgress *)v5 _validateProperties];
  }

  return v5;
}

- (DKDiagnosticProgress)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DKDiagnosticProgress;
  v5 = [(DKDiagnosticProgress *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fractionCompleted"];
    fractionCompleted = v5->_fractionCompleted;
    v5->_fractionCompleted = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"estimatedTimeRemaining"];
    estimatedTimeRemaining = v5->_estimatedTimeRemaining;
    v5->_estimatedTimeRemaining = (NSNumber *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isIndeterminate"];
    v5->_isIndeterminate = [v10 BOOLValue];

    v11 = DiagnosticsKitLogHandleForCategory(4);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v5;
      _os_log_impl(&dword_23D039000, v11, OS_LOG_TYPE_DEFAULT, "Doing decode of DKDiagnosticProgress: %@", buf, 0xCu);
    }

    [(DKDiagnosticProgress *)v5 _validateProperties];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_23D039000, v5, OS_LOG_TYPE_DEFAULT, "Doing encode of DKDiagnosticProgress: %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v6 = [(DKDiagnosticProgress *)self fractionCompleted];
  [v4 encodeObject:v6 forKey:@"fractionCompleted"];

  uint64_t v7 = [(DKDiagnosticProgress *)self estimatedTimeRemaining];
  [v4 encodeObject:v7 forKey:@"estimatedTimeRemaining"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[DKDiagnosticProgress isIndeterminate](self, "isIndeterminate"));
  [v4 encodeObject:v8 forKey:@"isIndeterminate"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(DKDiagnosticProgress *)self fractionCompleted];
  v5 = [(DKDiagnosticProgress *)self estimatedTimeRemaining];
  uint64_t v6 = [v3 stringWithFormat:@"Fraction Completed: %@, Estimated Time Remaining: %@ Indeterminate: %d", v4, v5, -[DKDiagnosticProgress isIndeterminate](self, "isIndeterminate")];

  return v6;
}

- (NSNumber)fractionCompleted
{
  return self->_fractionCompleted;
}

- (NSNumber)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (BOOL)isIndeterminate
{
  return self->_isIndeterminate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimatedTimeRemaining, 0);
  objc_storeStrong((id *)&self->_fractionCompleted, 0);
}

@end