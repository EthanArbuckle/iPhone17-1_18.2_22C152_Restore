@interface NSString(DALeastInfoURLExtension)
- (id)da_absoluteURLForChildLeastInfoRepresentationRelativeToParentURL:()DALeastInfoURLExtension;
@end

@implementation NSString(DALeastInfoURLExtension)

- (id)da_absoluteURLForChildLeastInfoRepresentationRelativeToParentURL:()DALeastInfoURLExtension
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CB10] URLWithString:a1 relativeToURL:v4];
  uint64_t v6 = [v4 user];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [v5 user];

    if (!v8)
    {
      v9 = [v4 user];
      uint64_t v10 = objc_msgSend(v5, "da_urlBySettingUsername:", v9);

      v5 = (void *)v10;
    }
  }
  v11 = [v5 absoluteURL];

  return v11;
}

@end