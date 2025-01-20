@interface HKUserDomainConceptTypeIdentifier(HDSyncSupport)
+ (id)createWithCodable:()HDSyncSupport;
- (HDCodableUserDomainConceptTypeIdentifier)codableRepresentationForSync;
@end

@implementation HKUserDomainConceptTypeIdentifier(HDSyncSupport)

- (HDCodableUserDomainConceptTypeIdentifier)codableRepresentationForSync
{
  v2 = objc_alloc_init(HDCodableUserDomainConceptTypeIdentifier);
  v3 = [a1 schema];
  [(HDCodableUserDomainConceptTypeIdentifier *)v2 setSchema:v3];

  -[HDCodableUserDomainConceptTypeIdentifier setCode:](v2, "setCode:", [a1 code]);

  return v2;
}

+ (id)createWithCodable:()HDSyncSupport
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    id v4 = objc_alloc(MEMORY[0x1E4F2B690]);
    uint64_t v5 = [v3 code];
    v6 = [v3 schema];
    v7 = (void *)[v4 initWithCode:v5 schema:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end