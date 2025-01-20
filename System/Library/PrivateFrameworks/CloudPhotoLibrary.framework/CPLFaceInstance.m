@interface CPLFaceInstance
+ (Class)rejectedPersonIdentifiersType;
- (BOOL)_isFaceStateBitSet:(unsigned int)a3;
- (BOOL)hasBodyCenterX;
- (BOOL)hasBodyCenterY;
- (BOOL)hasBodyHeight;
- (BOOL)hasBodyWidth;
- (BOOL)hasCenterX;
- (BOOL)hasCenterY;
- (BOOL)hasDetectionType;
- (BOOL)hasFaceState;
- (BOOL)hasNameSource;
- (BOOL)hasPersonIdentifier;
- (BOOL)hasSize;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKeyFace;
- (BOOL)isManual;
- (BOOL)isNoneState;
- (BOOL)isPetDetectionType;
- (BOOL)isTorsoOnly;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)rejectedPersonIdentifiers;
- (NSString)personIdentifier;
- (double)bodyCenterX;
- (double)bodyCenterY;
- (double)bodyHeight;
- (double)bodyWidth;
- (double)centerX;
- (double)centerY;
- (double)size;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pointerDescription;
- (id)rejectedPersonIdentifiersAtIndex:(unint64_t)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (unint64_t)rejectedPersonIdentifiersCount;
- (unsigned)detectionType;
- (unsigned)faceState;
- (unsigned)nameSource;
- (void)_setFaceStateBit:(unsigned int)a3 fromBoolValue:(BOOL)a4;
- (void)addRejectedPersonIdentifiers:(id)a3;
- (void)clearRejectedPersonIdentifiers;
- (void)clearState;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBodyCenterX:(double)a3;
- (void)setBodyCenterY:(double)a3;
- (void)setBodyHeight:(double)a3;
- (void)setBodyWidth:(double)a3;
- (void)setCenterX:(double)a3;
- (void)setCenterY:(double)a3;
- (void)setDetectionType:(unsigned int)a3;
- (void)setFaceState:(unsigned int)a3;
- (void)setHasBodyCenterX:(BOOL)a3;
- (void)setHasBodyCenterY:(BOOL)a3;
- (void)setHasBodyHeight:(BOOL)a3;
- (void)setHasBodyWidth:(BOOL)a3;
- (void)setHasCenterX:(BOOL)a3;
- (void)setHasCenterY:(BOOL)a3;
- (void)setHasDetectionType:(BOOL)a3;
- (void)setHasFaceState:(BOOL)a3;
- (void)setHasNameSource:(BOOL)a3;
- (void)setHasSize:(BOOL)a3;
- (void)setKeyFace:(BOOL)a3;
- (void)setManual:(BOOL)a3;
- (void)setNameSource:(unsigned int)a3;
- (void)setPersonIdentifier:(id)a3;
- (void)setRejectedPersonIdentifiers:(id)a3;
- (void)setSize:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CPLFaceInstance

- (BOOL)isTorsoOnly
{
  [(CPLFaceInstance *)self centerX];
  if (v3 != 0.0) {
    return 0;
  }
  [(CPLFaceInstance *)self bodyCenterX];
  return v4 != 0.0;
}

- (BOOL)_isFaceStateBitSet:(unsigned int)a3
{
  return (a3 & ~[(CPLFaceInstance *)self faceState]) == 0;
}

- (void)_setFaceStateBit:(unsigned int)a3 fromBoolValue:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v7 = [(CPLFaceInstance *)self faceState];
  if (v4) {
    uint64_t v8 = v7 | a3;
  }
  else {
    uint64_t v8 = v7 & ~a3;
  }
  [(CPLFaceInstance *)self setFaceState:v8];
}

- (BOOL)isManual
{
  return [(CPLFaceInstance *)self _isFaceStateBitSet:2];
}

- (void)setManual:(BOOL)a3
{
}

- (BOOL)isKeyFace
{
  return [(CPLFaceInstance *)self _isFaceStateBitSet:1];
}

- (void)setKeyFace:(BOOL)a3
{
}

- (BOOL)isNoneState
{
  return [(CPLFaceInstance *)self faceState] == 0;
}

- (void)clearState
{
}

- (id)pointerDescription
{
  double v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p>", v5, self];

  return v6;
}

