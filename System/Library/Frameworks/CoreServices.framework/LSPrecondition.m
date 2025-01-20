@interface LSPrecondition
+ (BOOL)supportsSecureCoding;
+ (id)emptyPrecondition;
+ (id)registrationStatePreconditionForBundleWithIdentifier:(id)a3 placeholderInstalled:(id)a4 fullApplicationInstalled:(id)a5;
- (BOOL)isMet;
- (id)description;
@end

@implementation LSPrecondition

- (BOOL)isMet
{
  return 1;
}

- (id)description
{
  return @"<LSPrecondition: empty>";
}

+ (id)emptyPrecondition
{
  if (+[LSPrecondition emptyPrecondition]::onceToken != -1) {
    dispatch_once(&+[LSPrecondition emptyPrecondition]::onceToken, &__block_literal_global_59);
  }
  v2 = (void *)+[LSPrecondition emptyPrecondition]::result;

  return v2;
}

void __35__LSPrecondition_emptyPrecondition__block_invoke()
{
  v0 = objc_alloc_init(LSPrecondition);
  v1 = (void *)+[LSPrecondition emptyPrecondition]::result;
  +[LSPrecondition emptyPrecondition]::result = (uint64_t)v0;
}

+ (id)registrationStatePreconditionForBundleWithIdentifier:(id)a3 placeholderInstalled:(id)a4 fullApplicationInstalled:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [[LSBundleRegistrationStatePrecondition alloc] initForBundleWithIdentifier:v7 placeholderInstalled:v8 fullApplicationInstalled:v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end