@interface ENMIMEUtils
+ (id)determineMIMETypeForFile:(id)a3;
+ (id)fileExtensionForMIMEType:(id)a3;
+ (id)mimeTypeForUTI:(id)a3;
@end

@implementation ENMIMEUtils

+ (id)mimeTypeForUTI:(id)a3
{
  v3 = (__CFString *)a3;
  CFStringRef v4 = UTTypeCopyPreferredTagWithClass(v3, (CFStringRef)*MEMORY[0x263F01918]);
  if (v4)
  {
    v5 = (__CFString *)v4;
    if (CFStringGetLength(v4) > 0) {
      goto LABEL_9;
    }
    CFRelease(v5);
  }
  if ([(__CFString *)v3 isEqualToString:@"public.jpeg"])
  {
    v5 = @"image/jpeg";
  }
  else if ([(__CFString *)v3 isEqualToString:@"public.png"])
  {
    v5 = @"image/png";
  }
  else
  {
    v5 = 0;
  }
LABEL_9:

  return v5;
}

+ (id)determineMIMETypeForFile:(id)a3
{
  v3 = [a3 pathExtension];
  CFStringRef PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x263F01910], v3, 0);
  if (PreferredIdentifierForTag)
  {
    CFStringRef v5 = PreferredIdentifierForTag;
    CFStringRef v6 = UTTypeCopyPreferredTagWithClass(PreferredIdentifierForTag, (CFStringRef)*MEMORY[0x263F01918]);
    v7 = (void *)v6;
    if (v6 && CFStringGetLength(v6) <= 0)
    {
      CFRelease(v7);
      v7 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v7 = 0;
  }
  v8 = +[EDAMLimitsConstants EDAM_MIME_TYPE_GIF];
  if ([v7 isEqualToString:v8])
  {
  }
  else
  {
    int v9 = [(__CFString *)v3 isEqualToString:@"gif"];

    if (v9)
    {
      uint64_t v10 = +[EDAMLimitsConstants EDAM_MIME_TYPE_GIF];
LABEL_38:
      v23 = v7;
      v7 = (void *)v10;
      goto LABEL_39;
    }
  }
  v11 = +[EDAMLimitsConstants EDAM_MIME_TYPE_JPEG];
  if ([v7 isEqualToString:v11])
  {

    goto LABEL_15;
  }
  int v12 = [(__CFString *)v3 isEqualToString:@"jpg"];

  if (v12)
  {
    uint64_t v10 = +[EDAMLimitsConstants EDAM_MIME_TYPE_JPEG];
    goto LABEL_38;
  }
LABEL_15:
  v13 = +[EDAMLimitsConstants EDAM_MIME_TYPE_PNG];
  if ([v7 isEqualToString:v13])
  {

    goto LABEL_19;
  }
  int v14 = [(__CFString *)v3 isEqualToString:@"png"];

  if (v14)
  {
    uint64_t v10 = +[EDAMLimitsConstants EDAM_MIME_TYPE_PNG];
    goto LABEL_38;
  }
LABEL_19:
  v15 = +[EDAMLimitsConstants EDAM_MIME_TYPE_WAV];
  if ([v7 isEqualToString:v15])
  {

    goto LABEL_23;
  }
  int v16 = [(__CFString *)v3 isEqualToString:@"wav"];

  if (v16)
  {
    uint64_t v10 = +[EDAMLimitsConstants EDAM_MIME_TYPE_WAV];
    goto LABEL_38;
  }
LABEL_23:
  v17 = +[EDAMLimitsConstants EDAM_MIME_TYPE_MP3];
  if ([v7 isEqualToString:v17])
  {

    goto LABEL_27;
  }
  int v18 = [(__CFString *)v3 isEqualToString:@"mp3"];

  if (v18)
  {
    uint64_t v10 = +[EDAMLimitsConstants EDAM_MIME_TYPE_MP3];
    goto LABEL_38;
  }
LABEL_27:
  v19 = +[EDAMLimitsConstants EDAM_MIME_TYPE_AMR];
  if ([v7 isEqualToString:v19])
  {

    goto LABEL_31;
  }
  int v20 = [(__CFString *)v3 isEqualToString:@"amr"];

  if (v20)
  {
    uint64_t v10 = +[EDAMLimitsConstants EDAM_MIME_TYPE_AMR];
    goto LABEL_38;
  }
LABEL_31:
  v21 = +[EDAMLimitsConstants EDAM_MIME_TYPE_MP4_VIDEO];
  if ([v7 isEqualToString:v21])
  {

    goto LABEL_35;
  }
  int v22 = [(__CFString *)v3 isEqualToString:@"mp4"];

  if (v22)
  {
    uint64_t v10 = +[EDAMLimitsConstants EDAM_MIME_TYPE_MP4_VIDEO];
    goto LABEL_38;
  }
LABEL_35:
  v23 = +[EDAMLimitsConstants EDAM_MIME_TYPE_PDF];
  if (([v7 isEqualToString:v23] & 1) == 0)
  {
    int v24 = [(__CFString *)v3 isEqualToString:@"pdf"];

    if (!v24) {
      goto LABEL_40;
    }
    uint64_t v10 = +[EDAMLimitsConstants EDAM_MIME_TYPE_PDF];
    goto LABEL_38;
  }
LABEL_39:

LABEL_40:
  return v7;
}

