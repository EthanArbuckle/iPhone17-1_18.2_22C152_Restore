@interface _BlastDoorLPApplePhotosMomentMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (NSDate)earliestAssetDate;
- (NSDate)expirationDate;
- (NSDate)latestAssetDate;
- (NSString)title;
- (_BlastDoorLPApplePhotosMomentMetadata)initWithCoder:(id)a3;
- (_BlastDoorLPImage)keyPhoto;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)otherItemCount;
- (unint64_t)photoCount;
- (unint64_t)videoCount;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEarliestAssetDate:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setKeyPhoto:(id)a3;
- (void)setLatestAssetDate:(id)a3;
- (void)setOtherItemCount:(unint64_t)a3;
- (void)setPhotoCount:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setVideoCount:(unint64_t)a3;
@end

@implementation _BlastDoorLPApplePhotosMomentMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPApplePhotosMomentMetadata)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_BlastDoorLPApplePhotosMomentMetadata;
  v5 = [(_BlastDoorLPApplePhotosMomentMetadata *)&v18 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"title");
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v5->_photoCount = [v4 decodeInt64ForKey:@"photoCount"];
    v5->_videoCount = [v4 decodeInt64ForKey:@"videoCount"];
    v5->_otherItemCount = [v4 decodeInt64ForKey:@"otherItemCount"];
    uint64_t v8 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"keyPhoto");
    keyPhoto = v5->_keyPhoto;
    v5->_keyPhoto = (_BlastDoorLPImage *)v8;

    uint64_t v10 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"expirationDate");
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v10;

    uint64_t v12 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"earliestAssetDate");
    earliestAssetDate = v5->_earliestAssetDate;
    v5->_earliestAssetDate = (NSDate *)v12;

    uint64_t v14 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"latestAssetDate");
    latestAssetDate = v5->_latestAssetDate;
    v5->_latestAssetDate = (NSDate *)v14;

    v16 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", title, @"title");
  [v5 encodeInt64:self->_photoCount forKey:@"photoCount"];
  [v5 encodeInt64:self->_videoCount forKey:@"videoCount"];
  [v5 encodeInt64:self->_otherItemCount forKey:@"otherItemCount"];
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_keyPhoto, @"keyPhoto");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_expirationDate, @"expirationDate");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_earliestAssetDate, @"earliestAssetDate");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_latestAssetDate, @"latestAssetDate");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_BlastDoorLPApplePhotosMomentMetadata allocWithZone:a3];
  if (v4)
  {
    id v5 = [(_BlastDoorLPApplePhotosMomentMetadata *)self title];
    [(_BlastDoorLPApplePhotosMomentMetadata *)v4 setTitle:v5];

    [(_BlastDoorLPApplePhotosMomentMetadata *)v4 setPhotoCount:[(_BlastDoorLPApplePhotosMomentMetadata *)self photoCount]];
    [(_BlastDoorLPApplePhotosMomentMetadata *)v4 setVideoCount:[(_BlastDoorLPApplePhotosMomentMetadata *)self videoCount]];
    [(_BlastDoorLPApplePhotosMomentMetadata *)v4 setOtherItemCount:[(_BlastDoorLPApplePhotosMomentMetadata *)self otherItemCount]];
    uint64_t v6 = [(_BlastDoorLPApplePhotosMomentMetadata *)self keyPhoto];
    [(_BlastDoorLPApplePhotosMomentMetadata *)v4 setKeyPhoto:v6];

    v7 = [(_BlastDoorLPApplePhotosMomentMetadata *)self expirationDate];
    [(_BlastDoorLPApplePhotosMomentMetadata *)v4 setExpirationDate:v7];

    uint64_t v8 = [(_BlastDoorLPApplePhotosMomentMetadata *)self earliestAssetDate];
    [(_BlastDoorLPApplePhotosMomentMetadata *)v4 setEarliestAssetDate:v8];

    v9 = [(_BlastDoorLPApplePhotosMomentMetadata *)self latestAssetDate];
    [(_BlastDoorLPApplePhotosMomentMetadata *)v4 setLatestAssetDate:v9];

    uint64_t v10 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_BlastDoorLPApplePhotosMomentMetadata;
  if ([(_BlastDoorLPApplePhotosMomentMetadata *)&v13 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v4;
      unint64_t v7 = v6[2];
      if ((!(v7 | (unint64_t)self->_title) || objc_msgSend((id)v7, "isEqual:"))
        && v6[3] == self->_photoCount
        && v6[4] == self->_videoCount
        && v6[5] == self->_otherItemCount
        && ((unint64_t v8 = v6[6], !(v8 | (unint64_t)self->_keyPhoto)) || objc_msgSend((id)v8, "isEqual:"))
        && ((unint64_t v9 = v6[7], !(v9 | (unint64_t)self->_expirationDate))
         || objc_msgSend((id)v9, "isEqual:"))
        && ((unint64_t v10 = v6[8], !(v10 | (unint64_t)self->_earliestAssetDate))
         || objc_msgSend((id)v10, "isEqual:")))
      {
        unint64_t v11 = v6[9];
        if (v11 | (unint64_t)self->_latestAssetDate) {
          char v5 = objc_msgSend((id)v11, "isEqual:");
        }
        else {
          char v5 = 1;
        }
      }
      else
      {
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_title hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"title", @"photoCount", @"videoCount", @"otherItemCount", @"keyPhoto", @"expirationDate", @"earliestAssetDate", @"latestAssetDate", 0);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (unint64_t)photoCount
{
  return self->_photoCount;
}

- (void)setPhotoCount:(unint64_t)a3
{
  self->_photoCount = a3;
}

- (unint64_t)videoCount
{
  return self->_videoCount;
}

- (void)setVideoCount:(unint64_t)a3
{
  self->_videoCount = a3;
}

- (unint64_t)otherItemCount
{
  return self->_otherItemCount;
}

- (void)setOtherItemCount:(unint64_t)a3
{
  self->_otherItemCount = a3;
}

- (_BlastDoorLPImage)keyPhoto
{
  return self->_keyPhoto;
}

- (void)setKeyPhoto:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSDate)earliestAssetDate
{
  return self->_earliestAssetDate;
}

- (void)setEarliestAssetDate:(id)a3
{
}

- (NSDate)latestAssetDate
{
  return self->_latestAssetDate;
}

- (void)setLatestAssetDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestAssetDate, 0);
  objc_storeStrong((id *)&self->_earliestAssetDate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_keyPhoto, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end