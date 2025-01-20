@interface MADMultiModalInput
+ (BOOL)supportsSecureCoding;
- (BOOL)_addPixelBuffer:(__CVBuffer *)a3 seed:(id)a4 error:(id *)a5;
- (BOOL)addEntityUUID:(id)a3 error:(id *)a4;
- (BOOL)addEntityUUID:(id)a3 seed:(unint64_t)a4 error:(id *)a5;
- (BOOL)addFaceprint:(id)a3 error:(id *)a4;
- (BOOL)addPersonDescription:(id)a3 error:(id *)a4;
- (BOOL)addPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (BOOL)addPixelBuffer:(__CVBuffer *)a3 seed:(unint64_t)a4 error:(id *)a5;
- (BOOL)addText:(id)a3 error:(id *)a4;
- (MADMultiModalInput)init;
- (MADMultiModalInput)initWithCoder:(id)a3;
- (MADMultiModalInput)initWithText:(id)a3;
- (NSArray)segments;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADMultiModalInput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMultiModalInput)init
{
  v6.receiver = self;
  v6.super_class = (Class)MADMultiModalInput;
  v2 = [(MADMultiModalInput *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    segments = v2->_segments;
    v2->_segments = (NSMutableArray *)v3;
  }
  return v2;
}

- (MADMultiModalInput)initWithText:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADMultiModalInput;
  v5 = [(MADMultiModalInput *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    segments = v5->_segments;
    v5->_segments = (NSMutableArray *)v6;

    v8 = v5->_segments;
    v9 = [[MADMultiModalInputTextSegment alloc] initWithText:v4];
    [(NSMutableArray *)v8 addObject:v9];
  }
  return v5;
}

- (MADMultiModalInput)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADMultiModalInput;
  v5 = [(MADMultiModalInput *)&v12 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Segments"];
    segments = v5->_segments;
    v5->_segments = (NSMutableArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSArray)segments
{
  return (NSArray *)self->_segments;
}

- (BOOL)addText:(id)a3 error:(id *)a4
{
  segments = self->_segments;
  id v5 = a3;
  uint64_t v6 = [[MADMultiModalInputTextSegment alloc] initWithText:v5];

  [(NSMutableArray *)segments addObject:v6];
  return 1;
}

- (BOOL)addEntityUUID:(id)a3 error:(id *)a4
{
  segments = self->_segments;
  id v5 = a3;
  uint64_t v6 = [[MADMultiModalInputEntitySegment alloc] initWithEntityUUID:v5 seed:0];

  [(NSMutableArray *)segments addObject:v6];
  return 1;
}

- (BOOL)addEntityUUID:(id)a3 seed:(unint64_t)a4 error:(id *)a5
{
  segments = self->_segments;
  id v7 = a3;
  v8 = [MADMultiModalInputEntitySegment alloc];
  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
  v10 = [(MADMultiModalInputEntitySegment *)v8 initWithEntityUUID:v7 seed:v9];

  [(NSMutableArray *)segments addObject:v10];
  return 1;
}

- (BOOL)_addPixelBuffer:(__CVBuffer *)a3 seed:(id)a4 error:(id *)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = CVPixelBufferGetIOSurface(a3);
  if (v9)
  {
    segments = self->_segments;
    objc_super v11 = [[MADMultiModalInputImageSegment alloc] initWithSurface:v9 seed:v8];
    [(NSMutableArray *)segments addObject:v11];
  }
  else if (a5)
  {
    objc_super v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28760];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v14 = [NSString stringWithFormat:@"CVPixelBuffer input must be IOSurface backed"];
    v18[0] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    *a5 = [v12 errorWithDomain:v13 code:-18 userInfo:v15];
  }
  return v9 != 0;
}

- (BOOL)addPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  return [(MADMultiModalInput *)self _addPixelBuffer:a3 seed:0 error:a4];
}

- (BOOL)addPixelBuffer:(__CVBuffer *)a3 seed:(unint64_t)a4 error:(id *)a5
{
  id v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
  LOBYTE(a5) = [(MADMultiModalInput *)self _addPixelBuffer:a3 seed:v8 error:a5];

  return (char)a5;
}

- (BOOL)addPersonDescription:(id)a3 error:(id *)a4
{
  segments = self->_segments;
  id v5 = a3;
  uint64_t v6 = [(MADMultiModalInputTextSegment *)[MADMultiModalInputDescriptionSegment alloc] initWithText:v5];

  [(NSMutableArray *)segments addObject:v6];
  return 1;
}

- (BOOL)addFaceprint:(id)a3 error:(id *)a4
{
  segments = self->_segments;
  id v5 = a3;
  uint64_t v6 = [[MADMultiModalInputFaceprintSegment alloc] initWithFaceprint:v5];

  [(NSMutableArray *)segments addObject:v6];
  return 1;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"segments: %@>", self->_segments];
  return v3;
}

- (void).cxx_destruct
{
}

@end