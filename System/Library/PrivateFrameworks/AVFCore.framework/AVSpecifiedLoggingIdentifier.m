@interface AVSpecifiedLoggingIdentifier
- (AVSpecifiedLoggingIdentifier)initWithSpecifiedName:(id)a3;
- (NSString)name;
- (id)makeDerivedIdentifier;
- (void)dealloc;
@end

@implementation AVSpecifiedLoggingIdentifier

- (AVSpecifiedLoggingIdentifier)initWithSpecifiedName:(id)a3
{
  if (!a3) {
    return 0;
  }
  v6 = (void *)[a3 componentsSeparatedByString:@"."];
  if ([v6 count])
  {
    if ((unint64_t)objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", 0), "length") >= 7)
    {
      v17 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v18 = *MEMORY[0x1E4F1C3C8];
      v19 = @"Identifier name must be 6 chars or less";
      goto LABEL_17;
    }
    if ((unint64_t)[v6 count] >= 2)
    {
      if ((unint64_t)[v6 count] >= 3)
      {
        v17 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v18 = *MEMORY[0x1E4F1C3C8];
        v19 = @"Identifier name must not contain more than one period";
        goto LABEL_17;
      }
      v12 = (void *)[v6 objectAtIndex:1];
      if ([v12 length])
      {
        uint64_t v13 = 0;
        while ([v12 characterAtIndex:v13] - 58 > 0xFFFFFFF5)
        {
          if (++v13 >= (unint64_t)[v12 length]) {
            goto LABEL_10;
          }
        }
        v17 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v18 = *MEMORY[0x1E4F1C3C8];
        v19 = @"Identifier name must not contain non-numeric character after period";
LABEL_17:
        v20 = objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v19, v7, v8, v9, v10, v11, (uint64_t)v21.receiver), 0);
        objc_exception_throw(v20);
      }
    }
  }
LABEL_10:
  v21.receiver = self;
  v21.super_class = (Class)AVSpecifiedLoggingIdentifier;
  v14 = [(AVSpecifiedLoggingIdentifier *)&v21 init];
  if (v14)
  {
    v15 = objc_alloc_init(AVSpecifiedLoggingIdentifierInternal);
    v14->_specifiedLoggingIdentifier = v15;
    if (v15)
    {
      v15->derivedIdentifierCounter = 0;
      v14->_specifiedLoggingIdentifier->identifierName = (NSString *)[a3 copyWithZone:0];
      CFRetain(v14->_specifiedLoggingIdentifier);
      return v14;
    }

    return 0;
  }
  return v14;
}

- (NSString)name
{
  return (NSString *)[NSString stringWithString:self->_specifiedLoggingIdentifier->identifierName];
}

- (void)dealloc
{
  specifiedLoggingIdentifier = self->_specifiedLoggingIdentifier;
  if (specifiedLoggingIdentifier)
  {

    CFRelease(self->_specifiedLoggingIdentifier);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVSpecifiedLoggingIdentifier;
  [(AVSpecifiedLoggingIdentifier *)&v4 dealloc];
}

- (id)makeDerivedIdentifier
{
  ++self->_specifiedLoggingIdentifier->derivedIdentifierCounter;
  v3 = [AVSpecifiedLoggingIdentifier alloc];
  objc_super v4 = -[AVSpecifiedLoggingIdentifier initWithSpecifiedName:](v3, "initWithSpecifiedName:", [NSString stringWithFormat:@"%@.%02d", -[AVSpecifiedLoggingIdentifier name](self, "name"), self->_specifiedLoggingIdentifier->derivedIdentifierCounter]);
  return v4;
}

@end