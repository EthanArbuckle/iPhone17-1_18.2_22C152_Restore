@interface NSURL(BRCShareURL)
- (__CFString)brc_applicationBundleID;
- (__CFString)brc_applicationContainerID;
- (id)brc_applicationName;
- (void)brc_iWorkPathExtensions;
@end

@implementation NSURL(BRCShareURL)

- (id)brc_applicationName
{
  v1 = [a1 path];
  v2 = [v1 pathComponents];

  if ((unint64_t)[v2 count] >= 2)
  {
    v4 = [v2 objectAtIndexedSubscript:1];
    v5 = [v4 stringByRemovingPercentEncoding];
    v6 = [v5 lowercaseString];

    if (([v6 isEqualToString:@"pages"] & 1) != 0
      || ([v6 isEqualToString:@"keynote"] & 1) != 0
      || [v6 isEqualToString:@"numbers"])
    {
      v3 = [v6 capitalizedString];
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (__CFString)brc_applicationBundleID
{
  v1 = objc_msgSend(a1, "brc_applicationName");
  v2 = [v1 lowercaseString];
  char v3 = [v2 isEqualToString:@"pages"];

  if (v3)
  {
    v4 = @"com.apple.Pages";
  }
  else
  {
    v5 = [v1 lowercaseString];
    char v6 = [v5 isEqualToString:@"keynote"];

    if (v6)
    {
      v4 = @"com.apple.Keynote";
    }
    else
    {
      v7 = [v1 lowercaseString];
      char v8 = [v7 isEqualToString:@"numbers"];

      if (v8) {
        v4 = @"com.apple.Numbers";
      }
      else {
        v4 = (__CFString *)(id)*MEMORY[0x1E4F59418];
      }
    }
  }

  return v4;
}

- (__CFString)brc_applicationContainerID
{
  v1 = objc_msgSend(a1, "brc_applicationName");
  v2 = [v1 lowercaseString];
  char v3 = [v2 isEqualToString:@"pages"];

  if (v3)
  {
    v4 = @"com.apple.Pages";
  }
  else
  {
    v5 = [v1 lowercaseString];
    char v6 = [v5 isEqualToString:@"keynote"];

    if (v6)
    {
      v4 = @"com.apple.Keynote";
    }
    else
    {
      v7 = [v1 lowercaseString];
      int v8 = [v7 isEqualToString:@"numbers"];

      if (v8) {
        v4 = @"com.apple.Numbers";
      }
      else {
        v4 = 0;
      }
    }
  }

  return v4;
}

- (void)brc_iWorkPathExtensions
{
  v1 = objc_msgSend(a1, "brc_applicationName");
  v2 = [v1 lowercaseString];
  char v3 = [v2 isEqualToString:@"pages"];

  if (v3)
  {
    v4 = &unk_1F2B277B0;
  }
  else
  {
    v5 = [v1 lowercaseString];
    char v6 = [v5 isEqualToString:@"keynote"];

    if (v6)
    {
      v4 = &unk_1F2B277C8;
    }
    else
    {
      v7 = [v1 lowercaseString];
      int v8 = [v7 isEqualToString:@"numbers"];

      if (v8) {
        v4 = &unk_1F2B277E0;
      }
      else {
        v4 = 0;
      }
    }
  }

  return v4;
}

@end