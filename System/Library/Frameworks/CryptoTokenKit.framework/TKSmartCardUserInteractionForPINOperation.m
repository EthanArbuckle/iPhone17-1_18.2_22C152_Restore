@interface TKSmartCardUserInteractionForPINOperation
+ (BOOL)supportsSecureCoding;
- (NSArray)PINMessageIndices;
- (NSData)resultData;
- (NSLocale)locale;
- (TKSmartCardPINCompletion)PINCompletion;
- (TKSmartCardUserInteractionForPINOperation)init;
- (TKSmartCardUserInteractionForPINOperation)initWithCoder:(id)a3;
- (UInt16)resultSW;
- (unsigned)localeID;
- (void)encodeWithCoder:(id)a3;
- (void)setLocale:(NSLocale *)locale;
- (void)setPINCompletion:(TKSmartCardPINCompletion)PINCompletion;
- (void)setPINMessageIndices:(NSArray *)PINMessageIndices;
- (void)setResultData:(NSData *)resultData;
- (void)setResultSW:(UInt16)resultSW;
@end

@implementation TKSmartCardUserInteractionForPINOperation

- (TKSmartCardUserInteractionForPINOperation)init
{
  v7.receiver = self;
  v7.super_class = (Class)TKSmartCardUserInteractionForPINOperation;
  v2 = [(TKSmartCardUserInteraction *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_PINCompletion = 2;
    PINMessageIndices = v2->_PINMessageIndices;
    v2->_PINMessageIndices = 0;

    locale = v3->_locale;
    v3->_locale = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKSmartCardUserInteractionForPINOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TKSmartCardUserInteractionForPINOperation;
  v5 = [(TKSmartCardUserInteraction *)&v17 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PINCompletion"];
    v5->_PINCompletion = [v6 unsignedIntegerValue];

    objc_super v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"PINMessageIndices"];
    uint64_t v11 = [v10 copy];
    PINMessageIndices = v5->_PINMessageIndices;
    v5->_PINMessageIndices = (NSArray *)v11;

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
    uint64_t v14 = [v13 copy];
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TKSmartCardUserInteractionForPINOperation;
  id v4 = a3;
  [(TKSmartCardUserInteraction *)&v7 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_PINCompletion, v7.receiver, v7.super_class);
  [v4 encodeObject:v5 forKey:@"PINCompletion"];

  [v4 encodeObject:self->_PINMessageIndices forKey:@"PINMessageIndices"];
  v6 = [(TKSmartCardUserInteractionForPINOperation *)self locale];
  [v4 encodeObject:v6 forKey:@"locale"];
}

- (NSLocale)locale
{
  locale = self->_locale;
  if (locale)
  {
    v3 = locale;
  }
  else
  {
    v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  }

  return v3;
}

- (void)setLocale:(NSLocale *)locale
{
}

- (unsigned)localeID
{
  v2 = (void *)MEMORY[0x1E4F1CA20];
  v3 = [(TKSmartCardUserInteractionForPINOperation *)self locale];
  id v4 = [v3 localeIdentifier];
  LOWORD(v2) = [v2 windowsLocaleCodeFromLocaleIdentifier:v4];

  return (unsigned __int16)v2;
}

- (TKSmartCardPINCompletion)PINCompletion
{
  return self->_PINCompletion;
}

- (void)setPINCompletion:(TKSmartCardPINCompletion)PINCompletion
{
  self->_PINCompletion = PINCompletion;
}

- (NSArray)PINMessageIndices
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPINMessageIndices:(NSArray *)PINMessageIndices
{
}

- (UInt16)resultSW
{
  return self->_resultSW;
}

- (void)setResultSW:(UInt16)resultSW
{
  self->_resultSW = resultSW;
}

- (NSData)resultData
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setResultData:(NSData *)resultData
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultData, 0);
  objc_storeStrong((id *)&self->_PINMessageIndices, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

@end