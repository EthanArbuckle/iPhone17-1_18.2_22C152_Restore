@interface GDPersonViewPerson
- (id)description;
@end

@implementation GDPersonViewPerson

- (id)description
{
  v6 = NSString;
  v7 = objc_msgSend_entityIdentifier(self, a2, v2, v3, v4);
  uint64_t v12 = objc_msgSend_nameComponents(self, v8, v9, v10, v11);
  v17 = (void *)v12;
  if (v12) {
    v18 = (__CFString *)v12;
  }
  else {
    v18 = &stru_1F0AE2ED0;
  }
  uint64_t v19 = objc_msgSend_dateOfBirth(self, v13, v14, v15, v16);
  v24 = (void *)v19;
  if (v19) {
    v25 = (__CFString *)v19;
  }
  else {
    v25 = &stru_1F0AE2ED0;
  }
  v26 = objc_msgSend_names(self, v20, v21, v22, v23);
  v30 = objc_msgSend_componentsJoinedByString_(v26, v27, @"|", v28, v29);
  unsigned int isFavorite = objc_msgSend_isFavorite(self, v31, v32, v33, v34);
  uint64_t v40 = objc_msgSend_type(self, v36, v37, v38, v39);
  v44 = objc_msgSend_stringWithFormat_(v6, v41, @"<GDPersonViewPerson %@, %@, dob:%@, ns:%@, f:%d, t:%td>", v42, v43, v7, v18, v25, v30, isFavorite, v40);

  return v44;
}

@end