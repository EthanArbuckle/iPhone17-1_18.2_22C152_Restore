@interface ATXHeroData
+ (BOOL)isClipMetadataEqual:(id)a3 other:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)copyClipMetadata:(id)a3;
- (ATXHeroData)initWithCoder:(id)a3;
- (ATXHeroData)initWithPredictedAdamId:(unint64_t)a3 bundleId:(id)a4 latitude:(double)a5 longitude:(double)a6 radiusInMeters:(unint64_t)a7 rank:(unint64_t)a8 isTouristApp:(BOOL)a9 score:(double)a10 urlHash:(id)a11 clipMetadata:(id)a12;
- (ATXHeroData)initWithPredictedAdamId:(unint64_t)a3 bundleId:(id)a4 latitude:(double)a5 longitude:(double)a6 radiusInMeters:(unint64_t)a7 rank:(unint64_t)a8 isTouristApp:(BOOL)a9 score:(double)a10 urlHash:(id)a11 clipMetadata:(id)a12 poiCategory:(id)a13;
- (ATXHeroData)initWithPredictedAdamId:(unint64_t)a3 bundleId:(id)a4 latitude:(double)a5 longitude:(double)a6 radiusInMeters:(unint64_t)a7 rank:(unint64_t)a8 isTouristApp:(BOOL)a9 score:(double)a10 urlHash:(id)a11 clipMetadata:(id)a12 poiCategory:(id)a13 poiMuid:(id)a14;
- (ATXHeroData)initWithPredictedAdamId:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5 radiusInMeters:(unint64_t)a6 rank:(unint64_t)a7 isTouristApp:(BOOL)a8;
- (ATXHeroData)initWithPredictedBundleId:(id)a3 latitude:(double)a4 longitude:(double)a5 radiusInMeters:(unint64_t)a6 rank:(unint64_t)a7 isTouristApp:(BOOL)a8;
- (ATXHeroData)initWithProto:(id)a3;
- (ATXHeroData)initWithProtoData:(id)a3;
- (BOOL)checkAndReportDecodingFailureIfNeededForBOOL:(BOOL)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTouristApp;
- (CPSClipMetadata)clipMetadata;
- (NSNumber)poiMuid;
- (NSString)bundleId;
- (NSString)description;
- (NSString)poiCategory;
- (NSString)urlHash;
- (double)latitude;
- (double)latitudeAtPredictionTime;
- (double)longitude;
- (double)longitudeAtPredictionTime;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)adamId;
- (unint64_t)hash;
- (unint64_t)radiusInMeters;
- (unint64_t)rank;
- (void)encodeWithCoder:(id)a3;
- (void)proto;
- (void)setAdamId:(unint64_t)a3;
- (void)setBundleId:(id)a3;
- (void)setClipMetadata:(id)a3;
- (void)setIsTouristApp:(BOOL)a3;
- (void)setLatitude:(double)a3;
- (void)setLatitudeAtPredictionTime:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setLongitudeAtPredictionTime:(double)a3;
- (void)setPoiCategory:(id)a3;
- (void)setPoiMuid:(id)a3;
- (void)setRadiusInMeters:(unint64_t)a3;
- (void)setRank:(unint64_t)a3;
- (void)setScore:(double)a3;
- (void)setUrlHash:(id)a3;
@end

@implementation ATXHeroData

