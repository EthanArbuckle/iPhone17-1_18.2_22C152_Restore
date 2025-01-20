@interface BLItemContentRating
+ (id)stringForRatingSystem:(int64_t)a3;
+ (int64_t)ratingSystemFromString:(id)a3;
- (BLItemContentRating)init;
- (BLItemContentRating)initWithDictionary:(id)a3;
- (NSDictionary)contentRatingDictionary;
- (NSString)ratingDescription;
- (NSString)ratingLabel;
- (id)copyWithZone:(_NSZone *)a3;
- (id)valueForProperty:(id)a3;
- (int64_t)rank;
- (int64_t)ratingSystem;
- (void)_setValue:(id)a3 forProperty:(id)a4;
- (void)_setValueCopy:(id)a3 forProperty:(id)a4;
- (void)setRank:(int64_t)a3;
- (void)setRatingDescription:(id)a3;
- (void)setRatingLabel:(id)a3;
- (void)setRatingSystem:(int64_t)a3;
@end

@implementation BLItemContentRating

- (BLItemContentRating)init
{
  v6.receiver = self;
  v6.super_class = (Class)BLItemContentRating;
  v2 = [(BLItemContentRating *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;
  }
  return v2;
}

- (BLItemContentRating)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BLItemContentRating;
  v8 = [(BLItemContentRating *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_mutableCopy(v4, v5, v6, v7);
    dictionary = v8->_dictionary;
    v8->_dictionary = (NSMutableDictionary *)v9;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v11 = objc_msgSend_mutableCopyWithZone_(self->_dictionary, v9, (uint64_t)a3, v10);
  objc_super v12 = (void *)v8[1];
  v8[1] = v11;

  return v8;
}

- (int64_t)rank
{
  v3 = objc_msgSend_objectForKey_(self->_dictionary, a2, @"rank", v2);
  if (objc_opt_respondsToSelector()) {
    int64_t v7 = (int)objc_msgSend_intValue(v3, v4, v5, v6);
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (NSString)ratingDescription
{
  v3 = objc_msgSend_objectForKey_(self->_dictionary, a2, @"description", v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (NSString)ratingLabel
{
  v3 = objc_msgSend_objectForKey_(self->_dictionary, a2, @"label", v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (int64_t)ratingSystem
{
  v3 = objc_msgSend_objectForKey_(self->_dictionary, a2, @"system", v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_opt_class();
    int64_t v7 = objc_msgSend_ratingSystemFromString_(v4, v5, (uint64_t)v3, v6);
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)setRank:(int64_t)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setValue_forProperty_(self, v5, (uint64_t)v6, @"rank");
}

- (void)setRatingDescription:(id)a3
{
}

- (void)setRatingLabel:(id)a3
{
}

- (void)setRatingSystem:(int64_t)a3
{
  uint64_t v5 = objc_opt_class();
  objc_msgSend_stringForRatingSystem_(v5, v6, a3, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setValue_forProperty_(self, v8, (uint64_t)v9, @"system");
}

- (id)valueForProperty:(id)a3
{
  return (id)objc_msgSend_objectForKey_(self->_dictionary, a2, (uint64_t)a3, v3);
}

+ (int64_t)ratingSystemFromString:(id)a3
{
  uint64_t v5 = 0;
  while (objc_msgSend_caseInsensitiveCompare_(*(__CFString **)((char *)&off_26448B0D8 + v5), a2, (uint64_t)a3, v3))
  {
    v5 += 16;
    if (v5 == 1536) {
      return 0;
    }
  }
  return *(int64_t *)((char *)&off_26448B0D8 + v5 + 8);
}

+ (id)stringForRatingSystem:(int64_t)a3
{
  uint64_t v3 = 0;
  while (*(__CFString **)((char *)&off_26448B0D8 + v3 + 8) != (__CFString *)a3)
  {
    v3 += 16;
    if (v3 == 1536)
    {
      id v4 = 0;
      goto LABEL_6;
    }
  }
  id v4 = *(__CFString **)((char *)&off_26448B0D8 + v3);
LABEL_6:

  return v4;
}

- (NSDictionary)contentRatingDictionary
{
  id v4 = objc_msgSend_copy(self->_dictionary, a2, v2, v3);

  return (NSDictionary *)v4;
}

- (void)_setValueCopy:(id)a3 forProperty:(id)a4
{
  id v6 = a4;
  id v11 = (id)objc_msgSend_copy(a3, v7, v8, v9);
  objc_msgSend__setValue_forProperty_(self, v10, (uint64_t)v11, (uint64_t)v6);
}

- (void)_setValue:(id)a3 forProperty:(id)a4
{
  dictionary = self->_dictionary;
  if (a3) {
    objc_msgSend_setObject_forKey_(dictionary, a2, (uint64_t)a3, (uint64_t)a4);
  }
  else {
    objc_msgSend_removeObjectForKey_(dictionary, a2, (uint64_t)a4, (uint64_t)a4);
  }
}

- (void).cxx_destruct
{
}

@end