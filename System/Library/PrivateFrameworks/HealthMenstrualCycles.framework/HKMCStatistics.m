@interface HKMCStatistics
+ (BOOL)supportsSecureCoding;
+ (id)_emptyStatistics;
- (BOOL)isEqual:(id)a3;
- (HKMCStatistics)initWithCoder:(id)a3;
- (HKMCStatistics)initWithNumberOfCycles:(int64_t)a3 firstMenstruationStartDayIndex:(id)a4 lastMenstruationStartDayIndex:(id)a5 cycleLengthMedian:(id)a6 cycleLengthLowerPercentile:(id)a7 cycleLengthUpperPercentile:(id)a8 menstruationLengthMedian:(id)a9 menstruationLengthLowerPercentile:(id)a10 menstruationLengthUpperPercentile:(id)a11;
- (NSNumber)cycleLengthLowerPercentile;
- (NSNumber)cycleLengthMedian;
- (NSNumber)cycleLengthUpperPercentile;
- (NSNumber)firstMenstruationStartDayIndex;
- (NSNumber)lastMenstruationStartDayIndex;
- (NSNumber)menstruationLengthLowerPercentile;
- (NSNumber)menstruationLengthMedian;
- (NSNumber)menstruationLengthUpperPercentile;
- (NSString)hk_redactedDescription;
- (id)description;
- (int64_t)numberOfCycles;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCycleLengthMedian:(id)a3;
- (void)setMenstruationLengthMedian:(id)a3;
@end

@implementation HKMCStatistics