+ (id)fileExtensionForMIMEType:(id)a3
{
  v3 = (__CFString *)a3;
  CFStringRef v4 = +[EDAMLimitsConstants EDAM_MIME_TYPE_INK];
  char v5 = [(__CFString *)v3 isEqualToString:v4];

  if (v5)
  {
    CFStringRef v6 = @"png";
    goto LABEL_42;
  }
  CFStringRef PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x263F01918], v3, 0);
  if (PreferredIdentifierForTag)
  {
    CFStringRef v8 = PreferredIdentifierForTag;
    CFStringRef v9 = UTTypeCopyPreferredTagWithClass(PreferredIdentifierForTag, (CFStringRef)*MEMORY[0x263F01910]);
    CFStringRef v6 = (__CFString *)v9;
    if (v9 && CFStringGetLength(v9) <= 0)
    {
      CFRelease(v6);
      CFStringRef v6 = 0;
    }
    CFRelease(v8);
  }
  else
  {
    CFStringRef v6 = 0;
  }
  uint64_t v10 = +[EDAMLimitsConstants EDAM_MIME_TYPE_GIF];
  if ([(__CFString *)v3 isEqualToString:v10])
  {
    v11 = @"gif";
    char v12 = [(__CFString *)v6 isEqualToString:@"gif"];

    if ((v12 & 1) == 0) {
      goto LABEL_40;
    }
  }
  else
  {
  }
  v13 = +[EDAMLimitsConstants EDAM_MIME_TYPE_JPEG];
  if ([(__CFString *)v3 isEqualToString:v13])
  {
    v11 = @"jpg";
    char v14 = [(__CFString *)v6 isEqualToString:@"jpg"];

    if ((v14 & 1) == 0) {
      goto LABEL_40;
    }
  }
  else
  {
  }
  v15 = +[EDAMLimitsConstants EDAM_MIME_TYPE_PNG];
  if (([(__CFString *)v3 isEqualToString:v15] & 1) != 0
    || [(__CFString *)v3 isEqualToString:@"image/x-png"])
  {
    v11 = @"png";
    char v16 = [(__CFString *)v6 isEqualToString:@"png"];

    if ((v16 & 1) == 0) {
      goto LABEL_40;
    }
  }
  else
  {
  }
  v17 = +[EDAMLimitsConstants EDAM_MIME_TYPE_WAV];
  if ([(__CFString *)v3 isEqualToString:v17])
  {
    v11 = @"wav";
    char v18 = [(__CFString *)v6 isEqualToString:@"wav"];

    if ((v18 & 1) == 0) {
      goto LABEL_40;
    }
  }
  else
  {
  }
  v19 = +[EDAMLimitsConstants EDAM_MIME_TYPE_MP3];
  if ([(__CFString *)v3 isEqualToString:v19])
  {
    v11 = @"mp3";
    char v20 = [(__CFString *)v6 isEqualToString:@"mp3"];

    if ((v20 & 1) == 0) {
      goto LABEL_40;
    }
  }
  else
  {
  }
  v21 = +[EDAMLimitsConstants EDAM_MIME_TYPE_AMR];
  if ([(__CFString *)v3 isEqualToString:v21])
  {
    v11 = @"amr";
    char v22 = [(__CFString *)v6 isEqualToString:@"amr"];

    if ((v22 & 1) == 0) {
      goto LABEL_40;
    }
  }
  else
  {
  }
  v23 = +[EDAMLimitsConstants EDAM_MIME_TYPE_MP4_VIDEO];
  if ([(__CFString *)v3 isEqualToString:v23])
  {
    v11 = @"mp4";
    char v24 = [(__CFString *)v6 isEqualToString:@"mp4"];

    if ((v24 & 1) == 0) {
      goto LABEL_40;
    }
  }
  else
  {
  }
  v25 = +[EDAMLimitsConstants EDAM_MIME_TYPE_INK];
  if ([(__CFString *)v3 isEqualToString:v25])
  {
    v11 = @"png";
    char v26 = [(__CFString *)v6 isEqualToString:@"png"];

    if ((v26 & 1) == 0)
    {
LABEL_40:
      v27 = v6;
      goto LABEL_41;
    }
  }
  else
  {
  }
  v27 = +[EDAMLimitsConstants EDAM_MIME_TYPE_PDF];
  if (![(__CFString *)v3 isEqualToString:v27])
  {
    v11 = v6;
    goto LABEL_41;
  }
  v11 = @"pdf";
  char v29 = [(__CFString *)v6 isEqualToString:@"pdf"];

  v27 = v6;
  if ((v29 & 1) == 0)
  {
LABEL_41:

    CFStringRef v6 = v11;
  }
LABEL_42:

  return v6;
}

@end