@interface SCNJSValueTmpImp
+ (id)valueWithTransform3D:(SCNMatrix4 *)a3 inContext:(id)a4;
+ (id)valueWithVector3:(SCNVector3)a3 inContext:(id)a4;
+ (id)valueWithVector4:(SCNVector4)a3 inContext:(id)a4;
- (SCNMatrix4)toTransform3D;
- (SCNVector3)toVector3;
- (SCNVector4)toVector4;
@end

@implementation SCNJSValueTmpImp

- (SCNVector4)toVector4
{
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"x"), "toDouble");
  float v4 = v3;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"y"), "toDouble");
  float v6 = v5;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"z"), "toDouble");
  float v8 = v7;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"w"), "toDouble");
  float v10 = v9;
  float v11 = v4;
  float v12 = v6;
  float v13 = v8;
  result.w = v10;
  result.z = v13;
  result.y = v12;
  result.x = v11;
  return result;
}

+ (id)valueWithVector4:(SCNVector4)a3 inContext:(id)a4
{
  float w = a3.w;
  float z = a3.z;
  float y = a3.y;
  v14[4] = *MEMORY[0x263EF8340];
  v13[0] = @"x";
  v14[0] = [NSNumber numberWithFloat:*(double *)&a3.x];
  v13[1] = @"y";
  *(float *)&double v9 = y;
  v14[1] = [NSNumber numberWithFloat:v9];
  v13[2] = @"z";
  *(float *)&double v10 = z;
  v14[2] = [NSNumber numberWithFloat:v10];
  v13[3] = @"w";
  *(float *)&double v11 = w;
  v14[3] = [NSNumber numberWithFloat:v11];
  return (id)objc_msgSend(a1, "valueWithObject:inContext:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 4), a4);
}

- (SCNVector3)toVector3
{
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"x"), "toDouble");
  float v4 = v3;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"y"), "toDouble");
  float v6 = v5;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"z"), "toDouble");
  float v8 = v7;
  float v9 = v4;
  float v10 = v6;
  result.float z = v8;
  result.float y = v10;
  result.x = v9;
  return result;
}

+ (id)valueWithVector3:(SCNVector3)a3 inContext:(id)a4
{
  float z = a3.z;
  float y = a3.y;
  v12[3] = *MEMORY[0x263EF8340];
  v11[0] = @"x";
  v12[0] = [NSNumber numberWithFloat:*(double *)&a3.x];
  v11[1] = @"y";
  *(float *)&double v8 = y;
  v12[1] = [NSNumber numberWithFloat:v8];
  v11[2] = @"z";
  *(float *)&double v9 = z;
  v12[2] = [NSNumber numberWithFloat:v9];
  return (id)objc_msgSend(a1, "valueWithObject:inContext:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 3), a4);
}

- (SCNMatrix4)toTransform3D
{
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"m11"), "toDouble");
  *(float *)&double v5 = v5;
  retstr->m11 = *(float *)&v5;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"m12"), "toDouble");
  *(float *)&double v6 = v6;
  retstr->m12 = *(float *)&v6;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"m13"), "toDouble");
  *(float *)&double v7 = v7;
  retstr->m13 = *(float *)&v7;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"m14"), "toDouble");
  *(float *)&double v8 = v8;
  retstr->m14 = *(float *)&v8;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"m21"), "toDouble");
  *(float *)&double v9 = v9;
  retstr->m21 = *(float *)&v9;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"m22"), "toDouble");
  *(float *)&double v10 = v10;
  retstr->m22 = *(float *)&v10;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"m23"), "toDouble");
  *(float *)&double v11 = v11;
  retstr->m23 = *(float *)&v11;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"m24"), "toDouble");
  *(float *)&double v12 = v12;
  retstr->m24 = *(float *)&v12;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"m31"), "toDouble");
  *(float *)&double v13 = v13;
  retstr->m31 = *(float *)&v13;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"m32"), "toDouble");
  *(float *)&double v14 = v14;
  retstr->m32 = *(float *)&v14;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"m33"), "toDouble");
  *(float *)&double v15 = v15;
  retstr->m33 = *(float *)&v15;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"m34"), "toDouble");
  *(float *)&double v16 = v16;
  retstr->m34 = *(float *)&v16;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"m41"), "toDouble");
  *(float *)&double v17 = v17;
  retstr->m41 = *(float *)&v17;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"m42"), "toDouble");
  *(float *)&double v18 = v18;
  retstr->m42 = *(float *)&v18;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"m43"), "toDouble");
  *(float *)&double v19 = v19;
  retstr->m43 = *(float *)&v19;
  SCNVector3 result = (SCNMatrix4 *)objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"m44"), "toDouble");
  *(float *)&double v21 = v21;
  retstr->m44 = *(float *)&v21;
  return result;
}

+ (id)valueWithTransform3D:(SCNMatrix4 *)a3 inContext:(id)a4
{
  v25[16] = *MEMORY[0x263EF8340];
  v24[0] = @"m11";
  *(float *)&double v4 = a3->m11;
  v25[0] = [NSNumber numberWithFloat:v4];
  v24[1] = @"m12";
  *(float *)&double v8 = a3->m12;
  v25[1] = [NSNumber numberWithFloat:v8];
  v24[2] = @"m13";
  *(float *)&double v9 = a3->m13;
  v25[2] = [NSNumber numberWithFloat:v9];
  v24[3] = @"m14";
  *(float *)&double v10 = a3->m14;
  v25[3] = [NSNumber numberWithFloat:v10];
  v24[4] = @"m21";
  *(float *)&double v11 = a3->m21;
  v25[4] = [NSNumber numberWithFloat:v11];
  v24[5] = @"m22";
  *(float *)&double v12 = a3->m22;
  v25[5] = [NSNumber numberWithFloat:v12];
  v24[6] = @"m23";
  *(float *)&double v13 = a3->m23;
  v25[6] = [NSNumber numberWithFloat:v13];
  v24[7] = @"m24";
  *(float *)&double v14 = a3->m24;
  v25[7] = [NSNumber numberWithFloat:v14];
  v24[8] = @"m31";
  *(float *)&double v15 = a3->m31;
  v25[8] = [NSNumber numberWithFloat:v15];
  v24[9] = @"m32";
  *(float *)&double v16 = a3->m32;
  v25[9] = [NSNumber numberWithFloat:v16];
  v24[10] = @"m33";
  *(float *)&double v17 = a3->m33;
  v25[10] = [NSNumber numberWithFloat:v17];
  v24[11] = @"m34";
  *(float *)&double v18 = a3->m34;
  v25[11] = [NSNumber numberWithFloat:v18];
  v24[12] = @"m41";
  *(float *)&double v19 = a3->m41;
  v25[12] = [NSNumber numberWithFloat:v19];
  v24[13] = @"m42";
  *(float *)&double v20 = a3->m42;
  v25[13] = [NSNumber numberWithFloat:v20];
  v24[14] = @"m43";
  *(float *)&double v21 = a3->m43;
  v25[14] = [NSNumber numberWithFloat:v21];
  v24[15] = @"m44";
  *(float *)&double v22 = a3->m44;
  v25[15] = [NSNumber numberWithFloat:v22];
  return (id)objc_msgSend(a1, "valueWithObject:inContext:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 16), a4);
}

@end