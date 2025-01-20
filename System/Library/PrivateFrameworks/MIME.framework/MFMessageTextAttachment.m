@interface MFMessageTextAttachment
+ (unint64_t)precedenceLevel;
- (BOOL)hasBeenDownloaded;
- (BOOL)isPlaceholder;
- (BOOL)needsRedownload;
- (BOOL)shouldDownloadAttachmentOnDisplay;
- (MFMessageFileWrapper)fileWrapper;
- (MFMessageTextAttachment)init;
- (MFMessageTextAttachment)initWithWrapper:(id)a3;
- (id)cachedValueForKey:(id)a3;
- (id)description;
- (id)fileWrapperForcingDownload:(BOOL)a3;
- (id)mimePart;
- (id)textEncodingGuess;
- (id)textEncodingNameForData:(id)a3 mimeType:(id)a4;
- (unsigned)approximateSize;
- (void)inlineDisplayData:(id *)a3 mimeType:(id *)a4;
- (void)setCachedValue:(id)a3 forKey:(id)a4;
- (void)setFileWrapper:(id)a3;
- (void)setMimePart:(id)a3;
@end

@implementation MFMessageTextAttachment

- (id)cachedValueForKey:(id)a3
{
  id v4 = a3;
  [(NSMutableDictionary *)self->_cache mf_lock];
  v5 = [(NSMutableDictionary *)self->_cache objectForKey:v4];
  [(NSMutableDictionary *)self->_cache mf_unlock];

  return v5;
}

- (void)setCachedValue:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(NSMutableDictionary *)self->_cache mf_lock];
  cache = self->_cache;
  if (v8) {
    [(NSMutableDictionary *)cache setObject:v8 forKey:v6];
  }
  else {
    [(NSMutableDictionary *)cache removeObjectForKey:v6];
  }
  [(NSMutableDictionary *)self->_cache mf_unlock];
}

- (void)setMimePart:(id)a3
{
}

- (id)mimePart
{
  return [(MFMessageTextAttachment *)self cachedValueForKey:@"kMimeTextAttachmentMimePart"];
}

- (MFMessageTextAttachment)init
{
  id v3 = [(MFMessageFileWrapper *)[MFPlaceholderFileWrapper alloc] initRegularFileWithContents:0];
  id v4 = [(MFMessageTextAttachment *)self initWithWrapper:v3];

  return v4;
}

- (MFMessageTextAttachment)initWithWrapper:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMessageTextAttachment;
  v5 = [(MFMessageTextAttachment *)&v9 init];
  if (v5)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cache = v5->_cache;
    v5->_cache = v6;

    [(MFMessageTextAttachment *)v5 setCachedValue:v4 forKey:@"kMessageTextAttachmentFileWrapper"];
  }

  return v5;
}

- (MFMessageFileWrapper)fileWrapper
{
  return (MFMessageFileWrapper *)[(MFMessageTextAttachment *)self cachedValueForKey:@"kMessageTextAttachmentFileWrapper"];
}

- (id)fileWrapperForcingDownload:(BOOL)a3
{
  if (a3 && [(MFMessageTextAttachment *)self isPlaceholder]) {
    [(MFMessageTextAttachment *)self download];
  }
  return [(MFMessageTextAttachment *)self fileWrapper];
}

- (void).cxx_destruct
{
}

- (id)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)MFMessageTextAttachment;
  id v4 = [(MFMessageTextAttachment *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@\n\tcache: %@", v4, self->_cache];

  return v5;
}

- (void)setFileWrapper:(id)a3
{
}

- (unsigned)approximateSize
{
  id v8 = [(MFMessageTextAttachment *)self fileWrapper];
  if (!v8) {
    return 0;
  }
  v2 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA48]) initWithObjects:&v8 count:1];
  unsigned int v3 = 0;
  while ([v2 count])
  {
    id v4 = [v2 lastObject];
    [v2 removeLastObject];
    if ([v4 isSymbolicLink])
    {
      v3 += 1024;
      goto LABEL_12;
    }
    if ([v4 isDirectory])
    {
      v5 = [v4 fileWrappers];
      id v6 = [v5 allValues];

      if (v6) {
        [v2 addObjectsFromArray:v6];
      }
    }
    else
    {
      if (![v4 isRegularFile]) {
        goto LABEL_12;
      }
      id v6 = [v4 regularFileContents];
      v3 += [v6 length];
    }

LABEL_12:
  }

  return v3;
}

- (BOOL)hasBeenDownloaded
{
  return ![(MFMessageTextAttachment *)self isPlaceholder];
}

- (BOOL)needsRedownload
{
  return 0;
}

- (BOOL)isPlaceholder
{
  v2 = [(MFMessageTextAttachment *)self fileWrapperForcingDownload:0];
  char v3 = [v2 isPlaceholder];

  return v3;
}

- (void)inlineDisplayData:(id *)a3 mimeType:(id *)a4
{
  id v6 = [(MFMessageTextAttachment *)self fileWrapperForcingDownload:a3 != 0];
  id v7 = v6;
  if (a3)
  {
    *a3 = [v6 regularFileContents];
    id v6 = v7;
  }
  if (a4)
  {
    *a4 = [v6 mimeType];
    id v6 = v7;
  }
}

+ (unint64_t)precedenceLevel
{
  return 1;
}

- (BOOL)shouldDownloadAttachmentOnDisplay
{
  return 0;
}

- (id)textEncodingGuess
{
  return 0;
}

- (id)textEncodingNameForData:(id)a3 mimeType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7) {
    goto LABEL_9;
  }
  id v9 = v7;
  if (!strcmp("text/html", (const char *)[v9 UTF8String]))
  {
    CFAllocatorRef Default = CFAllocatorGetDefault();
    CFAllocatorRef v15 = (const __CFAllocator *)MFGetMappedAllocator();
    CFAllocatorSetDefault(v15);
    id v16 = v6;
    CFStringRef v17 = CFStringCreateWithBytes(v15, (const UInt8 *)[v16 bytes], objc_msgSend(v16, "length"), 0x8000100u, 0);
    CFAllocatorSetDefault(Default);
    if (v17)
    {
      CFRelease(v17);
      v13 = @"UTF-8";
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (![v9 hasPrefix:@"text/"])
  {
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  uint64_t v10 = [(MFMessageTextAttachment *)self textEncodingGuess];
  v11 = (void *)v10;
  v12 = @"UTF-8";
  if (v10) {
    v12 = (__CFString *)v10;
  }
  v13 = v12;

LABEL_10:
  return v13;
}

@end