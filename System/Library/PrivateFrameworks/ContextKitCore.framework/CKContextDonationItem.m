@interface CKContextDonationItem
+ (BOOL)supportsSecureCoding;
+ (id)trimTextToSize:(id)a3;
+ (void)initialize;
- (CKContextDonationItem)initWithCoder:(id)a3;
- (IOSurface)leadImage;
- (IOSurface)snapshot;
- (NSArray)extractionItems;
- (NSArray)uiElements;
- (NSString)contentAuthor;
- (NSString)contentDescription;
- (NSString)contentKeywords;
- (NSString)debugText;
- (NSString)debugUrlString;
- (NSString)languageTag;
- (NSString)rawHTML;
- (NSString)text;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContentAuthor:(id)a3;
- (void)setContentDescription:(id)a3;
- (void)setContentKeywords:(id)a3;
- (void)setDebugText:(id)a3;
- (void)setDebugUrlString:(id)a3;
- (void)setExtractionItems:(id)a3;
- (void)setLanguageTag:(id)a3;
- (void)setLeadImage:(id)a3;
- (void)setRawHTML:(id)a3;
- (void)setSnapshot:(id)a3;
- (void)setText:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUiElements:(id)a3;
@end

@implementation CKContextDonationItem

- (CKContextDonationItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CKContextDonationItem;
  v5 = [(CKContextDonationItem *)&v35 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"languageTag"];
    languageTag = v5->_languageTag;
    v5->_languageTag = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentDescription"];
    contentDescription = v5->_contentDescription;
    v5->_contentDescription = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentKeywords"];
    contentKeywords = v5->_contentKeywords;
    v5->_contentKeywords = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentAuthor"];
    contentAuthor = v5->_contentAuthor;
    v5->_contentAuthor = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"debugText"];
    debugText = v5->_debugText;
    v5->_debugText = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"debugUrlString"];
    debugUrlString = v5->_debugUrlString;
    v5->_debugUrlString = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawHTML"];
    rawHTML = v5->_rawHTML;
    v5->_rawHTML = (NSString *)v22;

    if (class_CKContextUIElement)
    {
      v24 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), class_CKContextUIElement, 0);
      uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"uiElements"];
      uiElements = v5->_uiElements;
      v5->_uiElements = (NSArray *)v25;
    }
    if (class_CKContextExtractionItem)
    {
      v27 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), class_CKContextExtractionItem, 0);
      uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"extractionItems"];
      extractionItems = v5->_extractionItems;
      v5->_extractionItems = (NSArray *)v28;
    }
    if (class_IOSurface)
    {
      uint64_t v30 = [v4 decodeObjectOfClass:class_IOSurface forKey:@"leadImage"];
      leadImage = v5->_leadImage;
      v5->_leadImage = (IOSurface *)v30;

      uint64_t v32 = [v4 decodeObjectOfClass:class_IOSurface forKey:@"snapshot"];
      snapshot = v5->_snapshot;
      v5->_snapshot = (IOSurface *)v32;
    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugUrlString, 0);
  objc_storeStrong((id *)&self->_debugText, 0);
  objc_storeStrong((id *)&self->_extractionItems, 0);
  objc_storeStrong((id *)&self->_uiElements, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_leadImage, 0);
  objc_storeStrong((id *)&self->_languageTag, 0);
  objc_storeStrong((id *)&self->_rawHTML, 0);
  objc_storeStrong((id *)&self->_contentAuthor, 0);
  objc_storeStrong((id *)&self->_contentKeywords, 0);
  objc_storeStrong((id *)&self->_contentDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

- (void)encodeWithCoder:(id)a3
{
  languageTag = self->_languageTag;
  id v5 = a3;
  [v5 encodeObject:languageTag forKey:@"languageTag"];
  [v5 encodeObject:self->_text forKey:@"text"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_contentDescription forKey:@"contentDescription"];
  [v5 encodeObject:self->_contentKeywords forKey:@"contentKeywords"];
  [v5 encodeObject:self->_contentAuthor forKey:@"contentAuthor"];
  [v5 encodeObject:self->_debugText forKey:@"debugText"];
  [v5 encodeObject:self->_debugUrlString forKey:@"debugUrlString"];
  [v5 encodeObject:self->_rawHTML forKey:@"rawHTML"];
  [v5 encodeObject:self->_uiElements forKey:@"uiElements"];
  [v5 encodeObject:self->_extractionItems forKey:@"extractionItems"];
  [v5 encodeObject:self->_leadImage forKey:@"leadImage"];
  [v5 encodeObject:self->_snapshot forKey:@"snapshot"];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    class_CKContextUIElement = (uint64_t)NSClassFromString(&cfstr_Ckcontextuiele.isa);
    class_CKContextExtractionItem = (uint64_t)NSClassFromString(&cfstr_Ckcontextextra.isa);
    class_IOSurface = (uint64_t)NSClassFromString(&cfstr_Iosurface.isa);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)[(NSString *)self->_text copy];
  [v4 setText:v5];

  uint64_t v6 = (void *)[(NSString *)self->_title copy];
  [v4 setTitle:v6];

  v7 = (void *)[(NSString *)self->_contentDescription copy];
  [v4 setContentDescription:v7];

  [v4 setContentKeywords:self->_contentKeywords];
  uint64_t v8 = (void *)[(NSString *)self->_contentAuthor copy];
  [v4 setContentAuthor:v8];

  v9 = (void *)[(NSString *)self->_languageTag copy];
  [v4 setLanguageTag:v9];

  uint64_t v10 = (void *)[(NSString *)self->_debugText copy];
  [v4 setDebugText:v10];

  v11 = (void *)[(NSString *)self->_debugUrlString copy];
  [v4 setDebugUrlString:v11];

  uint64_t v12 = (void *)[(NSString *)self->_rawHTML copy];
  [v4 setRawHTML:v12];

  v13 = (void *)[(NSArray *)self->_uiElements copy];
  [v4 setUiElements:v13];

  uint64_t v14 = (void *)[(NSArray *)self->_extractionItems copy];
  [v4 setExtractionItems:v14];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() trimTextToSize:v4];

  text = self->_text;
  self->_text = v5;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() trimTextToSize:v4];

  title = self->_title;
  self->_title = v5;
}

