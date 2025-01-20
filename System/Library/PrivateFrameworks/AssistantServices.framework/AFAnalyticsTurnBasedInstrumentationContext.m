@interface AFAnalyticsTurnBasedInstrumentationContext
+ (BOOL)supportsSecureCoding;
+ (id)newTurnBasedContextWithPreviousTurnID:(id)a3;
+ (id)newTurnBasedContextWithPreviousTurnID:(id)a3 analytics:(id)a4;
- (AFAnalyticsTurnBasedInstrumentationContext)init;
- (AFAnalyticsTurnBasedInstrumentationContext)initWithCoder:(id)a3;
- (AFAnalyticsTurnBasedInstrumentationContext)initWithTurnIdentifier:(id)a3;
- (NSUUID)turnIdentifier;
- (id)nextTurnBasedContext;
- (id)nextTurnBasedContextForAnalytics:(id)a3;
- (void)emitInstrumentation:(id)a3;
- (void)emitInstrumentation:(id)a3 machAbsoluteTime:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFAnalyticsTurnBasedInstrumentationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnContext, 0);
  objc_storeStrong((id *)&self->_turnIdentifier, 0);
}

- (AFAnalyticsTurnBasedInstrumentationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"turnIdentifier"];

  v6 = [(AFAnalyticsTurnBasedInstrumentationContext *)self initWithTurnIdentifier:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)nextTurnBasedContextForAnalytics:(id)a3
{
  id v3 = +[AFAnalyticsTurnBasedInstrumentationContext newTurnBasedContextWithPreviousTurnID:self->_turnIdentifier analytics:a3];
  return v3;
}

- (id)nextTurnBasedContext
{
  id v2 = +[AFAnalyticsTurnBasedInstrumentationContext newTurnBasedContextWithPreviousTurnID:self->_turnIdentifier];
  return v2;
}

- (void)emitInstrumentation:(id)a3
{
  id v4 = a3;
  id v5 = +[AFAnalytics sharedAnalytics];
  [v5 logInstrumentation:v4 turnContext:self->_turnContext];
}

- (void)emitInstrumentation:(id)a3 machAbsoluteTime:(unint64_t)a4
{
  id v6 = a3;
  id v7 = +[AFAnalytics sharedAnalytics];
  [v7 logInstrumentation:v6 machAbsoluteTime:a4 turnContext:self->_turnContext];
}

- (NSUUID)turnIdentifier
{
  return self->_turnIdentifier;
}

- (AFAnalyticsTurnBasedInstrumentationContext)initWithTurnIdentifier:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AFAnalyticsTurnBasedInstrumentationContext;
  id v6 = [(AFAnalyticsTurnBasedInstrumentationContext *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_turnIdentifier, a3);
    v8 = objc_alloc_init(SISchemaClientTurnContext);
    turnContext = v7->_turnContext;
    v7->_turnContext = v8;

    v10 = v7->_turnContext;
    v11 = AFTurnIdentifierGetBytes(v7->_turnIdentifier);
    [(SISchemaClientTurnContext *)v10 setTurnID:v11];
  }
  return v7;
}

- (AFAnalyticsTurnBasedInstrumentationContext)init
{
  id v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [(AFAnalyticsTurnBasedInstrumentationContext *)self initWithTurnIdentifier:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newTurnBasedContextWithPreviousTurnID:(id)a3 analytics:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v6 = +[AFAnalytics sharedAnalytics];
  }
  id v7 = objc_alloc_init(AFAnalyticsTurnBasedInstrumentationContext);
  id v8 = objc_alloc_init(MEMORY[0x1E4FA12A0]);
  if (v5)
  {
    v9 = AFTurnIdentifierGetBytes(v5);
  }
  else
  {
    v9 = 0;
  }
  [v8 setPreviousTurnID:v9];
  [(AFAnalyticsTurnBasedInstrumentationContext *)v7 emitInstrumentation:v8];
  uint64_t v10 = objc_opt_class();
  v11 = [(AFAnalyticsTurnBasedInstrumentationContext *)v7 turnIdentifier];
  [v6 logInstrumentationOfType:v10 turnIdentifier:v11];

  return v7;
}

+ (id)newTurnBasedContextWithPreviousTurnID:(id)a3
{
  id v3 = a3;
  id v4 = +[AFAnalytics sharedAnalytics];
  id v5 = +[AFAnalyticsTurnBasedInstrumentationContext newTurnBasedContextWithPreviousTurnID:v3 analytics:v4];

  return v5;
}

@end