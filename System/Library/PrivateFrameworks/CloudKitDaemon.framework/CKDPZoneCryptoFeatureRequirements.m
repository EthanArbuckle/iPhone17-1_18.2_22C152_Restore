@interface CKDPZoneCryptoFeatureRequirements
- (BOOL)hasMinimumSchemaVersion;
- (BOOL)hasPermittedFieldCryptoFeatures;
- (BOOL)hasPermittedRecordCryptoFeatures;
- (BOOL)hasPermittedZoneCryptoFeatures;
- (BOOL)hasRequiredAdopterFeatures;
- (BOOL)hasRequiredFieldCryptoFeatures;
- (BOOL)hasRequiredRecordCryptoFeatures;
- (BOOL)hasRequiredZoneCryptoFeatures;
- (BOOL)hasRevision;
- (BOOL)hasZoneIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPAdopterFeatureSet)requiredAdopterFeatures;
- (CKDPFieldCryptoFeatureSet)requiredFieldCryptoFeatures;
- (CKDPFieldPermittedCryptoFeatureSet)permittedFieldCryptoFeatures;
- (CKDPRecordCryptoFeatureSet)requiredRecordCryptoFeatures;
- (CKDPRecordPermittedCryptoFeatureSet)permittedRecordCryptoFeatures;
- (CKDPRecordZoneIdentifier)zoneIdentifier;
- (CKDPZoneCryptoFeatureSet)requiredZoneCryptoFeatures;
- (CKDPZonePermittedCryptoFeatureSet)permittedZoneCryptoFeatures;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)minimumSchemaVersion;
- (int)revision;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMinimumSchemaVersion:(BOOL)a3;
- (void)setHasRevision:(BOOL)a3;
- (void)setMinimumSchemaVersion:(int)a3;
- (void)setPermittedFieldCryptoFeatures:(id)a3;
- (void)setPermittedRecordCryptoFeatures:(id)a3;
- (void)setPermittedZoneCryptoFeatures:(id)a3;
- (void)setRequiredAdopterFeatures:(id)a3;
- (void)setRequiredFieldCryptoFeatures:(id)a3;
- (void)setRequiredRecordCryptoFeatures:(id)a3;
- (void)setRequiredZoneCryptoFeatures:(id)a3;
- (void)setRevision:(int)a3;
- (void)setZoneIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPZoneCryptoFeatureRequirements

- (int)minimumSchemaVersion
{
  if (*(unsigned char *)&self->_has) {
    return self->_minimumSchemaVersion;
  }
  else {
    return 1;
  }
}

- (void)setMinimumSchemaVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_minimumSchemaVersion = a3;
}

- (void)setHasMinimumSchemaVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMinimumSchemaVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRevision:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_revision = a3;
}

- (void)setHasRevision:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRevision
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasRequiredZoneCryptoFeatures
{
  return self->_requiredZoneCryptoFeatures != 0;
}

- (BOOL)hasRequiredRecordCryptoFeatures
{
  return self->_requiredRecordCryptoFeatures != 0;
}

- (BOOL)hasRequiredFieldCryptoFeatures
{
  return self->_requiredFieldCryptoFeatures != 0;
}

- (BOOL)hasPermittedZoneCryptoFeatures
{
  return self->_permittedZoneCryptoFeatures != 0;
}

- (BOOL)hasPermittedRecordCryptoFeatures
{
  return self->_permittedRecordCryptoFeatures != 0;
}

