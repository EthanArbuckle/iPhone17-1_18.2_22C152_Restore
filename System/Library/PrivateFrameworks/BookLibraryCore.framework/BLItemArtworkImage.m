@interface BLItemArtworkImage
- (BLItemArtworkImage)initWithArtworkDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGSize)imageSize;
- (NSString)URLString;
- (NSString)imageKind;
- (NSURL)URL;
- (double)imageScale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)valueForProperty:(id)a3;
- (int64_t)height;
- (int64_t)width;
- (unint64_t)hash;
- (void)_setValue:(id)a3 forKey:(id)a4;
- (void)setImageKind:(id)a3;
- (void)setImageKindWithTypeName:(id)a3 variantName:(id)a4;
- (void)setURL:(id)a3;
@end

@implementation BLItemArtworkImage

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v11 = objc_msgSend_mutableCopyWithZone_(self->_dictionary, v9, (uint64_t)a3, v10);
  v12 = (void *)v8[1];
  v8[1] = v11;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_imageKind, v13, (uint64_t)a3, v14);
  v16 = (void *)v8[2];
  v8[2] = v15;

  return v8;
}

- (int64_t)height
{
  v4 = objc_msgSend_objectForKey_(self->_dictionary, a2, @"box-height", v2);
  if (objc_opt_respondsToSelector()) {
    int64_t v8 = (int)objc_msgSend_intValue(v4, v5, v6, v7);
  }
  else {
    int64_t v8 = 0;
  }
  objc_msgSend_imageScale(self, v5, v6, v7);
  if (v9 > 0.00000011920929) {
    int64_t v8 = (uint64_t)((double)v8 / v9);
  }

  return v8;
}

- (double)imageScale
{
  v3 = objc_msgSend_objectForKey_(self->_dictionary, a2, @"scale", v2);
  double v7 = 1.0;
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend_floatValue(v3, v4, v5, v6);
    double v7 = v8;
  }

  return v7;
}

- (int64_t)width
{
  v4 = objc_msgSend_objectForKey_(self->_dictionary, a2, @"box-width", v2);
  if (objc_opt_respondsToSelector()) {
    int64_t v8 = (int)objc_msgSend_intValue(v4, v5, v6, v7);
  }
  else {
    int64_t v8 = 0;
  }
  objc_msgSend_imageScale(self, v5, v6, v7);
  if (v9 > 0.00000011920929) {
    int64_t v8 = (uint64_t)((double)v8 / v9);
  }

  return v8;
}

- (NSURL)URL
{
  v3 = objc_msgSend_objectForKey_(self->_dictionary, a2, @"url", v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_msgSend_URLWithString_(NSURL, v4, (uint64_t)v3, v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSURL *)v6;
}

- (id)valueForProperty:(id)a3
{
  return (id)objc_msgSend_objectForKey_(self->_dictionary, a2, (uint64_t)a3, v3);
}

- (id)description
{
  uint64_t v3 = NSString;
  v25.receiver = self;
  v25.super_class = (Class)BLItemArtworkImage;
  v4 = [(BLItemArtworkImage *)&v25 description];
  int64_t v8 = objc_msgSend_imageKind(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_width(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_height(self, v13, v14, v15);
  v20 = objc_msgSend_URL(self, v17, v18, v19);
  v23 = objc_msgSend_stringWithFormat_(v3, v21, @"%@: [%@ %ldx%ld] %@", v22, v4, v8, v12, v16, v20);

  return v23;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend_objectForKey_(self->_dictionary, a2, @"url", v2);
  unint64_t v7 = objc_msgSend_hash(v3, v4, v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v7 = objc_msgSend_objectForKey_(self->_dictionary, v5, @"url", v6);
    uint64_t v10 = objc_msgSend_valueForProperty_(v4, v8, @"url", v9);
    char isEqualToString = objc_msgSend_isEqualToString_(v7, v11, (uint64_t)v10, v12);
  }
  else
  {
    char isEqualToString = 0;
  }

  return isEqualToString;
}

- (BLItemArtworkImage)initWithArtworkDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BLItemArtworkImage;
  int64_t v8 = [(BLItemArtworkImage *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_mutableCopy(v4, v5, v6, v7);
    dictionary = v8->_dictionary;
    v8->_dictionary = (NSMutableDictionary *)v9;
  }
  return v8;
}

- (CGSize)imageSize
{
  double v5 = (double)objc_msgSend_width(self, a2, v2, v3);
  double v9 = (double)objc_msgSend_height(self, v6, v7, v8);
  double v10 = v5;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)setImageKindWithTypeName:(id)a3 variantName:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  if (objc_msgSend_hasSuffix_(v6, v7, @"@2x", v8))
  {
    LODWORD(v12) = 2.0;
    v13 = objc_msgSend_numberWithFloat_(NSNumber, v9, v10, v11, v12);
    objc_msgSend__setValue_forKey_(self, v14, (uint64_t)v13, @"scale");

    uint64_t v18 = objc_msgSend_length(v6, v15, v16, v17);
    uint64_t v21 = objc_msgSend_substringToIndex_(v6, v19, v18 - 3, v20);

    id v6 = (id)v21;
  }
  uint64_t v22 = objc_msgSend_stringByAppendingFormat_(v25, v9, @".%@", v11, v6);
  objc_msgSend_setImageKind_(self, v23, (uint64_t)v22, v24);
}

- (void)setURL:(id)a3
{
  objc_msgSend_absoluteString(a3, a2, (uint64_t)a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setValue_forKey_(self, v5, (uint64_t)v6, @"url");
}

- (NSString)URLString
{
  return (NSString *)objc_msgSend_valueForProperty_(self, a2, @"url", v2);
}

- (void)_setValue:(id)a3 forKey:(id)a4
{
  v13 = (char *)a3;
  id v6 = a4;
  uint64_t v8 = v13;
  id v9 = v6;
  dictionary = self->_dictionary;
  if (v13)
  {
    if (!dictionary)
    {
      uint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      double v12 = self->_dictionary;
      self->_dictionary = v11;

      uint64_t v8 = v13;
      dictionary = self->_dictionary;
    }
    objc_msgSend_setObject_forKey_(dictionary, v8, (uint64_t)v8, (uint64_t)v9);
  }
  else
  {
    objc_msgSend_removeObjectForKey_(dictionary, 0, (uint64_t)v9, v7);
  }
}

- (NSString)imageKind
{
  return self->_imageKind;
}

- (void)setImageKind:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageKind, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end