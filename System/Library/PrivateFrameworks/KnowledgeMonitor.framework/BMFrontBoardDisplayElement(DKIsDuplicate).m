@interface BMFrontBoardDisplayElement(DKIsDuplicate)
- (uint64_t)dk_isDuplicateOf:()DKIsDuplicate;
@end

@implementation BMFrontBoardDisplayElement(DKIsDuplicate)

- (uint64_t)dk_isDuplicateOf:()DKIsDuplicate
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = [a1 identifier];
    if (v7 || ([v6 identifier], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = [a1 identifier];
      v9 = [v6 identifier];
      int v10 = [v8 isEqualToString:v9];

      if (v7)
      {

        if (!v10) {
          goto LABEL_20;
        }
      }
      else
      {

        if ((v10 & 1) == 0) {
          goto LABEL_20;
        }
      }
    }
    v12 = [a1 bundleIdentifier];
    if (!v12)
    {
      v3 = [v6 bundleIdentifier];
      if (!v3) {
        goto LABEL_15;
      }
    }
    v13 = [a1 bundleIdentifier];
    v14 = [v6 bundleIdentifier];
    int v15 = [v13 isEqualToString:v14];

    if (v12)
    {

      if (!v15) {
        goto LABEL_20;
      }
LABEL_15:
      int v16 = [a1 elementType];
      if (v16 != [v6 elementType]) {
        goto LABEL_20;
      }
      uint64_t v17 = [a1 layoutRole];
      if (v17 != [v6 layoutRole]) {
        goto LABEL_20;
      }
      uint64_t v18 = [a1 level];
      if (v18 != [v6 level]) {
        goto LABEL_20;
      }
      int v19 = [a1 hasKeyboardFocus];
      if (v19 != [v6 hasKeyboardFocus]) {
        goto LABEL_20;
      }
      int v20 = [a1 isUIApplicationElement];
      if (v20 != [v6 isUIApplicationElement]) {
        goto LABEL_20;
      }
      v22 = [a1 display];
      if (v22 || ([v6 display], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v23 = [a1 display];
        v24 = [v6 display];
        int v25 = [v23 isEqual:v24] ^ 1;

        if (v22)
        {
LABEL_29:

          uint64_t v11 = v25 ^ 1u;
          goto LABEL_21;
        }
      }
      else
      {
        int v25 = 0;
      }

      goto LABEL_29;
    }

    if (v15) {
      goto LABEL_15;
    }
LABEL_20:
    uint64_t v11 = 0;
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v11 = 0;
LABEL_22:

  return v11;
}

@end