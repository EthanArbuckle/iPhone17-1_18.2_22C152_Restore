void sub_475C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_47EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_47FC(id a1, MailAccount *a2)
{
  v2 = a2;
  v3 = [(MailAccount *)v2 primaryMailboxUid];
  v4 = [[MFNanoBridgeSettingsAccountSpecificMailbox alloc] initWithMailboxUid:v3 account:v2];

  return v4;
}

void sub_486C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_4888(id a1, id a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void sub_48D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4A90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4B98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4C54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4D2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_4EC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4F5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_5098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_5118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5174(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_52A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_530C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5418(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_54E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_54F4(void *a1, void *a2)
{
  v4 = [a1 mailbox];
  v5 = [a2 mailbox];
  unint64_t v6 = (unint64_t)[v4 type];
  unint64_t v7 = (unint64_t)[v5 type];
  if (v6 | v7)
  {
    if (v6) {
      uint64_t v8 = -1;
    }
    else {
      uint64_t v8 = v7 != 0;
    }
  }
  else
  {
    v9 = [a1 displayName];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v4 displayName];
    }
    v12 = v11;

    v13 = [a2 displayName];
    v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [v5 displayName];
    }
    v16 = v15;

    uint64_t v8 = (uint64_t)[v12 localizedCaseInsensitiveCompare:v16];
  }

  return v8;
}

void sub_55F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_583C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_598C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5B8C(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_5D18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_63D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_66A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_69A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_6B4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6DAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6E94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6F4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7350(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_73F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_76B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_7744(int a1, int a2)
{
  v4 = +[NSMutableString stringWithString:@"FOUND_IN_MAILBOX_FORMAT"];
  v5 = v4;
  if (a1) {
    [v4 appendString:@"_WITH_ACCOUNT"];
  }
  if (a2) {
    [v5 appendString:@"_SHORT"];
  }
  unint64_t v6 = +[NSBundle mainBundle];
  unint64_t v7 = [v6 localizedStringForKey:v5 value:&stru_2CC10 table:@"Main"];

  return v7;
}

void sub_7804(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_78EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_79F4(_Unwind_Exception *a1)
{
  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_7AC4(_Unwind_Exception *a1)
{
  id v2 = v1;

  _Unwind_Resume(a1);
}

void sub_7CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_7D28(id a1, NSNumber *a2)
{
  id v2 = a2;
  v3 = +[EMMailbox predicateForMailboxType:[(NSNumber *)v2 integerValue]];

  return v3;
}

void sub_7D84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_7D94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

id MFImageForAddressLabelTypeCustomBundleAndBackground(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, double a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  if (!v11)
  {
    v14 = +[UIApplication sharedApplication];
    id v11 = [v14 preferredContentSizeCategory];
  }
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  if (!qword_34728) {
    qword_34728 = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, &kCFTypeDictionaryValueCallBacks);
  }
  if (a6 == 0.0)
  {
    v18 = (const void *)((997 * a5) ^ (31 * a1) ^ (unint64_t)[v15 hash]);
    v19 = CFDictionaryGetValue((CFDictionaryRef)qword_34728, v18);
    if (v19) {
      goto LABEL_13;
    }
    keCGFloat y = (void *)v18;
  }
  else
  {
    keCGFloat y = 0;
  }
  id v20 = v15;
  id v57 = v16;
  v56 = v20;
  id v55 = v17;
  v21 = sub_8588((uint64_t)v20);
  v60[0] = NSFontAttributeName;
  v60[1] = NSForegroundColorAttributeName;
  v61[0] = v21;
  v61[1] = v55;
  v22 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];
  id v59 = 0;
  double v23 = sub_8650(a1, v22, &v59, v57, a6);
  double v58 = v24;
  double v25 = v23;
  id v26 = v59;
  [v21 pointSize];
  CGFloat v28 = v27 * 0.17;
  v63.origin.CGFloat x = sub_87C8(v21);
  CGFloat x = v63.origin.x;
  CGFloat y = v63.origin.y;
  CGFloat height = v63.size.height;
  CGFloat v33 = fmax(a6, v32);
  v63.size.width = v33;
  CGRectGetWidth(v63);
  UIRoundToViewScale();
  double v54 = v34;
  [v21 capHeight];
  double v53 = v35;
  [v21 ascender];
  double v52 = v36;
  v64.origin.CGFloat x = x;
  v64.origin.CGFloat y = y;
  v64.size.width = v33;
  v64.size.CGFloat height = height;
  double v51 = CGRectGetHeight(v64);
  [v21 capHeight];
  double v50 = v37;
  v62.width = v33;
  v62.CGFloat height = height;
  UIGraphicsBeginImageContextWithOptions(v62, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  [v55 setStroke];
  v39 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v20];
  v40 = +[UIFontMetrics defaultMetrics];
  [v40 scaledValueForValue:v39 compatibleWithTraitCollection:2.0];
  double v42 = v41;

  v65.origin.CGFloat x = x;
  v65.origin.CGFloat y = y;
  v65.size.width = v33;
  v65.size.CGFloat height = height;
  CGRect v66 = CGRectInset(v65, 1.5, 1.5);
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v66.origin.x, v66.origin.y, v66.size.width, v66.size.height, fmax(fmin(v42, 4.0), 2.0));
  id v43 = objc_claimAutoreleasedReturnValue();
  v44 = (const CGPath *)[v43 CGPath];

  CGContextAddPath(CurrentContext, v44);
  CGContextSetLineWidth(CurrentContext, v28);
  CGContextStrokePath(CurrentContext);
  objc_msgSend(v26, "drawWithRect:options:attributes:context:", 33, v22, 0, v54, v53 - v52 + (v51 - v50) * 0.5, v25, v58);
  v19 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  if (a6 == 0.0)
  {
    if (v19)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)qword_34728, key, v19);
    }
    else
    {
      v19 = 0;
      CFDictionarySetValue((CFMutableDictionaryRef)qword_34728, key, +[NSNull null]);
    }
  }
LABEL_13:
  v45 = +[NSNull null];
  if (v45 == v19) {
    v46 = 0;
  }
  else {
    v46 = v19;
  }
  id v47 = v46;

  return v47;
}

void sub_8244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,_Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

double MFDefaultWidthForAddressLabelType(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  unint64_t v6 = +[NSBundle mainBundle];
  double v7 = MFDefaultWidthForAddressLabelTypeCustomBundle(a1, v5, v6, a3);

  return v7;
}

void sub_83CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double MFDefaultWidthForAddressLabelTypeCustomBundle(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7 = a2;
  id v8 = a3;
  if (!v7)
  {
    v9 = +[UIApplication sharedApplication];
    id v7 = [v9 preferredContentSizeCategory];
  }
  v10 = sub_8588((uint64_t)v7);
  NSAttributedStringKey v14 = NSFontAttributeName;
  id v15 = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  sub_8650(a1, v11, 0, v8, a4);

  [v10 pointSize];
  v16.origin.CGFloat x = sub_87C8(v10);
  double Width = CGRectGetWidth(v16);

  return Width;
}

