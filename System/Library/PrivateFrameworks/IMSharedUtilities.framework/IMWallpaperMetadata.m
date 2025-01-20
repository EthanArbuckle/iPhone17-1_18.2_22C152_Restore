@interface IMWallpaperMetadata
+ (BOOL)supportsSecureCoding;
+ (id)wallpaperExtensionIdentifierFromType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVertical;
- (IMWallpaperMetadata)initWithCoder:(id)a3;
- (IMWallpaperMetadata)initWithDictionaryRepresentation:(id)a3;
- (IMWallpaperMetadata)initWithFontName:(id)a3 fontSize:(double)a4 fontWeight:(double)a5 fontColor:(id)a6 isVertical:(BOOL)a7 type:(id)a8 backgroundColor:(id)a9;
- (NSDictionary)backgroundColor;
- (NSDictionary)fontColor;
- (NSString)fontName;
- (NSString)type;
- (double)fontSize;
- (double)fontWeight;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IMWallpaperMetadata

- (IMWallpaperMetadata)initWithFontName:(id)a3 fontSize:(double)a4 fontWeight:(double)a5 fontColor:(id)a6 isVertical:(BOOL)a7 type:(id)a8 backgroundColor:(id)a9
{
  BOOL v11 = a7;
  id v16 = a3;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  v24.receiver = self;
  v24.super_class = (Class)IMWallpaperMetadata;
  v20 = [(IMWallpaperMetadata *)&v24 init];
  if (v20)
  {
    v21 = [[IMWallpaperMetadata_Impl alloc] initWithFontName:v16 fontSize:v17 fontWeight:v11 fontColor:v18 isVertical:v19 type:a4 backgroundColor:a5];
    swiftImpl = v20->swiftImpl;
    v20->swiftImpl = v21;
  }
  return v20;
}

- (void)encodeWithCoder:(id)a3
{
}

- (IMWallpaperMetadata)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMWallpaperMetadata;
  v5 = [(IMWallpaperMetadata *)&v9 init];
  if (v5)
  {
    v6 = [[IMWallpaperMetadata_Impl alloc] initWithDictionaryRepresentation:v4];
    swiftImpl = v5->swiftImpl;
    v5->swiftImpl = v6;
  }
  return v5;
}

- (IMWallpaperMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMWallpaperMetadata;
  v5 = [(IMWallpaperMetadata *)&v9 init];
  if (v5)
  {
    v6 = [[IMWallpaperMetadata_Impl alloc] initWithCoder:v4];
    swiftImpl = v5->swiftImpl;
    v5->swiftImpl = v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)fontName
{
  return [(IMWallpaperMetadata_Impl *)self->swiftImpl fontName];
}

- (double)fontSize
{
  [(IMWallpaperMetadata_Impl *)self->swiftImpl fontSize];
  return result;
}

- (double)fontWeight
{
  [(IMWallpaperMetadata_Impl *)self->swiftImpl fontWeight];
  return result;
}

- (NSDictionary)fontColor
{
  v2 = [(IMWallpaperMetadata_Impl *)self->swiftImpl fontColor];
  v3 = [v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (BOOL)isVertical
{
  return [(IMWallpaperMetadata_Impl *)self->swiftImpl isVertical];
}

- (NSString)type
{
  return [(IMWallpaperMetadata_Impl *)self->swiftImpl type];
}

- (NSDictionary)backgroundColor
{
  v2 = [(IMWallpaperMetadata_Impl *)self->swiftImpl backgroundColor];
  v3 = [v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (id)dictionaryRepresentation
{
  return [(IMWallpaperMetadata_Impl *)self->swiftImpl dictionaryRepresentation];
}

+ (id)wallpaperExtensionIdentifierFromType:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return &stru_1EF2CAD28;
  }
  else {
    return off_1E5A10BD0[a3];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = [(IMWallpaperMetadata *)self fontName];
    v8 = [v6 fontName];
    char v9 = [v7 isEqualToString:v8];
    if ((v9 & 1) == 0)
    {
      v3 = [(IMWallpaperMetadata *)self fontName];
      v10 = [v6 fontName];
      if (v3 != v10)
      {
        BOOL v11 = 0;
        goto LABEL_16;
      }
    }
    [(IMWallpaperMetadata *)self fontSize];
    double v13 = v12;
    [v6 fontSize];
    if (v13 == v14)
    {
      [(IMWallpaperMetadata *)self fontWeight];
      double v16 = v15;
      [v6 fontWeight];
      if (v16 == v17)
      {
        int v18 = [(IMWallpaperMetadata *)self isVertical];
        if (v18 == [v6 isVertical])
        {
          id v19 = [(IMWallpaperMetadata *)self type];
          v20 = [v6 type];
          if ([v19 isEqualToString:v20])
          {
            v21 = [(IMWallpaperMetadata *)self backgroundColor];
            v34 = [v6 backgroundColor];
            v35 = v21;
            char v33 = objc_msgSend(v21, "isEqualToDictionary:");
            if ((v33 & 1) == 0)
            {
              v22 = [(IMWallpaperMetadata *)self backgroundColor];
              v23 = [v6 backgroundColor];
              if (v22 != v23)
              {
                BOOL v11 = 0;
LABEL_24:

LABEL_25:
LABEL_15:
                v10 = v3;
                if (v9)
                {
LABEL_17:

                  goto LABEL_18;
                }
LABEL_16:

                goto LABEL_17;
              }
              v29 = v22;
            }
            v31 = v19;
            v25 = [(IMWallpaperMetadata *)self fontColor];
            v26 = [v6 fontColor];
            v32 = v25;
            if ([v25 isEqualToDictionary:v26])
            {

              BOOL v11 = 1;
            }
            else
            {
              v27 = [(IMWallpaperMetadata *)self fontColor];
              v28 = [v6 fontColor];
              BOOL v11 = v27 == v28;
            }
            v23 = v30;
            id v19 = v31;
            v22 = v30;
            if (v33) {
              goto LABEL_25;
            }
            goto LABEL_24;
          }
        }
      }
    }
    BOOL v11 = 0;
    goto LABEL_15;
  }
  BOOL v11 = 0;
LABEL_18:

  return v11;
}

- (void).cxx_destruct
{
}

@end