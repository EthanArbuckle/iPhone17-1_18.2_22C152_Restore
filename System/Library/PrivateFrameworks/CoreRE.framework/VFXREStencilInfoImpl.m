@interface VFXREStencilInfoImpl
- (MTLStencilDescriptor)_backFaceTest;
- (MTLStencilDescriptor)_frontFaceTest;
- (unsigned)_backReferenceValue;
- (unsigned)_frontReferenceValue;
- (void)set_backFaceTest:(id)a3;
- (void)set_backReferenceValue:(unsigned __int8)a3;
- (void)set_frontFaceTest:(id)a3;
- (void)set_frontReferenceValue:(unsigned __int8)a3;
@end

@implementation VFXREStencilInfoImpl

- (MTLStencilDescriptor)_frontFaceTest
{
  return self->__frontFaceTest;
}

- (void)set_frontFaceTest:(id)a3
{
}

- (MTLStencilDescriptor)_backFaceTest
{
  return self->__backFaceTest;
}

- (void)set_backFaceTest:(id)a3
{
}

- (unsigned)_frontReferenceValue
{
  return self->__frontReferenceValue;
}

- (void)set_frontReferenceValue:(unsigned __int8)a3
{
  self->__frontReferenceValue = a3;
}

- (unsigned)_backReferenceValue
{
  return self->__backReferenceValue;
}

- (void)set_backReferenceValue:(unsigned __int8)a3
{
  self->__backReferenceValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__backFaceTest, 0);
  objc_storeStrong((id *)&self->__frontFaceTest, 0);
}

@end