void sub_8534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_8588(uint64_t a1)
{
  v1 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:a1];
  id v2 = +[UIFont boldSystemFontOfSize:7.5];
  v3 = +[UIFontMetrics defaultMetrics];
  v4 = [v3 scaledFontForFont:v2 compatibleWithTraitCollection:v1];

  return v4;
}

void sub_8624(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

double sub_8650(uint64_t a1, void *a2, void *a3, void *a4, double a5)
{
  id v9 = a2;
  id v10 = a4;
  double v11 = 0.0;
  if (a5 > 0.0)
  {
    id v12 = +[UIScreen mainScreen];
    [v12 scale];
    double v14 = 1.0 / (v13 + v13);

    if (v14 + a5 + -6.0 >= 0.0) {
      double v11 = v14 + a5 + -6.0;
    }
    else {
      double v11 = 0.0;
    }
  }
  id v15 = sub_889C(a1, 0, v10);
  double v16 = sub_89D0(v15, v9, 0.0);
  double v17 = v16;
  if (v11 <= 0.0 || v16 <= v11)
  {
    id v20 = v15;
    if (!a3) {
      goto LABEL_12;
    }
LABEL_11:
    *a3 = v20;
    goto LABEL_12;
  }
  id v20 = sub_889C(a1, 1, v10);

  double v17 = sub_89D0(v20, v9, v11);
  if (a3) {
    goto LABEL_11;
  }
LABEL_12:

  return v17;
}

void sub_8794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CGFloat sub_87C8(void *a1)
{
  id v1 = a1;
  [v1 capHeight];
  [v1 capHeight];
  UIRoundToViewScale();
  UIRoundToViewScale();
  [v1 capHeight];
  UIRoundToViewScale();

  return CGPointZero.x;
}

void sub_8888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_889C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (a1 == 3 || a1 == 2)
  {
    uint64_t v6 = MFLookupLocalizedString();
  }
  else
  {
    if (a1 != 1)
    {
      id v7 = 0;
      goto LABEL_10;
    }
    uint64_t v6 = [v4 localizedStringForKey:@"FROM_LABEL" value:&stru_2CC10 table:@"Main"];
  }
  id v7 = (void *)v6;
LABEL_10:

  return v7;
}

void sub_89B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_89D0(void *a1, void *a2, double a3)
{
  id v5 = a1;
  id v6 = a2;
  if (a3 <= 0.0)
  {
    [v5 sizeWithAttributes:v6];
    double v8 = v9;
  }
  else
  {
    objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 33, v6, 0, a3, 0.0);
    double v8 = v7;
  }

  return v8;
}

void sub_8A68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8B80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_8B98(uint64_t a1, void *a2)
{
  return [a2 _handleWatchAccountStatusChanged];
}

id sub_8BA0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a2 _handleAccountAuthenticationFailed:a5];
}

void sub_8C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFNanoAccountsSettingsDataSource;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_8ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_9064(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_91AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_9278(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 standaloneState] == (char *)&dword_0 + 2) {
    uint64_t v4 = [*(id *)(a1 + 32) isiCloudAccount:v3] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_92CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_942C(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshAccounts];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * (void)v5);
        if (objc_opt_respondsToSelector()) {
          [v6 accountsSettingsDataSourceDidUpdate:*(void *)(a1 + 32)];
        }
        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void sub_9558(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_96B0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"MFNanoWatchAuthenticationFailedAccountIdDarwinNotificationUserInfoKey"];
  id v3 = +[MailAccount accountWithUniqueId:v2];
  uint64_t v4 = objc_msgSend(v3, "nano_account");

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = objc_msgSend(*(id *)(a1 + 40), "observers", 0);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if (objc_opt_respondsToSelector()) {
          [v9 accountsSettingsDataSource:*(void *)(a1 + 40) didReceivedAuthenticationFailureForAccount:v4];
        }
        long long v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

void sub_9828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_98F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_999C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9A1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9A80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9AF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9EAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9FC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A03C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A0B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_A160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A1FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_A8E4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained presentViewController:v3 animated:1 completion:0];
}

void sub_A948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_A960(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_AAB0;
  v10[3] = &unk_2C8B8;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v7 = v5;
  id v11 = v7;
  id v8 = v6;
  id v12 = v8;
  id v13 = *(id *)(a1 + 32);
  long long v9 = +[EFScheduler mainThreadScheduler];
  [v9 performBlock:v10];

  objc_destroyWeak(&v14);
}

void sub_AA6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15)
{
  v19 = v18;

  objc_destroyWeak(v16);
  _Unwind_Resume(a1);
}

void sub_AAB0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = *(void **)(a1 + 32);
  if (v3 && !*(void *)(a1 + 40))
  {
    id v6 = [v3 username];
    id v7 = [*(id *)(a1 + 48) username];
    id v8 = [v6 compare:v7 options:1];

    if (v8)
    {
      long long v9 = MFLogGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "#Nano Authenticated on wrong account. Ignoring it.", buf, 2u);
      }

      long long v10 = +[NSBundle bundleForClass:objc_opt_class()];
      id v11 = [v10 localizedStringForKey:@"AUTHENTICATION_FAILURE_ALERT_TITLE" value:&stru_2CC10 table:@"Main"];
      id v12 = +[NSBundle bundleForClass:objc_opt_class()];
      id v13 = [v12 localizedStringForKey:@"AUTHENTICATION_FAILURE_INCORRECT_ACCOUNT_ALERT_DETAILS_FORMAT %@" value:&stru_2CC10 table:@"Main"];
      id v14 = [*(id *)(a1 + 48) username];
      id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v14);
      uint64_t v4 = +[UIAlertController alertControllerWithTitle:v11 message:v15 preferredStyle:1];

      double v16 = +[NSBundle bundleForClass:objc_opt_class()];
      double v17 = [v16 localizedStringForKey:@"CANCEL_ALERT_BUTTON" value:&stru_2CC10 table:@"Main"];
      v18 = +[UIAlertAction actionWithTitle:v17 style:1 handler:0];

      [v4 addAction:v18];
      [WeakRetained presentViewController:v4 animated:1 completion:0];
    }
    else
    {
      v19 = MFLogGeneral();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "#Nano Google authentication succeeded.", buf, 2u);
      }

      uint64_t v4 = objc_alloc_init(off_34270());
      id v20 = [*(id *)(a1 + 32) username];
      [v4 setUsername:v20];

      v21 = [*(id *)(a1 + 32) displayName];
      [v4 setDisplayName:v21];

      v22 = [*(id *)(a1 + 32) token];
      [v4 setToken:v22];

      double v23 = [*(id *)(a1 + 32) refreshToken];
      [v4 setRefreshToken:v23];

      [v4 setIdentityType:1];
      double v24 = [*(id *)(a1 + 48) localId];
      [v4 setAccountId:v24];

      double v25 = [WeakRetained datasource];
      [v25 syncStandaloneAccountIdentity:v4];

      id v26 = [*(id *)(a1 + 48) nmcuiAccount];
      double v27 = [WeakRetained cloudNotificationDatasource];
      unsigned int v28 = [v27 shouldPromptToEnableNotifications:v26];

      if (v28)
      {
        id v29 = objc_alloc((Class)NMCUICloudNotificationOnboardingViewController);
        v30 = [WeakRetained cloudNotificationDatasource];
        id v31 = [v29 initWithAccount:v26 dataSource:v30 completion:0];

        [WeakRetained presentViewController:v31 animated:1 completion:0];
      }
    }
  }
  else
  {
    uint64_t v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "#Nano Google authentication failed. %{public}@", buf, 0xCu);
    }
  }

  double v32 = [WeakRetained datasource];
  [v32 refreshAccounts];

  CGFloat v33 = [WeakRetained tableView];
  [v33 reloadData];
}