- (int64_t)compare:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      v13 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = (id)objc_opt_class();
        id v14 = v18;
        _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_ERROR, "Unexpected class type: %@", buf, 0xCu);
      }
    }
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFaceAnalysisReference.m"];
    [v15 handleFailureInMethod:a2, self, v16, 31, @"Unexpected class type: %@", objc_opt_class() object file lineNumber description];

    abort();
  }
  if (![(CPLFaceInstance *)self isEqual:v5])
  {
    personIdentifier = self->_personIdentifier;
    if (!personIdentifier)
    {
      v10 = [v5 personIdentifier];

      if (!v10)
      {
        uint64_t v8 = [NSNumber numberWithDouble:self->_size];
        v11 = NSNumber;
        [v5 size];
        v12 = objc_msgSend(v11, "numberWithDouble:");
        int64_t v6 = [v8 compare:v12];

        goto LABEL_6;
      }
      personIdentifier = self->_personIdentifier;
      if (!personIdentifier)
      {
        int64_t v6 = -1;
        goto LABEL_7;
      }
    }
    uint64_t v8 = [v5 personIdentifier];
    int64_t v6 = [(NSString *)personIdentifier compare:v8];
LABEL_6:

    goto LABEL_7;
  }
  int64_t v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isPetDetectionType
{
  return [(CPLFaceInstance *)self detectionType] > 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rejectedPersonIdentifiers, 0);
  objc_storeStrong((id *)&self->_personIdentifier, 0);
}

- (double)bodyHeight
{
  return self->_bodyHeight;
}

- (double)bodyWidth
{
  return self->_bodyWidth;
}

- (double)bodyCenterY
{
  return self->_bodyCenterY;
}

- (double)bodyCenterX
{
  return self->_bodyCenterX;
}

- (unsigned)detectionType
{
  return self->_detectionType;
}

- (unsigned)nameSource
{
  return self->_nameSource;
}

- (void)setRejectedPersonIdentifiers:(id)a3
{
}

- (NSMutableArray)rejectedPersonIdentifiers
{
  return self->_rejectedPersonIdentifiers;
}

- (unsigned)faceState
{
  return self->_faceState;
}

- (double)size
{
  return self->_size;
}

- (double)centerY
{
  return self->_centerY;
}

- (double)centerX
{
  return self->_centerX;
}

- (void)setPersonIdentifier:(id)a3
{
}

