@interface MFAttachment
- (BOOL)isCSV;
- (BOOL)isCertificate;
- (BOOL)isDXF;
- (BOOL)isExcel;
- (BOOL)isGIF;
- (BOOL)isHTML;
- (BOOL)isMSWord;
- (BOOL)isPlainText;
- (BOOL)isPowerpoint;
- (BOOL)isProfile;
- (BOOL)isRTF;
- (BOOL)isVCard;
- (BOOL)isVPN;
- (BOOL)isWatchFace;
- (BOOL)isWorkout;
- (BOOL)isZip;
- (unint64_t)nanoAttachmentType;
@end

@implementation MFAttachment

- (unint64_t)nanoAttachmentType
{
  if ([(MFAttachment *)self isDXF]) {
    return 2;
  }
  if ([(MFAttachment *)self isPDFFile]) {
    return 14;
  }
  if ([(MFAttachment *)self isImageFile])
  {
    if ([(MFAttachment *)self isGIF]) {
      return 22;
    }
    else {
      return 5;
    }
  }
  else if ([(MFAttachment *)self isMedia])
  {
    return 6;
  }
  else if ([(MFAttachment *)self isRFC822])
  {
    return 7;
  }
  else if ([(MFAttachment *)self isCalendarFile])
  {
    return 13;
  }
  else if ([(MFAttachment *)self isPass])
  {
    return 20;
  }
  else if ([(MFAttachment *)self isRTF])
  {
    return 10;
  }
  else if ([(MFAttachment *)self isCSV])
  {
    return 11;
  }
  else if ([(MFAttachment *)self isHTML])
  {
    return 16;
  }
  else if ([(MFAttachment *)self isVCard])
  {
    return 4;
  }
  else if ([(MFAttachment *)self isZip])
  {
    return 15;
  }
  else if ([(MFAttachment *)self isExcel])
  {
    return 17;
  }
  else if ([(MFAttachment *)self isPowerpoint])
  {
    return 18;
  }
  else if ([(MFAttachment *)self isMSWord])
  {
    return 19;
  }
  else if ([(MFAttachment *)self isCertificate])
  {
    return 12;
  }
  else if ([(MFAttachment *)self isProfile])
  {
    return 3;
  }
  else if ([(MFAttachment *)self isVPN])
  {
    return 8;
  }
  else if ([(MFAttachment *)self isWatchFace])
  {
    return 21;
  }
  else if ([(MFAttachment *)self isWorkout])
  {
    return 23;
  }
  else if ([(MFAttachment *)self isPlainText])
  {
    return 9;
  }
  else
  {
    return 1;
  }
}

- (BOOL)isGIF
{
  v3 = [UTTypeGIF identifier];
  v4 = [(MFAttachment *)self contentTypeIdentifier];
  BOOL v5 = [v3 compare:v4] == 0;

  return v5;
}

- (BOOL)isDXF
{
  v2 = [(MFAttachment *)self mimeType];
  BOOL v3 = [@"image/vnd.dxf" caseInsensitiveCompare:v2] == 0;

  return v3;
}