- (BOOL)hasPermittedFieldCryptoFeatures
{
  return self->_permittedFieldCryptoFeatures != 0;
}

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (BOOL)hasRequiredAdopterFeatures
{
  return self->_requiredAdopterFeatures != 0;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPZoneCryptoFeatureRequirements;
  v4 = [(CKDPZoneCryptoFeatureRequirements *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  char has = (char)self->_has;
  if (has)
  {
    v8 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_minimumSchemaVersion);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"minimumSchemaVersion");

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v10 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_revision);
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"revision");
  }
  requiredZoneCryptoFeatures = self->_requiredZoneCryptoFeatures;
  if (requiredZoneCryptoFeatures)
  {
    v13 = objc_msgSend_dictionaryRepresentation(requiredZoneCryptoFeatures, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, @"requiredZoneCryptoFeatures");
  }
  requiredRecordCryptoFeatures = self->_requiredRecordCryptoFeatures;
  if (requiredRecordCryptoFeatures)
  {
    v16 = objc_msgSend_dictionaryRepresentation(requiredRecordCryptoFeatures, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, @"requiredRecordCryptoFeatures");
  }
  requiredFieldCryptoFeatures = self->_requiredFieldCryptoFeatures;
  if (requiredFieldCryptoFeatures)
  {
    v19 = objc_msgSend_dictionaryRepresentation(requiredFieldCryptoFeatures, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v20, (uint64_t)v19, @"requiredFieldCryptoFeatures");
  }
  permittedZoneCryptoFeatures = self->_permittedZoneCryptoFeatures;
  if (permittedZoneCryptoFeatures)
  {
    v22 = objc_msgSend_dictionaryRepresentation(permittedZoneCryptoFeatures, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v23, (uint64_t)v22, @"permittedZoneCryptoFeatures");
  }
  permittedRecordCryptoFeatures = self->_permittedRecordCryptoFeatures;
  if (permittedRecordCryptoFeatures)
  {
    v25 = objc_msgSend_dictionaryRepresentation(permittedRecordCryptoFeatures, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v26, (uint64_t)v25, @"permittedRecordCryptoFeatures");
  }
  permittedFieldCryptoFeatures = self->_permittedFieldCryptoFeatures;
  if (permittedFieldCryptoFeatures)
  {
    v28 = objc_msgSend_dictionaryRepresentation(permittedFieldCryptoFeatures, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)v28, @"permittedFieldCryptoFeatures");
  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    v31 = objc_msgSend_dictionaryRepresentation(zoneIdentifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v32, (uint64_t)v31, @"zoneIdentifier");
  }
  requiredAdopterFeatures = self->_requiredAdopterFeatures;
  if (requiredAdopterFeatures)
  {
    v34 = objc_msgSend_dictionaryRepresentation(requiredAdopterFeatures, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v35, (uint64_t)v34, @"requiredAdopterFeatures");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  v4 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    v8 = (int *)MEMORY[0x1E4F940B8];
    while (!*((unsigned char *)a3 + *v6))
    {
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        BOOL v15 = v10++ >= 9;
        if (v15)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        break;
      }
      switch((v11 >> 3))
      {
        case 1u:
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)&self->_has |= 1u;
          while (1)
          {
            uint64_t v21 = *v4;
            unint64_t v22 = *(void *)((char *)a3 + v21);
            if (v22 == -1 || v22 >= *(void *)((char *)a3 + *v5)) {
              break;
            }
            char v23 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v22);
            *(void *)((char *)a3 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0) {
              goto LABEL_60;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_62;
            }
          }
          *((unsigned char *)a3 + *v6) = 1;
LABEL_60:
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v20) = 0;
          }
LABEL_62:
          uint64_t v31 = 8;
          goto LABEL_67;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)&self->_has |= 2u;
          while (2)
          {
            uint64_t v27 = *v4;
            unint64_t v28 = *(void *)((char *)a3 + v27);
            if (v28 == -1 || v28 >= *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v28);
              *(void *)((char *)a3 + v27) = v28 + 1;
              v20 |= (unint64_t)(v29 & 0x7F) << v25;
              if (v29 < 0)
              {
                v25 += 7;
                BOOL v15 = v26++ >= 9;
                if (v15)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v20) = 0;
          }
LABEL_66:
          uint64_t v31 = 72;
