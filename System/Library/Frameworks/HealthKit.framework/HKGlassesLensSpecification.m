@interface HKGlassesLensSpecification
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKGlassesLensSpecification)initWithCoder:(id)a3;
- (HKGlassesLensSpecification)initWithSphere:(HKQuantity *)sphere cylinder:(HKQuantity *)cylinder axis:(HKQuantity *)axis addPower:(HKQuantity *)addPower vertexDistance:(HKQuantity *)vertexDistance prism:(HKVisionPrism *)prism farPupillaryDistance:(HKQuantity *)farPupillaryDistance nearPupillaryDistance:(HKQuantity *)nearPupillaryDistance;
- (HKQuantity)farPupillaryDistance;
- (HKQuantity)nearPupillaryDistance;
- (HKQuantity)vertexDistance;
- (HKVisionPrism)prism;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKGlassesLensSpecification

- (HKGlassesLensSpecification)initWithSphere:(HKQuantity *)sphere cylinder:(HKQuantity *)cylinder axis:(HKQuantity *)axis addPower:(HKQuantity *)addPower vertexDistance:(HKQuantity *)vertexDistance prism:(HKVisionPrism *)prism farPupillaryDistance:(HKQuantity *)farPupillaryDistance nearPupillaryDistance:(HKQuantity *)nearPupillaryDistance
{
  v16 = vertexDistance;
  v17 = prism;
  v18 = farPupillaryDistance;
  v19 = nearPupillaryDistance;
  v30.receiver = self;
  v30.super_class = (Class)HKGlassesLensSpecification;
  v20 = [(HKLensSpecification *)&v30 _initWithSphere:sphere cylinder:cylinder axis:axis addPower:addPower];
  if (v20)
  {
    uint64_t v21 = [(HKQuantity *)v16 copy];
    v22 = v20->_vertexDistance;
    v20->_vertexDistance = (HKQuantity *)v21;

    uint64_t v23 = [(HKVisionPrism *)v17 copy];
    v24 = v20->_prism;
    v20->_prism = (HKVisionPrism *)v23;

    uint64_t v25 = [(HKQuantity *)v18 copy];
    v26 = v20->_farPupillaryDistance;
    v20->_farPupillaryDistance = (HKQuantity *)v25;

    uint64_t v27 = [(HKQuantity *)v19 copy];
    v28 = v20->_nearPupillaryDistance;
    v20->_nearPupillaryDistance = (HKQuantity *)v27;
  }
  return v20;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@:%p Vertex=%@, Prism=%@, FarPupillaryDistance=%@, NearPupillaryDistance=%@>", v5, self, self->_vertexDistance, self->_prism, self->_farPupillaryDistance, self->_nearPupillaryDistance];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HKGlassesLensSpecification *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      v7 = [(HKLensSpecification *)self sphere];
      v8 = [(HKLensSpecification *)v6 sphere];
      if (v7 != v8)
      {
        v3 = [(HKLensSpecification *)v6 sphere];
        if (!v3)
        {
          char v11 = 0;
LABEL_86:

          goto LABEL_87;
        }
        v9 = [(HKLensSpecification *)self sphere];
        v10 = [(HKLensSpecification *)v6 sphere];
        if (![v9 isEqual:v10])
        {
          char v11 = 0;
LABEL_46:

          goto LABEL_86;
        }
        v83 = v10;
        v84 = v9;
      }
      v12 = [(HKLensSpecification *)self cylinder];
      v13 = [(HKLensSpecification *)v6 cylinder];
      BOOL v86 = v12 != v13;
      if (v12 != v13)
      {
        uint64_t v14 = [(HKLensSpecification *)v6 cylinder];
        if (!v14)
        {

          char v11 = 0;
          goto LABEL_84;
        }
        v80 = (void *)v14;
        v15 = [(HKLensSpecification *)self cylinder];
        v81 = [(HKLensSpecification *)v6 cylinder];
        v82 = v15;
        if (!objc_msgSend(v15, "isEqual:"))
        {
          char v11 = 0;
          goto LABEL_44;
        }
      }
      v16 = [(HKLensSpecification *)self axis];
      uint64_t v17 = [(HKLensSpecification *)v6 axis];
      v85 = v16;
      BOOL v18 = v16 != (void *)v17;
      v88 = (void *)v17;
      if (v16 == (void *)v17)
      {
        BOOL v77 = 0;
      }
      else
      {
        uint64_t v19 = [(HKLensSpecification *)v6 axis];
        if (!v19)
        {

          char v11 = 0;
          if (v12 != v13)
          {
            LOBYTE(v29) = 1;
            goto LABEL_81;
          }
          BOOL v29 = 0;
LABEL_89:
          if (!v29) {
            goto LABEL_83;
          }
          goto LABEL_82;
        }
        BOOL v77 = v18;
        v73 = (void *)v19;
        v20 = [(HKLensSpecification *)self axis];
        v75 = [(HKLensSpecification *)v6 axis];
        v76 = v20;
        if (!objc_msgSend(v20, "isEqual:"))
        {
          char v11 = 0;
          uint64_t v21 = v85;
          goto LABEL_43;
        }
      }
      v22 = [(HKLensSpecification *)self addPower];
      uint64_t v23 = [(HKLensSpecification *)v6 addPower];
      BOOL v24 = v22 != (void *)v23;
      v79 = (void *)v23;
      if (v22 == (void *)v23)
      {
        BOOL v71 = 0;
        v74 = v12;
        v26 = v3;
        v78 = v22;
      }
      else
      {
        uint64_t v25 = [(HKLensSpecification *)v6 addPower];
        if (!v25)
        {

          char v11 = 0;
          uint64_t v21 = v85;
          if (v85 != v88)
          {
            LOBYTE(v37) = 1;
            goto LABEL_78;
          }
          BOOL v37 = 0;
          goto LABEL_91;
        }
        BOOL v71 = v24;
        v74 = v12;
        v26 = v3;
        v69 = (void *)v25;
        uint64_t v27 = [(HKLensSpecification *)self addPower];
        v28 = [(HKLensSpecification *)v6 addPower];
        v70 = v27;
        v78 = v22;
        if (![v27 isEqual:v28])
        {
          char v11 = 0;
          uint64_t v21 = v85;
          v3 = v26;
          v12 = v74;
          goto LABEL_42;
        }
        v66 = v28;
      }
      vertexDistance = self->_vertexDistance;
      uint64_t v31 = [(HKGlassesLensSpecification *)v6 vertexDistance];
      v32 = (HKQuantity *)v31;
      v68 = vertexDistance;
      BOOL v33 = vertexDistance == (HKQuantity *)v31;
      BOOL v34 = vertexDistance != (HKQuantity *)v31;
      if (v33)
      {
        v72 = (HKQuantity *)v31;
        v3 = v26;
      }
      else
      {
        uint64_t v35 = [(HKGlassesLensSpecification *)v6 vertexDistance];
        if (!v35)
        {

          char v11 = 0;
          uint64_t v21 = v85;
          v3 = v26;
          if (v78 != v79)
          {
            LOBYTE(v42) = 1;
            v12 = v74;
            goto LABEL_75;
          }
          BOOL v42 = 0;
          v12 = v74;
LABEL_93:
          if (!v42)
          {
LABEL_77:

            BOOL v37 = v77;
            if (v21 != v88)
            {
LABEL_78:

              if (!v37) {
                goto LABEL_80;
              }
              goto LABEL_79;
            }
LABEL_91:
            if (v37) {
LABEL_79:
            }

LABEL_80:
            BOOL v29 = v86;
            if (v12 != v13)
            {
LABEL_81:

              if (!v29)
              {
LABEL_83:

LABEL_84:
                if (v7 != v8)
                {

                  goto LABEL_86;
                }
                goto LABEL_87;
              }
LABEL_82:

              goto LABEL_83;
            }
            goto LABEL_89;
          }
LABEL_76:

          goto LABEL_77;
        }
        v64 = (void *)v35;
        v72 = v32;
        v36 = self->_vertexDistance;
        v65 = [(HKGlassesLensSpecification *)v6 vertexDistance];
        v3 = v26;
        if (!-[HKQuantity isEqual:](v36, "isEqual:"))
        {
          char v11 = 0;
          uint64_t v21 = v85;
          v12 = v74;
          goto LABEL_32;
        }
      }
      prism = self->_prism;
      v67 = [(HKGlassesLensSpecification *)v6 prism];
      v63 = prism;
      if (prism != v67)
      {
        uint64_t v39 = [(HKGlassesLensSpecification *)v6 prism];
        v12 = v74;
        if (!v39)
        {

          char v11 = 0;
          uint64_t v21 = v85;
          if (v68 != v72) {
            goto LABEL_69;
          }
          goto LABEL_72;
        }
        v61 = (void *)v39;
        v40 = self->_prism;
        v60 = [(HKGlassesLensSpecification *)v6 prism];
        if (![(HKVisionPrism *)v40 isEqual:v60])
        {
          char v11 = 0;
          uint64_t v21 = v85;
          v41 = v67;
LABEL_67:

          if (v68 != v72)
          {
            LOBYTE(v34) = 1;
LABEL_69:

            if (!v34) {
              goto LABEL_74;
            }
LABEL_73:

            goto LABEL_74;
          }
          BOOL v34 = 0;
LABEL_72:
          if (!v34) {
            goto LABEL_74;
          }
          goto LABEL_73;
        }
      }
      farPupillaryDistance = self->_farPupillaryDistance;
      v62 = [(HKGlassesLensSpecification *)v6 farPupillaryDistance];
      v59 = farPupillaryDistance;
      if (farPupillaryDistance == v62)
      {
        v12 = v74;
      }
      else
      {
        uint64_t v44 = [(HKGlassesLensSpecification *)v6 farPupillaryDistance];
        v12 = v74;
        if (!v44)
        {
          char v11 = 0;
          uint64_t v21 = v85;
          v52 = v62;
          goto LABEL_66;
        }
        v58 = (void *)v44;
        v45 = self->_farPupillaryDistance;
        v46 = [(HKGlassesLensSpecification *)v6 farPupillaryDistance];
        if (![(HKQuantity *)v45 isEqual:v46])
        {

          char v11 = 0;
          goto LABEL_100;
        }
        v56 = v46;
      }
      nearPupillaryDistance = self->_nearPupillaryDistance;
      uint64_t v48 = [(HKGlassesLensSpecification *)v6 nearPupillaryDistance];
      char v11 = nearPupillaryDistance == (HKQuantity *)v48;
      if (nearPupillaryDistance != (HKQuantity *)v48)
      {
        nearPupillaryDistance = (HKQuantity *)v48;
        uint64_t v49 = [(HKGlassesLensSpecification *)v6 nearPupillaryDistance];
        if (v49)
        {
          v50 = self->_nearPupillaryDistance;
          v87 = (void *)v49;
          v51 = [(HKGlassesLensSpecification *)v6 nearPupillaryDistance];
          char v11 = [(HKQuantity *)v50 isEqual:v51];

          if (v59 == v62)
          {
          }
          else
          {
          }
LABEL_100:
          if (v63 != v67)
          {
          }
          if (v68 != v72)
          {
          }
          v55 = v79;
          if (v78 != v79)
          {

            v55 = v79;
          }

          if (v85 != v88)
          {
          }
          if (v12 == v13)
          {
LABEL_45:

            v10 = v83;
            v9 = v84;
            if (v7 != v8) {
              goto LABEL_46;
            }
LABEL_87:

            goto LABEL_88;
          }
LABEL_44:

          goto LABEL_45;
        }
      }

      v52 = v62;
      if (v59 == v62)
      {

        v41 = v67;
        v53 = v63;
        uint64_t v21 = v85;
        if (v63 != v67) {
          goto LABEL_67;
        }
        goto LABEL_97;
      }

      uint64_t v21 = v85;
LABEL_66:

      v41 = v67;
      v53 = v63;
      if (v63 != v67) {
        goto LABEL_67;
      }
LABEL_97:

      if (v68 != v72)
      {
LABEL_32:

        v28 = v66;
        if (v78 == v79) {
          goto LABEL_77;
        }
LABEL_42:

        if (v21 != v88)
        {
LABEL_43:

          if (v12 != v13) {
            goto LABEL_44;
          }
          goto LABEL_83;
        }
        goto LABEL_80;
      }
LABEL_74:

      BOOL v42 = v71;
      if (v78 != v79)
      {
LABEL_75:

        if (!v42) {
          goto LABEL_77;
        }
        goto LABEL_76;
      }
      goto LABEL_93;
    }
    char v11 = 0;
  }
