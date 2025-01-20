@interface AMSMediaArtwork
+ (NSString)cropStylePlaceholder;
+ (NSString)formatPlaceholder;
+ (NSString)heightPlaceholder;
+ (NSString)qualityPlaceholder;
+ (NSString)widthPlaceholder;
+ (id)urlWithURLTemplate:(id)a3 size:(CGSize)a4 cropStyle:(id)a5 format:(id)a6 quality:(id)a7;
- (AMSMediaArtwork)initWithDictionary:(id)a3;
- (CGColor)colorWithKind:(id)a3;
- (CGSize)artworkSize;
- (NSDictionary)artworkDictionary;
- (double)height;
- (double)width;
- (id)URLString;
- (id)URLWithSize:(CGSize)a3;
- (id)URLWithSize:(CGSize)a3 cropStyle:(id)a4 format:(id)a5;
- (id)URLWithSize:(CGSize)a3 cropStyle:(id)a4 format:(id)a5 quality:(unint64_t)a6;
- (unint64_t)_qualityForFormat:(id)a3;
@end

@implementation AMSMediaArtwork

- (void).cxx_destruct
{
}

- (id)URLWithSize:(CGSize)a3 cropStyle:(id)a4 format:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  id v10 = a4;
  v11 = -[AMSMediaArtwork URLWithSize:cropStyle:format:quality:](self, "URLWithSize:cropStyle:format:quality:", v10, v9, [(AMSMediaArtwork *)self _qualityForFormat:v9], width, height);

  return v11;
}

- (unint64_t)_qualityForFormat:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"heic"] & 1) == 0
    && ([v3 isEqualToString:@"jpg"] & 1) == 0)
  {
    [v3 isEqualToString:@"png"];
  }

  return 70;
}

- (id)URLWithSize:(CGSize)a3 cropStyle:(id)a4 format:(id)a5 quality:(unint64_t)a6
{
  double height = a3.height;
  double width = a3.width;
  id v11 = a4;
  id v12 = a5;
  v13 = [(AMSMediaArtwork *)self URLString];
  v14 = (void *)[v13 mutableCopy];

  if (v14)
  {
    [(AMSMediaArtwork *)self height];
    if (height < v15) {
      double v15 = height;
    }
    double v16 = fmax(v15, 0.0);
    [(AMSMediaArtwork *)self width];
    if (width < v17) {
      double v17 = width;
    }
    double v18 = (double)(unint64_t)fmax(v17, 0.0);
    unint64_t v19 = 100;
    if (a6 < 0x64) {
      unint64_t v19 = a6;
    }
    v20 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v19);
    v21 = objc_msgSend((id)objc_opt_class(), "urlWithURLTemplate:size:cropStyle:format:quality:", v14, v11, v12, v20, v18, (double)(unint64_t)v16);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (double)width
{
  v2 = [(AMSMediaArtwork *)self artworkDictionary];
  id v3 = [v2 objectForKeyedSubscript:@"width"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  [v4 floatValue];
  double v6 = v5;

  return v6;
}

- (double)height
{
  v2 = [(AMSMediaArtwork *)self artworkDictionary];
  id v3 = [v2 objectForKeyedSubscript:@"height"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  [v4 floatValue];
  double v6 = v5;

  return v6;
}

- (id)URLString
{
  v2 = [(AMSMediaArtwork *)self artworkDictionary];
  id v3 = [v2 objectForKeyedSubscript:@"url"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (NSDictionary)artworkDictionary
{
  return self->_artworkDictionary;
}

- (AMSMediaArtwork)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSMediaArtwork;
  double v6 = [(AMSMediaArtwork *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_artworkDictionary, a3);
  }

  return v7;
}

+ (NSString)cropStylePlaceholder
{
  v2 = (void *)sub_18DD4DE80();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)formatPlaceholder
{
  v2 = (void *)sub_18DD4DE80();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)heightPlaceholder
{
  v2 = (void *)sub_18DD4DE80();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)qualityPlaceholder
{
  v2 = (void *)sub_18DD4DE80();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)widthPlaceholder
{
  v2 = (void *)sub_18DD4DE80();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (id)urlWithURLTemplate:(id)a3 size:(CGSize)a4 cropStyle:(id)a5 format:(id)a6 quality:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB38A5F0);
  MEMORY[0x1F4188790](v13 - 8);
  double v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    uint64_t v16 = sub_18DD4DEB0();
    a3 = v17;
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if (a5)
    {
LABEL_3:
      uint64_t v18 = sub_18DD4DEB0();
      a5 = v19;
      if (a6) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v20 = 0;
      if (a7) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  uint64_t v18 = 0;
  if (!a6) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v20 = sub_18DD4DEB0();
  a6 = v21;
  if (a7)
  {
LABEL_5:
    uint64_t v22 = sub_18DD4DEB0();
    a7 = v23;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v22 = 0;
LABEL_10:
  static AMSMediaArtwork.url(URLTemplate:size:cropStyle:format:quality:)(v16, (uint64_t)a3, v18, (unint64_t)a5, v20, (unint64_t)a6, v22, (unint64_t)a7, (uint64_t)v15, width, height);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v24 = sub_18DD4D820();
  v25 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v24) != 1)
  {
    v25 = (void *)sub_18DD4D750();
    (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 8))(v15, v24);
  }
  return v25;
}

- (CGSize)artworkSize
{
  [(AMSMediaArtwork *)self width];
  double v4 = v3;
  [(AMSMediaArtwork *)self height];
  double v6 = v5;
  double v7 = v4;
  result.double height = v6;
  result.double width = v7;
  return result;
}

- (CGColor)colorWithKind:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(AMSMediaArtwork *)self artworkDictionary];
  double v6 = [v5 objectForKeyedSubscript:v4];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v7 = 0;
    goto LABEL_6;
  }
  id v7 = v6;

  if (!v7)
  {
LABEL_6:
    id v10 = 0;
    goto LABEL_7;
  }
  id v7 = v7;
  unsigned int v8 = strtoul((const char *)[v7 UTF8String], 0, 16);
  float64x2_t v12 = vcvtq_f64_f32(vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v8), (uint32x2_t)0xFFFFFFF8FFFFFFF0), (int8x8_t)0xFF000000FFLL)), (float32x2_t)vdup_n_s32(0x437F0000u)));
  double v13 = (float)((float)v8 / 255.0);
  uint64_t v14 = 0x3FF0000000000000;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  id v10 = CGColorCreate(DeviceRGB, v12.f64);
  if (DeviceRGB) {
    CGColorSpaceRelease(DeviceRGB);
  }
LABEL_7:

  return v10;
}

- (id)URLWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  unint64_t v6 = [(AMSMediaArtwork *)self _qualityForFormat:@"jpg"];
  return [(AMSMediaArtwork *)self URLWithSize:@"bb", @"jpg", v6, width, height cropStyle format quality];
}

@end