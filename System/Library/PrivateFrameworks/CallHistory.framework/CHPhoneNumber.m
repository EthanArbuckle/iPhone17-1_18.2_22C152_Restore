@interface CHPhoneNumber
- (BOOL)formattedRepresentationAttempted;
- (BOOL)normalizedRepresentationAttempted;
- (CHPhoneNumber)initWithDigits:(id)a3 isoCountryCode:(id)a4;
- (NSString)digits;
- (NSString)formattedRepresentation;
- (NSString)isoCountryCode;
- (NSString)normalizedRepresentation;
- (void)setFormattedRepresentationAttempted:(BOOL)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setNormalizedRepresentationAttempted:(BOOL)a3;
@end

@implementation CHPhoneNumber

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_digits, 0);
  objc_storeStrong((id *)&self->_normalizedRepresentation, 0);
  objc_storeStrong((id *)&self->_formattedRepresentation, 0);
}

- (CHPhoneNumber)initWithDigits:(id)a3 isoCountryCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CHPhoneNumber;
  v8 = [(CHLogger *)&v14 initWithDomain:"CHPhoneNumber"];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    digits = v8->_digits;
    v8->_digits = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    isoCountryCode = v8->_isoCountryCode;
    v8->_isoCountryCode = (NSString *)v11;
  }
  return v8;
}

- (NSString)formattedRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(CHPhoneNumber *)self formattedRepresentationAttempted])
  {
    v3 = [(CHLogger *)self logHandle];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [(CHPhoneNumber *)self digits];
      v5 = [(CHPhoneNumber *)self isoCountryCode];
      int v13 = 138412546;
      objc_super v14 = v4;
      __int16 v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_1B8E4A000, v3, OS_LOG_TYPE_DEFAULT, "Not formatted. So let's create a CFPhoneNumberRef. Num: %@, iso: %{public}@", (uint8_t *)&v13, 0x16u);
    }
    id v6 = [(CHPhoneNumber *)self digits];
    id v7 = [(CHPhoneNumber *)self isoCountryCode];
    v8 = (const void *)CFPhoneNumberCreate();

    if (v8)
    {
      String = (NSString *)CFPhoneNumberCreateString();
      formattedRepresentation = self->_formattedRepresentation;
      self->_formattedRepresentation = String;

      CFRelease(v8);
    }
    [(CHPhoneNumber *)self setFormattedRepresentationAttempted:1];
  }
  uint64_t v11 = self->_formattedRepresentation;
  return v11;
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (NSString)digits
{
  return self->_digits;
}

- (void)setFormattedRepresentationAttempted:(BOOL)a3
{
  self->_formattedRepresentationAttempted = a3;
}

- (BOOL)formattedRepresentationAttempted
{
  return self->_formattedRepresentationAttempted;
}

- (NSString)normalizedRepresentation
{
  if (![(CHPhoneNumber *)self normalizedRepresentationAttempted])
  {
    v3 = [(CHPhoneNumber *)self digits];
    v4 = [(CHPhoneNumber *)self isoCountryCode];
    v5 = (const void *)CFPhoneNumberCreate();

    if (v5)
    {
      String = (NSString *)CFPhoneNumberCreateString();
      normalizedRepresentation = self->_normalizedRepresentation;
      self->_normalizedRepresentation = String;

      CFRelease(v5);
    }
    [(CHPhoneNumber *)self setNormalizedRepresentationAttempted:1];
  }
  v8 = self->_normalizedRepresentation;
  return v8;
}

- (void)setIsoCountryCode:(id)a3
{
}

- (BOOL)normalizedRepresentationAttempted
{
  return self->_normalizedRepresentationAttempted;
}

- (void)setNormalizedRepresentationAttempted:(BOOL)a3
{
  self->_normalizedRepresentationAttempted = a3;
}

@end