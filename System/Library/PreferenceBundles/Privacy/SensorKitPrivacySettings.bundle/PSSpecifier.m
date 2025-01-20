@interface PSSpecifier
+ (id)sk_appSpecifierForBundle:(id)a3 value:(id)a4 cellType:(int64_t)a5 target:(id)a6;
@end

@implementation PSSpecifier

+ (id)sk_appSpecifierForBundle:(id)a3 value:(id)a4 cellType:(int64_t)a5 target:(id)a6
{
  id v8 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend(a3, "sk_appName"), a6, 0, NSSelectorFromString(@"valueForSpecifier:"), 0, a5, 0);
  objc_msgSend(v8, "setUserInfo:", objc_msgSend(a3, "bundleIdentifier"));
  v9 = (char *)objc_msgSend(a3, "sr_bundleType");
  if (v9 == (unsigned char *)&dword_0 + 2)
  {
    id v15 = [a3 bundleIdentifier];
    [+[UIScreen mainScreen] scale];
    v14 = (UIImage *)+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v15, 0);
    goto LABEL_5;
  }
  v10 = 0;
  if (v9 == (unsigned char *)&dword_0 + 1)
  {
    id v11 = [a3 objectForInfoDictionaryKey:@"CFBundleIconFile"];
    id v12 = +[ISImageDescriptor imageDescriptorNamed:kISImageDescriptorTableUIName];
    v13 = +[UIImage imageNamed:v11 inBundle:a3 compatibleWithTraitCollection:0];
    [v12 size];
    v14 = -[UIImage imageByPreparingThumbnailOfSize:](v13, "imageByPreparingThumbnailOfSize:");
LABEL_5:
    v10 = v14;
  }
  [v8 setObject:v10 forKeyedSubscript:PSIconImageKey];
  [v8 setObject:a4 forKeyedSubscript:PSValueKey];
  return v8;
}

@end