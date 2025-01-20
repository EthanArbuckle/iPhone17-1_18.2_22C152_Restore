@interface UIImage(MKTransitArtworkExtras)
+ (id)_mapkit_imageFromVKImage:()MKTransitArtworkExtras;
+ (id)_mapkit_transitArtworkImageWithDataSource:()MKTransitArtworkExtras size:scale:nightMode:;
+ (id)_mapkit_transitArtworkImageWithDataSource:()MKTransitArtworkExtras size:scale:withWidthPaddingMultiple:;
+ (uint64_t)_mapkit_transitArtworkImageWithDataSource:()MKTransitArtworkExtras size:scale:;
@end

@implementation UIImage(MKTransitArtworkExtras)

+ (uint64_t)_mapkit_transitArtworkImageWithDataSource:()MKTransitArtworkExtras size:scale:
{
  return objc_msgSend(a1, "_mapkit_transitArtworkImageWithDataSource:size:scale:nightMode:", a3, a4, 0);
}

+ (id)_mapkit_transitArtworkImageWithDataSource:()MKTransitArtworkExtras size:scale:nightMode:
{
  id v9 = a4;
  v10 = +[MKTransitArtworkManager sharedInstance];
  v11 = [v10 transitArtworkImageWithDataSource:v9 size:a5 featureType:2 scale:a6 nightMode:a1];

  return v11;
}

+ (id)_mapkit_transitArtworkImageWithDataSource:()MKTransitArtworkExtras size:scale:withWidthPaddingMultiple:
{
  id v9 = a5;
  v10 = +[MKTransitArtworkManager sharedInstance];
  v11 = [v10 transitArtworkImageWithDataSource:v9 size:a6 featureType:2 scale:0 nightMode:a1 withWidthPaddingMultiple:a2];

  return v11;
}

+ (id)_mapkit_imageFromVKImage:()MKTransitArtworkExtras
{
  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E4F42A80];
    id v5 = a3;
    id v6 = [v4 alloc];
    uint64_t v7 = [v5 image];
    [v5 contentScale];
    float v9 = v8;

    v10 = (void *)[v6 initWithCGImage:v7 scale:0 orientation:v9];
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

@end