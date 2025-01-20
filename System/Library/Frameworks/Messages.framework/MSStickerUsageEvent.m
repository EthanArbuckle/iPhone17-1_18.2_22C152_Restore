@interface MSStickerUsageEvent
+ (BOOL)isPreferredRepresentationAnimated:(id)a3;
+ (int64_t)autoSourceType;
+ (int64_t)effectTypeForMediaPayload:(id)a3;
+ (int64_t)effectTypeForSticker:(id)a3;
+ (int64_t)effectTypeFromVKCStickerEffectType:(unint64_t)a3;
+ (int64_t)stickerTypeFromExternalURI:(id)a3;
- (MSStickerUsageEvent)initWithMediaPayload:(id)a3;
- (MSStickerUsageEvent)initWithSticker:(id)a3;
- (int64_t)effectType;
- (int64_t)sourceType;
- (int64_t)stickerType;
- (int64_t)usageType;
- (void)send;
- (void)setEffectType:(int64_t)a3;
- (void)setSourceType:(int64_t)a3;
- (void)setStickerType:(int64_t)a3;
- (void)setUsageType:(int64_t)a3;
@end

@implementation MSStickerUsageEvent

+ (int64_t)autoSourceType
{
  return IMIsRunningIniMessageAppsViewService() != 0;
}

+ (int64_t)effectTypeFromVKCStickerEffectType:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return 0;
  }
  else {
    return qword_1E4AA8290[a3 - 1];
  }
}

+ (int64_t)stickerTypeFromExternalURI:(id)a3
{
  id v3 = a3;
  if ([v3 containsString:@"sticker:///user/"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 containsString:@"sticker:///memoji/"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 containsString:@"sticker:///emoji/"])
  {
    int64_t v4 = 2;
  }
  else
  {
    [v3 containsString:@"sticker:///third_party/"];
    int64_t v4 = 3;
  }

  return v4;
}

+ (BOOL)isPreferredRepresentationAnimated:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    int64_t v4 = [v3 firstObject];
    v5 = [v4 role];
    char v6 = [v5 isEqualToString:*MEMORY[0x1E4F441D0]];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (int64_t)effectTypeForSticker:(id)a3
{
  id v3 = a3;
  int64_t v4 = [v3 representations];
  BOOL v5 = +[MSStickerUsageEvent isPreferredRepresentationAnimated:v4];

  if (v5) {
    int64_t v6 = 5;
  }
  else {
    int64_t v6 = +[MSStickerUsageEvent effectTypeFromVKCStickerEffectType:](MSStickerUsageEvent, "effectTypeFromVKCStickerEffectType:", [v3 stickerEffectType]);
  }

  return v6;
}

+ (int64_t)effectTypeForMediaPayload:(id)a3
{
  id v3 = a3;
  int64_t v4 = [v3 stickerRepresentations];
  BOOL v5 = +[MSStickerUsageEvent isPreferredRepresentationAnimated:v4];

  if (v5) {
    int64_t v6 = 5;
  }
  else {
    int64_t v6 = +[MSStickerUsageEvent effectTypeFromVKCStickerEffectType:](MSStickerUsageEvent, "effectTypeFromVKCStickerEffectType:", [v3 stickerEffectType]);
  }

  return v6;
}

- (MSStickerUsageEvent)initWithSticker:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSStickerUsageEvent;
  BOOL v5 = [(MSStickerUsageEvent *)&v8 init];
  if (v5)
  {
    int64_t v6 = [v4 externalURI];
    [(MSStickerUsageEvent *)v5 setStickerType:+[MSStickerUsageEvent stickerTypeFromExternalURI:v6]];

    [(MSStickerUsageEvent *)v5 setEffectType:+[MSStickerUsageEvent effectTypeForSticker:v4]];
    [(MSStickerUsageEvent *)v5 setSourceType:+[MSStickerUsageEvent autoSourceType]];
  }

  return v5;
}

- (MSStickerUsageEvent)initWithMediaPayload:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSStickerUsageEvent;
  BOOL v5 = [(MSStickerUsageEvent *)&v8 init];
  if (v5)
  {
    int64_t v6 = [v4 externalURI];
    [(MSStickerUsageEvent *)v5 setStickerType:+[MSStickerUsageEvent stickerTypeFromExternalURI:v6]];

    [(MSStickerUsageEvent *)v5 setEffectType:+[MSStickerUsageEvent effectTypeForMediaPayload:v4]];
    [(MSStickerUsageEvent *)v5 setSourceType:+[MSStickerUsageEvent autoSourceType]];
  }

  return v5;
}

- (void)send
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"usageSource";
  id v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[MSStickerUsageEvent sourceType](self, "sourceType"));
  v9[0] = v3;
  v8[1] = @"stickerType";
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[MSStickerUsageEvent stickerType](self, "stickerType"));
  v9[1] = v4;
  v8[2] = @"usageType";
  BOOL v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[MSStickerUsageEvent usageType](self, "usageType"));
  v9[2] = v5;
  v8[3] = @"effectType";
  int64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[MSStickerUsageEvent effectType](self, "effectType"));
  v9[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  AnalyticsSendEvent();
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (int64_t)usageType
{
  return self->_usageType;
}

- (void)setUsageType:(int64_t)a3
{
  self->_usageType = a3;
}

- (int64_t)stickerType
{
  return self->_stickerType;
}

- (void)setStickerType:(int64_t)a3
{
  self->_stickerType = a3;
}

- (int64_t)effectType
{
  return self->_effectType;
}

- (void)setEffectType:(int64_t)a3
{
  self->_effectType = a3;
}

@end