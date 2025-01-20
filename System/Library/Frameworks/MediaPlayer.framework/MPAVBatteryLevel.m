@interface MPAVBatteryLevel
- (BOOL)isEqual:(id)a3;
- (MPAVBatteryLevel)initWithOutputDevice:(void *)a3;
- (MPAVBatteryLevel)initWithRouteDescription:(id)a3;
- (NSNumber)casePercentage;
- (NSNumber)leftPercentage;
- (NSNumber)rightPercentage;
- (NSNumber)singlePercentage;
- (id)description;
@end

@implementation MPAVBatteryLevel

- (MPAVBatteryLevel)initWithOutputDevice:(void *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MPAVBatteryLevel;
  v4 = [(MPAVBatteryLevel *)&v15 init];
  if (v4)
  {
    v5 = (void *)MRAVOutputDeviceCopyModelSpecificInformation();
    uint64_t v6 = MPAVGetBatteryLevelFromAVODDS((uint64_t)a3, v5, 0);
    leftPercentage = v4->_leftPercentage;
    v4->_leftPercentage = (NSNumber *)v6;

    uint64_t v8 = MPAVGetBatteryLevelFromAVODDS((uint64_t)a3, v5, 1);
    rightPercentage = v4->_rightPercentage;
    v4->_rightPercentage = (NSNumber *)v8;

    uint64_t v10 = MPAVGetBatteryLevelFromAVODDS((uint64_t)a3, v5, 2);
    casePercentage = v4->_casePercentage;
    v4->_casePercentage = (NSNumber *)v10;

    uint64_t v12 = MPAVGetBatteryLevelFromAVODDS((uint64_t)a3, v5, 3);
    singlePercentage = v4->_singlePercentage;
    v4->_singlePercentage = (NSNumber *)v12;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_casePercentage, 0);
  objc_storeStrong((id *)&self->_singlePercentage, 0);
  objc_storeStrong((id *)&self->_rightPercentage, 0);

  objc_storeStrong((id *)&self->_leftPercentage, 0);
}

- (NSNumber)casePercentage
{
  return self->_casePercentage;
}

- (NSNumber)singlePercentage
{
  return self->_singlePercentage;
}

- (NSNumber)rightPercentage
{
  return self->_rightPercentage;
}

- (NSNumber)leftPercentage
{
  return self->_leftPercentage;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    leftPercentage = self->_leftPercentage;
    uint64_t v8 = [v6 leftPercentage];
    if (leftPercentage != v8)
    {
      v9 = self->_leftPercentage;
      v3 = [v6 leftPercentage];
      if (![(NSNumber *)v9 isEqual:v3])
      {
        char v10 = 0;
        goto LABEL_23;
      }
    }
    rightPercentage = self->_rightPercentage;
    uint64_t v12 = [v6 rightPercentage];
    if (rightPercentage != v12)
    {
      v13 = self->_rightPercentage;
      v14 = [v6 rightPercentage];
      if (![(NSNumber *)v13 isEqual:v14])
      {
        char v10 = 0;
LABEL_21:

LABEL_22:
        if (leftPercentage == v8)
        {
LABEL_24:

          goto LABEL_25;
        }
LABEL_23:

        goto LABEL_24;
      }
      v29 = v14;
    }
    casePercentage = self->_casePercentage;
    v16 = [v6 casePercentage];
    v30 = rightPercentage;
    if (casePercentage == v16)
    {
      v26 = v3;
    }
    else
    {
      v17 = self->_casePercentage;
      v28 = [v6 casePercentage];
      if (!-[NSNumber isEqual:](v17, "isEqual:"))
      {
        char v10 = 0;
        v14 = v29;
        v23 = v30;
        goto LABEL_19;
      }
      v26 = v3;
    }
    singlePercentage = self->_singlePercentage;
    uint64_t v19 = objc_msgSend(v6, "singlePercentage", v26);
    if (singlePercentage == (NSNumber *)v19)
    {

      char v10 = 1;
    }
    else
    {
      v20 = (void *)v19;
      v21 = self->_singlePercentage;
      v22 = [v6 singlePercentage];
      char v10 = [(NSNumber *)v21 isEqual:v22];
    }
    BOOL v24 = casePercentage == v16;
    v3 = v27;
    v14 = v29;
    v23 = v30;
    if (v24)
    {
LABEL_20:

      if (v23 == v12) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
LABEL_19:

    goto LABEL_20;
  }
  char v10 = 0;
LABEL_25:

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  v4 = v3;
  leftPercentage = self->_leftPercentage;
  BOOL v6 = leftPercentage != 0;
  if (leftPercentage) {
    [v3 appendFormat:@" left=%@", self->_leftPercentage];
  }
  if (self->_rightPercentage)
  {
    [v4 appendFormat:@" right=%@", self->_rightPercentage];
    BOOL v6 = 1;
  }
  if (self->_casePercentage)
  {
    [v4 appendFormat:@" case=%@", self->_casePercentage];
    singlePercentage = self->_singlePercentage;
    if (!singlePercentage) {
      goto LABEL_10;
    }
LABEL_9:
    [v4 appendFormat:@" single=%@", singlePercentage];
    goto LABEL_10;
  }
  singlePercentage = self->_singlePercentage;
  if (singlePercentage) {
    goto LABEL_9;
  }
  if (!v6) {
    [v4 appendString:@" none"];
  }
LABEL_10:
  [v4 appendString:@">"];

  return v4;
}

- (MPAVBatteryLevel)initWithRouteDescription:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MPAVBatteryLevel;
  id v5 = [(MPAVBatteryLevel *)&v15 init];
  if (v5)
  {
    uint64_t v6 = MPAVGetBatteryLevelFromRouteDescription(v4, 0);
    leftPercentage = v5->_leftPercentage;
    v5->_leftPercentage = (NSNumber *)v6;

    uint64_t v8 = MPAVGetBatteryLevelFromRouteDescription(v4, 1);
    rightPercentage = v5->_rightPercentage;
    v5->_rightPercentage = (NSNumber *)v8;

    uint64_t v10 = MPAVGetBatteryLevelFromRouteDescription(v4, 2);
    casePercentage = v5->_casePercentage;
    v5->_casePercentage = (NSNumber *)v10;

    uint64_t v12 = MPAVGetBatteryLevelFromRouteDescription(v4, 3);
    singlePercentage = v5->_singlePercentage;
    v5->_singlePercentage = (NSNumber *)v12;
  }
  return v5;
}

@end