- (NSString)personIdentifier
{
  return self->_personIdentifier;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 10)) {
    -[CPLFaceInstance setPersonIdentifier:](self, "setPersonIdentifier:");
  }
  __int16 v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x10) != 0)
  {
    self->_centerX = *((double *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v5 = *((_WORD *)v4 + 48);
    if ((v5 & 0x20) == 0)
    {
LABEL_5:
      if ((v5 & 0x40) == 0) {
        goto LABEL_6;
      }
      goto LABEL_25;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_5;
  }
  self->_centerY = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_25:
  self->_size = *((double *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 48) & 0x100) != 0)
  {
LABEL_7:
    self->_faceState = *((_DWORD *)v4 + 17);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_8:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *((id *)v4 + 11);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        -[CPLFaceInstance addRejectedPersonIdentifiers:](self, "addRejectedPersonIdentifiers:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  __int16 v11 = *((_WORD *)v4 + 48);
  if ((v11 & 0x200) != 0)
  {
    self->_nameSource = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v11 = *((_WORD *)v4 + 48);
    if ((v11 & 0x80) == 0)
    {
LABEL_17:
      if ((v11 & 1) == 0) {
        goto LABEL_18;
      }
      goto LABEL_29;
    }
  }
  else if ((v11 & 0x80) == 0)
  {
    goto LABEL_17;
  }
  self->_detectionType = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v11 = *((_WORD *)v4 + 48);
  if ((v11 & 1) == 0)
  {
LABEL_18:
    if ((v11 & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_bodyCenterX = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v11 = *((_WORD *)v4 + 48);
  if ((v11 & 2) == 0)
  {
LABEL_19:
    if ((v11 & 8) == 0) {
      goto LABEL_20;
    }
LABEL_31:
    self->_bodyWidth = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
    if ((*((_WORD *)v4 + 48) & 4) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_30:
  self->_bodyCenterY = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v11 = *((_WORD *)v4 + 48);
  if ((v11 & 8) != 0) {
    goto LABEL_31;
  }
LABEL_20:
  if ((v11 & 4) != 0)
  {
LABEL_21:
    self->_bodyHeight = *((double *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_22:
}

- (unint64_t)hash
{
  NSUInteger v46 = [(NSString *)self->_personIdentifier hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    double centerX = self->_centerX;
    double v6 = -centerX;
    if (centerX >= 0.0) {
      double v6 = self->_centerX;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 0x20) != 0)
  {
    double centerY = self->_centerY;
    double v11 = -centerY;
    if (centerY >= 0.0) {
      double v11 = self->_centerY;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 0x40) != 0)
  {
    double size = self->_size;
    double v16 = -size;
    if (size >= 0.0) {
      double v16 = self->_size;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((has & 0x100) != 0) {
    uint64_t v45 = 2654435761 * self->_faceState;
  }
  else {
    uint64_t v45 = 0;
  }
  uint64_t v44 = [(NSMutableArray *)self->_rejectedPersonIdentifiers hash];
  __int16 v19 = (__int16)self->_has;
  if ((v19 & 0x200) != 0)
  {
    uint64_t v43 = 2654435761 * self->_nameSource;
    if ((v19 & 0x80) != 0) {
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v43 = 0;
    if ((v19 & 0x80) != 0)
    {
LABEL_30:
      uint64_t v20 = 2654435761 * self->_detectionType;
      goto LABEL_33;
    }
  }
  uint64_t v20 = 0;
LABEL_33:
  unint64_t v21 = v4;
  if (v19)
  {
    double bodyCenterX = self->_bodyCenterX;
    double v24 = -bodyCenterX;
    if (bodyCenterX >= 0.0) {
      double v24 = self->_bodyCenterX;
    }
    long double v25 = floor(v24 + 0.5);
    double v26 = (v24 - v25) * 1.84467441e19;
    unint64_t v22 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0) {
        v22 += (unint64_t)v26;
      }
    }
    else
    {
      v22 -= (unint64_t)fabs(v26);
    }
  }
  else
  {
    unint64_t v22 = 0;
  }
  if ((v19 & 2) != 0)
  {
    double bodyCenterY = self->_bodyCenterY;
    double v29 = -bodyCenterY;
    if (bodyCenterY >= 0.0) {
      double v29 = self->_bodyCenterY;
    }
    long double v30 = floor(v29 + 0.5);
    double v31 = (v29 - v30) * 1.84467441e19;
    unint64_t v27 = 2654435761u * (unint64_t)fmod(v30, 1.84467441e19);
    if (v31 >= 0.0)
    {
      if (v31 > 0.0) {
        v27 += (unint64_t)v31;
      }
    }
    else
    {
      v27 -= (unint64_t)fabs(v31);
    }
  }
  else
  {
    unint64_t v27 = 0;
  }
  if ((v19 & 8) != 0)
  {
    double bodyWidth = self->_bodyWidth;
    double v34 = -bodyWidth;
    if (bodyWidth >= 0.0) {
      double v34 = self->_bodyWidth;
    }
    long double v35 = floor(v34 + 0.5);
    double v36 = (v34 - v35) * 1.84467441e19;
    unint64_t v32 = 2654435761u * (unint64_t)fmod(v35, 1.84467441e19);
    if (v36 >= 0.0)
    {
      if (v36 > 0.0) {
        v32 += (unint64_t)v36;
      }
    }
    else
    {
      v32 -= (unint64_t)fabs(v36);
    }
  }
  else
  {
    unint64_t v32 = 0;
  }
  if ((v19 & 4) != 0)
  {
    double bodyHeight = self->_bodyHeight;
    double v39 = -bodyHeight;
    if (bodyHeight >= 0.0) {
      double v39 = self->_bodyHeight;
    }
    long double v40 = floor(v39 + 0.5);
    double v41 = (v39 - v40) * 1.84467441e19;
    unint64_t v37 = 2654435761u * (unint64_t)fmod(v40, 1.84467441e19);
    if (v41 >= 0.0)
    {
      if (v41 > 0.0) {
        v37 += (unint64_t)v41;
      }
    }
    else
    {
      v37 -= (unint64_t)fabs(v41);
    }
  }
  else
  {
    unint64_t v37 = 0;
  }
  return v21 ^ v46 ^ v9 ^ v14 ^ v45 ^ v44 ^ v43 ^ v20 ^ v22 ^ v27 ^ v32 ^ v37;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_57;
  }
  personIdentifier = self->_personIdentifier;
  if ((unint64_t)personIdentifier | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](personIdentifier, "isEqual:")) {
      goto LABEL_57;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 48);
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_centerX != *((double *)v4 + 5)) {
      goto LABEL_57;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_centerY != *((double *)v4 + 6)) {
      goto LABEL_57;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_size != *((double *)v4 + 7)) {
      goto LABEL_57;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 48) & 0x100) == 0 || self->_faceState != *((_DWORD *)v4 + 17)) {
      goto LABEL_57;
    }
  }
  else if ((*((_WORD *)v4 + 48) & 0x100) != 0)
  {
    goto LABEL_57;
  }
  rejectedPersonIdentifiers = self->_rejectedPersonIdentifiers;
  if ((unint64_t)rejectedPersonIdentifiers | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](rejectedPersonIdentifiers, "isEqual:"))
    {
LABEL_57:
      BOOL v9 = 0;
      goto LABEL_58;
    }
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)v4 + 48);
  }
  if ((has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_nameSource != *((_DWORD *)v4 + 18)) {
      goto LABEL_57;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_detectionType != *((_DWORD *)v4 + 16)) {
      goto LABEL_57;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_57;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_bodyCenterX != *((double *)v4 + 1)) {
      goto LABEL_57;
    }
  }
  else if (v7)
  {
    goto LABEL_57;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_bodyCenterY != *((double *)v4 + 2)) {
      goto LABEL_57;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_bodyWidth != *((double *)v4 + 4)) {
      goto LABEL_57;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_bodyHeight != *((double *)v4 + 3)) {
      goto LABEL_57;
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = (v7 & 4) == 0;
  }
LABEL_58:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_personIdentifier copyWithZone:a3];
  __int16 v7 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v6;

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(double *)(v5 + 40) = self->_centerX;
    *(_WORD *)(v5 + 96) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 48) = self->_centerY;
  *(_WORD *)(v5 + 96) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_23:
  *(double *)(v5 + 56) = self->_size;
  *(_WORD *)(v5 + 96) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 68) = self->_faceState;
    *(_WORD *)(v5 + 96) |= 0x100u;
  }
