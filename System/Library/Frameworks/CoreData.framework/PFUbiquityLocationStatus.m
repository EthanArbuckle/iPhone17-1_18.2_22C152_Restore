@interface PFUbiquityLocationStatus
- (PFUbiquityLocationStatus)init;
- (PFUbiquityLocationStatus)initWithLocation:(id)a3;
- (id)description;
- (uint64_t)checkFileURLState;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation PFUbiquityLocationStatus

- (PFUbiquityLocationStatus)init
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityLocationStatus;
  result = [(PFUbiquityLocationStatus *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_isExported = 0;
    *(_DWORD *)&result->_isLive = 0;
    *(_DWORD *)&result->_isDownloading = 0;
    result->_error = 0;
    result->_hash = 0;
    result->_location = 0;
    *(_OWORD *)&result->_numBytes = xmmword_18AE54290;
  }
  return result;
}

- (PFUbiquityLocationStatus)initWithLocation:(id)a3
{
  v4 = [(PFUbiquityLocationStatus *)self init];
  if (v4)
  {
    v4->_location = (PFUbiquityLocation *)a3;
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    if (a3 && *((_DWORD *)a3 + 6) == 1)
    {
      while (*((_DWORD *)a3 + 6) != 1)
      {
        a3 = (id)*((void *)a3 + 1);
        if (!a3)
        {
          v6 = 0;
          goto LABEL_9;
        }
      }
      v6 = (void *)*((void *)a3 + 2);
LABEL_9:
      objc_msgSend(v5, "appendString:", +[PFUbiquityLocation pathByTruncatingBeforeLibraryMobileDocuments:]((uint64_t)PFUbiquityLocation, v6));
    }
    else
    {
      v7 = -[PFUbiquityLocation createRelativePath]((uint64_t)a3);
      [v5 appendString:v7];
    }
    v4->_hash = +[_PFRoutines _generateUbiquityHashForPath:]((uint64_t)_PFRoutines, v5);
  }
  return v4;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);

  self->_error = 0;
  self->_location = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityLocationStatus;
  [(PFUbiquityLocationStatus *)&v3 dealloc];
}

- (unint64_t)hash
{
  return self->_hash;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PFUbiquityLocationStatus;
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", -[PFUbiquityLocationStatus description](&v7, sel_description));
  v4 = v3;
  location = self->_location;
  if (location) {
    location = (PFUbiquityLocation *)location->_isRootUbiquitous;
  }
  objc_msgSend(v3, "appendFormat:", @" - %d:%d:%d:%d:%d:%d:%d:%d:%d:%d:%d:%ld", location, self->_isLive, self->_isDeleted, self->_isFailed, self->_isDownloaded, self->_isDownloading, self->_isUploaded, self->_isUploading, self->_isExported, self->_isScheduled, self->_isImported, self->_numNotifications);
  if (self->_error) {
    [v4 appendFormat:@"\n\t%@", self->_error];
  }
  return v4;
}

- (uint64_t)checkFileURLState
{
  v18[4] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    ++*(void *)(result + 56);
    id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    objc_super v3 = (void *)-[PFUbiquityLocation createFullURL](*(void *)(v1 + 24));
    memset(&v17, 0, sizeof(v17));
    if (stat((const char *)objc_msgSend((id)objc_msgSend(v3, "path"), "fileSystemRepresentation"), &v17))
    {
      uint64_t v4 = *__error();
      if (v4 == 2)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Tried to stat missing file: %@", "-[PFUbiquityLocationStatus checkFileURLState]", 126, v3);
        }
        goto LABEL_18;
      }
      if (v4 == 20)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Tried to stat a file but part of the directory structure has gone missing: %@", "-[PFUbiquityLocationStatus checkFileURLState]", 122, v3);
        }
LABEL_18:
        if (*(unsigned char *)(v1 + 8)) {
          *(unsigned char *)(v1 + 9) = 1;
        }
        *(unsigned char *)(v1 + 8) = 0;
        goto LABEL_36;
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error trying to read file (%d): %@", "-[PFUbiquityLocationStatus checkFileURLState]", 130, v4, v3);
      }
      if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v3, "path")))goto LABEL_18; {
    }
      }
    else
    {
      *(void *)(v1 + 48) = v17.st_size;
    }
    *(unsigned char *)(v1 + 8) = 1;
    uint64_t v5 = *(void *)(v1 + 24);
    if (!v5 || !*(unsigned char *)(v5 + 88))
    {
      *(_DWORD *)(v1 + 10) = 0;
      goto LABEL_36;
    }
    self;
    if (_usesCloudDocs == 1)
    {
      *(_DWORD *)(v1 + 10) = 65537;
LABEL_36:

      return [v2 drain];
    }
    uint64_t v16 = 0;
    uint64_t v6 = *MEMORY[0x1E4F1C790];
    uint64_t v7 = *MEMORY[0x1E4F1C758];
    v18[0] = *MEMORY[0x1E4F1C790];
    v18[1] = v7;
    uint64_t v8 = *MEMORY[0x1E4F1C798];
    uint64_t v9 = *MEMORY[0x1E4F1C778];
    v18[2] = *MEMORY[0x1E4F1C798];
    v18[3] = v9;
    v10 = objc_msgSend(v3, "resourceValuesForKeys:error:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v18, 4), &v16);
    v11 = v10;
    if (!v10)
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error reading resource values for URL: %@\n%@", "-[PFUbiquityLocationStatus checkFileURLState]", 169, v3, v16);
      }
      goto LABEL_36;
    }
    if (*(unsigned char *)(v1 + 12))
    {
      int v12 = 1;
    }
    else
    {
      int v12 = objc_msgSend((id)objc_msgSend(v10, "objectForKey:", v6), "BOOLValue");
      *(unsigned char *)(v1 + 12) = v12;
    }
    if (*(unsigned char *)(v1 + 10))
    {
      int v13 = 1;
      if (v12) {
        goto LABEL_30;
      }
    }
    else
    {
      v15 = (void *)[v11 objectForKey:v7];
      int v13 = [v15 isEqualToString:*MEMORY[0x1E4F1C748]];
      *(unsigned char *)(v1 + 10) = v13;
      if (*(unsigned char *)(v1 + 12))
      {
LABEL_30:
        *(unsigned char *)(v1 + 13) = 0;
        if (v13)
        {
LABEL_31:
          char v14 = 0;
LABEL_32:
          *(unsigned char *)(v1 + 11) = v14;
          goto LABEL_36;
        }
LABEL_35:
        if (*(unsigned char *)(v1 + 11)) {
          goto LABEL_36;
        }
        char v14 = objc_msgSend((id)objc_msgSend(v11, "objectForKey:", v9), "BOOLValue");
        goto LABEL_32;
      }
    }
    *(unsigned char *)(v1 + 13) = objc_msgSend((id)objc_msgSend(v11, "objectForKey:", v8), "BOOLValue");
    if (*(unsigned char *)(v1 + 10)) {
      goto LABEL_31;
    }
    goto LABEL_35;
  }
  return result;
}

@end