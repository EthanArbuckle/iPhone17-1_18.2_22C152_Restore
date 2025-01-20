@interface AttachmentDownloadRestriction
+ (id)noSpaceForHighQualityLimit:(unint64_t)a3 qualityType:(unint64_t)a4 isSticker:(BOOL)a5 lqmEnabled:(BOOL)a6;
+ (id)noSpaceForLowQualityLimit:(unint64_t)a3 qualityType:(unint64_t)a4 isSticker:(BOOL)a5 lqmEnabled:(BOOL)a6;
+ (id)restrictionAllowedBySettingWithQualityType:(unint64_t)a3 isSticker:(BOOL)a4 lqmEnabled:(BOOL)a5;
+ (id)restrictionDisallowedBySettingWithQualityType:(unint64_t)a3 isSticker:(BOOL)a4 lqmEnabled:(BOOL)a5;
+ (id)restrictionForceAllowedWithQualityType:(unint64_t)a3 isSticker:(BOOL)a4 lqmEnabled:(BOOL)a5;
+ (id)restrictionWithLimitType:(unint64_t)a3 limitSize:(unint64_t)a4 qualityType:(unint64_t)a5 isSticker:(BOOL)a6 allowDownload:(BOOL)a7 lqmEnabled:(BOOL)a8;
- (AttachmentDownloadRestriction)initWithLimitType:(unint64_t)a3 limitSize:(unint64_t)a4 qualityType:(unint64_t)a5 isSticker:(BOOL)a6 allowDownload:(BOOL)a7 lqmEnabled:(BOOL)a8;
- (BOOL)allowDownload;
- (BOOL)isSticker;
- (BOOL)lqmEnabled;
- (unint64_t)limitSize;
- (unint64_t)limitType;
- (unint64_t)qualityType;
- (void)collectMetricsForDownloadedFile:(id)a3;
- (void)collectMetricsForLimitExceededWithReportedSize:(id)a3;
@end

@implementation AttachmentDownloadRestriction

+ (id)restrictionAllowedBySettingWithQualityType:(unint64_t)a3 isSticker:(BOOL)a4 lqmEnabled:(BOOL)a5
{
  v5 = [[AttachmentDownloadRestriction alloc] initWithLimitType:6 limitSize:0 qualityType:a3 isSticker:a4 allowDownload:1 lqmEnabled:a5];

  return v5;
}

+ (id)restrictionDisallowedBySettingWithQualityType:(unint64_t)a3 isSticker:(BOOL)a4 lqmEnabled:(BOOL)a5
{
  v5 = [[AttachmentDownloadRestriction alloc] initWithLimitType:6 limitSize:0 qualityType:a3 isSticker:a4 allowDownload:0 lqmEnabled:a5];

  return v5;
}

+ (id)restrictionForceAllowedWithQualityType:(unint64_t)a3 isSticker:(BOOL)a4 lqmEnabled:(BOOL)a5
{
  v5 = [[AttachmentDownloadRestriction alloc] initWithLimitType:5 limitSize:0 qualityType:a3 isSticker:a4 allowDownload:1 lqmEnabled:a5];

  return v5;
}

+ (id)noSpaceForLowQualityLimit:(unint64_t)a3 qualityType:(unint64_t)a4 isSticker:(BOOL)a5 lqmEnabled:(BOOL)a6
{
  v6 = [[AttachmentDownloadRestriction alloc] initWithLimitType:4 limitSize:a3 qualityType:a4 isSticker:a5 allowDownload:0 lqmEnabled:a6];

  return v6;
}

+ (id)noSpaceForHighQualityLimit:(unint64_t)a3 qualityType:(unint64_t)a4 isSticker:(BOOL)a5 lqmEnabled:(BOOL)a6
{
  v6 = [[AttachmentDownloadRestriction alloc] initWithLimitType:3 limitSize:a3 qualityType:a4 isSticker:a5 allowDownload:0 lqmEnabled:a6];

  return v6;
}

+ (id)restrictionWithLimitType:(unint64_t)a3 limitSize:(unint64_t)a4 qualityType:(unint64_t)a5 isSticker:(BOOL)a6 allowDownload:(BOOL)a7 lqmEnabled:(BOOL)a8
{
  v8 = [[AttachmentDownloadRestriction alloc] initWithLimitType:a3 limitSize:a4 qualityType:a5 isSticker:a6 allowDownload:a7 lqmEnabled:a8];

  return v8;
}

- (void)collectMetricsForDownloadedFile:(id)a3
{
  id v4 = a3;
  id v7 = +[IMMetricsCollector sharedInstance];
  unint64_t v5 = [(AttachmentDownloadRestriction *)self limitType];
  v6 = +[NSNumber numberWithUnsignedLongLong:[(AttachmentDownloadRestriction *)self limitSize]];
  objc_msgSend(v7, "trackAttachmentDownloadSuccess:limitType:limitSize:qualityType:isSticker:lowQualityModeEnabled:", v4, v5, v6, -[AttachmentDownloadRestriction qualityType](self, "qualityType"), -[AttachmentDownloadRestriction isSticker](self, "isSticker"), -[AttachmentDownloadRestriction lqmEnabled](self, "lqmEnabled"));
}

- (void)collectMetricsForLimitExceededWithReportedSize:(id)a3
{
  id v4 = a3;
  id v7 = +[IMMetricsCollector sharedInstance];
  unint64_t v5 = [(AttachmentDownloadRestriction *)self limitType];
  v6 = +[NSNumber numberWithUnsignedLongLong:[(AttachmentDownloadRestriction *)self limitSize]];
  objc_msgSend(v7, "trackAttachmentDownloadLimitExceeded:limitSize:fileSize:qualityType:isSticker:lowQualityModeEnabled:", v5, v6, v4, -[AttachmentDownloadRestriction qualityType](self, "qualityType"), -[AttachmentDownloadRestriction isSticker](self, "isSticker"), -[AttachmentDownloadRestriction lqmEnabled](self, "lqmEnabled"));
}

- (AttachmentDownloadRestriction)initWithLimitType:(unint64_t)a3 limitSize:(unint64_t)a4 qualityType:(unint64_t)a5 isSticker:(BOOL)a6 allowDownload:(BOOL)a7 lqmEnabled:(BOOL)a8
{
  v15.receiver = self;
  v15.super_class = (Class)AttachmentDownloadRestriction;
  result = [(AttachmentDownloadRestriction *)&v15 init];
  if (result)
  {
    result->_qualityType = a5;
    result->_limitSize = a4;
    result->_limitType = a3;
    result->_isSticker = a6;
    result->_allowDownload = a7;
    result->_lqmEnabled = a8;
  }
  return result;
}

- (unint64_t)limitType
{
  return self->_limitType;
}

- (unint64_t)qualityType
{
  return self->_qualityType;
}

- (unint64_t)limitSize
{
  return self->_limitSize;
}

- (BOOL)isSticker
{
  return self->_isSticker;
}

- (BOOL)allowDownload
{
  return self->_allowDownload;
}

- (BOOL)lqmEnabled
{
  return self->_lqmEnabled;
}

@end