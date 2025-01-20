@interface SCNJSValue
+ (id)SCNJSExportProtocol;
+ (id)valueWithMatrix4:(SCNMatrix4 *)a3;
+ (id)valueWithVector3:(SCNVector3)a3;
+ (id)valueWithVector4:(SCNVector4)a3;
- (SCNMatrix4)matrix4;
@end

@implementation SCNJSValue

+ (id)valueWithVector3:(SCNVector3)a3
{
  return +[NSValue valueWithSCNVector3:](SCNJSValue, "valueWithSCNVector3:", *(double *)&a3.x, *(double *)&a3.y, *(double *)&a3.z);
}

+ (id)valueWithVector4:(SCNVector4)a3
{
  return +[NSValue valueWithSCNVector4:](SCNJSValue, "valueWithSCNVector4:", *(double *)&a3.x, *(double *)&a3.y, *(double *)&a3.z, *(double *)&a3.w);
}

+ (id)valueWithMatrix4:(SCNMatrix4 *)a3
{
  long long v3 = *(_OWORD *)&a3->m21;
  v6[0] = *(_OWORD *)&a3->m11;
  v6[1] = v3;
  long long v4 = *(_OWORD *)&a3->m41;
  v6[2] = *(_OWORD *)&a3->m31;
  v6[3] = v4;
  return +[NSValue valueWithSCNMatrix4:v6];
}

- (SCNMatrix4)matrix4
{
  if (self) {
    return (SCNMatrix4 *)[(SCNMatrix4 *)self SCNMatrix4Value];
  }
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  return self;
}

+ (id)SCNJSExportProtocol
{
  return &unk_26C0097C8;
}

@end