LABEL_67:
          *(_DWORD *)((char *)&self->super.super.isa + v31) = v20;
          goto LABEL_68;
        case 3u:
          v30 = objc_alloc_init(CKDPZoneCryptoFeatureSet);
          objc_storeStrong((id *)&self->_requiredZoneCryptoFeatures, v30);
          if (!PBReaderPlaceMark() || (sub_1C4FBB9B4((uint64_t)v30, (uint64_t)a3) & 1) == 0) {
            goto LABEL_70;
          }
          goto LABEL_58;
        case 4u:
          v30 = objc_alloc_init(CKDPRecordCryptoFeatureSet);
          objc_storeStrong((id *)&self->_requiredRecordCryptoFeatures, v30);
          if (!PBReaderPlaceMark() || (sub_1C50273B8((uint64_t)v30, (uint64_t)a3) & 1) == 0) {
            goto LABEL_70;
          }
          goto LABEL_58;
        case 5u:
          v30 = objc_alloc_init(CKDPFieldCryptoFeatureSet);
          objc_storeStrong((id *)&self->_requiredFieldCryptoFeatures, v30);
          if (!PBReaderPlaceMark() || !sub_1C4EF8440((uint64_t)v30, (uint64_t)a3)) {
            goto LABEL_70;
          }
          goto LABEL_58;
        case 6u:
          v30 = objc_alloc_init(CKDPZonePermittedCryptoFeatureSet);
          objc_storeStrong((id *)&self->_permittedZoneCryptoFeatures, v30);
          if (!PBReaderPlaceMark() || (sub_1C4E7EFF8((uint64_t)v30, (uint64_t)a3) & 1) == 0) {
            goto LABEL_70;
          }
          goto LABEL_58;
        case 7u:
          v30 = objc_alloc_init(CKDPRecordPermittedCryptoFeatureSet);
          objc_storeStrong((id *)&self->_permittedRecordCryptoFeatures, v30);
          if (!PBReaderPlaceMark() || (sub_1C4E5F44C((uint64_t)v30, (uint64_t)a3) & 1) == 0) {
            goto LABEL_70;
          }
          goto LABEL_58;
        case 8u:
          v30 = objc_alloc_init(CKDPFieldPermittedCryptoFeatureSet);
          objc_storeStrong((id *)&self->_permittedFieldCryptoFeatures, v30);
          if (!PBReaderPlaceMark() || (sub_1C4F51474((uint64_t)v30, (uint64_t)a3) & 1) == 0) {
            goto LABEL_70;
          }
          goto LABEL_58;
        case 9u:
          v30 = (CKDPZoneCryptoFeatureSet *)objc_alloc_init(MEMORY[0x1E4F19F30]);
          objc_storeStrong((id *)&self->_zoneIdentifier, v30);
          if (!PBReaderPlaceMark() || (CKDPRecordZoneIdentifierReadFrom() & 1) == 0) {
            goto LABEL_70;
          }
          goto LABEL_58;
        case 0xAu:
          v30 = objc_alloc_init(CKDPAdopterFeatureSet);
          objc_storeStrong((id *)&self->_requiredAdopterFeatures, v30);
          if (!PBReaderPlaceMark() || (sub_1C4E74B20((uint64_t)v30, (uint64_t)a3) & 1) == 0)
          {
LABEL_70:

            LOBYTE(v24) = 0;
            return v24;
          }
LABEL_58:
          PBReaderRecallMark();

LABEL_68:
          if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
            goto LABEL_69;
          }
          break;
        default:
          int v24 = PBReaderSkipValueWithTag();
          if (!v24) {
            return v24;
          }
          goto LABEL_68;
      }
    }
  }
