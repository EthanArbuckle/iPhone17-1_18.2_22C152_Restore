@interface HDSourceRevision
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion;
- (HDSourceEntity)sourceEntity;
- (HDSourceRevision)initWithSource:(id)a3 version:(id)a4 productType:(id)a5 operatingSystemVersion:(id *)a6;
- (NSString)productType;
- (NSString)version;
@end

@implementation HDSourceRevision

- (HDSourceRevision)initWithSource:(id)a3 version:(id)a4 productType:(id)a5 operatingSystemVersion:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HDSourceRevision;
  v14 = [(HDSourceRevision *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sourceEntity, a3);
    objc_storeStrong((id *)&v15->_version, a4);
    objc_storeStrong((id *)&v15->_productType, a5);
    long long v16 = *(_OWORD *)&a6->var0;
    v15->_operatingSystemVersion.patchVersion = a6->var2;
    *(_OWORD *)&v15->_operatingSystemVersion.majorVersion = v16;
  }

  return v15;
}

- (HDSourceEntity)sourceEntity
{
  return self->_sourceEntity;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)productType
{
  return self->_productType;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = *($A44FF20282FB96BA82CF1B0FF6945C38 *)((char *)self + 32);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_version, 0);

  objc_storeStrong((id *)&self->_sourceEntity, 0);
}

@end