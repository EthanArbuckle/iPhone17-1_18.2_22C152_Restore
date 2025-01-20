@interface MRUCAPackageAsset
+ (id)packageNamed:(id)a3;
+ (id)packageNamed:(id)a3 glyphState:(id)a4;
+ (id)packageNamed:(id)a3 glyphState:(id)a4 permanentTransform:(CATransform3D *)a5;
- (BOOL)isEqual:(id)a3;
- (CAPackage)package;
- (CATransform3D)permanentTransform;
- (CCUICAPackageDescription)packageDescription;
- (MRUCAPackageAsset)initWithPackageName:(id)a3;
- (MRUCAPackageAsset)initWithPackageName:(id)a3 glyphState:(id)a4;
- (MRUCAPackageAsset)initWithPackageName:(id)a3 glyphState:(id)a4 permanentTransform:(CATransform3D *)a5;
- (NSString)glyphState;
- (NSString)packageName;
- (id)description;
- (void)setGlyphState:(id)a3;
- (void)setPermanentTransform:(CATransform3D *)a3;
@end

@implementation MRUCAPackageAsset

+ (id)packageNamed:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithPackageName:v4];

  return v5;
}

+ (id)packageNamed:(id)a3 glyphState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithPackageName:v7 glyphState:v6];

  return v8;
}

+ (id)packageNamed:(id)a3 glyphState:(id)a4 permanentTransform:(CATransform3D *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc((Class)a1);
  long long v11 = *(_OWORD *)&a5->m33;
  v17[4] = *(_OWORD *)&a5->m31;
  v17[5] = v11;
  long long v12 = *(_OWORD *)&a5->m43;
  v17[6] = *(_OWORD *)&a5->m41;
  v17[7] = v12;
  long long v13 = *(_OWORD *)&a5->m13;
  v17[0] = *(_OWORD *)&a5->m11;
  v17[1] = v13;
  long long v14 = *(_OWORD *)&a5->m23;
  v17[2] = *(_OWORD *)&a5->m21;
  v17[3] = v14;
  v15 = (void *)[v10 initWithPackageName:v9 glyphState:v8 permanentTransform:v17];

  return v15;
}

