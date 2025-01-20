@interface IAUtility
+ (id)lookupAppBundle:(id)a3;
+ (unint64_t)getSPIVersion;
@end

@implementation IAUtility

+ (id)lookupAppBundle:(id)a3
{
  id v3 = a3;
  v6 = v3;
  if (qword_269C40268 == -1)
  {
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&qword_269C40268, &unk_2702E39A8);
    if (v6)
    {
LABEL_3:
      if (objc_msgSend_hasPrefix_(v6, v4, @"com.apple.", v5))
      {
        v9 = v6;
      }
      else
      {
        v10 = objc_msgSend_valueForKey_((void *)qword_269C40270, v7, (uint64_t)v6, v8);
        v11 = v10;
        if (v10) {
          v9 = v10;
        }
        else {
          v9 = @"Other";
        }
      }
      goto LABEL_11;
    }
  }
  v9 = @"nil";
LABEL_11:

  return v9;
}

+ (unint64_t)getSPIVersion
{
  return 13;
}

@end