- (void)setContentDescription:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() trimTextToSize:v4];

  contentDescription = self->_contentDescription;
  self->_contentDescription = v5;
}

- (void)setContentKeywords:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() trimTextToSize:v4];

  contentKeywords = self->_contentKeywords;
  self->_contentKeywords = v5;
}

- (void)setContentAuthor:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() trimTextToSize:v4];

  contentAuthor = self->_contentAuthor;
  self->_contentAuthor = v5;
}

+ (id)trimTextToSize:(id)a3
{
  v3 = (__CFString *)a3;
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = [(__CFString *)v3 length];
    unint64_t v6 = v5 >= 0x4E20 ? 20000 : v5;
    if (v6)
    {
      v7 = malloc_type_malloc(2 * v6, 0x1000040BDFB0063uLL);
      if (!v7) {
        goto LABEL_56;
      }
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      *(_OWORD *)buffer = 0u;
      long long v31 = 0u;
      CFStringRef theString = v4;
      uint64_t v41 = 0;
      int64_t v42 = v6;
      CharactersPtr = CFStringGetCharactersPtr(v4);
      CStringPtr = 0;
      v39 = CharactersPtr;
      if (!CharactersPtr) {
        CStringPtr = CFStringGetCStringPtr(v4, 0x600u);
      }
      uint64_t v43 = 0;
      int64_t v44 = 0;
      v40 = CStringPtr;
      CFCharacterSetRef theSet = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
      unint64_t v10 = 0;
      unint64_t v11 = 0;
      char v12 = 1;
      do
      {
        uint64_t v13 = -(uint64_t)v10;
        unint64_t v14 = v10 + 64;
        while (1)
        {
          if (v10 >= 4) {
            uint64_t v15 = 4;
          }
          else {
            uint64_t v15 = v10;
          }
          int64_t v16 = v42;
          if (v42 <= (uint64_t)v10)
          {
            UniChar v17 = 0;
            goto LABEL_36;
          }
          if (v39)
          {
            UniChar v17 = v39[v10 + v41];
          }
          else if (v40)
          {
            UniChar v17 = v40[v41 + v10];
          }
          else
          {
            uint64_t v18 = v43;
            if (v44 <= (uint64_t)v10 || v43 > (uint64_t)v10)
            {
              uint64_t v20 = -v15;
              uint64_t v21 = v15 + v13;
              int64_t v22 = v14 - v15;
              uint64_t v23 = v10 + v20;
              int64_t v24 = v23 + 64;
              if (v23 + 64 >= v42) {
                int64_t v24 = v42;
              }
              uint64_t v43 = v23;
              int64_t v44 = v24;
              if (v42 >= v22) {
                int64_t v16 = v22;
              }
              v46.length = v16 + v21;
              v46.location = v23 + v41;
              CFStringGetCharacters(theString, v46, buffer);
              uint64_t v18 = v43;
            }
            UniChar v17 = buffer[v10 - v18];
          }
          if (v17 != 10) {
            break;
          }
          if (v11)
          {
            int v26 = (unsigned __int16)v7[v11 - 1];
            if (v26 == 32)
            {
              v7[v11 - 1] = 10;
              goto LABEL_47;
            }
            if (v26 != 10 || v11 < 2 || v7[v11 - 2] != 10)
            {
              __int16 v25 = 10;
              goto LABEL_46;
            }
            goto LABEL_47;
          }
          ++v10;
          --v13;
          ++v14;
          if (v10 >= v6) {
            goto LABEL_54;
          }
        }
        if (v17 == 173) {
          goto LABEL_48;
        }
LABEL_36:
        if (!CFCharacterSetIsCharacterMember(theSet, v17))
        {
          char v12 = 0;
          v7[v11++] = v17;
          goto LABEL_48;
        }
        if ((v12 & 1) == 0)
        {
          __int16 v25 = 32;
LABEL_46:
          v7[v11++] = v25;
        }
LABEL_47:
        char v12 = 1;
LABEL_48:
        ++v10;
      }
      while (v10 < v6 && v11 >> 4 <= 0x270);
      if (v11)
      {
        unint64_t v27 = v11 - 1;
        if (v7[v11 - 1] != 32 || (--v11, v27))
        {
          v7 = (_WORD *)[[NSString alloc] initWithCharactersNoCopy:v7 length:v11 freeWhenDone:1];
          goto LABEL_56;
        }
      }
LABEL_54:
      free(v7);
    }
  }
  v7 = 0;
LABEL_56:

  return v7;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)contentDescription
{
  return self->_contentDescription;
}

- (NSString)contentKeywords
{
  return self->_contentKeywords;
}

- (NSString)contentAuthor
{
  return self->_contentAuthor;
}

- (NSString)rawHTML
{
  return self->_rawHTML;
}

- (void)setRawHTML:(id)a3
{
}

- (NSString)languageTag
{
  return self->_languageTag;
}

- (void)setLanguageTag:(id)a3
{
}

- (IOSurface)leadImage
{
  return self->_leadImage;
}

- (void)setLeadImage:(id)a3
{
}

- (IOSurface)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
}

- (NSArray)uiElements
{
  return self->_uiElements;
}

- (void)setUiElements:(id)a3
{
}

- (NSArray)extractionItems
{
  return self->_extractionItems;
}

- (void)setExtractionItems:(id)a3
{
}

- (NSString)debugText
{
  return self->_debugText;
}

- (void)setDebugText:(id)a3
{
}

- (NSString)debugUrlString
{
  return self->_debugUrlString;
}

- (void)setDebugUrlString:(id)a3
{
}

@end