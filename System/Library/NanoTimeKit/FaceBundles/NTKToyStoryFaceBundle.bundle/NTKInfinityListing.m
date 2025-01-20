@interface NTKInfinityListing
+ (id)listingForDevice:(id)a3 withFilename:(id)a4;
+ (id)listingForDevice:(id)a3 withFilename:(id)a4 type:(unint64_t)a5 attributes:(id)a6;
- (BOOL)snapshotDiffers:(id)a3;
- (CLKVideo)video;
- (NSString)debugDescription;
- (NSString)description;
- (NTKInfinityListingAttributes)attributes;
- (id)complicationColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForDevice:(id)a3 withFilename:(id)a4;
- (unint64_t)playback;
- (unint64_t)type;
- (void)discardAssets;
- (void)setAttributes:(id)a3;
- (void)setPlayback:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation NTKInfinityListing

+ (id)listingForDevice:(id)a3 withFilename:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[NTKInfinityListing alloc] initForDevice:v6 withFilename:v5];

  return v7;
}

+ (id)listingForDevice:(id)a3 withFilename:(id)a4 type:(unint64_t)a5 attributes:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = [[NTKInfinityListing alloc] initForDevice:v11 withFilename:v10];

  [v12 setType:a5];
  [v12 setAttributes:v9];

  return v12;
}

- (id)initForDevice:(id)a3 withFilename:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKInfinityListing;
  id v9 = [(NTKInfinityListing *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_filename, a4);
    v10->_playback = 0;
  }

  return v10;
}

- (CLKVideo)video
{
  video = self->_video;
  if (!video)
  {
    device = self->_device;
    filename = self->_filename;
    id v6 = NTKAssetsBundle();
    id v7 = +[CLKVideo videoNamed:filename forDevice:device inBundle:v6];
    id v8 = self->_video;
    self->_video = v7;

    video = self->_video;
  }

  return video;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  device = self->_device;
  filename = self->_filename;

  return [v4 initForDevice:device withFilename:filename];
}

- (BOOL)snapshotDiffers:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v5 = ![(NSString *)self->_filename isEqualToString:v4[2]];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"'%@'", self->_filename];
}

- (NSString)debugDescription
{
  filename = self->_filename;
  v3 = [(CLKVideo *)self->_video url];
  id v4 = +[NSString stringWithFormat:@"filename: '%@' url: '%@'", filename, v3];

  return (NSString *)v4;
}

- (void)discardAssets
{
  self->_video = 0;
  _objc_release_x1();
}

- (id)complicationColor
{
  v2 = [(NTKInfinityListingAttributes *)self->_attributes colorForKey:@"color"];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[UIColor whiteColor];
  }
  unsigned int v5 = v4;

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)playback
{
  return self->_playback;
}

- (void)setPlayback:(unint64_t)a3
{
  self->_playback = a3;
}

- (NTKInfinityListingAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_video, 0);
  objc_storeStrong((id *)&self->_filename, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end