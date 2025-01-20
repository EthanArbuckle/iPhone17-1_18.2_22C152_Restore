@interface PSSpecifier(ACUIGroupSpecifier)
+ (id)groupSpecifierWithFooterLinkButton:()ACUIGroupSpecifier;
+ (id)groupSpecifierWithFooterText:()ACUIGroupSpecifier linkButton:;
+ (id)groupSpecifierWithFooterText:()ACUIGroupSpecifier linkButtons:;
+ (id)groupSpecifierWithHeader:()ACUIGroupSpecifier footer:;
+ (id)groupSpecifierWithHeader:()ACUIGroupSpecifier footer:linkButtons:;
@end

@implementation PSSpecifier(ACUIGroupSpecifier)

+ (id)groupSpecifierWithFooterLinkButton:()ACUIGroupSpecifier
{
  location[2] = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  id v8 = (id)[MEMORY[0x1E4F92E70] emptyGroupSpecifier];
  id v5 = v8;
  v3 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v3);
  objc_msgSend(v5, "setProperty:forKey:");

  [v8 setProperty:location[0] forKey:@"ACUILinkButtonHolder"];
  id v7 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v7;
}

+ (id)groupSpecifierWithFooterText:()ACUIGroupSpecifier linkButton:
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v12 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v7 = v12;
  id v6 = location[0];
  v13[0] = v10;
  id v8 = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v9 = (id)objc_msgSend(v7, "groupSpecifierWithHeader:footer:linkButtons:", 0, v6);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v9;
}

+ (id)groupSpecifierWithFooterText:()ACUIGroupSpecifier linkButtons:
{
  id v9 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v6 = (id)[v9 groupSpecifierWithHeader:0 footer:location[0] linkButtons:v7];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)groupSpecifierWithHeader:()ACUIGroupSpecifier footer:
{
  id v9 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v6 = (id)[v9 groupSpecifierWithHeader:location[0] footer:v7 linkButtons:0];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)groupSpecifierWithHeader:()ACUIGroupSpecifier footer:linkButtons:
{
  id location[2] = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = 0;
  objc_storeStrong(&v14, a5);
  id v13 = 0;
  if (location[0]) {
    id v5 = (id)[MEMORY[0x1E4F92E70] groupSpecifierWithName:location[0]];
  }
  else {
    id v5 = (id)[MEMORY[0x1E4F92E70] emptyGroupSpecifier];
  }
  id v6 = v13;
  id v13 = v5;

  id v7 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v7);
  objc_msgSend(v13, "setProperty:forKey:");

  [v13 setProperty:v15 forKey:@"ACUIFooterText"];
  if (v14) {
    [v13 setProperty:v14 forKey:@"ACUILinkButtonArray"];
  }
  id v9 = v13;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v9;
}

@end