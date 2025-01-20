@interface MRDataCollectionNotice
+ (BOOL)shouldShowDataCollectionNoticeForComponent:(unint64_t)a3;
+ (void)didShowDataCollectionNoticeForComponent:(unint64_t)a3;
@end

@implementation MRDataCollectionNotice

+ (BOOL)shouldShowDataCollectionNoticeForComponent:(unint64_t)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v7 = objc_msgSend_initWithSuiteName_(v4, v5, @"com.apple.mobilerepaird", v6);
  v10 = v7;
  if (a3)
  {
    if (a3 == 10)
    {
      char v11 = objc_msgSend_BOOLForKey_(v7, v8, @"dataCollectionNoticePresentedForPartsAndService", v9);
    }
    else
    {
      if (a3 != 1)
      {
        char v12 = 0;
        goto LABEL_9;
      }
      char v11 = objc_msgSend_BOOLForKey_(v7, v8, @"dataCollectionNoticePresentedForDisplay", v9);
    }
  }
  else
  {
    char v11 = objc_msgSend_BOOLForKey_(v7, v8, @"dataCollectionNoticePresentedForBattery", v9);
  }
  char v12 = v11 ^ 1;
LABEL_9:

  return v12;
}

+ (void)didShowDataCollectionNoticeForComponent:(unint64_t)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v7 = objc_msgSend_initWithSuiteName_(v4, v5, @"com.apple.mobilerepaird", v6);
  if (a3)
  {
    if (a3 == 10)
    {
      uint64_t v9 = @"dataCollectionNoticePresentedForPartsAndService";
    }
    else
    {
      if (a3 != 1) {
        goto LABEL_8;
      }
      uint64_t v9 = @"dataCollectionNoticePresentedForDisplay";
    }
  }
  else
  {
    uint64_t v9 = @"dataCollectionNoticePresentedForBattery";
  }
  id v13 = v7;
  objc_msgSend_setBool_forKey_(v7, v8, 1, (uint64_t)v9);
  objc_msgSend_synchronize(v13, v10, v11, v12);
  v7 = v13;
LABEL_8:
}

@end