- (ATXHeroData)initWithPredictedAdamId:(unint64_t)a3 bundleId:(id)a4 latitude:(double)a5 longitude:(double)a6 radiusInMeters:(unint64_t)a7 rank:(unint64_t)a8 isTouristApp:(BOOL)a9 score:(double)a10 urlHash:(id)a11 clipMetadata:(id)a12 poiCategory:(id)a13 poiMuid:(id)a14
{
  id v21 = a4;
  id v22 = a11;
  id v34 = a12;
  id v23 = a13;
  id v24 = a14;
  v35.receiver = self;
  v35.super_class = (Class)ATXHeroData;
  v25 = [(ATXHeroData *)&v35 init];
  v26 = v25;
  if (v25)
  {
    v25->_adamId = a3;
    uint64_t v27 = [v21 copy];
    bundleId = v26->_bundleId;
    v26->_bundleId = (NSString *)v27;

    v26->_latitude = a5;
    v26->_longitude = a6;
    v26->_radiusInMeters = a7;
    v26->_rank = a8;
    v26->_isTouristApp = a9;
    v26->_score = a10;
    uint64_t v29 = [v22 copy];
    urlHash = v26->_urlHash;
    v26->_urlHash = (NSString *)v29;

    objc_storeStrong((id *)&v26->_clipMetadata, a12);
    v26->_latitudeAtPredictionTime = 0.0;
    v26->_longitudeAtPredictionTime = 0.0;
    objc_storeStrong((id *)&v26->_poiCategory, a13);
    objc_storeStrong((id *)&v26->_poiMuid, a14);
  }

  return v26;
}

- (ATXHeroData)initWithPredictedAdamId:(unint64_t)a3 bundleId:(id)a4 latitude:(double)a5 longitude:(double)a6 radiusInMeters:(unint64_t)a7 rank:(unint64_t)a8 isTouristApp:(BOOL)a9 score:(double)a10 urlHash:(id)a11 clipMetadata:(id)a12 poiCategory:(id)a13
{
  return [(ATXHeroData *)self initWithPredictedAdamId:a3 bundleId:a4 latitude:a7 longitude:a8 radiusInMeters:a9 rank:a11 isTouristApp:a5 score:a6 urlHash:a10 clipMetadata:a12 poiCategory:a13 poiMuid:0];
}

- (ATXHeroData)initWithPredictedAdamId:(unint64_t)a3 bundleId:(id)a4 latitude:(double)a5 longitude:(double)a6 radiusInMeters:(unint64_t)a7 rank:(unint64_t)a8 isTouristApp:(BOOL)a9 score:(double)a10 urlHash:(id)a11 clipMetadata:(id)a12
{
  return [(ATXHeroData *)self initWithPredictedAdamId:a3 bundleId:a4 latitude:a7 longitude:a8 radiusInMeters:a9 rank:a11 isTouristApp:a5 score:a6 urlHash:a10 clipMetadata:a12 poiCategory:0];
}

- (ATXHeroData)initWithPredictedAdamId:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5 radiusInMeters:(unint64_t)a6 rank:(unint64_t)a7 isTouristApp:(BOOL)a8
{
  return [(ATXHeroData *)self initWithPredictedAdamId:a3 bundleId:&stru_26C633058 latitude:a6 longitude:a7 radiusInMeters:a8 rank:0 isTouristApp:a4 score:a5 urlHash:(double)0 clipMetadata:0];
}