LABEL_69:
  LOBYTE(v24) = *((unsigned char *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_requiredZoneCryptoFeatures)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_requiredRecordCryptoFeatures)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_requiredFieldCryptoFeatures)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_permittedZoneCryptoFeatures)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_permittedRecordCryptoFeatures)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_permittedFieldCryptoFeatures)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_zoneIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_requiredAdopterFeatures)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_minimumSchemaVersion;
    *((unsigned char *)v4 + 88) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[18] = self->_revision;
    *((unsigned char *)v4 + 88) |= 2u;
  }
  requiredZoneCryptoFeatures = self->_requiredZoneCryptoFeatures;
  BOOL v15 = v4;
  if (requiredZoneCryptoFeatures)
  {
    objc_msgSend_setRequiredZoneCryptoFeatures_(v4, v5, (uint64_t)requiredZoneCryptoFeatures);
    id v4 = v15;
  }
  requiredRecordCryptoFeatures = self->_requiredRecordCryptoFeatures;
  if (requiredRecordCryptoFeatures)
  {
    objc_msgSend_setRequiredRecordCryptoFeatures_(v15, v5, (uint64_t)requiredRecordCryptoFeatures);
    id v4 = v15;
  }
  requiredFieldCryptoFeatures = self->_requiredFieldCryptoFeatures;
  if (requiredFieldCryptoFeatures)
  {
    objc_msgSend_setRequiredFieldCryptoFeatures_(v15, v5, (uint64_t)requiredFieldCryptoFeatures);
    id v4 = v15;
  }
  permittedZoneCryptoFeatures = self->_permittedZoneCryptoFeatures;
  if (permittedZoneCryptoFeatures)
  {
    objc_msgSend_setPermittedZoneCryptoFeatures_(v15, v5, (uint64_t)permittedZoneCryptoFeatures);
    id v4 = v15;
  }
  permittedRecordCryptoFeatures = self->_permittedRecordCryptoFeatures;
  if (permittedRecordCryptoFeatures)
  {
    objc_msgSend_setPermittedRecordCryptoFeatures_(v15, v5, (uint64_t)permittedRecordCryptoFeatures);
    id v4 = v15;
  }
  permittedFieldCryptoFeatures = self->_permittedFieldCryptoFeatures;
  if (permittedFieldCryptoFeatures)
  {
    objc_msgSend_setPermittedFieldCryptoFeatures_(v15, v5, (uint64_t)permittedFieldCryptoFeatures);
    id v4 = v15;
  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_msgSend_setZoneIdentifier_(v15, v5, (uint64_t)zoneIdentifier);
    id v4 = v15;
  }
  requiredAdopterFeatures = self->_requiredAdopterFeatures;
  if (requiredAdopterFeatures)
  {
    objc_msgSend_setRequiredAdopterFeatures_(v15, v5, (uint64_t)requiredAdopterFeatures);
    id v4 = v15;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = (void *)v10;
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v10 + 8) = self->_minimumSchemaVersion;
    *(unsigned char *)(v10 + 88) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v10 + 72) = self->_revision;
    *(unsigned char *)(v10 + 88) |= 2u;
  }
  uint64_t v14 = objc_msgSend_copyWithZone_(self->_requiredZoneCryptoFeatures, v11, (uint64_t)a3);
  BOOL v15 = (void *)v12[8];
  v12[8] = v14;

  uint64_t v17 = objc_msgSend_copyWithZone_(self->_requiredRecordCryptoFeatures, v16, (uint64_t)a3);
  char v18 = (void *)v12[7];
  v12[7] = v17;

  uint64_t v20 = objc_msgSend_copyWithZone_(self->_requiredFieldCryptoFeatures, v19, (uint64_t)a3);
  uint64_t v21 = (void *)v12[6];
  v12[6] = v20;

  uint64_t v23 = objc_msgSend_copyWithZone_(self->_permittedZoneCryptoFeatures, v22, (uint64_t)a3);
  int v24 = (void *)v12[4];
  v12[4] = v23;

  uint64_t v26 = objc_msgSend_copyWithZone_(self->_permittedRecordCryptoFeatures, v25, (uint64_t)a3);
  uint64_t v27 = (void *)v12[3];
  v12[3] = v26;

  uint64_t v29 = objc_msgSend_copyWithZone_(self->_permittedFieldCryptoFeatures, v28, (uint64_t)a3);
  v30 = (void *)v12[2];
  v12[2] = v29;

  uint64_t v32 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v31, (uint64_t)a3);
  v33 = (void *)v12[10];
  v12[10] = v32;

  uint64_t v35 = objc_msgSend_copyWithZone_(self->_requiredAdopterFeatures, v34, (uint64_t)a3);
  v36 = (void *)v12[5];
  v12[5] = v35;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_28;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[11] & 1) == 0 || self->_minimumSchemaVersion != *((_DWORD *)v4 + 2)) {
      goto LABEL_28;
    }
  }
  else if (v4[11])
  {
LABEL_28:
    char isEqual = 0;
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[11] & 2) == 0 || self->_revision != *((_DWORD *)v4 + 18)) {
      goto LABEL_28;
    }
  }
  else if ((v4[11] & 2) != 0)
  {
    goto LABEL_28;
  }
  requiredZoneCryptoFeatures = self->_requiredZoneCryptoFeatures;
  uint64_t v9 = v4[8];
  if ((unint64_t)requiredZoneCryptoFeatures | v9
    && !objc_msgSend_isEqual_(requiredZoneCryptoFeatures, v7, v9))
  {
    goto LABEL_28;
  }
  requiredRecordCryptoFeatures = self->_requiredRecordCryptoFeatures;
  uint64_t v11 = v4[7];
  if ((unint64_t)requiredRecordCryptoFeatures | v11)
  {
    if (!objc_msgSend_isEqual_(requiredRecordCryptoFeatures, v7, v11)) {
      goto LABEL_28;
    }
  }
  requiredFieldCryptoFeatures = self->_requiredFieldCryptoFeatures;
  uint64_t v13 = v4[6];
  if ((unint64_t)requiredFieldCryptoFeatures | v13)
  {
    if (!objc_msgSend_isEqual_(requiredFieldCryptoFeatures, v7, v13)) {
      goto LABEL_28;
    }
  }
  permittedZoneCryptoFeatures = self->_permittedZoneCryptoFeatures;
  uint64_t v15 = v4[4];
  if ((unint64_t)permittedZoneCryptoFeatures | v15)
  {
    if (!objc_msgSend_isEqual_(permittedZoneCryptoFeatures, v7, v15)) {
      goto LABEL_28;
    }
  }
  permittedRecordCryptoFeatures = self->_permittedRecordCryptoFeatures;
  uint64_t v17 = v4[3];
  if ((unint64_t)permittedRecordCryptoFeatures | v17)
  {
    if (!objc_msgSend_isEqual_(permittedRecordCryptoFeatures, v7, v17)) {
      goto LABEL_28;
    }
  }
  permittedFieldCryptoFeatures = self->_permittedFieldCryptoFeatures;
  uint64_t v19 = v4[2];
  if ((unint64_t)permittedFieldCryptoFeatures | v19)
  {
    if (!objc_msgSend_isEqual_(permittedFieldCryptoFeatures, v7, v19)) {
      goto LABEL_28;
    }
  }
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v21 = v4[10];
  if ((unint64_t)zoneIdentifier | v21)
  {
    if (!objc_msgSend_isEqual_(zoneIdentifier, v7, v21)) {
      goto LABEL_28;
    }
  }
  requiredAdopterFeatures = self->_requiredAdopterFeatures;
  uint64_t v23 = v4[5];
  if ((unint64_t)requiredAdopterFeatures | v23) {
    char isEqual = objc_msgSend_isEqual_(requiredAdopterFeatures, v7, v23);
  }
  else {
    char isEqual = 1;
  }
