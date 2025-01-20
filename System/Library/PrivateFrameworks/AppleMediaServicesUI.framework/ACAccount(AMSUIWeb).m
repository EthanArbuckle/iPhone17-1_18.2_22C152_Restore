@interface ACAccount(AMSUIWeb)
- (uint64_t)web_matchAccount:()AMSUIWeb;
@end

@implementation ACAccount(AMSUIWeb)

- (uint64_t)web_matchAccount:()AMSUIWeb
{
  id v6 = a3;
  v7 = objc_msgSend(a1, "ams_DSID");
  v8 = objc_msgSend(a1, "ams_altDSID");
  v9 = [a1 username];
  if (v7)
  {
    v3 = objc_msgSend(v6, "ams_DSID");
    if ([v3 isEqualToNumber:v7])
    {
      uint64_t v10 = 1;
LABEL_15:

      goto LABEL_16;
    }
  }
  if (v8)
  {
    v4 = objc_msgSend(v6, "ams_altDSID");
    if ([v4 isEqualToString:v8])
    {

      uint64_t v10 = 1;
      goto LABEL_14;
    }
    if (!v9)
    {
      uint64_t v10 = 0;
      goto LABEL_13;
    }
  }
  else if (!v9)
  {
    uint64_t v10 = 0;
    goto LABEL_14;
  }
  v11 = [v6 username];
  uint64_t v10 = [v11 isEqualToString:v9];

  if (v8) {
LABEL_13:
  }

LABEL_14:
  if (v7) {
    goto LABEL_15;
  }
LABEL_16:

  return v10;
}

@end