@interface PDFImportExtension
- (BOOL)document_has_spaces:(CGPDFDocument *)a3;
- (BOOL)new_updateAttributes:(id)a3 forFileAtURL:(id)a4 error:(id *)a5;
- (BOOL)updateAttributes:(id)a3 forFileAtURL:(id)a4 error:(id *)a5;
- (id)getPDFText:(CGPDFDocument *)a3;
- (id)getStringFromPDFDictioanry:(CGPDFDictionary *)a3 forKey:(id)a4;
- (id)new_getPDFText:(id)a3;
- (void)getPageText:(id)a3 page:(CGPDFPage *)a4 gap:(float)a5 lastPage:(BOOL)a6;
@end

@implementation PDFImportExtension

- (id)getStringFromPDFDictioanry:(CGPDFDictionary *)a3 forKey:(id)a4
{
  CGPDFStringRef value = 0;
  BOOL String = CGPDFDictionaryGetString(a3, (const char *)[a4 UTF8String], &value);
  v5 = 0;
  if (String) {
    v5 = (__CFString *)CGPDFStringCopyTextString(value);
  }

  return v5;
}

- (void)getPageText:(id)a3 page:(CGPDFPage *)a4 gap:(float)a5 lastPage:(BOOL)a6
{
  id v9 = a3;
  bzero(&v64, 0x810uLL);
  if (!CGPDFPageCopyTextString()) {
    goto LABEL_50;
  }
  uint64_t Length = CGPDFTextStringGetLength();
  if (!Length)
  {
    CGPDFTextStringRelease();
    goto LABEL_50;
  }
  objc_storeStrong(&v66, a3);
  uint64_t v64 = 0;
  uint64_t v11 = 0;
  unsigned int v12 = 0;
  char v13 = 0;
  int v14 = CGPDFPageGetRotationAngle(a4) % 360;
  int v15 = v14 + (v14 < 0 ? 0x168 : 0);
  if (v15) {
    BOOL v16 = v15 == 180;
  }
  else {
    BOOL v16 = 1;
  }
  char v17 = v16;
  char v55 = v17;
  float v18 = a5 + 1.0;
  float v19 = 0.0;
  float v20 = 0.0;
  do
  {
    CGPDFTextStringGetBBoxForIndex();
    double v56 = v21;
    double v57 = v22;
    double rect = v23;
    double v68 = 0.0;
    uint64_t v69 = 0;
    CGPDFTextStringGetTransformForIndex();
    CGAffineTransform v59 = v67;
    BOOL IsIdentity = CGAffineTransformIsIdentity(&v67);
    CGPDFTextStringGetPositionForIndex();
    double v26 = v25 + v56;
    double v27 = v68;
    if (v68 == 0.0) {
      double v27 = v57;
    }
    double v28 = rect;
    if (!IsIdentity)
    {
      CGAffineTransform v67 = v59;
      *(CGRect *)&double v24 = CGRectApplyAffineTransform(*(CGRect *)&v24, &v67);
    }
    if (v55)
    {
      double v29 = v24;
      double v30 = v27;
      double v24 = v26;
      double v27 = v28;
    }
    else
    {
      double v29 = v26;
      double v30 = v28;
    }
    float v31 = v27;
    float v32 = v30;
    float v33 = v29;
    float v61 = v33;
    float v62 = v32;
    float v34 = v24;
    float v63 = v34;
    if (!v11) {
      goto LABEL_33;
    }
    float v35 = v34 - v19;
    if ((float)(v34 - v19) == 0.0
      || ((v41 = v35 <= v31, double v39 = v35, v40 = v31 * -0.25, v41) ? (v41 = v40 <= v39) : (v41 = 0), v41))
    {
      if (!(v13 & 1 | (v20 >= v33)))
      {
        int CharacterAtIndex = CGPDFTextStringGetCharacterAtIndex();
        unsigned int v37 = 1;
        if ((CharacterAtIndex - 12352) >= 0xC0 && (unsigned __int16)(CharacterAtIndex + 155) >= 0x3Bu)
        {
          LODWORD(v67.a) = 0;
          unsigned int Script = uscript_getScript();
          unsigned int v37 = (Script < 0x17) & (0x520000u >> Script);
        }
        if (v12 & v37)
        {
          char v13 = 0;
        }
        else
        {
          uint64_t v50 = v64++;
          uint64_t v51 = v64;
          *(_WORD *)&v65[2 * v50] = 32;
          if (v51 == 1024)
          {
            [v66 appendCharacters:v65 length:1024];
            uint64_t v64 = 0;
          }
          char v13 = 1;
        }
      }
    }
    else
    {
      if ((v13 & 1) != 0 || (uint64_t v42 = v64, ++v64, v43 = v64, *(_WORD *)&v65[2 * v42] = 32, v43 != 1024))
      {
        char v13 = 1;
LABEL_33:
        float v19 = v34;
        goto LABEL_34;
      }
      [v66 appendCharacters:v65 length:1024];
      uint64_t v64 = 0;
      char v13 = 1;
      float v19 = v63;
    }
LABEL_34:
    int v44 = CGPDFTextStringGetCharacterAtIndex();
    int v45 = v44;
    BOOL v46 = v44 == 32;
    if ((v13 & (v44 == 32)) == 0)
    {
      uint64_t v47 = v64++;
      uint64_t v48 = v64;
      *(_WORD *)&v65[2 * v47] = v44;
      if (v48 == 1024)
      {
        [v66 appendCharacters:v65 length:1024];
        uint64_t v64 = 0;
      }
    }
    unsigned int v12 = 1;
    if ((v45 - 12352) >= 0xC0 && (unsigned __int16)(v45 + 155) >= 0x3Bu)
    {
      LODWORD(v67.a) = 0;
      unsigned int v49 = uscript_getScript();
      unsigned int v12 = (v49 < 0x17) & (0x520000u >> v49);
    }
    float v20 = v61 + (float)(v18 * v62);
    ++v11;
    char v13 = v46;
  }
  while (Length != v11);
  CGPDFTextStringRelease();
  uint64_t v52 = v64;
  if (v45 != 32 && !a6 && (v53 = &v65[2 * v64 - 8], ++v64, *((_WORD *)v53 + 4) = 32, ++v52, v52 == 1024) || v52)
  {
    objc_msgSend(v66, "appendCharacters:length:", v65);
    uint64_t v64 = 0;
  }
LABEL_50:
}

