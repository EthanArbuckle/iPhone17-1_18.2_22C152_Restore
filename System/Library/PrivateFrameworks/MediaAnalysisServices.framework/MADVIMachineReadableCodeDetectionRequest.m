@interface MADVIMachineReadableCodeDetectionRequest
+ (BOOL)supportsSecureCoding;
+ (unint64_t)targetResolution;
- (MADVIMachineReadableCodeDetectionRequest)init;
- (MADVIMachineReadableCodeDetectionRequest)initWithCoder:(id)a3;
- (MADVIMachineReadableCodeDetectionRequest)initWithSymbologies:(id)a3;
- (NSArray)symbologies;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADVIMachineReadableCodeDetectionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)targetResolution
{
  return 3048192;
}

- (MADVIMachineReadableCodeDetectionRequest)init
{
  return [(MADVIMachineReadableCodeDetectionRequest *)self initWithSymbologies:MEMORY[0x1E4F1CBF0]];
}

- (MADVIMachineReadableCodeDetectionRequest)initWithSymbologies:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADVIMachineReadableCodeDetectionRequest;
  v5 = [(MADVIMachineReadableCodeDetectionRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    symbologies = v5->_symbologies;
    v5->_symbologies = (NSArray *)v6;
  }
  return v5;
}

- (MADVIMachineReadableCodeDetectionRequest)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADVIMachineReadableCodeDetectionRequest;
  v5 = [(MADRequest *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Symbologies"];
    symbologies = v5->_symbologies;
    v5->_symbologies = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADVIMachineReadableCodeDetectionRequest;
  id v4 = a3;
  [(MADRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_symbologies, @"Symbologies", v5.receiver, v5.super_class);
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"symbologies: %@, ", self->_symbologies];
  uint64_t v6 = [(MADRequest *)self results];
  [v3 appendFormat:@"results: %@, ", v6];

  v7 = [(MADRequest *)self error];
  [v3 appendFormat:@"error: %@>", v7];

  return v3;
}

- (NSArray)symbologies
{
  return self->_symbologies;
}

- (void).cxx_destruct
{
}

@end