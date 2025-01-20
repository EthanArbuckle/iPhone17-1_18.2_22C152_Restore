@interface MKMapAttribution
+ (id)attributionUrlFromRegionalAttributions:(id)a3;
- (MKMapAttribution)initWithStringAttributes:(id)a3 regionalAttributions:(id)a4 underlineText:(BOOL)a5 applyLinkAttribution:(BOOL)a6 scale:(double)a7;
- (NSAttributedString)string;
- (NSString)providerName;
- (NSString)providerString;
- (NSURL)plainTextFileURL;
- (NSURL)url;
- (UIImage)providerImage;
- (id)attributedStringWithImage:(id)a3;
- (id)disclosureArrow;
@end

@implementation MKMapAttribution

- (id)attributedStringWithImage:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F42698];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setImage:v4];
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [v4 size];
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(v5, "setBounds:", v6, v7, v9, v11);
  v12 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v5];
  v13 = (void *)[v12 mutableCopy];

  return v13;
}

- (id)disclosureArrow
{
  v3 = objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"AttributionArrow");
  id v4 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v5 = [v4 userInterfaceLayoutDirection];

  if (v5 == 1)
  {
    uint64_t v6 = objc_msgSend(v3, "_mapkit_horizontallyFlippedImage");

    v3 = (void *)v6;
  }
  double v7 = [v3 imageWithRenderingMode:2];

  double v8 = [(MKMapAttribution *)self attributedStringWithImage:v7];

  return v8;
}

