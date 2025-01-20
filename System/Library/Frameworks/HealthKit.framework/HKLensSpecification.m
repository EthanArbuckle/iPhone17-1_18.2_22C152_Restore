@interface HKLensSpecification
- (BOOL)isEqual:(id)a3;
- (HKQuantity)addPower;
- (HKQuantity)axis;
- (HKQuantity)cylinder;
- (HKQuantity)sphere;
- (id)_initWithSphere:(id)a3 cylinder:(id)a4 axis:(id)a5 addPower:(id)a6;
- (id)description;
@end

@implementation HKLensSpecification

- (id)_initWithSphere:(id)a3 cylinder:(id)a4 axis:(id)a5 addPower:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HKLensSpecification;
  v14 = [(HKLensSpecification *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    sphere = v14->_sphere;
    v14->_sphere = (HKQuantity *)v15;

    uint64_t v17 = [v11 copy];
    cylinder = v14->_cylinder;
    v14->_cylinder = (HKQuantity *)v17;

    uint64_t v19 = [v12 copy];
    axis = v14->_axis;
    v14->_axis = (HKQuantity *)v19;

    uint64_t v21 = [v13 copy];
    addPower = v14->_addPower;
    v14->_addPower = (HKQuantity *)v21;
  }
  return v14;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@:%p Sphere=%@, Cylinder=%@, Axis=%@, Power=%@>", v5, self, self->_sphere, self->_cylinder, self->_axis, self->_addPower];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HKLensSpecification *)a3;
  if (self == v6)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      sphere = self->_sphere;
      v9 = [(HKLensSpecification *)v7 sphere];
      if (sphere != v9)
      {
        uint64_t v10 = [(HKLensSpecification *)v7 sphere];
        if (!v10)
        {
          char v13 = 0;
          goto LABEL_39;
        }
        v3 = (void *)v10;
        id v11 = self->_sphere;
        id v12 = [(HKLensSpecification *)v7 sphere];
        if (![(HKQuantity *)v11 isEqual:v12])
        {
          char v13 = 0;
LABEL_38:

          goto LABEL_39;
        }
        v42 = v12;
      }
      cylinder = self->_cylinder;
      uint64_t v15 = [(HKLensSpecification *)v7 cylinder];
      if (cylinder == v15)
      {
        v41 = cylinder;
      }
      else
      {
        uint64_t v16 = [(HKLensSpecification *)v7 cylinder];
        if (!v16)
        {
          char v13 = 0;
          goto LABEL_36;
        }
        uint64_t v17 = (void *)v16;
        v41 = cylinder;
        v18 = self->_cylinder;
        v4 = [(HKLensSpecification *)v7 cylinder];
        if (![(HKQuantity *)v18 isEqual:v4])
        {

          char v13 = 0;
          goto LABEL_37;
        }
        v37 = v17;
      }
      axis = self->_axis;
      v20 = [(HKLensSpecification *)v7 axis];
      v40 = v4;
      if (axis == v20)
      {
        v38 = v3;
        v39 = axis;
      }
      else
      {
        uint64_t v21 = [(HKLensSpecification *)v7 axis];
        if (!v21)
        {
          char v13 = 0;
LABEL_33:

LABEL_34:
          if (v41 != v15)
          {
LABEL_35:
          }
LABEL_36:

LABEL_37:
          id v12 = v42;
          if (sphere != v9) {
            goto LABEL_38;
          }
LABEL_39:

          goto LABEL_40;
        }
        v39 = axis;
        v36 = (void *)v21;
        v22 = self->_axis;
        uint64_t v23 = [(HKLensSpecification *)v7 axis];
        objc_super v24 = v22;
        v25 = (void *)v23;
        if (![(HKQuantity *)v24 isEqual:v23])
        {

          char v13 = 0;
          goto LABEL_34;
        }
        v34 = v25;
        v38 = v3;
      }
      addPower = self->_addPower;
      uint64_t v27 = [(HKLensSpecification *)v7 addPower];
      char v13 = addPower == (HKQuantity *)v27;
      if (addPower == (HKQuantity *)v27)
      {
      }
      else
      {
        v28 = (void *)v27;
        uint64_t v29 = [(HKLensSpecification *)v7 addPower];
        if (v29)
        {
          v30 = (void *)v29;
          v31 = self->_addPower;
          v32 = [(HKLensSpecification *)v7 addPower];
          char v13 = [(HKQuantity *)v31 isEqual:v32];

          if (v39 == v20)
          {

LABEL_43:
            v3 = v38;
            if (v41 == v15) {
              goto LABEL_36;
            }
            goto LABEL_35;
          }

LABEL_41:
          goto LABEL_43;
        }
      }
      if (v39 == v20) {
        goto LABEL_41;
      }

      v3 = v38;
      goto LABEL_33;
    }
    char v13 = 0;
  }
LABEL_40:

  return v13;
}

- (HKQuantity)sphere
{
  return self->_sphere;
}

- (HKQuantity)cylinder
{
  return self->_cylinder;
}

- (HKQuantity)axis
{
  return self->_axis;
}

- (HKQuantity)addPower
{
  return self->_addPower;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addPower, 0);
  objc_storeStrong((id *)&self->_axis, 0);
  objc_storeStrong((id *)&self->_cylinder, 0);

  objc_storeStrong((id *)&self->_sphere, 0);
}

@end