@interface SGUIIconSupport
+ (id)_homeScreenDescriptorWithBorder:(BOOL)a3;
+ (id)_iconImageWithBundleIdentifier:(id)a3 imageDescriptor:(id)a4;
+ (id)_imageWithIcon:(id)a3 imageDescriptor:(id)a4;
+ (id)_spotlightDescriptorWithBorder:(BOOL)a3;
+ (id)homeScreenIconImageWithBundleIdentifier:(id)a3;
+ (id)homeScreenIconImageWithBundleIdentifier:(id)a3 drawBorder:(BOOL)a4;
+ (id)iconForCalendarDate:(id)a3;
+ (id)iconForCalendarDate:(id)a3 drawBorder:(BOOL)a4;
+ (id)spotlightIconImageWithBundleIdentifier:(id)a3;
+ (id)spotlightIconImageWithBundleIdentifier:(id)a3 drawBorder:(BOOL)a4;
@end

@implementation SGUIIconSupport

+ (id)_imageWithIcon:(id)a3 imageDescriptor:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 arrayWithObjects:&v15 count:1];
  objc_msgSend(v7, "prepareImagesForImageDescriptors:", v8, v15, v16);

  v9 = [v7 imageForDescriptor:v6];

  v10 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v11 = [v9 CGImage];
  v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v12 scale];
  v13 = objc_msgSend(v10, "imageWithCGImage:scale:orientation:", v11, 0);

  return v13;
}

+ (id)_iconImageWithBundleIdentifier:(id)a3 imageDescriptor:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F6F248];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithBundleIdentifier:v8];

  v10 = [a1 _imageWithIcon:v9 imageDescriptor:v7];

  return v10;
}

+ (id)iconForCalendarDate:(id)a3 drawBorder:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F6F248];
  id v7 = a3;
  id v8 = [v6 alloc];
  v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v10 = (void *)[v8 initWithDate:v7 calendar:v9 format:0];

  uint64_t v11 = [a1 _homeScreenDescriptorWithBorder:v4];
  v12 = [a1 _imageWithIcon:v10 imageDescriptor:v11];

  return v12;
}

+ (id)iconForCalendarDate:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F6F248];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v8 = (void *)[v6 initWithDate:v5 calendar:v7 format:0];

  v9 = [a1 _homeScreenDescriptorWithBorder:0];
  v10 = [a1 _imageWithIcon:v8 imageDescriptor:v9];

  return v10;
}

+ (id)_homeScreenDescriptorWithBorder:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F298]];
  id v5 = v4;
  if (v3) {
    [v4 setDrawBorder:1];
  }
  return v5;
}

+ (id)_spotlightDescriptorWithBorder:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F2B0]];
  id v5 = v4;
  if (v3) {
    [v4 setDrawBorder:1];
  }
  return v5;
}

+ (id)spotlightIconImageWithBundleIdentifier:(id)a3 drawBorder:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [a1 _spotlightDescriptorWithBorder:v4];
  id v8 = [a1 _iconImageWithBundleIdentifier:v6 imageDescriptor:v7];

  return v8;
}

+ (id)spotlightIconImageWithBundleIdentifier:(id)a3
{
  return (id)[a1 spotlightIconImageWithBundleIdentifier:a3 drawBorder:0];
}

+ (id)homeScreenIconImageWithBundleIdentifier:(id)a3 drawBorder:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [a1 _homeScreenDescriptorWithBorder:v4];
  id v8 = [a1 _iconImageWithBundleIdentifier:v6 imageDescriptor:v7];

  return v8;
}

+ (id)homeScreenIconImageWithBundleIdentifier:(id)a3
{
  return (id)[a1 homeScreenIconImageWithBundleIdentifier:a3 drawBorder:0];
}

@end