+ (id)attributionUrlFromRegionalAttributions:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F64918] modernManager];
  uint64_t v5 = [v4 activeTileGroup];
  uint64_t v6 = [v5 attributions];

  if ([v3 count]) {
    double v7 = v3;
  }
  else {
    double v7 = v6;
  }
  id v8 = v7;
  if ([v8 count])
  {
    double v9 = [v8 objectAtIndex:0];
    double v10 = 0;
    if ([v9 hasUrl])
    {
      double v11 = [v9 url];
      double v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v11];
    }
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (MKMapAttribution)initWithStringAttributes:(id)a3 regionalAttributions:(id)a4 underlineText:(BOOL)a5 applyLinkAttribution:(BOOL)a6 scale:(double)a7
{
  BOOL v87 = a6;
  BOOL v8 = a5;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  v92.receiver = self;
  v92.super_class = (Class)MKMapAttribution;
  v13 = [(MKMapAttribution *)&v92 init];
  if (v13)
  {
    v14 = [MEMORY[0x1E4F64918] modernManager];
    v15 = [v14 activeTileGroup];
    v16 = [v15 attributions];

    if ([v12 count]) {
      v17 = v12;
    }
    else {
      v17 = v16;
    }
    id v18 = v17;
    if ([v18 count])
    {
      BOOL obj = v8;
      v19 = [v18 objectAtIndex:0];
      uint64_t v20 = 0;
      if ([v19 hasName])
      {
        uint64_t v20 = [v19 name];
      }
      if ([v19 hasUrl])
      {
        uint64_t v21 = [v19 url];
      }
      else
      {
        uint64_t v21 = 0;
      }
      v84 = (void *)v21;
      if ([v19 hasPlainTextURL])
      {
        v25 = [v19 plainTextURL];
        v81 = [v25 lastPathComponent];
      }
      else
      {
        v81 = 0;
      }
      if ([v19 hasLinkDisplayStringIndex])
      {
        unsigned int v26 = [v19 linkDisplayStringIndex];
        v27 = [MEMORY[0x1E4F64918] modernManager];
        v28 = [v27 bestLocalizedStringForDisplayStringAtIndex:v26];

        if ([v28 hasStringValue])
        {
          v29 = [v28 stringValue];
        }
        else
        {
          v29 = 0;
        }
      }
      else
      {
        v29 = 0;
      }
      v78 = v16;
      id v77 = v18;
      unint64_t v30 = [[MKMapAttributionImage alloc] initWithAttributions:v18 type:0];

      if (!v29)
      {
        if (v30 | v20) {
          v31 = @"%@\nand other data providers";
        }
        else {
          v31 = @"Data from others";
        }
        v29 = _MKLocalizedStringFromThisBundle(v31);
      }
      objc_storeStrong((id *)&v13->_providerString, v29);
      v79 = (void *)v20;
      objc_storeStrong((id *)&v13->_providerName, (id)v20);
      v76 = v29;
      v32 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v29 attributes:v11];
      v33 = [v32 string];
      uint64_t v34 = [v33 rangeOfString:@"%@"];
      uint64_t v36 = v35;

      v80 = (MKMapAttributionImage *)v30;
      if (v34 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v30)
        {
          v37 = [MEMORY[0x1E4F64908] sharedManager];
          v38 = [(id)v30 imageNameForScale:a7];
          uint64_t v39 = [v37 dataForResourceWithName:v38 fallbackBundle:0];

          v82 = (void *)v39;
          v40 = (UIImage *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithData:v39 scale:a7];
          uint64_t v41 = *MEMORY[0x1E4F42510];
          v42 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F42510]];

          if (v42)
          {
            v43 = [v11 objectForKeyedSubscript:v41];
            uint64_t v44 = [(UIImage *)v40 _flatImageWithColor:v43];

            v40 = (UIImage *)v44;
          }
          providerImage = v13->_providerImage;
          v13->_providerImage = v40;
          v46 = v40;

          v47 = [(MKMapAttribution *)v13 attributedStringWithImage:v46];

          objc_msgSend(v32, "replaceCharactersInRange:withAttributedString:", v34, v36, v47);
          unint64_t v30 = (unint64_t)v80;
        }
        else if (v79)
        {
          objc_msgSend(v32, "replaceCharactersInRange:withString:", v34, v36, v79);
        }
      }
      if (obj)
      {
        id v73 = v12;
        v74 = v13;
        id v75 = v11;
        [(NSString *)v13->_providerString componentsSeparatedByString:@"%@"];
        long long v88 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        id obja = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v48 = [obja countByEnumeratingWithState:&v88 objects:v95 count:16];
        if (v48)
        {
          uint64_t v49 = v48;
          uint64_t v50 = *(void *)v89;
          uint64_t v51 = *MEMORY[0x1E4F425C8];
          uint64_t v52 = *MEMORY[0x1E4F424D8];
          uint64_t v83 = *MEMORY[0x1E4F42530];
          do
          {
            for (uint64_t i = 0; i != v49; ++i)
            {
              if (*(void *)v89 != v50) {
                objc_enumerationMutation(obja);
              }
              v54 = *(void **)(*((void *)&v88 + 1) + 8 * i);
              v55 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
              v56 = [v54 stringByTrimmingCharactersInSet:v55];

              v57 = [v32 string];
              uint64_t v58 = [v57 rangeOfString:v56];
              uint64_t v60 = v59;

              if (v60)
              {
                v93[0] = v51;
                v93[1] = v52;
                v94[0] = &unk_1ED97E760;
                v94[1] = &unk_1ED97DFD0;
                v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:2];
                if (v87 && [v84 length]) {
                  objc_msgSend(v32, "addAttribute:value:range:", v83, v84, v58, v60);
                }
                objc_msgSend(v32, "addAttributes:range:", v61, v58, v60);
              }
            }
            uint64_t v49 = [obja countByEnumeratingWithState:&v88 objects:v95 count:16];
          }
          while (v49);
        }

        v13 = v74;
        id v11 = v75;
        id v12 = v73;
        unint64_t v30 = (unint64_t)v80;
      }
      objc_storeStrong((id *)&v13->_string, v32);
      v62 = v84;
      if (v84)
      {
        uint64_t v63 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v84];
        url = v13->_url;
        v13->_url = (NSURL *)v63;
      }
      v65 = v81;
      v16 = v78;
      if ([v81 length])
      {
        v66 = [MEMORY[0x1E4F645A8] urlFor:20];
        v67 = [v66 URLByAppendingPathComponent:v81];
        v68 = [MEMORY[0x1E4F28CB8] defaultManager];
        v69 = [v67 path];
        int v70 = [v68 fileExistsAtPath:v69];

        if (v70) {
          objc_storeStrong((id *)&v13->_plainTextFileURL, v67);
        }

        v62 = v84;
        unint64_t v30 = (unint64_t)v80;
        v65 = v81;
      }
      v71 = v13;

      id v18 = v77;
    }
    else
    {
      uint64_t v22 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1ED919588 attributes:v11];
      string = v13->_string;
      v13->_string = (NSAttributedString *)v22;

      v24 = v13;
    }
  }
  return v13;
}

- (NSAttributedString)string
{
  return self->_string;
}

- (NSURL)url
{
  return self->_url;
}

- (NSURL)plainTextFileURL
{
  return self->_plainTextFileURL;
}

- (UIImage)providerImage
{
  return self->_providerImage;
}

- (NSString)providerString
{
  return self->_providerString;
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_providerString, 0);
  objc_storeStrong((id *)&self->_providerImage, 0);
  objc_storeStrong((id *)&self->_plainTextFileURL, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

@end