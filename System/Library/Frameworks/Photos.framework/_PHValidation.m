@interface _PHValidation
- (BOOL)isValid:(id *)a3;
- (_PHValidation)initWithOptions:(unint64_t)a3;
- (void)assert:(BOOL)a3 code:(int64_t)a4 format:(id)a5;
- (void)assert:(BOOL)a3 error:(id)a4;
- (void)validateOption:(unint64_t)a3 usingBlock:(id)a4;
@end

@implementation _PHValidation

- (void).cxx_destruct
{
}

- (BOOL)isValid:(id *)a3
{
  v5 = self->_error;
  if (v5)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_7:
    BOOL v6 = 0;
    goto LABEL_8;
  }
  if ((self->_requestedOptions & ~self->_validatedOptions) == 0)
  {
    v5 = 0;
    BOOL v6 = 1;
    goto LABEL_8;
  }
  v7 = (void *)MEMORY[0x1E4F28C58];
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  v9 = [NSNumber numberWithUnsignedInteger:self->_validatedOptions];
  objc_msgSend(v7, "ph_genericErrorWithLocalizedDescription:", @"Not all options were validated (%@, %@)", v8, v9);
  v5 = (NSError *)objc_claimAutoreleasedReturnValue();

  if (!a3) {
    goto LABEL_7;
  }
LABEL_3:
  v5 = v5;
  BOOL v6 = 0;
  *a3 = v5;
LABEL_8:

  return v6;
}

- (void)assert:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  if (!a3 && !self->_error)
  {
    id v9 = v6;
    v7 = (NSError *)[v6 copy];
    error = self->_error;
    self->_error = v7;

    id v6 = v9;
  }
}

- (void)assert:(BOOL)a3 code:(int64_t)a4 format:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v8 = (__CFString *)a5;
  if (!a3 && !self->_error)
  {
    id v9 = (__CFString *)CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v8, &v16);
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v15[0] = v9;
    v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1, &v16);
    objc_msgSend(v10, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", a4, v11);
    v12 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v12;
  }
}

- (void)validateOption:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = (void (**)(void))a4;
  if (!self->_error && (self->_requestedOptions & a3) != 0 && (a3 & ~self->_validatedOptions) != 0)
  {
    v7 = v6;
    v6[2]();
    id v6 = v7;
    self->_validatedOptions |= a3;
  }
}

- (_PHValidation)initWithOptions:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_PHValidation;
  result = [(_PHValidation *)&v5 init];
  if (result) {
    result->_requestedOptions = a3;
  }
  return result;
}

@end