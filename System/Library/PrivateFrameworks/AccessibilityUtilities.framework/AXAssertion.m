@interface AXAssertion
+ (BOOL)isSupported;
+ (id)assertionWithType:(id)a3 identifier:(id)a4;
+ (void)ensureAssertionsHaveBeenProcessedWithCompletion:(id)a3;
- (AXAssertion)initWithType:(id)a3 identifier:(id)a4;
- (BOOL)_hasValidAssertionType;
- (NSString)assertionType;
- (NSString)identifier;
- (id)description;
- (void)_notifyServerAssertionWasAcquired;
- (void)_notifyServerAssertionWasRelinquished;
- (void)dealloc;
- (void)setAssertionType:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation AXAssertion

+ (BOOL)isSupported
{
  return +[AXSpringBoardServer isAvailable];
}

+ (id)assertionWithType:(id)a3 identifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithType:v6 identifier:v5];

  return v7;
}

+ (void)ensureAssertionsHaveBeenProcessedWithCompletion:(id)a3
{
  v4 = (void (**)(void))a3;
  if ([a1 isSupported])
  {
    id v5 = +[AXSpringBoardServer server];
    [v5 _ensureAssertionsHaveBeenProcessedWithCompletion:v4];
  }
  else
  {
    id v6 = AXLogAssertions();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[AXAssertion ensureAssertionsHaveBeenProcessedWithCompletion:](v6, v7, v8, v9, v10, v11, v12, v13);
    }

    if (v4) {
      v4[2](v4);
    }
  }
}

- (AXAssertion)initWithType:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXAssertion;
  uint64_t v8 = [(AXAssertion *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    [(AXAssertion *)v8 setAssertionType:v6];
    [(AXAssertion *)v9 setIdentifier:v7];
    [(AXAssertion *)v9 _notifyServerAssertionWasAcquired];
  }

  return v9;
}

- (void)dealloc
{
  [(AXAssertion *)self _notifyServerAssertionWasRelinquished];
  v3.receiver = self;
  v3.super_class = (Class)AXAssertion;
  [(AXAssertion *)&v3 dealloc];
}

- (BOOL)_hasValidAssertionType
{
  if (_hasValidAssertionType_onceToken != -1) {
    dispatch_once(&_hasValidAssertionType_onceToken, &__block_literal_global_12);
  }
  objc_super v3 = [(AXAssertion *)self assertionType];
  if (v3)
  {
    v4 = (void *)_hasValidAssertionType__ValidAssertionTypes;
    id v5 = [(AXAssertion *)self assertionType];
    char v6 = [v4 containsObject:v5];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

void __37__AXAssertion__hasValidAssertionType__block_invoke()
{
  v4[6] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4[0] = @"Disable System Gestures";
  v4[1] = @"Disable Speak This! Gesture";
  v4[2] = @"Disable Notification Center gesture";
  v4[3] = @"Disable Control Center gesture";
  v4[4] = @"Disable Dashboard gestures";
  v4[5] = @"Disable SecurePay AX Features";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
  uint64_t v2 = [v0 initWithArray:v1];
  objc_super v3 = (void *)_hasValidAssertionType__ValidAssertionTypes;
  _hasValidAssertionType__ValidAssertionTypes = v2;
}

- (void)_notifyServerAssertionWasAcquired
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_super v3 = AXLogAssertions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(AXAssertion *)self assertionType];
    id v5 = [(AXAssertion *)self identifier];
    *(_DWORD *)buf = 138412546;
    v17 = v4;
    __int16 v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_18D308000, v3, OS_LOG_TYPE_INFO, "Assertion acquired: %@, %@", buf, 0x16u);
  }
  if ([(AXAssertion *)self _hasValidAssertionType])
  {
    if ([(id)objc_opt_class() isSupported])
    {
      char v6 = +[AXSpringBoardServer server];
      id v7 = [(AXAssertion *)self assertionType];
      uint64_t v8 = [(AXAssertion *)self identifier];
      [v6 acquireAssertionWithType:v7 identifier:v8];
    }
    else
    {
      char v6 = AXLogAssertions();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        +[AXAssertion ensureAssertionsHaveBeenProcessedWithCompletion:](v6, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  else
  {
    char v6 = [(AXAssertion *)self assertionType];
    _AXAssert();
  }
}

- (void)_notifyServerAssertionWasRelinquished
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_super v3 = AXLogAssertions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(AXAssertion *)self assertionType];
    id v5 = [(AXAssertion *)self identifier];
    *(_DWORD *)buf = 138412546;
    v17 = v4;
    __int16 v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_18D308000, v3, OS_LOG_TYPE_INFO, "Assertion released: %@, %@", buf, 0x16u);
  }
  if ([(AXAssertion *)self _hasValidAssertionType])
  {
    if ([(id)objc_opt_class() isSupported])
    {
      char v6 = +[AXSpringBoardServer server];
      id v7 = [(AXAssertion *)self assertionType];
      uint64_t v8 = [(AXAssertion *)self identifier];
      [v6 relinquishAssertionWithType:v7 identifier:v8];
    }
    else
    {
      char v6 = AXLogAssertions();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        +[AXAssertion ensureAssertionsHaveBeenProcessedWithCompletion:](v6, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  else
  {
    char v6 = [(AXAssertion *)self assertionType];
    _AXAssert();
  }
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = [(AXAssertion *)self assertionType];
  id v5 = [(AXAssertion *)self identifier];
  char v6 = [v3 stringWithFormat:@"AXAssertion:<%p> Type:%@ ClientID:%@", self, v4, v5];

  return v6;
}

- (NSString)assertionType
{
  return self->_assertionType;
}

- (void)setAssertionType:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_assertionType, 0);
}

+ (void)ensureAssertionsHaveBeenProcessedWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end