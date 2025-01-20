@interface TDRecognitionObjectRenditionSpec
+ (id)fetchRequest;
- (__n128)referenceOriginTransform;
- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5;
- (uint64_t)setReferenceOriginTransform:(__n128)a3;
@end

@implementation TDRecognitionObjectRenditionSpec

- (__n128)referenceOriginTransform
{
  [a1 a11];
  unsigned int v10 = v2;
  [a1 a21];
  unsigned int v9 = v3;
  [a1 a31];
  unsigned int v8 = v4;
  [a1 a41];
  *(void *)&long long v5 = __PAIR64__(v9, v10);
  *((void *)&v5 + 1) = __PAIR64__(v6, v8);
  long long v11 = v5;
  [a1 a12];
  [a1 a22];
  [a1 a32];
  [a1 a42];
  [a1 a13];
  [a1 a23];
  [a1 a33];
  [a1 a43];
  [a1 a14];
  [a1 a24];
  [a1 a34];
  [a1 a44];
  return (__n128)v11;
}

- (uint64_t)setReferenceOriginTransform:(__n128)a3
{
  objc_msgSend(a1, "setA11:");
  HIDWORD(v6) = a2.n128_u32[1];
  LODWORD(v6) = a2.n128_u32[1];
  [a1 setA21:v6];
  objc_msgSend(a1, "setA31:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  objc_msgSend(a1, "setA41:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[3])));
  [a1 setA12:a3.n128_f64[0]];
  HIDWORD(v7) = a3.n128_u32[1];
  LODWORD(v7) = a3.n128_u32[1];
  [a1 setA22:v7];
  objc_msgSend(a1, "setA32:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  objc_msgSend(a1, "setA42:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[3])));
  [a1 setA13:a4.n128_f64[0]];
  HIDWORD(v8) = a4.n128_u32[1];
  LODWORD(v8) = a4.n128_u32[1];
  [a1 setA23:v8];
  objc_msgSend(a1, "setA33:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[2])));
  objc_msgSend(a1, "setA43:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[3])));
  [a1 setA14:a5.n128_f64[0]];
  HIDWORD(v9) = a5.n128_u32[1];
  LODWORD(v9) = a5.n128_u32[1];
  [a1 setA24:v9];
  objc_msgSend(a1, "setA34:", COERCE_DOUBLE(__PAIR64__(a5.n128_u32[1], a5.n128_u32[2])));

  return objc_msgSend(a1, "setA44:", COERCE_DOUBLE(__PAIR64__(a5.n128_u32[1], a5.n128_u32[3])));
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  uint64_t v14 = 0;
  double v7 = (void *)[(TDRecognitionObjectRenditionSpec *)self asset];
  double v8 = (void *)[v7 fileURLWithDocument:a5];
  double v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:v8 options:2 error:0];
  unsigned int v10 = (void *)[objc_alloc(MEMORY[0x263F38370]) initWithRawData:v9 pixelFormat:1145132097 layout:1014];
  objc_msgSend(v10, "setName:", objc_msgSend(v7, "name"));
  [(TDRecognitionObjectRenditionSpec *)self referenceOriginTransform];
  objc_msgSend(v10, "setTransformation:");
  objc_msgSend(v10, "setObjectVersion:", -[TDRecognitionObjectRenditionSpec version](self, "version"));
  [v10 setCompressionType:2];

  if (objc_msgSend((id)objc_msgSend((id)-[TDRecognitionObjectRenditionSpec production](self, "production"), "universalTypeIdentifier"), "length"))
  {
    uint64_t v11 = objc_msgSend((id)-[TDRecognitionObjectRenditionSpec production](self, "production"), "universalTypeIdentifier");
  }
  else
  {
    if (![v8 getResourceValue:&v14 forKey:*MEMORY[0x263EFF780] error:0])
    {
      objc_msgSend(v10, "setName:", objc_msgSend(v7, "name"));
      goto LABEL_7;
    }
    uint64_t v11 = v14;
  }
  [v10 setUtiType:v11];
LABEL_7:
  v12 = (void *)[v10 CSIRepresentationWithCompression:1];

  return v12;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"TDRecognitionObjectRenditionSpec"];
}

@end