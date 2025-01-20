@interface INIntentExecutionResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INIntent)intent;
- (INIntentExecutionResult)initWithCoder:(id)a3;
- (INIntentExecutionResult)initWithIntent:(id)a3 response:(id)a4;
- (INIntentResponse)intentResponse;
- (id)_dictionaryRepresentation;
- (id)description;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INIntentExecutionResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentResponse, 0);

  objc_storeStrong((id *)&self->_intent, 0);
}

- (INIntentResponse)intentResponse
{
  return self->_intentResponse;
}

- (INIntent)intent
{
  return self->_intent;
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"intent";
  intent = self->_intent;
  v4 = intent;
  if (!intent)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"intentResponse";
  v10[0] = v4;
  intentResponse = self->_intentResponse;
  v6 = intentResponse;
  if (!intentResponse)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (intentResponse)
  {
    if (intent) {
      goto LABEL_7;
    }
  }
  else
  {

    if (intent) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v7;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INIntentExecutionResult;
  v6 = [(INIntentExecutionResult *)&v11 description];
  v7 = [(INIntentExecutionResult *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (id)description
{
  return [(INIntentExecutionResult *)self descriptionAtIndent:0];
}

- (void)encodeWithCoder:(id)a3
{
  intent = self->_intent;
  id v5 = a3;
  [v5 encodeObject:intent forKey:@"intent"];
  [v5 encodeObject:self->_intentResponse forKey:@"intentResponse"];
}

- (INIntentExecutionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intent"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentResponse"];

  v7 = (INIntentExecutionResult *)[objc_alloc((Class)objc_opt_class()) initWithIntent:v5 response:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    intent = self->_intent;
    BOOL v8 = 0;
    if (intent == (INIntent *)v5[1] || -[INIntent isEqual:](intent, "isEqual:"))
    {
      intentResponse = self->_intentResponse;
      if (intentResponse == (INIntentResponse *)v5[2]
        || -[INIntentResponse isEqual:](intentResponse, "isEqual:"))
      {
        BOOL v8 = 1;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INIntent *)self->_intent hash];
  return [(INIntentResponse *)self->_intentResponse hash] ^ v3;
}

- (INIntentExecutionResult)initWithIntent:(id)a3 response:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INIntentExecutionResult;
  v9 = [(INIntentExecutionResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_intent, a3);
    objc_storeStrong((id *)&v10->_intentResponse, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end