LABEL_29:

  return isEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_minimumSchemaVersion;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_revision;
LABEL_6:
  uint64_t v6 = v5 ^ v4 ^ objc_msgSend_hash(self->_requiredZoneCryptoFeatures, a2, v2);
  uint64_t v9 = objc_msgSend_hash(self->_requiredRecordCryptoFeatures, v7, v8);
  uint64_t v12 = v6 ^ v9 ^ objc_msgSend_hash(self->_requiredFieldCryptoFeatures, v10, v11);
  uint64_t v15 = objc_msgSend_hash(self->_permittedZoneCryptoFeatures, v13, v14);
  uint64_t v18 = v15 ^ objc_msgSend_hash(self->_permittedRecordCryptoFeatures, v16, v17);
  uint64_t v21 = v12 ^ v18 ^ objc_msgSend_hash(self->_permittedFieldCryptoFeatures, v19, v20);
  uint64_t v24 = objc_msgSend_hash(self->_zoneIdentifier, v22, v23);
  return v21 ^ v24 ^ objc_msgSend_hash(self->_requiredAdopterFeatures, v25, v26);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 88);
  if (v6)
  {
    self->_minimumSchemaVersion = v4[2];
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 88);
  }
  if ((v6 & 2) != 0)
  {
    self->_revision = v4[18];
    *(unsigned char *)&self->_has |= 2u;
  }
  requiredZoneCryptoFeatures = self->_requiredZoneCryptoFeatures;
  uint64_t v8 = *((void *)v5 + 8);
  uint64_t v23 = v5;
  if (requiredZoneCryptoFeatures)
  {
    if (!v8) {
      goto LABEL_11;
    }
    objc_msgSend_mergeFrom_(requiredZoneCryptoFeatures, (const char *)v5, v8);
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    objc_msgSend_setRequiredZoneCryptoFeatures_(self, (const char *)v5, v8);
  }
  uint64_t v5 = v23;
