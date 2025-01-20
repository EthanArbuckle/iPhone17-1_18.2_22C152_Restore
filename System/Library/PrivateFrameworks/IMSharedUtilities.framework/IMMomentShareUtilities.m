@interface IMMomentShareUtilities
+ (id)photoShareURLFromPluginBundleID:(id)a3 contentString:(id)a4 payload:(id)a5 shouldAccept:(BOOL *)a6;
@end

@implementation IMMomentShareUtilities

+ (id)photoShareURLFromPluginBundleID:(id)a3 contentString:(id)a4 payload:(id)a5 shouldAccept:(BOOL *)a6
{
  if ([a3 isEqualToString:@"com.apple.messages.URLBalloonProvider"])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v11 = [a4 length];
    uint64_t v12 = *MEMORY[0x1E4F6C1D0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_1A083F934;
    v17[3] = &unk_1E5A13900;
    v17[4] = v10;
    objc_msgSend(a4, "enumerateAttribute:inRange:options:usingBlock:", v12, 0, v11, 0, v17);
    if ((unint64_t)[v10 count] < 2)
    {
      v13 = (void *)[v10 firstObject];
      v14 = v13;
      if (v13 && !_IMShouldProcessURLForPhotosExtension(v13)) {
        v14 = 0;
      }
      if (v10) {

      }
      goto LABEL_10;
    }
    if (v10) {

    }
    return 0;
  }
  if (![a3 isEqualToString:IMBalloonExtensionIDWithSuffix(@"com.apple.mobileslideshow.PhotosMessagesApp")])return 0; {
  v14 = (void *)IMPhotosShareURLFromPayloadData((uint64_t)a5);
  }
LABEL_10:
  if (a6)
  {
    if (v14)
    {
      *a6 = 1;
      v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6B598], "sharedInstanceForBagType:", 1), "objectForKey:", @"md-disable-photo-share-auto-accept");
      if (v15)
      {
        if ([v15 BOOLValue]) {
          *a6 = 0;
        }
      }
    }
  }
  return v14;
}

@end