void sub_AF88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_B2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

Class sub_B420()
{
  if (qword_34740 != -1) {
    dispatch_once(&qword_34740, &stru_2C920);
  }
  Class result = objc_getClass("NNMKAccountIdentity");
  qword_34730 = (uint64_t)result;
  off_34270 = (uint64_t (*)())sub_B484;
  return result;
}

id sub_B484()
{
  return (id)qword_34730;
}

void sub_B490(id a1)
{
  qword_34738 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/NanoMailKitServer.framework/NanoMailKitServer", 2);
  if (!qword_34738) {
    NSLog(@"### Failed to Soft Linked: /System/Library/PrivateFrameworks/NanoMailKitServer.framework/NanoMailKitServer");
  }
}

void sub_B7A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B8C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_B960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_BA34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_BB24(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_BC14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_BD04(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_BDF4(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_BEC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_C188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C2E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_C4AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C5D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C710(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_C9B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_CA60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_CAD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_CBD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_CC2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_D168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_DAE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_DE9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_E4D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_E998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F3A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a47, 8);

  _Unwind_Resume(a1);
}

void sub_F5B4(void *a1)
{
  if ((uint64_t)--*(void *)(*(void *)(a1[6] + 8) + 24) >= 1)
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
    id v1 = (void *)a1[4];
    id v3 = +[NSBundle bundleForClass:objc_opt_class()];
    id v2 = [v3 localizedStringForKey:@"ALERTS_LAST_SEPARATOR" value:&stru_2CC10 table:@"Main"];
    [v1 appendString:v2];
  }
}

void sub_F688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_F790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F89C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F9A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FAB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FBDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FE58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FF30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_FFD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_101DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_102DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10354(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_103DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1044C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_104C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1065C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1070C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1079C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10B10(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_10CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10E30(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10FA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1104C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_111EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1128C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_114B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_11724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_11814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_11A98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_11C1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_11D10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_11D7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_11E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_11F90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_12010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_120FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1218C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_12208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_122DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_12350(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_125C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_12698()
{
  if (qword_34758 != -1) {
    dispatch_once(&qword_34758, &stru_2C970);
  }
  v0 = (uint64_t (*)())dlsym((void *)qword_34750, "BPSBridgeTintColor");
  off_34518 = v0;

  return v0();
}

void sub_12700(id a1)
{
  qword_34750 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/BridgePreferences.framework/BridgePreferences", 2);
  if (!qword_34750) {
    NSLog(@"### Failed to Soft Linked: /System/Library/PrivateFrameworks/BridgePreferences.framework/BridgePreferences");
  }
}

void sub_1288C(_Unwind_Exception *a1)
{
  id v7 = v5;

  _Unwind_Resume(a1);
}

void sub_12A28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_12AE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_12C04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_12D00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_13020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_131A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_13294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_13708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_13AA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_13AF0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadData];
}

void sub_13B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_13BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_13FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1430C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_14490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1451C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_145D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_147B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_149DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_14D7C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_14E20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_151E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15278(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15400(id a1)
{
  id v1 = objc_alloc_init(MFNanoBridgeSettingsManager);
  id v2 = (void *)qword_34760;
  qword_34760 = (uint64_t)v1;
}

void sub_155AC(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_156C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  long long v10 = v9;

  a9.super_class = (Class)MFNanoBridgeSettingsManager;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_15924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_15C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_15D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_15E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1602C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_160CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_16478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1670C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_16774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_169D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_16F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1702C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_170E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_172EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17400(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_174CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_176EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_177BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1784C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_178E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_17984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_17A20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_17ABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_17B58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_17BEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_17C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_17D0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_17DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_17E3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17EA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17F0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17F90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1800C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_180A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_184A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_185B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1888C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_18ACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class sub_18B0C()
{
  if (qword_347E0 != -1) {
    dispatch_once(&qword_347E0, &stru_2C9F8);
  }
  Class result = objc_getClass("NPSManager");
  qword_347D0 = (uint64_t)result;
  off_345E0 = (uint64_t (*)())sub_18B70;
  return result;
}

id sub_18B70()
{
  return (id)qword_347D0;
}

void sub_18B7C(id a1)
{
  qword_347D8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/NanoPreferencesSync.framework/NanoPreferencesSync", 2);
  if (!qword_347D8) {
    NSLog(@"### Failed to Soft Linked: /System/Library/PrivateFrameworks/NanoPreferencesSync.framework/NanoPreferencesSync");
  }
}

Class sub_18BB8()
{
  if (qword_347F8 != -1) {
    dispatch_once(&qword_347F8, &stru_2CA18);
  }
  Class result = objc_getClass("NNMKAccountIdentity");
  qword_347E8 = (uint64_t)result;
  off_345E8 = (uint64_t (*)())sub_18C1C;
  return result;
}

id sub_18C1C()
{
  return (id)qword_347E8;
}

void sub_18C28(id a1)
{
  qword_347F0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/NanoMailKitServer.framework/NanoMailKitServer", 2);
  if (!qword_347F0) {
    NSLog(@"### Failed to Soft Linked: /System/Library/PrivateFrameworks/NanoMailKitServer.framework/NanoMailKitServer");
  }
}

id sub_18C64()
{
  if (qword_347F8 != -1) {
    dispatch_once(&qword_347F8, &stru_2CA18);
  }
  v0 = (id *)dlsym((void *)qword_347F0, "NanoMailLinesOfPreviewKey");
  objc_storeStrong((id *)&qword_34790, *v0);
  off_345F0 = (uint64_t (*)())sub_18CF8;
  id v1 = (void *)qword_34790;

  return v1;
}

id sub_18CF8()
{
  return (id)qword_34790;
}

uint64_t sub_18D04()
{
  if (qword_347F8 != -1) {
    dispatch_once(&qword_347F8, &stru_2CA18);
  }
  uint64_t result = *(void *)dlsym((void *)qword_347F0, "NanoMailDefaultLinesOfPreview");
  qword_34800 = result;
  off_345F8 = sub_18D74;
  return result;
}

uint64_t sub_18D74()
{
  return qword_34800;
}

id sub_18D80()
{
  if (qword_347F8 != -1) {
    dispatch_once(&qword_347F8, &stru_2CA18);
  }
  v0 = (id *)dlsym((void *)qword_347F0, "NanoMailAskBeforeDeletingKey");
  objc_storeStrong((id *)&qword_34798, *v0);
  off_34600 = (uint64_t (*)())sub_18E14;
  id v1 = (void *)qword_34798;

  return v1;
}

id sub_18E14()
{
  return (id)qword_34798;
}

uint64_t sub_18E20()
{
  if (qword_347F8 != -1) {
    dispatch_once(&qword_347F8, &stru_2CA18);
  }
  uint64_t result = *(unsigned __int8 *)dlsym((void *)qword_347F0, "NanoMailDefaultAskBeforeDeleting");
  byte_34808 = result;
  off_34608 = sub_18E90;
  return result;
}

uint64_t sub_18E90()
{
  return byte_34808;
}

id sub_18E9C()
{
  if (qword_347F8 != -1) {
    dispatch_once(&qword_347F8, &stru_2CA18);
  }
  v0 = (id *)dlsym((void *)qword_347F0, "NanoMailLoadRemoteImagesKey");
  objc_storeStrong((id *)&qword_347A0, *v0);
  off_34610 = (uint64_t (*)())sub_18F30;
  id v1 = (void *)qword_347A0;

  return v1;
}

id sub_18F30()
{
  return (id)qword_347A0;
}

uint64_t sub_18F3C()
{
  if (qword_347F8 != -1) {
    dispatch_once(&qword_347F8, &stru_2CA18);
  }
  uint64_t result = *(unsigned __int8 *)dlsym((void *)qword_347F0, "NanoMailDefaultLoadRemoteImages");
  byte_34809 = result;
  off_34618 = sub_18FAC;
  return result;
}

uint64_t sub_18FAC()
{
  return byte_34809;
}

id sub_18FB8()
{
  if (qword_347F8 != -1) {
    dispatch_once(&qword_347F8, &stru_2CA18);
  }
  v0 = (id *)dlsym((void *)qword_347F0, "NanoMailOrganizeByThreadKey");
  objc_storeStrong((id *)&qword_34770, *v0);
  off_34620 = (uint64_t (*)())sub_1904C;
  id v1 = (void *)qword_34770;

  return v1;
}

id sub_1904C()
{
  return (id)qword_34770;
}

uint64_t sub_19058()
{
  if (qword_347F8 != -1) {
    dispatch_once(&qword_347F8, &stru_2CA18);
  }
  uint64_t result = *(unsigned __int8 *)dlsym((void *)qword_347F0, "NanoMailDefaultOrganizeByThread");
  byte_3480A = result;
  off_34628 = sub_190C8;
  return result;
}

uint64_t sub_190C8()
{
  return byte_3480A;
}

id sub_190D4()
{
  if (qword_347F8 != -1) {
    dispatch_once(&qword_347F8, &stru_2CA18);
  }
  v0 = (id *)dlsym((void *)qword_347F0, "NanoMailSwipeRightActionKey");
  objc_storeStrong((id *)&qword_34778, *v0);
  off_34630 = (uint64_t (*)())sub_19168;
  id v1 = (void *)qword_34778;

  return v1;
}

id sub_19168()
{
  return (id)qword_34778;
}

id sub_19174()
{
  if (qword_347F8 != -1) {
    dispatch_once(&qword_347F8, &stru_2CA18);
  }
  v0 = (id *)dlsym((void *)qword_347F0, "NanoMailDefaultSwipeRightAction");
  objc_storeStrong((id *)&qword_347C0, *v0);
  off_34638 = (uint64_t (*)())sub_19208;
  id v1 = (void *)qword_347C0;

  return v1;
}

id sub_19208()
{
  return (id)qword_347C0;
}

id sub_19214()
{
  if (qword_347F8 != -1) {
    dispatch_once(&qword_347F8, &stru_2CA18);
  }
  v0 = (id *)dlsym((void *)qword_347F0, "NanoMailSignatureKey");
  objc_storeStrong((id *)&qword_34780, *v0);
  off_34640 = (uint64_t (*)())sub_192A8;
  id v1 = (void *)qword_34780;

  return v1;
}

id sub_192A8()
{
  return (id)qword_34780;
}

Class sub_192B4()
{
  if (qword_347F8 != -1) {
    dispatch_once(&qword_347F8, &stru_2CA18);
  }
  Class result = objc_getClass("NNMKSyncProvider");
  qword_34810 = (uint64_t)result;
  off_34648 = (uint64_t (*)())sub_19318;
  return result;
}

id sub_19318()
{
  return (id)qword_34810;
}

id sub_19324()
{
  if (qword_347F8 != -1) {
    dispatch_once(&qword_347F8, &stru_2CA18);
  }
  v0 = (id *)dlsym((void *)qword_347F0, "NanoMailDefaultSignatureLocalizationKey");
  objc_storeStrong((id *)&qword_347C8, *v0);
  off_34650 = (uint64_t (*)())sub_193B8;
  id v1 = (void *)qword_347C8;

  return v1;
}

id sub_193B8()
{
  return (id)qword_347C8;
}

id sub_193C4()
{
  if (qword_347F8 != -1) {
    dispatch_once(&qword_347F8, &stru_2CA18);
  }
  v0 = (id *)dlsym((void *)qword_347F0, "NanoMailAlwaysLoadContentDirectlyKey");
  objc_storeStrong((id *)&qword_347B0, *v0);
  off_34658 = (uint64_t (*)())sub_19458;
  id v1 = (void *)qword_347B0;

  return v1;
}

id sub_19458()
{
  return (id)qword_347B0;
}

uint64_t sub_19464()
{
  if (qword_347F8 != -1) {
    dispatch_once(&qword_347F8, &stru_2CA18);
  }
  uint64_t result = *(unsigned __int8 *)dlsym((void *)qword_347F0, "NanoMailDefaultAlwaysLoadContentDirectly");
  byte_34818 = result;
  off_34660 = sub_194D4;
  return result;
}

uint64_t sub_194D4()
{
  return byte_34818;
}

id sub_194E0()
{
  if (qword_347F8 != -1) {
    dispatch_once(&qword_347F8, &stru_2CA18);
  }
  v0 = (id *)dlsym((void *)qword_347F0, "NanoMailCloudNotificationsEnabledKey");
  objc_storeStrong((id *)&qword_347B8, *v0);
  off_34668 = (uint64_t (*)())sub_19574;
  id v1 = (void *)qword_347B8;

  return v1;
}

id sub_19574()
{
  return (id)qword_347B8;
}

uint64_t sub_19580()
{
  if (qword_347F8 != -1) {
    dispatch_once(&qword_347F8, &stru_2CA18);
  }
  uint64_t result = *(unsigned __int8 *)dlsym((void *)qword_347F0, "NanoMailDefaultCloudNotificationsEnabled");
  byte_34819 = result;
  off_34670 = sub_195F0;
  return result;
}

uint64_t sub_195F0()
{
  return byte_34819;
}

id sub_195FC()
{
  if (qword_347F8 != -1) {
    dispatch_once(&qword_347F8, &stru_2CA18);
  }
  v0 = (id *)dlsym((void *)qword_347F0, "NanoMailPrivacyProtectionKey");
  objc_storeStrong((id *)&qword_347A8, *v0);
  off_34678 = (uint64_t (*)())sub_19690;
  id v1 = (void *)qword_347A8;

  return v1;
}

id sub_19690()
{
  return (id)qword_347A8;
}

id sub_1969C()
{
  if (qword_347F8 != -1) {
    dispatch_once(&qword_347F8, &stru_2CA18);
  }
  v0 = (id *)dlsym((void *)qword_347F0, "NanoMailDefaultAccountUidKey");
  objc_storeStrong((id *)&qword_34788, *v0);
  off_34680 = (uint64_t (*)())sub_19730;
  id v1 = (void *)qword_34788;

  return v1;
}

id sub_19730()
{
  return (id)qword_34788;
}

Class sub_1973C()
{
  if (qword_347E0 != -1) {
    dispatch_once(&qword_347E0, &stru_2C9F8);
  }
  Class result = objc_getClass("NPSDomainAccessor");
  qword_34820 = (uint64_t)result;
  off_34688 = (uint64_t (*)())sub_197A0;
  return result;
}

id sub_197A0()
{
  return (id)qword_34820;
}

void sub_198C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19A20(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_19ABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19CA8(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_19D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NMCUIAccount *__cdecl sub_19D3C(id a1, NNMKAccount *a2)
{
  id v2 = [(NNMKAccount *)a2 nmcuiAccount];

  return (NMCUIAccount *)v2;
}

void sub_19DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19F00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _ConfigurePSSpecifier(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  id v28 = a1;
  id v27 = a11;
  id v26 = a12;
  id v25 = a13;
  v18 = +[PSSpecifier preferenceSpecifierNamed:a2 target:a3 set:a4 get:a5 detail:a8 cell:a9 edit:a10];
  [v18 setKeyboardType:a6 autoCaps:a7 autoCorrection:0];
  v19 = [v27 objectForKey:@"titles"];
  id v20 = v19;
  if (v19 && (id v21 = [v19 count], v21 == objc_msgSend(v25, "count")))
  {
    [v18 setValues:v25 titles:v20];
    [v27 removeObjectForKey:@"titles"];
  }
  else
  {
    [v18 setValues:v25];
  }
  if (v26) {
    [v18 setProperty:v26 forKey:PSKeyNameKey];
  }
  [v18 setUserInfo:v27];
  if (v28) {
    [v28 addObject:v18];
  }

  return v18;
}

void sub_1A164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

id _ConfigureBooleanPSSpecifier(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  id v23 = a1;
  id v18 = a11;
  id v19 = a12;
  id v20 = +[PSSpecifier preferenceSpecifierNamed:a2 target:a3 set:a4 get:a5 detail:a8 cell:a9 edit:a10];
  [v20 setKeyboardType:a6 autoCaps:a7 autoCorrection:0];
  if (v19) {
    [v20 setProperty:v19 forKey:PSKeyNameKey];
  }
  [v20 setUserInfo:v18];
  if (v23) {
    [v23 addObject:v20];
  }

  return v20;
}

void sub_1A2C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1A3FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getMailPreferenceValueWithDefault(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = +[NSUserDefaults em_userDefaults];
  id v6 = [v5 valueForKey:v3];

  if (!v6) {
    id v6 = v4;
  }

  return v6;
}

void sub_1A4AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getEmailPreferenceValue(void *a1)
{
  id v1 = a1;
  id v2 = +[NSUserDefaults em_userDefaults];
  id v3 = [v2 valueForKey:v1];

  return v3;
}

void sub_1A538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getEmailPreferenceBoolValue(void *a1)
{
  id v1 = a1;
  id v2 = +[NSUserDefaults em_userDefaults];
  id v3 = [v2 BOOLForKey:v1];

  return v3;
}

void sub_1A5AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void setEmailPreferenceValue(void *a1, void *a2)
{
  id v5 = a1;
  id v3 = a2;
  id v4 = +[NSUserDefaults em_userDefaults];
  [v4 setObject:v3 forKey:v5];
  if (([v4 synchronize] & 1) == 0) {
    NSLog(@"Failed to synchronize");
  }
  CFPreferencesAppSynchronize(EMUserDefaultsMailAppGroup);
}

void sub_1A66C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void setEmailPreferenceBoolValue(void *a1, uint64_t a2)
{
  id v4 = a1;
  id v3 = +[NSNumber numberWithBool:a2];
  setEmailPreferenceValue(v4, v3);
}

void sub_1A6FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id getMailPreferenceValue(void *a1)
{
  id v1 = getMailPreferenceValueWithDefault(a1, 0);

  return v1;
}

id getMailBoolPreferenceValueWithDefault(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = +[NSNumber numberWithBool:a2];
  id v5 = getMailPreferenceValueWithDefault(v3, v4);

  id v6 = [v5 BOOLValue];
  return v6;
}

void sub_1A7C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getMailBoolPreferenceValue(void *a1)
{
  id v1 = getMailPreferenceValueWithDefault(a1, 0);
  id v2 = [v1 BOOLValue];

  return v2;
}

void sub_1A82C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL showToCCIndicators(int a1)
{
  unsigned int MailBoolPreferenceValue = dword_346F0;
  if (dword_346F0 < 0 || a1)
  {
    unsigned int MailBoolPreferenceValue = getMailBoolPreferenceValue(@"ShowToCCIndicators");
    dword_346F0 = MailBoolPreferenceValue;
  }
  return MailBoolPreferenceValue != 0;
}

BOOL conversationViewShowsNewestAtTop(int a1)
{
  unsigned int MailBoolPreferenceValue = dword_346F4;
  if (dword_346F4 < 0 || a1)
  {
    unsigned int MailBoolPreferenceValue = getMailBoolPreferenceValue(@"ConversationViewShowsNewestAtTop");
    dword_346F4 = MailBoolPreferenceValue;
  }
  return MailBoolPreferenceValue != 0;
}

BOOL conversationViewIncludesRelatedMessages(int a1)
{
  unsigned int v1 = dword_346F8;
  if (dword_346F8 < 0 || a1)
  {
    unsigned int v1 = getMailBoolPreferenceValue(@"ConversationViewExcludesRelatedMessages") ^ 1;
    dword_346F8 = v1;
  }
  return v1 != 0;
}

BOOL collapseReadConversationMessages(int a1)
{
  unsigned int MailBoolPreferenceValueWithDefault = dword_346FC;
  if (dword_346FC < 0 || a1)
  {
    unsigned int MailBoolPreferenceValueWithDefault = getMailBoolPreferenceValueWithDefault(@"CollapseReadConversationMessages", 1);
    dword_346FC = MailBoolPreferenceValueWithDefault;
  }
  return MailBoolPreferenceValueWithDefault != 0;
}

id includeAttachmentsWithReplies(int a1)
{
  id v2 = (void *)qword_34828;
  if (qword_34828) {
    BOOL v3 = a1 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (!v3)
  {
    id v4 = getMailPreferenceValueWithDefault(@"IncludeAttachmentReplies", @"IncludeAttachmentRepliesWhenAdding");
    id v5 = [v4 copy];
    id v6 = (void *)qword_34828;
    qword_34828 = (uint64_t)v5;

    id v2 = (void *)qword_34828;
  }

  return v2;
}

void sub_1A9F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL mutedThreadsMoveToArchive(int a1)
{
  int v1 = dword_34700;
  if (dword_34700 < 0 || a1)
  {
    id v2 = getMailPreferenceValueWithDefault(EMUserDefaultMutedThreadActionKey, EMUserDefaultMutedThreadActionMarkAsRead);
    dword_34700 = [EMUserDefaultMutedThreadActionMoveToArchiveOrDelete isEqual:v2];

    int v1 = dword_34700;
  }
  return v1 != 0;
}

void sub_1AA78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id rightSwipeSetting(int a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_34838);
  id v2 = (id)qword_34830;
  BOOL v3 = v2;
  if (v2) {
    BOOL v4 = a1 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    id v5 = v2;
  }
  else
  {
    id v5 = getMailPreferenceValueWithDefault(@"LeftEdgeSwipeAction", @"SwipeActionRead");

    if ((void *)qword_34830 != v5) {
      objc_storeStrong((id *)&qword_34830, v5);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_34838);

  return v5;
}

void sub_1AB44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id leftSwipeSetting(int a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_34848);
  id v2 = (id)qword_34840;
  BOOL v3 = v2;
  if (v2) {
    BOOL v4 = a1 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    id v5 = v2;
  }
  else
  {
    id v5 = getMailPreferenceValueWithDefault(@"RightEdgeSwipeAction", @"SwipeActionFlag");

    if ((void *)qword_34840 != v5) {
      objc_storeStrong((id *)&qword_34840, v5);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_34848);

  return v5;
}

void sub_1AC10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id preferencesBundle()
{
  v0 = (void *)qword_34850;
  if (!qword_34850)
  {
    int v1 = UISystemRootDirectory();
    id v2 = [v1 stringByAppendingPathComponent:@"System/Library/PreferenceBundles/MobileMailSettings"];
    BOOL v3 = [v2 stringByAppendingPathExtension:@"bundle"];
    uint64_t v4 = +[NSBundle bundleWithPath:v3];
    id v5 = (void *)qword_34850;
    qword_34850 = v4;

    v0 = (void *)qword_34850;
  }

  return v0;
}

void sub_1ACD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double MailTableCellTextLeftForLevel(uint64_t a1)
{
  id v2 = [UIApp preferredContentSizeCategory];
  IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v2);

  double result = 55.0;
  if (IsAccessibilityCategory) {
    double result = 16.0;
  }
  if (a1 >= 1)
  {
    double result = result + 31.0;
    if (a1 != 1) {
      return result + (float)((float)(a1 - 1) * 30.0);
    }
  }
  return result;
}

void sub_1AD80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double MailTableCellImageCenterForLevel(uint64_t a1)
{
  double v2 = MailTableCellTextLeftForLevel(a1);
  double v3 = 32.0;
  if (a1) {
    double v3 = 23.0;
  }
  return v2 + -9.5 + v3 * -0.5;
}

void sub_1ADD8(uint64_t a1, char a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a2 & 1;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "#Nano Attempt to recover mailboxUid for MFNanoBridgeSettingsAccountSpecificMailbox failed. (Id: %{public}@, Active: %lu)", buf, 0x16u);
}

void sub_1AE34(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "#Nano Attempt to recover mailboxUid for MFNanoBridgeSettingsAccountSpecificMailbox failed. Account did not return valid mailboxUid for mailboxURL: %@", (uint8_t *)&v3, 0xCu);
}

void sub_1AEB0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "#Nano Unable to decode signature: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1AF28(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "#Nano Posting NotificationCenter Notification Bridge Setting has Changed for key: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t BPSCellHightlightColor()
{
  return _BPSCellHightlightColor();
}

uint64_t BPSDetailTextColor()
{
  return _BPSDetailTextColor();
}

uint64_t BPSDeviceHasCapabilityForString()
{
  return _BPSDeviceHasCapabilityForString();
}

uint64_t BPSTextColor()
{
  return _BPSTextColor();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

uint64_t MFDeviceSupportsNanoCompanion()
{
  return _MFDeviceSupportsNanoCompanion();
}

uint64_t MFLogGeneral()
{
  return _MFLogGeneral();
}

uint64_t MFLookupLocalizedString()
{
  return _MFLookupLocalizedString();
}

uint64_t MFUserAgent()
{
  return _MFUserAgent();
}

uint64_t NRWatchOSVersionForRemoteDevice()
{
  return _NRWatchOSVersionForRemoteDevice();
}

void NSLog(NSString *format, ...)
{
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

uint64_t UIRoundToViewScale()
{
  return _UIRoundToViewScale();
}

uint64_t UISystemRootDirectory()
{
  return _UISystemRootDirectory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_URLString(void *a1, const char *a2, ...)
{
  return [a1 URLString];
}

id objc_msgSend__accountNamesKeyedByAccountId(void *a1, const char *a2, ...)
{
  return [a1 _accountNamesKeyedByAccountId];
}

id objc_msgSend__bodyLeading(void *a1, const char *a2, ...)
{
  return [a1 _bodyLeading];
}

id objc_msgSend__includeMailMailboxesFromDisk(void *a1, const char *a2, ...)
{
  return [a1 _includeMailMailboxesFromDisk];
}

id objc_msgSend__includesMeIconImage(void *a1, const char *a2, ...)
{
  return [a1 _includesMeIconImage];
}

id objc_msgSend__linesOfPreviewTitlesDictionary(void *a1, const char *a2, ...)
{
  return [a1 _linesOfPreviewTitlesDictionary];
}

id objc_msgSend__linesOfPreviewValues(void *a1, const char *a2, ...)
{
  return [a1 _linesOfPreviewValues];
}

id objc_msgSend__loadAccounts(void *a1, const char *a2, ...)
{
  return [a1 _loadAccounts];
}

id objc_msgSend__mailboxSelectionFromPreviousOSVersion(void *a1, const char *a2, ...)
{
  return [a1 _mailboxSelectionFromPreviousOSVersion];
}

id objc_msgSend__mailboxUid(void *a1, const char *a2, ...)
{
  return [a1 _mailboxUid];
}

id objc_msgSend__mirroringDetailPrivacyProtection(void *a1, const char *a2, ...)
{
  return [a1 _mirroringDetailPrivacyProtection];
}

id objc_msgSend__mirroringDetailStringForAlerts(void *a1, const char *a2, ...)
{
  return [a1 _mirroringDetailStringForAlerts];
}

id objc_msgSend__mirroringDetailStringForAskBeforeDeleting(void *a1, const char *a2, ...)
{
  return [a1 _mirroringDetailStringForAskBeforeDeleting];
}

id objc_msgSend__mirroringDetailStringForLoadRemoteImages(void *a1, const char *a2, ...)
{
  return [a1 _mirroringDetailStringForLoadRemoteImages];
}

id objc_msgSend__mirroringDetailStringForNotificationSources(void *a1, const char *a2, ...)
{
  return [a1 _mirroringDetailStringForNotificationSources];
}

id objc_msgSend__mirroringDetailStringForOrganizeByThread(void *a1, const char *a2, ...)
{
  return [a1 _mirroringDetailStringForOrganizeByThread];
}

id objc_msgSend__mobileMailAskBeforeDeleting(void *a1, const char *a2, ...)
{
  return [a1 _mobileMailAskBeforeDeleting];
}

id objc_msgSend__mobileMailDefaultAccountId(void *a1, const char *a2, ...)
{
  return [a1 _mobileMailDefaultAccountId];
}

id objc_msgSend__mobileMailLoadRemoteImages(void *a1, const char *a2, ...)
{
  return [a1 _mobileMailLoadRemoteImages];
}

id objc_msgSend__mobileMailOrganizeByThread(void *a1, const char *a2, ...)
{
  return [a1 _mobileMailOrganizeByThread];
}

id objc_msgSend__mobileMailSwipeRightAction(void *a1, const char *a2, ...)
{
  return [a1 _mobileMailSwipeRightAction];
}

id objc_msgSend__needsSetUp(void *a1, const char *a2, ...)
{
  return [a1 _needsSetUp];
}

id objc_msgSend__notifyDelegateThatSelectedMailboxesChanged(void *a1, const char *a2, ...)
{
  return [a1 _notifyDelegateThatSelectedMailboxesChanged];
}

id objc_msgSend__pairedNanoRegistryDevice(void *a1, const char *a2, ...)
{
  return [a1 _pairedNanoRegistryDevice];
}

id objc_msgSend__recreateMailboxes(void *a1, const char *a2, ...)
{
  return [a1 _recreateMailboxes];
}

id objc_msgSend__shouldReverseLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 _shouldReverseLayoutDirection];
}

id objc_msgSend__subtitleFont(void *a1, const char *a2, ...)
{
  return [a1 _subtitleFont];
}

id objc_msgSend__titleFont(void *a1, const char *a2, ...)
{
  return [a1 _titleFont];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountCellBadgeCount(void *a1, const char *a2, ...)
{
  return [a1 accountCellBadgeCount];
}

id objc_msgSend_accountDataSource(void *a1, const char *a2, ...)
{
  return [a1 accountDataSource];
}

id objc_msgSend_accountIdentities(void *a1, const char *a2, ...)
{
  return [a1 accountIdentities];
}

id objc_msgSend_accountRepository(void *a1, const char *a2, ...)
{
  return [a1 accountRepository];
}

id objc_msgSend_accountUniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountUniqueIdentifier];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_activeAccounts(void *a1, const char *a2, ...)
{
  return [a1 activeAccounts];
}

id objc_msgSend_addAccountURL(void *a1, const char *a2, ...)
{
  return [a1 addAccountURL];
}

id objc_msgSend_aggregatedMailboxesFilterTypes(void *a1, const char *a2, ...)
{
  return [a1 aggregatedMailboxesFilterTypes];
}

id objc_msgSend_allMailboxUids(void *a1, const char *a2, ...)
{
  return [a1 allMailboxUids];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_alwaysLoadContentDirectly(void *a1, const char *a2, ...)
{
  return [a1 alwaysLoadContentDirectly];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return [a1 ascender];
}

id objc_msgSend_askBeforeDeleting(void *a1, const char *a2, ...)
{
  return [a1 askBeforeDeleting];
}

id objc_msgSend_autoupdatingCurrentLocale(void *a1, const char *a2, ...)
{
  return [a1 autoupdatingCurrentLocale];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return [a1 capHeight];
}

id objc_msgSend_childEnumerator(void *a1, const char *a2, ...)
{
  return [a1 childEnumerator];
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return [a1 children];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_cloudNotificationDatasource(void *a1, const char *a2, ...)
{
  return [a1 cloudNotificationDatasource];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_daemonInterface(void *a1, const char *a2, ...)
{
  return [a1 daemonInterface];
}

id objc_msgSend_datasource(void *a1, const char *a2, ...)
{
  return [a1 datasource];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultEmailAddress(void *a1, const char *a2, ...)
{
  return [a1 defaultEmailAddress];
}

id objc_msgSend_defaultMailAccountForDelivery(void *a1, const char *a2, ...)
{
  return [a1 defaultMailAccountForDelivery];
}

id objc_msgSend_defaultMetrics(void *a1, const char *a2, ...)
{
  return [a1 defaultMetrics];
}

id objc_msgSend_defaultSelectedMailboxes(void *a1, const char *a2, ...)
{
  return [a1 defaultSelectedMailboxes];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_displayNameUsingSpecialNames(void *a1, const char *a2, ...)
{
  return [a1 displayNameUsingSpecialNames];
}

id objc_msgSend_displayedAccountTypeString(void *a1, const char *a2, ...)
{
  return [a1 displayedAccountTypeString];
}

id objc_msgSend_domainAccessor(void *a1, const char *a2, ...)
{
  return [a1 domainAccessor];
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return [a1 emailAddresses];
}

id objc_msgSend_emailAddressesAndAliasesList(void *a1, const char *a2, ...)
{
  return [a1 emailAddressesAndAliasesList];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_future(void *a1, const char *a2, ...)
{
  return [a1 future];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_getDevices(void *a1, const char *a2, ...)
{
  return [a1 getDevices];
}

id objc_msgSend_hasChildren(void *a1, const char *a2, ...)
{
  return [a1 hasChildren];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_htmlSignature(void *a1, const char *a2, ...)
{
  return [a1 htmlSignature];
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return [a1 icon];
}

id objc_msgSend_iconString(void *a1, const char *a2, ...)
{
  return [a1 iconString];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_includeMailMailboxes(void *a1, const char *a2, ...)
{
  return [a1 includeMailMailboxes];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidateCachedData(void *a1, const char *a2, ...)
{
  return [a1 invalidateCachedData];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isMaild(void *a1, const char *a2, ...)
{
  return [a1 isMaild];
}

id objc_msgSend_isSyncingNotes(void *a1, const char *a2, ...)
{
  return [a1 isSyncingNotes];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return [a1 item];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return [a1 level];
}

id objc_msgSend_linesOfPreview(void *a1, const char *a2, ...)
{
  return [a1 linesOfPreview];
}

id objc_msgSend_loadRemoteImages(void *a1, const char *a2, ...)
{
  return [a1 loadRemoteImages];
}

id objc_msgSend_localAccount(void *a1, const char *a2, ...)
{
  return [a1 localAccount];
}

id objc_msgSend_localId(void *a1, const char *a2, ...)
{
  return [a1 localId];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mailAccountCellTitleColor(void *a1, const char *a2, ...)
{
  return [a1 mailAccountCellTitleColor];
}

id objc_msgSend_mailbox(void *a1, const char *a2, ...)
{
  return [a1 mailbox];
}

id objc_msgSend_mailboxFilterType(void *a1, const char *a2, ...)
{
  return [a1 mailboxFilterType];
}

id objc_msgSend_mailboxId(void *a1, const char *a2, ...)
{
  return [a1 mailboxId];
}

id objc_msgSend_mailboxProvider(void *a1, const char *a2, ...)
{
  return [a1 mailboxProvider];
}

id objc_msgSend_mailboxRepository(void *a1, const char *a2, ...)
{
  return [a1 mailboxRepository];
}

id objc_msgSend_mailboxType(void *a1, const char *a2, ...)
{
  return [a1 mailboxType];
}

id objc_msgSend_mailboxURL(void *a1, const char *a2, ...)
{
  return [a1 mailboxURL];
}

id objc_msgSend_mailboxesWithAllMessagesSyncEnabledIds(void *a1, const char *a2, ...)
{
  return [a1 mailboxesWithAllMessagesSyncEnabledIds];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mainThreadScheduler(void *a1, const char *a2, ...)
{
  return [a1 mainThreadScheduler];
}

id objc_msgSend_mirrorSettingsFromCompanion(void *a1, const char *a2, ...)
{
  return [a1 mirrorSettingsFromCompanion];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 newlineCharacterSet];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_nmcuiAccount(void *a1, const char *a2, ...)
{
  return [a1 nmcuiAccount];
}

id objc_msgSend_nnmkAccount(void *a1, const char *a2, ...)
{
  return [a1 nnmkAccount];
}

id objc_msgSend_notifyMirrorSettingsFromCompanionChanged(void *a1, const char *a2, ...)
{
  return [a1 notifyMirrorSettingsFromCompanionChanged];
}

id objc_msgSend_notifyMobileMailAskBeforeDeletingChanged(void *a1, const char *a2, ...)
{
  return [a1 notifyMobileMailAskBeforeDeletingChanged];
}

id objc_msgSend_notifyMobileMailLoadRemoteImagesChanged(void *a1, const char *a2, ...)
{
  return [a1 notifyMobileMailLoadRemoteImagesChanged];
}

id objc_msgSend_notifyMobileMailOrganizeByThreadChanged(void *a1, const char *a2, ...)
{
  return [a1 notifyMobileMailOrganizeByThreadChanged];
}

id objc_msgSend_notifyMobileMailPrivacyProtectionChanged(void *a1, const char *a2, ...)
{
  return [a1 notifyMobileMailPrivacyProtectionChanged];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return [a1 observers];
}

id objc_msgSend_organizeByThread(void *a1, const char *a2, ...)
{
  return [a1 organizeByThread];
}

id objc_msgSend_outboxMailboxUid(void *a1, const char *a2, ...)
{
  return [a1 outboxMailboxUid];
}

id objc_msgSend_outgoingMessageRepository(void *a1, const char *a2, ...)
{
  return [a1 outgoingMessageRepository];
}

id objc_msgSend_pairedDeviceSupportsStandaloneService(void *a1, const char *a2, ...)
{
  return [a1 pairedDeviceSupportsStandaloneService];
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return [a1 parent];
}

id objc_msgSend_parentController(void *a1, const char *a2, ...)
{
  return [a1 parentController];
}

id objc_msgSend_parentMailbox(void *a1, const char *a2, ...)
{
  return [a1 parentMailbox];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return [a1 pointSize];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_primaryMailboxUid(void *a1, const char *a2, ...)
{
  return [a1 primaryMailboxUid];
}

id objc_msgSend_privacyProtectionEnabled(void *a1, const char *a2, ...)
{
  return [a1 privacyProtectionEnabled];
}

id objc_msgSend_promise(void *a1, const char *a2, ...)
{
  return [a1 promise];
}

id objc_msgSend_refreshAccounts(void *a1, const char *a2, ...)
{
  return [a1 refreshAccounts];
}

id objc_msgSend_refreshData(void *a1, const char *a2, ...)
{
  return [a1 refreshData];
}

id objc_msgSend_refreshToken(void *a1, const char *a2, ...)
{
  return [a1 refreshToken];
}

id objc_msgSend_reloadAccounts(void *a1, const char *a2, ...)
{
  return [a1 reloadAccounts];
}

id objc_msgSend_reloadCachedAccounts(void *a1, const char *a2, ...)
{
  return [a1 reloadCachedAccounts];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 reuseIdentifier];
}

id objc_msgSend_rootMailbox(void *a1, const char *a2, ...)
{
  return [a1 rootMailbox];
}

id objc_msgSend_rootMailboxNode(void *a1, const char *a2, ...)
{
  return [a1 rootMailboxNode];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_sectionInfo(void *a1, const char *a2, ...)
{
  return [a1 sectionInfo];
}

id objc_msgSend_setStroke(void *a1, const char *a2, ...)
{
  return [a1 setStroke];
}

id objc_msgSend_settingsMode(void *a1, const char *a2, ...)
{
  return [a1 settingsMode];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedInvocationQueue(void *a1, const char *a2, ...)
{
  return [a1 sharedInvocationQueue];
}

id objc_msgSend_sharedToneManager(void *a1, const char *a2, ...)
{
  return [a1 sharedToneManager];
}

id objc_msgSend_sharedVibrationManager(void *a1, const char *a2, ...)
{
  return [a1 sharedVibrationManager];
}

id objc_msgSend_shouldFilter(void *a1, const char *a2, ...)
{
  return [a1 shouldFilter];
}

id objc_msgSend_shouldHideInbox(void *a1, const char *a2, ...)
{
  return [a1 shouldHideInbox];
}

id objc_msgSend_showAlerts(void *a1, const char *a2, ...)
{
  return [a1 showAlerts];
}

id objc_msgSend_signature(void *a1, const char *a2, ...)
{
  return [a1 signature];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifierController(void *a1, const char *a2, ...)
{
  return [a1 specifierController];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_spinner(void *a1, const char *a2, ...)
{
  return [a1 spinner];
}

id objc_msgSend_standaloneAccountStateByAccountId(void *a1, const char *a2, ...)
{
  return [a1 standaloneAccountStateByAccountId];
}

id objc_msgSend_standaloneState(void *a1, const char *a2, ...)
{
  return [a1 standaloneState];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_statisticsKind(void *a1, const char *a2, ...)
{
  return [a1 statisticsKind];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return [a1 tag];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_textView(void *a1, const char *a2, ...)
{
  return [a1 textView];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateAccounts(void *a1, const char *a2, ...)
{
  return [a1 updateAccounts];
}

id objc_msgSend_updateSharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 updateSharedPreferences];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_warningLabel(void *a1, const char *a2, ...)
{
  return [a1 warningLabel];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_writeSectionState(void *a1, const char *a2, ...)
{
  return [a1 writeSectionState];
}