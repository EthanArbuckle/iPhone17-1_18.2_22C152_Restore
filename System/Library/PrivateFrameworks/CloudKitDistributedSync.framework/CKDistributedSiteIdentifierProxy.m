@interface CKDistributedSiteIdentifierProxy
- (id)identifier;
- (id)modifier;
- (id)siteIdentifier;
- (unint64_t)identifierSize;
- (unint64_t)modifierSize;
- (unint64_t)size;
- (void)copyIdentifierBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5;
- (void)copyModifierBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5;
@end

@implementation CKDistributedSiteIdentifierProxy

- (unint64_t)size
{
  uint64_t v4 = objc_msgSend_identifierSize(self, a2, v2);
  return objc_msgSend_modifierSize(self, v5, v6) + v4;
}

- (unint64_t)identifierSize
{
  char v4 = 0;
  uint64_t v3 = 0;
  objc_msgSend_copyIdentifierBytes_length_isNull_(self, a2, 0, &v3, &v4);
  if (v4) {
    return 0;
  }
  else {
    return v3 + 8;
  }
}

- (id)identifier
{
  char v4 = objc_msgSend_backingStore(self, a2, v2);
  v7 = v4;
  if (v4)
  {
    objc_msgSend_binding(v4, v5, v6);
    v8 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_dataForToken_(self, v9, v8[2]);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)copyIdentifierBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5
{
  v9 = objc_msgSend_backingStore(self, a2, (uint64_t)a3);
  if (v9)
  {
    v14 = v9;
    v12 = objc_msgSend_binding(v9, v10, v11);
    objc_msgSend_copyBytes_length_isNull_forToken_(self, v13, (uint64_t)a3, a4, a5, v12[2]);

    v9 = v14;
  }
  else
  {
    if (a4) {
      *a4 = 0;
    }
    if (a5) {
      *a5 = 1;
    }
  }
}

- (unint64_t)modifierSize
{
  char v4 = 0;
  uint64_t v3 = 0;
  objc_msgSend_copyModifierBytes_length_isNull_(self, a2, 0, &v3, &v4);
  if (v4) {
    return 0;
  }
  else {
    return v3 + 8;
  }
}

- (id)modifier
{
  char v4 = objc_msgSend_backingStore(self, a2, v2);
  v7 = v4;
  if (v4)
  {
    objc_msgSend_binding(v4, v5, v6);
    v8 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_dataForToken_(self, v9, v8[3]);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)copyModifierBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5
{
  v9 = objc_msgSend_backingStore(self, a2, (uint64_t)a3);
  if (v9)
  {
    v14 = v9;
    v12 = objc_msgSend_binding(v9, v10, v11);
    objc_msgSend_copyBytes_length_isNull_forToken_(self, v13, (uint64_t)a3, a4, a5, v12[3]);

    v9 = v14;
  }
  else
  {
    if (a4) {
      *a4 = 0;
    }
    if (a5) {
      *a5 = 1;
    }
  }
}

- (id)siteIdentifier
{
  id v3 = objc_alloc(MEMORY[0x1E4F19F80]);
  uint64_t v6 = objc_msgSend_identifier(self, v4, v5);
  v9 = objc_msgSend_modifier(self, v7, v8);
  uint64_t v11 = objc_msgSend_initWithIdentifier_modifier_(v3, v10, (uint64_t)v6, v9);

  return v11;
}

@end