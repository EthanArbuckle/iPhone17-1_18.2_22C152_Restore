@interface MFMessageFileWrapper
- (BOOL)isDirectory;
- (BOOL)isImageFile;
- (BOOL)isPDFFile;
- (BOOL)isPlaceholder;
- (BOOL)isRegularFile;
- (BOOL)isSymbolicLink;
- (BOOL)isUnzippableFile;
- (MFMessageFileWrapper)initWithPath:(id)a3;
- (NSString)path;
- (id)URL;
- (id)contentID;
- (id)description;
- (id)eventUniqueID;
- (id)fileAttributes;
- (id)fileProtection;
- (id)fileWrappers;
- (id)filename;
- (id)icsRepresentation;
- (id)inferredMimeType;
- (id)initRegularFileWithContents:(id)a3;
- (id)initSymbolicLinkWithDestination:(id)a3;
- (id)meetingStorePersistentID;
- (id)messageID;
- (id)mimeType;
- (id)preferredFilename;
- (id)regularFileContents;
- (id)symbolicLinkDestination;
- (unint64_t)fileSize;
- (unsigned)creator;
- (unsigned)finderFlags;
- (unsigned)type;
- (void)_isImage:(BOOL *)a3 orPDFFile:(BOOL *)a4;
- (void)dealloc;
- (void)setContentID:(id)a3;
- (void)setCreator:(unsigned int)a3;
- (void)setEventUniqueID:(id)a3;
- (void)setFileAttributes:(id)a3;
- (void)setFileProtection:(id)a3;
- (void)setFilename:(id)a3;
- (void)setFinderFlags:(unsigned __int16)a3;
- (void)setICSRepresentation:(id)a3;
- (void)setMeetingStorePersistentID:(id)a3;
- (void)setMessageID:(id)a3;
- (void)setMimeType:(id)a3;
- (void)setPath:(id)a3;
- (void)setPreferredFilename:(id)a3;
- (void)setType:(unsigned int)a3;
- (void)setURL:(id)a3;
@end

@implementation MFMessageFileWrapper

- (void)setPreferredFilename:(id)a3
{
  id v4 = a3;
  id v7 = [v4 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

  [self mf_lock];
  v5 = (NSString *)[v7 copy];
  preferredFilename = self->_preferredFilename;
  self->_preferredFilename = v5;

  [self mf_unlock];
}

- (void)setMimeType:(id)a3
{
}

- (void)setFileProtection:(id)a3
{
}

- (void)setFileAttributes:(id)a3
{
  id v6 = a3;
  id v4 = (NSMutableDictionary *)[v6 mutableCopy];
  attributes = self->_attributes;
  self->_attributes = v4;
}

- (id)preferredFilename
{
  [self mf_lock];
  v3 = (void *)[(NSString *)self->_preferredFilename copy];
  [self mf_unlock];
  return v3;
}

- (id)mimeType
{
  v2 = [(MFMessageFileWrapper *)self fileAttributes];
  v3 = [v2 objectForKey:@"_MFMimeType"];

  return v3;
}

- (id)initRegularFileWithContents:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFMessageFileWrapper;
  v5 = [(MFMessageFileWrapper *)&v11 init];
  id v6 = v5;
  if (v5)
  {
    v5->_type = 0;
    [(MFMessageFileWrapper *)v5 setFileProtection:*MEMORY[0x1E4F28348]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = (MFData *)v4;
    }
    else {
      id v7 = [[MFData alloc] initWithImmutableData:v4];
    }
    data = v6->_data;
    v6->_data = &v7->super;

    v9 = v6;
  }

  return v6;
}

- (id)fileAttributes
{
  return self->_attributes;
}

- (void)dealloc
{
  [(MFMessageFileWrapper *)self setMimeType:0];
  v3.receiver = self;
  v3.super_class = (Class)MFMessageFileWrapper;
  [(MFMessageFileWrapper *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_linkDestination, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_preferredFilename, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)setType:(unsigned int)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;
  _changeFileAttributes(self, (void *)*MEMORY[0x1E4F282F0], v4);
}

- (unsigned)type
{
  v2 = [(MFMessageFileWrapper *)self fileAttributes];
  unsigned int v3 = [v2 fileHFSTypeCode];

  return v3;
}

- (void)setCreator:(unsigned int)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;
  _changeFileAttributes(self, (void *)*MEMORY[0x1E4F282E8], v4);
}