- (ATXHeroData)initWithPredictedBundleId:(id)a3 latitude:(double)a4 longitude:(double)a5 radiusInMeters:(unint64_t)a6 rank:(unint64_t)a7 isTouristApp:(BOOL)a8
{
  BOOL v8 = a8;
  v14 = (void *)[a3 copy];
  v15 = [(ATXHeroData *)self initWithPredictedAdamId:-1 bundleId:v14 latitude:a6 longitude:a7 radiusInMeters:v8 rank:0 isTouristApp:a4 score:a5 urlHash:(double)0 clipMetadata:0];

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v21 = *MEMORY[0x263F08320];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForBOOL:(BOOL)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v21 = *MEMORY[0x263F08320];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (a3 == 0.0)
  {
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v21 = *MEMORY[0x263F08320];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  double latitude = self->_latitude;
  id v8 = a3;
  [v8 encodeDouble:@"latitude" forKey:latitude];
  [v8 encodeDouble:@"longitude" forKey:self->_longitude];
  [v8 encodeDouble:@"latitudeAtPrediction" forKey:self->_latitudeAtPredictionTime];
  [v8 encodeDouble:@"longitudeAtPrediction" forKey:self->_longitudeAtPredictionTime];
  v5 = [NSNumber numberWithUnsignedInteger:self->_radiusInMeters];
  [v8 encodeObject:v5 forKey:@"radius"];

  v6 = [NSNumber numberWithUnsignedInteger:self->_rank];
  [v8 encodeObject:v6 forKey:@"rank"];

  [v8 encodeBool:self->_isTouristApp forKey:@"isTouristApp"];
  [v8 encodeObject:self->_bundleId forKey:@"bundleId"];
  v7 = [NSNumber numberWithUnsignedInteger:self->_adamId];
  [v8 encodeObject:v7 forKey:@"adamId"];

  [v8 encodeDouble:@"score" forKey:self->_score];
  [v8 encodeObject:self->_urlHash forKey:@"urlHash"];
  [v8 encodeObject:self->_clipMetadata forKey:@"clipMetadata"];
  [v8 encodeObject:self->_poiCategory forKey:@"poiCategory"];
  [v8 encodeObject:self->_poiMuid forKey:@"poiMuid"];
}

- (ATXHeroData)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"latitude"];
  double v6 = v5;
  BOOL v39 = -[ATXHeroData checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", @"latitude", v4, @"com.apple.proactive.hero", -1);
  [v4 decodeDoubleForKey:@"longitude"];
  double v8 = v7;
  BOOL v38 = -[ATXHeroData checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", @"longitude", v4, @"com.apple.proactive.hero", -1);
  [v4 decodeDoubleForKey:@"latitudeAtPrediction"];
  double v10 = v9;
  BOOL v37 = -[ATXHeroData checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", @"latitudeAtPrediction", v4, @"com.apple.proactive.hero", -1);
  [v4 decodeDoubleForKey:@"longitudeAtPrediction"];
  double v12 = v11;
  BOOL v36 = -[ATXHeroData checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", @"longitudeAtPrediction", v4, @"com.apple.proactive.hero", -1);
  id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"radius"];
  if ([(ATXHeroData *)self checkAndReportDecodingFailureIfNeededForid:v13 key:@"radius" coder:v4 errorDomain:@"com.apple.proactive.hero" errorCode:-1])
  {
    uint64_t v14 = [NSNumber numberWithUnsignedInteger:70];

    id v13 = (void *)v14;
  }
  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rank"];
  if ([(ATXHeroData *)self checkAndReportDecodingFailureIfNeededForid:v15 key:@"rank" coder:v4 errorDomain:@"com.apple.proactive.hero" errorCode:-1])
  {
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:0];

    v15 = (void *)v16;
  }
  unsigned int v33 = [v4 decodeBoolForKey:@"isTouristApp"];
  BOOL v32 = -[ATXHeroData checkAndReportDecodingFailureIfNeededForBOOL:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForBOOL:key:coder:errorDomain:errorCode:");
  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];
  if ([(ATXHeroData *)self checkAndReportDecodingFailureIfNeededForid:v17 key:@"bundleId" coder:v4 errorDomain:@"com.apple.proactive.hero" errorCode:-1])
  {
    v18 = &stru_26C633058;

    v17 = v18;
  }
  v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"adamId"];
  if ([(ATXHeroData *)self checkAndReportDecodingFailureIfNeededForid:v19 key:@"adamId" coder:v4 errorDomain:@"com.apple.proactive.hero" errorCode:-1])
  {
    uint64_t v20 = [NSNumber numberWithUnsignedInteger:-1];

    id v34 = (void *)v20;
  }
  else
  {
    id v34 = v19;
  }
  [v4 decodeDoubleForKey:@"score"];
  double v22 = v21;
  BOOL v30 = -[ATXHeroData checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", @"score", v4, @"com.apple.proactive.hero", -1);
  id v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"urlHash"];
  objc_super v35 = v17;
  if ([(ATXHeroData *)self checkAndReportDecodingFailureIfNeededForid:v23 key:@"urlHash" coder:v4 errorDomain:@"com.apple.proactive.hero" errorCode:-1])
  {

    id v23 = 0;
  }
  id v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clipMetadata"];
  v40 = v13;
  v31 = v23;
  if ([(ATXHeroData *)self checkAndReportDecodingFailureIfNeededForid:v24 key:@"clipMetadata" coder:v4 errorDomain:@"com.apple.proactive.hero" errorCode:-1])
  {

    id v24 = 0;
  }
  v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"poiCategory"];
  if ([(ATXHeroData *)self checkAndReportDecodingFailureIfNeededForid:v25 key:@"poiCategory" coder:v4 errorDomain:@"com.apple.proactive.hero" errorCode:-1])
  {

    v25 = 0;
  }
  v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"poiMuid"];
  if ([(ATXHeroData *)self checkAndReportDecodingFailureIfNeededForid:v26 key:@"poiMuid" coder:v4 errorDomain:@"com.apple.proactive.hero" errorCode:-1])
  {

    v26 = 0;
  }
  if (v30) {
    double v22 = 0.0;
  }
  if (v32) {
    uint64_t v27 = kATXHeroAppDefaultIsTouristApp != 0;
  }
  else {
    uint64_t v27 = v33;
  }
  if (v36) {
    double v12 = 0.0;
  }
  if (v37) {
    double v10 = 0.0;
  }
  if (v38) {
    double v8 = 0.0;
  }
  if (v39) {
    double v6 = 0.0;
  }
  v28 = -[ATXHeroData initWithPredictedAdamId:bundleId:latitude:longitude:radiusInMeters:rank:isTouristApp:score:urlHash:clipMetadata:](self, "initWithPredictedAdamId:bundleId:latitude:longitude:radiusInMeters:rank:isTouristApp:score:urlHash:clipMetadata:", [v34 unsignedIntegerValue], v35, objc_msgSend(v40, "unsignedIntegerValue"), objc_msgSend(v15, "unsignedIntegerValue"), v27, v31, v6, v8, v22, v24);
  [(ATXHeroData *)v28 setLatitudeAtPredictionTime:v10];
  [(ATXHeroData *)v28 setLongitudeAtPredictionTime:v12];
  [(ATXHeroData *)v28 setPoiCategory:v25];
  [(ATXHeroData *)v28 setPoiMuid:v26];

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  if ([v6 isMemberOfClass:objc_opt_class()])
  {
    double v7 = (ATXHeroData *)v6;
    if (self == v7)
    {
      char v21 = 1;
LABEL_39:

      goto LABEL_40;
    }
    unint64_t v46 = [(ATXHeroData *)self adamId];
    uint64_t v45 = [(ATXHeroData *)v7 adamId];
    BOOL v8 = [(ATXHeroData *)self isTouristApp];
    BOOL v9 = [(ATXHeroData *)v7 isTouristApp];
    [(ATXHeroData *)self latitude];
    double v11 = v10;
    [(ATXHeroData *)v7 latitude];
    double v13 = v12;
    [(ATXHeroData *)self longitude];
    double v15 = v14;
    [(ATXHeroData *)v7 longitude];
    double v17 = v16;
    v18 = [(ATXHeroData *)self urlHash];
    if (v18 || ([(ATXHeroData *)v7 urlHash], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v4 = [(ATXHeroData *)v7 urlHash];
      if (v4)
      {
        v19 = [(ATXHeroData *)self urlHash];
        uint64_t v20 = [(ATXHeroData *)v7 urlHash];
        char v44 = [v19 isEqualToString:v20];
      }
      else
      {
        char v44 = 0;
      }

      if (v18)
      {
LABEL_14:

        unint64_t v22 = [(ATXHeroData *)self rank];
        uint64_t v43 = [(ATXHeroData *)v7 rank];
        id v23 = [(ATXHeroData *)self poiCategory];
        if (v23 || ([(ATXHeroData *)v7 poiCategory], (uint64_t v40 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v24 = [(ATXHeroData *)v7 poiCategory];
          if (v24)
          {
            [(ATXHeroData *)self poiCategory];
            id v4 = (void *)v22;
            BOOL v25 = v8;
            uint64_t v27 = v26 = v9;
            v28 = [(ATXHeroData *)v7 poiCategory];
            char v42 = [v27 isEqualToString:v28];

            BOOL v9 = v26;
            BOOL v8 = v25;
            unint64_t v22 = (unint64_t)v4;
          }
          else
          {
            char v42 = 0;
          }

          if (v23)
          {
LABEL_23:
            char v29 = v8 ^ v9;
            double v30 = vabdd_f64(v11, v13);
            double v31 = vabdd_f64(v15, v17);

            BOOL v32 = [(ATXHeroData *)self poiMuid];
            if (v32
              || ([(ATXHeroData *)v7 poiMuid], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              unsigned int v33 = [(ATXHeroData *)v7 poiMuid];
              if (v33)
              {
                id v34 = [(ATXHeroData *)self poiMuid];
                objc_super v35 = [(ATXHeroData *)v7 poiMuid];
                char v36 = [v34 isEqualToNumber:v35];
              }
              else
              {
                char v36 = 0;
              }

              if (v32) {
                goto LABEL_32;
              }
            }
            else
            {
              char v36 = 1;
            }

LABEL_32:
            char v37 = (v46 == v45) & ~v29;
            if (v30 >= 2.22044605e-16) {
              char v37 = 0;
            }
            if (v31 >= 2.22044605e-16) {
              char v37 = 0;
            }
            char v38 = v37 & v44;
            if (v22 != v43) {
              char v38 = 0;
            }
            char v21 = v38 & v42 & v36;
            goto LABEL_39;
          }
        }
        else
        {
          v41 = 0;
          char v42 = 1;
        }

        goto LABEL_23;
      }
    }
    else
    {
      char v44 = 1;
    }

    goto LABEL_14;
  }
  char v21 = 0;
LABEL_40:

  return v21;
}

- (NSString)description
{
  v3 = NSString;
  unint64_t v4 = [(ATXHeroData *)self adamId];
  double v5 = [(ATXHeroData *)self bundleId];
  id v6 = [(ATXHeroData *)self urlHash];
  double v7 = [(ATXHeroData *)self poiCategory];
  [(ATXHeroData *)self latitude];
  uint64_t v9 = v8;
  [(ATXHeroData *)self longitude];
  uint64_t v11 = v10;
  [(ATXHeroData *)self score];
  uint64_t v13 = v12;
  unint64_t v14 = [(ATXHeroData *)self rank];
  unint64_t v15 = [(ATXHeroData *)self radiusInMeters];
  double v16 = [(ATXHeroData *)self poiMuid];
  double v17 = [v3 stringWithFormat:@"HeroApp with adamId: %ld bundleId: %@ urlHash: %@ poiCategory: %@ latitude: %f longitude: %f score: %lf rank: %lu radius: %lu poiMuid: %@", v4, v5, v6, v7, v9, v11, v13, v14, v15, v16];

  return (NSString *)v17;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ATXHeroData *)self adamId];
  unint64_t v4 = [(ATXHeroData *)self urlHash];
  uint64_t v5 = [v4 hash] - v3 + 32 * v3;

  id v6 = [(ATXHeroData *)self poiCategory];
  uint64_t v7 = [v6 hash] - v5 + 32 * v5;

  uint64_t v8 = [(ATXHeroData *)self poiMuid];
  uint64_t v9 = [v8 hash] - v7 + 32 * v7;

  id v10 = objc_alloc(NSNumber);
  [(ATXHeroData *)self latitude];
  *(float *)&double v11 = v11;
  uint64_t v12 = (void *)[v10 initWithFloat:v11];
  uint64_t v13 = [v12 hash] - v9 + 32 * v9;

  id v14 = objc_alloc(NSNumber);
  [(ATXHeroData *)self longitude];
  *(float *)&double v15 = v15;
  double v16 = (void *)[v14 initWithFloat:v15];
  unint64_t v17 = [v16 hash] - v13 + 32 * v13;

  return v17;
}

- (ATXHeroData)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [[ATXPBHeroAppPrediction alloc] initWithData:v4];

    self = [(ATXHeroData *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (ATXHeroData)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_10:
    char v21 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      -[ATXHeroData initWithProto:]();
    }
    goto LABEL_10;
  }
  id v5 = v4;
  id v6 = [v5 clipMetadata];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x2166BE8D0]();
    uint64_t v9 = (void *)MEMORY[0x263F08928];
    uint64_t v10 = objc_opt_class();
    double v11 = [v5 clipMetadata];
    id v37 = 0;
    uint64_t v12 = [v9 unarchivedObjectOfClass:v10 fromData:v11 error:&v37];
    id v13 = v37;

    if (v13 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      -[ATXHeroData initWithProto:]((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v22 = [v5 adamId];
  id v23 = [v5 bundleId];
  [v5 latitude];
  double v25 = v24;
  [v5 longitude];
  double v27 = v26;
  uint64_t v28 = [v5 radius];
  uint64_t v29 = [v5 rank];
  uint64_t v30 = [v5 isTouristApp];
  [v5 score];
  double v32 = v31;
  unsigned int v33 = [v5 urlHash];
  self = [(ATXHeroData *)self initWithPredictedAdamId:v22 bundleId:v23 latitude:v28 longitude:v29 radiusInMeters:v30 rank:v33 isTouristApp:v25 score:v27 urlHash:v32 clipMetadata:v12];

  [v5 latitudeAtPredictionTime];
  -[ATXHeroData setLatitudeAtPredictionTime:](self, "setLatitudeAtPredictionTime:");
  [v5 longitudeAtPredictionTime];
  -[ATXHeroData setLongitudeAtPredictionTime:](self, "setLongitudeAtPredictionTime:");
  id v34 = [v5 poiCategory];
  [(ATXHeroData *)self setPoiCategory:v34];

  objc_super v35 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "poiMuid"));
  [(ATXHeroData *)self setPoiMuid:v35];

  char v21 = self;
LABEL_13:

  return v21;
}