LABEL_6:
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v9 = self->_rejectedPersonIdentifiers;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (void)v17);
        [(id)v5 addRejectedPersonIdentifiers:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_nameSource;
    *(_WORD *)(v5 + 96) |= 0x200u;
    __int16 v15 = (__int16)self->_has;
    if ((v15 & 0x80) == 0)
    {
LABEL_15:
      if ((v15 & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_27;
    }
  }
  else if ((v15 & 0x80) == 0)
  {
    goto LABEL_15;
  }
  *(_DWORD *)(v5 + 64) = self->_detectionType;
  *(_WORD *)(v5 + 96) |= 0x80u;
  __int16 v15 = (__int16)self->_has;
  if ((v15 & 1) == 0)
  {
LABEL_16:
    if ((v15 & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(double *)(v5 + 8) = self->_bodyCenterX;
  *(_WORD *)(v5 + 96) |= 1u;
  __int16 v15 = (__int16)self->_has;
  if ((v15 & 2) == 0)
  {
LABEL_17:
    if ((v15 & 8) == 0) {
      goto LABEL_18;
    }
LABEL_29:
    *(double *)(v5 + 32) = self->_bodyWidth;
    *(_WORD *)(v5 + 96) |= 8u;
    if ((*(_WORD *)&self->_has & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_19;
  }
LABEL_28:
  *(double *)(v5 + 16) = self->_bodyCenterY;
  *(_WORD *)(v5 + 96) |= 2u;
  __int16 v15 = (__int16)self->_has;
  if ((v15 & 8) != 0) {
    goto LABEL_29;
  }
LABEL_18:
  if ((v15 & 4) != 0)
  {
LABEL_19:
    *(double *)(v5 + 24) = self->_bodyHeight;
    *(_WORD *)(v5 + 96) |= 4u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  if (self->_personIdentifier)
  {
    objc_msgSend(v4, "setPersonIdentifier:");
    id v4 = v11;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((void *)v4 + 5) = *(void *)&self->_centerX;
    *((_WORD *)v4 + 48) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 0x40) == 0) {
        goto LABEL_6;
      }
LABEL_24:
      *((void *)v4 + 7) = *(void *)&self->_size;
      *((_WORD *)v4 + 48) |= 0x40u;
      if ((*(_WORD *)&self->_has & 0x100) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 6) = *(void *)&self->_centerY;
  *((_WORD *)v4 + 48) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_24;
  }
LABEL_6:
  if ((has & 0x100) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 17) = self->_faceState;
    *((_WORD *)v4 + 48) |= 0x100u;
  }
LABEL_8:
  if ([(CPLFaceInstance *)self rejectedPersonIdentifiersCount])
  {
    [v11 clearRejectedPersonIdentifiers];
    unint64_t v6 = [(CPLFaceInstance *)self rejectedPersonIdentifiersCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        BOOL v9 = [(CPLFaceInstance *)self rejectedPersonIdentifiersAtIndex:i];
        [v11 addRejectedPersonIdentifiers:v9];
      }
    }
  }
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x200) != 0)
  {
    *((_DWORD *)v11 + 18) = self->_nameSource;
    *((_WORD *)v11 + 48) |= 0x200u;
    __int16 v10 = (__int16)self->_has;
    if ((v10 & 0x80) == 0)
    {
LABEL_14:
      if ((v10 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_28;
    }
  }
  else if ((v10 & 0x80) == 0)
  {
    goto LABEL_14;
  }
  *((_DWORD *)v11 + 16) = self->_detectionType;
  *((_WORD *)v11 + 48) |= 0x80u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 1) == 0)
  {
LABEL_15:
    if ((v10 & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)v11 + 1) = *(void *)&self->_bodyCenterX;
  *((_WORD *)v11 + 48) |= 1u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 2) == 0)
  {
LABEL_16:
    if ((v10 & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)v11 + 2) = *(void *)&self->_bodyCenterY;
  *((_WORD *)v11 + 48) |= 2u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 8) == 0)
  {
LABEL_17:
    if ((v10 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_30:
  *((void *)v11 + 4) = *(void *)&self->_bodyWidth;
  *((_WORD *)v11 + 48) |= 8u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_18:
    *((void *)v11 + 3) = *(void *)&self->_bodyHeight;
    *((_WORD *)v11 + 48) |= 4u;
  }
LABEL_19:
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_personIdentifier) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 0x40) == 0) {
        goto LABEL_6;
      }
      goto LABEL_25;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_7:
  }
    PBDataWriterWriteUint32Field();