LABEL_11:
  requiredRecordCryptoFeatures = self->_requiredRecordCryptoFeatures;
  uint64_t v10 = *((void *)v5 + 7);
  if (requiredRecordCryptoFeatures)
  {
    if (!v10) {
      goto LABEL_17;
    }
    objc_msgSend_mergeFrom_(requiredRecordCryptoFeatures, (const char *)v5, v10);
  }
  else
  {
    if (!v10) {
      goto LABEL_17;
    }
    objc_msgSend_setRequiredRecordCryptoFeatures_(self, (const char *)v5, v10);
  }
  uint64_t v5 = v23;
LABEL_17:
  requiredFieldCryptoFeatures = self->_requiredFieldCryptoFeatures;
  uint64_t v12 = *((void *)v5 + 6);
  if (requiredFieldCryptoFeatures)
  {
    if (!v12) {
      goto LABEL_23;
    }
    objc_msgSend_mergeFrom_(requiredFieldCryptoFeatures, (const char *)v5, v12);
  }
  else
  {
    if (!v12) {
      goto LABEL_23;
    }
    objc_msgSend_setRequiredFieldCryptoFeatures_(self, (const char *)v5, v12);
  }
  uint64_t v5 = v23;
LABEL_23:
  permittedZoneCryptoFeatures = self->_permittedZoneCryptoFeatures;
  uint64_t v14 = *((void *)v5 + 4);
  if (permittedZoneCryptoFeatures)
  {
    if (!v14) {
      goto LABEL_29;
    }
    objc_msgSend_mergeFrom_(permittedZoneCryptoFeatures, (const char *)v5, v14);
  }
  else
  {
    if (!v14) {
      goto LABEL_29;
    }
    objc_msgSend_setPermittedZoneCryptoFeatures_(self, (const char *)v5, v14);
  }
  uint64_t v5 = v23;
LABEL_29:
  permittedRecordCryptoFeatures = self->_permittedRecordCryptoFeatures;
  uint64_t v16 = *((void *)v5 + 3);
  if (permittedRecordCryptoFeatures)
  {
    if (!v16) {
      goto LABEL_35;
    }
    objc_msgSend_mergeFrom_(permittedRecordCryptoFeatures, (const char *)v5, v16);
  }
  else
  {
    if (!v16) {
      goto LABEL_35;
    }
    objc_msgSend_setPermittedRecordCryptoFeatures_(self, (const char *)v5, v16);
  }
  uint64_t v5 = v23;