- (BOOL)isProfile
{
  BOOL v3 = [(MFAttachment *)self contentTypeIdentifier];
  if ([@"com.apple.mobileconfig" compare:v3])
  {
    v4 = [(MFAttachment *)self contentTypeIdentifier];
    BOOL v5 = [@"com.apple.mobileprovision" compare:v4] == 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)isVCard
{
  BOOL v3 = [UTTypeVCard identifier];
  v4 = [(MFAttachment *)self contentTypeIdentifier];
  BOOL v5 = [v3 compare:v4] == 0;

  return v5;
}

- (BOOL)isVPN
{
  BOOL v3 = [UTTypePKCS12 identifier];
  v4 = [(MFAttachment *)self contentTypeIdentifier];
  BOOL v5 = [v3 compare:v4] == 0;

  return v5;
}

- (BOOL)isPlainText
{
  v2 = [(MFAttachment *)self contentTypeIdentifier];
  char IsPlainText = MFContentTypeIsPlainText();

  return IsPlainText;
}

- (BOOL)isRTF
{
  BOOL v3 = [UTTypeRTF identifier];
  v4 = [(MFAttachment *)self contentTypeIdentifier];
  BOOL v5 = [v3 compare:v4] == 0;

  return v5;
}

- (BOOL)isCSV
{
  BOOL v3 = [UTTypeCommaSeparatedText identifier];
  v4 = [(MFAttachment *)self contentTypeIdentifier];
  BOOL v5 = [v3 compare:v4] == 0;

  return v5;
}

- (BOOL)isCertificate
{
  BOOL v3 = [UTTypeX509Certificate identifier];
  v4 = [(MFAttachment *)self contentTypeIdentifier];
  BOOL v5 = [v3 compare:v4] == 0;

  return v5;
}

- (BOOL)isZip
{
  BOOL v3 = [UTTypeZIP identifier];
  v4 = [(MFAttachment *)self contentTypeIdentifier];
  if ([v3 compare:v4])
  {
    BOOL v5 = [UTTypeGZIP identifier];
    v6 = [(MFAttachment *)self contentTypeIdentifier];
    if ([v5 compare:v6])
    {
      v7 = [UTTypeBZ2 identifier];
      v8 = [(MFAttachment *)self contentTypeIdentifier];
      BOOL v9 = [v7 compare:v8] == 0;
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)isHTML
{
  BOOL v3 = [UTTypeHTML identifier];
  v4 = [(MFAttachment *)self contentTypeIdentifier];
  BOOL v5 = [v3 compare:v4] == 0;

  return v5;
}

- (BOOL)isExcel
{
  BOOL v3 = +[NSSet setWithObjects:@"application/vnd.ms-excel", @"application/vnd.ms-excel.sheet.macroenabled.12", @"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", @"application/vnd.ms-excel.template.macroenabled.12", @"application/vnd.openxmlformats-officedocument.spreadsheetml.template", 0];
  v4 = [(MFAttachment *)self mimeType];
  if (v4)
  {
    BOOL v5 = [(MFAttachment *)self mimeType];
    unsigned __int8 v6 = [v3 containsObject:v5];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)isPowerpoint
{
  BOOL v3 = +[NSSet setWithObjects:@"application/vnd.ms-powerpoint", @"application/vnd.ms-powerpoint", @"application/vnd.ms-powerpoint.template.macroenabled.12", @"application/vnd.openxmlformats-officedocument.presentationml.template", @"application/vnd.ms-powerpoint.slideshow.macroenabled.12", @"application/vnd.openxmlformats-officedocument.presentationml.slideshow", @"application/vnd.ms-powerpoint.presentation.macroenabled.12", @"application/vnd.openxmlformats-officedocument.presentationml.presentation", 0];
  v4 = [(MFAttachment *)self mimeType];
  if (v4)
  {
    BOOL v5 = [(MFAttachment *)self mimeType];
    unsigned __int8 v6 = [v3 containsObject:v5];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)isMSWord
{
  BOOL v3 = +[NSSet setWithObjects:@"application/msword", @"application/vnd.ms-word.document.macroenabled.12", @"application/vnd.openxmlformats-officedocument.wordprocessingml.document", @"application/vnd.ms-word.template.macroenabled.12", @"application/vnd.openxmlformats-officedocument.wordprocessingml.template", 0];
  v4 = [(MFAttachment *)self mimeType];
  if (v4)
  {
    BOOL v5 = [(MFAttachment *)self mimeType];
    unsigned __int8 v6 = [v3 containsObject:v5];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)isWatchFace
{
  v2 = [(MFAttachment *)self contentTypeIdentifier];
  BOOL v3 = [@"com.apple.watchface" compare:v2] == 0;

  return v3;
}

- (BOOL)isWorkout
{
  v2 = [(MFAttachment *)self contentType];
  BOOL v3 = [v2 identifier];
  BOOL v4 = [@"com.apple.workout" compare:v3] == 0;

  return v4;
}

@end