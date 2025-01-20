@interface CKMergeableValueIDProxy
- (id)identifier;
- (id)mergeableValueID;
- (id)zoneName;
- (id)zoneOwnerName;
- (unint64_t)identifierSize;
- (unint64_t)size;
- (unint64_t)zoneNameSize;
- (unint64_t)zoneOwnerNameSize;
- (void)copyIdentifierBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5;
- (void)copyZoneNameBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5;
- (void)copyZoneOwnerNameBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5;
@end

@implementation CKMergeableValueIDProxy

- (unint64_t)size
{
  uint64_t v4 = objc_msgSend_identifierSize(self, a2, v2);
  uint64_t v7 = objc_msgSend_zoneNameSize(self, v5, v6) + v4;
  return v7 + objc_msgSend_zoneOwnerNameSize(self, v8, v9);
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
  uint64_t v7 = v4;
  if (v4)
  {
    objc_msgSend_binding(v4, v5, v6);
    v8 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_dataForToken_(self, v9, v8[21]);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)copyIdentifierBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5
{
  uint64_t v9 = objc_msgSend_backingStore(self, a2, (uint64_t)a3);
  if (v9)
  {
    v14 = v9;
    v12 = objc_msgSend_binding(v9, v10, v11);
    objc_msgSend_copyBytes_length_isNull_forToken_(self, v13, (uint64_t)a3, a4, a5, v12[21]);

    uint64_t v9 = v14;
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

- (unint64_t)zoneNameSize
{
  char v4 = 0;
  uint64_t v3 = 0;
  objc_msgSend_copyZoneNameBytes_length_isNull_(self, a2, 0, &v3, &v4);
  if (v4) {
    return 0;
  }
  else {
    return v3 + 8;
  }
}

- (id)zoneName
{
  char v4 = objc_msgSend_backingStore(self, a2, v2);
  uint64_t v7 = v4;
  if (v4)
  {
    objc_msgSend_binding(v4, v5, v6);
    v8 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_stringForToken_(self, v9, v8[22]);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)copyZoneNameBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5
{
  uint64_t v9 = objc_msgSend_backingStore(self, a2, (uint64_t)a3);
  if (v9)
  {
    v14 = v9;
    v12 = objc_msgSend_binding(v9, v10, v11);
    objc_msgSend_copyBytes_length_isNull_forToken_(self, v13, (uint64_t)a3, a4, a5, v12[22]);

    uint64_t v9 = v14;
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

- (unint64_t)zoneOwnerNameSize
{
  char v4 = 0;
  uint64_t v3 = 0;
  objc_msgSend_copyZoneOwnerNameBytes_length_isNull_(self, a2, 0, &v3, &v4);
  if (v4) {
    return 0;
  }
  else {
    return v3 + 8;
  }
}

- (id)zoneOwnerName
{
  char v4 = objc_msgSend_backingStore(self, a2, v2);
  uint64_t v7 = v4;
  if (v4)
  {
    objc_msgSend_binding(v4, v5, v6);
    v8 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_stringForToken_(self, v9, v8[23]);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)copyZoneOwnerNameBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5
{
  uint64_t v9 = objc_msgSend_backingStore(self, a2, (uint64_t)a3);
  if (v9)
  {
    v14 = v9;
    v12 = objc_msgSend_binding(v9, v10, v11);
    objc_msgSend_copyBytes_length_isNull_forToken_(self, v13, (uint64_t)a3, a4, a5, v12[23]);

    uint64_t v9 = v14;
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

- (id)mergeableValueID
{
  id v3 = objc_alloc(MEMORY[0x1E4F1A168]);
  uint64_t v6 = objc_msgSend_identifier(self, v4, v5);
  uint64_t v9 = objc_msgSend_zoneName(self, v7, v8);
  v12 = objc_msgSend_zoneOwnerName(self, v10, v11);
  v14 = objc_msgSend_initWithData_zoneName_zoneOwner_(v3, v13, (uint64_t)v6, v9, v12);

  return v14;
}

@end