@interface EDAMLimitsConstants
+ (id)EDAM_DEVICE_DESCRIPTION_REGEX;
+ (id)EDAM_DEVICE_ID_REGEX;
+ (id)EDAM_MIME_TYPE_AMR;
+ (id)EDAM_MIME_TYPE_GIF;
+ (id)EDAM_MIME_TYPE_INK;
+ (id)EDAM_MIME_TYPE_JPEG;
+ (id)EDAM_MIME_TYPE_MP3;
+ (id)EDAM_MIME_TYPE_MP4_VIDEO;
+ (id)EDAM_MIME_TYPE_PDF;
+ (id)EDAM_MIME_TYPE_PNG;
+ (id)EDAM_MIME_TYPE_WAV;
+ (id)EDAM_NOTE_TITLE_REGEX;
+ (id)EDAM_TAG_NAME_REGEX;
+ (int)EDAM_DEVICE_DESCRIPTION_LEN_MAX;
+ (int)EDAM_DEVICE_ID_LEN_MAX;
+ (int)EDAM_NOTE_CONTENT_LEN_MAX;
+ (int)EDAM_NOTE_CONTENT_LEN_MIN;
+ (int)EDAM_NOTE_RESOURCES_MAX;
+ (int)EDAM_NOTE_TITLE_LEN_MAX;
+ (int)EDAM_NOTE_TITLE_LEN_MIN;
+ (int)EDAM_RESOURCE_SIZE_MAX_FREE;
+ (int)EDAM_RESOURCE_SIZE_MAX_PREMIUM;
+ (int)EDAM_TAG_NAME_LEN_MAX;
+ (int)EDAM_TAG_NAME_LEN_MIN;
@end

@implementation EDAMLimitsConstants

+ (id)EDAM_DEVICE_DESCRIPTION_REGEX
{
  return @"^[^\\p{Cc}]{1,64}$";
}

+ (int)EDAM_DEVICE_DESCRIPTION_LEN_MAX
{
  return 64;
}

+ (id)EDAM_DEVICE_ID_REGEX
{
  return @"^[^\\p{Cc}]{1,32}$";
}

+ (int)EDAM_DEVICE_ID_LEN_MAX
{
  return 32;
}

+ (int)EDAM_RESOURCE_SIZE_MAX_PREMIUM
{
  return 209715200;
}

+ (int)EDAM_RESOURCE_SIZE_MAX_FREE
{
  return 26214400;
}

+ (int)EDAM_NOTE_RESOURCES_MAX
{
  return 1000;
}

+ (int)EDAM_NOTE_CONTENT_LEN_MAX
{
  return 5242880;
}

+ (int)EDAM_NOTE_CONTENT_LEN_MIN
{
  return 0;
}

+ (id)EDAM_NOTE_TITLE_REGEX
{
  return @"^[^\\p{Cc}\\p{Z}]([^\\p{Cc}\\p{Zl}\\p{Zp}]{0,253}[^\\p{Cc}\\p{Z}])?$";
}

+ (int)EDAM_NOTE_TITLE_LEN_MAX
{
  return 255;
}

+ (int)EDAM_NOTE_TITLE_LEN_MIN
{
  return 1;
}

+ (id)EDAM_TAG_NAME_REGEX
{
  return @"^[^,\\p{Cc}\\p{Z}]([^,\\p{Cc}\\p{Zl}\\p{Zp}]{0,98}[^,\\p{Cc}\\p{Z}])?$";
}

+ (int)EDAM_TAG_NAME_LEN_MAX
{
  return 100;
}

+ (int)EDAM_TAG_NAME_LEN_MIN
{
  return 1;
}

+ (id)EDAM_MIME_TYPE_PDF
{
  return @"application/pdf";
}

+ (id)EDAM_MIME_TYPE_INK
{
  return @"application/vnd.evernote.ink";
}

+ (id)EDAM_MIME_TYPE_MP4_VIDEO
{
  return @"video/mp4";
}

+ (id)EDAM_MIME_TYPE_AMR
{
  return @"audio/amr";
}

+ (id)EDAM_MIME_TYPE_MP3
{
  return @"audio/mpeg";
}

+ (id)EDAM_MIME_TYPE_WAV
{
  return @"audio/wav";
}

+ (id)EDAM_MIME_TYPE_PNG
{
  return @"image/png";
}

+ (id)EDAM_MIME_TYPE_JPEG
{
  return @"image/jpeg";
}

+ (id)EDAM_MIME_TYPE_GIF
{
  return @"image/gif";
}

@end