- (unsigned)creator
{
  v2 = [(MFMessageFileWrapper *)self fileAttributes];
  unsigned int v3 = [v2 fileHFSCreatorCode];

  return v3;
}

- (void)setFinderFlags:(unsigned __int16)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;
  _changeFileAttributes(self, @"_MFFinderFlags", v4);
}

- (unsigned)finderFlags
{
  v2 = [(MFMessageFileWrapper *)self fileAttributes];
  unsigned int v3 = [v2 objectForKey:@"_MFFinderFlags"];
  unsigned __int16 v4 = [v3 unsignedShortValue];

  return v4;
}

- (id)inferredMimeType
{
  v2 = [(MFMessageFileWrapper *)self preferredFilename];
  unsigned int v3 = _mimeTypeFromFileName(v2);

  return v3;
}

- (void)setContentID:(id)a3
{
}

- (id)contentID
{
  v2 = [(MFMessageFileWrapper *)self fileAttributes];
  unsigned int v3 = [v2 objectForKey:@"_MFContentID"];

  return v3;
}

- (void)setMessageID:(id)a3
{
}

- (id)messageID
{
  v2 = [(MFMessageFileWrapper *)self fileAttributes];
  unsigned int v3 = [v2 objectForKey:@"_MFMessageID"];

  return v3;
}

- (void)setEventUniqueID:(id)a3
{
}

- (id)eventUniqueID
{
  v2 = [(MFMessageFileWrapper *)self fileAttributes];
  unsigned int v3 = [v2 objectForKey:@"_MFEventUniqueID"];

  return v3;
}

- (void)setMeetingStorePersistentID:(id)a3
{
}

- (id)meetingStorePersistentID
{
  v2 = [(MFMessageFileWrapper *)self fileAttributes];
  unsigned int v3 = [v2 objectForKey:@"_MFMeetingStorePersistentID"];

  return v3;
}

- (void)setICSRepresentation:(id)a3
{
}

- (id)icsRepresentation
{
  v2 = [(MFMessageFileWrapper *)self fileAttributes];
  unsigned int v3 = [v2 objectForKey:@"_MFICSRepresentation"];

  return v3;
}

- (id)fileProtection
{
  v2 = [(MFMessageFileWrapper *)self fileAttributes];
  unsigned int v3 = [v2 objectForKey:*MEMORY[0x1E4F28370]];

  return v3;
}

- (unint64_t)fileSize
{
  return [(NSData *)self->_data length];
}

- (void)_isImage:(BOOL *)a3 orPDFFile:(BOOL *)a4
{
  unsigned __int16 v4 = a4;
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  id v15 = [(MFMessageFileWrapper *)self mimeType];
  if (objc_msgSend(@"application/pdf", "caseInsensitiveCompare:")
    && [@"image/pdf" caseInsensitiveCompare:v15])
  {
    if ([v15 hasPrefix:@"image/"])
    {
      if (a3) {
        *a3 = 1;
      }
      goto LABEL_24;
    }
    id v7 = objc_alloc_init(MFTypeInfo);
    v8 = [(MFMessageFileWrapper *)self preferredFilename];
    v9 = [v8 pathExtension];
    [(MFTypeInfo *)v7 setPathExtension:v9];

    v10 = [(MFMessageFileWrapper *)self filename];
    [(MFTypeInfo *)v7 setFilename:v10];

    if (MFGetTypeInfo(v7, 1))
    {
      objc_super v11 = [(MFTypeInfo *)v7 mimeType];
      uint64_t v12 = [v11 rangeOfString:@"image/" options:9];

      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = [(MFTypeInfo *)v7 mimeType];
        uint64_t v14 = [v13 caseInsensitiveCompare:@"application/pdf"];

        if (v14) {
          goto LABEL_23;
        }
        if (a3) {
          *a3 = 0;
        }
        if (!v4) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }
      unsigned __int16 v4 = a3;
      if (a3) {
LABEL_22:
      }
        *unsigned __int16 v4 = 1;
    }
LABEL_23:

    goto LABEL_24;
  }
  if (a3) {
    *a3 = 0;
  }
  if (v4) {
    *unsigned __int16 v4 = 1;
  }
LABEL_24:
}

- (BOOL)isImageFile
{
  BOOL v3 = 0;
  [(MFMessageFileWrapper *)self _isImage:&v3 orPDFFile:0];
  return v3;
}

