@interface _FBSSnapshotLayer
- (CATransform3D)baseTransform;
- (_FBSSnapshotLayer)initWithContextID:(unsigned int)a3 baseTransform:(CATransform3D *)a4;
- (unsigned)contextID;
@end

@implementation _FBSSnapshotLayer

- (_FBSSnapshotLayer)initWithContextID:(unsigned int)a3 baseTransform:(CATransform3D *)a4
{
  v13.receiver = self;
  v13.super_class = (Class)_FBSSnapshotLayer;
  result = [(_FBSSnapshotLayer *)&v13 init];
  if (result)
  {
    result->_contextID = a3;
    long long v7 = *(_OWORD *)&a4->m11;
    long long v8 = *(_OWORD *)&a4->m13;
    long long v9 = *(_OWORD *)&a4->m23;
    *(_OWORD *)&result->_baseTransform.m21 = *(_OWORD *)&a4->m21;
    *(_OWORD *)&result->_baseTransform.m23 = v9;
    *(_OWORD *)&result->_baseTransform.m11 = v7;
    *(_OWORD *)&result->_baseTransform.m13 = v8;
    long long v10 = *(_OWORD *)&a4->m31;
    long long v11 = *(_OWORD *)&a4->m33;
    long long v12 = *(_OWORD *)&a4->m43;
    *(_OWORD *)&result->_baseTransform.m41 = *(_OWORD *)&a4->m41;
    *(_OWORD *)&result->_baseTransform.m43 = v12;
    *(_OWORD *)&result->_baseTransform.m31 = v10;
    *(_OWORD *)&result->_baseTransform.m33 = v11;
  }
  return result;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (CATransform3D)baseTransform
{
  long long v3 = *(_OWORD *)&self->m41;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self->m33;
  *(_OWORD *)&retstr->m33 = v3;
  long long v4 = *(_OWORD *)&self[1].m11;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self->m43;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self->m21;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m13;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self->m31;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self->m23;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

@end