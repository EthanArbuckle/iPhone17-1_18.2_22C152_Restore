@interface _BlastDoorLPStocksMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (NSString)combinedTitle;
- (NSString)footnote;
- (NSString)subtitle;
- (NSString)title;
- (_BlastDoorLPImage)icon;
- (_BlastDoorLPStocksMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCombinedTitle:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setIcon:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _BlastDoorLPStocksMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPStocksMetadata)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_BlastDoorLPStocksMetadata;
  v5 = [(_BlastDoorLPStocksMetadata *)&v18 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"combinedTitle");
    combinedTitle = v5->_combinedTitle;
    v5->_combinedTitle = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"title");
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = decodeStringForKey(v4, @"subtitle");
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    uint64_t v12 = decodeStringForKey(v4, @"footnote");
    footnote = v5->_footnote;
    v5->_footnote = (NSString *)v12;

    uint64_t v14 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"icon");
    icon = v5->_icon;
    v5->_icon = (_BlastDoorLPImage *)v14;

    v16 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  combinedTitle = self->_combinedTitle;
  id v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", combinedTitle, @"combinedTitle");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_title, @"title");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_subtitle, @"subtitle");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_footnote, @"footnote");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_icon, @"icon");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_BlastDoorLPStocksMetadata allocWithZone:a3];
  if (v4)
  {
    id v5 = [(_BlastDoorLPStocksMetadata *)self combinedTitle];
    [(_BlastDoorLPStocksMetadata *)v4 setCombinedTitle:v5];

    uint64_t v6 = [(_BlastDoorLPStocksMetadata *)self title];
    [(_BlastDoorLPStocksMetadata *)v4 setTitle:v6];

    v7 = [(_BlastDoorLPStocksMetadata *)self subtitle];
    [(_BlastDoorLPStocksMetadata *)v4 setSubtitle:v7];

    uint64_t v8 = [(_BlastDoorLPStocksMetadata *)self footnote];
    [(_BlastDoorLPStocksMetadata *)v4 setFootnote:v8];

    v9 = [(_BlastDoorLPStocksMetadata *)self icon];
    [(_BlastDoorLPStocksMetadata *)v4 setIcon:v9];

    uint64_t v10 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_BlastDoorLPStocksMetadata;
  if ([(_BlastDoorLPStocksMetadata *)&v13 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v4;
      unint64_t v7 = v6[2];
      if (v7 | (unint64_t)self->_combinedTitle && !objc_msgSend((id)v7, "isEqual:")
        || (unint64_t v8 = v6[3], v8 | (unint64_t)self->_title) && !objc_msgSend((id)v8, "isEqual:")
        || (unint64_t v9 = v6[4], v9 | (unint64_t)self->_subtitle) && !objc_msgSend((id)v9, "isEqual:")
        || (unint64_t v10 = v6[5], v10 | (unint64_t)self->_footnote) && !objc_msgSend((id)v10, "isEqual:"))
      {
        char v5 = 0;
      }
      else
      {
        unint64_t v11 = v6[6];
        if (v11 | (unint64_t)self->_icon) {
          char v5 = objc_msgSend((id)v11, "isEqual:");
        }
        else {
          char v5 = 1;
        }
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_title hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"combinedTitle", @"title", @"subtitle", @"footnote", @"icon", 0);
}

- (NSString)combinedTitle
{
  return self->_combinedTitle;
}

- (void)setCombinedTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
}

- (_BlastDoorLPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_combinedTitle, 0);
}

@end