- (BOOL)isPDFFile
{
  BOOL v3 = 0;
  [(MFMessageFileWrapper *)self _isImage:0 orPDFFile:&v3];
  return v3;
}

- (BOOL)isUnzippableFile
{
  v2 = [(MFMessageFileWrapper *)self preferredFilename];
  BOOL v3 = [v2 pathExtension];
  if ([v3 caseInsensitiveCompare:@"zip"])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [v2 stringByDeletingPathExtension];
    id v6 = [v5 pathExtension];
    BOOL v4 = [v6 length] != 0;
  }
  return v4;
}

- (MFMessageFileWrapper)initWithPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  memset(__b, 170, sizeof(__b));
  v15.receiver = self;
  v15.super_class = (Class)MFMessageFileWrapper;
  id v6 = [(MFMessageFileWrapper *)&v15 init];
  if (v6 && [v5 getFileSystemRepresentation:__b maxLength:1023])
  {
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    v8 = [v7 attributesOfItemAtPath:v5 error:0];

    if (v8)
    {
      v9 = [v8 objectForKey:*MEMORY[0x1E4F283B8]];
      if ([v9 isEqualToString:*MEMORY[0x1E4F283C8]])
      {
        [(MFMessageFileWrapper *)v6 setType:0];
        v10 = [[MFData alloc] initWithContentsOfFile:v5 options:1 error:0];
        data = v6->_data;
        v6->_data = &v10->super;

        uint64_t v12 = _mimeTypeFromFileName(v5);
        [(MFMessageFileWrapper *)v6 setMimeType:v12];
      }
      else if ([v9 isEqualToString:*MEMORY[0x1E4F283D0]])
      {
        [(MFMessageFileWrapper *)v6 setType:1];
      }
      objc_storeStrong((id *)&v6->_path, a3);
      v13 = [v5 lastPathComponent];
      [(MFMessageFileWrapper *)v6 setPreferredFilename:v13];

      __b[1023] = 0;
      _fixSubwrappersAtPath(v6, (uint64_t)__b);
    }
    else
    {
      v9 = v6;
      id v6 = 0;
    }
  }
  return v6;
}

- (BOOL)isPlaceholder
{
  return 0;
}

- (id)URL
{
  return self->_url;
}

- (void)setURL:(id)a3
{
  id v5 = a3;
  _MFLockGlobalLock();
  objc_storeStrong((id *)&self->_url, a3);
  _MFUnlockGlobalLock();
}

- (id)initSymbolicLinkWithDestination:(id)a3
{
  BOOL v4 = (NSString *)a3;
  v8.receiver = self;
  v8.super_class = (Class)MFMessageFileWrapper;
  id v5 = [(MFMessageFileWrapper *)&v8 init];
  v5->_type = 0;
  linkDestination = v5->_linkDestination;
  v5->_linkDestination = v4;

  return v5;
}

- (void)setFilename:(id)a3
{
  id v6 = a3;
  [self mf_lock];
  BOOL v4 = (NSString *)[v6 copy];
  filename = self->_filename;
  self->_filename = v4;

  [self mf_unlock];
}

- (id)filename
{
  [self mf_lock];
  BOOL v3 = (void *)[(NSString *)self->_filename copy];
  [self mf_unlock];
  return v3;
}

- (BOOL)isSymbolicLink
{
  return self->_type == 1;
}

- (BOOL)isRegularFile
{
  return self->_type == 0;
}

- (BOOL)isDirectory
{
  return 0;
}

- (id)fileWrappers
{
  return 0;
}

- (id)symbolicLinkDestination
{
  return self->_linkDestination;
}

- (id)regularFileContents
{
  return self->_data;
}

- (id)description
{
  BOOL v3 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)MFMessageFileWrapper;
  BOOL v4 = [(MFMessageFileWrapper *)&v14 description];
  path = self->_path;
  filename = self->_filename;
  preferredFilename = self->_preferredFilename;
  NSUInteger v8 = [(NSData *)self->_data length];
  url = self->_url;
  BOOL v10 = [(MFMessageFileWrapper *)self isPlaceholder];
  objc_super v11 = "NO";
  if (v10) {
    objc_super v11 = "YES";
  }
  uint64_t v12 = [v3 stringWithFormat:@"%@\n\tpath: %@\n\tfilename: %@\n\tpreferred: %@\n\tdata length: %lu\n\tURL: %@\n\tPlaceholder: %s", v4, path, filename, preferredFilename, v8, url, v11];

  return v12;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

@end