LABEL_88:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(HKLensSpecification *)self sphere];
  [v8 encodeObject:v4 forKey:@"Sphere"];

  v5 = [(HKLensSpecification *)self cylinder];
  [v8 encodeObject:v5 forKey:@"Cyclinder"];

  v6 = [(HKLensSpecification *)self axis];
  [v8 encodeObject:v6 forKey:@"Axis"];

  v7 = [(HKLensSpecification *)self addPower];
  [v8 encodeObject:v7 forKey:@"AddPower"];

  [v8 encodeObject:self->_vertexDistance forKey:@"VertexDistance"];
  [v8 encodeObject:self->_prism forKey:@"Prism"];
  [v8 encodeObject:self->_farPupillaryDistance forKey:@"FarPupillaryDistance"];
  [v8 encodeObject:self->_nearPupillaryDistance forKey:@"NearPupillaryDistance"];
}

- (HKGlassesLensSpecification)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Sphere"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Cyclinder"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Axis"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AddPower"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VertexDistance"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Prism"];
  char v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FarPupillaryDistance"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NearPupillaryDistance"];

  v13 = [(HKGlassesLensSpecification *)self initWithSphere:v5 cylinder:v6 axis:v7 addPower:v8 vertexDistance:v9 prism:v10 farPupillaryDistance:v11 nearPupillaryDistance:v12];
  return v13;
}

- (HKQuantity)vertexDistance
{
  return self->_vertexDistance;
}

- (HKVisionPrism)prism
{
  return self->_prism;
}

- (HKQuantity)farPupillaryDistance
{
  return self->_farPupillaryDistance;
}

- (HKQuantity)nearPupillaryDistance
{
  return self->_nearPupillaryDistance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearPupillaryDistance, 0);
  objc_storeStrong((id *)&self->_farPupillaryDistance, 0);
  objc_storeStrong((id *)&self->_prism, 0);

  objc_storeStrong((id *)&self->_vertexDistance, 0);
}

@end