LABEL_35:
  permittedFieldCryptoFeatures = self->_permittedFieldCryptoFeatures;
  uint64_t v18 = *((void *)v5 + 2);
  if (permittedFieldCryptoFeatures)
  {
    if (!v18) {
      goto LABEL_41;
    }
    objc_msgSend_mergeFrom_(permittedFieldCryptoFeatures, (const char *)v5, v18);
  }
  else
  {
    if (!v18) {
      goto LABEL_41;
    }
    objc_msgSend_setPermittedFieldCryptoFeatures_(self, (const char *)v5, v18);
  }
  uint64_t v5 = v23;
LABEL_41:
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v20 = *((void *)v5 + 10);
  if (zoneIdentifier)
  {
    if (!v20) {
      goto LABEL_47;
    }
    objc_msgSend_mergeFrom_(zoneIdentifier, (const char *)v5, v20);
  }
  else
  {
    if (!v20) {
      goto LABEL_47;
    }
    objc_msgSend_setZoneIdentifier_(self, (const char *)v5, v20);
  }
  uint64_t v5 = v23;
LABEL_47:
  requiredAdopterFeatures = self->_requiredAdopterFeatures;
  uint64_t v22 = *((void *)v5 + 5);
  if (requiredAdopterFeatures)
  {
    if (v22) {
      objc_msgSend_mergeFrom_(requiredAdopterFeatures, (const char *)v5, v22);
    }
  }
  else if (v22)
  {
    objc_msgSend_setRequiredAdopterFeatures_(self, (const char *)v5, v22);
  }
  MEMORY[0x1F41817F8]();
}

- (int)revision
{
  return self->_revision;
}

- (CKDPZoneCryptoFeatureSet)requiredZoneCryptoFeatures
{
  return self->_requiredZoneCryptoFeatures;
}

- (void)setRequiredZoneCryptoFeatures:(id)a3
{
}

- (CKDPRecordCryptoFeatureSet)requiredRecordCryptoFeatures
{
  return self->_requiredRecordCryptoFeatures;
}

- (void)setRequiredRecordCryptoFeatures:(id)a3
{
}

- (CKDPFieldCryptoFeatureSet)requiredFieldCryptoFeatures
{
  return self->_requiredFieldCryptoFeatures;
}

- (void)setRequiredFieldCryptoFeatures:(id)a3
{
}

- (CKDPZonePermittedCryptoFeatureSet)permittedZoneCryptoFeatures
{
  return self->_permittedZoneCryptoFeatures;
}

- (void)setPermittedZoneCryptoFeatures:(id)a3
{
}

- (CKDPRecordPermittedCryptoFeatureSet)permittedRecordCryptoFeatures
{
  return self->_permittedRecordCryptoFeatures;
}

- (void)setPermittedRecordCryptoFeatures:(id)a3
{
}

- (CKDPFieldPermittedCryptoFeatureSet)permittedFieldCryptoFeatures
{
  return self->_permittedFieldCryptoFeatures;
}

- (void)setPermittedFieldCryptoFeatures:(id)a3
{
}

- (CKDPRecordZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (void)setZoneIdentifier:(id)a3
{
}

- (CKDPAdopterFeatureSet)requiredAdopterFeatures
{
  return self->_requiredAdopterFeatures;
}

- (void)setRequiredAdopterFeatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_requiredZoneCryptoFeatures, 0);
  objc_storeStrong((id *)&self->_requiredRecordCryptoFeatures, 0);
  objc_storeStrong((id *)&self->_requiredFieldCryptoFeatures, 0);
  objc_storeStrong((id *)&self->_requiredAdopterFeatures, 0);
  objc_storeStrong((id *)&self->_permittedZoneCryptoFeatures, 0);
  objc_storeStrong((id *)&self->_permittedRecordCryptoFeatures, 0);
  objc_storeStrong((id *)&self->_permittedFieldCryptoFeatures, 0);
}

@end