- (id)proto
{
  unint64_t v3 = objc_opt_new();
  id v4 = [(ATXHeroData *)self bundleId];
  [v3 setBundleId:v4];

  [(ATXHeroData *)self latitude];
  objc_msgSend(v3, "setLatitude:");
  [(ATXHeroData *)self longitude];
  objc_msgSend(v3, "setLongitude:");
  objc_msgSend(v3, "setRadius:", -[ATXHeroData radiusInMeters](self, "radiusInMeters"));
  objc_msgSend(v3, "setRank:", -[ATXHeroData rank](self, "rank"));
  objc_msgSend(v3, "setAdamId:", -[ATXHeroData adamId](self, "adamId"));
  id v5 = [(ATXHeroData *)self urlHash];
  [v3 setUrlHash:v5];

  [(ATXHeroData *)self score];
  objc_msgSend(v3, "setScore:");
  objc_msgSend(v3, "setIsTouristApp:", -[ATXHeroData isTouristApp](self, "isTouristApp"));
  [(ATXHeroData *)self latitudeAtPredictionTime];
  objc_msgSend(v3, "setLatitudeAtPredictionTime:");
  [(ATXHeroData *)self longitudeAtPredictionTime];
  objc_msgSend(v3, "setLongitudeAtPredictionTime:");
  id v6 = [(ATXHeroData *)self poiCategory];
  [v3 setPoiCategory:v6];

  uint64_t v7 = [(ATXHeroData *)self poiMuid];
  objc_msgSend(v3, "setPoiMuid:", objc_msgSend(v7, "unsignedIntegerValue"));

  uint64_t v8 = [(ATXHeroData *)self clipMetadata];

  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x2166BE8D0]();
    uint64_t v10 = (void *)MEMORY[0x263F08910];
    double v11 = [(ATXHeroData *)self clipMetadata];
    id v22 = 0;
    uint64_t v12 = [v10 archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v22];
    id v13 = v22;
    [v3 setClipMetadata:v12];

    if (v13 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      [(ATXHeroData *)(uint64_t)v13 proto];
    }
  }
  return v3;
}

