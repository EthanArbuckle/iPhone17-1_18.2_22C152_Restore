@interface PDFActionURL
- (BOOL)isSuspiciousURL;
- (NSURL)URL;
- (PDFActionURL)initWithActionDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5;
- (PDFActionURL)initWithURL:(NSURL *)url;
- (__CFDictionary)createDictionaryRef;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)toolTip;
- (void)commonInit;
- (void)setURL:(NSURL *)URL;
@end

@implementation PDFActionURL

- (PDFActionURL)initWithURL:(NSURL *)url
{
  v5 = url;
  v9.receiver = self;
  v9.super_class = (Class)PDFActionURL;
  v6 = [(PDFAction *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(PDFActionURL *)v6 commonInit];
    [(PDFAction *)v7 setType:@"URI"];
    objc_storeStrong((id *)&v7->_private2->url, url);
    v7->_private2->suspiciousURL = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PDFActionURL;
  v5 = -[PDFAction copyWithZone:](&v12, sel_copyWithZone_);
  if (v5)
  {
    v6 = objc_alloc_init(PDFActionURLPrivateVars);
    v7 = (void *)v5[2];
    v5[2] = v6;

    uint64_t v8 = [(NSURL *)self->_private2->url copyWithZone:a3];
    uint64_t v9 = v5[2];
    v10 = *(void **)(v9 + 8);
    *(void *)(v9 + 8) = v8;

    *(unsigned char *)(v5[2] + 16) = self->_private2->suspiciousURL;
  }
  return v5;
}

- (NSURL)URL
{
  return self->_private2->url;
}

- (void)setURL:(NSURL *)URL
{
  uint64_t v4 = [(NSURL *)URL copy];
  private2 = self->_private2;
  v6 = private2->url;
  private2->url = (NSURL *)v4;

  MEMORY[0x270F9A758](v4, v6);
}

- (BOOL)isSuspiciousURL
{
  return self->_private2->suspiciousURL;
}

- (id)description
{
  v2 = NSString;
  v3 = [(PDFActionURL *)self toolTip];
  uint64_t v4 = [v2 stringWithFormat:@"URL Action - %@", v3];

  return v4;
}

- (PDFActionURL)initWithActionDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5
{
  id v8 = a4;
  v44.receiver = self;
  v44.super_class = (Class)PDFActionURL;
  uint64_t v9 = [(PDFAction *)&v44 initWithActionDictionary:a3 forDocument:v8 forPage:a5];
  if (!v9) {
    goto LABEL_29;
  }
  CGPDFObjectRef v42 = 0;
  CGPDFStringRef string = 0;
  if (CGPDFDocumentIsEncrypted((CGPDFDocumentRef)[v8 documentRef]))
  {
    UnresolvedObject = (CGPDFObject *)CGPDFDictionaryGetUnresolvedObject();
    if (UnresolvedObject)
    {
      value[0] = 0;
      value[1] = 0;
      if (CGPDFObjectGetValue(UnresolvedObject, kCGPDFObjectTypeDictionary|kCGPDFObjectTypeBoolean, value))
      {
        long long v39 = 0u;
        long long v40 = 0u;
        CGPDFDocumentGetXRef();
        CGPDFXRefGetEntry();
      }
    }
  }
  if (CGPDFDictionaryGetString(a3, "URI", &string))
  {
    BytePtr = CGPDFStringGetBytePtr(string);
    if (BytePtr)
    {
      objc_super v12 = BytePtr;
      if (CGPDFStringGetLength(string))
      {
        v13 = [NSString stringWithCString:v12 encoding:1];
        if (v13)
        {
          v14 = v13;
          v15 = [v13 stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
          if (v15)
          {
            uint64_t v16 = [objc_alloc(NSURL) initWithString:v15];
            private2 = v9->_private2;
            url = private2->url;
            private2->url = (NSURL *)v16;
          }
          v9->_private2->suspiciousURL = 0;
          v19 = v9->_private2->url;
          if (v19)
          {
            v20 = [(NSURL *)v19 scheme];
            if (![v20 isEqualToString:*MEMORY[0x263F085A8]])
            {
              id v26 = 0;
LABEL_22:

              id v23 = v26;
              goto LABEL_23;
            }
            v21 = v9->_private2->url;
            id v38 = 0;
            BOOL v22 = [(NSURL *)v21 checkResourceIsReachableAndReturnError:&v38];
            id v23 = v38;

            if (!v22)
            {
              v20 = [(PDFAction *)v9 baseURLForDocument:v8];
              v24 = (void *)[objc_alloc(NSURL) initWithString:v15 relativeToURL:v20];
              v25 = v24;
              if (v24)
              {
                id v37 = v23;
                int v36 = [v24 checkResourceIsReachableAndReturnError:&v37];
                id v26 = v37;

                if (v36) {
                  objc_storeStrong((id *)&v9->_private2->url, v25);
                }
              }
              else
              {
                id v26 = v23;
              }

              goto LABEL_22;
            }
          }
          else
          {
            id v23 = 0;
          }
LABEL_23:
        }
      }
    }
  }
  if (CGPDFDictionaryGetObject(a3, "F", &v42))
  {
    v27 = v42;
    v28 = [v8 documentURL];
    v29 = [v28 path];
    v30 = getFilepathFromObjectDetermineEncoding(v27, (const __CFString *)[v29 stringByDeletingLastPathComponent]);

    if (v30)
    {
      uint64_t v31 = [NSURL fileURLWithPath:v30];
      v32 = v9->_private2;
      v33 = v32->url;
      v32->url = (NSURL *)v31;
    }
  }
  v34 = v9;
LABEL_29:

  return v9;
}

- (void)commonInit
{
  v7.receiver = self;
  v7.super_class = (Class)PDFActionURL;
  [(PDFAction *)&v7 commonInit];
  v3 = objc_alloc_init(PDFActionURLPrivateVars);
  private2 = self->_private2;
  self->_private2 = v3;

  v5 = self->_private2;
  url = v5->url;
  v5->url = 0;

  self->_private2->suspiciousURL = 0;
}

- (__CFDictionary)createDictionaryRef
{
  Mutable = [(PDFActionURL *)self URL];
  if (Mutable)
  {
    uint64_t v4 = [(PDFActionURL *)self URL];
    v5 = [MEMORY[0x263EFF9D0] null];
    char v6 = [v4 isEqual:v5];

    if (v6)
    {
      return 0;
    }
    else
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"/S", @"/URI");
      objc_super v7 = [(PDFActionURL *)self URL];
      id v8 = [v7 absoluteString];

      if (v8)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"/URI", v8);
      }
    }
  }
  return (__CFDictionary *)Mutable;
}

- (id)toolTip
{
  v2 = [(PDFActionURL *)self URL];
  if ([v2 isFileURL])
  {
    v3 = [v2 path];
    uint64_t v4 = [v3 lastPathComponent];
  }
  else
  {
    v3 = [v2 standardizedURL];
    v5 = [v3 absoluteString];
    uint64_t v4 = [v5 stringByRemovingPercentEncoding];
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end