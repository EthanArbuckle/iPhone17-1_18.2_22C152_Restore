@interface CIPerspectiveAutoCalc
- (BOOL)compute;
- (BOOL)generateDebugImage;
- (CIImage)debugImage;
- (CIPerspectiveAutoCalc)initWithContext:(id)a3 image:(id)a4 config:(id *)a5;
- (double)confidence;
- (double)pitch;
- (double)roll;
- (double)yaw;
- (int64_t)pitchFailureReason;
- (int64_t)yawFailureReason;
- (void)dealloc;
- (void)setGenerateDebugImage:(BOOL)a3;
@end

@implementation CIPerspectiveAutoCalc

- (CIPerspectiveAutoCalc)initWithContext:(id)a3 image:(id)a4 config:(id *)a5
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)CIPerspectiveAutoCalc;
  v8 = [(CIPerspectiveAutoCalc *)&v15 init];
  id v9 = a3;
  *((void *)v8 + 2) = v9;
  if (!v9)
  {
    v10 = [CIContext alloc];
    v16[0] = @"kCIContextName";
    v16[1] = @"kCIContextCacheIntermediates";
    v17[0] = @"CIPerspectiveAutoCalc";
    v17[1] = MEMORY[0x1E4F1CC28];
    v16[2] = @"kCIContextIntermediateMemoryTarget";
    v17[2] = &unk_1EE4AABF8;
    *((void *)v8 + 2) = -[CIContext initWithOptions:](v10, "initWithOptions:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3]);
  }
  *((void *)v8 + 1) = a4;
  long long v12 = *(_OWORD *)&a5->var2;
  long long v11 = *(_OWORD *)&a5->var4;
  id var6 = a5->var6;
  *(_OWORD *)(v8 + 24) = *(_OWORD *)&a5->var0;
  *((void *)v8 + 9) = var6;
  *(_OWORD *)(v8 + 56) = v11;
  *(_OWORD *)(v8 + 40) = v12;
  return (CIPerspectiveAutoCalc *)v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CIPerspectiveAutoCalc;
  [(CIPerspectiveAutoCalc *)&v3 dealloc];
}

- (BOOL)compute
{
  return 0;
}

- (double)pitch
{
  return self->pitch;
}

- (double)yaw
{
  return self->yaw;
}

- (double)roll
{
  return self->roll;
}

- (double)confidence
{
  return self->confidence;
}

- (BOOL)generateDebugImage
{
  return self->generateDebugImage;
}

- (void)setGenerateDebugImage:(BOOL)a3
{
  self->generateDebugImage = a3;
}

- (CIImage)debugImage
{
  return self->debugImage;
}

- (int64_t)pitchFailureReason
{
  return self->pitchFailureReason;
}

- (int64_t)yawFailureReason
{
  return self->yawFailureReason;
}

@end