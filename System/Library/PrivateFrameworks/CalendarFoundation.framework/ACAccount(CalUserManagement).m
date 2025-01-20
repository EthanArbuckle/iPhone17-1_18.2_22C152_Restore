@interface ACAccount(CalUserManagement)
- (id)cal_personaIdentifier;
@end

@implementation ACAccount(CalUserManagement)

- (id)cal_personaIdentifier
{
  id v1 = a1;
  if (v1)
  {
    v2 = v1;
    uint64_t v3 = *MEMORY[0x1E4F176E8];
    while (1)
    {
      objc_opt_class();
      id v4 = [v2 objectForKeyedSubscript:v3];
      id v5 = (objc_opt_isKindOfClass() & 1) != 0 ? v4 : 0;

      if (v5) {
        break;
      }
      uint64_t v6 = [v2 parentAccount];

      v2 = (void *)v6;
      if (!v6) {
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    id v5 = 0;
  }

  return v5;
}

@end