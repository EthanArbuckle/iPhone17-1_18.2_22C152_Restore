@interface GPExportablePhotoAsset
+ (BOOL)supportsSecureCoding;
- (GPExportablePhotoAsset)init;
- (GPExportablePhotoAsset)initWithCoder:(id)a3;
- (GPExportablePhotoAsset)initWithIdentifier:(id)a3 imageURLWrapper:(id)a4 previewImage:(id)a5 pixelWidth:(id)a6 pixelHeight:(id)a7 creationDate:(id)a8 recipeData:(id)a9;
- (GPGenerationRecipeData)recipeData;
- (NSDate)creationDate;
- (NSNumber)pixelHeight;
- (NSNumber)pixelWidth;
- (NSSecurityScopedURLWrapper)imageURLWrapper;
- (NSString)identifier;
- (UIImage)previewImage;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GPExportablePhotoAsset

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GPExportablePhotoAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageURLWrapper"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previewImage"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pixelWidth"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pixelHeight"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipeData"];

  v12 = [(GPExportablePhotoAsset *)self initWithIdentifier:v5 imageURLWrapper:v6 previewImage:v7 pixelWidth:v8 pixelHeight:v9 creationDate:v10 recipeData:v11];
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(GPExportablePhotoAsset *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(GPExportablePhotoAsset *)self imageURLWrapper];
  [v4 encodeObject:v6 forKey:@"imageURLWrapper"];

  v7 = [(GPExportablePhotoAsset *)self previewImage];
  [v4 encodeObject:v7 forKey:@"previewImage"];

  v8 = [(GPExportablePhotoAsset *)self pixelWidth];
  [v4 encodeObject:v8 forKey:@"pixelWidth"];

  v9 = [(GPExportablePhotoAsset *)self pixelHeight];
  [v4 encodeObject:v9 forKey:@"pixelHeight"];

  v10 = [(GPExportablePhotoAsset *)self creationDate];
  [v4 encodeObject:v10 forKey:@"creationDate"];

  id v11 = [(GPExportablePhotoAsset *)self recipeData];
  [v4 encodeObject:v11 forKey:@"recipeData"];
}

- (NSString)identifier
{
  sub_243EA0958((uint64_t)self + OBJC_IVAR___GPExportablePhotoAsset__identifier, (uint64_t)v6);
  v3 = self;
  swift_dynamicCast();

  id v4 = (void *)sub_2443BA4B0();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (NSSecurityScopedURLWrapper)imageURLWrapper
{
  return (NSSecurityScopedURLWrapper *)sub_2441AB288(self, (uint64_t)a2, &OBJC_IVAR___GPExportablePhotoAsset__imageURLWrapper, &qword_268E421E0);
}

- (UIImage)previewImage
{
  return (UIImage *)sub_2441AB288(self, (uint64_t)a2, &OBJC_IVAR___GPExportablePhotoAsset__previewImage, &qword_268E3C1B0);
}

- (NSNumber)pixelWidth
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___GPExportablePhotoAsset_pixelWidth));
}

- (NSNumber)pixelHeight
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___GPExportablePhotoAsset_pixelHeight));
}

- (NSDate)creationDate
{
  uint64_t v3 = sub_2443B5440();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_243EA0958((uint64_t)self + OBJC_IVAR___GPExportablePhotoAsset__creationDate, (uint64_t)v9);
  swift_dynamicCast();
  v7 = (void *)sub_2443B53D0();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSDate *)v7;
}

- (GPGenerationRecipeData)recipeData
{
  sub_243EA0958((uint64_t)self + OBJC_IVAR___GPExportablePhotoAsset__recipeData, (uint64_t)v6);
  type metadata accessor for GPGenerationRecipeData(0);
  uint64_t v3 = self;
  swift_dynamicCast();

  return (GPGenerationRecipeData *)v5;
}

- (GPExportablePhotoAsset)initWithIdentifier:(id)a3 imageURLWrapper:(id)a4 previewImage:(id)a5 pixelWidth:(id)a6 pixelHeight:(id)a7 creationDate:(id)a8 recipeData:(id)a9
{
  uint64_t v13 = sub_2443B5440();
  MEMORY[0x270FA5388](v13 - 8);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2443BA4F0();
  uint64_t v18 = v17;
  sub_2443B5410();
  return (GPExportablePhotoAsset *)GPExportablePhotoAsset.init(identifier:imageURLWrapper:previewImage:pixelWidth:pixelHeight:creationDate:recipeData:)(v16, v18, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)v15, (uint64_t)a9);
}

- (GPExportablePhotoAsset)init
{
  result = (GPExportablePhotoAsset *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___GPExportablePhotoAsset__identifier);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___GPExportablePhotoAsset__imageURLWrapper);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___GPExportablePhotoAsset__previewImage);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___GPExportablePhotoAsset__creationDate);
  uint64_t v3 = (char *)self + OBJC_IVAR___GPExportablePhotoAsset__recipeData;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end