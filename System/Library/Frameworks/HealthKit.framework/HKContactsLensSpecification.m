@interface HKContactsLensSpecification
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKContactsLensSpecification)initWithCoder:(id)a3;
- (HKContactsLensSpecification)initWithSphere:(HKQuantity *)sphere cylinder:(HKQuantity *)cylinder axis:(HKQuantity *)axis addPower:(HKQuantity *)addPower baseCurve:(HKQuantity *)baseCurve diameter:(HKQuantity *)diameter;
- (HKQuantity)baseCurve;
- (HKQuantity)diameter;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKContactsLensSpecification

- (HKContactsLensSpecification)initWithSphere:(HKQuantity *)sphere cylinder:(HKQuantity *)cylinder axis:(HKQuantity *)axis addPower:(HKQuantity *)addPower baseCurve:(HKQuantity *)baseCurve diameter:(HKQuantity *)diameter
{
  v14 = baseCurve;
  v15 = diameter;
  v22.receiver = self;
  v22.super_class = (Class)HKContactsLensSpecification;
  v16 = [(HKLensSpecification *)&v22 _initWithSphere:sphere cylinder:cylinder axis:axis addPower:addPower];
  if (v16)
  {
    uint64_t v17 = [(HKQuantity *)v14 copy];
    v18 = v16->_baseCurve;
    v16->_baseCurve = (HKQuantity *)v17;

    uint64_t v19 = [(HKQuantity *)v15 copy];
    v20 = v16->_diameter;
    v16->_diameter = (HKQuantity *)v19;
  }
  return v16;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@:%p BaseCurve=%@, Diameter=%@>", v5, self, self->_baseCurve, self->_diameter];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HKContactsLensSpecification *)a3;
  if (self == v5)
  {
    LOBYTE(v3) = 1;
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
        v64 = [(HKLensSpecification *)v6 sphere];
        if (!v64)
        {
          LOBYTE(v3) = 0;
          goto LABEL_75;
        }
        v9 = [(HKLensSpecification *)self sphere];
        v10 = [(HKLensSpecification *)v6 sphere];
        v63 = v9;
        if (![v9 isEqual:v10])
        {
          LOBYTE(v3) = 0;
LABEL_74:

          goto LABEL_75;
        }
        v61 = v10;
      }
      v11 = [(HKLensSpecification *)self cylinder];
      uint64_t v12 = [(HKLensSpecification *)v6 cylinder];
      v13 = (void *)v12;
      if (v11 == (void *)v12)
      {
        v62 = (void *)v12;
      }
      else
      {
        v3 = [(HKLensSpecification *)v6 cylinder];
        if (!v3)
        {

LABEL_72:
          goto LABEL_73;
        }
        v62 = v13;
        v14 = [(HKLensSpecification *)self cylinder];
        v15 = [(HKLensSpecification *)v6 cylinder];
        if (([v14 isEqual:v15] & 1) == 0)
        {

          goto LABEL_36;
        }
        v57 = v15;
        v59 = v14;
      }
      v16 = [(HKLensSpecification *)self axis];
      v60 = [(HKLensSpecification *)v6 axis];
      if (v16 == v60)
      {
LABEL_21:
        v21 = [(HKLensSpecification *)self addPower];
        uint64_t v22 = [(HKLensSpecification *)v6 addPower];
        v23 = (void *)v22;
        v58 = v3;
        if (v21 == (void *)v22)
        {
          v54 = (void *)v22;
          v55 = v11;
          v53 = v16;
LABEL_28:
          baseCurve = self->_baseCurve;
          v28 = [(HKContactsLensSpecification *)v6 baseCurve];
          v49 = baseCurve;
          if (baseCurve == v28)
          {
            v47 = v21;
          }
          else
          {
            uint64_t v29 = [(HKContactsLensSpecification *)v6 baseCurve];
            if (!v29)
            {
              LOBYTE(v3) = 0;
              v40 = v59;
              v39 = v53;
              goto LABEL_49;
            }
            v45 = (void *)v29;
            v30 = self->_baseCurve;
            baseCurve = [(HKContactsLensSpecification *)v6 baseCurve];
            if (![(HKQuantity *)v30 isEqual:baseCurve])
            {
              v31 = v53;

              LOBYTE(v3) = 0;
LABEL_65:
              v23 = v54;
              v32 = v59;
              if (v21 == v54)
              {

                v43 = v60;
                v11 = v55;
                if (v31 == v60) {
                  goto LABEL_69;
                }
                goto LABEL_68;
              }

              v11 = v55;
LABEL_67:

              v43 = v60;
              if (v31 == v60)
              {
LABEL_69:

                if (v11 != v62)
                {
                }
                goto LABEL_72;
              }
LABEL_68:

              goto LABEL_69;
            }
            v47 = v21;
          }
          diameter = self->_diameter;
          uint64_t v34 = [(HKContactsLensSpecification *)v6 diameter];
          LOBYTE(v3) = diameter == (HKQuantity *)v34;
          if (diameter != (HKQuantity *)v34)
          {
            diameter = (HKQuantity *)v34;
            uint64_t v35 = [(HKContactsLensSpecification *)v6 diameter];
            if (v35)
            {
              v3 = self->_diameter;
              v36 = (void *)v35;
              v37 = [(HKContactsLensSpecification *)v6 diameter];
              LOBYTE(v3) = [v3 isEqual:v37];

              v31 = v53;
              if (v49 == v28)
              {
              }
              else
              {
              }
              v21 = v47;
              goto LABEL_65;
            }
          }
          v38 = baseCurve;

          v39 = v53;
          if (v49 == v28)
          {

            v21 = v47;
            v41 = v48;
            v40 = v59;
            if (v47 == v54) {
              goto LABEL_51;
            }
            goto LABEL_50;
          }

          v40 = v59;
          v21 = v47;
LABEL_49:
          v41 = v48;

          if (v21 == v54)
          {
LABEL_51:

            v42 = v60;
            if (v39 != v60)
            {

              v42 = v60;
            }

            if (v55 != v62)
            {
            }
LABEL_73:
            v10 = v61;
            if (v7 != v8) {
              goto LABEL_74;
            }
LABEL_75:

            goto LABEL_76;
          }
LABEL_50:

          goto LABEL_51;
        }
        uint64_t v24 = [(HKLensSpecification *)v6 addPower];
        if (!v24)
        {
          v31 = v16;
          LOBYTE(v3) = 0;
          v32 = v59;
          goto LABEL_67;
        }
        v55 = v11;
        v50 = (void *)v24;
        v25 = [(HKLensSpecification *)self addPower];
        v26 = [(HKLensSpecification *)v6 addPower];
        if ([v25 isEqual:v26])
        {
          v46 = v26;
          v48 = v25;
          v53 = v16;
          v54 = v23;
          goto LABEL_28;
        }

        if (v16 == v60)
        {
        }
        else
        {
        }
        if (v55 != v62)
        {
        }
LABEL_37:
        LOBYTE(v3) = 0;
        goto LABEL_73;
      }
      uint64_t v17 = [(HKLensSpecification *)v6 axis];
      if (v17)
      {
        v18 = v16;
        v56 = (void *)v17;
        uint64_t v19 = [(HKLensSpecification *)self axis];
        v20 = [(HKLensSpecification *)v6 axis];
        if ([v19 isEqual:v20])
        {
          v51 = v20;
          v52 = v19;
          v16 = v18;
          goto LABEL_21;
        }
      }
      else
      {
      }
      if (v11 == v62)
      {
      }
      else
      {
      }
LABEL_36:

      goto LABEL_37;
    }
    LOBYTE(v3) = 0;
  }
LABEL_76:

  return (char)v3;
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

  [v8 encodeObject:self->_baseCurve forKey:@"BaseCurve"];
  [v8 encodeObject:self->_diameter forKey:@"Diameter"];
}

- (HKContactsLensSpecification)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Sphere"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Cyclinder"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Axis"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AddPower"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BaseCurve"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Diameter"];

  v11 = [(HKContactsLensSpecification *)self initWithSphere:v5 cylinder:v6 axis:v7 addPower:v8 baseCurve:v9 diameter:v10];
  return v11;
}

- (HKQuantity)baseCurve
{
  return self->_baseCurve;
}

- (HKQuantity)diameter
{
  return self->_diameter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diameter, 0);

  objc_storeStrong((id *)&self->_baseCurve, 0);
}

@end