- (BOOL)document_has_spaces:(CGPDFDocument *)a3
{
  if (!CGPDFDocumentGetPage(a3, 1uLL) || !CGPDFPageCopyTextString()) {
    return 0;
  }
  unint64_t Length = CGPDFTextStringGetLength();
  if (Length >= 0x80) {
    unint64_t v4 = 128;
  }
  else {
    unint64_t v4 = Length;
  }
  if (v4)
  {
    if (CGPDFTextStringGetCharacterAtIndex() == 32)
    {
      BOOL v5 = 1;
    }
    else
    {
      uint64_t v6 = 1;
      do
      {
        unint64_t v7 = v6;
        if (v4 == v6) {
          break;
        }
        int CharacterAtIndex = CGPDFTextStringGetCharacterAtIndex();
        uint64_t v6 = v7 + 1;
      }
      while (CharacterAtIndex != 32);
      BOOL v5 = v7 < v4;
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  CGPDFTextStringRelease();
  return v5;
}

- (id)getPDFText:(CGPDFDocument *)a3
{
  size_t NumberOfPages = CGPDFDocumentGetNumberOfPages(a3);
  if (NumberOfPages)
  {
    size_t v6 = NumberOfPages;
    unint64_t v7 = +[NSMutableString string];
    if ([(PDFImportExtension *)self document_has_spaces:a3]) {
      float v8 = 1.0;
    }
    else {
      float v8 = 0.09;
    }
    for (size_t i = 1; i <= v6; ++i)
    {
      CGPDFPageRef Page = CGPDFDocumentGetPage(a3, i);
      *(float *)&double v11 = v8;
      [(PDFImportExtension *)self getPageText:v7 page:Page gap:v6 == i lastPage:v11];
      if ((unint64_t)[v7 length] >> 20 > 4) {
        break;
      }
    }
    if ([v7 length]) {
      goto LABEL_11;
    }
  }
  unint64_t v7 = 0;
LABEL_11:

  return v7;
}

- (BOOL)updateAttributes:(id)a3 forFileAtURL:(id)a4 error:(id *)a5
{
  return [(PDFImportExtension *)self new_updateAttributes:a3 forFileAtURL:a4 error:a5];
}

- (id)new_getPDFText:(id)a3
{
  id v3 = a3;
  unint64_t v4 = +[NSMutableString string];
  BOOL v5 = (char *)[v3 pageCount];
  if (v5)
  {
    size_t v6 = v5;
    for (size_t i = 0; v6 != i; ++i)
    {
      float v8 = objc_msgSend(v3, "sync_pageAtIndex:", i);
      id v9 = v8;
      if (v8)
      {
        v10 = [v8 pageText];
        if (v10)
        {
          if (i) {
            [v4 appendString:@"\n"];
          }
          [v4 appendString:v10];
          if ((unint64_t)[v4 length] >> 20 > 4)
          {

            break;
          }
        }
      }
    }
  }

  return v4;
}

- (BOOL)new_updateAttributes:(id)a3 forFileAtURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[NSFileManager defaultManager];
  double v11 = [v9 path];
  id v57 = 0;
  unsigned int v12 = [v10 attributesOfItemAtPath:v11 error:&v57];
  id v13 = v57;

  if (v12)
  {
    int v14 = [v12 objectForKeyedSubscript:NSFileProtectionKey];
    if ([v14 isEqualToString:NSFileProtectionComplete])
    {
      LOBYTE(v15) = 0;
    }
    else
    {
      BOOL v16 = +[NSData dataWithContentsOfURL:v9 options:1 error:0];
      if (v16)
      {
        char v17 = +[CGRemotePDFServiceProxy sharedInstance];
        id v18 = [v17 newRemotePDFDocumentWithData:v16 error:0];

        if (v18)
        {
          uint64_t v50 = self;
          id v56 = 0;
          unsigned int v19 = [v9 getResourceValue:&v56 forKey:NSURLLocalizedNameKey error:0];
          id v20 = v56;
          if (v19)
          {
            [v8 setDisplayName:v20];
          }
          else
          {
            uint64_t v21 = [v9 lastPathComponent];

            if (v21)
            {
              [v8 setDisplayName:v21];
              id v20 = (id)v21;
            }
            else
            {
              id v20 = 0;
            }
          }
          uint64_t v54 = 0;
          uint64_t v55 = 0;
          [v18 getVersionMajor:&v55 andMinor:&v54];
          double v22 = +[NSString stringWithFormat:@"%ld.%ld", v55, v54];
          [v8 setVersion:v22];

          id v23 = [v18 pageCount];
          if (v23)
          {
            double v24 = +[NSNumber numberWithUnsignedLong:v23];
            [v8 setPageCount:v24];
          }
          v53 = v20;
          double v25 = objc_msgSend(v18, "sync_pageAtIndex:", 1);
          double v26 = v25;
          if (v25)
          {
            [v25 rectForBox:1];
            double v28 = v27;
            double v30 = +[NSNumber numberWithDouble:v29];
            [v8 setPageWidth:v30];

            float v31 = +[NSNumber numberWithDouble:v28];
            [v8 setPageHeight:v31];
          }
          uint64_t v52 = v26;
          if ([v18 isEncrypted]) {
            CFStringRef v32 = @"Password Encrypted";
          }
          else {
            CFStringRef v32 = @"None";
          }
          [v8 setSecurityMethod:v32];
          unsigned int v15 = [v18 isUnlocked];
          if (v15)
          {
            uint64_t v51 = [v18 infoDictionary];
            if (v51)
            {
              float v33 = v51;
              float v34 = [v51 objectForKeyedSubscript:kCGPDFDocumentTitle];
              unsigned int v49 = v34;
              if (v34 && (float v35 = v34, [v34 length]))
              {
                [v8 setTitle:v35];
              }
              else
              {
                v36 = [v51 objectForKeyedSubscript:kCGPDFDocumentSubject];
                unsigned int v37 = v36;
                if (v36 && [v36 length]) {
                  [v8 setTitle:v37];
                }
              }
              uint64_t v38 = [v51 objectForKeyedSubscript:kCGPDFDocumentAuthor];
              double v39 = (void *)v38;
              if (v38)
              {
                uint64_t v59 = v38;
                double v40 = +[NSArray arrayWithObjects:&v59 count:1];
                [v8 setAuthorNames:v40];

                float v33 = v51;
              }
              uint64_t v48 = v39;
              uint64_t v41 = [v33 objectForKeyedSubscript:kCGPDFDocumentCreator];
              if (v41)
              {
                [v8 setCreator:v41];
                uint64_t v58 = v41;
                uint64_t v42 = +[NSArray arrayWithObjects:&v58 count:1];
                [v8 setAuthorNames:v42];

                float v33 = v51;
              }
              uint64_t v47 = (void *)v41;
              uint64_t v43 = [v33 objectForKeyedSubscript:kCGPDFDocumentProducer];
              if (v43) {
                [v8 setProducer:v43];
              }
              int v44 = [v33 objectForKeyedSubscript:kCGPDFDocumentKeywords];
              if (v44) {
                [v8 setKeywords:v44];
              }
            }
            id v45 = [(PDFImportExtension *)v50 new_getPDFText:v18];
            if (v45) {
              [v8 setTextContent:v45];
            }
          }
        }
        else
        {
          LOBYTE(v15) = 0;
        }
      }
      else
      {
        LOBYTE(v15) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v15) = 0;
    if (a5) {
      *a5 = v13;
    }
  }

  return v15;
}

@end