- (HKMCStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HKMCStatistics;
  v5 = [(HKMCStatistics *)&v23 init];
  if (v5)
  {
    v5->_numberOfCycles = [v4 decodeIntegerForKey:@"NumberOfCycles"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FirstMenstruationStartDayIndex"];
    firstMenstruationStartDayIndex = v5->_firstMenstruationStartDayIndex;
    v5->_firstMenstruationStartDayIndex = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastMenstruationStartDayIndex"];
    lastMenstruationStartDayIndex = v5->_lastMenstruationStartDayIndex;
    v5->_lastMenstruationStartDayIndex = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CycleLengthMedian"];
    cycleLengthMedian = v5->_cycleLengthMedian;
    v5->_cycleLengthMedian = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CycleLengthLowerPercentile"];
    cycleLengthLowerPercentile = v5->_cycleLengthLowerPercentile;
    v5->_cycleLengthLowerPercentile = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CycleLengthUpperPercentile"];
    cycleLengthUpperPercentile = v5->_cycleLengthUpperPercentile;
    v5->_cycleLengthUpperPercentile = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MenstruationLengthMedian"];
    menstruationLengthMedian = v5->_menstruationLengthMedian;
    v5->_menstruationLengthMedian = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MenstruationLengthLowerPercentile"];
    menstruationLengthLowerPercentile = v5->_menstruationLengthLowerPercentile;
    v5->_menstruationLengthLowerPercentile = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MenstruationLengthUpperPercentile"];
    menstruationLengthUpperPercentile = v5->_menstruationLengthUpperPercentile;
    v5->_menstruationLengthUpperPercentile = (NSNumber *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t numberOfCycles = self->_numberOfCycles;
  id v5 = a3;
  [v5 encodeInteger:numberOfCycles forKey:@"NumberOfCycles"];
  [v5 encodeObject:self->_firstMenstruationStartDayIndex forKey:@"FirstMenstruationStartDayIndex"];
  [v5 encodeObject:self->_lastMenstruationStartDayIndex forKey:@"LastMenstruationStartDayIndex"];
  [v5 encodeObject:self->_cycleLengthMedian forKey:@"CycleLengthMedian"];
  [v5 encodeObject:self->_cycleLengthLowerPercentile forKey:@"CycleLengthLowerPercentile"];
  [v5 encodeObject:self->_cycleLengthUpperPercentile forKey:@"CycleLengthUpperPercentile"];
  [v5 encodeObject:self->_menstruationLengthMedian forKey:@"MenstruationLengthMedian"];
  [v5 encodeObject:self->_menstruationLengthLowerPercentile forKey:@"MenstruationLengthLowerPercentile"];
  [v5 encodeObject:self->_menstruationLengthUpperPercentile forKey:@"MenstruationLengthUpperPercentile"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMCStatistics)initWithNumberOfCycles:(int64_t)a3 firstMenstruationStartDayIndex:(id)a4 lastMenstruationStartDayIndex:(id)a5 cycleLengthMedian:(id)a6 cycleLengthLowerPercentile:(id)a7 cycleLengthUpperPercentile:(id)a8 menstruationLengthMedian:(id)a9 menstruationLengthLowerPercentile:(id)a10 menstruationLengthUpperPercentile:(id)a11
{
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v22 = a10;
  id v17 = a11;
  v29.receiver = self;
  v29.super_class = (Class)HKMCStatistics;
  uint64_t v18 = [(HKMCStatistics *)&v29 init];
  v19 = v18;
  if (v18)
  {
    v18->_int64_t numberOfCycles = a3;
    objc_storeStrong((id *)&v18->_firstMenstruationStartDayIndex, a4);
    objc_storeStrong((id *)&v19->_lastMenstruationStartDayIndex, a5);
    objc_storeStrong((id *)&v19->_cycleLengthMedian, a6);
    objc_storeStrong((id *)&v19->_cycleLengthLowerPercentile, a7);
    objc_storeStrong((id *)&v19->_cycleLengthUpperPercentile, a8);
    objc_storeStrong((id *)&v19->_menstruationLengthMedian, a9);
    objc_storeStrong((id *)&v19->_menstruationLengthLowerPercentile, a10);
    objc_storeStrong((id *)&v19->_menstruationLengthUpperPercentile, a11);
  }

  return v19;
}

+ (id)_emptyStatistics
{
  v2 = (void *)[objc_alloc((Class)a1) initWithNumberOfCycles:0 firstMenstruationStartDayIndex:0 lastMenstruationStartDayIndex:0 cycleLengthMedian:0 cycleLengthLowerPercentile:0 cycleLengthUpperPercentile:0 menstruationLengthMedian:0 menstruationLengthLowerPercentile:0 menstruationLengthUpperPercentile:0];
  return v2;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [NSNumber numberWithInteger:self->_numberOfCycles];
  uint64_t v6 = [v3 stringWithFormat:@"<%@:%p %@ cycles, firstMenstruationStart: %@, lastMenstruationStart: %@, cycleLength: %@ (%@ - %@) menstruationLength: %@ (%@ - %@)>", v4, self, v5, self->_firstMenstruationStartDayIndex, self->_lastMenstruationStartDayIndex, self->_cycleLengthMedian, self->_cycleLengthLowerPercentile, self->_cycleLengthUpperPercentile, self->_menstruationLengthMedian, self->_menstruationLengthLowerPercentile, self->_menstruationLengthUpperPercentile];

  return v6;
}

- (NSString)hk_redactedDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [NSNumber numberWithInteger:self->_numberOfCycles];
  uint64_t v6 = [v3 stringWithFormat:@"<%@:%p %@ cycles>", v4, self, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (HKMCStatistics *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v6 = [(HKMCStatistics *)self numberOfCycles];
      if (v6 == [(HKMCStatistics *)v5 numberOfCycles])
      {
        v7 = [(HKMCStatistics *)self firstMenstruationStartDayIndex];
        uint64_t v8 = [(HKMCStatistics *)v5 firstMenstruationStartDayIndex];
        BOOL v88 = v7 != (void *)v8;
        if (v7 != (void *)v8)
        {
          v90 = [(HKMCStatistics *)v5 firstMenstruationStartDayIndex];
          if (!v90)
          {
            char v11 = 0;

            goto LABEL_95;
          }
          v9 = [(HKMCStatistics *)self firstMenstruationStartDayIndex];
          uint64_t v10 = [(HKMCStatistics *)v5 firstMenstruationStartDayIndex];
          if (![v9 isEqual:v10])
          {
            char v11 = 0;
LABEL_55:

LABEL_94:
            goto LABEL_95;
          }
          v84 = v10;
          v85 = v9;
        }
        uint64_t v12 = [(HKMCStatistics *)self lastMenstruationStartDayIndex];
        v13 = [(HKMCStatistics *)v5 lastMenstruationStartDayIndex];
        if (v12 != v13)
        {
          uint64_t v14 = [(HKMCStatistics *)v5 lastMenstruationStartDayIndex];
          if (!v14)
          {

            char v11 = 0;
            if (v7 == (void *)v8)
            {
              BOOL v88 = 0;
              goto LABEL_93;
            }
            BOOL v88 = 1;
LABEL_92:

LABEL_93:
            if (v88) {
              goto LABEL_94;
            }
            goto LABEL_95;
          }
          v3 = (void *)v14;
          v15 = [(HKMCStatistics *)self lastMenstruationStartDayIndex];
          v82 = [(HKMCStatistics *)v5 lastMenstruationStartDayIndex];
          v83 = v15;
          if (!objc_msgSend(v15, "isEqual:"))
          {
            char v11 = 0;
            goto LABEL_54;
          }
        }
        uint64_t v16 = [(HKMCStatistics *)self cycleLengthMedian];
        [(HKMCStatistics *)v5 cycleLengthMedian];
        v87 = v86 = (void *)v16;
        BOOL v52 = v16 == (void)v87;
        BOOL v17 = v16 != (void)v87;
        if (v52)
        {
          BOOL v79 = v17;
        }
        else
        {
          uint64_t v18 = [(HKMCStatistics *)v5 cycleLengthMedian];
          if (!v18)
          {

            char v11 = 0;
            if (v12 != v13)
            {
              LOBYTE(v24) = 1;
              goto LABEL_89;
            }
            BOOL v24 = 0;
LABEL_98:
            if (!v24) {
              goto LABEL_91;
            }
LABEL_90:

            goto LABEL_91;
          }
          BOOL v79 = v17;
          v76 = (void *)v18;
          v19 = [(HKMCStatistics *)self cycleLengthMedian];
          v77 = [(HKMCStatistics *)v5 cycleLengthMedian];
          v78 = v19;
          if (!objc_msgSend(v19, "isEqual:"))
          {
            char v11 = 0;
            uint64_t v20 = v86;
            goto LABEL_53;
          }
        }
        v21 = [(HKMCStatistics *)self cycleLengthLowerPercentile];
        v81 = [(HKMCStatistics *)v5 cycleLengthLowerPercentile];
        BOOL v75 = v21 != v81;
        if (v21 == v81)
        {
          v74 = v3;
        }
        else
        {
          uint64_t v22 = [(HKMCStatistics *)v5 cycleLengthLowerPercentile];
          if (!v22)
          {

            char v11 = 0;
            uint64_t v20 = v86;
            if (v86 != v87)
            {
              LOBYTE(v30) = 1;
              goto LABEL_86;
            }
            BOOL v30 = 0;
            goto LABEL_100;
          }
          v69 = (void *)v22;
          id v23 = [(HKMCStatistics *)self cycleLengthLowerPercentile];
          v70 = [(HKMCStatistics *)v5 cycleLengthLowerPercentile];
          v71 = v23;
          if (!objc_msgSend(v23, "isEqual:"))
          {
            v80 = v21;
            char v11 = 0;
            uint64_t v20 = v86;
            goto LABEL_52;
          }
          v74 = v3;
        }
        id v25 = [(HKMCStatistics *)self cycleLengthUpperPercentile];
        v72 = [(HKMCStatistics *)v5 cycleLengthUpperPercentile];
        v73 = v25;
        BOOL v26 = v25 != v72;
        v80 = v21;
        if (v25 != v72)
        {
          uint64_t v27 = [(HKMCStatistics *)v5 cycleLengthUpperPercentile];
          if (!v27)
          {

            v39 = v21;
            char v11 = 0;
            v3 = v74;
            uint64_t v20 = v86;
            if (v39 != v81)
            {
              LOBYTE(v75) = 1;
              goto LABEL_83;
            }
            BOOL v75 = 0;
LABEL_102:
            if (!v75)
            {
LABEL_85:

              BOOL v30 = v79;
              if (v20 != v87)
              {
LABEL_86:

                if (!v30) {
                  goto LABEL_88;
                }
                goto LABEL_87;
              }
LABEL_100:
              if (v30) {
LABEL_87:
              }

LABEL_88:
              BOOL v24 = v12 != v13;
              if (v12 != v13)
              {
LABEL_89:

                if (!v24) {
                  goto LABEL_91;
                }
                goto LABEL_90;
              }
              goto LABEL_98;
            }
LABEL_84:

            goto LABEL_85;
          }
          v66 = (void *)v27;
          id v28 = [(HKMCStatistics *)self cycleLengthUpperPercentile];
          [(HKMCStatistics *)v5 cycleLengthUpperPercentile];
          objc_super v29 = v67 = v28;
          if (!objc_msgSend(v28, "isEqual:"))
          {
            char v11 = 0;
            uint64_t v20 = v86;
LABEL_51:

            v3 = v74;
            if (v80 == v81) {
              goto LABEL_85;
            }
LABEL_52:

            if (v20 != v87)
            {
LABEL_53:

              if (v12 != v13)
              {
LABEL_54:

                uint64_t v10 = v84;
                v9 = v85;
                if (v7 != (void *)v8) {
                  goto LABEL_55;
                }
LABEL_95:
                v53 = (void *)v8;
LABEL_96:

                goto LABEL_97;
              }
LABEL_91:

              if (v7 == (void *)v8) {
                goto LABEL_93;
              }
              goto LABEL_92;
            }
            goto LABEL_88;
          }
          v63 = v29;
        }
        v31 = [(HKMCStatistics *)self menstruationLengthMedian];
        uint64_t v32 = [(HKMCStatistics *)v5 menstruationLengthMedian];
        v33 = (void *)v32;
        v68 = v31;
        if (v31 == (void *)v32)
        {
          v64 = (void *)v32;
        }
        else
        {
          uint64_t v34 = [(HKMCStatistics *)v5 menstruationLengthMedian];
          if (!v34)
          {

            char v11 = 0;
            uint64_t v20 = v86;
            if (v73 != v72) {
              goto LABEL_77;
            }
            goto LABEL_80;
          }
          v62 = (void *)v34;
          uint64_t v35 = [(HKMCStatistics *)self menstruationLengthMedian];
          uint64_t v36 = [(HKMCStatistics *)v5 menstruationLengthMedian];
          v61 = (void *)v35;
          v37 = (void *)v35;
          v38 = (void *)v36;
          if (![v37 isEqual:v36])
          {
            char v11 = 0;
            uint64_t v20 = v86;
LABEL_75:

            if (v73 != v72)
            {
              LOBYTE(v26) = 1;
LABEL_77:

              if (!v26) {
                goto LABEL_82;
              }
LABEL_81:

              goto LABEL_82;
            }
            BOOL v26 = 0;
LABEL_80:
            if (!v26) {
              goto LABEL_82;
            }
            goto LABEL_81;
          }
          v60 = v38;
          v64 = v33;
        }
        uint64_t v40 = [(HKMCStatistics *)self menstruationLengthLowerPercentile];
        uint64_t v41 = [(HKMCStatistics *)v5 menstruationLengthLowerPercentile];
        v65 = (void *)v40;
        BOOL v52 = v40 == v41;
        v42 = (void *)v41;
        if (v52)
        {
          [(HKMCStatistics *)self menstruationLengthUpperPercentile];
        }
        else
        {
          uint64_t v43 = [(HKMCStatistics *)v5 menstruationLengthLowerPercentile];
          if (!v43)
          {
            char v11 = 0;
            goto LABEL_72;
          }
          v59 = (void *)v43;
          v44 = [(HKMCStatistics *)self menstruationLengthLowerPercentile];
          v45 = [(HKMCStatistics *)v5 menstruationLengthLowerPercentile];
          if (([v44 isEqual:v45] & 1) == 0)
          {

            char v11 = 0;
            goto LABEL_108;
          }
          v57 = v44;
          [(HKMCStatistics *)self menstruationLengthUpperPercentile];
        v46 = };
        uint64_t v47 = [(HKMCStatistics *)v5 menstruationLengthUpperPercentile];
        char v11 = v46 == (void *)v47;
        if (v46 == (void *)v47)
        {
        }
        else
        {
          v58 = (void *)v47;
          uint64_t v48 = [(HKMCStatistics *)v5 menstruationLengthUpperPercentile];
          if (v48)
          {
            v89 = v42;
            v49 = (void *)v48;
            v50 = [(HKMCStatistics *)self menstruationLengthUpperPercentile];
            v51 = [(HKMCStatistics *)v5 menstruationLengthUpperPercentile];
            char v11 = [v50 isEqual:v51];

            if (v65 == v89)
            {
            }
            else
            {
            }
LABEL_108:
            if (v68 != v64)
            {
            }
            if (v73 != v72)
            {
            }
            if (v80 != v81)
            {
            }
            if (v86 != v87)
            {
            }
            if (v12 != v13)
            {
            }
            v53 = v7;
            uint64_t v10 = v84;
            v9 = v85;
            if (v7 == (void *)v8) {
              goto LABEL_96;
            }
            goto LABEL_55;
          }
        }
        if (v65 == v42)
        {

          v31 = v68;
          v33 = v64;
          BOOL v52 = v68 == v64;
          uint64_t v20 = v86;
          goto LABEL_74;
        }

LABEL_72:
        uint64_t v20 = v86;

        v31 = v68;
        v33 = v64;
        BOOL v52 = v68 == v64;
LABEL_74:
        v38 = v60;
        if (!v52) {
          goto LABEL_75;
        }

        objc_super v29 = v63;
        if (v73 == v72)
        {
LABEL_82:

          v3 = v74;
          if (v80 != v81)
          {
LABEL_83:

            if (!v75) {
              goto LABEL_85;
            }
            goto LABEL_84;
          }
          goto LABEL_102;
        }
        goto LABEL_51;
      }
    }
    char v11 = 0;
  }
LABEL_97:

  return v11;
}

- (unint64_t)hash
{
  int64_t numberOfCycles = self->_numberOfCycles;
  uint64_t v4 = [(NSNumber *)self->_firstMenstruationStartDayIndex hash] ^ numberOfCycles;
  uint64_t v5 = [(NSNumber *)self->_lastMenstruationStartDayIndex hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSNumber *)self->_cycleLengthLowerPercentile hash];
  uint64_t v7 = [(NSNumber *)self->_cycleLengthUpperPercentile hash];
  uint64_t v8 = v7 ^ [(NSNumber *)self->_menstruationLengthMedian hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSNumber *)self->_menstruationLengthLowerPercentile hash];
  return v9 ^ [(NSNumber *)self->_menstruationLengthUpperPercentile hash];
}

- (int64_t)numberOfCycles
{
  return self->_numberOfCycles;
}

- (NSNumber)firstMenstruationStartDayIndex
{
  return self->_firstMenstruationStartDayIndex;
}

- (NSNumber)lastMenstruationStartDayIndex
{
  return self->_lastMenstruationStartDayIndex;
}

- (NSNumber)cycleLengthMedian
{
  return self->_cycleLengthMedian;
}

- (void)setCycleLengthMedian:(id)a3
{
}

- (NSNumber)cycleLengthLowerPercentile
{
  return self->_cycleLengthLowerPercentile;
}

- (NSNumber)cycleLengthUpperPercentile
{
  return self->_cycleLengthUpperPercentile;
}

- (NSNumber)menstruationLengthMedian
{
  return self->_menstruationLengthMedian;
}

- (void)setMenstruationLengthMedian:(id)a3
{
}

- (NSNumber)menstruationLengthLowerPercentile
{
  return self->_menstruationLengthLowerPercentile;
}

- (NSNumber)menstruationLengthUpperPercentile
{
  return self->_menstruationLengthUpperPercentile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menstruationLengthUpperPercentile, 0);
  objc_storeStrong((id *)&self->_menstruationLengthLowerPercentile, 0);
  objc_storeStrong((id *)&self->_menstruationLengthMedian, 0);
  objc_storeStrong((id *)&self->_cycleLengthUpperPercentile, 0);
  objc_storeStrong((id *)&self->_cycleLengthLowerPercentile, 0);
  objc_storeStrong((id *)&self->_cycleLengthMedian, 0);
  objc_storeStrong((id *)&self->_lastMenstruationStartDayIndex, 0);
  objc_storeStrong((id *)&self->_firstMenstruationStartDayIndex, 0);
}

@end