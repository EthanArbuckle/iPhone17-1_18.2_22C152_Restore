@interface OfficeDocument
+ (id)parseFile:(id)a3 contentType:(id)a4 requestedSize:(CGSize)a5 error:(id *)a6;
- (BOOL)multipage;
- (CGSize)size;
- (NSData)embeddedThumbnail;
- (NSDictionary)attachments;
- (NSString)htmlContent;
- (UTType)embeddedThumbnailType;
- (void)setAttachments:(id)a3;
- (void)setEmbeddedThumbnail:(id)a3;
- (void)setEmbeddedThumbnailType:(id)a3;
- (void)setHtmlContent:(id)a3;
- (void)setMultipage:(BOOL)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation OfficeDocument

+ (id)parseFile:(id)a3 contentType:(id)a4 requestedSize:(CGSize)a5 error:(id *)a6
{
  double height = a5.height;
  double width = a5.width;
  id v10 = a3;
  id v11 = a4;
  v12 = objc_opt_new();
  [v11 identifier];

  char v63 = 0;
  CFTypeRef cf = 0;
  uint64_t v13 = OICopyPrecomputedThumbnailDataFromFileAtURLIfPresent();
  if (v13)
  {
    CFDataRef v14 = (const __CFData *)v13;
    CFStringRef v65 = kCGImageSourceTypeIdentifierHint;
    CFTypeRef v66 = cf;
    CFDictionaryRef v15 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    v16 = CGImageSourceCreateWithData(v14, v15);

    if (v16)
    {
      if (CGImageSourceGetCount(v16))
      {
        CFDictionaryRef v17 = CGImageSourceCopyPropertiesAtIndex(v16, 0, 0);
        v18 = [(__CFDictionary *)v17 objectForKeyedSubscript:kCGImagePropertyPixelHeight];
        [v18 doubleValue];
        double v20 = v19;

        v21 = [(__CFDictionary *)v17 objectForKeyedSubscript:kCGImagePropertyPixelWidth];
        [v21 doubleValue];
        double v23 = v22;

        if (v20 <= v23) {
          double v24 = v23;
        }
        else {
          double v24 = v20;
        }
        if (v20 <= v23) {
          double v25 = width;
        }
        else {
          double v25 = height;
        }
        if (v24 >= v25)
        {
          [v12 setEmbeddedThumbnail:v14];

          v26 = +[UTType typeWithIdentifier:cf];
          [v12 setEmbeddedThumbnailType:v26];
        }
      }
      CFRelease(v16);
    }
    CFRelease(v14);
  }
  [v12 setMultipage:v63 != 0];
  v27 = [v12 embeddedThumbnail];

  if (v27)
  {
    id v28 = v12;
  }
  else
  {
    v29 = (void *)OICopyHTMLThumbnailFromFileAtURL();
    v30 = v29;
    if (v29)
    {
      v31 = [v29 objectForKeyedSubscript:@"HTMLError"];
      v32 = v31;
      if (v31)
      {
        id v28 = 0;
        *a6 = v31;
      }
      else
      {
        v33 = [v30 objectForKeyedSubscript:@"HTMLMainContent"];
        [v12 setHtmlContent:v33];

        v57 = [v30 objectForKeyedSubscript:@"HTMLResources"];
        if ([v57 count])
        {
          v53 = v30;
          v54 = v12;
          id v55 = v11;
          id v56 = v10;
          v34 = +[NSMutableDictionary dictionary];
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          id v35 = v57;
          id v36 = [v35 countByEnumeratingWithState:&v58 objects:v64 count:16];
          if (v36)
          {
            id v37 = v36;
            uint64_t v38 = *(void *)v59;
            do
            {
              for (i = 0; i != v37; i = (char *)i + 1)
              {
                if (*(void *)v59 != v38) {
                  objc_enumerationMutation(v35);
                }
                v40 = *(void **)(*((void *)&v58 + 1) + 8 * i);
                v41 = [v35 objectForKeyedSubscript:v40];
                v42 = [v40 pathExtension];
                v43 = +[UTType typeWithFilenameExtension:v42];

                if (v43)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v44 = [v41 dataUsingEncoding:4];

                    v41 = (void *)v44;
                  }
                  id v45 = [objc_alloc((Class)QLThumbnailReplyAttachment) initWithData:v41 contentType:v43];
                  [v34 setObject:v45 forKeyedSubscript:v40];
                }
              }
              id v37 = [v35 countByEnumeratingWithState:&v58 objects:v64 count:16];
            }
            while (v37);
          }

          v12 = v54;
          [v54 setAttachments:v34];

          id v11 = v55;
          id v10 = v56;
          v32 = 0;
          v30 = v53;
        }
        v46 = [v30 objectForKeyedSubscript:@"HTMLWidth"];
        v47 = [v30 objectForKeyedSubscript:@"HTMLHeight"];
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          [v46 floatValue];
          double v49 = v48;
          [v47 floatValue];
          double v51 = v50;
        }
        else
        {
          double v49 = CGSizeZero.width;
          double v51 = CGSizeZero.height;
        }
        objc_msgSend(v12, "setSize:", v49, v51);
        id v28 = v12;
      }
    }
    else
    {
      +[NSError errorWithDomain:QLThumbnailErrorDomain code:0 userInfo:0];
      id v28 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v28;
}

- (NSData)embeddedThumbnail
{
  return self->_embeddedThumbnail;
}

- (void)setEmbeddedThumbnail:(id)a3
{
}

- (UTType)embeddedThumbnailType
{
  return self->_embeddedThumbnailType;
}

- (void)setEmbeddedThumbnailType:(id)a3
{
}

- (BOOL)multipage
{
  return self->_multipage;
}

- (void)setMultipage:(BOOL)a3
{
  self->_multipage = a3;
}

- (NSString)htmlContent
{
  return self->_htmlContent;
}

- (void)setHtmlContent:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (NSDictionary)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_htmlContent, 0);
  objc_storeStrong((id *)&self->_embeddedThumbnailType, 0);

  objc_storeStrong((id *)&self->_embeddedThumbnail, 0);
}

@end