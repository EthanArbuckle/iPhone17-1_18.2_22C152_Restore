@interface TKSlotParameters
- (BOOL)delegateWithControlMethod;
- (BOOL)delegateWithEscapeMethod;
- (BOOL)securePINChangeSupported;
- (BOOL)securePINVerificationSupported;
- (NSNumber)displayMaxCharacters;
- (NSNumber)displayMaxLines;
- (NSNumber)maxPINLength;
- (NSNumber)minPINLength;
- (NSNumber)pinValidationCondition;
- (NSNumber)productID;
- (NSNumber)vendorID;
- (NSString)firmwareVersion;
- (TKSlotParameters)initWithEntriesFromDictionary:(id)a3;
- (TKSlotParameters)initWithMaxBlockSize:(int64_t)a3;
- (double)interactionTimeout;
- (id)description;
- (id)getDictionaryParameters;
- (int64_t)maxInputLength;
- (int64_t)maxOutputLength;
- (void)setDelegateWithControlMethod:(BOOL)a3;
- (void)setDelegateWithEscapeMethod:(BOOL)a3;
- (void)setDisplayMaxCharacters:(id)a3;
- (void)setDisplayMaxLines:(id)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setInteractionTimeout:(double)a3;
- (void)setMaxInputLength:(int64_t)a3;
- (void)setMaxOutputLength:(int64_t)a3;
- (void)setMaxPINLength:(id)a3;
- (void)setMinPINLength:(id)a3;
- (void)setPinValidationCondition:(id)a3;
- (void)setProductID:(id)a3;
- (void)setSecurePINChangeSupported:(BOOL)a3;
- (void)setSecurePINVerificationSupported:(BOOL)a3;
- (void)setVendorID:(id)a3;
@end

@implementation TKSlotParameters

- (TKSlotParameters)initWithMaxBlockSize:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TKSlotParameters;
  v4 = [(TKSlotParameters *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(TKSlotParameters *)v4 setMaxInputLength:a3];
    [(TKSlotParameters *)v5 setMaxOutputLength:a3];
    [(TKSlotParameters *)v5 setSecurePINVerificationSupported:0];
    [(TKSlotParameters *)v5 setSecurePINChangeSupported:0];
  }
  return v5;
}

- (TKSlotParameters)initWithEntriesFromDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TKSlotParameters;
  v5 = [(TKSlotParameters *)&v15 init];
  if (v5)
  {
    unsigned int outCount = 0;
    v6 = (objc_class *)objc_opt_class();
    objc_super v7 = class_copyPropertyList(v6, &outCount);
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; ++i)
      {
        Name = property_getName(v7[i]);
        v10 = [NSString stringWithUTF8String:Name];
        v11 = [v4 objectForKeyedSubscript:v10];

        if (v11)
        {
          v12 = [NSString stringWithUTF8String:Name];
          [(TKSlotParameters *)v5 setValue:v11 forKey:v12];
        }
      }
    }
    free(v7);
  }

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  objc_msgSend(v3, "appendFormat:", @"{\n    maxInputLength: %ld\n", -[TKSlotParameters maxInputLength](self, "maxInputLength"));
  objc_msgSend(v3, "appendFormat:", @"    maxOutputLength: %ld\n", -[TKSlotParameters maxOutputLength](self, "maxOutputLength"));
  id v4 = [(TKSlotParameters *)self productID];
  [v3 appendFormat:@"    productID: %@\n", v4];

  v5 = [(TKSlotParameters *)self vendorID];
  [v3 appendFormat:@"    vendorID: %@\n", v5];

  v6 = [(TKSlotParameters *)self firmwareVersion];
  [v3 appendFormat:@"    firmwareVersion: %@\n", v6];

  objc_msgSend(v3, "appendFormat:", @"    securePINVerificationSupported: %d\n", -[TKSlotParameters securePINVerificationSupported](self, "securePINVerificationSupported"));
  objc_msgSend(v3, "appendFormat:", @"    securePINChangeSupported: %d\n", -[TKSlotParameters securePINChangeSupported](self, "securePINChangeSupported"));
  objc_super v7 = [(TKSlotParameters *)self displayMaxCharacters];
  [v3 appendFormat:@"    displayMaxCharacters: %@\n", v7];

  v8 = [(TKSlotParameters *)self displayMaxLines];
  [v3 appendFormat:@"    displayMaxLines: %@ \n", v8];

  v9 = [(TKSlotParameters *)self pinValidationCondition];
  [v3 appendFormat:@"    pinValidationCondition: %@ \n", v9];

  [(TKSlotParameters *)self interactionTimeout];
  objc_msgSend(v3, "appendFormat:", @"    interactionTimeout: %f\n", v10);
  v11 = [(TKSlotParameters *)self minPINLength];
  [v3 appendFormat:@"    minPINLength: %@\n", v11];

  v12 = [(TKSlotParameters *)self maxPINLength];
  [v3 appendFormat:@"    maxPINLength: %@\n", v12];

  objc_msgSend(v3, "appendFormat:", @"    delegateWithControlMethod: %d\n", -[TKSlotParameters delegateWithControlMethod](self, "delegateWithControlMethod"));
  objc_msgSend(v3, "appendFormat:", @"    delegateWithEscapeMethod: %d\n}\n", -[TKSlotParameters delegateWithEscapeMethod](self, "delegateWithEscapeMethod"));

  return v3;
}

