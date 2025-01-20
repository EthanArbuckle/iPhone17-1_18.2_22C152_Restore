@interface NTKCollieFaceBundle
+ (id)logCategoryName;
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryDescriptionText;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKCollieFaceBundle

- (Class)faceClass
{
  return (Class)objc_opt_class();
}

- (Class)faceViewClass
{
  return (Class)objc_opt_class();
}

- (Class)clockViewClass
{
  return (Class)objc_opt_class();
}

- (id)defaultFaceForDevice:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() identifier];
  v5 = [(id)objc_opt_class() analyticsIdentifier];
  v6 = +[NTKCollieFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

- (id)galleryTitle
{
  return +[NTKCollieFaceBundle localizedStringForKey:@"COLLIE_FACE_NAME_IN_TITLE_CASE" comment:&stru_29398];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v3 = a3;
  v4 = @"unicorn";
  v5 = [(id)objc_opt_class() identifier];
  v6 = [(id)objc_opt_class() analyticsIdentifier];
  v7 = +[NTKCollieFace bundledFaceWithIdentifier:v5 analyticsIdentifier:v6 forDevice:v3 initCustomization:0];

  if (v7)
  {
    v8 = +[NTKCollieStyleEditOption optionWithStyleName:v4 forDevice:v3];
    v9 = +[NTKCollieColorEditOption optionWithFaceColor:1 forDevice:v3];
    [v7 selectOption:v8 forCustomEditMode:15 slot:0];
    [v7 selectOption:v9 forCustomEditMode:10 slot:0];
    [v7 setComplication:0 forSlot:NTKComplicationSlotBottom];
    v12 = v7;
    v10 = +[NSArray arrayWithObjects:&v12 count:1];
  }
  else
  {
    v10 = &__NSArray0__struct;
  }

  return v10;
}

- (id)galleryDescriptionText
{
  return +[NTKCollieFaceBundle localizedStringForKey:@"FACE_STYLE_COLLIE_GALLERY_DESCRIPTION" comment:&stru_29398];
}

- (id)heroFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F405E6BC-C306-4B65-B1D7-439AB5A152CC"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    id v7 = &__NSArray0__struct;
  }
  else
  {
    v8 = [(NTKCollieFaceBundle *)self galleryFacesForDevice:v4];
    +[NSMutableArray array];
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = sub_14D6C;
    v14 = &unk_290C0;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = 600;
    id v9 = v15;
    [v8 enumerateObjectsUsingBlock:&v11];
    id v7 = objc_msgSend(v9, "copy", v11, v12, v13, v14);
  }

  return v7;
}

+ (id)logCategoryName
{
  return @"animoji";
}

@end