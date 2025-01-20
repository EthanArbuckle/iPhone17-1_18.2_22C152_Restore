@interface AVMediaContentRatings
+ (BOOL)isImageMaskForMetadataItem:(id)a3;
+ (BOOL)isRatingImageMask:(id)a3;
+ (id)_imageNameForRating:(id)a3;
+ (id)contentRatingsDictionary;
+ (id)displayStringForMetadataItem:(id)a3;
+ (id)displayStringForRating:(id)a3;
+ (id)imageForMetadataItem:(id)a3;
+ (id)imageForRating:(id)a3;
@end

@implementation AVMediaContentRatings

+ (BOOL)isImageMaskForMetadataItem:(id)a3
{
  v4 = [a3 stringValue];
  LOBYTE(a1) = [a1 isRatingImageMask:v4];

  return (char)a1;
}

+ (id)displayStringForMetadataItem:(id)a3
{
  v4 = [a3 stringValue];
  v5 = [a1 displayStringForRating:v4];

  return v5;
}

+ (id)imageForMetadataItem:(id)a3
{
  v4 = [a3 stringValue];
  v5 = [a1 imageForRating:v4];

  return v5;
}

+ (id)displayStringForRating:(id)a3
{
  return (id)[a3 uppercaseString];
}

+ (BOOL)isRatingImageMask:(id)a3
{
  v3 = [a1 _imageNameForRating:a3];
  char v4 = [v3 hasSuffix:@"_mask"];

  return v4;
}

+ (id)imageForRating:(id)a3
{
  v3 = [a1 _imageNameForRating:a3];
  if (v3)
  {
    char v4 = (void *)MEMORY[0x1E4FB1818];
    v5 = AVBundle();
    v6 = [v4 imageNamed:v3 inBundle:v5 compatibleWithTraitCollection:0];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_imageNameForRating:(id)a3
{
  v3 = [a3 lowercaseString];
  char v4 = [v3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  v5 = [v4 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1F09185C8];

  v6 = +[AVMediaContentRatings contentRatingsDictionary];
  v7 = [v6 objectForKeyedSubscript:v5];

  return v7;
}

+ (id)contentRatingsDictionary
{
  if (contentRatingsDictionary_onceToken != -1) {
    dispatch_once(&contentRatingsDictionary_onceToken, &__block_literal_global_25242);
  }
  v2 = (void *)contentRatingsDictionary__contentRatingsDictionary;

  return v2;
}

void __49__AVMediaContentRatings_contentRatingsDictionary__block_invoke()
{
  v0 = (void *)contentRatingsDictionary__contentRatingsDictionary;
  contentRatingsDictionary__contentRatingsDictionary = (uint64_t)&unk_1F094A6F8;
}

@end