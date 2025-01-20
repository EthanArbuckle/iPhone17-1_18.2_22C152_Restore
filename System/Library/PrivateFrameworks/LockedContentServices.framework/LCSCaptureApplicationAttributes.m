@interface LCSCaptureApplicationAttributes
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAttributes:(id)a3;
- (LCSCaptureApplicationAttributes)initWithCameraTCCStatus:(unint64_t)a3;
- (NSString)description;
- (id)_stringForTCCStatus:(unint64_t)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)cameraTCCStatus;
- (unint64_t)hash;
@end

@implementation LCSCaptureApplicationAttributes

- (LCSCaptureApplicationAttributes)initWithCameraTCCStatus:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LCSCaptureApplicationAttributes;
  result = [(LCSCaptureApplicationAttributes *)&v5 init];
  if (result) {
    result->_cameraTCCStatus = a3;
  }
  return result;
}

- (id)_stringForTCCStatus:(unint64_t)a3
{
  if (a3 > 4) {
    return @"invalid";
  }
  else {
    return (id)*((void *)&off_2653BEB38 + a3);
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LCSCaptureApplicationAttributes *)a3;
  objc_super v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(LCSCaptureApplicationAttributes *)self isEqualToAttributes:v5];

  return v6;
}

- (BOOL)isEqualToAttributes:(id)a3
{
  return self->_cameraTCCStatus == *((void *)a3 + 1);
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C60]);
  id v4 = (id)[v3 appendUnsignedInteger:self->_cameraTCCStatus];
  unint64_t v5 = [v3 hash];

  return v5;
}

- (NSString)description
{
  return (NSString *)[(LCSCaptureApplicationAttributes *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(LCSCaptureApplicationAttributes *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x263F29C40] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(LCSCaptureApplicationAttributes *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(LCSCaptureApplicationAttributes *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73__LCSCaptureApplicationAttributes_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_2653BE9F0;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __73__LCSCaptureApplicationAttributes_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) _stringForTCCStatus:*(void *)(*(void *)(a1 + 40) + 8)];
  [v1 appendString:v2 withName:@"cameraTCCStatus"];
}

- (unint64_t)cameraTCCStatus
{
  return self->_cameraTCCStatus;
}

@end