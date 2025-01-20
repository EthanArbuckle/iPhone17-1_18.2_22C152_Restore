@interface MFMimeTextAttachment
- (BOOL)hasBeenDownloaded;
- (MFMimeTextAttachment)initWithMimePart:(id)a3;
- (id)_displayedMimePart;
- (unsigned)approximateSize;
- (void)download;
@end

@implementation MFMimeTextAttachment

- (MFMimeTextAttachment)initWithMimePart:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFMimeTextAttachment;
  v5 = [(MFMessageTextAttachment *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MFMessageTextAttachment *)v5 setMimePart:v4];
  }

  return v6;
}

- (id)_displayedMimePart
{
  v2 = [(MFMessageTextAttachment *)self mimePart];
  v3 = [v2 type];
  if (![v3 isEqualToString:@"multipart"]) {
    goto LABEL_11;
  }
  id v4 = [v2 subtype];
  int v5 = [v4 isEqualToString:@"appledouble"];

  if (!v5) {
    goto LABEL_13;
  }
  v3 = [v2 subparts];
  unint64_t v6 = [v3 count];
  uint64_t v7 = v6 >= 2 ? 2 : v6;
  if (v7)
  {
    uint64_t v8 = 0;
    while (1)
    {
      v9 = [v3 objectAtIndex:v8];
      v10 = [v9 type];
      if (([v10 isEqualToString:@"application"] & 1) == 0) {
        break;
      }
      v11 = [v9 subtype];
      char v12 = [v11 isEqualToString:@"applefile"];

      if ((v12 & 1) == 0) {
        goto LABEL_17;
      }

      if (v7 == ++v8) {
        goto LABEL_11;
      }
    }

LABEL_17:
  }
  else
  {
LABEL_11:
    v9 = v2;
  }

  v2 = v9;
LABEL_13:
  return v2;
}

- (void)download
{
  v3 = [(MFMimeTextAttachment *)self _displayedMimePart];
  id v4 = [v3 fileWrapperForcingDownload:1];

  if (v4) {
    [(MFMessageTextAttachment *)self setFileWrapper:v4];
  }
}

- (BOOL)hasBeenDownloaded
{
  v7.receiver = self;
  v7.super_class = (Class)MFMimeTextAttachment;
  if ([(MFMessageTextAttachment *)&v7 hasBeenDownloaded]) {
    return 1;
  }
  id v4 = (void *)MEMORY[0x1B3E87F20]();
  int v5 = [(MFMessageTextAttachment *)self mimePart];
  char v3 = [v5 hasContents];

  return v3;
}

- (unsigned)approximateSize
{
  if ([(MFMessageTextAttachment *)self isPlaceholder])
  {
    char v3 = [(MFMessageTextAttachment *)self mimePart];
    unsigned int v4 = [v3 approximateRawSize];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MFMimeTextAttachment;
    return [(MFMessageTextAttachment *)&v6 approximateSize];
  }
  return v4;
}

@end