- (id)getDictionaryParameters
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  unsigned int outCount = 0;
  id v4 = (objc_class *)objc_opt_class();
  v5 = class_copyPropertyList(v4, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      Name = property_getName(v5[i]);
      v8 = [NSString stringWithUTF8String:Name];
      v9 = [(TKSlotParameters *)self valueForKey:v8];

      if (v9)
      {
        uint64_t v10 = [NSString stringWithUTF8String:Name];
        [v3 setObject:v9 forKey:v10];
      }
    }
  }
  free(v5);

  return v3;
}

- (int64_t)maxInputLength
{
  return self->_maxInputLength;
}

- (void)setMaxInputLength:(int64_t)a3
{
  self->_maxInputLength = a3;
}

- (int64_t)maxOutputLength
{
  return self->_maxOutputLength;
}

- (void)setMaxOutputLength:(int64_t)a3
{
  self->_maxOutputLength = a3;
}

- (NSNumber)productID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProductID:(id)a3
{
}

- (NSNumber)vendorID
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVendorID:(id)a3
{
}

- (NSString)firmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFirmwareVersion:(id)a3
{
}

- (BOOL)securePINVerificationSupported
{
  return self->_securePINVerificationSupported;
}

- (void)setSecurePINVerificationSupported:(BOOL)a3
{
  self->_securePINVerificationSupported = a3;
}

- (BOOL)securePINChangeSupported
{
  return self->_securePINChangeSupported;
}

- (void)setSecurePINChangeSupported:(BOOL)a3
{
  self->_securePINChangeSupported = a3;
}

- (NSNumber)displayMaxCharacters
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDisplayMaxCharacters:(id)a3
{
}

- (NSNumber)displayMaxLines
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDisplayMaxLines:(id)a3
{
}

- (NSNumber)pinValidationCondition
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPinValidationCondition:(id)a3
{
}

- (double)interactionTimeout
{
  return self->_interactionTimeout;
}

- (void)setInteractionTimeout:(double)a3
{
  self->_interactionTimeout = a3;
}

- (NSNumber)minPINLength
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMinPINLength:(id)a3
{
}

- (NSNumber)maxPINLength
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMaxPINLength:(id)a3
{
}

- (BOOL)delegateWithControlMethod
{
  return self->_delegateWithControlMethod;
}

- (void)setDelegateWithControlMethod:(BOOL)a3
{
  self->_delegateWithControlMethod = a3;
}

- (BOOL)delegateWithEscapeMethod
{
  return self->_delegateWithEscapeMethod;
}

- (void)setDelegateWithEscapeMethod:(BOOL)a3
{
  self->_delegateWithEscapeMethod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxPINLength, 0);
  objc_storeStrong((id *)&self->_minPINLength, 0);
  objc_storeStrong((id *)&self->_pinValidationCondition, 0);
  objc_storeStrong((id *)&self->_displayMaxLines, 0);
  objc_storeStrong((id *)&self->_displayMaxCharacters, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);

  objc_storeStrong((id *)&self->_productID, 0);
}

@end