- (id)encodeAsProto
{
  v2 = [(ATXHeroData *)self proto];
  unint64_t v3 = [v2 data];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v23 = +[ATXHeroData allocWithZone:a3];
  unint64_t v4 = [(ATXHeroData *)self adamId];
  id v5 = [(ATXHeroData *)self bundleId];
  [(ATXHeroData *)self latitude];
  double v7 = v6;
  [(ATXHeroData *)self longitude];
  double v9 = v8;
  unint64_t v10 = [(ATXHeroData *)self radiusInMeters];
  unint64_t v11 = [(ATXHeroData *)self rank];
  BOOL v12 = [(ATXHeroData *)self isTouristApp];
  [(ATXHeroData *)self score];
  double v14 = v13;
  uint64_t v15 = [(ATXHeroData *)self urlHash];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = [(ATXHeroData *)self clipMetadata];
  uint64_t v18 = (void *)[v16 copyClipMetadata:v17];
  uint64_t v19 = [(ATXHeroData *)self poiCategory];
  uint64_t v20 = [(ATXHeroData *)self poiMuid];
  char v21 = [(ATXHeroData *)v23 initWithPredictedAdamId:v4 bundleId:v5 latitude:v10 longitude:v11 radiusInMeters:v12 rank:v15 isTouristApp:v7 score:v9 urlHash:v14 clipMetadata:v18 poiCategory:v19 poiMuid:v20];

  return v21;
}

