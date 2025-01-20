@interface IMFileManager
+ (id)defaultHFSFileManager;
+ (id)defaultManager;
- (id)MIMETypeOfPath:(id)a3;
- (id)MIMETypeOfPathExtension:(id)a3;
- (id)UTITypeOfMimeType:(id)a3;
- (id)UTITypeOfPath:(id)a3;
- (id)UTITypeOfPathExtension:(id)a3;
- (id)displayNameOfFileWithName:(id)a3 hfsFlags:(unsigned __int16)a4;
- (id)pathExtensionForMIMEType:(id)a3;
- (id)pathExtensionForUTIType:(id)a3;
@end

@implementation IMFileManager

+ (id)defaultManager
{
  return (id)((uint64_t (*)(id, char *))MEMORY[0x1F4181798])(a1, sel_defaultHFSFileManager);
}

+ (id)defaultHFSFileManager
{
  if (qword_1E92DB360 != -1) {
    dispatch_once(&qword_1E92DB360, &unk_1EE22FA78);
  }
  v2 = (void *)qword_1E92DB368;
  return v2;
}

- (id)displayNameOfFileWithName:(id)a3 hfsFlags:(unsigned __int16)a4
{
  char v4 = a4;
  id v5 = a3;
  v9 = v5;
  if ((v4 & 0x10) != 0
    || (objc_msgSend_pathExtension(v5, v6, v7, v8),
        v10 = objc_claimAutoreleasedReturnValue(),
        int isEqualToString = objc_msgSend_isEqualToString_(v10, v11, @"app", v12),
        v10,
        isEqualToString))
  {
    objc_msgSend_stringByDeletingPathExtension(v9, v6, v7, v8);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = v9;
  }
  v15 = v14;

  return v15;
}

- (id)pathExtensionForMIMEType:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_sharedMappings(MEMORY[0x1E4F290B0], v4, v5, v6);
  v10 = objc_msgSend_preferredExtensionForMIMEType_(v7, v8, (uint64_t)v3, v9);

  if (v10) {
    goto LABEL_2;
  }
  if (objc_msgSend_isEqualToIgnoringCase_(v3, v11, @"text/x-vlocation", v12))
  {
    v13 = @"vcf";
  }
  else
  {
    if ((objc_msgSend_isEqualToIgnoringCase_(v3, v15, @"text/x-vcalendar", v16) & 1) == 0)
    {
LABEL_2:
      v13 = v10;
      goto LABEL_3;
    }
    v13 = @"vcs";
  }
LABEL_3:

  return v13;
}

- (id)UTITypeOfMimeType:(id)a3
{
  id v3 = a3;
  if (qword_1E92DB520 != -1) {
    dispatch_once(&qword_1E92DB520, &unk_1EE230758);
  }
  char v4 = (uint64_t (*)(uint64_t, id, void))off_1E92DB518;
  if (qword_1E92DB538 != -1) {
    dispatch_once(&qword_1E92DB538, &unk_1EE2310B8);
  }
  uint64_t v5 = (void *)v4(qword_1E92DB540, v3, 0);

  return v5;
}

- (id)MIMETypeOfPathExtension:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"vcs", v5))
  {
    uint64_t v9 = @"text/x-vcalendar";
  }
  else
  {
    v10 = objc_msgSend_sharedMappings(MEMORY[0x1E4F290B0], v6, v7, v8);
    objc_msgSend_MIMETypeForExtension_(v10, v11, (uint64_t)v3, v12);
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)MIMETypeOfPath:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_pathExtension(v4, v5, v6, v7);
  if (objc_msgSend_isEqualToString_(v8, v9, @"vcf", v10)
    && (objc_msgSend_hasSuffix_(v4, v11, @".loc.vcf", v12) & 1) != 0)
  {
    v13 = @"text/x-vlocation";
  }
  else
  {
    objc_msgSend_MIMETypeOfPathExtension_(self, v11, (uint64_t)v8, v12);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)pathExtensionForUTIType:(id)a3
{
  id v6 = a3;
  if (qword_1E92DB208 != -1) {
    dispatch_once(&qword_1E92DB208, &unk_1EE2309B8);
  }
  if (objc_msgSend_length(v6, v3, v4, v5))
  {
    uint64_t v7 = (uint64_t (*)(id, uint64_t))off_1E92DB200;
    if (qword_1E92DB250 != -1) {
      dispatch_once(&qword_1E92DB250, &unk_1EE231138);
    }
    uint64_t v8 = (void *)v7(v6, qword_1E92DB258);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)UTITypeOfPath:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_pathExtension(v3, v4, v5, v6);
  if (objc_msgSend_isEqualToString_(v7, v8, @"vcf", v9)
    && (objc_msgSend_hasSuffix_(v3, v10, @".loc.vcf", v12) & 1) != 0)
  {
    v13 = @"public.vlocation";
  }
  else if (objc_msgSend_length(v7, v10, v11, v12))
  {
    if (qword_1E92DB1A8 != -1) {
      dispatch_once(&qword_1E92DB1A8, &unk_1EE230B58);
    }
    id v14 = (uint64_t (*)(uint64_t, void *, void))off_1E92DB1A0;
    if (qword_1E92DB250 != -1) {
      dispatch_once(&qword_1E92DB250, &unk_1EE231138);
    }
    v13 = (__CFString *)v14(qword_1E92DB258, v7, 0);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)UTITypeOfPathExtension:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6))
  {
    if (qword_1E92DB530 != -1) {
      dispatch_once(&qword_1E92DB530, &unk_1EE230C18);
    }
    uint64_t v7 = (uint64_t (*)(uint64_t, id, void))off_1E92DB528;
    if (qword_1E92DB250 != -1) {
      dispatch_once(&qword_1E92DB250, &unk_1EE231138);
    }
    uint64_t v8 = (void *)v7(qword_1E92DB258, v3, 0);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end