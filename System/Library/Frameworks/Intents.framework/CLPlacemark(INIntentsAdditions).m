@interface CLPlacemark(INIntentsAdditions)
+ (id)placemarkWithLocation:()INIntentsAdditions name:postalAddress:;
@end

@implementation CLPlacemark(INIntentsAdditions)

+ (id)placemarkWithLocation:()INIntentsAdditions name:postalAddress:
{
  v8 = (objc_class *)MEMORY[0x1E4F64660];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 alloc];
  [v11 coordinate];
  double v14 = v13;
  [v11 coordinate];
  double v16 = v15;

  v17 = (void *)[v12 initWithLatitude:v14 longitude:v16];
  id v18 = objc_alloc(MEMORY[0x1E4F64698]);
  v19 = [v9 dictionaryRepresentation];

  LODWORD(v23) = 0;
  v20 = (void *)[v18 initWithWithLocation:v17 addressDictionary:v19 name:v10 businessURL:0 phoneNumber:0 sessionID:0 muid:0.0 attributionID:0 sampleSizeForUserRatingScore:0 normalizedUserRatingScore:v23];

  v21 = [a1 placemarkWithGEOMapItem:v20];

  return v21;
}

@end