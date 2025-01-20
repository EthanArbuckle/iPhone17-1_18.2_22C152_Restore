@interface CIVNDetector
- (CIVNDetector)initWithContext:(id)a3 options:(id)a4;
- (id)featuresInImage:(id)a3 withContext:(id)a4;
- (void)dealloc;
@end

@implementation CIVNDetector

- (CIVNDetector)initWithContext:(id)a3 options:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CIVNDetector;
  v5 = [(CIDetector *)&v7 init];
  if (v5) {
    v5->context = (CIContext *)a3;
  }
  return v5;
}

- (void)dealloc
{
  self->context = 0;
  v3.receiver = self;
  v3.super_class = (Class)CIVNDetector;
  [(CIVNDetector *)&v3 dealloc];
}

- (id)featuresInImage:(id)a3 withContext:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end