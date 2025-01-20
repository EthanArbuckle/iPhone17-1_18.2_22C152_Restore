@interface CHSearchQueryItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSearchQueryItem:(id)a3;
- (CGRect)boundsForStrokeIdentifier:(id)a3;
- (NSSet)strokeIdentifiers;
- (id)description;
- (unint64_t)hash;
@end

@implementation CHSearchQueryItem

- (id)description
{
  v16.receiver = self;
  v16.super_class = (Class)CHSearchQueryItem;
  v3 = [(CHSearchQueryItem *)&v16 description];
  v9 = objc_msgSend_strokeIdentifiers(self, v4, v5, v6, v7, v8);
  v14 = objc_msgSend_stringByAppendingFormat_(v3, v10, @" strokeIdentifiers: %@", v11, v12, v13, v9);

  return v14;
}

- (BOOL)isEqualToSearchQueryItem:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = (CHSearchQueryItem *)a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v10 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        int v18 = 138412290;
        v19 = v4;
        _os_log_impl(&dword_1C492D000, v10, OS_LOG_TYPE_FAULT, "item should be of class CHSearchQueryItem: %@", (uint8_t *)&v18, 0xCu);
      }
    }
    if (v4 == self)
    {
      char isEqual = 1;
    }
    else
    {
      uint64_t v11 = objc_msgSend_strokeIdentifiers(v4, v5, v6, v7, v8, v9);
      char isEqual = objc_msgSend_isEqual_(v11, v12, (uint64_t)self->_strokeIdentifiers, v13, v14, v15);
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToSearchQueryItem = objc_msgSend_isEqualToSearchQueryItem_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToSearchQueryItem;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  return objc_msgSend_hash(self->_strokeIdentifiers, a2, v2, v3, v4, v5);
}

- (CGRect)boundsForStrokeIdentifier:(id)a3
{
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(self->_strokeBoundsByIdentifier, a2, (uint64_t)a3, v3, v4, v5);
  uint64_t v12 = v6;
  if (v6)
  {
    objc_msgSend_ch_CGRectValue(v6, v7, v8, v9, v10, v11);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
  }
  else
  {
    double v14 = *MEMORY[0x1E4F1DB20];
    double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v18 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v20 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (NSSet)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_strokeBoundsByIdentifier, 0);
}

@end