@interface NSPersistentHistoryToken(EDAdditions)
+ (id)ed_unarchivedTokenWithData:()EDAdditions error:;
- (uint64_t)ed_archiveTokenWithError:()EDAdditions;
@end

@implementation NSPersistentHistoryToken(EDAdditions)

+ (id)ed_unarchivedTokenWithData:()EDAdditions error:
{
  id v5 = a3;
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:a4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)ed_archiveTokenWithError:()EDAdditions
{
  return [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:a3];
}

@end