- (MRUCAPackageAsset)initWithPackageName:(id)a3
{
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v8[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v8[5] = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v8[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v8[7] = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v8[0] = *MEMORY[0x1E4F39B10];
  v8[1] = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v8[3] = v6;
  return [(MRUCAPackageAsset *)self initWithPackageName:a3 glyphState:0 permanentTransform:v8];
}

- (MRUCAPackageAsset)initWithPackageName:(id)a3 glyphState:(id)a4
{
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v9[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v9[5] = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v9[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v9[7] = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v9[0] = *MEMORY[0x1E4F39B10];
  v9[1] = v6;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v9[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v9[3] = v7;
  return [(MRUCAPackageAsset *)self initWithPackageName:a3 glyphState:a4 permanentTransform:v9];
}

- (MRUCAPackageAsset)initWithPackageName:(id)a3 glyphState:(id)a4 permanentTransform:(CATransform3D *)a5
{
  id v9 = a3;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MRUCAPackageAsset;
  long long v11 = [(MRUCAPackageAsset *)&v20 init];
  long long v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_packageName, a3);
    objc_storeStrong((id *)&v12->_glyphState, a4);
    long long v13 = *(_OWORD *)&a5->m11;
    long long v14 = *(_OWORD *)&a5->m13;
    long long v15 = *(_OWORD *)&a5->m23;
    *(_OWORD *)&v12->_permanentTransform.m21 = *(_OWORD *)&a5->m21;
    *(_OWORD *)&v12->_permanentTransform.m23 = v15;
    *(_OWORD *)&v12->_permanentTransform.m11 = v13;
    *(_OWORD *)&v12->_permanentTransform.m13 = v14;
    long long v16 = *(_OWORD *)&a5->m31;
    long long v17 = *(_OWORD *)&a5->m33;
    long long v18 = *(_OWORD *)&a5->m43;
    *(_OWORD *)&v12->_permanentTransform.m41 = *(_OWORD *)&a5->m41;
    *(_OWORD *)&v12->_permanentTransform.m43 = v18;
    *(_OWORD *)&v12->_permanentTransform.m31 = v16;
    *(_OWORD *)&v12->_permanentTransform.m33 = v17;
  }

  return v12;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ package: %@ | symbol: %@", objc_opt_class(), self->_packageName, self->_glyphState];
}

- (BOOL)isEqual:(id)a3
{
  long long v4 = (MRUCAPackageAsset *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v5 = v4;
      long long v6 = [(MRUCAPackageAsset *)v5 packageName];
      long long v7 = v6;
      if (v6 == self->_packageName) {
        int v8 = 1;
      }
      else {
        int v8 = -[NSString isEqual:](v6, "isEqual:");
      }

      id v10 = [(MRUCAPackageAsset *)v5 glyphState];
      long long v11 = v10;
      if (v10 == self->_glyphState) {
        int v12 = 1;
      }
      else {
        int v12 = -[NSString isEqual:](v10, "isEqual:");
      }
      int v13 = v8 & v12;

      if (v5) {
        [(MRUCAPackageAsset *)v5 permanentTransform];
      }
      else {
        memset(&a, 0, sizeof(a));
      }
      long long v14 = *(_OWORD *)&self->_permanentTransform.m33;
      *(_OWORD *)&v19.m31 = *(_OWORD *)&self->_permanentTransform.m31;
      *(_OWORD *)&v19.m33 = v14;
      long long v15 = *(_OWORD *)&self->_permanentTransform.m43;
      *(_OWORD *)&v19.m41 = *(_OWORD *)&self->_permanentTransform.m41;
      *(_OWORD *)&v19.m43 = v15;
      long long v16 = *(_OWORD *)&self->_permanentTransform.m13;
      *(_OWORD *)&v19.m11 = *(_OWORD *)&self->_permanentTransform.m11;
      *(_OWORD *)&v19.m13 = v16;
      long long v17 = *(_OWORD *)&self->_permanentTransform.m23;
      *(_OWORD *)&v19.m21 = *(_OWORD *)&self->_permanentTransform.m21;
      *(_OWORD *)&v19.m23 = v17;
      BOOL v9 = v13 & CATransform3DEqualToTransform(&a, &v19);
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (CAPackage)package
{
  return (CAPackage *)+[MRUAssetsProvider packageWithName:self->_packageName];
}

- (CCUICAPackageDescription)packageDescription
{
  packageDescription = self->_packageDescription;
  if (!packageDescription)
  {
    long long v4 = +[MRUAssetsProvider packageDescriptionWithName:self->_packageName];
    long long v5 = self->_packageDescription;
    self->_packageDescription = v4;

    packageDescription = self->_packageDescription;
  }

  return packageDescription;
}

- (NSString)packageName
{
  return self->_packageName;
}

- (NSString)glyphState
{
  return self->_glyphState;
}

- (void)setGlyphState:(id)a3
{
}

- (CATransform3D)permanentTransform
{
  long long v3 = *(_OWORD *)&self->m43;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self->m41;
  *(_OWORD *)&retstr->m33 = v3;
  long long v4 = *(_OWORD *)&self[1].m13;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[1].m11;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self->m23;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m21;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self->m33;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self->m31;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setPermanentTransform:(CATransform3D *)a3
{
  long long v3 = *(_OWORD *)&a3->m11;
  long long v4 = *(_OWORD *)&a3->m13;
  long long v5 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->_permanentTransform.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_permanentTransform.m23 = v5;
  *(_OWORD *)&self->_permanentTransform.m11 = v3;
  *(_OWORD *)&self->_permanentTransform.m13 = v4;
  long long v6 = *(_OWORD *)&a3->m31;
  long long v7 = *(_OWORD *)&a3->m33;
  long long v8 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->_permanentTransform.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_permanentTransform.m43 = v8;
  *(_OWORD *)&self->_permanentTransform.m31 = v6;
  *(_OWORD *)&self->_permanentTransform.m33 = v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphState, 0);
  objc_storeStrong((id *)&self->_packageName, 0);

  objc_storeStrong((id *)&self->_packageDescription, 0);
}

@end