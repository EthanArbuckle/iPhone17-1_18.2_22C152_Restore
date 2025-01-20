@interface CNUUID
+ (id)uuidFromContactIdentifier:(id)a3;
@end

@implementation CNUUID

+ (id)uuidFromContactIdentifier:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v3];
  if (!v4)
  {
    uint64_t v5 = [v3 rangeOfString:@":"];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL
      || (objc_msgSend(v3, "_cn_take:", v5),
          v6 = objc_claimAutoreleasedReturnValue(),
          v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6],
          v6,
          !v4))
    {
      v4 = [MEMORY[0x1E4F29128] UUID];
    }
  }

  return v4;
}

@end