+ (id)copyClipMetadata:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x2166BE8D0]();
    double v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:0];
    double v7 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:0];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

+ (BOOL)isClipMetadataEqual:(id)a3 other:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 clipBundleID];
  double v8 = [v6 clipBundleID];
  if (v7 == v8)
  {
    unint64_t v10 = [v5 clipURL];
    unint64_t v11 = [v6 clipURL];
    BOOL v9 = v10 == v11;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)adamId
{
  return self->_adamId;
}

- (void)setAdamId:(unint64_t)a3
{
  self->_adamId = a3;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_double latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (double)latitudeAtPredictionTime
{
  return self->_latitudeAtPredictionTime;
}

- (void)setLatitudeAtPredictionTime:(double)a3
{
  self->_latitudeAtPredictionTime = a3;
}

- (double)longitudeAtPredictionTime
{
  return self->_longitudeAtPredictionTime;
}

- (void)setLongitudeAtPredictionTime:(double)a3
{
  self->_longitudeAtPredictionTime = a3;
}

- (unint64_t)radiusInMeters
{
  return self->_radiusInMeters;
}

- (void)setRadiusInMeters:(unint64_t)a3
{
  self->_radiusInMeters = a3;
}

- (unint64_t)rank
{
  return self->_rank;
}

- (void)setRank:(unint64_t)a3
{
  self->_rank = a3;
}

- (BOOL)isTouristApp
{
  return self->_isTouristApp;
}

- (void)setIsTouristApp:(BOOL)a3
{
  self->_isTouristApp = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSString)urlHash
{
  return self->_urlHash;
}

- (void)setUrlHash:(id)a3
{
}

- (CPSClipMetadata)clipMetadata
{
  return self->_clipMetadata;
}

- (void)setClipMetadata:(id)a3
{
}

- (NSString)poiCategory
{
  return self->_poiCategory;
}

- (void)setPoiCategory:(id)a3
{
}

- (NSNumber)poiMuid
{
  return self->_poiMuid;
}

- (void)setPoiMuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiMuid, 0);
  objc_storeStrong((id *)&self->_poiCategory, 0);
  objc_storeStrong((id *)&self->_clipMetadata, 0);
  objc_storeStrong((id *)&self->_urlHash, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)initWithProto:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithProto:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0(&dword_2155F7000, &_os_log_internal, v2, "%@: tried to initialize with an incompatible proto", v3, v4, v5, v6, 2u);
}

- (void)proto
{
}

@end