LABEL_8:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v6 = self->_rejectedPersonIdentifiers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v11 = (__int16)self->_has;
    if ((v11 & 0x80) == 0)
    {
LABEL_17:
      if ((v11 & 1) == 0) {
        goto LABEL_18;
      }
      goto LABEL_29;
    }
  }
  else if ((v11 & 0x80) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteUint32Field();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 1) == 0)
  {
LABEL_18:
    if ((v11 & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteDoubleField();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 2) == 0)
  {
LABEL_19:
    if ((v11 & 8) == 0) {
      goto LABEL_20;
    }
LABEL_31:
    PBDataWriterWriteDoubleField();
    if ((*(_WORD *)&self->_has & 4) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_30:
  PBDataWriterWriteDoubleField();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 8) != 0) {
    goto LABEL_31;
  }
LABEL_20:
  if ((v11 & 4) != 0) {
LABEL_21:
  }
    PBDataWriterWriteDoubleField();
LABEL_22:
}

- (BOOL)readFrom:(id)a3
{
  return CPLFaceInstanceReadFrom((char *)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  double v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  personIdentifier = self->_personIdentifier;
  if (personIdentifier) {
    [v3 setObject:personIdentifier forKey:@"personIdentifier"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    long long v12 = [NSNumber numberWithDouble:self->_centerX];
    [v4 setObject:v12 forKey:@"centerX"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 0x40) == 0) {
        goto LABEL_6;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  long long v13 = [NSNumber numberWithDouble:self->_centerY];
  [v4 setObject:v13 forKey:@"centerY"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_22:
  long long v14 = [NSNumber numberWithDouble:self->_size];
  [v4 setObject:v14 forKey:@"size"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    uint64_t v7 = [NSNumber numberWithUnsignedInt:self->_faceState];
    [v4 setObject:v7 forKey:@"faceState"];
  }
LABEL_8:
  rejectedPersonIdentifiers = self->_rejectedPersonIdentifiers;
  if (rejectedPersonIdentifiers) {
    [v4 setObject:rejectedPersonIdentifiers forKey:@"rejectedPersonIdentifiers"];
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x200) != 0)
  {
    long long v15 = [NSNumber numberWithUnsignedInt:self->_nameSource];
    [v4 setObject:v15 forKey:@"nameSource"];

    __int16 v9 = (__int16)self->_has;
    if ((v9 & 0x80) == 0)
    {
LABEL_12:
      if ((v9 & 1) == 0) {
        goto LABEL_13;
      }
      goto LABEL_26;
    }
  }
  else if ((v9 & 0x80) == 0)
  {
    goto LABEL_12;
  }
  double v16 = [NSNumber numberWithUnsignedInt:self->_detectionType];
  [v4 setObject:v16 forKey:@"detectionType"];

  __int16 v9 = (__int16)self->_has;
  if ((v9 & 1) == 0)
  {
LABEL_13:
    if ((v9 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v17 = [NSNumber numberWithDouble:self->_bodyCenterX];
  [v4 setObject:v17 forKey:@"bodyCenterX"];

  __int16 v9 = (__int16)self->_has;
  if ((v9 & 2) == 0)
  {
LABEL_14:
    if ((v9 & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_28;
  }
LABEL_27:
  long long v18 = [NSNumber numberWithDouble:self->_bodyCenterY];
  [v4 setObject:v18 forKey:@"bodyCenterY"];

  __int16 v9 = (__int16)self->_has;
  if ((v9 & 8) == 0)
  {
LABEL_15:
    if ((v9 & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_28:
  long long v19 = [NSNumber numberWithDouble:self->_bodyWidth];
  [v4 setObject:v19 forKey:@"bodyWidth"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_16:
    __int16 v10 = [NSNumber numberWithDouble:self->_bodyHeight];
    [v4 setObject:v10 forKey:@"bodyHeight"];
  }
LABEL_17:
  return v4;
}

- (id)description
{
  double v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CPLFaceInstance;
  id v4 = [(CPLFaceInstance *)&v8 description];
  uint64_t v5 = [(CPLFaceInstance *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasBodyHeight
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasBodyHeight:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setBodyHeight:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_double bodyHeight = a3;
}

- (BOOL)hasBodyWidth
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasBodyWidth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setBodyWidth:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_double bodyWidth = a3;
}

- (BOOL)hasBodyCenterY
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasBodyCenterY:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setBodyCenterY:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_double bodyCenterY = a3;
}

- (BOOL)hasBodyCenterX
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasBodyCenterX:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setBodyCenterX:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_double bodyCenterX = a3;
}

- (BOOL)hasDetectionType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasDetectionType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setDetectionType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_detectionType = a3;
}

- (BOOL)hasNameSource
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasNameSource:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)setNameSource:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_nameSource = a3;
}

- (id)rejectedPersonIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rejectedPersonIdentifiers objectAtIndex:a3];
}

- (unint64_t)rejectedPersonIdentifiersCount
{
  return [(NSMutableArray *)self->_rejectedPersonIdentifiers count];
}

- (void)addRejectedPersonIdentifiers:(id)a3
{
  id v4 = a3;
  rejectedPersonIdentifiers = self->_rejectedPersonIdentifiers;
  id v8 = v4;
  if (!rejectedPersonIdentifiers)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_rejectedPersonIdentifiers;
    self->_rejectedPersonIdentifiers = v6;

    id v4 = v8;
    rejectedPersonIdentifiers = self->_rejectedPersonIdentifiers;
  }
  [(NSMutableArray *)rejectedPersonIdentifiers addObject:v4];
}

- (void)clearRejectedPersonIdentifiers
{
}

- (BOOL)hasFaceState
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasFaceState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setFaceState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_faceState = a3;
}

- (BOOL)hasSize
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasSize:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setSize:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_double size = a3;
}

- (BOOL)hasCenterY
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasCenterY:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)setCenterY:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_double centerY = a3;
}

- (BOOL)hasCenterX
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasCenterX:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)setCenterX:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_double centerX = a3;
}

- (BOOL)hasPersonIdentifier
{
  return self->_personIdentifier != 0;
}

+ (Class)rejectedPersonIdentifiersType
{
  return (Class)objc_opt_class();
}

@end