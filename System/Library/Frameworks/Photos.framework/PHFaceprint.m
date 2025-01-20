@interface PHFaceprint
- (NSData)faceprintData;
- (PHFaceprint)initWithDictionaryRepresentation:(id)a3;
- (PHFaceprint)initWithFaceprintData:(id)a3 faceprintVersion:(int64_t)a4;
- (id)dictionaryRepresentation;
- (int64_t)faceprintVersion;
@end

@implementation PHFaceprint

- (void).cxx_destruct
{
}

- (NSData)faceprintData
{
  return self->_faceprintData;
}

- (int64_t)faceprintVersion
{
  return self->_faceprintVersion;
}

- (PHFaceprint)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"faceprintData"];
  v6 = [v4 objectForKeyedSubscript:@"faceprintVersion"];

  v7 = -[PHFaceprint initWithFaceprintData:faceprintVersion:](self, "initWithFaceprintData:faceprintVersion:", v5, [v6 integerValue]);
  return v7;
}

- (id)dictionaryRepresentation
{
  v8[2] = *MEMORY[0x1E4F143B8];
  int64_t faceprintVersion = self->_faceprintVersion;
  faceprintData = self->_faceprintData;
  v7[0] = @"faceprintData";
  v7[1] = @"faceprintVersion";
  v8[0] = faceprintData;
  id v4 = [NSNumber numberWithInteger:faceprintVersion];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (PHFaceprint)initWithFaceprintData:(id)a3 faceprintVersion:(int64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PHFaceprint.m", 16, @"Invalid parameter not satisfying: %@", @"data != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PHFaceprint;
  v9 = [(PHFaceprint *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_faceprintData, a3);
    v10->_int64_t faceprintVersion = a4;
  }

  return v10;
}

@end